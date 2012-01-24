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
#include "WorldPvPEP.h"
#include "../GameObject.h"


WorldPvPEP::WorldPvPEP() : WorldPvP(),
    m_uiTowersAlly(0),
    m_uiTowersHorde(0)
{
    m_uiTypeId = WORLD_PVP_TYPE_EP;

    m_uiTowerWorldState[0] = WORLD_STATE_NORTHPASS_NEUTRAL;
    m_uiTowerWorldState[1] = WORLD_STATE_CROWNGUARD_NEUTRAL;
    m_uiTowerWorldState[2] = WORLD_STATE_EASTWALL_NEUTRAL;
    m_uiTowerWorldState[3] = WORLD_STATE_PLAGUEWOOD_NEUTRAL;

    for (uint8 i = 0; i < MAX_EP_TOWERS; ++i)
        m_uiTowerController[i] = NEUTRAL;
}

bool WorldPvPEP::InitWorldPvPArea()
{
    RegisterZone(ZONE_ID_EASTERN_PLAGUELANDS);
    RegisterZone(ZONE_ID_STRATHOLME);
    RegisterZone(ZONE_ID_SCHOLOMANCE);

    return true;
}

void WorldPvPEP::FillInitialWorldStates(WorldPacket& data, uint32& count)
{
    FillInitialWorldState(data, count, WORLD_STATE_TOWER_COUNT_ALY, m_uiTowersAlly);
    FillInitialWorldState(data, count, WORLD_STATE_TOWER_COUNT_HORDE, m_uiTowersHorde);

    for (uint8 i = 0; i < MAX_EP_TOWERS; ++i)
        FillInitialWorldState(data, count, m_uiTowerWorldState[i], 1);
}

void WorldPvPEP::SendRemoveWorldStates(Player* pPlayer)
{
    pPlayer->SendUpdateWorldState(WORLD_STATE_TOWER_COUNT_ALY, 0);
    pPlayer->SendUpdateWorldState(WORLD_STATE_TOWER_COUNT_HORDE, 0);

    for (uint8 i = 0; i < MAX_EP_TOWERS; ++i)
        pPlayer->SendUpdateWorldState(m_uiTowerWorldState[i], 0);
}

void WorldPvPEP::UpdateWorldState()
{
    // update only tower count; tower states is updated in the process event
    SendUpdateWorldState(WORLD_STATE_TOWER_COUNT_ALY, m_uiTowersAlly);
    SendUpdateWorldState(WORLD_STATE_TOWER_COUNT_HORDE, m_uiTowersHorde);
}

void WorldPvPEP::HandlePlayerEnterZone(Player* pPlayer)
{
    // remove the buff from the player first; Sometimes on relog players still have the aura
    for (uint8 i = 0; i < MAX_EP_TOWERS; i++)
    {
        if (pPlayer->HasAura(pPlayer->GetTeam() == ALLIANCE ? m_aPlaguelandsTowerBuffs[i].uiSpellIdAlly : m_aPlaguelandsTowerBuffs[i].uiSpellIdHorde))
            pPlayer->RemoveAurasDueToSpell(pPlayer->GetTeam() == ALLIANCE ? m_aPlaguelandsTowerBuffs[i].uiSpellIdAlly : m_aPlaguelandsTowerBuffs[i].uiSpellIdHorde);
    }

    // cast buff the the player which enters the zone
    switch (pPlayer->GetTeam())
    {
        case ALLIANCE:
            for (uint8 i = 0; i < MAX_EP_TOWERS; i++)
            {
                if (m_uiTowersAlly == i + 1)
                    pPlayer->CastSpell(pPlayer, m_aPlaguelandsTowerBuffs[i].uiSpellIdAlly, true);
            }
            break;
        case HORDE:
            for (uint8 i = 0; i < MAX_EP_TOWERS; i++)
            {
                if (m_uiTowersHorde == i + 1)
                    pPlayer->CastSpell(pPlayer, m_aPlaguelandsTowerBuffs[i].uiSpellIdHorde, true);
            }
            break;
    }

    WorldPvP::HandlePlayerEnterZone(pPlayer);
}

void WorldPvPEP::HandlePlayerLeaveZone(Player* pPlayer)
{
    // remove the buff from the player
    for (uint8 i = 0; i < MAX_EP_TOWERS; i++)
    {
        if (pPlayer->HasAura(pPlayer->GetTeam() == ALLIANCE ? m_aPlaguelandsTowerBuffs[i].uiSpellIdAlly : m_aPlaguelandsTowerBuffs[i].uiSpellIdHorde))
            pPlayer->RemoveAurasDueToSpell(pPlayer->GetTeam() == ALLIANCE ? m_aPlaguelandsTowerBuffs[i].uiSpellIdAlly : m_aPlaguelandsTowerBuffs[i].uiSpellIdHorde);
    }

    WorldPvP::HandlePlayerLeaveZone(pPlayer);
}

void WorldPvPEP::OnGameObjectCreate(GameObject* pGo)
{
    switch (pGo->GetEntry())
    {
        case GO_BATTLEFIELD_BANNER_PLAGUELANDS_1:
        case GO_BATTLEFIELD_BANNER_PLAGUELANDS_2:
        case GO_BATTLEFIELD_BANNER_PLAGUELANDS_3:
        case GO_BATTLEFIELD_BANNER_PLAGUELANDS_4:
        case GO_TOWER_BANNER:
            // sort banners
            if (pGo->IsWithinDist2d(m_aTowersSpawnLocs[0].m_fX, m_aTowersSpawnLocs[0].m_fY, 50.0f))
            {
                m_lTowerBanners[0].push_back(pGo->GetObjectGuid());
                if (m_uiTowerController[0] == NEUTRAL)
                    pGo->SetGoArtKit(GO_ARTKIT_BANNER_NEUTRAL);
                else
                    pGo->SetGoArtKit(m_uiTowerController[0] == ALLIANCE ? GO_ARTKIT_BANNER_ALLIANCE : GO_ARTKIT_BANNER_HORDE);
            }
            else if (pGo->IsWithinDist2d(m_aTowersSpawnLocs[1].m_fX, m_aTowersSpawnLocs[1].m_fY, 50.0f))
            {
                m_lTowerBanners[1].push_back(pGo->GetObjectGuid());
                if (m_uiTowerController[1] == NEUTRAL)
                    pGo->SetGoArtKit(GO_ARTKIT_BANNER_NEUTRAL);
                else
                    pGo->SetGoArtKit(m_uiTowerController[1] == ALLIANCE ? GO_ARTKIT_BANNER_ALLIANCE : GO_ARTKIT_BANNER_HORDE);
            }
            else if (pGo->IsWithinDist2d(m_aTowersSpawnLocs[2].m_fX, m_aTowersSpawnLocs[2].m_fY, 50.0f))
            {
                m_lTowerBanners[2].push_back(pGo->GetObjectGuid());
                if (m_uiTowerController[2] == NEUTRAL)
                    pGo->SetGoArtKit(GO_ARTKIT_BANNER_NEUTRAL);
                else
                    pGo->SetGoArtKit(m_uiTowerController[2] == ALLIANCE ? GO_ARTKIT_BANNER_ALLIANCE : GO_ARTKIT_BANNER_HORDE);
            }
            else if (pGo->IsWithinDist2d(m_aTowersSpawnLocs[3].m_fX, m_aTowersSpawnLocs[3].m_fY, 50.0f))
            {
                m_lTowerBanners[3].push_back(pGo->GetObjectGuid());
                if (m_uiTowerController[3] == NEUTRAL)
                    pGo->SetGoArtKit(GO_ARTKIT_BANNER_NEUTRAL);
                else
                    pGo->SetGoArtKit(m_uiTowerController[3] == ALLIANCE ? GO_ARTKIT_BANNER_ALLIANCE : GO_ARTKIT_BANNER_HORDE);
            }
            break;
        case GO_LORDAERON_SHRINE_ALY:
            m_uiLordaeronShrineAlyGUID = pGo->GetObjectGuid();
            break;
        case GO_LORDAERON_SHRINE_HORDE:
            m_uiLordaeronShrineHordeGUID = pGo->GetObjectGuid();
            break;
    }
}

void WorldPvPEP::HandleObjectiveComplete(PlayerSet m_sPlayersSet, uint32 uiEventId)
{
    uint32 uiCredit = 0;

    switch (uiEventId)
    {
        case EVENT_CROWNGUARD_PROGRESS_ALLIANCE:
        case EVENT_CROWNGUARD_PROGRESS_HORDE:
            uiCredit = NPC_CROWNGUARD_TOWER_QUEST_DOODAD;
            break;
        case EVENT_EASTWALL_PROGRESS_ALLIANCE:
        case EVENT_EASTWALL_PROGRESS_HORDE:
            uiCredit = NPC_EASTWALL_TOWER_QUEST_DOODAD;
            break;
        case EVENT_NORTHPASS_PROGRESS_ALLIANCE:
        case EVENT_NORTHPASS_PROGRESS_HORDE:
            uiCredit = NPC_NORTHPASS_TOWER_QUEST_DOODAD;
            break;
        case EVENT_PLAGUEWOOD_PROGRESS_ALLIANCE:
        case EVENT_PLAGUEWOOD_PROGRESS_HORDE:
            uiCredit = NPC_PLAGUEWOOD_TOWER_QUEST_DOODAD;
            break;
    }

    if (!uiCredit)
        return;

    for (PlayerSet::iterator itr = m_sPlayersSet.begin(); itr != m_sPlayersSet.end(); ++itr)
    {
        if (!(*itr))
            continue;

        (*itr)->KilledMonsterCredit(uiCredit);
        (*itr)->RewardHonor(NULL, 1, HONOR_REWARD_PLAGUELANDS);
    }
}

// process the capture events
void WorldPvPEP::ProcessEvent(GameObject* pGo, uint32 uiEventId, uint32 uiFaction)
{
    for (uint8 i = 0; i < MAX_EP_TOWERS; ++i)
    {
        if (pGo->GetEntry() == aPlaguelandsBanners[i])
        {
            for (uint8 j = 0; j < 4; ++j)
            {
                if (uiEventId == aPlaguelandsTowerEvents[i][j].uiEventEntry)
                {
                    ProcessCaptureEvent(aPlaguelandsTowerEvents[i][j].uiEventType, uiFaction, aPlaguelandsTowerEvents[i][j].uiWorldState, i);
                    sWorld.SendZoneText(ZONE_ID_EASTERN_PLAGUELANDS, sObjectMgr.GetMangosStringForDBCLocale(aPlaguelandsTowerEvents[i][j].uiZoneText));
                    break;
                }
            }
        }
    }
}

void WorldPvPEP::ProcessCaptureEvent(uint32 uiCaptureType, uint32 uiTeam, uint32 uiNewWorldState, uint32 uiTower)
{
    for (uint8 i = 0; i < MAX_EP_TOWERS; ++i)
    {
        if (uiTower == i)
        {
            // remove old tower state
            SendUpdateWorldState(m_uiTowerWorldState[i], 0);

            if (uiCaptureType == PROGRESS)
            {
                SetBannersArtKit(m_lTowerBanners[i], uiTeam == ALLIANCE ? GO_ARTKIT_BANNER_ALLIANCE : GO_ARTKIT_BANNER_HORDE);
                m_uiTowerController[i] = uiTeam;

                if (uiTeam == ALLIANCE)
                    ++m_uiTowersAlly;
                else
                    ++m_uiTowersHorde;

                // handle rewards from each tower
                switch (i)
                {
                    case 0:     // Northpass
                        DoUpdateShrine(uiTeam == ALLIANCE ? m_uiLordaeronShrineAlyGUID : m_uiLordaeronShrineHordeGUID);
                        break;
                    case 1:     // Crownguard
                        DoSetGraveyard(uiTeam);
                        break;
                    case 2:     // Eastwall
                        if (m_uiTowerController[0] != uiTeam)
                            DoSummonSoldiersIfCan(uiTeam);
                        break;
                    case 3:     // Plaguewood
                        DoSummonFlightMasterIfCan(uiTeam);
                        break;
                }
            }
            else if (uiCaptureType == NEUTRAL)
            {
                SetBannersArtKit(m_lTowerBanners[i], GO_ARTKIT_BANNER_NEUTRAL);
                m_uiTowerController[i] = NEUTRAL;

                if (uiTeam == ALLIANCE)
                    --m_uiTowersHorde;
                else
                    --m_uiTowersAlly;

                // cancel rewards from each tower
                switch (i)
                {
                    case 0:     // Northpass
                        DoUpdateShrine(uiTeam == ALLIANCE ? m_uiLordaeronShrineAlyGUID : m_uiLordaeronShrineHordeGUID, true);
                        break;
                    case 1:     // Crownguard
                        DoSetGraveyard(uiTeam, true);
                        break;
                    case 2:     // Eastwall
                        DoUnsummonSoldiers();
                        break;
                    case 3:     // Plaguewood
                        DoUnsummonFlightMaster();
                        break;
                }
            }

            // send new tower state
            m_uiTowerWorldState[i] = uiNewWorldState;
            SendUpdateWorldState(m_uiTowerWorldState[i], 1);
        }
    }

    // update buffs
    for (uint8 i = 0; i < MAX_EP_TOWERS; i++)
    {
        // buff alliance
        if (m_uiTowersAlly == i + 1)
            DoProcessTeamBuff(ALLIANCE, m_aPlaguelandsTowerBuffs[i].uiSpellIdAlly);
        // buff horde
        if (m_uiTowersHorde == i + 1)
            DoProcessTeamBuff(HORDE, m_aPlaguelandsTowerBuffs[i].uiSpellIdHorde);
    }

    // debuff players if towers == 0; spell to remove will be always the first
    if (m_uiTowersHorde == 0)
        DoProcessTeamBuff(HORDE, m_aPlaguelandsTowerBuffs[0].uiSpellIdHorde, true);
    if (m_uiTowersAlly == 0)
        DoProcessTeamBuff(ALLIANCE, m_aPlaguelandsTowerBuffs[0].uiSpellIdAlly, true);

    // update states counters
    UpdateWorldState();
}

void WorldPvPEP::DoSummonFlightMasterIfCan(uint32 uiFaction)
{
    Player* pPlayer = GetPlayerInZone();
    if (!pPlayer)
        return;

    // summon the flightmaster - NOTE: not sure how to handle factions
    if (Creature* pFlightMaster = pPlayer->SummonCreature(NPC_SPECTRAL_FLIGHTMASTER, aFlightmasterSpawnLocs[0], aFlightmasterSpawnLocs[1], aFlightmasterSpawnLocs[2], aFlightmasterSpawnLocs[3], TEMPSUMMON_DEAD_DESPAWN, 0))
        m_uiFlightMasterGUID = pFlightMaster->GetObjectGuid();
}

void WorldPvPEP::DoUnsummonFlightMaster()
{
    // neet to use a player as anchor for the map
    Player* pPlayer = GetPlayerInZone();
    if (!pPlayer)
        return;

    if (Creature* pFlightMaster = pPlayer->GetMap()->GetCreature(m_uiFlightMasterGUID))
        pFlightMaster->ForcedDespawn();
}

void WorldPvPEP::DoSummonSoldiersIfCan(uint32 uiFaction)
{
    Player* pPlayer = GetPlayerInZone();
    if (!pPlayer)
        return;

    uint32 uiEntry = 0;

    for (uint8 i = 0; i < 5; i++)
    {
        if (i == 0)
            uiEntry = uiFaction == ALLIANCE ? NPC_LORDAERON_COMMANDER : NPC_LORDAERON_VETERAN;
        else
            uiEntry = uiFaction == ALLIANCE ? NPC_LORDAERON_SOLDIER : NPC_LORDAERON_FIGHTER;

        if (Creature* pSoldier = pPlayer->SummonCreature(uiEntry, m_aPlaguelandSoldiersSpawnLocs[i].m_fX, m_aPlaguelandSoldiersSpawnLocs[i].m_fY, m_aPlaguelandSoldiersSpawnLocs[i].m_fZ, 2.2f, TEMPSUMMON_DEAD_DESPAWN, 0))
            m_lSoldiersGuids.push_back(pSoldier->GetObjectGuid());
    }
}

void WorldPvPEP::DoUnsummonSoldiers()
{
    // neet to use a player as anchor for the map
    Player* pPlayer = GetPlayerInZone();
    if (!pPlayer)
        return;

    for (std::list<ObjectGuid>::iterator itr = m_lSoldiersGuids.begin(); itr != m_lSoldiersGuids.end(); ++itr)
    {
        if (Creature* pSoldier = pPlayer->GetMap()->GetCreature(*itr))
            pSoldier->ForcedDespawn();
    }
}

void WorldPvPEP::DoSetGraveyard(uint32 uiFaction, bool bRemove)
{
    if (bRemove)
        sObjectMgr.RemoveGraveYardLink(GRAVEYARD_ID_EASTERN_PLAGUE, GRAVEYARD_ZONE_EASTERN_PLAGUE,  (Team)uiFaction,      false);
    else
        sObjectMgr.AddGraveYardLink(GRAVEYARD_ID_EASTERN_PLAGUE,    GRAVEYARD_ZONE_EASTERN_PLAGUE,  (Team)uiFaction, false);
}

void WorldPvPEP::DoUpdateShrine(ObjectGuid uiShrineGuid, bool bRemove)
{
    // neet to use a player as anchor for the map
    Player* pPlayer = GetPlayerInZone();
    if (!pPlayer)
        return;

    // process zones shrine
    if (GameObject* pShrine = pPlayer->GetMap()->GetGameObject(uiShrineGuid))
    {
        if (!bRemove)
        {
            pShrine->SetRespawnTime(7*DAY);
            pShrine->Refresh();
        }
        else if (pShrine->isSpawned())
            pShrine->Delete();
    }
}

void WorldPvPEP::SetBannersArtKit(std::list<ObjectGuid> lBannersGuids, uint32 uiArtkit)
{
    // neet to use a player as anchor for the map
    Player* pPlayer = GetPlayerInZone();
    if (!pPlayer)
        return;

    for (std::list<ObjectGuid>::iterator itr = lBannersGuids.begin(); itr != lBannersGuids.end(); ++itr)
    {
        if (GameObject* pBanner = pPlayer->GetMap()->GetGameObject(*itr))
        {
            pBanner->SetGoArtKit(uiArtkit);
            pBanner->Refresh();
        }
    }
}
