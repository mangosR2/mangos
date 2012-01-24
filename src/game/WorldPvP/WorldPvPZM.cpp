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
#include "WorldPvPZM.h"
#include "../GameObject.h"


WorldPvPZM::WorldPvPZM() : WorldPvP(),
    m_uiGraveyardWorldState(WORLD_STATE_GRAVEYARD_NEUTRAL),
    m_uiAllianceScoutWorldState(WORLD_STATE_ALY_FLAG_NOT_READY),
    m_uiHordeScoutWorldState(WORLD_STATE_HORDE_FLAG_NOT_READY),

    m_uiGraveyardController(NEUTRAL),
    m_uiTowersAlly(0),
    m_uiTowersHorde(0)
{
    m_uiTypeId = WORLD_PVP_TYPE_ZM;

    // init world states
    m_uiBeaconWorldState[0] = WORLD_STATE_TOWER_EAST_NEUTRAL;
    m_uiBeaconWorldState[1] = WORLD_STATE_TOWER_WEST_NEUTRAL;
    m_uiBeaconMapState[0] = WORLD_STATE_BEACON_EAST_NEUTRAL;
    m_uiBeaconMapState[1] = WORLD_STATE_BEACON_WEST_NEUTRAL;

    for (uint8 i = 0; i < MAX_ZM_TOWERS; ++i)
        m_uiBeaconController[i] = NEUTRAL;
}

bool WorldPvPZM::InitWorldPvPArea()
{
    RegisterZone(ZONE_ID_ZANGARMARSH);
    RegisterZone(ZONE_ID_SERPENTSHRINE_CAVERN);
    RegisterZone(ZONE_ID_STREAMVAULT);
    RegisterZone(ZONE_ID_UNDERBOG);
    RegisterZone(ZONE_ID_SLAVE_PENS);

    return true;
}

void WorldPvPZM::FillInitialWorldStates(WorldPacket& data, uint32& count)
{
    FillInitialWorldState(data, count, m_uiAllianceScoutWorldState, 1);
    FillInitialWorldState(data, count, m_uiHordeScoutWorldState, 1);
    FillInitialWorldState(data, count, m_uiGraveyardWorldState, 1);

    for (uint8 i = 0; i < MAX_ZM_TOWERS; ++i)
    {
        FillInitialWorldState(data, count, m_uiBeaconWorldState[i], 1);
        FillInitialWorldState(data, count, m_uiBeaconMapState[i], 1);
    }
}

void WorldPvPZM::SendRemoveWorldStates(Player* pPlayer)
{
    pPlayer->SendUpdateWorldState(m_uiAllianceScoutWorldState, 0);
    pPlayer->SendUpdateWorldState(m_uiHordeScoutWorldState, 0);
    pPlayer->SendUpdateWorldState(m_uiGraveyardWorldState, 0);

    for (uint8 i = 0; i < MAX_ZM_TOWERS; ++i)
    {
        pPlayer->SendUpdateWorldState(m_uiBeaconWorldState[i], 0);
        pPlayer->SendUpdateWorldState(m_uiBeaconMapState[i], 0);
    }
}

void WorldPvPZM::HandlePlayerEnterZone(Player* pPlayer)
{
    // remove the buff from the player first; Sometimes on relog players still have the aura
    pPlayer->RemoveAurasDueToSpell(SPELL_TWIN_SPIRE_BLESSING);

    // cast buff the the player which enters the zone
    if ((pPlayer->GetTeam() == ALLIANCE ? m_uiTowersAlly : m_uiTowersHorde) == MAX_ZM_TOWERS)
        pPlayer->CastSpell(pPlayer, SPELL_TWIN_SPIRE_BLESSING, true);

    WorldPvP::HandlePlayerEnterZone(pPlayer);
}

void WorldPvPZM::HandlePlayerLeaveZone(Player* pPlayer)
{
    // remove the buff from the player
    pPlayer->RemoveAurasDueToSpell(SPELL_TWIN_SPIRE_BLESSING);

    WorldPvP::HandlePlayerLeaveZone(pPlayer);
}

void WorldPvPZM::OnCreatureCreate(Creature* pCreature)
{
    switch (pCreature->GetEntry())
    {
        case NPC_ALLIANCE_FIELD_SCOUT:
            m_AllianceScoutGUID = pCreature->GetObjectGuid();
            break;
        case NPC_HORDE_FIELD_SCOUT:
            m_HorderScoutGUID = pCreature->GetObjectGuid();
            break;
        case NPC_PVP_BEAM_RED:
            // East Beam
            if (pCreature->GetPositionY() < 7000.0f)
            {
                m_BeamRedGUID[0] = pCreature->GetObjectGuid();
                if (m_uiBeaconController[0] == HORDE)
                    return;
            }
            // Center Beam
            else if (pCreature ->GetPositionY() < 7300.0f)
            {
                m_BeamCenterRedGUID = pCreature->GetObjectGuid();
                if (m_uiGraveyardController == HORDE)
                    return;
            }
            // West Beam
            else
            {
                m_BeamRedGUID[1] = pCreature->GetObjectGuid();
                if (m_uiBeaconController[1] == HORDE)
                    return;
            }

            pCreature->SetRespawnDelay(7*DAY);
            pCreature->ForcedDespawn();
            break;
        case NPC_PVP_BEAM_BLUE:
            // East Beam
            if (pCreature->GetPositionY() < 7000.0f)
            {
                m_BeamBlueGUID[0] = pCreature->GetObjectGuid();
                if (m_uiBeaconController[0] == ALLIANCE)
                    return;
            }
            // Center Beam
            else if (pCreature ->GetPositionY() < 7300.0f)
            {
                m_BeamCenterBlueGUID = pCreature->GetObjectGuid();
                if (m_uiGraveyardController == ALLIANCE)
                    return;
            }
            // West Beam
            else
            {
                m_BeamBlueGUID[1] = pCreature->GetObjectGuid();
                if (m_uiBeaconController[1] == ALLIANCE)
                    return;
            }

            pCreature->SetRespawnDelay(7*DAY);
            pCreature->ForcedDespawn();
            break;
    }
}

void WorldPvPZM::OnGameObjectCreate(GameObject* pGo)
{
    switch (pGo->GetEntry())
    {
        case GO_ZANGA_BANNER_WEST:
            m_TowerBannerGUID[1] = pGo->GetObjectGuid();
            break;
        case GO_ZANGA_BANNER_EAST:
            m_TowerBannerGUID[0] = pGo->GetObjectGuid();
            break;
        case GO_ZANGA_BANNER_CENTER_ALY:
            m_TowerBannerCenterAlyGUID = pGo->GetObjectGuid();
            break;
        case GO_ZANGA_BANNER_CENTER_HORDE:
            m_TowerBannerCenterHordeGUID = pGo->GetObjectGuid();
            break;
        case GO_ZANGA_BANNER_CENTER_NEUTRAL:
            m_TowerBannerCenterNeutralGUID = pGo->GetObjectGuid();
            break;
    }
}

// Cast player spell on oponent kill
void WorldPvPZM::HandlePlayerKillInsideArea(Player* pPlayer, Unit* pVictim)
{
    for (uint8 i = 0; i < MAX_ZM_TOWERS; ++i)
    {
        if (GameObject* pBanner = pPlayer->GetMap()->GetGameObject(m_TowerBannerGUID[i]))
        {
            GameObjectInfo const* info = pBanner->GetGOInfo();
            if (!info)
                continue;

            if (!pPlayer->IsWithinDistInMap(pBanner, info->capturePoint.radius))
                continue;

            // check banner faction
            if (pBanner->GetCapturePointTicks() > CAPTURE_SLIDER_NEUTRAL + info->capturePoint.neutralPercent * 0.5f && pPlayer->GetTeam() == ALLIANCE)
                pPlayer->CastSpell(pPlayer, SPELL_ZANGA_TOWER_TOKEN_ALY, true);
            else if (pBanner->GetCapturePointTicks() < CAPTURE_SLIDER_NEUTRAL - info->capturePoint.neutralPercent * 0.5f && pPlayer->GetTeam() == HORDE)
                pPlayer->CastSpell(pPlayer, SPELL_ZANGA_TOWER_TOKEN_HORDE, true);
        }
    }
}

// process the capture events
void WorldPvPZM::ProcessEvent(GameObject* pGo, uint32 uiEventId, uint32 uiFaction)
{
    for (uint8 i = 0; i < MAX_ZM_TOWERS; ++i)
    {
        if (pGo->GetEntry() == aZangaTowers[i])
        {
            for (uint8 j = 0; j < 4; ++j)
            {
                if (uiEventId == aZangaTowerEvents[i][j].uiEventEntry)
                {
                    ProcessCaptureEvent(aZangaTowerEvents[i][j].uiEventType, uiFaction, aZangaTowerEvents[i][j].uiWorldState, aZangaTowerEvents[i][j].uiMapState, i);
                    sWorld.SendZoneText(ZONE_ID_ZANGARMARSH, sObjectMgr.GetMangosStringForDBCLocale(aZangaTowerEvents[i][j].uiZoneText));
                    break;
                }
            }
        }
    }
}

void WorldPvPZM::ProcessCaptureEvent(uint32 uiCaptureType, uint32 uiTeam, uint32 uiNewWorldState, uint32 uiNewMapState, uint32 uiTower)
{
    for (uint8 i = 0; i < MAX_ZM_TOWERS; ++i)
    {
        if (uiTower == i)
        {
            // remove old tower state
            SendUpdateWorldState(m_uiBeaconWorldState[i], 0);
            SendUpdateWorldState(m_uiBeaconMapState[i], 0);

            if (uiCaptureType == PROGRESS)
            {
                if (uiTeam == ALLIANCE)
                {
                    DoSetBeaconArtkit(m_BeamBlueGUID[i], true);
                    ++m_uiTowersAlly;
                }
                else
                {
                    DoSetBeaconArtkit(m_BeamRedGUID[i], true);
                    ++m_uiTowersHorde;
                }

                m_uiBeaconController[i] = uiTeam;
            }
            else if (uiCaptureType == NEUTRAL)
            {
                if (uiTeam == ALLIANCE)
                {
                    DoSetBeaconArtkit(m_BeamRedGUID[i], false);
                    --m_uiTowersHorde;
                }
                else
                {
                    DoSetBeaconArtkit(m_BeamBlueGUID[i], false);
                    --m_uiTowersAlly;
                }

                m_uiBeaconController[i] = NEUTRAL;
            }

            // send new tower state
            m_uiBeaconWorldState[i] = uiNewWorldState;
            m_uiBeaconMapState[i] = uiNewMapState;
            SendUpdateWorldState(m_uiBeaconMapState[i], 1);
            SendUpdateWorldState(m_uiBeaconWorldState[i], 1);
        }
    }

    // buff players
    if (m_uiTowersAlly == MAX_ZM_TOWERS)
        DoPrepareFactionScouts(ALLIANCE);
    else if (m_uiTowersHorde == MAX_ZM_TOWERS)
        DoPrepareFactionScouts(HORDE);

    // debuff players if towers == 0; spell to remove will be always the first
    if (m_uiTowersHorde < MAX_ZM_TOWERS)
        DoResetScouts(HORDE);
    if (m_uiTowersAlly < MAX_ZM_TOWERS)
        DoResetScouts(ALLIANCE);
}

void WorldPvPZM::DoPrepareFactionScouts(uint32 uiFaction)
{
    Player* pPlayer = GetPlayerInZone();
    if (!pPlayer)
        return;

    if (uiFaction == ALLIANCE)
    {
        if (Creature* pScout = pPlayer->GetMap()->GetCreature(m_AllianceScoutGUID))
            pScout->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);

        SendUpdateWorldState(m_uiAllianceScoutWorldState, 0);
        m_uiAllianceScoutWorldState = WORLD_STATE_ALY_FLAG_READY;
        SendUpdateWorldState(m_uiAllianceScoutWorldState, 1);
    }
    else if (uiFaction == HORDE)
    {
        if (Creature* pScout = pPlayer->GetMap()->GetCreature(m_HorderScoutGUID))
            pScout->SetFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);

        SendUpdateWorldState(m_uiHordeScoutWorldState, 0);
        m_uiHordeScoutWorldState = WORLD_STATE_HORDE_FLAG_READY;
        SendUpdateWorldState(m_uiHordeScoutWorldState, 1);
    }
}

void WorldPvPZM::DoResetScouts(uint32 uiFaction, bool bIncludeWorldStates)
{
    Player* pPlayer = GetPlayerInZone();
    if (!pPlayer)
        return;

    if (uiFaction == ALLIANCE)
    {
        if (Creature* pScout = pPlayer->GetMap()->GetCreature(m_AllianceScoutGUID))
            pScout->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);

        // reset world states only if requested
        if (bIncludeWorldStates)
        {
            SendUpdateWorldState(m_uiAllianceScoutWorldState, 0);
            m_uiAllianceScoutWorldState = WORLD_STATE_ALY_FLAG_NOT_READY;
            SendUpdateWorldState(m_uiAllianceScoutWorldState, 1);
        }
    }
    else if (uiFaction == HORDE)
    {
        if (Creature* pScout = pPlayer->GetMap()->GetCreature(m_HorderScoutGUID))
            pScout->RemoveFlag(UNIT_NPC_FLAGS, UNIT_NPC_FLAG_GOSSIP);

        // reset world states only if requested
        if (bIncludeWorldStates)
        {
            SendUpdateWorldState(m_uiHordeScoutWorldState, 0);
            m_uiHordeScoutWorldState = WORLD_STATE_HORDE_FLAG_NOT_READY;
            SendUpdateWorldState(m_uiHordeScoutWorldState, 1);
        }
    }
}

bool WorldPvPZM::HandleObjectUse(Player* pPlayer, GameObject* pGo)
{
    if (!pPlayer->HasAura(pPlayer->GetTeam() == ALLIANCE ? SPELL_BATTLE_STANDARD_ALY : SPELL_BATTLE_STANDARD_HORDE))
        return false;

    switch (pGo->GetEntry())
    {
        case GO_ZANGA_BANNER_CENTER_ALY:
            // clicked only by the horde
            if (pPlayer->GetTeam() == ALLIANCE)
                return false;

            // change banners
            SendUpdateWorldState(m_uiGraveyardWorldState, 0);
            DoHandleBanners(m_TowerBannerCenterAlyGUID, false);
            DoHandleBanners(m_TowerBannerCenterHordeGUID, true);
            DoSetBeaconArtkit(m_BeamCenterBlueGUID, false);
            sWorld.SendZoneText(ZONE_ID_ZANGARMARSH, sObjectMgr.GetMangosStringForDBCLocale(LANG_OPVP_ZM_LOOSE_GY_A));

            // remove buff and graveyard from ally
            DoProcessTeamBuff(ALLIANCE, SPELL_TWIN_SPIRE_BLESSING, true);
            DoSetGraveyard(ALLIANCE, true);

            // add the buff and the graveyard to horde
            m_uiGraveyardWorldState = WORLD_STATE_GRAVEYARD_HORDE;
            SendUpdateWorldState(m_uiGraveyardWorldState, 1);
            DoProcessTeamBuff(HORDE, SPELL_TWIN_SPIRE_BLESSING);
            DoSetGraveyard(HORDE);

            // reset scout and remove player aura
            DoResetScouts(HORDE);
            m_uiGraveyardController = HORDE;
            pPlayer->RemoveAurasDueToSpell(SPELL_BATTLE_STANDARD_HORDE);
            DoSetBeaconArtkit(m_BeamCenterRedGUID, true);
            sWorld.SendZoneText(ZONE_ID_ZANGARMARSH, sObjectMgr.GetMangosStringForDBCLocale(LANG_OPVP_ZM_CAPTURE_GY_H));

            return true;
        case GO_ZANGA_BANNER_CENTER_HORDE:
            // clicked only by the alliance
            if (pPlayer->GetTeam() == HORDE)
                return false;

            // change banners
            SendUpdateWorldState(m_uiGraveyardWorldState, 0);
            DoHandleBanners(m_TowerBannerCenterHordeGUID, false);
            DoHandleBanners(m_TowerBannerCenterAlyGUID, true);
            DoSetBeaconArtkit(m_BeamCenterRedGUID, false);
            sWorld.SendZoneText(ZONE_ID_ZANGARMARSH, sObjectMgr.GetMangosStringForDBCLocale(LANG_OPVP_ZM_LOOSE_GY_H));

            // remove buff and graveyard from ally
            DoProcessTeamBuff(HORDE, SPELL_TWIN_SPIRE_BLESSING, true);
            DoSetGraveyard(HORDE, true);

            // add the buff and the graveyard to horde
            m_uiGraveyardWorldState = WORLD_STATE_GRAVEYARD_ALY;
            SendUpdateWorldState(m_uiGraveyardWorldState, 1);
            DoProcessTeamBuff(ALLIANCE, SPELL_TWIN_SPIRE_BLESSING);
            DoSetGraveyard(ALLIANCE);

            // reset scout and remove player aura
            DoResetScouts(ALLIANCE);
            m_uiGraveyardController = ALLIANCE;
            pPlayer->RemoveAurasDueToSpell(SPELL_BATTLE_STANDARD_ALY);
            DoSetBeaconArtkit(m_BeamCenterBlueGUID, true);
            sWorld.SendZoneText(ZONE_ID_ZANGARMARSH, sObjectMgr.GetMangosStringForDBCLocale(LANG_OPVP_ZM_CAPTURE_GY_A));

            return true;
        case GO_ZANGA_BANNER_CENTER_NEUTRAL:

            // remove old world state
            SendUpdateWorldState(m_uiGraveyardWorldState, 0);

            if (pPlayer->GetTeam() == ALLIANCE)
            {
                // change banners
                DoHandleBanners(m_TowerBannerCenterNeutralGUID, false);
                DoHandleBanners(m_TowerBannerCenterAlyGUID, true);

                // add the buff and the graveyard to horde
                m_uiGraveyardWorldState= WORLD_STATE_GRAVEYARD_ALY;
                DoProcessTeamBuff(ALLIANCE, SPELL_TWIN_SPIRE_BLESSING);
                DoSetGraveyard(ALLIANCE);

                // reset scout and remove player aura
                DoResetScouts(ALLIANCE);
                m_uiGraveyardController = ALLIANCE;
                pPlayer->RemoveAurasDueToSpell(SPELL_BATTLE_STANDARD_ALY);
                DoSetBeaconArtkit(m_BeamCenterBlueGUID, true);
                sWorld.SendZoneText(ZONE_ID_ZANGARMARSH, sObjectMgr.GetMangosStringForDBCLocale(LANG_OPVP_ZM_CAPTURE_GY_H));
            }
            else if (pPlayer->GetTeam() == HORDE)
            {
                // change banners
                DoHandleBanners(m_TowerBannerCenterNeutralGUID, false);
                DoHandleBanners(m_TowerBannerCenterHordeGUID, true);

                // add the buff and the graveyard to horde
                m_uiGraveyardWorldState = WORLD_STATE_GRAVEYARD_HORDE;
                DoProcessTeamBuff(HORDE, SPELL_TWIN_SPIRE_BLESSING);
                DoSetGraveyard(HORDE);

                // reset scout and remove player aura
                DoResetScouts(HORDE);
                m_uiGraveyardController = HORDE;
                pPlayer->RemoveAurasDueToSpell(SPELL_BATTLE_STANDARD_HORDE);
                DoSetBeaconArtkit(m_BeamCenterRedGUID, true);
                sWorld.SendZoneText(ZONE_ID_ZANGARMARSH, sObjectMgr.GetMangosStringForDBCLocale(LANG_OPVP_ZM_CAPTURE_GY_H));
            }

            // add new world state
            SendUpdateWorldState(m_uiGraveyardWorldState, 1);

            return true;
    }

    return false;
}

void WorldPvPZM::DoSetGraveyard(uint32 uiFaction, bool bRemove)
{
    if (bRemove)
        sObjectMgr.RemoveGraveYardLink(GRAVEYARD_ID_TWIN_SPIRE, GRAVEYARD_ZONE_TWIN_SPIRE, (Team)uiFaction, false);
    else
        sObjectMgr.AddGraveYardLink(GRAVEYARD_ID_TWIN_SPIRE, GRAVEYARD_ZONE_TWIN_SPIRE, (Team)uiFaction, false);
}

void WorldPvPZM::DoHandleBanners(ObjectGuid BannerGuid, bool bRespawn)
{
    // neet to use a player as anchor for the map
    Player* pPlayer = GetPlayerInZone();
    if (!pPlayer)
        return;

    if (GameObject* pBanner = pPlayer->GetMap()->GetGameObject(BannerGuid))
    {
        if (bRespawn)
        {
            pBanner->SetRespawnTime(7*DAY);
            pBanner->Refresh();
        }
        else if (pBanner->isSpawned())
            pBanner->Delete();
    }
}

void WorldPvPZM::DoSetBeaconArtkit(ObjectGuid BeaconGuid, bool bRespawn)
{
    Player* pPlayer = GetPlayerInZone();
    if (!pPlayer)
        return;

    if (Creature* pBeam = pPlayer->GetMap()->GetCreature(BeaconGuid))
    {
        if (bRespawn)
            pBeam->Respawn();
        else
            pBeam->ForcedDespawn();
    }
}
