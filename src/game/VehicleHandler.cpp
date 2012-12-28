/*
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

#include "Common.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Opcodes.h"
#include "Log.h"
#include "Player.h"
#include "Vehicle.h"
#include "ObjectMgr.h"
#include "SpellAuras.h"
#include "SpellMgr.h"
#include "TemporarySummon.h"

void WorldSession::HandleDismissControlledVehicle(WorldPacket &recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_DISMISS_CONTROLLED_VEHICLE");
    //recv_data.hexlike();

    ObjectGuid guid;
    MovementInfo mi;

    recv_data >> guid.ReadAsPacked();
    recv_data >> mi;

    if(!GetPlayer()->GetVehicle())
        return;

    Creature* vehicle = GetPlayer()->GetMap()->GetAnyTypeCreature(guid);

    if (!vehicle || !vehicle->IsVehicle())
        return;

    GetPlayer()->m_movementInfo = mi;

    GetPlayer()->ExitVehicle();

}

void WorldSession::HandleRequestVehicleExit(WorldPacket &recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_REQUEST_VEHICLE_EXIT");

    if(!GetPlayer()->GetVehicle())
        return;

    Unit* vehicle = GetPlayer()->GetVehicle()->GetBase();
    if (!vehicle)
        return;

    if (!vehicle->RemoveSpellsCausingAuraByCaster(SPELL_AURA_CONTROL_VEHICLE, GetPlayer()->GetObjectGuid()))
        GetPlayer()->ExitVehicle();
}

void WorldSession::HandleRequestVehiclePrevSeat(WorldPacket &recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_REQUEST_VEHICLE_PREV_SEAT");

    GetPlayer()->ChangeSeat(-1, false);
}

void WorldSession::HandleRequestVehicleNextSeat(WorldPacket &recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_REQUEST_VEHICLE_NEXT_SEAT");

    GetPlayer()->ChangeSeat(-1, true);
}

void WorldSession::HandleRequestVehicleSwitchSeat(WorldPacket &recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_REQUEST_VEHICLE_SWITCH_SEAT");
    //recv_data.hexlike();

    ObjectGuid guid;
    recv_data >> guid.ReadAsPacked();

    int8 seatId;
    recv_data >> seatId;

    VehicleKitPtr pVehicle = GetPlayer()->GetVehicle();

    if (!pVehicle)
        return;

    if (pVehicle->GetEntry()->m_flags & VEHICLE_FLAG_DISABLE_SWITCH)
        return;

    if (pVehicle->GetBase()->GetObjectGuid() == guid)
        GetPlayer()->ChangeSeat(seatId);

    else if (Unit *Vehicle2 = GetPlayer()->GetMap()->GetUnit(guid))
    {
        if (VehicleKitPtr pVehicle2 = Vehicle2->GetVehicleKit())
            if (pVehicle2->HasEmptySeat(seatId))
            {
                GetPlayer()->ExitVehicle();
                GetPlayer()->EnterVehicle(pVehicle2, seatId);
            }
    }
}

void WorldSession::HandleEnterPlayerVehicle(WorldPacket &recv_data)
{
    DEBUG_LOG("WORLD: Received CMSG_RIDE_VEHICLE_INTERACT");
    //recv_data.hexlike();

    ObjectGuid guid;
    recv_data >> guid;

    Player* player = sObjectMgr.GetPlayer(guid);

    if (!player)
        return;

    if (!GetPlayer()->IsInSameRaidWith(player))
        return;

    if (!GetPlayer()->IsWithinDistInMap(player, INTERACTION_DISTANCE))
        return;

    if (player->GetTransport())
        return;

    GetPlayer()->CastSpell(player, SPELL_RIDE_VEHICLE_HARDCODED, true);

}

void WorldSession::HandleEjectPassenger(WorldPacket &recv_data)
{
    //recv_data.hexlike();

    ObjectGuid guid;
    recv_data >> guid;

    Unit* passenger = ObjectAccessor::GetUnit(*GetPlayer(), guid);

    if (!passenger)
        return;

    VehicleKitPtr pVehicle = passenger->GetVehicle();

    if (!pVehicle ||
       ((pVehicle != GetPlayer()->GetVehicleKit()) &&
        !(pVehicle->GetEntry()->m_flags & (VEHICLE_FLAG_ACCESSORY))))
    {
        sLog.outError("WorldSession::HandleEjectPassenger %s try eject %s, but not may do this!",GetPlayer()->GetObjectGuid().GetString().c_str(),guid.GetString().c_str());
        return;
    }
    DEBUG_LOG("WorldSession::HandleEjectPassenger CMSG_CONTROLLER_EJECT_PASSENGER %s eject passenger %s",GetPlayer()->GetObjectGuid().GetString().c_str(),guid.GetString().c_str());

    GetPlayer()->RemoveSpellsCausingAura(SPELL_AURA_CONTROL_VEHICLE, guid);

    // eject and remove creatures of player mounts
    if (passenger->GetTypeId() == TYPEID_UNIT)
    {
        if (((Creature*)passenger)->IsTemporarySummon())
        {
            // Fixme: delay must be calculated not from this, but from creature template parameters (off traders ...?).
            uint32 delay = passenger->IsVehicle() ? 1000: 60000;
            ((TemporarySummon*)passenger)->UnSummon(delay);
        }
        else
            passenger->AddObjectToRemoveList();
    }
}

void WorldSession::HandleChangeSeatsOnControlledVehicle(WorldPacket &recv_data)
{
    //sLog.outDebug("WORLD: Recvd CMSG_CHANGE_SEATS_ON_CONTROLLED_VEHICLE");
    //recv_data.hexlike();

    ObjectGuid guid, guid2;
    recv_data >> guid.ReadAsPacked();

    MovementInfo mi;
    recv_data >> mi;

    recv_data >> guid2.ReadAsPacked(); //guid of vehicle or of vehicle in target seat

    int8 seatId;
    recv_data >> seatId;

    VehicleKitPtr pVehicle = GetPlayer()->GetVehicle();

    if (!pVehicle)
        return;

    if (pVehicle->GetEntry()->m_flags & VEHICLE_FLAG_DISABLE_SWITCH)
        return;

    pVehicle->GetBase()->m_movementInfo = mi;

    if(!guid2 || guid.GetRawValue() == guid2.GetRawValue())
    {
        DEBUG_LOG("WorldSession::HandleChangeSeatsOnControlledVehicle player %s change seat on %s (to %u).",GetPlayer()->GetObjectGuid().GetString().c_str(),guid.GetString().c_str(), seatId);
        GetPlayer()->ChangeSeat(seatId);
    }
    // seat to another vehicle or accessory
    if (Unit* vehicle = GetPlayer()->GetMap()->GetUnit(guid2))
    {
        if (vehicle->IsInWorld() && vehicle->IsVehicle())
        {
            DEBUG_LOG("WorldSession::HandleChangeSeatsOnControlledVehicle player %s try move from %s, to %s (seat %u).",GetPlayer()->GetObjectGuid().GetString().c_str(),guid.GetString().c_str(),guid2.GetString().c_str(), seatId);
            GetPlayer()->ExitVehicle(true);
            GetPlayer()->EnterVehicle(vehicle, seatId);
        }
    }
}
