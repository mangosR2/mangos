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

/**
   Function that a players to a players set

   @param   player to be added to set
 */
void WorldPvP::HandlePlayerEnterZone(Player* pPlayer)
{
    if (!pPlayer)
        return;

    m_sZonePlayers.insert(pPlayer->GetObjectGuid());
}

/**
   Function that a players to a players set

   @param   player to be removed
 */
void WorldPvP::HandlePlayerLeaveZone(Player* pPlayer)
{
    if (!pPlayer)
        return;

    // remove the world state information from the player
    if (!pPlayer->GetSession()->PlayerLogout())
        SendRemoveWorldStates(pPlayer);

    m_sZonePlayers.erase(pPlayer->GetObjectGuid());

    sLog.outDebug("Player %s left an outdoorpvp zone", pPlayer->GetName());
}

/**
   Function that updates world state for all the players in an outdoor pvp area

   @param   world state it to update
   @param   value which should update the world state
 */
void WorldPvP::SendUpdateWorldState(uint32 uiField, uint32 uiValue)
{
    for (ObjectGuidSet::iterator itr = m_sZonePlayers.begin(); itr != m_sZonePlayers.end(); ++itr)
    {
        Player* pPlayer = sObjectMgr.GetPlayer(*itr);
        if (pPlayer)
            pPlayer->SendUpdateWorldState(uiField, uiValue);
    }
}

/**
   Function that handles the player kill in outdoor pvp

   @param   player which kills another player
   @param   player or unit (pet) which is victim
 */
void WorldPvP::HandlePlayerKill(Player* pKiller, Unit* pVictim)
{
    if (Group* pGroup = pKiller->GetGroup())
    {
        for (GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* pGroupGuy = itr->getSource();

            if (!pGroupGuy)
                continue;

            // skip if too far away
            if (!pGroupGuy->IsAtGroupRewardDistance(pVictim))
                continue;

            // creature kills must be notified, even if not inside objective / not outdoor pvp active
            // player kills only count if active and inside objective
            if (pGroupGuy->IsWorldPvPActive())
                HandlePlayerKillInsideArea(pGroupGuy, pVictim);
        }
    }
    else
    {
        // creature kills must be notified, even if not inside objective / not outdoor pvp active
        if (pKiller && (pKiller->IsWorldPvPActive()))
            HandlePlayerKillInsideArea(pKiller, pVictim);
    }
}

// register this zone as an outdoor pvp script
void WorldPvP::RegisterZone(uint32 uiZoneId)
{
    sWorldPvPMgr.AddZone(uiZoneId, this);
}

// return if has player inside the zone
bool WorldPvP::HasPlayer(Player* pPlayer) const
{
    if (!pPlayer)
        return false;

    return m_sZonePlayers.find(pPlayer->GetObjectGuid()) != m_sZonePlayers.end();
}

// lock a capture point
void WorldPvP::LockCapturePoint(uint32 pointEntry, bool isLocked)
{
     sWorldPvPMgr.SetCapturePointLockState(pointEntry, isLocked);
}

// reset a capture point slider
void WorldPvP::ResetCapturePoint(uint32 pointEntry, float fValue)
{
    sWorldPvPMgr.SetCapturePointSlider(pointEntry, fValue);
}

// apply a team buff for the specific zone
void WorldPvP::DoProcessTeamBuff(Team uiTeam, uint32 uiSpellId, bool bRemove)
{
    for (ObjectGuidSet::iterator itr = m_sZonePlayers.begin(); itr != m_sZonePlayers.end(); ++itr)
    {
        if (!(*itr))
            continue;

        Player* pPlayer = sObjectMgr.GetPlayer(*itr);

        if (!pPlayer)
            continue;

        if (pPlayer->GetTeam() == uiTeam)
        {
            if (!bRemove)
                pPlayer->CastSpell(pPlayer, uiSpellId, true);
            else
            {
                if (pPlayer->HasAura(uiSpellId))
                    pPlayer->RemoveAurasDueToSpell(uiSpellId);
            }
        }
    }
}

/// Get the first found Player* (with requested properties) in the zone. Can return NULL.
Player* WorldPvP::GetPlayerInZone(bool bOnlyAlive /*=false*/, bool bCanBeGamemaster /*=true*/)
{
    for (ObjectGuidSet::iterator itr = m_sZonePlayers.begin(); itr != m_sZonePlayers.end(); ++itr)
    {
        if (!(*itr))
            continue;

        Player* pPlayer = sObjectMgr.GetPlayer(*itr);

        if (!pPlayer)
            continue;

        if ((!bOnlyAlive || pPlayer->isAlive()) && (bCanBeGamemaster || !pPlayer->isGameMaster()))
            return pPlayer;
    }

    return NULL;
}
