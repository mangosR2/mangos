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
 * @addtogroup TransportSystem
 * @{
 *
 * @file TransportSystem.cpp
 * This file contains the code needed for MaNGOS to provide abstract support for transported entities
 * Currently implemented
 * - Calculating between local and global coords
 * - Abstract storage of passengers (added by BoardPassenger, UnboardPassenger)
 */

#include "Player.h"
#include "Transports.h"
#include "TransportSystem.h"
#include "Unit.h"
#include "Vehicle.h"
#include "MapManager.h"

/* **************************************** TransportBase ****************************************/

TransportBase::TransportBase(WorldObject* owner) :
    m_owner(owner),
    m_lastPosition(owner->GetPositionX(), owner->GetPositionY(), owner->GetPositionZ(), owner->GetOrientation()),
    m_sinO(sin(m_lastPosition.o)),
    m_cosO(cos(m_lastPosition.o)),
    m_updatePositionsTimer(500)
{
    MANGOS_ASSERT(m_owner);
}

// Update every now and then (after some change of transporter's position)
// This is used to calculate global positions (which don't have to be exact, they are only required for some server-side calculations
void TransportBase::Update(uint32 diff)
{
    if (m_updatePositionsTimer < diff)
    {
        if (fabs(m_owner->GetPositionX() - m_lastPosition.x) +
                fabs(m_owner->GetPositionY() - m_lastPosition.y) +
                fabs(m_owner->GetPositionZ() - m_lastPosition.z) > 1.0f ||
                MapManager::NormalizeOrientation(m_owner->GetOrientation() - m_lastPosition.o) > 0.01f)
            UpdateGlobalPositions();

        m_updatePositionsTimer = 500;
    }
    else
        m_updatePositionsTimer -= diff;
}

// Update the global positions of all passengers
void TransportBase::UpdateGlobalPositions()
{
    WorldLocation pos = m_owner->GetPosition();

    // Calculate new direction multipliers
    if (MapManager::NormalizeOrientation(pos.o - m_lastPosition.o) > 0.01f)
    {
        m_sinO = sin(pos.o);
        m_cosO = cos(pos.o);
    }

    if (!m_passengers.empty())
    {
        MAPLOCK_READ(GetOwner(), MAP_LOCK_TYPE_MOVEMENT);
        // Update global positions
        for (PassengerMap::const_iterator itr = m_passengers.begin(); itr != m_passengers.end(); ++itr)
            UpdateGlobalPositionOf(itr->first, itr->second.GetLocalPosition());
    }

    m_lastPosition = pos;
}

// Update the global position of a passenger
void TransportBase::UpdateGlobalPositionOf(ObjectGuid const& passengerGuid, Position const& pos) const
{
    WorldObject* passenger = GetOwner()->GetMap()->GetWorldObject(passengerGuid);

    if (!passenger)
        return;

    Position g = CalculateGlobalPositionOf(pos);

    switch(passenger->GetTypeId())
    {
        case TYPEID_GAMEOBJECT:
        case TYPEID_DYNAMICOBJECT:
            m_owner->GetMap()->Relocation((GameObject*)passenger, g);
            break;
        case TYPEID_UNIT:
            m_owner->GetMap()->Relocation((Creature*)passenger, g);
            // If passenger is vehicle
            if (((Unit*)passenger)->IsVehicle())
                ((Unit*)passenger)->GetVehicleKit()->UpdateGlobalPositions();
            break;
        case TYPEID_PLAYER:
            m_owner->GetMap()->Relocation((Player*)passenger, g);
            // If passenger is vehicle
            if (((Unit*)passenger)->IsVehicle())
                ((Unit*)passenger)->GetVehicleKit()->UpdateGlobalPositions();
            break;
        case TYPEID_CORPSE:
        // TODO - add corpse relocation
        default:
            break;
    }
}

// This rotates the vector (lx, ly) by transporter->orientation
void TransportBase::RotateLocalPosition(float lx, float ly, float& rx, float& ry) const
{
    rx = lx * m_cosO - ly * m_sinO;
    ry = lx * m_sinO + ly * m_cosO;
}

// This rotates the vector (rx, ry) by -transporter->orientation
void TransportBase::NormalizeRotatedPosition(float rx, float ry, float& lx, float& ly) const
{
    lx = rx * -m_cosO - ry * -m_sinO;
    ly = rx * -m_sinO + ry * -m_cosO;
}

// Calculate a global position of local positions based on this transporter
Position TransportBase::CalculateGlobalPositionOf(Position const& pos) const
{
    Position g(pos);
    RotateLocalPosition(pos.x, pos.y, g.x, g.y);
    g.x += m_owner->GetPositionX();
    g.y += m_owner->GetPositionY();

    g.z = pos.z + m_owner->GetPositionZ();
    g.o = MapManager::NormalizeOrientation(pos.o + m_owner->GetOrientation());
    return g;
}

void TransportBase::BoardPassenger(WorldObject* passenger, Position const& pos, int8 seat)
{
    if (!passenger)
        return;

    MAPLOCK_WRITE(GetOwner(), MAP_LOCK_TYPE_MOVEMENT);

    // Insert our new passenger
    m_passengers.insert(PassengerMap::value_type(passenger->GetObjectGuid(),TransportInfo(*passenger, *this, pos, seat)));

    PassengerMap::iterator itr = m_passengers.find(passenger->GetObjectGuid());
    MANGOS_ASSERT(itr != m_passengers.end());

    // The passenger needs fast access to transportInfo
    passenger->SetTransportInfo(&itr->second);

    // Add MI and other data only if successful boarded!
    if (passenger->isType(TYPEMASK_UNIT))
    {
        ((Unit*)passenger)->m_movementInfo.ClearTransportData();
        ((Unit*)passenger)->m_movementInfo.AddMovementFlag(MOVEFLAG_ONTRANSPORT);
        ((Unit*)passenger)->m_movementInfo.SetTransportData(GetOwner()->GetObjectGuid(), pos, WorldTimer::getMSTime(), -1);
    }
    passenger->SetTransportPosition(pos);
}

void TransportBase::UnBoardPassenger(WorldObject* passenger)
{
    if (!passenger)
        return;

    // Cleanup movementinfo/data even his not boarded!
    if (passenger->isType(TYPEMASK_UNIT))
    {
        ((Unit*)passenger)->m_movementInfo.ClearTransportData();
        ((Unit*)passenger)->m_movementInfo.RemoveMovementFlag(MOVEFLAG_ONTRANSPORT);
    }
    passenger->ClearTransportData();

    // Set passengers transportInfo to NULL
    passenger->SetTransportInfo(NULL);

    MAPLOCK_WRITE(GetOwner(), MAP_LOCK_TYPE_MOVEMENT);
    PassengerMap::iterator itr = m_passengers.find(passenger->GetObjectGuid());

    if (itr == m_passengers.end())
        return;

    // Delete transportInfo
    // Unboard finally
    m_passengers.erase(itr);
}

/* **************************************** TransportInfo ****************************************/

void TransportInfo::SetLocalPosition(Position const& pos)
{
    m_owner.SetTransportPosition(pos);

    // Update global position
    m_transport.UpdateGlobalPositionOf(m_owner.GetObjectGuid(), pos);
}

WorldObject* TransportInfo::GetTransport() const 
{
    return m_transport.GetOwner();
}

ObjectGuid TransportInfo::GetTransportGuid() const
{
    return m_transport.GetOwner()->GetObjectGuid();
}

bool TransportInfo::IsOnVehicle() const
{
    return m_transport.GetOwner()->GetTypeId() == TYPEID_PLAYER || m_transport.GetOwner()->GetTypeId() == TYPEID_UNIT;
}

void NotifyMapChangeBegin::operator() (WorldObject* obj) const
{
    if (!obj)
        return;

    switch(obj->GetTypeId())
    {
        case TYPEID_GAMEOBJECT:
        case TYPEID_DYNAMICOBJECT:
            break;
        case TYPEID_UNIT:
            if (obj->GetObjectGuid().IsPet())
                break;
            // TODO Despawn creatures in old map
            break;
        case TYPEID_PLAYER:
        {
            Player* plr = (Player*)obj;
            if (!plr)
                return;
            if (plr->isDead() && !plr->HasFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST))
                plr->ResurrectPlayer(1.0);
            if (plr->GetSession() && m_oldloc.GetMapId() != m_loc.GetMapId())
            {
                WorldPacket data(SMSG_NEW_WORLD, 4);
                data << uint32(plr->IsOnTransport() ? plr->GetTransport()->GetTransportMapId() : m_loc.GetMapId());
                plr->GetSession()->SendPacket(&data);
            }
            plr->TeleportTo(m_loc, TELE_TO_NOT_LEAVE_TRANSPORT | TELE_TO_NODELAY);
            break;
        }
        // TODO - make corpse moving.
        case TYPEID_CORPSE:
        default:
            break;
    }
}

void NotifyMapChangeEnd::operator() (WorldObject* obj) const
{
    if (!obj)
        return;

    switch(obj->GetTypeId())
    {
        case TYPEID_GAMEOBJECT:
        case TYPEID_DYNAMICOBJECT:
            break;
        case TYPEID_UNIT:
            // TODO Spawn creatures in new map
            break;
        case TYPEID_PLAYER:
            break;
        // TODO - make corpse moving.
        case TYPEID_CORPSE:
        default:
            break;
    }
}

void SendCurrentTransportDataWithHelper::operator() (WorldObject* object) const
{
    if (!object || 
        object->GetObjectGuid() == m_player->GetObjectGuid() ||
        !m_player->HaveAtClient(object->GetObjectGuid()))
        return;

    object->BuildCreateUpdateBlockForPlayer(m_data, m_player);
}

void UpdateVisibilityOfWithHelper::operator() (WorldObject* object) const
{
    if (!object)
        return;

    if (m_guidSet.find(object->GetObjectGuid()) != m_guidSet.end())
    {
        if (object->GetTypeId() == TYPEID_PLAYER)
            ((Player*)object)->UpdateVisibilityOf(object, &m_player);
        m_player.UpdateVisibilityOf(&m_player, object, i_data, i_visibleNow);
        m_guidSet.erase(object->GetObjectGuid());
    }
}

/*! @} */
