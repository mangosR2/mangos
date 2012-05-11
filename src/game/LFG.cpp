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
#include "SharedDefines.h"
#include "ObjectMgr.h"
#include "LFG.h"
#include "LFGMgr.h"
#include "Group.h"
#include "Player.h"
#include "World.h"

void LFGStateStructure::SetDungeons(LFGDungeonSet* dungeons)
{
    LFGMgr::WriteGuard Guard(sLFGMgr.GetLock());
    m_DungeonsList = *dungeons;
    if (m_DungeonsList.empty())
        m_type = LFG_TYPE_NONE;
    else
    {
        if (LFGDungeonEntry const* entry = *m_DungeonsList.begin())
            m_type = LFGType(entry->type);
        else
            m_type = LFG_TYPE_NONE;
    }
};

void LFGStateStructure::RemoveDungeon(LFGDungeonEntry const* dungeon)
{
    LFGMgr::WriteGuard Guard(sLFGMgr.GetLock());
    m_DungeonsList.erase(dungeon);
    if (m_DungeonsList.empty())
        m_type = LFG_TYPE_NONE;
    else
    {
        if (LFGDungeonEntry const* entry = *m_DungeonsList.begin())
            m_type = LFGType(entry->type);
        else
            m_type = LFG_TYPE_NONE;
    }
};

void LFGStateStructure::AddDungeon(LFGDungeonEntry const* dungeon)
{
    LFGMgr::WriteGuard Guard(sLFGMgr.GetLock());
    m_DungeonsList.insert(dungeon);
};


void LFGPlayerState::Clear()
{
    LFGMgr::WriteGuard Guard(sLFGMgr.GetLock());
    rolesMask = LFG_ROLE_MASK_NONE;
    update = true;
    m_state = LFG_STATE_NONE;
    AddFlags( LFG_MEMBER_FLAG_NONE |
              LFG_MEMBER_FLAG_CHARINFO |
              LFG_MEMBER_FLAG_COMMENT |
              LFG_MEMBER_FLAG_GROUPLEADER |
              LFG_MEMBER_FLAG_GROUPGUID |
              LFG_MEMBER_FLAG_AREA  |
              LFG_MEMBER_FLAG_STATUS  |
              LFG_MEMBER_FLAG_BIND);

    m_type = LFG_TYPE_NONE;
    m_DungeonsList.clear();
    m_LockMap.clear();
    m_comment.clear();
    accept = LFG_ANSWER_PENDING;
    m_proposal = NULL;
    SetState(LFG_STATE_NONE);
    m_teleported = false;
}

LFGLockStatusMap const* LFGPlayerState::GetLockMap()
{
    if (update || m_LockMap.empty())
    {
        m_LockMap.clear();
        m_LockMap = sLFGMgr.GetPlayerLockMap(m_player);
        update = false;
    }
    return &m_LockMap;
};

void LFGPlayerState::SetRoles(uint8 roles)
{
    rolesMask = LFGRoleMask(roles);

    if (Group* group = m_player->GetGroup())
    {
        if (group->GetLeaderGuid() == m_player->GetObjectGuid())
            rolesMask = LFGRoleMask(rolesMask | LFG_ROLE_MASK_LEADER);
        else
            rolesMask = LFGRoleMask(rolesMask & ~LFG_ROLE_MASK_LEADER);
    }
    else
        rolesMask = LFGRoleMask(rolesMask & ~LFG_ROLE_MASK_LEADER);

    rolesMask != LFG_ROLE_MASK_NONE ? AddFlags(LFG_MEMBER_FLAG_ROLES) : RemoveFlags(LFG_MEMBER_FLAG_ROLES);

};

LFGRoleMask LFGPlayerState::GetRoles()
{
    return rolesMask;
};

void LFGPlayerState::SetJoined()
{
    m_jointime = time_t(time(NULL));
    m_teleported = false;
};

bool LFGPlayerState::IsSingleRole()
{
    if (   LFGRoleMask(rolesMask & ~LFG_ROLE_MASK_TANK   & ~LFG_ROLE_MASK_LEADER) == LFG_ROLE_MASK_NONE
        || LFGRoleMask(rolesMask & ~LFG_ROLE_MASK_HEALER & ~LFG_ROLE_MASK_LEADER) == LFG_ROLE_MASK_NONE
        || LFGRoleMask(rolesMask & ~LFG_ROLE_MASK_TANK   & ~LFG_ROLE_MASK_LEADER) == LFG_ROLE_MASK_NONE)
        return true;
    return false;
}

void LFGPlayerState::SetComment(std::string comment)
{
    LFGMgr::WriteGuard Guard(sLFGMgr.GetLock());
    m_comment.clear();
    if (!comment.empty())
    {
        AddFlags(LFG_MEMBER_FLAG_COMMENT);
        m_comment.append(comment);
    }

};

void LFGGroupState::Clear()
{
    LFGMgr::WriteGuard Guard(sLFGMgr.GetLock());
    queued = false;
    update = true;
    m_status = LFG_STATUS_NOT_SAVED;
    m_votesNeeded = 3;
    m_kicksLeft = sWorld.getConfig(CONFIG_UINT32_LFG_MAXKICKS);
    m_flags = LFG_MEMBER_FLAG_NONE |
              LFG_MEMBER_FLAG_COMMENT |
              LFG_MEMBER_FLAG_ROLES |
              LFG_MEMBER_FLAG_BIND;
    m_proposal = NULL;
    m_roleCheckCancelTime = 0;
    m_roleCheckState      = LFG_ROLECHECK_NONE;
    m_type = LFG_TYPE_NONE;
    m_DungeonsList.clear();
    m_LockMap.clear();
    SetDungeon(NULL);
    SetState(LFG_STATE_NONE);
    SaveState();
    StopBoot();
    SetRandomPlayersCount(0);
}

uint8 LFGGroupState::GetVotesNeeded() const
{
    return m_votesNeeded;
}

void LFGGroupState::SetVotesNeeded(uint8 votes)
{
    m_votesNeeded = votes;
}

uint8 const LFGGroupState::GetKicksLeft() const
{
    return m_kicksLeft;
}

void LFGGroupState::StartRoleCheck()
{
    m_roleCheckCancelTime = time_t(time(NULL)) + LFG_TIME_ROLECHECK;
    SetRoleCheckState(LFG_ROLECHECK_INITIALITING);
    SetState(LFG_STATE_ROLECHECK);
}

bool LFGGroupState::IsRoleCheckActive()
{
    if (GetRoleCheckState() != LFG_ROLECHECK_NONE && m_roleCheckCancelTime)
        return true;

    return false;
}

bool LFGGroupState::IsBootActive()
{
    if (GetState() != LFG_STATE_BOOT)
        return false;
    return (time_t(time(NULL)) < m_bootCancelTime);
};

void LFGGroupState::StartBoot(ObjectGuid kicker, ObjectGuid victim, std::string reason)
{
    SaveState();
    m_bootVotes.clear();

    m_bootReason = reason;
    m_bootVictim = victim;
    m_bootCancelTime = time_t(time(NULL) + LFG_TIME_BOOT);
    for (GroupReference* itr = m_group->GetFirstMember(); itr != NULL; itr = itr->next())
    {
        Player* player = itr->getSource();

        if (!player)
            continue;

        ObjectGuid guid = player->GetObjectGuid();

        LFGAnswer vote = LFG_ANSWER_PENDING;

        if (guid == victim)
            vote = LFG_ANSWER_DENY;
        else if (guid == kicker)
            vote = LFG_ANSWER_AGREE;

        m_bootVotes.insert(std::make_pair(guid, vote));
    }
    SetState(LFG_STATE_BOOT);
};

void LFGGroupState::UpdateBoot(ObjectGuid kicker, LFGAnswer answer)
{
    LFGAnswerMap::iterator itr = m_bootVotes.find(kicker);

    if ((*itr).second == LFG_ANSWER_PENDING)
        (*itr).second = answer;
};

void LFGGroupState::StopBoot()
{
    m_bootVotes.clear();
    m_bootVictim.Clear();
    m_bootReason.clear();
    m_bootCancelTime = 0;
    RestoreState();
}

LFGAnswer LFGGroupState::GetBootResult()
{
    uint8 votesNum = 0;
    uint8 agreeNum = 0;
    uint8 denyNum  = 0;

    for (LFGAnswerMap::const_iterator itr = m_bootVotes.begin(); itr != m_bootVotes.end(); ++itr)
    {
        switch (itr->second)
        {
            case LFG_ANSWER_AGREE:
                ++votesNum;
                ++agreeNum;
                break;
            case LFG_ANSWER_DENY:
                ++votesNum;
                ++denyNum;
                break;
            case LFG_ANSWER_PENDING:
                break;
            default:
                break;
        }
    }
    if (agreeNum >= GetVotesNeeded())
        return LFG_ANSWER_AGREE;
    else if (denyNum > m_bootVotes.size() - GetVotesNeeded())
        return LFG_ANSWER_DENY;
    else if (votesNum < m_bootVotes.size())
        return LFG_ANSWER_PENDING;

    return LFG_ANSWER_PENDING;
}

void  LFGGroupState::DecreaseKicksLeft()
{
    LFGMgr::WriteGuard Guard(sLFGMgr.GetLock());
    if (m_kicksLeft > 0)
        --m_kicksLeft;
};

LFGQueueInfo::LFGQueueInfo(ObjectGuid _guid, LFGType type)
{
    guid = _guid;
    m_type = type;
    MANGOS_ASSERT(!guid.IsEmpty());

    tanks = LFG_TANKS_NEEDED;
    healers = LFG_HEALERS_NEEDED;
    dps = LFG_DPS_NEEDED;
    joinTime = time_t(time(NULL));

};

LFGProposal::LFGProposal(LFGDungeonEntry const* _dungeon)
{
    m_dungeon = _dungeon;
    m_state = LFG_PROPOSAL_INITIATING;
    m_cancelTime = 0;
    declinerGuids.clear();
    playerGuids.clear();
    m_deleted = false;
}

void LFGProposal::Start()
{
    m_cancelTime = time_t(time(NULL)) + LFG_TIME_PROPOSAL;
};

void LFGProposal::RemoveDecliner(ObjectGuid guid)
{
    if (guid.IsEmpty())
        return;

    RemoveMember(guid);

    LFGMgr::WriteGuard Guard(sLFGMgr.GetLock());
    declinerGuids.insert(guid);
};

void LFGProposal::RemoveMember(ObjectGuid guid)
{
    if (guid.IsEmpty())
        return;

    LFGMgr::WriteGuard Guard(sLFGMgr.GetLock());
    LFGQueueSet::iterator itr = playerGuids.find(guid);
    if (itr != playerGuids.end())
        playerGuids.erase(itr);
};

void LFGProposal::AddMember(ObjectGuid guid)
{
    LFGMgr::WriteGuard Guard(sLFGMgr.GetLock());
    playerGuids.insert(guid);
};

bool LFGProposal::IsMember(ObjectGuid guid)
{
    LFGMgr::ReadGuard Guard(sLFGMgr.GetLock());
    LFGQueueSet::const_iterator itr = playerGuids.find(guid);
    if (itr == playerGuids.end())
        return false;
    else
        return true;
};

LFGQueueSet const LFGProposal::GetMembers()
{
    LFGMgr::ReadGuard Guard(sLFGMgr.GetLock());
    LFGQueueSet tmpGuids = playerGuids;
    return tmpGuids;
};

bool LFGProposal::IsDecliner(ObjectGuid guid)
{
    if (declinerGuids.empty())
        return false;

    LFGMgr::ReadGuard Guard(sLFGMgr.GetLock());
    LFGQueueSet::iterator itr = declinerGuids.find(guid);
    if (itr != declinerGuids.end())
        return true;

    return false;
};

LFGType LFGProposal::GetType()
{
    return (m_dungeon ? LFGType(m_dungeon->type) : LFG_TYPE_NONE);
};

Group* LFGProposal::GetGroup()
{
    if (m_groupGuid.IsEmpty())
        return NULL;

    return sObjectMgr.GetGroup(m_groupGuid);
};

void LFGProposal::SetGroup(Group* group)
{
    if (!group)
    {
        m_groupGuid.Clear();
        return;
    }
    m_groupGuid = group->GetObjectGuid();
};
