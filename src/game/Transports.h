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

#ifndef TRANSPORTS_H
#define TRANSPORTS_H

#include "GameObject.h"
#include "DBCEnums.h"
#include "TransportSystem.h"

#include <map>
#include <set>
#include <string>

class TransportKit;

class MANGOS_DLL_SPEC Transport : public GameObject
{
    public:
        explicit Transport();
        virtual ~Transport();

        virtual void Update(uint32 update_diff, uint32 p_time) override;

        bool AddPassenger(WorldObject* passenger, Position const& transportPos);
        bool RemovePassenger(WorldObject* passenger);

        virtual void Start() {};
        virtual void Stop() {};

        virtual TransportKit* GetTransportKit() override { return m_transportKit; };

        virtual bool IsTransport() const override { return bool(m_transportKit); };
        TransportBase* GetTransportBase() { return (TransportBase*)m_transportKit; };

        uint32 GetPeriod(bool isDB = false) const { return isDB ? m_period : GetUInt32Value(GAMEOBJECT_LEVEL);}

        void SetDBPeriod(uint32 _period) { m_period = _period; };
        void SetPeriod(uint32 time) { SetUInt32Value(GAMEOBJECT_LEVEL, time);}

    private:
        uint32 m_period;

    protected:
        bool m_isInitialized;
        TransportKit* m_transportKit;
};

class MANGOS_DLL_SPEC MOTransport : public Transport
{
    public:
        explicit MOTransport();
        virtual ~MOTransport();

        static uint32 GetPossibleMapByEntry(uint32 entry, bool start = true);
        static bool   IsSpawnedAtDifficulty(uint32 entry, Difficulty difficulty);

        bool Create(uint32 guidlow, uint32 mapid, float x, float y, float z, float ang, uint8 animprogress, uint16 dynamicHighValue);
        bool GenerateWaypoints(uint32 pathid, std::set<uint32>& mapids);

        virtual void Update(uint32 update_diff, uint32 p_time) override;
        bool SetPosition(WorldLocation const& loc, bool teleport);

        uint32 GetTransportMapId() const { return GetGOInfo() ? GetGOInfo()->moTransport.mapID : 0; };

        virtual void Start() override;
        virtual void Stop() override;

        virtual bool IsMOTransport() const override { return bool(m_transportKit); };

    private:
        struct WayPoint
        {
            WayPoint() : loc(WorldLocation()), teleport(false) {}
            WayPoint(uint32 _mapid, float _x, float _y, float _z, bool _teleport, uint32 _arrivalEventID = 0, uint32 _departureEventID = 0)
                : loc(_mapid, _x, _y, _z, 0.0f), teleport(_teleport),
                arrivalEventID(_arrivalEventID), departureEventID(_departureEventID), delay(0)
            {
            }
            WorldLocation loc;
            bool teleport;
            uint32 arrivalEventID;
            uint32 departureEventID;
            uint32 delay;
        };

    public:
        typedef std::map<uint32, WayPoint> WayPointMap;

    private:
        void DoEventIfAny(WayPointMap::value_type const& node, bool departure);
        void MoveToNextWayPoint();                          // move m_next/m_cur to next points

        WayPointMap m_WayPoints;
        uint32 m_timer;
        uint32 m_pathTime;
        uint32 m_nextNodeTime;
        IntervalTimer  m_anchorageTimer;

        WayPointMap::const_iterator m_curr;
        WayPointMap::const_iterator m_next;

    public:
        WayPointMap::const_iterator GetCurrent() { return m_curr; }
        WayPointMap::const_iterator GetNext()    { return m_next; }
        WayPoint const& GetWayPoint(uint32 index) { return index < m_WayPoints.size() ? m_WayPoints[index] : m_WayPoints[0]; }
};

class  MANGOS_DLL_SPEC TransportKit : public TransportBase
{
    public:
        explicit TransportKit(Transport& base);
        virtual ~TransportKit();

        void Initialize();
        bool IsInitialized() const { return m_isInitialized; }

        void Reset();

        bool AddPassenger(WorldObject* passenger, Position const& transportPos);
        void RemovePassenger(WorldObject* passenger);
        void RemoveAllPassengers();

        Transport* GetBase() const { return (Transport*)GetOwner(); }
        PassengerMap const& GetPassengers() const { return m_passengers; };

    private:
        // Internal use to calculate the boarding position
        virtual Position CalculateBoardingPositionOf(Position const& pos) const override;
        bool m_isInitialized;
};

#endif
