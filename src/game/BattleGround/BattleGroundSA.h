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

#ifndef __BATTLEGROUNDSA_H
#define __BATTLEGROUNDSA_H

class BattleGround;

#define BG_SA_GRY_MAX 3
#define BG_SA_GATE_MAX 6
#define BG_SA_MAX_WS 4
#define BG_SA_EVENT_START_BATTLE_1      23748       // First Round Start
#define BG_SA_EVENT_START_BATTLE_2      21702       // Second Round Start

enum BG_SA_WorldStates
{
    BG_SA_TIMER_MINUTES         = 3559,
    BG_SA_TIMER_10SEC           = 3560,
    BG_SA_TIMER_SEC             = 3561,
    BG_SA_ALLY_ATTACKS          = 4352,
    BG_SA_HORDE_ATTACKS         = 4353,

    BG_SA_PURPLE_GATEWS         = 3614,
    BG_SA_RED_GATEWS            = 3617,
    BG_SA_BLUE_GATEWS           = 3620,
    BG_SA_GREEN_GATEWS          = 3623,
    BG_SA_YELLOW_GATEWS         = 3638,
    BG_SA_ANCIENT_GATEWS        = 3849,

    BG_SA_LEFT_GY_ALLIANCE      = 3635,
    BG_SA_RIGHT_GY_ALLIANCE     = 3636,
    BG_SA_CENTER_GY_ALLIANCE    = 3637,

    BG_SA_RIGHT_ATT_TOKEN_ALL   = 3627,
    BG_SA_LEFT_ATT_TOKEN_ALL    = 3626,

    BG_SA_LEFT_ATT_TOKEN_HRD    = 3629,
    BG_SA_RIGHT_ATT_TOKEN_HRD   = 3628,

    BG_SA_HORDE_DEFENCE_TOKEN    = 3631,
    BG_SA_ALLIANCE_DEFENCE_TOKEN = 3630,

    BG_SA_RIGHT_GY_HORDE        = 3632,
    BG_SA_LEFT_GY_HORDE         = 3633,
    BG_SA_CENTER_GY_HORDE       = 3634,

    BG_SA_BONUS_TIMER           = 0xdf3,
    BG_SA_ENABLE_TIMER          = 3564,
};

enum BG_SA_Sounds
{
    BG_SA_SOUND_GYD_CAPTURED_ALLIANCE  = 8173,
    BG_SA_SOUND_GYD_CAPTURED_HORDE     = 8213,
    BG_SA_SOUND_GYD_VICTORY            = 8456
};

enum BG_SA_GraveYardStatus
{
    BG_SA_GRAVE_STATUS_CONTESTED         = 1,   // adding status_contested and status_occupied just to make some cases clearer
    BG_SA_GRAVE_STATUS_ALLY_CONTESTED    = 1,   // Owned by the Allies, clickable for Horde
    BG_SA_GRAVE_STATUS_HORDE_CONTESTED   = 2,   // Owned by the Horde, clickable for Alliance
    BG_SA_GRAVE_STATUS_OCCUPIED          = 3,
    BG_SA_GRAVE_STATUS_ALLY_OCCUPIED     = 3,   // Captured by the Allies, not clickable by anyone
    BG_SA_GRAVE_STATUS_HORDE_OCCUPIED    = 4    // Captured by the Horde, not clickable by anyone
};

enum BG_SA_Spells
{
    BG_SA_END_OF_ROUND                  = 52459, // Achievement Criteria
    BG_SA_PLANT_SEAFORIUM_CHARGE        = 60937, // Spell doesnt exist(Achievement Criteria)
    BG_SA_STORM_THE_BEACH               = 65246, // Spell doesnt exist(Achievement Criteria)
};

enum BG_SA_Timers
{
    BG_SA_ROUNDLENGTH                   = 600000,
    BG_SA_BOAT_START                    = 70000
};

enum BG_SA_GateStatus
{
    BG_SA_GO_GATES_NORMAL               = 1,
    BG_SA_GO_GATES_DAMAGE               = 2,
    BG_SA_GO_GATES_DESTROY              = 3
};

enum BG_SA_GoId
{
    BG_SA_GO_GATES_ROOM_ANCIENT_SHRINE  = 192549,
    BG_SA_GO_GATES_GREEN_EMERALD        = 190722,
    BG_SA_GO_GATES_BLUE_SAPHIRE         = 190724,
    BG_SA_GO_GATES_MAUVE_AMETHYST       = 190723,
    BG_SA_GO_GATES_RED_SUN              = 190726,
    BG_SA_GO_GATES_YELLOW_MOON          = 190727,
    BG_SA_GO_TITAN_RELIC_A              = 194082,   // spawned titan relic when allies attack
    BG_SA_GO_TITAN_RELIC_H              = 194083
};

enum BG_SA_GoType
{
    BG_SA_GO_GATES_T_ROOM_ANCIENT_SHRINE    = 0,
    BG_SA_GO_GATES_T_GREEN_EMERALD          = 1,
    BG_SA_GO_GATES_T_BLUE_SAPHIRE           = 2,
    BG_SA_GO_GATES_T_MAUVE_AMETHYST         = 3,
    BG_SA_GO_GATES_T_RED_SUN                = 4,
    BG_SA_GO_GATES_T_YELLOW_MOON            = 5,
    BG_SA_GO_GATES_T_NONE                   = 255
};

enum BG_SA_Events
{
    SA_EVENT_ADD_GRAVE_E    = 0,        // east base spirit healers and flags
    SA_EVENT_ADD_GRAVE_W    = 1,        // west base spirit healers and flags
    SA_EVENT_ADD_GRAVE_C    = 2,        // central base spirit healers and flags
    SA_EVENT_ADD_GRAVE_A    = 3,        // last defender graveyard, at the ancient shrine
    SA_EVENT_ADD_GRAVE_B    = 4,        // beach spirit healers
    SA_EVENT_ADD_BOMB_E     = 5,        // east base bombs
    SA_EVENT_ADD_BOMB_W     = 6,        // west base bombs
    SA_EVENT_ADD_BOMB_C     = 7,        // central base bombs (on both sides of the yellow gate)
    SA_EVENT_ADD_BOMB_B     = 8,        // bombs on the beach
    SA_EVENT_ADD_NPC        = 9,        // dock demolishers, factory npcs
    SA_EVENT_ADD_CANNON     = 10,       // defender cannons
    SA_EVENT_ADD_GO         = 11,       // flagpoles, defender portals
    SA_EVENT_ADD_VECH_E     = 12,       // east base demolishers
    SA_EVENT_ADD_VECH_W     = 13,       // west base demolishers
    SA_EVENT_ADD_RELIC      = 14,       // titan relic
    SA_EVENT_ADD_GREEN_SIGIL  = 15,     // green gate sigil
    SA_EVENT_ADD_BLUE_SIGIL   = 16,     // blue gate sigil
    SA_EVENT_ADD_RED_SIGIL    = 17,     // red gate sigil
    SA_EVENT_ADD_PURPLE_SIGIL = 18,     // purple gate sigil
    SA_EVENT_ADD_YELLOW_SIGIL = 19,     // yellow gate sigil
    SA_EVENT_NONE           = 255       // no real BG event, only dummy
};

enum BG_SA_Boats
{
    BG_SA_BOAT_ONE,
    BG_SA_BOAT_TWO,
    BG_SA_MAXOBJ = 2
};

struct BG_SA_BannerTimer
{
    uint32      timer;
    uint8       type;
    uint8       teamIndex;
};

enum BG_SA_MessageType
{
    BG_SA_ATTACK            = 0,
    BG_SA_DAMAGE            = 1,
    BG_SA_DESTROY           = 2
};

enum BG_SA_Boat
{
    BG_SA_BOAT_ONE_A = 193182,
    BG_SA_BOAT_TWO_H = 193183,
    BG_SA_BOAT_ONE_H = 193184,
    BG_SA_BOAT_TWO_A = 193185
};

enum BG_SA_Phase
{
    SA_ROUND_ONE = 1,
    SA_ROUND_TWO = 2,
};

struct BG_SA_RoundScore
{
    Team winner;
    uint32 time;
};

class BattleGroundSAScore : public BattleGroundScore
{
    public:
        BattleGroundSAScore(): DemolishersDestroyed(0), GatesDestroyed(0) {};
        virtual ~BattleGroundSAScore() {};
        uint32 DemolishersDestroyed;
        uint32 GatesDestroyed;
};

class BattleGroundSA : public BattleGround
{
        friend class BattleGroundMgr;

    public:
        BattleGroundSA();
        ~BattleGroundSA();
        void Update(uint32 diff);

        /* inherited from BattlegroundClass */
        virtual void AddPlayer(Player* plr);
        virtual void StartingEventCloseDoors();
        virtual void StartingEventOpenDoors();
        virtual void EventPlayerDamageGO(Player *player, GameObject* target_obj, uint32 eventId, uint32 doneBy = 0);
        virtual void FillInitialWorldStates();
        virtual void EventPlayerClickedOnFlag(Player *source, GameObject* target_obj);
        virtual void HandleKillUnit(Creature* unit, Player* killer);
        virtual void HandleKillPlayer(Player* player, Player* killer);
        virtual WorldSafeLocsEntry const* GetClosestGraveYard(Player* player);
        virtual void Reset();

        Team GetDefender() const { return defender; }
        uint8 GetGydController(uint8 gyd) const { return m_Gyd[gyd]; }
        int32 GetGateStatus(int32 Type) const { return GateStatus[Type]; }
        void RemovePlayer(Player *plr, ObjectGuid guid);
        void HandleAreaTrigger(Player *Source, uint32 Trigger);
        void EndBattleGround(Team winner);
        void ResetBattle(uint32 winner, Team teamDefending);
        bool SetupBattleGround();
        void SendMessageSA(Player *player, uint32 type, uint32 name);
        void UpdateTimer();
        void UpdatePhase();
        uint32 Phase;
        Team defender;
        uint32 Round_timer;
        uint32 TimeST2Round;
        bool shipsStarted;
        bool shipsSpawned;
        bool relicGateDestroyed;
        uint32 shipsTimer;
        uint32 pillarOpenTimer;
        /* Scorekeeping */
        void UpdatePlayerScore(Player* Source, uint32 type, uint32 value);
        /* For boats */
        bool SetupShips();
        void StartShips();
        // Send packet to player for create boats (client part)
        void SendTransportInit(Player *player);
        // Send packet to player for destroy boats (client part)
        void SendTransportsRemove(Player * player);
        /* For SendWarningToAll */
        void SendWarningToAllSA(BG_SA_Events gyd, Team team, bool isDoor = false, BG_SA_GoType door = BG_SA_GO_GATES_T_NONE, bool destroyed = false);
        /* For vehicle's faction*/
        uint32 GetVehicleFaction(uint8 vehicleType) const { return GetCorrectFactionSA(vehicleType); }
        uint32 GetCorrectFactionSA(uint8 vehicleType) const;
        /* This teleports player to correct loc in function of BG status and it resurects player if necesary */
        void TeleportPlayerToCorrectLoc(Player *player, bool resetBattle = false);
        // for achievement - win with all walls
        bool winSAwithAllWalls(Team team);
        bool isDemolisherDestroyed[2];

    private:
        uint8 m_Gyd[BG_SA_GRY_MAX + 1];
        uint8 m_prevGyd[BG_SA_GRY_MAX + 1];   // used for performant wordlstate-updating
        BG_SA_RoundScore RoundScores[2];
        /* Gameobject spawning/despawning */
        void _CreateBanner(uint8 node, uint8 type, uint8 teamIndex, bool delay);
        BG_SA_BannerTimer   m_BannerTimers[BG_SA_GRY_MAX];
        int32 _GatesName(GameObject* obj);
        int32 _GydName(uint8 gyd);
        int32 GateStatus[BG_SA_GATE_MAX];
        bool TimerEnabled;
        void _GydOccupied(uint8 node,Team team);
        void ToggleTimer();
        void ResetWorldStates();
        void HandleInteractivity();
        /* check to avoid to much messages */
        bool GateRoomAncientShrineDamaged;
        bool GateGreenEmeraldDamaged;
        bool GateBlueSaphireDamaged;
        bool GateMauveAmethystDamaged;
        bool GateRedSunDamaged;
        bool GateYellowMoonDamaged;
};
#endif
