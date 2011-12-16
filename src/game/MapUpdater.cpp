/*
 * Copyright (C) 2005-2010 MaNGOS <http://getmangos.com/>
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

#include "MapUpdater.h"
#include "DelayExecutor.h"
#include "Map.h"
#include "MapManager.h"
#include "World.h"
#include "Database/DatabaseEnv.h"
#include <ace/Guard_T.h>
#include <ace/Method_Request.h>

class MapUpdateRequest : public ACE_Method_Request
{
    private:

        Map& m_map;
        MapUpdater& m_updater;
        ACE_UINT32 m_diff;

    public:

        MapUpdateRequest(Map& m, MapUpdater& u, ACE_UINT32 d)
            : m_map(m), m_updater(u), m_diff(d)
        {
        }

        virtual int call()
        {
            ACE_thread_t const threadId = ACE_OS::thr_self();
            m_updater.register_thread(threadId, m_map.GetId(),m_map.GetInstanceId());
            if (m_map.IsBroken())
            {
                m_map.ForcedUnload();
            }
            else
            {
                m_map.Update(m_diff);
            }
            m_updater.unregister_thread(threadId);
            m_updater.update_finished ();
            return 0;
        }
};

MapUpdater::MapUpdater()
    : m_mutex(), m_condition(m_mutex), m_executor(), pending_requests(0), m_broken(false)
{
}

MapUpdater::~MapUpdater()
{
    deactivate();
}

int MapUpdater::activate(size_t num_threads)
{
    return m_executor.activate((int)num_threads);
}

int MapUpdater::deactivate()
{
    wait();

    return m_executor.deactivate();
}

void MapUpdater::ReActivate(uint32 threads)
{
    deactivate();
    activate(threads);
    SetBroken(false);
}

int MapUpdater::wait()
{
    ACE_GUARD_RETURN(ACE_Thread_Mutex, guard, m_mutex, -1);

    while (pending_requests > 0)
        m_condition.wait();

    return 0;
}

int MapUpdater::schedule_update(Map& map, ACE_UINT32 diff)
{
    ACE_GUARD_RETURN(ACE_Thread_Mutex, guard, m_mutex, -1);

    ++pending_requests;

    if (m_executor.execute(new MapUpdateRequest(map, *this, diff)) == -1)
    {
        ACE_DEBUG((LM_ERROR, ACE_TEXT("(%t) \n"), ACE_TEXT("Failed to schedule Map Update")));

        --pending_requests;
        return -1;
    }

    return 0;
}

bool MapUpdater::activated()
{
    return m_executor.activated();
}

void MapUpdater::update_finished()
{
    ACE_GUARD(ACE_Thread_Mutex, guard, m_mutex);

    if (pending_requests == 0)
    {
        ACE_ERROR((LM_ERROR, ACE_TEXT("(%t)\n"), ACE_TEXT("MapUpdater::update_finished BUG, report to devs")));
        return;
    }

    --pending_requests;

    m_condition.broadcast();
}

void MapUpdater::register_thread(ACE_thread_t const threadId, uint32 mapId, uint32 instanceId)
{
    ACE_GUARD(ACE_Thread_Mutex, guard, m_mutex);
    MapID pair = MapID(mapId, instanceId);
    m_threads.insert(std::make_pair(threadId, pair));
    m_starttime.insert(std::make_pair(threadId, WorldTimer::getMSTime()));
}

void MapUpdater::unregister_thread(ACE_thread_t const threadId)
{
    ACE_GUARD(ACE_Thread_Mutex, guard, m_mutex);
    m_threads.erase(threadId);
    m_starttime.erase(threadId);
}

MapID const* MapUpdater::GetMapPairByThreadId(ACE_thread_t const threadId)
{
    if (!m_threads.empty())
    {
        ThreadMapMap::const_iterator itr = m_threads.find(threadId);
        if (itr != m_threads.end())
            return &itr->second;
    }
    return NULL;
}

void MapUpdater::FreezeDetect()
{
    ACE_GUARD(ACE_Thread_Mutex, guard, m_mutex);
    if (!m_starttime.empty())
    {
        for (ThreadStartTimeMap::const_iterator itr = m_starttime.begin(); itr != m_starttime.end(); ++itr)
        if (WorldTimer::getMSTime() - itr->second > sWorld.getConfig(CONFIG_UINT32_VMSS_FREEZEDETECTTIME))
        {
            if (MapID const* mapPair = GetMapPairByThreadId(itr->first))
            {
                bool b_needKill = false;
                if (Map* map = sMapMgr.FindMap(mapPair->nMapId, mapPair->nInstanceId))
                {
                    if (map->IsBroken())
                    {
                        if (WorldTimer::getMSTime() - itr->second - sWorld.getConfig(CONFIG_UINT32_VMSS_FREEZEDETECTTIME) > sWorld.getConfig(CONFIG_UINT32_VMSS_FORCEUNLOADDELAY))
                            b_needKill = true;
                    }
                    else
                        b_needKill = true;
                }

                if (b_needKill)
                {
                    DEBUG_LOG("VMSS::MapUpdater::FreezeDetect thread "I64FMT" possible freezed (is update map %u instance %u). Killing.",itr->first,mapPair->nMapId, mapPair->nInstanceId);
                    ACE_OS::thr_kill(itr->first, SIGABRT);
                }
            }
        }
    }
}

void MapUpdater::MapBrokenEvent(MapID const* mapPair)
{
    if (!m_brokendata.empty())
    {
        MapBrokenDataMap::iterator itr =  m_brokendata.find(*mapPair);
        if (itr != m_brokendata.end())
        {
            if ((time(NULL) - itr->second.lastErrorTime) > sWorld.getConfig(CONFIG_UINT32_VMSS_TBREMTIME))
                itr->second.Reset();
            else
                itr->second.IncreaseCount();
            return;
        }
    }
    m_brokendata.insert(std::make_pair(*mapPair, MapBrokenData()));
}

MapBrokenData const* MapUpdater::GetMapBrokenData(MapID const* mapPair)
{
    if (!m_brokendata.empty())
    {
        MapBrokenDataMap::const_iterator itr =  m_brokendata.find(*mapPair);
        if (itr != m_brokendata.end())
            return &itr->second;
    }
    return NULL;
}
