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

int MapUpdater::update_hook()
{
    return 0;
}

int MapUpdater::freeze_hook()
{
    if (sWorld.getConfig(CONFIG_UINT32_VMSS_FREEZEDETECTTIME) == 0 ||  getActiveThreadsCount() == 0)
        return 0;

    ACE_Write_Guard<ACE_RW_Thread_Mutex> guardRW(m_rwmutex);
    for (ThreadsMap::const_iterator itr = m_threadsMap.begin(); itr != m_threadsMap.end(); ++itr)
    {
        ObjectUpdateRequest<Map>* rq = itr->second;
        if (!rq)
            continue;

        if (WorldTimer::getMSTime() - rq->getStartTime() > (sWorld.getConfig(CONFIG_UINT32_VMSS_FREEZEDETECTTIME) + sWorld.getConfig(CONFIG_UINT32_VMSS_FREEZECHECKPERIOD)))
        {
            if (Map* map = rq->getObject())
            {
                ACE_thread_t threadId = itr->first;
                sLog.outError("VMSS::MapUpdater::freeze_hook thread "I64FMT" possible freezed (is update map %u instance %u), killing his.", threadId, map->GetId(), map->GetInstanceId());
                kill_thread(threadId, true);
                return 1;
            }
        }
    }
    return 0;
}

void MapUpdater::MapBrokenEvent(Map* map)
{
    MapStatisticDataMap::iterator itr =  m_mapStatData.find(map);
    if (itr == m_mapStatData.end())
        m_mapStatData.insert(std::make_pair(map, MapStatisticData()));

    if ((WorldTimer::getMSTime() - itr->second.lastErrorTime) > sWorld.getConfig(CONFIG_UINT32_VMSS_TBREMTIME))
    {
        itr->second.BreaksReset();
        itr->second.IncreaseBreaksCount();
    }
    else
        itr->second.IncreaseBreaksCount();
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
