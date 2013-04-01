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
#include "World.h"
#include "WorldLocation.h"

Location& Location::operator = (Location const& loc)
{
    x = loc.x;
    y = loc.y;
    z = loc.z;
    orientation = loc.orientation;
    return *this;
}

bool Location::operator == (Location const& loc) const
{
    return ((fabs(x - loc.x) < M_NULL_F)
        && (fabs(y - loc.y) < M_NULL_F)
        && (fabs(z - loc.z) < M_NULL_F));
};

float Location::GetDistance(Location const& loc) const
{
    return (*this - loc).magnitude();
};

bool Location::IsEmpty() const
{
    return fabs(x) < M_NULL_F && fabs(y) < M_NULL_F && fabs(z) < M_NULL_F;
}

Position& Position::operator = (Position const& pos)
{
    x           = pos.x;
    y           = pos.y;
    z           = pos.z;
    orientation = pos.orientation;
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
    : Position(_x, _y, _z, _o, phaseMask), mapid(_mapid), instance(_instance), realmid(_realmid), m_Tpos(Position())
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
        && ((Position)*this) == ((Position)loc));
}

void WorldLocation::SetMapId(uint32 value)
{
    //if (!MapManager::IsValidMAP(value))
    //    sLog.outError("WorldLocation::SetMapId try set invalid map id!");
    mapid = value;
}

void WorldLocation::SetOrientation(float value)
{
    if (fabs(orientation) > 2.0f * M_PI_F)
        orientation = MapManager::NormalizeOrientation(value);
    else
        orientation = value;
}

WorldLocation& WorldLocation::operator = (WorldLocation const& loc)
{
    //if (!IsValidMapCoord(loc))
    //    sLog.outError("WorldLocation::operator = try set invalid location!");

    mapid       = loc.mapid;
    instance    = loc.instance;
    m_Tpos      = loc.m_Tpos;
    x           = loc.x;
    y           = loc.y;
    z           = loc.z;
    orientation = loc.orientation;
    m_phaseMask = loc.GetPhaseMask();
    return *this;
}

WorldLocation& WorldLocation::operator = (Position const& pos)
{
    x           = pos.x;
    y           = pos.y;
    z           = pos.z;
    orientation = pos.orientation;
    m_phaseMask = pos.GetPhaseMask();
    return *this;
}

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
    return (!HasMap() || !loc.HasMap() || ((GetMapId() == loc.GetMapId()) && (GetInstanceId() == loc.GetInstanceId()))) ?
        ((Position)*this).GetDistance((Position)loc) :
        MAX_VISIBILITY_DISTANCE + 1.0f;
};

float WorldLocation::GetDistance(Location const& loc) const
{
    return ((Location)*this).GetDistance(loc);
};
