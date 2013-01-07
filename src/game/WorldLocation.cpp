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

Position& Position::operator = (Position const& pos)
{
    x = pos.x;
    y = pos.y;
    z = pos.z;
    orientation = pos.orientation;
    return *this;
}

bool Position::operator == (Position const& pos) const
{
    return ((fabs(x - pos.x) < M_NULL_F)
        && (fabs(y - pos.y) < M_NULL_F)
        && (fabs(z - pos.z) < M_NULL_F));
};

WorldLocation::WorldLocation(WorldObject const& object)
    : Position(object.GetPositionX(), object.GetPositionX(), object.GetPositionZ(), object.GetOrientation()),
        mapid(object.GetMapId()), instance(object.GetInstanceId()), realmid(sWorld.getConfig(CONFIG_UINT32_REALMID))
{
};

bool WorldLocation::IsValidMapCoord(WorldLocation const& loc)
{
    if (loc.HasMap())
        return MapManager::IsValidMapCoord(loc);
    else
        return MaNGOS::IsValidMapCoord(loc.coord_x, loc.coord_y, loc.coord_z, loc.orientation);
}

bool WorldLocation::operator == (WorldLocation const& loc) const
{
    return (
            (realmid == 0 || realmid == loc.realmid)
        && (!HasMap() || GetMapId()  == loc.GetMapId())
        && (GetInstanceId() == 0 || GetInstanceId() == loc.GetInstanceId())
        && ((Position*)this) == ((Position*)&loc));
}

void WorldLocation::SetMapId(uint32 value)
{
    if (MapManager::IsValidMAP(value))
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
    if (IsValidMapCoord(loc))
    {
        SetMapId(loc.GetMapId());
        SetInstanceId(loc.GetInstanceId() > 0  ? loc.GetInstanceId() : instance);
        coord_x = loc.coord_x;
        coord_y = loc.coord_y;
        coord_z = loc.coord_z;
        SetOrientation(loc.orientation);
    }
    return *this;
}

uint32 WorldLocation::GetAreaId() const
{
    if (!HasMap())
        return 0;
    return sTerrainMgr.GetAreaId(GetMapId(), coord_x, coord_y, coord_z);
}

uint32 WorldLocation::GetZoneId() const
{
    if (!HasMap())
        return 0;
    return sTerrainMgr.GetZoneId(GetMapId(), coord_x, coord_y, coord_z);
}
