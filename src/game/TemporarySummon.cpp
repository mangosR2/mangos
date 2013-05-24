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

#include "TemporarySummon.h"
#include "Log.h"
#include "CreatureAI.h"
#include "CellImpl.h"
#include "GridNotifiersImpl.h"
#include "GridNotifiers.h"

TemporarySummon::TemporarySummon(ObjectGuid summoner) :
    Creature(CREATURE_SUBTYPE_TEMPORARY_SUMMON), m_type(TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN),
    m_timer(0), m_lifetime(0), m_summoner(summoner), m_isActive(true)
{
}

void TemporarySummon::Update(uint32 update_diff, uint32 diff)
{
    TSUpdateActions ua = TSUA_NONE;

    switch (m_type)
    {
        case TEMPSUMMON_MANUAL_DESPAWN:
            break;
        case TEMPSUMMON_DEAD_DESPAWN:
        {
            if (IsDespawned())
                ua = TSUA_UNSUMMON;
            break;
        }
        case TEMPSUMMON_CORPSE_DESPAWN:
        {
            // if m_deathState is DEAD, CORPSE was skipped
            if (isDead())
                ua = TSUA_UNSUMMON;
            break;
        }
        case TEMPSUMMON_CORPSE_TIMED_DESPAWN:
        {
            if (IsDespawned())
                ua = TSUA_UNSUMMON;
            else if (IsCorpse())
                ua = TSUA_CHECK_TIMER;
            break;
        }
        case TEMPSUMMON_TIMED_DESPAWN:
        {
            ua = TSUA_CHECK_TIMER;
            break;
        }
        case TEMPSUMMON_TIMED_OOC_DESPAWN:
        {
            ua = isInCombat() ? TSUA_RESET_TIMER : TSUA_CHECK_TIMER;
            break;
        }
        case TEMPSUMMON_TIMED_OR_DEAD_DESPAWN:
        {
            ua = IsDespawned() ? TSUA_UNSUMMON : TSUA_CHECK_TIMER;
            break;
        }
        case TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN:
        {
            // if m_deathState is DEAD, CORPSE was skipped
            ua = isDead() ? TSUA_UNSUMMON : TSUA_CHECK_TIMER;
            break;
        }
        case TEMPSUMMON_TIMED_OOC_OR_DEAD_DESPAWN:
        {
            if (IsDespawned())
                ua = TSUA_UNSUMMON;
            else
                ua = (!isInCombat() && isAlive()) ? TSUA_CHECK_TIMER : TSUA_RESET_TIMER;
            break;
        }
        case TEMPSUMMON_TIMED_OOC_OR_CORPSE_DESPAWN:
        {
            if (isDead())
                ua = TSUA_UNSUMMON;
            else
                ua = isInCombat() ? TSUA_RESET_TIMER : TSUA_CHECK_TIMER;
            break;
        }
        case TEMPSUMMON_LOST_OWNER_DESPAWN:
        case TEMPSUMMON_DEAD_OR_LOST_OWNER_DESPAWN:
        {
            if (m_type == TEMPSUMMON_DEAD_OR_LOST_OWNER_DESPAWN && IsDespawned())
                ua = TSUA_UNSUMMON;
            else if (!GetSummoner())
            {
                m_type = TEMPSUMMON_TIMED_DESPAWN;
                m_lifetime = DEFAULT_DESPAWN_DELAY;
                ua = TSUA_RESET_TIMER;
            }
            break;
        }
        case TEMPSUMMON_TIMED_OR_DEAD_OR_LOST_OWNER_DESPAWN:
        {
            ua = (IsDespawned() || !GetSummoner()) ? TSUA_UNSUMMON : TSUA_CHECK_TIMER;
            break;
        }
        case TEMPSUMMON_TIMED_OR_DEAD_OR_LOST_UNIQUENESS_DESPAWN:
        {
            ua = IsDespawned() ? TSUA_UNSUMMON : TSUpdateActions(TSUA_CHECK_UNIQUENESS | TSUA_CHECK_TIMER);
            break;
        }
        case TEMPSUMMON_DEAD_OR_LOST_UNIQUENESS_DESPAWN:
        {
            ua = IsDespawned() ? TSUA_UNSUMMON : TSUA_CHECK_UNIQUENESS;
            break;
        }
        default:
            ua = TSUA_UNSUMMON;
            sLog.outError("Temporary summoned %s have unknown type %u of", GetGuidStr().c_str(), m_type);
            break;
    }

    if (ua & TSUA_RESET_TIMER)
    {
        if (m_timer != m_lifetime)
            m_timer = m_lifetime;
    }
    else if (ua & TSUA_CHECK_TIMER)
    {
        if (m_timer <= update_diff)
            ua = TSUA_UNSUMMON;
        else
            m_timer -= update_diff;
    }

    if (ua & TSUA_CHECK_UNIQUENESS)
    {
        std::list<Creature*> tlist;
        MaNGOS::AllIdenticalObjectsInRangeCheck check(this, GetMap()->GetVisibilityDistance());
        MaNGOS::CreatureListSearcher<MaNGOS::AllIdenticalObjectsInRangeCheck> searcher(tlist, check);
        Cell::VisitGridObjects(this, searcher, GetMap()->GetVisibilityDistance(), true);

        for (std::list<Creature*>::const_iterator itr = tlist.begin(); itr != tlist.end(); ++itr)
        {
            Creature* pCre = *itr;
            if (!pCre || !pCre->isAlive() || !pCre->IsTemporarySummon())
                continue;

            if (((TemporarySummon*)pCre)->GetTempSummonType() == GetTempSummonType() &&
                ((TemporarySummon*)pCre)->GetSummonerGuid() == GetSummonerGuid())
            {
                ua = TSUA_UNSUMMON;
                break;
            }
        }
    }

    if (ua & TSUA_UNSUMMON)
    {
        UnSummon();
        return;
    }

    if (!m_isActive)
        return;

    Creature::Update(update_diff, diff);
}

void TemporarySummon::Summon(TempSummonType type, uint32 lifetime)
{
    m_type = type;
    m_timer = lifetime;
    m_lifetime = lifetime;

    AIM_Initialize();
    GetMap()->Add((Creature*)this);
}

void TemporarySummon::UnSummon(uint32 delay)
{
    if (delay > 0)
    {
        m_type = TEMPSUMMON_TIMED_OR_DEAD_DESPAWN;
        m_timer = delay;
        return;
    }

    m_isActive = false;

    CombatStop();

    if (GetSummonerGuid().IsCreatureOrVehicle())
    {
        if (Creature* sum = GetMap()->GetCreature(GetSummonerGuid()))
        {
            if (sum->AI())
                sum->AI()->SummonedCreatureDespawn(this);
        }
    }

    KillAllEvents(false);

    AddObjectToRemoveList();

    // Prevent double unsummonig before remove from world
    m_type = TEMPSUMMON_MANUAL_DESPAWN;
}

void TemporarySummon::SaveToDB()
{
}

bool TemporarySummon::IsDespawned() const
{
    return !m_isActive || getDeathState() == DEAD;
}
