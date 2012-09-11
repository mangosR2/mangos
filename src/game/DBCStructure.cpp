/*
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

#include "Common.h"
#include "DBCStructure.h"
#include "DBCStores.h"
#include "SharedDefines.h"

SpellEffectEntry::SpellEffectEntry(const SpellEntry* spellEntry, SpellEffectIndex i)
{
    Effect                      = spellEntry->Effect[i];
    EffectMultipleValue         = spellEntry->EffectMultipleValue[i];
    EffectApplyAuraName         = spellEntry->EffectApplyAuraName[i];
    EffectAmplitude             = spellEntry->EffectAmplitude[i];
    EffectBasePoints            = spellEntry->EffectBasePoints[i] + int32(1);
    DmgMultiplier               = spellEntry->DmgMultiplier[i];
    EffectChainTarget           = spellEntry->EffectChainTarget[i];
    EffectDieSides              = spellEntry->EffectDieSides[i];
    EffectItemType              = spellEntry->EffectItemType[i];
    EffectMechanic              = spellEntry->EffectMechanic[i];
    EffectMiscValue             = spellEntry->EffectMiscValue[i];
    EffectMiscValueB            = spellEntry->EffectMiscValueB[i];
    EffectPointsPerComboPoint   = spellEntry->EffectPointsPerComboPoint[i];
    EffectRadiusIndex           = spellEntry->EffectRadiusIndex[i];
    EffectRealPointsPerLevel    = spellEntry->EffectRealPointsPerLevel[i];
    EffectSpellClassMask        = spellEntry->GetEffectSpellClassMask(i);
    EffectTriggerSpell          = spellEntry->EffectTriggerSpell[i];
    EffectImplicitTargetA       = spellEntry->EffectImplicitTargetA[i];
    EffectImplicitTargetB       = spellEntry->EffectImplicitTargetB[i];
    EffectSpellId               = spellEntry->Id;
    EffectIndex                 = i;
};

SpellEffectEntry const* SpellEntry::GetSpellEffect(SpellEffectIndex eff) const
{
    return GetSpellEffectEntry(Id, eff);
}
