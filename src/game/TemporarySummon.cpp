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

TemporarySummon::TemporarySummon( ObjectGuid summoner ) :
Creature(CREATURE_SUBTYPE_TEMPORARY_SUMMON), m_type(TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN), m_timer(0), m_lifetime(0), m_summoner(summoner)
{
}

void TemporarySummon::Update( uint32 update_diff,  uint32 diff )
{
    switch(m_type)
    {
        case TEMPSUMMON_MANUAL_DESPAWN:
            break;
        case TEMPSUMMON_LOST_OWNER_DESPAWN:
        {
            if (!GetSummoner())
            {
                m_type = TEMPSUMMON_TIMED_DESPAWN;
                m_timer = DEFAULT_DESPAWN_DELAY;
            }
            break;
        }
        case TEMPSUMMON_TIMED_DESPAWN:
        {
            if (m_timer <= update_diff)
            {
                UnSummon();
                return;
            }

            m_timer -= update_diff;
            break;
        }
        case TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT:
        {
            if (!isInCombat())
            {
                if (m_timer <= update_diff)
                {
                    UnSummon();
                    return;
                }

                m_timer -= update_diff;
            }
            else if (m_timer != m_lifetime)
                m_timer = m_lifetime;

            break;
        }

        case TEMPSUMMON_CORPSE_TIMED_DESPAWN:
        {
            if (IsCorpse())
            {
                if (m_timer <= update_diff)
                {
                    UnSummon();
                    return;
                }

                m_timer -= update_diff;
            }
            break;
        }
        case TEMPSUMMON_CORPSE_DESPAWN:
        {
            // if m_deathState is DEAD, CORPSE was skipped
            if (isDead())
            {
                UnSummon();
                return;
            }

            break;
        }
        case TEMPSUMMON_DEAD_OR_LOST_UNIQUENESS_DESPAWN:
        {
            if (!IsDespawned())
            {
                std::list<Creature*> tlist;
                MaNGOS::AllIdenticalObjectsInRangeCheck check(this, GetMap()->GetVisibilityDistance());
                MaNGOS::CreatureListSearcher<MaNGOS::AllIdenticalObjectsInRangeCheck> searcher(tlist, check);
                Cell::VisitGridObjects(this, searcher, GetMap()->GetVisibilityDistance(), true);

                for (std::list<Creature*>::const_iterator itr = tlist.begin(); itr != tlist.end(); ++itr)
                {
                    if ((*itr)->isAlive() && 
                        (*itr)->IsTemporarySummon() && 
                        ((TemporarySummon*)*itr)->GetTempSummonType() == GetTempSummonType() &&
                        ((TemporarySummon*)*itr)->GetSummonerGuid() == GetSummonerGuid())
                    {
                        m_type = TEMPSUMMON_MANUAL_DESPAWN;
                        UnSummon();
                        return;
                    }
                }
            }
            // NO break here!
        }
        case TEMPSUMMON_DEAD_DESPAWN:
        {
            if (IsDespawned())
            {
                UnSummon();
                return;
            }
            break;
        }
        case TEMPSUMMON_DEAD_OR_LOST_OWNER_DESPAWN:
        {
            if (IsDespawned())
            {
                UnSummon();
                return;
            }
            if (!GetSummoner())
            {
                m_type = TEMPSUMMON_TIMED_DESPAWN;
                m_timer = DEFAULT_DESPAWN_DELAY;
            }
            break;
        }
        case TEMPSUMMON_TIMED_OR_CORPSE_DESPAWN:
        {
            // if m_deathState is DEAD, CORPSE was skipped
            if (isDead())
            {
                UnSummon();
                return;
            }

            if (m_timer <= update_diff)
            {
                UnSummon();
                return;
            }
            else
                m_timer -= update_diff;
            break;
        }
        case TEMPSUMMON_TIMED_OR_DEAD_OR_LOST_UNIQUENESS_DESPAWN:
        {
            if (!IsDespawned())
            {
                std::list<Creature*> tlist;
                MaNGOS::AllIdenticalObjectsInRangeCheck check(this, GetMap()->GetVisibilityDistance());
                MaNGOS::CreatureListSearcher<MaNGOS::AllIdenticalObjectsInRangeCheck> searcher(tlist, check);
                Cell::VisitGridObjects(this, searcher, GetMap()->GetVisibilityDistance(), true);

                for (std::list<Creature*>::const_iterator itr = tlist.begin(); itr != tlist.end(); ++itr)
                {
                    if ((*itr)->isAlive() && 
                        (*itr)->IsTemporarySummon() && 
                        ((TemporarySummon*)*itr)->GetTempSummonType() == GetTempSummonType() &&
                        ((TemporarySummon*)*itr)->GetSummonerGuid() == GetSummonerGuid())
                    {
                        m_type = TEMPSUMMON_MANUAL_DESPAWN;
                        UnSummon();
                        return;
                    }
                }
            }
            // NO break here!
        }
        case TEMPSUMMON_TIMED_OR_DEAD_DESPAWN:
        {
            // if m_deathState is DEAD, CORPSE was skipped
            if (IsDespawned())
            {
                UnSummon();
                return;
            }

            if (m_timer <= update_diff)
            {
                UnSummon();
                return;
            }
            else
                m_timer -= update_diff;
            break;
        }
        case TEMPSUMMON_TIMED_OR_DEAD_OR_LOST_OWNER_DESPAWN:
        {
            if (IsDespawned())
            {
                UnSummon();
                return;
            }

            if (!GetSummoner() || m_timer <= update_diff)
            {
                UnSummon();
                return;
            }
            else
                m_timer -= update_diff;
            break;
        }
        case TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT_OR_DEAD_DESPAWN:
        {
            if (IsDespawned())
            {
                UnSummon();
                return;
            }

            if (!isInCombat())
            {
                if (m_timer <= update_diff)
                {
                    UnSummon();
                    return;
                }

                m_timer -= update_diff;
            }
            else if (m_timer != m_lifetime)
                m_timer = m_lifetime;

            break;
        }
        default:
            UnSummon();
            sLog.outError("Temporary summoned creature (entry: %u) have unknown type %u of ",GetEntry(),m_type);
            break;
    }

    Creature::Update( update_diff, diff );
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
        m_type = TEMPSUMMON_TIMED_DESPAWN;
        m_timer = delay;
        return;
    }

    CombatStop();

    if (GetSummonerGuid().IsCreatureOrVehicle())
        if(Creature* sum = GetMap()->GetCreature(GetSummonerGuid()))
            if (sum->AI())
                sum->AI()->SummonedCreatureDespawn(this);

    AddObjectToRemoveList();

    // Prevent double unsummonig before remove from world
    m_type = TEMPSUMMON_MANUAL_DESPAWN;
}

void TemporarySummon::SaveToDB()
{
}
