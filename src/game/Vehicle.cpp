/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
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

#include "Common.h"
#include "Log.h"
#include "ObjectMgr.h"
#include "Vehicle.h"
#include "Unit.h"
#include "CreatureAI.h"
#include "Util.h"
#include "WorldPacket.h"

VehicleInfo::VehicleInfo(VehicleEntry const* entry) :
    m_vehicleEntry(entry)
{
}

VehicleKit::VehicleKit(Unit* base) : m_pBase(base), m_uiNumFreeSeats(0)
{
    for (uint32 i = 0; i < MAX_VEHICLE_SEAT; ++i)
    {
        uint32 seatId = GetBase()->GetVehicleInfo()->GetEntry()->m_seatID[i];

        if (!seatId)
            continue;

        if (base)
        {
            if (GetBase()->GetVehicleInfo()->GetEntry()->m_flags & VEHICLE_FLAG_NO_STRAFE)
                GetBase()->m_movementInfo.AddMovementFlag2(MOVEFLAG2_NO_STRAFE);

            if (GetBase()->GetVehicleInfo()->GetEntry()->m_flags & VEHICLE_FLAG_NO_JUMPING)
                GetBase()->m_movementInfo.AddMovementFlag2(MOVEFLAG2_NO_JUMPING);
        }

        if (VehicleSeatEntry const *seatInfo = sVehicleSeatStore.LookupEntry(seatId))
        {
            m_Seats.insert(std::make_pair(i, VehicleSeat(seatInfo)));

            if (seatInfo->IsUsable())
                ++m_uiNumFreeSeats;
        }
    }
}

VehicleKit::~VehicleKit()
{
}

void VehicleKit::RemoveAllPassengers()
{
    for (SeatMap::iterator itr = m_Seats.begin(); itr != m_Seats.end(); ++itr)
    {
        if (Unit *passenger = itr->second.passenger)
        {
            passenger->ExitVehicle();

            // remove creatures of player mounts
            if (passenger->GetTypeId() == TYPEID_UNIT)
                passenger->AddObjectToRemoveList();
        }
    }
}

bool VehicleKit::HasEmptySeat(int8 seatId) const
{
    if (seatId < 0)
        return (GetNextEmptySeat(0,true) != -1);

    SeatMap::const_iterator seat = m_Seats.find(seatId);
    // need add check on accessories-only seats...

    if (seat == m_Seats.end())
        return false;

    return !seat->second.passenger;
}

Unit *VehicleKit::GetPassenger(int8 seatId) const
{
    SeatMap::const_iterator seat = m_Seats.find(seatId);

    if (seat == m_Seats.end())
        return NULL;

    return seat->second.passenger;
}

int8 VehicleKit::GetNextEmptySeat(int8 seatId, bool next) const
{

    if (m_Seats.empty() || seatId >= MAX_VEHICLE_SEAT)
        return -1;

    if (next)
    {
        for (SeatMap::const_iterator seat = m_Seats.begin(); seat != m_Seats.end(); ++seat)
            if ((seatId < 0 || seat->first >= seatId) && !seat->second.passenger && seat->second.seatInfo->IsUsable())
                return seat->first;
    }
    else
    {
        for (SeatMap::const_reverse_iterator seat = m_Seats.rbegin(); seat != m_Seats.rend(); ++seat)
            if ((seatId < 0 || seat->first <= seatId) && !seat->second.passenger && seat->second.seatInfo->IsUsable())
                return seat->first;
    }

    return -1;
}

bool VehicleKit::AddPassenger(Unit *passenger, int8 seatId)
{
    SeatMap::iterator seat;

    if (seatId < 0) // no specific seat requirement
    {
        for (seat = m_Seats.begin(); seat != m_Seats.end(); ++seat)
            if (!seat->second.passenger && (seat->second.seatInfo->IsUsable() || (seat->second.seatInfo->m_flags & SEAT_FLAG_UNCONTROLLED)))
                break;

        if (seat == m_Seats.end()) // no available seat
            return false;
    }
    else
    {
        seat = m_Seats.find(seatId);

        if (seat == m_Seats.end())
            return false;

        if (seat->second.passenger)
            return false;
    }

    seat->second.passenger = passenger;
    passenger->addUnitState(UNIT_STAT_ON_VEHICLE);

    m_pBase->SetPhaseMask(passenger->GetPhaseMask(), true);

    VehicleSeatEntry const *seatInfo = seat->second.seatInfo;

    passenger->m_movementInfo.AddMovementFlag(MOVEFLAG_ONTRANSPORT);
    passenger->m_movementInfo.SetTransportData(m_pBase->GetObjectGuid(),
        seatInfo->m_attachmentOffsetX, seatInfo->m_attachmentOffsetY, seatInfo->m_attachmentOffsetZ,
        seatInfo->m_passengerYaw, WorldTimer::getMSTime(), seat->first, seatInfo);

    if (passenger->GetTypeId() == TYPEID_PLAYER)
    {
        ((Player*)passenger)->GetCamera().SetView(m_pBase);

        WorldPacket data(SMSG_FORCE_MOVE_ROOT, 8+4);
        data << passenger->GetPackGUID();
        data << uint32((passenger->m_movementInfo.GetVehicleSeatFlags() & SEAT_FLAG_CAN_CAST) ? 2 : 0);
        passenger->SendMessageToSet(&data, true);
    }

    switch (m_pBase->GetEntry())
    {
        case 28817:
            passenger->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            break;
    }

    if (seat->second.seatInfo->m_flags & SEAT_FLAG_UNATTACKABLE || seat->second.seatInfo->m_flags & SEAT_FLAG_CAN_CONTROL)
    {
        switch (m_pBase->GetEntry())
        {
            case 33651:                                     // VX 001
            case 33432:                                     // Leviathan MX
            case 33118:                                     // Ignis (Ulduar)
            case 32934:                                     // Kologarn Right Arm (Ulduar)
            case 30234:                                     // Nexus Lord's Hover Disk (Eye of Eternity, Malygos Encounter)
            case 30248:                                     // Scion's of Eternity Hover Disk (Eye of Eternity, Malygos Encounter)
                break;
            default:
                passenger->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                break;
        }
        passenger->RemoveSpellsCausingAura(SPELL_AURA_MOD_SHAPESHIFT);
    }

    if (seatInfo->m_flags & SEAT_FLAG_CAN_CONTROL)
    {
        if (!(m_pBase->GetVehicleInfo()->GetEntry()->m_flags & (VEHICLE_FLAG_ACCESSORY)))
        {
            m_pBase->StopMoving();
            m_pBase->GetMotionMaster()->Clear();
            m_pBase->CombatStop(true);
        }
        m_pBase->DeleteThreatList();
        m_pBase->getHostileRefManager().deleteReferences();
        m_pBase->SetCharmerGuid(passenger->GetObjectGuid());
        m_pBase->addUnitState(UNIT_STAT_CONTROLLED);

        passenger->SetCharm(m_pBase);

        if (m_pBase->HasAuraType(SPELL_AURA_FLY) || m_pBase->HasAuraType(SPELL_AURA_MOD_FLIGHT_SPEED))
        {
            WorldPacket data;
            data.Initialize(SMSG_MOVE_SET_CAN_FLY, 12);
            data << m_pBase->GetPackGUID();
            data << (uint32)(0);
            m_pBase->SendMessageToSet(&data,false);
        }

        if (passenger->GetTypeId() == TYPEID_PLAYER)
        {
            m_pBase->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED);

            if (CharmInfo* charmInfo = m_pBase->InitCharmInfo(m_pBase))
            {
                charmInfo->InitVehicleCreateSpells(seat->first);
                charmInfo->SetReactState(REACT_PASSIVE);
            }

            Player* player = (Player*)passenger;
            player->SetMover(m_pBase);
            player->SetClientControl(m_pBase, 1);
            player->VehicleSpellInitialize();
        }

        if(!(((Creature*)m_pBase)->GetCreatureInfo()->flags_extra & CREATURE_FLAG_EXTRA_KEEP_AI))
            ((Creature*)m_pBase)->AIM_Initialize();

        if (m_pBase->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE))
        {
            WorldPacket data2(SMSG_FORCE_MOVE_ROOT, 8+4);
            data2 << m_pBase->GetPackGUID();
            data2 << (uint32)(2);
            m_pBase->SendMessageToSet(&data2,false);
        }
        else if (passenger->m_movementInfo.GetMovementFlags() & MOVEFLAG_WALK_MODE)
            ((Creature*)m_pBase)->SetWalk(true);
        else
            ((Creature*)m_pBase)->SetWalk(false);

    }

    passenger->SendMonsterMoveTransport(m_pBase, SPLINETYPE_FACINGANGLE, SPLINEFLAG_UNKNOWN5, 0, 0.0f);

    RelocatePassengers(m_pBase->GetPositionX(), m_pBase->GetPositionY(), m_pBase->GetPositionZ()+0.5f, m_pBase->GetOrientation());

    UpdateFreeSeatCount();

    if (m_pBase->GetTypeId() == TYPEID_UNIT)
    {
        if (((Creature*)m_pBase)->AI())
            ((Creature*)m_pBase)->AI()->PassengerBoarded(passenger, seat->first, true);
    }

    return true;
}

void VehicleKit::RemovePassenger(Unit *passenger)
{
    SeatMap::iterator seat;

    for (seat = m_Seats.begin(); seat != m_Seats.end(); ++seat)
        if (seat->second.passenger == passenger)
            break;

    if (seat == m_Seats.end())
        return;

    seat->second.passenger = NULL;
    passenger->clearUnitState(UNIT_STAT_ON_VEHICLE);

    float px, py, pz, po;
    m_pBase->GetClosePoint(px, py, pz, m_pBase->GetObjectBoundingRadius(), 2.0f, M_PI_F);
    po = m_pBase->GetOrientation();

    passenger->m_movementInfo.ClearTransportData();
    passenger->m_movementInfo.RemoveMovementFlag(MOVEFLAG_ONTRANSPORT);

    if (seat->second.seatInfo->m_flags & SEAT_FLAG_UNATTACKABLE || seat->second.seatInfo->m_flags & SEAT_FLAG_CAN_CONTROL)
    {
        passenger->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
    }

    if (seat->second.seatInfo->m_flags & SEAT_FLAG_CAN_CONTROL)
    {

        passenger->SetCharm(NULL);
        passenger->RemoveSpellsCausingAura(SPELL_AURA_CONTROL_VEHICLE);

        m_pBase->SetCharmerGuid(ObjectGuid());
        m_pBase->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED);
        m_pBase->clearUnitState(UNIT_STAT_CONTROLLED);

        if (passenger->GetTypeId() == TYPEID_PLAYER)
        {
            Player* player = (Player*)passenger;
            player->SetMover(NULL);
            player->SetClientControl(m_pBase, 0);
            player->RemovePetActionBar();
        }

        if(!(((Creature*)m_pBase)->GetCreatureInfo()->flags_extra & CREATURE_FLAG_EXTRA_KEEP_AI))
            ((Creature*)m_pBase)->AIM_Initialize();
    }

    switch (m_pBase->GetEntry())
    {
        case 28817:
            passenger->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
            break;
    }

    if (passenger->GetTypeId() == TYPEID_PLAYER)
    {
        ((Player*)passenger)->GetCamera().ResetView();

        WorldPacket data(SMSG_FORCE_MOVE_UNROOT, 8+4);
        data << passenger->GetPackGUID();
        data << uint32(2);
        passenger->SendMessageToSet(&data, true);
    }
    passenger->UpdateAllowedPositionZ(px, py, pz);
    passenger->SetPosition(px, py, pz + 0.5f, po);
    UpdateFreeSeatCount();

    if (m_pBase->GetTypeId() == TYPEID_UNIT)
    {
        if (((Creature*)m_pBase)->AI())
            ((Creature*)m_pBase)->AI()->PassengerBoarded(passenger, seat->first, false);
    }

    // only for flyable vehicles
    if (m_pBase->m_movementInfo.HasMovementFlag(MOVEFLAG_FLYING))
        m_pBase->CastSpell(passenger, 45472, true);    // Parachute
}

void VehicleKit::Reset()
{
    RemoveAllPassengers();
    InstallAllAccessories(m_pBase->GetEntry());
    UpdateFreeSeatCount();
}

void VehicleKit::InstallAllAccessories(uint32 entry)
{
    VehicleAccessoryList const* mVehicleList = sObjectMgr.GetVehicleAccessoryList(entry);
    if (!mVehicleList)
        return;

    for (VehicleAccessoryList::const_iterator itr = mVehicleList->begin(); itr != mVehicleList->end(); ++itr)
        InstallAccessory(itr->uiAccessory, itr->uiSeat, itr->bMinion);
}

void VehicleKit::InstallAccessory( uint32 entry, int8 seatId, bool minion)
{
    if (Unit *passenger = GetPassenger(seatId))
    {
        // already installed
        if (passenger->GetEntry() == entry)
            return;

        passenger->ExitVehicle();
    }

    if (Creature* accessory = m_pBase->SummonCreature(entry, m_pBase->GetPositionX(), m_pBase->GetPositionY(), m_pBase->GetPositionZ(), 0.0f, TEMPSUMMON_CORPSE_TIMED_DESPAWN, 30000))
    {
        accessory->SetCreatorGuid(ObjectGuid());
        accessory->EnterVehicle(this, seatId);
        accessory->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
        accessory->SendHeartBeat();
    }
}

void VehicleKit::UpdateFreeSeatCount()
{
    m_uiNumFreeSeats = 0;

    for (SeatMap::const_iterator itr = m_Seats.begin(); itr != m_Seats.end(); ++itr)
    {
        if (!itr->second.passenger && itr->second.seatInfo->IsUsable())
            ++m_uiNumFreeSeats;
    }

    uint32 flag = m_pBase->GetTypeId() == TYPEID_PLAYER ? UNIT_NPC_FLAG_PLAYER_VEHICLE : UNIT_NPC_FLAG_SPELLCLICK;

    if (m_uiNumFreeSeats)
        m_pBase->SetFlag(UNIT_NPC_FLAGS, flag);
    else
        m_pBase->RemoveFlag(UNIT_NPC_FLAGS, flag);
}

void VehicleKit::RelocatePassengers(float x, float y, float z, float ang)
{
    for (SeatMap::const_iterator itr = m_Seats.begin(); itr != m_Seats.end(); ++itr)
    {
        if (Unit *passenger = itr->second.passenger)
        {
            float px = x + passenger->m_movementInfo.GetTransportPos()->x;
            float py = y + passenger->m_movementInfo.GetTransportPos()->y;
            float pz = z + passenger->m_movementInfo.GetTransportPos()->z;
            float po = ang + passenger->m_movementInfo.GetTransportPos()->o;

            passenger->UpdateAllowedPositionZ(px, py, pz);
            passenger->SetPosition(px, py, pz, po);
        }
    }
}

VehicleSeatEntry const* VehicleKit::GetSeatInfo(Unit* passenger)
{
    for (SeatMap::iterator itr = m_Seats.begin(); itr != m_Seats.end(); ++itr)
    {
        if (Unit *_passenger = itr->second.passenger)
            if (_passenger = passenger)
                return itr->second.seatInfo;
    }
    return NULL;
}
