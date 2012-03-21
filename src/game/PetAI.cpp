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

#include "PetAI.h"
#include "Errors.h"
#include "Pet.h"
#include "Player.h"
#include "DBCStores.h"
#include "Spell.h"
#include "ObjectAccessor.h"
#include "SpellMgr.h"
#include "Creature.h"
#include "World.h"
#include "Util.h"

int PetAI::Permissible(const Creature *creature)
{
    if( creature->IsPet())
        return PERMIT_BASE_SPECIAL;

    return PERMIT_BASE_NO;
}

PetAI::PetAI(Creature *c) : CreatureAI(c), i_tracker(TIME_INTERVAL_LOOK), inCombat(false)
{
    m_AllySet.clear();
    UpdateAllies();
}

void PetAI::MoveInLineOfSight(Unit *u)
{
    if (m_creature->getVictim())
        return;

    if (m_creature->IsPet() && m_creature->GetCharmInfo()->HasState(CHARM_STATE_ACTION,ACTIONS_DISABLE))
        return;

    if (!m_creature->GetCharmInfo() || !m_creature->GetCharmInfo()->HasState(CHARM_STATE_REACT,REACT_AGGRESSIVE))
        return;

    if (u->isTargetableForAttack() && m_creature->IsHostileTo( u ) &&
        u->isInAccessablePlaceFor(m_creature))
    {
        float attackRadius = m_creature->GetAttackDistance(u);
        if(m_creature->IsWithinDistInMap(u, attackRadius) && m_creature->GetDistanceZ(u) <= CREATURE_Z_ATTACK_RANGE)
        {
            if (!m_creature->hasUnitState(UNIT_STAT_CAN_NOT_REACT) && m_creature->IsWithinLOSInMap(u))
            {
                AttackStart(u);
                u->RemoveSpellsCausingAura(SPELL_AURA_MOD_STEALTH);
            }
        }
    }
}

void PetAI::AttackStart(Unit *u)
{
    if(!u || (m_creature->IsPet() && ((Pet*)m_creature)->getPetType() == MINI_PET))
        return;

    if (!u->isVisibleForOrDetect(m_creature,m_creature,true))
        return;

    if(m_creature->Attack(u,true))
    {
        // TMGs call CreatureRelocation which via MoveInLineOfSight can call this function
        // thus with the following clear the original TMG gets invalidated and crash, doh
        // hope it doesn't start to leak memory without this :-/
        //i_pet->Clear();
        m_creature->GetMotionMaster()->MoveChase(u);
        inCombat = true;
    }
}

void PetAI::EnterEvadeMode()
{
}

bool PetAI::IsVisible(Unit *pl) const
{
    return _isVisible(pl);
}

bool PetAI::_needToStop() const
{
    // This is needed for charmed creatures, as once their target was reset other effects can trigger threat
    if(m_creature->isCharmed() && m_creature->getVictim() == m_creature->GetCharmer())
        return true;

    if(m_creature->getVictim() == m_creature->GetCharmerOrOwner())
        return true;

    if (!m_creature->getVictim()->isVisibleForOrDetect(m_creature, m_creature, false))
        return true;

    return !m_creature->getVictim()->isTargetableForAttack();
}

void PetAI::_stopAttack()
{
    inCombat = false;

    Unit* owner = m_creature->GetCharmerOrOwner();

    if(owner && m_creature->GetCharmInfo() && m_creature->GetCharmInfo()->HasState(CHARM_STATE_COMMAND,COMMAND_FOLLOW))
    {
        m_creature->GetMotionMaster()->MoveFollow(owner,PET_FOLLOW_DIST, m_creature->IsPet() ? ((Pet*)m_creature)->GetPetFollowAngle() : PET_FOLLOW_ANGLE);
    }
    else
    {
        m_creature->GetMotionMaster()->MoveIdle();
    }
    m_creature->AttackStop();
}

void PetAI::UpdateAI(const uint32 diff)
{
    if (!m_creature->isAlive())
        return;

    Unit* owner = m_creature->GetCharmerOrOwner();

    if (m_updateAlliesTimer <= diff)
        // UpdateAllies self set update timer
        UpdateAllies();
    else
        m_updateAlliesTimer -= diff;

    if (inCombat && (!m_creature->getVictim() || (m_creature->IsPet() && m_creature->GetCharmInfo()->HasState(CHARM_STATE_ACTION,ACTIONS_DISABLE))))
        _stopAttack();

    // i_pet.getVictim() can't be used for check in case stop fighting, i_pet.getVictim() clear at Unit death etc.
    if (m_creature->getVictim())
    {
        bool meleeReach = m_creature->CanReachWithMeleeAttack(m_creature->getVictim());

        if (_needToStop())
        {
            DEBUG_FILTER_LOG(LOG_FILTER_AI_AND_MOVEGENSS, "PetAI (guid = %u) is stopping attack.", m_creature->GetGUIDLow());
            _stopAttack();
            return;
        }
        else if (!m_creature->getVictim()->isAlive())        // Stop attack if target dead
        {
            m_creature->InterruptNonMeleeSpells(false);
            _stopAttack();
            return;
        }
        else if (m_creature->IsStopped() || meleeReach)
        {
            // required to be stopped cases
            if (m_creature->IsStopped() && m_creature->IsNonMeleeSpellCasted(false))
            {
                if (m_creature->hasUnitState(UNIT_STAT_FOLLOW_MOVE))
                    m_creature->InterruptNonMeleeSpells(false);
                else
                    return;
            }
            // not required to be stopped case
            else if (DoMeleeAttackIfReady())
            {
                if (!m_creature->getVictim())
                    return;

                //if pet misses its target, it will also be the first in threat list
                m_creature->getVictim()->AddThreat(m_creature);

                if (_needToStop())
                    _stopAttack();
            }
        }
    }
    else if (owner && m_creature->GetCharmInfo())
    {
        if (owner->isInCombat() && !(m_creature->GetCharmInfo()->HasState(CHARM_STATE_REACT,REACT_PASSIVE) || m_creature->GetCharmInfo()->HasState(CHARM_STATE_COMMAND,COMMAND_STAY)))
        {
            AttackStart(owner->getAttackerForHelper());
        }
        else if(m_creature->GetCharmInfo()->HasState(CHARM_STATE_COMMAND,COMMAND_FOLLOW))
        {
            if (!m_creature->hasUnitState(UNIT_STAT_FOLLOW) )
            {
                m_creature->GetMotionMaster()->MoveFollow(owner,PET_FOLLOW_DIST, m_creature->IsPet() ? ((Pet*)m_creature)->GetPetFollowAngle() : PET_FOLLOW_ANGLE);
            }
        }
    }

    // Autocast (casted only in combat or persistent spells in any state)
    if (!m_creature->IsNonMeleeSpellCasted(false) && !m_creature->GetObjectGuid().IsVehicle())
    {
        typedef std::vector<std::pair<ObjectGuid, uint32> > TargetSpellList;
        TargetSpellList targetSpellStore;

        for (uint8 i = 0; i < m_creature->GetPetAutoSpellSize(); ++i)
        {
            uint32 spellID = m_creature->GetPetAutoSpellOnPos(i);
            if (!spellID)
                continue;

            SpellEntry const *spellInfo = sSpellStore.LookupEntry(spellID);
            if (!spellInfo)
                continue;

            if (m_creature->GetCharmInfo() && m_creature->GetCharmInfo()->GetGlobalCooldownMgr().HasGlobalCooldown(spellInfo))
                continue;

            // ignore some combinations of combat state and combat/noncombat spells
            if (!inCombat)
            {
                // ignore attacking spells, and allow only self/around spells
                if (!IsPositiveSpell(spellInfo->Id))
                    continue;

                // non combat spells allowed
                // only pet spells have IsNonCombatSpell and not fit this reqs:
                // Consume Shadows, Lesser Invisibility, so ignore checks for its
                if (!IsNonCombatSpell(spellInfo))
                {
                    // allow only spell without spell cost or with spell cost but not duration limit
                    int32 duration = GetSpellDuration(spellInfo);
                    if ((spellInfo->manaCost || spellInfo->ManaCostPercentage || spellInfo->manaPerSecond) && duration > 0)
                        continue;

                    // allow only spell without cooldown > duration
                    int32 cooldown = GetSpellRecoveryTime(spellInfo);
                    if (cooldown >= 0 && duration >= 0 && cooldown > duration)
                        continue;
                }
            }
            else
            {
                // just ignore non-combat spells
                if (IsNonCombatSpell(spellInfo))
                    continue;
            }

            if (inCombat && m_creature->getVictim() && !m_creature->hasUnitState(UNIT_STAT_FOLLOW) && CanAutoCast(m_creature->getVictim(), spellInfo))
            {
                targetSpellStore.push_back(TargetSpellList::value_type(m_creature->getVictim()->GetObjectGuid(), spellInfo->Id));
                continue;
            }
            else
            {
                for (AllySet::const_iterator tar = m_AllySet.begin(); tar != m_AllySet.end(); ++tar)
                {
                    Unit* Target = m_creature->GetMap()->GetUnit(*tar);

                    //only buff targets that are in combat, unless the spell can only be cast while out of combat
                    if (!Target)
                        continue;

                    if (CanAutoCast(Target, spellInfo))
                    {
                        targetSpellStore.push_back(TargetSpellList::value_type(Target->GetObjectGuid(), spellInfo->Id));
                        break;
                    }
                }
            }
        }

        //found units to cast on to
        if (!targetSpellStore.empty())
        {
            uint32 index = urand(0, targetSpellStore.size() - 1);

            uint32 spellId         = targetSpellStore[index].second;
            ObjectGuid  targetGuid = targetSpellStore[index].first;
            if (Unit* target = m_creature->GetMap()->GetUnit(targetGuid))
            {
                m_creature->DoPetCastSpell(target, spellId);
            }

            targetSpellStore.erase(targetSpellStore.begin() + index);
        }

        targetSpellStore.clear();
    }
}

bool PetAI::_isVisible(Unit *u) const
{
    return m_creature->IsWithinDist(u,sWorld.getConfig(CONFIG_FLOAT_SIGHT_GUARDER))
        && u->isVisibleForOrDetect(m_creature,m_creature,true);
}

void PetAI::UpdateAllies()
{
    Unit* owner = m_creature->GetCharmerOrOwner();
    Group *pGroup = NULL;

    m_updateAlliesTimer = 10*IN_MILLISECONDS;                //update friendly targets every 10 seconds, lesser checks increase performance

    if (!owner)
        return;
    else if (owner->GetTypeId() == TYPEID_PLAYER)
        pGroup = ((Player*)owner)->GetGroup();

    //only pet and owner/not in group->ok
    if (m_AllySet.size() == 2 && !pGroup)
        return;
    //owner is in group; group members filled in already (no raid -> subgroupcount = whole count)
    if (pGroup && !pGroup->isRaidGroup() && m_AllySet.size() == (pGroup->GetMembersCount() + 2))
        return;

    m_AllySet.clear();
    m_AllySet.insert(m_creature->GetObjectGuid());
    if (pGroup)                                             //add group
    {
        for (GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
        {
            Player* target = itr->getSource();
            if (!target || !pGroup->SameSubGroup((Player*)owner, target))
                continue;

            if (target->GetObjectGuid() == owner->GetObjectGuid())
                continue;

            m_AllySet.insert(target->GetObjectGuid());
        }
    }
    else                                                    //remove group
        m_AllySet.insert(owner->GetObjectGuid());
}

void PetAI::AttackedBy(Unit *attacker)
{
    //when attacked, fight back in case 1)no victim already AND 2)not set to passive AND 3)not set to stay, unless can it can reach attacker with melee attack anyway
    if(!m_creature->getVictim() && m_creature->GetCharmInfo() && !m_creature->GetCharmInfo()->HasState(CHARM_STATE_REACT,REACT_PASSIVE) &&
        (!m_creature->GetCharmInfo()->HasState(CHARM_STATE_COMMAND,COMMAND_STAY) || m_creature->CanReachWithMeleeAttack(attacker)))
        AttackStart(attacker);
}

bool PetAI::CanAutoCast(Unit* target, SpellEntry const* spellInfo)
{
    if (!spellInfo || !target)
        return false;

    Spell spell = Spell(m_creature, spellInfo, false);
    return spell.CanAutoCast(target);
}
