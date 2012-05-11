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

#ifndef _LFGMGR_H
#define _LFGMGR_H

#include "Common.h"
#include "ObjectGuid.h"
#include "Policies/Singleton.h"
#include <ace/RW_Thread_Mutex.h>
#include "LFG.h"

enum LFGenum
{
    LFG_TIME_ROLECHECK         = 2*MINUTE,
    LFG_TIME_BOOT              = 2*MINUTE,
    LFG_TIME_PROPOSAL          = 2*MINUTE,
    LFG_TIME_JOIN_WARNING      = 1*IN_MILLISECONDS,
    LFG_TANKS_NEEDED           = 1,
    LFG_HEALERS_NEEDED         = 1,
    LFG_DPS_NEEDED             = 3,
    LFG_QUEUEUPDATE_INTERVAL   = 35*IN_MILLISECONDS,
    LFG_UPDATE_INTERVAL        = 1*IN_MILLISECONDS,
    LFR_UPDATE_INTERVAL        = 3*IN_MILLISECONDS,
    DEFAULT_LFG_DELAY          = 1,
    SHORT_LFG_DELAY            = 3,
    LONG_LFG_DELAY             = 10,
    LFG_SPELL_DUNGEON_COOLDOWN = 71328,
    LFG_SPELL_DUNGEON_DESERTER = 71041,
    LFG_SPELL_LUCK_OF_THE_DRAW = 72221,
};

enum LFGEventType
{
    LFG_EVENT_NONE                        = 0,
    LFG_EVENT_TELEPORT_PLAYER             = 1,
    LFG_EVENT_TELEPORT_GROUP              = 2,
};

class Group;
class Player;
class Map;
struct LFGDungeonExpansionEntry;

// forward struct declarations
struct LFGReward;
struct LFGQueueInfo;
struct LFGProposal;

typedef std::multimap<uint32, LFGReward> LFGRewardMap;
typedef std::pair<LFGRewardMap::const_iterator, LFGRewardMap::const_iterator> LFGRewardMapBounds;
typedef std::map<ObjectGuid, LFGQueueInfo> LFGQueueInfoMap;
typedef std::map<uint32/*ID*/, LFGDungeonEntry const*> LFGDungeonMap;
typedef std::set<ObjectGuid>  LFGQueueSet;
typedef std::map<uint32/*ID*/, LFGProposal> LFGProposalMap;

// Reward info
struct LFGReward
{
    uint32 maxLevel;
    struct
    {
        uint32 questId;
        uint32 variableMoney;
        uint32 variableXP;
    } reward[2];

    LFGReward(uint32 _maxLevel, uint32 firstQuest, uint32 firstVarMoney, uint32 firstVarXp, uint32 otherQuest, uint32 otherVarMoney, uint32 otherVarXp)
        : maxLevel(_maxLevel)
    {
        reward[0].questId = firstQuest;
        reward[0].variableMoney = firstVarMoney;
        reward[0].variableXP = firstVarXp;
        reward[1].questId = otherQuest;
        reward[1].variableMoney = otherVarMoney;
        reward[1].variableXP = otherVarXp;
    }
};

// Stores player or group queue info
struct LFGQueueInfo
{
    LFGQueueInfo(ObjectGuid _guid, LFGType type);
    ObjectGuid guid;                                        // guid (player or group) of queue owner
    time_t     joinTime;                                    // Player/group queue join time (to calculate wait times)
    uint8      tanks;                                       // Tanks needed
    uint8      healers;                                     // Healers needed
    uint8      dps;                                         // Dps needed

    uint8      tryTanks;                                    // Tanks needed - best search result
    uint8      tryHealers;                                  // Healers needed - best search result
    uint8      tryDps;                                      // Dps needed - best search result

    // helpers
    LFGType    GetDungeonType() {return m_type;};
    private:
    LFGType    m_type;
};

struct LFGQueueStatus
{
    LFGQueueStatus(): avgWaitTime(0), waitTime(0), waitTimeTanks(0), waitTimeDps(0),
                      tanks(0), healers(0), dps(0), playersWaited(0) {};

    time_t                 avgWaitTime;                      // Average Wait time
    time_t                 waitTime;                         // Wait Time
    time_t                 waitTimeTanks;                    // Wait Tanks
    time_t                 waitTimeHealer;                   // Wait Healers
    time_t                 waitTimeDps;                      // Wait Dps
    uint32                 tanks;                            // Tanks
    uint32                 healers;                          // Healers
    uint32                 dps;                              // Dps
    uint32                 playersWaited;                    // players summ
};

/// Stores group data related to proposal to join
struct LFGProposal
{
    LFGProposal(LFGDungeonEntry const* _dungeon);
    public:
    uint32 ID;                                               // Proposal id

    // helpers
    Group* GetGroup();
    void SetGroup(Group* group);
    void AddMember(ObjectGuid guid);
    void RemoveMember(ObjectGuid guid);
    bool IsMember(ObjectGuid guid);
    LFGQueueSet const GetMembers();

    void RemoveDecliner(ObjectGuid guid);
    bool IsDecliner(ObjectGuid guid);

    LFGProposalState GetState() {return m_state;};
    void SetState(LFGProposalState _state ) { m_state = _state;};

    LFGDungeonEntry const* GetDungeon() { return m_dungeon;};
    LFGType GetType();

    void Start();

    void SetDeleted() { m_deleted = true; };
    bool const IsDeleted() const { return m_deleted; };

    bool IsExpired() { return ( m_cancelTime > 0 && m_cancelTime < time_t(time(NULL)));};

    private:
    LFGDungeonEntry const* m_dungeon;                        // Dungeon
    LFGProposalState m_state;                                // State of the proposal
    ObjectGuid m_groupGuid;                                  // Proposal group (empty if not created)
    time_t m_cancelTime;                                     // Time when we will cancel this proposal
    LFGQueueSet playerGuids;                                 // Players in this proposal
    LFGQueueSet declinerGuids;                               // Decliners in this proposal
    bool m_deleted;                                          // avoid double-deleting proposal
};

// Event manager
struct LFGEvent
{
    LFGEvent(LFGEventType _type, ObjectGuid _guid, uint8 _parm) :
            type(_type), guid(_guid), eventParm(_parm), executeTime(0) {};
    LFGEventType  type;
    ObjectGuid    guid;
    uint8         eventParm;
    time_t        executeTime;
    // helpers
    void          Start(uint32 delay) { executeTime = time_t(time(NULL) + delay); };
    bool          IsActive() { return ((executeTime > 0) && (time_t(time(NULL)) >= executeTime)); };
};

typedef std::map<LFGDungeonEntry const*, LFGQueueStatus> LFGQueueStatusMap;
typedef std::map<ObjectGuid, LFGRoleMask>  LFGRolesMap;
typedef std::set<LFGQueueInfo*> LFGQueue;
typedef std::map<LFGDungeonEntry const*, LFGQueueSet> LFGSearchMap;
typedef std::list<LFGEvent> LFGEventList;

class LFGMgr
{
    public:
        LFGMgr();
        ~LFGMgr();

        // Update system
        void Update(uint32 diff);

        void TryCompleteGroups(LFGType type);
        bool TryAddMembersToGroup(Group* group, LFGQueueSet* players);
        void CompleteGroup(Group* group, LFGQueueSet* players);
        bool TryCreateGroup(LFGType type);

        // Join system
        void Join(Player* player);
        void Leave(Player* player);
        void Leave(Group* group);
        void ClearLFRList(Player* player);

        // Queue system
        void AddToQueue(ObjectGuid guid, LFGType type, bool inBegin = false);
        void RemoveFromQueue(ObjectGuid guid);
        LFGQueueInfo* GetQueueInfo(ObjectGuid guid);
        LFGQueueSet GetDungeonPlayerQueue(LFGDungeonEntry const* dungeon, Team team = TEAM_NONE);
        LFGQueueSet GetDungeonGroupQueue(LFGDungeonEntry const* dungeon, Team team = TEAM_NONE);
        LFGQueueSet GetDungeonPlayerQueue(LFGType type);
        LFGQueueSet GetDungeonGroupQueue(LFGType type);

        // reward system
        void LoadRewards();
        LFGReward const* GetRandomDungeonReward(LFGDungeonEntry const* dungeon, Player* player);
        void SendLFGRewards(Group* group);
        void SendLFGReward(Player* player, LFGDungeonEntry const* dungeon);
        void DungeonEncounterReached(Group* group);

        // Proposal system
        uint32 CreateProposal(LFGDungeonEntry const* dungeon, Group* group = NULL, LFGQueueSet* playerGuids = NULL);
        bool SendProposal(uint32 ID, ObjectGuid guid);
        LFGProposal* GetProposal(uint32 ID);
        void RemoveProposal(Player* decliner, uint32 ID);
        void RemoveProposal(uint32 ID, bool success = false);
        void UpdateProposal(uint32 ID, ObjectGuid guid, bool accept);
        void CleanupProposals(LFGType type);
        Player* LeaderElection(LFGQueueSet* playerGuids);

        // boot vote system
        void OfferContinue(Group* group);
        void InitBoot(Player* kicker, ObjectGuid victimGuid, std::string reason);
        void UpdateBoot(Player* player, bool accept);
        void CleanupBoots(LFGType type);

        // teleport system
        void Teleport(Group* group, bool out = false);
        void Teleport(Player* player, bool out = false, bool fromOpcode = false);

        // LFR extend system
        void UpdateLFRGroups();
        bool IsGroupCompleted(Group* group, uint8 addMembers = 0);

        // Statistic system
        LFGQueueStatus* GetDungeonQueueStatus(LFGType type);
        void UpdateQueueStatus(Player* player);
        void UpdateQueueStatus(Group* group);
        void UpdateQueueStatus(LFGType type);
        void SendStatistic(LFGType type);
        LFGQueueStatus* GetOverallQueueStatus();

        // Role check system
        void CleanupRoleChecks(LFGType type);
        void StartRoleCheck(Group* group);
        void UpdateRoleCheck(Group* group);
        bool CheckRoles(Group* group, Player* player = NULL);
        bool CheckRoles(LFGRolesMap* roleMap);
        bool RoleChanged(Player* player, uint8 roles);
        void SetGroupRoles(Group* group, LFGQueueSet* = NULL);
        void SetRoles(LFGRolesMap* roleMap);

        // Social check system
        bool HasIgnoreState(ObjectGuid guid1, ObjectGuid guid2);
        bool HasIgnoreState(Group* group, ObjectGuid guid);
        bool CheckTeam(Group* group, Player* player = NULL);
        bool CheckTeam(ObjectGuid guid1, ObjectGuid guid2);

        // Dungeon operations
        LFGDungeonEntry const* GetDungeon(uint32 dungeonID);
        bool IsRandomDungeon(LFGDungeonEntry const* dungeon);
        LFGDungeonSet GetRandomDungeonsForPlayer(Player* player);

        // Group operations
        void AddMemberToLFDGroup(ObjectGuid guid);
        void RemoveMemberFromLFDGroup(Group* group, ObjectGuid guid);
        void LoadLFDGroupPropertiesForPlayer(Player* player);

        // Dungeon expand operations
        LFGDungeonSet ExpandRandomDungeonsForGroup(LFGDungeonEntry const* randomDungeon, LFGQueueSet playerGuids);
        LFGDungeonEntry const* SelectRandomDungeonFromList(LFGDungeonSet dugeons);

        // Checks
        LFGJoinResult GetPlayerJoinResult(Player* player);
        LFGJoinResult GetGroupJoinResult(Group* group);

        // Player status
        LFGLockStatusType GetPlayerLockStatus(Player* player, LFGDungeonEntry const* dungeon);
        LFGLockStatusType GetPlayerExpansionLockStatus(Player* player, LFGDungeonEntry const* dungeon);
        LFGLockStatusType GetGroupLockStatus(Group* group, LFGDungeonEntry const* dungeon);
        LFGLockStatusMap GetPlayerLockMap(Player* player);

        // Search matrix
        void AddToSearchMatrix(ObjectGuid guid, bool inBegin = false);
        void RemoveFromSearchMatrix(ObjectGuid guid);
        LFGQueueSet* GetSearchVector(LFGDungeonEntry const* dungeon);
        bool IsInSearchFor(LFGDungeonEntry const* dungeon, ObjectGuid guid);
        void CleanupSearchMatrix();

        // Sheduler
        void SheduleEvent();
        void AddEvent(ObjectGuid guid, LFGEventType type, time_t delay = DEFAULT_LFG_DELAY, uint8 param = 0);

        // Scripts
        void OnPlayerEnterMap(Player* player, Map* map);
        void OnPlayerLeaveMap(Player* player, Map* map);

        // multithread locking
        typedef   ACE_RW_Thread_Mutex          LockType;
        typedef   ACE_Read_Guard<LockType>     ReadGuard;
        typedef   ACE_Write_Guard<LockType>    WriteGuard;
        LockType& GetLock() { return i_lock; }

    private:
        void _Join(ObjectGuid guid, LFGType type);
        void _JoinGroup(ObjectGuid guid, LFGType type);
        uint32 GenerateProposalID();
        uint32          m_proposalID;
        LFGRewardMap    m_RewardMap;                        // Stores rewards for random dungeons
        LFGQueueInfoMap m_queueInfoMap;                     // Storage for queues
        LFGQueue        m_playerQueue[LFG_TYPE_MAX];        // Queue's for players
        LFGQueue        m_groupQueue[LFG_TYPE_MAX];         // Queue's for groups
        LFGDungeonMap   m_dungeonMap;                       // sorted dungeon map
        LFGQueueStatus  m_queueStatus[LFG_TYPE_MAX];        // Queue statisic
        LFGProposalMap  m_proposalMap;                      // Proposal store
        LFGSearchMap    m_searchMatrix;                     // Search matrix
        LFGEventList    m_eventList;                        // events storage

        uint32          m_updateTimer;                      // update timer for cleanup/statistic
        uint32          m_updateTimer2;                     // update timer for LFR extend system
        uint32          m_updateTimer3;                     // update timer for statistic send

        LockType            i_lock;

};

#define sLFGMgr MaNGOS::Singleton<LFGMgr>::Instance()
#endif
