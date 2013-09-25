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

#include "MapManager.h"
#include "MapPersistentStateMgr.h"
#include "Policies/Singleton.h"
#include "Database/DatabaseEnv.h"
#include "Log.h"
#include "GridDefines.h"
#include "World.h"
#include "CellImpl.h"
#include "Corpse.h"
#include "ObjectMgr.h"

#define CLASS_LOCK MaNGOS::ClassLevelLockable<MapManager, ACE_Recursive_Thread_Mutex>
INSTANTIATE_SINGLETON_2(MapManager, CLASS_LOCK);
INSTANTIATE_CLASS_MUTEX(MapManager, ACE_Recursive_Thread_Mutex);

MapManager::MapManager()
{
    i_timer.SetInterval(sWorld.getConfig(CONFIG_UINT32_INTERVAL_MAPUPDATE));
}

MapManager::~MapManager()
{
    Guard guard(*this);
    i_maps.clear();
}

void
MapManager::Initialize()
{
    m_threadsCount = sWorld.getConfig(CONFIG_BOOL_THREADS_DYNAMIC) ? 1 : sWorld.getConfig(CONFIG_UINT32_NUMTHREADS);
    m_threadsCountPreferred = m_threadsCount;

    // Start mtmaps if needed.
    if (m_threadsCount > 0 && m_updater.activate(m_threadsCount) == -1)
        abort();

    i_balanceTimer.SetInterval(sWorld.getConfig(CONFIG_UINT32_INTERVAL_MAPUPDATE)*100);
    m_previewTimeStamp = WorldTimer::getMSTime();
    m_workTimeStorage = 0;
    m_sleepTimeStorage = 0;
    m_tickCount = 0;
}

void MapManager::InitializeVisibilityDistanceInfo()
{
    Guard guard(*this);
    for (MapMapType::iterator iter = i_maps.begin(); iter != i_maps.end(); ++iter)
        (*iter).second->InitVisibilityDistance();
}

Map* MapManager::CreateMap(uint32 id, WorldObject const* obj)
{
    MANGOS_ASSERT(obj);
    //if(!obj->IsInWorld()) sLog.outError("GetMap: called for map %d with object (typeid %d, guid %d, mapid %d, instanceid %d) who is not in world!", id, obj->GetTypeId(), obj->GetGUIDLow(), obj->GetMapId(), obj->GetInstanceId());
    Guard guard(*this);

    Map* map = NULL;

    MapEntry const* entry = sMapStore.LookupEntry(id);
    if(!entry)
        return NULL;

    if (entry->Instanceable())
    {
        //create DungeonMap object
        if (obj->GetTypeId() == TYPEID_PLAYER)
            map = CreateInstance(id, (Player*)obj);
        else if (obj->IsInitialized() && obj->GetObjectGuid().IsMOTransport())
            DEBUG_FILTER_LOG(LOG_FILTER_TRANSPORT_MOVES,"MapManager::CreateMap %s try create map %u (no instance given), currently not implemented.",obj->IsInitialized() ? obj->GetObjectGuid().GetString().c_str() : "<uninitialized>", id);
        else
            DETAIL_LOG("MapManager::CreateMap %s try create map %u (no instance given), BUG, wrong usage!",obj->IsInitialized() ? obj->GetObjectGuid().GetString().c_str() : "<uninitialized>", id);
    }
    else
    {
        //create regular non-instanceable map
        map = FindMap(id);
        if (!map)
        {
            map = new WorldMap(id, sWorld.getConfig(CONFIG_UINT32_INTERVAL_GRIDCLEAN));
            //add map into container
            i_maps[MapID(id)] = MapPtr(map);

            // non-instanceable maps always expected have saved state
            map->CreateInstanceData(true);
        }
    }

    return map;
}

Map* MapManager::CreateBgMap(uint32 mapid, BattleGround* bg)
{
    sTerrainMgr.LoadTerrain(mapid);
    Guard _guard(*this);
    return CreateBattleGroundMap(mapid, sObjectMgr.GenerateInstanceLowGuid(), bg);
}

Map* MapManager::FindMap(uint32 mapid, uint32 instanceId) const
{
    //this is a small workaround for transports
    if (IsTransportMap(mapid))
        return NULL;

    Guard guard(*this);
    MapMapType::const_iterator iter = i_maps.find(MapID(mapid, instanceId));
    if (iter == i_maps.end())
        return NULL;


    return &*(iter->second);
}

Map* MapManager::FindFirstMap(uint32 mapid) const
{
    //this is a small workaround for transports
    if (IsTransportMap(mapid))
        return NULL;

    Guard guard(*this);

    for (MapMapType::const_iterator iter = i_maps.begin(); iter != i_maps.end(); ++iter)
    {
        if (iter->first.GetId() == mapid)
            return &*(iter->second);
    }
    return NULL;
}

/*
    checks that do not require a map to be created
    will send transfer error messages on fail
*/
bool MapManager::CanPlayerEnter(uint32 mapid, Player* player)
{
    MapEntry const* entry = sMapStore.LookupEntry(mapid);
    if(!entry)
        return false;
    return true;
}

void MapManager::DeleteInstance(uint32 mapid, uint32 instanceId)
{
    Guard guard(*this);
    MapMapType::iterator iter = i_maps.find(MapID(mapid, instanceId));
    if(iter != i_maps.end())
    {
        MapPtr pMap = iter->second;
        if (pMap->Instanceable())
        {
            pMap->UnloadAll(true);
            i_maps.erase(iter);
        }
    }
}

void MapManager::Update(uint32 diff)
{
    i_timer.Update(diff);
    if( !i_timer.Passed())
        return;

    if (m_threadsCountPreferred != m_threadsCount)
    {
        m_updater.reactivate(m_threadsCountPreferred);
        sLog.outDetail("MapManager::Update map virtual server threads pool reactivated, new threads count is %u", m_threadsCountPreferred);
        m_threadsCount = m_threadsCountPreferred;
    }
    else
        m_updater.reactivate(m_threadsCount);

    UpdateLoadBalancer(true);

    for (MapMapType::iterator iter = i_maps.begin(); iter != i_maps.end(); ++iter)
    {
        if (m_updater.activated())
        {
            m_updater.schedule_update(*iter->second, (uint32)i_timer.GetCurrent());
        }
        else
            iter->second->Update((uint32)i_timer.GetCurrent());
    }

    if (m_updater.activated())
    {
        int result = m_updater.queue_wait(sWorld.getConfig(CONFIG_UINT32_VMSS_FREEZEDETECTTIME));
        if (result != 0)
        {
            if (int count = m_updater.getActiveThreadsCount())
                sLog.outError("MapManager::Update update thread bucket returned error %i after invoke, please report (count of unstopped threads %u).", result, count);
            else
                DEBUG_LOG("MapManager::Update update thread bucket returned error %i after invoke.", result);
        }
    }

    UpdateLoadBalancer(false);

    // check all maps which can be unloaded
    {
        Guard guard(*this);
        for (MapMapType::const_iterator iter = i_maps.begin(); iter != i_maps.end(); ++iter)
        {
            MapPtr pMap = iter->second;
            //check if map can be unloaded
            if (pMap->CanUnload((uint32)i_timer.GetCurrent()))
                iter = i_maps.erase(iter);
            //map  class be auto-deleted in end of cycle
        }
    }

    i_timer.SetCurrent(0);
}

void MapManager::RemoveAllObjectsInRemoveList()
{
    for (MapMapType::iterator iter = i_maps.begin(); iter != i_maps.end(); ++iter)
        iter->second->RemoveAllObjectsInRemoveList();
}

bool MapManager::ExistMapAndVMap(uint32 mapid, float x,float y)
{
    GridPair p = MaNGOS::ComputeGridPair(x,y);

    int gx=63-p.x_coord;
    int gy=63-p.y_coord;

    return GridMap::ExistMap(mapid,gx,gy) && GridMap::ExistVMap(mapid,gx,gy);
}

bool MapManager::IsValidMAP(uint32 mapid)
{
    MapEntry const* mEntry = sMapStore.LookupEntry(mapid);
    return mEntry && (!mEntry->IsDungeon() || ObjectMgr::GetInstanceTemplate(mapid));
    // TODO: add check for battleground template
}

void MapManager::UnloadAll()
{
    for(MapMapType::iterator iter=i_maps.begin(); iter != i_maps.end(); ++iter)
        iter->second->UnloadAll(true);

    while(!i_maps.empty())
        i_maps.erase(i_maps.begin());

    TerrainManager::Instance().UnloadAll();

    if (m_updater.activated())
        m_updater.deactivate();

}

uint32 MapManager::GetNumInstances()
{
    uint32 ret = 0;
    for (MapMapType::iterator itr = i_maps.begin(); itr != i_maps.end(); ++itr)
    {
        MapPtr map = itr->second;
        if(!map->IsDungeon())
            continue;
        ++ret;
    }
    return ret;
}

uint32 MapManager::GetNumPlayersInInstances()
{
    uint32 ret = 0;
    for (MapMapType::iterator itr = i_maps.begin(); itr != i_maps.end(); ++itr)
    {
        MapPtr map = itr->second;
        if(!map->IsDungeon())
            continue;
        ret += map->GetPlayers().getSize();
    }
    return ret;
}

///// returns a new or existing Instance
///// in case of battlegrounds it will only return an existing map, those maps are created by bg-system
Map* MapManager::CreateInstance(uint32 id, Player * player)
{
    Map* map = NULL;
    Map* pNewMap = NULL;
    uint32 NewInstanceId = 0;                                   // instanceId of the resulting map
    const MapEntry* entry = sMapStore.LookupEntry(id);

    if(entry->IsBattleGroundOrArena())
    {
        // find existing bg map for player
        NewInstanceId = player->GetBattleGroundId();
        MANGOS_ASSERT(NewInstanceId);
        map = FindMap(id, NewInstanceId);
        MANGOS_ASSERT(map);
    }
    else if (DungeonPersistentState* pSave = player->GetBoundInstanceSaveForSelfOrGroup(id))
    {
        // solo/perm/group
        NewInstanceId = pSave->GetInstanceId();
        map = FindMap(id, NewInstanceId);
        // it is possible that the save exists but the map doesn't
        if (!map)
            pNewMap = CreateDungeonMap(id, NewInstanceId, pSave->GetDifficulty(), pSave);
    }
    else
    {
        // if no instanceId via group members or instance saves is found
        // the instance will be created for the first time
        NewInstanceId = sObjectMgr.GenerateInstanceLowGuid();

        Difficulty diff = player->GetGroup() ? player->GetGroup()->GetDifficulty(entry->IsRaid()) : player->GetDifficulty(entry->IsRaid());
        pNewMap = CreateDungeonMap(id, NewInstanceId, diff);
    }

    //add a new map object into the registry
    if(pNewMap)
    {
        i_maps[MapID(id, NewInstanceId)] = MapPtr(pNewMap);
        map = pNewMap;
    }

    return map;
}

DungeonMap* MapManager::CreateDungeonMap(uint32 id, uint32 InstanceId, Difficulty difficulty, DungeonPersistentState *save)
{
    // make sure we have a valid map id
    if (!sMapStore.LookupEntry(id))
    {
        sLog.outError("CreateDungeonMap: no entry for map %d", id);
        MANGOS_ASSERT(false);
    }
    if (!ObjectMgr::GetInstanceTemplate(id))
    {
        sLog.outError("CreateDungeonMap: no instance template for map %d", id);
        MANGOS_ASSERT(false);
    }

    // some instances only have one difficulty
    if (!GetMapDifficultyData(id, difficulty))
        difficulty = DUNGEON_DIFFICULTY_NORMAL;

    DEBUG_LOG("MapInstanced::CreateDungeonMap: %s map instance %d for %d created with difficulty %d", save?"":"new ", InstanceId, id, difficulty);

    DungeonMap* map = new DungeonMap(id, sWorld.getConfig(CONFIG_UINT32_INTERVAL_GRIDCLEAN), InstanceId, difficulty);

    // Dungeons can have saved instance data
    bool load_data = save != NULL;
    map->CreateInstanceData(load_data);

    return map;
}

BattleGroundMap* MapManager::CreateBattleGroundMap(uint32 id, uint32 InstanceId, BattleGround* bg)
{
    DEBUG_LOG("MapInstanced::CreateBattleGroundMap: instance:%d for map:%d and bgType:%d created.", InstanceId, id, bg->GetTypeID());

    PvPDifficultyEntry const* bracketEntry = GetBattlegroundBracketByLevel(bg->GetMapId(),bg->GetMinLevel());

    uint8 spawnMode = bracketEntry ? bracketEntry->difficulty : REGULAR_DIFFICULTY;

    BattleGroundMap* map = new BattleGroundMap(id, sWorld.getConfig(CONFIG_UINT32_INTERVAL_GRIDCLEAN), InstanceId, spawnMode);
    MANGOS_ASSERT(map->IsBattleGroundOrArena());
    map->SetBG(bg);
    bg->SetBgMap(map);

    //add map into map container
    i_maps[MapID(id, InstanceId)] = MapPtr(map);

    // BGs/Arenas not have saved instance data
    map->CreateInstanceData(false);

    return map;
}

void MapManager::UpdateLoadBalancer(bool b_start)
{
    if (!sWorld.getConfig(CONFIG_BOOL_THREADS_DYNAMIC))
    {
        // only support for reloading config value of CONFIG_UINT32_NUMTHREADS;
        m_threadsCountPreferred = sWorld.getConfig(CONFIG_UINT32_NUMTHREADS);
        return;
    }

    uint32 timeDiff = WorldTimer::getMSTimeDiff(m_previewTimeStamp, WorldTimer::getMSTime());
    m_previewTimeStamp = WorldTimer::getMSTime();

    if (b_start)
    {
        m_sleepTimeStorage += timeDiff;
        ++m_tickCount;
    }
    else
        m_workTimeStorage += timeDiff;


    i_balanceTimer.Update(timeDiff);

    if (!i_balanceTimer.Passed() || !m_tickCount || !(m_workTimeStorage + m_sleepTimeStorage))
        return;

    float loadValue = float((m_workTimeStorage)/m_tickCount)/float((m_workTimeStorage + m_sleepTimeStorage)/ m_tickCount);

    if (loadValue >= sWorld.getConfig(CONFIG_FLOAT_LOADBALANCE_HIGHVALUE))
        m_threadsCountPreferred = (m_threadsCountPreferred < (int32)sWorld.getConfig(CONFIG_UINT32_NUMTHREADS)) ? (m_threadsCountPreferred + 1) : sWorld.getConfig(CONFIG_UINT32_NUMTHREADS);
    else if (loadValue <= sWorld.getConfig(CONFIG_FLOAT_LOADBALANCE_LOWVALUE))
        m_threadsCountPreferred = (m_threadsCountPreferred > 1) ? (m_threadsCountPreferred - 1) : 1;
    else
        m_threadsCountPreferred = m_threadsCount;

    if (m_threadsCountPreferred != m_threadsCount)
        sLog.outDetail("MapManager::UpdateLoadBalancer load balance %f (tick count %u), threads %u, new %u", loadValue, m_tickCount, m_threadsCount, m_threadsCountPreferred);

    m_workTimeStorage = 0;
    m_sleepTimeStorage = 0;
    m_tickCount = 0;

    i_balanceTimer.SetCurrent(0);
}

bool MapManager::IsTransportMap(uint32 mapid)
{
    MapEntry const* mapEntry = sMapStore.LookupEntry(mapid);
    return mapEntry ? mapEntry->IsTransport() : false;
}
