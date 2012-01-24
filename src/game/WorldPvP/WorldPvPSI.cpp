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
#include "WorldPvPSI.h"

WorldPvPSI::WorldPvPSI() : WorldPvP(), m_uiResourcesAly(0), m_uiResourcesHorde(0), m_uiLastControllerTeam(0)
{
    m_uiTypeId = WORLD_PVP_TYPE_SI;
}

// Init outdoor pvp zones
bool WorldPvPSI::InitWorldPvPArea()
{
    RegisterZone(ZONE_ID_SILITHUS);
    RegisterZone(ZONE_ID_GATES_OF_AQ);
    RegisterZone(ZONE_ID_TEMPLE_OF_AQ);
    RegisterZone(ZONE_ID_RUINS_OF_AQ);

    return true;
}

// Send initial world states
void WorldPvPSI::FillInitialWorldStates(WorldPacket& data, uint32& count)
{
    FillInitialWorldState(data, count, WORLD_STATE_SI_GATHERED_A, m_uiResourcesAly);
    FillInitialWorldState(data, count, WORLD_STATE_SI_GATHERED_H, m_uiResourcesHorde);
    FillInitialWorldState(data, count, WORLD_STATE_SI_SILITHYST_MAX, MAX_SILITHYST);
}

// Remove world states
void WorldPvPSI::SendRemoveWorldStates(Player* pPlayer)
{
    pPlayer->SendUpdateWorldState(WORLD_STATE_SI_GATHERED_A, 0);
    pPlayer->SendUpdateWorldState(WORLD_STATE_SI_GATHERED_H, 0);
    pPlayer->SendUpdateWorldState(WORLD_STATE_SI_SILITHYST_MAX, 0);
}

// Update current world states
void WorldPvPSI::UpdateWorldState()
{
    SendUpdateWorldState(WORLD_STATE_SI_GATHERED_A, m_uiResourcesAly);
    SendUpdateWorldState(WORLD_STATE_SI_GATHERED_H, m_uiResourcesHorde);
}

// Handle buffs when player enters the zone
void WorldPvPSI::HandlePlayerEnterZone(Player* pPlayer)
{
    // remove the buff from the player first; Sometimes on relog players still have the aura
    if (pPlayer->HasAura(SPELL_CENARION_FAVOR))
        pPlayer->RemoveAurasDueToSpell(SPELL_CENARION_FAVOR);

    if (pPlayer->GetTeam() == m_uiLastControllerTeam)
        pPlayer->CastSpell(pPlayer, SPELL_CENARION_FAVOR, true);

    WorldPvP::HandlePlayerEnterZone(pPlayer);
}

// Remove buffs when player leaves zone
void WorldPvPSI::HandlePlayerLeaveZone(Player* pPlayer)
{
    // remove buffs
    if (pPlayer->HasAura(SPELL_CENARION_FAVOR))
        pPlayer->RemoveAurasDueToSpell(SPELL_CENARION_FAVOR);

    WorldPvP::HandlePlayerLeaveZone(pPlayer);
}

// Handle case when player returns a silithyst
bool WorldPvPSI::HandleAreaTrigger(Player* pPlayer, uint32 uiTriggerId)
{
    if (pPlayer->isGameMaster() || pPlayer->isDead())
        return false;

    if (uiTriggerId == AREATRIGGER_SILITHUS_ALY)
    {
        if (pPlayer->GetTeam() == ALLIANCE && pPlayer->HasAura(SPELL_SILITHYST))
        {
            // remove aura
            pPlayer->RemoveAurasDueToSpell(SPELL_SILITHYST);

            ++m_uiResourcesAly;
            if (m_uiResourcesAly == MAX_SILITHYST)
            {
                // apply buff to controler faction
                DoProcessTeamBuff(ALLIANCE, SPELL_CENARION_FAVOR);

                //send zone text and reset stats
                sWorld.SendZoneText(ZONE_ID_SILITHUS, sObjectMgr.GetMangosStringForDBCLocale(LANG_OPVP_SI_CAPTURE_A));

                m_uiLastControllerTeam = ALLIANCE;
                m_uiResourcesAly = 0;
                m_uiResourcesHorde = 0;
            }

            // update the world states
            UpdateWorldState();

            // reward the player
            pPlayer->CastSpell(pPlayer, SPELL_TRACES_OF_SILITHYST, true);
            pPlayer->RewardHonor(NULL, 1, HONOR_REWARD_SILITHYST);
            pPlayer->GetReputationMgr().ModifyReputation(sFactionStore.LookupEntry(FACTION_CENARION_CIRCLE), REPUTATION_REWARD_SILITHYST);

            // complete quest
            if (pPlayer->GetQuestStatus(QUEST_SCOURING_DESERT_ALY) == QUEST_STATUS_INCOMPLETE)
                pPlayer->KilledMonsterCredit(NPC_SILITHUS_DUST_QUEST_ALY);

            return true;
        }
    }
    else if (uiTriggerId == AREATRIGGER_SILITHUS_HORDE)
    {
        if (pPlayer->GetTeam() == HORDE && pPlayer->HasAura(SPELL_SILITHYST))
        {
            // remove aura
            pPlayer->RemoveAurasDueToSpell(SPELL_SILITHYST);

            ++ m_uiResourcesHorde;
            if (m_uiResourcesHorde == MAX_SILITHYST)
            {
                // apply buff to controler faction
                DoProcessTeamBuff(HORDE, SPELL_CENARION_FAVOR);

                //send zone text and reset stats
                sWorld.SendZoneText(ZONE_ID_SILITHUS, sObjectMgr.GetMangosStringForDBCLocale(LANG_OPVP_SI_CAPTURE_H));
                m_uiLastControllerTeam = HORDE;
                m_uiResourcesAly = 0;
                m_uiResourcesHorde = 0;
            }

            // update world states
            UpdateWorldState();

            // reward the player
            pPlayer->CastSpell(pPlayer, SPELL_TRACES_OF_SILITHYST, true);
            pPlayer->RewardHonor(NULL, 1, HONOR_REWARD_SILITHYST);
            pPlayer->GetReputationMgr().ModifyReputation(sFactionStore.LookupEntry(FACTION_CENARION_CIRCLE), REPUTATION_REWARD_SILITHYST);

            // complete quest
            if (pPlayer->GetQuestStatus(QUEST_SCOURING_DESERT_HORDE) == QUEST_STATUS_INCOMPLETE)
                pPlayer->KilledMonsterCredit(NPC_SILITHUS_DUST_QUEST_HORDE);

            return true;
        }
    }

    return false;
}

// Handle case when player drops flag
bool WorldPvPSI::HandleDropFlag(Player* pPlayer, uint32 uiSpellId)
{
    if (uiSpellId != SPELL_SILITHYST)
        return false;

    // don't drop flag at area trigger
    // we are checking distance from the AT hardcoded coords because it's much faster than checking the area trigger store
    switch (pPlayer->GetTeam())
    {
        case ALLIANCE:
            if (pPlayer->IsWithinDist3d(aSilithusLocs[0].m_fX, aSilithusLocs[0].m_fY, aSilithusLocs[0].m_fZ, 5.0f))
                return false;
            break;
        case HORDE:
            if (pPlayer->IsWithinDist3d(aSilithusLocs[1].m_fX, aSilithusLocs[1].m_fY, aSilithusLocs[1].m_fZ, 5.0f))
                return false;
            break;
    }

    // drop the flag in other case
    pPlayer->CastSpell(pPlayer, SPELL_SILITHYST_FLAG_DROP, true);
    return true;
}

// Handle the case when player picks a silithus mount or geyser
// This needs to be done because the spells used by these objects are missing
bool WorldPvPSI::HandleObjectUse(Player* pPlayer, GameObject* pGo)
{
    if (pGo->GetEntry() == GO_SILITHYST_MOUND || pGo->GetEntry() == GO_SILITHYST_GEYSER)
    {
        pPlayer->CastSpell(pPlayer, SPELL_SILITHYST, true);
        return true;
    }

    return false;
}
