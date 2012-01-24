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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */


#include "WorldPvP.h"
#include "WorldPvPNA.h"


WorldPvPNA::WorldPvPNA() : WorldPvP(),
    m_uiControllerMapState(WORLD_STATE_NA_HALAA_NEUTRAL),
    m_uiControllerWorldState(0),
    m_uiZoneController(NEUTRAL),
    m_uiGuardsLeft(0)
{
    m_uiTypeId = WORLD_PVP_TYPE_NA;
}

bool WorldPvPNA::InitWorldPvPArea()
{
    RegisterZone(ZONE_ID_NAGRAND);

    return true;
}

void WorldPvPNA::FillInitialWorldStates(WorldPacket& data, uint32& count)
{
    if (m_uiZoneController != NEUTRAL)
    {
        FillInitialWorldState(data, count, m_uiControllerWorldState, 1);
        FillInitialWorldState(data, count, WORLD_STATE_NA_GUARDS_LEFT, m_uiGuardsLeft);
        FillInitialWorldState(data, count, WORLD_STATE_NA_GUARDS_MAX, MAX_NA_GUARDS);

        // map states
        for (uint8 i = 0; i < MAX_NA_ROOSTS; ++i)
            FillInitialWorldState(data, count, m_uiRoostWorldState[i], 1);
    }

    FillInitialWorldState(data, count, m_uiControllerMapState, 1);
}

void WorldPvPNA::SendRemoveWorldStates(Player* pPlayer)
{
    pPlayer->SendUpdateWorldState(m_uiControllerWorldState, 0);
    pPlayer->SendUpdateWorldState(m_uiControllerMapState, 0);

    for (uint8 i = 0; i < MAX_NA_ROOSTS; ++i)
        pPlayer->SendUpdateWorldState(m_uiRoostWorldState[i], 0);
}

void WorldPvPNA::HandlePlayerEnterZone(Player* pPlayer)
{
    WorldPvP::HandlePlayerEnterZone(pPlayer);

    // remove the buff from the player first because there are some issues at relog
    pPlayer->RemoveAurasDueToSpell(SPELL_STRENGTH_HALAANI);

    // Handle the buffs
    if (pPlayer->GetTeam() == m_uiZoneController && m_uiZoneController != NEUTRAL)
        pPlayer->CastSpell(pPlayer, SPELL_STRENGTH_HALAANI, true);
}

void WorldPvPNA::HandlePlayerLeaveZone(Player* pPlayer)
{
    // remove the buff from the player
    pPlayer->RemoveAurasDueToSpell(SPELL_STRENGTH_HALAANI);

    WorldPvP::HandlePlayerLeaveZone(pPlayer);
}

void WorldPvPNA::HandleObjectiveComplete(PlayerSet m_sPlayersSet, uint32 uiEventId)
{
    if (uiEventId == EVENT_HALAA_BANNER_WIN_ALLIANCE || uiEventId == EVENT_HALAA_BANNER_WIN_HORDE)
    {
        for (PlayerSet::iterator itr = m_sPlayersSet.begin(); itr != m_sPlayersSet.end(); ++itr)
        {
            if (!(*itr))
                continue;

            (*itr)->KilledMonsterCredit(NPC_HALAA_COMBATANT);
        }
    }
}

// Cast player spell on oponent kill
void WorldPvPNA::HandlePlayerKillInsideArea(Player* pPlayer, Unit* pVictim)
{
    if (GameObject* pBanner = pPlayer->GetMap()->GetGameObject(m_HalaaBanerGuid))
    {
        GameObjectInfo const* info = pBanner->GetGOInfo();
        if (!info)
            return;

        if (!pPlayer->IsWithinDistInMap(pBanner, info->capturePoint.radius))
            return;

        // check banner faction
        if (m_uiZoneController == ALLIANCE && pPlayer->GetTeam() == ALLIANCE)
            pPlayer->CastSpell(pPlayer, SPELL_NAGRAND_TOKEN_ALLIANCE, true);
        else if (m_uiZoneController == HORDE && pPlayer->GetTeam() == HORDE)
            pPlayer->CastSpell(pPlayer, SPELL_NAGRAND_TOKEN_HORDE, true);
    }
}

void WorldPvPNA::OnCreatureCreate(Creature* pCreature)
{
    switch (pCreature->GetEntry())
    {
        case NPC_ALLIANCE_HANAANI_GUARD:
        case NPC_RESEARCHER_KARTOS:
        case NPC_QUARTERMASTER_DAVIAN:
        case NPC_MERCHANT_ALDRAAN:
        case NPC_VENDOR_CENDRII:
        case NPC_AMMUNITIONER_BANRO:
            lAllianceSoldiers.push_back(pCreature->GetObjectGuid());
            if (m_uiZoneController == ALLIANCE)
                return;
            break;
        case NPC_HORDE_HALAANI_GUARD:
        case NPC_RESEARCHER_AMERELDINE:
        case NPC_QUARTERMASTER_NORELIQE:
        case NPC_MERCHANT_COREIEL:
        case NPC_VENDOR_EMBELAR:
        case NPC_AMMUNITIONER_TASALDAN:
            lHordeSoldiers.push_back(pCreature->GetObjectGuid());
            if (m_uiZoneController == HORDE)
                return;
            break;

        default:
            return;
    }

    // Despawn creatures on create - will be spawned later in script
    pCreature->SetRespawnDelay(7 * DAY);
    pCreature->ForcedDespawn();
}

void WorldPvPNA::OnCreatureDeath(Creature* pCreature)
{
    if (pCreature->GetEntry() != NPC_HORDE_HALAANI_GUARD && pCreature->GetEntry() != NPC_ALLIANCE_HANAANI_GUARD)
        return;

    --m_uiGuardsLeft;
    SendUpdateWorldState(WORLD_STATE_NA_GUARDS_LEFT,  m_uiGuardsLeft);

    if (m_uiGuardsLeft == 0)
    {
        // make capturable
        LockCapturePoint(GO_HALAA_BANNER, false);
        SendUpdateWorldState(m_uiControllerMapState, 0);
        m_uiControllerMapState = m_uiZoneController == ALLIANCE ? WORLD_STATE_NA_HALAA_NEU_A : WORLD_STATE_NA_HALAA_NEU_H;
        SendUpdateWorldState(m_uiControllerMapState, 1);
    }
}

void WorldPvPNA::OnCreatureRespawn(Creature* pCreature)
{
    if (pCreature->GetEntry() != NPC_HORDE_HALAANI_GUARD && pCreature->GetEntry() != NPC_ALLIANCE_HANAANI_GUARD)
        return;

    ++m_uiGuardsLeft;
    SendUpdateWorldState(WORLD_STATE_NA_GUARDS_LEFT,  m_uiGuardsLeft);

    if (m_uiGuardsLeft > 0)
        LockCapturePoint(GO_HALAA_BANNER, true);

    if (m_uiGuardsLeft == MAX_NA_GUARDS)
    {
        SendUpdateWorldState(m_uiControllerMapState, 0);
        m_uiControllerMapState = m_uiZoneController == ALLIANCE ? WORLD_STATE_NA_HALAA_ALLIANCE : WORLD_STATE_NA_HALAA_HORDE;
        SendUpdateWorldState(m_uiControllerMapState, 1);
    }
}

void WorldPvPNA::OnGameObjectCreate(GameObject* pGo)
{
    switch (pGo->GetEntry())
    {
        case GO_HALAA_BANNER:
            m_HalaaBanerGuid = pGo->GetObjectGuid();
            pGo->SetGoArtKit(GO_ARTKIT_BANNER_NEUTRAL);
            break;

        case GO_WYVERN_ROOST_ALY_SOUTH:
            m_AllianceRoost[0] = pGo->GetObjectGuid();
            break;
        case GO_WYVERN_ROOST_ALY_NORTH:
            m_AllianceRoost[1] = pGo->GetObjectGuid();
            break;
        case GO_WYVERN_ROOST_ALY_EAST:
            m_AllianceRoost[2] = pGo->GetObjectGuid();
            break;
        case GO_WYVERN_ROOST_ALY_WEST:
            m_AllianceRoost[3] = pGo->GetObjectGuid();
            break;

        case GO_BOMB_WAGON_HORDE_SOUTH:
            m_HordeWagons[0] = pGo->GetObjectGuid();
            break;
        case GO_BOMB_WAGON_HORDE_NORTH:
            m_HordeWagons[1] = pGo->GetObjectGuid();
            break;
        case GO_BOMB_WAGON_HORDE_EAST:
            m_HordeWagons[2] = pGo->GetObjectGuid();
            break;
        case GO_BOMB_WAGON_HORDE_WEST:
            m_HordeWagons[3] = pGo->GetObjectGuid();
            break;

        case GO_DESTROYED_ROOST_ALY_SOUTH:
            m_AllianceBrokenRoost[0] = pGo->GetObjectGuid();
            break;
        case GO_DESTROYED_ROOST_ALY_NORTH:
            m_AllianceBrokenRoost[1] = pGo->GetObjectGuid();
            break;
        case GO_DESTROYED_ROOST_ALY_EAST:
            m_AllianceBrokenRoost[2] = pGo->GetObjectGuid();
            break;
        case GO_DESTROYED_ROOST_ALY_WEST:
            m_AllianceBrokenRoost[3] = pGo->GetObjectGuid();
            break;

        case GO_WYVERN_ROOST_HORDE_SOUTH:
            m_HordeRoost[0] = pGo->GetObjectGuid();
            break;
        case GO_WYVERN_ROOST_HORDE_NORTH:
            m_HordeRoost[1] = pGo->GetObjectGuid();
            break;
        case GO_WYVERN_ROOST_HORDE_EAST:
            m_HordeRoost[2] = pGo->GetObjectGuid();
            break;
        case GO_WYVERN_ROOST_HORDE_WEST:
            m_HordeRoost[3] = pGo->GetObjectGuid();
            break;

        case GO_BOMB_WAGON_ALY_SOUTH:
            m_AllianceWagons[0] = pGo->GetObjectGuid();
            break;
        case GO_BOMB_WAGON_ALY_NORTH:
            m_AllianceWagons[1] = pGo->GetObjectGuid();
            break;
        case GO_BOMB_WAGON_ALY_EAST:
            m_AllianceWagons[2] = pGo->GetObjectGuid();
            break;
        case GO_BOMB_WAGON_ALY_WEST:
            m_AllianceWagons[3] = pGo->GetObjectGuid();
            break;

        case GO_DESTROYED_ROOST_HORDE_SOUTH:
            m_HordeBrokenRoost[0] = pGo->GetObjectGuid();
            break;
        case GO_DESTROYED_ROOST_HORDE_NORTH:
            m_HordeBrokenRoost[1] = pGo->GetObjectGuid();
            break;
        case GO_DESTROYED_ROOST_HORDE_EAST:
            m_HordeBrokenRoost[2] = pGo->GetObjectGuid();
            break;
        case GO_DESTROYED_ROOST_HORDE_WEST:
            m_HordeBrokenRoost[3] = pGo->GetObjectGuid();
            break;
    }
}

void WorldPvPNA::UpdateWorldState(uint8 uiValue)
{
    SendUpdateWorldState(m_uiControllerWorldState, uiValue);
    SendUpdateWorldState(m_uiControllerMapState, uiValue);

    // Update guards only for positive states
    if (uiValue)
    {
        SendUpdateWorldState(WORLD_STATE_NA_GUARDS_MAX, MAX_NA_GUARDS);
        SendUpdateWorldState(WORLD_STATE_NA_GUARDS_LEFT, m_uiGuardsLeft);
    }

    UpdateWyvernsWorldState(uiValue);
}

void WorldPvPNA::UpdateWyvernsWorldState(uint8 uiValue)
{
    for (uint8 i = 0; i < MAX_NA_ROOSTS; ++i)
        SendUpdateWorldState(m_uiRoostWorldState[i], uiValue);
}

// process the capture events
void WorldPvPNA::ProcessEvent(GameObject* pGo, uint32 uiEventId, uint32 uiFaction)
{
    // If we are not using the Halaa banner return
    if (pGo->GetEntry() != GO_HALAA_BANNER)
        return;

    switch (uiEventId)
    {
        case EVENT_HALAA_BANNER_WIN_ALLIANCE:
        case EVENT_HALAA_BANNER_WIN_HORDE:
            ProcessCaptureEvent(WIN, uiFaction);
            break;
    }
}

void WorldPvPNA::ProcessCaptureEvent(uint32 uiCaptureType, uint32 uiTeam)
{
    if (uiCaptureType == WIN)
    {
        if (m_uiZoneController != NEUTRAL)
        {
            DoSetGraveyard((Team)uiTeam, true);
            DoProcessTeamBuff((Team)m_uiZoneController, SPELL_STRENGTH_HALAANI, true);
            sWorld.SendZoneText(ZONE_ID_NAGRAND, sObjectMgr.GetMangosStringForDBCLocale(uiTeam == ALLIANCE ? LANG_OPVP_NA_LOOSE_H: LANG_OPVP_NA_LOOSE_A));
        }

        UpdateWorldState(0);
        m_uiZoneController = uiTeam;
        DoRespawnSoldiers(uiTeam);
        DoSetGraveyard((Team)uiTeam);
        m_uiControllerWorldState = uiTeam == ALLIANCE ? WORLD_STATE_NA_GUARDS_ALLIANCE : WORLD_STATE_NA_GUARDS_HORDE;
        m_uiControllerMapState = uiTeam == ALLIANCE ? WORLD_STATE_NA_HALAA_ALLIANCE : WORLD_STATE_NA_HALAA_HORDE;

        SetBannerArtKit(uiTeam == ALLIANCE ? GO_ARTKIT_BANNER_ALLIANCE : GO_ARTKIT_BANNER_HORDE);
        DoHandleFactionObjects(uiTeam);
        UpdateWorldState(1);

        DoProcessTeamBuff((Team)m_uiZoneController, SPELL_STRENGTH_HALAANI);
        sWorld.SendZoneText(ZONE_ID_NAGRAND, sObjectMgr.GetMangosStringForDBCLocale(uiTeam == ALLIANCE ? LANG_OPVP_NA_CAPTURE_A: LANG_OPVP_NA_CAPTURE_H));
    }
}

void WorldPvPNA::DoSetGraveyard(uint32 uiFaction, bool bRemove)
{
    if (bRemove)
        sObjectMgr.RemoveGraveYardLink(GRAVEYARD_ID_HALAA, GRAVEYARD_ZONE_ID_HALAA, (Team)uiFaction, false);
    else
        sObjectMgr.AddGraveYardLink(GRAVEYARD_ID_HALAA, GRAVEYARD_ZONE_ID_HALAA, (Team)uiFaction, false);
}

void WorldPvPNA::DoHandleFactionObjects(uint32 uiFaction)
{
    if (uiFaction == ALLIANCE)
    {
        for (uint8 i = 0; i < MAX_NA_ROOSTS; ++i)
        {
            DoRespawnObjects(m_HordeWagons[i], false);
            DoRespawnObjects(m_AllianceBrokenRoost[i], false);
            DoRespawnObjects(m_AllianceRoost[i], false);

            DoRespawnObjects(m_AllianceWagons[i], true);
            DoRespawnObjects(m_HordeBrokenRoost[i], true);

            m_uiRoostWorldState[i] = aHordeNeutralStates[i];
        }
    }
    else if (uiFaction == HORDE)
    {
        for (uint8 i = 0; i < MAX_NA_ROOSTS; ++i)
        {
            DoRespawnObjects(m_AllianceWagons[i], false);
            DoRespawnObjects(m_HordeBrokenRoost[i], false);
            DoRespawnObjects(m_HordeRoost[i], false);

            DoRespawnObjects(m_HordeWagons[i], true);
            DoRespawnObjects(m_AllianceBrokenRoost[i], true);

            m_uiRoostWorldState[i] = aAllianceNeutralStates[i];
        }
    }
}

void WorldPvPNA::DoRespawnSoldiers(uint32 uiFaction)
{
    // neet to use a player as anchor for the map
    Player* pPlayer = GetPlayerInZone();
    if (!pPlayer)
        return;

    if (uiFaction == ALLIANCE)
    {
        // despawn all horde vendors
        for (std::list<ObjectGuid>::const_iterator itr = lHordeSoldiers.begin(); itr != lHordeSoldiers.end(); ++itr)
        {
            if (Creature* pSoldier = pPlayer->GetMap()->GetCreature(*itr))
            {
                // reset respawn time
                pSoldier->SetRespawnDelay(7 * DAY);
                pSoldier->ForcedDespawn();
            }
        }

        // spawn all alliance soldiers and vendors
        for (std::list<ObjectGuid>::const_iterator itr = lAllianceSoldiers.begin(); itr != lAllianceSoldiers.end(); ++itr)
        {
            if (Creature* pSoldier = pPlayer->GetMap()->GetCreature(*itr))
            {
                // lower respawn time
                pSoldier->SetRespawnDelay(HOUR);
                pSoldier->Respawn();
            }
        }
    }
    else if (uiFaction == HORDE)
    {
        // despawn all alliance vendors
        for (std::list<ObjectGuid>::const_iterator itr = lAllianceSoldiers.begin(); itr != lAllianceSoldiers.end(); ++itr)
        {
            if (Creature* pSoldier = pPlayer->GetMap()->GetCreature(*itr))
            {
                // reset respawn time
                pSoldier->SetRespawnDelay(7 * DAY);
                pSoldier->ForcedDespawn();
            }
        }

        // spawn all horde soldiers and vendors
        for (std::list<ObjectGuid>::const_iterator itr = lHordeSoldiers.begin(); itr != lHordeSoldiers.end(); ++itr)
        {
            if (Creature* pSoldier = pPlayer->GetMap()->GetCreature(*itr))
            {
                // lower respawn time
                pSoldier->SetRespawnDelay(HOUR);
                pSoldier->Respawn();
            }
        }
    }
}

bool WorldPvPNA::HandleObjectUse(Player* pPlayer, GameObject* pGo)
{
    bool bReturnStatus = false;
    UpdateWyvernsWorldState(0);

    if (pPlayer->GetTeam() == ALLIANCE)
    {
        for (uint8 i = 0; i < MAX_NA_ROOSTS; ++i)
        {
            if (pGo->GetEntry() == aAllianceWagons[i])
            {
                m_uiRoostWorldState[i] = aHordeNeutralStates[i];
                DoRespawnObjects(m_HordeRoost[i], false);
                DoRespawnObjects(m_HordeBrokenRoost[i], true);
                bReturnStatus = true;
            }
            else if (pGo->GetEntry() == aAllianceBrokenRoosts[i])
            {
                m_uiRoostWorldState[i] = aAllianceRoostStates[i];
                DoRespawnObjects(m_AllianceBrokenRoost[i], false);
                DoRespawnObjects(m_AllianceRoost[i], true);
                bReturnStatus = true;
            }
            else if (pGo->GetEntry() == aAllianceRoosts[i])
            {
                // ###### This is hacked in Gameobject.cpp because of the missing custom spells support #####
                // if we can't add any bombs don't do anything
                if (!AddBombsToInventory(pPlayer))
                    return false;

                // makr player as pvp first
                pPlayer->UpdatePvP(true, true);
                pPlayer->SetFlag(PLAYER_FLAGS, PLAYER_FLAGS_IN_PVP);

                // Send taxi
                bReturnStatus = HandlePlayerTaxiDrive(pPlayer, i);
            }
        }
    }
    else if (pPlayer->GetTeam() == HORDE)
    {
        for (uint8 i = 0; i < MAX_NA_ROOSTS; ++i)
        {
            if (pGo->GetEntry() == aHordeWagons[i])
            {
                m_uiRoostWorldState[i] = aAllianceNeutralStates[i];
                DoRespawnObjects(m_AllianceRoost[i], false);
                DoRespawnObjects(m_AllianceBrokenRoost[i], true);
                bReturnStatus = true;
            }
            else if (pGo->GetEntry() == aHordeBrokenRoosts[i])
            {
                m_uiRoostWorldState[i] = aHordeRoostStates[i];
                DoRespawnObjects(m_HordeBrokenRoost[i], false);
                DoRespawnObjects(m_HordeRoost[i], true);
                bReturnStatus = true;
            }
            else if (pGo->GetEntry() == aHordeRoosts[i])
            {
                // ###### This is hacked in Gameobject.cpp because of the missing custom spells support #####
                // if we can't add any bombs don't do anything
                if (!AddBombsToInventory(pPlayer))
                    return false;

                // makr player as pvp first
                pPlayer->UpdatePvP(true, true);
                pPlayer->SetFlag(PLAYER_FLAGS, PLAYER_FLAGS_IN_PVP);

                // Send taxi
                bReturnStatus = HandlePlayerTaxiDrive(pPlayer, i);
            }
        }
    }

    UpdateWyvernsWorldState(1);

    return bReturnStatus;
}

// Handle Taxi for Halaa bombing run
bool WorldPvPNA::HandlePlayerTaxiDrive(Player* pPlayer, uint8 uiPos)
{
    std::vector<uint32> vTaxiNodes;
    vTaxiNodes.reserve(2);

    vTaxiNodes[0] = aFlightPathStartNodes[uiPos];
    vTaxiNodes[1] = aFlightPathEndNodes[uiPos];

    // Send taxi
    if (pPlayer->ActivateTaxiPathTo(vTaxiNodes))
        return true;

    return false;
}

// Add fire bombs to player inventory
bool WorldPvPNA::AddBombsToInventory(Player* pPlayer)
{
    uint32 uiSpaceForItems = 0;
    ItemPosCountVec m_Destination;
    uint32 uiBombCount = MAX_FIRE_BOMBS;

    // get the free slots from inventory
    uint8 msg = pPlayer->CanStoreNewItem(NULL_BAG, NULL_SLOT, m_Destination, ITEM_ID_FIRE_BOMB, uiBombCount, &uiSpaceForItems);
    if (msg != EQUIP_ERR_OK)
        uiBombCount -= uiSpaceForItems;

    if (uiBombCount == 0 || m_Destination.empty())
        return false;

    Item* item = pPlayer->StoreNewItem(m_Destination, ITEM_ID_FIRE_BOMB, true);

    if (uiBombCount > 0 && item)
        pPlayer->SendNewItem(item, uiBombCount, true, false);

    return true;
}

void WorldPvPNA::SetBannerArtKit(uint32 uiArtkit)
{
    // neet to use a player as anchor for the map
    Player* pPlayer = GetPlayerInZone();
    if (!pPlayer)
        return;

    if (GameObject* pBanner = pPlayer->GetMap()->GetGameObject(m_HalaaBanerGuid))
    {
        pBanner->SetGoArtKit(uiArtkit);
        pBanner->Refresh();
    }
}

void WorldPvPNA::DoRespawnObjects(ObjectGuid GameObjectGuid, bool bRespawn)
{
    // neet to use a player as anchor for the map
    Player* pPlayer = GetPlayerInZone();
    if (!pPlayer)
        return;

    if (GameObject* pBanner = pPlayer->GetMap()->GetGameObject(GameObjectGuid))
    {
        if (bRespawn)
        {
            pBanner->SetRespawnTime(7 * DAY);
            pBanner->Refresh();
        }
        else if (pBanner->isSpawned())
            pBanner->Delete();
    }
}
