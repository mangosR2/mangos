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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#ifndef WORLD_PVP_NA
#define WORLD_PVP_NA

enum
{
    MAX_NA_GUARDS                           = 15,
    MAX_NA_ROOSTS                           = 4,                // roosts for each type and faction
    MAX_FIRE_BOMBS                          = 10,

    // zone ids
    ZONE_ID_NAGRAND                         = 3518,

    // spell
    SPELL_STRENGTH_HALAANI                  = 33795,
    SPELL_NAGRAND_TOKEN_ALLIANCE            = 33005,
    SPELL_NAGRAND_TOKEN_HORDE               = 33004,

    // npcs
    // quest credit
    NPC_HALAA_COMBATANT                     = 24867,

    GRAVEYARD_ID_HALAA                      = 993,
    GRAVEYARD_ZONE_ID_HALAA                 = 3518,

    ITEM_ID_FIRE_BOMB                       = 24538,

    // gameobjects
    GO_HALAA_BANNER                         = 182210,

    // spawned when horde is in control - alliance is attacking
    GO_WYVERN_ROOST_ALY_SOUTH               = 182267,
    GO_WYVERN_ROOST_ALY_WEST                = 182280,
    GO_WYVERN_ROOST_ALY_NORTH               = 182281,
    GO_WYVERN_ROOST_ALY_EAST                = 182282,

    GO_BOMB_WAGON_HORDE_SOUTH               = 182222,
    GO_BOMB_WAGON_HORDE_WEST                = 182272,
    GO_BOMB_WAGON_HORDE_NORTH               = 182273,
    GO_BOMB_WAGON_HORDE_EAST                = 182274,

    GO_DESTROYED_ROOST_ALY_SOUTH            = 182266,
    GO_DESTROYED_ROOST_ALY_WEST             = 182275,
    GO_DESTROYED_ROOST_ALY_NORTH            = 182276,
    GO_DESTROYED_ROOST_ALY_EAST             = 182277,

    // spawned when alliance is in control - horde is attacking
    GO_WYVERN_ROOST_HORDE_SOUTH             = 182301,
    GO_WYVERN_ROOST_HORDE_WEST              = 182302,
    GO_WYVERN_ROOST_HORDE_NORTH             = 182303,
    GO_WYVERN_ROOST_HORDE_EAST              = 182304,

    GO_BOMB_WAGON_ALY_SOUTH                 = 182305,
    GO_BOMB_WAGON_ALY_WEST                  = 182306,
    GO_BOMB_WAGON_ALY_NORTH                 = 182307,
    GO_BOMB_WAGON_ALY_EAST                  = 182308,

    GO_DESTROYED_ROOST_HORDE_SOUTH          = 182297,
    GO_DESTROYED_ROOST_HORDE_WEST           = 182298,
    GO_DESTROYED_ROOST_HORDE_NORTH          = 182299,
    GO_DESTROYED_ROOST_HORDE_EAST           = 182300,

    // npcs
    // alliance
    NPC_RESEARCHER_KARTOS                   = 18817,
    NPC_QUARTERMASTER_DAVIAN                = 18822,
    NPC_MERCHANT_ALDRAAN                    = 21485,
    NPC_VENDOR_CENDRII                      = 21487,
    NPC_AMMUNITIONER_BANRO                  = 21488,
    NPC_ALLIANCE_HANAANI_GUARD              = 18256,

    // horde
    NPC_RESEARCHER_AMERELDINE               = 18816,
    NPC_QUARTERMASTER_NORELIQE              = 18821,
    NPC_MERCHANT_COREIEL                    = 21474,
    NPC_VENDOR_EMBELAR                      = 21484,
    NPC_AMMUNITIONER_TASALDAN               = 21483,
    NPC_HORDE_HALAANI_GUARD                 = 18192,

    // events
    EVENT_HALAA_BANNER_WIN_ALLIANCE         = 11504,
    EVENT_HALAA_BANNER_WIN_HORDE            = 11503,
    EVENT_HALAA_BANNER_CONTEST_ALLIANCE     = 11559,
    EVENT_HALAA_BANNER_CONTEST_HORDE        = 11558,
    EVENT_HALAA_BANNER_PROGRESS_ALLIANCE    = 11821,
    EVENT_HALAA_BANNER_PROGRESS_HORDE       = 11822,

    // world states
    WORLD_STATE_NA_GUARDS_HORDE             = 2503,
    WORLD_STATE_NA_GUARDS_ALLIANCE          = 2502,
    WORLD_STATE_NA_GUARDS_MAX               = 2493,
    WORLD_STATE_NA_GUARDS_LEFT              = 2491,

    // map states
    WORLD_STATE_NA_WYVERN_NORTH_NEU_H       = 2762,
    WORLD_STATE_NA_WYVERN_NORTH_NEU_A       = 2662,
    WORLD_STATE_NA_WYVERN_NORTH_H           = 2663,
    WORLD_STATE_NA_WYVERN_NORTH_A           = 2664,

    WORLD_STATE_NA_WYVERN_SOUTH_NEU_H       = 2760,
    WORLD_STATE_NA_WYVERN_SOUTH_NEU_A       = 2670,
    WORLD_STATE_NA_WYVERN_SOUTH_H           = 2668,
    WORLD_STATE_NA_WYVERN_SOUTH_A           = 2669,

    WORLD_STATE_NA_WYVERN_WEST_NEU_H        = 2761,
    WORLD_STATE_NA_WYVERN_WEST_NEU_A        = 2667,
    WORLD_STATE_NA_WYVERN_WEST_H            = 2665,
    WORLD_STATE_NA_WYVERN_WEST_A            = 2666,

    WORLD_STATE_NA_WYVERN_EAST_NEU_H        = 2763,
    WORLD_STATE_NA_WYVERN_EAST_NEU_A        = 2659,
    WORLD_STATE_NA_WYVERN_EAST_H            = 2660,
    WORLD_STATE_NA_WYVERN_EAST_A            = 2661,

    WORLD_STATE_NA_HALAA_NEUTRAL            = 2671,
    WORLD_STATE_NA_HALAA_NEU_A              = 2676,
    WORLD_STATE_NA_HALAA_NEU_H              = 2677,
    WORLD_STATE_NA_HALAA_HORDE              = 2672,
    WORLD_STATE_NA_HALAA_ALLIANCE           = 2673,
};

static const uint32 aFlightPathStartNodes[MAX_NA_ROOSTS]    = {103, 107, 109, 105};
static const uint32 aFlightPathEndNodes[MAX_NA_ROOSTS]      = {104, 108, 110, 106};

static const uint32 aAllianceRoosts[MAX_NA_ROOSTS]          = {GO_WYVERN_ROOST_ALY_SOUTH,       GO_WYVERN_ROOST_ALY_NORTH,      GO_WYVERN_ROOST_ALY_EAST,       GO_WYVERN_ROOST_ALY_WEST};
static const uint32 aHordeRoosts[MAX_NA_ROOSTS]             = {GO_WYVERN_ROOST_HORDE_SOUTH,     GO_WYVERN_ROOST_HORDE_NORTH,    GO_WYVERN_ROOST_HORDE_EAST,     GO_WYVERN_ROOST_HORDE_WEST};
static const uint32 aAllianceBrokenRoosts[MAX_NA_ROOSTS]    = {GO_DESTROYED_ROOST_ALY_SOUTH,    GO_DESTROYED_ROOST_ALY_NORTH,   GO_DESTROYED_ROOST_ALY_EAST,    GO_DESTROYED_ROOST_ALY_WEST};
static const uint32 aHordeBrokenRoosts[MAX_NA_ROOSTS]       = {GO_DESTROYED_ROOST_HORDE_SOUTH,  GO_DESTROYED_ROOST_HORDE_NORTH, GO_DESTROYED_ROOST_HORDE_EAST,  GO_DESTROYED_ROOST_HORDE_WEST};
static const uint32 aAllianceWagons[MAX_NA_ROOSTS]          = {GO_BOMB_WAGON_ALY_SOUTH,         GO_BOMB_WAGON_ALY_NORTH,        GO_BOMB_WAGON_ALY_EAST,         GO_BOMB_WAGON_ALY_WEST};
static const uint32 aHordeWagons[MAX_NA_ROOSTS]             = {GO_BOMB_WAGON_HORDE_SOUTH,       GO_BOMB_WAGON_HORDE_NORTH,      GO_BOMB_WAGON_HORDE_EAST,       GO_BOMB_WAGON_HORDE_WEST};

static const uint32 aAllianceRoostStates[MAX_NA_ROOSTS]     = {WORLD_STATE_NA_WYVERN_SOUTH_A,       WORLD_STATE_NA_WYVERN_NORTH_A,      WORLD_STATE_NA_WYVERN_EAST_A,       WORLD_STATE_NA_WYVERN_WEST_A};
static const uint32 aHordeRoostStates[MAX_NA_ROOSTS]        = {WORLD_STATE_NA_WYVERN_SOUTH_H,       WORLD_STATE_NA_WYVERN_NORTH_H,      WORLD_STATE_NA_WYVERN_EAST_H,       WORLD_STATE_NA_WYVERN_WEST_H};
static const uint32 aAllianceNeutralStates[MAX_NA_ROOSTS]   = {WORLD_STATE_NA_WYVERN_SOUTH_NEU_A,   WORLD_STATE_NA_WYVERN_NORTH_NEU_A,  WORLD_STATE_NA_WYVERN_EAST_NEU_A,   WORLD_STATE_NA_WYVERN_WEST_NEU_A};
static const uint32 aHordeNeutralStates[MAX_NA_ROOSTS]      = {WORLD_STATE_NA_WYVERN_SOUTH_NEU_H,   WORLD_STATE_NA_WYVERN_NORTH_NEU_H,  WORLD_STATE_NA_WYVERN_EAST_NEU_H,   WORLD_STATE_NA_WYVERN_WEST_NEU_H};

class WorldPvPNA : public WorldPvP
{
    public:
        WorldPvPNA();

        bool InitWorldPvPArea();

        void FillInitialWorldStates(WorldPacket& data, uint32& count);
        void SendRemoveWorldStates(Player* pPlayer);

        void HandlePlayerEnterZone(Player* pPlayer);
        void HandlePlayerLeaveZone(Player* pPlayer);
        void HandleObjectiveComplete(PlayerSet m_sPlayersSet, uint32 uiEventId);
        void HandlePlayerKillInsideArea(Player* pPlayer, Unit* pVictim);

        void OnCreatureCreate(Creature* pCreature);
        void OnCreatureDeath(Creature* pCreature);
        void OnCreatureRespawn(Creature* pCreature);
        void OnGameObjectCreate(GameObject* pGo);

        void ProcessEvent(GameObject* pGo, uint32 uiEventId, uint32 uiFaction);

        bool HandleObjectUse(Player* pPlayer, GameObject* pGo);

    private:
        // world states handling
        void UpdateWorldState(uint8 uiValue);
        void UpdateWyvernsWorldState(uint8 uiValue);

        // Functions to handle some missing spells
        bool AddBombsToInventory(Player* pPlayer);
        bool HandlePlayerTaxiDrive(Player* pPlayer, uint8 uiPos);

        // Link graveyard on Halaa
        void DoSetGraveyard(uint32 uiFaction, bool bRemove = false);

        // process capture events
        void ProcessCaptureEvent(uint32 uiCaptureType, uint32 uiTeam);

        // set specific faction soldiers and objects after capture
        void DoRespawnSoldiers(uint32 uiFaction);
        void DoHandleFactionObjects(uint32 uiFaction);

        // set banner artkit
        void SetBannerArtKit(uint32 uiArtKit);
        // handle a specific game objects
        void DoRespawnObjects(ObjectGuid GameObjectGuid, bool bRespawn);

        uint32 m_uiZoneController;
        uint32 m_uiControllerWorldState;
        uint32 m_uiControllerMapState;
        uint32 m_uiRoostWorldState[MAX_NA_ROOSTS];
        uint32 m_uiGuardsLeft;

        ObjectGuid m_HalaaBanerGuid;
        ObjectGuid m_AllianceRoost[MAX_NA_ROOSTS];
        ObjectGuid m_HordeRoost[MAX_NA_ROOSTS];
        ObjectGuid m_AllianceBrokenRoost[MAX_NA_ROOSTS];
        ObjectGuid m_HordeBrokenRoost[MAX_NA_ROOSTS];
        ObjectGuid m_AllianceWagons[MAX_NA_ROOSTS];
        ObjectGuid m_HordeWagons[MAX_NA_ROOSTS];

        std::list<ObjectGuid> lAllianceSoldiers;
        std::list<ObjectGuid> lHordeSoldiers;
};

#endif