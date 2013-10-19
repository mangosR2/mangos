/*
 * Copyright (C) 2012 MangosR2 <http://mangosR2.2x2forum.com/>
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

#include "GridMap.h"
#include "MapManager.h"
#include "Object.h"
#include "Unit.h"
#include "World.h"
#include "WorldLocation.h"

Location& Location::operator = (Location const& loc)
{
    x = loc.getX();
    y = loc.getY();
    z = loc.getZ();
    orientation = loc.getO();
    return *this;
}

bool Location::operator == (Location const& loc) const
{
    return ((fabs(getX() - loc.getX()) < M_NULL_F)
        && (fabs(getY() - loc.getY()) < M_NULL_F)
        && (fabs(getZ() - loc.getZ()) < M_NULL_F));
};

float Location::GetDistance(Location const& loc) const
{
    return (*this - loc).magnitude();
};

bool Location::IsEmpty() const
{
    return fabs(getX()) < M_NULL_F && fabs(getY()) < M_NULL_F && fabs(getZ()) < M_NULL_F;
}

Position& Position::operator = (Position const& pos)
{
    x           = pos.getX();
    y           = pos.getY();
    z           = pos.getZ();
    orientation = pos.getO();
    m_phaseMask = pos.GetPhaseMask();

    return *this;
}

bool Position::operator == (Position const& pos) const
{
    return (((Location)*this) == ((Location)pos)) && (GetPhaseMask() & pos.GetPhaseMask());
};

float Position::GetDistance(Position const& pos) const
{
    return (GetPhaseMask() & pos.GetPhaseMask()) ?
        ((Location)*this).GetDistance((Location)pos) :
        MAX_VISIBILITY_DISTANCE + 1.0f;
};

WorldLocation const WorldLocation::Null = WorldLocation();

WorldLocation::WorldLocation(uint32 _mapid, float _x, float _y, float _z, float _o, uint32 phaseMask, uint32 _instance, uint32 _realmid)
    : Position(_x, _y, _z, _o, phaseMask), mapid(_mapid), instance(_instance), realmid(_realmid), m_Tpos(Position()), m_Tguid(ObjectGuid())
{
    if (realmid == 0)
        SetRealmId(sWorld.getConfig(CONFIG_UINT32_REALMID));
};

bool WorldLocation::IsValidMapCoord(WorldLocation const& loc)
{
    if (loc.HasMap())
        return MapManager::IsValidMapCoord(loc);
    else
        return MaNGOS::IsValidMapCoord(loc.getX(), loc.getY(), loc.getZ(), loc.getO());
}

bool WorldLocation::operator == (WorldLocation const& loc) const
{
    return (
            (realmid == 0 || realmid == loc.realmid)
        && (!HasMap() || GetMapId()  == loc.GetMapId())
        && (GetInstanceId() == 0 || GetInstanceId() == loc.GetInstanceId())
        && ((Position)*this) == ((Position)loc)
        && GetTransportPos() == loc.GetTransportPos());
}

void WorldLocation::SetMapId(uint32 value)
{
    //if (!MapManager::IsValidMAP(value))
    //    sLog.outError("WorldLocation::SetMapId try set invalid map id!");
    mapid = value;
}

void WorldLocation::SetOrientation(float value)
{
    if (fabs(value) > 2.0f * M_PI_F)
        orientation = MapManager::NormalizeOrientation(value);
    else
        orientation = value;
}

WorldLocation& WorldLocation::operator = (WorldLocation const& loc)
{
    //if (!IsValidMapCoord(loc))
    //    sLog.outError("WorldLocation::operator = try set invalid location!");

    if (loc.HasMap())
    {
        mapid       = loc.GetMapId();
        instance    = loc.GetInstanceId();
    }
    m_Tpos      = loc.GetTransportPos();
    x           = loc.getX();
    y           = loc.getY();
    z           = loc.getZ();
    orientation = loc.getO();
    m_phaseMask = loc.GetPhaseMask();
    m_Tguid     = loc.GetTransportGuid();
    return *this;
}

WorldLocation& WorldLocation::operator = (Position const& pos)
{
    x           = pos.getX();
    y           = pos.getY();
    z           = pos.getZ();
    orientation = pos.getO();
    m_phaseMask = pos.GetPhaseMask();
    return *this;
}

void WorldLocation::SetPosition(Position const& pos)
{
    if (GetTransportGuid().IsEmpty())
    {
        x           = pos.getX();
        y           = pos.getY();
        z           = pos.getZ();
        orientation = pos.getO();
        //m_phaseMask = pos.GetPhaseMask();
    }
    else
        SetTransportPosition(pos);
}

void WorldLocation::SetPosition(WorldLocation const& loc)
{
    // This method not set transport position!
    if (loc.HasMap())
    {
        mapid       = loc.GetMapId();
        instance    = loc.GetInstanceId();
    }
    x           = loc.getX();
    y           = loc.getY();
    z           = loc.getZ();
    orientation = loc.getO();
    //m_phaseMask = loc.GetPhaseMask();
}

/*void WorldLocation::SetPosition(MovementInfo const& mi)
{
    // This method not set transport position!
    if (mi.GetPosition().HasMap())
    {
        mapid       = mi.GetPosition().mapid;
        instance    = mi.GetPosition().instance;
    }
    x           = mi.GetPosition().getX();
    y           = mi.GetPosition().getY();
    z           = mi.GetPosition().getZ();
    orientation = mi.GetPosition().getO();
    //m_phaseMask = loc.GetPhaseMask();

    if (mi.GetTransportGuid())
    {
        SetTransportGuid(mi.GetTransportGuid());
        SetTransportPosition(mi.GetTransportPosition());
    }
    else
        ClearTransportData();
}
*/
uint32 WorldLocation::GetAreaId() const
{
    if (!HasMap())
        return 0;

    return sTerrainMgr.GetAreaId(GetMapId(), getX(), getY(), getZ());
}

uint32 WorldLocation::GetZoneId() const
{
    if (!HasMap())
        return 0;

    return sTerrainMgr.GetZoneId(GetMapId(), getX(), getY(), getZ());
}

float WorldLocation::GetDistance(WorldLocation const& loc) const
{
    if (!HasMap() || !loc.HasMap() || ((GetMapId() == loc.GetMapId()) && (GetInstanceId() == loc.GetInstanceId())))
    {
        if (GetTransportPos().IsEmpty() && loc.GetTransportPos().IsEmpty())
            return ((Position)*this).GetDistance((Position)loc);
        else if (GetPhaseMask() & loc.GetPhaseMask() &&  GetTransportPos().GetPhaseMask() & loc.GetTransportPos().GetPhaseMask())
            return (((Vector3)*this + (Vector3)GetTransportPos()) - ((Vector3)loc + (Vector3)loc.GetTransportPos())).magnitude();
    }

    return MAX_VISIBILITY_DISTANCE + 1.0f;
};

float WorldLocation::GetDistance(Location const& loc) const
{
    return (((Vector3)*this + (Vector3)GetTransportPos()) - (Vector3)loc).magnitude();
};

ByteBuffer& operator << (ByteBuffer& buf, Location const& loc)
{
    buf << loc.getX();
    buf << loc.getY();
    buf << loc.getZ();
    return buf;
}

ByteBuffer& operator >> (ByteBuffer& buf, Location& loc)
{
    loc.x = buf.read<float>();
    loc.y = buf.read<float>();
    loc.z = buf.read<float>();
    return buf;
}
