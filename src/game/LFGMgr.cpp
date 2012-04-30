/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
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
    m_updateTimer  = LFG_UPDATE_INTERVAL;
    m_updateTimer2 = LFR_UPDATE_INTERVAL;
    m_updateTimer3 = LFG_QUEUEUPDATE_INTERVAL;
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

void LFGMgr::Update(uint32 diff)
{

    SheduleEvent();

    if (m_queueInfoMap.empty())
        return;

    bool isFullUpdate = false;
    bool isLFRUpdate  = false;
    bool isStatUpdate = false;

    if (m_updateTimer < diff)
    {
        isFullUpdate = true;
        m_updateTimer = LFG_UPDATE_INTERVAL;
    }
    else
        m_updateTimer -= diff;

    if (m_updateTimer2 < diff)
    {
        isLFRUpdate = true;
        m_updateTimer2 = LFR_UPDATE_INTERVAL;
    }
    else
        m_updateTimer2 -= diff;

    if (m_updateTimer3 < diff)
    {
        isStatUpdate = true;
        m_updateTimer3 = LFG_QUEUEUPDATE_INTERVAL;
    }
    else
        m_updateTimer3 -= diff;

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

    sLog.outString();
    sLog.outString(">> Loaded %u LFG dungeon rewards.", count);
}

LFGReward const* LFGMgr::GetRandomDungeonReward(LFGDungeonEntry const* dungeon, Player* player)
{
    LFGReward const* rew = NULL;
    if (player)
    {
        LFGRewardMapBounds bounds = m_RewardMap.equal_range(dungeon->ID);
        for (LFGRewardMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
        {
            // Difficulty check TODO
            rew = &itr->second;
            // ordered properly at loading
            if (itr->second.maxLevel >= player->getLevel())
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

void LFGMgr::Join(Player* player)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE) && !sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE))
        return;

    ObjectGuid guid = player->GetObjectGuid();;
    Group* group = player->GetGroup();

    if (group)
    {
        if (player->GetObjectGuid() != group->GetLeaderGuid() && group->GetLFGState()->GetStatus() != LFG_STATUS_OFFER_CONTINUE)
        {
            DEBUG_LOG("LFGMgr::Join: %u trying to join in group, but not group leader, and not in OfferContinue. Aborting.", guid.GetCounter());
            player->GetSession()->SendLfgJoinResult(ERR_LFG_NO_SLOTS_PLAYER);
            return;
        }
        else
            guid = group->GetObjectGuid();
    }

    if (guid.IsEmpty())
        return;

    LFGType type = player->GetLFGState()->GetType();

    if (type == LFG_TYPE_NONE)
    {
        DEBUG_LOG("LFGMgr::Join: %u trying to join without dungeon type. Aborting.", guid.GetCounter());
        player->GetSession()->SendLfgJoinResult(ERR_LFG_INVALID_SLOT);
        return;
    }

    LFGQueueInfo* queue = GetQueueInfo(guid);

    if (queue)
    {
        DEBUG_LOG("LFGMgr::Join: %u trying to join but is already in queue! May be OfferContinue?", guid.GetCounter());
        if (group && group->GetLFGState()->GetState() == LFG_STATE_DUNGEON)
        {
            RemoveFromQueue(guid);
        }
        else
        {
            player->GetSession()->SendLfgJoinResult(ERR_LFG_NO_LFG_OBJECT);
            RemoveFromQueue(guid);
            return;
        }
    }

    LFGJoinResult result = guid.IsGroup() ? GetGroupJoinResult(group) : GetPlayerJoinResult(player);

    if (result != ERR_LFG_OK)                              // Someone can't join. Clear all stuf
    {
        DEBUG_LOG("LFGMgr::Join: %s %u joining with %u members. result: %u", guid.IsGroup() ? "Group" : "Player", guid.GetCounter(), group ? group->GetMembersCount() : 1, result);
        player->GetLFGState()->Clear();
        player->GetSession()->SendLfgJoinResult(result);
        if (player->GetGroup())
            player->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_ROLECHECK_FAILED, type);
        return;
    }

    if (!guid.IsGroup() && player->GetLFGState()->GetRoles() == LFG_ROLE_MASK_NONE)
    {
        DEBUG_LOG("LFGMgr::Join:Error: %u has no roles! continued...", guid.GetCounter());
    }


    // Joining process
    player->GetLFGState()->SetJoined();

    if (guid.IsGroup())
    {
        switch (group->GetLFGState()->GetState())
        {
            case LFG_STATE_NONE:
            case LFG_STATE_FINISHED_DUNGEON:
            {
                RemoveFromQueue(guid);
                AddToQueue(guid, type, false);
                group->GetLFGState()->SetState((type == LFG_TYPE_RAID) ? LFG_STATE_LFR : LFG_STATE_LFG);
                group->GetLFGState()->SetStatus(LFG_STATUS_NOT_SAVED);

                for (GroupReference *itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
                {
                    Player* member = itr->getSource();
                    if (member && member->IsInWorld())
                    {
                        RemoveFromQueue(member->GetObjectGuid());
                        if(sWorld.getConfig(CONFIG_BOOL_RESTRICTED_LFG_CHANNEL))
                            member->JoinLFGChannel();
                        member->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_JOIN_PROPOSAL, type);
                        member->GetLFGState()->SetState((type == LFG_TYPE_RAID) ? LFG_STATE_LFR : LFG_STATE_LFG);
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
                    Player* member = itr->getSource();
                    if (member && member->IsInWorld())
                    {
                        if(sWorld.getConfig(CONFIG_BOOL_RESTRICTED_LFG_CHANNEL))
                            member->JoinLFGChannel();
                        member->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_JOIN_PROPOSAL, type);
                        member->GetLFGState()->SetState(LFG_STATE_LFG);
                    }
                }
                group->GetLFGState()->SetStatus(LFG_STATUS_NOT_SAVED);
                StartRoleCheck(group);
                break;
            }
            default:
                DEBUG_LOG("LFGMgr::Join:Error: group %u in impossible state %u for join.", guid.GetCounter(), group->GetLFGState()->GetState());
                return;
        }
    }
    else
    {
        RemoveFromQueue(guid);
        AddToQueue(guid, type, false);
        AddToSearchMatrix(guid);
        player->GetLFGState()->SetState((type == LFG_TYPE_RAID) ? LFG_STATE_LFR : LFG_STATE_QUEUED);
        player->GetSession()->SendLfgJoinResult(result, LFG_ROLECHECK_NONE);
        player->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_JOIN_PROPOSAL,type);
        player->GetSession()->SendLfgUpdateSearch(true);
    }
    player->GetSession()->SendLfgUpdateSearch(true);
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

void LFGMgr::Leave(Player* player)
{

    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE) && !sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE))
        return;

    ObjectGuid guid;
    Group* group = player->GetGroup();

    LFGType type;
    if (group)
    {
        if (player->GetObjectGuid() != group->GetLeaderGuid())
            return;
        else
            guid = group->GetObjectGuid();
    }
    else
        guid = player->GetObjectGuid();

    if (guid.IsEmpty())
        return;

    RemoveFromQueue(guid);
    RemoveFromSearchMatrix(guid);

    if (group)
    {
        if (group->GetLFGState()->GetState() == LFG_STATE_ROLECHECK)
        {
            group->GetLFGState()->SetRoleCheckState(LFG_ROLECHECK_ABORTED);
            for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
            {
                Player* member = itr->getSource();
                if (member && member->IsInWorld())
                {
                    member->GetSession()->SendLfgRoleCheckUpdate();
                }
            }
        }
        else if (group->GetLFGState()->GetState() == LFG_STATE_PROPOSAL)
        {
            LFGProposal* pProposal = group->GetLFGState()->GetProposal();
            if (pProposal)
                pProposal->SetDeleted();
        }

        type = group->GetLFGState()->GetType();
        for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* member = itr->getSource();
            if (member && member->IsInWorld())
            {
                    member->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_REMOVED_FROM_QUEUE, type);
                    RemoveFromQueue(member->GetObjectGuid());
                    RemoveFromSearchMatrix(member->GetObjectGuid());
                    if(sWorld.getConfig(CONFIG_BOOL_RESTRICTED_LFG_CHANNEL) && member->GetSession()->GetSecurity() == SEC_PLAYER )
                        member->LeaveLFGChannel();
                    member->GetLFGState()->Clear();
            }
        }
        group->GetLFGState()->Clear();
    }
    else
    {
        type = player->GetLFGState()->GetType();
        player->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_REMOVED_FROM_QUEUE, type);
        player->GetLFGState()->Clear();
        if(sWorld.getConfig(CONFIG_BOOL_RESTRICTED_LFG_CHANNEL) && player->GetSession()->GetSecurity() == SEC_PLAYER )
            player->LeaveLFGChannel();
    }
    player->GetSession()->SendLfgUpdateSearch(false);
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
    if (guid.IsEmpty())
        return;

    // Joining process

    LFGQueueInfo qInfo = LFGQueueInfo(guid, type);

    LFGQueueInfoMap::iterator queue = m_queueInfoMap.find(guid);

    if (queue == m_queueInfoMap.end())
    {
        WriteGuard Guard(GetLock());
        m_queueInfoMap.insert(std::make_pair(guid, qInfo));
    }
    else
    {
        WriteGuard Guard(GetLock());
        m_queueInfoMap.erase(guid);
        m_queueInfoMap.insert(std::make_pair(guid, qInfo));
    }

    LFGQueueInfo* pqInfo = GetQueueInfo(guid);
    MANGOS_ASSERT(pqInfo);

    pqInfo->tanks   = LFG_TANKS_NEEDED;
    pqInfo->healers = LFG_HEALERS_NEEDED ;
    pqInfo->dps     = LFG_DPS_NEEDED ;

    if (type !=  LFG_TYPE_NONE)
    {
        if (guid.IsGroup())
        {
            Group* group = sObjectMgr.GetGroup(guid);
            MANGOS_ASSERT(group);
            for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
            {
                Player* member = itr->getSource();
                if (member && member->IsInWorld())
                {
                    uint8 roles = member->GetLFGState()->GetRoles();
                    if (roles & LFG_ROLE_MASK_TANK && pqInfo->tanks > 0)
                        pqInfo->tanks -= 1;
                    else if (roles & LFG_ROLE_MASK_HEALER && pqInfo->healers > 0)
                        pqInfo->healers -= 1;
                    else if (roles & LFG_ROLE_MASK_DAMAGE && pqInfo->dps > 0)
                        pqInfo->dps -= 1;
                }
            }
            WriteGuard Guard(GetLock());
            m_groupQueue[type].insert((inBegin ? m_groupQueue[type].begin() : m_groupQueue[type].end()), pqInfo);
        }
        else
        {
            Player* player = sObjectMgr.GetPlayer(guid);
            MANGOS_ASSERT(player);

            uint8 roles = player->GetLFGState()->GetRoles();
            if (roles & LFG_ROLE_MASK_TANK && pqInfo->tanks > 0)
                pqInfo->tanks -= 1;
            else if (roles & LFG_ROLE_MASK_HEALER && pqInfo->healers > 0)
                pqInfo->healers -= 1;
            else if (roles & LFG_ROLE_MASK_DAMAGE && pqInfo->dps > 0)
                pqInfo->dps -= 1;

            WriteGuard Guard(GetLock());
            m_playerQueue[type].insert((inBegin ? m_playerQueue[type].begin() : m_playerQueue[type].end()), pqInfo);
        }
    }
    DEBUG_LOG("LFGMgr::AddToQueue: %s %u joined, type %u",(guid.IsGroup() ? "group" : "player"), guid.GetCounter(), type);
}

void LFGMgr::RemoveFromQueue(ObjectGuid guid)
{
    LFGQueueInfoMap::iterator queue = m_queueInfoMap.find(guid);
    if (queue != m_queueInfoMap.end())
    {
        LFGType type = queue->second.GetDungeonType();

        DEBUG_LOG("LFGMgr::RemoveFromQueue: %s %u removed, type %u",(guid.IsGroup() ? "group" : "player"), guid.GetCounter(), type);

        WriteGuard Guard(GetLock());
        if (type != LFG_TYPE_NONE)
        {
            if (guid.IsGroup())
            {
                if (m_groupQueue[type].find(&queue->second) != m_groupQueue[type].end())
                    m_groupQueue[type].erase(&queue->second);
            }
            else
            {
                if (m_playerQueue[type].find(&queue->second) != m_playerQueue[type].end())
                    m_playerQueue[type].erase(&queue->second);
            }
        }
        m_queueInfoMap.erase(guid);
    }
}

LFGJoinResult LFGMgr::GetPlayerJoinResult(Player* player)
{

   if (player->InBattleGround() || player->InArena() || player->InBattleGroundQueue())
        return ERR_LFG_CANT_USE_DUNGEONS;

   if (player->HasAura(LFG_SPELL_DUNGEON_DESERTER))
        return  ERR_LFG_DESERTER_PLAYER;

    if (player->HasAura(LFG_SPELL_DUNGEON_COOLDOWN)
        && (!player->GetGroup() || player->GetGroup()->GetLFGState()->GetStatus() != LFG_STATUS_OFFER_CONTINUE))
        return ERR_LFG_RANDOM_COOLDOWN_PLAYER;

    LFGDungeonSet const* dungeons = player->GetLFGState()->GetDungeons();


    if (player->GetPlayerbotMgr() || player->GetPlayerbotAI())
    {
        DEBUG_LOG("LFGMgr::Join: %u trying to join to dungeon finder, but has playerbots (or playerbot itself). Aborting.", player->GetObjectGuid().GetCounter());
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

    if (group->isRaidGroup() && group->GetLFGState()->GetType() != LFG_TYPE_RAID)
    {
        DEBUG_LOG("LFGMgr::Join: Group %u trying to join as raid, but not to raid finder. Aborting.", group->GetObjectGuid().GetCounter());
        return ERR_LFG_MISMATCHED_SLOTS;
    }

    for (GroupReference *itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        Player* player = itr->getSource();

        if (!player->IsInWorld())
            return ERR_LFG_MEMBERS_NOT_PRESENT;

        LFGJoinResult result = GetPlayerJoinResult(player);

        if (result == ERR_LFG_INVALID_SLOT)
            continue;

        if (result != ERR_LFG_OK)
            return result;
    }

    return ERR_LFG_OK;
}

LFGLockStatusMap LFGMgr::GetPlayerLockMap(Player* player)
{
    LFGLockStatusMap tmpMap;
    tmpMap.clear();

    if (!player)
        return tmpMap;

    for (uint32 i = 1; i < sLFGDungeonStore.GetNumRows(); ++i)
    {
        if (LFGDungeonEntry const* entry = sLFGDungeonStore.LookupEntry(i))
            if (LFGLockStatusType status = GetPlayerLockStatus(player, entry))
                if (status != LFG_LOCKSTATUS_OK)
                    tmpMap.insert(std::make_pair(entry,status));
    }

    return tmpMap;
}

LFGLockStatusType LFGMgr::GetPlayerLockStatus(Player* player, LFGDungeonEntry const* dungeon)
{
    if (!player || !player->IsInWorld())
        return LFG_LOCKSTATUS_RAID_LOCKED;

    bool isRandom = (player->GetLFGState()->GetType() == LFG_TYPE_RANDOM_DUNGEON);

    // check if player in this dungeon. not need other checks
    //
    if (player->GetGroup() && player->GetGroup()->isLFDGroup())
    {
        if (player->GetGroup()->GetLFGState()->GetDungeon())
        {
            if (player->GetGroup()->GetLFGState()->GetDungeon()->map == player->GetMapId())
                return LFG_LOCKSTATUS_OK;
            else if (player->GetGroup()->GetLFGState()->GetType() == LFG_TYPE_RANDOM_DUNGEON)
                isRandom = true;
        }
    }

    if (dungeon->expansion > player->GetSession()->Expansion())
        return LFG_LOCKSTATUS_INSUFFICIENT_EXPANSION;

    if (dungeon->difficulty > DUNGEON_DIFFICULTY_NORMAL
        && player->GetBoundInstance(dungeon->map, Difficulty(dungeon->difficulty)))
        return  LFG_LOCKSTATUS_RAID_LOCKED;

    if (dungeon->minlevel > player->getLevel())
        return  LFG_LOCKSTATUS_TOO_LOW_LEVEL;

    if (dungeon->maxlevel < player->getLevel())
        return LFG_LOCKSTATUS_TOO_HIGH_LEVEL;

    switch (player->GetAreaLockStatus(dungeon->map, Difficulty(dungeon->difficulty)))
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
            uint32 gs = player->GetEquipGearScore(true,true);

            if (at->minGS > 0 && gs < at->minGS)
                return LFG_LOCKSTATUS_TOO_LOW_GEAR_SCORE;
            else if (at->maxGS > 0 && gs > at->maxGS)
                return LFG_LOCKSTATUS_TOO_HIGH_GEAR_SCORE;
        }
        else
            return LFG_LOCKSTATUS_RAID_LOCKED;
    }

    if (InstancePlayerBind* bind = player->GetBoundInstance(dungeon->map, Difficulty(dungeon->difficulty)))
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

LFGLockStatusType LFGMgr::GetPlayerExpansionLockStatus(Player* player, LFGDungeonEntry const* dungeon)
{
    if (!player || !player->IsInWorld() || !dungeon)
        return LFG_LOCKSTATUS_RAID_LOCKED;

    uint32 randomEntry = 0;
    if (player->GetGroup() && player->GetGroup()->isLFDGroup())
    {
        if (player->GetGroup()->GetLFGState()->GetDungeon())
        {
            if (player->GetGroup()->GetLFGState()->GetType() == LFG_TYPE_RANDOM_DUNGEON)
                randomEntry = (*player->GetGroup()->GetLFGState()->GetDungeons()->begin())->ID;
        }
    }

    LFGDungeonExpansionEntry const* dungeonExpansion = NULL;

    for (uint32 i = 0; i < sLFGDungeonExpansionStore.GetNumRows(); ++i)
    {
        if (LFGDungeonExpansionEntry const* dungeonEx = sLFGDungeonExpansionStore.LookupEntry(i))
        {
            if (dungeonEx->dungeonID == dungeon->ID
                && dungeonEx->expansion == player->GetSession()->Expansion()
                && (randomEntry && randomEntry == dungeonEx->randomEntry))
                dungeonExpansion = dungeonEx;
        }
    }

    if (!dungeonExpansion)
        return LFG_LOCKSTATUS_OK;

    if (dungeonExpansion->minlevelHard > player->getLevel())
        return  LFG_LOCKSTATUS_TOO_LOW_LEVEL;

    if (dungeonExpansion->maxlevelHard < player->getLevel())
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
        Player* player = itr->getSource();

        LFGLockStatusType result = GetPlayerLockStatus(player, dungeon);

        if (result != LFG_LOCKSTATUS_OK)
            return result;
    }
    return LFG_LOCKSTATUS_OK;
}

LFGDungeonSet LFGMgr::GetRandomDungeonsForPlayer(Player* player)
{
    LFGDungeonSet list;

    for (uint32 i = 0; i < sLFGDungeonStore.GetNumRows(); ++i)
    {
        if (LFGDungeonEntry const* dungeon = sLFGDungeonStore.LookupEntry(i))
        {
            if (dungeon &&
                dungeon->type == LFG_TYPE_RANDOM_DUNGEON &&
                GetPlayerLockStatus(player, dungeon) == LFG_LOCKSTATUS_OK)
                list.insert(dungeon);
        }
    }
    return list;
}

LFGDungeonSet LFGMgr::ExpandRandomDungeonsForGroup(LFGDungeonEntry const* randomDungeon, LFGQueueSet playerGuids)
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
                for (LFGQueueSet::const_iterator itr =  playerGuids.begin(); itr !=  playerGuids.end(); ++itr)
                {
                    Player* player = sObjectMgr.GetPlayer(*itr);

                    // Additional checks for expansion there!

                    if (!dungeonEx || GetPlayerLockStatus(player, dungeonEx) != LFG_LOCKSTATUS_OK)
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

void LFGMgr::ClearLFRList(Player* player)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE) && !sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE))
        return;

    if (!player)
        return;

    LFGDungeonSet dungeons;
    dungeons.clear();
    player->GetLFGState()->SetDungeons(&dungeons);
    DEBUG_LOG("LFGMgr::LFR List cleared, player %u leaving LFG queue", player->GetObjectGuid().GetCounter());
    RemoveFromQueue(player->GetObjectGuid());

}

LFGQueueSet LFGMgr::GetDungeonPlayerQueue(LFGDungeonEntry const* dungeon, Team team)
{
    LFGQueueSet tmpSet;

    if (!dungeon)
        return tmpSet;

    LFGQueueSet* players = GetSearchVector(dungeon);
    if (!players || players->empty())
        return tmpSet;

    for (LFGQueueSet::const_iterator itr = players->begin(); itr != players->end(); ++itr)
    {
        ObjectGuid guid = (*itr);
        Player* player = sObjectMgr.GetPlayer(guid);
        if (!player)
            continue;

        if (team && player->GetTeam() != team)
            continue;

        if (player->GetLFGState()->GetState() < LFG_STATE_LFR ||
            player->GetLFGState()->GetState() > LFG_STATE_PROPOSAL)
            continue;

        tmpSet.insert(guid);
    }
    return tmpSet;
}

LFGQueueSet LFGMgr::GetDungeonPlayerQueue(LFGType type)
{
    ReadGuard Guard(GetLock());
    LFGQueueSet tmpSet;

    for (LFGQueue::const_iterator itr = m_playerQueue[type].begin(); itr != m_playerQueue[type].end(); ++itr)
    {
        ObjectGuid guid = (*itr)->guid;
        Player* player = sObjectMgr.GetPlayer(guid);
        if (!player)
            continue;

        if (player->GetLFGState()->GetState() < LFG_STATE_LFR ||
            player->GetLFGState()->GetState() > LFG_STATE_PROPOSAL)
            continue;

        tmpSet.insert(guid);
    }
    return tmpSet;
}

LFGQueueSet LFGMgr::GetDungeonGroupQueue(LFGType type)
{
    ReadGuard Guard(GetLock());
    LFGQueueSet tmpSet;

    for (LFGQueue::const_iterator itr = m_groupQueue[type].begin(); itr != m_groupQueue[type].end(); ++itr)
    {
        ObjectGuid guid = (*itr)->guid;
        Group* group = sObjectMgr.GetGroup(guid);
        if (!group)
            continue;

        if (group->GetLFGState()->GetState() < LFG_STATE_LFR ||
            group->GetLFGState()->GetState() > LFG_STATE_PROPOSAL)
            continue;

        tmpSet.insert(guid);
    }
    return tmpSet;
}

LFGQueueSet LFGMgr::GetDungeonGroupQueue(LFGDungeonEntry const* dungeon, Team team)
{
    LFGQueueSet tmpSet;
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
            Group* group = sObjectMgr.GetGroup(guid);
            if (!group)
                continue;

            if (group->GetLFGState()->GetState() < LFG_STATE_LFR ||
                group->GetLFGState()->GetState() > LFG_STATE_PROPOSAL)
                continue;

            Player* player = sObjectMgr.GetPlayer(group->GetLeaderGuid());
            if (!player)
                continue;

            if (team && player->GetTeam() != team)
                continue;

            if (group->GetLFGState()->GetDungeons()->find(dungeon) == group->GetLFGState()->GetDungeons()->end())
                continue;

            tmpSet.insert(guid);
        }
    }
    return tmpSet;
}

void LFGMgr::SendLFGRewards(Group* group)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE) && !sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE))
        return;

    if (!group || !group->isLFGGroup())
    {
        DEBUG_LOG("LFGMgr::SendLFGReward: not group or not a LFGGroup. Ignoring");
        return;
    }

    if (group->GetLFGState()->GetState() == LFG_STATE_FINISHED_DUNGEON)
    {
        DEBUG_LOG("LFGMgr::SendLFGReward: group %u already rewarded!",group->GetObjectGuid().GetCounter());
        return;
    }

    group->GetLFGState()->SetState(LFG_STATE_FINISHED_DUNGEON);
    group->GetLFGState()->SetStatus(LFG_STATUS_SAVED);

    LFGDungeonEntry const* dungeon = *group->GetLFGState()->GetDungeons()->begin();
    LFGDungeonEntry const* realdungeon = group->GetLFGState()->GetDungeon();

    if (!dungeon)
    {
        DEBUG_LOG("LFGMgr::SendLFGReward: group %u - no dungeon in list", group->GetObjectGuid().GetCounter());
        return;
    }
    else  if (dungeon->type != LFG_TYPE_RANDOM_DUNGEON)
    {
        DEBUG_LOG("LFGMgr::SendLFGReward: group %u dungeon %u is not random (%u)", group->GetObjectGuid().GetCounter(), dungeon->ID, dungeon->type);
        return;
    }

    for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        if (Player* member = itr->getSource())
            if (member->IsInWorld())
            {
                LFGDungeonSet dungeons;
                dungeons.clear();
                dungeons.insert(realdungeon);
                member->GetLFGState()->SetDungeons(&dungeons);
                SendLFGReward(member, dungeon);
            }
    }
}

void LFGMgr::SendLFGReward(Player* player, LFGDungeonEntry const* dungeon)
{
    if (!player || !dungeon)
        return;


    if (player->GetLFGState()->GetState() == LFG_STATE_FINISHED_DUNGEON)
    {
        DEBUG_LOG("LFGMgr::SendLFGReward: player %u already rewarded!",player->GetObjectGuid().GetCounter());
        return;
    }

    // Update achievements
    if (dungeon->difficulty == DUNGEON_DIFFICULTY_HEROIC)
    {
        if (Group* group = player->GetGroup())
            if (group->GetLFGState()->GetRandomPlayersCount())
                player->GetAchievementMgr().UpdateAchievementCriteria(ACHIEVEMENT_CRITERIA_TYPE_USE_LFD_TO_GROUP_WITH_PLAYERS, group->GetLFGState()->GetRandomPlayersCount());
    }

    player->GetLFGState()->SetState(LFG_STATE_FINISHED_DUNGEON);

    LFGReward const* reward = GetRandomDungeonReward(dungeon, player);

    if (!reward)
        return;

    uint8 index = 0;

    // if we can take the quest, means that we haven't done this kind of "run", IE: First Heroic Random of Day.
    Quest const* pQuest = sObjectMgr.GetQuestTemplate(reward->reward[0].questId);

    if (!player->CanTakeQuest(pQuest, false))
        index = 1;

    Quest const* qReward = sObjectMgr.GetQuestTemplate(reward->reward[index].questId);

    if (!qReward)
    {
        sLog.outError("LFGMgr::RewardDungeonDone quest %u is absent in DB.", reward->reward[index].questId);
        return;
    }

    // we give reward without informing client (retail does this)
    player->RewardQuest(qReward,0,NULL,false);

    // Give rewards
    DEBUG_LOG("LFGMgr::RewardDungeonDoneFor: %u done dungeon %u, %s previously done.", player->GetObjectGuid().GetCounter(), dungeon->ID, index > 0 ? " " : " not");
    player->GetSession()->SendLfgPlayerReward(dungeon, reward, qReward, index != 0);
}

uint32 LFGMgr::CreateProposal(LFGDungeonEntry const* dungeon, Group* group, LFGQueueSet* guids)
{
    if (!dungeon)
        return false;

    uint32 ID = 0;
    if (group)
    {
        if (LFGProposal* pProposal = group->GetLFGState()->GetProposal())
        {
            ID = pProposal->ID;
        }
    }

    LFGProposal proposal = LFGProposal(dungeon);
    proposal.SetState(LFG_PROPOSAL_INITIATING);
    proposal.SetGroup(group);
    if (ID)
    {
        WriteGuard Guard(GetLock());
        m_proposalMap.erase(ID);
        proposal.ID = ID;
        m_proposalMap.insert(std::make_pair(ID, proposal));
    }
    else
    {
        WriteGuard Guard(GetLock());
        ID = GenerateProposalID();
        proposal.ID = ID;
        m_proposalMap.insert(std::make_pair(ID, proposal));
    }

    LFGProposal* pProposal = GetProposal(ID);
    MANGOS_ASSERT(pProposal);
    pProposal->Start();

    if (group)
    {
        group->GetLFGState()->SetProposal(GetProposal(ID));
        group->GetLFGState()->SetState(LFG_STATE_PROPOSAL);
        for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* member = itr->getSource();
            if (member && member->IsInWorld())
            {
                member->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_PROPOSAL_BEGIN, LFGType(dungeon->type));
                member->GetSession()->SendLfgUpdateProposal(GetProposal(ID));
                member->GetLFGState()->SetState(LFG_STATE_PROPOSAL);
                member->GetLFGState()->SetAnswer(LFG_ANSWER_PENDING);
            }
        }
        if (guids && !guids->empty())
            group->GetLFGState()->SetRandomPlayersCount(uint8(guids->size()));
    }
    if (guids && !guids->empty())
    {
        for (LFGQueueSet::const_iterator itr2 = guids->begin(); itr2 != guids->end(); ++itr2 )
        {
            if (!SendProposal(ID,*itr2))
                DEBUG_LOG("LFGMgr::CreateProposal: cannot send proposal %u, dungeon %u, %s to player %u", ID, dungeon->ID, group ? " in group" : " not in group", (*itr2).GetCounter());
        }
    }
    DEBUG_LOG("LFGMgr::CreateProposal: %u, dungeon %u, %s", ID, dungeon->ID, group ? " in group" : " not in group");
    return ID;
}

bool LFGMgr::SendProposal(uint32 ID, ObjectGuid guid)
{
    if (guid.IsEmpty() || !ID)
        return false;

    LFGProposal* pProposal = GetProposal(ID);

    Player* player = sObjectMgr.GetPlayer(guid);

    if (!pProposal || !player)
        return false;

    pProposal->AddMember(guid);
    pProposal->Start();
    player->GetLFGState()->SetState(LFG_STATE_PROPOSAL);
    player->GetLFGState()->SetAnswer(LFG_ANSWER_PENDING);
    player->GetLFGState()->SetProposal(pProposal);
    RemoveFromSearchMatrix(guid);
    if (player->GetGroup())
        player->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_PROPOSAL_BEGIN, LFGType(pProposal->GetDungeon()->type));
    else
    {
        player->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_GROUP_FOUND, LFGType(pProposal->GetDungeon()->type));
        player->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_PROPOSAL_BEGIN, LFGType(pProposal->GetDungeon()->type));
    }

    player->GetSession()->SendLfgUpdateProposal(pProposal);

    if (pProposal->GetGroup())
    {
        pProposal->GetGroup()->GetLFGState()->SetState(LFG_STATE_PROPOSAL);
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

    Player* _player = sObjectMgr.GetPlayer(guid);
    if (!_player)
        return;

    // check player in proposal
    if (!pProposal->IsMember(guid) && pProposal->GetGroup() && (pProposal->GetGroup() != _player->GetGroup()) )
        return;

    _player->GetLFGState()->SetAnswer(LFGAnswer(accept));

    // Remove member that didn't accept
    if (accept == LFG_ANSWER_DENY)
    {
        if (!sWorld.getConfig(CONFIG_BOOL_LFG_DEBUG_ENABLE))
            _player->CastSpell(_player,LFG_SPELL_DUNGEON_COOLDOWN,true);
        RemoveProposal(_player, ID);
        return;
    }

    // check if all have answered and reorder players (leader first)
    bool allAnswered = true;
    LFGQueueSet const proposalGuids = pProposal->GetMembers();
    for (LFGQueueSet::const_iterator itr = proposalGuids.begin(); itr != proposalGuids.end(); ++itr )
    {
        Player* player = sObjectMgr.GetPlayer(*itr);
        if(player && player->IsInWorld())
        {
            if (player->GetLFGState()->GetAnswer() != LFG_ANSWER_AGREE)   // No answer (-1) or not accepted (0)
                allAnswered = false;
            player->GetSession()->SendLfgUpdateProposal(pProposal);
        }
    }

    if (Group* group = pProposal->GetGroup())
    {
        for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* member = itr->getSource();
            if(member && member->IsInWorld())
            {
                if (member->GetLFGState()->GetAnswer() != LFG_ANSWER_AGREE)   // No answer (-1) or not accepted (0)
                    allAnswered = false;
                member->GetSession()->SendLfgUpdateProposal(pProposal);
            }
        }
    }

    if (!allAnswered)
        return;

    DEBUG_LOG("LFGMgr::UpdateProposal: all players in proposal %u answered, make group/teleport group", pProposal->ID);
    // save waittime (group maked, save statistic)

    // Set the real dungeon (for random) or set old dungeon if OfferContinue

    LFGDungeonEntry const* realdungeon = NULL;
    MANGOS_ASSERT(pProposal->GetDungeon());

    // Create a new group (if needed)
    Group* group = pProposal->GetGroup();

    if (group && group->GetLFGState()->GetDungeon())
        realdungeon = group->GetLFGState()->GetDungeon();
    else
    {
        if (IsRandomDungeon(pProposal->GetDungeon()))
        {
            LFGQueueSet tmpSet;
            if (group)
            {
                for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
                    if (Player* player = itr->getSource())
                        if (player->IsInWorld())
                            tmpSet.insert(player->GetObjectGuid());
            }

            LFGQueueSet const proposalGuids = pProposal->GetMembers();
            for (LFGQueueSet::const_iterator itr = proposalGuids.begin(); itr != proposalGuids.end(); ++itr )
            {
                 Player* player = sObjectMgr.GetPlayer(*itr);
                    if (player && player->IsInWorld())
                        tmpSet.insert(player->GetObjectGuid());
            }

            LFGDungeonSet randomList = ExpandRandomDungeonsForGroup(pProposal->GetDungeon(), tmpSet);
            realdungeon = SelectRandomDungeonFromList(randomList);
            if (!realdungeon)
            {
                DEBUG_LOG("LFGMgr::UpdateProposal:%u cannot set real dungeon! no compatible list.", pProposal->ID);
                pProposal->SetDeleted();
                return;
            }
        }
        else
            realdungeon = pProposal->GetDungeon();
    }

    if (!group)
    {
        LFGQueueSet proposalGuidsTmp = pProposal->GetMembers();
        if (proposalGuidsTmp.empty())
        {
            DEBUG_LOG("LFGMgr::UpdateProposal:%u cannot make group, guid set is empty!", pProposal->ID);
            pProposal->SetDeleted();
            return;
        }
        Player* leader = LeaderElection(&proposalGuidsTmp);
        if (!leader)
        {
            DEBUG_LOG("LFGMgr::UpdateProposal:%u cannot make group, cannot set leader!", pProposal->ID);
            pProposal->SetDeleted();
            return;
        }

        if (leader->GetGroup())
            leader->RemoveFromGroup();

        leader->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_GROUP_FOUND, leader->GetLFGState()->GetType());
        leader->GetLFGState()->AddRole(ROLE_LEADER);

        group = new Group();
        group->Create(leader->GetObjectGuid(), leader->GetName());
        group->ConvertToLFG(pProposal->GetType());
        sObjectMgr.AddGroup(group);

        // LFG settings
        group->GetLFGState()->SetProposal(pProposal);
        group->GetLFGState()->SetState(LFG_STATE_PROPOSAL);
        group->GetLFGState()->AddDungeon(pProposal->GetDungeon());
        group->GetLFGState()->SetDungeon(realdungeon);

        // Special case to add leader to LFD group:
        AddMemberToLFDGroup(leader->GetObjectGuid());
        pProposal->RemoveMember(leader->GetObjectGuid());
        leader->GetLFGState()->SetProposal(NULL);
        DEBUG_LOG("LFGMgr::UpdateProposal: in proposal %u created group %u", pProposal->ID, group->GetObjectGuid().GetCounter());
    }
    else
    {
        group->GetLFGState()->SetDungeon(realdungeon);
        if (!group->isLFGGroup())
        {
            group->ConvertToLFG(pProposal->GetType());
            for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
            {
                if (Player* member = itr->getSource())
                {
                    if (member->IsInWorld())
                    {
                        AddMemberToLFDGroup(member->GetObjectGuid());
                        member->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_GROUP_FOUND, group->GetLFGState()->GetType());
                        if (!sWorld.getConfig(CONFIG_BOOL_LFG_DEBUG_ENABLE))
                            member->CastSpell(member,LFG_SPELL_DUNGEON_COOLDOWN,true);
                    }
                }
            }
        }
    }

    MANGOS_ASSERT(group);
    pProposal->SetGroup(group);
    group->SendUpdate();

    // move players from proposal to group
    for (LFGQueueSet::const_iterator itr = proposalGuids.begin(); itr != proposalGuids.end(); ++itr)
    {
        Player* player = sObjectMgr.GetPlayer(*itr);
        if (player && player->IsInWorld() && player->GetMap())
        {
            if (player->GetGroup() && player->GetGroup() != group)
            {
                player->RemoveFromGroup();
                player->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_GROUP_FOUND, player->GetLFGState()->GetType());
            }
            else if (player->GetGroup() && player->GetGroup() == group)
            {
                    player->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_GROUP_FOUND, player->GetLFGState()->GetType());
            }
            else
            {
                player->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_GROUP_FOUND, player->GetLFGState()->GetType());
            }

            group->AddMember(player->GetObjectGuid(), player->GetName());
            pProposal->RemoveMember(*itr);
//            player->GetSession()->SendLfgUpdateProposal(pProposal);
            player->GetLFGState()->SetProposal(NULL);
            if (!sWorld.getConfig(CONFIG_BOOL_LFG_DEBUG_ENABLE))
                player->CastSpell(player,LFG_SPELL_DUNGEON_COOLDOWN,true);
        }
        else
        {
            pProposal->RemoveMember(*itr);
        }
    }

    // Update statistics for dungeon/roles/etc

    MANGOS_ASSERT(group->GetLFGState()->GetDungeon());
    group->SetDungeonDifficulty(Difficulty(group->GetLFGState()->GetDungeon()->difficulty));
    group->GetLFGState()->SetStatus(LFG_STATUS_NOT_SAVED);
    group->SendUpdate();

    // Teleport group
    //    Teleport(group, false);
    AddEvent(group->GetObjectGuid(),LFG_EVENT_TELEPORT_GROUP);

    RemoveProposal(ID, true);
    group->GetLFGState()->SetState(LFG_STATE_DUNGEON);
    RemoveFromQueue(group->GetObjectGuid());
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

    if (Group* group = pProposal->GetGroup())
    {
        for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
            if (Player* member = itr->getSource())
                if (member->IsInWorld())
                    member->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_PROPOSAL_DECLINED, LFGType(pProposal->GetDungeon()->type));
    }

    {
        LFGQueueSet const playersSet = pProposal->GetMembers();
        if (!playersSet.empty())
        {
            for (LFGQueueSet::const_iterator itr = playersSet.begin(); itr != playersSet.end(); ++itr)
            {
                ObjectGuid guid = *itr;

                if (guid.IsEmpty())
                    continue;

                if (Player* player = sObjectMgr.GetPlayer(guid))
                    player->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_PROPOSAL_DECLINED, LFGType(pProposal->GetDungeon()->type));
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
        LFGQueueSet const proposalGuids = pProposal->GetMembers();
        for (LFGQueueSet::const_iterator itr2 = proposalGuids.begin(); itr2 != proposalGuids.end(); ++itr2 )
        {
            if (Player* player = sObjectMgr.GetPlayer(*itr2))
            {
                player->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_PROPOSAL_FAILED, LFGType(pProposal->GetDungeon()->type));
                player->GetLFGState()->SetProposal(NULL);

                // re-adding players to queue. decliner already removed
                if (player->GetLFGState()->GetAnswer() == LFG_ANSWER_AGREE)
                {
                    player->RemoveAurasDueToSpell(LFG_SPELL_DUNGEON_COOLDOWN);
                    AddToQueue(player->GetObjectGuid(),LFGType(pProposal->GetDungeon()->type), true);
                    player->GetLFGState()->SetState(LFG_STATE_QUEUED);
                    player->GetSession()->SendLfgJoinResult(ERR_LFG_OK, LFG_ROLECHECK_NONE);
                    player->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_JOIN_PROPOSAL, LFGType(pProposal->GetDungeon()->type));
                    player->GetSession()->SendLfgUpdateSearch(true);
//                    player->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_ADDED_TO_QUEUE, LFGType(pProposal->GetDungeon()->type));
                    DEBUG_LOG("LFGMgr::RemoveProposal: %u re-adding to queue", player->GetObjectGuid().GetCounter());
                }
                else
                    RemoveFromQueue(player->GetObjectGuid());
            }
        }

        if (Group* group = pProposal->GetGroup())
        {
            // re-adding to queue (only client! in server we are in queue)
            group->GetLFGState()->SetProposal(NULL);
            group->GetLFGState()->SetState(LFG_STATE_QUEUED);
            if (GetQueueInfo(group->GetObjectGuid()))
            {
                DEBUG_LOG("LFGMgr::RemoveProposal: standart way - group %u re-adding to queue.", group->GetObjectGuid().GetCounter());
            }
            else
            {
                // re-adding group to queue. dont must call, but who know...
                AddToQueue(group->GetObjectGuid(),LFGType(pProposal->GetDungeon()->type), true);
                DEBUG_LOG("LFGMgr::RemoveProposal: ERROR! group %u re-adding to queue not standart way.", group->GetObjectGuid().GetCounter());
            }

            for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
            {
                if (Player* member = itr->getSource())
                {
                    if (member->IsInWorld())
                    {
                        member->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_PROPOSAL_FAILED, LFGType(pProposal->GetDungeon()->type));
                        member->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_ADDED_TO_QUEUE, LFGType(pProposal->GetDungeon()->type));
                        member->GetSession()->SendLfgUpdateSearch(true);
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
            expiredProposals.insert(itr->second.ID);
        else if (itr->second.IsDeleted())
            expiredProposals.insert(itr->second.ID);
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

void LFGMgr::OfferContinue(Group* group)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE))
        return;

    if (group)
    {
        LFGDungeonEntry const* dungeon = group->GetLFGState()->GetDungeon();
        if (!dungeon ||  group->GetLFGState()->GetStatus() > LFG_STATUS_NOT_SAVED)
        {
            DEBUG_LOG("LFGMgr::OfferContinue: group %u not have required attributes!", group->GetObjectGuid().GetCounter());
            return;
        }
        if (Player* leader = sObjectMgr.GetPlayer(group->GetLeaderGuid()))
            leader->GetSession()->SendLfgOfferContinue(dungeon);
        group->GetLFGState()->SetStatus(LFG_STATUS_OFFER_CONTINUE);
    }
    else
        sLog.outError("LFGMgr::OfferContinue: no group!");
}

void LFGMgr::InitBoot(Player* kicker, ObjectGuid victimGuid, std::string reason)
{
    Group*  group = kicker->GetGroup();
    Player* victim = sObjectMgr.GetPlayer(victimGuid);

    if (!kicker || !group || !victim)
        return;

    DEBUG_LOG("LFGMgr::InitBoot: group %u kicker %u victim %u reason %s", group->GetObjectGuid().GetCounter(), kicker->GetObjectGuid().GetCounter(), victimGuid.GetCounter(), reason.c_str());

    if (!group->GetLFGState()->IsBootActive())
    {
        group->GetLFGState()->SetVotesNeeded(ceil(float(group->GetMembersCount())/2.0));
        group->GetLFGState()->StartBoot(kicker->GetObjectGuid(), victimGuid, reason);
    }
    else
    {
    // send error to player
    //    return;
    }

    if (group->GetLFGState()->GetKicksLeft() == 0)
    {
        group->Disband();
    }

    // Notify players
    for (GroupReference *itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        Player* player = itr->getSource();

        if (player && player->IsInWorld())
            player->GetSession()->SendLfgBootPlayer();
    }
}

void LFGMgr::CleanupBoots(LFGType type)
{
    for (LFGQueue::const_iterator itr = m_groupQueue[type].begin(); itr != m_groupQueue[type].end(); ++itr)
    {
        ObjectGuid guid = (*itr)->guid;
        Group* group = sObjectMgr.GetGroup(guid);
        if (!group)
            continue;

        if (group->GetLFGState()->GetState() != LFG_STATE_BOOT)
            continue;

        if (group->GetLFGState()->IsBootActive())
            continue;

        for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            if (Player* member = itr->getSource())
            {
                if (member->IsInWorld())
                {
                    member->GetSession()->SendLfgBootPlayer();
                }
            }
        }
        group->GetLFGState()->StopBoot();
    }
}

void LFGMgr::UpdateBoot(Player* player, bool accept)
{
    Group* group = player->GetGroup();
    if (!group)
        return;

    if (!group->GetLFGState()->IsBootActive())
        return;

    DEBUG_LOG("LFGMgr::UpdateBoot: group %u kicker %u answer %u", group->GetObjectGuid().GetCounter(), player->GetObjectGuid().GetCounter(), accept);

    group->GetLFGState()->UpdateBoot(player->GetObjectGuid(),LFGAnswer(accept));

    // Send update info to all players
    for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        if (Player* member = itr->getSource())
        {
            if (member->IsInWorld())
            {
                member->GetSession()->SendLfgBootPlayer();
            }
        }
    }

    switch (group->GetLFGState()->GetBootResult())
    {
            case LFG_ANSWER_AGREE:
            {
                Player* victim = sObjectMgr.GetPlayer(group->GetLFGState()->GetBootVictim());
                if (!victim)
                {
                    group->GetLFGState()->StopBoot();
                    return;
                }
                Player::RemoveFromGroup(group, victim->GetObjectGuid());
                victim->GetLFGState()->Clear();

                // group may be disbanded after Player::RemoveFromGroup!
                group = player->GetGroup();
                if (!group)
                    return;
                if (!group->GetLFGState()->IsBootActive())
                    return;

                group->GetLFGState()->DecreaseKicksLeft();
                group->GetLFGState()->StopBoot();
                OfferContinue(group);
                break;
            }
            case LFG_ANSWER_DENY:
                group->GetLFGState()->StopBoot();
                break;
            case LFG_ANSWER_PENDING:
                break;
            default:
                break;
    }
}

void LFGMgr::Teleport(Group* group, bool out)
{
    if (!group)
        return;

    DEBUG_LOG("LFGMgr::TeleportGroup %u in dungeon!", group->GetObjectGuid().GetCounter());

    for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        if (Player* member = itr->getSource())
        {
            if (member->IsInWorld())
            {
                if (!member->GetLFGState()->IsTeleported() && !out)
                    AddEvent(member->GetObjectGuid(),LFG_EVENT_TELEPORT_PLAYER, LONG_LFG_DELAY, uint8(out));
                else if (out)
                    Teleport(member, out);
            }
        }
    }
    if (group->GetLFGState()->GetState() == LFG_STATE_LFG
        || group->GetLFGState()->GetState() == LFG_STATE_LFR)
        group->GetLFGState()->SetState(LFG_STATE_DUNGEON);

    group->SendUpdate();
}

void LFGMgr::Teleport(Player* player, bool out, bool fromOpcode /*= false*/)
{
    if (!player || player->IsInCombat())
        return;

    DEBUG_LOG("LFGMgr::TeleportPlayer: %u is being teleported %s", player->GetObjectGuid().GetCounter(), out ? "from dungeon." : "in dungeon.");

    if (out)
    {
        player->RemoveAurasDueToSpell(LFG_SPELL_LUCK_OF_THE_DRAW);
        player->TeleportToBGEntryPoint();
        return;
    }

    // TODO Add support for LFG_TELEPORTERROR_FATIGUE
    LFGTeleportError error = LFG_TELEPORTERROR_OK;

    Group* group = player->GetGroup();

    if (!group)
        error = LFG_TELEPORTERROR_UNK4;
    else if (!player->isAlive())
        error = LFG_TELEPORTERROR_PLAYER_DEAD;
//    else if (player->IsFalling())
//        error = LFG_TELEPORTERROR_FALLING;

    uint32 mapid = 0;
    float x = 0;
    float y = 0;
    float z = 0;
    float orientation = 0;
    Difficulty difficulty;

    LFGDungeonEntry const* dungeon = NULL;

    if (error == LFG_TELEPORTERROR_OK)
    {
        dungeon = group->GetLFGState()->GetDungeon();
        if (!dungeon)
        {
            error = LFG_TELEPORTERROR_INVALID_LOCATION;
            DEBUG_LOG("LFGMgr::TeleportPlayer %u error %u, no dungeon!", player->GetObjectGuid().GetCounter(), error);
        }
    }

    if (error == LFG_TELEPORTERROR_OK)
    {
        difficulty = Difficulty(dungeon->difficulty);
        bool leaderInDungeon = false;
        Player* leader = sObjectMgr.GetPlayer(group->GetLeaderGuid());
        if (leader && player != leader && leader->GetMapId() == uint32(dungeon->map))
            leaderInDungeon = true;

        if (group->GetDungeonDifficulty() != Difficulty(dungeon->difficulty))
        {
            error = LFG_TELEPORTERROR_UNK4;
            DEBUG_LOG("LFGMgr::TeleportPlayer %u error %u, difficulty not match!", player->GetObjectGuid().GetCounter(), error);
        }
        else if (GetPlayerLockStatus(player,dungeon) != LFG_LOCKSTATUS_OK)
        {
            error = LFG_TELEPORTERROR_INVALID_LOCATION;
            DEBUG_LOG("LFGMgr::TeleportPlayer %u error %u, player not enter to this instance!", player->GetObjectGuid().GetCounter(), error);
        }
        else if (leaderInDungeon && group->GetLFGState()->GetState() == LFG_STATE_DUNGEON)
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
            DEBUG_LOG("LFGMgr::TeleportPlayer %u error %u, no areatrigger to map %u!", player->GetObjectGuid().GetCounter(), error, dungeon->map);
        }
    }

    if (error == LFG_TELEPORTERROR_OK)
    {

        if (player->GetMap() && !player->GetMap()->IsDungeon() && !player->GetMap()->IsRaid() && !player->InBattleGround())
            player->SetBattleGroundEntryPoint(true);

        // stop taxi flight at port
        if (player->IsTaxiFlying())
            player->InterruptTaxiFlying();

        player->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);
        player->RemoveSpellsCausingAura(SPELL_AURA_FLY);

        DETAIL_LOG("LFGMgr: Sending %s to map %u, difficulty %u X %f, Y %f, Z %f, O %f", player->GetName(), uint8(difficulty), mapid, x, y, z, orientation);

        player->TeleportTo(mapid, x, y, z, orientation);
        player->GetLFGState()->SetState(LFG_STATE_DUNGEON);
        player->GetLFGState()->SetTeleported();
    }
    else
        player->GetSession()->SendLfgTeleportError(error);
}

void LFGMgr::CleanupRoleChecks(LFGType type)
{

    for (LFGQueue::const_iterator itr = m_groupQueue[type].begin(); itr != m_groupQueue[type].end(); ++itr)
    {
        ObjectGuid guid = (*itr)->guid;
        Group* group = sObjectMgr.GetGroup(guid);
        if (!group)
            continue;

        if (group->GetLFGState()->GetState() != LFG_STATE_ROLECHECK)
            continue;

        if (group->GetLFGState()->GetRoleCheckState() == LFG_ROLECHECK_FINISHED)
            continue;

        if (group->GetLFGState()->QueryRoleCheckTime())
            continue;

        group->GetLFGState()->SetRoleCheckState(LFG_ROLECHECK_MISSING_ROLE);

        for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            if (Player* member = itr->getSource())
            {
                if (member->IsInWorld())
                {
                    member->GetSession()->SendLfgRoleCheckUpdate();
                    member->GetSession()->SendLfgJoinResult(ERR_LFG_ROLE_CHECK_FAILED, LFG_ROLECHECK_MISSING_ROLE);
                }
            }
        }
        group->GetLFGState()->Clear();
        group->GetLFGState()->SetRoleCheckState(LFG_ROLECHECK_NONE);
        RemoveFromQueue(group->GetObjectGuid());
    }

}

void LFGMgr::StartRoleCheck(Group* group)
{
    if (!group)
        return;

    group->GetLFGState()->StartRoleCheck();
    group->GetLFGState()->SetRoleCheckState(LFG_ROLECHECK_INITIALITING);
    group->GetLFGState()->SetState(LFG_STATE_ROLECHECK);

    for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        Player* member = itr->getSource();

        if (member && member->IsInWorld())
        {
            if (member->GetObjectGuid() != group->GetLeaderGuid())
            {
                member->GetLFGState()->SetRoles(LFG_ROLE_MASK_NONE);
                member->GetLFGState()->SetState(LFG_STATE_ROLECHECK);
            }
            else
            {
                member->GetLFGState()->AddRole(ROLE_LEADER);
                member->GetLFGState()->SetState(LFG_STATE_QUEUED);
            }
            member->GetSession()->SendLfgRoleCheckUpdate();
        }
    }
}

void LFGMgr::UpdateRoleCheck(Group* group)
{
    if (!group)
        return;

    if (group->GetLFGState()->GetState() != LFG_STATE_ROLECHECK)
        return;

    bool isFinished = true;
    for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        if (Player* member = itr->getSource())
        {
            if (member->IsInWorld())
            {
                if (member->GetLFGState()->GetState() == LFG_STATE_QUEUED)
                    continue;

                LFGRoleCheckState newstate = LFG_ROLECHECK_NONE;

                if (uint8(member->GetLFGState()->GetRoles()) < LFG_ROLE_MASK_TANK)
                    newstate = LFG_ROLECHECK_INITIALITING;
                else
                {
                    newstate = LFG_ROLECHECK_FINISHED;
                    member->GetLFGState()->SetState(LFG_STATE_QUEUED);
                }

                if (newstate != LFG_ROLECHECK_FINISHED)
                    isFinished = false;
            }
        }
    }


    if (!isFinished)
        group->GetLFGState()->SetRoleCheckState(LFG_ROLECHECK_INITIALITING);
    else if (!CheckRoles(group))
        group->GetLFGState()->SetRoleCheckState(LFG_ROLECHECK_WRONG_ROLES);
    else
        group->GetLFGState()->SetRoleCheckState(LFG_ROLECHECK_FINISHED);

    for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        if (Player* member = itr->getSource())
        {
            if (member->IsInWorld())
            {
                member->GetSession()->SendLfgRoleCheckUpdate();
            }
        }
    }

    DEBUG_LOG("LFGMgr::UpdateRoleCheck group %u %s result %u", group->GetObjectGuid().GetCounter(),isFinished ? "completed" : "not finished", group->GetLFGState()->GetRoleCheckState());

    // temporary - only all answer accept
    if (group->GetLFGState()->GetRoleCheckState() != LFG_ROLECHECK_FINISHED)
        return;

    for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        Player* member = itr->getSource();

        if (member && member->IsInWorld())
        {
            member->GetSession()->SendLfgRoleCheckUpdate();

            if (group->GetLFGState()->GetRoleCheckState() == LFG_ROLECHECK_FINISHED)
            {
                member->GetLFGState()->SetJoined();
                member->GetLFGState()->SetState(LFG_STATE_QUEUED);

                if (member->GetObjectGuid() == group->GetLeaderGuid())
                    member->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_ADDED_TO_QUEUE, group->GetLFGState()->GetType());
                else
                {
//                    member->GetSession()->SendLfgJoinResult(ERR_LFG_OK, LFG_ROLECHECK_NONE, true);
                    member->GetSession()->SendLfgUpdatePlayer(LFG_UPDATETYPE_JOIN_PROPOSAL, group->GetLFGState()->GetType());
                }
            }
            else
            {
                member->GetLFGState()->SetState(LFG_STATE_NONE);
                member->GetSession()->SendLfgJoinResult(ERR_LFG_ROLE_CHECK_FAILED, LFG_ROLECHECK_MISSING_ROLE);
                member->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_ROLECHECK_FAILED, group->GetLFGState()->GetType());
            }
        }
    }

    DEBUG_LOG("LFGMgr::UpdateRoleCheck finished, group %u result %u", group->GetObjectGuid().GetCounter(), group->GetLFGState()->GetRoleCheckState());

    if (group->GetLFGState()->GetRoleCheckState() == LFG_ROLECHECK_FINISHED)
    {
        group->GetLFGState()->SetState(LFG_STATE_QUEUED);
    }
    else
    {
        RemoveFromQueue(group->GetObjectGuid());
    }
}

bool LFGMgr::CheckRoles(Group* group, Player* player /*=NULL*/)
{
    if (!group)
        return false;

    if (group->isRaidGroup())
        return true;


    LFGRolesMap rolesMap;

    for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        if (Player* member = itr->getSource())
            if (member->IsInWorld())
                rolesMap.insert(std::make_pair(member->GetObjectGuid(), member->GetLFGState()->GetRoles()));
    }

    if (player && player->IsInWorld())
        rolesMap.insert(std::make_pair(player->GetObjectGuid(), player->GetLFGState()->GetRoles()));

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
        if (*itr & LFG_ROLE_MASK_TANK && tanks > 0)
            --tanks;
        else if (*itr & LFG_ROLE_MASK_HEALER && healers > 0)
            --healers;
        else if (*itr & LFG_ROLE_MASK_DAMAGE && dps > 0)
            --dps;
    }

    DEBUG_LOG("LFGMgr::CheckRoles healers %u tanks %u dps %u map size " SIZEFMTD, healers, tanks, dps, rolesMap->size());

//    if (sWorld.getConfig(CONFIG_BOOL_LFG_DEBUG_ENABLE))
//        return true;

    if ((healers + tanks + dps) > int8(MAX_GROUP_SIZE - rolesMap->size()))
        return false;

    return true;
}

bool LFGMgr::RoleChanged(Player* player, uint8 roles)
{
    uint8 oldRoles = player->GetLFGState()->GetRoles();
    player->GetLFGState()->SetRoles(roles);

    if (Group* group = player->GetGroup())
    {
        for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
            if (Player* member = itr->getSource())
                if (member->IsInWorld())
                    member->GetSession()->SendLfgRoleChosen(player->GetObjectGuid(), roles);
    }
    else
        player->GetSession()->SendLfgRoleChosen(player->GetObjectGuid(), roles);

    if (oldRoles != player->GetLFGState()->GetRoles())
        return true;

    return false;
}

Player* LFGMgr::LeaderElection(LFGQueueSet* playerGuids)
{
    std::set<Player*> leaders;
    Player* leader = NULL;
    uint32 GS = 0;

    for (LFGQueueSet::const_iterator itr = playerGuids->begin(); itr != playerGuids->end(); ++itr)
    {
        Player* member  = sObjectMgr.GetPlayer(*itr);
        if (member && member->IsInWorld())
        {
            if (member->GetLFGState()->GetRoles() & LFG_ROLE_MASK_LEADER)
                leaders.insert(member);

            member->GetLFGState()->RemoveRole(ROLE_LEADER);

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
        for (LFGQueueSet::const_iterator itr = playerGuids->begin(); itr != playerGuids->end(); ++itr)
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
        newRole    = LFGRoleMask(tmpMap.begin()->second & ~LFG_ROLE_MASK_HD);
    }
    else
    {
        for (LFGRolesMap::iterator itr = tmpMap.begin(); itr != tmpMap.end(); ++itr)
        {
            tankGuid = itr->first;
            LFGRolesMap::iterator itr2 = rolesMap->find(tankGuid);
            oldRoles = itr2->second;
            newRole    = LFGRoleMask(itr->second & ~LFG_ROLE_MASK_HD);

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
        newRole    = LFGRoleMask(tmpMap.begin()->second & ~LFG_ROLE_MASK_TD);
    }
    else
    {
        for (LFGRolesMap::iterator itr = tmpMap.begin(); itr != tmpMap.end(); ++itr)
        {
            healGuid = itr->first;
            LFGRolesMap::iterator itr2 = rolesMap->find(healGuid);
            oldRoles = itr2->second;
            newRole    = LFGRoleMask(itr->second & ~LFG_ROLE_MASK_TD);

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
            newRole      = LFGRoleMask(itr->second & ~LFG_ROLE_MASK_TH);
            itr->second  = LFGRoleMask(newRole);
        }
    }

    for (LFGRolesMap::iterator itr = rolesMap->begin(); itr != rolesMap->end(); ++itr)
    {
        Player* player = sObjectMgr.GetPlayer(itr->first);
        if (player && player->IsInWorld())
        {
            player->GetLFGState()->SetRoles(itr->second);
            DEBUG_LOG("LFGMgr::SetRoles role for player %u set to %u",player->GetObjectGuid().GetCounter(), uint8(itr->second));
        }
    }

}

void LFGMgr::SetGroupRoles(Group* group, LFGQueueSet* players)
{
    if (!group)
        return;

    LFGRolesMap rolesMap;
    bool hasMultiRoles = false;

    for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        if (Player* member = itr->getSource())
        {
            if (member->IsInWorld())
            {
                rolesMap.insert(std::make_pair(member->GetObjectGuid(), member->GetLFGState()->GetRoles()));
                if (!member->GetLFGState()->IsSingleRole())
                    hasMultiRoles = true;
            }
        }
    }

    if (players && !players->empty())
    {
        for (LFGQueueSet::const_iterator itr = players->begin(); itr != players->end(); ++itr)
        {
            Player* player = sObjectMgr.GetPlayer(*itr);
            if (player && player->IsInWorld())
            {
                rolesMap.insert(std::make_pair(player->GetObjectGuid(), player->GetLFGState()->GetRoles()));
                if (!player->GetLFGState()->IsSingleRole())
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
        Group* group   = sObjectMgr.GetGroup((*itr)->guid);
        if (!group)
            continue;

//            DEBUG_LOG("LFGMgr:TryCompleteGroups: Try complete group %u  type %u state %u", group->GetObjectGuid().GetCounter(), type, group->GetLFGState()->GetState());
        if (group->GetLFGState()->GetState() != LFG_STATE_QUEUED
            && !(group->GetLFGState()->GetState() == LFG_STATE_QUEUED && group->GetLFGState()->GetStatus() == LFG_STATUS_NOT_SAVED))
            continue;

        if (IsGroupCompleted(group))
        {
            DEBUG_LOG("LFGMgr:TryCompleteGroups: Try complete group %u  type %u, but his already completed!", group->GetObjectGuid().GetCounter(), type);
            CompleteGroup(group,NULL);
            isGroupCompleted = true;
            break;
        }
        LFGQueueSet applicants;

        for (LFGQueue::iterator itr2 = m_playerQueue[type].begin(); itr2 != m_playerQueue[type].end(); ++itr2 )
        {
            Player* player = sObjectMgr.GetPlayer((*itr2)->guid);
            if (!player)
                continue;

            if (player->GetLFGState()->GetState() != LFG_STATE_QUEUED)
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
                    if (TryAddMembersToGroup(group,&applicants))
                    {
                        if (IsGroupCompleted(group, applicants.size()))
                        {
                            CompleteGroup(group,&applicants);
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

bool LFGMgr::TryAddMembersToGroup(Group* group, LFGQueueSet* players)
{
    if (!group || players->empty())
        return false;

    LFGRolesMap rolesMap;
    LFGDungeonSet const* groupDungeons = group->GetLFGState()->GetDungeons();
    LFGDungeonSet  intersection  = *groupDungeons;

    for (LFGQueueSet::const_iterator itr = players->begin(); itr != players->end(); ++itr)
    {
        Player* player = sObjectMgr.GetPlayer(*itr);
        if (!player || !player->IsInWorld())
            return false;

        if (!CheckTeam(group, player))
           return false;

        if (HasIgnoreState(group, player->GetObjectGuid()))
           return false;
        /*
        if (LFGProposal* pProposal = group->GetLFGState()->GetProposal())
        {
            if (pProposal->IsDecliner(player->GetObjectGuid()))
               return false;
        }
        */
        if (!CheckRoles(group, player))
           return false;

        rolesMap.insert(std::make_pair(player->GetObjectGuid(), player->GetLFGState()->GetRoles()));
        if (!CheckRoles(&rolesMap))
           return false;

        LFGDungeonSet const* playerDungeons = player->GetLFGState()->GetDungeons();
        LFGDungeonSet  tmpIntersection;
        std::set_intersection(intersection.begin(),intersection.end(), playerDungeons->begin(),playerDungeons->end(),std::inserter(tmpIntersection,tmpIntersection.end()));
        if (tmpIntersection.empty())
            return false;
        intersection = tmpIntersection;
    }
    return true;
}

void LFGMgr::CompleteGroup(Group* group, LFGQueueSet* players)
{

    DEBUG_LOG("LFGMgr:CompleteGroup: Try complete group %u with %lu players", group->GetObjectGuid().GetCounter(), players ? players->size() : 0);

    LFGDungeonSet const* groupDungeons = group->GetLFGState()->GetDungeons();
    LFGDungeonSet  intersection  = *groupDungeons;
    if (players)
    {
        for (LFGQueueSet::const_iterator itr = players->begin(); itr != players->end(); ++itr)
        {
            Player* player = sObjectMgr.GetPlayer(*itr);
            if (!player || !player->IsInWorld())
                return;

            LFGDungeonSet const* playerDungeons = player->GetLFGState()->GetDungeons();
            LFGDungeonSet  tmpIntersection;
            std::set_intersection(intersection.begin(),intersection.end(), playerDungeons->begin(),playerDungeons->end(),std::inserter(tmpIntersection,tmpIntersection.end()));
            intersection = tmpIntersection;
        }
    }

    if (intersection.empty())
    {
        DEBUG_LOG("LFGMgr:CompleteGroup: Try complete group %u but dungeon list is empty!", group->GetObjectGuid().GetCounter());
        return;
    }

    SetGroupRoles(group, players);
    LFGDungeonEntry const* dungeon = SelectRandomDungeonFromList(intersection);
    uint32 ID = CreateProposal(dungeon,group,players);
    DEBUG_LOG("LFGMgr:CompleteGroup: dungeons for group %u with %lu players found, created proposal %u", group->GetObjectGuid().GetCounter(), players ? players->size() : 0, ID);
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
        LFGQueueSet newGroup;
        LFGQueueSet const* applicants = &itr->second;
        for (LFGQueueSet::const_iterator itr1 = applicants->begin(); itr1 != applicants->end(); ++itr1)
        {
            ObjectGuid guid = *itr1;
            bool checkPassed = true;
            LFGRolesMap rolesMap;
            for (LFGQueueSet::const_iterator itr2 = newGroup.begin(); itr2 != newGroup.end(); ++itr2)
            {
                ObjectGuid guid2 = *itr2;
                if ( guid != guid2 && (!CheckTeam(guid, guid2) || HasIgnoreState(guid, guid2)))
                    checkPassed = false;
                else
                {
                    Player* player = sObjectMgr.GetPlayer(guid2);
                    if (player && player->IsInWorld())
                    {
                        rolesMap.insert(std::make_pair(player->GetObjectGuid(), player->GetLFGState()->GetRoles()));
                    }
                }
            }
            if (!checkPassed)
                continue;

            Player* player1 = sObjectMgr.GetPlayer(guid);
            if (player1 && player1->IsInWorld())
            {
                rolesMap.insert(std::make_pair(player1->GetObjectGuid(), player1->GetLFGState()->GetRoles()));

                if (!CheckRoles(&rolesMap))
                   continue;

                newGroup.insert(guid);
                if (newGroup.size() == 1)
                   intersection = *player1->GetLFGState()->GetDungeons();
                else
                {
                   LFGDungeonSet groupDungeons = intersection;
                   intersection.clear();
                   LFGDungeonSet const* playerDungeons = player1->GetLFGState()->GetDungeons();
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

void LFGMgr::UpdateQueueStatus(Player* player)
{
}

void LFGMgr::UpdateQueueStatus(Group* group)
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

    for (LFGQueueInfoMap::iterator itr = m_queueInfoMap.begin(); itr != m_queueInfoMap.end(); ++itr)
    {
        LFGQueueInfo* pqInfo = &itr->second;
        if (!pqInfo)
            continue;

        if (pqInfo->GetDungeonType() != type)
            continue;

        tanks    += (LFG_TANKS_NEEDED - pqInfo->tanks);
        if (LFG_TANKS_NEEDED - pqInfo->tanks)
            tanksTime += uint64( time(NULL) - pqInfo->joinTime);
        healers  += (LFG_HEALERS_NEEDED - pqInfo->healers);
        if (LFG_HEALERS_NEEDED - pqInfo->healers)
            healersTime += uint64( time(NULL) - pqInfo->joinTime);
        damagers += (LFG_DPS_NEEDED - pqInfo->dps);
        if (LFG_DPS_NEEDED - pqInfo->dps)
            damagersTime += uint64( time(NULL) - pqInfo->joinTime);
        if (itr->first.IsGroup())
        {
            if (Group* group = sObjectMgr.GetGroup(itr->first))
            {
                fullTime  += uint64( time(NULL) - pqInfo->joinTime)*group->GetMembersCount();
                fullCount += group->GetMembersCount();
            }
        }
        else
        {
            fullTime  += uint64( time(NULL) - pqInfo->joinTime);
            fullCount +=1;
        }
    }

    LFGQueueStatus* status = &m_queueStatus[type];
    MANGOS_ASSERT(status);

    status->dps     = damagers;
    status->tanks   = tanks;
    status->healers = healers;

    status->waitTimeTanks  = tanks     ? time_t(tanksTime/tanks)       : 0;
    status->waitTimeHealer = healers   ? time_t(healersTime/healers)   : 0;
    status->waitTimeDps    = damagers  ? time_t(damagersTime/damagers) : 0;

    status->avgWaitTime    = fullCount ? time_t(fullTime/fullCount)    : 0;

}

void LFGMgr::SendStatistic(LFGType type)
{
    LFGQueueSet fullSet = GetDungeonPlayerQueue(type);


    LFGQueueStatus* status = GetDungeonQueueStatus(type);

    for (LFGQueueSet::iterator itr = fullSet.begin(); itr != fullSet.end(); ++itr)
    {
        ObjectGuid guid = *itr;
        if (guid.IsEmpty())
            continue;

        Player* player = sObjectMgr.GetPlayer(guid);

        if (!player || !player->IsInWorld())
            continue;

        uint8 statIndex = 0;
        if (!sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GROUP))
        {
            if (player->GetTeam() == HORDE)
                statIndex = 2;
            else if (player->GetTeam() == ALLIANCE)
                statIndex = 1;
        }

        LFGDungeonEntry const* dungeon = *player->GetLFGState()->GetDungeons()->begin();

        if (!dungeon)
            continue;
        player->GetSession()->SendLfgQueueStatus(dungeon, status);
    }

    LFGQueueSet groupSet = GetDungeonGroupQueue(type);

    for (LFGQueueSet::iterator itr = groupSet.begin(); itr != groupSet.end(); ++itr)
    {
        ObjectGuid guid = *itr;
        if (guid.IsEmpty())
            continue;

        Group* group = sObjectMgr.GetGroup(guid);

        if (!group)
            continue;

        LFGDungeonEntry const* dungeon = *group->GetLFGState()->GetDungeons()->begin();

        if (!dungeon)
            continue;
        for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
            if (Player* member = itr->getSource())
                if (member->IsInWorld())
                    member->GetSession()->SendLfgQueueStatus(dungeon, status);
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

    Player* player = sObjectMgr.GetPlayer(guid);
    if (!player)
        return;

    LFGDungeonSet const* dungeons = player->GetLFGState()->GetDungeons();

    DEBUG_LOG("LFGMgr::AddToSearchMatrix %u added, dungeons size " SIZEFMTD, guid.GetCounter(),dungeons->size());

    if (dungeons->empty())
        return;

    for (LFGDungeonSet::const_iterator itr = dungeons->begin(); itr != dungeons->end(); ++itr)
    {
        LFGDungeonEntry const* dungeon = *itr;

        if (!dungeon)
            continue;

        LFGQueueSet* players = GetSearchVector(dungeon);
        if (!players || players->empty())
        {
            LFGQueueSet _players;
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

    Player* player = sObjectMgr.GetPlayer(guid);
    if (!player)
        return;


    LFGDungeonSet const* dungeons = player->GetLFGState()->GetDungeons();

    DEBUG_LOG("LFGMgr::RemoveFromSearchMatrix %u removed, dungeons size " SIZEFMTD, guid.GetCounter(),dungeons->size());

    if (dungeons->empty())
        return;

    for (LFGDungeonSet::const_iterator itr = dungeons->begin(); itr != dungeons->end(); ++itr)
    {
        LFGDungeonEntry const* dungeon = *itr;

        if (!dungeon)
            continue;

        LFGQueueSet* players = GetSearchVector(dungeon);
        if (players && !players->empty())
        {
            WriteGuard Guard(GetLock());
            LFGQueueSet _players;
            players->erase(guid);
            if (players->empty())
                m_searchMatrix.erase(dungeon);
        }
    }
}

LFGQueueSet* LFGMgr::GetSearchVector(LFGDungeonEntry const* dungeon)
{
    ReadGuard Guard(GetLock());
    LFGSearchMap::iterator itr = m_searchMatrix.find(dungeon);
    return itr != m_searchMatrix.end() ? &itr->second : NULL;
}

bool LFGMgr::IsInSearchFor(LFGDungeonEntry const* dungeon, ObjectGuid guid)
{
    LFGQueueSet* players = GetSearchVector(dungeon);
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
        LFGQueueSet players = itr->second;
        for (LFGQueueSet::iterator itr2 = players.begin(); itr2 != players.end(); ++itr2)
        {
            ObjectGuid guid = *itr2;
            if (guid.IsEmpty())
                continue;

            Player* player = sObjectMgr.GetPlayer(guid);

            if (!player || !player->IsInWorld())
            {
                WriteGuard Guard(GetLock());
                itr->second.erase(guid);
            }
        }
    }
}

bool LFGMgr::HasIgnoreState(ObjectGuid guid1, ObjectGuid guid2)
{
    Player* player = sObjectMgr.GetPlayer(guid1);
    if (!player || !player->IsInWorld())
        return false;

    if (player->GetSocial()->HasIgnore(guid2))
        return true;

    return false;
}

bool LFGMgr::HasIgnoreState(Group* group, ObjectGuid guid)
{
    if (!group)
        return false;

    for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        if (Player* member = itr->getSource())
            if (HasIgnoreState(member->GetObjectGuid(), guid))
                return true;
    }

    return false;
}

bool LFGMgr::CheckTeam(ObjectGuid guid1, ObjectGuid guid2)
{

    if (guid1.IsEmpty() || guid2.IsEmpty())
        return true;

    Player* player1 = sObjectMgr.GetPlayer(guid1);
    Player* player2 = sObjectMgr.GetPlayer(guid2);

    if (!player1 || !player2)
        return true;

    if (sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GROUP))
        return true;

    if (player1->GetTeam() == player2->GetTeam())
        return true;

    return false;
}

bool LFGMgr::CheckTeam(Group* group, Player* player)
{
    if (!group || !player)
        return true;

    if (sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GROUP))
        return true;

    if (Player* leader = sObjectMgr.GetPlayer(group->GetLeaderGuid()))
    {
        if (leader->GetTeam() == player->GetTeam())
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
        Group* group = sObjectMgr.GetGroup(guid);
        if (!group || !group->isLFRGroup())
            continue;

        if (group->GetLFGState()->GetState() != LFG_STATE_LFR)
            continue;

        if (!IsGroupCompleted(group))
            continue;

        if (!group->GetLFGState()->GetDungeon())
        {
            LFGDungeonEntry const* realdungeon = SelectRandomDungeonFromList(*group->GetLFGState()->GetDungeons());
            MANGOS_ASSERT(realdungeon);
            group->GetLFGState()->SetDungeon(realdungeon);
            DEBUG_LOG("LFGMgr::UpdateLFRGroup: %u set real dungeon to %u.", group->GetObjectGuid().GetCounter(), realdungeon->ID);

            Player* leader = sObjectMgr.GetPlayer(group->GetLeaderGuid());
            if (leader && leader->GetMapId() != uint32(realdungeon->map))
            {
                group->SetDungeonDifficulty(Difficulty(realdungeon->difficulty));
                group->GetLFGState()->SetStatus(LFG_STATUS_NOT_SAVED);
                group->SendUpdate();
            }
        }

        uint8 tpnum = 0;
        for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            if (Player* member = itr->getSource())
            {
                if (member->IsInWorld())
                {
                    if (member->GetLFGState()->GetState() < LFG_STATE_DUNGEON)
                    {
                        AddMemberToLFDGroup(member->GetObjectGuid());
                        member->GetLFGState()->SetState(LFG_STATE_DUNGEON);
                        ++tpnum;
                    }
                }
            }
        }
        if (tpnum)
            Teleport(group, false);
        RemoveFromQueue(group->GetObjectGuid());
    }
}

bool LFGMgr::IsGroupCompleted(Group* group, uint8 addMembers)
{
    if (!group)
    {
        if (sWorld.getConfig(CONFIG_BOOL_LFG_DEBUG_ENABLE) && addMembers > 2)
            return true;
        else if ( addMembers >= MAX_GROUP_SIZE)
            return true;
        else
            return false;
    }

    if (sWorld.getConfig(CONFIG_BOOL_LFG_DEBUG_ENABLE) && (group->GetMembersCount() + addMembers > 2))
        return true;

    if (group->isRaidGroup())
    {
        switch (group->GetDifficulty(true))
        {
            case RAID_DIFFICULTY_10MAN_NORMAL:
            case RAID_DIFFICULTY_10MAN_HEROIC:
                if (group->GetMembersCount() + addMembers >= 10)
                    return true;
                break;
            case RAID_DIFFICULTY_25MAN_NORMAL:
            case RAID_DIFFICULTY_25MAN_HEROIC:
                if (group->GetMembersCount() + addMembers >= 25)
                    return true;
                break;
            default:
                return false;
                break;
        }
    }
    else if (group->GetMembersCount() + addMembers >= MAX_GROUP_SIZE)
        return true;

    return false;
}

void LFGMgr::AddMemberToLFDGroup(ObjectGuid guid)
{
    Player* player = sObjectMgr.GetPlayer(guid);

    if (!player || !player->IsInWorld())
        return;

    Group* group = player->GetGroup();

    if (!group)
        return;

    group->SetGroupRoles(guid, player->GetLFGState()->GetRoles());
    RemoveFromQueue(player->GetObjectGuid());
    RemoveFromSearchMatrix(player->GetObjectGuid());

    player->GetLFGState()->SetState(group->GetLFGState()->GetState());
}

void LFGMgr::RemoveMemberFromLFDGroup(Group* group, ObjectGuid guid)
{
    Player* player = sObjectMgr.GetPlayer(guid);

    if (!player || !player->IsInWorld())
        return;

    if (player->HasAura(LFG_SPELL_DUNGEON_COOLDOWN) && !sWorld.getConfig(CONFIG_BOOL_LFG_DEBUG_ENABLE))
        player->CastSpell(player,LFG_SPELL_DUNGEON_DESERTER,true);


    if (!group || !group->isLFDGroup())
    {
        player->GetLFGState()->Clear();
        return;
    }

    if (player->GetLFGState()->GetState() > LFG_STATE_QUEUED)
        Teleport(player, true);
    else if (group && group->GetLFGState()->GetState() > LFG_STATE_QUEUED)
        Teleport(player, true);

    if (group && group->isLFGGroup() && group->GetMembersCount() > 1)
    {
        if (group->GetLFGState()->GetState() > LFG_STATE_LFG
            && group->GetLFGState()->GetState() < LFG_STATE_FINISHED_DUNGEON)
        {
            OfferContinue(group);
        }
    }

    Leave(player);
    player->GetLFGState()->Clear();
}

void LFGMgr::DungeonEncounterReached(Group* group)
{
    if (!group)
        return;

    for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        Player* member = itr->getSource();
        if (member && member->IsInWorld())
        {
            if (member->HasAura(LFG_SPELL_DUNGEON_COOLDOWN))
                member->RemoveAurasDueToSpell(LFG_SPELL_DUNGEON_COOLDOWN);
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
                        Player* player = sObjectMgr.GetPlayer(itr->guid);
                        if (player)
                            Teleport(player, bool(itr->eventParm));
                    }
                    break;
                case LFG_EVENT_TELEPORT_GROUP:
                    {
                        Group* group = sObjectMgr.GetGroup(itr->guid);
                        if (group)
                            Teleport(group, bool(itr->eventParm));
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

void LFGMgr::LoadLFDGroupPropertiesForPlayer(Player* player)
{
    if (!player || !player->IsInWorld())
        return;

    Group* group = player->GetGroup();
    if (!group)
        return;

    player->GetLFGState()->SetRoles(group->GetGroupRoles(player->GetObjectGuid()));
    if(sWorld.getConfig(CONFIG_BOOL_RESTRICTED_LFG_CHANNEL))
        player->JoinLFGChannel();

    switch (group->GetLFGState()->GetState())
    {
        case LFG_STATE_NONE:
        case LFG_STATE_FINISHED_DUNGEON:
        {
            player->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_JOIN_PROPOSAL, group->GetLFGState()->GetType());
            break;
        }
        case LFG_STATE_DUNGEON:
        {
            if (group->GetLFGState()->GetType() == LFG_TYPE_RAID)
                break;
            player->GetSession()->SendLfgUpdateParty(LFG_UPDATETYPE_GROUP_FOUND, group->GetLFGState()->GetType());
            break;
        }
        default:
           break;
    }
}

void LFGMgr::OnPlayerEnterMap(Player* player, Map* map)
{
    if (!player || !player->IsInWorld() || !map)
        return;

    Group* group = player->GetGroup();

    if (!group || !group->isLFDGroup())
        return;

    if (map->IsDungeon() && group->isLFGGroup())
        player->CastSpell(player,LFG_SPELL_LUCK_OF_THE_DRAW,true);
    else if (map->IsRaid() && group->isLFRGroup() && sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE))
        player->CastSpell(player,LFG_SPELL_LUCK_OF_THE_DRAW,true);
    else
        player->RemoveAurasDueToSpell(LFG_SPELL_LUCK_OF_THE_DRAW);
}

void LFGMgr::OnPlayerLeaveMap(Player* player, Map* map)
{
    if (!player || !player->IsInWorld() || !map)
        return;

    Group* group = player->GetGroup();

    if (player->HasAura(LFG_SPELL_LUCK_OF_THE_DRAW))
    {
        if (!group || !group->isLFDGroup())
            player->RemoveAurasDueToSpell(LFG_SPELL_LUCK_OF_THE_DRAW);
    }
}

