/*
 * Copyright (C) 2011-2012 /dev/rsa for MangosR2 <http://github.com/MangosR2>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include "Common.h"
#include "Policies/SingletonImp.h"
#include "SharedDefines.h"
#include "ObjectMgr.h"
#include "ProgressBar.h"
#include "SocialMgr.h"
#include "LFGMgr.h"
#include "World.h"
#include "Group.h"
#include "Player.h"

#include <limits>

INSTANTIATE_SINGLETON_1(LFGMgr);

LFGMgr::LFGMgr()
{
    for (uint32 i = 0; i < sLFGDungeonStore.GetNumRows(); ++i)
    {
        if (LFGDungeonEntry const* dungeon = sLFGDungeonStore.LookupEntry(i))
        {
            m_dungeonMap.insert(std::make_pair(dungeon->ID, dungeon));
        }
    }

    m_proposalID   = 1;
    m_LFGupdateTimer.SetInterval(LFG_UPDATE_INTERVAL);
    m_LFGupdateTimer.Reset();
    m_LFRupdateTimer.SetInterval(LFR_UPDATE_INTERVAL);
    m_LFRupdateTimer.Reset();
    m_LFGQueueUpdateTimer.SetInterval(LFG_QUEUEUPDATE_INTERVAL);
    m_LFGQueueUpdateTimer.Reset();
}

LFGMgr::~LFGMgr()
{
    m_RewardMap.clear();
    for (uint8 i = LFG_TYPE_NONE; i < LFG_TYPE_MAX; ++i)
    {
        m_playerQueue[i].clear();
        m_groupQueue[i].clear();
    }
    m_queueInfoMap.clear();
    m_dungeonMap.clear();
    m_proposalMap.clear();
    m_searchMatrix.clear();
    m_eventList.clear();
}

void LFGMgr::Update(uint32 uiDiff)
{

    SheduleEvent();

    if (m_queueInfoMap.empty())
        return;

    bool isFullUpdate = false;
    bool isLFRUpdate  = false;
    bool isStatUpdate = false;

    m_LFGupdateTimer.Update(uiDiff);
    m_LFRupdateTimer.Update(uiDiff);
    m_LFGQueueUpdateTimer.Update(uiDiff);

    if (m_LFGupdateTimer.Passed())
    {
        isFullUpdate = true;
        m_LFGupdateTimer.Reset();
    }

    if (m_LFRupdateTimer.Passed())
    {
        isLFRUpdate = true;
        m_LFRupdateTimer.Reset();
    }

    if (m_LFGQueueUpdateTimer.Passed())
    {
        isStatUpdate = true;
        m_LFGQueueUpdateTimer.Reset();
    }

    if (isFullUpdate)
    {
        CleanupSearchMatrix();
    }

    for (uint8 i = LFG_TYPE_NONE; i < LFG_TYPE_MAX; ++i)
    {

//        DEBUG_LOG("LFGMgr::Update type %u, player queue %u group queue %u",i,m_playerQueue[i].size(), m_groupQueue[i].size());
        if (m_playerQueue[i].empty() && m_groupQueue[i].empty())
            continue;

        LFGType type = LFGType(i);
        switch (type)
        {
            case LFG_TYPE_DUNGEON:
            case LFG_TYPE_QUEST:
            case LFG_TYPE_ZONE:
            case LFG_TYPE_HEROIC_DUNGEON:
            case LFG_TYPE_RANDOM_DUNGEON:
            {
                TryCompleteGroups(type);
                TryCreateGroup(type);
                if (isFullUpdate)
                {
                    CleanupProposals(type);
                    CleanupRoleChecks(type);
                    CleanupBoots(type);
                    UpdateQueueStatus(type);
                }
                if (isStatUpdate)
                {
                    SendStatistic(type);
                }
                break;
            }
            case LFG_TYPE_RAID:
            {
                if (sWorld.getConfig(CONFIG_BOOL_LFR_EXTEND) && isLFRUpdate)
                {
                    UpdateLFRGroups();
                }
                break;
            }
            case LFG_TYPE_NONE:
            case LFG_TYPE_MAX:
            default:
                sLog.outError("LFGMgr: impossible dungeon type in queue!");
                break;
        }
    }
}

void LFGMgr::LoadRewards()
{
   // (c) TrinityCore, 2010. Rewrited for MaNGOS by /dev/rsa

    m_RewardMap.clear();

    uint32 count = 0;
    // ORDER BY is very important for GetRandomDungeonReward!
    QueryResult* result = WorldDatabase.Query("SELECT dungeonId, maxLevel, firstQuestId, firstMoneyVar, firstXPVar, otherQuestId, otherMoneyVar, otherXPVar FROM lfg_dungeon_rewards ORDER BY dungeonId, maxLevel ASC");

    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded 0 LFG dungeon rewards. DB table `lfg_dungeon_rewards` is empty!");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    Field* fields = NULL;
    do
    {
        bar.step();
        fields = result->Fetch();
        uint32 dungeonId = fields[0].GetUInt32();
        uint32 maxLevel = fields[1].GetUInt8();
        uint32 firstQuestId = fields[2].GetUInt32();
        uint32 firstMoneyVar = fields[3].GetUInt32();
        uint32 firstXPVar = fields[4].GetUInt32();
        uint32 otherQuestId = fields[5].GetUInt32();
        uint32 otherMoneyVar = fields[6].GetUInt32();
        uint32 otherXPVar = fields[7].GetUInt32();

        if (!sLFGDungeonStore.LookupEntry(dungeonId))
        {
            sLog.outErrorDb("LFGMgr: Dungeon %u specified in table `lfg_dungeon_rewards` does not exist!", dungeonId);
            continue;
        }

        if (!maxLevel || maxLevel > sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL))
        {
            sLog.outErrorDb("LFGMgr: Level %u specified for dungeon %u in table `lfg_dungeon_rewards` can never be reached!", maxLevel, dungeonId);
            maxLevel = sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL);
        }

        if (firstQuestId && !sObjectMgr.GetQuestTemplate(firstQuestId))
        {
            sLog.outErrorDb("LFGMgr: First quest %u specified for dungeon %u in table `lfg_dungeon_rewards` does not exist!", firstQuestId, dungeonId);
            firstQuestId = 0;
        }

        if (otherQuestId && !sObjectMgr.GetQuestTemplate(otherQuestId))
        {
            sLog.outErrorDb("LFGMgr: Other quest %u specified for dungeon %u in table `lfg_dungeon_rewards` does not exist!", otherQuestId, dungeonId);
            otherQuestId = 0;
        }
        LFGReward reward = LFGReward(maxLevel, firstQuestId, firstMoneyVar, firstXPVar, otherQuestId, otherMoneyVar, otherXPVar);
        m_RewardMap.insert(LFGRewardMap::value_type(dungeonId, reward));
        ++count;
    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u LFG dungeon rewards.", count);
}

LFGReward const* LFGMgr::GetRandomDungeonReward(LFGDungeonEntry const* dungeon, Player* pPlayer)
{
    LFGReward const* rew = NULL;
    if (pPlayer)
    {
        LFGRewardMapBounds bounds = m_RewardMap.equal_range(dungeon->ID);
        for (LFGRewardMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
        {
            // Difficulty check TODO
            rew = &itr->second;
            // ordered properly at loading
            if (itr->second.maxLevel >= pPlayer->getLevel())
                break;
        }
    }
    return rew;
}

bool LFGMgr::IsRandomDungeon(LFGDungeonEntry const*  dungeon)
{
    if (!dungeon)
        return false;

    return dungeon->type == LFG_TYPE_RANDOM_DUNGEON;
}

bool LFGMgr::CheckWorldEvent(LFGDungeonEntry const* dungeon)
{
    switch (dungeon->ID)
    {
        case 288:                   // Apothecary Hummel <Crown Chemical Co.>
            return sGameEventMgr.IsActiveHoliday(HOLIDAY_LOVE_IS_IN_THE_AIR);
        case 287:                   // Coren Direbrew
            return sGameEventMgr.IsActiveHoliday(HOLIDAY_BREWFEST);
        case 286:                   // Ahune <The Frost Lord>
            return sGameEventMgr.IsActiveHoliday(HOLIDAY_FIRE_FESTIVAL);
        case 285:                   // Headless Horseman
            return sGameEventMgr.IsActiveHoliday(HOLIDAY_HALLOWS_END);
        default:
            break;
    }
    return false;
}

void LFGMgr::Join(Player* pPlayer)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE) && !sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE))
        return;

    ObjectGuid guid = pPlayer->GetObjectGuid();;
    Group* group = pPlayer->GetGroup();

    if (group)
    {
        if (pPlayer->GetObjectGuid() != group->GetLeaderGuid() && group->GetLFGGroupState()->GetStatus() != LFG_STATUS_OFFER_CONTINUE)
        {
            DEBUG_LOG("LFGMgr::Join: %u trying to join in group, but not group leader, and not in OfferContinue. Aborting.", guid.GetCounter());
            pPlayer->GetSession()->SendLfgJoinResult(ERR_LFG_NO_SLOTS_PLAYER);
            return;
        }
        else
            guid = group->GetObjectGuid();
    }

    if (guid.IsEmpty())
        return;

    LFGType type = pPlayer->GetLFGPlayerState()->GetType();

    if (type == LFG_TYPE_NONE)
    {
        DEBUG_LOG("LFGMgr::Join: %u trying to join without dungeon type. Aborting.", guid.GetCounter());
        pPlayer->GetSession()->SendLfgJoinResult(ERR_LFG_INVALID_SLOT);
        return;
    }

    LFGQueueInfo* queue = GetQueueInfo(guid);

    if (queue)
    {
        DEBUG_LOG("LFGMgr::Join: %u trying to join but is already in queue! May be OfferContinue?", guid.GetCounter());
        if (group && group->GetLFGGroupState()->GetState() == LFG_STATE_DUNGEON)
        {
            RemoveFromQueue(guid);
        }
        else
        {
            pPlayer->GetSession()->SendLfgJoinResult(ERR_LFG_NO_LFG_OBJECT);
            RemoveFromQueue(guid);
            return;
        }
    }

    LFGJoinResult result = guid.IsGroup() ? GetGroupJoinResult(group) : GetPlayerJoinResult(pPlayer);

    if (result != ERR_LFG_OK)                              // Someone can't join. Clear all stuf
    {
        DEBUG_LOG("LFGMgr::Join: %s %u joining with %u members. result: %u", guid.IsGroup() ? "Group" : "Player", guid.GetCounter(), group ? group->GetMembersCount() : 1, result);
        pPlayer->GetLFGPlayerState()->Clear();
        pPlayer->GetSession()->SendLfgJoinResult(result);
        if (pPlayer->GetGroup())
            pPlayer->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_ROLECHECK_FAILED, type);
        return;
    }

    if (!guid.IsGroup() && pPlayer->GetLFGPlayerState()->GetRoles() == LFG_ROLE_MASK_NONE)
    {
        DEBUG_LOG("LFGMgr::Join:Error: %u has no roles! continued...", guid.GetCounter());
    }


    // Joining process
    pPlayer->GetLFGPlayerState()->SetJoined();

    if (guid.IsGroup())
    {
        switch (group->GetLFGGroupState()->GetState())
        {
            case LFG_STATE_NONE:
            case LFG_STATE_FINISHED_DUNGEON:
            {
                RemoveFromQueue(guid);
                AddToQueue(guid, type, false);
                group->GetLFGGroupState()->SetState((type == LFG_TYPE_RAID) ? LFG_STATE_LFR : LFG_STATE_LFG);
                group->GetLFGGroupState()->SetStatus(LFG_STATUS_NOT_SAVED);

                for (GroupReference *itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
                {
                    Player* pGroupMember = itr->getSource();
                    if (pGroupMember && pGroupMember->IsInWorld())
                    {
                        RemoveFromQueue(pGroupMember->GetObjectGuid());
                        if(sWorld.getConfig(CONFIG_BOOL_RESTRICTED_LFG_CHANNEL))
                            pGroupMember->JoinLFGChannel();
                        pGroupMember->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_JOIN_PROPOSAL, type);
                        pGroupMember->GetLFGPlayerState()->SetState((type == LFG_TYPE_RAID) ? LFG_STATE_LFR : LFG_STATE_LFG);
                    }
                }
                if (type == LFG_TYPE_RAID && sWorld.getConfig(CONFIG_BOOL_LFR_EXTEND))
                {
                    group->ConvertToLFG(type);
                }
                else
                {
                    StartRoleCheck(group);
                }
                break;
            }
            // re-adding to queue
            case LFG_STATE_DUNGEON:
            {
                AddToQueue(guid, type, true);
                if (type == LFG_TYPE_RAID)
                    break;
                for (GroupReference *itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
                {
                    Player* pGroupMember = itr->getSource();
                    if (pGroupMember && pGroupMember->IsInWorld())
                    {
                        if(sWorld.getConfig(CONFIG_BOOL_RESTRICTED_LFG_CHANNEL))
                            pGroupMember->JoinLFGChannel();
                        pGroupMember->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_JOIN_PROPOSAL, type);
                        pGroupMember->GetLFGPlayerState()->SetState(LFG_STATE_LFG);
                    }
                }
                group->GetLFGGroupState()->SetStatus(LFG_STATUS_NOT_SAVED);
                StartRoleCheck(group);
                break;
            }
            default:
                DEBUG_LOG("LFGMgr::Join:Error: group %u in impossible state %u for join.", guid.GetCounter(), group->GetLFGGroupState()->GetState());
                return;
        }
    }
    else
    {
        RemoveFromQueue(guid);
        AddToQueue(guid, type, false);
        AddToSearchMatrix(guid);
        pPlayer->GetLFGPlayerState()->SetState((type == LFG_TYPE_RAID) ? LFG_STATE_LFR : LFG_STATE_QUEUED);
        pPlayer->GetSession()->SendLfgJoinResult(result, LFG_ROLECHECK_NONE);
        pPlayer->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_JOIN_PROPOSAL,type);
        pPlayer->GetSession()->SendLfgUpdateSearch(true);
    }
    pPlayer->GetSession()->SendLfgUpdateSearch(true);
}

void LFGMgr::Leave(Group* group)
{
    if (!group)
        return;

    Player* leader = sObjectMgr.GetPlayer(group->GetLeaderGuid());

    if (!leader)
        return;

    Leave(leader);
}

void LFGMgr::Leave(Player* pPlayer)
{

    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE) && !sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE))
        return;

    ObjectGuid guid;
    Group* group = pPlayer->GetGroup();

    LFGType type;
    if (group)
    {
        if (pPlayer->GetObjectGuid() != group->GetLeaderGuid())
            return;
        else
            guid = group->GetObjectGuid();
    }
    else
        guid = pPlayer->GetObjectGuid();

    if (guid.IsEmpty())
        return;

    RemoveFromQueue(guid);
    RemoveFromSearchMatrix(guid);

    if (group)
    {
        if (group->GetLFGGroupState()->GetState() == LFG_STATE_ROLECHECK)
        {
            group->GetLFGGroupState()->SetRoleCheckState(LFG_ROLECHECK_ABORTED);
            for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
            {
                Player* pGroupMember = itr->getSource();
                if (pGroupMember && pGroupMember->IsInWorld())
                {
                    pGroupMember->GetSession()->SendLfgRoleCheckUpdate();
                }
            }
        }
        else if (group->GetLFGGroupState()->GetState() == LFG_STATE_PROPOSAL)
        {
            LFGProposal* pProposal = group->GetLFGGroupState()->GetProposal();
            if (pProposal)
                pProposal->SetDeleted();
        }

        type = group->GetLFGGroupState()->GetType();
        for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* pGroupMember = itr->getSource();
            if (pGroupMember && pGroupMember->IsInWorld())
            {
                    pGroupMember->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_REMOVED_FROM_QUEUE, type);
                    RemoveFromQueue(pGroupMember->GetObjectGuid());
                    RemoveFromSearchMatrix(pGroupMember->GetObjectGuid());
                    if(sWorld.getConfig(CONFIG_BOOL_RESTRICTED_LFG_CHANNEL) && pGroupMember->GetSession()->GetSecurity() == SEC_PLAYER )
                        pGroupMember->LeaveLFGChannel();
                    pGroupMember->GetLFGPlayerState()->Clear();
            }
        }
        group->GetLFGGroupState()->Clear();
    }
    else
    {
        type = pPlayer->GetLFGPlayerState()->GetType();
        pPlayer->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_REMOVED_FROM_QUEUE, type);
        pPlayer->GetLFGPlayerState()->Clear();
        if(sWorld.getConfig(CONFIG_BOOL_RESTRICTED_LFG_CHANNEL) && pPlayer->GetSession()->GetSecurity() == SEC_PLAYER )
            pPlayer->LeaveLFGChannel();
    }
    pPlayer->GetSession()->SendLfgUpdateSearch(false);
}

LFGQueueInfo* LFGMgr::GetQueueInfo(ObjectGuid guid)
{
    ReadGuard Guard(GetLock());

    LFGQueueInfoMap::iterator queue = m_queueInfoMap.find(guid);
    if (queue == m_queueInfoMap.end())
        return NULL;
    else
        return &queue->second;
}

void LFGMgr::AddToQueue(ObjectGuid guid, LFGType type, bool inBegin)
{
    // we need a guid (group or player)
    if (guid.IsEmpty())
        return;

    // we doesn't add something without a valid type
    if (type == LFG_TYPE_NONE)
        return;

    // Delete old LFGQueueInfo
    RemoveFromQueue(guid);

    // Joining process
    LFGQueueInfo newLFGQueueInfo = LFGQueueInfo(guid, type);
    {
        WriteGuard Guard(GetLock());
        m_queueInfoMap.insert(std::make_pair(guid, newLFGQueueInfo));
    }
    // we must be save, that we add this info in Queue
    LFGQueueInfo* pqInfo = GetQueueInfo(guid);
    MANGOS_ASSERT(pqInfo);

    pqInfo->tanks   = LFG_TANKS_NEEDED;
    pqInfo->healers = LFG_HEALERS_NEEDED ;
    pqInfo->dps     = LFG_DPS_NEEDED ;

    if (guid.IsGroup())
    {
        Group* pGroup = sObjectMgr.GetGroup(guid);
        MANGOS_ASSERT(pGroup);
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* pGroupMember = itr->getSource();
            if (pGroupMember && pGroupMember->IsInWorld())
            {
                LFGPlayerState* pGroupMemberState = pGroupMember->GetLFGPlayerState();
                if (pGroupMemberState->HasRole(ROLE_TANK) && pqInfo->tanks > 0)
                    pqInfo->tanks -= 1;
                else if (pGroupMemberState->HasRole(ROLE_HEALER) && pqInfo->healers > 0)
                    pqInfo->healers -= 1;
                else if (pGroupMemberState->HasRole(ROLE_DAMAGE) && pqInfo->dps > 0)
                    pqInfo->dps -= 1;
            }
        }
        WriteGuard Guard(GetLock());
        m_groupQueue[type].insert((inBegin ? m_groupQueue[type].begin() : m_groupQueue[type].end()), pqInfo);
    }
    else
    {
        Player* pPlayer = sObjectMgr.GetPlayer(guid);
        MANGOS_ASSERT(pPlayer);
        LFGPlayerState* pPlayerState = pPlayer->GetLFGPlayerState();
        if (pPlayerState->HasRole(ROLE_TANK) && pqInfo->tanks > 0)
            pqInfo->tanks -= 1;
        else if (pPlayerState->HasRole(ROLE_HEALER) && pqInfo->healers > 0)
            pqInfo->healers -= 1;
        else if (pPlayerState->HasRole(ROLE_DAMAGE) && pqInfo->dps > 0)
            pqInfo->dps -= 1;

        WriteGuard Guard(GetLock());
        m_playerQueue[type].insert((inBegin ? m_playerQueue[type].begin() : m_playerQueue[type].end()), pqInfo);
    }
    DEBUG_LOG("LFGMgr::AddToQueue: %s %u joined, type %u",(guid.IsGroup() ? "group" : "player"), guid.GetCounter(), type);
}

void LFGMgr::RemoveFromQueue(ObjectGuid guid)
{
    if (LFGQueueInfo* pqInfo = GetQueueInfo(guid))
    {
        LFGType type = pqInfo->GetDungeonType();

        DEBUG_LOG("LFGMgr::RemoveFromQueue: %s %u removed, type %u",(guid.IsGroup() ? "group" : "player"), guid.GetCounter(), type);

        WriteGuard Guard(GetLock());
        if (guid.IsGroup())
        {
            if (m_groupQueue[type].find(pqInfo) != m_groupQueue[type].end())
                m_groupQueue[type].erase(pqInfo);
        }
        else
        {
            if (m_playerQueue[type].find(pqInfo) != m_playerQueue[type].end())
                m_playerQueue[type].erase(pqInfo);
        }
        m_queueInfoMap.erase(guid);
    }
}

LFGJoinResult LFGMgr::GetPlayerJoinResult(Player* pPlayer)
{

   if (pPlayer->InBattleGround() || pPlayer->InArena() || pPlayer->InBattleGroundQueue())
        return ERR_LFG_CANT_USE_DUNGEONS;

   if (pPlayer->HasAura(LFG_SPELL_DUNGEON_DESERTER))
        return  ERR_LFG_DESERTER_PLAYER;

    if (pPlayer->HasAura(LFG_SPELL_DUNGEON_COOLDOWN)
        && (!pPlayer->GetGroup() || pPlayer->GetGroup()->GetLFGGroupState()->GetStatus() != LFG_STATUS_OFFER_CONTINUE))
        return ERR_LFG_RANDOM_COOLDOWN_PLAYER;

    LFGDungeonSet const* dungeons = pPlayer->GetLFGPlayerState()->GetDungeons();


    if (pPlayer->GetPlayerbotMgr() || pPlayer->GetPlayerbotAI())
    {
        DEBUG_LOG("LFGMgr::GetPlayerJoinResult: %u trying to join to dungeon finder, but has playerbots (or playerbot itself). Aborting.", pPlayer->GetObjectGuid().GetCounter());
        return ERR_LFG_NO_SLOTS_PLAYER;
    }

    // TODO - Check if all dungeons are valid

    // must be last check - ignored in party
    if (!dungeons || !dungeons->size())
        return ERR_LFG_INVALID_SLOT;

    return ERR_LFG_OK;
}

LFGJoinResult LFGMgr::GetGroupJoinResult(Group* group)
{
    if (!group)
        return ERR_LFG_GET_INFO_TIMEOUT;

    if (!group->isRaidGroup() && (group->GetMembersCount() > MAX_GROUP_SIZE))
        return ERR_LFG_TOO_MANY_MEMBERS;

    if (group->isRaidGroup() && group->GetLFGGroupState()->GetType() != LFG_TYPE_RAID)
    {
        DEBUG_LOG("LFGMgr::GetGroupJoinResult: Group %u trying to join as raid, but not to raid finder. Aborting.", group->GetObjectGuid().GetCounter());
        return ERR_LFG_MISMATCHED_SLOTS;
    }

    for (GroupReference *itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        Player* pGroupMember = itr->getSource();

        if (!pGroupMember->IsInWorld())
            return ERR_LFG_MEMBERS_NOT_PRESENT;

        LFGJoinResult result = GetPlayerJoinResult(pGroupMember);

        if (result == ERR_LFG_INVALID_SLOT)
            continue;

        if (result != ERR_LFG_OK)
            return result;
    }

    return ERR_LFG_OK;
}

LFGLockStatusMap LFGMgr::GetPlayerLockMap(Player* pPlayer)
{
    LFGLockStatusMap tmpMap;
    tmpMap.clear();

    if (!pPlayer)
        return tmpMap;

    for (uint32 i = 1; i < sLFGDungeonStore.GetNumRows(); ++i)
    {
        if (LFGDungeonEntry const* entry = sLFGDungeonStore.LookupEntry(i))
            if (LFGLockStatusType status = GetPlayerLockStatus(pPlayer, entry))
                if (status != LFG_LOCKSTATUS_OK)
                    tmpMap.insert(std::make_pair(entry,status));
    }

    return tmpMap;
}

LFGLockStatusType LFGMgr::GetPlayerLockStatus(Player* pPlayer, LFGDungeonEntry const* dungeon)
{
    if (!pPlayer || !pPlayer->IsInWorld())
        return LFG_LOCKSTATUS_RAID_LOCKED;

    bool isRandom = (pPlayer->GetLFGPlayerState()->GetType() == LFG_TYPE_RANDOM_DUNGEON);

    // check if player in this dungeon. not need other checks
    //
    if (pPlayer->GetGroup() && pPlayer->GetGroup()->isLFDGroup())
    {
        if (pPlayer->GetGroup()->GetLFGGroupState()->GetDungeon())
        {
            if (pPlayer->GetGroup()->GetLFGGroupState()->GetDungeon()->map == pPlayer->GetMapId())
                return LFG_LOCKSTATUS_OK;
            else if (pPlayer->GetGroup()->GetLFGGroupState()->GetType() == LFG_TYPE_RANDOM_DUNGEON)
                isRandom = true;
        }
    }

    if (isRandom && sWorld.IsDungeonMapIdDisable(dungeon->map))
        return LFG_LOCKSTATUS_NOT_IN_SEASON;

    if (dungeon->expansion > pPlayer->GetSession()->Expansion())
        return LFG_LOCKSTATUS_INSUFFICIENT_EXPANSION;

    if (dungeon->difficulty > DUNGEON_DIFFICULTY_NORMAL
        && pPlayer->GetBoundInstance(dungeon->map, Difficulty(dungeon->difficulty)))
        return  LFG_LOCKSTATUS_RAID_LOCKED;

    if (dungeon->minlevel > pPlayer->getLevel())
        return  LFG_LOCKSTATUS_TOO_LOW_LEVEL;

    if (dungeon->maxlevel < pPlayer->getLevel())
        return LFG_LOCKSTATUS_TOO_HIGH_LEVEL;

    switch (pPlayer->GetAreaLockStatus(dungeon->map, Difficulty(dungeon->difficulty)))
    {
        case AREA_LOCKSTATUS_OK:
            break;
        case AREA_LOCKSTATUS_TOO_LOW_LEVEL:
            return  LFG_LOCKSTATUS_TOO_LOW_LEVEL;
        case AREA_LOCKSTATUS_QUEST_NOT_COMPLETED:
            return LFG_LOCKSTATUS_QUEST_NOT_COMPLETED;
        case AREA_LOCKSTATUS_MISSING_ITEM:
            return LFG_LOCKSTATUS_MISSING_ITEM;
        case AREA_LOCKSTATUS_MISSING_DIFFICULTY:
            return LFG_LOCKSTATUS_RAID_LOCKED;
        case AREA_LOCKSTATUS_INSUFFICIENT_EXPANSION:
            return LFG_LOCKSTATUS_INSUFFICIENT_EXPANSION;
        case AREA_LOCKSTATUS_NOT_ALLOWED:
            return LFG_LOCKSTATUS_RAID_LOCKED;
        case AREA_LOCKSTATUS_RAID_LOCKED:
        case AREA_LOCKSTATUS_UNKNOWN_ERROR:
        default:
            return LFG_LOCKSTATUS_RAID_LOCKED;
    }

    if (dungeon->difficulty > DUNGEON_DIFFICULTY_NORMAL)
    {
        if (AreaTrigger const* at = sObjectMgr.GetMapEntranceTrigger(dungeon->map))
        {
            uint32 gs = pPlayer->GetEquipGearScore(true,true);

            if (at->minGS > 0 && gs < at->minGS)
                return LFG_LOCKSTATUS_TOO_LOW_GEAR_SCORE;
            else if (at->maxGS > 0 && gs > at->maxGS)
                return LFG_LOCKSTATUS_TOO_HIGH_GEAR_SCORE;
        }
        else
            return LFG_LOCKSTATUS_RAID_LOCKED;
    }

    if (InstancePlayerBind* bind = pPlayer->GetBoundInstance(dungeon->map, Difficulty(dungeon->difficulty)))
    {
        if (DungeonPersistentState* state = bind->state)
            if (state->IsCompleted())
                return LFG_LOCKSTATUS_RAID_LOCKED;
    }

        /* TODO
            LFG_LOCKSTATUS_ATTUNEMENT_TOO_LOW_LEVEL;
            LFG_LOCKSTATUS_ATTUNEMENT_TOO_HIGH_LEVEL;
            LFG_LOCKSTATUS_NOT_IN_SEASON;
        */

    return LFG_LOCKSTATUS_OK;
}

LFGLockStatusType LFGMgr::GetPlayerExpansionLockStatus(Player* pPlayer, LFGDungeonEntry const* dungeon)
{
    if (!pPlayer || !pPlayer->IsInWorld() || !dungeon)
        return LFG_LOCKSTATUS_RAID_LOCKED;

    uint32 randomEntry = 0;
    if (pPlayer->GetGroup() && pPlayer->GetGroup()->isLFDGroup())
    {
        if (pPlayer->GetGroup()->GetLFGGroupState()->GetDungeon())
        {
            if (pPlayer->GetGroup()->GetLFGGroupState()->GetType() == LFG_TYPE_RANDOM_DUNGEON)
                randomEntry = (*pPlayer->GetGroup()->GetLFGGroupState()->GetDungeons()->begin())->ID;
        }
    }

    LFGDungeonExpansionEntry const* dungeonExpansion = NULL;

    for (uint32 i = 0; i < sLFGDungeonExpansionStore.GetNumRows(); ++i)
    {
        if (LFGDungeonExpansionEntry const* dungeonEx = sLFGDungeonExpansionStore.LookupEntry(i))
        {
            if (dungeonEx->dungeonID == dungeon->ID
                && dungeonEx->expansion == pPlayer->GetSession()->Expansion()
                && (randomEntry && randomEntry == dungeonEx->randomEntry))
                dungeonExpansion = dungeonEx;
        }
    }

    if (!dungeonExpansion)
        return LFG_LOCKSTATUS_OK;

    if (dungeonExpansion->minlevelHard > pPlayer->getLevel())
        return  LFG_LOCKSTATUS_TOO_LOW_LEVEL;

    if (dungeonExpansion->maxlevelHard < pPlayer->getLevel())
        return LFG_LOCKSTATUS_TOO_HIGH_LEVEL;

/*
    // need special case for handle attunement
    if (dungeonExpansion->minlevel > player->getLevel())
        return  LFG_LOCKSTATUS_ATTUNEMENT_TOO_LOW_LEVEL;

    if (dungeonExpansion->maxlevel < player->getLevel())
        return LFG_LOCKSTATUS_ATTUNEMENT_TOO_HIGH_LEVEL;
*/
        return LFG_LOCKSTATUS_OK;
}

LFGLockStatusType LFGMgr::GetGroupLockStatus(Group* group, LFGDungeonEntry const* dungeon)
{
    if (!group)
        return LFG_LOCKSTATUS_RAID_LOCKED;

    for (GroupReference *itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        Player* pGroupMember = itr->getSource();

        LFGLockStatusType result = GetPlayerLockStatus(pGroupMember, dungeon);

        if (result != LFG_LOCKSTATUS_OK)
            return result;
    }
    return LFG_LOCKSTATUS_OK;
}

LFGDungeonSet LFGMgr::GetRandomDungeonsForPlayer(Player* pPlayer)
{
    LFGDungeonSet list;

    for (uint32 i = 0; i < sLFGDungeonStore.GetNumRows(); ++i)
    {
        if (LFGDungeonEntry const* dungeon = sLFGDungeonStore.LookupEntry(i))
        {
            if (dungeon &&
                LFGMgr::IsRandomDungeon(dungeon) &&
                GetPlayerLockStatus(pPlayer, dungeon) == LFG_LOCKSTATUS_OK)
                list.insert(dungeon);
            else if (dungeon &&
                dungeon->grouptype == LFG_GROUP_TYPE_WORLD_EVENTS  &&
                GetPlayerLockStatus(pPlayer, dungeon) == LFG_LOCKSTATUS_OK &&
                LFGMgr::CheckWorldEvent(dungeon))
                list.insert(dungeon);
        }
    }
    return list;
}

LFGDungeonSet LFGMgr::ExpandRandomDungeonsForGroup(LFGDungeonEntry const* randomDungeon, GuidSet playerGuids)
{
    LFGDungeonSet list;
    for (uint32 i = 0; i < sLFGDungeonStore.GetNumRows(); ++i)
    {
        if (LFGDungeonEntry const* dungeonEx = sLFGDungeonStore.LookupEntry(i))
        {
            if ((dungeonEx->type == LFG_TYPE_DUNGEON ||
                 dungeonEx->type == LFG_TYPE_HEROIC_DUNGEON)
                 && dungeonEx->difficulty == randomDungeon->difficulty)
            {
                bool checkPassed = true;
                for (GuidSet::const_iterator itr =  playerGuids.begin(); itr !=  playerGuids.end(); ++itr)
                {
                    Player* pPlayer = sObjectMgr.GetPlayer(*itr);

                    // Additional checks for expansion there!

                    if (!dungeonEx || GetPlayerLockStatus(pPlayer, dungeonEx) != LFG_LOCKSTATUS_OK)
                       checkPassed = false;
                }
                if (checkPassed)
                    list.insert(dungeonEx);
            }
        }
    }
    return list;
}

LFGDungeonEntry const* SelectDungeonFromList(LFGDungeonSet* dungeons)
{
    if (!dungeons || dungeons->empty())
        return NULL;
    if (dungeons->size() == 1)
        return *dungeons->begin();

    return NULL;
}


LFGDungeonEntry const* LFGMgr::GetDungeon(uint32 dungeonID)
{
    LFGDungeonMap::const_iterator itr = m_dungeonMap.find(dungeonID);
    return itr != m_dungeonMap.end() ? itr->second : NULL;
}

void LFGMgr::ClearLFRList(Player* pPlayer)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE) && !sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE))
        return;

    if (!pPlayer)
        return;

    LFGDungeonSet dungeons;
    dungeons.clear();
    pPlayer->GetLFGPlayerState()->SetDungeons(dungeons);
    DEBUG_LOG("LFGMgr::LFR List cleared, player %u leaving LFG queue", pPlayer->GetObjectGuid().GetCounter());
    RemoveFromQueue(pPlayer->GetObjectGuid());

}

GuidSet LFGMgr::GetDungeonPlayerQueue(LFGDungeonEntry const* dungeon, Team team)
{
    GuidSet tmpSet;

    if (!dungeon)
        return tmpSet;

    GuidSet* players = GetPlayersForDungeon(dungeon);
    if (!players || players->empty())
        return tmpSet;

    for (GuidSet::const_iterator itr = players->begin(); itr != players->end(); ++itr)
    {
        ObjectGuid guid = (*itr);
        Player* pPlayer = sObjectMgr.GetPlayer(guid);
        if (!pPlayer)
            continue;

        if (team && pPlayer->GetTeam() != team)
            continue;

        if (pPlayer->GetLFGPlayerState()->GetState() < LFG_STATE_LFR ||
            pPlayer->GetLFGPlayerState()->GetState() > LFG_STATE_PROPOSAL)
            continue;

        tmpSet.insert(guid);
    }
    return tmpSet;
}

GuidSet LFGMgr::GetDungeonPlayerQueue(LFGType type)
{
    ReadGuard Guard(GetLock());
    GuidSet tmpSet;

    for (LFGQueue::const_iterator itr = m_playerQueue[type].begin(); itr != m_playerQueue[type].end(); ++itr)
    {
        ObjectGuid guid = (*itr)->guid;
        Player* pPlayer = sObjectMgr.GetPlayer(guid);
        if (!pPlayer)
            continue;

        if (pPlayer->GetLFGPlayerState()->GetState() < LFG_STATE_LFR ||
            pPlayer->GetLFGPlayerState()->GetState() > LFG_STATE_PROPOSAL)
            continue;

        tmpSet.insert(guid);
    }
    return tmpSet;
}

GuidSet LFGMgr::GetDungeonGroupQueue(LFGType type)
{
    ReadGuard Guard(GetLock());
    GuidSet tmpSet;

    for (LFGQueue::const_iterator itr = m_groupQueue[type].begin(); itr != m_groupQueue[type].end(); ++itr)
    {
        ObjectGuid guid = (*itr)->guid;
        Group* pGroup = sObjectMgr.GetGroup(guid);
        if (!pGroup)
            continue;

        if (pGroup->GetLFGGroupState()->GetState() < LFG_STATE_LFR ||
            pGroup->GetLFGGroupState()->GetState() > LFG_STATE_PROPOSAL)
            continue;

        tmpSet.insert(guid);
    }
    return tmpSet;
}

GuidSet LFGMgr::GetDungeonGroupQueue(LFGDungeonEntry const* dungeon, Team team)
{
    GuidSet tmpSet;
    tmpSet.clear();
    LFGType type = LFG_TYPE_NONE;
    uint32 dungeonID = 0;
    uint8 searchEnd = LFG_TYPE_MAX;
    if (dungeon)
    {
        type = LFGType(dungeon->type);
        dungeonID = dungeon->ID;
        searchEnd = type+1;
    }

    for (uint8 i = type; i < searchEnd; ++i)
    {
        ReadGuard Guard(GetLock());
        for (LFGQueue::const_iterator itr = m_groupQueue[i].begin(); itr != m_groupQueue[i].end(); ++itr)
        {
            ObjectGuid guid = (*itr)->guid;
            Group* pGroup = sObjectMgr.GetGroup(guid);
            if (!pGroup)
                continue;

            if (pGroup->GetLFGGroupState()->GetState() < LFG_STATE_LFR ||
                pGroup->GetLFGGroupState()->GetState() > LFG_STATE_PROPOSAL)
                continue;

            Player* pPlayer = sObjectMgr.GetPlayer(pGroup->GetLeaderGuid());
            if (!pPlayer)
                continue;

            if (team && pPlayer->GetTeam() != team)
                continue;

            if (pGroup->GetLFGGroupState()->GetDungeons()->find(dungeon) == pGroup->GetLFGGroupState()->GetDungeons()->end())
                continue;

            tmpSet.insert(guid);
        }
    }
    return tmpSet;
}

void LFGMgr::SendLFGRewards(Group* pGroup)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE) && !sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE))
        return;

    if (!pGroup || !pGroup->isLFGGroup())
    {
        DEBUG_LOG("LFGMgr::SendLFGReward: not group or not a LFGGroup. Ignoring");
        return;
    }

    if (pGroup->GetLFGGroupState()->GetState() == LFG_STATE_FINISHED_DUNGEON)
    {
        DEBUG_LOG("LFGMgr::SendLFGReward: group %u already rewarded!",pGroup->GetObjectGuid().GetCounter());
        return;
    }

    pGroup->GetLFGGroupState()->SetState(LFG_STATE_FINISHED_DUNGEON);
    pGroup->GetLFGGroupState()->SetStatus(LFG_STATUS_SAVED);

    LFGDungeonEntry const* dungeon = *pGroup->GetLFGGroupState()->GetDungeons()->begin();

    if (!dungeon)
    {
        DEBUG_LOG("LFGMgr::SendLFGReward: group %u - but no realdungeon", pGroup->GetObjectGuid().GetCounter());
        return;
    }
    else  if (dungeon->type != LFG_TYPE_RANDOM_DUNGEON)
    {
        DEBUG_LOG("LFGMgr::SendLFGReward: group %u dungeon %u is not random (%u)", pGroup->GetObjectGuid().GetCounter(), dungeon->ID, dungeon->type);
        return;
    }

    for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        Player* pGroupMember = itr->getSource();
        if (pGroupMember && pGroupMember->IsInWorld())
            SendLFGReward(pGroupMember, dungeon);
    }
}

void LFGMgr::SendLFGReward(Player* pPlayer, LFGDungeonEntry const* pRandomDungeon)
{
    if (!pPlayer || !pRandomDungeon)
        return;

    if (pPlayer->GetLFGPlayerState()->GetState() == LFG_STATE_FINISHED_DUNGEON)
    {
        DEBUG_LOG("LFGMgr::SendLFGReward: player %u already rewarded!",pPlayer->GetObjectGuid().GetCounter());
        return;
    }

    // Update achievements
    if (pRandomDungeon->difficulty == DUNGEON_DIFFICULTY_HEROIC)
    {
        if (Group* pGroup = pPlayer->GetGroup())
        {
            if (pGroup->GetLFGGroupState()->GetRandomPlayersCount())
                pPlayer->GetAchievementMgr().UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_USE_LFD_TO_GROUP_WITH_PLAYERS, pGroup->GetLFGGroupState()->GetRandomPlayersCount());
        }
    }

    pPlayer->GetLFGPlayerState()->SetState(LFG_STATE_FINISHED_DUNGEON);

    LFGReward const* reward = GetRandomDungeonReward(pRandomDungeon, pPlayer);

    if (!reward)
        return;

    uint8 index = 0;

    // if we can take the quest, means that we haven't done this kind of "run", IE: First Heroic Random of Day.
    Quest const* pQuest = sObjectMgr.GetQuestTemplate(reward->reward[0].questId);

    if (!pPlayer->CanTakeQuest(pQuest, false))
        index = 1;

    Quest const* qReward = sObjectMgr.GetQuestTemplate(reward->reward[index].questId);

    if (!qReward)
    {
        sLog.outError("LFGMgr::RewardDungeonDone quest %u is absent in DB.", reward->reward[index].questId);
        return;
    }

    // we give reward without informing client (retail does this)
    pPlayer->RewardQuest(qReward,0,NULL,false);

    // Give rewards
    DEBUG_LOG("LFGMgr::RewardDungeonDoneFor: %u done dungeon %u, %s previously done.", pPlayer->GetObjectGuid().GetCounter(), pRandomDungeon->ID, index > 0 ? " " : " not");
    pPlayer->GetSession()->SendLfgPlayerReward(pRandomDungeon, reward, qReward, index != 0);
}

uint32 LFGMgr::CreateProposal(LFGDungeonEntry const* dungeon, Group* pGroup, GuidSet* guids)
{
    if (!dungeon)
        return false;

    uint32 ID = 0;
    if (pGroup)
    {
        if (LFGProposal* pProposal = pGroup->GetLFGGroupState()->GetProposal())
        {
            ID = pProposal->m_uiID;
        }
    }

    LFGProposal proposal = LFGProposal(dungeon);
    proposal.SetState(LFG_PROPOSAL_INITIATING);
    proposal.SetGroup(pGroup);
    if (ID)
    {
        WriteGuard Guard(GetLock());
        m_proposalMap.erase(ID);
        proposal.m_uiID = ID;
        m_proposalMap.insert(std::make_pair(ID, proposal));
    }
    else
    {
        WriteGuard Guard(GetLock());
        ID = GenerateProposalID();
        proposal.m_uiID = ID;
        m_proposalMap.insert(std::make_pair(ID, proposal));
    }

    LFGProposal* pProposal = GetProposal(ID);
    MANGOS_ASSERT(pProposal);
    pProposal->Start();

    if (pGroup)
    {
        pGroup->GetLFGGroupState()->SetProposal(GetProposal(ID));
        pGroup->GetLFGGroupState()->SetState(LFG_STATE_PROPOSAL);
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* pGroupMember = itr->getSource();
            if (pGroupMember && pGroupMember->IsInWorld())
            {
                pGroupMember->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_PROPOSAL_BEGIN, LFGType(dungeon->type));
                pGroupMember->GetSession()->SendLfgUpdateProposal(GetProposal(ID));
                pGroupMember->GetLFGPlayerState()->SetState(LFG_STATE_PROPOSAL);
                pGroupMember->GetLFGPlayerState()->SetAnswer(LFG_ANSWER_PENDING);
            }
        }
        if (guids && !guids->empty())
            pGroup->GetLFGGroupState()->SetRandomPlayersCount(uint8(guids->size()));
    }
    if (guids && !guids->empty())
    {
        for (GuidSet::const_iterator itr2 = guids->begin(); itr2 != guids->end(); ++itr2 )
        {
            if (!SendProposal(ID,*itr2))
                DEBUG_LOG("LFGMgr::CreateProposal: cannot send proposal %u, dungeon %u, %s to player %u", ID, dungeon->ID, pGroup ? " in pGroup" : " not in pGroup", (*itr2).GetCounter());
        }
    }
    DEBUG_LOG("LFGMgr::CreateProposal: %u, dungeon %u, %s", ID, dungeon->ID, pGroup ? " in pGroup" : " not in pGroup");
    return ID;
}

bool LFGMgr::SendProposal(uint32 ID, ObjectGuid guid)
{
    if (guid.IsEmpty() || !ID)
        return false;

    LFGProposal* pProposal = GetProposal(ID);

    Player* pPlayer = sObjectMgr.GetPlayer(guid);

    if (!pProposal || !pPlayer)
        return false;

    pProposal->AddMember(guid);
    pProposal->Start();
    pPlayer->GetLFGPlayerState()->SetState(LFG_STATE_PROPOSAL);
    pPlayer->GetLFGPlayerState()->SetAnswer(LFG_ANSWER_PENDING);
    pPlayer->GetLFGPlayerState()->SetProposal(pProposal);
    RemoveFromSearchMatrix(guid);
    if (pPlayer->GetGroup())
        pPlayer->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_PROPOSAL_BEGIN, LFGType(pProposal->GetDungeon()->type));
    else
    {
        pPlayer->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_GROUP_FOUND, LFGType(pProposal->GetDungeon()->type));
        pPlayer->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_PROPOSAL_BEGIN, LFGType(pProposal->GetDungeon()->type));
    }

    pPlayer->GetSession()->SendLfgUpdateProposal(pProposal);

    if (pProposal->GetGroup())
    {
        pProposal->GetGroup()->GetLFGGroupState()->SetState(LFG_STATE_PROPOSAL);
    }

    DEBUG_LOG("LFGMgr::SendProposal: proposal %u, dungeon %u, %s", ID, pProposal->GetDungeon()->ID, pProposal->GetGroup() ? " in group" : " not in group");
    return true;
}

LFGProposal* LFGMgr::GetProposal(uint32 ID)
{
    LFGProposalMap::iterator itr = m_proposalMap.find(ID);
    return itr != m_proposalMap.end() ? &itr->second : NULL;
}


uint32 LFGMgr::GenerateProposalID()
{
    uint32 newID = m_proposalID;
    ++m_proposalID;
    return newID;
}

void LFGMgr::UpdateProposal(uint32 ID, ObjectGuid guid, bool accept)
{
    // Check if the proposal exists
    LFGProposal* pProposal = GetProposal(ID);
    if (!pProposal)
        return;

    Player* pPlayer = sObjectMgr.GetPlayer(guid);
    if (!pPlayer)
        return;

    // check player in proposal
    if (!pProposal->IsMember(guid) && pProposal->GetGroup() && (pProposal->GetGroup() != pPlayer->GetGroup()) )
        return;

    pPlayer->GetLFGPlayerState()->SetAnswer(LFGAnswer(accept));

    // Remove member that didn't accept
    if (accept == LFG_ANSWER_DENY)
    {
        if (!sWorld.getConfig(CONFIG_BOOL_LFG_DEBUG_ENABLE))
            pPlayer->CastSpell(pPlayer,LFG_SPELL_DUNGEON_COOLDOWN,true);
        RemoveProposal(pPlayer, ID);
        return;
    }

    // check if all have answered and reorder players (leader first)
    bool allAnswered = true;
    GuidSet const proposalGuids = pProposal->GetMembers();
    for (GuidSet::const_iterator itr = proposalGuids.begin(); itr != proposalGuids.end(); ++itr )
    {
        Player* pPlayer = sObjectMgr.GetPlayer(*itr);
        if(pPlayer && pPlayer->IsInWorld())
        {
            if (pPlayer->GetLFGPlayerState()->GetAnswer() != LFG_ANSWER_AGREE)   // No answer (-1) or not accepted (0)
                allAnswered = false;
            pPlayer->GetSession()->SendLfgUpdateProposal(pProposal);
        }
    }

    if (Group* pGroup = pProposal->GetGroup())
    {
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* pGroupMember = itr->getSource();
            if(pGroupMember && pGroupMember->IsInWorld())
            {
                if (pGroupMember->GetLFGPlayerState()->GetAnswer() != LFG_ANSWER_AGREE)   // No answer (-1) or not accepted (0)
                    allAnswered = false;
                pGroupMember->GetSession()->SendLfgUpdateProposal(pProposal);
            }
        }
    }

    if (!allAnswered)
        return;

    DEBUG_LOG("LFGMgr::UpdateProposal: all players in proposal %u answered, make pGroup/teleport group", pProposal->m_uiID);
    // save waittime (group maked, save statistic)

    // Set the real dungeon (for random) or set old dungeon if OfferContinue

    LFGDungeonEntry const* realdungeon = NULL;
    MANGOS_ASSERT(pProposal->GetDungeon());

    // Create a new group (if needed)
    Group* pGroup = pProposal->GetGroup();

    if (pGroup && pGroup->GetLFGGroupState()->GetDungeon())
        realdungeon = pGroup->GetLFGGroupState()->GetDungeon();
    else
    {
        if (IsRandomDungeon(pProposal->GetDungeon()))
        {
            GuidSet tmpSet;
            if (pGroup)
            {
                for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
                {
                    if (Player* pGroupMember = itr->getSource())
                        if (pGroupMember->IsInWorld())
                            tmpSet.insert(pGroupMember->GetObjectGuid());
                }
            }

            GuidSet const proposalGuids = pProposal->GetMembers();
            for (GuidSet::const_iterator itr = proposalGuids.begin(); itr != proposalGuids.end(); ++itr )
            {
                 Player* pPlayer = sObjectMgr.GetPlayer(*itr);
                    if (pPlayer && pPlayer->IsInWorld())
                        tmpSet.insert(pPlayer->GetObjectGuid());
            }

            LFGDungeonSet randomList = ExpandRandomDungeonsForGroup(pProposal->GetDungeon(), tmpSet);
            realdungeon = SelectRandomDungeonFromList(randomList);
            if (!realdungeon)
            {
                DEBUG_LOG("LFGMgr::UpdateProposal:%u cannot set real dungeon! no compatible list.", pProposal->m_uiID);
                pProposal->SetDeleted();
                return;
            }
        }
        else
            realdungeon = pProposal->GetDungeon();
    }

    if (!pGroup)
    {
        GuidSet proposalGuidsTmp = pProposal->GetMembers();
        if (proposalGuidsTmp.empty())
        {
            DEBUG_LOG("LFGMgr::UpdateProposal:%u cannot make pGroup, guid set is empty!", pProposal->m_uiID);
            pProposal->SetDeleted();
            return;
        }
        Player* leader = LeaderElection(&proposalGuidsTmp);
        if (!leader)
        {
            DEBUG_LOG("LFGMgr::UpdateProposal:%u cannot make pGroup, cannot set leader!", pProposal->m_uiID);
            pProposal->SetDeleted();
            return;
        }

        if (leader->GetGroup())
            leader->RemoveFromGroup();

        leader->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_GROUP_FOUND, leader->GetLFGPlayerState()->GetType());
        leader->GetLFGPlayerState()->AddRole(ROLE_LEADER);

        pGroup = new Group();
        pGroup->Create(leader->GetObjectGuid(), leader->GetName());
        pGroup->ConvertToLFG(pProposal->GetType());
        sObjectMgr.AddGroup(pGroup);

        // LFG settings
        pGroup->GetLFGGroupState()->SetProposal(pProposal);
        pGroup->GetLFGGroupState()->SetState(LFG_STATE_PROPOSAL);
        pGroup->GetLFGGroupState()->AddDungeon(pProposal->GetDungeon());
        pGroup->GetLFGGroupState()->SetDungeon(realdungeon);

        // Special case to add leader to LFD pGroup:
        AddMemberToLFDGroup(leader->GetObjectGuid());
        pProposal->RemoveMember(leader->GetObjectGuid());
        leader->GetLFGPlayerState()->SetProposal(NULL);
        DEBUG_LOG("LFGMgr::UpdateProposal: in proposal %u created pGroup %u", pProposal->m_uiID, pGroup->GetObjectGuid().GetCounter());
    }
    else
    {
        pGroup->GetLFGGroupState()->SetDungeon(realdungeon);
        if (!pGroup->isLFGGroup())
        {
            pGroup->ConvertToLFG(pProposal->GetType());
            for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
            {
                if (Player* pGroupMember = itr->getSource())
                {
                    if (pGroupMember->IsInWorld())
                    {
                        AddMemberToLFDGroup(pGroupMember->GetObjectGuid());
                        pGroupMember->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_GROUP_FOUND, pGroup->GetLFGGroupState()->GetType());
                        if (!sWorld.getConfig(CONFIG_BOOL_LFG_DEBUG_ENABLE))
                            pGroupMember->CastSpell(pGroupMember,LFG_SPELL_DUNGEON_COOLDOWN,true);
                    }
                }
            }
        }
    }

    MANGOS_ASSERT(pGroup);
    pProposal->SetGroup(pGroup);
    pGroup->SendUpdate();

    // move players from proposal to pGroup
    for (GuidSet::const_iterator itr = proposalGuids.begin(); itr != proposalGuids.end(); ++itr)
    {
        Player* pPlayer = sObjectMgr.GetPlayer(*itr);
        if (pPlayer && pPlayer->IsInWorld() && pPlayer->GetMap())
        {
            if (pPlayer->GetGroup() && pPlayer->GetGroup() != pGroup)
            {
                pPlayer->RemoveFromGroup();
                pPlayer->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_GROUP_FOUND, pPlayer->GetLFGPlayerState()->GetType());
            }
            else if (pPlayer->GetGroup() && pPlayer->GetGroup() == pGroup)
            {
                    pPlayer->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_GROUP_FOUND, pPlayer->GetLFGPlayerState()->GetType());
            }
            else
            {
                pPlayer->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_GROUP_FOUND, pPlayer->GetLFGPlayerState()->GetType());
            }

            pGroup->AddMember(pPlayer->GetObjectGuid(), pPlayer->GetName());
            pProposal->RemoveMember(*itr);
//            player->GetSession()->SendLfgUpdateProposal(pProposal);
            pPlayer->GetLFGPlayerState()->SetProposal(NULL);
            if (!sWorld.getConfig(CONFIG_BOOL_LFG_DEBUG_ENABLE))
                pPlayer->CastSpell(pPlayer,LFG_SPELL_DUNGEON_COOLDOWN,true);
        }
        else
        {
            pProposal->RemoveMember(*itr);
        }
    }

    // Update statistics for dungeon/roles/etc

    MANGOS_ASSERT(pGroup->GetLFGGroupState()->GetDungeon());
    pGroup->SetDungeonDifficulty(Difficulty(pGroup->GetLFGGroupState()->GetDungeon()->difficulty));
    pGroup->GetLFGGroupState()->SetStatus(LFG_STATUS_NOT_SAVED);
    pGroup->SendUpdate();

    // Teleport pGroup
    //    Teleport(pGroup, false);
    AddEvent(pGroup->GetObjectGuid(),LFG_EVENT_TELEPORT_GROUP);

    RemoveProposal(ID, true);
    pGroup->GetLFGGroupState()->SetState(LFG_STATE_DUNGEON);
    RemoveFromQueue(pGroup->GetObjectGuid());
}

void LFGMgr::RemoveProposal(Player* decliner, uint32 ID)
{
    if (!decliner)
        return;

    LFGProposal* pProposal = GetProposal(ID);

    if (!pProposal || pProposal->IsDeleted())
        return;

    pProposal->SetDeleted();

    decliner->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_PROPOSAL_DECLINED, LFGType(pProposal->GetDungeon()->type));

    if (pProposal->GetGroup() && pProposal->GetGroup() == decliner->GetGroup())
    {
        Leave(decliner->GetGroup());
    }
    else
    {
        pProposal->RemoveDecliner(decliner->GetObjectGuid());
        Leave(decliner);
    }

    DEBUG_LOG("LFGMgr::UpdateProposal: %u didn't accept. Removing from queue", decliner->GetObjectGuid().GetCounter());

    if (Group* pGroup = pProposal->GetGroup())
    {
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
            if (Player* pGroupMember = itr->getSource())
                if (pGroupMember->IsInWorld())
                    pGroupMember->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_PROPOSAL_DECLINED, LFGType(pProposal->GetDungeon()->type));
    }

    {
        GuidSet const playersSet = pProposal->GetMembers();
        if (!playersSet.empty())
        {
            for (GuidSet::const_iterator itr = playersSet.begin(); itr != playersSet.end(); ++itr)
            {
                ObjectGuid guid = *itr;

                if (guid.IsEmpty())
                    continue;

                Player* pPlayer = sObjectMgr.GetPlayer(guid);
                if (pPlayer)
                    pPlayer->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_PROPOSAL_DECLINED, LFGType(pProposal->GetDungeon()->type));
            }
        }
    }
}

void LFGMgr::RemoveProposal(uint32 ID, bool success)
{

    LFGProposal* pProposal = GetProposal(ID);

    if (!pProposal)
        return;

    pProposal->SetDeleted();

    if (!success)
    {
        GuidSet const proposalGuids = pProposal->GetMembers();
        for (GuidSet::const_iterator itr2 = proposalGuids.begin(); itr2 != proposalGuids.end(); ++itr2 )
        {
            Player* pPlayer = sObjectMgr.GetPlayer(*itr2);
            if (pPlayer)
            {
                pPlayer->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_PROPOSAL_FAILED, LFGType(pProposal->GetDungeon()->type));
                pPlayer->GetLFGPlayerState()->SetProposal(NULL);

                // re-adding players to queue. decliner already removed
                if (pPlayer->GetLFGPlayerState()->GetAnswer() == LFG_ANSWER_AGREE)
                {
                    pPlayer->RemoveAurasDueToSpell(LFG_SPELL_DUNGEON_COOLDOWN);
                    AddToQueue(pPlayer->GetObjectGuid(),LFGType(pProposal->GetDungeon()->type), true);
                    pPlayer->GetLFGPlayerState()->SetState(LFG_STATE_QUEUED);
                    pPlayer->GetSession()->SendLfgJoinResult(ERR_LFG_OK, LFG_ROLECHECK_NONE);
                    pPlayer->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_JOIN_PROPOSAL, LFGType(pProposal->GetDungeon()->type));
                    pPlayer->GetSession()->SendLfgUpdateSearch(true);
//                    player->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_ADDED_TO_QUEUE, LFGType(pProposal->GetDungeon()->type));
                    DEBUG_LOG("LFGMgr::RemoveProposal: %u re-adding to queue", pPlayer->GetObjectGuid().GetCounter());
                }
                else
                    RemoveFromQueue(pPlayer->GetObjectGuid());
            }
        }

        if (Group* pGroup = pProposal->GetGroup())
        {
            // re-adding to queue (only client! in server we are in queue)
            pGroup->GetLFGGroupState()->SetProposal(NULL);
            pGroup->GetLFGGroupState()->SetState(LFG_STATE_QUEUED);
            if (GetQueueInfo(pGroup->GetObjectGuid()))
            {
                DEBUG_LOG("LFGMgr::RemoveProposal: standart way - group %u re-adding to queue.", pGroup->GetObjectGuid().GetCounter());
            }
            else
            {
                // re-adding group to queue. dont must call, but who know...
                AddToQueue(pGroup->GetObjectGuid(),LFGType(pProposal->GetDungeon()->type), true);
                DEBUG_LOG("LFGMgr::RemoveProposal: ERROR! group %u re-adding to queue not standart way.", pGroup->GetObjectGuid().GetCounter());
            }

            for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
            {
                if (Player* pGroupMember = itr->getSource())
                {
                    if (pGroupMember->IsInWorld())
                    {
                        pGroupMember->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_PROPOSAL_FAILED, LFGType(pProposal->GetDungeon()->type));
                        pGroupMember->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_ADDED_TO_QUEUE, LFGType(pProposal->GetDungeon()->type));
                        pGroupMember->GetSession()->SendLfgUpdateSearch(true);
                    }
                }
            }
        }
    }

    WriteGuard Guard(GetLock());
    LFGProposalMap::iterator itr = m_proposalMap.find(ID);
    if (itr != m_proposalMap.end())
        m_proposalMap.erase(itr);
}

void LFGMgr::CleanupProposals(LFGType type)
{
    std::set<uint32> expiredProposals;
    for (LFGProposalMap::iterator itr = m_proposalMap.begin(); itr != m_proposalMap.end(); ++itr)
    {
        if (LFGType(itr->second.GetDungeon()->type) != type)
            continue;

        if (itr->second.IsExpired())
            expiredProposals.insert(itr->second.m_uiID);
        else if (itr->second.IsDeleted())
            expiredProposals.insert(itr->second.m_uiID);
    }

    if (!expiredProposals.empty())
    {
        for(std::set<uint32>::const_iterator itr = expiredProposals.begin(); itr != expiredProposals.end(); ++itr)
        {
            DEBUG_LOG("LFGMgr::CleanupProposals: remove expired proposal %u", *itr);
            RemoveProposal(*itr);
        }
    }
}

void LFGMgr::OfferContinue(Group* pGroup)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE))
        return;

    if (pGroup)
    {
        LFGDungeonEntry const* dungeon = pGroup->GetLFGGroupState()->GetDungeon();
        if (!dungeon ||  pGroup->GetLFGGroupState()->GetStatus() > LFG_STATUS_NOT_SAVED)
        {
            DEBUG_LOG("LFGMgr::OfferContinue: group %u not have required attributes!", pGroup->GetObjectGuid().GetCounter());
            return;
        }
        Player* leader = sObjectMgr.GetPlayer(pGroup->GetLeaderGuid());
        if (leader)
            leader->GetSession()->SendLfgOfferContinue(dungeon);
        pGroup->GetLFGGroupState()->SetStatus(LFG_STATUS_OFFER_CONTINUE);
    }
    else
        sLog.outError("LFGMgr::OfferContinue: no group!");
}

void LFGMgr::InitBoot(Player* kicker, ObjectGuid victimGuid, std::string reason)
{
    Group*  pGroup = kicker->GetGroup();
    Player* victim = sObjectMgr.GetPlayer(victimGuid);

    if (!kicker || !pGroup || !victim)
        return;

    DEBUG_LOG("LFGMgr::InitBoot: group %u kicker %u victim %u reason %s", pGroup->GetObjectGuid().GetCounter(), kicker->GetObjectGuid().GetCounter(), victimGuid.GetCounter(), reason.c_str());

    if (!pGroup->GetLFGGroupState()->IsBootActive())
    {
        pGroup->GetLFGGroupState()->SetVotesNeeded(ceil(float(pGroup->GetMembersCount())/2.0));
        pGroup->GetLFGGroupState()->StartBoot(kicker->GetObjectGuid(), victimGuid, reason);
    }
    else
    {
    // send error to player
    //    return;
    }

    if (pGroup->GetLFGGroupState()->GetKicksLeft() == 0)
    {
        pGroup->Disband();
    }

    // Notify players
    for (GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        Player* pGroupMember = itr->getSource();

        if (pGroupMember && pGroupMember->IsInWorld())
            pGroupMember->GetSession()->SendLfgBootPlayer();
    }
}

void LFGMgr::CleanupBoots(LFGType type)
{
    for (LFGQueue::const_iterator itr = m_groupQueue[type].begin(); itr != m_groupQueue[type].end(); ++itr)
    {
        ObjectGuid guid = (*itr)->guid;
        Group* pGroup = sObjectMgr.GetGroup(guid);
        if (!pGroup)
            continue;

        if (pGroup->GetLFGGroupState()->GetState() != LFG_STATE_BOOT)
            continue;

        if (pGroup->GetLFGGroupState()->IsBootActive())
            continue;

        for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            if (Player* pGroupMember = itr->getSource())
            {
                if (pGroupMember->IsInWorld())
                {
                    pGroupMember->GetSession()->SendLfgBootPlayer();
                }
            }
        }
        pGroup->GetLFGGroupState()->StopBoot();
    }
}

void LFGMgr::UpdateBoot(Player* pPlayer, LFGAnswer answer)
{
    Group* pGroup = pPlayer->GetGroup();
    if (!pGroup)
        return;

    if (!pGroup->GetLFGGroupState()->IsBootActive())
        return;

    DEBUG_LOG("LFGMgr::UpdateBoot: group %u kicker %u answer %u", pGroup->GetObjectGuid().GetCounter(), pPlayer->GetObjectGuid().GetCounter(), accept);

    pGroup->GetLFGGroupState()->UpdateBoot(pPlayer->GetObjectGuid(),answer);

    // Send update info to all players
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        if (Player* pGroupMember = itr->getSource())
        {
            if (pGroupMember->IsInWorld())
            {
                pGroupMember->GetSession()->SendLfgBootPlayer();
            }
        }
    }

    switch (pGroup->GetLFGGroupState()->GetBootResult())
    {
        case LFG_ANSWER_AGREE:
        {
            Player* victim = sObjectMgr.GetPlayer(pGroup->GetLFGGroupState()->GetBootVictim());
            if (!victim)
            {
                pGroup->GetLFGGroupState()->StopBoot();
                return;
            }
            Player::RemoveFromGroup(pGroup, victim->GetObjectGuid());
            victim->GetLFGPlayerState()->Clear();

            // group may be disbanded after Player::RemoveFromGroup!
            pGroup = pPlayer->GetGroup();
            if (!pGroup)
                return;
            if (!pGroup->GetLFGGroupState()->IsBootActive())
                return;

            pGroup->GetLFGGroupState()->DecreaseKicksLeft();
            pGroup->GetLFGGroupState()->StopBoot();
            OfferContinue(pGroup);
            break;
        }
        case LFG_ANSWER_DENY:
            pGroup->GetLFGGroupState()->StopBoot();
            break;
        case LFG_ANSWER_PENDING:
            break;
        default:
            break;
    }
}

void LFGMgr::Teleport(Group* pGroup, bool out)
{
    if (!pGroup)
        return;

    DEBUG_LOG("LFGMgr::TeleportGroup %u in dungeon!", pGroup->GetObjectGuid().GetCounter());

    for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        if (Player* pGroupMember = itr->getSource())
        {
            if (pGroupMember->IsInWorld())
            {
                if (!pGroupMember->GetLFGPlayerState()->IsTeleported() && !out)
                    AddEvent(pGroupMember->GetObjectGuid(),LFG_EVENT_TELEPORT_PLAYER, LONG_LFG_DELAY, uint8(out));
                else if (out)
                    Teleport(pGroupMember, out);
            }
        }
    }
    if (pGroup->GetLFGGroupState()->GetState() == LFG_STATE_LFG
        || pGroup->GetLFGGroupState()->GetState() == LFG_STATE_LFR)
        pGroup->GetLFGGroupState()->SetState(LFG_STATE_DUNGEON);

    pGroup->SendUpdate();
}

void LFGMgr::Teleport(Player* pPlayer, bool out, bool fromOpcode /*= false*/)
{
    if (!pPlayer || pPlayer->IsInCombat())
        return;

    DEBUG_LOG("LFGMgr::TeleportPlayer: %u is being teleported %s", pPlayer->GetObjectGuid().GetCounter(), out ? "from dungeon." : "in dungeon.");

    if (out)
    {
        pPlayer->RemoveAurasDueToSpell(LFG_SPELL_LUCK_OF_THE_DRAW);
        pPlayer->TeleportToBGEntryPoint();
        return;
    }

    // TODO Add support for LFG_TELEPORTERROR_FATIGUE
    LFGTeleportError error = LFG_TELEPORTERROR_OK;

    Group* pGroup = pPlayer->GetGroup();

    if (!pGroup)
        error = LFG_TELEPORTERROR_UNK4;
    else if (!pPlayer->isAlive())
        error = LFG_TELEPORTERROR_PLAYER_DEAD;
    else if (pPlayer->IsFalling())
        error = LFG_TELEPORTERROR_FALLING;

    uint32 mapid = 0;
    float x = 0;
    float y = 0;
    float z = 0;
    float orientation = 0;
    Difficulty difficulty;

    LFGDungeonEntry const* dungeon = NULL;

    if (error == LFG_TELEPORTERROR_OK)
    {
        dungeon = pGroup->GetLFGGroupState()->GetDungeon();
        if (!dungeon)
        {
            error = LFG_TELEPORTERROR_INVALID_LOCATION;
            DEBUG_LOG("LFGMgr::TeleportPlayer %u error %u, no dungeon!", pPlayer->GetObjectGuid().GetCounter(), error);
        }
    }

    if (error == LFG_TELEPORTERROR_OK)
    {
        difficulty = Difficulty(dungeon->difficulty);
        bool leaderInDungeon = false;
        Player* leader = sObjectMgr.GetPlayer(pGroup->GetLeaderGuid());
        if (leader && pPlayer != leader && leader->GetMapId() == uint32(dungeon->map))
            leaderInDungeon = true;

        if (pGroup->GetDungeonDifficulty() != Difficulty(dungeon->difficulty))
        {
            error = LFG_TELEPORTERROR_UNK4;
            DEBUG_LOG("LFGMgr::TeleportPlayer %u error %u, difficulty not match!", pPlayer->GetObjectGuid().GetCounter(), error);
        }
        else if (GetPlayerLockStatus(pPlayer,dungeon) != LFG_LOCKSTATUS_OK)
        {
            error = LFG_TELEPORTERROR_INVALID_LOCATION;
            DEBUG_LOG("LFGMgr::TeleportPlayer %u error %u, player not enter to this instance!", pPlayer->GetObjectGuid().GetCounter(), error);
        }
        else if (leaderInDungeon && pGroup->GetLFGGroupState()->GetState() == LFG_STATE_DUNGEON)
        {
            mapid = leader->GetMapId();
            x = leader->GetPositionX();
            y = leader->GetPositionY();
            z = leader->GetPositionZ();
            orientation = leader->GetOrientation();
        }
        else if (AreaTrigger const* at = sObjectMgr.GetMapEntranceTrigger(dungeon->map))
        {
            mapid = at->target_mapId;
            x = at->target_X;
            y = at->target_Y;
            z = at->target_Z;
            orientation = at->target_Orientation;
        }
        else
        {
            error = LFG_TELEPORTERROR_INVALID_LOCATION;
            DEBUG_LOG("LFGMgr::TeleportPlayer %u error %u, no areatrigger to map %u!", pPlayer->GetObjectGuid().GetCounter(), error, dungeon->map);
        }
    }

    if (error == LFG_TELEPORTERROR_OK)
    {

        if (pPlayer->GetMap() && !pPlayer->GetMap()->IsDungeon() && !pPlayer->GetMap()->IsRaid() && !pPlayer->InBattleGround())
            pPlayer->SetBattleGroundEntryPoint(true);

        // stop taxi flight at port
        if (pPlayer->IsTaxiFlying())
            pPlayer->InterruptTaxiFlying();

        pPlayer->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);
        pPlayer->RemoveSpellsCausingAura(SPELL_AURA_FLY);

        DETAIL_LOG("LFGMgr: Sending %s to map %u, difficulty %u X %f, Y %f, Z %f, O %f", pPlayer->GetName(), uint8(difficulty), mapid, x, y, z, orientation);

        pPlayer->TeleportTo(mapid, x, y, z, orientation);
        pPlayer->GetLFGPlayerState()->SetState(LFG_STATE_DUNGEON);
        pPlayer->GetLFGPlayerState()->SetTeleported();
    }
    else
        pPlayer->GetSession()->SendLfgTeleportError(error);
}

void LFGMgr::CleanupRoleChecks(LFGType type)
{

    for (LFGQueue::const_iterator itr = m_groupQueue[type].begin(); itr != m_groupQueue[type].end(); ++itr)
    {
        ObjectGuid guid = (*itr)->guid;
        Group* pGroup = sObjectMgr.GetGroup(guid);
        if (!pGroup)
            continue;

        if (pGroup->GetLFGGroupState()->GetState() != LFG_STATE_ROLECHECK)
            continue;

        if (pGroup->GetLFGGroupState()->GetRoleCheckState() == LFG_ROLECHECK_FINISHED)
            continue;

        if (pGroup->GetLFGGroupState()->QueryRoleCheckTime())
            continue;

        pGroup->GetLFGGroupState()->SetRoleCheckState(LFG_ROLECHECK_MISSING_ROLE);

        for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            if (Player* pGroupMember = itr->getSource())
            {
                if (pGroupMember->IsInWorld())
                {
                    pGroupMember->GetSession()->SendLfgRoleCheckUpdate();
                    pGroupMember->GetSession()->SendLfgJoinResult(ERR_LFG_ROLE_CHECK_FAILED, LFG_ROLECHECK_MISSING_ROLE);
                }
            }
        }
        pGroup->GetLFGGroupState()->Clear();
        pGroup->GetLFGGroupState()->SetRoleCheckState(LFG_ROLECHECK_NONE);
        RemoveFromQueue(pGroup->GetObjectGuid());
    }

}

void LFGMgr::StartRoleCheck(Group* pGroup)
{
    if (!pGroup)
        return;

    pGroup->GetLFGGroupState()->StartRoleCheck();
    pGroup->GetLFGGroupState()->SetRoleCheckState(LFG_ROLECHECK_INITIALITING);
    pGroup->GetLFGGroupState()->SetState(LFG_STATE_ROLECHECK);

    for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        Player* pGroupMember = itr->getSource();
        if (pGroupMember && pGroupMember->IsInWorld())
        {
            if (pGroupMember->GetObjectGuid() != pGroup->GetLeaderGuid())
            {
                pGroupMember->GetLFGPlayerState()->SetRoles(LFG_ROLE_MASK_NONE);
                pGroupMember->GetLFGPlayerState()->SetState(LFG_STATE_ROLECHECK);
            }
            else
            {
                pGroupMember->GetLFGPlayerState()->AddRole(ROLE_LEADER);
                pGroupMember->GetLFGPlayerState()->SetState(LFG_STATE_QUEUED);
            }
            pGroupMember->GetSession()->SendLfgRoleCheckUpdate();
        }
    }
}

void LFGMgr::UpdateRoleCheck(Group* pGroup)
{
    if (!pGroup)
        return;

    if (pGroup->GetLFGGroupState()->GetState() != LFG_STATE_ROLECHECK)
        return;

    bool isFinished = true;
    for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        if (Player* pGroupMember = itr->getSource())
        {
            if (pGroupMember->IsInWorld())
            {
                if (pGroupMember->GetLFGPlayerState()->GetState() == LFG_STATE_QUEUED)
                    continue;

                LFGRoleCheckState newstate = LFG_ROLECHECK_NONE;

                if (uint8(pGroupMember->GetLFGPlayerState()->GetRoles()) < LFG_ROLE_MASK_TANK)
                    newstate = LFG_ROLECHECK_INITIALITING;
                else
                {
                    newstate = LFG_ROLECHECK_FINISHED;
                    pGroupMember->GetLFGPlayerState()->SetState(LFG_STATE_QUEUED);
                }

                if (newstate != LFG_ROLECHECK_FINISHED)
                    isFinished = false;
            }
        }
    }


    if (!isFinished)
        pGroup->GetLFGGroupState()->SetRoleCheckState(LFG_ROLECHECK_INITIALITING);
    else if (!CheckRoles(pGroup))
        pGroup->GetLFGGroupState()->SetRoleCheckState(LFG_ROLECHECK_WRONG_ROLES);
    else
        pGroup->GetLFGGroupState()->SetRoleCheckState(LFG_ROLECHECK_FINISHED);

    for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        if (Player* pGroupMember = itr->getSource())
        {
            if (pGroupMember->IsInWorld())
            {
                pGroupMember->GetSession()->SendLfgRoleCheckUpdate();
            }
        }
    }

    DEBUG_LOG("LFGMgr::UpdateRoleCheck group %u %s result %u", pGroup->GetObjectGuid().GetCounter(),isFinished ? "completed" : "not finished", pGroup->GetLFGGroupState()->GetRoleCheckState());

    // temporary - only all answer accept
    if (pGroup->GetLFGGroupState()->GetRoleCheckState() != LFG_ROLECHECK_FINISHED)
        return;

    for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        Player* pGroupMember = itr->getSource();

        if (pGroupMember && pGroupMember->IsInWorld())
        {
            pGroupMember->GetSession()->SendLfgRoleCheckUpdate();

            if (pGroup->GetLFGGroupState()->GetRoleCheckState() == LFG_ROLECHECK_FINISHED)
            {
                pGroupMember->GetLFGPlayerState()->SetJoined();
                pGroupMember->GetLFGPlayerState()->SetState(LFG_STATE_QUEUED);

                if (pGroupMember->GetObjectGuid() == pGroup->GetLeaderGuid())
                    pGroupMember->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_ADDED_TO_QUEUE, pGroup->GetLFGGroupState()->GetType());
                else
                {
//                    member->GetSession()->SendLfgJoinResult(ERR_LFG_OK, LFG_ROLECHECK_NONE, true);
                    pGroupMember->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_JOIN_PROPOSAL, pGroup->GetLFGGroupState()->GetType());
                }
            }
            else
            {
                pGroupMember->GetLFGPlayerState()->SetState(LFG_STATE_NONE);
                pGroupMember->GetSession()->SendLfgJoinResult(ERR_LFG_ROLE_CHECK_FAILED, LFG_ROLECHECK_MISSING_ROLE);
                pGroupMember->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_ROLECHECK_FAILED, pGroup->GetLFGGroupState()->GetType());
            }
        }
    }

    DEBUG_LOG("LFGMgr::UpdateRoleCheck finished, group %u result %u", pGroup->GetObjectGuid().GetCounter(), pGroup->GetLFGGroupState()->GetRoleCheckState());

    if (pGroup->GetLFGGroupState()->GetRoleCheckState() == LFG_ROLECHECK_FINISHED)
    {
        pGroup->GetLFGGroupState()->SetState(LFG_STATE_QUEUED);
    }
    else
    {
        RemoveFromQueue(pGroup->GetObjectGuid());
    }
}

bool LFGMgr::CheckRoles(Group* pGroup, Player* pPlayer /*=NULL*/)
{
    if (!pGroup)
        return false;

    if (pGroup->isRaidGroup())
        return true;


    LFGRolesMap rolesMap;

    for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        if (Player* pGroupMember = itr->getSource())
            if (pGroupMember->IsInWorld())
                rolesMap.insert(std::make_pair(pGroupMember->GetObjectGuid(), pGroupMember->GetLFGPlayerState()->GetRoles()));
    }

    if (pPlayer && pPlayer->IsInWorld())
        rolesMap.insert(std::make_pair(pPlayer->GetObjectGuid(), pPlayer->GetLFGPlayerState()->GetRoles()));

    bool retcode = CheckRoles(&rolesMap);

    return retcode;
}

bool LFGMgr::CheckRoles(LFGRolesMap* rolesMap)
{
    if (!rolesMap || rolesMap->empty())
        return false;

    if (rolesMap->size() > MAX_GROUP_SIZE)
        return false;

    uint8 tanks   = LFG_TANKS_NEEDED;
    uint8 healers = LFG_HEALERS_NEEDED;
    uint8 dps     = LFG_DPS_NEEDED;
    std::vector<LFGRoleMask> rolesVector;

    for (LFGRolesMap::const_iterator itr = rolesMap->begin(); itr != rolesMap->end(); ++itr)
        rolesVector.push_back(LFGRoleMask(itr->second & ~LFG_ROLE_MASK_LEADER));

    std::sort(rolesVector.begin(),rolesVector.end());

    for (std::vector<LFGRoleMask>::const_iterator itr = rolesVector.begin(); itr != rolesVector.end(); ++itr)
    {
        if ((*itr & LFG_ROLE_MASK_TANK) && tanks > 0)
            --tanks;
        else if ((*itr & LFG_ROLE_MASK_HEALER) && healers > 0)
            --healers;
        else if ((*itr & LFG_ROLE_MASK_DAMAGE) && dps > 0)
            --dps;
    }

    DEBUG_LOG("LFGMgr::CheckRoles healers %u tanks %u dps %u map size " SIZEFMTD, healers, tanks, dps, rolesMap->size());

//    if (sWorld.getConfig(CONFIG_BOOL_LFG_DEBUG_ENABLE))
//        return true;

    if ((healers + tanks + dps) > int8(MAX_GROUP_SIZE - rolesMap->size()))
        return false;

    return true;
}

bool LFGMgr::RoleChanged(Player* pPlayer, LFGRoleMask roles)
{
    uint8 oldRoles = pPlayer->GetLFGPlayerState()->GetRoles();
    pPlayer->GetLFGPlayerState()->SetRoles(roles);

    if (Group* pGroup = pPlayer->GetGroup())
    {
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* pGroupMember = itr->getSource();
            if (pGroupMember && pGroupMember->IsInWorld())
                pGroupMember->GetSession()->SendLfgRoleChosen(pPlayer->GetObjectGuid(), roles);
        }
    }
    else
        pPlayer->GetSession()->SendLfgRoleChosen(pPlayer->GetObjectGuid(), roles);

    if (oldRoles != pPlayer->GetLFGPlayerState()->GetRoles())
        return true;

    return false;
}

Player* LFGMgr::LeaderElection(GuidSet* playerGuids)
{
    std::set<Player*> leaders;
    Player* leader = NULL;
    uint32 GS = 0;

    for (GuidSet::const_iterator itr = playerGuids->begin(); itr != playerGuids->end(); ++itr)
    {
        Player* member  = sObjectMgr.GetPlayer(*itr);
        if (member && member->IsInWorld())
        {
            if (member->GetLFGPlayerState()->GetRoles() & LFG_ROLE_MASK_LEADER)
                leaders.insert(member);

            member->GetLFGPlayerState()->RemoveRole(ROLE_LEADER);

            if (member->GetEquipGearScore() > GS)
            {
                GS = member->GetEquipGearScore();
                leader = member;
            }
        }
    }

    GS = 0;
    if (!leaders.empty())
    {
        for (std::set<Player*>::const_iterator itr = leaders.begin(); itr != leaders.end(); ++itr)
        {
            if ((*itr)->GetEquipGearScore() > GS)
            {
                GS = (*itr)->GetEquipGearScore();
                leader = (*itr);
            }
        }
    }

    if (!leader)
    {
        for (GuidSet::const_iterator itr = playerGuids->begin(); itr != playerGuids->end(); ++itr)
        {
            Player* member  = sObjectMgr.GetPlayer(*itr);
            if (member && member->IsInWorld())
            {
                leader = member;
                break;
            }
        }
    }
    // leader may be NULL!
    return leader;
}

void LFGMgr::SetRoles(LFGRolesMap* rolesMap)
{
    if (!rolesMap || rolesMap->empty())
        return;
    DEBUG_LOG("LFGMgr::SetRoles set roles for rolesmap size = %u",uint8(rolesMap->size()));

    LFGRoleMask oldRoles;
    LFGRoleMask newRole;
    ObjectGuid  tankGuid;
    ObjectGuid  healGuid;

    LFGRolesMap tmpMap;

    // strip double/triple roles
    for (LFGRolesMap::iterator itr = rolesMap->begin(); itr != rolesMap->end(); ++itr)
    {
        if (itr->second & LFG_ROLE_MASK_TANK)
            tmpMap.insert(*itr);
    }

    if (tmpMap.size() == 1)
    {
        tankGuid = tmpMap.begin()->first;
        newRole    = LFGRoleMask(tmpMap.begin()->second & ~LFG_ROLE_MASK_HEALER_DAMAGE);
    }
    else
    {
        for (LFGRolesMap::iterator itr = tmpMap.begin(); itr != tmpMap.end(); ++itr)
        {
            tankGuid = itr->first;
            LFGRolesMap::iterator itr2 = rolesMap->find(tankGuid);
            oldRoles = itr2->second;
            newRole    = LFGRoleMask(itr->second & ~LFG_ROLE_MASK_HEALER_DAMAGE);

            itr2->second = LFGRoleMask(newRole);

            if (CheckRoles(rolesMap))
                break;
            else
                itr2->second = oldRoles;
        }
    }
    rolesMap->find(tankGuid)->second = newRole;
    tmpMap.clear();

    for (LFGRolesMap::iterator itr = rolesMap->begin(); itr != rolesMap->end(); ++itr)
    {
        if (itr->second & LFG_ROLE_MASK_HEALER)
            tmpMap.insert(*itr);
    }

    if (tmpMap.size() == 1)
    {
        healGuid = tmpMap.begin()->first;
        newRole    = LFGRoleMask(tmpMap.begin()->second & ~LFG_ROLE_MASK_TANK_DAMAGE);
    }
    else
    {
        for (LFGRolesMap::iterator itr = tmpMap.begin(); itr != tmpMap.end(); ++itr)
        {
            healGuid = itr->first;
            LFGRolesMap::iterator itr2 = rolesMap->find(healGuid);
            oldRoles = itr2->second;
            newRole    = LFGRoleMask(itr->second & ~LFG_ROLE_MASK_TANK_DAMAGE);

            itr2->second = LFGRoleMask(newRole);

            if (CheckRoles(rolesMap))
                break;
            else
                itr2->second = oldRoles;
        }
    }
    rolesMap->find(healGuid)->second = newRole;
    tmpMap.clear();

    for (LFGRolesMap::iterator itr = rolesMap->begin(); itr != rolesMap->end(); ++itr)
    {
        if (itr->first != tankGuid && itr->first != healGuid)
        {
            newRole      = LFGRoleMask(itr->second & ~LFG_ROLE_MASK_TANK_HEALER);
            itr->second  = LFGRoleMask(newRole);
        }
    }

    for (LFGRolesMap::iterator itr = rolesMap->begin(); itr != rolesMap->end(); ++itr)
    {
        Player* pPlayer = sObjectMgr.GetPlayer(itr->first);
        if (pPlayer && pPlayer->IsInWorld())
        {
            pPlayer->GetLFGPlayerState()->SetRoles(itr->second);
            DEBUG_LOG("LFGMgr::SetRoles role for player %u set to %u",pPlayer->GetObjectGuid().GetCounter(), uint8(itr->second));
        }
    }

}

void LFGMgr::SetGroupRoles(Group* pGroup, GuidSet* players)
{
    if (!pGroup)
        return;

    LFGRolesMap rolesMap;
    bool hasMultiRoles = false;

    for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        Player* pGroupMember = itr->getSource();
        if (pGroupMember && pGroupMember->IsInWorld())
        {
            rolesMap.insert(std::make_pair(pGroupMember->GetObjectGuid(), pGroupMember->GetLFGPlayerState()->GetRoles()));
            if (!pGroupMember->GetLFGPlayerState()->IsSingleRole())
                hasMultiRoles = true;
        }
    }

    if (players && !players->empty())
    {
        for (GuidSet::const_iterator itr = players->begin(); itr != players->end(); ++itr)
        {
            Player* pPlayer = sObjectMgr.GetPlayer(*itr);
            if (pPlayer && pPlayer->IsInWorld())
            {
                rolesMap.insert(std::make_pair(pPlayer->GetObjectGuid(), pPlayer->GetLFGPlayerState()->GetRoles()));
                if (!pPlayer->GetLFGPlayerState()->IsSingleRole())
                    hasMultiRoles = true;
            }
        }
    }

    if (!hasMultiRoles)
        return;

    SetRoles(&rolesMap);
}

void LFGMgr::TryCompleteGroups(LFGType type)
{

    if (m_groupQueue[type].empty())
        return;

    bool isGroupCompleted = false;  // we make only one group for iterations! not more!

    for (LFGQueue::iterator itr = m_groupQueue[type].begin(); itr != m_groupQueue[type].end(); ++itr )
    {
        Group* pGroup = sObjectMgr.GetGroup((*itr)->guid);
        if (!pGroup)
            continue;

//            DEBUG_LOG("LFGMgr:TryCompleteGroups: Try complete group %u  type %u state %u", group->GetObjectGuid().GetCounter(), type, group->GetLFGState()->GetState());
        if (pGroup->GetLFGGroupState()->GetState() != LFG_STATE_QUEUED
            && !(pGroup->GetLFGGroupState()->GetState() == LFG_STATE_QUEUED && pGroup->GetLFGGroupState()->GetStatus() == LFG_STATUS_NOT_SAVED))
            continue;

        if (IsGroupCompleted(pGroup))
        {
            DEBUG_LOG("LFGMgr:TryCompleteGroups: Try complete group %u  type %u, but his already completed!", pGroup->GetObjectGuid().GetCounter(), type);
            CompleteGroup(pGroup,NULL);
            isGroupCompleted = true;
            break;
        }
        GuidSet applicants;

        for (LFGQueue::iterator itr2 = m_playerQueue[type].begin(); itr2 != m_playerQueue[type].end(); ++itr2 )
        {
            Player* pPlayer = sObjectMgr.GetPlayer((*itr2)->guid);
            if (!pPlayer)
                continue;

            if (pPlayer->GetLFGPlayerState()->GetState() != LFG_STATE_QUEUED)
                continue;

//            DEBUG_LOG("LFGMgr:TryCompleteGroups: Try complete group %u with player %u, type %u state %u", group->GetObjectGuid().GetCounter(),player->GetObjectGuid().GetCounter(), type, group->GetLFGState()->GetState());

            switch (type)
            {
                case LFG_TYPE_DUNGEON:
                case LFG_TYPE_QUEST:
                case LFG_TYPE_ZONE:
                case LFG_TYPE_HEROIC_DUNGEON:
                case LFG_TYPE_RANDOM_DUNGEON:
                {
                    applicants.insert((*itr2)->guid);
                    if (TryAddMembersToGroup(pGroup,&applicants))
                    {
                        if (IsGroupCompleted(pGroup, applicants.size()))
                        {
                            CompleteGroup(pGroup,&applicants);
                            isGroupCompleted = true;
                        }
                    }
                    else
                        applicants.erase((*itr2)->guid);

                    break;
                }
                case LFG_TYPE_RAID:
                default:
                    break;
            }
            if (isGroupCompleted)
                break;
        }
        if (isGroupCompleted)
            break;
        applicants.clear();
    }
}

bool LFGMgr::TryAddMembersToGroup(Group* pGroup, GuidSet* players)
{
    if (!pGroup || players->empty())
        return false;

    LFGRolesMap rolesMap;
    LFGDungeonSet const* groupDungeons = pGroup->GetLFGGroupState()->GetDungeons();
    LFGDungeonSet intersection  = *groupDungeons;

    for (GuidSet::const_iterator itr = players->begin(); itr != players->end(); ++itr)
    {
        Player* pPlayer = sObjectMgr.GetPlayer(*itr);
        if (!pPlayer || !pPlayer->IsInWorld())
            return false;

        if (!CheckTeam(pGroup, pPlayer))
           return false;

        if (HasIgnoreState(pGroup, pPlayer->GetObjectGuid()))
           return false;
        /*
        if (LFGProposal* pProposal = group->GetLFGState()->GetProposal())
        {
            if (pProposal->IsDecliner(player->GetObjectGuid()))
               return false;
        }
        */
        if (!CheckRoles(pGroup, pPlayer))
           return false;

        rolesMap.insert(std::make_pair(pPlayer->GetObjectGuid(), pPlayer->GetLFGPlayerState()->GetRoles()));
        if (!CheckRoles(&rolesMap))
           return false;

        LFGDungeonSet const* playerDungeons = pPlayer->GetLFGPlayerState()->GetDungeons();
        LFGDungeonSet  tmpIntersection;
        std::set_intersection(intersection.begin(),intersection.end(), playerDungeons->begin(),playerDungeons->end(),std::inserter(tmpIntersection,tmpIntersection.end()));
        if (tmpIntersection.empty())
            return false;
        intersection = tmpIntersection;
    }
    return true;
}

void LFGMgr::CompleteGroup(Group* pGroup, GuidSet* players)
{

    DEBUG_LOG("LFGMgr:CompleteGroup: Try complete group %u with %lu players", pGroup->GetObjectGuid().GetCounter(), players ? players->size() : 0);

    LFGDungeonSet const* groupDungeons = pGroup->GetLFGGroupState()->GetDungeons();
    LFGDungeonSet  intersection  = *groupDungeons;
    if (players)
    {
        for (GuidSet::const_iterator itr = players->begin(); itr != players->end(); ++itr)
        {
            Player* pPlayer = sObjectMgr.GetPlayer(*itr);
            if (!pPlayer || !pPlayer->IsInWorld())
                return;

            LFGDungeonSet const* playerDungeons = pPlayer->GetLFGPlayerState()->GetDungeons();
            LFGDungeonSet  tmpIntersection;
            std::set_intersection(intersection.begin(),intersection.end(), playerDungeons->begin(),playerDungeons->end(),std::inserter(tmpIntersection,tmpIntersection.end()));
            intersection = tmpIntersection;
        }
    }

    if (intersection.empty())
    {
        DEBUG_LOG("LFGMgr:CompleteGroup: Try complete group %u but dungeon list is empty!", pGroup->GetObjectGuid().GetCounter());
        return;
    }

    SetGroupRoles(pGroup, players);
    LFGDungeonEntry const* dungeon = SelectRandomDungeonFromList(intersection);
    uint32 ID = CreateProposal(dungeon,pGroup,players);
    DEBUG_LOG("LFGMgr:CompleteGroup: dungeons for group %u with %lu players found, created proposal %u", pGroup->GetObjectGuid().GetCounter(), players ? players->size() : 0, ID);
}

bool LFGMgr::TryCreateGroup(LFGType type)
{
    bool groupCreated = false;
    for (LFGSearchMap::const_iterator itr = m_searchMatrix.begin(); itr != m_searchMatrix.end(); ++itr)
    {
        if (itr->first->type != type)
            continue;

        if (itr->second.empty())
            continue;

//        DEBUG_LOG("LFGMgr:TryCreateGroup: Try create group  with %u players", itr->second.size());

        if (!IsGroupCompleted(NULL,itr->second.size()))
            continue;

        LFGDungeonSet intersection;
        GuidSet newGroup;
        GuidSet const* applicants = &itr->second;
        for (GuidSet::const_iterator itr1 = applicants->begin(); itr1 != applicants->end(); ++itr1)
        {
            ObjectGuid guid = *itr1;
            bool checkPassed = true;
            LFGRolesMap rolesMap;
            for (GuidSet::const_iterator itr2 = newGroup.begin(); itr2 != newGroup.end(); ++itr2)
            {
                ObjectGuid guid2 = *itr2;
                if ( guid != guid2 && (!CheckTeam(guid, guid2) || HasIgnoreState(guid, guid2)))
                    checkPassed = false;
                else
                {
                    Player* pPlayer = sObjectMgr.GetPlayer(guid2);
                    if (pPlayer && pPlayer->IsInWorld())
                    {
                        rolesMap.insert(std::make_pair(pPlayer->GetObjectGuid(), pPlayer->GetLFGPlayerState()->GetRoles()));
                    }
                }
            }
            if (!checkPassed)
                continue;

            Player* player1 = sObjectMgr.GetPlayer(guid);
            if (player1 && player1->IsInWorld())
            {
                rolesMap.insert(std::make_pair(player1->GetObjectGuid(), player1->GetLFGPlayerState()->GetRoles()));

                if (!CheckRoles(&rolesMap))
                   continue;

                newGroup.insert(guid);
                if (newGroup.size() == 1)
                   intersection = *player1->GetLFGPlayerState()->GetDungeons();
                else
                {
                   LFGDungeonSet groupDungeons = intersection;
                   intersection.clear();
                   LFGDungeonSet const* playerDungeons = player1->GetLFGPlayerState()->GetDungeons();
                   std::set_intersection(groupDungeons.begin(),groupDungeons.end(), playerDungeons->begin(),playerDungeons->end(),std::inserter(intersection,intersection.end()));
                }

                if (IsGroupCompleted(NULL, newGroup.size()))
                   groupCreated = true;

                if (!groupCreated)
                   continue;

                SetRoles(&rolesMap);
                break;
            }
        }
        DEBUG_LOG("LFGMgr:TryCreateGroup: Try create group to dungeon %u from " SIZEFMTD " players. result is %u", itr->first->ID, itr->second.size(), uint8(groupCreated));
        if (groupCreated)
        {
            LFGDungeonEntry const* dungeon = SelectRandomDungeonFromList(intersection);
            CreateProposal(dungeon, NULL, &newGroup);
            return true;
        }
    }
    return false;
}

LFGQueueStatus* LFGMgr::GetDungeonQueueStatus(LFGType type)
{
    return &m_queueStatus[type];
}

void LFGMgr::UpdateQueueStatus(Player* pPlayer)
{
}

void LFGMgr::UpdateQueueStatus(Group* pGroup)
{
}

void LFGMgr::UpdateQueueStatus(LFGType type)
{
    if (m_playerQueue[type].empty() && m_groupQueue[type].empty())
        return;

    uint32 damagers = 0;
    uint64 damagersTime = 0;

    uint32 healers = 0;
    uint64 healersTime = 0;

    uint32 tanks = 0;
    uint64 tanksTime = 0;

    uint64 fullTime = 0;

    uint32 fullCount = 0;

    for (LFGQueueInfoMap::const_iterator itr = m_queueInfoMap.begin(); itr != m_queueInfoMap.end(); ++itr)
    {
        LFGQueueInfo pqInfo = itr->second;
        ObjectGuid guid = itr->first;       // Player or Group guid

        if (pqInfo.GetDungeonType() != type)
            continue;

        tanks += (LFG_TANKS_NEEDED - pqInfo.tanks);
        if (LFG_TANKS_NEEDED - pqInfo.tanks)
            tanksTime += uint64( time(NULL) - pqInfo.joinTime);
        healers  += (LFG_HEALERS_NEEDED - pqInfo.healers);
        if (LFG_HEALERS_NEEDED - pqInfo.healers)
            healersTime += uint64( time(NULL) - pqInfo.joinTime);
        damagers += (LFG_DPS_NEEDED - pqInfo.dps);
        if (LFG_DPS_NEEDED - pqInfo.dps)
            damagersTime += uint64( time(NULL) - pqInfo.joinTime);
        if (guid.IsGroup())
        {
            Group* pGroup = sObjectMgr.GetGroup(itr->first);
            if (pGroup)
            {
                fullTime  += uint64( time(NULL) - pqInfo.joinTime) * pGroup->GetMembersCount();
                fullCount += pGroup->GetMembersCount();
            }
        }
        else
        {
            fullTime  += uint64( time(NULL) - pqInfo.joinTime);
            fullCount +=1;
        }
    }

    LFGQueueStatus status = m_queueStatus[type];

    status.dps     = damagers;
    status.tanks   = tanks;
    status.healers = healers;

    status.waitTimeTanks  = tanks     ? time_t(tanksTime/tanks)       : 0;
    status.waitTimeHealer = healers   ? time_t(healersTime/healers)   : 0;
    status.waitTimeDps    = damagers  ? time_t(damagersTime/damagers) : 0;

    status.avgWaitTime    = fullCount ? time_t(fullTime/fullCount)    : 0;

}

void LFGMgr::SendStatistic(LFGType type)
{
    GuidSet fullSet = GetDungeonPlayerQueue(type);


    LFGQueueStatus* status = GetDungeonQueueStatus(type);

    for (GuidSet::iterator itr = fullSet.begin(); itr != fullSet.end(); ++itr)
    {
        ObjectGuid guid = *itr;
        if (guid.IsEmpty())
            continue;

        Player* pPlayer = sObjectMgr.GetPlayer(guid);

        if (!pPlayer || !pPlayer->IsInWorld())
            continue;

        uint8 statIndex = 0;
        if (!sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GROUP))
        {
            if (pPlayer->GetTeam() == HORDE)
                statIndex = 2;
            else if (pPlayer->GetTeam() == ALLIANCE)
                statIndex = 1;
        }

        LFGDungeonEntry const* dungeon = *pPlayer->GetLFGPlayerState()->GetDungeons()->begin();

        if (!dungeon)
            continue;
        pPlayer->GetSession()->SendLfgQueueStatus(dungeon, status);
    }

    GuidSet groupSet = GetDungeonGroupQueue(type);

    for (GuidSet::iterator itr = groupSet.begin(); itr != groupSet.end(); ++itr)
    {
        ObjectGuid guid = *itr;
        if (guid.IsEmpty())
            continue;

        Group* pGroup = sObjectMgr.GetGroup(guid);

        if (!pGroup)
            continue;

        LFGDungeonEntry const* dungeon = *pGroup->GetLFGGroupState()->GetDungeons()->begin();

        if (!dungeon)
            continue;
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* pGroupMember = itr->getSource();
            if (pGroupMember && pGroupMember->IsInWorld())
                pGroupMember->GetSession()->SendLfgQueueStatus(dungeon, status);
        }
    }
}

LFGQueueStatus* LFGMgr::GetOverallQueueStatus()
{
    return GetDungeonQueueStatus(LFG_TYPE_NONE);
}

void LFGMgr::AddToSearchMatrix(ObjectGuid guid, bool inBegin)
{
    if (!guid.IsPlayer())
        return;

    Player* pPlayer = sObjectMgr.GetPlayer(guid);
    if (!pPlayer)
        return;

    LFGDungeonSet const* dungeons = pPlayer->GetLFGPlayerState()->GetDungeons();

    DEBUG_LOG("LFGMgr::AddToSearchMatrix %u added, dungeons size " SIZEFMTD, guid.GetCounter(),dungeons->size());

    if (dungeons->empty())
        return;

    for (LFGDungeonSet::const_iterator itr = dungeons->begin(); itr != dungeons->end(); ++itr)
    {
        LFGDungeonEntry const* dungeon = *itr;

        if (!dungeon)
            continue;

        GuidSet* players = GetPlayersForDungeon(dungeon);
        if (!players || players->empty())
        {
            GuidSet _players;
            _players.insert(guid);
            WriteGuard Guard(GetLock());
            m_searchMatrix.insert(std::make_pair(dungeon,_players));
        }
        else
        {
            WriteGuard Guard(GetLock());
            players->insert((inBegin ? players->begin() : players->end()), guid);
        }
    }
}

void LFGMgr::RemoveFromSearchMatrix(ObjectGuid guid)
{
    if (!guid.IsPlayer())
        return;

    Player* pPlayer = sObjectMgr.GetPlayer(guid);
    if (!pPlayer)
        return;


    LFGDungeonSet const* dungeons = pPlayer->GetLFGPlayerState()->GetDungeons();

    DEBUG_LOG("LFGMgr::RemoveFromSearchMatrix %u removed, dungeons size " SIZEFMTD, guid.GetCounter(),dungeons->size());

    if (dungeons->empty())
        return;

    for (LFGDungeonSet::const_iterator itr = dungeons->begin(); itr != dungeons->end(); ++itr)
    {
        LFGDungeonEntry const* dungeon = *itr;

        if (!dungeon)
            continue;

        GuidSet* players = GetPlayersForDungeon(dungeon);
        if (players && !players->empty())
        {
            WriteGuard Guard(GetLock());
            GuidSet _players;
            players->erase(guid);
            if (players->empty())
                m_searchMatrix.erase(dungeon);
        }
    }
}

GuidSet* LFGMgr::GetPlayersForDungeon(LFGDungeonEntry const* dungeon)
{
    ReadGuard Guard(GetLock());
    LFGSearchMap::iterator itr = m_searchMatrix.find(dungeon);
    return itr != m_searchMatrix.end() ? &itr->second : NULL;
}

bool LFGMgr::IsInSearchFor(LFGDungeonEntry const* dungeon, ObjectGuid guid)
{
    GuidSet* players = GetPlayersForDungeon(dungeon);
    if (!dungeon)
        return false;

    if (players->find(guid) != players->end())
        return true;

    else return false;
}

void LFGMgr::CleanupSearchMatrix()
{
    for (LFGSearchMap::iterator itr = m_searchMatrix.begin(); itr != m_searchMatrix.end(); itr++)
    {
        GuidSet players = itr->second;
        for (GuidSet::iterator itr2 = players.begin(); itr2 != players.end(); ++itr2)
        {
            ObjectGuid guid = *itr2;
            if (guid.IsEmpty())
                continue;

            Player* pPlayer = sObjectMgr.GetPlayer(guid);

            if (!pPlayer || !pPlayer->IsInWorld())
            {
                WriteGuard Guard(GetLock());
                itr->second.erase(guid);
            }
        }
    }
}

bool LFGMgr::HasIgnoreState(ObjectGuid guid1, ObjectGuid guid2)
{
    Player* pPlayer = sObjectMgr.GetPlayer(guid1);
    if (!pPlayer || !pPlayer->IsInWorld())
        return false;

    if (pPlayer->GetSocial()->HasIgnore(guid2))
        return true;

    return false;
}

bool LFGMgr::HasIgnoreState(Group* pGroup, ObjectGuid guid)
{
    if (!pGroup)
        return false;

    for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        if (Player* pGroupMember = itr->getSource())
            if (HasIgnoreState(pGroupMember->GetObjectGuid(), guid))
                return true;
    }

    return false;
}

bool LFGMgr::CheckTeam(ObjectGuid guid1, ObjectGuid guid2)
{

    if (guid1.IsEmpty() || guid2.IsEmpty())
        return true;

    Player* pPlayer1 = sObjectMgr.GetPlayer(guid1);
    Player* pPlayer2 = sObjectMgr.GetPlayer(guid2);

    if (!pPlayer1 || !pPlayer2)
        return true;

    if (sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GROUP))
        return true;

    if (pPlayer1->GetTeam() == pPlayer2->GetTeam())
        return true;

    return false;
}

bool LFGMgr::CheckTeam(Group* pGroup, Player* pPlayer)
{
    if (!pGroup || !pPlayer)
        return true;

    if (sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GROUP))
        return true;

    Player* pLeader = sObjectMgr.GetPlayer(pGroup->GetLeaderGuid());
    if (pLeader)
    {
        if (pLeader->GetTeam() == pPlayer->GetTeam())
            return true;
    }

    return false;
}

LFGDungeonEntry const* LFGMgr::SelectRandomDungeonFromList(LFGDungeonSet dungeons)
{
    if (dungeons.empty())
    {
        DEBUG_LOG("LFGMgr::SelectRandomDungeonFromList cannot select dungeons from empty list!");
        return NULL;
    }

    if (dungeons.size() == 1)
        return *dungeons.begin();
    else
    {
        uint32 rand = urand(0, dungeons.size() - 1);
        uint32 _key = 0;
        for (LFGDungeonSet::const_iterator itr = dungeons.begin(); itr != dungeons.end(); ++itr)
        {
            LFGDungeonEntry const* dungeon = *itr;
            if (!dungeon)
                continue;
            if (_key == rand)
                return dungeon;
            else ++_key;
        }
    }
    return NULL;
}

void LFGMgr::UpdateLFRGroups()
{
    LFGType type = LFG_TYPE_RAID;

    LFGQueue tmpQueue = m_groupQueue[type];

    for (LFGQueue::const_iterator itr = tmpQueue.begin(); itr != tmpQueue.end(); ++itr)
    {
        ObjectGuid guid = (*itr)->guid;
        Group* pGroup = sObjectMgr.GetGroup(guid);
        if (!pGroup || !pGroup->isLFRGroup())
            continue;

        if (pGroup->GetLFGGroupState()->GetState() != LFG_STATE_LFR)
            continue;

        if (!IsGroupCompleted(pGroup))
            continue;

        if (!pGroup->GetLFGGroupState()->GetDungeon())
        {
            LFGDungeonEntry const* realdungeon = SelectRandomDungeonFromList(*pGroup->GetLFGGroupState()->GetDungeons());
            MANGOS_ASSERT(realdungeon);
            pGroup->GetLFGGroupState()->SetDungeon(realdungeon);
            DEBUG_LOG("LFGMgr::UpdateLFRGroup: %u set real dungeon to %u.", pGroup->GetObjectGuid().GetCounter(), realdungeon->ID);

            Player* leader = sObjectMgr.GetPlayer(pGroup->GetLeaderGuid());
            if (leader && leader->GetMapId() != uint32(realdungeon->map))
            {
                pGroup->SetDungeonDifficulty(Difficulty(realdungeon->difficulty));
                pGroup->GetLFGGroupState()->SetStatus(LFG_STATUS_NOT_SAVED);
                pGroup->SendUpdate();
            }
        }

        uint8 tpnum = 0;
        for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* pGroupMember = itr->getSource();
            if (pGroupMember && pGroupMember->IsInWorld())
            {
                if (pGroupMember->GetLFGPlayerState()->GetState() < LFG_STATE_DUNGEON)
                {
                    AddMemberToLFDGroup(pGroupMember->GetObjectGuid());
                    pGroupMember->GetLFGPlayerState()->SetState(LFG_STATE_DUNGEON);
                    ++tpnum;
                }
            }
        }
        if (tpnum)
            Teleport(pGroup, false);
        RemoveFromQueue(pGroup->GetObjectGuid());
    }
}

bool LFGMgr::IsGroupCompleted(Group* pGroup, uint8 uiAddMembers)
{
    if (!pGroup)
    {
        if (sWorld.getConfig(CONFIG_BOOL_LFG_DEBUG_ENABLE) && uiAddMembers > 2)
            return true;
        else if ( uiAddMembers >= MAX_GROUP_SIZE)
            return true;
        else
            return false;
    }

    if (sWorld.getConfig(CONFIG_BOOL_LFG_DEBUG_ENABLE) && (pGroup->GetMembersCount() + uiAddMembers > 2))
        return true;

    if (pGroup->isRaidGroup())
    {
        switch (pGroup->GetDifficulty(true))
        {
            case RAID_DIFFICULTY_10MAN_NORMAL:
            case RAID_DIFFICULTY_10MAN_HEROIC:
                if (pGroup->GetMembersCount() + uiAddMembers >= 10)
                    return true;
                break;
            case RAID_DIFFICULTY_25MAN_NORMAL:
            case RAID_DIFFICULTY_25MAN_HEROIC:
                if (pGroup->GetMembersCount() + uiAddMembers >= 25)
                    return true;
                break;
            default:
                return false;
                break;
        }
    }
    else if (pGroup->GetMembersCount() + uiAddMembers >= MAX_GROUP_SIZE)
        return true;

    return false;
}

void LFGMgr::AddMemberToLFDGroup(ObjectGuid guid)
{
    Player* pPlayer = sObjectMgr.GetPlayer(guid);

    if (!pPlayer || !pPlayer->IsInWorld())
        return;

    Group* pGroup = pPlayer->GetGroup();

    if (!pGroup)
        return;

    pGroup->SetGroupRoles(guid, pPlayer->GetLFGPlayerState()->GetRoles());
    RemoveFromQueue(pPlayer->GetObjectGuid());
    RemoveFromSearchMatrix(pPlayer->GetObjectGuid());

    pPlayer->GetLFGPlayerState()->SetState(pGroup->GetLFGGroupState()->GetState());
}

void LFGMgr::RemoveMemberFromLFDGroup(Group* pGroup, ObjectGuid guid)
{
    Player* pPlayer = sObjectMgr.GetPlayer(guid);

    if (!pPlayer || !pPlayer->IsInWorld())
        return;

    if (pPlayer->HasAura(LFG_SPELL_DUNGEON_COOLDOWN) && !sWorld.getConfig(CONFIG_BOOL_LFG_DEBUG_ENABLE))
        pPlayer->CastSpell(pPlayer,LFG_SPELL_DUNGEON_DESERTER,true);


    if (!pGroup || !pGroup->isLFDGroup())
    {
        pPlayer->GetLFGPlayerState()->Clear();
        return;
    }

    if (pPlayer->GetLFGPlayerState()->GetState() > LFG_STATE_QUEUED)
        Teleport(pPlayer, true);
    else if (pGroup && pGroup->GetLFGGroupState()->GetState() > LFG_STATE_QUEUED)
        Teleport(pPlayer, true);

    if (pGroup && pGroup->isLFGGroup() && pGroup->GetMembersCount() > 1)
    {
        if (pGroup->GetLFGGroupState()->GetState() > LFG_STATE_LFG
            && pGroup->GetLFGGroupState()->GetState() < LFG_STATE_FINISHED_DUNGEON)
        {
            OfferContinue(pGroup);
        }
    }

    Leave(pPlayer);
    pPlayer->GetLFGPlayerState()->Clear();
}

void LFGMgr::DungeonEncounterReached(Group* pGroup)
{
    if (!pGroup)
        return;

    for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        Player* pGroupMember = itr->getSource();
        if (pGroupMember && pGroupMember->IsInWorld())
        {
            if (pGroupMember->HasAura(LFG_SPELL_DUNGEON_COOLDOWN))
                pGroupMember->RemoveAurasDueToSpell(LFG_SPELL_DUNGEON_COOLDOWN);
        }
    }
}

void LFGMgr::SheduleEvent()
{
    if (m_eventList.empty())
        return;

    for (LFGEventList::iterator itr = m_eventList.begin(); itr != m_eventList.end(); ++itr)
    {
        // we run only one event for tick!!!
        if (!itr->IsActive())
            continue;
        else
        {
            DEBUG_LOG("LFGMgr::SheduleEvent guid %u type %u",itr->guid.GetCounter(), itr->type);
            switch (itr->type)
            {
                case LFG_EVENT_TELEPORT_PLAYER:
                    {
                        Player* pPlayer = sObjectMgr.GetPlayer(itr->guid);
                        if (pPlayer)
                            Teleport(pPlayer, bool(itr->eventParm));
                    }
                    break;
                case LFG_EVENT_TELEPORT_GROUP:
                    {
                        Group* pGroup = sObjectMgr.GetGroup(itr->guid);
                        if (pGroup)
                            Teleport(pGroup, bool(itr->eventParm));
                    }
                    break;
                case LFG_EVENT_NONE:
                default:
                    break;
            }
            m_eventList.erase(itr);
            break;
        }
    }
}

void LFGMgr::AddEvent(ObjectGuid guid, LFGEventType type, time_t delay, uint8 param)
{
    DEBUG_LOG("LFGMgr::AddEvent guid %u type %u",guid.GetCounter(), type);
    LFGEvent event = LFGEvent(type,guid,param);
    m_eventList.push_back(event);
    m_eventList.rbegin()->Start(delay);
}

void LFGMgr::LoadLFDGroupPropertiesForPlayer(Player* pPlayer)
{
    if (!pPlayer || !pPlayer->IsInWorld())
        return;

    Group* pGroup = pPlayer->GetGroup();
    if (!pGroup)
        return;

    pPlayer->GetLFGPlayerState()->SetRoles(pGroup->GetGroupRoles(pPlayer->GetObjectGuid()));
    if(sWorld.getConfig(CONFIG_BOOL_RESTRICTED_LFG_CHANNEL))
        pPlayer->JoinLFGChannel();

    switch (pGroup->GetLFGGroupState()->GetState())
    {
        case LFG_STATE_NONE:
        case LFG_STATE_FINISHED_DUNGEON:
        {
            pPlayer->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_JOIN_PROPOSAL, pGroup->GetLFGGroupState()->GetType());
            break;
        }
        case LFG_STATE_DUNGEON:
        {
            if (pGroup->GetLFGGroupState()->GetType() == LFG_TYPE_RAID)
                break;
            pPlayer->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_GROUP_FOUND, pGroup->GetLFGGroupState()->GetType());
            break;
        }
        default:
           break;
    }
}

void LFGMgr::OnPlayerEnterMap(Player* pPlayer, Map* pMap)
{
    if (!pPlayer || !pPlayer->IsInWorld() || !pMap)
        return;

    Group* pGroup = pPlayer->GetGroup();

    if (!pGroup || !pGroup->isLFDGroup())
        return;

    if (pMap->IsDungeon() && pGroup->isLFGGroup())
        pPlayer->CastSpell(pPlayer,LFG_SPELL_LUCK_OF_THE_DRAW,true);
    else if (pMap->IsRaid() && pGroup->isLFRGroup() && sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE))
        pPlayer->CastSpell(pPlayer,LFG_SPELL_LUCK_OF_THE_DRAW,true);
    else
        pPlayer->RemoveAurasDueToSpell(LFG_SPELL_LUCK_OF_THE_DRAW);
}

void LFGMgr::OnPlayerLeaveMap(Player* pPlayer, Map* pMap)
{
    if (!pPlayer || !pPlayer->IsInWorld() || !pMap)
        return;

    Group* pGroup = pPlayer->GetGroup();

    if (pPlayer->HasAura(LFG_SPELL_LUCK_OF_THE_DRAW))
    {
        if (!pGroup || !pGroup->isLFDGroup())
            pPlayer->RemoveAurasDueToSpell(LFG_SPELL_LUCK_OF_THE_DRAW);
    }
}

