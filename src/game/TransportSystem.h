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

/**
 * @addtogroup TransportSystem to provide abstract support for transported entities
 * The Transport System in MaNGOS consists of these files:
 * - TransportSystem.h to provide the basic classes TransportBase and TransportInfo
 * - TransportSystem.cpp which implements these classes
 * - Vehicle.h as a vehicle is a transporter it will inherit itr transporter-information from TransportBase
 * - Transports.h to implement the MOTransporter (subclas of gameobject) - Remains TODO
 * as well of
 * - impacts to various files
 *
 * @{
 *
 * @file TransportSystem.h
 * This file contains the headers for base clases needed for MaNGOS to handle passengers on transports
 *
 */

#ifndef _TRANSPORT_SYSTEM_H
#define _TRANSPORT_SYSTEM_H

#include "Common.h"
#include "Map.h"
#include "Object.h"
#include "ObjectGuid.h"

class TransportBase;

/**
 * A class to provide basic information for each transported passenger. This includes
 * - local positions
 * - Accessors to get the transporter
 */

class MANGOS_DLL_DECL TransportInfo
{
    public:
        TransportInfo(WorldObject& owner, TransportBase& transport, Position const& pos, int8 seat) :
            m_owner(owner), m_transport(transport), m_seat(seat)
        {/*SetTransportPosition(pos)*/};

        TransportInfo(TransportInfo const& info) :
            m_owner(info.m_owner), m_transport(info.m_transport), m_seat(info.m_seat)
        {};

        ~TransportInfo() { m_owner.SetTransportInfo(NULL); };

        // Set local positions
        void SetLocalPosition(Position const& pos);
        void SetTransportSeat(int8 seat) { m_seat = seat; }

        // Accessors
        WorldObject* GetTransport() const;
        ObjectGuid GetTransportGuid() const;

        // Required for chain-updating (passenger on transporter on transporter)
        bool IsOnVehicle() const;

        // Get local position and seat
        uint8 GetTransportSeat() const { return m_seat; }
        Position const& GetLocalPosition() const { return m_owner.GetPosition().GetTransportPos(); }

    private:
        WorldObject&   m_owner;                             ///< Passenger
        TransportBase& m_transport;                         ///< Transporter
        int8 m_seat;
};

typedef UNORDERED_MAP < ObjectGuid /*passenger*/, TransportInfo /*passengerInfo*/ > PassengerMap;

/**
 * A class to provide basic support for each transporter. This includes
 * - Storing a list of passengers
 * - Providing helper for calculating between local and global coordinates
 */

class MANGOS_DLL_DECL TransportBase
{
    public:
        explicit TransportBase(WorldObject* owner);
        virtual ~TransportBase() { MANGOS_ASSERT(m_passengers.size() == 0); };

        void Update(uint32 diff);
        void UpdateGlobalPositions();
        void UpdateGlobalPositionOf(ObjectGuid const& passengerGuid, Position const& pos) const;

        WorldObject* GetOwner() const { return m_owner; }

        // Helper functions to calculate positions
        void RotateLocalPosition(float lx, float ly, float& rx, float& ry) const;
        void NormalizeRotatedPosition(float rx, float ry, float& lx, float& ly) const;

        Position CalculateGlobalPositionOf(Position const& pos) const;

        bool const HasPassengers() const { return (m_passengers.size() > 0); }

        // Helper functions to add/ remove a passenger from the list
        void BoardPassenger(WorldObject* passenger, Position const& pos, int8 seat);
        void UnBoardPassenger(WorldObject* passenger);

    private:
        virtual Position CalculateBoardingPositionOf(Position const& pos) const { return Position(); };

    protected:
        WorldObject* m_owner;                               ///< The transporting unit
        PassengerMap m_passengers;                          ///< List of passengers and their transport-information

        // Helpers to speedup position calculations
        Position m_lastPosition;
        float m_sinO, m_cosO;
        uint32 m_updatePositionsTimer;                      ///< Timer that is used to trigger updates for global coordinate calculations

    public:
        template<typename Func> void CallForAllPassengers(Func const& func)
        {
            if (!m_passengers.empty())
            {
                for (PassengerMap::const_iterator itr = m_passengers.begin(); itr != m_passengers.end();)
                {
                    WorldObject* passenger = GetOwner()->GetMap()->GetWorldObject((itr++)->first);
                    if (!passenger)
                        continue;
                    func(passenger);
                }
            }
        }
};

struct NotifyMapChangeBegin
{
    explicit NotifyMapChangeBegin(Map const* map, WorldLocation const& oldloc, WorldLocation const& loc) :
        m_map(map), m_oldloc(oldloc), m_loc(loc)
    {}
    void operator()(WorldObject* object) const;
    Map const* m_map;
    WorldLocation const& m_oldloc;
    WorldLocation const& m_loc;
};

struct NotifyMapChangeEnd
{
    explicit NotifyMapChangeEnd(Map const* map, WorldLocation const& loc) :
        m_map(map), m_loc(loc)
    {}
    void operator()(WorldObject* object) const;
    Map const* m_map;
    WorldLocation const& m_loc;
};

struct SendCurrentTransportDataWithHelper
{
    explicit SendCurrentTransportDataWithHelper(UpdateData* data, Player* player) : m_data(data), m_player(player)
    {}
    void operator()(WorldObject* object) const;
    UpdateData* m_data;
    Player* m_player;
};

struct UpdateObjectVisibilityWithHelper
{
    explicit UpdateObjectVisibilityWithHelper(WorldObject* obj, Cell cell, CellPair cellpair) : m_obj(obj), m_cell(cell), m_cellpair(cellpair)
    {}
    void operator()(WorldObject* object) const;
    WorldObject* m_obj;
    Cell m_cell;
    CellPair m_cellpair;
};

struct UpdateVisibilityOfWithHelper
{
    explicit UpdateVisibilityOfWithHelper(Player& player, GuidSet& guidSet, UpdateData& data, WorldObjectSet& visibleNow) 
        : m_player(player), m_guidSet(guidSet), i_data(data), i_visibleNow(visibleNow)
    {}
    void operator()(WorldObject* object) const;
    Player&  m_player;
    GuidSet& m_guidSet;
    UpdateData& i_data;
    WorldObjectSet& i_visibleNow;
};

#endif
/*! @} */
