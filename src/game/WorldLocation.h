/*
 * Copyright (C) 2012-2013 /dev/rsa for MangosR2 <http://github.com/mangosR2>
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

#ifndef _WORLDLOCATION_H
#define _WORLDLOCATION_H

#include "Common.h"
#include "SharedDefines.h"
#include "ByteBuffer.h"
#include "ObjectGuid.h"
#include <G3D/Vector3.h>

class MovementInfo;

using G3D::Vector3;

struct MANGOS_DLL_SPEC Location : public Vector3
{
    Location() 
        : Vector3(0.0f, 0.0f, 0.0f), orientation(0.0f)
    {}

    Location(float x, float y, float z, float o = 0.0f)
        : Vector3(x, y, z), orientation(o)
    {}

    Location(const Vector3& v, float o = 0.0f)
        : Vector3(v), orientation(o)
    {}

    Location(Location const &loc)
        : Vector3(loc.x, loc.y, loc.z), orientation(loc.orientation)
    {}

    virtual ~Location()
    {};

    virtual bool HasMap() const { return false; };

    Location& operator = (Location const& loc);
    bool operator == (Location const& loc) const;

    float GetDistance(Location const& loc) const;

    bool IsEmpty() const;

    float const& getX() const { return x; };
    float const& getY() const { return y; };
    float const& getZ() const { return z; };
    float const& getO() const { return orientation; };

    union
    {
        float orientation;
        float o;
    };
};

struct MANGOS_DLL_SPEC Position : public Location
{
    Position() 
        : Location(), m_phaseMask(PHASEMASK_NORMAL)
    {};

    explicit Position(float _x, float _y, float _z, float _o = 0.0f)
        : Location(_x, _y, _z, _o), m_phaseMask(PHASEMASK_NORMAL)
    {};

    explicit Position(float _x, float _y, float _z, float _o, uint32 phaseMask)
        : Location(_x, _y, _z, _o), m_phaseMask(phaseMask)
    {};

    Position(Position const &pos)
        : Location(pos.x, pos.y, pos.z, pos.orientation), m_phaseMask(pos.GetPhaseMask())
    {}

    Position(Position const &pos, uint32 phaseMask)
        : Location(pos.x, pos.y, pos.z, pos.orientation), m_phaseMask(phaseMask)
    {}

    virtual ~Position()
    {};

    uint32 m_phaseMask;

    virtual void SetPhaseMask(uint32 newPhaseMask) { m_phaseMask = newPhaseMask; };
    uint32 GetPhaseMask() const { return m_phaseMask; }

    virtual bool HasMap() const override { return false; };

    Position& operator = (Position const& pos);
    bool operator == (Position const& pos) const;

    float GetDistance(Position const& pos) const;
};

class WorldObject;

struct MANGOS_DLL_SPEC WorldLocation : public Position
{

    public:
    WorldLocation()
        : Position(), mapid(-1), instance(0), realmid(0), m_Tpos(Position()), m_Tguid(ObjectGuid())
    {}

    explicit WorldLocation(uint32 _mapid, float _x, float _y, float _z, float _o = 0.0f, uint32 phaseMask = PHASEMASK_NORMAL, uint32 _instance = 0, uint32 _realmid = 0);

    explicit WorldLocation(uint32 _mapid, uint32 _instance, uint32 _realmid)
        : Position(), mapid(_mapid), instance(_instance), realmid(_realmid), m_Tpos(Position()), m_Tguid(ObjectGuid())
    {}

    WorldLocation(WorldLocation const &loc)
        : Position(loc.x, loc.y, loc.z, loc.orientation, loc.GetPhaseMask()), mapid(loc.mapid), instance(loc.instance), realmid(loc.realmid), m_Tpos(loc.m_Tpos), m_Tguid(ObjectGuid())
    {}

    virtual ~WorldLocation() 
    {};

    static WorldLocation const Null;

    bool operator == (WorldLocation const& loc) const;

    virtual bool HasMap() const override
    {
        return mapid >= 0;
    }

    // Returns and set current ACTIVE position!
    Position const& value() { return GetPosition(); };
    Position const& GetPosition() { return GetTransportGuid().IsEmpty() ? ((Position)*this) : GetTransportPos(); };
    void SetPosition(Position const& pos);

    uint32 GetZoneId() const;
    uint32 GetAreaId() const;

    uint32 GetRealmId()    const { return realmid; };
    uint32 GetMapId()      const { return HasMap() ? uint32(mapid) :  UINT32_MAX; };
    uint32 GetInstanceId() const { return HasMap() ? instance :  0; };


    void SetMapId(uint32 value);
    void SetInstanceId(uint32 value)  { instance = value; };
    void SetRealmId(uint32 value)     { realmid  = value; }; // Currently not need make realm switch - awaiting multirealm implement.

    bool IsValidMapCoord(WorldLocation const& loc);

    void SetOrientation(float value);

    WorldLocation& operator = (WorldLocation const& loc);
    WorldLocation& operator = (Position const& pos);

    void SetPosition(WorldLocation const& loc);
    //void SetPosition(MovementInfo const& mi);

    float GetDistance(WorldLocation const& loc) const;

    float GetDistance(Location const& loc) const;

    private:
    int32     mapid;                      // mapid    = -1 for not fully initialized WorldLocation
    uint32    instance;                   // instance = 0  for not fully initialized WorldLocation ("current instance")
    uint32    realmid;                    // realmid  = 0  for "always current realm". 

    // Transport relative position
    public:
    Position const& GetTransportPos() const { return m_Tpos; };
    Position& GetTransportPosition() { return m_Tpos; };
    void ClearTransportData() { m_Tguid = ObjectGuid(); m_Tpos = Position(); };
    void SetTransportPosition(Position const& pos) { m_Tpos = pos; };
    ObjectGuid const& GetTransportGuid() const { return m_Tguid; };
    void SetTransportGuid(ObjectGuid const& guid) { m_Tguid = guid; };

    private:
    Position    m_Tpos;
    ObjectGuid  m_Tguid;
};

ByteBuffer& operator << (ByteBuffer& buf, Location const& loc);
ByteBuffer& operator >> (ByteBuffer& buf, Location&       loc);

#endif
