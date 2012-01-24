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
#include "WorldPvPHP.h"
#include "../GameObject.h"


WorldPvPHP::WorldPvPHP() : WorldPvP(),
    m_uiTowersAlly(0),
    m_uiTowersHorde(0)
{
    m_uiTypeId = WORLD_PVP_TYPE_HP;

    m_uiTowerWorldState[0] = WORLD_STATE_OVERLOOK_NEUTRAL;
    m_uiTowerWorldState[1] = WORLD_STATE_STADIUM_NEUTRAL;
    m_uiTowerWorldState[2] = WORLD_STATE_BROKEN_HILL_NEUTRAL;

    for (uint8 i = 0; i < MAX_HP_TOWERS; ++i)
        m_uiTowerController[i] = NEUTRAL;
}

bool WorldPvPHP::InitWorldPvPArea()
{
    RegisterZone(ZONE_ID_HELLFIRE_PENINSULA);
    RegisterZone(ZONE_ID_HELLFIRE_CITADEL);
    RegisterZone(ZONE_ID_HELLFIRE_RAMPARTS);
    RegisterZone(ZONE_ID_BLOOD_FURNACE);
    RegisterZone(ZONE_ID_SHATTERED_HALLS);
    RegisterZone(ZONE_ID_MAGTHERIDON_LAIR);

    return true;
}

void WorldPvPHP::FillInitialWorldStates(WorldPacket& data, uint32& count)
{
    FillInitialWorldState(data, count, WORLD_STATE_TOWER_COUNT_HP_ALY, m_uiTowersAlly);
    FillInitialWorldState(data, count, WORLD_STATE_TOWER_COUNT_HP_HORDE, m_uiTowersHorde);
    FillInitialWorldState(data, count, WORLD_STATE_TOWER_DISPLAY_HP_A, 1);
    FillInitialWorldState(data, count, WORLD_STATE_TOWER_DISPLAY_HP_H, 1);

    for (uint8 i = 0; i < MAX_HP_TOWERS; ++i)
        FillInitialWorldState(data, count, m_uiTowerWorldState[i], 1);
}

void WorldPvPHP::SendRemoveWorldStates(Player* pPlayer)
{
    pPlayer->SendUpdateWorldState(WORLD_STATE_TOWER_DISPLAY_HP_A, 0);
    pPlayer->SendUpdateWorldState(WORLD_STATE_TOWER_DISPLAY_HP_H, 0);

    for (uint8 i = 0; i < MAX_HP_TOWERS; ++i)
        pPlayer->SendUpdateWorldState(m_uiTowerWorldState[i], 0);
}

void WorldPvPHP::UpdateWorldState()
{
    // update only tower count; tower states is updated in the process event
    SendUpdateWorldState(WORLD_STATE_TOWER_COUNT_HP_ALY, m_uiTowersAlly);
    SendUpdateWorldState(WORLD_STATE_TOWER_COUNT_HP_HORDE, m_uiTowersHorde);
}

void WorldPvPHP::HandlePlayerEnterZone(Player* pPlayer)
{
    // remove the buff from the player first; Sometimes on relog players still have the aura
    pPlayer->RemoveAurasDueToSpell(pPlayer->GetTeam() == ALLIANCE ? SPELL_HELLFIRE_SUPERIORITY_ALY : SPELL_HELLFIRE_SUPERIORITY_HORDE);

    // cast buff the the player which enters the zone
    if ((pPlayer->GetTeam() == ALLIANCE ? m_uiTowersAlly : m_uiTowersHorde) == MAX_HP_TOWERS)
        pPlayer->CastSpell(pPlayer, pPlayer->GetTeam() == ALLIANCE ? SPELL_HELLFIRE_SUPERIORITY_ALY : SPELL_HELLFIRE_SUPERIORITY_HORDE, true);

    WorldPvP::HandlePlayerEnterZone(pPlayer);
}

void WorldPvPHP::HandlePlayerLeaveZone(Player* pPlayer)
{
    // remove the buff from the player
    pPlayer->RemoveAurasDueToSpell(pPlayer->GetTeam() == ALLIANCE ? SPELL_HELLFIRE_SUPERIORITY_ALY : SPELL_HELLFIRE_SUPERIORITY_HORDE);

    WorldPvP::HandlePlayerLeaveZone(pPlayer);
}

void WorldPvPHP::OnGameObjectCreate(GameObject* pGo)
{
    switch (pGo->GetEntry())
    {
        case GO_TOWER_BANNER_OVERLOOK:
            m_HellfireTowerGUID[0] = pGo->GetObjectGuid();
            if (m_uiTowerController[0] == NEUTRAL)
                pGo->SetGoArtKit(GO_ARTKIT_OVERLOOK_NEUTRAL);
            else
                pGo->SetGoArtKit(m_uiTowerController[0] == ALLIANCE ? GO_ARTKIT_OVERLOOK_ALY : GO_ARTKIT_OVERLOOK_HORDE);
            break;
        case GO_TOWER_BANNER_STADIUM:
            m_HellfireTowerGUID[1] = pGo->GetObjectGuid();
            if (m_uiTowerController[1] == NEUTRAL)
                pGo->SetGoArtKit(GO_ARTKIT_STADIUM_NEUTRAL);
            else
                pGo->SetGoArtKit(m_uiTowerController[1] == ALLIANCE ? GO_ARTKIT_STADIUM_ALY : GO_ARTKIT_STADIUM_HORDE);
            break;
        case GO_TOWER_BANNER_BROKEN_HILL:
            m_HellfireTowerGUID[2] = pGo->GetObjectGuid();
            if (m_uiTowerController[2] == NEUTRAL)
                pGo->SetGoArtKit(GO_ARTKIT_BROKEN_HILL_NEUTRAL);
            else
                pGo->SetGoArtKit(m_uiTowerController[2] == ALLIANCE ? GO_ARTKIT_BROKEN_HILL_ALY : GO_ARTKIT_BROKEN_HILL_HORDE);
            break;
        case GO_HELLFIRE_BANNER_OVERLOOK:
            m_HellfireBannerGUID[0] = pGo->GetObjectGuid();
            pGo->SetGoArtKit(GO_ARTKIT_BANNER_NEUTRAL);
            break;
        case GO_HELLFIRE_BANNER_STADIUM:
            m_HellfireBannerGUID[1] = pGo->GetObjectGuid();
            pGo->SetGoArtKit(GO_ARTKIT_BANNER_NEUTRAL);
            break;
        case GO_HELLFIRE_BANNER_BROKEN_HILL:
            m_HellfireBannerGUID[2] = pGo->GetObjectGuid();
            pGo->SetGoArtKit(GO_ARTKIT_BANNER_NEUTRAL);
            break;

    }
}

void WorldPvPHP::HandleObjectiveComplete(PlayerSet m_sPlayersSet, uint32 uiEventId)
{
    uint32 uiCredit = 0;

    switch (uiEventId)
    {
        case EVENT_OVERLOOK_PROGRESS_ALLIANCE:
        case EVENT_OVERLOOK_PROGRESS_HORDE:
            uiCredit = NPC_CAPTURE_CREDIT_OVERLOOK;
            break;
        case EVENT_STADIUM_PROGRESS_ALLIANCE:
        case EVENT_STADIUM_PROGRESS_HORDE:
            uiCredit = NPC_CAPTURE_CREDIT_STADIUM;
            break;
        case EVENT_BROKEN_HILL_PROGRESS_ALLIANCE:
        case EVENT_BROKEN_HILL_PROGRESS_HORDE:
            uiCredit = NPC_CAPTURE_CREDIT_BROKEN_HILL;
            break;
    }

    if (!uiCredit)
        return;

    for (PlayerSet::iterator itr = m_sPlayersSet.begin(); itr != m_sPlayersSet.end(); ++itr)
    {
        if (!(*itr))
            continue;

        (*itr)->KilledMonsterCredit(uiCredit);
        (*itr)->RewardHonor(NULL, 1, HONOR_REWARD_HELLFIRE);
    }
}

// Cast player spell on oponent kill
void WorldPvPHP::HandlePlayerKillInsideArea(Player* pPlayer, Unit* pVictim)
{
    for (uint8 i = 0; i < MAX_HP_TOWERS; ++i)
    {
        if (GameObject* pBanner = pPlayer->GetMap()->GetGameObject(m_HellfireBannerGUID[i]))
        {
            GameObjectInfo const* info = pBanner->GetGOInfo();
            if (!info)
                return;

            if (!pPlayer->IsWithinDistInMap(pBanner, info->capturePoint.radius))
                continue;

            // check banner faction
            if (pBanner->GetCapturePointTicks() > CAPTURE_SLIDER_NEUTRAL + info->capturePoint.neutralPercent * 0.5f && pPlayer->GetTeam() == ALLIANCE)
                pPlayer->CastSpell(pPlayer, SPELL_HELLFIRE_TOWER_TOKEN_ALY, true);
            else if (pBanner->GetCapturePointTicks() < CAPTURE_SLIDER_NEUTRAL - info->capturePoint.neutralPercent * 0.5f && pPlayer->GetTeam() == HORDE)
                pPlayer->CastSpell(pPlayer, SPELL_HELLFIRE_TOWER_TOKEN_HORDE, true);
        }
    }
}

// process the capture events
void WorldPvPHP::ProcessEvent(GameObject* pGo, uint32 uiEventId, uint32 uiFaction)
{
    for (uint8 i = 0; i < MAX_HP_TOWERS; ++i)
    {
        if (pGo->GetEntry() == aHellfireBanners[i])
        {
            for (uint8 j = 0; j < 4; ++j)
            {
                if (uiEventId == aHellfireTowerEvents[i][j].uiEventEntry)
                {
                    ProcessCaptureEvent(aHellfireTowerEvents[i][j].uiEventType, uiFaction, aHellfireTowerEvents[i][j].uiWorldState, aHellfireTowerEvents[i][j].uiTowerArtKit, i);
                    sWorld.SendZoneText(ZONE_ID_HELLFIRE_PENINSULA, sObjectMgr.GetMangosStringForDBCLocale(aHellfireTowerEvents[i][j].uiZoneText));
                    break;
                }
            }
        }
    }
}

void WorldPvPHP::ProcessCaptureEvent(uint32 uiCaptureType, uint32 uiTeam, uint32 uiNewWorldState, uint32 uiTowerArtKit, uint32 uiTower)
{
    for (uint8 i = 0; i < MAX_HP_TOWERS; ++i)
    {
        if (uiTower == i)
        {
            // remove old tower state
            SendUpdateWorldState(m_uiTowerWorldState[i], 0);

            if (uiCaptureType == PROGRESS)
            {
                SetBannerArtKit(m_HellfireBannerGUID[i], uiTeam == ALLIANCE ? GO_ARTKIT_BANNER_ALLIANCE : GO_ARTKIT_BANNER_HORDE);
                SetBannerArtKit(m_HellfireTowerGUID[i], uiTowerArtKit);
                m_uiTowerController[i] = uiTeam;

                if (uiTeam == ALLIANCE)
                    ++m_uiTowersAlly;
                else
                    ++m_uiTowersHorde;
            }
            else if (uiCaptureType == NEUTRAL)
            {
                SetBannerArtKit(m_HellfireBannerGUID[i], GO_ARTKIT_BANNER_NEUTRAL);
                SetBannerArtKit(m_HellfireTowerGUID[i], uiTowerArtKit);
                m_uiTowerController[i] = NEUTRAL;

                if (uiTeam == ALLIANCE)
                    --m_uiTowersHorde;
                else
                    --m_uiTowersAlly;
            }

            // send new tower state
            m_uiTowerWorldState[i] = uiNewWorldState;
            SendUpdateWorldState(m_uiTowerWorldState[i], 1);
        }
    }

    // buff players
    if (m_uiTowersAlly == MAX_HP_TOWERS)
        DoProcessTeamBuff(ALLIANCE, SPELL_HELLFIRE_SUPERIORITY_ALY);
    else if (m_uiTowersHorde == MAX_HP_TOWERS)
        DoProcessTeamBuff(HORDE, SPELL_HELLFIRE_SUPERIORITY_HORDE);

    // debuff players if towers == 0; spell to remove will be always the first
    if (m_uiTowersHorde < MAX_HP_TOWERS)
        DoProcessTeamBuff(HORDE, SPELL_HELLFIRE_SUPERIORITY_ALY, true);
    if (m_uiTowersAlly < MAX_HP_TOWERS)
        DoProcessTeamBuff(ALLIANCE, SPELL_HELLFIRE_SUPERIORITY_HORDE, true);

    // update states counters
    UpdateWorldState();
}

void WorldPvPHP::SetBannerArtKit(ObjectGuid BannerGuid, uint32 uiArtkit)
{
    // neet to use a player as anchor for the map
    Player* pPlayer = GetPlayerInZone();
    if (!pPlayer)
        return;

    if (GameObject* pBanner = pPlayer->GetMap()->GetGameObject(BannerGuid))
    {
        pBanner->SetGoArtKit(uiArtkit);
        pBanner->Refresh();
    }
}
