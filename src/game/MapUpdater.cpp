/*
 * Copyright (C) 2011-2013 /dev/rsa for MangosR2 <http://github.com/MangosR2>
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
#include "ObjectUpdateTaskBase.h"
#include "Map.h"
#include "MapManager.h"
#include "World.h"
#include "Database/DatabaseEnv.h"

MapUpdater::MapUpdater() : ObjectUpdateTaskBase<class Map>()
{
    m_threadsCountPreferred = sWorld.getConfig(CONFIG_BOOL_THREADS_DYNAMIC) ? 1 : sWorld.getConfig(CONFIG_UINT32_NUMTHREADS);

    if (m_threadsCountPreferred > 0 && activate(m_threadsCountPreferred) == -1)
        abort();

    i_balanceTimer.SetInterval(sWorld.getConfig(CONFIG_UINT32_INTERVAL_MAPUPDATE)*100);
    m_previewTimeStamp = WorldTimer::getMSTime();
    m_workTimeStorage = 0;
    m_sleepTimeStorage = 0;
    m_tickCount = 0;
}

int MapUpdater::update_hook()
{
    return 0;
}

int MapUpdater::freeze_hook()
{
    if (sWorld.getConfig(CONFIG_UINT32_VMSS_FREEZEDETECTTIME) == 0 ||  getActiveThreadsCount() == 0)
        return 0;

    // Lock in this case
    ACE_Read_Guard<ACE_RW_Thread_Mutex> guardRW(m_rwmutex, true);
    for (ThreadsMap::const_iterator itr = m_threadsMap.begin(); itr != m_threadsMap.end(); ++itr)
    {
        ObjectUpdateRequest<Map>* rq = itr->second;
        if (!rq)
            continue;

        if (WorldTimer::getMSTime() - rq->getStartTime() > sWorld.getConfig(CONFIG_UINT32_VMSS_FREEZEDETECTTIME))
        {
            if (Map* map = rq->getObject())
            {
                map->SetBroken(true);
                MapBrokenEvent(map);
                ACE_thread_t threadId = itr->first;
                sLog.outError("VMSS::MapUpdater::freeze_hook thread "I64FMT" possible freezed (is update map %u instance %u), killing his.", threadId, map->GetId(), map->GetInstanceId());
                guardRW.release();
                kill_thread(threadId, true);
                if (m_queue.is_empty() && getActiveThreadsCount() == 0)
                    return 1;
                else
                    return 0;
            }
        }
    }
    return 0;
}

void MapUpdater::MapBrokenEvent(Map* map)
{
    MapStatisticData& data = m_mapStatData[map];

    if ((WorldTimer::getMSTime() - data.lastErrorTime) > sWorld.getConfig(CONFIG_UINT32_VMSS_TBREMTIME))
    {
        data.BreaksReset();
        data.IncreaseBreaksCount();
    }
    else
        data.IncreaseBreaksCount();
}

MapStatisticData const* MapUpdater::GetMapStatisticData(Map* map)
{
    return &m_mapStatData[map];
}

void MapUpdater::MapStatisticDataRemove(Map* map)
{
    if (!m_mapStatData.empty())
    {
        MapStatisticDataMap::const_iterator itr =  m_mapStatData.find(map);
        if (itr != m_mapStatData.end())
            m_mapStatData.erase(itr);
    }
}

void MapUpdater::UpdateLoadBalancer(bool b_start)
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
        m_threadsCountPreferred = getCurrentThreadsCount();

    if (m_threadsCountPreferred != getCurrentThreadsCount())
        sLog.outDetail("MapUpdater::UpdateLoadBalancer load balance %f (tick count %u), threads %u, new %u", loadValue, m_tickCount, getCurrentThreadsCount(), m_threadsCountPreferred);

    m_workTimeStorage = 0;
    m_sleepTimeStorage = 0;
    m_tickCount = 0;

    i_balanceTimer.SetCurrent(0);
}

void MapUpdater::ReactivateIfNeed()
{
    if (!sWorld.getConfig(CONFIG_BOOL_THREADS_DYNAMIC) && sWorld.getConfig(CONFIG_UINT32_NUMTHREADS) < 2)
        return;
    std::string updaterErr = getLastError();
    if (!updaterErr.empty())
            sLog.outError("MapUpdater::ReactivateIfNeed updater reports %s.", updaterErr.c_str());

    if (m_threadsCountPreferred != getCurrentThreadsCount())
        sLog.outDetail("MapUpdater::Update map virtual server threads pool reactivated, new threads count is %u", m_threadsCountPreferred);

    reactivate(m_threadsCountPreferred);
}