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


#ifndef WORLD_PVP_WG
#define WORLD_PVP_WG

#include "OutdoorPvP.h"

struct OutdoorPvPWGGameObjectBuilding;
typedef std::set<OutdoorPvPWGGameObjectBuilding*> GameObjectBuilding;

struct OutdoorPvPWGWorkShopData;
typedef std::set<OutdoorPvPWGWorkShopData*> WorkShop;

struct OutdoorPvPGraveYardWG;
typedef std::set<OutdoorPvPGraveYardWG*> GraveYard;

enum
{
    MAPID_ID_WINTERGRASP                = 571,
    // Go factions
    GO_FACTION_A                        = 1732,
    GO_FACTION_H                        = 1735,
    // Npc factions
    NPC_FACTION_A                       = 1891,
    NPC_FACTION_H                       = 1979,
    // World States
    WS_BATTLE_ACTIVE_POS                = 3710,
    WS_BATTLE_ACTIVE_NEG                = 3801,
    WS_CLOCK_1                          = 3781,
    WS_CLOCK_2                          = 4354,
    WS_VEHICLE_COUNT_H                  = 3490,
    WS_VEHICLE_COUNT_MAX_H              = 3491,
    WS_VEHICLE_COUNT_A                  = 3680,
    WS_VEHICLE_COUNT_MAX_A              = 3681,
    WS_DEFENDER_TEAM                    = 3802,
    WS_ATTACKER_TEAM                    = 3803,
};

enum GameObjectId
{
    GO_TITAN_RELIC                              = 192829,
    GO_TELEPORT                                 = 190763,
    GO_VEHICLE_TELEPORT                         = 192951,
    GO_FACTORY_BANNER_NE                        = 190475,
    GO_FACTORY_BANNER_NW                        = 190487,
    GO_FACTORY_BANNER_SE                        = 194959,
    GO_FACTORY_BANNER_SW                        = 194962,
    GO_BUILDING_NE                              = 192031,
    GO_BUILDING_NW                              = 192030,
    GO_BUILDING_SE                              = 192033,
    GO_BUILDING_SW                              = 192032,
    GO_BUILDING_KEEP_WEST                       = 192028,
    GO_BUILDING_KEEP_EAST                       = 192029,
};

enum eWGEvents
{
    EVENT_FACTORY_NE_PROGRESS_ALLIANCE = 19610,
    EVENT_FACTORY_NE_PROGRESS_HORDE = 19609,
    EVENT_FACTORY_NW_PROGRESS_ALLIANCE = 19612,
    EVENT_FACTORY_NW_PROGRESS_HORDE = 19611,
    EVENT_FACTORY_SE_PROGRESS_ALLIANCE = 21565,
    EVENT_FACTORY_SE_PROGRESS_HORDE = 21563,
    EVENT_FACTORY_SW_PROGRESS_ALLIANCE = 21562,
    EVENT_FACTORY_SW_PROGRESS_HORDE = 21560,
};

enum eWGSpell
{
    SPELL_TELEPORT_DALARAN                       = 53360,
    SPELL_TOWER_CONTROL                          = 62064,
    SPELL_RECRUIT                                = 37795,
    SPELL_CORPORAL                               = 33280,
    SPELL_LIEUTENANT                             = 55629,
    SPELL_SPIRITUAL_IMMUNITY                     = 58729,
    SPELL_TENACITY                               = 58549,
    SPELL_TENACITY_VEHICLE                       = 59911,
    SPELL_VEHICLE_TELEPORT                       = 49759,
};

enum eWGAchievements
{
    ACHIEVEMENTS_WIN_WG                          = 1717,
    ACHIEVEMENTS_WIN_WG_100                      = 1718,
    ACHIEVEMENTS_WG_TOWER_DESTROY                = 1727,
};

enum eWGGameObjectBuildingType
{
    WORLD_PVP_WG_OBJECTTYPE_DOOR,
    WORLD_PVP_WG_OBJECTTYPE_TITANRELIC,
    WORLD_PVP_WG_OBJECTTYPE_WALL,
    WORLD_PVP_WG_OBJECTTYPE_DOOR_LAST,
    WORLD_PVP_WG_OBJECTTYPE_KEEP_TOWER,
    WORLD_PVP_WG_OBJECTTYPE_TOWER,
};

enum eWGGameObjectState
{
    WORLD_PVP_WG_OBJECTSTATE_NONE,
    WORLD_PVP_WG_OBJECTSTATE_NEUTRAL_INTACT,
    WORLD_PVP_WG_OBJECTSTATE_NEUTRAL_DAMAGE,
    WORLD_PVP_WG_OBJECTSTATE_NEUTRAL_DESTROY,
    WORLD_PVP_WG_OBJECTSTATE_HORDE_INTACT,
    WORLD_PVP_WG_OBJECTSTATE_HORDE_DAMAGE,
    WORLD_PVP_WG_OBJECTSTATE_HORDE_DESTROY,
    WORLD_PVP_WG_OBJECTSTATE_ALLIANCE_INTACT,
    WORLD_PVP_WG_OBJECTSTATE_ALLIANCE_DAMAGE,
    WORLD_PVP_WG_OBJECTSTATE_ALLIANCE_DESTROY,
};

enum eWGWorkShopType
{
    WORLD_PVP_WG_WORKSHOP_NE,
    WORLD_PVP_WG_WORKSHOP_NW,
    WORLD_PVP_WG_WORKSHOP_SE,
    WORLD_PVP_WG_WORKSHOP_SW,
    WORLD_PVP_WG_WORKSHOP_KEEP_WEST,
    WORLD_PVP_WG_WORKSHOP_KEEP_EAST,
};

enum eWGNpc
{
    NPC_DEMOLISHER_ENGINEER_A        = 30499,
    NPC_DEMOLISHER_ENGINEER_H        = 30400,
    NPC_SPIRIT_GUIDE_A               = 31842,
    NPC_SPIRIT_GUIDE_H               = 31841,
    NPC_TURRER                       = 28366,
    NPC_GUARD_H                      = 30739,
    NPC_GUARD_A                      = 30740,
    NPC_VIERON_BLAZEFEATHER          = 31102,
    NPC_BOWYER_RANDOLPH              = 31052,
    NPC_HOODOO_MASTER_FU_JIN         = 31101,
    NPC_SORCERESS_KAYLANA            = 31051,
    NPC_CHAMPION_ROS_SLAI            = 39173,
    NPC_MARSHAL_MAGRUDER             = 39172,
    NPC_COMMANDER_DARDOSH            = 31091,
    NPC_COMMANDER_ZANNETH            = 31036,
    NPC_TACTICAL_OFFICER_KILRATH     = 31151,
    NPC_TACTICAL_OFFICER_AHBRAMIS    = 31153,
    NPC_SIEGESMITH_STRONGHOOF        = 31106,
    NPC_SIEGE_MASTER_STOUTHANDLE     = 31108,
    NPC_PRIMALIST_MULFORT            = 31053,
    NPC_ANCHORITE_TESSA              = 31054,
    NPC_LIEUTENANT_MURP              = 31107,
    NPC_SENIOR_DEMOLITIONIST_LEGOSO  = 31109,
    //Vehicles
    NPC_CATAPULT                     = 27881,
    NPC_DEMOLISHER                   = 28094,
    NPC_SIEGE_ENGINE_A               = 28312,
    NPC_SIEGE_ENGINE_H               = 32627,
};

struct OutdoorPvPWGBuildingSpawnData
{
    uint32 entry;
    uint32 WorldState;
    uint32 type;
    uint32 textid;
};

#define WG_MAX_OBJ 32
const OutdoorPvPWGBuildingSpawnData WGGameObjectBuillding[WG_MAX_OBJ] = {
    // Wall
    // Entry WS       type                        NameID
    { 190219, 3749, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 190220, 3750, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 191795, 3764, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 191796, 3772, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 191799, 3762, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 191800, 3766, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 191801, 3770, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 191802, 3751, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 191803, 3752, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 191804, 3767, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 191806, 3769, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 191807, 3759, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 191808, 3760, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 191809, 3761, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 190369, 3753, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 190370, 3758, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 190371, 3754, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 190372, 3757, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 190374, 3755, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 190376, 3756, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    // Tower of keep
    { 190221, 3711, WORLD_PVP_WG_OBJECTTYPE_KEEP_TOWER, 0 },
    { 190373, 3713, WORLD_PVP_WG_OBJECTTYPE_KEEP_TOWER, 0 },
    { 190377, 3714, WORLD_PVP_WG_OBJECTTYPE_KEEP_TOWER, 0 },
    { 190378, 3712, WORLD_PVP_WG_OBJECTTYPE_KEEP_TOWER, 0 },
    // Wall (with passage)
    { 191797, 3765, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 191798, 3771, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    { 191805, 3768, WORLD_PVP_WG_OBJECTTYPE_WALL, 0 },
    // South tower
    { 190356, 3704, WORLD_PVP_WG_OBJECTTYPE_TOWER, 0 },
    { 190357, 3705, WORLD_PVP_WG_OBJECTTYPE_TOWER, 0 },
    { 190358, 3706, WORLD_PVP_WG_OBJECTTYPE_TOWER, 0 },
    // Door of forteress
    { 190375, 3763, WORLD_PVP_WG_OBJECTTYPE_DOOR, 0 },
    // Last door
    { 191810, 3773, WORLD_PVP_WG_OBJECTTYPE_DOOR_LAST, 0 },
};

struct OutdoorPvPWGWorkShopDataBase
{
    uint32 entry;
    uint32 worldstate;
    uint32 type;
    uint32 textid;
    uint32 GraveYardId;
};

#define WG_MAX_WORKSHOP  6

const OutdoorPvPWGWorkShopDataBase WGWorkShopDataBase[WG_MAX_WORKSHOP] = {
    { 192031,3701,WORLD_PVP_WG_WORKSHOP_NE,0,1329 },
    { 192030,3700,WORLD_PVP_WG_WORKSHOP_NW,0,1330 },
    { 192033,3703,WORLD_PVP_WG_WORKSHOP_SE,0,1333 },
    { 192032,3702,WORLD_PVP_WG_WORKSHOP_SW,0,1334   },
    { 192028,3698,WORLD_PVP_WG_WORKSHOP_KEEP_WEST,0,0 },
    { 192029,3699,WORLD_PVP_WG_WORKSHOP_KEEP_EAST,0,0 }
};

struct VehicleSummonDataWG
{
    uint32 guida;
    uint32 guidh;
    float x;
    float y;
    float z;
    float o;
};

const VehicleSummonDataWG CoordVehicleSummon[6] = {
    { 530040, 530041, 5391.12f , 2986.23f , 413.298f , 3.18008f },
    { 530042, 530043, 5389.81f , 2719.13f , 413.133f , 3.14081f },
    { 530044, 530045, 4950.19f , 2389.96f , 324.269f , 1.41764f },
    { 530046, 530047, 4954.49f , 3385.17f , 380.993f , 4.35896f },
    { 530048, 530049, 4359.86f , 2347.38f , 380.103f , 6.12532f },
    { 530050, 530051, 4359.86f , 2347.38f , 380.103f , 6.12532f },
};

#endif
