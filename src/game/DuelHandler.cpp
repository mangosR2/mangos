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

#include "Common.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Log.h"
#include "Opcodes.h"
#include "UpdateData.h"
#include "Player.h"
#include "World.h"

void WorldSession::HandleDuelAcceptedOpcode(WorldPacket& recvPacket)
{
    ObjectGuid guid;
    recvPacket >> guid;

    if (!GetPlayer()->duel)                                 // ignore accept from duel-sender
        return;

    Player* pl       = GetPlayer();
    Player* plTarget = pl->duel->opponent;

    if (pl == pl->duel->initiator || !plTarget || pl == plTarget || pl->duel->startTime != 0 || plTarget->duel->startTime != 0)
        return;

    DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "WORLD: received CMSG_DUEL_ACCEPTED");
    DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "Player 1 is: %u (%s)", pl->GetGUIDLow(), pl->GetName());
    DEBUG_FILTER_LOG(LOG_FILTER_COMBAT, "Player 2 is: %u (%s)", plTarget->GetGUIDLow(), plTarget->GetName());

    time_t now = time(NULL);
    pl->duel->startTimer = now;
    plTarget->duel->startTimer = now;

    pl->SendDuelCountdown(3000);
    plTarget->SendDuelCountdown(3000);

    /**
    * Duel reset script
    *
    */

    uint32 areaId = pl->GetAreaId();

    if(sWorld.getConfig(CONFIG_BOOL_RESET_DUEL_AREA_ENABLED) && sWorld.IsAreaIdEnabledDuelReset(areaId)){
        //remove arena cds
        pl->RemoveArenaSpellCooldowns();
        plTarget->RemoveArenaSpellCooldowns();

        //remove negative arena auras
        pl->RemoveArenaAuras(true);
        plTarget->RemoveArenaAuras(true);

        //set max mana and hp
        pl->SetHealth(pl->GetMaxHealth());
        pl->SetPower(POWER_MANA, pl->GetMaxPower(POWER_MANA));
        plTarget->SetHealth(plTarget->GetMaxHealth());
        plTarget->SetPower(POWER_MANA,  plTarget->GetMaxPower(POWER_MANA));

        // set max hp, mana and remove buffs of players' pet if they have
        Pet* plPet = pl->GetPet();
        if(plPet != NULL)
        {
            plPet->SetHealth(plPet->GetMaxHealth());
            plPet->SetPower(plPet->getPowerType(), plPet->GetMaxPower(plPet->getPowerType()));
            plPet->RemoveArenaAuras(true);
        }
        Pet* plPetTarget = plTarget->GetPet();
        if(plPetTarget != NULL)
        {
            plPetTarget->SetHealth(plPetTarget->GetMaxHealth());
            plPetTarget->SetPower(plPetTarget->getPowerType(), plPetTarget->GetMaxPower(plPetTarget->getPowerType()));
            plPetTarget->RemoveArenaAuras(true);
        }
    }
}

void WorldSession::HandleDuelCancelledOpcode(WorldPacket& recvPacket)
{

    // player either discarded the duel using the "discard button"
    // or used "/forfeit" before countdown reached 0
    ObjectGuid guid;
    recvPacket >> guid;    // GO PLAYER_DUEL_ARBITER

    DEBUG_FILTER_LOG(LOG_FILTER_COMBAT,"WORLD: received CMSG_DUEL_CANCELLED player %s arbiter %s", GetPlayer()->GetObjectGuid().GetString().c_str(),guid.GetString().c_str());

    // no duel requested
    if (!GetPlayer()->duel)
        return;

    if (GetPlayer()->duel->opponent)
    {
        if (GetPlayer()->GetGuidValue(PLAYER_DUEL_ARBITER) != guid ||
            GetPlayer()->duel->opponent->GetGuidValue(PLAYER_DUEL_ARBITER) != guid)
        {
            sLog.outError("WorldSession::HandleDuelCancelledOpcode player %s try cancel duel with %s, but his different arbiters! Possible exploit use.",GetPlayer()->GetObjectGuid().GetString().c_str(),GetPlayer()->duel->opponent->GetObjectGuid().GetString().c_str());
            GetPlayer()->DuelComplete(DUEL_INTERUPTED);
            return;
        }
    }

    // player surrendered in a duel using /forfeit
    if (GetPlayer()->duel->startTime != 0)
    {
        GetPlayer()->CombatStopWithPets(true);
        if (GetPlayer()->duel->opponent)
            GetPlayer()->duel->opponent->CombatStopWithPets(true);

        GetPlayer()->CastSpell(GetPlayer(), 7267, true);    // beg
        GetPlayer()->DuelComplete(DUEL_WON);
        return;
    }

    GetPlayer()->DuelComplete(DUEL_INTERUPTED);
}
