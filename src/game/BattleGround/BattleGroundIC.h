/*
 * Copyright (C) 2005-2012 MaNGOS <http://getmangos.com/>
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

#ifndef __BATTLEGROUNDIC_H
#define __BATTLEGROUNDIC_H

class BattleGround;

#include "Common.h"
#include "BattleGround.h"

#define BG_IC_SCORE_INITIAL_POINTS          300
#define BG_IC_GATE_MAX                      6
#define BG_IC_GRY_MAX                       6

// Used only 2 nodes for check resource, but need create array for all! This define not used.
#define BG_IC_MAX_RESOURCE_NODES            2

#define BG_IC_KILL_BOSS                     4   // honor given for boss kill

enum BG_IC_WorldStates
{
    BG_TEAM_ALLIANCE_REINFORC_SET      = 4221,
    BG_TEAM_HORDE_RENFORC_SET          = 4222,
    BG_TEAM_ALLIANCE_REINFORC          = 4226,
    BG_TEAM_HORDE_REINFORC             = 4227,

    /*BG_IC_GATE_FRONT_H_WS_CLOSED    = 4317,
    BG_IC_GATE_WEST_H_WS_CLOSED     = 4318,
    BG_IC_GATE_EAST_H_WS_CLOSED     = 4319,
    BG_IC_GATE_FRONT_A_WS_CLOSED    = 4328,
    BG_IC_GATE_WEST_A_WS_CLOSED     = 4327,
    BG_IC_GATE_EAST_A_WS_CLOSED     = 4326,
    BG_IC_GATE_FRONT_H_WS_OPEN      = 4322,
    BG_IC_GATE_WEST_H_WS_OPEN       = 4321,
    BG_IC_GATE_EAST_H_WS_OPEN       = 4320,
    BG_IC_GATE_FRONT_A_WS_OPEN      = 4323,
    BG_IC_GATE_WEST_A_WS_OPEN       = 4324,
    BG_IC_GATE_EAST_A_WS_OPEN       = 4325,

    BG_IC_DOCKS_UNCONTROLLED        = 4301,
    BG_IC_DOCKS_CONFLICT_A          = 4305,
    BG_IC_DOCKS_CONFLICT_H          = 4302,
    BG_IC_DOCKS_CONTROLLED_A        = 4304,
    BG_IC_DOCKS_CONTROLLED_H        = 4303,

    BG_IC_HANGAR_UNCONTROLLED       = 4296,
    BG_IC_HANGAR_CONFLICT_A         = 4300,
    BG_IC_HANGAR_CONFLICT_H         = 4297,
    BG_IC_HANGAR_CONTROLLED_A       = 4299,
    BG_IC_HANGAR_CONTROLLED_H       = 4298,

    BG_IC_WORKSHOP_UNCONTROLLED     = 4294,
    BG_IC_WORKSHOP_CONFLICT_A       = 4228,
    BG_IC_WORKSHOP_CONFLICT_H       = 4293,
    BG_IC_WORKSHOP_CONTROLLED_A     = 4229,
    BG_IC_WORKSHOP_CONTROLLED_H     = 4230,

    BG_IC_QUARRY_UNCONTROLLED       = 4306,
    BG_IC_QUARRY_CONFLICT_A         = 4310,
    BG_IC_QUARRY_CONFLICT_H         = 4307,
    BG_IC_QUARRY_CONTROLLED_A       = 4309,
    BG_IC_QUARRY_CONTROLLED_H       = 4308,

    BG_IC_REFINERY_UNCONTROLLED     = 4311,
    BG_IC_REFINERY_CONFLICT_A       = 4315,
    BG_IC_REFINERY_CONFLICT_H       = 4312,
    BG_IC_REFINERY_CONTROLLED_A     = 4314,
    BG_IC_REFINERY_CONTROLLED_H     = 4313,

    BG_TEAM_ALLIANCE_KEEP_UNCONTROLLED = 4341,
    BG_TEAM_ALLIANCE_KEEP_CONFLICT_A   = 4342,
    BG_TEAM_ALLIANCE_KEEP_CONFLICT_H   = 4343,
    BG_TEAM_ALLIANCE_KEEP_CONTROLLED_A = 4339,
    BG_TEAM_ALLIANCE_KEEP_CONTROLLED_H = 4340,

    BG_TEAM_HORDE_KEEP_UNCONTROLLED    = 4346,
    BG_TEAM_HORDE_KEEP_CONFLICT_A      = 4347,
    BG_TEAM_HORDE_KEEP_CONFLICT_H      = 4348,
    BG_TEAM_HORDE_KEEP_CONTROLLED_A    = 4344,
    BG_TEAM_HORDE_KEEP_CONTROLLED_H    = 4345*/
};

const uint32 BG_IC_OP_NODEICONS[7]  =    {4301, 4296, 4294, 4306, 4311, 4339, 4345};

/* do NOT change the order, else wrong behaviour */
enum BG_IC_Nodes
{
    BG_IC_NODE_DOCKS            = 0,
    BG_IC_NODE_HANGAR           = 1,
    BG_IC_NODE_WORKSHOP         = 2,
    BG_IC_NODE_QUARRY           = 3,
    BG_IC_NODE_REFINERY         = 4,
    BG_IC_NODE_A_KEEP           = 5,
    BG_IC_NODE_H_KEEP           = 6,
    BG_IC_NODES_MAX             = 7,
    BG_IC_NODES_ERROR           = 255,
};

// alliance_contested horde_contested a_owned h_owned
const uint32 BG_IC_NodeWorldStates[BG_IC_NODES_MAX][4] =
{
    // Docks
    {4305, 4302, 4304, 4303},
    // Hangar
    {4300, 4297, 4299, 4298},
    // Workshop
    {4228, 4293, 4229, 4230},
    // Quarry
    {4310, 4307, 4309, 4308},
    // Refinery
    {4315, 4312, 4314, 4313},
    // Alliance keep
    {4342, 4343, 4339, 4340},
    // Horde keep
    {4347, 4348, 4344, 4345}
};

const uint32 BG_IC_GateStatus[BG_IC_GATE_MAX][2] =
{
    {4327, 4324},   // alli west gate {closed, open gate}
    {4326, 4325},   // alli east
    {4328, 4323},   // alli front
    {4318, 4321},   // horde west
    {4319, 4320},   // horde east
    {4317, 4322}    // horde front
};

enum BG_IC_GateStatus
{
    BG_IC_GO_GATES_NORMAL               = 1,
    BG_IC_GO_GATES_DAMAGE               = 2,
    BG_IC_GO_GATES_DESTROY              = 3
};

enum BG_IC_Spells
{
    SPELL_REFINERY          = 68719,
    SPELL_QUARRY            = 68720,

    SPELL_PARACHUTE         = 66657
};

enum BG_IC_GoId
{
    BG_IC_GO_ALLIANCE_GATE_1 = 195699, // west
    BG_IC_GO_ALLIANCE_GATE_2 = 195698, // east
    BG_IC_GO_ALLIANCE_GATE_3 = 195700, // front

    BG_IC_GO_HORDE_GATE_1    = 195496, // west
    BG_IC_GO_HORDE_GATE_2    = 195495, // east
    BG_IC_GO_HORDE_GATE_3    = 195494, // front

    BG_IC_GO_ALLIANCE_PORT  = 195703, // the actual portcullis that opens, without frame, needs to be spawned separately just at front gates
    BG_IC_GO_HORDE_PORT     = 195491
};

enum BG_IC_GoType
{
    BG_IC_GO_T_ALLIANCE_GATE_1,
    BG_IC_GO_T_ALLIANCE_GATE_2,
    BG_IC_GO_T_ALLIANCE_GATE_3,

    BG_IC_GO_T_HORDE_GATE_1,
    BG_IC_GO_T_HORDE_GATE_2,
    BG_IC_GO_T_HORDE_GATE_3,

    BG_IC_GO_T_ALLIANCE_WEST,
    BG_IC_GO_T_ALLIANCE_EAST,
    BG_IC_GO_T_ALLIANCE_FRONT,

    BG_IC_GO_T_HORDE_WEST,
    BG_IC_GO_T_HORDE_EAST,
    BG_IC_GO_T_HORDE_FRONT,

    BG_IC_MAXOBJ = 12
};

enum BG_IC_GUNSHIPS
{
    GO_HORDE_GUNSHIP = 195276,
    GO_ALLIANCE_GUNSHIP =  195121
};


enum BG_IC_NodeStatus
{
    BG_IC_NODE_TYPE_NEUTRAL             = 0,
    BG_IC_NODE_TYPE_CONTESTED           = 1,
    BG_IC_NODE_STATUS_ALLY_CONTESTED    = 1,
    BG_IC_NODE_STATUS_HORDE_CONTESTED   = 2,
    BG_IC_NODE_TYPE_OCCUPIED            = 3,
    BG_IC_NODE_STATUS_ALLY_OCCUPIED     = 3,
    BG_IC_NODE_STATUS_HORDE_OCCUPIED    = 4
};

enum BG_IC_Sounds
{
    BG_IC_SOUND_NODE_CLAIMED            = 8192,
    BG_IC_SOUND_NODE_CAPTURED_ALLIANCE  = 8173,
    BG_IC_SOUND_NODE_CAPTURED_HORDE     = 8213,
    BG_IC_SOUND_NODE_ASSAULTED_ALLIANCE = 8212,
    BG_IC_SOUND_NODE_ASSAULTED_HORDE    = 8174
};

// WorldSafeLocs ids for 5 nodes, and for ally, horde starting location
const uint32 BG_IC_GraveyardIds[7] = {1480, 1481, 1482, 1485, 1486, 1483, 1484};

enum BG_IC_Events
{
    IC_EVENT_ADD_TELEPORT       = 7,  // base teleports
    IC_EVENT_ADD_VEH            = 8,  // keep cannons
    IC_EVENT_ADD_A_GUARDS       = 9,
    IC_EVENT_ADD_H_GUARDS       = 10,
    IC_EVENT_ADD_A_BOSS         = 11,
    IC_EVENT_ADD_H_BOSS         = 12,
    // IC_EVENT_BOSS_A 251 - alli boss gate
    // IC_EVENT_BOSS_H 252 - horde boss gate
};

struct BG_IC_BannerTimer
{
    uint32      timer;
    uint8       type;
    uint8       teamIndex;
};

enum BG_IC_Creatures
{
    NPC_HORDE_GUNSHIP_CANNON            = 34935,
    NPC_ALLIANCE_GUNSHIP_CANNON         = 34929,
    NPC_HIGH_COMMANDER_HALFORD_WYRMBANE = 34924,  // Alliance Boss
    NPC_OVERLORD_AGMAR                  = 34922   // Horde Boss
};

enum BG_IC_Timers
{
    WORKSHOP_UPDATE_TIME        = 180000, // 3 minutes
    TRANSPORT_PERIOD_TIME       = 120000,
    BG_IC_FLAG_CAPTURING_TIME   = 60000,
    BG_IC_RESOURCE_TICK_TIMER   = 45000,
    CLOSE_DOORS_TIME            = 20000
};

enum CreaturesEntryIC
{
    VEHICLE_IC_DEMOLISHER   = 34775,
    VEHICLE_IC_DEMOLISHER_1 = 35415,
    VEHICLE_IC_CATAPULT     = 34793,
    VEHICLE_IC_CATAPULT_1   = 35413,
    VEHICLE_IC_CANNON       = 34944,
    VEHICLE_IC_CANNON_1     = 35429,
    VEHICLE_IC_GLAIVE_A     = 34802,
    VEHICLE_IC_GLAIVE_H     = 35273,
};

/*const float hordeGunshipPassengers[5][4] =
{
    {-21.401f,  -31.343f,  34.173f,  4.62057f},
    {-12.1064f, -31.9697f, 34.3807f, 4.62057f},
    {-2.4877f,  -31.9885f, 34.8384f, 4.62057f},
    {10.2664f,  -32.0713f, 35.7357f, 4.62057f},
    {19.4636f,  -30.794f,  36.2254f, 4.83106f}
};

const float allianceGunshipPassengers[5][4] =
{
    {-41.7122f, 23.1838f, 22.5605f, 1.60659f},
    {-31.0354f, 25.1286f, 21.6921f, 1.60659f},
    {-21.4492f, 25.8326f, 21.6309f, 1.60659f},
    {-12.4734f, 26.321f,  21.6237f, 1.60659f},
    {-2.81125f, 26.2077f, 21.6566f, 1.60659f}
};*/

static float const BG_IC_GATELOCS[6][4] =
{
    // west / east / front alli gate
    {351.615f,  -762.75f,   48.9162f,   -1.5708f},
    {351.024f,  -903.326f,  48.9247f,   1.5708f},
    {413.479f,  -833.95f,   48.5238f,   3.14159f},
    // west / east / front horde gate
    {1217.9f,   -676.948f,  47.6341f,   1.5708f},
    {1218.74f,  -851.155f,  48.2533f,   -1.5708f},
    {1150.9f,   -762.606f,  47.5077f,   3.14159f},
};

class BattleGroundICScore : public BattleGroundScore
{
    public:
        BattleGroundICScore() : BasesAssaulted(0), BasesDefended(0) {};
        virtual ~BattleGroundICScore() {};
        uint32 BasesAssaulted;
        uint32 BasesDefended;
};

class BattleGroundIC : public BattleGround
{
        friend class BattleGroundMgr;

    public:
        BattleGroundIC();
        ~BattleGroundIC();

        void Update(uint32 diff);

        /* inherited from BattleGroundClass */
        virtual void AddPlayer(Player *plr);
        virtual void StartingEventCloseDoors();
        virtual void StartingEventOpenDoors();
        virtual void EventPlayerDamageGO(Player *player, GameObject* target_obj, uint32 eventId, uint32 doneBy = 0);
        virtual void FillInitialWorldStates();
        virtual void HandleKillUnit(Creature *unit, Player *killer);
        virtual void HandleKillPlayer(Player* player, Player* killer);
        virtual void Reset();

        virtual WorldSafeLocsEntry const* GetClosestGraveYard(Player* player);

        void RemovePlayer(Player* plr);
        void HandleAreaTrigger(Player *Source, uint32 Trigger);
        bool SetupBattleGround();
        void EndBattleGround(Team winner);
        void EventPlayerClickedOnFlag(Player *Source, GameObject* target_obj);
        void UpdateScore(TeamIndex teamIdx, int32 points);
        void SpawnGates();

        /* Scorekeeping */
        void UpdatePlayerScore(Player *Source, uint32 type, uint32 value, bool doAddHonor = true);

        virtual Team GetSpawnTeamFor(ObjectGuid const& guid) const override;

        // for achievement Mine
        bool hasAllNodes(int8 team);

        // for achievement Resource Glut
        bool hasAllResNodes(int8 team);

    private:
        uint32 closeFortressDoorsTimer;
        uint32 m_resource_Timer[BG_IC_NODES_MAX];
        bool doorsClosed;
        bool aOpen;
        bool hOpen;

        // Transports
        Transport* gunshipAlliance;
        Transport* gunshipHorde;
        Transport* CreateTransport(uint32 goEntry,uint32 period);
        void SendTransportInit(Player* player);

        void HandleBuffs();

        void _CreateBanner(uint8 node, uint8 type, uint8 teamIndex, bool delay);
        void _SendNodeUpdate(uint8 node);
        int32 _GetNodeNameId(uint8 node);

        /* Nodes info:
            0: neutral
            1: ally contested
            2: horde contested
            3: ally occupied
            4: horde occupied     */

        uint8               m_Nodes[BG_IC_NODES_MAX];
        uint8               m_prevNodes[BG_IC_NODES_MAX];   // used for performant wordlstate-updating
        BG_IC_BannerTimer   m_BannerTimers[BG_IC_NODES_MAX];
        uint32              m_NodeTimers[BG_IC_NODES_MAX];
        int32               GateStatus[BG_IC_GATE_MAX];
};
#endif
