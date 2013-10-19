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

#ifndef _MAP_UPDATER_H_INCLUDED
#define _MAP_UPDATER_H_INCLUDED

#include "ObjectUpdateTaskBase.h"
#include "Common.h"

class Map;

struct MapStatisticData
{
    explicit MapStatisticData()
    {
        BreaksReset();
        CleanStatistic();
    }

    void BreaksReset()
    {
        breaksCount = 0;
        lastErrorTime = WorldTimer::getMSTime();
    };

    void IncreaseBreaksCount() { ++breaksCount; ++summBreaksCount; lastErrorTime = WorldTimer::getMSTime(); };

    void CleanStatistic() 
    {
        updatesCount = 0;
        maxUpdateTime = 0;
        minUpdateTime = 0;
        averageUpdateTime = 0;
        lifeTime = 0;
        summBreaksCount = 0;
    };

    // Freeze detection/statistic
    uint32 breaksCount;
    uint32 lastErrorTime;

    // common statistic
    //
    uint32 updatesCount;
    uint32 maxUpdateTime;
    uint32 minUpdateTime;
    uint32 averageUpdateTime;
    uint32 lifeTime;
    uint32 summBreaksCount;
};

typedef UNORDERED_MAP<Map*, MapStatisticData> MapStatisticDataMap;

class MapUpdater : public ObjectUpdateTaskBase<class Map>
{
    public:

        MapUpdater();

        virtual ~MapUpdater() {};

        void ReactivateIfNeed();
        void UpdateLoadBalancer(bool b_start);

        Map* GetMapByThreadId(ACE_thread_t const threadId);
        void MapBrokenEvent(Map* map);

        MapStatisticData const* GetMapStatisticData(Map* map);
        void MapStatisticDataRemove(Map* map);

        virtual int update_hook() override;
        virtual int freeze_hook() override;

    private:
        MapStatisticDataMap   m_mapStatData;

        ShortIntervalTimer i_balanceTimer;
        int32  m_threadsCountPreferred;
        uint32 m_previewTimeStamp;
        uint64 m_workTimeStorage;
        uint64 m_sleepTimeStorage;
        uint32 m_tickCount;
};

#endif //_MAP_UPDATER_H_INCLUDED
