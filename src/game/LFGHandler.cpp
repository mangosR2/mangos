/*
 * Copyright (C) 2005-2010 MaNGOS <http://getmangos.com/>
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

#include "WorldSession.h"
#include "Log.h"
#include "Database/DatabaseEnv.h"
#include "Player.h"
#include "WorldPacket.h"
#include "ObjectMgr.h"
#include "World.h"
#include "LFGMgr.h"

void WorldSession::HandleLfgJoinOpcode( WorldPacket & recv_data )
{
    if (!GetPlayer())
        return;

    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE) && !sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE))
    {
        recv_data.rpos(recv_data.wpos());
        DEBUG_LOG("CMSG_LFG_JOIN %u failed - Dungeon finder disabled", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }
    else
        DEBUG_LOG("CMSG_LFG_JOIN %u processing...", GetPlayer()->GetObjectGuid().GetCounter());

    uint8  numDungeons;
    uint32 dungeonID;
    uint32 roles;
    std::string comment;
    LFGDungeonSet newDungeons;
    newDungeons.clear();

    recv_data >> roles;                                     // lfg roles
    recv_data >> Unused<uint8>();                           // unk1 (unused?)
    recv_data >> Unused<uint8>();                           // unk2 (unused?)

    recv_data >> numDungeons;
    if (!numDungeons)
    {
        DEBUG_LOG("CMSG_LFG_JOIN %u no dungeons selected", GetPlayer()->GetObjectGuid().GetCounter());
        recv_data.rpos(recv_data.wpos());
        return;
    }

    for (int8 i = 0 ; i < numDungeons; ++i)
    {
        recv_data >> dungeonID;
        LFGDungeonEntry const* dungeon = sLFGMgr.GetDungeon(dungeonID & 0x00FFFFFF);    // remove the type from the dungeon entry
        if (dungeon)
            newDungeons.insert(dungeon);
    }

    uint8 counter2;                                         // unk - always 3
    recv_data >> counter2;
    for (uint8 i = 0; i < counter2; i++)
        recv_data >> Unused<uint8>();                       // unk (unused?)
    recv_data >> comment;                                   // lfg comment

    GetPlayer()->GetLFGPlayerState()->SetDungeons(newDungeons);
    if (GetPlayer()->GetGroup())
        if (GetPlayer()->GetObjectGuid() == GetPlayer()->GetGroup()->GetLeaderGuid())
            GetPlayer()->GetGroup()->GetLFGGroupState()->SetDungeons(newDungeons);

    GetPlayer()->GetLFGPlayerState()->SetRoles(LFGRoleMask(roles));
    GetPlayer()->GetLFGPlayerState()->SetComment(comment);
    DEBUG_LOG("CMSG_LFG_JOIN %u as group: %u  Dungeons: %u", GetPlayer()->GetObjectGuid().GetCounter(), GetPlayer()->GetGroup() ? 1 : 0, uint8(newDungeons.size()));
    sLFGMgr.Join(GetPlayer());
}

void WorldSession::HandleLfgLeaveOpcode( WorldPacket & /*recv_data*/ )
{
    Group* group = GetPlayer()->GetGroup();

    DEBUG_LOG("CMSG_LFG_LEAVE %u in group: %u", GetPlayer()->GetObjectGuid().GetCounter(), group ? 1 : 0);

    // Check cheating - only leader can leave the queue
    if (!group || group->GetLeaderGuid() == GetPlayer()->GetObjectGuid())
        sLFGMgr.Leave(GetPlayer());

}

void WorldSession::HandleLfgGetStatus(WorldPacket & /*recv_data*/)
{
    Group* group = GetPlayer()->GetGroup();

    DEBUG_LOG("CMSG_LFG_GET_STATUS %u in group: %u", GetPlayer()->GetObjectGuid().GetCounter(), group ? 1 : 0);
    // Need implement
}

void WorldSession::HandleLfrSearchOpcode( WorldPacket & recv_data )
{
    uint32 entry;                                           // Raid id to search
    recv_data >> entry;
    DEBUG_LOG("CMSG_SEARCH_LFG_JOIN %u dungeon entry: %u", GetPlayer()->GetObjectGuid().GetCounter(), entry);
    if (!sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE))
    {
        DEBUG_LOG("CMSG_SEARCH_LFG_JOIN %u failed - Raid finder disabled", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }
    SendLfgUpdateList(entry & 0x00FFFFFF);
}

void WorldSession::HandleLfrLeaveOpcode( WorldPacket & recv_data )
{
    uint32 entry;                                          // Raid id queue to leave
    recv_data >> entry;

    if (!sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE))
    {
        DEBUG_LOG("CMSG_SEARCH_LFG_LEAVE %u failed - Raid finder disabled", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }

    DEBUG_LOG("CMSG_SEARCH_LFG_LEAVE %u dungeon entry: %u", GetPlayer()->GetObjectGuid().GetCounter(), entry);

    Group* group = GetPlayer()->GetGroup();

//    if (!group || group->GetLeaderGuid() == GetPlayer()->GetObjectGuid())
    if (!group)
    {
        GetPlayer()->GetLFGPlayerState()->RemoveDungeon(sLFGMgr.GetDungeon(entry & 0x00FFFFFF));

        if (GetPlayer()->GetLFGPlayerState()->GetDungeons()->empty())
            sLFGMgr.Leave(GetPlayer());
    }
}

void WorldSession::HandleLfgClearOpcode( WorldPacket & /*recv_data */ )
{
    // empty packet
    DEBUG_LOG("CMSG_CLEAR_LOOKING_FOR_GROUP %u ", GetPlayer()->GetObjectGuid().GetCounter());

    sLFGMgr.ClearLFRList(GetPlayer());

    if(sWorld.getConfig(CONFIG_BOOL_RESTRICTED_LFG_CHANNEL) && _player->GetSession()->GetSecurity() == SEC_PLAYER )
        GetPlayer()->LeaveLFGChannel();

}

void WorldSession::HandleSetLfgCommentOpcode( WorldPacket & recv_data )
{
    std::string comment;
    recv_data >> comment;

    DEBUG_LOG("CMSG_SET_LFG_COMMENT: [%s]", comment.c_str());

    GetPlayer()->GetLFGPlayerState()->SetComment(comment);
}

void WorldSession::HandleLfgSetRolesOpcode(WorldPacket &recv_data)
{
    uint8 roles;
    recv_data >> roles;

    Group* group = GetPlayer()->GetGroup();
    if (group)
    {
        bool isChanged = sLFGMgr.RoleChanged(GetPlayer(), LFGRoleMask(roles));
        DEBUG_LOG("CMSG_LFG_SET_ROLES: Group %u, Player %u, Roles: %u %s", group->GetObjectGuid().GetCounter(), GetPlayer()->GetObjectGuid().GetCounter(), roles, isChanged ? "changed" : "not changed");
        sLFGMgr.UpdateRoleCheck(group);
    }
    else
    {
        GetPlayer()->GetLFGPlayerState()->SetRoles(LFGRoleMask(roles));
        DEBUG_LOG("CMSG_LFG_SET_ROLES (not in group) Player %u roles %u", GetPlayer()->GetObjectGuid().GetCounter(), roles);
    }
}

void WorldSession::HandleLfgSetBootVoteOpcode(WorldPacket &recv_data)
{
    bool agree;                                             // Agree to kick player
    recv_data >> agree;

    DEBUG_LOG("CMSG_LFG_SET_BOOT_VOTE %u agree: %u", GetPlayer()->GetObjectGuid().GetCounter(), agree ? 1 : 0);
    sLFGMgr.UpdateBoot(GetPlayer(), LFGAnswer(agree));
}

void WorldSession::HandleLfgTeleportOpcode(WorldPacket &recv_data)
{
    bool agree;
    recv_data >> agree;

    DEBUG_LOG("CMSG_LFG_TELEPORT  %u teleport: %u", GetPlayer()->GetObjectGuid().GetCounter(), agree ? 1 : 0);
    sLFGMgr.Teleport(GetPlayer(), agree, true);
}

void WorldSession::HandleLfgPlayerLockInfoRequestOpcode(WorldPacket &/*recv_data*/)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE) && !sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE))
    {
        DEBUG_LOG("CMSG_LFD_PLAYER_LOCK_INFO_REQUEST %u failed - Dungeon finder disabled", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }

    DEBUG_LOG("CMSG_LFD_PLAYER_LOCK_INFO_REQUEST %u ", GetPlayer()->GetObjectGuid().GetCounter());

    LFGDungeonSet    randomlist = sLFGMgr.GetRandomDungeonsForPlayer(GetPlayer());
    LFGLockStatusMap const lockSet = *GetPlayer()->GetLFGPlayerState()->GetLockMap();

    uint32 rsize = randomlist.size();
    uint32 lsize = lockSet.size();

    WorldPacket data(SMSG_LFG_PLAYER_INFO, 1 + rsize * (4 + 1 + 4 + 4 + 4 + 4 + 1 + 4 + 4 + 4) + 4 + lsize * (1 + 4 + 4 + 4 + 4 + 1 + 4 + 4 + 4));

    if (rsize == 0)
    {
        data << uint8(0);
    }
    else
    {
        uint8 done = 0;
        data << uint8(rsize);                               // Random Dungeon count
        for (LFGDungeonSet::const_iterator itr = randomlist.begin(); itr != randomlist.end(); ++itr)
        {
            data << uint32((*itr)->Entry());                     // Entry
            LFGReward const* reward = sLFGMgr.GetRandomDungeonReward(*itr,GetPlayer());
            Quest const* qRew = NULL;
            if (reward)
            {
                Quest const* pQuest = sObjectMgr.GetQuestTemplate(reward->reward[0].questId);

                if (!GetPlayer()->CanTakeQuest(pQuest, false))
                    done = 1;

                qRew = sObjectMgr.GetQuestTemplate(reward->reward[done].questId);
            }
            if (qRew)
            {
                data << uint8(done);
                data << uint32(qRew->GetRewOrReqMoney());
                data << uint32(qRew->XPValue(GetPlayer()));
                data << uint32(reward->reward[done].variableMoney);
                data << uint32(reward->reward[done].variableXP);
                data << uint8(qRew->GetRewItemsCount());
                if (qRew->GetRewItemsCount())
                {
                    ItemPrototype const* iProto = NULL;
                    for (uint8 i = 0; i < QUEST_REWARDS_COUNT; ++i)
                    {
                        if (!qRew->RewItemId[i])
                            continue;

                        iProto = ObjectMgr::GetItemPrototype(qRew->RewItemId[i]);

                        data << uint32(qRew->RewItemId[i]);
                        data << uint32(iProto ? iProto->DisplayInfoID : 0);
                        data << uint32(qRew->RewItemCount[i]);
                    }
                }
            }
            else
            {
                data << uint8(0);
                data << uint32(0);
                data << uint32(0);
                data << uint32(0);
                data << uint32(0);
                data << uint8(0);
            }
        }
    }

    if (lsize == 0)
    {
        data << uint8(0);
    }
    else
    {
        data << uint32(lockSet.size());                             // Size of lock dungeons
        for (LFGLockStatusMap::const_iterator itr = lockSet.begin(); itr != lockSet.end(); ++itr)
        {
            data << uint32((*itr->first).Entry());                   // Dungeon entry + type
            data << uint32(itr->second);                             // Lock status
        }
    }
    SendPacket(&data);
}

void WorldSession::HandleLfgPartyLockInfoRequestOpcode(WorldPacket & /*recv_data*/)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE) && !sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE))
    {
        DEBUG_LOG("CMSG_LFD_PARTY_LOCK_INFO_REQUEST %u failed - Dungeon finder disabled", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }

    DEBUG_LOG("CMSG_LFD_PARTY_LOCK_INFO_REQUEST %u", GetPlayer()->GetObjectGuid().GetCounter());
    uint32 size = 0;

    Group* group = GetPlayer()->GetGroup();
    if (!group)
    {
        WorldPacket data(SMSG_LFG_PARTY_INFO, 1 + size);
        data << uint8(0);
        SendPacket(&data);
    }
    else
    {
        std::map<ObjectGuid,LFGLockStatusMap const> lockMap;
        lockMap.clear();
        uint8 membersCount = 0;

        for (GroupReference *itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* player = itr->getSource();

            if (!player || !player->IsInWorld())
                continue;

            LFGLockStatusMap const lockSet = *player->GetLFGPlayerState()->GetLockMap();

            size += 8 + 4 + lockSet.size() * (4 + 4);

            lockMap.insert(std::make_pair(player->GetObjectGuid(), lockSet));
            membersCount++;
        }

        WorldPacket data(SMSG_LFG_PARTY_INFO, 1 + size);

        data << membersCount;

        for (std::map<ObjectGuid,LFGLockStatusMap const>::const_iterator  itr1 = lockMap.begin(); itr1 != lockMap.end(); ++itr1)
        {

            data << itr1->first;
            for (LFGLockStatusMap::const_iterator itr2 = itr1->second.begin(); itr2 != itr1->second.end(); ++itr2)
            {
                data << uint32(itr2->first->Entry());                   // Dungeon entry + type
                data << uint32(itr2->second);                          // Lock status
            }
        }

        SendPacket(&data);
    }
}

void WorldSession::HandleLfgProposalResultOpcode(WorldPacket &recv_data)
{
    uint32 ID;                                              // Internal proposal ID
    bool   accept;                                          // Accept to join?
    recv_data >> ID;
    recv_data >> accept;

    DEBUG_LOG("CMSG_LFG_PROPOSAL_RESULT %u proposal: %u accept: %u", GetPlayer()->GetObjectGuid().GetCounter(), ID, accept ? 1 : 0);
    sLFGMgr.UpdateProposal(ID, GetPlayer()->GetObjectGuid(), accept);
}

void WorldSession::SendLfgJoinResult(LFGJoinResult checkResult, uint8 checkValue, bool withLockMap)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE) && !sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE))
    {
        DEBUG_LOG("SendLfgJoinResult %u failed - Dungeon finder disabled", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }

    uint32 size = 0;

    Group* pGroup = GetPlayer()->GetGroup();
    uint8 membersCount = 0;
    std::map<ObjectGuid,LFGLockStatusMap const*> lockMap;
    lockMap.clear();

    if (pGroup && withLockMap)
    {
        size +=1;
        for (GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* player = itr->getSource();

            if (!player->IsInWorld())
                continue;

            LFGLockStatusMap const* lockSet = player->GetLFGPlayerState()->GetLockMap();

            size += 8 + 4 + lockSet->size() * (4 + 4);

            lockMap.insert(std::make_pair(player->GetObjectGuid(), lockSet));
            membersCount++;
        }
    }

    DEBUG_LOG("SMSG_LFG_JOIN_RESULT checkResult: %u checkValue: %u", checkResult, checkValue);

    WorldPacket data(SMSG_LFG_JOIN_RESULT, 4 + 4 + size);

    data << uint32(checkResult);                            // Check Result
    data << uint32(checkValue);                             // Check Value

    if (pGroup && withLockMap)
    {
        data << membersCount;

        for (std::map<ObjectGuid,LFGLockStatusMap const*>::const_iterator  itr1 = lockMap.begin(); itr1 != lockMap.end(); ++itr1)
        {

            data << itr1->first;
            for (LFGLockStatusMap::const_iterator itr2 = itr1->second->begin(); itr2 != itr1->second->end(); ++itr2)
            {
                data << uint32((*itr2->first).Entry());                   // Dungeon entry + type
                data << uint32(itr2->second);                             // Lock status
            }
        }
    }

    SendPacket(&data);
}

void WorldSession::SendLfgUpdateParty(LFGUpdateType updateType, LFGType type)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE) && !sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE))
    {
        DEBUG_LOG("SendLfgUpdateParty %u failed - Dungeon finder disabled", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }

    bool join = false;
    bool extrainfo = false;
    bool queued = false;

    switch(updateType)
    {
        case LFG_UPDATETYPE_JOIN_PROPOSAL:
            extrainfo = true;
            if (type != LFG_TYPE_RAID)
                queued = true;
            else
                join = true;
            break;
        case LFG_UPDATETYPE_ADDED_TO_QUEUE:
            extrainfo = true;
            join = true;
            queued = true;
            break;
        case LFG_UPDATETYPE_CLEAR_LOCK_LIST:
            // join = true;
            // TODO: Sometimes queued and extrainfo - Check ocurrences...
            queued = true;
            extrainfo = false;
            break;
        case LFG_UPDATETYPE_PROPOSAL_BEGIN:
            extrainfo = true;
            join = true;
            break;
        default:
            break;
    }

    LFGDungeonSet const* dungeons = GetPlayer()->GetLFGPlayerState()->GetDungeons();
    uint8 size = dungeons->size();
    std::string comment = GetPlayer()->GetLFGPlayerState()->GetComment();

    DEBUG_LOG("SMSG_LFG_UPDATE_PARTY updatetype: %u", updateType);

    WorldPacket data(SMSG_LFG_UPDATE_PARTY, 1 + 1 + (extrainfo ? 1 : 0) * (1 + 1 + 1 + 1 + 1 + size * 4 + comment.length()));
    data << uint8(updateType);                              // Lfg Update type
    data << uint8(extrainfo);                               // Extra info
    if (extrainfo)
    {
        data << uint8(join);                                // LFG Join
        data << uint8(queued);                              // Join the queue
        for (uint8 i = 0; i < 5; ++i)
            data << uint8(0);                               // unk - Always 0

        data << uint8(size);

        for (LFGDungeonSet::const_iterator itr = dungeons->begin(); itr != dungeons->end(); ++itr)
        {
            if (!*itr)
                continue;

            LFGDungeonEntry const* dungeon = *itr;
            if (!dungeon)
                data << uint32(0);
            else
                data << uint32(dungeon->Entry());
        }

        data << comment.c_str();
    }
    SendPacket(&data);
}

void WorldSession::SendLfgUpdatePlayer(LFGUpdateType updateType, LFGType type)
{

    if (!sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE) && !sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE))
    {
        DEBUG_LOG("SendLfgUpdatePlayer %u failed - Dungeon finder disabled", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }

    bool queued = false;
    bool extrainfo = false;

    switch(updateType)
    {
        case LFG_UPDATETYPE_JOIN_PROPOSAL:
            extrainfo = true;
            if (type != LFG_TYPE_RAID)
                queued = true;
            break;
        case LFG_UPDATETYPE_ADDED_TO_QUEUE:
            queued = true;
            break;
        //case LFG_UPDATETYPE_CLEAR_LOCK_LIST: // TODO: Sometimes has extrainfo - Check ocurrences...
        case LFG_UPDATETYPE_PROPOSAL_BEGIN:
            extrainfo = true;
            break;
        default:
            break;
    }
    LFGDungeonSet const* dungeons = GetPlayer()->GetLFGPlayerState()->GetDungeons();
    uint8 size = dungeons->size();
    std::string comment = GetPlayer()->GetLFGPlayerState()->GetComment();

    DEBUG_LOG("SMSG_LFG_UPDATE_PLAYER %u updatetype: %u", GetPlayer()->GetObjectGuid().GetCounter(), updateType);

    WorldPacket data(SMSG_LFG_UPDATE_PLAYER, 1 + 1 + (extrainfo ? 1 : 0) * (1 + 1 + 1 + 1 + size * 4 + comment.length()));
    data << uint8(updateType);                              // Lfg Update type
    data << uint8(extrainfo);                               // Extra info
    if (extrainfo)
    {
        data << uint8(queued);                              // Join the queue
        data << uint8(0);                                   // unk - Always 0
        data << uint8(0);                                   // unk - Always 0

        data << uint8(size);

        for (LFGDungeonSet::const_iterator itr = dungeons->begin(); itr != dungeons->end(); ++itr)
        {
            if (!*itr)
                continue;

            LFGDungeonEntry const* dungeon = *itr;
            if (!dungeon)
                data << uint32(0);
            else
                data << uint32(dungeon->Entry());
        }

        data << comment.c_str();
    }
    SendPacket(&data);
}


void WorldSession::SendLfgUpdateList(uint32 dungeonID)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFR_ENABLE))
    {
        DEBUG_LOG("SendLfgUpdateList %u failed - Raid finder disabled", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }

    DEBUG_LOG("SMSG_LFG_SEARCH_RESULTS %u dungeonentry: %u ", GetPlayer()->GetObjectGuid().GetCounter(), dungeonID);

    LFGDungeonEntry const* dungeon = sLFGMgr.GetDungeon(dungeonID);

    if (!dungeon)
        return;

    Team team = sWorld.getConfig(CONFIG_BOOL_ALLOW_TWO_SIDE_INTERACTION_GROUP) ? TEAM_NONE : GetPlayer()->GetTeam();

    GuidSet   groups = sLFGMgr.GetDungeonGroupQueue(dungeon, team);
    GuidSet   players = sLFGMgr.GetDungeonPlayerQueue(dungeon, team);

    uint32 groupCount = groups.size();
    uint32 groupSize = 4+4;

    for (GuidSet::const_iterator itr = groups.begin(); itr != groups.end(); ++itr)
    {
        Group* pGroup   = sObjectMgr.GetGroup(*itr);
        if (!pGroup)
            continue;

        Player* pLeader = sObjectMgr.GetPlayer(pGroup->GetLeaderGuid());
        if (!pLeader)
            continue;

        pLeader->GetLFGPlayerState()->AddFlags(LFG_MEMBER_FLAG_CHARINFO |
                                        LFG_MEMBER_FLAG_COMMENT |
                                        LFG_MEMBER_FLAG_GROUPLEADER |
                                        LFG_MEMBER_FLAG_GROUPGUID |
                                        LFG_MEMBER_FLAG_ROLES |
                                        LFG_MEMBER_FLAG_AREA  |
                                        LFG_MEMBER_FLAG_STATUS  |
                                        LFG_MEMBER_FLAG_BIND);

        uint32 flags = pLeader->GetLFGPlayerState()->GetFlags();

        if (flags & LFG_MEMBER_FLAG_COMMENT)
            groupSize += pLeader->GetLFGPlayerState()->GetComment().size()+1;
        if (flags & LFG_MEMBER_FLAG_ROLES)
            groupSize +=3;
        if (flags & LFG_MEMBER_FLAG_BIND)
            groupSize += (8+4);

        players.insert(*itr);

        for (GroupReference *itr2 = pGroup->GetFirstMember(); itr2 != NULL; itr2 = itr2->next())
        {
            Player* player = itr2->getSource();

            if (!player || player == pLeader)
                continue;

            player->GetLFGPlayerState()->AddFlags(LFG_MEMBER_FLAG_GROUPLEADER |
                                        LFG_MEMBER_FLAG_GROUPGUID |
                                        LFG_MEMBER_FLAG_STATUS);

            player->GetLFGPlayerState()->RemoveFlags(LFG_MEMBER_FLAG_CHARINFO |
                                        LFG_MEMBER_FLAG_COMMENT |
                                        LFG_MEMBER_FLAG_ROLES |
                                        LFG_MEMBER_FLAG_AREA  |
                                        LFG_MEMBER_FLAG_BIND);
            players.insert(player->GetObjectGuid());
        }

    }

    uint32 playerCount = players.size();
    uint32 playerSize = 4+4;

    uint32 guidsSize = 0;
    GuidSet playersUpdated;
    playersUpdated.clear();

    for(GuidSet::const_iterator itr = players.begin(); itr != players.end(); ++itr)
    {
        Player* player   = sObjectMgr.GetPlayer(*itr);

        if (!player || !player->IsInWorld())
            continue;

        uint32 flags = player->GetLFGPlayerState()->GetFlags();

        playerSize += (8+4);

        if (flags &  LFG_MEMBER_FLAG_CHARINFO)
            playerSize += (1+1+1+3+4+4+4+4+4+4+4+4+4+4+4+4+4+4+4+4+4+4+4+4);

        if (flags & LFG_MEMBER_FLAG_COMMENT)
            playerSize += player->GetLFGPlayerState()->GetComment().size()+1;         // comment

        if (flags & LFG_MEMBER_FLAG_GROUPLEADER)
            playerSize += 1;

        if (flags & LFG_MEMBER_FLAG_GROUPGUID)
            playerSize += 8;

        if (flags & LFG_MEMBER_FLAG_ROLES)
            playerSize += 1;

        if (flags & LFG_MEMBER_FLAG_AREA)
            playerSize += 4;

        if (flags & LFG_MEMBER_FLAG_STATUS)
            playerSize += 1;

        if (flags & LFG_MEMBER_FLAG_BIND)
            playerSize += (8+4);

        if (flags & LFG_MEMBER_FLAG_UPDATE)
        {
            player->GetLFGPlayerState()->RemoveFlags(LFG_MEMBER_FLAG_UPDATE);
            playersUpdated.insert(player->GetObjectGuid());
            guidsSize += 8;
        }

    }

    WorldPacket data(SMSG_LFG_SEARCH_RESULTS, 4 + 4 + 1 + groupSize + playerSize + guidsSize);

    data << uint32(dungeon->type);                           // type
    data << uint32(dungeon->Entry());                        // entry from LFGDungeons.dbc

    if (!playersUpdated.empty())
    {
        data << uint8(playersUpdated.size());
        for (GuidSet::const_iterator itr = playersUpdated.begin(); itr != playersUpdated.end(); ++itr)
        {
            data << *itr;                                 // player guid
        }
    }
    else
        data << uint8(0);


    if (!groups.empty())
    {
        data << uint32(groupCount);                          // groups count
        data << uint32(groupCount);                          // groups count2

        for (GuidSet::const_iterator itr = groups.begin(); itr != groups.end(); ++itr)
        {
            Group* group   = sObjectMgr.GetGroup(*itr);
            if (!group)
                continue;

            Player* leader = sObjectMgr.GetPlayer(group->GetLeaderGuid());

            uint32 flags = leader->GetLFGPlayerState()->GetFlags();

            data << group->GetObjectGuid();

            data << flags;

            if (flags & LFG_MEMBER_FLAG_COMMENT)
            {
                data << leader->GetLFGPlayerState()->GetComment().c_str();
            }

            if (flags & LFG_MEMBER_FLAG_ROLES)
            {
                for (int i = 0; i < 3; ++i)
                {
                // need implement function for roles count calculation. or not need?
                    data << uint8(0);
                }
            }

            if (flags & LFG_MEMBER_FLAG_BIND)
            {
                ObjectGuid instanceGuid;
                uint32 encounters = 0;
                if (InstancePlayerBind* bind = leader->GetBoundInstance(dungeon->map, Difficulty(dungeon->difficulty)))
                {
                    if (DungeonPersistentState* state = bind->state)
                    {
                        instanceGuid = state->GetInstanceGuid();
                        encounters = state->GetCompletedEncountersMask();
                    }
                }
                data << instanceGuid;
                data << encounters;
            }
        }
    }
    else
    {
        data << uint32(0);
        data << uint32(0);                                       // groups count2
    }


    if (!players.empty())
    {
        data << uint32(playerCount);                           // players count
        data << uint32(playerCount);                           // players count 2

        for(GuidSet::const_iterator itr = players.begin(); itr != players.end(); ++itr)
        {
            Player* player   = sObjectMgr.GetPlayer(*itr);

            if (!player || !player->IsInWorld())
                continue;

            uint32 flags = player->GetLFGPlayerState()->GetFlags();

            data << *itr;                                         // guid

            data << flags;                                        // flags

            if (flags &  LFG_MEMBER_FLAG_CHARINFO)                // charinfo
            {
                data << uint8(player->getLevel());
                data << uint8(player->getClass());
                data << uint8(player->getRace());

                for(int i = 0; i < 3; ++i)
                    data << uint8(player->GetTalentsCount(i));                                      // spent talents count in specific tab

                data << uint32(player->GetArmor());                                                 // armor
                data << uint32(player->SpellBaseDamageBonusDone(SPELL_SCHOOL_MASK_SPELL));          // spd
                data << uint32(player->SpellBaseHealingBonusDone(SPELL_SCHOOL_MASK_SPELL));         // heal
                data << uint32(player->GetRatingBonusValue(CR_CRIT_MELEE));                         // crit rating melee
                data << uint32(player->GetRatingBonusValue(CR_CRIT_RANGED));                        // crit rating ranged
                data << uint32(player->GetRatingBonusValue(CR_CRIT_SPELL));                         // crit rating spell
                data << float(player->GetFloatValue(UNIT_FIELD_POWER_REGEN_FLAT_MODIFIER)*5);                             // mp5
                data << float(player->GetFloatValue(UNIT_FIELD_POWER_REGEN_INTERRUPTED_FLAT_MODIFIER)*5);                 // unk
                data << uint32(player->GetTotalAttackPowerValue(BASE_ATTACK));                      // attack power
                data << uint32(player->GetTotalStatValue(STAT_AGILITY));                            // agility
                data << uint32(player->GetMaxHealth());                                             // health
                data << uint32(player->GetMaxPower(player->getPowerType()));                        // power
                data << uint32(player->GetFreeTalentPoints());                                      // free talent points (TOM_RUS)
                data << float(0);                                                                   // unk
                data << uint32(player->GetRatingBonusValue(CR_DEFENSE_SKILL));                      // defence rating
                data << uint32(player->GetRatingBonusValue(CR_DODGE));                              // dodge rating
                data << uint32(player->GetRatingBonusValue(CR_BLOCK));                              // block rating
                data << uint32(player->GetRatingBonusValue(CR_PARRY));                              // parry rating
                data << uint32(player->GetRatingBonusValue(CR_HASTE_MELEE));                        // crit rating
                data << uint32(player->GetRatingBonusValue(CR_EXPERTISE));                          // expertize
            }

            if (flags & LFG_MEMBER_FLAG_COMMENT)
                data << player->GetLFGPlayerState()->GetComment().c_str();         // comment

            if (flags & LFG_MEMBER_FLAG_GROUPLEADER)                         // Group leader flag
            {
                bool isLeader = false;
                if (Group* group = player->GetGroup())
                    if (player->GetObjectGuid() == group->GetLeaderGuid())
                        isLeader = true;

                data << uint8(isLeader);
            }

            if (flags & LFG_MEMBER_FLAG_GROUPGUID)                          // Group guid
            {
                ObjectGuid groupGuid = ObjectGuid();
                if (Group* group = player->GetGroup())
                    groupGuid = group->GetObjectGuid();

                data << groupGuid;
            }

            if (flags & LFG_MEMBER_FLAG_ROLES)                              // rolesMask
                data << uint8(player->GetLFGPlayerState()->GetRoles());

            if (flags & LFG_MEMBER_FLAG_AREA)                               // Area
                data << uint32(player->GetAreaId());

            if (flags & LFG_MEMBER_FLAG_STATUS)                             // status
                data << uint8(0);

            if (flags & LFG_MEMBER_FLAG_BIND)
            {
                ObjectGuid instanceGuid;
                uint32 encounters = 0;
                if (InstancePlayerBind* bind = player->GetBoundInstance(dungeon->map, Difficulty(dungeon->difficulty)))
                {
                    if (DungeonPersistentState* state = bind->state)
                    {
                        instanceGuid = state->GetInstanceGuid();
                        encounters = state->GetCompletedEncountersMask();
                    }
                }
                data << instanceGuid;
                data << encounters;
            }

        }
    }
    else
    {
        data << uint32(0);                                          // players count
        data << uint32(0);                                          // unk
    }
    SendPacket(&data);
}

void WorldSession::SendLfgUpdateSearch(bool update)
{
    DEBUG_LOG("SMSG_LFG_UPDATE_SEARCH %u update: %u",GetPlayer()->GetObjectGuid().GetCounter(), update ? 1 : 0);
    WorldPacket data(SMSG_LFG_UPDATE_SEARCH, 1);
    data << uint8(update);                                  // In Lfg Queue?
    SendPacket(&data);
}

void WorldSession::SendLfgDisabled()
{
    DEBUG_LOG("SMSG_LFG_DISABLED %u", GetPlayer()->GetObjectGuid().GetCounter());
    WorldPacket data(SMSG_LFG_DISABLED, 0);
    SendPacket(&data);
}

void WorldSession::SendLfgOfferContinue(LFGDungeonEntry const* dungeon)
{
    if (!dungeon)
        return;

    Group* group = GetPlayer()->GetGroup();
    if (!group)
        return;

    DEBUG_LOG("SMSG_LFG_OFFER_CONTINUE %u dungeon entry: %u", GetPlayer()->GetObjectGuid().GetCounter(), dungeon->ID);
    WorldPacket data(SMSG_LFG_OFFER_CONTINUE, 4);
    data << uint32(dungeon->Entry());
    SendPacket(&data);
}

void WorldSession::SendLfgTeleportError(LFGTeleportError msg)
{
    DEBUG_LOG("SMSG_LFG_TELEPORT_DENIED %u reason: %u", GetPlayer()->GetObjectGuid().GetCounter(), msg);
    WorldPacket data(SMSG_LFG_TELEPORT_DENIED, 4);
    data << uint32(msg);
    SendPacket(&data);
}

void WorldSession::SendLfgPlayerReward(LFGDungeonEntry const* dungeon, const LFGReward* reward, const Quest* qRew, bool isSecond)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE))
    {
        DEBUG_LOG("SendLfgPlayerReward %u failed - Dungeon finder disabled", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }

    LFGDungeonEntry const* realdungeon = *GetPlayer()->GetLFGPlayerState()->GetDungeons()->begin();

    if (!dungeon || !realdungeon || !reward || !qRew)
        return;

    uint8 itemNum = uint8(qRew ? qRew->GetRewItemsCount() : 0);
    uint8 done = uint8(isSecond);

    DEBUG_LOG("SMSG_LFG_PLAYER_REWARD %u dungeonEntry: %u ", GetPlayer()->GetObjectGuid().GetCounter(), dungeon->ID);

    WorldPacket data(SMSG_LFG_PLAYER_REWARD, 4 + 4 + 1 + 4 + 4 + 4 + 4 + 4 + 1 + itemNum * (4 + 4 + 4));
    data << uint32(dungeon->Entry());                                            // Random Dungeon Finished
    data << uint32(realdungeon->Entry());                                        // Dungeon Finished
    data << uint8(done);
    data << uint32(1);
    data << uint32(qRew->GetRewOrReqMoney());
    data << uint32(qRew->XPValue(GetPlayer()));
    data << uint32(reward->reward[done].variableMoney);
    data << uint32(reward->reward[done].variableXP);
    data << uint8(itemNum);
    if (itemNum)
    {
        ItemPrototype const* iProto = NULL;
        for (uint8 i = 0; i < QUEST_REWARDS_COUNT; ++i)
        {
            if (!qRew->RewItemId[i])
                continue;

            iProto = ObjectMgr::GetItemPrototype(qRew->RewItemId[i]);

            data << uint32(qRew->RewItemId[i]);
            data << uint32(iProto ? iProto->DisplayInfoID : 0);
            data << uint32(qRew->RewItemCount[i]);
        }
    }
    SendPacket(&data);
}

void WorldSession::SendLfgQueueStatus(LFGDungeonEntry const* dungeon, LFGQueueStatus* status)
{
    DEBUG_LOG("SMSG_LFG_QUEUE_STATUS %u dungeonEntry: %u ", GetPlayer()->GetObjectGuid().GetCounter(), dungeon->ID);

    LFGQueueInfo* pqInfo = sLFGMgr.GetQueueInfo(GetPlayer()->GetObjectGuid());

    if (GetPlayer()->GetGroup() && GetPlayer()->GetGroup()->isLFGGroup())
        pqInfo = sLFGMgr.GetQueueInfo(GetPlayer()->GetGroup()->GetObjectGuid());

    if (!pqInfo)
        return;

    WorldPacket data(SMSG_LFG_QUEUE_STATUS, 4 + 4 + 4 + 4 + 4 +4 + 1 + 1 + 1 + 4);
    data << uint32(dungeon->ID);                                   // Dungeon
    data << int32(status->avgWaitTime);                            // Average Wait time
    data << int32(status->waitTime);                               // Wait Time
    data << int32(status->waitTimeTanks);                          // Wait Tanks
    data << int32(status->waitTimeHealer);                         // Wait Healers
    data << int32(status->waitTimeDps);                            // Wait Dps
    data << uint8(pqInfo->tanks);                                  // Tanks needed
    data << uint8(pqInfo->healers);                                // Healers needed
    data << uint8(pqInfo->dps);                                    // Dps needed
    data << uint32(time(NULL) - pqInfo->joinTime);
                                                                   // Player/group wait time in queue
    SendPacket(&data);
}

void WorldSession::SendLfgRoleChosen(ObjectGuid guid, uint8 roles)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE))
    {
        DEBUG_LOG("SendLfgRoleChosen %u failed - Dungeon finder disabled", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }

    DEBUG_LOG("SMSG_ROLE_CHOSEN %u guid: %u roles: %u", GetPlayer()->GetObjectGuid().GetCounter(), guid.GetCounter(), roles);

    WorldPacket data(SMSG_ROLE_CHOSEN, 8 + 1 + 4);
    data << guid;                                  // Guid
    data << uint8(roles != LFG_ROLE_MASK_NONE);    // Ready
    data << uint32(roles);                         // Roles

    SendPacket(&data);
}

void WorldSession::SendLfgBootPlayer()
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE))
    {
        DEBUG_LOG("SendLfgBootPlayer %u failed - Dungeon finder disabled", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }
    Group* pGroup = GetPlayer()->GetGroup();

    if (!pGroup)
    {
        sLog.outError("ERROR:SendLfgBootPlayer %u failed - player not in group!", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }

    ObjectGuid guid = GetPlayer()->GetObjectGuid();
    LFGAnswerMap* votes = pGroup->GetLFGGroupState()->GetBootMap();

    if (votes->empty())
    {
        sLog.outError("ERROR:SendLfgBootPlayer %u failed - votes map is empty!", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }

    LFGAnswer playerVote = votes->find(guid)->second;
    uint8 votesNum = 0;
    uint8 agreeNum = 0;
    uint32 secsleft = uint8(pGroup->GetLFGGroupState()->GetBootCancelTime() - time(NULL));

    bool isBootContinued = (pGroup->GetLFGGroupState()->GetBootResult() == LFG_ANSWER_PENDING);

    for (LFGAnswerMap::const_iterator itr = votes->begin(); itr != votes->end(); ++itr)
    {
        if (itr->second != LFG_ANSWER_PENDING)
        {
            ++votesNum;
            if (itr->second == LFG_ANSWER_AGREE)
                ++agreeNum;
        }
    }

    DEBUG_LOG("SMSG_LFG_BOOT_PLAYER %u   didVote: %u - agree: %u - victim: %u votes: %u - agrees: %u - left: %u - needed: %u - reason %s",
    GetPlayer()->GetObjectGuid().GetCounter(), uint8(playerVote != LFG_ANSWER_PENDING), uint8(playerVote == LFG_ANSWER_AGREE), pGroup->GetLFGGroupState()->GetBootVictim().GetCounter(), votesNum, agreeNum, secsleft, pGroup->GetLFGGroupState()->GetVotesNeeded(), pGroup->GetLFGGroupState()->GetBootReason().c_str());
    WorldPacket data(SMSG_LFG_BOOT_PLAYER, 1 + 1 + 1 + 8 + 4 + 4 + 4 + 4 + pGroup->GetLFGGroupState()->GetBootReason().length()+1);
    data << uint8(isBootContinued);                           // Vote in progress
    data << uint8(playerVote != LFG_ANSWER_PENDING);          // Did Vote
    data << uint8(playerVote == LFG_ANSWER_AGREE);            // Agree
    data << pGroup->GetLFGGroupState()->GetBootVictim();      // Victim GUID
    data << uint32(votesNum);                                 // Total Votes
    data << uint32(agreeNum);                                 // Agree Count
    data << uint32(secsleft);                                 // Time Left
    data << uint32(pGroup->GetLFGGroupState()->GetVotesNeeded());   // Needed Votes
    data << pGroup->GetLFGGroupState()->GetBootReason().c_str();    // Kick reason
    SendPacket(&data);
}

void WorldSession::SendLfgUpdateProposal(LFGProposal* pProposal)
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE))
    {
        DEBUG_LOG("SendLfgUpdateProposal %u failed - Dungeon finder disabled", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }

    if (!pProposal)
        return;

    LFGDungeonEntry const* dungeon = pProposal->GetDungeon();
    if (!dungeon)
    {
        DEBUG_LOG("SMSG_LFG_PROPOSAL_UPDATE: no dungeon in proposal %u, returning.", pProposal->m_uiID);
        return;
    }

    ObjectGuid guid = GetPlayer()->GetObjectGuid();

    bool isSameDungeon = false;
    bool isSameGroup   = false;

    uint32 completedEncounters = 0;
    LFGRolesMap rolesMap;

    if (Group* group = pProposal->GetGroup())
    {
        for (GroupReference* itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* pGroupMember = itr->getSource();
            if (pGroupMember && pGroupMember->IsInWorld())
            {
                rolesMap.insert(std::make_pair(pGroupMember->GetObjectGuid(), pGroupMember->GetLFGPlayerState()->GetRoles()));

                if (InstancePlayerBind* bind = pGroupMember->GetBoundInstance(dungeon->map, Difficulty(dungeon->difficulty)))
                {
                    if (DungeonPersistentState* state = bind->state)
                        completedEncounters |= state->GetCompletedEncountersMask();
                }
            }
        }

        // isContinue = group->isLFGGroup() && sLFGMgr->GetState(gguid) != LFG_STATE_FINISHED_DUNGEON;
        isSameDungeon =  dungeon->map == GetPlayer()->GetMapId();
        isSameGroup   =  GetPlayer()->GetGroup() == group;
    }

    GuidSet const proposalGuids = pProposal->GetMembers();
    if (!proposalGuids.empty())
    {
        for (GuidSet::const_iterator itr = proposalGuids.begin(); itr != proposalGuids.end(); ++itr)
        {
            Player* player = sObjectMgr.GetPlayer(*itr);
            if (player && player->IsInWorld())
                rolesMap.insert(std::make_pair(player->GetObjectGuid(), player->GetLFGPlayerState()->GetRoles()));
        }
    }

    uint32 size = rolesMap.size();

    DEBUG_LOG("SMSG_LFG_PROPOSAL_UPDATE proposal %u, player %u, state: %u", pProposal->m_uiID, GetPlayer()->GetObjectGuid().GetCounter(), pProposal->GetState());


    WorldPacket data(SMSG_LFG_PROPOSAL_UPDATE, 4 + 1 + 4 + 4 + 1 + 1 + size * (4 + 1 + 1 + 1 + 1 +1));

    data << uint32(dungeon->Entry());                          // Dungeon
    data << uint8(pProposal->GetState());                      // Result state
    data << uint32(pProposal->m_uiID);                         // Internal Proposal ID
    data << uint32(completedEncounters);                       // Bosses killed
    data << uint8(isSameDungeon);                              // Silent (show client window)
    data << uint8(size);                                       // Group size

    for (LFGRolesMap::const_iterator itr = rolesMap.begin(); itr != rolesMap.end(); ++itr)
    {
        Player* pPlayer = sObjectMgr.GetPlayer(itr->first);
        if (!pPlayer)
            continue;

        isSameDungeon =  dungeon->map == pPlayer->GetMapId();
        isSameGroup   =  pPlayer->GetGroup() == pProposal->GetGroup();

        data << uint32(itr->second);                              // Role
        data << uint8(pPlayer->GetObjectGuid() == guid);          // Self player
        data << uint8(isSameDungeon);                             // Not in dungeon
        data << uint8(isSameGroup);                               // Not same group
        data << uint8(pPlayer->GetLFGPlayerState()->GetAnswer() != LFG_ANSWER_PENDING); // Answered
        data << uint8(pPlayer->GetLFGPlayerState()->GetAnswer() == LFG_ANSWER_AGREE); // Accepted
    }
    SendPacket(&data);
}

void WorldSession::SendLfgRoleCheckUpdate()
{
    if (!sWorld.getConfig(CONFIG_BOOL_LFG_ENABLE))
    {
        DEBUG_LOG("SendLfgRoleCheckUpdate %u failed - Dungeon finder disabled", GetPlayer()->GetObjectGuid().GetCounter());
        return;
    }

    Group* pGroup = GetPlayer()->GetGroup();

    if (!pGroup)
        return;

    LFGDungeonSet const* dungeons = pGroup->GetLFGGroupState()->GetDungeons();

    if (!dungeons)
        return;

    DEBUG_LOG("SMSG_LFG_ROLE_CHECK_UPDATE %u, dugeons size " SIZEFMTD, GetPlayer()->GetObjectGuid().GetCounter(), dungeons->size());

    WorldPacket data(SMSG_LFG_ROLE_CHECK_UPDATE, 4 + 1 + 1 + dungeons->size() * 4 + 1 + pGroup->GetMembersCount() * (8 + 1 + 4 + 1));

    data << uint32(pGroup->GetLFGGroupState()->GetRoleCheckState());                     // Check result
    data << uint8(pGroup->GetLFGGroupState()->GetRoleCheckState() == LFG_ROLECHECK_INITIALITING);
    data << uint8(dungeons->size());                                               // Number of dungeons

    if (dungeons->size())
    {
        for (LFGDungeonSet::const_iterator itr = dungeons->begin(); itr != dungeons->end(); ++itr)
        {
            data << uint32(*itr ? (*itr)->Entry() : 0); // Dungeon Entry
        }
    }

    data << uint8(pGroup->GetMembersCount());               // Players in group
    if (pGroup->GetMembersCount())
    {
        // Leader info MUST be sent 1st :S
        ObjectGuid leaderguid = pGroup->GetLeaderGuid();
        Player* pLeader = sObjectMgr.GetPlayer(leaderguid);
        LFGRoleMask roles = LFG_ROLE_MASK_NONE;
        uint8 leaderLevel = 1;
        if (pLeader)
        {
            roles = pLeader->GetLFGPlayerState()->GetRoles();
            leaderLevel = pLeader->getLevel();
        }
        data << leaderguid;                                                  // Guid
        data << uint8(roles != LFG_ROLE_MASK_NONE);                          // Ready
        data << uint32(roles);                                               // Roles
        data << uint8(leaderLevel);                                          // Level

        for (GroupReference* itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            if (Player* pGroupMember = itr->getSource())
            {
                ObjectGuid guid = pGroupMember->GetObjectGuid();
                // Leader data handle first
                if (guid == leaderguid)
                    continue;

                roles = pGroupMember->GetLFGPlayerState()->GetRoles();
                data << guid;                                                    // Guid
                data << uint8(roles != LFG_ROLE_MASK_NONE);                      // Ready
                data << uint32(roles);                                           // Roles
                data << uint8(pGroupMember->getLevel());                         // Level
            }
        }
    }
    SendPacket(&data);
}
