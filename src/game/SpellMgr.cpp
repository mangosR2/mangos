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

#include "SpellMgr.h"
#include "ObjectMgr.h"
#include "SpellAuraDefines.h"
#include "ProgressBar.h"
#include "DBCStores.h"
#include "World.h"
#include "Chat.h"
#include "Spell.h"
#include "BattleGroundMgr.h"
#include "MapManager.h"
#include "Unit.h"

SpellMgr::SpellMgr()
{
}

SpellMgr::~SpellMgr()
{
}

SpellMgr& SpellMgr::Instance()
{
    static SpellMgr spellMgr;
    return spellMgr;
}

int32 GetSpellDuration(SpellEntry const *spellInfo)
{
    if(!spellInfo)
        return 0;
    SpellDurationEntry const *du = sSpellDurationStore.LookupEntry(spellInfo->DurationIndex);
    if(!du)
        return 0;
    return (du->Duration[0] == -1) ? -1 : abs(du->Duration[0]);
}

int32 GetSpellMaxDuration(SpellEntry const *spellInfo)
{
    if(!spellInfo)
        return 0;
    SpellDurationEntry const *du = sSpellDurationStore.LookupEntry(spellInfo->DurationIndex);
    if(!du)
        return 0;
    return (du->Duration[2] == -1) ? -1 : abs(du->Duration[2]);
}

int32 CalculateSpellDuration(SpellEntry const *spellInfo, Unit const* caster)
{
    int32 duration = GetSpellDuration(spellInfo);

    if (duration != -1 && caster)
    {
        int32 maxduration = GetSpellMaxDuration(spellInfo);

        if (duration != maxduration)
            duration += int32((maxduration - duration) * caster->GetComboPoints() / 5);

        if (Player* modOwner = caster->GetSpellModOwner())
        {
            modOwner->ApplySpellMod(spellInfo->Id, SPELLMOD_DURATION, duration);

            duration = modOwner->CalculateSpellDurationWithHaste(spellInfo, duration);

            if (duration < 0)
                duration = 0;

        }
    }

    return duration;
}

uint32 GetSpellCastTime(SpellEntry const* spellInfo, Spell const* spell)
{
    if (spell)
    {
        // some triggered spells have data only usable for client
        if (spell->IsTriggeredSpellWithRedundentData())
            return 0;

        // spell targeted to non-trading trade slot item instant at trade success apply
        if (spell->GetCaster()->GetTypeId()==TYPEID_PLAYER)
            if (TradeData* my_trade = ((Player*)(spell->GetCaster()))->GetTradeData())
                if (Item* nonTrade = my_trade->GetTraderData()->GetItem(TRADE_SLOT_NONTRADED))
                    if (nonTrade == spell->m_targets.getItemTarget())
                        return 0;
    }

    SpellCastTimesEntry const *spellCastTimeEntry = sSpellCastTimesStore.LookupEntry(spellInfo->CastingTimeIndex);

    // not all spells have cast time index and this is all is pasiive abilities
    if (!spellCastTimeEntry)
        return 0;

    int32 castTime = spellCastTimeEntry->CastTime;

    if (spell)
    {
        if (spellInfo->RequiresSpellFocus == 4 && spell->GetCaster()->HasAura(67556))
            castTime /= 2;

        if (Player* modOwner = spell->GetCaster()->GetSpellModOwner())
            modOwner->ApplySpellMod(spellInfo->Id, SPELLMOD_CASTING_TIME, castTime, spell);

        if (!(spellInfo->Attributes & (SPELL_ATTR_ABILITY|SPELL_ATTR_TRADESPELL)))
            castTime = int32(castTime * spell->GetCaster()->GetFloatValue(UNIT_MOD_CAST_SPEED));
        else
        {
            if (spell->IsRangedSpell() && !spell->IsAutoRepeat())
                castTime = int32(castTime * spell->GetCaster()->m_modAttackSpeedPct[RANGED_ATTACK]);
        }
    }

    if (spellInfo->HasAttribute(SPELL_ATTR_RANGED) && (!spell || !spell->IsAutoRepeat()))
        castTime += 500;

    return (castTime > 0) ? uint32(castTime) : 0;
}

uint32 GetSpellCastTimeForBonus( SpellEntry const *spellProto, DamageEffectType damagetype )
{
    uint32 CastingTime = !IsChanneledSpell(spellProto) ? GetSpellCastTime(spellProto) : GetSpellDuration(spellProto);

    if (CastingTime > 7000) CastingTime = 7000;
    if (CastingTime < 1500) CastingTime = 1500;

    if (damagetype == DOT && !IsChanneledSpell(spellProto))
        CastingTime = 3500;

    int32 overTime    = 0;
    uint8 effects     = 0;
    bool DirectDamage = false;
    bool AreaEffect   = false;

    for (uint32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (IsAreaEffectTarget(Targets(spellProto->EffectImplicitTargetA[i])) || IsAreaEffectTarget(Targets(spellProto->EffectImplicitTargetB[i])))
            AreaEffect = true;

    for (uint32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        switch (spellProto->Effect[i])
        {
            case SPELL_EFFECT_SCHOOL_DAMAGE:
            case SPELL_EFFECT_POWER_DRAIN:
            case SPELL_EFFECT_HEALTH_LEECH:
            case SPELL_EFFECT_ENVIRONMENTAL_DAMAGE:
            case SPELL_EFFECT_POWER_BURN:
            case SPELL_EFFECT_HEAL:
                DirectDamage = true;
                break;
            case SPELL_EFFECT_APPLY_AURA:
                switch (spellProto->EffectApplyAuraName[i])
                {
                    case SPELL_AURA_PERIODIC_DAMAGE:
                    case SPELL_AURA_PERIODIC_HEAL:
                    case SPELL_AURA_PERIODIC_LEECH:
                        if ( GetSpellDuration(spellProto) )
                            overTime = GetSpellDuration(spellProto);
                        break;
                    // Penalty for additional effects
                    case SPELL_AURA_DUMMY:
                        ++effects;
                        break;
                    case SPELL_AURA_MOD_DECREASE_SPEED:
                        ++effects;
                        break;
                    case SPELL_AURA_MOD_CONFUSE:
                    case SPELL_AURA_MOD_STUN:
                    case SPELL_AURA_MOD_ROOT:
                        // -10% per effect
                        effects += 2;
                        break;
                    default:
                        break;
                }
                break;
            default:
                break;
        }
    }

    // Combined Spells with Both Over Time and Direct Damage
    if (overTime > 0 && CastingTime > 0 && DirectDamage)
    {
        // mainly for DoTs which are 3500 here otherwise
        uint32 OriginalCastTime = GetSpellCastTime(spellProto);
        if (OriginalCastTime > 7000) OriginalCastTime = 7000;
        if (OriginalCastTime < 1500) OriginalCastTime = 1500;
        // Portion to Over Time
        float PtOT = (overTime / 15000.0f) / ((overTime / 15000.0f) + (OriginalCastTime / 3500.0f));

        if (damagetype == DOT)
            CastingTime = uint32(CastingTime * PtOT);
        else if (PtOT < 1.0f)
            CastingTime  = uint32(CastingTime * (1 - PtOT));
        else
            CastingTime = 0;
    }

    // Area Effect Spells receive only half of bonus
    if (AreaEffect)
        CastingTime /= 2;

    // 50% for damage and healing spells for leech spells from damage bonus and 0% from healing
    for(int j = 0; j < MAX_EFFECT_INDEX; ++j)
    {
        if (spellProto->Effect[j] == SPELL_EFFECT_HEALTH_LEECH ||
            (spellProto->Effect[j] == SPELL_EFFECT_APPLY_AURA && spellProto->EffectApplyAuraName[j] == SPELL_AURA_PERIODIC_LEECH))
        {
            CastingTime /= 2;
            break;
        }
    }

    // -5% of total per any additional effect (multiplicative)
    for (int i = 0; i < effects; ++i)
        CastingTime *= 0.95f;

    return CastingTime;
}

uint16 GetSpellAuraMaxTicks(SpellEntry const* spellInfo)
{
    int32 DotDuration = GetSpellDuration(spellInfo);
    if (DotDuration == 0)
        return 1;

    // 200% limit
    if (DotDuration > 30000)
        DotDuration = 30000;

    for (int j = 0; j < MAX_EFFECT_INDEX; ++j)
    {
        if (spellInfo->Effect[j] == SPELL_EFFECT_APPLY_AURA && (
            spellInfo->EffectApplyAuraName[j] == SPELL_AURA_PERIODIC_DAMAGE ||
            spellInfo->EffectApplyAuraName[j] == SPELL_AURA_PERIODIC_HEAL ||
            spellInfo->EffectApplyAuraName[j] == SPELL_AURA_PERIODIC_LEECH) )
        {
            if (spellInfo->EffectAmplitude[j] != 0)
                return DotDuration / spellInfo->EffectAmplitude[j];
            break;
        }
    }

    return 6;
}

uint16 GetSpellAuraMaxTicks(uint32 spellId)
{
    SpellEntry const* spellInfo = sSpellStore.LookupEntry(spellId);
    if (!spellInfo)
    {
        sLog.outError("GetSpellAuraMaxTicks: Spell %u not exist!", spellId);
        return 1;
    }

    return GetSpellAuraMaxTicks(spellInfo);
}

float CalculateDefaultCoefficient(SpellEntry const *spellProto, DamageEffectType const damagetype)
{
    // Damage over Time spells bonus calculation
    float DotFactor = 1.0f;
    if (damagetype == DOT)
    {
        if (!IsChanneledSpell(spellProto))
            DotFactor = GetSpellDuration(spellProto) / 15000.0f;

        if (uint16 DotTicks = GetSpellAuraMaxTicks(spellProto))
            DotFactor /= DotTicks;
    }

    // Distribute Damage over multiple effects, reduce by AoE
    float coeff = GetSpellCastTimeForBonus(spellProto, damagetype) / 3500.0f;

    return coeff * DotFactor;
}

WeaponAttackType GetWeaponAttackType(SpellEntry const *spellInfo)
{
    if(!spellInfo)
        return BASE_ATTACK;

    switch (spellInfo->DmgClass)
    {
        case SPELL_DAMAGE_CLASS_MELEE:
            if (spellInfo->HasAttribute(SPELL_ATTR_EX3_REQ_OFFHAND))
                return OFF_ATTACK;
            else
                return BASE_ATTACK;
            break;
        case SPELL_DAMAGE_CLASS_RANGED:
            return RANGED_ATTACK;
            break;
        default:
                                                            // Wands
            if (spellInfo->HasAttribute(SPELL_ATTR_EX2_AUTOREPEAT_FLAG))
                return RANGED_ATTACK;
            else
                return BASE_ATTACK;
            break;
    }
}

bool IsPassiveSpell(uint32 spellId)
{
    SpellEntry const *spellInfo = sSpellStore.LookupEntry(spellId);
    if (!spellInfo)
        return false;
    return IsPassiveSpell(spellInfo);
}

bool IsPassiveSpell(SpellEntry const *spellInfo)
{
    return spellInfo->HasAttribute(SPELL_ATTR_PASSIVE);
}

bool IsNoStackAuraDueToAura(uint32 spellId_1, uint32 spellId_2)
{
    SpellEntry const *spellInfo_1 = sSpellStore.LookupEntry(spellId_1);
    SpellEntry const *spellInfo_2 = sSpellStore.LookupEntry(spellId_2);
    if(!spellInfo_1 || !spellInfo_2) return false;
    if (spellInfo_1->Id == spellId_2) return false;

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        for (int32 j = 0; j < MAX_EFFECT_INDEX; ++j)
        {
            if (spellInfo_1->Effect[i] == spellInfo_2->Effect[j]
                && spellInfo_1->EffectApplyAuraName[i] == spellInfo_2->EffectApplyAuraName[j]
                && spellInfo_1->EffectMiscValue[i] == spellInfo_2->EffectMiscValue[j]
                && spellInfo_1->EffectItemType[i] == spellInfo_2->EffectItemType[j]
                && (spellInfo_1->Effect[i] != 0 || spellInfo_1->EffectApplyAuraName[i] != 0 ||
                    spellInfo_1->EffectMiscValue[i] != 0 || spellInfo_1->EffectItemType[i] != 0))
                return true;
        }
    }

    return false;
}

bool IsSpellAffectedBySpellMods(SpellEntry const* spellInfo)
{
    return !(IsPassiveSpell(spellInfo) &&
            !(spellInfo->Attributes & SPELL_ATTR_ABILITY) &&
            spellInfo->AttributesEx3 & SPELL_ATTR_EX3_CAN_PROC_WITH_TRIGGERED
            );
}


int32 CompareAuraRanks(uint32 spellId_1, uint32 spellId_2)
{
    SpellEntry const*spellInfo_1 = sSpellStore.LookupEntry(spellId_1);
    SpellEntry const*spellInfo_2 = sSpellStore.LookupEntry(spellId_2);
    if(!spellInfo_1 || !spellInfo_2) return 0;
    if (spellId_1 == spellId_2) return 0;

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        if (spellInfo_1->Effect[i] != 0 && spellInfo_2->Effect[i] != 0 && spellInfo_1->Effect[i] == spellInfo_2->Effect[i])
        {
            int32 diff = spellInfo_1->EffectBasePoints[i] - spellInfo_2->EffectBasePoints[i];
            if (spellInfo_1->CalculateSimpleValue(SpellEffectIndex(i)) < 0 && spellInfo_2->CalculateSimpleValue(SpellEffectIndex(i)) < 0)
                return -diff;
            else return diff;
        }
    }
    return 0;
}

SpellSpecific GetSpellSpecific(uint32 spellId)
{
    SpellEntry const *spellInfo = sSpellStore.LookupEntry(spellId);
    if(!spellInfo)
        return SPELL_NORMAL;

    switch(spellInfo->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            // Food / Drinks (mostly)
            if (spellInfo->AuraInterruptFlags & AURA_INTERRUPT_FLAG_NOT_SEATED)
            {
                bool food = false;
                bool drink = false;
                for(int i = 0; i < MAX_EFFECT_INDEX; ++i)
                {
                    switch(spellInfo->EffectApplyAuraName[i])
                    {
                        // Food
                        case SPELL_AURA_MOD_REGEN:
                        case SPELL_AURA_OBS_MOD_HEALTH:
                            food = true;
                            break;
                        // Drink
                        case SPELL_AURA_MOD_POWER_REGEN:
                        case SPELL_AURA_OBS_MOD_MANA:
                            drink = true;
                            break;
                        default:
                            break;
                    }
                }

                if (food && drink)
                    return SPELL_FOOD_AND_DRINK;
                else if (food)
                    return SPELL_FOOD;
                else if (drink)
                    return SPELL_DRINK;
            }
            else
            {
                // Well Fed buffs (must be exclusive with Food / Drink replenishment effects, or else Well Fed will cause them to be removed)
                // SpellIcon 2560 is Spell 46687, does not have this flag
                if (spellInfo->HasAttribute(SPELL_ATTR_EX2_FOOD_BUFF) || spellInfo->SpellIconID == 2560)
                    return SPELL_WELL_FED;
                else if (spellInfo->EffectApplyAuraName[EFFECT_INDEX_0] == SPELL_AURA_MOD_STAT && spellInfo->SpellFamilyName == SPELLFAMILY_GENERIC &&
                     spellInfo->SchoolMask & SPELL_SCHOOL_MASK_NATURE && spellInfo->PreventionType == SPELL_PREVENTION_TYPE_SILENCE)
                     return SPELL_SCROLL;
            }
            break;
        }
        case SPELLFAMILY_MAGE:
        {
            // family flags 18(Molten), 25(Frost/Ice), 28(Mage)
            if (spellInfo->SpellFamilyFlags.test<CF_MAGE_MOLTEN_ARMOR1, CF_MAGE_ELEMENTAL_ARMOR, CF_MAGE_MAGE_ARMOR>())
                return SPELL_MAGE_ARMOR;

            if (spellInfo->SpellFamilyFlags.test<CF_MAGE_POLYMORPH>() && spellInfo->EffectApplyAuraName[EFFECT_INDEX_0] == SPELL_AURA_MOD_CONFUSE)
                return SPELL_MAGE_POLYMORPH;

            if (spellInfo->SpellFamilyFlags.test<CF_MAGE_ARCANE_INT>())
                return SPELL_MAGE_INTELLECT;

            break;
        }
        case SPELLFAMILY_WARRIOR:
        {
            if (spellInfo->SpellFamilyFlags.test<CF_WARRIOR_BATTLE_SHOUT, CF_WARRIOR_COMMANDING_SHOUT>())
                return SPELL_POSITIVE_SHOUT;

            break;
        }
        case SPELLFAMILY_WARLOCK:
        {
            // only warlock curses have this
            if (spellInfo->Dispel == DISPEL_CURSE)
                return SPELL_CURSE;

            // Warlock (Demon Armor | Demon Skin | Fel Armor)
            if (spellInfo->SpellFamilyFlags.test<CF_WARLOCK_ARMOR, CF_WARLOCK_FEL_ARMOR, CF_WARLOCK_DEMON_SKIN>())
                return SPELL_WARLOCK_ARMOR;

            // Unstable Affliction | Immolate
            if (spellInfo->SpellFamilyFlags.test<CF_WARLOCK_IMMOLATE, CF_WARLOCK_UNSTABLE_AFFLICTION>())
                return SPELL_UA_IMMOLATE;
            break;
        }
        case SPELLFAMILY_PRIEST:
        {
            // "Well Fed" buff from Blessed Sunfruit, Blessed Sunfruit Juice, Alterac Spring Water
            if (spellInfo->HasAttribute(SPELL_ATTR_CASTABLE_WHILE_SITTING) &&
                (spellInfo->InterruptFlags & SPELL_INTERRUPT_FLAG_AUTOATTACK) &&
                (spellInfo->SpellIconID == 52 || spellInfo->SpellIconID == 79))
                return SPELL_WELL_FED;
            break;
        }
        case SPELLFAMILY_HUNTER:
        {
            // only hunter stings have this
            if (spellInfo->Dispel == DISPEL_POISON)
                return SPELL_STING;

            // only hunter aspects have this
            if (spellInfo->SpellFamilyFlags.test<CF_HUNTER_ASPECT_OF_THE_MONKEY, CF_HUNTER_ASPECT_OF_THE_HAWK, CF_HUNTER_ASPECT_OF_THE_PACK, CF_HUNTER_ASPECT_OF_THE_VIPER, CF_HUNTER_ASPECT_OF_THE_WILD, CF_HUNTER_ASPECT_OF_THE_BEAST, CF_HUNTER_ASPECT_OF_THE_DRAGONHAWK>())
                return SPELL_ASPECT;

            break;
        }
        case SPELLFAMILY_PALADIN:
        {
            if (IsSealSpell(spellInfo))
                return SPELL_SEAL;

            if (spellInfo->SpellFamilyFlags.test<CF_PALADIN_BLESSING_OF_MIGHT, CF_PALADIN_BLESSING_OF_WISDOM, CF_PALADIN_BLESSING_OF_KINGS, CF_PALADIN_MISC_BLESSINGS>())
                return SPELL_BLESSING;

            if (spellInfo->SpellFamilyFlags.test<CF_PALADIN_HAND_OF_FREEDOM, CF_PALADIN_HAND_OF_PROTECTION, CF_PALADIN_HAND_OF_SALVATION1, CF_PALADIN_HAND_OF_SACRIFICE>())
                return SPELL_HAND;

            // skip Heart of the Crusader and Judgements of the Just that have also same spell family mask
            if (spellInfo->SpellFamilyFlags.test<CF_PALADIN_JUDGEMENT_OF_RIGHT, CF_PALADIN_JUDGEMENT_OF_WISDOM_LIGHT, CF_PALADIN_JUDGEMENT_OF_JUSTICE, CF_PALADIN_HEART_OF_THE_CRUSADER, CF_PALADIN_JUDGEMENT_OF_BLOOD_MARTYR>() &&
                (spellInfo->AttributesEx3 & SPELL_ATTR_EX3_UNK9) && !spellInfo->SpellFamilyFlags.test<CF_PALADIN_HEART_OF_THE_CRUSADER,CF_PALADIN_JUDGEMENT_OF_JUST>())
                return SPELL_JUDGEMENT;

            // only paladin auras have this (for palaldin class family)
            if (spellInfo->SpellFamilyFlags.test<CF_PALADIN_AURAS>())
                return SPELL_AURA;

            break;
        }
        case SPELLFAMILY_SHAMAN:
        {
            if (IsElementalShield(spellInfo))
                return SPELL_ELEMENTAL_SHIELD;

            break;
        }

        case SPELLFAMILY_POTION:
            return sSpellMgr.GetSpellElixirSpecific(spellInfo->Id);

        case SPELLFAMILY_DEATHKNIGHT:
            if (spellInfo->Category == 47)
                return SPELL_PRESENCE;
            break;
    }

    // Tracking spells (exclude Well Fed, some other always allowed cases)
    if ((IsSpellHaveAura(spellInfo, SPELL_AURA_TRACK_CREATURES) ||
        IsSpellHaveAura(spellInfo, SPELL_AURA_TRACK_RESOURCES)  ||
        IsSpellHaveAura(spellInfo, SPELL_AURA_TRACK_STEALTHED)) &&
        ((spellInfo->AttributesEx & SPELL_ATTR_EX_UNK17) || (spellInfo->AttributesEx6 & SPELL_ATTR_EX6_CASTABLE_ON_VEHICLE)))
        return SPELL_TRACKER;

    // elixirs can have different families, but potion most ofc.
    if (SpellSpecific sp = sSpellMgr.GetSpellElixirSpecific(spellInfo->Id))
        return sp;

    return SPELL_NORMAL;
}

// target not allow have more one spell specific from same caster
bool IsSingleFromSpellSpecificPerTargetPerCaster(SpellSpecific spellSpec1,SpellSpecific spellSpec2)
{
    switch(spellSpec1)
    {
        case SPELL_BLESSING:
        case SPELL_AURA:
        case SPELL_STING:
        case SPELL_CURSE:
        case SPELL_ASPECT:
        case SPELL_POSITIVE_SHOUT:
        case SPELL_JUDGEMENT:
        case SPELL_HAND:
        case SPELL_UA_IMMOLATE:
            return spellSpec1==spellSpec2;
        default:
            return false;
    }
}

// target not allow have more one ranks from spell from spell specific per target
bool IsSingleFromSpellSpecificSpellRanksPerTarget(SpellSpecific spellSpec1,SpellSpecific spellSpec2)
{
    switch(spellSpec1)
    {
        case SPELL_BLESSING:
        case SPELL_AURA:
        case SPELL_CURSE:
        case SPELL_ASPECT:
        case SPELL_HAND:
            return spellSpec1==spellSpec2;
        default:
            return false;
    }
}

// target not allow have more one spell specific per target from any caster
bool IsSingleFromSpellSpecificPerTarget(SpellSpecific spellSpec1,SpellSpecific spellSpec2)
{
    switch(spellSpec1)
    {
        case SPELL_SEAL:
        case SPELL_TRACKER:
        case SPELL_WARLOCK_ARMOR:
        case SPELL_MAGE_ARMOR:
        case SPELL_ELEMENTAL_SHIELD:
        case SPELL_MAGE_POLYMORPH:
        case SPELL_PRESENCE:
        case SPELL_WELL_FED:
        case SPELL_BLEED_DEBUFF:
        case SPELL_MAGE_INTELLECT:
            return spellSpec1==spellSpec2;
        case SPELL_BATTLE_ELIXIR:
            return spellSpec2==SPELL_BATTLE_ELIXIR
                || spellSpec2==SPELL_FLASK_ELIXIR;
        case SPELL_GUARDIAN_ELIXIR:
            return spellSpec2==SPELL_GUARDIAN_ELIXIR
                || spellSpec2==SPELL_FLASK_ELIXIR;
        case SPELL_FLASK_ELIXIR:
            return spellSpec2==SPELL_BATTLE_ELIXIR
                || spellSpec2==SPELL_GUARDIAN_ELIXIR
                || spellSpec2==SPELL_FLASK_ELIXIR;
        case SPELL_FOOD:
            return spellSpec2==SPELL_FOOD
                || spellSpec2==SPELL_FOOD_AND_DRINK;
        case SPELL_DRINK:
            return spellSpec2==SPELL_DRINK
                || spellSpec2==SPELL_FOOD_AND_DRINK;
        case SPELL_FOOD_AND_DRINK:
            return spellSpec2==SPELL_FOOD
                || spellSpec2==SPELL_DRINK
                || spellSpec2==SPELL_FOOD_AND_DRINK;
        default:
            return false;
    }
}

bool IsPositiveTarget(uint32 targetA, uint32 targetB)
{
    switch(targetA)
    {
        // non-positive targets
        case TARGET_CHAIN_DAMAGE:
        case TARGET_ALL_ENEMY_IN_AREA:
        case TARGET_ALL_ENEMY_IN_AREA_INSTANT:
        case TARGET_IN_FRONT_OF_CASTER:
        case TARGET_ALL_ENEMY_IN_AREA_CHANNELED:
        case TARGET_CURRENT_ENEMY_COORDINATES:
        case TARGET_SINGLE_ENEMY:
        case TARGET_IN_FRONT_OF_CASTER_30:
            return false;
        // positive or dependent
        case TARGET_CASTER_COORDINATES:
            return (targetB == TARGET_ALL_PARTY || targetB == TARGET_ALL_FRIENDLY_UNITS_AROUND_CASTER);
        default:
            break;
    }
    if (targetB)
        return IsPositiveTarget(targetB, 0);
    return true;
}

bool IsExplicitPositiveTarget(uint32 targetA)
{
    // positive targets that in target selection code expect target in m_targers, so not that auto-select target by spell data by m_caster and etc
    switch(targetA)
    {
        case TARGET_SINGLE_FRIEND:
        case TARGET_SINGLE_PARTY:
        case TARGET_CHAIN_HEAL:
        case TARGET_SINGLE_FRIEND_2:
        case TARGET_AREAEFFECT_PARTY_AND_CLASS:
            return true;
        default:
            break;
    }
    return false;
}

bool IsExplicitNegativeTarget(uint32 targetA)
{
    // non-positive targets that in target selection code expect target in m_targers, so not that auto-select target by spell data by m_caster and etc
    switch(targetA)
    {
        case TARGET_CHAIN_DAMAGE:
        case TARGET_CURRENT_ENEMY_COORDINATES:
//        case TARGET_SINGLE_ENEMY: <- Penace is positive!
            return true;
        default:
            break;
    }
    return false;
}

bool IsPositiveEffect(SpellEntry const *spellproto, SpellEffectIndex effIndex)
{
    if (!spellproto)
        return false;

    switch(spellproto->Id)
    {
        case 37675:                                         // Chaos Blast
        case 42786:                                         // Echo Of Ymiron
        case 56266:                                         // Vortex
        case 62470:                                         // Deafening Thunder
        case 63138:                                         // Sara's Fervor (Ulduar - Yogg Saron encounter)
        case 63134:                                         // Sara's Blessing (Ulduar - Yogg Saron encounter)
        case 63355:                                         // Crunch Armor
        case 66271:                                         // Carrying Seaforium (IoC)
        case 66406:                                         // Snobolled! (Trial of the Crusader, Gormok the Impaler encounter)
        case 68377:                                         // Carrying Huge Seaforium (IoC)
        case 71010:                                         // Web Wrap (Icecrown Citadel, trash mob Nerub'ar Broodkeeper)
        case 71265:                                         // Swarming Shadows (Lanathel)
        case 72219:                                         // Gastric Bloat 10 N
        case 72551:                                         // Gastric Bloat 10 H
        case 72552:                                         // Gastric Bloat 25 N
        case 72553:                                         // Gastric Bloat 25 H
        case 72546:                                         // Harvest Soul (Lich King)
        case 57508:                                         // Volazj Insanity Phase 1
        case 57509:                                         // Volazj Insanity Phase 2
        case 57510:                                         // Volazj Insanity Phase 3
        case 57511:                                         // Volazj Insanity Phase 4
        case 57512:                                         // Volazj Insanity Phase 5
        case 55126:                                         // Sladran Snake Trap
        case 39288:                                         // Kargath's Executioner
        case 39289:                                         // Kargath's Executioner
        case 39290:                                         // Kargath's Executioner
        case 66550:                                         // Teleport(BattlegroundIC)
        case 66551:                                         // Teleport(BattlegroundIC)
            return false;
        case 552:                                           // Abolish Disease
        case 12042:                                         // Arcane Power
        case 24732:                                         // Bat Costume
        case 59286:                                         // Opening
        case 43730:                                         // Electrified
        case 47540:                                         // Penance start dummy aura - Rank 1
        case 53005:                                         // Penance start dummy aura - Rank 2
        case 53006:                                         // Penance start dummy aura - Rank 3
        case 53007:                                         // Penance start dummy aura - Rank 4
        case 47747:                                         // Charge Rift (Nexus: Anomalus)
        case 47757:                                         // Penance heal effect trigger - Rank 1
        case 52986:                                         // Penance heal effect trigger - Rank 2
        case 52987:                                         // Penance heal effect trigger - Rank 3
        case 52988:                                         // Penance heal effect trigger - Rank 4
        case 64343:                                         // Impact
        case 64844:                                         // Divine Hymn
        case 64904:                                         // Hymn of Hope
        case 67369:                                         // Grunty Focus
        case 67398:                                         // Zergling Periodic Effect
        case 72771:                                         // Scent of Blood (Saurfang)
            return true;
        default:
            break;
    }

    switch(spellproto->Effect[effIndex])
    {
        case SPELL_EFFECT_DUMMY:
            // some explicitly required dummy effect sets
            switch(spellproto->Id)
            {
                case 28441:                                 // AB Effect 000
                    return false;
                case 48021:                                 // support for quest 12173
                    return true;
                case 49634:                                 // Sergeant's Flare
                case 54530:                                 // Opening
                case 62105:                                 // To'kini's Blowgun
                    return true;
                default:
                    break;
            }
            break;
        // always positive effects (check before target checks that provided non-positive result in some case for positive effects)
        case SPELL_EFFECT_HEAL:
        case SPELL_EFFECT_LEARN_SPELL:
        case SPELL_EFFECT_SKILL_STEP:
        case SPELL_EFFECT_HEAL_PCT:
        case SPELL_EFFECT_ENERGIZE_PCT:
        case SPELL_EFFECT_QUEST_COMPLETE:
            return true;

        case SPELL_EFFECT_SCHOOL_DAMAGE:
        case SPELL_EFFECT_THREAT:
            return false;

        case SPELL_EFFECT_PERSISTENT_AREA_AURA:
            switch(spellproto->Id)
            {
                case 62821:                                 // Toasty Fire (Ulduar Hodir); unclear why this spell has SPELL_ATTR_EX_NEGATIVE
                    return true;
                case 63540:                                 // Paralytic Field (Ulduar Thorim)
                case 62241:
                    return false;
                default:
                    break;
            }
            break;

        // non-positive aura use
        case SPELL_EFFECT_APPLY_AURA:
        case SPELL_EFFECT_APPLY_AREA_AURA_FRIEND:
        {
            switch(spellproto->EffectApplyAuraName[effIndex])
            {
                case SPELL_AURA_PHASE:
                {
                    switch(spellproto->Id)
                    {
                        case 57508:                         // Insanity (Volazj ecounter)
                        case 57509:
                        case 57510:
                        case 57511:
                        case 57512:
                            return false;
                        default:
                            break;
                    }
                    break;
                }
                case SPELL_AURA_DUMMY:
                {
                    // dummy aura can be positive or negative dependent from casted spell
                    switch(spellproto->Id)
                    {
                        case 13139:                         // net-o-matic special effect
                        case 23445:                         // evil twin
                        case 35679:                         // Protectorate Demolitionist
                        case 38637:                         // Nether Exhaustion (red)
                        case 38638:                         // Nether Exhaustion (green)
                        case 38639:                         // Nether Exhaustion (blue)
                        case 11196:                         // Recently Bandaged
                        case 44689:                         // Relay Race Accept Hidden Debuff - DND
                        case 58600:                         // Restricted Flight Area
                            return false;
                        // some spells have unclear target modes for selection, so just make effect positive
                        case 27184:
                        case 27190:
                        case 27191:
                        case 27201:
                        case 27202:
                        case 27203:
                            return true;
                        default:
                            break;
                    }
                }   break;
                case SPELL_AURA_MOD_DAMAGE_DONE:            // dependent from base point sign (negative -> negative)
                case SPELL_AURA_MOD_RESISTANCE:
                case SPELL_AURA_MOD_STAT:
                case SPELL_AURA_MOD_SKILL:
                case SPELL_AURA_MOD_DODGE_PERCENT:
                case SPELL_AURA_MOD_HEALING_PCT:
                case SPELL_AURA_MOD_HEALING_DONE:
                    if (spellproto->CalculateSimpleValue(effIndex) < 0)
                        return false;
                    break;
                case SPELL_AURA_MOD_DAMAGE_TAKEN:           // dependent from bas point sign (positive -> negative)
                    if (spellproto->CalculateSimpleValue(effIndex) < 0)
                        return true;
                    // let check by target modes (for Amplify Magic cases/etc)
                    break;
                case SPELL_AURA_MOD_SPELL_CRIT_CHANCE:
                case SPELL_AURA_MOD_INCREASE_HEALTH_PERCENT:
                case SPELL_AURA_MOD_DAMAGE_PERCENT_DONE:
                    if (spellproto->CalculateSimpleValue(effIndex) > 0)
                        return true;                        // some expected positive spells have SPELL_ATTR_EX_NEGATIVE or unclear target modes
                    break;
                case SPELL_AURA_ADD_TARGET_TRIGGER:
                    return true;
                case SPELL_AURA_PERIODIC_TRIGGER_SPELL:
                    if (spellproto->Id != spellproto->EffectTriggerSpell[effIndex])
                    {
                        uint32 spellTriggeredId = spellproto->EffectTriggerSpell[effIndex];
                        SpellEntry const *spellTriggeredProto = sSpellStore.LookupEntry(spellTriggeredId);

                        if (spellTriggeredProto)
                        {
                            // non-positive targets of main spell return early
                            for(int i = 0; i < MAX_EFFECT_INDEX; ++i)
                            {
                                // if non-positive trigger cast targeted to positive target this main cast is non-positive
                                // this will place this spell auras as debuffs
                                if (spellTriggeredProto->Effect[i] &&
                                    IsPositiveTarget(spellTriggeredProto->EffectImplicitTargetA[i], spellTriggeredProto->EffectImplicitTargetB[i]) &&
                                    !IsPositiveEffect(spellTriggeredProto, SpellEffectIndex(i)))
                                    return false;
                            }
                        }
                    }
                    break;
                case SPELL_AURA_PROC_TRIGGER_SPELL:
                {
                    switch(spellproto->Id) // Impact should be poisitive aura
                    {
                        case 11103:
                        case 12357:
                        case 12358:
                        case 64343:
                            return true;
                        default:
                            break;
                    }
                    // many positive auras have negative triggered spells at damage for example and this not make it negative (it can be canceled for example)
                    break;
                }
                case SPELL_AURA_MOD_STUN:                   //have positive and negative spells, we can't sort its correctly at this moment.
                    if (effIndex == EFFECT_INDEX_0 && spellproto->Effect[EFFECT_INDEX_1] == 0 && spellproto->Effect[EFFECT_INDEX_2] == 0)
                        return false;                       // but all single stun aura spells is negative

                    // Petrification
                    if (spellproto->Id == 17624)
                        return false;
                    break;
                case SPELL_AURA_MOD_PACIFY_SILENCE:
                    switch(spellproto->Id)
                    {
                        case 24740:                         // Wisp Costume
                        case 47585:                         // Dispersion
                            return true;
                        default: break;
                    }
                    return false;
                case SPELL_AURA_MOD_ROOT:
                case SPELL_AURA_MOD_SILENCE:
                case SPELL_AURA_GHOST:
                case SPELL_AURA_PERIODIC_LEECH:
                case SPELL_AURA_MOD_STALKED:
                case SPELL_AURA_PERIODIC_DAMAGE_PERCENT:
                    return false;
                case SPELL_AURA_PERIODIC_DAMAGE:            // used in positive spells also.
                    // part of negative spell if casted at self (prevent cancel)
                    if (spellproto->EffectImplicitTargetA[effIndex] == TARGET_SELF ||
                        spellproto->EffectImplicitTargetA[effIndex] == TARGET_SELF2)
                        return false;
                    break;
                case SPELL_AURA_MOD_DECREASE_SPEED:         // used in positive spells also
                    // part of positive spell if casted at self
                    if ((spellproto->EffectImplicitTargetA[effIndex] == TARGET_SELF ||
                        spellproto->EffectImplicitTargetA[effIndex] == TARGET_SELF2) &&
                        spellproto->SpellFamilyName == SPELLFAMILY_GENERIC)
                        return false;
                    // but not this if this first effect (don't found better check)
                    if (spellproto->HasAttribute(SPELL_ATTR_UNK26) && effIndex == EFFECT_INDEX_0)
                        return false;
                    break;
                case SPELL_AURA_TRANSFORM:
                    // some spells negative
                    switch(spellproto->Id)
                    {
                        case 36897:                         // Transporter Malfunction (race mutation to horde)
                        case 36899:                         // Transporter Malfunction (race mutation to alliance)
                            return false;
                    }
                    break;
                case SPELL_AURA_MOD_SCALE:
                    // some spells negative
                    switch(spellproto->Id)
                    {
                        case 802:                           // Mutate Bug, wrongly negative by target modes
                            return true;
                        case 36900:                         // Soul Split: Evil!
                        case 36901:                         // Soul Split: Good
                        case 36893:                         // Transporter Malfunction (decrease size case)
                        case 36895:                         // Transporter Malfunction (increase size case)
                            return false;
                    }
                    break;
                case SPELL_AURA_MECHANIC_IMMUNITY:
                {
                    // non-positive immunities
                    switch(spellproto->EffectMiscValue[effIndex])
                    {
                        case MECHANIC_BANDAGE:
                        case MECHANIC_SHIELD:
                        case MECHANIC_MOUNT:
                        case MECHANIC_INVULNERABILITY:
                            return false;
                        default:
                            break;
                    }
                }   break;
                case SPELL_AURA_ADD_FLAT_MODIFIER:          // mods
                case SPELL_AURA_ADD_PCT_MODIFIER:
                {
                    // non-positive mods
                    switch(spellproto->EffectMiscValue[effIndex])
                    {
                        case SPELLMOD_COST:                 // dependent from bas point sign (negative -> positive)
                            if (spellproto->Id == 12042)     // Arcane Power workaround
                                break;
                            if (spellproto->CalculateSimpleValue(effIndex) > 0)
                                return false;
                            break;
                        default:
                            break;
                    }
                }   break;
                case SPELL_AURA_FORCE_REACTION:
                {
                    switch (spellproto->Id)
                    {
                        case 42792:                         // Recently Dropped Flag (prevent cancel)
                        case 46221:                         // Animal Blood
                            return false;
                        default:
                            break;
                    }
                    break;
                }
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }

    // non-positive targets
    if(!IsPositiveTarget(spellproto->EffectImplicitTargetA[effIndex],spellproto->EffectImplicitTargetB[effIndex]))
        return false;

    // AttributesEx check
    if (spellproto->HasAttribute(SPELL_ATTR_EX_NEGATIVE))
        return false;

    // ok, positive
    return true;
}

bool IsPositiveSpell(uint32 spellId)
{
    SpellEntry const *spellproto = sSpellStore.LookupEntry(spellId);
    if (!spellproto)
        return false;

    return IsPositiveSpell(spellproto);
}

bool IsPositiveSpell(SpellEntry const *spellproto)
{
    // spells with at least one negative effect are considered negative
    // some self-applied spells have negative effects but in self casting case negative check ignored.
    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (spellproto->Effect[i] && !IsPositiveEffect(spellproto, SpellEffectIndex(i)))
            return false;
    return true;
}

bool IsNonPositiveSpell(uint32 spellId)
{
    SpellEntry const* spellProto = sSpellStore.LookupEntry(spellId);

    if (!spellProto)
        return false;

    return IsNonPositiveSpell(spellProto);
}

bool IsNonPositiveSpell(SpellEntry const* spellProto)
{
    if (!spellProto)
        return false;

    if (spellProto->AttributesEx6 & SPELL_ATTR_EX6_NO_STACK_DEBUFF_MAJOR)
        return true;

    if (IsPositiveSpell(spellProto))
        return false;

    return true;
}

bool IsSingleTargetSpell(SpellEntry const *spellInfo)
{
    // all other single target spells have if it has AttributesEx5
    if (spellInfo->HasAttribute(SPELL_ATTR_EX5_SINGLE_TARGET_SPELL))
        return true;

    // TODO - need found Judgements rule
    switch(GetSpellSpecific(spellInfo->Id))
    {
        case SPELL_JUDGEMENT:
            return true;
        default:
            break;
    }

    // single target triggered spell.
    // Not real client side single target spell, but it' not triggered until prev. aura expired.
    // This is allow store it in single target spells list for caster for spell proc checking
    if (spellInfo->Id==38324)                                // Regeneration (triggered by 38299 (HoTs on Heals))
        return true;

    return false;
}

bool IsSingleTargetSpells(SpellEntry const *spellInfo1, SpellEntry const *spellInfo2)
{
    // TODO - need better check
    // Equal icon and spellfamily
    if ( spellInfo1->SpellFamilyName == spellInfo2->SpellFamilyName &&
        spellInfo1->SpellIconID == spellInfo2->SpellIconID )
        return true;

    // TODO - need found Judgements rule
    SpellSpecific spec1 = GetSpellSpecific(spellInfo1->Id);
    // spell with single target specific types
    switch(spec1)
    {
        case SPELL_JUDGEMENT:
        case SPELL_MAGE_POLYMORPH:
            if (GetSpellSpecific(spellInfo2->Id) == spec1)
                return true;
            break;
        default:
            break;
    }

    return false;
}

SpellCastResult GetErrorAtShapeshiftedCast (SpellEntry const *spellInfo, uint32 form)
{
    // talents that learn spells can have stance requirements that need ignore
    // (this requirement only for client-side stance show in talent description)
    if ( GetTalentSpellCost(spellInfo->Id) > 0 &&
        (spellInfo->Effect[EFFECT_INDEX_0] == SPELL_EFFECT_LEARN_SPELL || spellInfo->Effect[EFFECT_INDEX_1] == SPELL_EFFECT_LEARN_SPELL || spellInfo->Effect[EFFECT_INDEX_2] == SPELL_EFFECT_LEARN_SPELL) )
        return SPELL_CAST_OK;

    uint32 stanceMask = (form ? 1 << (form - 1) : 0);

    if (stanceMask & spellInfo->StancesNot)                 // can explicitly not be casted in this stance
        return SPELL_FAILED_NOT_SHAPESHIFT;

    if (stanceMask & spellInfo->Stances)                    // can explicitly be casted in this stance
        return SPELL_CAST_OK;

    bool actAsShifted = false;
    if (form > 0)
    {
        SpellShapeshiftFormEntry const *shapeInfo = sSpellShapeshiftFormStore.LookupEntry(form);
        if (!shapeInfo)
        {
            sLog.outError("GetErrorAtShapeshiftedCast: unknown shapeshift %u", form);
            return SPELL_CAST_OK;
        }
        actAsShifted = !(shapeInfo->flags1 & 1);            // shapeshift acts as normal form for spells
    }

    if (actAsShifted)
    {
        if (spellInfo->Attributes & SPELL_ATTR_NOT_SHAPESHIFT) // not while shapeshifted
        {
            //but we must allow cast of Berserk+modifier from any form... where for the hell should we do it?
            if (!(spellInfo->SpellIconID == 1680 && (spellInfo->AttributesEx & 0x8000)))
                return SPELL_FAILED_NOT_SHAPESHIFT;
        }
        else if (spellInfo->Stances != 0)                   // needs other shapeshift
            return SPELL_FAILED_ONLY_SHAPESHIFT;
    }
    else
    {
        // needs shapeshift
        if(!spellInfo->HasAttribute(SPELL_ATTR_EX2_NOT_NEED_SHAPESHIFT) && spellInfo->Stances != 0)
            return SPELL_FAILED_ONLY_SHAPESHIFT;
    }

    return SPELL_CAST_OK;
}

void SpellMgr::LoadSpellTargetPositions()
{
    mSpellTargetPositions.clear();                                // need for reload case

    uint32 count = 0;

    //                                                0   1           2                  3                  4                  5
    QueryResult *result = WorldDatabase.Query("SELECT id, target_map, target_position_x, target_position_y, target_position_z, target_orientation FROM spell_target_position");
    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u spell target destination coordinates", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 Spell_ID = fields[0].GetUInt32();

        SpellTargetPosition st;

        st.target_mapId       = fields[1].GetUInt32();
        st.target_X           = fields[2].GetFloat();
        st.target_Y           = fields[3].GetFloat();
        st.target_Z           = fields[4].GetFloat();
        st.target_Orientation = fields[5].GetFloat();

        MapEntry const* mapEntry = sMapStore.LookupEntry(st.target_mapId);
        if (!mapEntry)
        {
            sLog.outErrorDb("Spell (ID:%u) target map (ID: %u) does not exist in `Map.dbc`.",Spell_ID,st.target_mapId);
            continue;
        }

        if (st.target_X==0 && st.target_Y==0 && st.target_Z==0)
        {
            sLog.outErrorDb("Spell (ID:%u) target coordinates not provided.",Spell_ID);
            continue;
        }

        SpellEntry const* spellInfo = sSpellStore.LookupEntry(Spell_ID);
        if (!spellInfo)
        {
            sLog.outErrorDb("Spell (ID:%u) listed in `spell_target_position` does not exist.",Spell_ID);
            continue;
        }

        bool found = false;
        for(int i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (spellInfo->EffectImplicitTargetA[i] == TARGET_TABLE_X_Y_Z_COORDINATES || spellInfo->EffectImplicitTargetB[i] == TARGET_TABLE_X_Y_Z_COORDINATES ||
                spellInfo->EffectImplicitTargetB[i] == TARGET_SELF2)
            {
                // additional requirements
                if (spellInfo->Effect[i]==SPELL_EFFECT_BIND && spellInfo->EffectMiscValue[i])
                {
                    uint32 zone_id = sTerrainMgr.GetAreaId(st.target_mapId, st.target_X, st.target_Y, st.target_Z);
                    if (int32(zone_id) != spellInfo->EffectMiscValue[i])
                    {
                        sLog.outErrorDb("Spell (Id: %u) listed in `spell_target_position` expected point to zone %u bit point to zone %u.",Spell_ID, spellInfo->EffectMiscValue[i], zone_id);
                        break;
                    }
                }

                found = true;
                break;
            }
        }
        if (!found)
        {
            sLog.outErrorDb("Spell (Id: %u) listed in `spell_target_position` does not have target TARGET_TABLE_X_Y_Z_COORDINATES (17).",Spell_ID);
            continue;
        }

        mSpellTargetPositions[Spell_ID] = st;
        ++count;

    } while( result->NextRow() );

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u spell target destination coordinates", count);
}

template <typename EntryType, typename WorkerType, typename StorageType>
struct SpellRankHelper
{
    SpellRankHelper(SpellMgr &_mgr, StorageType &_storage): mgr(_mgr), worker(_storage), customRank(0) {}
    void RecordRank(EntryType &entry, uint32 spell_id)
    {
        const SpellEntry *spell = sSpellStore.LookupEntry(spell_id);
        if (!spell)
        {
            sLog.outErrorDb("Spell %u listed in `%s` does not exist", spell_id, worker.TableName());
            return;
        }

        uint32 first_id = mgr.GetFirstSpellInChain(spell_id);

        // most spell ranks expected same data
        if (first_id)
        {
            firstRankSpells.insert(first_id);

            if (first_id != spell_id)
            {
                if (!worker.IsValidCustomRank(entry, spell_id, first_id))
                    return;
                // for later check that first rank also added
                else
                {
                    firstRankSpellsWithCustomRanks.insert(first_id);
                    ++customRank;
                }
            }
        }

        worker.AddEntry(entry, spell);
    }
    void FillHigherRanks()
    {
        // check that first rank added for custom ranks
        for (std::set<uint32>::const_iterator itr = firstRankSpellsWithCustomRanks.begin(); itr != firstRankSpellsWithCustomRanks.end(); ++itr)
            if (!worker.HasEntry(*itr))
                sLog.outErrorDb("Spell %u must be listed in `%s` as first rank for listed custom ranks of spell but not found!", *itr, worker.TableName());

        // fill absent non first ranks data base at first rank data
        for (std::set<uint32>::const_iterator itr = firstRankSpells.begin(); itr != firstRankSpells.end(); ++itr)
        {
            if (worker.SetStateToEntry(*itr))
                mgr.doForHighRanks(*itr, worker);
        }
    }
    std::set<uint32> firstRankSpells;
    std::set<uint32> firstRankSpellsWithCustomRanks;

    SpellMgr &mgr;
    WorkerType worker;
    uint32 customRank;
};

struct DoSpellProcEvent
{
    DoSpellProcEvent(SpellProcEventMap& _spe_map) : spe_map(_spe_map), customProc(0), count(0) {}
    void operator() (uint32 spell_id)
    {
        SpellProcEventEntry const& spe = state->second;
        // add ranks only for not filled data (some ranks have ppm data different for ranks for example)
        SpellProcEventMap::const_iterator spellItr = spe_map.find(spell_id);
        if (spellItr == spe_map.end())
            spe_map[spell_id] = spe;
        // if custom rank data added then it must be same except ppm
        else
        {
            SpellProcEventEntry const& r_spe = spellItr->second;
            if (spe.schoolMask != r_spe.schoolMask)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` as custom rank have different schoolMask from first rank in chain", spell_id);

            if (spe.spellFamilyName != r_spe.spellFamilyName)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` as custom rank have different spellFamilyName from first rank in chain", spell_id);

            for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
            {
                if (spe.spellFamilyMask[i] != r_spe.spellFamilyMask[i])
                {
                    sLog.outErrorDb("Spell %u listed in `spell_proc_event` as custom rank have different spellFamilyMask/spellFamilyMask2 from first rank in chain", spell_id);
                    break;
                }
            }

            if (spe.procFlags != r_spe.procFlags)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` as custom rank have different procFlags from first rank in chain", spell_id);

            if (spe.procEx != r_spe.procEx)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` as custom rank have different procEx from first rank in chain", spell_id);

            // only ppm allowed has been different from first rank

            if (spe.customChance != r_spe.customChance)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` as custom rank have different customChance from first rank in chain", spell_id);

            if (spe.cooldown != r_spe.cooldown)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` as custom rank have different cooldown from first rank in chain", spell_id);
        }
    }

    const char* TableName() { return "spell_proc_event"; }
    bool IsValidCustomRank(SpellProcEventEntry const &spe, uint32 entry, uint32 first_id)
    {
        // let have independent data in table for spells with ppm rates (exist rank dependent ppm rate spells)
        if (!spe.ppmRate)
        {
            sLog.outErrorDb("Spell %u listed in `spell_proc_event` is not first rank (%u) in chain", entry, first_id);
            // prevent loading since it won't have an effect anyway
            return false;
        }
        return true;
    }
    void AddEntry(SpellProcEventEntry const &spe, SpellEntry const *spell)
    {
        spe_map[spell->Id] = spe;

        bool isCustom = false;

        if (spe.procFlags == 0)
        {
            if (spell->procFlags==0)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` probally not triggered spell (no proc flags)", spell->Id);
        }
        else
        {
            if (spell->procFlags==spe.procFlags)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` has exactly same proc flags as in spell.dbc, field value redundant", spell->Id);
            else
                isCustom = true;
        }

        if (spe.customChance == 0)
        {
            /* enable for re-check cases, 0 chance ok for some cases because in some cases it set by another spell/talent spellmod)
            if (spell->procChance==0 && !spe.ppmRate)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` probally not triggered spell (no chance or ppm)", spell->Id);
            */
        }
        else
        {
            if (spell->procChance==spe.customChance)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` has exactly same custom chance as in spell.dbc, field value redundant", spell->Id);
            else
                isCustom = true;
        }

        // totally redundant record
        if (!spe.schoolMask && !spe.procFlags &&
            !spe.procEx && !spe.ppmRate && !spe.customChance && !spe.cooldown)
        {
            bool empty = !spe.spellFamilyName ? true : false;
            for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
            {
                if (spe.spellFamilyMask[i])
                {
                    empty = false;
                    ClassFamilyMask const& mask = spell->GetEffectSpellClassMask(SpellEffectIndex(i));
                    if (mask == spe.spellFamilyMask[i])
                        sLog.outErrorDb("Spell %u listed in `spell_proc_event` has same class mask as in Spell.dbc (EffectIndex %u) and doesn't have any other data", spell->Id, i);
                }
            }
            if (empty)
                sLog.outErrorDb("Spell %u listed in `spell_proc_event` doesn't have any useful data", spell->Id);
        }

        if (isCustom)
            ++customProc;
        else
            ++count;
    }

    bool HasEntry(uint32 spellId) { return spe_map.count(spellId) > 0; }
    bool SetStateToEntry(uint32 spellId) { return (state = spe_map.find(spellId)) != spe_map.end(); }
    SpellProcEventMap& spe_map;
    SpellProcEventMap::const_iterator state;

    uint32 customProc;
    uint32 count;
};

void SpellMgr::LoadSpellProcEvents()
{
    mSpellProcEventMap.clear();                             // need for reload case

    //                                                0      1           2                3                  4                  5                  6                  7                  8                  9                  10                 11                 12         13      14       15            16
    QueryResult *result = WorldDatabase.Query("SELECT entry, SchoolMask, SpellFamilyName, SpellFamilyMaskA0, SpellFamilyMaskA1, SpellFamilyMaskA2, SpellFamilyMaskB0, SpellFamilyMaskB1, SpellFamilyMaskB2, SpellFamilyMaskC0, SpellFamilyMaskC1, SpellFamilyMaskC2, procFlags, procEx, ppmRate, CustomChance, Cooldown FROM spell_proc_event");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> No spell proc event conditions loaded");
        return;
    }

    SpellRankHelper<SpellProcEventEntry, DoSpellProcEvent, SpellProcEventMap> rankHelper(*this, mSpellProcEventMap);

    BarGoLink bar(result->GetRowCount());
    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 entry = fields[0].GetUInt32();

        SpellProcEventEntry spe;

        spe.schoolMask      = fields[1].GetUInt32();
        spe.spellFamilyName = fields[2].GetUInt32();

        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            spe.spellFamilyMask[i] = ClassFamilyMask(
                fields[i+3].GetUInt32(),
                fields[i+6].GetUInt32(),
                fields[i+9].GetUInt32());
        }
        spe.procFlags       = fields[12].GetUInt32();
        spe.procEx          = fields[13].GetUInt32();
        spe.ppmRate         = fields[14].GetFloat();
        spe.customChance    = fields[15].GetFloat();
        spe.cooldown        = fields[16].GetUInt32();

        rankHelper.RecordRank(spe, entry);

    } while (result->NextRow());

    rankHelper.FillHigherRanks();

    delete result;

    sLog.outString();
    sLog.outString( ">> Loaded %u extra spell proc event conditions +%u custom proc (inc. +%u custom ranks)",  rankHelper.worker.count, rankHelper.worker.customProc, rankHelper.customRank);
}

struct DoSpellProcItemEnchant
{
    DoSpellProcItemEnchant(SpellProcItemEnchantMap& _procMap, float _ppm) : procMap(_procMap), ppm(_ppm) {}
    void operator() (uint32 spell_id) { procMap[spell_id] = ppm; }

    SpellProcItemEnchantMap& procMap;
    float ppm;
};

void SpellMgr::LoadSpellProcItemEnchant()
{
    mSpellProcItemEnchantMap.clear();                       // need for reload case

    uint32 count = 0;

    //                                                0      1
    QueryResult *result = WorldDatabase.Query("SELECT entry, ppmRate FROM spell_proc_item_enchant");
    if (!result)
    {

        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u proc item enchant definitions", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 entry = fields[0].GetUInt32();
        float ppmRate = fields[1].GetFloat();

        SpellEntry const* spellInfo = sSpellStore.LookupEntry(entry);

        if (!spellInfo)
        {
            sLog.outErrorDb("Spell %u listed in `spell_proc_item_enchant` does not exist", entry);
            continue;
        }

        uint32 first_id = GetFirstSpellInChain(entry);

        if ( first_id != entry )
        {
            sLog.outErrorDb("Spell %u listed in `spell_proc_item_enchant` is not first rank (%u) in chain", entry, first_id);
            // prevent loading since it won't have an effect anyway
            continue;
        }

        mSpellProcItemEnchantMap[entry] = ppmRate;

        // also add to high ranks
        DoSpellProcItemEnchant worker(mSpellProcItemEnchantMap, ppmRate);
        doForHighRanks(entry, worker);

        ++count;
    } while( result->NextRow() );

    delete result;

    sLog.outString();
    sLog.outString( ">> Loaded %u proc item enchant definitions", count );
}

bool IsCastEndProcModifierAura(SpellEntry const *spellInfo, SpellEffectIndex effecIdx, SpellEntry const *procSpell)
{
    // modifier auras that can proc on cast end
    switch (AuraType(spellInfo->EffectApplyAuraName[effecIdx]))
    {
        case SPELL_AURA_ADD_FLAT_MODIFIER:
        case SPELL_AURA_ADD_PCT_MODIFIER:
        {
            switch (spellInfo->EffectMiscValue[effecIdx])
            {
                case SPELLMOD_RANGE:
                case SPELLMOD_RADIUS:
                case SPELLMOD_NOT_LOSE_CASTING_TIME:
                case SPELLMOD_CASTING_TIME:
                case SPELLMOD_COOLDOWN:
                case SPELLMOD_COST:
                case SPELLMOD_GLOBAL_COOLDOWN:
                    return true;
                default:
                    break;
            }
        }
        case SPELL_AURA_MOD_DAMAGE_PERCENT_DONE:
        {
            for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
                if (IsEffectHandledOnDelayedSpellLaunch(procSpell, SpellEffectIndex(i)))
                    return true;

            return false;
        }
        default:
            return false;
    }
}

struct DoSpellBonuses
{
    DoSpellBonuses(SpellBonusMap& _spellBonusMap, SpellBonusEntry const& _spellBonus) : spellBonusMap(_spellBonusMap), spellBonus(_spellBonus) {}
    void operator() (uint32 spell_id) { spellBonusMap[spell_id] = spellBonus; }

    SpellBonusMap& spellBonusMap;
    SpellBonusEntry const& spellBonus;
};

void SpellMgr::LoadSpellBonuses()
{
    mSpellBonusMap.clear();                             // need for reload case

    // load DBC data EffectCoeffs[] fields
    // NOTE : only direct_damage/dot_damage data, there's no ap_bonus
    for(uint32 entry = 1; entry < sSpellStore.GetNumRows(); ++entry)
    {
        SpellEntry const* spell = sSpellStore.LookupEntry(entry);
        if (spell)
        {
            // skip NPC spells?
            if(spell->SpellFamilyName == SPELLFAMILY_GENERIC)
                continue;

            SpellBonusEntry sbe;
            bool dataAdded = false;

            for(uint8 i = 0; i < MAX_EFFECT_INDEX; ++i)
            {
                if(spell->Effect[i] && spell->EffectCoeffs[i])
                {
                    bool isDotEffect = false;
                    switch(spell->EffectApplyAuraName[i])
                    {
                        case SPELL_AURA_PERIODIC_DAMAGE:
                        case SPELL_AURA_PERIODIC_DAMAGE_PERCENT:
                        case SPELL_AURA_PERIODIC_LEECH:
                        case SPELL_AURA_PERIODIC_HEAL:
                        case SPELL_AURA_OBS_MOD_HEALTH:
                        case SPELL_AURA_PERIODIC_MANA_LEECH:
                        case SPELL_AURA_OBS_MOD_MANA:
                        case SPELL_AURA_POWER_BURN_MANA:
                            isDotEffect = true;
                            break;
                        default:
                            break;
                    }

                    // both spells that should take 100% bonus and melee spells have EffectCoeffs set to 100%
                    // we don't want to load the later
                    // sometimes indexes with no effect set to 100% too
                    if(spell->EffectCoeffs[i] == 1.0f)
                    {
                        // is it the proper check?
                        if((spell->SchoolMask & SPELL_SCHOOL_MASK_MAGIC) == 0)
                            continue;

                        if(spell->Effect[i] != SPELL_EFFECT_SCHOOL_DAMAGE &&
                            spell->Effect[i] != SPELL_EFFECT_HEALTH_LEECH &&
                            (spell->Effect[i] != SPELL_EFFECT_APPLY_AURA || !isDotEffect) &&
                            spell->Effect[i] != SPELL_EFFECT_PERSISTENT_AREA_AURA &&
                            spell->Effect[i] != SPELL_EFFECT_HEAL)
                            continue;
                    }

                    if(!isDotEffect)
                    {
                        sbe.direct_damage = spell->EffectCoeffs[i];
                        sbe.dot_damage = 0.0f;
                    }
                    else
                    {
                        sbe.dot_damage = spell->EffectCoeffs[i];
                        sbe.direct_damage = 0.0f;
                    }

                    // Disable ap_bonus/ap_dot_bonus by default
                    sbe.ap_bonus = 0.0f;
                    sbe.ap_dot_bonus = 0.0f;

                    dataAdded = true;
                }
            }

            if(dataAdded)
                mSpellBonusMap[entry] = sbe;

            // DO not add to other ranks! data vary per rank on some spells
        }
    }

    // Load data from database

    uint32 count = 0;
    //                                                0      1             2          3
    QueryResult *result = WorldDatabase.Query("SELECT entry, direct_bonus, dot_bonus, ap_bonus, ap_dot_bonus FROM spell_bonus_data");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> Loaded %u spell bonus data", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());
    do
    {
        Field *fields = result->Fetch();
        bar.step();
        uint32 entry = fields[0].GetUInt32();

        SpellEntry const* spell = sSpellStore.LookupEntry(entry);
        if (!spell)
        {
            sLog.outErrorDb("Spell %u listed in `spell_bonus_data` does not exist", entry);
            continue;
        }

        uint32 first_id = GetFirstSpellInChain(entry);

        if ( first_id != entry )
        {
            sLog.outErrorDb("Spell %u listed in `spell_bonus_data` is not first rank (%u) in chain", entry, first_id);
            // prevent loading since it won't have an effect anyway
            continue;
        }

        SpellBonusEntry sbe;

        sbe.direct_damage = fields[1].GetFloat();
        sbe.dot_damage    = fields[2].GetFloat();
        sbe.ap_bonus      = fields[3].GetFloat();
        sbe.ap_dot_bonus  = fields[4].GetFloat();

        bool need_dot = false;
        bool need_direct = false;
        uint32 x = 0;                                       // count all, including empty, meaning: not all existing effect is DoTs/HoTs
        for(int i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (!spell->Effect[i])
            {
                ++x;
                continue;
            }

            // DoTs/HoTs
            switch(spell->EffectApplyAuraName[i])
            {
                case SPELL_AURA_PERIODIC_DAMAGE:
                case SPELL_AURA_PERIODIC_DAMAGE_PERCENT:
                case SPELL_AURA_PERIODIC_LEECH:
                case SPELL_AURA_PERIODIC_HEAL:
                case SPELL_AURA_OBS_MOD_HEALTH:
                case SPELL_AURA_PERIODIC_MANA_LEECH:
                case SPELL_AURA_OBS_MOD_MANA:
                case SPELL_AURA_POWER_BURN_MANA:
                    need_dot = true;
                    ++x;
                    break;
                default:
                    break;
            }
        }

        //TODO: maybe add explicit list possible direct damage spell effects...
        if (x < MAX_EFFECT_INDEX)
            need_direct = true;

        // Check if direct_bonus is needed in `spell_bonus_data`
        float direct_calc = 0.0f;
        float direct_diff = 1000.0f;                        // for have big diff if no DB field value
        if (sbe.direct_damage)
        {
            bool isHeal = false;
            for(int i = 0; i < 3; ++i)
            {
                // Heals (Also count Mana Shield and Absorb effects as heals)
                if (spell->Effect[i] == SPELL_EFFECT_HEAL || spell->Effect[i] == SPELL_EFFECT_HEAL_MAX_HEALTH ||
                    (spell->Effect[i] == SPELL_EFFECT_APPLY_AURA && (spell->EffectApplyAuraName[i] == SPELL_AURA_SCHOOL_ABSORB || spell->EffectApplyAuraName[i] == SPELL_AURA_PERIODIC_HEAL)) )
                {
                    isHeal = true;
                    break;
                }
            }
            direct_calc = CalculateDefaultCoefficient(spell, SPELL_DIRECT_DAMAGE) * (isHeal ? 1.88f : 1.0f);
            direct_diff = std::abs(sbe.direct_damage - direct_calc);
        }

        // Check if dot_bonus is needed in `spell_bonus_data`
        float dot_calc = 0.0f;
        float dot_diff = 1000.0f;                           // for have big diff if no DB field value
        if (sbe.dot_damage)
        {
            bool isHeal = false;
            for(int i = 0; i < 3; ++i)
            {
                // Periodic Heals
                if (spell->Effect[i] == SPELL_EFFECT_APPLY_AURA && spell->EffectApplyAuraName[i] == SPELL_AURA_PERIODIC_HEAL)
                {
                    isHeal = true;
                    break;
                }
            }
            dot_calc = CalculateDefaultCoefficient(spell, DOT) * (isHeal ? 1.88f : 1.0f);
            dot_diff = std::abs(sbe.dot_damage - dot_calc);
        }

        if (direct_diff < 0.02f && !need_dot && !sbe.ap_bonus && !sbe.ap_dot_bonus)
            sLog.outErrorDb("`spell_bonus_data` entry for spell %u `direct_bonus` not needed (data from table: %f, calculated %f, difference of %f) and `dot_bonus` also not used",
                entry, sbe.direct_damage, direct_calc, direct_diff);
        else if (direct_diff < 0.02f && dot_diff < 0.02f && !sbe.ap_bonus && !sbe.ap_dot_bonus)
        {
            sLog.outErrorDb("`spell_bonus_data` entry for spell %u `direct_bonus` not needed (data from table: %f, calculated %f, difference of %f) and ",
                entry, sbe.direct_damage, direct_calc, direct_diff);
            sLog.outErrorDb("                                  ... `dot_bonus` not needed (data from table: %f, calculated %f, difference of %f)",
                sbe.dot_damage, dot_calc, dot_diff);
        }
        else if (!need_direct && dot_diff < 0.02f && !sbe.ap_bonus && !sbe.ap_dot_bonus)
            sLog.outErrorDb("`spell_bonus_data` entry for spell %u `dot_bonus` not needed (data from table: %f, calculated %f, difference of %f) and direct also not used",
            entry, sbe.dot_damage, dot_calc, dot_diff);
        else if (!need_direct && sbe.direct_damage)
            sLog.outErrorDb("`spell_bonus_data` entry for spell %u `direct_bonus` not used (spell not have non-periodic affects)", entry);
        else if (!need_dot && sbe.dot_damage)
            sLog.outErrorDb("`spell_bonus_data` entry for spell %u `dot_bonus` not used (spell not have periodic affects)", entry);

        if (!need_direct && sbe.ap_bonus)
            sLog.outErrorDb("`spell_bonus_data` entry for spell %u `ap_bonus` not used (spell not have non-periodic affects)", entry);
        else if (!need_dot && sbe.ap_dot_bonus)
            sLog.outErrorDb("`spell_bonus_data` entry for spell %u `ap_dot_bonus` not used (spell not have periodic affects)", entry);

        mSpellBonusMap[entry] = sbe;

        // also add to high ranks
        DoSpellBonuses worker(mSpellBonusMap, sbe);
        doForHighRanks(entry,worker);

        ++count;

    } while( result->NextRow() );

    delete result;

    sLog.outString();
    sLog.outString( ">> Loaded %u extra spell bonus data",  count);
}

void SpellMgr::LoadSpellLinked()
{
    mSpellLinkedMap.clear();                          // need for reload case
    uint32 count = 0;
    //                                                0      1             2     3
    QueryResult* result = WorldDatabase.Query("SELECT entry, linked_entry, type, effect_mask FROM spell_linked");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> Spell linked definition not loaded - table empty");
        return;
    }

    BarGoLink bar(result->GetRowCount());
    do
    {
        Field *fields = result->Fetch();
        bar.step();
        uint32 entry       = fields[0].GetUInt32();
        uint32 linkedEntry = fields[1].GetUInt32();

        SpellEntry const* spell = sSpellStore.LookupEntry(entry);
        SpellEntry const* spell1 = sSpellStore.LookupEntry(linkedEntry);
        if (!spell || !spell1)
        {
            sLog.outErrorDb("Spells %u or %u listed in `spell_linked` does not exist", entry, linkedEntry);
            continue;
        }

        if (entry == linkedEntry)
        {
            sLog.outErrorDb("Spell %u linked with self!", entry);
            continue;
        }

        uint32 first_id = GetFirstSpellInChain(entry);

        if ( first_id != entry )
        {
            sLog.outErrorDb("Spell %u listed in `spell_linked` is not first rank (%u) in chain", entry, first_id);
        }

        SpellLinkedEntry data;

        data.spellId      = entry;
        data.linkedId     = linkedEntry;
        data.type         = fields[2].GetUInt32();
        data.effectMask   = fields[3].GetUInt32();

        mSpellLinkedMap.insert(SpellLinkedMap::value_type(entry,data));

        ++count;

    }
    while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString( ">> Loaded %u spell linked definitions",  count);
}

SpellLinkedSet SpellMgr::GetSpellLinked(uint32 spell_id, SpellLinkedType type) const
{
    SpellLinkedSet result;

    SpellLinkedMapBounds const& bounds = GetSpellLinkedMapBounds(spell_id);

    if (type < SPELL_LINKED_TYPE_MAX && bounds.first != bounds.second)
    {
        for (SpellLinkedMap::const_iterator itr = bounds.first; itr != bounds.second; ++itr)
        {
            if (itr->second.type == type)
                result.insert(itr->second.linkedId);
        }
    }
    return result;
}

bool SpellMgr::IsSpellProcEventCanTriggeredBy(SpellProcEventEntry const * spellProcEvent, uint32 EventProcFlag, SpellEntry const * procSpell, uint32 procFlags, uint32 procExtra)
{
    // No extra req need
    uint32 procEvent_procEx = PROC_EX_NONE;

    // check prockFlags for condition
    if((procFlags & EventProcFlag) == 0)
        return false;

    // Always trigger for this
    if (EventProcFlag & (PROC_FLAG_KILLED | PROC_FLAG_KILL | PROC_FLAG_ON_TRAP_ACTIVATION | PROC_FLAG_ON_DEATH))
        return true;

    if (spellProcEvent)     // Exist event data
    {
        // Store extra req
        procEvent_procEx = spellProcEvent->procEx;

        // For melee triggers
        if (procSpell == NULL)
        {
            // Check (if set) for school (melee attack have Normal school)
            if (spellProcEvent->schoolMask && (spellProcEvent->schoolMask & SPELL_SCHOOL_MASK_NORMAL) == 0)
                return false;
        }
        else // For spells need check school/spell family/family mask
        {
            // Check (if set) for school
            if (spellProcEvent->schoolMask && (spellProcEvent->schoolMask & procSpell->SchoolMask) == 0)
                return false;

            // Check (if set) for spellFamilyName
            if (spellProcEvent->spellFamilyName && (spellProcEvent->spellFamilyName != procSpell->SpellFamilyName))
                return false;
        }
    }

    // Check for extra req (if none) and hit/crit
    if (procEvent_procEx == PROC_EX_NONE)
    {
        // Don't allow proc from periodic heal if no extra requirement is defined
        if (EventProcFlag & (PROC_FLAG_ON_DO_PERIODIC | PROC_FLAG_ON_TAKE_PERIODIC) && (procExtra & PROC_EX_PERIODIC_POSITIVE))
            return false;

        // No extra req, so can trigger for (damage/healing present) and cast end/hit/crit
        if (procExtra & (PROC_EX_CAST_END|PROC_EX_NORMAL_HIT|PROC_EX_CRITICAL_HIT))
            return true;
    }
    else // all spells hits here only if resist/reflect/immune/evade
    {
        // Exist req for PROC_EX_EX_TRIGGER_ALWAYS
        if (procEvent_procEx & PROC_EX_EX_TRIGGER_ALWAYS)
            return true;
        // Check Extra Requirement like (hit/crit/miss/resist/parry/dodge/block/immune/reflect/absorb and other)
        if (procEvent_procEx & procExtra)
            return true;
    }
    return false;
}

void SpellMgr::LoadSpellElixirs()
{
    mSpellElixirs.clear();                                  // need for reload case

    uint32 count = 0;

    //                                                0      1
    QueryResult *result = WorldDatabase.Query("SELECT entry, mask FROM spell_elixir");
    if (!result)
    {

        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u spell elixir definitions", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 entry = fields[0].GetUInt32();
        uint8 mask = fields[1].GetUInt8();

        SpellEntry const* spellInfo = sSpellStore.LookupEntry(entry);

        if (!spellInfo)
        {
            sLog.outErrorDb("Spell %u listed in `spell_elixir` does not exist", entry);
            continue;
        }

        mSpellElixirs[entry] = mask;

        ++count;
    } while( result->NextRow() );

    delete result;

    sLog.outString();
    sLog.outString( ">> Loaded %u spell elixir definitions", count );
}

struct DoSpellThreat
{
    DoSpellThreat(SpellThreatMap& _threatMap) : threatMap(_threatMap), count(0) {}
    void operator() (uint32 spell_id)
    {
        SpellThreatEntry const &ste = state->second;
        // add ranks only for not filled data (spells adding flat threat are usually different for ranks)
        SpellThreatMap::const_iterator spellItr = threatMap.find(spell_id);
        if (spellItr == threatMap.end())
            threatMap[spell_id] = ste;

        // just assert that entry is not redundant
        else
        {
            SpellThreatEntry const& r_ste = spellItr->second;
            if (ste.threat == r_ste.threat && ste.multiplier == r_ste.multiplier && ste.ap_bonus == r_ste.ap_bonus)
                sLog.outErrorDb("Spell %u listed in `spell_threat` as custom rank has same data as Rank 1, so redundant", spell_id);
        }
    }
    const char* TableName() { return "spell_threat"; }
    bool IsValidCustomRank(SpellThreatEntry const &ste, uint32 entry, uint32 first_id)
    {
        if (!ste.threat)
        {
            sLog.outErrorDb("Spell %u listed in `spell_threat` is not first rank (%u) in chain and has no threat", entry, first_id);
            // prevent loading unexpected data
            return false;
        }
        return true;
    }
    void AddEntry(SpellThreatEntry const &ste, SpellEntry const *spell)
    {
        threatMap[spell->Id] = ste;

        // flat threat bonus and attack power bonus currently only work properly when all
        // effects have same targets, otherwise, we'd need to seperate it by effect index
        if (ste.threat || fabs(ste.ap_bonus) > M_NULL_F)
        {
            const uint32 *targetA = spell->EffectImplicitTargetA;
            //const uint32 *targetB = spell->EffectImplicitTargetB;
            if ((targetA[EFFECT_INDEX_1] && targetA[EFFECT_INDEX_1] != targetA[EFFECT_INDEX_0]) ||
                (targetA[EFFECT_INDEX_2] && targetA[EFFECT_INDEX_2] != targetA[EFFECT_INDEX_0]))
                sLog.outErrorDb("Spell %u listed in `spell_threat` has effects with different targets, threat may be assigned incorrectly", spell->Id);
        }
        ++count;
    }
    bool HasEntry(uint32 spellId) { return threatMap.count(spellId) > 0; }
    bool SetStateToEntry(uint32 spellId) { return (state = threatMap.find(spellId)) != threatMap.end(); }

    SpellThreatMap& threatMap;
    SpellThreatMap::const_iterator state;
    uint32 count;
};

void SpellMgr::LoadSpellThreats()
{
    mSpellThreatMap.clear();                                // need for reload case

    //                                                0      1       2           3
    QueryResult *result = WorldDatabase.Query("SELECT entry, Threat, multiplier, ap_bonus FROM spell_threat");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();
        sLog.outString();
        sLog.outString(">> No spell threat entries loaded.");
        return;
    }

    SpellRankHelper<SpellThreatEntry, DoSpellThreat, SpellThreatMap> rankHelper(*this, mSpellThreatMap);

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 entry = fields[0].GetUInt32();

        SpellThreatEntry ste;
        ste.threat = fields[1].GetUInt16();
        ste.multiplier = fields[2].GetFloat();
        ste.ap_bonus = fields[3].GetFloat();

        rankHelper.RecordRank(ste, entry);

    } while( result->NextRow() );

    rankHelper.FillHigherRanks();

    delete result;

    sLog.outString();
    sLog.outString( ">> Loaded %u spell threat entries", rankHelper.worker.count );
}

bool SpellMgr::IsRankSpellDueToSpell(SpellEntry const *spellInfo_1,uint32 spellId_2) const
{
    SpellEntry const *spellInfo_2 = sSpellStore.LookupEntry(spellId_2);
    if(!spellInfo_1 || !spellInfo_2) return false;
    if (spellInfo_1->Id == spellId_2) return false;

    return GetFirstSpellInChain(spellInfo_1->Id)==GetFirstSpellInChain(spellId_2);
}

bool SpellMgr::canStackSpellRanksInSpellBook(SpellEntry const *spellInfo) const
{
    if (IsPassiveSpell(spellInfo))                          // ranked passive spell
        return false;
    if (spellInfo->powerType != POWER_MANA && spellInfo->powerType != POWER_HEALTH)
        return false;
    if (IsProfessionOrRidingSpell(spellInfo->Id))
        return false;

    if (IsSkillBonusSpell(spellInfo->Id))
        return false;

    // All stance spells. if any better way, change it.
    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        switch(spellInfo->SpellFamilyName)
        {
            case SPELLFAMILY_PALADIN:
                // Paladin aura Spell
                if (spellInfo->Effect[i]==SPELL_EFFECT_APPLY_AREA_AURA_RAID)
                    return false;
                // Seal of Righteousness, 2 version of same rank
                if (spellInfo->SpellFamilyFlags.test<CF_PALADIN_SEAL_OF_JUST_RIGHT>() && spellInfo->SpellIconID == 25)
                    return false;
                break;
            case SPELLFAMILY_DRUID:
                // Druid form Spell
                if (spellInfo->Effect[i]==SPELL_EFFECT_APPLY_AURA &&
                    spellInfo->EffectApplyAuraName[i] == SPELL_AURA_MOD_SHAPESHIFT)
                    return false;
                break;
            case SPELLFAMILY_ROGUE:
                // Rogue Stealth
                if (spellInfo->Effect[i]==SPELL_EFFECT_APPLY_AURA &&
                    spellInfo->EffectApplyAuraName[i] == SPELL_AURA_MOD_SHAPESHIFT)
                    return false;
                break;
        }
    }
    return true;
}

bool SpellMgr::IsNoStackSpellDueToSpell(uint32 spellId_1, uint32 spellId_2) const
{
    SpellEntry const *spellInfo_1 = sSpellStore.LookupEntry(spellId_1);
    SpellEntry const *spellInfo_2 = sSpellStore.LookupEntry(spellId_2);

    if (!spellInfo_1 || !spellInfo_2)
        return false;

    if(spellId_1 == spellId_2)
        return false;

    // Specific spell family spells
    // also some SpellIconID exceptions related to late checks (isModifier)
    switch(spellInfo_1->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            // BG_WS_SPELL_FOCUSED_ASSAULT & BG_WS_SPELL_BRUTAL_ASSAULT
            if ((spellInfo_1->Id == 46392 && spellInfo_2->Id == 46393) ||
                (spellInfo_1->Id == 46393 && spellInfo_2->Id == 46392))
                return true;

            // Dark Essence & Light Essence
            if ((spellInfo_1->Id == 65684 && spellInfo_2->Id == 65686) ||
                (spellInfo_2->Id == 65684 && spellInfo_1->Id == 65686))
                return true;

            //Potent Fungus and Mini must remove each other (Amanitar encounter, Ahn'kahet)
            if ((spellInfo_1->Id == 57055 && spellInfo_2->Id == 56648) ||
                (spellInfo_2->Id == 57055 && spellInfo_1->Id == 56648))
                return true;

            // Mirrored Soul (FoS - Devourer) - and other Boss spells
            if (spellInfo_1->SpellIconID == 3176 && spellInfo_2->SpellIconID == 3176)
                return false;

            // Blessing of Forgotten Kings and (Greater) Blessing of Kings
            if (spellInfo_1->Id == 72586)
            {
                if (spellInfo_2->SpellFamilyFlags.test<CF_PALADIN_BLESSING_OF_KINGS>())
                    return true;
            }

            break;
        }
        case SPELLFAMILY_WARLOCK:
            if (spellInfo_2->SpellFamilyName == SPELLFAMILY_WARLOCK)
            {
                //Corruption & Seed of corruption
                if ((spellInfo_1->SpellIconID == 313 && spellInfo_2->SpellIconID == 1932) ||
                    (spellInfo_2->SpellIconID == 313 && spellInfo_1->SpellIconID == 1932))
                {
                    if(spellInfo_1->SpellVisual[0] != 0 && spellInfo_2->SpellVisual[0] != 0)
                        return true;                        // can't be stacked
                }
            }
            break;
        case SPELLFAMILY_WARRIOR:
            if (spellInfo_2->SpellFamilyName == SPELLFAMILY_WARRIOR)
            {
                // Defensive/Berserker/Battle stance aura can not stack (needed for dummy auras)
                if (spellInfo_1->SpellFamilyFlags.test<CF_WARRIOR_STANCES>() && spellInfo_2->SpellFamilyFlags.test<CF_WARRIOR_STANCES>())
                    return true;
            }
            break;
        case SPELLFAMILY_DRUID:
            if (spellInfo_2->SpellFamilyName == SPELLFAMILY_DRUID)
            {
                // Mark/Gift of the Wild
                if (spellInfo_1->IsFitToFamily<SPELLFAMILY_DRUID, CF_DRUID_MARK_OF_THE_WILD>() &&
                    spellInfo_2->IsFitToFamily<SPELLFAMILY_DRUID, CF_DRUID_MARK_OF_THE_WILD>())
                    return true;
            }
            break;
        case SPELLFAMILY_PALADIN:
            if (spellInfo_2->SpellFamilyName == SPELLFAMILY_PALADIN)
            {
                // Paladin Seals
                if (IsSealSpell(spellInfo_1) && IsSealSpell(spellInfo_2))
                    return true;

                // Repentance removes Righteous Vengeance
                if (spellInfo_1->Id == 20066 && spellInfo_2->Id == 61840)
                    return true;
            }

            // Blessing of Forgotten Kings and (Greater) Blessing of Kings
            if (spellInfo_1->SpellFamilyFlags.test<CF_PALADIN_BLESSING_OF_KINGS>())
            {
                if (spellInfo_2->Id == 72586)
                    return true;
            }

            break;
        case SPELLFAMILY_DEATHKNIGHT:
            if (spellInfo_2->SpellFamilyName == SPELLFAMILY_DEATHKNIGHT)
            {
                // Crypt Fever and Ebon Plague
                if((spellInfo_1->SpellIconID == 264 && spellInfo_2->SpellIconID == 1933) ||
                   (spellInfo_2->SpellIconID == 264 && spellInfo_1->SpellIconID == 1933))
                    return true;
            }
            break;
        case SPELLFAMILY_MAGE:
            if (spellInfo_2->SpellFamilyName == SPELLFAMILY_MAGE)
            {
                // Dampen / Amplify Magic
                if (spellInfo_1->IsFitToFamily<SPELLFAMILY_MAGE, CF_MAGE_D_A_MAGIC>() &&
                    spellInfo_2->IsFitToFamily<SPELLFAMILY_MAGE, CF_MAGE_D_A_MAGIC>())
                    return true;
            }
            break;
        case SPELLFAMILY_PRIEST:
            if (spellInfo_2->SpellFamilyName == SPELLFAMILY_PRIEST)
            {
                // Power Word / Prayer of Fortitude
                if (spellInfo_1->IsFitToFamily<SPELLFAMILY_PRIEST, CF_PRIEST_POWER_WORD_FORTITUDE>() &&
                    spellInfo_2->IsFitToFamily<SPELLFAMILY_PRIEST, CF_PRIEST_POWER_WORD_FORTITUDE>())
                    return true;

                // Shadow Protection / Prayer of Shadow Protection
                if (spellInfo_1->IsFitToFamily<SPELLFAMILY_PRIEST, CF_PRIEST_SHADOW_PROTECTION>() &&
                    spellInfo_2->IsFitToFamily<SPELLFAMILY_PRIEST, CF_PRIEST_SHADOW_PROTECTION>())
                    return true;
            }
            break;
        default:
            break;
    }

    if (IsRankSpellDueToSpell(spellInfo_1, spellId_2))
        return true;

    return false;
}

bool SpellMgr::IsProfessionOrRidingSpell(uint32 spellId)
{
    SpellEntry const *spellInfo = sSpellStore.LookupEntry(spellId);
    if(!spellInfo)
        return false;

    if (spellInfo->Effect[EFFECT_INDEX_1] != SPELL_EFFECT_SKILL)
        return false;

    uint32 skill = spellInfo->EffectMiscValue[EFFECT_INDEX_1];

    return IsProfessionOrRidingSkill(skill);
}

bool SpellMgr::IsProfessionSpell(uint32 spellId)
{
    SpellEntry const *spellInfo = sSpellStore.LookupEntry(spellId);
    if(!spellInfo)
        return false;

    if (spellInfo->Effect[EFFECT_INDEX_1] != SPELL_EFFECT_SKILL)
        return false;

    uint32 skill = spellInfo->EffectMiscValue[EFFECT_INDEX_1];

    return IsProfessionSkill(skill);
}

bool SpellMgr::IsPrimaryProfessionSpell(uint32 spellId)
{
    SpellEntry const *spellInfo = sSpellStore.LookupEntry(spellId);
    if(!spellInfo)
        return false;

    if (spellInfo->Effect[EFFECT_INDEX_1] != SPELL_EFFECT_SKILL)
        return false;

    uint32 skill = spellInfo->EffectMiscValue[EFFECT_INDEX_1];

    return IsPrimaryProfessionSkill(skill);
}

uint32 SpellMgr::GetProfessionSpellMinLevel(uint32 spellId)
{
    uint32 s2l[8][3] =
    {   // 0 - gather 1 - non-gather 2 - fish
        /*0*/ { 0,   5,  5 },
        /*1*/ { 0,   5,  5 },
        /*2*/ { 0,  10, 10 },
        /*3*/ { 10, 20, 10 },
        /*4*/ { 25, 35, 10 },
        /*5*/ { 40, 50, 10 },
        /*6*/ { 55, 65, 10 },
        /*7*/ { 75, 75, 10 },
    };

    uint32 rank = GetSpellRank(spellId);
    if (rank >= 8)
        return 0;

    SkillLineAbilityMapBounds bounds = GetSkillLineAbilityMapBounds(spellId);
    if (bounds.first == bounds.second)
        return 0;

    switch (bounds.first->second->skillId)
    {
        case SKILL_FISHING:
            return s2l[rank][2];
        case SKILL_HERBALISM:
        case SKILL_MINING:
        case SKILL_SKINNING:
            return s2l[rank][0];
        default:
            return s2l[rank][1];
    }
}


bool SpellMgr::IsPrimaryProfessionFirstRankSpell(uint32 spellId) const
{
    return IsPrimaryProfessionSpell(spellId) && GetSpellRank(spellId)==1;
}

bool SpellMgr::IsSkillBonusSpell(uint32 spellId) const
{
    SkillLineAbilityMapBounds bounds = GetSkillLineAbilityMapBounds(spellId);

    for(SkillLineAbilityMap::const_iterator _spell_idx = bounds.first; _spell_idx != bounds.second; ++_spell_idx)
    {
        SkillLineAbilityEntry const *pAbility = _spell_idx->second;
        if (!pAbility || pAbility->learnOnGetSkill != ABILITY_LEARNED_ON_GET_PROFESSION_SKILL)
            continue;

        if (pAbility->req_skill_value > 0)
            return true;
    }

    return false;
}

bool SpellMgr::IsGroupBuff(SpellEntry const *spellInfo)
{
    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        switch(spellInfo->EffectImplicitTargetA[i])
        {
            case TARGET_SINGLE_PARTY:
            case TARGET_ALL_PARTY_AROUND_CASTER:
            case TARGET_ALL_PARTY:
            case TARGET_ALL_PARTY_AROUND_CASTER_2:
            case TARGET_AREAEFFECT_PARTY:
            case TARGET_ALL_RAID_AROUND_CASTER:
            case TARGET_AREAEFFECT_PARTY_AND_CLASS:
                if (IsPositiveEffect(spellInfo, SpellEffectIndex(i)) &&
                    (spellInfo->Effect[i] == SPELL_EFFECT_APPLY_AURA ||
                     spellInfo->Effect[i] == SPELL_EFFECT_APPLY_AREA_AURA_PARTY ||
                     spellInfo->Effect[i] == SPELL_EFFECT_APPLY_AREA_AURA_RAID)
                    )
                {
                    return true;
                }
            default:
                break;
        }
    }

    // some custom cases
    switch (spellInfo->Id)
    {
        case 72590:                             // Fortitude (triggered by AoE spell with ScriptEffect)
            return true;
        default:
            break;
    }

    return false;
}

// is holder stackable from different casters
bool SpellMgr::IsStackableSpellAuraHolder(SpellEntry const* spellInfo)
{
    if (spellInfo->AttributesEx3 & SPELL_ATTR_EX3_STACK_FOR_DIFF_CASTERS)
        return true;

    if (GetSpellSpecific(spellInfo->Id) == SPELL_JUDGEMENT)
        return false;

    // some more (custom) checks. e.g. Insect Swarm doesn't have the attribute, we depend on aura types in holder
    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        switch(spellInfo->EffectApplyAuraName[i])
        {
            // DoT/HoT and some more
            case SPELL_AURA_PERIODIC_DAMAGE:
            case SPELL_AURA_DUMMY:
            case SPELL_AURA_PERIODIC_HEAL:
            case SPELL_AURA_OBS_MOD_HEALTH:
            case SPELL_AURA_OBS_MOD_MANA:
            case SPELL_AURA_PERIODIC_TRIGGER_SPELL:
            case SPELL_AURA_PERIODIC_LEECH:
            case SPELL_AURA_PERIODIC_MANA_LEECH:
            case SPELL_AURA_PERIODIC_DAMAGE_PERCENT:
            case SPELL_AURA_POWER_BURN_MANA:
            case SPELL_AURA_CONTROL_VEHICLE:
            case SPELL_AURA_MOD_STUN:
                return true;
        }
    }

    // some direct ID checks (hacks!)
    switch(spellInfo->Id)
    {
        case 70602: // Corruption (Valithria Dreamwalker)
        case 70588: // Suppression (Valithria Dreamwalker)
            return true;
    }

    return false;
}

SpellEntry const* SpellMgr::SelectAuraRankForLevel(SpellEntry const* spellInfo, uint32 level) const
{
    // fast case
    if (level + 10 >= spellInfo->spellLevel)
        return spellInfo;

    // ignore selection for passive spells
    if (IsPassiveSpell(spellInfo))
        return spellInfo;

    bool needRankSelection = false;
    for(int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        // for simple aura in check apply to any non caster based targets, in rank search mode to any explicit targets
        if (((spellInfo->Effect[i] == SPELL_EFFECT_APPLY_AURA &&
            (IsExplicitPositiveTarget(spellInfo->EffectImplicitTargetA[i]) ||
            IsAreaEffectPossitiveTarget(Targets(spellInfo->EffectImplicitTargetA[i])))) ||
            spellInfo->Effect[i] == SPELL_EFFECT_APPLY_AREA_AURA_PARTY ||
            spellInfo->Effect[i] == SPELL_EFFECT_APPLY_AREA_AURA_RAID) &&
            IsPositiveEffect(spellInfo, SpellEffectIndex(i)))
        {
            needRankSelection = true;
            break;
        }
    }

    // not required (rank check more slow so check it here)
    if (!needRankSelection || GetSpellRank(spellInfo->Id) == 0)
        return spellInfo;

    for(uint32 nextSpellId = spellInfo->Id; nextSpellId != 0; nextSpellId = GetPrevSpellInChain(nextSpellId))
    {
        SpellEntry const *nextSpellInfo = sSpellStore.LookupEntry(nextSpellId);
        if (!nextSpellInfo)
            break;

        // if found appropriate level
        if (level + 10 >= nextSpellInfo->spellLevel)
            return nextSpellInfo;

        // one rank less then
    }

    // not found
    return NULL;
}

typedef UNORDERED_MAP<uint32,uint32> AbilitySpellPrevMap;

static void LoadSpellChains_AbilityHelper(SpellChainMap& chainMap, AbilitySpellPrevMap const& prevRanks, uint32 spell_id, uint32 prev_id, uint32 deep = 30)
{
    // spell already listed in chains store
    SpellChainMap::const_iterator chain_itr = chainMap.find(spell_id);
    if (chain_itr != chainMap.end())
    {
        MANGOS_ASSERT(chain_itr->second.prev == prev_id && "LoadSpellChains_AbilityHelper: Conflicting data in talents or spell abilities dbc");
        return;
    }

    // prev rank listed in main chain table (can fill correct data directly)
    SpellChainMap::const_iterator prev_chain_itr = chainMap.find(prev_id);
    if (prev_chain_itr != chainMap.end())
    {
        SpellChainNode node;
        node.prev  = prev_id;
        node.first = prev_chain_itr->second.first;
        node.rank  = prev_chain_itr->second.rank+1;
        node.req   = 0;
        chainMap[spell_id] = node;
        return;
    }

    // prev spell not listed in prev ranks store, so it first rank
    AbilitySpellPrevMap::const_iterator prev_itr = prevRanks.find(prev_id);
    if (prev_itr == prevRanks.end())
    {
        SpellChainNode prev_node;
        prev_node.prev  = 0;
        prev_node.first = prev_id;
        prev_node.rank  = 1;
        prev_node.req   = 0;
        chainMap[prev_id] = prev_node;

        SpellChainNode node;
        node.prev  = prev_id;
        node.first = prev_id;
        node.rank  = 2;
        node.req   = 0;
        chainMap[spell_id] = node;
        return;
    }

    if (deep == 0)
    {
        MANGOS_ASSERT(false && "LoadSpellChains_AbilityHelper: Infinity cycle in spell ability data");
        return;
    }

    // prev rank listed, so process it first
    LoadSpellChains_AbilityHelper(chainMap, prevRanks, prev_id, prev_itr->second, deep-1);

    // prev rank must be listed now
    prev_chain_itr = chainMap.find(prev_id);
    if (prev_chain_itr == chainMap.end())
        return;

    SpellChainNode node;
    node.prev  = prev_id;
    node.first = prev_chain_itr->second.first;
    node.rank  = prev_chain_itr->second.rank+1;
    node.req   = 0;
    chainMap[spell_id] = node;
}

void SpellMgr::LoadSpellChains()
{
    mSpellChains.clear();                                   // need for reload case
    mSpellChainsNext.clear();                               // need for reload case

    // load known data for talents
    for (unsigned int i = 0; i < sTalentStore.GetNumRows(); ++i)
    {
        TalentEntry const *talentInfo = sTalentStore.LookupEntry(i);
        if (!talentInfo)
            continue;

        // not add ranks for 1 ranks talents (if exist non ranks spells then it will included in table data)
        if (!talentInfo->RankID[1])
            continue;

        for (int j = 0; j < MAX_TALENT_RANK; j++)
        {
            uint32 spell_id = talentInfo->RankID[j];
            if (!spell_id)
                continue;

            if (!sSpellStore.LookupEntry(spell_id))
            {
                //sLog.outErrorDb("Talent %u not exist as spell",spell_id);
                continue;
            }

            SpellChainNode node;
            node.prev  = (j > 0) ? talentInfo->RankID[j-1] : 0;
            node.first = talentInfo->RankID[0];
            node.rank  = j+1;
            node.req   = 0;

            mSpellChains[spell_id] = node;
        }
    }

    // load known data from spell abilities
    {
        // we can calculate ranks only after full data generation
        AbilitySpellPrevMap prevRanks;
        for(SkillLineAbilityMap::const_iterator ab_itr = mSkillLineAbilityMap.begin(); ab_itr != mSkillLineAbilityMap.end(); ++ab_itr)
        {
            uint32 spell_id = ab_itr->first;

            // skip GM/test/internal spells.begin Its not have ranks anyway
            if (ab_itr->second->skillId == SKILL_INTERNAL)
                continue;

            // some forward spells not exist and can be ignored (some outdated data)
            SpellEntry const* spell_entry = sSpellStore.LookupEntry(spell_id);
            if (!spell_entry)                                   // no cases
                continue;

            // ignore spell without forwards (non ranked or missing info in skill abilities)
            uint32 forward_id = ab_itr->second->forward_spellid;
            if (!forward_id)
                continue;

            // some forward spells not exist and can be ignored (some outdated data)
            SpellEntry const* forward_entry = sSpellStore.LookupEntry(forward_id);
            if (!forward_entry)
                continue;

            // some forward spells still exist but excluded from real use as ranks and not listed in skill abilities now
            SkillLineAbilityMapBounds bounds = mSkillLineAbilityMap.equal_range(forward_id);
            if (bounds.first == bounds.second)
                continue;

            // spell already listed in chains store
            SpellChainMap::const_iterator chain_itr = mSpellChains.find(forward_id);
            if (chain_itr != mSpellChains.end())
            {
                MANGOS_ASSERT(chain_itr->second.prev == spell_id && "Conflicting data in talents or spell abilities dbc");
                continue;
            }

            // spell already listed in prev ranks store
            AbilitySpellPrevMap::const_iterator prev_itr = prevRanks.find(forward_id);
            if (prev_itr != prevRanks.end())
            {
                MANGOS_ASSERT(prev_itr->second == spell_id && "Conflicting data in talents or spell abilities dbc");
                continue;
            }

            // prev rank listed in main chain table (can fill correct data directly)
            SpellChainMap::const_iterator prev_chain_itr = mSpellChains.find(spell_id);
            if (prev_chain_itr != mSpellChains.end())
            {
                SpellChainNode node;
                node.prev  = spell_id;
                node.first = prev_chain_itr->second.first;
                node.rank  = prev_chain_itr->second.rank+1;
                node.req   = 0;

                mSpellChains[forward_id] = node;
                continue;
            }

            // need temporary store for later rank calculation
            prevRanks[forward_id] = spell_id;
        }

        while (!prevRanks.empty())
        {
            uint32 spell_id = prevRanks.begin()->first;
            uint32 prev_id  = prevRanks.begin()->second;
            prevRanks.erase(prevRanks.begin());

            LoadSpellChains_AbilityHelper(mSpellChains, prevRanks, spell_id, prev_id);
        }
    }

    // load custom case
    QueryResult *result = WorldDatabase.Query("SELECT spell_id, prev_spell, first_spell, rank, req_spell FROM spell_chain");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded 0 spell chain records");
        sLog.outErrorDb("`spell_chains` table is empty!");
        return;
    }

    uint32 dbc_count = mSpellChains.size();
    uint32 new_count = 0;
    uint32 req_count = 0;

    BarGoLink bar(result->GetRowCount());
    do
    {
        bar.step();
        Field *fields = result->Fetch();

        uint32 spell_id = fields[0].GetUInt32();

        SpellChainNode node;
        node.prev  = fields[1].GetUInt32();
        node.first = fields[2].GetUInt32();
        node.rank  = fields[3].GetUInt8();
        node.req   = fields[4].GetUInt32();

        if (!sSpellStore.LookupEntry(spell_id))
        {
            sLog.outErrorDb("Spell %u listed in `spell_chain` does not exist",spell_id);
            continue;
        }

        SpellChainMap::iterator chain_itr = mSpellChains.find(spell_id);
        if (chain_itr != mSpellChains.end())
        {
            if (chain_itr->second.rank != node.rank)
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` expected rank %u by DBC data.",
                    spell_id,node.prev,node.first,node.rank,node.req,chain_itr->second.rank);
                continue;
            }

            if (chain_itr->second.prev != node.prev)
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` expected prev %u by DBC data.",
                    spell_id,node.prev,node.first,node.rank,node.req,chain_itr->second.prev);
                continue;
            }

            if (chain_itr->second.first != node.first)
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` expected first %u by DBC data.",
                    spell_id,node.prev,node.first,node.rank,node.req,chain_itr->second.first);
                continue;
            }

            // update req field by table data
            if (node.req)
            {
                chain_itr->second.req = node.req;
                ++req_count;
                continue;
            }

            // in other case redundant
            sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) already added (talent or spell ability with forward) and non need in `spell_chain`",
                spell_id,node.prev,node.first,node.rank,node.req);
            continue;
        }

        if (node.prev != 0 && !sSpellStore.LookupEntry(node.prev))
        {
            sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has nonexistent previous rank spell.",
                spell_id,node.prev,node.first,node.rank,node.req);
            continue;
        }

        if(!sSpellStore.LookupEntry(node.first))
        {
            sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has not existing first rank spell.",
                spell_id,node.prev,node.first,node.rank,node.req);
            continue;
        }

        // check basic spell chain data integrity (note: rank can be equal 0 or 1 for first/single spell)
        if ( (spell_id == node.first) != (node.rank <= 1) ||
            (spell_id == node.first) != (node.prev == 0) ||
            (node.rank <= 1) != (node.prev == 0) )
        {
            sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has not compatible chain data.",
                spell_id,node.prev,node.first,node.rank,node.req);
            continue;
        }

        if (node.req!=0 && !sSpellStore.LookupEntry(node.req))
        {
            sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has not existing required spell.",
                spell_id,node.prev,node.first,node.rank,node.req);
            continue;
        }

        // talents not required data in spell chain for work, but must be checked if present for integrity
        if (TalentSpellPos const* pos = GetTalentSpellPos(spell_id))
        {
            if (node.rank!=pos->rank+1)
            {
                sLog.outErrorDb("Talent %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has wrong rank.",
                    spell_id,node.prev,node.first,node.rank,node.req);
                continue;
            }

            if (TalentEntry const* talentEntry = sTalentStore.LookupEntry(pos->talent_id))
            {
                if (node.first!=talentEntry->RankID[0])
                {
                    sLog.outErrorDb("Talent %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has wrong first rank spell.",
                        spell_id,node.prev,node.first,node.rank,node.req);
                    continue;
                }

                if (node.rank > 1 && node.prev != talentEntry->RankID[node.rank-1-1])
                {
                    sLog.outErrorDb("Talent %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has wrong prev rank spell.",
                        spell_id,node.prev,node.first,node.rank,node.req);
                    continue;
                }

                /*if (node.req!=talentEntry->DependsOnSpell)
                {
                    sLog.outErrorDb("Talent %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has wrong required spell.",
                        spell_id,node.prev,node.first,node.rank,node.req);
                    continue;
                }*/
            }

        }

        // removed ranks often still listed as forward in skill abilities but not listed as spell in it
        if (node.prev)
        {
            bool skip = false;
            // some forward spells still exist but excluded from real use as ranks and not listed in skill abilities now
            SkillLineAbilityMapBounds bounds = mSkillLineAbilityMap.equal_range(spell_id);
            if (bounds.first == bounds.second)
            {
                SkillLineAbilityMapBounds prev_bounds = mSkillLineAbilityMap.equal_range(node.prev);
                for(SkillLineAbilityMap::const_iterator ab_itr = prev_bounds.first; ab_itr != prev_bounds.second; ++ab_itr)
                {
                    // spell listed as forward and not listed as ability
                    // this is marker for removed ranks
                    if (ab_itr->second->forward_spellid == spell_id)
                    {
                        sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` is removed rank by DBC data.",
                            spell_id, node.prev, node.first, node.rank, node.req);
                        skip = true;
                        break;
                    }
                }
            }

            if (skip)
                continue;
        }

        mSpellChains[spell_id] = node;

        ++new_count;
    } while( result->NextRow() );

    delete result;

    // additional integrity checks
    for(SpellChainMap::const_iterator i = mSpellChains.begin(); i != mSpellChains.end(); ++i)
    {
        if (i->second.prev)
        {
            SpellChainMap::const_iterator i_prev = mSpellChains.find(i->second.prev);
            if (i_prev == mSpellChains.end())
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has not found previous rank spell in table.",
                    i->first,i->second.prev,i->second.first,i->second.rank,i->second.req);
            }
            else if ( i_prev->second.first != i->second.first )
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has different first spell in chain compared to previous rank spell (prev: %u, first: %u, rank: %d, req: %u).",
                    i->first,i->second.prev,i->second.first,i->second.rank,i->second.req,
                    i_prev->second.prev,i_prev->second.first,i_prev->second.rank,i_prev->second.req);
            }
            else if ( i_prev->second.rank+1 != i->second.rank )
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has different rank compared to previous rank spell (prev: %u, first: %u, rank: %d, req: %u).",
                    i->first,i->second.prev,i->second.first,i->second.rank,i->second.req,
                    i_prev->second.prev,i_prev->second.first,i_prev->second.rank,i_prev->second.req);
            }
        }

        if (i->second.req)
        {
            SpellChainMap::const_iterator i_req = mSpellChains.find(i->second.req);
            if (i_req == mSpellChains.end())
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has not found required rank spell in table.",
                    i->first,i->second.prev,i->second.first,i->second.rank,i->second.req);
            }
            else if ( i_req->second.first == i->second.first )
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has required rank spell from same spell chain (prev: %u, first: %u, rank: %d, req: %u).",
                    i->first,i->second.prev,i->second.first,i->second.rank,i->second.req,
                    i_req->second.prev,i_req->second.first,i_req->second.rank,i_req->second.req);
            }
            else if ( i_req->second.req )
            {
                sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has required rank spell with required spell (prev: %u, first: %u, rank: %d, req: %u).",
                    i->first,i->second.prev,i->second.first,i->second.rank,i->second.req,
                    i_req->second.prev,i_req->second.first,i_req->second.rank,i_req->second.req);
            }
        }
    }

    // fill next rank cache
    for(SpellChainMap::const_iterator i = mSpellChains.begin(); i != mSpellChains.end(); ++i)
    {
        uint32 spell_id = i->first;
        SpellChainNode const& node = i->second;

        if (node.prev)
            mSpellChainsNext.insert(SpellChainMapNext::value_type(node.prev,spell_id));

        if (node.req)
            mSpellChainsNext.insert(SpellChainMapNext::value_type(node.req,spell_id));
    }

    // check single rank redundant cases (single rank talents/spell abilities not added by default so this can be only custom cases)
    for(SpellChainMap::const_iterator i = mSpellChains.begin(); i != mSpellChains.end(); ++i)
    {
        // skip non-first ranks, and spells with additional reqs
        if (i->second.rank > 1 || i->second.req)
            continue;

        if (mSpellChainsNext.find(i->first) == mSpellChainsNext.end())
        {
            sLog.outErrorDb("Spell %u (prev: %u, first: %u, rank: %d, req: %u) listed in `spell_chain` has single rank data, so redundant.",
                i->first,i->second.prev,i->second.first,i->second.rank,i->second.req);
        }
    }

    sLog.outString();
    sLog.outString( ">> Loaded %u spell chain records (%u from DBC data with %u req field updates, and %u loaded from table)", dbc_count+new_count, dbc_count, req_count, new_count);
}

void SpellMgr::LoadSpellLearnSkills()
{
    mSpellLearnSkills.clear();                              // need for reload case

    // search auto-learned skills and add its to map also for use in unlearn spells/talents
    uint32 dbc_count = 0;
    BarGoLink bar(sSpellStore.GetNumRows());
    for (uint32 spell = 0; spell < sSpellStore.GetNumRows(); ++spell)
    {
        bar.step();
        SpellEntry const* entry = sSpellStore.LookupEntry(spell);

        if (!entry)
            continue;

        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (entry->Effect[i] == SPELL_EFFECT_SKILL)
            {
                SpellLearnSkillNode dbc_node;
                dbc_node.skill    = entry->EffectMiscValue[i];
                dbc_node.step     = entry->CalculateSimpleValue(SpellEffectIndex(i));
                if (dbc_node.skill != SKILL_RIDING)
                    dbc_node.value = 1;
                else
                    dbc_node.value = dbc_node.step * 75;
                dbc_node.maxvalue = dbc_node.step * 75;

                mSpellLearnSkills[spell] = dbc_node;
                ++dbc_count;
                break;
            }
        }
    }

    sLog.outString();
    sLog.outString(">> Loaded %u Spell Learn Skills from DBC", dbc_count);
}

void SpellMgr::LoadSpellLearnSpells()
{
    mSpellLearnSpells.clear();                              // need for reload case

    //                                                0      1        2
    QueryResult *result = WorldDatabase.Query("SELECT entry, SpellID, Active FROM spell_learn_spell");
    if (!result)
    {
        BarGoLink bar(1);
        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded 0 spell learn spells");
        sLog.outErrorDb("`spell_learn_spell` table is empty!");
        return;
    }

    uint32 count = 0;

    BarGoLink bar(result->GetRowCount());
    do
    {
        bar.step();
        Field *fields = result->Fetch();

        uint32 spell_id    = fields[0].GetUInt32();

        SpellLearnSpellNode node;
        node.spell      = fields[1].GetUInt32();
        node.active     = fields[2].GetBool();
        node.autoLearned= false;

        if (!sSpellStore.LookupEntry(spell_id))
        {
            sLog.outErrorDb("Spell %u listed in `spell_learn_spell` does not exist",spell_id);
            continue;
        }

        if (!sSpellStore.LookupEntry(node.spell))
        {
            sLog.outErrorDb("Spell %u listed in `spell_learn_spell` learning nonexistent spell %u",spell_id,node.spell);
            continue;
        }

        if (GetTalentSpellCost(node.spell))
        {
            sLog.outErrorDb("Spell %u listed in `spell_learn_spell` attempt learning talent spell %u, skipped",spell_id,node.spell);
            continue;
        }

        mSpellLearnSpells.insert(SpellLearnSpellMap::value_type(spell_id,node));

        ++count;
    } while (result->NextRow());

    delete result;

    // search auto-learned spells and add its to map also for use in unlearn spells/talents
    uint32 dbc_count = 0;
    for(uint32 spell = 0; spell < sSpellStore.GetNumRows(); ++spell)
    {
        SpellEntry const* entry = sSpellStore.LookupEntry(spell);

        if (!entry)
            continue;

        for(int i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (entry->Effect[i]==SPELL_EFFECT_LEARN_SPELL)
            {
                SpellLearnSpellNode dbc_node;
                dbc_node.spell       = entry->EffectTriggerSpell[i];
                dbc_node.active      = true;                // all dbc based learned spells is active (show in spell book or hide by client itself)

                // ignore learning nonexistent spells (broken/outdated/or generic learning spell 483
                if (!sSpellStore.LookupEntry(dbc_node.spell))
                    continue;

                // talent or passive spells or skill-step spells auto-casted and not need dependent learning,
                // pet teaching spells don't must be dependent learning (casted)
                // other required explicit dependent learning
                dbc_node.autoLearned = entry->EffectImplicitTargetA[i]==TARGET_PET || GetTalentSpellCost(spell) > 0 || IsPassiveSpell(entry) || IsSpellHaveEffect(entry,SPELL_EFFECT_SKILL_STEP);

                SpellLearnSpellMapBounds db_node_bounds = GetSpellLearnSpellMapBounds(spell);

                bool found = false;
                for(SpellLearnSpellMap::const_iterator itr = db_node_bounds.first; itr != db_node_bounds.second; ++itr)
                {
                    if (itr->second.spell == dbc_node.spell)
                    {
                        sLog.outErrorDb("Spell %u auto-learn spell %u in spell.dbc then the record in `spell_learn_spell` is redundant, please fix DB.",
                            spell,dbc_node.spell);
                        found = true;
                        break;
                    }
                }

                if (!found)                                 // add new spell-spell pair if not found
                {
                    mSpellLearnSpells.insert(SpellLearnSpellMap::value_type(spell,dbc_node));
                    ++dbc_count;
                }
            }
        }
    }

    sLog.outString();
    sLog.outString( ">> Loaded %u spell learn spells + %u found in DBC", count, dbc_count );
}

void SpellMgr::LoadSpellScriptTarget()
{
    mSpellScriptTarget.clear();                             // need for reload case

    uint32 count = 0;

    QueryResult *result = WorldDatabase.Query("SELECT entry,type,targetEntry FROM spell_script_target");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb(">> Loaded 0 SpellScriptTarget. DB table `spell_script_target` is empty.");
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 spellId     = fields[0].GetUInt32();
        uint32 type        = fields[1].GetUInt32();
        uint32 targetEntry = fields[2].GetUInt32();

        SpellEntry const* spellProto = sSpellStore.LookupEntry(spellId);

        if (!spellProto)
        {
            sLog.outErrorDb("Table `spell_script_target`: spellId %u listed for TargetEntry %u does not exist.",spellId,targetEntry);
            continue;
        }

        bool targetfound = false;
        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if ( spellProto->EffectImplicitTargetA[i] == TARGET_SCRIPT ||
                spellProto->EffectImplicitTargetB[i] == TARGET_SCRIPT ||
                spellProto->EffectImplicitTargetA[i] == TARGET_SCRIPT_COORDINATES ||
                spellProto->EffectImplicitTargetB[i] == TARGET_SCRIPT_COORDINATES ||
                spellProto->EffectImplicitTargetA[i] == TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT ||
                spellProto->EffectImplicitTargetB[i] == TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT ||
                spellProto->EffectImplicitTargetA[i] == TARGET_AREAEFFECT_INSTANT ||
                spellProto->EffectImplicitTargetB[i] == TARGET_AREAEFFECT_INSTANT ||
                spellProto->EffectImplicitTargetA[i] == TARGET_AREAEFFECT_CUSTOM ||
                spellProto->EffectImplicitTargetB[i] == TARGET_AREAEFFECT_CUSTOM ||
                spellProto->EffectImplicitTargetA[i] == TARGET_OBJECT_AREA_SRC ||
                spellProto->EffectImplicitTargetB[i] == TARGET_OBJECT_AREA_SRC ||
                spellProto->EffectImplicitTargetA[i] == TARGET_AREAEFFECT_GO_AROUND_DEST ||
                spellProto->EffectImplicitTargetB[i] == TARGET_AREAEFFECT_GO_AROUND_DEST)
            {
                targetfound = true;
                break;
            }
        }
        if (!targetfound)
        {
            sLog.outErrorDb("Table `spell_script_target`: spellId %u listed for TargetEntry %u does not have any implicit target TARGET_SCRIPT(38) or TARGET_SCRIPT_COORDINATES (46) or TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT (40).", spellId, targetEntry);
            continue;
        }

        if (type >= MAX_SPELL_TARGET_TYPE)
        {
            sLog.outErrorDb("Table `spell_script_target`: target type %u for TargetEntry %u is incorrect.",type,targetEntry);
            continue;
        }

        // Checks by target type
        switch (type)
        {
            case SPELL_TARGET_TYPE_GAMEOBJECT:
            {
                if (!targetEntry)
                    break;

                if (!sGOStorage.LookupEntry<GameObjectInfo>(targetEntry))
                {
                    sLog.outErrorDb("Table `spell_script_target`: gameobject template entry %u does not exist.",targetEntry);
                    continue;
                }
                break;
            }
            default:
                if (!targetEntry)
                {
                    sLog.outErrorDb("Table `spell_script_target`: target entry == 0 for not GO target type (%u).",type);
                    continue;
                }
                if (const CreatureInfo* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(targetEntry))
                {
                    if (spellId == 30427 && !cInfo->SkinLootId)
                    {
                        sLog.outErrorDb("Table `spell_script_target` has creature %u as a target of spellid 30427, but this creature has no skinlootid. Gas extraction will not work!", cInfo->Entry);
                        continue;
                    }
                }
                else
                {
                    sLog.outErrorDb("Table `spell_script_target`: creature template entry %u does not exist.",targetEntry);
                    continue;
                }
                break;
        }

        mSpellScriptTarget.insert(SpellScriptTarget::value_type(spellId,SpellTargetEntry(SpellTargetType(type),targetEntry)));

        ++count;
    } while (result->NextRow());

    delete result;

    // Check all spells
    /* Disabled (lot errors at this moment)
    for(uint32 i = 1; i < sSpellStore.nCount; ++i)
    {
        SpellEntry const * spellInfo = sSpellStore.LookupEntry(i);
        if(!spellInfo)
            continue;

        bool found = false;
        for(int j = 0; j < MAX_EFFECT_INDEX; ++j)
        {
            if ( spellInfo->EffectImplicitTargetA[j] == TARGET_SCRIPT || spellInfo->EffectImplicitTargetA[j] != TARGET_SELF && spellInfo->EffectImplicitTargetB[j] == TARGET_SCRIPT )
            {
                SpellScriptTarget::const_iterator lower = GetBeginSpellScriptTarget(spellInfo->Id);
                SpellScriptTarget::const_iterator upper = GetEndSpellScriptTarget(spellInfo->Id);
                if (lower==upper)
                {
                    sLog.outErrorDb("Spell (ID: %u) has effect EffectImplicitTargetA/EffectImplicitTargetB = %u (TARGET_SCRIPT), but does not have record in `spell_script_target`",spellInfo->Id,TARGET_SCRIPT);
                    break;                                  // effects of spell
                }
            }
        }
    }
    */

    sLog.outString();
    sLog.outString(">> Loaded %u Spell Script Targets", count);
}

void SpellMgr::LoadSpellPetAuras()
{
    mSpellPetAuraMap.clear();                                  // need for reload case

    uint32 count = 0;

    //                                                0      1         2    3
    QueryResult *result = WorldDatabase.Query("SELECT spell, effectId, pet, aura FROM spell_pet_auras");
    if (!result)
    {

        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u spell pet auras", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 spell = fields[0].GetUInt32();
        SpellEffectIndex eff = SpellEffectIndex(fields[1].GetUInt32());
        uint32 pet = fields[2].GetUInt32();
        uint32 aura = fields[3].GetUInt32();

        if (!spell)
        {
            // Creating lists of pet passive auras (spell == 0)
            PetAura pa(pet, aura, eff, 0);
            mSpellPetPassiveAuraMap[pet].push_back(pa);
            continue;
        }

        if (eff >= MAX_EFFECT_INDEX)
        {
            sLog.outErrorDb("Spell %u listed in `spell_pet_auras` with wrong spell effect index (%u)", spell, eff);
            continue;
        }

        SpellPetAuraMap::iterator itr = mSpellPetAuraMap.find((spell<<8) + eff);
        if (itr != mSpellPetAuraMap.end())
        {
            itr->second.AddAura(pet, aura);
        }
        else
        {
            SpellEntry const* spellInfo = sSpellStore.LookupEntry(spell);
            if (!spellInfo)
            {
                sLog.outErrorDb("Spell %u listed in `spell_pet_auras` does not exist", spell);
                continue;
            }

            if (spellInfo->Effect[eff] != SPELL_EFFECT_DUMMY &&
               (spellInfo->Effect[eff] != SPELL_EFFECT_APPLY_AURA ||
                spellInfo->EffectApplyAuraName[eff] != SPELL_AURA_DUMMY))
            {
                DEBUG_LOG("PetAuras load: Spell %u listed in `spell_pet_auras` does not have dummy aura or dummy effect", spell);
            }

            SpellEntry const* spellInfo2 = sSpellStore.LookupEntry(aura);
            if (!spellInfo2)
            {
                sLog.outErrorDb("Aura %u listed in `spell_pet_auras` does not exist", aura);
                continue;
            }

            PetAura pa(pet, aura, spellInfo->EffectImplicitTargetA[eff] == TARGET_PET, spellInfo->CalculateSimpleValue(eff));
            mSpellPetAuraMap[(spell<<8) + eff] = pa;
        }

        ++count;
    } while( result->NextRow() );

    delete result;

    sLog.outString();
    sLog.outString( ">> Loaded %u spell pet auras", count );
}

void SpellMgr::LoadPetLevelupSpellMap()
{
    uint32 count = 0;
    uint32 family_count = 0;

    for (uint32 i = 0; i < sCreatureFamilyStore.GetNumRows(); ++i)
    {
        CreatureFamilyEntry const *creatureFamily = sCreatureFamilyStore.LookupEntry(i);
        if(!creatureFamily)                                 // not exist
            continue;

        for (uint32 j = 0; j < sSkillLineAbilityStore.GetNumRows(); ++j)
        {
            SkillLineAbilityEntry const *skillLine = sSkillLineAbilityStore.LookupEntry(j);
            if ( !skillLine )
                continue;

            if (skillLine->skillId!=creatureFamily->skillLine[0] &&
                (!creatureFamily->skillLine[1] || skillLine->skillId!=creatureFamily->skillLine[1]))
                continue;

            if (skillLine->learnOnGetSkill != ABILITY_LEARNED_ON_GET_RACE_OR_CLASS_SKILL)
                continue;

            SpellEntry const *spell = sSpellStore.LookupEntry(skillLine->spellId);
            if(!spell)                                      // not exist
                continue;

            PetLevelupSpellSet& spellSet = mPetLevelupSpellMap[creatureFamily->ID];
            if (spellSet.empty())
                ++family_count;

            spellSet.insert(PetLevelupSpellSet::value_type(spell->spellLevel,spell->Id));
            count++;
        }
    }

    sLog.outString();
    sLog.outString( ">> Loaded %u pet levelup and default spells for %u families", count, family_count );
}

bool SpellMgr::LoadPetDefaultSpells_helper(CreatureInfo const* cInfo, PetDefaultSpellsEntry& petDefSpells)
{
    // skip empty list;
    bool have_spell = false;
    for(int j = 0; j < MAX_CREATURE_SPELL_DATA_SLOT; ++j)
    {
        if (petDefSpells.spellid[j])
        {
            have_spell = true;
            break;
        }
    }
    if(!have_spell)
        return false;

    // remove duplicates with levelupSpells if any
    if (PetLevelupSpellSet const *levelupSpells = cInfo->family ? GetPetLevelupSpellList(cInfo->family) : NULL)
    {
        for(int j = 0; j < MAX_CREATURE_SPELL_DATA_SLOT; ++j)
        {
            if(!petDefSpells.spellid[j])
                continue;

            for(PetLevelupSpellSet::const_iterator itr = levelupSpells->begin(); itr != levelupSpells->end(); ++itr)
            {
                if (itr->second == petDefSpells.spellid[j])
                {
                    petDefSpells.spellid[j] = 0;
                    break;
                }
            }
        }
    }

    // skip empty list;
    have_spell = false;
    for(int j = 0; j < MAX_CREATURE_SPELL_DATA_SLOT; ++j)
    {
        if (petDefSpells.spellid[j])
        {
            have_spell = true;
            break;
        }
    }

    return have_spell;
}

void SpellMgr::LoadPetDefaultSpells()
{
    MANGOS_ASSERT(MAX_CREATURE_SPELL_DATA_SLOT <= CREATURE_MAX_SPELLS);

    mPetDefaultSpellsMap.clear();

    uint32 countCreature = 0;
    uint32 countData = 0;

    for(uint32 i = 0; i < sCreatureStorage.MaxEntry; ++i )
    {
        CreatureInfo const* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(i);
        if(!cInfo)
            continue;

        if(!cInfo->PetSpellDataId)
            continue;

        // for creature with PetSpellDataId get default pet spells from dbc
        CreatureSpellDataEntry const* spellDataEntry = sCreatureSpellDataStore.LookupEntry(cInfo->PetSpellDataId);
        if(!spellDataEntry)
            continue;

        int32 petSpellsId = -(int32)cInfo->PetSpellDataId;
        PetDefaultSpellsEntry petDefSpells;
        for(int j = 0; j < MAX_CREATURE_SPELL_DATA_SLOT; ++j)
            petDefSpells.spellid[j] = spellDataEntry->spellId[j];

        if (LoadPetDefaultSpells_helper(cInfo, petDefSpells))
        {
            mPetDefaultSpellsMap[petSpellsId] = petDefSpells;
            ++countData;
        }
    }

    // different summon spells
    for(uint32 i = 0; i < sSpellStore.GetNumRows(); ++i )
    {
        SpellEntry const* spellEntry = sSpellStore.LookupEntry(i);
        if(!spellEntry)
            continue;

        for(int k = 0; k < MAX_EFFECT_INDEX; ++k)
        {
            if (spellEntry->Effect[k]==SPELL_EFFECT_SUMMON || spellEntry->Effect[k]==SPELL_EFFECT_SUMMON_PET)
            {
                uint32 creature_id = spellEntry->EffectMiscValue[k];
                CreatureInfo const* cInfo = sCreatureStorage.LookupEntry<CreatureInfo>(creature_id);
                if(!cInfo)
                    continue;

                // already loaded
                if (cInfo->PetSpellDataId)
                    continue;

                // for creature without PetSpellDataId get default pet spells from creature_template
                int32 petSpellsId = cInfo->Entry;
                if (mPetDefaultSpellsMap.find(cInfo->Entry) != mPetDefaultSpellsMap.end())
                    continue;

                PetDefaultSpellsEntry petDefSpells;
                for(int j = 0; j < MAX_CREATURE_SPELL_DATA_SLOT; ++j)
                    petDefSpells.spellid[j] = cInfo->spells[j];

                if (LoadPetDefaultSpells_helper(cInfo, petDefSpells))
                {
                    mPetDefaultSpellsMap[petSpellsId] = petDefSpells;
                    ++countCreature;
                }
            }
        }
    }

    sLog.outString();
    sLog.outString( ">> Loaded addition spells for %u pet spell data entries and %u summonable creature templates", countData, countCreature );
}

/// Some checks for spells, to prevent adding deprecated/broken spells for trainers, spell book, etc
bool SpellMgr::IsSpellValid(SpellEntry const* spellInfo, Player* pl, bool msg)
{
    // not exist
    if(!spellInfo)
        return false;

    bool need_check_reagents = false;

    // check effects
    for(int i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        switch(spellInfo->Effect[i])
        {
            case SPELL_EFFECT_NONE:
                continue;

            // craft spell for crafting nonexistent item (break client recipes list show)
            case SPELL_EFFECT_CREATE_ITEM:
            case SPELL_EFFECT_CREATE_ITEM_2:
            {
                if (spellInfo->EffectItemType[i] == 0)
                {
                    // skip auto-loot crafting spells, its not need explicit item info (but have special fake items sometime)
                    if (!IsLootCraftingSpell(spellInfo))
                    {
                        if (msg)
                        {
                            if (pl)
                                ChatHandler(pl).PSendSysMessage("Craft spell %u not have create item entry.",spellInfo->Id);
                            else
                                sLog.outErrorDb("Craft spell %u not have create item entry.",spellInfo->Id);
                        }
                        return false;
                    }

                }
                // also possible IsLootCraftingSpell case but fake item must exist anyway
                else if (!ObjectMgr::GetItemPrototype( spellInfo->EffectItemType[i] ))
                {
                    if (msg)
                    {
                        if (pl)
                            ChatHandler(pl).PSendSysMessage("Craft spell %u create item (Entry: %u) but item does not exist in item_template.",spellInfo->Id,spellInfo->EffectItemType[i]);
                        else
                            sLog.outErrorDb("Craft spell %u create item (Entry: %u) but item does not exist in item_template.",spellInfo->Id,spellInfo->EffectItemType[i]);
                    }
                    return false;
                }

                need_check_reagents = true;
                break;
            }
            case SPELL_EFFECT_LEARN_SPELL:
            {
                SpellEntry const* spellInfo2 = sSpellStore.LookupEntry(spellInfo->EffectTriggerSpell[i]);
                if ( !IsSpellValid(spellInfo2,pl,msg) )
                {
                    if (msg)
                    {
                        if (pl)
                            ChatHandler(pl).PSendSysMessage("Spell %u learn to broken spell %u, and then...",spellInfo->Id,spellInfo->EffectTriggerSpell[i]);
                        else
                            sLog.outErrorDb("Spell %u learn to invalid spell %u, and then...",spellInfo->Id,spellInfo->EffectTriggerSpell[i]);
                    }
                    return false;
                }
                break;
            }
        }
    }

    if (need_check_reagents)
    {
        for(int j = 0; j < MAX_SPELL_REAGENTS; ++j)
        {
            if (spellInfo->Reagent[j] > 0 && !ObjectMgr::GetItemPrototype( spellInfo->Reagent[j] ))
            {
                if (msg)
                {
                    if (pl)
                        ChatHandler(pl).PSendSysMessage("Craft spell %u requires reagent item (Entry: %u) but item does not exist in item_template.",spellInfo->Id,spellInfo->Reagent[j]);
                    else
                        sLog.outErrorDb("Craft spell %u requires reagent item (Entry: %u) but item does not exist in item_template.",spellInfo->Id,spellInfo->Reagent[j]);
                }
                return false;
            }
        }
    }

    return true;
}

void SpellMgr::LoadSpellAreas()
{
    mSpellAreaMap.clear();                                  // need for reload case
    mSpellAreaForQuestMap.clear();
    mSpellAreaForActiveQuestMap.clear();
    mSpellAreaForQuestEndMap.clear();
    mSpellAreaForAuraMap.clear();

    uint32 count = 0;

    //                                                0      1     2            3                   4          5           6         7       8
    QueryResult *result = WorldDatabase.Query("SELECT spell, area, quest_start, quest_start_active, quest_end, aura_spell, racemask, gender, autocast FROM spell_area");

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded %u spell area requirements", count);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 spell = fields[0].GetUInt32();
        SpellArea spellArea;
        spellArea.spellId             = spell;
        spellArea.areaId              = fields[1].GetUInt32();
        spellArea.questStart          = fields[2].GetUInt32();
        spellArea.questStartCanActive = fields[3].GetBool();
        spellArea.questEnd            = fields[4].GetUInt32();
        spellArea.auraSpell           = fields[5].GetInt32();
        spellArea.raceMask            = fields[6].GetUInt32();
        spellArea.gender              = Gender(fields[7].GetUInt8());
        spellArea.autocast            = fields[8].GetBool();

        if (!sSpellStore.LookupEntry(spell))
        {
            sLog.outErrorDb("Spell %u listed in `spell_area` does not exist", spell);
            continue;
        }

        {
            bool ok = true;
            SpellAreaMapBounds sa_bounds = GetSpellAreaMapBounds(spellArea.spellId);
            for (SpellAreaMap::const_iterator itr = sa_bounds.first; itr != sa_bounds.second; ++itr)
            {
                if (spellArea.spellId != itr->second.spellId)
                    continue;
                if (spellArea.areaId != itr->second.areaId)
                    continue;
                if (spellArea.questStart != itr->second.questStart)
                    continue;
                if (spellArea.auraSpell != itr->second.auraSpell)
                    continue;
                if ((spellArea.raceMask & itr->second.raceMask) == 0)
                    continue;
                if (spellArea.gender != itr->second.gender)
                    continue;

                // duplicate by requirements
                ok =false;
                break;
            }

            if (!ok)
            {
                sLog.outErrorDb("Spell %u listed in `spell_area` already listed with similar requirements.", spell);
                continue;
            }

        }

        if (spellArea.areaId && !GetAreaEntryByAreaID(spellArea.areaId))
        {
            sLog.outErrorDb("Spell %u listed in `spell_area` have wrong area (%u) requirement", spell,spellArea.areaId);
            continue;
        }

        if (spellArea.questStart && !sObjectMgr.GetQuestTemplate(spellArea.questStart))
        {
            sLog.outErrorDb("Spell %u listed in `spell_area` have wrong start quest (%u) requirement", spell,spellArea.questStart);
            continue;
        }

        if (spellArea.questEnd)
        {
            if (!sObjectMgr.GetQuestTemplate(spellArea.questEnd))
            {
                sLog.outErrorDb("Spell %u listed in `spell_area` have wrong end quest (%u) requirement", spell,spellArea.questEnd);
                continue;
            }

            if (spellArea.questEnd==spellArea.questStart && !spellArea.questStartCanActive)
            {
                sLog.outErrorDb("Spell %u listed in `spell_area` have quest (%u) requirement for start and end in same time", spell,spellArea.questEnd);
                continue;
            }
        }

        if (spellArea.auraSpell)
        {
            SpellEntry const* spellInfo = sSpellStore.LookupEntry(abs(spellArea.auraSpell));
            if (!spellInfo)
            {
                sLog.outErrorDb("Spell %u listed in `spell_area` have wrong aura spell (%u) requirement", spell,abs(spellArea.auraSpell));
                continue;
            }

            switch (spellInfo->EffectApplyAuraName[EFFECT_INDEX_0])
            {
                case SPELL_AURA_DUMMY:
                case SPELL_AURA_PHASE:
                case SPELL_AURA_GHOST:
                    break;
                default:
                    sLog.outErrorDb("Spell %u listed in `spell_area` have aura spell requirement (%u) without dummy/phase/ghost aura in effect 0", spell,abs(spellArea.auraSpell));
                    continue;
            }

            if (uint32(abs(spellArea.auraSpell))==spellArea.spellId)
            {
                sLog.outErrorDb("Spell %u listed in `spell_area` have aura spell (%u) requirement for itself", spell, abs(spellArea.auraSpell));
                continue;
            }

            // not allow autocast chains by auraSpell field (but allow use as alternative if not present)
            if (spellArea.autocast && spellArea.auraSpell > 0)
            {
                bool chain = false;
                SpellAreaForAuraMapBounds saBound = GetSpellAreaForAuraMapBounds(spellArea.spellId);
                for (SpellAreaForAuraMap::const_iterator itr = saBound.first; itr != saBound.second; ++itr)
                {
                    if (itr->second->autocast && itr->second->auraSpell > 0)
                    {
                        chain = true;
                        break;
                    }
                }

                if (chain)
                {
                    sLog.outErrorDb("Spell %u listed in `spell_area` have aura spell (%u) requirement that itself autocast from aura", spell,spellArea.auraSpell);
                    continue;
                }

                SpellAreaMapBounds saBound2 = GetSpellAreaMapBounds(spellArea.auraSpell);
                for (SpellAreaMap::const_iterator itr2 = saBound2.first; itr2 != saBound2.second; ++itr2)
                {
                    if (itr2->second.autocast && itr2->second.auraSpell > 0)
                    {
                        chain = true;
                        break;
                    }
                }

                if (chain)
                {
                    sLog.outErrorDb("Spell %u listed in `spell_area` have aura spell (%u) requirement that itself autocast from aura", spell,spellArea.auraSpell);
                    continue;
                }
            }
        }

        if (spellArea.raceMask && (spellArea.raceMask & RACEMASK_ALL_PLAYABLE)==0)
        {
            sLog.outErrorDb("Spell %u listed in `spell_area` have wrong race mask (%u) requirement", spell,spellArea.raceMask);
            continue;
        }

        if (spellArea.gender!=GENDER_NONE && spellArea.gender!=GENDER_FEMALE && spellArea.gender!=GENDER_MALE)
        {
            sLog.outErrorDb("Spell %u listed in `spell_area` have wrong gender (%u) requirement", spell,spellArea.gender);
            continue;
        }

        SpellArea const* sa = &mSpellAreaMap.insert(SpellAreaMap::value_type(spell,spellArea))->second;

        // for search by current zone/subzone at zone/subzone change
        if (spellArea.areaId)
            mSpellAreaForAreaMap.insert(SpellAreaForAreaMap::value_type(spellArea.areaId,sa));

        // for search at quest start/reward
        if (spellArea.questStart)
        {
            if (spellArea.questStartCanActive)
                mSpellAreaForActiveQuestMap.insert(SpellAreaForQuestMap::value_type(spellArea.questStart,sa));
            else
                mSpellAreaForQuestMap.insert(SpellAreaForQuestMap::value_type(spellArea.questStart,sa));
        }

        // for search at quest start/reward
        if (spellArea.questEnd)
            mSpellAreaForQuestEndMap.insert(SpellAreaForQuestMap::value_type(spellArea.questEnd,sa));

        // for search at aura apply
        if (spellArea.auraSpell)
            mSpellAreaForAuraMap.insert(SpellAreaForAuraMap::value_type(abs(spellArea.auraSpell),sa));

        ++count;
    } while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString(">> Loaded %u spell area requirements", count);
}

SpellCastResult SpellMgr::GetSpellAllowedInLocationError(SpellEntry const *spellInfo, uint32 map_id, uint32 zone_id, uint32 area_id, Player const* player)
{
    // normal case
    int32 areaGroupId = spellInfo->AreaGroupId;
    if (areaGroupId > 0)
    {
        bool found = false;
        AreaGroupEntry const* groupEntry = sAreaGroupStore.LookupEntry(areaGroupId);
        while (groupEntry)
        {
            for (uint32 i=0; i<6; ++i)
                if (groupEntry->AreaId[i] == zone_id || groupEntry->AreaId[i] == area_id)
                    found = true;
            if (found || !groupEntry->nextGroup)
                break;
            // Try search in next group
            groupEntry = sAreaGroupStore.LookupEntry(groupEntry->nextGroup);
        }

        if (!found)
            return SPELL_FAILED_INCORRECT_AREA;
    }

    // continent limitation (virtual continent), ignore for GM
    if (spellInfo->HasAttribute(SPELL_ATTR_EX4_CAST_ONLY_IN_OUTLAND) && !(player && player->isGameMaster()))
    {
        uint32 v_map = GetVirtualMapForMapAndZone(map_id, zone_id);
        MapEntry const* mapEntry = sMapStore.LookupEntry(v_map);
        if (!mapEntry || (mapEntry->addon < 1 && !sWorld.getConfig(CONFIG_BOOL_ALLOW_FLIGHT_ON_OLD_MAPS)) || !mapEntry->IsContinent())
            return SPELL_FAILED_INCORRECT_AREA;
    }

    // raid instance limitation
    if (spellInfo->HasAttribute(SPELL_ATTR_EX6_NOT_IN_RAID_INSTANCE))
    {
        MapEntry const* mapEntry = sMapStore.LookupEntry(map_id);
        if (!mapEntry || mapEntry->IsRaid())
            return SPELL_FAILED_NOT_IN_RAID_INSTANCE;
    }

    // DB base check (if non empty then must fit at least single for allow)
    SpellAreaMapBounds saBounds = GetSpellAreaMapBounds(spellInfo->Id);
    if (saBounds.first != saBounds.second)
    {
        for(SpellAreaMap::const_iterator itr = saBounds.first; itr != saBounds.second; ++itr)
        {
            if (itr->second.IsFitToRequirements(player,zone_id,area_id))
                return SPELL_CAST_OK;
        }
        return SPELL_FAILED_INCORRECT_AREA;
    }

    // bg spell checks

    // do not allow spells to be cast in arenas
    // - with SPELL_ATTR_EX4_NOT_USABLE_IN_ARENA flag
    // - with greater than 10 min CD
    if (spellInfo->HasAttribute(SPELL_ATTR_EX4_NOT_USABLE_IN_ARENA) ||
         (GetSpellRecoveryTime(spellInfo) > 10 * MINUTE * IN_MILLISECONDS && !spellInfo->HasAttribute(SPELL_ATTR_EX4_USABLE_IN_ARENA)))
        if (player && player->InArena())
            return SPELL_FAILED_NOT_IN_ARENA;

    // Spell casted only on battleground
    if (spellInfo->HasAttribute(SPELL_ATTR_EX3_BATTLEGROUND))
        if (!player || !player->InBattleGround())
            return SPELL_FAILED_ONLY_BATTLEGROUNDS;

    switch(spellInfo->Id)
    {
        // a trinket in alterac valley allows to teleport to the boss
        case 22564:                                         // recall
        case 22563:                                         // recall
        {
            if (!player)
                return SPELL_FAILED_REQUIRES_AREA;
            BattleGround* bg = player->GetBattleGround();
            return map_id == 30 && bg
                && bg->GetStatus() != STATUS_WAIT_JOIN ? SPELL_CAST_OK : SPELL_FAILED_REQUIRES_AREA;
        }
        case 23333:                                         // Warsong Flag
        case 23335:                                         // Silverwing Flag
            return map_id == 489 && player && player->InBattleGround() ? SPELL_CAST_OK : SPELL_FAILED_REQUIRES_AREA;
        case 34976:                                         // Netherstorm Flag
            return map_id == 566 && player && player->InBattleGround() ? SPELL_CAST_OK : SPELL_FAILED_REQUIRES_AREA;
        case 2584:                                          // Waiting to Resurrect
        case 42792:                                         // Recently Dropped Flag
        case 43681:                                         // Inactive
        {
            return player && player->InBattleGround() ? SPELL_CAST_OK : SPELL_FAILED_ONLY_BATTLEGROUNDS;
        }
        case 22011:                                         // Spirit Heal Channel
        case 22012:                                         // Spirit Heal
        case 24171:                                         // Resurrection Impact Visual
        case 44535:                                         // Spirit Heal (mana)
        {
            MapEntry const* mapEntry = sMapStore.LookupEntry(map_id);
            if (!mapEntry)
                return SPELL_FAILED_INCORRECT_AREA;
            return mapEntry->IsBattleGround()? SPELL_CAST_OK : SPELL_FAILED_ONLY_BATTLEGROUNDS;
        }
        case 44521:                                         // Preparation
        {
            if (!player)
                return SPELL_FAILED_REQUIRES_AREA;

            BattleGround* bg = player->GetBattleGround();
            return bg && bg->GetStatus()==STATUS_WAIT_JOIN ? SPELL_CAST_OK : SPELL_FAILED_ONLY_BATTLEGROUNDS;
        }
        case 32724:                                         // Gold Team (Alliance)
        case 32725:                                         // Green Team (Alliance)
        case 35774:                                         // Gold Team (Horde)
        case 35775:                                         // Green Team (Horde)
        {
            return player && player->InArena() ? SPELL_CAST_OK : SPELL_FAILED_ONLY_IN_ARENA;
        }
        case 32727:                                         // Arena Preparation
        {
            if (!player)
                return SPELL_FAILED_REQUIRES_AREA;
            if (!player->InArena())
                return SPELL_FAILED_REQUIRES_AREA;

            BattleGround* bg = player->GetBattleGround();
            return bg && bg->GetStatus()==STATUS_WAIT_JOIN ? SPELL_CAST_OK : SPELL_FAILED_ONLY_IN_ARENA;
        }
        case 69065:                                         // Impaled
        case 69126:                                         // Pungent blight - first aura
        case 69152:                                         // Gazeous blight - first aura
        case 72293:                                         // Mark of the Fallen Champion
            return map_id == 631 ? SPELL_CAST_OK : SPELL_FAILED_INCORRECT_AREA;
        case 74410:                                         // Arena - Dampening
            return player && player->InArena() ? SPELL_CAST_OK : SPELL_FAILED_ONLY_IN_ARENA;
        case 74411:                                         // Battleground - Dampening
        {
            if (!player)
                return SPELL_FAILED_ONLY_BATTLEGROUNDS;

            BattleGround* bg = player->GetBattleGround();
            return bg && !bg->isArena() ? SPELL_CAST_OK : SPELL_FAILED_ONLY_BATTLEGROUNDS;
        }
    }

    return SPELL_CAST_OK;
}

void SpellMgr::LoadSkillLineAbilityMap()
{
    mSkillLineAbilityMap.clear();

    BarGoLink bar(sSkillLineAbilityStore.GetNumRows());
    uint32 count = 0;

    for (uint32 i = 0; i < sSkillLineAbilityStore.GetNumRows(); ++i)
    {
        bar.step();
        SkillLineAbilityEntry const *SkillInfo = sSkillLineAbilityStore.LookupEntry(i);
        if(!SkillInfo)
            continue;

        mSkillLineAbilityMap.insert(SkillLineAbilityMap::value_type(SkillInfo->spellId,SkillInfo));
        ++count;
    }

    sLog.outString();
    sLog.outString(">> Loaded %u SkillLineAbility MultiMap Data", count);
}

void SpellMgr::LoadSkillRaceClassInfoMap()
{
    mSkillRaceClassInfoMap.clear();

    BarGoLink bar(sSkillRaceClassInfoStore.GetNumRows());
    uint32 count = 0;

    for (uint32 i = 0; i < sSkillRaceClassInfoStore.GetNumRows(); ++i)
    {
        bar.step();
        SkillRaceClassInfoEntry const *skillRCInfo = sSkillRaceClassInfoStore.LookupEntry(i);
        if (!skillRCInfo)
            continue;

        // not all skills really listed in ability skills list
        if (!sSkillLineStore.LookupEntry(skillRCInfo->skillId))
            continue;

        mSkillRaceClassInfoMap.insert(SkillRaceClassInfoMap::value_type(skillRCInfo->skillId,skillRCInfo));

        ++count;
    }

    sLog.outString();
    sLog.outString(">> Loaded %u SkillRaceClassInfo MultiMap Data", count);
}

void SpellMgr::LoadSkillDiscoveryTable()
{

    mSkillDiscoveryStore.clear();                            // need for reload

    uint32 count = 0;

    //                                                0        1         2              3
    QueryResult *result = WorldDatabase.Query("SELECT spellId, reqSpell, reqSkillValue, chance FROM skill_discovery_template");

    if (!result)
    {
        sLog.outString();
        sLog.outString( ">> Loaded 0 skill discovery definitions. DB table `skill_discovery_template` is empty." );
        return;
    }

    BarGoLink bar(result->GetRowCount());

    std::ostringstream ssNonDiscoverableEntries;
    std::set<uint32> reportedReqSpells;

    do
    {
        Field *fields = result->Fetch();
        bar.step();

        uint32 spellId         = fields[0].GetUInt32();
        int32  reqSkillOrSpell = fields[1].GetInt32();
        uint32 reqSkillValue   = fields[2].GetInt32();
        float  chance          = fields[3].GetFloat();

        if (chance <= 0)                                    // chance
        {
            ssNonDiscoverableEntries << "spellId = " << spellId << " reqSkillOrSpell = " << reqSkillOrSpell
                << " reqSkillValue = " << reqSkillValue << " chance = " << chance << "(chance problem)\n";
            continue;
        }

        if (reqSkillOrSpell > 0)                            // spell case
        {
            SpellEntry const* reqSpellEntry = sSpellStore.LookupEntry(reqSkillOrSpell);
            if (!reqSpellEntry)
            {
                if (reportedReqSpells.find(reqSkillOrSpell) == reportedReqSpells.end())
                {
                    sLog.outErrorDb("Spell (ID: %u) have nonexistent spell (ID: %i) in `reqSpell` field in `skill_discovery_template` table",spellId,reqSkillOrSpell);
                    reportedReqSpells.insert(reqSkillOrSpell);
                }
                continue;
            }

            // mechanic discovery
            if (reqSpellEntry->Mechanic != MECHANIC_DISCOVERY &&
                // explicit discovery ability
                !IsExplicitDiscoverySpell(reqSpellEntry))
            {
                if (reportedReqSpells.find(reqSkillOrSpell) == reportedReqSpells.end())
                {
                    sLog.outErrorDb("Spell (ID: %u) not have MECHANIC_DISCOVERY (28) value in Mechanic field in spell.dbc"
                        " and not 100%% chance random discovery ability but listed for spellId %u (and maybe more) in `skill_discovery_template` table",
                        reqSkillOrSpell,spellId);
                    reportedReqSpells.insert(reqSkillOrSpell);
                }
                continue;
            }

            mSkillDiscoveryStore[reqSkillOrSpell].push_back( SkillDiscoveryEntry(spellId, reqSkillValue, chance) );
        }
        else if (reqSkillOrSpell == 0)                      // skill case
        {
            SkillLineAbilityMapBounds bounds = sSpellMgr.GetSkillLineAbilityMapBounds(spellId);

            if (bounds.first==bounds.second)
            {
                sLog.outErrorDb("Spell (ID: %u) not listed in `SkillLineAbility.dbc` but listed with `reqSpell`=0 in `skill_discovery_template` table",spellId);
                continue;
            }

            for(SkillLineAbilityMap::const_iterator _spell_idx = bounds.first; _spell_idx != bounds.second; ++_spell_idx)
                mSkillDiscoveryStore[-int32(_spell_idx->second->skillId)].push_back( SkillDiscoveryEntry(spellId, reqSkillValue, chance) );
        }
        else
        {
            sLog.outErrorDb("Spell (ID: %u) have negative value in `reqSpell` field in `skill_discovery_template` table",spellId);
            continue;
        }

        ++count;
    } while (result->NextRow());

    delete result;

    sLog.outString();
    sLog.outString( ">> Loaded %u skill discovery definitions", count );
    if (!ssNonDiscoverableEntries.str().empty())
        sLog.outErrorDb("Some items can't be successfully discovered: have in chance field value < 0.000001 in `skill_discovery_template` DB table . List:\n%s",ssNonDiscoverableEntries.str().c_str());

    // report about empty data for explicit discovery spells
    for(uint32 spell_id = 1; spell_id < sSpellStore.GetNumRows(); ++spell_id)
    {
        SpellEntry const* spellEntry = sSpellStore.LookupEntry(spell_id);
        if (!spellEntry)
            continue;

        // skip not explicit discovery spells
        if (!IsExplicitDiscoverySpell(spellEntry))
            continue;

        if (mSkillDiscoveryStore.find(spell_id) == mSkillDiscoveryStore.end())
            sLog.outErrorDb("Spell (ID: %u) is 100%% chance random discovery ability but not have data in `skill_discovery_template` table",spell_id);
    }
}

uint32 SpellMgr::GetExplicitDiscoverySpell(uint32 spellId, Player* player)
{
    // explicit discovery spell chances (always success if case exist)
    // in this case we have both skill and spell
    SkillDiscoveryMap::const_iterator tab = mSkillDiscoveryStore.find(spellId);
    if (tab == mSkillDiscoveryStore.end())
        return 0;

    SkillLineAbilityMapBounds bounds = GetSkillLineAbilityMapBounds(spellId);
    uint32 skillvalue = bounds.first != bounds.second ? player->GetSkillValue(bounds.first->second->skillId) : 0;

    float full_chance = 0;
    for(SkillDiscoveryList::const_iterator item_iter = tab->second.begin(); item_iter != tab->second.end(); ++item_iter)
        if (item_iter->reqSkillValue <= skillvalue)
            if (!player->HasSpell(item_iter->spellId))
                full_chance += item_iter->chance;

    float rate = full_chance / 100.0f;
    float roll = rand_chance_f() * rate;                    // roll now in range 0..full_chance

    for(SkillDiscoveryList::const_iterator item_iter = tab->second.begin(); item_iter != tab->second.end(); ++item_iter)
    {
        if (item_iter->reqSkillValue > skillvalue)
            continue;

        if (player->HasSpell(item_iter->spellId))
            continue;

        if (item_iter->chance > roll)
            return item_iter->spellId;

        roll -= item_iter->chance;
    }

    return 0;
}

uint32 SpellMgr::GetSkillDiscoverySpell(uint32 skillId, uint32 spellId, Player* player)
{
    uint32 skillvalue = skillId ? player->GetSkillValue(skillId) : 0;

    // check spell case
    SkillDiscoveryMap::const_iterator tab = mSkillDiscoveryStore.find(spellId);

    if (tab != mSkillDiscoveryStore.end())
    {
        for(SkillDiscoveryList::const_iterator item_iter = tab->second.begin(); item_iter != tab->second.end(); ++item_iter)
        {
            if (roll_chance_f(item_iter->chance * sWorld.getConfig(CONFIG_FLOAT_RATE_SKILL_DISCOVERY)) &&
                item_iter->reqSkillValue <= skillvalue &&
                !player->HasSpell(item_iter->spellId))
                return item_iter->spellId;
        }

        return 0;
    }

    if (!skillId)
        return 0;

    // check skill line case
    tab = mSkillDiscoveryStore.find(-(int32)skillId);
    if (tab != mSkillDiscoveryStore.end())
    {
        for(SkillDiscoveryList::const_iterator item_iter = tab->second.begin(); item_iter != tab->second.end(); ++item_iter)
        {
            if (roll_chance_f(item_iter->chance * sWorld.getConfig(CONFIG_FLOAT_RATE_SKILL_DISCOVERY)) &&
                item_iter->reqSkillValue <= skillvalue &&
                !player->HasSpell(item_iter->spellId))
                return item_iter->spellId;
        }

        return 0;
    }

    return 0;
}

// loads the extra item creation info from DB
void SpellMgr::LoadSkillExtraItemTable()
{
    uint32 count = 0;

    mSkillExtraItemStore.clear();                            // need for reload

    //                                                 0        1                       2                       3
    QueryResult *result = WorldDatabase.Query("SELECT spellId, requiredSpecialization, additionalCreateChance, additionalMaxNum FROM skill_extra_item_template");

    if (result)
    {
        BarGoLink bar(result->GetRowCount());

        do
        {
            Field *fields = result->Fetch();
            bar.step();

            uint32 spellId = fields[0].GetUInt32();

            if (!sSpellStore.LookupEntry(spellId))
            {
                sLog.outError("Skill specialization %u has nonexistent spell id in `skill_extra_item_template`!", spellId);
                continue;
            }

            uint32 requiredSpecialization = fields[1].GetUInt32();
            if (!sSpellStore.LookupEntry(requiredSpecialization))
            {
                sLog.outError("Skill specialization %u have nonexistent required specialization spell id %u in `skill_extra_item_template`!", spellId,requiredSpecialization);
                continue;
            }

            float additionalCreateChance = fields[2].GetFloat();
            if (additionalCreateChance <= 0.0f)
            {
                sLog.outError("Skill specialization %u has too low additional create chance in `skill_extra_item_template`!", spellId);
                continue;
            }

            uint8 additionalMaxNum = fields[3].GetUInt8();
            if (!additionalMaxNum)
            {
                sLog.outError("Skill specialization %u has 0 max number of extra items in `skill_extra_item_template`!", spellId);
                continue;
            }

            SkillExtraItemEntry& skillExtraItemEntry = mSkillExtraItemStore[spellId];

            skillExtraItemEntry.requiredSpecialization = requiredSpecialization;
            skillExtraItemEntry.additionalCreateChance = additionalCreateChance;
            skillExtraItemEntry.additionalMaxNum       = additionalMaxNum;

            ++count;
        } while (result->NextRow());

        delete result;

        sLog.outString();
        sLog.outString(">> Loaded %u spell specialization definitions", count);
    }
    else
    {
        sLog.outString();
        sLog.outString( ">> Loaded 0 spell specialization definitions. DB table `skill_extra_item_template` is empty." );
    }
}

bool SpellMgr::CanCreateExtraItems(Player * player, uint32 spellId, float &additionalChance, uint8 &additionalMax)
{
    // get the info for the specified spell
    SkillExtraItemMap::const_iterator ret = mSkillExtraItemStore.find(spellId);
    if (ret == mSkillExtraItemStore.end())
        return false;

    SkillExtraItemEntry const* specEntry = &ret->second;

    // if no entry, then no extra items can be created
    if(!specEntry)
        return false;

    // the player doesn't have the required specialization, return false
    if(!player->HasSpell(specEntry->requiredSpecialization))
        return false;

    // set the arguments to the appropriate values
    additionalChance = specEntry->additionalCreateChance;
    additionalMax = specEntry->additionalMaxNum;

    // enable extra item creation
    return true;
}

void SpellMgr::CheckUsedSpells(char const* table)
{
    uint32 countSpells = 0;
    uint32 countMasks = 0;

    //                                                 0       1               2                3                4         5           6             7          8          9         10   11
    QueryResult *result = WorldDatabase.PQuery("SELECT spellid,SpellFamilyName,SpellFamilyMaskA,SpellFamilyMaskB,SpellIcon,SpellVisual,SpellCategory,EffectType,EffectAura,EffectIdx,Name,Code FROM %s",table);

    if (!result)
    {
        BarGoLink bar(1);

        bar.step();

        sLog.outString();
        sLog.outErrorDb("`%s` table is empty!",table);
        return;
    }

    BarGoLink bar(result->GetRowCount());

    do
    {
        Field *fields = result->Fetch();

        bar.step();

        uint32 spell       = fields[0].GetUInt32();
        int32  family      = fields[1].GetInt32();
        ClassFamilyMask familyMask = ClassFamilyMask(fields[2].GetUInt64(), fields[3].GetUInt32());
        int32  spellIcon   = fields[4].GetInt32();
        int32  spellVisual = fields[5].GetInt32();
        int32  category    = fields[6].GetInt32();
        int32  effectType  = fields[7].GetInt32();
        int32  auraType    = fields[8].GetInt32();
        int32  effectIdx   = fields[9].GetInt32();
        std::string name   = fields[10].GetCppString();
        std::string code   = fields[11].GetCppString();

        // checks of correctness requirements itself

        if (family < -1 || family > SPELLFAMILY_PET)
        {
            sLog.outError("Table '%s' for spell %u have wrong SpellFamily value(%u), skipped.",table,spell,family);
            continue;
        }

        // TODO: spellIcon check need dbc loading
        if (spellIcon < -1)
        {
            sLog.outError("Table '%s' for spell %u have wrong SpellIcon value(%u), skipped.",table,spell,spellIcon);
            continue;
        }

        // TODO: spellVisual check need dbc loading
        if (spellVisual < -1)
        {
            sLog.outError("Table '%s' for spell %u have wrong SpellVisual value(%u), skipped.",table,spell,spellVisual);
            continue;
        }

        // TODO: for spellCategory better check need dbc loading
        if (category < -1 || (category >=0 && sSpellCategoryStore.find(category) == sSpellCategoryStore.end()))
        {
            sLog.outError("Table '%s' for spell %u have wrong SpellCategory value(%u), skipped.",table,spell,category);
            continue;
        }

        if (effectType < -1 || effectType >= TOTAL_SPELL_EFFECTS)
        {
            sLog.outError("Table '%s' for spell %u have wrong SpellEffect type value(%u), skipped.",table,spell,effectType);
            continue;
        }

        if (auraType < -1 || auraType >= TOTAL_AURAS)
        {
            sLog.outError("Table '%s' for spell %u have wrong SpellAura type value(%u), skipped.",table,spell,auraType);
            continue;
        }

        if (effectIdx < -1 || effectIdx >= 3)
        {
            sLog.outError("Table '%s' for spell %u have wrong EffectIdx value(%u), skipped.",table,spell,effectIdx);
            continue;
        }

        // now checks of requirements

        if (spell)
        {
            ++countSpells;

            SpellEntry const* spellEntry = sSpellStore.LookupEntry(spell);
            if(!spellEntry)
            {
                sLog.outError("Spell %u '%s' not exist but used in %s.",spell,name.c_str(),code.c_str());
                continue;
            }

            if (family >= 0 && spellEntry->SpellFamilyName != uint32(family))
            {
                sLog.outError("Spell %u '%s' family(%u) <> %u but used in %s.",spell,name.c_str(),spellEntry->SpellFamilyName,family,code.c_str());
                continue;
            }

            if (familyMask != ~ClassFamilyMask())
            {
                if (familyMask == ClassFamilyMask())
                {
                    if (spellEntry->SpellFamilyFlags)
                    {
                        sLog.outError("Spell %u '%s' not fit to (" I64FMT "," I32FMT ") but used in %s.",
                            spell, name.c_str(), familyMask.Flags, familyMask.Flags2, code.c_str());
                        continue;
                    }

                }
                else
                {
                    if (!spellEntry->IsFitToFamilyMask(familyMask))
                    {
                        sLog.outError("Spell %u '%s' not fit to (" I64FMT "," I32FMT ") but used in %s.",
                            spell, name.c_str(), familyMask.Flags, familyMask.Flags2, code.c_str());
                        continue;
                    }

                }
            }

            if (spellIcon >= 0 && spellEntry->SpellIconID != uint32(spellIcon))
            {
                sLog.outError("Spell %u '%s' icon(%u) <> %u but used in %s.",spell,name.c_str(),spellEntry->SpellIconID,spellIcon,code.c_str());
                continue;
            }

            if (spellVisual >= 0 && spellEntry->SpellVisual[0] != uint32(spellVisual))
            {
                sLog.outError("Spell %u '%s' visual(%u) <> %u but used in %s.",spell,name.c_str(),spellEntry->SpellVisual[0],spellVisual,code.c_str());
                continue;
            }

            if (category >= 0 && spellEntry->Category != uint32(category))
            {
                sLog.outError("Spell %u '%s' category(%u) <> %u but used in %s.",spell,name.c_str(),spellEntry->Category,category,code.c_str());
                continue;
            }

            if (effectIdx >= EFFECT_INDEX_0)
            {
                if (effectType >= 0 && spellEntry->Effect[effectIdx] != uint32(effectType))
                {
                    sLog.outError("Spell %u '%s' effect%d <> %u but used in %s.",spell,name.c_str(),effectIdx+1,effectType,code.c_str());
                    continue;
                }

                if (auraType >= 0 && spellEntry->EffectApplyAuraName[effectIdx] != uint32(auraType))
                {
                    sLog.outError("Spell %u '%s' aura%d <> %u but used in %s.",spell,name.c_str(),effectIdx+1,auraType,code.c_str());
                    continue;
                }

            }
            else
            {
                if (effectType >= 0 && !IsSpellHaveEffect(spellEntry,SpellEffects(effectType)))
                {
                    sLog.outError("Spell %u '%s' not have effect %u but used in %s.",spell,name.c_str(),effectType,code.c_str());
                    continue;
                }

                if (auraType >= 0 && !IsSpellHaveAura(spellEntry, AuraType(auraType)))
                {
                    sLog.outError("Spell %u '%s' not have aura %u but used in %s.",spell,name.c_str(),auraType,code.c_str());
                    continue;
                }
            }
        }
        else
        {
            ++countMasks;

            bool found = false;
            for(uint32 spellId = 1; spellId < sSpellStore.GetNumRows(); ++spellId)
            {
                SpellEntry const* spellEntry = sSpellStore.LookupEntry(spellId);
                if (!spellEntry)
                    continue;

                if (family >=0 && spellEntry->SpellFamilyName != uint32(family))
                    continue;

                if (familyMask != ~ClassFamilyMask())
                {
                    if (familyMask == ClassFamilyMask())
                    {
                        if (spellEntry->SpellFamilyFlags)
                            continue;
                    }
                    else
                    {
                        if (!spellEntry->IsFitToFamilyMask(familyMask))
                            continue;
                    }
                }

                if (spellIcon >= 0 && spellEntry->SpellIconID != uint32(spellIcon))
                    continue;

                if (spellVisual >= 0 && spellEntry->SpellVisual[0] != uint32(spellVisual))
                    continue;

                if (category >= 0 && spellEntry->Category != uint32(category))
                    continue;

                if (effectIdx >= 0)
                {
                    if (effectType >=0 && spellEntry->Effect[effectIdx] != uint32(effectType))
                        continue;

                    if (auraType >=0 && spellEntry->EffectApplyAuraName[effectIdx] != uint32(auraType))
                        continue;
                }
                else
                {
                    if (effectType >=0 && !IsSpellHaveEffect(spellEntry,SpellEffects(effectType)))
                        continue;

                    if (auraType >=0 && !IsSpellHaveAura(spellEntry,AuraType(auraType)))
                        continue;
                }

                found = true;
                break;
            }

            if (!found)
            {
                if (effectIdx >= 0)
                    sLog.outError("Spells '%s' not found for family %i (" I64FMT "," I32FMT ") icon(%i) visual(%i) category(%i) effect%d(%i) aura%d(%i) but used in %s",
                        name.c_str(),family,familyMask.Flags,familyMask.Flags2,spellIcon,spellVisual,category,effectIdx+1,effectType,effectIdx+1,auraType,code.c_str());
                else
                    sLog.outError("Spells '%s' not found for family %i (" I64FMT "," I32FMT ") icon(%i) visual(%i) category(%i) effect(%i) aura(%i) but used in %s",
                        name.c_str(),family,familyMask.Flags,familyMask.Flags2,spellIcon,spellVisual,category,effectType,auraType,code.c_str());
                continue;
            }
        }

    } while( result->NextRow() );

    delete result;

    sLog.outString();
    sLog.outString( ">> Checked %u spells and %u spell masks", countSpells, countMasks );
}

DiminishingGroup GetDiminishingReturnsGroupForSpell(SpellEntry const* spellproto, bool triggered)
{
    // Explicit Diminishing Groups
    switch(spellproto->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
            // some generic arena related spells have by some strange reason MECHANIC_TURN
            if  (spellproto->Mechanic == MECHANIC_TURN)
                return DIMINISHING_NONE;
            break;
        case SPELLFAMILY_MAGE:
            // Dragon's Breath
            if  (spellproto->SpellIconID == 1548)
                return DIMINISHING_DISORIENT;
            // Slow
            else if (spellproto->Id == 31589)
                return DIMINISHING_LIMITONLY;
            // Charge
            else if (spellproto->Id == 7922)
                return DIMINISHING_CHARGE;
            break;
        case SPELLFAMILY_ROGUE:
        {
            // Blind
            if (spellproto->SpellFamilyFlags.test<CF_ROGUE_BLIND>())
                return DIMINISHING_FEAR_CHARM_BLIND;
            // Cheap Shot
            else if (spellproto->SpellFamilyFlags.test<CF_ROGUE_CHEAP_SHOT>())
                return DIMINISHING_CHEAPSHOT_POUNCE;
            // Crippling poison - Limit to 10 seconds in PvP (No SpellFamilyFlags)
            else if (spellproto->SpellIconID == 163)
                return DIMINISHING_LIMITONLY;
            // Wound poison - Limit to 10 seconds in PvP (No SpellFamilyFlags)
            else if (spellproto->SpellIconID == 1496)
                return DIMINISHING_LIMITONLY;
            break;
        }
        case SPELLFAMILY_HUNTER:
        {
            // Freezing Trap & Freezing Arrow & Wyvern Sting
            if  (spellproto->SpellIconID == 180 || spellproto->SpellIconID == 1721)
                return DIMINISHING_DISORIENT;
            // Hunters Mark - limit to 2 minutes in PvP
            else if (spellproto->SpellFamilyFlags.test<CF_HUNTER_HUNTERS_MARK>())
                return DIMINISHING_LIMITONLY;
            break;
        }
        case SPELLFAMILY_PALADIN:
        {
            // Judgement of Justice - limit to 10 seconds in PvP
            if (spellproto->SpellFamilyFlags.test<CF_PALADIN_JUDGEMENT_OF_JUSTICE>())
                return DIMINISHING_LIMITONLY;
            // Turn Evil
            else if (spellproto->SpellFamilyFlags.test<CF_PALADIN_TURN_EVIL>())
                return DIMINISHING_FEAR_CHARM_BLIND;
            break;
        }
        case SPELLFAMILY_WARLOCK:
        {
            // Curses/etc
            if (spellproto->SpellFamilyFlags.test<CF_WARLOCK_MISC_DEBUFFS, CF_WARLOCK_CURSE_OF_THE_ELEMENTS>())
                return DIMINISHING_LIMITONLY;
            break;
        }
        case SPELLFAMILY_DRUID:
        {
            // Cyclone
            if (spellproto->SpellFamilyFlags.test<CF_DRUID_CYCLONE>())
                return DIMINISHING_CYCLONE;
            // Pounce
            else if (spellproto->SpellFamilyFlags.test<CF_DRUID_POUNCE>())
                return DIMINISHING_CHEAPSHOT_POUNCE;
            // Faerie Fire
            else if (spellproto->SpellFamilyFlags.test<CF_DRUID_FAERIE_FIRE>())
                return DIMINISHING_LIMITONLY;
            break;
        }
        case SPELLFAMILY_WARRIOR:
        {
            // Hamstring - limit duration to 10s in PvP
            if (spellproto->SpellFamilyFlags.test<CF_WARRIOR_HAMSTRING>())
                return DIMINISHING_LIMITONLY;
            // Charge - since 3.1.0
            if (spellproto->Id == 7922)
                return DIMINISHING_CHARGE;
            break;
        }
        case SPELLFAMILY_PRIEST:
        {
            // Shackle Undead
            if (spellproto->SpellIconID == 27)
                return DIMINISHING_DISORIENT;
            break;
        }
        case SPELLFAMILY_DEATHKNIGHT:
        {
            // Hungering Cold (no flags)
            if (spellproto->SpellIconID == 2797)
                return DIMINISHING_DISORIENT;
            break;
        }
        default:
            break;
    }

    // Taunt dimishing returns
    if (IsSpellHaveAura(spellproto, SPELL_AURA_MOD_TAUNT))
        return DIMINISHING_TAUNT;

    // Get by mechanic
    uint32 mechanic = GetAllSpellMechanicMask(spellproto);
    if (!mechanic)
        return DIMINISHING_NONE;

    if (mechanic & ((1<<(MECHANIC_STUN-1))|(1<<(MECHANIC_SHACKLE-1))))
        return triggered ? DIMINISHING_TRIGGER_STUN : DIMINISHING_CONTROL_STUN;
    if (mechanic & ((1<<(MECHANIC_SLEEP-1))|(1<<(MECHANIC_FREEZE-1))))
        return DIMINISHING_FREEZE_SLEEP;
    if (mechanic & ((1<<(MECHANIC_KNOCKOUT-1))|(1<<(MECHANIC_POLYMORPH-1))|(1<<(MECHANIC_SAPPED-1))))
        return DIMINISHING_DISORIENT;
    if (mechanic & (1<<(MECHANIC_ROOT-1)))
        return triggered ? DIMINISHING_TRIGGER_ROOT : DIMINISHING_CONTROL_ROOT;
    if (mechanic & ((1<<(MECHANIC_FEAR-1))|(1<<(MECHANIC_CHARM-1))|(1<<(MECHANIC_TURN-1))))
        return DIMINISHING_FEAR_CHARM_BLIND;
    if (mechanic & ((1<<(MECHANIC_SILENCE-1))|(1<<(MECHANIC_INTERRUPT-1))))
        return DIMINISHING_SILENCE;
    if (mechanic & (1<<(MECHANIC_DISARM-1)))
        return DIMINISHING_DISARM;
    if (mechanic & (1<<(MECHANIC_BANISH-1)))
        return DIMINISHING_BANISH;
    if (mechanic & (1<<(MECHANIC_HORROR-1)))
        return DIMINISHING_HORROR;

    return DIMINISHING_NONE;
}

int32 GetDiminishingReturnsLimitDuration(DiminishingGroup group, SpellEntry const* spellproto)
{
    if(!IsDiminishingReturnsGroupDurationLimited(group))
        return 0;

    // Explicit diminishing duration
    switch(spellproto->SpellFamilyName)
    {
        case SPELLFAMILY_WARLOCK:
        {
            // Curse of the Elements - limit to 2 minutes in PvP
            if (spellproto->SpellFamilyFlags.test<CF_WARLOCK_CURSE_OF_THE_ELEMENTS>())
                return 120000;
            // Banish - limit to 6 seconds in PvP (3.1)
            else if (spellproto->SpellFamilyFlags.test<CF_WARLOCK_BANISH>())
                return 6000;
            // Curse of agony - limit to 24 seconds in PvP (?)
            else if (spellproto->SpellFamilyFlags.test<CF_WARLOCK_CURSE_OF_AGONY>())
                return 24000;
            // Shadow embrace - limit to 12 seconds in PvP (?)
            else if (spellproto->SpellFamilyFlags.test<CF_WARLOCK_MISC_DEBUFFS>() && spellproto->SpellIconID == 2209)
                return 12000;
            break;
        }
        case SPELLFAMILY_HUNTER:
        {
            // Wyvern Sting
            if (spellproto->SpellFamilyFlags.test<CF_HUNTER_WYVERN_STING2>())
                return 6000;
            // Hunters Mark - limit to 2 minutes in PvP
            else if (spellproto->SpellFamilyFlags.test<CF_HUNTER_HUNTERS_MARK>())
                return 120000;
            break;
        }
        case SPELLFAMILY_PALADIN:
        {
            // Repentance - limit to 6 seconds in PvP
            if (spellproto->SpellFamilyFlags.test<CF_PALADIN_REPENTANCE>())
                return 6000;
            break;
        }
        case SPELLFAMILY_DRUID:
        {
            // Faerie Fire - limit to 40 seconds in PvP (3.1)
            if (spellproto->SpellFamilyFlags.test<CF_DRUID_FAERIE_FIRE>())
                return 40000;
            break;
        }
        default:
            break;
    }

    return 10000;
}

bool IsDiminishingReturnsGroupDurationLimited(DiminishingGroup group)
{
    switch(group)
    {
        case DIMINISHING_CONTROL_STUN:
        case DIMINISHING_TRIGGER_STUN:
        case DIMINISHING_CONTROL_ROOT:
        case DIMINISHING_TRIGGER_ROOT:
        case DIMINISHING_FEAR_CHARM_BLIND:
        case DIMINISHING_DISORIENT:
        case DIMINISHING_CHEAPSHOT_POUNCE:
        case DIMINISHING_FREEZE_SLEEP:
        case DIMINISHING_CYCLONE:
        case DIMINISHING_BANISH:
        case DIMINISHING_LIMITONLY:
        case DIMINISHING_CHARGE:
            return true;
        default:
            return false;
    }
    return false;
}

DiminishingReturnsType GetDiminishingReturnsGroupType(DiminishingGroup group)
{
    switch(group)
    {
        case DIMINISHING_CYCLONE:
        case DIMINISHING_TRIGGER_STUN:
        case DIMINISHING_CONTROL_STUN:
        case DIMINISHING_CHARGE:
            return DRTYPE_ALL;
        case DIMINISHING_CONTROL_ROOT:
        case DIMINISHING_TRIGGER_ROOT:
        case DIMINISHING_FEAR_CHARM_BLIND:
        case DIMINISHING_DISORIENT:
        case DIMINISHING_SILENCE:
        case DIMINISHING_DISARM:
        case DIMINISHING_HORROR:
        case DIMINISHING_FREEZE_SLEEP:
        case DIMINISHING_BANISH:
        case DIMINISHING_CHEAPSHOT_POUNCE:
            return DRTYPE_PLAYER;
        case DIMINISHING_TAUNT:
            return DRTYPE_TAUNT;
        default:
            break;
    }

    return DRTYPE_NONE;
}

bool SpellArea::IsFitToRequirements(Player const* player, uint32 newZone, uint32 newArea) const
{
    if (gender!=GENDER_NONE)
    {
        // not in expected gender
        if(!player || gender != player->getGender())
            return false;
    }

    if (raceMask)
    {
        // not in expected race
        if(!player || !(raceMask & player->getRaceMask()))
            return false;
    }

    if (areaId)
    {
        // not in expected zone
        if (newZone!=areaId && newArea!=areaId)
            return false;
    }

    if (questStart)
    {
        // not in expected required quest state
        if(!player || (!questStartCanActive || !player->IsActiveQuest(questStart)) && !player->GetQuestRewardStatus(questStart))
            return false;
    }

    if (questEnd)
    {
        // not in expected forbidden quest state
        if(!player || player->GetQuestRewardStatus(questEnd))
            return false;
    }

    if (auraSpell)
    {
        // not have expected aura
        if(!player)
            return false;
        if (auraSpell > 0)
            // have expected aura
            return player->HasAura(auraSpell, EFFECT_INDEX_0);
        else
            // not have expected aura
            return !player->HasAura(-auraSpell, EFFECT_INDEX_0);
    }

    return true;
}

SpellEntry const* GetSpellEntryByDifficulty(uint32 id, Difficulty difficulty, bool isRaid)
{
    SpellDifficultyEntry const* spellDiff = sSpellDifficultyStore.LookupEntry(id);

    if (!spellDiff)
        return NULL;

    DEBUG_LOG("Searching spell %u in SpellDifficulty.dbc: Result is: %u/%u/%u/%u ",id,
    spellDiff->spellId[RAID_DIFFICULTY_10MAN_NORMAL],
    spellDiff->spellId[RAID_DIFFICULTY_25MAN_NORMAL],
    spellDiff->spellId[RAID_DIFFICULTY_10MAN_HEROIC],
    spellDiff->spellId[RAID_DIFFICULTY_25MAN_HEROIC]);


    SpellEntry const* spellInfo = sSpellStore.LookupEntry(spellDiff->spellId[RAID_DIFFICULTY_10MAN_NORMAL]);
    bool _isRaid = spellInfo ? (spellInfo->HasAttribute(SPELL_ATTR_EX6_NORMAL_DIFFICULTY) ? false : isRaid) : isRaid;

    for (Difficulty diff = difficulty; diff >= REGULAR_DIFFICULTY; diff = GetPrevDifficulty(diff, _isRaid))
    {
        if (spellDiff->spellId[diff])
            return sSpellStore.LookupEntry(spellDiff->spellId[diff]);
    }

    return NULL;
}

uint32 GetProcFlag(SpellEntry const* spellInfo)
{
    if (!spellInfo)
        return 0;

    SpellProcEventEntry const* spellProcEvent = sSpellMgr.GetSpellProcEvent(spellInfo->Id);

    // Get EventProcFlag
    uint32 EventProcFlag = 0;
    if (spellProcEvent && spellProcEvent->procFlags) // if exist get custom spellProcEvent->procFlags
        EventProcFlag = spellProcEvent->procFlags;
    else
        EventProcFlag = spellInfo->procFlags;       // else get from spell proto

    return EventProcFlag;
}

ClassFamilyMask const ClassFamilyMask::Null = ClassFamilyMask();

bool IsEffectCauseDamage(SpellEntry const *spellInfo, SpellEffectIndex effecIdx)
{
    if (!spellInfo)
        return false;

    switch (spellInfo->Effect[effecIdx])
    {
        // need much more correct effect definition in this check
        case SPELL_EFFECT_NONE:
        case SPELL_EFFECT_DISPEL:
        case SPELL_EFFECT_TRIGGER_SPELL:
        case SPELL_EFFECT_DISPEL_MECHANIC:
            return false;

        case SPELL_EFFECT_SCHOOL_DAMAGE:
        case SPELL_EFFECT_WEAPON_DAMAGE_NOSCHOOL:
        case SPELL_EFFECT_WEAPON_PERCENT_DAMAGE:
        case SPELL_EFFECT_WEAPON_DAMAGE:
        case SPELL_EFFECT_NORMALIZED_WEAPON_DMG:

        // also all undefined (default mangos way)
        default:
            return true;
    }
}

SpellPreferredTargetType GetPreferredTargetForSpell(SpellEntry const* spellInfo)
{
    if (!spellInfo)
        return SPELL_PREFERRED_TARGET_SELF;

    if (IsSpellWithCasterSourceTargetsOnly(spellInfo))
        return SPELL_PREFERRED_TARGET_SELF;

    bool positive = IsExplicitPositiveTarget(spellInfo->Id) || IsPositiveSpell(spellInfo);

    if (IsAreaOfEffectSpell(spellInfo))
        return positive ? SPELL_PREFERRED_TARGET_SELF : SPELL_PREFERRED_TARGET_VICTIM;

    uint32 firstTarget = spellInfo->EffectImplicitTargetA[EFFECT_INDEX_0];

    if (!IsSpellCauseDamage(spellInfo) && firstTarget == TARGET_DUELVSPLAYER)
        return SPELL_PREFERRED_TARGET_RANDOM;

    if (positive)
    {
        switch (firstTarget)
        {
            case TARGET_MASTER:
                return SPELL_PREFERRED_TARGET_OWNER;
            case TARGET_SINGLE_FRIEND_2:
                return SPELL_PREFERRED_TARGET_FRIEND;
            default:
                break;
        }

        if (IsCasterSourceTarget(firstTarget))
            return SPELL_PREFERRED_TARGET_SELF;

        if (IsSpellAppliesAura(spellInfo))
            return HasAreaAuraEffect(spellInfo) ? SPELL_PREFERRED_TARGET_SELF : SPELL_PREFERRED_TARGET_FRIEND;

        return SPELL_PREFERRED_TARGET_SELF;
    }
    else
    {
        if (IsCasterSourceTarget(firstTarget))
            return SPELL_PREFERRED_TARGET_SELF;

        if (IsSpellCauseDamage(spellInfo))
            return SPELL_PREFERRED_TARGET_VICTIM;

        return SPELL_PREFERRED_TARGET_ENEMY;
    }

    return SPELL_PREFERRED_TARGET_SELF;
}
