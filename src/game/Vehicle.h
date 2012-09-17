/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2010-2012 /dev/rsa for MangosR2 <http://github.com/MangosR2>
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

#ifndef MANGOSSERVER_VEHICLE_H
#define MANGOSSERVER_VEHICLE_H

#include "Common.h"
#include "ObjectGuid.h"
#include "ObjectHandler.h"
#include "Creature.h"
#include "Unit.h"
#include "SharedDefines.h"

#define SPELL_RIDE_VEHICLE_HARDCODED 46598

struct VehicleEntry;

class VehicleInfo
{
        VehicleEntry const* m_vehicleEntry;
    public:
        explicit VehicleInfo(VehicleEntry const* entry);

        VehicleEntry const* GetEntry() const { return m_vehicleEntry; }
};

struct VehicleSeat
{
    VehicleSeat(VehicleSeatEntry const *pSeatInfo = NULL) : seatInfo(pSeatInfo), passenger(ObjectGuid()) {}

    VehicleSeatEntry const* seatInfo;
    ObjectGuid              passenger;
    bool IsProtectPassenger() const;
};

typedef std::map<int8, VehicleSeat> SeatMap;

struct VehicleAccessory
{
    explicit VehicleAccessory(uint32 _uiAccessory, int32 _uiSeat, bool _bMinion) : uiAccessory(_uiAccessory), uiSeat(_uiSeat), bMinion(_bMinion) 
    {
        m_offsetX = m_offsetY = m_offsetZ = m_offsetO = 0.0f;
    }
    void Offset(float x, float y, float z, float o = 0.0f) {m_offsetX = x; m_offsetY = y; m_offsetZ = z; m_offsetO = o;};
    uint32 uiAccessory;
    int32   uiSeat;
    bool   bMinion;
    float m_offsetX, m_offsetY, m_offsetZ, m_offsetO;
};

typedef std::vector<VehicleAccessory> VehicleAccessoryList;
typedef std::map<uint32, VehicleAccessoryList> VehicleAccessoryMap;

class MANGOS_DLL_SPEC VehicleKit
{
    public:
        explicit VehicleKit(Unit* base);
        ~VehicleKit();

        void Reset();
        void InstallAllAccessories(uint32 entry);

        bool HasEmptySeat(int8 seatId) const;
        int8 GetNextEmptySeatWithFlag(int8 seatId, bool next = true, uint32 VehicleSeatFlag = 0) const;
        Unit *GetPassenger(int8 seatId) const;
        bool AddPassenger(Unit *passenger, int8 seatId = -1);
        void RemovePassenger(Unit *passenger, bool dismount = false);
        void RelocatePassengers(float x, float y, float z, float ang);
        void RemoveAllPassengers();
        VehicleSeatEntry const* GetSeatInfo(Unit* passenger);
        int8 GetSeatId(Unit* passenger);
        void SetDestination(float x, float y, float z, float o, float speed, float elevation);
        void SetDestination() { m_dst_x = 0.0f; m_dst_y = 0.0f; m_dst_z  = 0.0f; m_dst_o  = 0.0f; m_dst_speed  = 0.0f; m_dst_elevation  = 0.0f; b_dstSet = false;};

        Unit* GetBase() const { return m_pBase; }
        Aura* GetControlAura(Unit* passenger);

    private:
        void UpdateFreeSeatCount();
        void InstallAccessory(VehicleAccessory const* accessory);

        void Dismount(Unit* passenger, VehicleSeatEntry const* pSeatInfo = NULL);

        Unit* m_pBase;
        SeatMap m_Seats;
        uint32 m_uiNumFreeSeats;
        bool  b_dstSet;
        float m_dst_x, m_dst_y, m_dst_z, m_dst_o, m_dst_speed, m_dst_elevation;

};

#endif
