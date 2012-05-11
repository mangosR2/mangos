/*
 * Copyright (C) 2005-2010 MaNGOS <http://getmangos.com/>
 * Copyright (C) 2011-2012 /dev/rsa for MangosR2 <http://github.com/MangosR2>
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

#ifndef MANGOS_PETAI_H
#define MANGOS_PETAI_H

#include "CreatureAI.h"
#include "ObjectGuid.h"
#include "Timer.h"

class Creature;
class Spell;

enum PetAIType
{
    PET_AI_PASSIVE,
    PET_AI_MELEE,
    PET_AI_RANGED,
    PET_AI_RANGED_NOAMMO,
    PET_AI_HEALER,
    PET_AI_SLACKER,
    PET_AI_MAX
};

enum PetAutoSpellType
{
    PET_SPELL_PASSIVE,
    PET_SPELL_NONCOMBAT,
    PET_SPELL_BUFF,
    PET_SPELL_DEBUFF,
    PET_SPELL_FREEACTION,
    PET_SPELL_ATTACKSTART,
    PET_SPELL_THREAT,
    PET_SPELL_MELEE,
    PET_SPELL_RANGED,
    PET_SPELL_DEFENCE,
    PET_SPELL_SPECIAL,
    PET_SPELL_HEAL,
    PET_SPELL_MAX
};

class MANGOS_DLL_DECL PetAI : public CreatureAI
{
    public:

        explicit PetAI(Creature *c);

        void Reset();

        void MoveInLineOfSight(Unit *);
        void AttackStart(Unit *);
        void EnterEvadeMode();
        void AttackedBy(Unit*);
        bool IsVisible(Unit *) const;

        void UpdateAI(const uint32);
        static int Permissible(const Creature *);

        bool UpdateAIType();
        void MoveToVictim(Unit* unit);
        bool IsInCombat();

        ObjectGuidSet const& GetAllyGuids() { return m_AllySet; };

    private:
        bool _isVisible(Unit *) const;
        bool _needToStop(void) const;
        void _stopAttack(void);

        void UpdateAllies();
        SpellCastResult CanAutoCast(Unit* target, SpellEntry const* spellInfo);
        uint32 GetSpellType(PetAutoSpellType type);

        TimeTracker i_tracker;
        bool inCombat;

        ObjectGuidSet m_AllySet;
        uint32 m_updateAlliesTimer;

        PetAIType       m_AIType;
        PetAIType       m_savedAIType;
        float           attackDistance;
        uint32          m_attackDistanceRecheckTimer;
        ObjectGuid      m_savedTargetGuid;
        Unit::SpellIdSet      m_spellType[PET_SPELL_MAX]; //Classified autospell storage
};
#endif
