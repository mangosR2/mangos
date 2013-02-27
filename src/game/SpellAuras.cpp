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

#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "WorldPacket.h"
#include "WorldSession.h"
#include "Opcodes.h"
#include "Log.h"
#include "UpdateMask.h"
#include "World.h"
#include "ObjectMgr.h"
#include "SpellMgr.h"
#include "Player.h"
#include "Unit.h"
#include "Spell.h"
#include "DynamicObject.h"
#include "Group.h"
#include "UpdateData.h"
#include "ObjectAccessor.h"
#include "Policies/Singleton.h"
#include "Totem.h"
#include "Creature.h"
#include "Formulas.h"
#include "BattleGround/BattleGround.h"
#include "OutdoorPvP/OutdoorPvP.h"
#include "CreatureAI.h"
#include "ScriptMgr.h"
#include "Util.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Vehicle.h"
#include "CellImpl.h"
#include "InstanceData.h"
#include "Language.h"
#include "MapManager.h"

#define NULL_AURA_SLOT 0xFF

pAuraHandler AuraHandler[TOTAL_AURAS]=
{
    &Aura::HandleNULL,                                      //  0 SPELL_AURA_NONE
    &Aura::HandleBindSight,                                 //  1 SPELL_AURA_BIND_SIGHT
    &Aura::HandleModPossess,                                //  2 SPELL_AURA_MOD_POSSESS
    &Aura::HandlePeriodicDamage,                            //  3 SPELL_AURA_PERIODIC_DAMAGE
    &Aura::HandleAuraDummy,                                 //  4 SPELL_AURA_DUMMY
    &Aura::HandleModConfuse,                                //  5 SPELL_AURA_MOD_CONFUSE
    &Aura::HandleModCharm,                                  //  6 SPELL_AURA_MOD_CHARM
    &Aura::HandleModFear,                                   //  7 SPELL_AURA_MOD_FEAR
    &Aura::HandlePeriodicHeal,                              //  8 SPELL_AURA_PERIODIC_HEAL
    &Aura::HandleModAttackSpeed,                            //  9 SPELL_AURA_MOD_ATTACKSPEED
    &Aura::HandleModThreat,                                 // 10 SPELL_AURA_MOD_THREAT
    &Aura::HandleModTaunt,                                  // 11 SPELL_AURA_MOD_TAUNT
    &Aura::HandleAuraModStun,                               // 12 SPELL_AURA_MOD_STUN
    &Aura::HandleModDamageDone,                             // 13 SPELL_AURA_MOD_DAMAGE_DONE
    &Aura::HandleNoImmediateEffect,                         // 14 SPELL_AURA_MOD_DAMAGE_TAKEN   implemented in Unit::MeleeDamageBonusTaken and Unit::SpellBaseDamageBonusTaken
    &Aura::HandleNoImmediateEffect,                         // 15 SPELL_AURA_DAMAGE_SHIELD      implemented in Unit::DealMeleeDamage
    &Aura::HandleModStealth,                                // 16 SPELL_AURA_MOD_STEALTH
    &Aura::HandleNoImmediateEffect,                         // 17 SPELL_AURA_MOD_STEALTH_DETECT implemented in Unit::isVisibleForOrDetect
    &Aura::HandleInvisibility,                              // 18 SPELL_AURA_MOD_INVISIBILITY
    &Aura::HandleInvisibilityDetect,                        // 19 SPELL_AURA_MOD_INVISIBILITY_DETECTION
    &Aura::HandleAuraModTotalHealthPercentRegen,            // 20 SPELL_AURA_OBS_MOD_HEALTH
    &Aura::HandleAuraModTotalManaPercentRegen,              // 21 SPELL_AURA_OBS_MOD_MANA
    &Aura::HandleAuraModResistance,                         // 22 SPELL_AURA_MOD_RESISTANCE
    &Aura::HandlePeriodicTriggerSpell,                      // 23 SPELL_AURA_PERIODIC_TRIGGER_SPELL
    &Aura::HandlePeriodicEnergize,                          // 24 SPELL_AURA_PERIODIC_ENERGIZE
    &Aura::HandleAuraModPacify,                             // 25 SPELL_AURA_MOD_PACIFY
    &Aura::HandleAuraModRoot,                               // 26 SPELL_AURA_MOD_ROOT
    &Aura::HandleAuraModSilence,                            // 27 SPELL_AURA_MOD_SILENCE
    &Aura::HandleAuraModReflectSpells,                      // 28 SPELL_AURA_REFLECT_SPELLS    actual reflecting implemented in Unit::SpellHitResult
    &Aura::HandleAuraModStat,                               // 29 SPELL_AURA_MOD_STAT
    &Aura::HandleAuraModSkill,                              // 30 SPELL_AURA_MOD_SKILL
    &Aura::HandleAuraModIncreaseSpeed,                      // 31 SPELL_AURA_MOD_INCREASE_SPEED
    &Aura::HandleAuraModIncreaseMountedSpeed,               // 32 SPELL_AURA_MOD_INCREASE_MOUNTED_SPEED
    &Aura::HandleAuraModDecreaseSpeed,                      // 33 SPELL_AURA_MOD_DECREASE_SPEED
    &Aura::HandleAuraModIncreaseHealth,                     // 34 SPELL_AURA_MOD_INCREASE_HEALTH
    &Aura::HandleAuraModIncreaseEnergy,                     // 35 SPELL_AURA_MOD_INCREASE_ENERGY
    &Aura::HandleAuraModShapeshift,                         // 36 SPELL_AURA_MOD_SHAPESHIFT
    &Aura::HandleAuraModEffectImmunity,                     // 37 SPELL_AURA_EFFECT_IMMUNITY
    &Aura::HandleAuraModStateImmunity,                      // 38 SPELL_AURA_STATE_IMMUNITY
    &Aura::HandleAuraModSchoolImmunity,                     // 39 SPELL_AURA_SCHOOL_IMMUNITY
    &Aura::HandleAuraModDmgImmunity,                        // 40 SPELL_AURA_DAMAGE_IMMUNITY
    &Aura::HandleAuraModDispelImmunity,                     // 41 SPELL_AURA_DISPEL_IMMUNITY
    &Aura::HandleAuraProcTriggerSpell,                      // 42 SPELL_AURA_PROC_TRIGGER_SPELL  implemented in Unit::ProcDamageAndSpellFor and Unit::HandleProcTriggerSpell
    &Aura::HandleNoImmediateEffect,                         // 43 SPELL_AURA_PROC_TRIGGER_DAMAGE implemented in Unit::ProcDamageAndSpellFor
    &Aura::HandleAuraTrackCreatures,                        // 44 SPELL_AURA_TRACK_CREATURES
    &Aura::HandleAuraTrackResources,                        // 45 SPELL_AURA_TRACK_RESOURCES
    &Aura::HandleUnused,                                    // 46 SPELL_AURA_46 (used in test spells 54054 and 54058, and spell 48050) (3.0.8a-3.2.2a)
    &Aura::HandleAuraModParryPercent,                       // 47 SPELL_AURA_MOD_PARRY_PERCENT
    &Aura::HandleNoImmediateEffect,                         // 48 SPELL_AURA_PERIODIC_TRIGGER_BY_CLIENT (Client periodic trigger spell by self (3 spells in 3.3.5a)). implemented in pet/player cast chains.
    &Aura::HandleAuraModDodgePercent,                       // 49 SPELL_AURA_MOD_DODGE_PERCENT
    &Aura::HandleNoImmediateEffect,                         // 50 SPELL_AURA_MOD_CRITICAL_HEALING_AMOUNT implemented in Unit::SpellCriticalHealingBonus
    &Aura::HandleAuraModBlockPercent,                       // 51 SPELL_AURA_MOD_BLOCK_PERCENT
    &Aura::HandleAuraModCritPercent,                        // 52 SPELL_AURA_MOD_CRIT_PERCENT
    &Aura::HandlePeriodicLeech,                             // 53 SPELL_AURA_PERIODIC_LEECH
    &Aura::HandleModHitChance,                              // 54 SPELL_AURA_MOD_HIT_CHANCE
    &Aura::HandleModSpellHitChance,                         // 55 SPELL_AURA_MOD_SPELL_HIT_CHANCE
    &Aura::HandleAuraTransform,                             // 56 SPELL_AURA_TRANSFORM
    &Aura::HandleModSpellCritChance,                        // 57 SPELL_AURA_MOD_SPELL_CRIT_CHANCE
    &Aura::HandleAuraModIncreaseSwimSpeed,                  // 58 SPELL_AURA_MOD_INCREASE_SWIM_SPEED
    &Aura::HandleNoImmediateEffect,                         // 59 SPELL_AURA_MOD_DAMAGE_DONE_CREATURE implemented in Unit::MeleeDamageBonusDone and Unit::SpellDamageBonusDone
    &Aura::HandleAuraModPacifyAndSilence,                   // 60 SPELL_AURA_MOD_PACIFY_SILENCE
    &Aura::HandleAuraModScale,                              // 61 SPELL_AURA_MOD_SCALE
    &Aura::HandlePeriodicHealthFunnel,                      // 62 SPELL_AURA_PERIODIC_HEALTH_FUNNEL
    &Aura::HandleUnused,                                    // 63 unused (3.0.8a-3.2.2a) old SPELL_AURA_PERIODIC_MANA_FUNNEL
    &Aura::HandlePeriodicManaLeech,                         // 64 SPELL_AURA_PERIODIC_MANA_LEECH
    &Aura::HandleModCastingSpeed,                           // 65 SPELL_AURA_MOD_CASTING_SPEED_NOT_STACK
    &Aura::HandleFeignDeath,                                // 66 SPELL_AURA_FEIGN_DEATH
    &Aura::HandleAuraModDisarm,                             // 67 SPELL_AURA_MOD_DISARM
    &Aura::HandleAuraModStalked,                            // 68 SPELL_AURA_MOD_STALKED
    &Aura::HandleSchoolAbsorb,                              // 69 SPELL_AURA_SCHOOL_ABSORB implemented in Unit::CalculateAbsorbAndResist
    &Aura::HandleUnused,                                    // 70 SPELL_AURA_EXTRA_ATTACKS      Useless, used by only one spell 41560 that has only visual effect (3.2.2a)
    &Aura::HandleModSpellCritChanceShool,                   // 71 SPELL_AURA_MOD_SPELL_CRIT_CHANCE_SCHOOL
    &Aura::HandleModPowerCostPCT,                           // 72 SPELL_AURA_MOD_POWER_COST_SCHOOL_PCT
    &Aura::HandleModPowerCost,                              // 73 SPELL_AURA_MOD_POWER_COST_SCHOOL
    &Aura::HandleNoImmediateEffect,                         // 74 SPELL_AURA_REFLECT_SPELLS_SCHOOL  implemented in Unit::SpellHitResult
    &Aura::HandleNoImmediateEffect,                         // 75 SPELL_AURA_MOD_LANGUAGE           implemented in WorldSession::HandleMessagechatOpcode
    &Aura::HandleFarSight,                                  // 76 SPELL_AURA_FAR_SIGHT
    &Aura::HandleModMechanicImmunity,                       // 77 SPELL_AURA_MECHANIC_IMMUNITY
    &Aura::HandleAuraMounted,                               // 78 SPELL_AURA_MOUNTED
    &Aura::HandleModDamagePercentDone,                      // 79 SPELL_AURA_MOD_DAMAGE_PERCENT_DONE
    &Aura::HandleModPercentStat,                            // 80 SPELL_AURA_MOD_PERCENT_STAT
    &Aura::HandleNoImmediateEffect,                         // 81 SPELL_AURA_SPLIT_DAMAGE_PCT       implemented in Unit::CalculateAbsorbAndResist
    &Aura::HandleWaterBreathing,                            // 82 SPELL_AURA_WATER_BREATHING
    &Aura::HandleModBaseResistance,                         // 83 SPELL_AURA_MOD_BASE_RESISTANCE
    &Aura::HandleModRegen,                                  // 84 SPELL_AURA_MOD_REGEN
    &Aura::HandleModPowerRegen,                             // 85 SPELL_AURA_MOD_POWER_REGEN
    &Aura::HandleChannelDeathItem,                          // 86 SPELL_AURA_CHANNEL_DEATH_ITEM
    &Aura::HandleDamagePercentTaken,                        // 87 SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN implemented in Unit::MeleeDamageBonusTaken and Unit::SpellDamageBonusTaken
    &Aura::HandleNoImmediateEffect,                         // 88 SPELL_AURA_MOD_HEALTH_REGEN_PERCENT implemented in Player::RegenerateHealth
    &Aura::HandlePeriodicDamagePCT,                         // 89 SPELL_AURA_PERIODIC_DAMAGE_PERCENT
    &Aura::HandleUnused,                                    // 90 unused (3.0.8a-3.2.2a) old SPELL_AURA_MOD_RESIST_CHANCE
    &Aura::HandleNoImmediateEffect,                         // 91 SPELL_AURA_MOD_DETECT_RANGE implemented in Creature::GetAttackDistance
    &Aura::HandlePreventFleeing,                            // 92 SPELL_AURA_PREVENTS_FLEEING
    &Aura::HandleModUnattackable,                           // 93 SPELL_AURA_MOD_UNATTACKABLE
    &Aura::HandleNoImmediateEffect,                         // 94 SPELL_AURA_INTERRUPT_REGEN implemented in Player::RegenerateAll
    &Aura::HandleAuraGhost,                                 // 95 SPELL_AURA_GHOST
    &Aura::HandleNoImmediateEffect,                         // 96 SPELL_AURA_SPELL_MAGNET implemented in Unit::SelectMagnetTarget
    &Aura::HandleManaShield,                                // 97 SPELL_AURA_MANA_SHIELD implemented in Unit::CalculateAbsorbAndResist
    &Aura::HandleAuraModSkill,                              // 98 SPELL_AURA_MOD_SKILL_TALENT
    &Aura::HandleAuraModAttackPower,                        // 99 SPELL_AURA_MOD_ATTACK_POWER
    &Aura::HandleUnused,                                    //100 SPELL_AURA_AURAS_VISIBLE obsolete 3.x? all player can see all auras now, but still have 2 spells including GM-spell (1852,2855)
    &Aura::HandleModResistancePercent,                      //101 SPELL_AURA_MOD_RESISTANCE_PCT
    &Aura::HandleNoImmediateEffect,                         //102 SPELL_AURA_MOD_MELEE_ATTACK_POWER_VERSUS implemented in Unit::MeleeDamageBonusDone
    &Aura::HandleAuraModTotalThreat,                        //103 SPELL_AURA_MOD_TOTAL_THREAT
    &Aura::HandleAuraWaterWalk,                             //104 SPELL_AURA_WATER_WALK
    &Aura::HandleAuraFeatherFall,                           //105 SPELL_AURA_FEATHER_FALL
    &Aura::HandleAuraHover,                                 //106 SPELL_AURA_HOVER
    &Aura::HandleAddModifier,                               //107 SPELL_AURA_ADD_FLAT_MODIFIER
    &Aura::HandleAddModifier,                               //108 SPELL_AURA_ADD_PCT_MODIFIER
    &Aura::HandleNoImmediateEffect,                         //109 SPELL_AURA_ADD_TARGET_TRIGGER
    &Aura::HandleModPowerRegenPCT,                          //110 SPELL_AURA_MOD_POWER_REGEN_PERCENT
    &Aura::HandleNoImmediateEffect,                         //111 SPELL_AURA_ADD_CASTER_HIT_TRIGGER implemented in Unit::SelectMagnetTarget
    &Aura::HandleNoImmediateEffect,                         //112 SPELL_AURA_OVERRIDE_CLASS_SCRIPTS implemented in diff functions.
    &Aura::HandleNoImmediateEffect,                         //113 SPELL_AURA_MOD_RANGED_DAMAGE_TAKEN implemented in Unit::MeleeDamageBonusTaken
    &Aura::HandleNoImmediateEffect,                         //114 SPELL_AURA_MOD_RANGED_DAMAGE_TAKEN_PCT implemented in Unit::MeleeDamageBonusTaken
    &Aura::HandleNoImmediateEffect,                         //115 SPELL_AURA_MOD_HEALING                 implemented in Unit::SpellBaseHealingBonusTaken
    &Aura::HandleNoImmediateEffect,                         //116 SPELL_AURA_MOD_REGEN_DURING_COMBAT     imppemented in Player::RegenerateAll and Player::RegenerateHealth
    &Aura::HandleNoImmediateEffect,                         //117 SPELL_AURA_MOD_MECHANIC_RESISTANCE     implemented in Unit::MagicSpellHitResult
    &Aura::HandleNoImmediateEffect,                         //118 SPELL_AURA_MOD_HEALING_PCT             implemented in Unit::SpellHealingBonusTaken
    &Aura::HandleUnused,                                    //119 unused (3.0.8a-3.2.2a) old SPELL_AURA_SHARE_PET_TRACKING
    &Aura::HandleAuraUntrackable,                           //120 SPELL_AURA_UNTRACKABLE
    &Aura::HandleAuraEmpathy,                               //121 SPELL_AURA_EMPATHY
    &Aura::HandleModOffhandDamagePercent,                   //122 SPELL_AURA_MOD_OFFHAND_DAMAGE_PCT
    &Aura::HandleModTargetResistance,                       //123 SPELL_AURA_MOD_TARGET_RESISTANCE
    &Aura::HandleAuraModRangedAttackPower,                  //124 SPELL_AURA_MOD_RANGED_ATTACK_POWER
    &Aura::HandleNoImmediateEffect,                         //125 SPELL_AURA_MOD_MELEE_DAMAGE_TAKEN implemented in Unit::MeleeDamageBonusTaken
    &Aura::HandleNoImmediateEffect,                         //126 SPELL_AURA_MOD_MELEE_DAMAGE_TAKEN_PCT implemented in Unit::MeleeDamageBonusTaken
    &Aura::HandleNoImmediateEffect,                         //127 SPELL_AURA_RANGED_ATTACK_POWER_ATTACKER_BONUS implemented in Unit::MeleeDamageBonusDone
    &Aura::HandleModPossessPet,                             //128 SPELL_AURA_MOD_POSSESS_PET
    &Aura::HandleAuraModIncreaseSpeed,                      //129 SPELL_AURA_MOD_SPEED_ALWAYS
    &Aura::HandleAuraModIncreaseMountedSpeed,               //130 SPELL_AURA_MOD_MOUNTED_SPEED_ALWAYS
    &Aura::HandleNoImmediateEffect,                         //131 SPELL_AURA_MOD_RANGED_ATTACK_POWER_VERSUS implemented in Unit::MeleeDamageBonusDone
    &Aura::HandleAuraModIncreaseEnergyPercent,              //132 SPELL_AURA_MOD_INCREASE_ENERGY_PERCENT
    &Aura::HandleAuraModIncreaseHealthPercent,              //133 SPELL_AURA_MOD_INCREASE_HEALTH_PERCENT
    &Aura::HandleAuraModRegenInterrupt,                     //134 SPELL_AURA_MOD_MANA_REGEN_INTERRUPT
    &Aura::HandleModHealingDone,                            //135 SPELL_AURA_MOD_HEALING_DONE
    &Aura::HandleNoImmediateEffect,                         //136 SPELL_AURA_MOD_HEALING_DONE_PERCENT   implemented in Unit::SpellHealingBonusDone
    &Aura::HandleModTotalPercentStat,                       //137 SPELL_AURA_MOD_TOTAL_STAT_PERCENTAGE
    &Aura::HandleModMeleeSpeedPct,                          //138 SPELL_AURA_MOD_MELEE_HASTE
    &Aura::HandleForceReaction,                             //139 SPELL_AURA_FORCE_REACTION
    &Aura::HandleAuraModRangedHaste,                        //140 SPELL_AURA_MOD_RANGED_HASTE
    &Aura::HandleRangedAmmoHaste,                           //141 SPELL_AURA_MOD_RANGED_AMMO_HASTE
    &Aura::HandleAuraModBaseResistancePCT,                  //142 SPELL_AURA_MOD_BASE_RESISTANCE_PCT
    &Aura::HandleAuraModResistanceExclusive,                //143 SPELL_AURA_MOD_RESISTANCE_EXCLUSIVE
    &Aura::HandleAuraSafeFall,                              //144 SPELL_AURA_SAFE_FALL                  implemented in WorldSession::HandleMovementOpcodes
    &Aura::HandleAuraModPetTalentsPoints,                   //145 SPELL_AURA_MOD_PET_TALENT_POINTS
    &Aura::HandleNoImmediateEffect,                         //146 SPELL_AURA_ALLOW_TAME_PET_TYPE        implemented in Player::CanTameExoticPets
    &Aura::HandleModMechanicImmunityMask,                   //147 SPELL_AURA_MECHANIC_IMMUNITY_MASK     implemented in Unit::IsImmuneToSpell and Unit::IsImmuneToSpellEffect (check part)
    &Aura::HandleAuraRetainComboPoints,                     //148 SPELL_AURA_RETAIN_COMBO_POINTS
    &Aura::HandleNoImmediateEffect,                         //149 SPELL_AURA_REDUCE_PUSHBACK            implemented in Spell::Delayed and Spell::DelayedChannel
    &Aura::HandleShieldBlockValue,                          //150 SPELL_AURA_MOD_SHIELD_BLOCKVALUE_PCT
    &Aura::HandleAuraTrackStealthed,                        //151 SPELL_AURA_TRACK_STEALTHED
    &Aura::HandleNoImmediateEffect,                         //152 SPELL_AURA_MOD_DETECTED_RANGE         implemented in Creature::GetAttackDistance
    &Aura::HandleNoImmediateEffect,                         //153 SPELL_AURA_SPLIT_DAMAGE_FLAT          implemented in Unit::CalculateAbsorbAndResist
    &Aura::HandleNoImmediateEffect,                         //154 SPELL_AURA_MOD_STEALTH_LEVEL          implemented in Unit::isVisibleForOrDetect
    &Aura::HandleNoImmediateEffect,                         //155 SPELL_AURA_MOD_WATER_BREATHING        implemented in Player::getMaxTimer
    &Aura::HandleNoImmediateEffect,                         //156 SPELL_AURA_MOD_REPUTATION_GAIN        implemented in Player::CalculateReputationGain
    &Aura::HandleUnused,                                    //157 SPELL_AURA_PET_DAMAGE_MULTI (single test like spell 20782, also single for 214 aura)
    &Aura::HandleShieldBlockValue,                          //158 SPELL_AURA_MOD_SHIELD_BLOCKVALUE
    &Aura::HandleNoImmediateEffect,                         //159 SPELL_AURA_NO_PVP_CREDIT              implemented in Player::RewardHonor
    &Aura::HandleNoImmediateEffect,                         //160 SPELL_AURA_MOD_AOE_AVOIDANCE          implemented in Unit::MagicSpellHitResult
    &Aura::HandleNoImmediateEffect,                         //161 SPELL_AURA_MOD_HEALTH_REGEN_IN_COMBAT implemented in Player::RegenerateAll and Player::RegenerateHealth
    &Aura::HandleAuraPowerBurn,                             //162 SPELL_AURA_POWER_BURN_MANA
    &Aura::HandleNoImmediateEffect,                         //163 SPELL_AURA_MOD_CRIT_DAMAGE_BONUS      implemented in Unit::CalculateMeleeDamage and Unit::SpellCriticalDamageBonus
    &Aura::HandleUnused,                                    //164 unused (3.0.8a-3.2.2a), only one test spell 10654
    &Aura::HandleNoImmediateEffect,                         //165 SPELL_AURA_MELEE_ATTACK_POWER_ATTACKER_BONUS implemented in Unit::MeleeDamageBonusDone
    &Aura::HandleAuraModAttackPowerPercent,                 //166 SPELL_AURA_MOD_ATTACK_POWER_PCT
    &Aura::HandleAuraModRangedAttackPowerPercent,           //167 SPELL_AURA_MOD_RANGED_ATTACK_POWER_PCT
    &Aura::HandleNoImmediateEffect,                         //168 SPELL_AURA_MOD_DAMAGE_DONE_VERSUS            implemented in Unit::SpellDamageBonusDone, Unit::MeleeDamageBonusDone
    &Aura::HandleNoImmediateEffect,                         //169 SPELL_AURA_MOD_CRIT_PERCENT_VERSUS           implemented in Unit::DealDamageBySchool, Unit::DoAttackDamage, Unit::SpellCriticalBonus
    &Aura::HandleDetectAmore,                               //170 SPELL_AURA_DETECT_AMORE       different spells that ignore transformation effects
    &Aura::HandleAuraModIncreaseSpeed,                      //171 SPELL_AURA_MOD_SPEED_NOT_STACK
    &Aura::HandleAuraModIncreaseMountedSpeed,               //172 SPELL_AURA_MOD_MOUNTED_SPEED_NOT_STACK
    &Aura::HandleUnused,                                    //173 unused (3.0.8a-3.2.2a) no spells, old SPELL_AURA_ALLOW_CHAMPION_SPELLS  only for Proclaim Champion spell
    &Aura::HandleModSpellDamagePercentFromStat,             //174 SPELL_AURA_MOD_SPELL_DAMAGE_OF_STAT_PERCENT  implemented in Unit::SpellBaseDamageBonusDone
    &Aura::HandleModSpellHealingPercentFromStat,            //175 SPELL_AURA_MOD_SPELL_HEALING_OF_STAT_PERCENT implemented in Unit::SpellBaseHealingBonusDone
    &Aura::HandleSpiritOfRedemption,                        //176 SPELL_AURA_SPIRIT_OF_REDEMPTION   only for Spirit of Redemption spell, die at aura end
    &Aura::HandleAuraAoECharm,                              //177 SPELL_AURA_AOE_CHARM (22 spells)
    &Aura::HandleNoImmediateEffect,                         //178 SPELL_AURA_MOD_DEBUFF_RESISTANCE          implemented in Unit::MagicSpellHitResult
    &Aura::HandleNoImmediateEffect,                         //179 SPELL_AURA_MOD_ATTACKER_SPELL_CRIT_CHANCE implemented in Unit::SpellCriticalBonus
    &Aura::HandleNoImmediateEffect,                         //180 SPELL_AURA_MOD_FLAT_SPELL_DAMAGE_VERSUS   implemented in Unit::SpellDamageBonusDone
    &Aura::HandleUnused,                                    //181 unused (3.0.8a-3.2.2a) old SPELL_AURA_MOD_FLAT_SPELL_CRIT_DAMAGE_VERSUS
    &Aura::HandleAuraModResistenceOfStatPercent,            //182 SPELL_AURA_MOD_RESISTANCE_OF_STAT_PERCENT
    &Aura::HandleNoImmediateEffect,                         //183 SPELL_AURA_MOD_CRITICAL_THREAT only used in 28746, implemented in ThreatCalcHelper::CalcThreat
    &Aura::HandleNoImmediateEffect,                         //184 SPELL_AURA_MOD_ATTACKER_MELEE_HIT_CHANCE  implemented in Unit::RollMeleeOutcomeAgainst
    &Aura::HandleNoImmediateEffect,                         //185 SPELL_AURA_MOD_ATTACKER_RANGED_HIT_CHANCE implemented in Unit::RollMeleeOutcomeAgainst
    &Aura::HandleNoImmediateEffect,                         //186 SPELL_AURA_MOD_ATTACKER_SPELL_HIT_CHANCE  implemented in Unit::MagicSpellHitResult
    &Aura::HandleNoImmediateEffect,                         //187 SPELL_AURA_MOD_ATTACKER_MELEE_CRIT_CHANCE  implemented in Unit::GetUnitCriticalChance
    &Aura::HandleNoImmediateEffect,                         //188 SPELL_AURA_MOD_ATTACKER_RANGED_CRIT_CHANCE implemented in Unit::GetUnitCriticalChance
    &Aura::HandleModRating,                                 //189 SPELL_AURA_MOD_RATING
    &Aura::HandleNoImmediateEffect,                         //190 SPELL_AURA_MOD_FACTION_REPUTATION_GAIN     implemented in Player::CalculateReputationGain
    &Aura::HandleAuraModUseNormalSpeed,                     //191 SPELL_AURA_USE_NORMAL_MOVEMENT_SPEED
    &Aura::HandleModMeleeRangedSpeedPct,                    //192 SPELL_AURA_MOD_MELEE_RANGED_HASTE
    &Aura::HandleModCombatSpeedPct,                         //193 SPELL_AURA_HASTE_ALL (in fact combat (any type attack) speed pct)
    &Aura::HandleNoImmediateEffect,                         //194 SPELL_AURA_MOD_IGNORE_ABSORB_SCHOOL       implement in Unit::CalcNotIgnoreAbsorbDamage
    &Aura::HandleNoImmediateEffect,                         //195 SPELL_AURA_MOD_IGNORE_ABSORB_FOR_SPELL    implement in Unit::CalcNotIgnoreAbsorbDamage
    &Aura::HandleNULL,                                      //196 SPELL_AURA_MOD_COOLDOWN (single spell 24818 in 3.2.2a)
    &Aura::HandleNoImmediateEffect,                         //197 SPELL_AURA_MOD_ATTACKER_SPELL_AND_WEAPON_CRIT_CHANCE implemented in Unit::SpellCriticalBonus Unit::GetUnitCriticalChance
    &Aura::HandleUnused,                                    //198 unused (3.0.8a-3.2.2a) old SPELL_AURA_MOD_ALL_WEAPON_SKILLS
    &Aura::HandleNoImmediateEffect,                         //199 SPELL_AURA_MOD_INCREASES_SPELL_PCT_TO_HIT  implemented in Unit::MagicSpellHitResult
    &Aura::HandleNoImmediateEffect,                         //200 SPELL_AURA_MOD_KILL_XP_PCT                 implemented in Player::GiveXP
    &Aura::HandleAuraAllowFlight,                           //201 SPELL_AURA_FLY                             this aura enable flight mode...
    &Aura::HandleNoImmediateEffect,                         //202 SPELL_AURA_IGNORE_COMBAT_RESULT            implemented in Unit::MeleeSpellHitResult
    &Aura::HandleNoImmediateEffect,                         //203 SPELL_AURA_MOD_ATTACKER_MELEE_CRIT_DAMAGE  implemented in Unit::CalculateMeleeDamage and Unit::SpellCriticalDamageBonus
    &Aura::HandleNoImmediateEffect,                         //204 SPELL_AURA_MOD_ATTACKER_RANGED_CRIT_DAMAGE implemented in Unit::CalculateMeleeDamage and Unit::SpellCriticalDamageBonus
    &Aura::HandleNoImmediateEffect,                         //205 SPELL_AURA_MOD_ATTACKER_SPELL_CRIT_DAMAGE  implemented in Unit::SpellCriticalDamageBonus
    &Aura::HandleAuraModIncreaseFlightSpeed,                //206 SPELL_AURA_MOD_FLIGHT_SPEED
    &Aura::HandleAuraModIncreaseFlightSpeed,                //207 SPELL_AURA_MOD_FLIGHT_SPEED_MOUNTED
    &Aura::HandleAuraModIncreaseFlightSpeed,                //208 SPELL_AURA_MOD_FLIGHT_SPEED_STACKING
    &Aura::HandleAuraModIncreaseFlightSpeed,                //209 SPELL_AURA_MOD_FLIGHT_SPEED_MOUNTED_STACKING
    &Aura::HandleAuraModIncreaseFlightSpeed,                //210 SPELL_AURA_MOD_FLIGHT_SPEED_NOT_STACKING
    &Aura::HandleAuraModIncreaseFlightSpeed,                //211 SPELL_AURA_MOD_FLIGHT_SPEED_MOUNTED_NOT_STACKING
    &Aura::HandleAuraModRangedAttackPowerOfStatPercent,     //212 SPELL_AURA_MOD_RANGED_ATTACK_POWER_OF_STAT_PERCENT
    &Aura::HandleNoImmediateEffect,                         //213 SPELL_AURA_MOD_RAGE_FROM_DAMAGE_DEALT implemented in Player::RewardRage
    &Aura::HandleUnused,                                    //214 Tamed Pet Passive (single test like spell 20782, also single for 157 aura)
    &Aura::HandleArenaPreparation,                          //215 SPELL_AURA_ARENA_PREPARATION
    &Aura::HandleModCastingSpeed,                           //216 SPELL_AURA_HASTE_SPELLS
    &Aura::HandleUnused,                                    //217 unused (3.0.8a-3.2.2a)
    &Aura::HandleAuraModRangedHaste,                        //218 SPELL_AURA_HASTE_RANGED
    &Aura::HandleModManaRegen,                              //219 SPELL_AURA_MOD_MANA_REGEN_FROM_STAT
    &Aura::HandleModRatingFromStat,                         //220 SPELL_AURA_MOD_RATING_FROM_STAT
    &Aura::HandleNULL,                                      //221 ignored
    &Aura::HandleUnused,                                    //222 unused (3.0.8a-3.2.2a) only for spell 44586 that not used in real spell cast
    &Aura::HandleNULL,                                      //223 dummy code (cast damage spell to attacker) and another dymmy (jump to another nearby raid member)
    &Aura::HandleUnused,                                    //224 unused (3.0.8a-3.2.2a)
    &Aura::HandleNoImmediateEffect,                         //225 SPELL_AURA_PRAYER_OF_MENDING
    &Aura::HandleAuraPeriodicDummy,                         //226 SPELL_AURA_PERIODIC_DUMMY
    &Aura::HandlePeriodicTriggerSpellWithValue,             //227 SPELL_AURA_PERIODIC_TRIGGER_SPELL_WITH_VALUE
    &Aura::HandleNoImmediateEffect,                         //228 SPELL_AURA_DETECT_STEALTH
    &Aura::HandleNoImmediateEffect,                         //229 SPELL_AURA_MOD_AOE_DAMAGE_AVOIDANCE        implemented in Unit::SpellDamageBonusTaken
    &Aura::HandleAuraModIncreaseMaxHealth,                  //230 SPELL_AURA_MOD_PARTY_MAX_HEALTH
    &Aura::HandleNoImmediateEffect,                         //231 SPELL_AURA_PROC_TRIGGER_SPELL_WITH_VALUE
    &Aura::HandleNoImmediateEffect,                         //232 SPELL_AURA_MECHANIC_DURATION_MOD           implement in Unit::CalculateAuraDuration
    &Aura::HandleNULL,                                      //233 set model id to the one of the creature with id m_modifier.m_miscvalue
    &Aura::HandleNoImmediateEffect,                         //234 SPELL_AURA_MECHANIC_DURATION_MOD_NOT_STACK implement in Unit::CalculateAuraDuration
    &Aura::HandleAuraModDispelResist,                       //235 SPELL_AURA_MOD_DISPEL_RESIST               implement in Unit::MagicSpellHitResult
    &Aura::HandleAuraControlVehicle,                        //236 SPELL_AURA_CONTROL_VEHICLE
    &Aura::HandleModSpellDamagePercentFromAttackPower,      //237 SPELL_AURA_MOD_SPELL_DAMAGE_OF_ATTACK_POWER  implemented in Unit::SpellBaseDamageBonusDone
    &Aura::HandleModSpellHealingPercentFromAttackPower,     //238 SPELL_AURA_MOD_SPELL_HEALING_OF_ATTACK_POWER implemented in Unit::SpellBaseHealingBonusDone
    &Aura::HandleAuraModScale,                              //239 SPELL_AURA_MOD_SCALE_2 only in Noggenfogger Elixir (16595) before 2.3.0 aura 61
    &Aura::HandleAuraModExpertise,                          //240 SPELL_AURA_MOD_EXPERTISE
    &Aura::HandleForceMoveForward,                          //241 Forces the caster to move forward
    &Aura::HandleUnused,                                    //242 SPELL_AURA_MOD_SPELL_DAMAGE_FROM_HEALING (only 2 test spels in 3.2.2a)
    &Aura::HandleAuraFactionChange,                         //243 faction change
    &Aura::HandleComprehendLanguage,                        //244 SPELL_AURA_COMPREHEND_LANGUAGE
    &Aura::HandleNoImmediateEffect,                         //245 SPELL_AURA_MOD_DURATION_OF_MAGIC_EFFECTS     implemented in Unit::CalculateAuraDuration
    &Aura::HandleNoImmediateEffect,                         //246 SPELL_AURA_MOD_DURATION_OF_EFFECTS_BY_DISPEL implemented in Unit::CalculateAuraDuration
    &Aura::HandleAuraMirrorImage,                           //247 SPELL_AURA_MIRROR_IMAGE                      target to become a clone of the caster
    &Aura::HandleNoImmediateEffect,                         //248 SPELL_AURA_MOD_COMBAT_RESULT_CHANCE         implemented in Unit::RollMeleeOutcomeAgainst
    &Aura::HandleAuraConvertRune,                           //249 SPELL_AURA_CONVERT_RUNE
    &Aura::HandleAuraModIncreaseHealth,                     //250 SPELL_AURA_MOD_INCREASE_HEALTH_2
    &Aura::HandleNULL,                                      //251 SPELL_AURA_MOD_ENEMY_DODGE
    &Aura::HandleModCombatSpeedPct,                         //252 SPELL_AURA_SLOW_ALL
    &Aura::HandleNoImmediateEffect,                         //253 SPELL_AURA_MOD_BLOCK_CRIT_CHANCE             implemented in Unit::CalculateMeleeDamage
    &Aura::HandleAuraModDisarm,                             //254 SPELL_AURA_MOD_DISARM_OFFHAND     also disarm shield
    &Aura::HandleNoImmediateEffect,                         //255 SPELL_AURA_MOD_MECHANIC_DAMAGE_TAKEN_PERCENT    implemented in Unit::SpellDamageBonusTaken
    &Aura::HandleNoReagentUseAura,                          //256 SPELL_AURA_NO_REAGENT_USE Use SpellClassMask for spell select
    &Aura::HandleNULL,                                      //257 SPELL_AURA_MOD_TARGET_RESIST_BY_SPELL_CLASS Use SpellClassMask for spell select
    &Aura::HandleNULL,                                      //258 SPELL_AURA_MOD_SPELL_VISUAL
    &Aura::HandleNoImmediateEffect,                         //259 SPELL_AURA_MOD_PERIODIC_HEAL                    implemented in Unit::SpellHealingBonus
    &Aura::HandleNoImmediateEffect,                         //260 SPELL_AURA_SCREEN_EFFECT (miscvalue = id in ScreenEffect.dbc) not required any code
    &Aura::HandlePhase,                                     //261 SPELL_AURA_PHASE undetectable invisibility?     implemented in Unit::isVisibleForOrDetect
    &Aura::HandleNoImmediateEffect,                         //262 SPELL_AURA_IGNORE_UNIT_STATE                    implemented in Unit::isIgnoreUnitState & Spell::CheckCast
    &Aura::HandleNoImmediateEffect,                         //263 SPELL_AURA_ALLOW_ONLY_ABILITY                   implemented in Spell::CheckCasterAuras, lool enum IgnoreUnitState for known misc values
    &Aura::HandleUnused,                                    //264 unused (3.0.8a-3.2.2a)
    &Aura::HandleUnused,                                    //265 unused (3.0.8a-3.2.2a)
    &Aura::HandleUnused,                                    //266 unused (3.0.8a-3.2.2a)
    &Aura::HandleNoImmediateEffect,                         //267 SPELL_AURA_MOD_IMMUNE_AURA_APPLY_SCHOOL         implemented in Unit::IsImmuneToSpellEffect
    &Aura::HandleAuraModAttackPowerOfStatPercent,           //268 SPELL_AURA_MOD_ATTACK_POWER_OF_STAT_PERCENT
    &Aura::HandleNoImmediateEffect,                         //269 SPELL_AURA_MOD_IGNORE_DAMAGE_REDUCTION_SCHOOL   implemented in Unit::CalcNotIgnoreDamageReduction
    &Aura::HandleUnused,                                    //270 SPELL_AURA_MOD_IGNORE_TARGET_RESIST (unused in 3.2.2a)
    &Aura::HandleNoImmediateEffect,                         //271 SPELL_AURA_MOD_DAMAGE_FROM_CASTER    implemented in Unit::MeleeDamageBonusTaken and Unit::SpellDamageBonusTaken
    &Aura::HandleNoImmediateEffect,                         //272 SPELL_AURA_MAELSTROM_WEAPON (unclear use for aura, it used in (3.2.2a...3.3.0) in single spell 53817 that spellmode stacked and charged spell expected to be drop as stack
    &Aura::HandleNoImmediateEffect,                         //273 SPELL_AURA_X_RAY (client side implementation)
    &Aura::HandleNULL,                                      //274 proc free shot?
    &Aura::HandleNoImmediateEffect,                         //275 SPELL_AURA_MOD_IGNORE_SHAPESHIFT Use SpellClassMask for spell select
    &Aura::HandleNULL,                                      //276 mod damage % mechanic?
    &Aura::HandleNoImmediateEffect,                         //277 SPELL_AURA_MOD_MAX_AFFECTED_TARGETS Use SpellClassMask for spell select
    &Aura::HandleAuraModDisarm,                             //278 SPELL_AURA_MOD_DISARM_RANGED disarm ranged weapon
    &Aura::HandleInitializeImages,                          //279 aura for initialization mirror images (copy name)
    &Aura::HandleModTargetArmorPct,                         //280 SPELL_AURA_MOD_TARGET_ARMOR_PCT
    &Aura::HandleNoImmediateEffect,                         //281 SPELL_AURA_MOD_HONOR_GAIN             implemented in Player::RewardHonor
    &Aura::HandleAuraIncreaseBaseHealthPercent,             //282 SPELL_AURA_INCREASE_BASE_HEALTH_PERCENT
    &Aura::HandleNoImmediateEffect,                         //283 SPELL_AURA_MOD_HEALING_RECEIVED       implemented in Unit::SpellHealingBonusTaken
    &Aura::HandleAuraLinked,                                //284 SPELL_AURA_LINKED
    &Aura::HandleAuraModAttackPowerOfArmor,                 //285 SPELL_AURA_MOD_ATTACK_POWER_OF_ARMOR  implemented in Player::UpdateAttackPowerAndDamage
    &Aura::HandleNoImmediateEffect,                         //286 SPELL_AURA_ABILITY_PERIODIC_CRIT      implemented in Aura::IsCritFromAbilityAura called from Aura::PeriodicTick
    &Aura::HandleNoImmediateEffect,                         //287 SPELL_AURA_DEFLECT_SPELLS             implemented in Unit::MagicSpellHitResult and Unit::MeleeSpellHitResult
    &Aura::HandleNoImmediateEffect,                         //288 SPELL_AURA_MOD_PARRY_FROM_BEHIND_PERCENT percent from normal parry/deflect applied to from behind attack case (single spell used 67801, also look 4.1.0 spell 97574)
    &Aura::HandleUnused,                                    //289 unused (3.2.2a)
    &Aura::HandleAuraModAllCritChance,                      //290 SPELL_AURA_MOD_ALL_CRIT_CHANCE
    &Aura::HandleNoImmediateEffect,                         //291 SPELL_AURA_MOD_QUEST_XP_PCT           implemented in Player::GiveXP
    &Aura::HandleAuraOpenStable,                            //292 call stabled pet
    &Aura::HandleAuraAddMechanicAbilities,                  //293 SPELL_AURA_ADD_MECHANIC_ABILITIES  replaces target's action bars with a predefined spellset
    &Aura::HandleAuraStopNaturalManaRegen,                  //294 SPELL_AURA_STOP_NATURAL_MANA_REGEN implemented in Player:Regenerate
    &Aura::HandleUnused,                                    //295 unused (3.2.2a)
    &Aura::HandleAuraSetVehicle,                            //296 SPELL_AURA_SET_VEHICLE_ID sets vehicle on target
    &Aura::HandleNULL,                                      //297 1 spell (counter spell school?)
    &Aura::HandleUnused,                                    //298 unused (3.2.2a)
    &Aura::HandleUnused,                                    //299 unused (3.2.2a)
    &Aura::HandleNoImmediateEffect,                         //300 3 spells, share damage (in percent) with aura owner and aura target. implemented in Unit::DealDamage
    &Aura::HandleNULL,                                      //301 SPELL_AURA_HEAL_ABSORB 5 spells
    &Aura::HandleUnused,                                    //302 unused (3.2.2a)
    &Aura::HandleNoImmediateEffect,                         //303 SPELL_AURA_DAMAGE_DONE_VERSUS_AURA_STATE_PCT 17 spells implemented in Unit::*DamageBonus
    &Aura::HandleAuraFakeInebriation,                       //304 SPELL_AURA_FAKE_INEBRIATE
    &Aura::HandleAuraModIncreaseSpeed,                      //305 SPELL_AURA_MOD_MINIMUM_SPEED
    &Aura::HandleNULL,                                      //306 1 spell
    &Aura::HandleNULL,                                      //307 absorb healing?
    &Aura::HandleNULL,                                      //308 new aura for hunter traps
    &Aura::HandleNULL,                                      //309 absorb healing?
    &Aura::HandleNoImmediateEffect,                         //310 SPELL_AURA_MOD_PET_AOE_DAMAGE_AVOIDANCE implemented in Unit::SpellDamageBonusTaken
    &Aura::HandleNULL,                                      //311 0 spells in 3.3
    &Aura::HandleNULL,                                      //312 0 spells in 3.3
    &Aura::HandleNULL,                                      //313 0 spells in 3.3
    &Aura::HandleNULL,                                      //314 1 test spell (reduce duration of silince/magic)
    &Aura::HandleNULL,                                      //315 underwater walking
    &Aura::HandleNoImmediateEffect                          //316 SPELL_AURA_MOD_PERIODIC_HASTE makes haste affect HOT/DOT ticks
};

static AuraType const frozenAuraTypes[] = { SPELL_AURA_MOD_ROOT, SPELL_AURA_MOD_STUN, SPELL_AURA_NONE };

Aura::Aura(AuraClassType type, SpellEntry const* spellproto, SpellEffectIndex eff, int32 *currentBasePoints, SpellAuraHolderPtr holder, Unit *target, Unit *caster, Item* castItem) :
m_periodicTimer(0), m_periodicTick(0), m_removeMode(AURA_REMOVE_BY_DEFAULT),
m_effIndex(eff), m_deleted(false), m_positive(false), m_isPeriodic(false), m_isAreaAura(false),
m_isPersistent(false), m_spellAuraHolder(holder), m_classType(type)
{
    MANGOS_ASSERT(target);
    MANGOS_ASSERT(spellproto && spellproto == sSpellStore.LookupEntry( spellproto->Id ) && "`info` must be pointer to sSpellStore element");

    m_currentBasePoints = currentBasePoints ? *currentBasePoints : spellproto->CalculateSimpleValue(eff);

    m_positive = IsPositiveEffect(spellproto, m_effIndex);
    m_applyTime = time(NULL);

    int32 damage;
    if (!caster)
        damage = m_currentBasePoints;
    else
    {
        damage = caster->CalculateSpellDamage(target, spellproto, m_effIndex, &m_currentBasePoints);

        if (!damage && castItem && castItem->GetItemSuffixFactor())
        {
            ItemRandomSuffixEntry const *item_rand_suffix = sItemRandomSuffixStore.LookupEntry(abs(castItem->GetItemRandomPropertyId()));
            if (item_rand_suffix)
            {
                for (int k = 0; k < 3; ++k)
                {
                    SpellItemEnchantmentEntry const *pEnchant = sSpellItemEnchantmentStore.LookupEntry(item_rand_suffix->enchant_id[k]);
                    if (pEnchant)
                    {
                        for (int t = 0; t < 3; ++t)
                        {
                            if (pEnchant->spellid[t] != spellproto->Id)
                                continue;

                            damage = uint32((item_rand_suffix->prefix[k]*castItem->GetItemSuffixFactor()) / 10000 );
                            break;
                        }
                    }

                    if (damage)
                        break;
                }
            }
        }
    }

    damage *= holder->GetStackAmount();

    DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "Aura: construct Spellid : %u, Aura : %u Target : %d Damage : %d", spellproto->Id, spellproto->EffectApplyAuraName[eff], spellproto->EffectImplicitTargetA[eff], damage);

    SetModifier(AuraType(spellproto->EffectApplyAuraName[eff]), damage, spellproto->EffectAmplitude[eff], spellproto->EffectMiscValue[eff]);

    Player* modOwner = caster ? caster->GetSpellModOwner() : NULL;

    // Apply periodic time mod
    if (modOwner && m_modifier.periodictime)
    {
        modOwner->ApplySpellMod(spellproto->Id, SPELLMOD_ACTIVATION_TIME, m_modifier.periodictime);
        uint32 newperiodictime  = modOwner->CalculateAuraPeriodicTimeWithHaste(spellproto, m_modifier.periodictime);
        if (newperiodictime != m_modifier.periodictime)
            m_modifier.periodictime = newperiodictime;
    }

    // Start periodic on next tick or at aura apply
    if (!spellproto->HasAttribute(SPELL_ATTR_EX5_START_PERIODIC_AT_APPLY))
        m_periodicTimer = m_modifier.periodictime;

    // Calculate CrowdControl damage start value
    if (IsCrowdControlAura(m_modifier.m_auraname))
    {
        if (uint32 cc_base_damage = CalculateCrowdControlBreakDamage())
            m_modifier.m_baseamount = cc_base_damage;
    }

    m_stacking = IsEffectStacking();

    switch (type)
    {
        case AURA_CLASS_AREA_AURA:
        {
            AreaAura(spellproto, eff, currentBasePoints, holder, target, caster, castItem);
            break;
        }
        case AURA_CLASS_PERSISTENT_AREA_AURA:
        {
            PersistentAreaAura(spellproto, eff, currentBasePoints, holder, target, caster, castItem);
            break;
        }
        case AURA_CLASS_SINGLE_ENEMY_AURA:
        {
            SingleEnemyTargetAura(spellproto, eff, currentBasePoints, holder, target, caster, castItem);
            break;
        }
        case AURA_CLASS_AURA:
        default:
            break;
    }
}

Aura::~Aura()
{
}

ObjectGuid const& Aura::GetCastItemGuid() const { return GetHolder() ? GetHolder()->GetCastItemGuid() : ObjectGuid::Null; }

ObjectGuid const& Aura::GetCasterGuid() const { return GetHolder() ? GetHolder()->GetCasterGuid() : ObjectGuid::Null; }

ObjectGuid const& Aura::GetAffectiveCasterGuid() const { return GetHolder() ? GetHolder()->GetAffectiveCasterGuid() : ObjectGuid::Null; }

void Aura::AreaAura(SpellEntry const* spellproto, SpellEffectIndex eff, int32 *currentBasePoints, SpellAuraHolderPtr holder, Unit *target,Unit *caster, Item* castItem)
{
    m_isAreaAura = true;

    // caster==NULL in constructor args if target==caster in fact
    Unit* caster_ptr = caster ? caster : target;

    m_radius = GetSpellRadius(sSpellRadiusStore.LookupEntry(spellproto->EffectRadiusIndex[m_effIndex]));
    if (Player* modOwner = caster_ptr->GetSpellModOwner())
        modOwner->ApplySpellMod(spellproto->Id, SPELLMOD_RADIUS, m_radius);

    switch(spellproto->Effect[eff])
    {
        case SPELL_EFFECT_APPLY_AREA_AURA_PARTY:
            m_areaAuraType = AREA_AURA_PARTY;
            break;
        case SPELL_EFFECT_APPLY_AREA_AURA_RAID:
            m_areaAuraType = AREA_AURA_RAID;
            // Light's Beacon not applied to caster itself (TODO: more generic check for another similar spell if any?)
            if (target == caster_ptr && spellproto->Id == 53651)
                m_modifier.m_auraname = SPELL_AURA_NONE;
            break;
        case SPELL_EFFECT_APPLY_AREA_AURA_FRIEND:
            m_areaAuraType = AREA_AURA_FRIEND;
            break;
        case SPELL_EFFECT_APPLY_AREA_AURA_ENEMY:
            m_areaAuraType = AREA_AURA_ENEMY;
            if (target == caster_ptr)
                m_modifier.m_auraname = SPELL_AURA_NONE;    // Do not do any effect on self
            break;
        case SPELL_EFFECT_APPLY_AREA_AURA_PET:
            m_areaAuraType = AREA_AURA_PET;
            break;
        case SPELL_EFFECT_APPLY_AREA_AURA_OWNER:
            m_areaAuraType = AREA_AURA_OWNER;
            if (target == caster_ptr)
                m_modifier.m_auraname = SPELL_AURA_NONE;
            break;
        default:
            sLog.outError("Wrong spell effect in AreaAura constructor");
            MANGOS_ASSERT(false);
            break;
    }

    // totems are immune to any kind of area auras
    if (target->GetTypeId() == TYPEID_UNIT && ((Creature*)target)->IsTotem())
        m_modifier.m_auraname = SPELL_AURA_NONE;
}

void Aura::PersistentAreaAura(SpellEntry const* spellproto, SpellEffectIndex eff, int32 *currentBasePoints, SpellAuraHolderPtr holder, Unit *target,Unit *caster, Item* castItem)
{
    m_isPersistent = true;
}

void Aura::SingleEnemyTargetAura(SpellEntry const* spellproto, SpellEffectIndex eff, int32 *currentBasePoints, SpellAuraHolderPtr holder, Unit *target, Unit *caster, Item* castItem)
{
    if (caster)
        m_castersTargetGuid = caster->GetTypeId()==TYPEID_PLAYER ? ((Player*)caster)->GetSelectionGuid() : caster->GetTargetGuid();
}

Unit* Aura::GetTriggerTarget() const
{
    if (GetAuraClassType() != AURA_CLASS_SINGLE_ENEMY_AURA)
        return m_spellAuraHolder->GetTarget();

    // search for linked dummy aura with the correct target
    for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (i != GetEffIndex())
            if (Aura *aur = GetHolder()->GetAuraByEffectIndex(SpellEffectIndex(i)))
                if (aur->GetSpellProto()->EffectApplyAuraName[i] == SPELL_AURA_DUMMY)
                    return aur->GetTarget();

    return ObjectAccessor::GetUnit(*(m_spellAuraHolder->GetTarget()), m_castersTargetGuid);
}

Aura* SpellAuraHolder::CreateAura(SpellEntry const* spellproto, SpellEffectIndex eff, int32* currentBasePoints, SpellAuraHolderPtr holder, Unit *target, Unit *caster, Item* castItem)
{
    if (!spellproto || spellproto != m_spellProto)
        return (Aura*)NULL;

    uint32 triggeredSpellId = spellproto->EffectTriggerSpell[eff];
    if (IsAreaAuraEffect(spellproto->Effect[eff]))
    {
        return CreateAura(AURA_CLASS_AREA_AURA, eff, currentBasePoints, holder, target, caster, castItem);
    }
    else if (SpellEntry const* triggeredSpellInfo = sSpellStore.LookupEntry(triggeredSpellId))
    {
        for (int i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (triggeredSpellInfo->EffectImplicitTargetA[i] == TARGET_SINGLE_ENEMY)
            {
                return CreateAura(AURA_CLASS_SINGLE_ENEMY_AURA, eff, currentBasePoints, holder, target, caster, castItem);
            }
        }
    }
    // else - normal aura

    return CreateAura(AURA_CLASS_AURA, eff, currentBasePoints, holder, target, caster, castItem);
}

Aura* SpellAuraHolder::CreateAura(AuraClassType type, SpellEffectIndex eff, int32* currentBasePoints, SpellAuraHolderPtr holder, Unit* target, Unit* caster, Item* castItem)
{
    AddAura(Aura(type, m_spellProto, eff, currentBasePoints, holder, target, caster, castItem),eff);

    return GetAuraByEffectIndex(eff);
}

SpellAuraHolderPtr CreateSpellAuraHolder(SpellEntry const* spellproto, Unit *target, WorldObject *caster, Item *castItem)
{
     SpellAuraHolderPtr holderPtr = SpellAuraHolderPtr(new SpellAuraHolder(spellproto, target, caster, castItem));
     return holderPtr;
}

void Aura::SetModifier(AuraType t, int32 a, uint32 pt, int32 miscValue)
{
    m_modifier.m_auraname = t;
    m_modifier.m_amount = a;
    m_modifier.m_miscvalue = miscValue;
    m_modifier.periodictime = pt;
    m_modifier.m_baseamount = a;
}

void Aura::UpdateAura(uint32 diff)
{
    switch(GetAuraClassType())
    {
        case AURA_CLASS_AREA_AURA:
            AreaAuraUpdate(diff);
            break;
        case AURA_CLASS_PERSISTENT_AREA_AURA:
        {
            PersistentAreaAuraUpdate(diff);
            break;
        }
        case AURA_CLASS_SINGLE_ENEMY_AURA:
        case AURA_CLASS_AURA:
        default:
            Update(diff);
            break;
    }
}

void Aura::Update(uint32 diff)
{
    if (m_isPeriodic)
    {
        m_periodicTimer -= diff;
        if (m_periodicTimer <= 0) // tick also at m_periodicTimer==0 to prevent lost last tick in case max m_duration == (max m_periodicTimer)*N
        {
            // update before applying (aura can be removed in TriggerSpell or PeriodicTick calls)
            m_periodicTimer += m_modifier.periodictime;
            ++m_periodicTick;                               // for some infinity auras in some cases can overflow and reset
            PeriodicTick();
        }
    }
    else
    {
        if (m_periodicTimer <= 0)
        {
            m_periodicTimer = NONPERIODIC_AURA_UPDATE_INTERVAL;
            PeriodicCheck();
        }
        else
            m_periodicTimer -= diff;
    }
}

void Aura::AreaAuraUpdate(uint32 diff)
{
    // update for the caster of the aura
    if (GetCasterGuid() == GetTarget()->GetObjectGuid())
    {
        Unit* caster = GetTarget();

        if (!caster || !caster->GetMap())
            return;

        if (!caster->hasUnitState(UNIT_STAT_ISOLATED))
        {
            Unit* owner = caster->GetCharmerOrOwner();
            if (!owner)
                owner = caster;

            GuidSet targets;
            targets.clear();

            Spell::UnitList _targets;

            switch(m_areaAuraType)
            {
                case AREA_AURA_PARTY:
                {
                    Group *pGroup = NULL;

                    if (owner->GetTypeId() == TYPEID_PLAYER)
                        pGroup = ((Player*)owner)->GetGroup();

                    if ( pGroup)
                    {
                        uint8 subgroup = ((Player*)owner)->GetSubGroup();
                        for(GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
                        {
                            Player* Target = itr->getSource();
                            if (Target && Target->IsInWorld() && Target->isAlive() && Target->GetSubGroup()==subgroup && caster->IsInWorld() && caster->IsFriendlyTo(Target))
                            {
                                if (caster->IsWithinDistInMap(Target, m_radius))
                                    targets.insert(Target->GetObjectGuid());
                                if (Target->GetPet())
                                {
                                    GroupPetList m_groupPets = Target->GetPets();
                                    if (!m_groupPets.empty())
                                    {
                                        for (GroupPetList::const_iterator itr = m_groupPets.begin(); itr != m_groupPets.end(); ++itr)
                                            if (Pet* _pet = Target->GetMap()->GetPet(*itr))
                                                if (_pet && _pet->IsInWorld() && _pet->isAlive() && caster->IsWithinDistInMap(_pet, m_radius))
                                                    targets.insert(_pet->GetObjectGuid());
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        // add owner
                        if ( owner != caster && caster->IsWithinDistInMap(owner, m_radius) )
                            targets.insert(owner->GetObjectGuid());
                        // add caster's pet
                        if (caster->GetPet())
                        {
                            GroupPetList m_groupPets = caster->GetPets();
                            if (!m_groupPets.empty())
                            {
                                for (GroupPetList::const_iterator itr = m_groupPets.begin(); itr != m_groupPets.end(); ++itr)
                                    if (Pet* _pet = caster->GetMap()->GetPet(*itr))
                                        if (_pet && _pet->IsInWorld() && caster->IsWithinDistInMap(_pet, m_radius))
                                            targets.insert(_pet->GetObjectGuid());
                            }
                        }
                    }
                    break;
                }
                case AREA_AURA_RAID:
                {
                    Group *pGroup = NULL;

                    if (owner->GetTypeId() == TYPEID_PLAYER)
                        pGroup = ((Player*)owner)->GetGroup();

                    if ( pGroup)
                    {
                        for(GroupReference *itr = pGroup->GetFirstMember(); itr != NULL; itr = itr->next())
                        {
                            Player* Target = itr->getSource();
                            if (Target && Target->IsInWorld() && Target->isAlive() && caster->IsInWorld() && caster->IsFriendlyTo(Target))
                            {
                                if (caster->IsWithinDistInMap(Target, m_radius))
                                    targets.insert(Target->GetObjectGuid());
                                if (Target->GetPet())
                                {
                                    GroupPetList m_groupPets = Target->GetPets();
                                    if (!m_groupPets.empty())
                                    {
                                        for (GroupPetList::const_iterator itr = m_groupPets.begin(); itr != m_groupPets.end(); ++itr)
                                            if (Pet* _pet = caster->GetMap()->GetPet(*itr))
                                                if (_pet && _pet->IsInWorld() && caster->IsWithinDistInMap(_pet, m_radius))
                                                    targets.insert(_pet->GetObjectGuid());
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        // add owner
                        if ( owner != caster && caster->IsWithinDistInMap(owner, m_radius) )
                            targets.insert(owner->GetObjectGuid());
                        // add caster's pet
                        if (caster->GetPet())
                        {
                            GroupPetList m_groupPets = caster->GetPets();
                            if (!m_groupPets.empty())
                            {
                                for (GroupPetList::const_iterator itr = m_groupPets.begin(); itr != m_groupPets.end(); ++itr)
                                    if (Pet* _pet = caster->GetMap()->GetPet(*itr))
                                        if (_pet && _pet->IsInWorld() && caster->IsWithinDistInMap(_pet, m_radius))
                                            targets.insert(_pet->GetObjectGuid());
                            }
                        }
                    }
                    break;
                }
                case AREA_AURA_FRIEND:
                {
                    MaNGOS::AnyFriendlyUnitInObjectRangeCheck u_check(caster, m_radius);
                    MaNGOS::UnitListSearcher<MaNGOS::AnyFriendlyUnitInObjectRangeCheck> searcher(_targets, u_check);
                    Cell::VisitAllObjects(caster, searcher, m_radius);
                    break;
                }
                case AREA_AURA_ENEMY:
                {
                    MaNGOS::AnyAoETargetUnitInObjectRangeCheck u_check(caster, m_radius); // No GetCharmer in searcher
                    MaNGOS::UnitListSearcher<MaNGOS::AnyAoETargetUnitInObjectRangeCheck> searcher(_targets, u_check);
                    Cell::VisitAllObjects(caster, searcher, m_radius);
                    break;
                }
                case AREA_AURA_OWNER:
                case AREA_AURA_PET:
                {
                    if (owner != caster && caster->IsInWorld() && caster->IsWithinDistInMap(owner, m_radius))
                        targets.insert(owner->GetObjectGuid());
                    break;
                }
                default:
                    break;
            }

            if (!_targets.empty())
            {
                for (Spell::UnitList::iterator itr = _targets.begin(); itr != _targets.end(); ++itr)
                    if (*itr)
                        targets.insert((*itr)->GetObjectGuid());
            }

            if (!targets.empty())
            {
                for (GuidSet::const_iterator tIter = targets.begin(); tIter != targets.end(); tIter++)
                {
                    // flag for selection is need apply aura to current iteration target
                    bool apply = true;

                    // we need ignore present caster self applied are auras sometime
                    // in cases if this only auras applied for spell effect
                    Unit* i_target = caster->GetMap()->GetUnit(*tIter);
                    if (!i_target)
                        continue;

                    if (i_target->GetTypeId() == TYPEID_PLAYER && ((Player*)i_target)->IsBeingTeleportedFar())
                        continue;

                    if (GetSpellProto()->HasAttribute(SPELL_ATTR_EX3_TARGET_ONLY_PLAYER) && i_target->GetTypeId() != TYPEID_PLAYER)
                        continue;

                    if (i_target->IsImmuneToSpell(GetSpellProto(), GetAffectiveCaster() ? GetAffectiveCaster()->IsFriendlyTo(i_target) : true))
                        continue;
                    else
                    {
                        MAPLOCK_READ(i_target, MAP_LOCK_TYPE_AURAS);
                        Unit::SpellAuraHolderBounds spair = i_target->GetSpellAuraHolderBounds(GetId());
                        for (Unit::SpellAuraHolderMap::const_iterator i = spair.first; i != spair.second; ++i)
                        {
                            if (!i->second || i->second->IsDeleted())
                                continue;

                            Aura* aura = i->second->GetAuraByEffectIndex(m_effIndex);

                            if (!aura)
                                continue;

                            switch(m_areaAuraType)
                            {
                                case AREA_AURA_ENEMY:
                                    // non caster self-casted auras (non stacked)
                                    if (aura->GetModifier()->m_auraname != SPELL_AURA_NONE)
                                        apply = false;
                                    break;
                                case AREA_AURA_RAID:
                                    // non caster self-casted auras (stacked from diff. casters)
                                    if (aura->GetModifier()->m_auraname != SPELL_AURA_NONE  || i->second->GetCasterGuid() == GetAffectiveCasterGuid())
                                        apply = false;
                                    break;
                                default:
                                    // in generic case not allow stacking area auras
                                    apply = false;
                                    break;
                            }

                            if(!apply)
                                break;
                        }
                    }

                    if(!apply)
                        continue;

                    if (SpellEntry const *actualSpellInfo = sSpellMgr.SelectAuraRankForLevel(GetSpellProto(), i_target->getLevel()))
                    {
                        int32 actualBasePoints = m_currentBasePoints;
                        // recalculate basepoints for lower rank (all AreaAura spell not use custom basepoints?)
                        if (actualSpellInfo != GetSpellProto())
                            actualBasePoints = actualSpellInfo->CalculateSimpleValue(m_effIndex);

                        SpellAuraHolderPtr holder = i_target->GetSpellAuraHolder(actualSpellInfo->Id, GetAffectiveCasterGuid());

                        if (!holder || holder->IsDeleted())
                        {
                            SpellAuraHolderPtr newholder = CreateSpellAuraHolder(actualSpellInfo, i_target,  GetAffectiveCaster());
                            newholder->SetAuraDuration(GetAuraDuration());
                            /*Aura* aura = */newholder->CreateAura(AURA_CLASS_AREA_AURA, m_effIndex, &actualBasePoints, newholder, i_target, GetAffectiveCaster(), NULL);
                            i_target->AddSpellAuraHolder(newholder);
                        }
                        else
                        {
                            holder->SetAuraDuration(GetAuraDuration());
                            Aura* aura = holder->GetAuraByEffectIndex(m_effIndex);
                            if (aura)
                            {
                                aura->ApplyModifier(false,true);
                                aura->GetModifier()->m_amount = actualBasePoints;
                                aura->ApplyModifier(true,true);
                            }
                            else
                            {
                                Aura* aura = holder->CreateAura(AURA_CLASS_AREA_AURA, m_effIndex, &actualBasePoints, holder, i_target, GetAffectiveCaster(), NULL);
                                i_target->AddAuraToModList(aura);
                                aura->ApplyModifier(true,true);
                            }
                        }
                    }
                }
            }
        }
        Update(diff);
    }
    else                                                    // aura at non-caster
    {
        Unit* realcaster = GetAffectiveCaster();
        Unit* caster = GetCaster();
        Unit* target = GetTarget();

        Update(diff);

        // remove aura if out-of-range from caster (after teleport for example)
        // or caster is isolated or caster no longer has the aura
        // or caster is (no longer) friendly
        bool needFriendly = (m_areaAuraType == AREA_AURA_ENEMY ? false : true);
        if ( !caster || caster->hasUnitState(UNIT_STAT_ISOLATED) ||
            !realcaster->IsInMap(target)      ||
            !caster->IsWithinDistInMap(target, m_radius)        ||
            !caster->HasAura(GetId(), GetEffIndex())            ||
            caster->IsFriendlyTo(target) != needFriendly
           )
        {
            target->RemoveSingleAuraFromSpellAuraHolder(GetId(), GetEffIndex(), GetAffectiveCasterGuid());
        }
        else if ( m_areaAuraType == AREA_AURA_PARTY)         // check if in same sub group
        {
            // not check group if target == owner or target == pet
            if (realcaster->GetCharmerOrOwnerGuid() != target->GetObjectGuid() && realcaster->GetObjectGuid() != target->GetCharmerOrOwnerGuid())
            {
                Player* check = realcaster->GetCharmerOrOwnerPlayerOrPlayerItself();

                Group *pGroup = check ? check->GetGroup() : NULL;
                if ( pGroup )
                {
                    Player* checkTarget = target->GetCharmerOrOwnerPlayerOrPlayerItself();
                    if(!checkTarget || !pGroup->SameSubGroup(check, checkTarget))
                        target->RemoveSingleAuraFromSpellAuraHolder(GetId(), GetEffIndex(), GetAffectiveCasterGuid());
                }
                else
                    target->RemoveSingleAuraFromSpellAuraHolder(GetId(), GetEffIndex(), GetAffectiveCasterGuid());
            }
        }
        else if ( m_areaAuraType == AREA_AURA_RAID)          // TODO: fix me!
        {
            // not check group if target == owner or target == pet
            if (realcaster->GetCharmerOrOwnerGuid() != target->GetObjectGuid() && realcaster->GetObjectGuid() != target->GetCharmerOrOwnerGuid())
            {
                Player* check = realcaster->GetCharmerOrOwnerPlayerOrPlayerItself();

                Group *pGroup = check ? check->GetGroup() : NULL;
                if ( pGroup )
                {
                    Player* checkTarget = target->GetCharmerOrOwnerPlayerOrPlayerItself();
                    if(!checkTarget)
                        target->RemoveSingleAuraFromSpellAuraHolder(GetId(), GetEffIndex(), GetAffectiveCasterGuid());
                }
                else
                    target->RemoveSingleAuraFromSpellAuraHolder(GetId(), GetEffIndex(), GetCasterGuid());
            }
        }
        else if (m_areaAuraType == AREA_AURA_PET || m_areaAuraType == AREA_AURA_OWNER)
        {
            if (target->GetObjectGuid() != realcaster->GetCharmerOrOwnerGuid())
                target->RemoveSingleAuraFromSpellAuraHolder(GetId(), GetEffIndex(), GetAffectiveCasterGuid());
        }
    }
}

void Aura::PersistentAreaAuraUpdate(uint32 diff)
{
    bool remove = false;

    // remove the aura if its caster or the dynamic object causing it was removed
    // or if the target moves too far from the dynamic object
    if (Unit* pCaster = GetCaster())
    {
        DynamicObject* dynObj = pCaster->GetEffectiveDynObject(GetId(), GetEffIndex(), GetTarget());
        if (!dynObj)
            remove = true;
    }
    else
        remove = true;

    Update(diff);

    if (remove)
        GetTarget()->RemoveAura(GetId(), GetEffIndex());
}

void Aura::ApplyModifier(bool apply, bool Real)
{
    AuraType aura = m_modifier.m_auraname;

    GetHolder()->SetInUse(true);
    if (aura < TOTAL_AURAS)
        (*this.*AuraHandler [aura])(apply, Real);
    GetHolder()->SetInUse(false);
}

ClassFamilyMask const& Aura::GetAuraSpellClassMask() const { return  GetHolder() ? GetHolder()->GetSpellProto()->GetEffectSpellClassMask(m_effIndex) : ClassFamilyMask::Null; }

bool Aura::isAffectedOnSpell(SpellEntry const *spell) const
{
    return spell->IsFitToFamily(SpellFamily(GetSpellProto()->SpellFamilyName), GetAuraSpellClassMask());
}

bool Aura::CanProcFrom(SpellEntry const *spell, uint32 procFlag, uint32 EventProcEx, uint32 procEx, bool active, bool useClassMask) const
{
    // Check EffectClassMask
    ClassFamilyMask const& mask  = GetAuraSpellClassMask();

    // allow proc for modifier auras with charges
    if (IsCastEndProcModifierAura(GetSpellProto(), GetEffIndex(), spell))
    {
        if (GetHolder()->GetAuraCharges() > 0)
        {
            if (procEx != PROC_EX_CAST_END && EventProcEx == PROC_EX_NONE)
                return false;
        }
    }
    else if (EventProcEx == PROC_EX_NONE && procEx == PROC_EX_CAST_END)
        return false;

    // if no class mask defined, or spell_proc_event has SpellFamilyName=0 - allow proc
    if (!useClassMask || !mask)
    {
        if (!(EventProcEx & PROC_EX_EX_TRIGGER_ALWAYS))
        {
            // Check for extra req (if none) and hit/crit
            if (EventProcEx == PROC_EX_NONE)
            {
                // No extra req, so can trigger only for active (damage/healing present) and hit/crit
                if(((procEx & (PROC_EX_NORMAL_HIT|PROC_EX_CRITICAL_HIT)) && active) || procEx == PROC_EX_CAST_END)
                    return true;
                else
                    return false;
            }
            // Passive spells hits here only if resist/reflect/immune/evade
            // Passive spells can`t trigger if need hit (exclude cases when procExtra include non-active flags)
            else if ((EventProcEx & (PROC_EX_NORMAL_HIT|PROC_EX_CRITICAL_HIT) & procEx) && !active)
                    return false;
            // Custom procs with aura apply/fade (must fit in aura mask, if exists, independent from SchoolMask)
            else if ((procFlag & PROC_FLAG_ON_AURA_APPLY) || (procFlag & PROC_FLAG_ON_AURA_FADE))
                    if (mask && !isAffectedOnSpell(spell))
                        return false;
        }
        return true;
    }
    else
    {
        // SpellFamilyName check is performed in SpellMgr::IsSpellProcEventCanTriggeredBy and it is done once for whole holder
        // note: SpellFamilyName is not checked if no spell_proc_event is defined
        return mask.IsFitToFamilyMask(spell->GetSpellFamilyFlags());
    }
}

void Aura::ReapplyAffectedPassiveAuras( Unit* target, bool owner_mode )
{
    if (!target)
        return;

    // we need store cast item guids for self casted spells
    // expected that not exist permanent auras from stackable auras from different items
    std::map<uint32, ObjectGuid> affectedSelf;

    Unit::SpellIdSet affectedAuraCaster;

    {
        MAPLOCK_READ(target,MAP_LOCK_TYPE_AURAS);
        Unit::SpellAuraHolderMap const& holderMap = target->GetSpellAuraHolderMap();
        for (Unit::SpellAuraHolderMap::const_iterator itr = holderMap.begin(); itr != holderMap.end(); ++itr)
        {
            if (!itr->second || itr->second->IsDeleted())
                continue;

            // permanent passive or permanent area aura
            // passive spells can be affected only by own or owner spell mods)
            if ((itr->second->IsPermanent() && ((owner_mode && itr->second->IsPassive()) || itr->second->IsAreaAura())) &&
                // non deleted and not same aura (any with same spell id)
                itr->second->GetId() != GetId() &&
                // and affected by aura
                isAffectedOnSpell(itr->second->GetSpellProto()))
            {
                // only applied by self or aura caster
                if (itr->second->GetCasterGuid() == target->GetObjectGuid())
                    affectedSelf[itr->second->GetId()] = itr->second->GetCastItemGuid();
                else if (itr->second->GetCasterGuid() == GetCasterGuid())
                    affectedAuraCaster.insert(itr->second->GetId());
            }
        }
    }

    if (!affectedSelf.empty())
    {
        Player* pTarget = target->GetTypeId() == TYPEID_PLAYER ? (Player*)target : NULL;

        for(std::map<uint32, ObjectGuid>::const_iterator map_itr = affectedSelf.begin(); map_itr != affectedSelf.end(); ++map_itr)
        {
            Item* item = pTarget && map_itr->second ? pTarget->GetItemByGuid(map_itr->second) : NULL;
            target->RemoveAurasDueToSpell(map_itr->first);
            target->CastSpell(target, map_itr->first, true, item);
        }
    }

    if (!affectedAuraCaster.empty())
    {
        Unit* caster = GetCaster();
        for(Unit::SpellIdSet::const_iterator set_itr = affectedAuraCaster.begin(); set_itr != affectedAuraCaster.end(); ++set_itr)
        {
            target->RemoveAurasDueToSpell(*set_itr);
            if (caster)
                caster->CastSpell(GetTarget(), *set_itr, true);
        }
    }
}

struct ReapplyAffectedPassiveAurasHelper
{
    explicit ReapplyAffectedPassiveAurasHelper(Aura* _aura) : aura(_aura) {}
    void operator()(Unit* unit) const { aura->ReapplyAffectedPassiveAuras(unit, true); }
    Aura* aura;
};

void Aura::ReapplyAffectedPassiveAuras()
{
    // not reapply spell mods with charges (use original value because processed and at remove)
    if (GetSpellProto()->procCharges)
        return;

    // not reapply some spell mods ops (mostly speedup case)
    switch (m_modifier.m_miscvalue)
    {
        case SPELLMOD_DURATION:
        case SPELLMOD_CHARGES:
        case SPELLMOD_NOT_LOSE_CASTING_TIME:
        case SPELLMOD_CASTING_TIME:
        case SPELLMOD_COOLDOWN:
        case SPELLMOD_COST:
        case SPELLMOD_ACTIVATION_TIME:
        case SPELLMOD_GLOBAL_COOLDOWN:
            return;
    }

    // reapply talents to own passive persistent auras
    ReapplyAffectedPassiveAuras(GetTarget(), true);

    // re-apply talents/passives/area auras applied to pet/totems (it affected by player spellmods)
    GetTarget()->CallForAllControlledUnits(ReapplyAffectedPassiveAurasHelper(this), CONTROLLED_PET|CONTROLLED_TOTEMS);

    // re-apply talents/passives/area auras applied to group members (it affected by player spellmods)
    if (Group* group = ((Player*)GetTarget())->GetGroup())
        for(GroupReference *itr = group->GetFirstMember(); itr != NULL; itr = itr->next())
            if (Player* member = itr->getSource())
                if (member != GetTarget() && member->IsInMap(GetTarget()))
                    ReapplyAffectedPassiveAuras(member, false);
}

bool Aura::IsEffectStacking()
{
    SpellEntry const *spellProto = GetSpellProto();

    // generic check
    if (spellProto->AttributesEx6 & (SPELL_ATTR_EX6_NO_STACK_DEBUFF_MAJOR | SPELL_ATTR_EX6_NO_STACK_BUFF))
    {
        // Mark/Gift of the Wild early exception check
        if (spellProto->IsFitToFamily<SPELLFAMILY_DRUID, CF_DRUID_MARK_OF_THE_WILD>())
        {
            // only mod resistance exclusive isn't stacking
            return (GetModifier()->m_auraname != SPELL_AURA_MOD_RESISTANCE_EXCLUSIVE);
        }
        else
            return false;
    }

    // scrolls don't stack
    if (GetSpellSpecific(spellProto->Id) == SPELL_SCROLL)
        return false;

    // some hardcoded checks are needed (given attrEx6 not present)
    switch(GetModifier()->m_auraname)
    {
        // these effects never stack
        case SPELL_AURA_MOD_MELEE_HASTE:
            if (spellProto->SpellFamilyName == SPELLFAMILY_GENERIC)
                return true;
            // Icy Talons
            if (spellProto->IsFitToFamily<SPELLFAMILY_DEATHKNIGHT, CF_DEATHKNIGHT_ICY_TOUCH_TALONS>())
                return true;

            break;
        case SPELL_AURA_MOD_RESISTANCE_EXCLUSIVE:
        case SPELL_AURA_MOD_PARTY_MAX_HEALTH:                                                  // Commanding Shout / Blood Pact
        case SPELL_AURA_MOD_HEALING_PCT:                                                       // Mortal Strike / Wound Poison / Aimed Shot / Furious Attacks
        case SPELL_AURA_MOD_STAT:                                                              // various stat buffs
            return (spellProto->SpellFamilyName == SPELLFAMILY_GENERIC);
        case SPELL_AURA_MOD_CASTING_SPEED_NOT_STACK:                                           // Wrath of Air Totem / Mind-Numbing Poison and many more
            return (spellProto->CalculateSimpleValue(m_effIndex) > 0);
        case SPELL_AURA_MOD_DAMAGE_PERCENT_DONE:                                               // Ferocious Inspiration / Sanctified Retribution
        case SPELL_AURA_MOD_ATTACKER_SPELL_AND_WEAPON_CRIT_CHANCE:                             // Heart of the Crusader / Totem of Wrath
            if (spellProto->IsFitToFamily<SPELLFAMILY_PALADIN, CF_PALADIN_RETRIBUTION_AURA, CF_PALADIN_HEART_OF_THE_CRUSADER>()) // Sanctified Retribution / HoC
            {
                return false;
            }
            break;
        case SPELL_AURA_MOD_RESISTANCE_PCT:                                                    // Sunder Armor / Sting
        case SPELL_AURA_HASTE_SPELLS:                                                          // Mind-Numbing Poison
        case SPELL_AURA_MOD_DAMAGE_PERCENT_TAKEN:                                              // Ebon Plague (spell not implemented) / Earth and Moon
            if (spellProto->IsFitToFamily<SPELLFAMILY_WARRIOR, CF_WARRIOR_SUNDER_ARMOR>() ||   // Sunder Armor (only spell triggering this aura has the flag)
                spellProto->IsFitToFamily<SPELLFAMILY_HUNTER,  CF_HUNTER_PET_SPELLS>() ||      // Sting (Hunter Pet)
                (spellProto->SpellFamilyName == SPELLFAMILY_DRUID && spellProto->SpellIconID == 2991) || // Earth and Moon
                spellProto->IsFitToFamily<SPELLFAMILY_ROGUE,  CF_ROGUE_MIND_NUMBING_POISON>() ||  // Mind-Numbing Poison
                spellProto->IsFitToFamily<SPELLFAMILY_PRIEST, CF_PRIEST_MISC_TALENTS>())       // Inspiration
            {
                return false;
            }
            break;
        case SPELL_AURA_MOD_CRIT_PERCENT:                                                      // Rampage
            if (spellProto->SpellFamilyName == SPELLFAMILY_WARRIOR && spellProto->SpellIconID == 2006)
                return false;
            break;
        case SPELL_AURA_MOD_ATTACKER_SPELL_CRIT_CHANCE:                                        // Winter's Chill / Improved Scorch
            if (spellProto->SpellFamilyName == SPELLFAMILY_MAGE)
                return false;
            break;
        case SPELL_AURA_MOD_MECHANIC_DAMAGE_TAKEN_PERCENT:                                     // Mangle / Trauma
            if (spellProto->IsFitToFamily<SPELLFAMILY_DRUID, CF_DRUID_MANGLE_BEAR, CF_DRUID_MANGLE_CAT>() ||   // Mangle
                spellProto->Id == 46856 || spellProto->Id == 46857)                            // Trauma has SPELLFAMILY_GENERIC and no flags
            {
                return false;
            }
            break;
        case SPELL_AURA_MOD_ATTACKER_SPELL_HIT_CHANCE:                  // Misery / Imp. Faerie Fire (must find triggered aura / spell not implemented?)
            if (spellProto->SpellFamilyName == SPELLFAMILY_PRIEST &&
                spellProto->SpellIconID == 2211)                        // Misery
            {
                return false;
            }
            break;
        case SPELL_AURA_CONTROL_VEHICLE:
            return true;

        default:
            break;
    }

    // almost all area aura raid auras don't stack (exceptions are handled above)

    // Flametongue Totem / Totem of Wrath / Strength of Earth Totem / Fel Intelligence / Leader of the Pack
    // Moonkin Aura / Mana Spring Totem / Tree of Life Aura / Improved Devotion Aura / Improved Icy Talons / Trueshot Aura
    // Improved Moonkin Form / Sanctified Retribution Aura / Blood Pact
    if (spellProto->Effect[m_effIndex] == SPELL_EFFECT_APPLY_AREA_AURA_RAID)
        return false;

    return true;
}

/*********************************************************/
/***               BASIC AURA FUNCTION                 ***/
/*********************************************************/
void Aura::HandleAddModifier(bool apply, bool Real)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER || !Real)
        return;

    if (m_modifier.m_miscvalue >= MAX_SPELLMOD)
        return;

    if (apply)
    {
        SpellEntry const* spellProto = GetSpellProto();

        // Add custom charges for some mod aura
        switch (spellProto->Id)
        {
            case 17941:                                     // Shadow Trance
            case 22008:                                     // Netherwind Focus
            case 31834:                                     // Light's Grace
            case 34754:                                     // Clearcasting
            case 34936:                                     // Backlash
            case 44401:                                     // Missile Barrage
            case 48108:                                     // Hot Streak
            case 51124:                                     // Killing Machine
            case 54741:                                     // Firestarter
            case 57761:                                     // Fireball!
            case 64823:                                     // Elune's Wrath (Balance druid t8 set
                GetHolder()->SetAuraCharges(1);
                break;
            default:
                break;
        }
    }

    ((Player*)GetTarget())->AddSpellMod(this, apply);

    ReapplyAffectedPassiveAuras();
}

void Aura::TriggerSpell()
{
    ObjectGuid casterGUID = GetCasterGuid();
    Unit* triggerTarget = GetTriggerTarget();

    if (!casterGUID || !triggerTarget)
        return;

    // generic casting code with custom spells and target/caster customs
    uint32 trigger_spell_id = GetSpellProto()->EffectTriggerSpell[m_effIndex];

    SpellEntry const* triggeredSpellInfo = sSpellStore.LookupEntry(trigger_spell_id);
    SpellEntry const* auraSpellInfo = GetSpellProto();
    uint32 auraId = auraSpellInfo->Id;
    Unit* target = GetTarget();
    Unit* triggerCaster = triggerTarget;
    WorldObject* triggerTargetObject = NULL;

    // specific code for cases with no trigger spell provided in field
    if (triggeredSpellInfo == NULL)
    {
        switch(auraSpellInfo->SpellFamilyName)
        {
            case SPELLFAMILY_GENERIC:
            {
                switch(auraId)
                {
                    case 812:                               // Periodic Mana Burn
                    {
                        trigger_spell_id = 25779;           // Mana Burn

                        if (GetTarget()->GetTypeId() != TYPEID_UNIT)
                            return;

                        triggerTarget = ((Creature*)GetTarget())->SelectAttackingTarget(ATTACKING_TARGET_TOPAGGRO, 0, trigger_spell_id, SELECT_FLAG_POWER_MANA);
                        if (!triggerTarget)
                            return;

                        break;
                    }
//                    // Polymorphic Ray
//                    case 6965: break;
                    case 9712:                              // Thaumaturgy Channel
                        trigger_spell_id = 21029;
                        break;
//                    // Egan's Blaster
//                    case 17368: break;
//                    // Haunted
//                    case 18347: break;
//                    // Ranshalla Waiting
//                    case 18953: break;
//                    // Inferno
//                    case 19695: break;
//                    // Frostwolf Muzzle DND
//                    case 21794: break;
//                    // Alterac Ram Collar DND
//                    case 21866: break;
//                    // Celebras Waiting
//                    case 21916: break;
                    case 23170:                             // Brood Affliction: Bronze
                    {
                        target->CastSpell(target, 23171, true, NULL, this);
                        return;
                    }
                    case 23184:                             // Mark of Frost
                    case 25041:                             // Mark of Nature
                    case 37125:                             // Mark of Death
                    {
                        std::list<Player*> targets;

                        // spells existed in 1.x.x; 23183 - mark of frost; 25042 - mark of nature; both had radius of 100.0 yards in 1.x.x DBC
                        // spells are used by Azuregos and the Emerald dragons in order to put a stun debuff on the players which resurrect during the encounter
                        // in order to implement the missing spells we need to make a grid search for hostile players and check their auras; if they are marked apply debuff
                        // spell 37127 used for the Mark of Death, is used server side, so it needs to be implemented here

                        uint32 markSpellId = 0;
                        uint32 debuffSpellId = 0;

                        switch (auraId)
                        {
                            case 23184:
                                markSpellId = 23182;
                                debuffSpellId = 23186;
                                break;
                            case 25041:
                                markSpellId = 25040;
                                debuffSpellId = 25043;
                                break;
                            case 37125:
                                markSpellId = 37128;
                                debuffSpellId = 37131;
                                break;
                        }

                        MaNGOS::AnyPlayerInObjectRangeWithAuraCheck u_check(GetTarget(), 100.0f, markSpellId);
                        MaNGOS::PlayerListSearcher<MaNGOS::AnyPlayerInObjectRangeWithAuraCheck > checker(targets, u_check);
                        Cell::VisitWorldObjects(GetTarget(), checker, 100.0f);

                        for (std::list<Player*>::iterator itr = targets.begin(); itr != targets.end(); ++itr)
                            (*itr)->CastSpell((*itr), debuffSpellId, true, NULL, NULL, casterGUID);

                        return;
                    }
                    case 23493:                             // Restoration
                    {
                        uint32 heal = triggerTarget->GetMaxHealth() / 10;
                        uint32 absorb = 0;
                        triggerTarget->CalculateHealAbsorb(heal, &absorb);
                        triggerTarget->DealHeal(triggerTarget, heal - absorb, auraSpellInfo, false, absorb);

                        if (int32 mana = triggerTarget->GetMaxPower(POWER_MANA))
                        {
                            mana /= 10;
                            triggerTarget->EnergizeBySpell(triggerTarget, 23493, mana, POWER_MANA);
                        }
                        return;
                    }
//                    // Stoneclaw Totem Passive TEST
//                    case 23792: break;
//                    // Axe Flurry
//                    case 24018: break;
                    case 24210:                             // Mark of Arlokk
                    {
                        // Replacement for (classic) spell 24211 (doesn't exist anymore)
                        std::list<Creature*> lList;

                        // Search for all Zulian Prowler in range
                        MaNGOS::AllCreaturesOfEntryInRangeCheck check(triggerTarget, 15101, 15.0f);
                        MaNGOS::CreatureListSearcher<MaNGOS::AllCreaturesOfEntryInRangeCheck> searcher(lList, check);
                        Cell::VisitGridObjects(triggerTarget, searcher, 15.0f);

                        for (std::list<Creature*>::const_iterator itr = lList.begin(); itr != lList.end(); ++itr)
                            if ((*itr)->isAlive())
                                (*itr)->AddThreat(triggerTarget, float(5000));

                        return;
                    }
//                    // Restoration
//                    case 24379: break;
//                    // Happy Pet
//                    case 24716: break;
                    case 24780:                             // Dream Fog
                    {
                        // Note: In 1.12 triggered spell 24781 still exists, need to script dummy effect for this spell then
                        // Select an unfriendly enemy in 100y range and attack it
                        if (target->GetTypeId() != TYPEID_UNIT)
                            return;

                        ThreatList const& tList = target->getThreatManager().getThreatList();
                        for (ThreatList::const_iterator itr = tList.begin();itr != tList.end(); ++itr)
                        {
                            Unit* pUnit = target->GetMap()->GetUnit((*itr)->getUnitGuid());

                            if (pUnit && target->getThreatManager().getThreat(pUnit))
                                target->getThreatManager().modifyThreatPercent(pUnit, -100);
                        }

                        if (Unit* pEnemy = target->SelectRandomUnfriendlyTarget(target->getVictim(), 100.0f))
                            ((Creature*)target)->AI()->AttackStart(pEnemy);

                        return;
                    }
//                    // Cannon Prep
//                    case 24832: break;
                    case 24834:                             // Shadow Bolt Whirl
                    {
                        uint32 spellForTick[8] = { 24820, 24821, 24822, 24823, 24835, 24836, 24837, 24838 };
                        uint32 tick = (GetAuraTicks() + 7/*-1*/) % 8;

                        // casted in left/right (but triggered spell have wide forward cone)
                        float forward = target->GetOrientation();
                        if (tick <= 3)
                            target->SetOrientation(forward + 0.75f * M_PI_F - tick * M_PI_F / 8);       // Left
                        else
                            target->SetOrientation(forward - 0.75f * M_PI_F + (8 - tick) * M_PI_F / 8); // Right

                        triggerTarget->CastSpell(triggerTarget, spellForTick[tick], true, NULL, this, casterGUID);
                        target->SetOrientation(forward);
                        return;
                    }
//                    // Stink Trap
//                    case 24918: break;
//                    // Agro Drones
//                    case 25152: break;
                    case 25371:                             // Consume
                    {
                        int32 bpDamage = triggerTarget->GetMaxHealth()*10/100;
                        triggerTarget->CastCustomSpell(triggerTarget, 25373, &bpDamage, NULL, NULL, true, NULL, this, casterGUID);
                        return;
                    }
//                    // Pain Spike
//                    case 25572: break;
                    case 26009:                             // Rotate 360
                    case 26136:                             // Rotate -360
                    {
                        float newAngle = target->GetOrientation();

                        if (auraId == 26009)
                            newAngle += M_PI_F/40;
                        else
                            newAngle -= M_PI_F/40;

                        newAngle = MapManager::NormalizeOrientation(newAngle);

                        target->SetFacingTo(newAngle);

                        target->CastSpell(target, 26029, true);
                        return;
                    }
//                    // Consume
//                    case 26196: break;
//                    // Berserk
//                    case 26615: break;
//                    // Defile
//                    case 27177: break;
//                    // Teleport: IF/UC
//                    case 27601: break;
//                    // Five Fat Finger Exploding Heart Technique
//                    case 27673: break;
//                    // Nitrous Boost
//                    case 27746: break;
//                    // Steam Tank Passive
//                    case 27747: break;
                    case 27808:                             // Frost Blast
                    {
                        int32 bpDamage = triggerTarget->GetMaxHealth()*26/100;
                        triggerTarget->CastCustomSpell(triggerTarget, 29879, &bpDamage, NULL, NULL, true, NULL, this, casterGUID);
                        return;
                    }
                    // Detonate Mana
                    case 27819:
                    {
                        // 33% Mana Burn on normal mode, 50% on heroic mode
                        int32 bpDamage = (int32)triggerTarget->GetPower(POWER_MANA) / (triggerTarget->GetMap()->GetDifficulty() ? 2 : 3);
                        triggerTarget->ModifyPower(POWER_MANA, -bpDamage);
                        triggerTarget->CastCustomSpell(triggerTarget, 27820, &bpDamage, NULL, NULL, true, NULL, this, triggerTarget->GetObjectGuid());
                        return;
                    }
//                    // Controller Timer
//                    case 28095: break;
                    // Stalagg Chain and Feugen Chain
                    case 28096:
                    case 28111:
                    {
                        // X-Chain is casted by Tesla to X, so: caster == Tesla, target = X
                        Unit* pCaster = GetCaster();
                        if (pCaster && pCaster->GetTypeId() == TYPEID_UNIT && !pCaster->IsWithinDistInMap(target, 60.0f))
                        {
                            pCaster->InterruptNonMeleeSpells(true);
                            ((Creature*)pCaster)->SetInCombatWithZone();
                            // Stalagg Tesla Passive or Feugen Tesla Passive
                            pCaster->CastSpell(pCaster, auraId == 28096 ? 28097 : 28109, true, NULL, NULL, target->GetObjectGuid());
                        }
                        return;
                    }
                    // Stalagg Tesla Passive and Feugen Tesla Passive
                    case 28097:
                    case 28109:
                    {
                        // X-Tesla-Passive is casted by Tesla on Tesla with original caster X, so: caster = X, target = Tesla
                        Unit* pCaster = GetCaster();
                        if (pCaster && pCaster->GetTypeId() == TYPEID_UNIT)
                        {
                            if (pCaster->getVictim() && !pCaster->IsWithinDistInMap(target, 60.0f))
                            {
                                if (Unit* pTarget = ((Creature*)pCaster)->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                                    target->CastSpell(pTarget, 28099, false);// Shock
                            }
                            else
                            {
                                // "Evade"
                                target->RemoveAurasDueToSpell(auraId);
                                target->DeleteThreatList();
                                target->CombatStop(true);
                                // Recast chain (Stalagg Chain or Feugen Chain
                                target->CastSpell(pCaster, auraId == 28097 ? 28096 : 28111, false);
                            }
                        }
                        return;
                    }
//                    // Mark of Didier
//                    case 28114: break;
//                    // Communique Timer, camp
//                    case 28346: break;
                    case 28522:                             // Icebolt (Sapphiron - Naxxramas)
                        // dunno if triggered spell id is correct
                        if (!target->HasAura(45776))
                            trigger_spell_id = 45776;
                        break;
//                    // Silithyst
//                    case 29519: break;
                    case 29528:                             // Inoculate Nestlewood Owlkin
                        // prevent error reports in case ignored player target
                        if (triggerTarget->GetTypeId() != TYPEID_UNIT)
                            return;
                        break;
//                    // Overload
//                    case 29768: break;
//                    // Return Fire
//                    case 29788: break;
//                    // Return Fire
//                    case 29793: break;
//                    // Return Fire
//                    case 29794: break;
//                    // Guardian of Icecrown Passive
//                    case 29897: break;
                    case 29917:                             // Feed Captured Animal
                        trigger_spell_id = 29916;
                        break;
//                    // Flame Wreath
//                    case 29946: break;
//                    // Flame Wreath
//                    case 29947: break;
//                    // Mind Exhaustion Passive
//                    case 30025: break;
//                    // Nether Beam - Serenity
//                    case 30401: break;
                    case 30427:                             // Extract Gas
                    {
                        Unit* caster = GetCaster();
                        if (!caster)
                            return;
                        // move loot to player inventory and despawn target
                        if (caster->GetTypeId() ==TYPEID_PLAYER &&
                           triggerTarget->GetTypeId() == TYPEID_UNIT &&
                           ((Creature*)triggerTarget)->GetCreatureInfo()->type == CREATURE_TYPE_GAS_CLOUD)
                        {
                            Player* player = (Player*)caster;
                            Creature* creature = (Creature*)triggerTarget;
                            // missing lootid has been reported on startup - just return
                            if (!creature->GetCreatureInfo()->SkinLootId)
                                return;

                            player->AutoStoreLoot(creature, creature->GetCreatureInfo()->SkinLootId, LootTemplates_Skinning, true);

                            creature->ForcedDespawn();
                        }
                        return;
                    }
                    case 30576:                             // Quake
                        trigger_spell_id = 30571;
                        break;
//                    // Burning Maul
//                    case 30598: break;
//                    // Regeneration
//                    case 30799:
//                    case 30800:
//                    case 30801:
//                        break;
//                    // Despawn Self - Smoke cloud
//                    case 31269: break;
//                    // Time Rift Periodic
//                    case 31320: break;
//                    // Corrupt Medivh
//                    case 31326: break;
                    case 31347:                             // Doom
                    {
                        target->CastSpell(target,31350,true);
                        target->DealDamage(target, target->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
                        return;
                    }
                    case 31373:                             // Spellcloth
                    {
                        // Summon Elemental after create item
                        triggerTarget->SummonCreature(17870, 0.0f, 0.0f, 0.0f, triggerTarget->GetOrientation(), TEMPSUMMON_DEAD_DESPAWN, 0);
                        return;
                    }
//                    // Bloodmyst Tesla
//                    case 31611: break;
                    case 31944:                             // Doomfire
                    {
                        int32 damage = m_modifier.m_amount * ((GetAuraDuration() + m_modifier.periodictime) / GetAuraMaxDuration());
                        triggerTarget->CastCustomSpell(triggerTarget, 31969, &damage, NULL, NULL, true, NULL, this, casterGUID);
                        return;
                    }
//                    // Teleport Test
//                    case 32236: break;
//                    // Earthquake
//                    case 32686: break;
//                    // Possess
//                    case 33401: break;
//                    // Draw Shadows
//                    case 33563: break;
//                    // Murmur's Touch
//                    case 33711: break;
                    case 34229:                             // Flame Quills
                    {
                        // cast 24 spells 34269-34289, 34314-34316
                        for(uint32 spell_id = 34269; spell_id != 34290; ++spell_id)
                            triggerTarget->CastSpell(triggerTarget, spell_id, true, NULL, this, casterGUID);
                        for(uint32 spell_id = 34314; spell_id != 34317; ++spell_id)
                            triggerTarget->CastSpell(triggerTarget, spell_id, true, NULL, this, casterGUID);
                        return;
                    }
//                    // Gravity Lapse
//                    case 34480: break;
//                    // Tornado
//                    case 34683: break;
//                    // Frostbite Rotate
//                    case 34748: break;
//                    // Arcane Flurry
//                    case 34821: break;
//                    // Interrupt Shutdown
//                    case 35016: break;
//                    // Interrupt Shutdown
//                    case 35176: break;
//                    // Inferno
//                    case 35268: break;
//                    // Salaadin's Tesla
//                    case 35515: break;
//                    // Ethereal Channel (Red)
//                    case 35518: break;
//                    // Nether Vapor
//                    case 35879: break;
//                    // Dark Portal Storm
//                    case 36018: break;
//                    // Burning Maul
//                    case 36056: break;
//                    // Living Grove Defender Lifespan
//                    case 36061: break;
//                    // Professor Dabiri Talks
//                    case 36064: break;
//                    // Kael Gaining Power
//                    case 36091: break;
//                    // They Must Burn Bomb Aura
//                    case 36344: break;
//                    // They Must Burn Bomb Aura (self)
//                    case 36350: break;
//                    // Stolen Ravenous Ravager Egg
//                    case 36401: break;
//                    // Activated Cannon
//                    case 36410: break;
//                    // Stolen Ravenous Ravager Egg
//                    case 36418: break;
//                    // Enchanted Weapons
//                    case 36510: break;
//                    // Cursed Scarab Periodic
//                    case 36556: break;
//                    // Cursed Scarab Despawn Periodic
//                    case 36561: break;
                    case 36573:                             // Vision Guide
                    {
                    // FIXME - this must be maked over 37715 reconstruction (spell_dbc)
                        if (GetAuraTicks() == 10 && target->GetTypeId() == TYPEID_PLAYER)
                        {
                            ((Player*)target)->AreaExploredOrEventHappens(10525);
                            target->RemoveAurasDueToSpell(36573);
                        }

                        return;
                    }
//                    // Cannon Charging (platform)
//                    case 36785: break;
//                    // Cannon Charging (self)
//                    case 36860: break;
                    case 37027:                             // Remote Toy
                        trigger_spell_id = 37029;
                        break;
//                    // Mark of Death
//                    case 37125: break;
//                    // Arcane Flurry
//                    case 37268: break;
                    case 37429:                             // Spout (left)
                    case 37430:                             // Spout (right)
                    {
                        float newAngle = target->GetOrientation();

                        if (auraId == 37429)
                            newAngle += 2*M_PI_F/100;
                        else
                            newAngle -= 2*M_PI_F/100;

                        newAngle = MapManager::NormalizeOrientation(newAngle);

                        target->SetFacingTo(newAngle);

                        target->CastSpell(target, 37433, true);
                        return;
                    }
//                    // Karazhan - Chess NPC AI, Snapshot timer
//                    case 37440: break;
//                    // Karazhan - Chess NPC AI, action timer
//                    case 37504: break;
//                    // Karazhan - Chess: Is Square OCCUPIED aura (DND)
//                    case 39400: break;
//                    // Banish
//                    case 37546: break;
//                    // Shriveling Gaze
//                    case 37589: break;
//                    // Fake Aggro Radius (2 yd)
//                    case 37815: break;
//                    // Corrupt Medivh
//                    case 37853: break;
                    case 38495:                             // Eye of Grillok
                    {
                        target->CastSpell(target, 38530, true);
                        return;
                    }
                    case 38554:                             // Absorb Eye of Grillok (Zezzak's Shard)
                    {
                        if (target->GetTypeId() != TYPEID_UNIT)
                            return;

                        if (Unit* caster = GetCaster())
                            caster->CastSpell(caster, 38495, true, NULL, this);
                        else
                            return;

                        Creature* creatureTarget = (Creature*)target;

                        creatureTarget->ForcedDespawn();
                        return;
                    }
//                    // Magic Sucker Device timer
//                    case 38672: break;
//                    // Tomb Guarding Charging
//                    case 38751: break;
//                    // Murmur's Touch
//                    case 38794: break;
                    case 39105:                             // Activate Nether-wraith Beacon (31742 Nether-wraith Beacon item)
                    {
                        float fX, fY, fZ;
                        triggerTarget->GetClosePoint(fX, fY, fZ, triggerTarget->GetObjectBoundingRadius(), 20.0f);
                        triggerTarget->SummonCreature(22408, fX, fY, fZ, triggerTarget->GetOrientation(), TEMPSUMMON_DEAD_DESPAWN, 0);
                        return;
                    }
//                    // Drain World Tree Visual
//                    case 39140: break;
//                    // Quest - Dustin's Undead Dragon Visual aura
//                    case 39259: break;
//                    // Hellfire - The Exorcism, Jules releases darkness, aura
//                    case 39306: break;
//                    // Inferno
//                    case 39346: break;
//                    // Enchanted Weapons
//                    case 39489: break;
//                    // Shadow Bolt Whirl
//                    case 39630: break;
//                    // Shadow Bolt Whirl
//                    case 39634: break;
//                    // Shadow Inferno
//                    case 39645: break;
                    case 39857:                             // Tear of Azzinoth Summon Channel - it's not really supposed to do anything,and this only prevents the console spam
                        trigger_spell_id = 39856;
                        break;
//                    // Soulgrinder Ritual Visual (Smashed)
//                    case 39974: break;
//                    // Simon Game Pre-game timer
//                    case 40041: break;
//                    // Knockdown Fel Cannon: The Aggro Check Aura
//                    case 40113: break;
//                    // Spirit Lance
//                    case 40157: break;
//                    // Demon Transform 2
//                    case 40398: break;
//                    // Demon Transform 1
//                    case 40511: break;
//                    // Ancient Flames
//                    case 40657: break;
//                    // Ethereal Ring Cannon: Cannon Aura
//                    case 40734: break;
//                    // Cage Trap
//                    case 40760: break;
//                    // Random Periodic
//                    case 40867: break;
//                    // Prismatic Shield
//                    case 40879: break;
//                    // Aura of Desire
//                    case 41350: break;
//                    // Dementia
//                    case 41404: break;
//                    // Chaos Form
//                    case 41629: break;
//                    // Alert Drums
//                    case 42177: break;
//                    // Spout
//                    case 42581: break;
//                    // Spout
//                    case 42582: break;
//                    // Return to the Spirit Realm
//                    case 44035: break;
//                    // Curse of Boundless Agony
//                    case 45050: break;
//                    // Earthquake
//                    case 46240: break;
                    case 46736:                             // Personalized Weather
                        trigger_spell_id = 46737;
                        break;
//                    // Stay Submerged
//                    case 46981: break;
//                    // Dragonblight Ram
//                    case 47015: break;
                    case 51121:                             // Time Bomb
                    case 59376:
                    {
                        if (target)
                        {
                            int32 healthMissing = target->GetMaxHealth() - target->GetHealth();
                            target->CastCustomSpell(target, 51132, &healthMissing, NULL, NULL, true);
                        }
                        return;
                    }
//                    // Party G.R.E.N.A.D.E.
//                    case 51510: break;
//                    // Horseman Abilities
//                    case 52347: break;
//                    // GPS (Greater drake Positioning System)
//                    case 53389: break;
//                    // WotLK Prologue Frozen Shade Summon Aura
//                    case 53459: break;
//                    // WotLK Prologue Frozen Shade Speech
//                    case 53460: break;
//                    // WotLK Prologue Dual-plagued Brain Summon Aura
//                    case 54295: break;
//                    // WotLK Prologue Dual-plagued Brain Speech
//                    case 54299: break;
//                    // Rotate 360 (Fast)
//                    case 55861: break;
//                    // Shadow Sickle
//                    case 56702: break;
//                    // Portal Periodic
//                    case 58008: break;
//                    // Destroy Door Seal
//                    case 58040: break;
//                    // Draw Magic
//                    case 58185: break;
                    case 58886:                             // Food
                    {
                        if (GetAuraTicks() != 1)
                            return;

                        uint32 randomBuff[5] = {57288, 57139, 57111, 57286, 57291};

                        trigger_spell_id = urand(0, 1) ? 58891 : randomBuff[urand(0, 4)];

                        break;
                    }
//                    // Shadow Sickle
//                    case 59103: break;
//                    // Time Bomb
//                    case 59376: break;
//                    // Whirlwind Visual
//                    case 59551: break;
//                    // Hearstrike
//                    case 59783: break;
//                    // Z Check
//                    case 61678: break;
//                    // isDead Check
//                    case 61976: break;
//                    // Start the Engine
//                    case 62432: break;
//                    // Enchanted Broom
//                    case 62571: break;
//                    // Mulgore Hatchling
//                    case 62586: break;
                    case 62679:                             // Durotar Scorpion
                        trigger_spell_id = auraSpellInfo->CalculateSimpleValue(m_effIndex);
                        break;
//                    // Fighting Fish
//                    case 62833: break;
//                    // Shield Level 1
//                    case 63130: break;
//                    // Shield Level 2
//                    case 63131: break;
//                    // Shield Level 3
//                    case 63132: break;
//                    // Food
//                    case 64345: break;
//                    // Remove Player from Phase
//                    case 64445: break;
//                    // Food
//                    case 65418: break;
//                    // Food
//                    case 65419: break;
//                    // Food
//                    case 65420: break;
//                    // Food
//                    case 65421: break;
//                    // Food
//                    case 65422: break;
//                    // Rolling Throw
//                    case 67546: break;
                    case 69012:                             // Explosive Barrage - Krick and Ick
                    {
                        if (triggerTarget->GetTypeId() == TYPEID_UNIT)
                        {
                            if (Unit* pTarget = ((Creature*)triggerTarget)->SelectAttackingTarget(ATTACKING_TARGET_RANDOM, 0))
                            {
                                triggerTarget->CastSpell(pTarget, 69015, true);
                            }
                        }
                        return;
                    }
                    case 70017:                             // Gunship Cannon Fire
                        trigger_spell_id = 70021;
                        break;
//                    // Ice Tomb
//                    case 70157: break;
                    case 70842:                             // Mana Barrier
                    {
                        if (!triggerTarget || triggerTarget->getPowerType() != POWER_MANA)
                            return;

                        int32 damage = triggerTarget->GetHealth() - triggerTarget->GetMaxHealth();
                        if (damage >= 0)
                            return;

                        if (int32(triggerTarget->GetPower(POWER_MANA)) < abs(damage))
                        {
                            damage = -int32(triggerTarget->GetPower(POWER_MANA));
                            triggerTarget->RemoveAurasDueToSpell(auraId);
                        }

                        triggerTarget->DealHeal(triggerTarget, -damage, auraSpellInfo);
                        triggerTarget->ModifyPower(POWER_MANA, damage);
                        break;
                    }
//                    // Summon Timer: Suppresser
//                    case 70912: break;
//                    // Aura of Darkness
//                    case 71110: break;
//                    // Aura of Darkness
//                    case 71111: break;
//                    // Ball of Flames Visual
//                    case 71706: break;
//                    // Summon Broken Frostmourne
//                    case 74081: break;
                    default:
                        break;
                }
                break;
            }
            case SPELLFAMILY_MAGE:
            {
                switch(auraId)
                {
                    case 66:                                // Invisibility
                        // Here need periodic trigger reducing threat spell (or do it manually)
                        return;
                    default:
                        break;
                }
                break;
            }
//            case SPELLFAMILY_WARRIOR:
//            {
//                switch(auraId)
//                {
//                    // Wild Magic
//                    case 23410: break;
//                    // Corrupted Totems
//                    case 23425: break;
//                    default:
//                        break;
//                }
//                break;
//            }
//            case SPELLFAMILY_PRIEST:
//            {
//                switch(auraId)
//                {
//                    // Blue Beam
//                    case 32930: break;
//                    // Fury of the Dreghood Elders
//                    case 35460: break;
//                    default:
//                        break;
//                }
//                break;
//            }
            case SPELLFAMILY_HUNTER:
            {
                switch (auraId)
                {
                    case 53302:                             // Sniper training
                    case 53303:
                    case 53304:
                        if (triggerTarget->GetTypeId() != TYPEID_PLAYER)
                            return;

                        // Reset reapply counter at move
                        if (((Player*)triggerTarget)->isMoving())
                        {
                            m_modifier.m_amount = 6;
                            return;
                        }

                        // We are standing at the moment
                        if (m_modifier.m_amount > 0)
                        {
                            --m_modifier.m_amount;
                            return;
                        }

                        // select rank of buff
                        switch(auraId)
                        {
                            case 53302: trigger_spell_id = 64418; break;
                            case 53303: trigger_spell_id = 64419; break;
                            case 53304: trigger_spell_id = 64420; break;
                        }

                        // If aura is active - no need to continue
                        if (triggerTarget->HasAura(trigger_spell_id))
                            return;

                        break;
                    default:
                        break;
                }
                break;
            }
            case SPELLFAMILY_DRUID:
            {
                switch(auraId)
                {
                    case 768:                               // Cat Form
                        // trigger_spell_id not set and unknown effect triggered in this case, ignoring for while
                        return;
                    case 22842:                             // Frenzied Regeneration
                    case 22895:
                    case 22896:
                    case 26999:
                    {
                        int32 LifePerRage = GetModifier()->m_amount;

                        int32 lRage = target->GetPower(POWER_RAGE);
                        if (lRage > 100)                    // rage stored as rage*10
                            lRage = 100;
                        target->ModifyPower(POWER_RAGE, -lRage);
                        int32 FRTriggerBasePoints = int32(lRage*LifePerRage/10);
                        target->CastCustomSpell(target, 22845, &FRTriggerBasePoints, NULL, NULL, true, NULL, this);
                        return;
                    }
                    default:
                        break;
                }
                break;
            }

//            case SPELLFAMILY_HUNTER:
//            {
//                switch(auraId)
//                {
//                    //Frost Trap Aura
//                    case 13810:
//                        return;
//                    //Rizzle's Frost Trap
//                    case 39900:
//                        return;
//                    // Tame spells
//                    case 19597:         // Tame Ice Claw Bear
//                    case 19676:         // Tame Snow Leopard
//                    case 19677:         // Tame Large Crag Boar
//                    case 19678:         // Tame Adult Plainstrider
//                    case 19679:         // Tame Prairie Stalker
//                    case 19680:         // Tame Swoop
//                    case 19681:         // Tame Dire Mottled Boar
//                    case 19682:         // Tame Surf Crawler
//                    case 19683:         // Tame Armored Scorpid
//                    case 19684:         // Tame Webwood Lurker
//                    case 19685:         // Tame Nightsaber Stalker
//                    case 19686:         // Tame Strigid Screecher
//                    case 30100:         // Tame Crazed Dragonhawk
//                    case 30103:         // Tame Elder Springpaw
//                    case 30104:         // Tame Mistbat
//                    case 30647:         // Tame Barbed Crawler
//                    case 30648:         // Tame Greater Timberstrider
//                    case 30652:         // Tame Nightstalker
//                        return;
//                    default:
//                        break;
//                }
//                break;
//            }
            case SPELLFAMILY_SHAMAN:
            {
                switch(auraId)
                {
                    case 28820:                             // Lightning Shield (The Earthshatterer set trigger after cast Lighting Shield)
                    {
                        // Need remove self if Lightning Shield not active
                        Unit::SpellAuraHolderMap const& auras = triggerTarget->GetSpellAuraHolderMap();
                        for(Unit::SpellAuraHolderMap::const_iterator itr = auras.begin(); itr != auras.end(); ++itr)
                        {
                            SpellEntry const* spell = itr->second->GetSpellProto();
                            if (spell->SpellFamilyName == SPELLFAMILY_SHAMAN &&
                                spell->GetSpellFamilyFlags().test<CF_SHAMAN_LIGHTNING_SHIELD>())
                                return;
                        }
                        triggerTarget->RemoveAurasDueToSpell(28820);
                        return;
                    }
                    case 38443:                             // Totemic Mastery (Skyshatter Regalia (Shaman Tier 6) - bonus)
                    {
                        if (triggerTarget->IsAllTotemSlotsUsed())
                            triggerTarget->CastSpell(triggerTarget, 38437, true, NULL, this);
                        else
                            triggerTarget->RemoveAurasDueToSpell(38437);
                        return;
                    }
                    default:
                        break;
                }
                break;
            }
            default:
                break;
        }

        // Reget trigger spell proto
        triggeredSpellInfo = sSpellStore.LookupEntry(trigger_spell_id);
    }
    else                                                    // initial triggeredSpellInfo != NULL
    {
        // for channeled spell cast applied from aura owner to channel target (persistent aura affects already applied to true target)
        // come periodic casts applied to targets, so need seelct proper caster (ex. 15790)
        if (IsChanneledSpell(GetSpellProto()) && GetSpellProto()->Effect[GetEffIndex()] != SPELL_EFFECT_PERSISTENT_AREA_AURA)
        {
            // interesting 2 cases: periodic aura at caster of channeled spell
            if (target->GetObjectGuid() == casterGUID)
            {
                triggerCaster = target;

                if (WorldObject* channelTarget = target->GetMap()->GetWorldObject(target->GetChannelObjectGuid()))
                {
                    if (channelTarget->isType(TYPEMASK_UNIT))
                        triggerTarget = (Unit*)channelTarget;
                    else
                        triggerTargetObject = channelTarget;
                }
            }
            // or periodic aura at caster channel target
            else if (Unit* caster = GetCaster())
            {
                if (target->GetObjectGuid() == caster->GetChannelObjectGuid())
                {
                    triggerCaster = caster;
                    triggerTarget = target;
                }
            }
        }

        // Spell exist but require custom code
        switch(auraId)
        {
            case 9347:                                      // Mortal Strike
            {
                if (target->GetTypeId() != TYPEID_UNIT)
                    return;
                // expected selection current fight target
                triggerTarget = ((Creature*)target)->SelectAttackingTarget(ATTACKING_TARGET_TOPAGGRO, 0, triggeredSpellInfo);
                if (!triggerTarget)
                    return;

                break;
            }
            case 1010:                                      // Curse of Idiocy
            {
                // TODO: spell casted by result in correct way mostly
                // BUT:
                // 1) target show casting at each triggered cast: target don't must show casting animation for any triggered spell
                //      but must show affect apply like item casting
                // 2) maybe aura must be replace by new with accumulative stat mods instead stacking

                // prevent cast by triggered auras
                if (casterGUID == triggerTarget->GetObjectGuid())
                    return;

                // stop triggering after each affected stats lost > 90
                int32 intelectLoss = 0;
                int32 spiritLoss = 0;

                Unit::AuraList const& mModStat = triggerTarget->GetAurasByType(SPELL_AURA_MOD_STAT);
                for(Unit::AuraList::const_iterator i = mModStat.begin(); i != mModStat.end(); ++i)
                {
                    if ((*i)->GetId() == 1010)
                    {
                        switch((*i)->GetModifier()->m_miscvalue)
                        {
                            case STAT_INTELLECT: intelectLoss += (*i)->GetModifier()->m_amount; break;
                            case STAT_SPIRIT:    spiritLoss   += (*i)->GetModifier()->m_amount; break;
                            default: break;
                        }
                    }
                }

                if (intelectLoss <= -90 && spiritLoss <= -90)
                    return;

                break;
            }
            // Earthen Power (from Earthbind Totem Passive)
            case 6474:
            {
                Unit *owner = target->GetOwner();

                if (!owner)
                    break;

                Unit::AuraList const& dummyAuras = owner->GetAurasByType(SPELL_AURA_DUMMY);
                for(Unit::AuraList::const_iterator itr = dummyAuras.begin(); itr != dummyAuras.end(); ++itr)
                {
                    if ((*itr)->GetSpellProto()->SpellIconID == 2289 && (*itr)->GetSpellProto()->SpellFamilyName == SPELLFAMILY_SHAMAN)
                    {
                        if (!roll_chance_i((*itr)->GetModifier()->m_amount))
                            break;

                        target->CastSpell(target, 59566, true, NULL, this);
                        break;
                    }
                 }
                break;
            }
            case 16191:                                     // Mana Tide
            {
                triggerTarget->CastCustomSpell(triggerTarget, trigger_spell_id, &m_modifier.m_amount, NULL, NULL, true, NULL, this);
                return;
            }
            case 28084:                                     // Negative Charge
            {
                if (triggerTarget->HasAura(29660))
                    triggerTarget->RemoveAurasDueToSpell(29660);
                break;
            }
            case 28059:                                     // Positive Charge
            {
                if (triggerTarget->HasAura(29659))
                    triggerTarget->RemoveAurasDueToSpell(29659);
                break;
            }
            case 33525:                                     // Ground Slam
                triggerTarget->CastSpell(triggerTarget, trigger_spell_id, true, NULL, this, casterGUID);
                return;
            case 38280:                                     // Static Charge (Lady Vashj in Serpentshrine Cavern)
            case 53563:                                     // Beacon of Light
                // original caster must be target
                target->CastSpell(target, trigger_spell_id, true, NULL, this, target->GetObjectGuid());
                return;
            case 38736:                                     // Rod of Purification - for quest 10839 (Veil Skith: Darkstone of Terokk)
            {
                if (Unit* caster = GetCaster())
                    caster->CastSpell(triggerTarget, trigger_spell_id, true, NULL, this);
                return;
            }
            case 44883:                                     // Encapsulate
            {
                // Self cast spell, hence overwrite caster (only channeled spell where the triggered spell deals dmg to SELF)
                triggerCaster = triggerTarget;
                break;
            }
            case 48094:                                      // Intense Cold
                triggerTarget->CastSpell(triggerTarget, trigger_spell_id, true, NULL, this);
                return;
            case 58678:                                     // Rock Shards (Vault of Archavon, Archavon)
            {
                if (GetAuraTicks() != 1 && GetAuraTicks()%7)
                    return;
                break;
            }
            case 56654:                                     // Rapid Recuperation (triggered energize have baspioints == 0)
            case 58882:
            {
                int32 mana = target->GetMaxPower(POWER_MANA) * m_modifier.m_amount / 100;
                triggerTarget->CastCustomSpell(triggerTarget, trigger_spell_id, &mana, NULL, NULL, true, NULL, this);
                return;
            }
            case 71340:                                     // Pact of the Darkfallen (Lana'thel)
            {
                // growing damage, every tenth tick is 1k higher
                int32 multiplier = GetModifier()->m_miscvalue += 1;
                int32 bp0 = triggerTarget->GetMap()->GetDifficulty() >= RAID_DIFFICULTY_10MAN_HEROIC ? 4600 : 1610;
                bp0 = int32(bp0 + (floor(multiplier / 10.0f)) * 1000);
                triggerTarget->CastCustomSpell(triggerTarget, 71341, &bp0, 0, 0, true);
                break;
            }
        }
    }

    // All ok cast by default case
    if (triggeredSpellInfo)
    {
        if (triggerTargetObject)
            triggerCaster->CastSpell(triggerTargetObject->GetPositionX(), triggerTargetObject->GetPositionY(), triggerTargetObject->GetPositionZ(),
                triggeredSpellInfo, true, NULL, this, casterGUID);
        else
            triggerCaster->CastSpell(triggerTarget, triggeredSpellInfo, true, NULL, this, casterGUID);
    }
    else
    {
        if (Unit* caster = GetCaster())
        {
            if (triggerTarget->GetTypeId() != TYPEID_UNIT || !sScriptMgr.OnEffectDummy(caster, GetId(), GetEffIndex(), (Creature*)triggerTarget))
                sLog.outError("Aura::TriggerSpell: Spell %u have 0 in EffectTriggered[%d], not handled custom case?",GetId(),GetEffIndex());
        }
    }
}

void Aura::TriggerSpellWithValue()
{
    ObjectGuid casterGuid = GetCasterGuid();
    Unit* target = GetTriggerTarget();

    if (!casterGuid || !target)
        return;

    // generic casting code with custom spells and target/caster customs
    uint32 trigger_spell_id = GetSpellProto()->EffectTriggerSpell[m_effIndex];
    int32  basepoints0 = GetModifier()->m_amount;

    target->CastCustomSpell(target, trigger_spell_id, &basepoints0, NULL, NULL, true, NULL, this, casterGuid);
}

/*********************************************************/
/***                  AURA EFFECTS                     ***/
/*********************************************************/

void Aura::HandleAuraDummy(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    Unit *target = GetTarget();

    // AT APPLY
    if (apply)
    {
        switch(GetSpellProto()->SpellFamilyName)
        {
            case SPELLFAMILY_GENERIC:
            {
                switch(GetId())
                {
                    case 1515:                              // Tame beast
                        // FIX_ME: this is 2.0.12 threat effect replaced in 2.1.x by dummy aura, must be checked for correctness
                        if (target->CanHaveThreatList())
                            if (Unit* caster = GetCaster())
                                target->AddThreat(caster, 10.0f, false, GetSpellSchoolMask(GetSpellProto()), GetSpellProto());
                        return;
                    case 7057:                              // Haunting Spirits
                        // expected to tick with 30 sec period (tick part see in Aura::PeriodicTick)
                        m_isPeriodic = true;
                        m_modifier.periodictime = 30*IN_MILLISECONDS;
                        m_periodicTimer = m_modifier.periodictime;
                        return;
                    case 10255:                             // Stoned
                    {
                        if (Unit* caster = GetCaster())
                        {
                            if (caster->GetTypeId() != TYPEID_UNIT)
                                return;

                            caster->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                            caster->addUnitState(UNIT_STAT_ROOT);
                        }
                        return;
                    }
                    case 13139:                             // net-o-matic
                        // root to self part of (root_target->charge->root_self sequence
                        if (Unit* caster = GetCaster())
                            caster->CastSpell(caster, 13138, true, NULL, this);
                        return;
                    case 28832:                             // Mark of Korth'azz
                    case 28833:                             // Mark of Blaumeux
                    case 28834:                             // Mark of Rivendare
                    case 28835:                             // Mark of Zeliek
                    {
                        int32 damage = 0;

                        switch (GetStackAmount())
                        {
                            case 1:
                                return;
                            case 2: damage =   500; break;
                            case 3: damage =  1500; break;
                            case 4: damage =  4000; break;
                            case 5: damage = 12500; break;
                            default:
                                damage = 14000 + 1000 * GetStackAmount();
                                break;
                        }

                        if (Unit* caster = GetCaster())
                            caster->CastCustomSpell(target, 28836, &damage, NULL, NULL, true, NULL, this);
                        return;
                    }
                    case 31606:                             // Stormcrow Amulet
                    {
                        CreatureInfo const * cInfo = ObjectMgr::GetCreatureTemplate(17970);

                        // we must assume db or script set display id to native at ending flight (if not, target is stuck with this model)
                        if (cInfo)
                            target->SetDisplayId(Creature::ChooseDisplayId(cInfo));

                        return;
                    }
                    case 32045:                             // Soul Charge
                    case 32051:
                    case 32052:
                    {
                        // max duration is 2 minutes, but expected to be random duration
                        // real time randomness is unclear, using max 30 seconds here
                        // see further down for expire of this aura
                        GetHolder()->SetAuraDuration(urand(1, 30)*IN_MILLISECONDS);
                        return;
                    }
                    case 33326:                             // Stolen Soul Dispel
                    {
                        target->RemoveAurasDueToSpell(32346);
                        return;
                    }
                    case 36587:                             // Vision Guide
                    {
                        target->CastSpell(target, 36573, true, NULL, this);
                        return;
                    }
                    // Gender spells
                    case 38224:                             // Illidari Agent Illusion
                    case 37096:                             // Blood Elf Illusion
                    case 46354:                             // Blood Elf Illusion
                    {
                        uint8 gender = target->getGender();
                        uint32 spellId;
                        switch (GetId())
                        {
                            case 38224: spellId = (gender == GENDER_MALE ? 38225 : 38227); break;
                            case 37096: spellId = (gender == GENDER_MALE ? 37092 : 37094); break;
                            case 46354: spellId = (gender == GENDER_MALE ? 46355 : 46356); break;
                            default: return;
                        }
                        target->CastSpell(target, spellId, true, NULL, this);
                        return;
                    }
                    case 39238:                             // Fumping
                    {
                        if (!target)
                            return;

                        if (Unit* caster = GetCaster())
                            caster->SummonCreature(urand(0,1) ? 22482 : 22483, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_CORPSE_TIMED_DESPAWN, 60000 );
                        return;
                    }
                    case 39850:                             // Rocket Blast
                    {
                        if (roll_chance_i(20))              // backfire stun
                            target->CastSpell(target, 51581, true, NULL, this);
                        return;
                    }
                    case 43873:                             // Headless Horseman Laugh
                        target->PlayDistanceSound(11965);
                        return;
                    case 45963:                             // Call Alliance Deserter
                    {
                        // Escorting Alliance Deserter
                        if (target->GetMiniPet())
                            target->CastSpell(target, 45957, true);
                        return;
                    }
                    case 46699:                             // Requires No Ammo
                        if (target->GetTypeId() == TYPEID_PLAYER)
                            // not use ammo and not allow use
                            ((Player*)target)->RemoveAmmo();
                        return;
                    case 47190:                             // Toalu'u's Spiritual Incense
                        target->CastSpell(target, 47189, true, NULL, this);
                        // allow script to process further (text)
                        break;
                    case 47669:                             // Awaken Subboss (Gortok - Utgarde Pinnacle)
                    {
                        if (target && target->GetTypeId() == TYPEID_UNIT)
                        {
                            target->RemoveAurasDueToSpell(16245);
                            target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
                            ((Creature*)target)->SetInCombatWithZone();
                        }
                        break;
                    }
                    case 47795:                             // Cold Cleanse
                    {
                        if (Unit* Caster = GetCaster())
                        {
                            Caster->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);
                            Caster->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                            Caster->DeleteThreatList();
                            Caster->CombatStop(true);
                        }
                        return;
                    }
                    case 47977:                             // Magic Broom
                        Spell::SelectMountByAreaAndSkill(target, GetSpellProto(), 42680, 42683, 42667, 42668, 0);
                        return;
                    case 48025:                             // Headless Horseman's Mount
                        Spell::SelectMountByAreaAndSkill(target, GetSpellProto(), 51621, 48024, 51617, 48023, 0);
                        return;
                    case 48143:                             // Forgotten Aura
                        // See Death's Door
                        target->CastSpell(target, 48814, true, NULL, this);
                        return;
                    case 48276:                             // Svala - Ritual Of Sword
                        target->CastSpell(target, 54148, true);   //Cast Choose Target
                        target->CastSpell(target, 48331, true);   //Cast Swirl Sword
                        target->CastSpell(target, 54159, true);   //Cast Remove Equipment
                        return;
                    case 43885:                             // Headless Horseman - Horseman Laugh, Maniacal
                        target->PlayDirectSound(11965);     // triggered by spells delaying laugh
                        return;
                    case 50756:                             // Drakos Shpere Passive
                        target->CastSpell(target, 50758, true);
                        return;
                    case 51405:                             // Digging for Treasure
                        target->HandleEmote(EMOTE_STATE_WORK);
                        // Pet will be following owner, this makes him stop
                        target->addUnitState(UNIT_STAT_STUNNED);
                        return;
                    case 52921:                             // Arc Lightning (Halls of Lighning: Loken)
                        target->CastSpell(target, 52924, false);
                        return;
                    case 54236:                             // Death Touch - Lich King kill Overlord Drakuru
                        target->CastSpell(target, 54248, false);    // Cast Drakuru Death
                        return;
                    case 55328:                                 // Stoneclaw Totem I
                        target->CastSpell(target, 5728, true);
                        return;
                    case 55329:                                 // Stoneclaw Totem II
                        target->CastSpell(target, 6397, true);
                        return;
                    case 55330:                                 // Stoneclaw Totem III
                        target->CastSpell(target, 6398, true);
                        return;
                    case 55332:                                 // Stoneclaw Totem IV
                        target->CastSpell(target, 6399, true);
                        return;
                    case 55333:                                 // Stoneclaw Totem V
                        target->CastSpell(target, 10425, true);
                        return;
                    case 55335:                                 // Stoneclaw Totem VI
                        target->CastSpell(target, 10426, true);
                        return;
                    case 55278:                                 // Stoneclaw Totem VII
                        target->CastSpell(target, 25513, true);
                        return;
                    case 58589:                                 // Stoneclaw Totem VIII
                        target->CastSpell(target, 58583, true);
                        return;
                    case 58600:                             // Restricted Flight Area
                        target->MonsterWhisper(LANG_NO_FLY_ZONE, target, true);
                        return;
                    case 58590:                                 // Stoneclaw Totem IX
                        target->CastSpell(target, 58584, true);
                        return;
                    case 58591:                                 // Stoneclaw Totem X
                        target->CastSpell(target, 58585, true);
                        return;
                    case 58983:                                 // Big Blizzard Bear
                        Spell::SelectMountByAreaAndSkill(target, GetSpellProto(), 58997, 58999, 0, 0, 0);
                        return;
                    case 61187:                                 // Twilight Shift
                        target->CastSpell(target, 61885, true);
                        if (target->HasAura(57620))
                            target->RemoveAurasDueToSpell(57620);
                        if (target->HasAura(57874))
                            target->RemoveAurasDueToSpell(57874);
                        break;
                    case 54729:                             // Winged Steed of the Ebon Blade
                        Spell::SelectMountByAreaAndSkill(target, GetSpellProto(), 0, 0, 54726, 54727, 0);
                        return;
                    case 62061:                             // Festive Holiday Mount
                        if (target->HasAuraType(SPELL_AURA_MOUNTED))
                            // Reindeer Transformation
                            target->CastSpell(target, 25860, true, NULL, this);
                        return;
                    case 62109:                             // Tails Up: Aura
                        target->setFaction(1990);           // Ambient (hostile)
                        target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE);
                        return;
                    case 63322:                             // Saronite Vapors
                        if (Unit* caster = GetCaster())
                        {
                            int32 damage = 100 << GetStackAmount();
                            caster->CastCustomSpell(target, 63338, &damage, 0, 0, true); // damage spell
                            damage = damage >> 1;
                            caster->CastCustomSpell(target, 63337, &damage, 0, 0, true); // manareg spell
                        }
                        return;
                    case 63624:                             // Learn a Second Talent Specialization
                        // Teach Learn Talent Specialization Switches, required for client triggered casts, allow after 30 sec delay
                        if (target->GetTypeId() == TYPEID_PLAYER)
                            ((Player*)target)->learnSpell(63680, false);
                        return;
                    case 68645:
                        // Rocket Pack
                        if (target->GetTypeId() == TYPEID_PLAYER)
                        {
                            // Rocket Burst - visual effect
                            target->CastSpell(target, 69192, true, NULL, this);
                            // Rocket Pack - causing damage
                            target->CastSpell(target, 69193, true, NULL, this);
                            return;
                        }
                        return;
                    case 63651:                             // Revert to One Talent Specialization
                        // Teach Learn Talent Specialization Switches, remove
                        if (target->GetTypeId() == TYPEID_PLAYER)
                            ((Player*)target)->removeSpell(63680);
                        return;
                    case 68912:                             // Wailing Souls
                        if (Unit* caster = GetCaster())
                        {
                            caster->SetTargetGuid(target->GetObjectGuid());

                            // TODO - this is confusing, it seems the boss should channel this aura, and start casting the next spell
                            caster->CastSpell(caster, 68899, false);
                        }
                        return;
                    case 69152:                             // Gaseous Blight (Festergut)
                        target->RemoveAurasDueToSpell(69126); // previous gas state
                        return;
                    case 69154:                             // Gaseous Blight (Festergut)
                        target->RemoveAurasDueToSpell(69152); // previous gas state
                        return;
                    case 71342:                             // Big Love Rocket
                        Spell::SelectMountByAreaAndSkill(target, GetSpellProto(), 71344, 71345, 71346, 71347, 0);
                        return;
                    case 71563:                             // Deadly Precision
                        target->CastSpell(target, 71564, true, NULL, this);
                        return;
                    case 72087:                             // Kinetic Bomb Knockback
                        float x, y, z;
                        target->GetPosition(x, y, z);
                        target->GetMotionMaster()->Clear();
                        target->GetMotionMaster()->MovePoint(0, x, y, z + 6.0f * GetStackAmount());
                        return;
                    case 72286:                             // Invincible
                        Spell::SelectMountByAreaAndSkill(target, GetSpellProto(), 72281, 72282, 72283, 72284, 0);
                        return;
                    case 74856:                             // Blazing Hippogryph
                        Spell::SelectMountByAreaAndSkill(target, GetSpellProto(), 0, 0, 74854, 74855, 0);
                        return;
                    case 75614:                             // Celestial Steed
                        Spell::SelectMountByAreaAndSkill(target, GetSpellProto(), 75619, 75620, 75617, 75618, 76153);
                        return;
                    case 75973:                             // X-53 Touring Rocket
                        Spell::SelectMountByAreaAndSkill(target, GetSpellProto(), 0, 0, 75957, 75972, 76154);
                        return;
                }
                break;
            }
            case SPELLFAMILY_WARRIOR:
            {
                switch(GetId())
                {
                    case 41099:                             // Battle Stance
                    {
                        if (target->GetTypeId() != TYPEID_UNIT)
                            return;

                        // Stance Cooldown
                        target->CastSpell(target, 41102, true, NULL, this);

                        // Battle Aura
                        target->CastSpell(target, 41106, true, NULL, this);

                        // equipment
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_0, 32614);
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_1, 0);
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_2, 0);
                        return;
                    }
                    case 41100:                             // Berserker Stance
                    {
                        if (target->GetTypeId() != TYPEID_UNIT)
                            return;

                        // Stance Cooldown
                        target->CastSpell(target, 41102, true, NULL, this);

                        // Berserker Aura
                        target->CastSpell(target, 41107, true, NULL, this);

                        // equipment
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_0, 32614);
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_1, 0);
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_2, 0);
                        return;
                    }
                    case 41101:                             // Defensive Stance
                    {
                        if (target->GetTypeId() != TYPEID_UNIT)
                            return;

                        // Stance Cooldown
                        target->CastSpell(target, 41102, true, NULL, this);

                        // Defensive Aura
                        target->CastSpell(target, 41105, true, NULL, this);

                        // equipment
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_0, 32604);
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_1, 31467);
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_2, 0);
                        return;
                    }
                    case 53790:                             // Defensive Stance
                    {
                        if (target->GetTypeId() != TYPEID_UNIT)
                            return;

                        // Stance Cooldown
                        target->CastSpell(target, 59526, true, NULL, this);

                        // Defensive Aura
                        target->CastSpell(target, 41105, true, NULL, this);

                        // equipment
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_0, 43625);
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_1, 39384);
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_2, 0);
                        return;
                    }
                    case 53791:                             // Berserker Stance
                    {
                        if (target->GetTypeId() != TYPEID_UNIT)
                            return;

                        // Stance Cooldown
                        target->CastSpell(target, 59526, true, NULL, this);

                        // Berserker Aura
                        target->CastSpell(target, 41107, true, NULL, this);

                        // equipment
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_0, 43625);
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_1, 43625);
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_2, 0);
                        return;
                    }
                    case 53792:                             // Battle Stance
                    {
                        if (target->GetTypeId() != TYPEID_UNIT)
                            return;

                        // Stance Cooldown
                        target->CastSpell(target, 59526, true, NULL, this);

                        // Battle Aura
                        target->CastSpell(target, 41106, true, NULL, this);

                        // equipment
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_0, 43623);
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_1, 0);
                        ((Creature*)target)->SetVirtualItem(VIRTUAL_ITEM_SLOT_2, 0);
                        return;
                    }
                }

                // Overpower
                if (GetSpellProto()->GetSpellFamilyFlags().test<CF_WARRIOR_OVERPOWER>())
                {
                    // Must be casting target
                    if (!target->IsNonMeleeSpellCasted(false) || !target->GetObjectGuid().IsPlayerOrPet()) //unrelenting assault don't must affect on pve.
                        return;

                    Unit* caster = GetCaster();
                    if (!caster)
                        return;

                    Unit::AuraList const& modifierAuras = caster->GetAurasByType(SPELL_AURA_ADD_FLAT_MODIFIER);
                    for(Unit::AuraList::const_iterator itr = modifierAuras.begin(); itr != modifierAuras.end(); ++itr)
                    {
                        // Unrelenting Assault
                        if ((*itr)->GetSpellProto()->SpellFamilyName==SPELLFAMILY_WARRIOR && (*itr)->GetSpellProto()->SpellIconID == 2775)
                        {
                            switch ((*itr)->GetSpellProto()->Id)
                            {
                                case 46859:                 // Unrelenting Assault, rank 1
                                    target->CastSpell(target,64849,true,NULL,(*itr)());
                                    break;
                                case 46860:                 // Unrelenting Assault, rank 2
                                    target->CastSpell(target,64850,true,NULL,(*itr)());
                                    break;
                                default:
                                    break;
                            }
                            break;
                        }
                    }
                    return;
                }
                break;
            }
            case SPELLFAMILY_ROGUE:
            {
                // Honor Among Thieves
                if (GetId() == 52916)
                {
                    // Get Honor Among Thieves party aura
                    Unit::AuraList const &procTriggerSpellAuras = target->GetAurasByType(SPELL_AURA_PROC_TRIGGER_SPELL);
                    for (Unit::AuraList::const_iterator i = procTriggerSpellAuras.begin(); i != procTriggerSpellAuras.end(); ++i)
                    {
                        SpellEntry const *spellInfo = (*i)->GetSpellProto();

                        if (!spellInfo)
                            continue;

                        if (spellInfo->EffectTriggerSpell[0] == 52916)
                        {
                            // Get caster of aura
                            if(!(*i)->GetCaster() || (*i)->GetCaster()->GetTypeId() != TYPEID_PLAYER)
                                continue;

                            Player *pCaster = (Player*)((*i)->GetCaster());

                            // do not proc if player has CD, or if player has no target, or if player's target is not valid
                            if (pCaster->HasAura(51699, EFFECT_INDEX_1) || !pCaster->getVictim() || pCaster->IsFriendlyTo(pCaster->getVictim()))
                                continue;
                            // give combo point and aura for cooldown on success
                            else if (roll_chance_i(spellInfo->CalculateSimpleValue(EFFECT_INDEX_0)))
                                pCaster->CastSpell(pCaster->getVictim(), 51699, true);
                        }
                    }

                    // return after loop to make sure all rogues with Honor Among Thieves get the benefit of this proc rather than only first
                    return;
                }
                break;
            }
            case SPELLFAMILY_HUNTER:
            {
                switch(GetId())
                {
                    case 34026:                             // Kill Command
                        target->CastSpell(target, 34027, true, NULL, this);
                        return;
                }
                break;
            }
            case SPELLFAMILY_SHAMAN:
            {
                switch(GetId())
                {
                    case 55198:                             // Tidal Force
                        target->CastSpell(target, 55166, true, NULL, this);
                        return;
                }

                // Earth Shield
                if (GetSpellProto()->GetSpellFamilyFlags().test<CF_SHAMAN_EARTH_SHIELD>())
                {
                    // prevent double apply bonuses
                    if (target->GetTypeId() != TYPEID_PLAYER || !((Player*)target)->GetSession()->PlayerLoading())
                    {
                        if (Unit* caster = GetCaster())
                        {
                            m_modifier.m_amount = caster->SpellHealingBonusDone(target, GetSpellProto(), m_modifier.m_amount, SPELL_DIRECT_DAMAGE);
                            m_modifier.m_amount = target->SpellHealingBonusTaken(caster, GetSpellProto(), m_modifier.m_amount, SPELL_DIRECT_DAMAGE);
                        }
                    }
                    return;
                }
                break;
            }
            case SPELLFAMILY_DEATHKNIGHT:
            {
                // Hungering Cold - disease apply
                if (GetId() == 51209)
                {
                    Unit *caster = GetCaster();
                    if(!caster)
                        return;

                    caster->CastSpell(target, 55095, true);
                }
                break;
            }
        }
    }
    // AT REMOVE
    else
    {
        if (IsQuestTameSpell(GetId()) && target->isAlive())
        {
            Unit* caster = GetCaster();
            if (!caster || !caster->isAlive())
                return;

            uint32 finalSpellId = 0;
            switch(GetId())
            {
                case 19548: finalSpellId = 19597; break;
                case 19674: finalSpellId = 19677; break;
                case 19687: finalSpellId = 19676; break;
                case 19688: finalSpellId = 19678; break;
                case 19689: finalSpellId = 19679; break;
                case 19692: finalSpellId = 19680; break;
                case 19693: finalSpellId = 19684; break;
                case 19694: finalSpellId = 19681; break;
                case 19696: finalSpellId = 19682; break;
                case 19697: finalSpellId = 19683; break;
                case 19699: finalSpellId = 19685; break;
                case 19700: finalSpellId = 19686; break;
                case 30646: finalSpellId = 30647; break;
                case 30653: finalSpellId = 30648; break;
                case 30654: finalSpellId = 30652; break;
                case 30099: finalSpellId = 30100; break;
                case 30102: finalSpellId = 30103; break;
                case 30105: finalSpellId = 30104; break;
            }

            if (finalSpellId)
                caster->CastSpell(target, finalSpellId, true, NULL, this);
            return;
        }

        switch(GetId())
        {
            case 10255:                                     // Stoned
            {
                if (Unit* caster = GetCaster())
                {
                    if (caster->GetTypeId() != TYPEID_UNIT)
                        return;

                    // see dummy effect of spell 10254 for removal of flags etc
                    caster->CastSpell(caster, 10254, true);
                }
                return;
            }
            case 12479:                                     // Hex of Jammal'an
                target->CastSpell(target, 12480, true, NULL, this);
                return;
            case 12774:                                     // (DND) Belnistrasz Idol Shutdown Visual
            {
                if (m_removeMode == AURA_REMOVE_BY_DEATH)
                    return;

                // Idom Rool Camera Shake <- wtf, don't drink while making spellnames?
                if (Unit* caster = GetCaster())
                    caster->CastSpell(caster, 12816, true);

                return;
            }
            case 28059:                                     // Positive Charge (Thaddius)
            {
                if (target->HasAura(29659))
                    target->RemoveAurasDueToSpell(29659);
                return;
            }
            case 28084:                                     // Negative Charge (Thaddius)
            {
                if (target->HasAura(29660))
                    target->RemoveAurasDueToSpell(29660);
                return;
            }
            case 28169:                                     // Mutating Injection
            {
                // Mutagen Explosion
                target->CastSpell(target, 28206, true, NULL, this);
                // Poison Cloud
                target->CastSpell(target, 28240, true, NULL, this);
                return;
            }
            case 32045:                                     // Soul Charge
            {
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                    target->CastSpell(target, 32054, true, NULL, this);
                return;
            }
            case 32051:                                     // Soul Charge
            {
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                    target->CastSpell(target, 32057, true, NULL, this);
                return;
            }
            case 32052:                                     // Soul Charge
            {
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                    target->CastSpell(target, 32053, true, NULL, this);
                return;
            }
            case 32286:                                     // Focus Target Visual
            {
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                    target->CastSpell(target, 32301, true, NULL, this);
                return;
            }
            case 35079:                                     // Misdirection, triggered buff
            case 59628:                                     // Tricks of the Trade, triggered buff
            case 59665:                                     // Vigilance, redirection spell
            {
                if (Unit* pCaster = GetCaster())
                    pCaster->getHostileRefManager().ResetThreatRedirection();
                return;
            }
            case 36730:                                     // Flame Strike
            {
                target->CastSpell(target, 36731, true, NULL, this);
                return;
            }
            case 41099:                                     // Battle Stance
            {
                // Battle Aura
                target->RemoveAurasDueToSpell(41106);
                return;
            }
            case 41100:                                     // Berserker Stance
            {
                // Berserker Aura
                target->RemoveAurasDueToSpell(41107);
                return;
            }
            case 41101:                                     // Defensive Stance
            {
                // Defensive Aura
                target->RemoveAurasDueToSpell(41105);
                return;
            }
            case 42385:                                     // Alcaz Survey Aura
            {
                target->CastSpell(target, 42316, true, NULL, this);
                return;
            }
            case 42454:                                     // Captured Totem
            {
                if (m_removeMode == AURA_REMOVE_BY_DEFAULT)
                {
                    if (target->getDeathState() != CORPSE)
                        return;

                    Unit* pCaster = GetCaster();

                    if (!pCaster)
                        return;

                    // Captured Totem Test Credit
                    if (Player* pPlayer = pCaster->GetCharmerOrOwnerPlayerOrPlayerItself())
                        pPlayer->CastSpell(pPlayer, 42455, true);
                }
                return;
            }
            case 42517:                                     // Beam to Zelfrax
            {
                // expecting target to be a dummy creature
                Creature* pSummon = target->SummonCreature(23864, 0.0f, 0.0f, 0.0f, target->GetOrientation(), TEMPSUMMON_DEAD_DESPAWN, 0);

                Unit* pCaster = GetCaster();

                if (pSummon && pCaster)
                    pSummon->GetMotionMaster()->MovePoint(0, pCaster->GetPositionX(), pCaster->GetPositionY(), pCaster->GetPositionZ());
                return;
            }
            case 43681:                                     // Inactive
            {
                if (!target || target->GetTypeId() != TYPEID_PLAYER)
                    return;

                if (m_removeMode == AURA_REMOVE_BY_EXPIRE && target->GetTypeId() == TYPEID_PLAYER)
                    ((Player*)target)->ToggleAFK();
                return;
            }
            case 43969:                                     // Feathered Charm
            {
                // Steelfeather Quest Credit, Are there any requirements for this, like area?
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                    target->CastSpell(target, 43984, true);
                return;
            }
            case 44191:                                     // Flame Strike
            {
                if (target->GetMap()->IsDungeon())
                {
                    uint32 spellId = target->GetMap()->IsRegularDifficulty() ? 44190 : 46163;

                    target->CastSpell(target, spellId, true, NULL, this);
                }
                return;
            }
            case 45934:                                     // Dark Fiend
            {
                // Kill target if dispelled
                if (m_removeMode==AURA_REMOVE_BY_DISPEL)
                    target->DealDamage(target, target->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
                return;
            }
            case 45963:                                     // Call Alliance Deserter
            {
                // Escorting Alliance Deserter
                target->RemoveAurasDueToSpell(45957);
                return;
            }
            case 46308:                                     // Burning Winds
            {
                // casted only at creatures at spawn
                target->CastSpell(target, 47287, true, NULL, this);
                return;
            }
            case 47744:                                     // Rage of Jin'arrak
            {
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                {
                    if (Unit* caster = GetCaster())
                    {
                        caster->CastSpell(caster, 61611, true);
                        ((Player*)caster)->KilledMonsterCredit(26902);
                    }
                    return;
                }
                break;
            }
            case 47795:                                     // Cold Cleanse
            {
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                {
                    Unit* Caster = GetCaster();

                    if (Caster->isAlive())
                    {
                        Caster->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_DISABLE_MOVE);
                        Caster->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

                        Creature* pCreature = NULL;

                        MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck creature_check(*Caster,  26591, true, false, 15.0f);
                        MaNGOS::CreatureLastSearcher<MaNGOS::NearestCreatureEntryWithLiveStateInObjectRangeCheck> searcher(pCreature, creature_check);

                        Cell::VisitGridObjects(Caster, searcher, 15.0f);

                        if (pCreature)
                        {
                            float fX, fY, fZ;

                            fX = pCreature->GetPositionX();
                            fY = pCreature->GetPositionY();
                            fZ = pCreature->GetPositionZ();

                            Caster->SetSpeedRate(MOVE_RUN, 0.7f);
                            Caster->GetMotionMaster()->MovePoint(1, fX, fY, fZ);

                            switch(urand(0,1))
                            {
                                case 0: Caster->MonsterSay("I could sleep forever, mon...", LANG_UNIVERSAL, 0); break;
                                case 1: Caster->MonsterSay("Finally, I can be restin\'...", LANG_UNIVERSAL, 0); break;
                            }

                            //This should happen when Caster arive to dest place
                            pCreature->CastSpell(pCreature, 47798, true);
                            pCreature->CastSpell(pCreature, 48150, true);
                            pCreature->ForcedDespawn(15000);
                            ((Creature*)Caster)->ForcedDespawn(3000);
                            return;
                        }
                    }
                }
                break;
            }
            case 48385:                                     // Create Spirit Fount Beam
            {
                target->CastSpell(target, target->GetMap()->IsRegularDifficulty() ? 48380 : 59320, true);
                return;
            }
            case 49356:                                     // Flesh Decay - Tharonja
            {
                if (Unit* caster = GetCaster())
                {
                    caster->SetDisplayId(27073);            // Set Skeleton Model
                    caster->CastSpell(caster, 52509, true); // Cast Gift Of Tharonja
                    caster->CastSpell(caster, 52582, true); // Cast Transform Visual
                }
                return;
            }
            case 53463:                                     // Flesh Return - Tharonja
            {
                if (Unit* caster = GetCaster())
                {
                    caster->SetDisplayId(27072);            // Set Basic Model
                    caster->CastSpell(caster, 52582, true); // Cast Transform Visual
                }
                return;
            }
            case 50141:                                     // Blood Oath
            {
                // Blood Oath
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                    target->CastSpell(target, 50001, true, NULL, this);
                return;
            }
            case 51405:                                     // Digging for Treasure
            {
                const uint32 spell_list[7] =
                {
                    51441,                                  // hare
                    51397,                                  // crystal
                    51398,                                  // armor
                    51400,                                  // gem
                    51401,                                  // platter
                    51402,                                  // treasure
                    51443                                   // bug
                };

                target->CastSpell(target, spell_list[urand(0,6)], true);

                target->HandleEmote(EMOTE_STATE_NONE);
                target->clearUnitState(UNIT_STAT_STUNNED);
                return;
            }
            case 51870:                                     // Collect Hair Sample
            {
                if (Unit* pCaster = GetCaster())
                {
                    if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                        pCaster->CastSpell(target, 51872, true, NULL, this);
                }
                return;
            }
            case 34477: //Misdirection
            case 57934: //Tricks of Trade
            {
                // Do nothing - all maked in 1'st effect and on aura remove.
                return;
            }
            case 52098:                                     // Charge Up
            {
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                    target->CastSpell(target, 52092, true, NULL, this);

                return;
            }
            case 53039:                                     // Deploy Parachute
            {
                // Crusader Parachute
                target->RemoveAurasDueToSpell(53031);
                return;
            }
            case 53790:                                     // Defensive Stance
            {
                // Defensive Aura
                target->RemoveAurasDueToSpell(41105);
                return;
            }
            case 53791:                                     // Berserker Stance
            {
                // Berserker Aura
                target->RemoveAurasDueToSpell(41107);
                return;
            }
            case 53792:                                     // Battle Stance
            {
                // Battle Aura
                target->RemoveAurasDueToSpell(41106);
                return;
            }
            case 56150:                                     // Jedoga Sacriface Beam
            {
                if (Unit* caster = GetCaster())
                {
                    int32 health = target->GetHealthPercent();
                    int32 mana = target->GetPower(POWER_MANA)*100/target->GetMaxPower(POWER_MANA);
                    int32 instantkill = 1;
                    caster->CastCustomSpell(target, 58919, &health, &instantkill, &mana, true);
                }
                return;
            }
            case 56511:                                     // Towers of Certain Doom: Tower Bunny Smoke Flare Effect
            {
                // Towers of Certain Doom: Skorn Cannonfire
                if (m_removeMode == AURA_REMOVE_BY_DEFAULT)
                    target->CastSpell(target, 43069, true);
                return;
            }
            case 58600:                                     // Restricted Flight Area
            {
                AreaTableEntry const* area = GetAreaEntryByAreaID(target->GetAreaId());

                // Dalaran restricted flight zone (recheck before apply unmount)
                if (area && target->GetTypeId() == TYPEID_PLAYER && (area->flags & AREA_FLAG_CANNOT_FLY) &&
                    ((Player*)target)->IsFreeFlying() && !((Player*)target)->isGameMaster())
                {
                    target->CastSpell(target, 58601, true); // Remove Flight Auras (also triggered Parachute (45472))
                }
                return;
            }
            case 61900:                                     // Electrical Charge
            {
                if (m_removeMode == AURA_REMOVE_BY_DEATH)
                    target->CastSpell(target, GetSpellProto()->CalculateSimpleValue(EFFECT_INDEX_0), true);

                return;
            }
            case 64398:                                     // Summon Scrap Bot (Ulduar, Mimiron) - for Scrap Bots
            case 64426:                                     // Summon Scrap Bot (Ulduar, Mimiron) - for Assault Bots
            case 64621:                                     // Summon Fire Bot (Ulduar, Mimiron)
            {
                uint32 triggerSpell = 0;
                switch (GetId())
                {
                    case 64398: triggerSpell = 63819; break;
                    case 64426: triggerSpell = 64427; break;
                    case 64621: triggerSpell = 64622; break;
                }
                target->CastSpell(target, triggerSpell, false);
                return;
            }
            case 68839:                                     // Corrupt Soul
            {
                // Knockdown Stun
                target->CastSpell(target, 68848, true, NULL, this);
                // Draw Corrupted Soul
                target->CastSpell(target, 68846, true, NULL, this);
                return;
            }
            case 69766:                                     // Instability (Sindragosa)
            {
                // trigger Backlash if aura wears off
                if (m_removeMode != AURA_REMOVE_BY_EXPIRE)
                    return;

                int32 damage = GetModifier()->m_amount;
                target->CastCustomSpell(target, 69770, &damage, 0, 0, true, 0, this, GetCasterGuid(), GetSpellProto());
                return;
            }
            case 70308:                                     // Mutated Transformation (Putricide)
            {
                uint32 entry = 37672;

                if (target->GetMap()->GetDifficulty() == RAID_DIFFICULTY_25MAN_NORMAL ||
                    target->GetMap()->GetDifficulty() == RAID_DIFFICULTY_25MAN_HEROIC)
                {
                    entry = 38285;
                }

                if (Creature *pAbomination = target->SummonCreature(entry, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation(), TEMPSUMMON_DEAD_DESPAWN, 0))
                {
                    pAbomination->setFaction(target->getFaction());
                    target->CastSpell(pAbomination, 46598, true);
                    pAbomination->CastSpell(pAbomination, 70405, true);
                }

                return;
            }
            case 70955:                                     // Unbound Plague Bounce Protection (Putricide)
            {
                target->CastSpell(target, 70917, true); // Search Periodic
                return;
            }
            case 72087:                                     // Kinetic Bomb Knockback
            {
                float x, y, z;
                target->GetPosition(x, y, z);
                z = target->GetMap()->GetHeight(target->GetPhaseMask(), x, y, z);
                target->GetMotionMaster()->Clear();
                target->GetMotionMaster()->MovePoint(0, x, y, z);
                return;
            }
            case 72546:                             // Harvest Soul (Lich King)
            case 73655:
            {
                switch (m_removeMode)
                {
                    case AURA_REMOVE_BY_EXPIRE:
                        target->CastSpell(target, 72627, true); // instakill
                        // no break
                    case AURA_REMOVE_BY_DEATH:
                        target->CastSpell(target, 72679, true); // Harvested Soul buff
                        break;
                }
                return;
            }
        }

        // Living Bomb
        if (GetSpellProto()->SpellFamilyName == SPELLFAMILY_MAGE && GetSpellProto()->GetSpellFamilyFlags().test<CF_MAGE_LIVING_BOMB>())
        {
            if (m_removeMode == AURA_REMOVE_BY_EXPIRE || m_removeMode == AURA_REMOVE_BY_DISPEL)
            {
                if (this->GetCaster())
                    GetCaster()->CastSpell(target,m_modifier.m_amount,true,NULL,this);
                else
                    target->CastSpell(target,m_modifier.m_amount,true,NULL,this);
            }
            return;
        }
    }

    // AT APPLY & REMOVE

    switch(GetSpellProto()->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            switch(GetId())
            {
                case 6606:                                  // Self Visual - Sleep Until Cancelled (DND)
                {
                    if (apply)
                    {
                        target->SetStandState(UNIT_STAND_STATE_SLEEP);
                        target->addUnitState(UNIT_STAT_ROOT);
                    }
                    else
                    {
                        target->clearUnitState(UNIT_STAT_ROOT);
                        target->SetStandState(UNIT_STAND_STATE_STAND);
                    }

                    return;
                }
                case 11196:                                 // Recently Bandaged
                    target->ApplySpellImmune(GetId(), IMMUNITY_MECHANIC, GetMiscValue(), apply);
                    return;
                case 24658:                                 // Unstable Power
                {
                    if (apply)
                    {
                        Unit* caster = GetCaster();
                        if (!caster)
                            return;

                        caster->CastSpell(target, 24659, true, NULL, NULL, GetCasterGuid());
                    }
                    else
                        target->RemoveAurasDueToSpell(24659);
                    return;
                }
                case 24661:                                 // Restless Strength
                {
                    if (apply)
                    {
                        Unit* caster = GetCaster();
                        if (!caster)
                            return;

                        caster->CastSpell(target, 24662, true, NULL, NULL, GetCasterGuid());
                    }
                    else
                        target->RemoveAurasDueToSpell(24662);
                    return;
                }
                case 29266:                                 // Permanent Feign Death
                case 31261:                                 // Permanent Feign Death (Root)
                case 37493:                                 // Feign Death
                case 52593:                                 // Bloated Abomination Feign Death
                case 55795:                                 // Falling Dragon Feign Death
                case 57626:                                 // Feign Death
                case 57685:                                 // Permanent Feign Death
                case 58768:                                 // Permanent Feign Death (Freeze Jumpend)
                case 58806:                                 // Permanent Feign Death (Drowned Anim)
                case 58951:                                 // Permanent Feign Death
                case 64461:                                 // Permanent Feign Death (No Anim) (Root)
                case 65985:                                 // Permanent Feign Death (Root Silence Pacify)
                case 70592:                                 // Permanent Feign Death
                case 70628:                                 // Permanent Feign Death
                case 70630:                                 // Frozen Aftermath - Feign Death
                case 71598:                                 // Feign Death
                {
                    // Unclear what the difference really is between them.
                    // Some has effect1 that makes the difference, however not all.
                    // Some appear to be used depending on creature location, in water, at solid ground, in air/suspended, etc
                    // For now, just handle all the same way
                    if (target->GetTypeId() == TYPEID_UNIT)
                        target->SetFeignDeath(apply);

                    return;
                }
                case 35356:                                 // Spawn Feign Death
                case 35357:                                 // Spawn Feign Death
                case 42557:                                 // Feign Death
                case 51329:                                 // Feign Death
                {
                    if (target->GetTypeId() == TYPEID_UNIT)
                    {
                        // Flags not set like it's done in SetFeignDeath()
                        // UNIT_DYNFLAG_DEAD does not appear with these spells.
                        // All of the spells appear to be present at spawn and not used to feign in combat or similar.
                        if (apply)
                        {
                            target->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
                            target->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);

                            target->addUnitState(UNIT_STAT_DIED);
                        }
                        else
                        {
                            target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_UNK_29);
                            target->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH);

                            target->clearUnitState(UNIT_STAT_DIED);
                        }
                    }
                    return;
                }
                case 40214:                                 //Dragonmaw Illusion
                {
                    if (apply)
                    {
                        target->CastSpell(target, 40216, true);
                        target->CastSpell(target, 42016, true);
                    }
                    else
                    {
                        target->RemoveAurasDueToSpell(40216);
                        target->RemoveAurasDueToSpell(42016);
                    }
                    return;
                }
                case 42515:                                 // Jarl Beam
                {
                    // aura animate dead (fainted) state for the duration, but we need to animate the death itself (correct way below?)
                    if (Unit* pCaster = GetCaster())
                        pCaster->ApplyModFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FEIGN_DEATH, apply);

                    // Beam to Zelfrax at remove
                    if (!apply)
                        target->CastSpell(target, 42517, true);
                    return;
                }
                case 43874:                                 // Scourge Mur'gul Camp: Force Shield Arcane Purple x3
                    target->ApplyModFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_OOC_NOT_ATTACKABLE, apply);

                    if (apply)
                        target->addUnitState(UNIT_STAT_ROOT);
                    return;
                case 47178:                                 // Plague Effect Self
                    target->SetFeared(apply, GetCasterGuid(), GetId());
                    return;
                case 53813:                                 // Urom Shield
                case 50053:                                 // Varos Shield
                    target->ApplyModFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE, apply);
                    target->ApplyModFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PASSIVE, apply);
                    return;
                case 54852:                                 // Drakkari Colossus Stun (Hmmm... I'm lookup all stun effect spell, but not find needed!)
                    if (apply)
                    {
                        target->addUnitState(UNIT_STAT_STUNNED);
                        target->SetTargetGuid(target->GetObjectGuid());
                        target->CastSpell(target, 16245, true);
                    }
                    else
                    {
                        if (target->getVictim() && target->isAlive())
                            target->SetTargetGuid(target->getVictim()->GetObjectGuid());
                        target->clearUnitState(UNIT_STAT_STUNNED);
                        target->RemoveAurasDueToSpell(16245);
                    }
                    target->ApplyModFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE, apply);
                    target->ApplyModFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED, apply);
                    return;
                case 56422:                                 // Nerubian Submerge
                    // not known if there are other things todo, only flag are confirmed valid
                    target->ApplyModFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE, apply);
                    return;
                case 58204:                                 // LK Intro VO (1)
                    if (target->GetTypeId() == TYPEID_PLAYER)
                    {
                        // Play part 1
                        if (apply)
                            target->PlayDirectSound(14970, (Player *)target);
                        // continue in 58205
                        else
                            target->CastSpell(target, 58205, true);
                    }
                    return;
                case 58205:                                 // LK Intro VO (2)
                    if (target->GetTypeId() == TYPEID_PLAYER)
                    {
                        // Play part 2
                        if (apply)
                            target->PlayDirectSound(14971, (Player *)target);
                        // Play part 3
                        else
                            target->PlayDirectSound(14972, (Player *)target);
                    }
                    return;
                case 27978:
                case 40131:
                    if (apply)
                        target->m_AuraFlags |= UNIT_AURAFLAG_ALIVE_INVISIBLE;
                    else
                        target->m_AuraFlags |= ~UNIT_AURAFLAG_ALIVE_INVISIBLE;
                    return;
            }
            break;
        }
        case SPELLFAMILY_MAGE:
            break;
        case SPELLFAMILY_WARLOCK:
        {
            // Haunt
            if (GetSpellProto()->SpellIconID == 3172 && GetSpellProto()->GetSpellFamilyFlags().test<CF_WARLOCK_HAUNT>())
            {
                // NOTE: for avoid use additional field damage stored in dummy value (replace unused 100%
                if (apply)
                    m_modifier.m_amount = 0;                // use value as damage counter instead redundant 100% percent
                else
                {
                    int32 bp0 = m_modifier.m_amount;

                    if (Unit* caster = GetCaster())
                        target->CastCustomSpell(caster, 48210, &bp0, NULL, NULL, true, NULL, this);
                }
            }
            break;
        }
        case SPELLFAMILY_DRUID:
        {
            switch(GetId())
            {
                case 52610:                                 // Savage Roar
                {
                    if (apply)
                    {
                        if (target->GetShapeshiftForm() != FORM_CAT)
                            return;

                        target->CastSpell(target, 62071, true);
                    }
                    else
                        target->RemoveAurasDueToSpell(62071);
                    return;
                }
                case 61336:                                 // Survival Instincts
                {
                    if (apply)
                    {
                        if (!target->IsInFeralForm())
                            return;

                        int32 bp0 = int32(target->GetMaxHealth() * m_modifier.m_amount / 100);
                        target->CastCustomSpell(target, 50322, &bp0, NULL, NULL, true);
                    }
                    else
                        target->RemoveAurasDueToSpell(50322);
                    return;
                }
            }

            // Lifebloom
            if (GetSpellProto()->GetSpellFamilyFlags().test<CF_DRUID_LIFEBLOOM>())
            {
                if (apply)
                {
                    if (Unit* caster = GetCaster())
                    {
                        // prevent double apply bonuses
                        if (target->GetTypeId() != TYPEID_PLAYER || !((Player*)target)->GetSession()->PlayerLoading())
                        {
                            m_modifier.m_amount = caster->SpellHealingBonusDone(target, GetSpellProto(), m_modifier.m_amount, SPELL_DIRECT_DAMAGE, GetStackAmount());
                            m_modifier.m_amount = target->SpellHealingBonusTaken(caster, GetSpellProto(), m_modifier.m_amount, SPELL_DIRECT_DAMAGE, GetStackAmount());
                        }
                    }
                }
                else
                {
                    // Final heal on duration end
                    if (m_removeMode != AURA_REMOVE_BY_EXPIRE)
                        return;

                    // final heal
                    if (target->IsInWorld() && GetStackAmount() > 0)
                    {
                        int32 amount = m_modifier.m_amount;
                        target->CastCustomSpell(target, 33778, &amount, NULL, NULL, true, NULL, this, GetCasterGuid());

                        if (Unit* caster = GetCaster())
                        {
                            int32 returnmana = (GetSpellProto()->ManaCostPercentage * caster->GetCreateMana() / 100) * GetStackAmount() / 2;
                            caster->CastCustomSpell(caster, 64372, &returnmana, NULL, NULL, true, NULL, this, GetCasterGuid());
                        }
                    }
                }
                return;
            }

            // Predatory Strikes
            if (target->GetTypeId()==TYPEID_PLAYER && GetSpellProto()->SpellIconID == 1563)
            {
                ((Player*)target)->UpdateAttackPowerAndDamage();
                return;
            }

            // Improved Moonkin Form
            if (GetSpellProto()->SpellIconID == 2855)
            {
                uint32 spell_id;
                switch(GetId())
                {
                    case 48384: spell_id = 50170; break;    //Rank 1
                    case 48395: spell_id = 50171; break;    //Rank 2
                    case 48396: spell_id = 50172; break;    //Rank 3
                    default:
                        sLog.outError("HandleAuraDummy: Not handled rank of IMF (Spell: %u)",GetId());
                        return;
                }

                if (apply)
                {
                    if (target->GetShapeshiftForm() != FORM_MOONKIN)
                        return;

                    target->CastSpell(target, spell_id, true);
                }
                else
                    target->RemoveAurasDueToSpell(spell_id);
                return;
            }
            break;
        }
        case SPELLFAMILY_ROGUE:
            switch(GetId())
            {
                case 57934:                                 // Tricks of the Trade, main spell
                {
                    if (apply)
                        GetHolder()->SetAuraCharges(1);     // not have proper charges set in spell data
                    else
                    {
                        // used for direct in code aura removes and spell proc event charges expire
                        if (m_removeMode != AURA_REMOVE_BY_DEFAULT)
                            target->getHostileRefManager().ResetThreatRedirection();
                    }
                    return;
                }
            }
            break;
        case SPELLFAMILY_HUNTER:
        {
            switch(GetId())
            {
                case 34477:                                 // Misdirection, main spell
                {
                    if (apply)
                        GetHolder()->SetAuraCharges(1);     // not have proper charges set in spell data
                    else
                    {
                        // used for direct in code aura removes and spell proc event charges expire
                        if (m_removeMode != AURA_REMOVE_BY_DEFAULT)
                            target->getHostileRefManager().ResetThreatRedirection();
                    }
                    return;
                }
            }
            break;
        }
        case SPELLFAMILY_PALADIN:
            switch(GetId())
            {
                case 20911:                                 // Blessing of Sanctuary
                case 25899:                                 // Greater Blessing of Sanctuary
                {
                    if (apply)
                        target->CastSpell(target, 67480, true, NULL, this);
                    else
                        target->RemoveAurasDueToSpell(67480);
                    return;
                }
            }
            break;
        case SPELLFAMILY_SHAMAN:
        {
            switch(GetId())
            {
                case 6495:                                  // Sentry Totem
                {
                    if (target->GetTypeId() != TYPEID_PLAYER)
                        return;

                    Totem* totem = target->GetTotem(TOTEM_SLOT_AIR);

                    if (totem && apply)
                        ((Player*)target)->SetViewPoint(totem);
                    else
                        ((Player*)target)->SetViewPoint(NULL);

                    return;
                }
            }
            break;
        }
    }

    if (GetEffIndex() == EFFECT_INDEX_0 && target->GetTypeId() == TYPEID_PLAYER)
    {
        SpellAreaForAreaMapBounds saBounds = sSpellMgr.GetSpellAreaForAuraMapBounds(GetId());
        if (saBounds.first != saBounds.second)
        {
            uint32 zone, area;
            target->GetZoneAndAreaId(zone, area);

            for(SpellAreaForAreaMap::const_iterator itr = saBounds.first; itr != saBounds.second; ++itr)
            {
                // some auras remove at aura remove
                if (!itr->second->IsFitToRequirements((Player*)target, zone, area))
                    target->RemoveAurasDueToSpell(itr->second->spellId);
                // some auras applied at aura apply
                else if (itr->second->autocast)
                {
                    if (!target->HasAura(itr->second->spellId, EFFECT_INDEX_0))
                        target->CastSpell(target, itr->second->spellId, true);
                }
            }
        }
    }

    // script has to "handle with care", only use where data are not ok to use in the above code.
    if (target->GetTypeId() == TYPEID_UNIT)
        sScriptMgr.OnAuraDummy(this, apply);
}

void Aura::HandleAuraMounted(bool apply, bool Real)
{
    // only at real add/remove aura
    if(!Real)
        return;

    Unit *target = GetTarget();

    if (apply)
    {
        CreatureInfo const* ci = ObjectMgr::GetCreatureTemplate(m_modifier.m_miscvalue);
        if(!ci)
        {
            sLog.outErrorDb("AuraMounted: `creature_template`='%u' not found in database (only need it modelid)", m_modifier.m_miscvalue);
            return;
        }

        uint32 display_id = Creature::ChooseDisplayId(ci);
        CreatureModelInfo const *minfo = sObjectMgr.GetCreatureModelRandomGender(display_id);
        if (minfo)
            display_id = minfo->modelid;

        target->Mount(display_id, GetId(), ci->vehicleId, GetMiscValue());
    }
    else
    {
        target->Unmount(true);
    }
}

void Aura::HandleAuraWaterWalk(bool apply, bool Real)
{
    // only at real add/remove aura
    if(!Real)
        return;

    // do not remove unit flag if there are more than this auraEffect of that kind on unit on unit
    if (!apply && GetTarget()->HasAuraType(SPELL_AURA_WATER_WALK))
        return;

    GetTarget()->SetWaterWalk(apply);
}

void Aura::HandleAuraFeatherFall(bool apply, bool Real)
{
    // only at real add/remove aura
    if(!Real)
        return;

    Unit *target = GetTarget();

    // do not remove unit flag if there are more than this auraEffect of that kind on unit on unit
    if (!apply && target->HasAuraType(SPELL_AURA_FEATHER_FALL))
        return;

    WorldPacket data;
    if (apply)
        data.Initialize(SMSG_MOVE_FEATHER_FALL, 8+4);
    else
        data.Initialize(SMSG_MOVE_NORMAL_FALL, 8+4);
    data << target->GetPackGUID();
    data << uint32(0);
    target->SendMessageToSet(&data, true);

    // start fall from current height
    if(!apply && target->GetTypeId() == TYPEID_PLAYER)
        ((Player*)target)->SetFallInformation(0, target->GetPositionZ());

    // additional custom cases
    if(!apply)
    {
        switch(GetId())
        {
            // Soaring - Test Flight chain
            case 36812:
            case 37910:
            case 37940:
            case 37962:
            case 37968:
            {
                if (Unit* pCaster = GetCaster())
                    pCaster->CastSpell(pCaster, 37108, true);
                return;
            }
        }
    }
}

void Aura::HandleAuraHover(bool apply, bool Real)
{
    // only at real add/remove aura
    if(!Real)
        return;

    // do not remove unit flag if there are more than this auraEffect of that kind on unit on unit
    if (!apply && GetTarget()->HasAuraType(SPELL_AURA_HOVER))
        return;

    WorldPacket data;
    if (apply)
    {
        GetTarget()->m_movementInfo.AddMovementFlag(MOVEFLAG_HOVER);
        data.Initialize(GetTarget()->GetTypeId() == TYPEID_PLAYER ? SMSG_MOVE_SET_HOVER : SMSG_SPLINE_MOVE_SET_HOVER, 8+4);
        data << GetTarget()->GetPackGUID();
        if (GetTarget()->GetTypeId() == TYPEID_PLAYER)
        {
            data << uint32(0);
        }
        else
            GetTarget()->SetByteValue(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_HOVER);
    }
    else
    {
        GetTarget()->m_movementInfo.RemoveMovementFlag(MOVEFLAG_HOVER);
        data.Initialize(GetTarget()->GetTypeId() == TYPEID_PLAYER ? SMSG_MOVE_UNSET_HOVER : SMSG_SPLINE_MOVE_UNSET_HOVER, 8+4);
        data << GetTarget()->GetPackGUID();
        if (GetTarget()->GetTypeId() == TYPEID_PLAYER)
        {
            data << uint32(0);
        }
        else
            GetTarget()->RemoveByteFlag(UNIT_FIELD_BYTES_1, 3, UNIT_BYTE1_FLAG_HOVER);
    }
    GetTarget()->SendMessageToSet(&data, true);
}

void Aura::HandleWaterBreathing(bool /*apply*/, bool /*Real*/)
{
    // update timers in client
    if (GetTarget()->GetTypeId()==TYPEID_PLAYER)
        ((Player*)GetTarget())->UpdateMirrorTimers();
}

void Aura::HandleAuraModShapeshift(bool apply, bool Real)
{
    if (!Real)
        return;

    ShapeshiftForm form = ShapeshiftForm(m_modifier.m_miscvalue);

    SpellShapeshiftFormEntry const* ssEntry = sSpellShapeshiftFormStore.LookupEntry(form);
    if (!ssEntry)
    {
        sLog.outError("Unknown shapeshift form %u in spell %u", form, GetId());
        return;
    }

    uint32 modelid = 0;
    Powers PowerType = POWER_MANA;
    Unit* target = GetTarget();

    if (ssEntry->modelID_A)
        modelid = target->GetModelForForm(ssEntry);

    // remove polymorph before changing display id to keep new display id
    switch (form)
    {
        case FORM_CAT:
        case FORM_TREE:
        case FORM_TRAVEL:
        case FORM_AQUA:
        case FORM_BEAR:
        case FORM_DIREBEAR:
        case FORM_FLIGHT_EPIC:
        case FORM_FLIGHT:
        case FORM_MOONKIN:
        {
            // remove movement affects
            target->RemoveSpellsCausingAura(SPELL_AURA_MOD_ROOT, GetHolder());
            std::set<uint32> toRemoveSpellList;
            Unit::AuraList const& slowingAuras = target->GetAurasByType(SPELL_AURA_MOD_DECREASE_SPEED);
            for (Unit::AuraList::const_iterator iter = slowingAuras.begin(); iter != slowingAuras.end(); ++iter)
            {
                if (iter->IsEmpty())
                    continue;

                SpellAuraHolderPtr holder = iter->GetHolder();
                if (!holder || holder->IsDeleted())
                    continue;

                SpellEntry const* aurSpellInfo = holder->GetSpellProto();

                uint32 aurMechMask = GetAllSpellMechanicMask(aurSpellInfo);

                // If spell that caused this aura has Croud Control or Daze effect
                if (((aurMechMask & MECHANIC_NOT_REMOVED_BY_SHAPESHIFT) &&
                    // some non-Daze spells that have MECHANIC_DAZE
                    aurSpellInfo->Id != 18118 &&    // Aftermath
                    !aurSpellInfo->IsFitToFamily<SPELLFAMILY_PALADIN, CF_PALADIN_AVENGERS_SHIELD>()) ||
                    // some Daze spells have these parameters instead of MECHANIC_DAZE (skip snare spells)
                    (aurSpellInfo->SpellIconID == 15 && aurSpellInfo->Dispel == 0 &&
                    (aurMechMask & (1 << (MECHANIC_SNARE-1))) == 0))
                {
                    continue;
                }

                // All OK, remove aura now
                toRemoveSpellList.insert(aurSpellInfo->Id);
            }

            for (std::set<uint32>::iterator i = toRemoveSpellList.begin(); i != toRemoveSpellList.end(); ++i)
                target->RemoveAurasDueToSpellByCancel(*i);

            // and polymorphic affects
            if (target->IsPolymorphed())
                target->RemoveAurasDueToSpell(target->getTransForm());

            break;
        }
        default:
           break;
    }

    if (apply)
    {
        // remove other shapeshift before applying a new one
        target->RemoveSpellsCausingAura(SPELL_AURA_MOD_SHAPESHIFT, GetHolder());

        if (modelid > 0)
            target->SetDisplayId(modelid);

        // now only powertype must be set
        switch (form)
        {
            case FORM_CAT:
            case FORM_SHADOW_DANCE:
                PowerType = POWER_ENERGY;
                break;
            case FORM_BEAR:
            case FORM_DIREBEAR:
            case FORM_BATTLESTANCE:
            case FORM_BERSERKERSTANCE:
            case FORM_DEFENSIVESTANCE:
                PowerType = POWER_RAGE;
                break;
            default:
                break;
        }

        if (PowerType != POWER_MANA)
        {
            // reset power to default values only at power change
            if (target->getPowerType() != PowerType)
                target->setPowerType(PowerType);

            switch (form)
            {
                case FORM_CAT:
                case FORM_BEAR:
                case FORM_DIREBEAR:
                {
                    // get furor proc chance
                    int32 furorChance = 0;
                    Unit::AuraList const& mDummy = target->GetAurasByType(SPELL_AURA_DUMMY);
                    for (Unit::AuraList::const_iterator i = mDummy.begin(); i != mDummy.end(); ++i)
                    {
                        if ((*i)->GetSpellProto()->SpellIconID == 238)
                        {
                            furorChance = (*i)->GetModifier()->m_amount;
                            break;
                        }
                    }

                    if (m_modifier.m_miscvalue == FORM_CAT)
                    {
                        // Furor chance is now amount allowed to save energy for cat form
                        // without talent it reset to 0
                        if ((int32)target->GetPower(POWER_ENERGY) > furorChance)
                        {
                            target->SetPower(POWER_ENERGY, 0);
                            target->CastCustomSpell(target, 17099, &furorChance, NULL, NULL, true, NULL, this);
                        }
                    }
                    else if (furorChance)                   // only if talent known
                    {
                        target->SetPower(POWER_RAGE, 0);
                        if (irand(1, 100) <= furorChance)
                            target->CastSpell(target, 17057, true, NULL, this);
                    }
                    break;
                }
                case FORM_BATTLESTANCE:
                case FORM_DEFENSIVESTANCE:
                case FORM_BERSERKERSTANCE:
                {
                    uint32 Rage_val = 0;
                    // Stance mastery + Tactical mastery (both passive, and last have aura only in defense stance, but need apply at any stance switch)
                    if (target->GetTypeId() == TYPEID_PLAYER)
                    {
                        PlayerSpellMap const& sp_list = ((Player *)target)->GetSpellMap();
                        for (PlayerSpellMap::const_iterator itr = sp_list.begin(); itr != sp_list.end(); ++itr)
                        {
                            if (itr->second.state == PLAYERSPELL_REMOVED)
                                continue;

                            SpellEntry const *spellInfo = sSpellStore.LookupEntry(itr->first);
                            if (spellInfo && spellInfo->SpellFamilyName == SPELLFAMILY_WARRIOR && spellInfo->SpellIconID == 139)
                                Rage_val += target->CalculateSpellDamage(target, spellInfo, EFFECT_INDEX_0) * 10;
                        }
                    }

                    if (target->GetPower(POWER_RAGE) > Rage_val)
                        target->SetPower(POWER_RAGE, Rage_val);
                    break;
                }
                // Shadow Dance - apply stealth mode stand flag
                case FORM_SHADOW_DANCE:
                    target->SetStandFlags(UNIT_STAND_FLAGS_CREEP);
                    break;
                default:
                    break;
            }
        }

        // send FORM_STEALTH to client so it uses correct stealth action bar
        if (form == FORM_SHADOW_DANCE)
            form = FORM_STEALTH;

        target->SetShapeshiftForm(form);

        // a form can give the player a new castbar with some spells.. this is a clientside process..
        // serverside just needs to register the new spells so that player isn't kicked as cheater
        if (target->GetTypeId() == TYPEID_PLAYER)
            for (uint32 i = 0; i < 8; ++i)
                if (ssEntry->spellId[i])
                    ((Player*)target)->addSpell(ssEntry->spellId[i], true, false, false, false);
    }
    else
    {
        if (modelid > 0)
            target->SetDisplayId(target->GetNativeDisplayId());

        if (target->getClass() == CLASS_DRUID)
            target->setPowerType(POWER_MANA);

        target->SetShapeshiftForm(FORM_NONE);

        // re-apply transform display with preference negative cases
        Unit::AuraList& otherTransforms = target->GetAurasByType(SPELL_AURA_TRANSFORM);
        if (!otherTransforms.empty())
        {
            // look for other transform auras
            Aura* handledAura = (*otherTransforms.begin())();
            for (Unit::AuraList::iterator itr = otherTransforms.begin(); itr != otherTransforms.end(); ++itr)
            {
                if (itr->IsEmpty())
                    continue;

                // negative auras are preferred
                if (!IsPositiveSpell((*itr)->GetId()))
                {
                    handledAura = (*itr)();
                    break;
                }
            }
            handledAura->ApplyModifier(true);
        }

        switch(form)
        {
            // Nordrassil Harness - bonus
            case FORM_BEAR:
            case FORM_DIREBEAR:
            case FORM_CAT:
                if (Aura const* dummy = target->GetDummyAura(37315))
                    target->CastSpell(target, 37316, true, NULL, dummy);
                break;
            // Nordrassil Regalia - bonus
            case FORM_MOONKIN:
                if (Aura const* dummy = target->GetDummyAura(37324))
                    target->CastSpell(target, 37325, true, NULL, dummy);
                break;
            // Shadow Dance - remove stealth mode stand flag
            case FORM_SHADOW_DANCE:
                target->RemoveStandFlags(UNIT_STAND_FLAGS_CREEP);
                break;
            default:
                break;
        }

        // look at the comment in apply-part
        if (target->GetTypeId() == TYPEID_PLAYER)
            for (uint32 i = 0; i < 8; ++i)
                if (ssEntry->spellId[i])
                    ((Player*)target)->removeSpell(ssEntry->spellId[i], false, false, false);
    }

    // adding/removing linked auras
    // add/remove the shapeshift aura's boosts
    HandleShapeshiftBoosts(apply);

    target->UpdateSpeed(MOVE_RUN, true);

    if (target->GetTypeId() == TYPEID_PLAYER)
        ((Player*)target)->InitDataForForm();

}

void Aura::HandleAuraTransform(bool apply, bool Real)
{
    Unit *target = GetTarget();
    if (apply)
    {
        do { // (to avoid lots of indentation changes)

        // update active transform spell only when transform or shapeshift not set or not overwriting negative by positive case
        if (target->GetModelForForm() && IsPositiveSpell(GetId()))
            break;

        // special case (spell specific functionality)
        if (m_modifier.m_miscvalue == 0)
        {
            switch (GetId())
            {
                case 16739:                                 // Orb of Deception
                {
                    uint32 orb_model = target->GetNativeDisplayId();
                    switch(orb_model)
                    {
                        // Troll Female
                        case 1479: target->SetDisplayId(10134); break;
                        // Troll Male
                        case 1478: target->SetDisplayId(10135); break;
                        // Tauren Male
                        case 59:   target->SetDisplayId(10136); break;
                        // Human Male
                        case 49:   target->SetDisplayId(10137); break;
                        // Human Female
                        case 50:   target->SetDisplayId(10138); break;
                        // Orc Male
                        case 51:   target->SetDisplayId(10139); break;
                        // Orc Female
                        case 52:   target->SetDisplayId(10140); break;
                        // Dwarf Male
                        case 53:   target->SetDisplayId(10141); break;
                        // Dwarf Female
                        case 54:   target->SetDisplayId(10142); break;
                        // NightElf Male
                        case 55:   target->SetDisplayId(10143); break;
                        // NightElf Female
                        case 56:   target->SetDisplayId(10144); break;
                        // Undead Female
                        case 58:   target->SetDisplayId(10145); break;
                        // Undead Male
                        case 57:   target->SetDisplayId(10146); break;
                        // Tauren Female
                        case 60:   target->SetDisplayId(10147); break;
                        // Gnome Male
                        case 1563: target->SetDisplayId(10148); break;
                        // Gnome Female
                        case 1564: target->SetDisplayId(10149); break;
                        // BloodElf Female
                        case 15475: target->SetDisplayId(17830); break;
                        // BloodElf Male
                        case 15476: target->SetDisplayId(17829); break;
                        // Dranei Female
                        case 16126: target->SetDisplayId(17828); break;
                        // Dranei Male
                        case 16125: target->SetDisplayId(17827); break;
                        default: break;
                    }
                    break;
                }
                case 42365:                                 // Murloc costume
                    target->SetDisplayId(21723);
                    break;
                //case 44186:                               // Gossip NPC Appearance - All, Brewfest
                    //break;
                //case 48305:                               // Gossip NPC Appearance - All, Spirit of Competition
                    //break;
                case 50517:                                 // Dread Corsair
                case 51926:                                 // Corsair Costume
                {
                    // expected for players
                    uint32 race = target->getRace();

                    switch(race)
                    {
                        case RACE_HUMAN:
                            target->SetDisplayId(target->getGender() == GENDER_MALE ? 25037 : 25048);
                            break;
                        case RACE_ORC:
                            target->SetDisplayId(target->getGender() == GENDER_MALE ? 25039 : 25050);
                            break;
                        case RACE_DWARF:
                            target->SetDisplayId(target->getGender() == GENDER_MALE ? 25034 : 25045);
                            break;
                        case RACE_NIGHTELF:
                            target->SetDisplayId(target->getGender() == GENDER_MALE ? 25038 : 25049);
                            break;
                        case RACE_UNDEAD:
                            target->SetDisplayId(target->getGender() == GENDER_MALE ? 25042 : 25053);
                            break;
                        case RACE_TAUREN:
                            target->SetDisplayId(target->getGender() == GENDER_MALE ? 25040 : 25051);
                            break;
                        case RACE_GNOME:
                            target->SetDisplayId(target->getGender() == GENDER_MALE ? 25035 : 25046);
                            break;
                        case RACE_TROLL:
                            target->SetDisplayId(target->getGender() == GENDER_MALE ? 25041 : 25052);
                            break;
                        case RACE_GOBLIN:                   // not really player race (3.x), but model exist
                            target->SetDisplayId(target->getGender() == GENDER_MALE ? 25036 : 25047);
                            break;
                        case RACE_BLOODELF:
                            target->SetDisplayId(target->getGender() == GENDER_MALE ? 25032 : 25043);
                            break;
                        case RACE_DRAENEI:
                            target->SetDisplayId(target->getGender() == GENDER_MALE ? 25033 : 25044);
                            break;
                    }

                    break;
                }
                //case 50531:                               // Gossip NPC Appearance - All, Pirate Day
                    //break;
                //case 51010:                               // Dire Brew
                    //break;
                //case 53806:                               // Pygmy Oil
                    //break;
                case 62847:                                 // NPC Appearance - Valiant 02
                    target->SetDisplayId(target->getGender() == GENDER_MALE ? 26185 : 26186);
                    break;
                //case 62852:                               // NPC Appearance - Champion 01
                    //break;
                //case 63965:                               // NPC Appearance - Champion 02
                    //break;
                //case 63966:                               // NPC Appearance - Valiant 03
                    //break;
                case 65386:                                 // Honor the Dead
                case 65495:
                {
                    switch(target->getGender())
                    {
                        case GENDER_MALE:
                            target->SetDisplayId(29203);    // Chapman
                            break;
                        case GENDER_FEMALE:
                        case GENDER_NONE:
                            target->SetDisplayId(29204);    // Catrina
                            break;
                    }
                    break;
                }
                //case 65511:                               // Gossip NPC Appearance - Brewfest
                    //break;
                //case 65522:                               // Gossip NPC Appearance - Winter Veil
                    //break;
                //case 65523:                               // Gossip NPC Appearance - Default
                    //break;
                //case 65524:                               // Gossip NPC Appearance - Lunar Festival
                    //break;
                //case 65525:                               // Gossip NPC Appearance - Hallow's End
                    //break;
                //case 65526:                               // Gossip NPC Appearance - Midsummer
                    //break;
                //case 65527:                               // Gossip NPC Appearance - Spirit of Competition
                    //break;
                case 65528:                                 // Gossip NPC Appearance - Pirates' Day
                {
                    // expecting npc's using this spell to have models with race info.
                    // random gender, regardless of current gender
                    switch (target->getRace())
                    {
                        case RACE_HUMAN:
                            target->SetDisplayId(roll_chance_i(50) ? 25037 : 25048);
                            break;
                        case RACE_ORC:
                            target->SetDisplayId(roll_chance_i(50) ? 25039 : 25050);
                            break;
                        case RACE_DWARF:
                            target->SetDisplayId(roll_chance_i(50) ? 25034 : 25045);
                            break;
                        case RACE_NIGHTELF:
                            target->SetDisplayId(roll_chance_i(50) ? 25038 : 25049);
                            break;
                        case RACE_UNDEAD:
                            target->SetDisplayId(roll_chance_i(50) ? 25042 : 25053);
                            break;
                        case RACE_TAUREN:
                            target->SetDisplayId(roll_chance_i(50) ? 25040 : 25051);
                            break;
                        case RACE_GNOME:
                            target->SetDisplayId(roll_chance_i(50) ? 25035 : 25046);
                            break;
                        case RACE_TROLL:
                            target->SetDisplayId(roll_chance_i(50) ? 25041 : 25052);
                            break;
                        case RACE_GOBLIN:
                            target->SetDisplayId(roll_chance_i(50) ? 25036 : 25047);
                            break;
                        case RACE_BLOODELF:
                            target->SetDisplayId(roll_chance_i(50) ? 25032 : 25043);
                            break;
                        case RACE_DRAENEI:
                            target->SetDisplayId(roll_chance_i(50) ? 25033 : 25044);
                            break;
                    }

                    break;
                }
                case 65529:                                 // Gossip NPC Appearance - Day of the Dead (DotD)
                    // random, regardless of current gender
                    target->SetDisplayId(roll_chance_i(50) ? 29203 : 29204);
                    break;
                //case 66236:                               // Incinerate Flesh
                    //break;
                //case 69999:                               // [DND] Swap IDs
                    //break;
                //case 70764:                               // Citizen Costume (note: many spells w/same name)
                    //break;
                //case 71309:                               // [DND] Spawn Portal
                    //break;
                case 71450:                                 // Crown Parcel Service Uniform
                    target->SetDisplayId(target->getGender() == GENDER_MALE ? 31002 : 31003);
                    break;
                //case 75531:                               // Gnomeregan Pride
                    //break;
                //case 75532:                               // Darkspear Pride
                    //break;
                default:
                    sLog.outError("Aura::HandleAuraTransform, spell %u does not have creature entry defined, need custom defined model.", GetId());
                    break;
            }
        }
        else                                                // m_modifier.m_miscvalue != 0
        {
            uint32 model_id;

            CreatureInfo const * ci = ObjectMgr::GetCreatureTemplate(m_modifier.m_miscvalue);
            if (!ci)
            {
                model_id = 16358;                           // pig pink ^_^
                sLog.outError("Auras: unknown creature id = %d (only need its modelid) Form Spell Aura Transform in Spell ID = %d", m_modifier.m_miscvalue, GetId());
            }
            else
                model_id = Creature::ChooseDisplayId(ci);   // Will use the default model here

            // Polymorph (sheep/penguin case)
            if (GetSpellProto()->SpellFamilyName == SPELLFAMILY_MAGE && GetSpellProto()->SpellIconID == 82)
                if (Unit* caster = GetCaster())
                    if (caster->HasAura(52648))             // Glyph of the Penguin
                        model_id = 26452;

            target->SetDisplayId(model_id);

            // creature case, need to update equipment if additional provided
            if (ci && target->GetTypeId() == TYPEID_UNIT)
                ((Creature*)target)->LoadEquipment(ci->equipmentId, false);

            // Dragonmaw Illusion (set mount model also)
            if (GetId()==42016 && target->GetMountID() && !target->GetAurasByType(SPELL_AURA_MOD_FLIGHT_SPEED_MOUNTED).empty())
                target->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID,16314);
        }

        } while (0);

        // update active transform spell only not set or not overwriting negative by positive case
        if (!target->getTransForm() || !IsPositiveSpell(GetId()) || IsPositiveSpell(target->getTransForm()))
            target->setTransForm(GetId());

        // polymorph case
        if (Real && target->GetTypeId() == TYPEID_PLAYER && target->IsPolymorphed())
        {
            // for players, start regeneration after 1s (in polymorph fast regeneration case)
            // only if caster is Player (after patch 2.4.2)
            if (GetCasterGuid().IsPlayer())
                ((Player*)target)->setRegenTimer(1*IN_MILLISECONDS);

            //dismount polymorphed target (after patch 2.4.2)
            if (target->IsMounted())
                target->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED, GetHolder());
        }
    }
    else                                                    // !apply
    {
        // ApplyModifier(true) will reapply it if need
        target->setTransForm(0);
        target->SetDisplayId(target->GetNativeDisplayId());

        // apply default equipment for creature case
        if (target->GetTypeId() == TYPEID_UNIT)
            ((Creature*)target)->LoadEquipment(((Creature*)target)->GetCreatureInfo()->equipmentId, true);

        // re-apply some from still active with preference negative cases
        Unit::AuraList& otherTransforms = target->GetAurasByType(SPELL_AURA_TRANSFORM);
        if (!otherTransforms.empty())
        {
            // look for other transform auras
            Aura* handledAura = (*otherTransforms.begin())();
            for(Unit::AuraList::iterator i = otherTransforms.begin();i != otherTransforms.end(); ++i)
            {
                // negative auras are preferred
                if (!IsPositiveSpell((*i)->GetSpellProto()->Id))
                {
                    handledAura = (*i)();
                    break;
                }
            }
            handledAura->ApplyModifier(true);
        }
        // re-apply shapeshift display if no transform auras remaining
        else if (target->GetShapeshiftForm())
        {
            if (uint32 modelid = target->GetModelForForm())
                target->SetDisplayId(modelid);
        }

        // Dragonmaw Illusion (restore mount model)
        if (GetId() == 42016 && target->GetMountID() == 16314)
        {
            if (!target->GetAurasByType(SPELL_AURA_MOUNTED).empty())
            {
                uint32 cr_id = target->GetAurasByType(SPELL_AURA_MOUNTED).front()->GetModifier()->m_miscvalue;
                if (CreatureInfo const* ci = ObjectMgr::GetCreatureTemplate(cr_id))
                {
                    uint32 display_id = Creature::ChooseDisplayId(ci);
                    CreatureModelInfo const *minfo = sObjectMgr.GetCreatureModelRandomGender(display_id);
                    if (minfo)
                        display_id = minfo->modelid;

                    target->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID, display_id);
                }
            }
        }
    }
}

void Aura::HandleForceReaction(bool apply, bool Real)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    if(!Real)
        return;

    Player* player = (Player*)GetTarget();

    uint32 faction_id = m_modifier.m_miscvalue;
    ReputationRank faction_rank = ReputationRank(m_modifier.m_amount);

    player->GetReputationMgr().ApplyForceReaction(faction_id, faction_rank, apply);
    player->GetReputationMgr().SendForceReactions();

    // stop fighting if at apply forced rank friendly or at remove real rank friendly
    if ((apply && faction_rank >= REP_FRIENDLY) || (!apply && player->GetReputationRank(faction_id) >= REP_FRIENDLY))
        player->StopAttackFaction(faction_id);

    // drop BG flag if player is carrying
    if (SpellEntry const *spellInfo = GetSpellProto())
    {
        switch(spellInfo->Id)
        {
            case 1953:                          // Blink
            case 48020:                         // Demonic Circle
            case 54861:                         // Nitro Boosts
                if (player->InBattleGround() && (player->HasAura(23335) || player->HasAura(23333) || player->HasAura(34976)))
                    if (BattleGround *bg = player->GetBattleGround())
                        bg->EventPlayerDroppedFlag(player);
                break;
            default:
                break;
        }
    }
}

void Aura::HandleAuraModSkill(bool apply, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    uint32 prot=GetSpellProto()->EffectMiscValue[m_effIndex];
    int32 points = GetModifier()->m_amount;

    ((Player*)GetTarget())->ModifySkillBonus(prot, (apply ? points: -points), m_modifier.m_auraname == SPELL_AURA_MOD_SKILL_TALENT);
    if (prot == SKILL_DEFENSE)
        ((Player*)GetTarget())->UpdateDefenseBonusesMod();
}

void Aura::HandleChannelDeathItem(bool apply, bool Real)
{
    if (Real && !apply)
    {
        if (m_removeMode != AURA_REMOVE_BY_DEATH)
            return;
        // Item amount
        if (m_modifier.m_amount <= 0)
            return;

        SpellEntry const *spellInfo = GetSpellProto();
        if (spellInfo->EffectItemType[m_effIndex] == 0)
            return;

        Unit* victim = GetTarget();
        Unit* caster = GetCaster();
        if (!caster || caster->GetTypeId() != TYPEID_PLAYER)
            return;

        // Soul Shard (target req.)
        if (spellInfo->EffectItemType[m_effIndex] == 6265)
        {
            // Only from non-grey units
            if (!((Player*)caster)->isHonorOrXPTarget(victim) ||
                (victim->GetTypeId() == TYPEID_UNIT && !((Player*)caster)->isAllowedToLoot((Creature*)victim)))
                return;
        }

        //Adding items
        uint32 noSpaceForCount = 0;
        uint32 count = m_modifier.m_amount;

        ItemPosCountVec dest;
        InventoryResult msg = ((Player*)caster)->CanStoreNewItem( NULL_BAG, NULL_SLOT, dest, spellInfo->EffectItemType[m_effIndex], count, &noSpaceForCount);
        if ( msg != EQUIP_ERR_OK )
        {
            count-=noSpaceForCount;
            ((Player*)caster)->SendEquipError( msg, NULL, NULL, spellInfo->EffectItemType[m_effIndex] );
            if (count==0)
                return;
        }

        Item* newitem = ((Player*)caster)->StoreNewItem(dest, spellInfo->EffectItemType[m_effIndex], true);
        ((Player*)caster)->SendNewItem(newitem, count, true, true);

        // Soul Shard (glyph bonus)
        if (spellInfo->EffectItemType[m_effIndex] == 6265)
        {
            // Glyph of Soul Shard
            if (caster->HasAura(58070) && roll_chance_i(40))
                caster->CastSpell(caster, 58068, true, NULL, this);
        }
    }
}

void Aura::HandleBindSight(bool apply, bool /*Real*/)
{
    Unit* caster = GetCaster();

    if(!caster || caster->GetTypeId() != TYPEID_PLAYER)
        return;

    if (apply)
        ((Player*)caster)->SetViewPoint(GetTarget());
    else
        ((Player*)caster)->SetViewPoint(NULL);
}

void Aura::HandleFarSight(bool apply, bool /*Real*/)
{
    Unit* caster = GetCaster();
    if(!caster || caster->GetTypeId() != TYPEID_PLAYER)
        return;

    if (apply)
        ((Player*)caster)->SetViewPoint(GetTarget());
    else
        ((Player*)caster)->SetViewPoint(NULL);
}

void Aura::HandleAuraTrackCreatures(bool apply, bool /*Real*/)
{
    if (GetTarget()->GetTypeId()!=TYPEID_PLAYER)
        return;

    if (apply)
        GetTarget()->RemoveNoStackAurasDueToAuraHolder(GetHolder());

    if (apply)
        GetTarget()->SetFlag(PLAYER_TRACK_CREATURES, uint32(1) << (m_modifier.m_miscvalue-1));
    else
        GetTarget()->RemoveFlag(PLAYER_TRACK_CREATURES, uint32(1) << (m_modifier.m_miscvalue-1));
}

void Aura::HandleAuraTrackResources(bool apply, bool /*Real*/)
{
    if (GetTarget()->GetTypeId()!=TYPEID_PLAYER)
        return;

    if (apply)
        GetTarget()->RemoveNoStackAurasDueToAuraHolder(GetHolder());

    if (apply)
        GetTarget()->SetFlag(PLAYER_TRACK_RESOURCES, uint32(1) << (m_modifier.m_miscvalue-1));
    else
        GetTarget()->RemoveFlag(PLAYER_TRACK_RESOURCES, uint32(1) << (m_modifier.m_miscvalue-1));
}

void Aura::HandleAuraTrackStealthed(bool apply, bool /*Real*/)
{
    if (GetTarget()->GetTypeId()!=TYPEID_PLAYER)
        return;

    if (apply)
        GetTarget()->RemoveNoStackAurasDueToAuraHolder(GetHolder());

    GetTarget()->ApplyModByteFlag(PLAYER_FIELD_BYTES, 0, PLAYER_FIELD_BYTE_TRACK_STEALTHED, apply);
}

void Aura::HandleAuraModScale(bool apply, bool /*Real*/)
{
    GetTarget()->ApplyPercentModFloatValue(OBJECT_FIELD_SCALE_X, float(m_modifier.m_amount), apply);
    GetTarget()->UpdateModelData();
}

void Aura::HandleModPossess(bool apply, bool Real)
{
    if(!Real)
        return;

    Unit *target = GetTarget();

    // not possess yourself
    if (GetCasterGuid() == target->GetObjectGuid())
        return;

    Unit* caster = GetCaster();
    if(!caster || caster->GetTypeId() != TYPEID_PLAYER)
        return;

    Player* p_caster = (Player*)caster;

    if (apply)
    {
        target->addUnitState(UNIT_STAT_CONTROLLED);

        target->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED);
        target->SetCharmerGuid(p_caster->GetObjectGuid());
        target->setFaction(p_caster->getFaction());

        // target should became visible at SetView call(if not visible before):
        // otherwise client\p_caster will ignore packets from the target(SetClientControl for example)
        p_caster->SetViewPoint(target);

        p_caster->SetCharm(target);
        p_caster->SetClientControl(target, 1);
        p_caster->SetMover(target);

        target->CombatStop(true);
        target->DeleteThreatList();
        target->getHostileRefManager().deleteReferences();

        if (CharmInfo *charmInfo = target->InitCharmInfo(target))
        {
            charmInfo->SetState(CHARM_STATE_REACT,REACT_PASSIVE);
            charmInfo->SetState(CHARM_STATE_COMMAND,COMMAND_STAY);
            charmInfo->InitPossessCreateSpells();
        }

        p_caster->PossessSpellInitialize();

        if (target->GetTypeId() == TYPEID_UNIT)
        {
            ((Creature*)target)->AIM_Initialize();
        }
        else if (target->GetTypeId() == TYPEID_PLAYER && !target->GetVehicle())
        {
            ((Player*)target)->SetClientControl(target, 0);
        }

    }
    else
    {
        p_caster->SetCharm(NULL);

        p_caster->SetClientControl(target, 0);
        p_caster->SetMover(p_caster);

        // there is a possibility that target became invisible for client\p_caster at ResetView call:
        // it must be called after movement control unapplying, not before! the reason is same as at aura applying
        p_caster->SetViewPoint(NULL);

        p_caster->RemovePetActionBar();

        // on delete only do caster related effects
        if (m_removeMode == AURA_REMOVE_BY_DELETE)
            return;

        target->clearUnitState(UNIT_STAT_CONTROLLED);

        target->CombatStop(true);
        target->DeleteThreatList();
        target->getHostileRefManager().deleteReferences();

        target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED);

        target->SetCharmerGuid(ObjectGuid());

        if (target->GetTypeId() == TYPEID_PLAYER && !target->GetVehicle())
        {
            ((Player*)target)->setFactionForRace(target->getRace());
            ((Player*)target)->SetClientControl(target, 1);
        }
        else if (target->GetTypeId() == TYPEID_UNIT)
        {
            CreatureInfo const *cinfo = ((Creature*)target)->GetCreatureInfo();
            target->setFaction(cinfo->faction_A);
        }

        if (target->GetTypeId() == TYPEID_UNIT)
        {
            ((Creature*)target)->AIM_Initialize();
            target->AttackedBy(caster);
        }
    }
}

void Aura::HandleModPossessPet(bool apply, bool Real)
{
    if(!Real)
        return;

    Unit* caster = GetCaster();
    if (!caster || caster->GetTypeId() != TYPEID_PLAYER)
        return;

    Unit* target = GetTarget();
    if (target->GetTypeId() != TYPEID_UNIT || !((Creature*)target)->IsPet())
        return;

    Pet* pet = (Pet*)target;
    Player* p_caster = (Player*)caster;

    if (apply)
    {
        pet->addUnitState(UNIT_STAT_CONTROLLED);

        // target should became visible at SetView call(if not visible before):
        // otherwise client\p_caster will ignore packets from the target(SetClientControl for example)
        p_caster->SetViewPoint(pet);

        p_caster->SetCharm(pet);
        p_caster->SetClientControl(pet, 1);
        p_caster->SetMover(pet);

        pet->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED);

        pet->StopMoving();
        pet->GetMotionMaster()->MoveIdle();
    }
    else
    {
        p_caster->SetCharm(NULL);
        p_caster->SetClientControl(pet, 0);
        p_caster->SetMover(p_caster);

        // there is a possibility that target became invisible for client\p_caster at ResetView call:
        // it must be called after movement control unapplying, not before! the reason is same as at aura applying
        p_caster->SetViewPoint(NULL);

        // on delete only do caster related effects
        if (m_removeMode == AURA_REMOVE_BY_DELETE)
            return;

        pet->clearUnitState(UNIT_STAT_CONTROLLED);

        pet->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PLAYER_CONTROLLED);

        pet->AttackStop();

        // out of range pet dismissed
        if (!pet->IsWithinDistInMap(p_caster, pet->GetMap()->GetVisibilityDistance()))
        {
            p_caster->RemovePet(PET_SAVE_REAGENTS);
        }
        else
        {
            pet->GetMotionMaster()->MoveTargetedHome();
        }
    }
}

void Aura::HandleAuraModPetTalentsPoints(bool /*Apply*/, bool Real)
{
    if(!Real)
        return;

    // Recalculate pet talent points
    if (Pet *pet=GetTarget()->GetPet())
        pet->InitTalentForLevel();
}

void Aura::HandleModCharm(bool apply, bool Real)
{
    if(!Real)
        return;

    Unit *target = GetTarget();

    // not charm yourself
    if (GetCasterGuid() == target->GetObjectGuid())
        return;

    Unit* caster = GetCaster();
    if(!caster)
        return;

    if ( apply )
    {
        // is it really need after spell check checks?
        target->RemoveSpellsCausingAura(SPELL_AURA_MOD_CHARM, GetHolder());
        target->RemoveSpellsCausingAura(SPELL_AURA_MOD_POSSESS, GetHolder());

        target->SetCharmerGuid(GetCasterGuid());
        target->setFaction(caster->getFaction());
        target->CastStop(target == caster ? GetId() : 0);
        caster->SetCharm(target);

        target->CombatStop(true);
        target->DeleteThreatList();
        target->getHostileRefManager().deleteReferences();

        if (target->GetTypeId() == TYPEID_UNIT)
        {
            ((Creature*)target)->AIM_Initialize();
            CharmInfo *charmInfo = target->InitCharmInfo(target);
            charmInfo->SetState(CHARM_STATE_REACT,REACT_DEFENSIVE);
            charmInfo->InitCharmCreateSpells();

            if (caster->GetTypeId() == TYPEID_PLAYER && caster->getClass() == CLASS_WARLOCK)
            {
                CreatureInfo const *cinfo = ((Creature*)target)->GetCreatureInfo();
                if (cinfo && cinfo->type == CREATURE_TYPE_DEMON)
                {
                    // creature with pet number expected have class set
                    if (target->GetByteValue(UNIT_FIELD_BYTES_0, 1)==0)
                    {
                        if (cinfo->unit_class==0)
                            sLog.outErrorDb("Creature (Entry: %u) have unit_class = 0 but used in charmed spell, that will be result client crash.",cinfo->Entry);
                        else
                            sLog.outError("Creature (Entry: %u) have unit_class = %u but at charming have class 0!!! that will be result client crash.",cinfo->Entry,cinfo->unit_class);

                        target->SetByteValue(UNIT_FIELD_BYTES_0, 1, CLASS_MAGE);
                    }

                    //just to enable stat window
                    charmInfo->SetPetNumber(sObjectMgr.GeneratePetNumber(), true);
                    //if charmed two demons the same session, the 2nd gets the 1st one's name
                    target->SetUInt32Value(UNIT_FIELD_PET_NAME_TIMESTAMP, uint32(time(NULL)));
                }
            }
        }

        if (caster->GetTypeId() == TYPEID_PLAYER)
            ((Player*)caster)->CharmSpellInitialize();
    }
    else
    {
        target->SetCharmerGuid(ObjectGuid());

        if (target->GetTypeId() == TYPEID_PLAYER)
            ((Player*)target)->setFactionForRace(target->getRace());
        else
        {
            CreatureInfo const *cinfo = ((Creature*)target)->GetCreatureInfo();

            // restore faction
            if(((Creature*)target)->IsPet())
            {
                if (Unit* owner = ((Pet*)target)->GetOwner())
                    target->setFaction(owner->getFaction());
                else if (cinfo)
                    target->setFaction(cinfo->faction_A);
            }
            else if (cinfo)                              // normal creature
                target->setFaction(cinfo->faction_A);

            // restore UNIT_FIELD_BYTES_0
            if (cinfo && caster->GetTypeId() == TYPEID_PLAYER && caster->getClass() == CLASS_WARLOCK && cinfo->type == CREATURE_TYPE_DEMON)
            {
                // DB must have proper class set in field at loading, not req. restore, including workaround case at apply
                // m_target->SetByteValue(UNIT_FIELD_BYTES_0, 1, cinfo->unit_class);

                if (target->GetCharmInfo())
                    target->GetCharmInfo()->SetPetNumber(0, true);
                else
                    sLog.outError("Aura::HandleModCharm: target (GUID: %u TypeId: %u) has a charm aura but no charm info!", target->GetGUIDLow(), target->GetTypeId());
            }
        }

        caster->SetCharm(NULL);

        if (caster->GetTypeId() == TYPEID_PLAYER)
            ((Player*)caster)->RemovePetActionBar();

        target->CombatStop(true);
        target->DeleteThreatList();
        target->getHostileRefManager().deleteReferences();

        if (target->GetTypeId() == TYPEID_UNIT)
        {
            ((Creature*)target)->AIM_Initialize();
            target->AttackedBy(caster);
        }
    }
}

void Aura::HandleModConfuse(bool apply, bool Real)
{
    if(!Real)
        return;

    if(!apply && GetTarget()->HasAuraType(GetModifier()->m_auraname))
        return;

    GetTarget()->SetConfused(apply, GetCasterGuid(), GetId());
}

void Aura::HandleModFear(bool apply, bool Real)
{
    if (!Real)
        return;

    if(!apply && GetTarget()->HasAuraType(GetModifier()->m_auraname))
        return;

    GetTarget()->SetFeared(apply, GetCasterGuid(), GetId());
}

void Aura::HandleFeignDeath(bool apply, bool Real)
{
    if(!Real)
        return;

    if(!apply && GetTarget()->HasAuraType(GetModifier()->m_auraname))
        return;

    GetTarget()->SetFeignDeath(apply, GetCasterGuid(), GetId());
}

void Aura::HandleAuraModDisarm(bool apply, bool Real)
{
    if(!Real)
        return;

    Unit *target = GetTarget();

    if(!apply && target->HasAuraType(GetModifier()->m_auraname))
        return;

    uint32 flags;
    uint32 field;
    WeaponAttackType attack_type;

    switch (GetModifier()->m_auraname)
    {
        default:
        case SPELL_AURA_MOD_DISARM:
        {
            field = UNIT_FIELD_FLAGS;
            flags = UNIT_FLAG_DISARMED;
            attack_type = BASE_ATTACK;
            break;
        }
        case SPELL_AURA_MOD_DISARM_OFFHAND:
        {
            field = UNIT_FIELD_FLAGS_2;
            flags = UNIT_FLAG2_DISARM_OFFHAND;
            attack_type = OFF_ATTACK;
            break;
        }
        case SPELL_AURA_MOD_DISARM_RANGED:
        {
            field = UNIT_FIELD_FLAGS_2;
            flags = UNIT_FLAG2_DISARM_RANGED;
            attack_type = RANGED_ATTACK;
            break;
        }
    }

    target->ApplyModFlag(field, flags, apply);

    if (target->GetTypeId() != TYPEID_PLAYER)
        return;

    // main-hand attack speed already set to special value for feral form already and don't must change and reset at remove.
    if (target->IsInFeralForm())
        return;

    if (apply)
    {
        target->SetAttackTime(BASE_ATTACK,BASE_ATTACK_TIME);
    }
    else
        ((Player *)target)->SetRegularAttackTime();

    target->UpdateDamagePhysical(attack_type);
}

void Aura::HandleAuraModStun(bool apply, bool Real)
{
    if(!Real)
        return;

    Unit *target = GetTarget();

    if (apply)
    {
        // Frost stun aura -> freeze/unfreeze target
        if (GetSpellSchoolMask(GetSpellProto()) & SPELL_SCHOOL_MASK_FROST)
            target->ModifyAuraState(AURA_STATE_FROZEN, apply);

        target->CastStop(target->GetObjectGuid() == GetCasterGuid() ? GetId() : 0);
        target->GetUnitStateMgr().PushAction(UNIT_ACTION_STUN);

        // Deep Freeze damage part
        if (GetId() == 44572 && !(target->IsCharmerOrOwnerPlayerOrPlayerItself() || target->IsVehicle()) && target->IsImmuneToSpellEffect(GetSpellProto(), EFFECT_INDEX_0))
        {
            Unit* caster = GetCaster();
            if(!caster)
                return;
            caster->CastSpell(target, 71757, true);
        }

        // Summon the Naj'entus Spine GameObject on target if spell is Impaling Spine
        switch(GetId())
        {
            case 39837: // Impaling Spine
            {
                GameObject* pObj = new GameObject;
                if (pObj->Create(target->GetMap()->GenerateLocalLowGuid(HIGHGUID_GAMEOBJECT), 185584, target->GetMap(), target->GetPhaseMask(),
                    target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), target->GetOrientation()))
                {
                    pObj->SetRespawnTime(GetAuraDuration()/IN_MILLISECONDS);
                    pObj->SetSpellId(GetId());
                    target->AddGameObject(pObj);
                    target->GetMap()->Add(pObj);
                }
                else
                    delete pObj;

                break;
            }
            case 6358: // Seduction
            {
                if (Unit* caster = GetCaster())
                {
                    if (apply)
                    {
                        if (caster->GetOwner() && caster->GetOwner()->HasAura(56250)) // Glyph of Seduction
                        {
                            target->RemoveSpellsCausingAura(SPELL_AURA_PERIODIC_DAMAGE);
                            target->RemoveSpellsCausingAura(SPELL_AURA_PERIODIC_DAMAGE_PERCENT);
                        }
                    }
                    else
                        caster->InterruptSpell(CURRENT_CHANNELED_SPELL, false);
                }
                break;
            }
        }
    }
    else
    {
        // Frost stun aura -> freeze/unfreeze target
        if (GetSpellSchoolMask(GetSpellProto()) & SPELL_SCHOOL_MASK_FROST)
        {
            bool found_another = false;
            for(AuraType const* itr = &frozenAuraTypes[0]; *itr != SPELL_AURA_NONE; ++itr)
            {
                Unit::AuraList const& auras = target->GetAurasByType(*itr);
                for(Unit::AuraList::const_iterator i = auras.begin(); i != auras.end(); ++i)
                {
                    if ( GetSpellSchoolMask((*i)->GetSpellProto()) & SPELL_SCHOOL_MASK_FROST)
                    {
                        found_another = true;
                        break;
                    }
                }
                if (found_another)
                    break;
            }

            if(!found_another)
                target->ModifyAuraState(AURA_STATE_FROZEN, apply);
        }

        // Real remove called after current aura remove from lists, check if other similar auras active
        if (target->HasAuraType(SPELL_AURA_MOD_STUN))
            return;

        target->GetUnitStateMgr().DropAction(UNIT_ACTION_STUN);

        if(!target->hasUnitState(UNIT_STAT_ROOT | UNIT_STAT_ON_VEHICLE))       // prevent allow move if have also root effect
        {
            if (target->getVictim() && target->isAlive())
                target->SetTargetGuid(target->getVictim()->GetObjectGuid());

            target->SetRoot(false);
        }

        // Wyvern Sting
        if (GetSpellProto()->SpellFamilyName == SPELLFAMILY_HUNTER && GetSpellProto()->GetSpellFamilyFlags().test<CF_HUNTER_WYVERN_STING2>())
        {
            Unit* caster = GetCaster();
            if ( !caster || caster->GetTypeId()!=TYPEID_PLAYER )
                return;

            uint32 spell_id = 0;

            switch(GetId())
            {
                case 19386: spell_id = 24131; break;
                case 24132: spell_id = 24134; break;
                case 24133: spell_id = 24135; break;
                case 27068: spell_id = 27069; break;
                case 49011: spell_id = 49009; break;
                case 49012: spell_id = 49010; break;
                default:
                    sLog.outError("Spell selection called for unexpected original spell %u, new spell for this spell family?",GetId());
                    return;
            }

            SpellEntry const* spellInfo = sSpellStore.LookupEntry(spell_id);

            if(!spellInfo)
                return;

            caster->CastSpell(target,spellInfo,true,NULL,this);
            return;
        }
    }
}

void Aura::HandleModStealth(bool apply, bool Real)
{
    Unit *target = GetTarget();

    if (apply)
    {
        // drop flag at stealth in bg
        target->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_IMMUNE_OR_LOST_SELECTION);

        // only at real aura add
        if (Real)
        {
            target->SetStandFlags(UNIT_STAND_FLAGS_CREEP);

            if (target->GetTypeId()==TYPEID_PLAYER)
                target->SetByteFlag(PLAYER_FIELD_BYTES2, 3, PLAYER_FIELD_BYTE2_STEALTH);

            // apply only if not in GM invisibility (and overwrite invisibility state)
            if (target->GetVisibility()!=VISIBILITY_OFF)
            {
                target->SetVisibility(VISIBILITY_GROUP_NO_DETECT);
                target->SetVisibility(VISIBILITY_GROUP_STEALTH);
            }

            // apply full stealth period bonuses only at first stealth aura in stack
            if (target->GetAurasByType(SPELL_AURA_MOD_STEALTH).size()<=2) // Vanish also triggering Stealth, but all ok, no double auras here possible
            {
                Unit::AuraList const& mDummyAuras = target->GetAurasByType(SPELL_AURA_DUMMY);
                for(Unit::AuraList::const_iterator i = mDummyAuras.begin();i != mDummyAuras.end(); ++i)
                {
                    // Master of Subtlety
                    if ((*i)->GetSpellProto()->SpellIconID == 2114 && GetSpellProto()->SpellFamilyName == SPELLFAMILY_ROGUE)
                    {
                        target->RemoveAurasDueToSpell(31666);
                        int32 bp = (*i)->GetModifier()->m_amount;
                        target->CastCustomSpell(target,31665,&bp,NULL,NULL,true);
                    }
                    // Overkill
                    else if ((*i)->GetId() == 58426 && GetSpellProto()->GetSpellFamilyFlags().test<CF_ROGUE_STEALTH>())
                    {
                        target->CastSpell(target, 58427, true);
                    }
                }
            }
        }
    }
    else
    {
        // only at real aura remove of _last_ SPELL_AURA_MOD_STEALTH
        if (Real && !target->HasAuraType(SPELL_AURA_MOD_STEALTH))
        {
            // if no GM invisibility
            if (target->GetVisibility()!=VISIBILITY_OFF)
            {
                target->RemoveStandFlags(UNIT_STAND_FLAGS_CREEP);

                if (target->GetTypeId()==TYPEID_PLAYER)
                    target->RemoveByteFlag(PLAYER_FIELD_BYTES2, 3, PLAYER_FIELD_BYTE2_STEALTH);

                // restore invisibility if any
                if (target->HasAuraType(SPELL_AURA_MOD_INVISIBILITY))
                {
                    target->SetVisibility(VISIBILITY_GROUP_NO_DETECT);
                    target->SetVisibility(VISIBILITY_GROUP_INVISIBILITY);
                }
                else
                    target->SetVisibility(VISIBILITY_ON);
            }

            // apply delayed talent bonus remover at last stealth aura remove
            Unit::AuraList const& mDummyAuras = target->GetAurasByType(SPELL_AURA_DUMMY);
            for(Unit::AuraList::const_iterator i = mDummyAuras.begin();i != mDummyAuras.end(); ++i)
            {
                // Master of Subtlety
                if ((*i)->GetSpellProto()->SpellIconID == 2114)
                    target->CastSpell(target, 31666, true);
                // Overkill
                else if ((*i)->GetId() == 58426)//Overkill we should remove anyway
                {
                    if (SpellAuraHolderPtr holder = target->GetSpellAuraHolder(58427))
                    {
                        holder->SetAuraMaxDuration(20*IN_MILLISECONDS);
                        holder->RefreshHolder();
                    }
                }
            }
        }
    }
}

void Aura::HandleInvisibility(bool apply, bool Real)
{
    Unit *target = GetTarget();

    if (apply)
    {
        target->m_invisibilityMask |= (1 << m_modifier.m_miscvalue);

        target->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_IMMUNE_OR_LOST_SELECTION);

        if (Real && target->GetTypeId()==TYPEID_PLAYER)
        {
            // apply glow vision
            target->SetByteFlag(PLAYER_FIELD_BYTES2, 3, PLAYER_FIELD_BYTE2_INVISIBILITY_GLOW);

        }

        // apply only if not in GM invisibility and not stealth
        if (target->GetVisibility() == VISIBILITY_ON)
        {
            // Aura not added yet but visibility code expect temporary add aura
            target->SetVisibility(VISIBILITY_GROUP_NO_DETECT);
            target->SetVisibility(VISIBILITY_GROUP_INVISIBILITY);
        }
    }
    else
    {
        // recalculate value at modifier remove (current aura already removed)
        target->m_invisibilityMask = 0;
        Unit::AuraList const& auras = target->GetAurasByType(SPELL_AURA_MOD_INVISIBILITY);
        for(Unit::AuraList::const_iterator itr = auras.begin(); itr != auras.end(); ++itr)
            target->m_invisibilityMask |= (1 << (*itr)->GetModifier()->m_miscvalue);

        // only at real aura remove and if not have different invisibility auras.
        if (Real && target->m_invisibilityMask == 0)
        {
            // remove glow vision
            if (target->GetTypeId() == TYPEID_PLAYER)
                target->RemoveByteFlag(PLAYER_FIELD_BYTES2, 3, PLAYER_FIELD_BYTE2_INVISIBILITY_GLOW);

            // apply only if not in GM invisibility & not stealthed while invisible
            if (target->GetVisibility() != VISIBILITY_OFF)
            {
                // if have stealth aura then already have stealth visibility
                if (!target->HasAuraType(SPELL_AURA_MOD_STEALTH))
                    target->SetVisibility(VISIBILITY_ON);
            }
        }

        if (GetId() == 48809)                               // Binding Life
            target->CastSpell(target, GetSpellProto()->CalculateSimpleValue(m_effIndex), true);
    }
}

void Aura::HandleInvisibilityDetect(bool apply, bool Real)
{
    Unit *target = GetTarget();

    if (apply)
    {
        target->m_detectInvisibilityMask |= (1 << m_modifier.m_miscvalue);
    }
    else
    {
        // recalculate value at modifier remove (current aura already removed)
        target->m_detectInvisibilityMask = 0;
        Unit::AuraList const& auras = target->GetAurasByType(SPELL_AURA_MOD_INVISIBILITY_DETECTION);
        for(Unit::AuraList::const_iterator itr = auras.begin(); itr != auras.end(); ++itr)
            target->m_detectInvisibilityMask |= (1 << (*itr)->GetModifier()->m_miscvalue);
    }
    if (Real && target->GetTypeId()==TYPEID_PLAYER)
        ((Player*)target)->GetCamera()->UpdateVisibilityForOwner();
}

void Aura::HandleDetectAmore(bool apply, bool /*real*/)
{
    GetTarget()->ApplyModByteFlag(PLAYER_FIELD_BYTES2, 3, (PLAYER_FIELD_BYTE2_DETECT_AMORE_0 << m_modifier.m_amount), apply);
}

void Aura::HandleAuraModRoot(bool apply, bool Real)
{
    // only at real add/remove aura
    if(!Real)
        return;

    Unit *target = GetTarget();

    if (apply)
    {
        // Frost root aura -> freeze/unfreeze target
        if (GetSpellSchoolMask(GetSpellProto()) & SPELL_SCHOOL_MASK_FROST)
            target->ModifyAuraState(AURA_STATE_FROZEN, apply);

        target->GetUnitStateMgr().PushAction(UNIT_ACTION_ROOT);

    }
    else
    {
        // Frost root aura -> freeze/unfreeze target
        if (GetSpellSchoolMask(GetSpellProto()) & SPELL_SCHOOL_MASK_FROST)
        {
            bool found_another = false;
            for(AuraType const* itr = &frozenAuraTypes[0]; *itr != SPELL_AURA_NONE; ++itr)
            {
                Unit::AuraList const& auras = target->GetAurasByType(*itr);
                for(Unit::AuraList::const_iterator i = auras.begin(); i != auras.end(); ++i)
                {
                    if ( GetSpellSchoolMask((*i)->GetSpellProto()) & SPELL_SCHOOL_MASK_FROST)
                    {
                        found_another = true;
                        break;
                    }
                }
                if (found_another)
                    break;
            }

            if(!found_another)
                target->ModifyAuraState(AURA_STATE_FROZEN, apply);
        }

        // Real remove called after current aura remove from lists, check if other similar auras active
        if (target->HasAuraType(SPELL_AURA_MOD_ROOT))
            return;

        target->GetUnitStateMgr().DropAction(UNIT_ACTION_ROOT);

        if (GetSpellProto()->Id == 70980)                   // Web Wrap (Icecrown Citadel, trash mob Nerub'ar Broodkeeper)
            target->CastSpell(target, 71010, true);
    }
}

void Aura::HandleAuraModSilence(bool apply, bool Real)
{
    // only at real add/remove aura
    if(!Real)
        return;

    Unit *target = GetTarget();

    if (apply)
    {
        target->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SILENCED);
        // Stop cast only spells vs PreventionType == SPELL_PREVENTION_TYPE_SILENCE
        for (uint32 i = CURRENT_MELEE_SPELL; i < CURRENT_MAX_SPELL; ++i)
            if (Spell* spell = target->GetCurrentSpell(CurrentSpellTypes(i)))
                if (spell->m_spellInfo->PreventionType == SPELL_PREVENTION_TYPE_SILENCE)
                    // Stop spells on prepare or casting state
                    target->InterruptSpell(CurrentSpellTypes(i), false);
    }
    else
    {
        // Real remove called after current aura remove from lists, check if other similar auras active
        if (!target->HasAuraType(SPELL_AURA_MOD_SILENCE) &&
            !target->HasAuraType(SPELL_AURA_MOD_PACIFY_SILENCE))
            target->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_SILENCED);
    }
}

void Aura::HandleModThreat(bool apply, bool Real)
{
    // only at real add/remove aura
    if (!Real)
        return;

    Unit *target = GetTarget();

    if (!target->isAlive())
        return;

    int level_diff = 0;
    int multiplier = 0;
    switch (GetId())
    {
        // Arcane Shroud
        case 26400:
            level_diff = target->getLevel() - 60;
            multiplier = 2;
            break;
        // The Eye of Diminution
        case 28862:
            level_diff = target->getLevel() - 60;
            multiplier = 1;
            break;
    }

    if (level_diff > 0)
        m_modifier.m_amount += multiplier * level_diff;

    if (target->GetTypeId() == TYPEID_PLAYER)
        for(int8 x=0;x < MAX_SPELL_SCHOOL;x++)
            if (m_modifier.m_miscvalue & int32(1<<x))
                ApplyPercentModFloatVar(target->m_threatModifier[x], float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraModTotalThreat(bool apply, bool Real)
{
    // only at real add/remove aura
    if (!Real)
        return;

    Unit *target = GetTarget();

    if (!target->isAlive() || target->GetTypeId() != TYPEID_PLAYER)
        return;

    Unit* caster = GetCaster();

    if (!caster || !caster->isAlive())
        return;

    float threatMod = apply ? float(m_modifier.m_amount) : float(-m_modifier.m_amount);

    target->getHostileRefManager().threatAssist(caster, threatMod, GetSpellProto());
}

void Aura::HandleModTaunt(bool apply, bool Real)
{
    // only at real add/remove aura
    if (!Real)
        return;

    Unit* target = GetTarget();

    if (!target || !target->isAlive() || target->GetTypeId() == TYPEID_PLAYER)
        return;

    Unit* caster = GetCaster();

    if (!caster || !caster->isAlive())
        return;

    if (apply)
        target->TauntApply(caster, false);
    else
    {
        // When taunt aura fades out, mob will switch to previous target if current has less than 1.1 * secondthreat
        target->TauntFadeOut(caster);
    }
}

void Aura::HandleAuraFakeInebriation(bool apply, bool Real)
{
    // all applied/removed only at real aura add/remove
    if (!Real)
        return;

    Unit* target = GetTarget();

    if (target->GetTypeId() == TYPEID_PLAYER)
    {
        int32 point = target->GetInt32Value(PLAYER_FAKE_INEBRIATION);
        point += (apply ? 1 : -1) * GetBasePoints();

        target->SetInt32Value(PLAYER_FAKE_INEBRIATION, point);
    }

    target->UpdateObjectVisibility();
}

/*********************************************************/
/***                  MODIFY SPEED                     ***/
/*********************************************************/
void Aura::HandleAuraModIncreaseSpeed(bool apply, bool Real)
{
    // all applied/removed only at real aura add/remove
    if(!Real)
        return;

    Unit *target = GetTarget();

    GetTarget()->UpdateSpeed(MOVE_RUN, true);

    if (apply && GetSpellProto()->Id == 58875)
        target->CastSpell(target, 58876, true);
}

void Aura::HandleAuraModIncreaseMountedSpeed(bool apply, bool Real)
{
    // all applied/removed only at real aura add/remove
    if(!Real)
        return;

    Unit *target = GetTarget();

    target->UpdateSpeed(MOVE_RUN, true);

    // Festive Holiday Mount
    if (apply && GetSpellProto()->SpellIconID != 1794 && target->HasAura(62061))
        // Reindeer Transformation
        target->CastSpell(target, 25860, true, NULL, this);
}

void Aura::HandleAuraModIncreaseFlightSpeed(bool apply, bool Real)
{
    // all applied/removed only at real aura add/remove
    if(!Real)
        return;

    Unit *target = GetTarget();

    // Enable Fly mode for flying mounts
    if (m_modifier.m_auraname == SPELL_AURA_MOD_FLIGHT_SPEED_MOUNTED)
    {
        WorldPacket data;
        if (apply)
            data.Initialize(SMSG_MOVE_SET_CAN_FLY, 12);
        else
            data.Initialize(SMSG_MOVE_UNSET_CAN_FLY, 12);

        data << target->GetPackGUID();
        data << uint32(0);                                      // unknown
        target->SendMessageToSet(&data, true);

        //Players on flying mounts must be immune to polymorph
        if (target->GetTypeId()==TYPEID_PLAYER)
            target->ApplySpellImmune(GetId(),IMMUNITY_MECHANIC,MECHANIC_POLYMORPH,apply);

        // Dragonmaw Illusion (overwrite mount model, mounted aura already applied)
        if (apply && target->HasAura(42016, EFFECT_INDEX_0) && target->GetMountID())
            target->SetUInt32Value(UNIT_FIELD_MOUNTDISPLAYID,16314);

        // Festive Holiday Mount
        if (apply && GetSpellProto()->SpellIconID != 1794 && target->HasAura(62061))
            // Reindeer Transformation
            target->CastSpell(target, 25860, true, NULL, this);
    }

    // Swift Flight Form check for higher speed flying mounts
    if (apply && target->GetTypeId() == TYPEID_PLAYER && GetSpellProto()->Id == 40121)
    {
        for (PlayerSpellMap::const_iterator iter = ((Player*)target)->GetSpellMap().begin(); iter != ((Player*)target)->GetSpellMap().end(); ++iter)
        {
            if (iter->second.state != PLAYERSPELL_REMOVED)
            {
                bool changedSpeed = false;
                SpellEntry const *spellInfo = sSpellStore.LookupEntry(iter->first);
                for(int i = 0; i < MAX_EFFECT_INDEX; ++i)
                {
                    if (spellInfo->EffectApplyAuraName[i] == SPELL_AURA_MOD_FLIGHT_SPEED_MOUNTED)
                    {
                        int32 mountSpeed = spellInfo->CalculateSimpleValue(SpellEffectIndex(i));
                        if (mountSpeed > m_modifier.m_amount)
                        {
                            m_modifier.m_amount = mountSpeed;
                            changedSpeed = true;
                            break;
                        }
                    }
                }
                if (changedSpeed)
                    break;
            }
        }
    }

    target->UpdateSpeed(MOVE_FLIGHT, true);
}

void Aura::HandleAuraModIncreaseSwimSpeed(bool /*apply*/, bool Real)
{
    // all applied/removed only at real aura add/remove
    if(!Real)
        return;

    GetTarget()->UpdateSpeed(MOVE_SWIM, true);
}

void Aura::HandleAuraModDecreaseSpeed(bool apply, bool Real)
{
    // all applied/removed only at real aura add/remove
    if(!Real)
        return;

    Unit* target = GetTarget();

    if (apply)
    {
        // Gronn Lord's Grasp, becomes stoned
        if (GetId() == 33572)
        {
            if (GetStackAmount() >= 5 && !target->HasAura(33652))
                target->CastSpell(target, 33652, true);
        }
    }

    target->UpdateSpeed(MOVE_RUN, true);
    target->UpdateSpeed(MOVE_SWIM, true);
    target->UpdateSpeed(MOVE_FLIGHT, true);
}

void Aura::HandleAuraModUseNormalSpeed(bool /*apply*/, bool Real)
{
    // all applied/removed only at real aura add/remove
    if(!Real)
        return;

    Unit *target = GetTarget();

    target->UpdateSpeed(MOVE_RUN, true);
    target->UpdateSpeed(MOVE_SWIM, true);
    target->UpdateSpeed(MOVE_FLIGHT, true);
}

/*********************************************************/
/***                     IMMUNITY                      ***/
/*********************************************************/

void Aura::HandleModMechanicImmunity(bool apply, bool /*Real*/)
{
    uint32 misc  = m_modifier.m_miscvalue;

    Unit *target = GetTarget();

    if (apply && GetSpellProto()->HasAttribute(SPELL_ATTR_EX_DISPEL_AURAS_ON_IMMUNITY))
    {
        uint32 mechanic = 1 << (misc-1);

        // immune movement impairment and loss of control (spell data have special structure for mark this case)
        if (IsSpellRemoveAllMovementAndControlLossEffects(GetSpellProto()))
            mechanic=IMMUNE_TO_MOVEMENT_IMPAIRMENT_AND_LOSS_CONTROL_MASK;

        target->RemoveAurasAtMechanicImmunity(mechanic, GetId());
    }

    target->ApplySpellImmune(GetId(),IMMUNITY_MECHANIC,misc,apply);

    // Demonic Circle
    if (GetSpellProto()->SpellFamilyName == SPELLFAMILY_WARLOCK && GetSpellProto()->SpellIconID == 3221)
    {
        if (target->GetTypeId() != TYPEID_PLAYER)
            return;

        if (apply)
            if (GameObject* obj = target->GetGameObject(48018))
                ((Player*)target)->TeleportTo(obj->GetMapId(),obj->GetPositionX(),obj->GetPositionY(),obj->GetPositionZ(),obj->GetOrientation(), TELE_TO_NOT_LEAVE_COMBAT);
    }

    // Bestial Wrath
    if (GetSpellProto()->SpellFamilyName == SPELLFAMILY_HUNTER && GetSpellProto()->SpellIconID == 1680)
    {
        // The Beast Within cast on owner if talent present
        if (Unit* owner = target->GetOwner())
        {
            // Search talent The Beast Within
            Unit::AuraList const& dummyAuras = owner->GetAurasByType(SPELL_AURA_MOD_DAMAGE_PERCENT_DONE);
            for(Unit::AuraList::const_iterator i = dummyAuras.begin(); i != dummyAuras.end(); ++i)
            {
                if ((*i)->GetSpellProto()->SpellIconID == 2229)
                {
                    if (apply)
                        owner->CastSpell(owner, 34471, true, NULL, this);
                    else
                        owner->RemoveAurasDueToSpell(34471);
                    break;
                }
            }
        }
    }
    // Heroic Fury (Intercept cooldown remove)
    else if (apply && GetSpellProto()->Id == 60970)
        target->RemoveSpellCooldown(20252, true);
}

void Aura::HandleModMechanicImmunityMask(bool apply, bool /*Real*/)
{
    uint32 mechanic  = m_modifier.m_miscvalue;

    if (apply && GetSpellProto()->HasAttribute(SPELL_ATTR_EX_DISPEL_AURAS_ON_IMMUNITY))
        GetTarget()->RemoveAurasAtMechanicImmunity(mechanic,GetId());

    // check implemented in Unit::IsImmuneToSpell and Unit::IsImmuneToSpellEffect
}

//this method is called whenever we add / remove aura which gives m_target some imunity to some spell effect
void Aura::HandleAuraModEffectImmunity(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();

    // when removing flag aura, handle flag drop
    if ( !apply && target->GetTypeId() == TYPEID_PLAYER
        && (GetSpellProto()->AuraInterruptFlags & AURA_INTERRUPT_FLAG_IMMUNE_OR_LOST_SELECTION) )
    {
        Player* player = (Player*)target;
        if (BattleGround* bg = player->GetBattleGround())
            bg->EventPlayerDroppedFlag(player);
        else if (OutdoorPvP* outdoorPvP = sOutdoorPvPMgr.GetScript(player->GetCachedZoneId()))
            outdoorPvP->HandleDropFlag(player, GetSpellProto()->Id);
        else if (InstanceData* mapInstance = player->GetInstanceData())
            mapInstance->OnPlayerDroppedFlag(player, GetId());
    }

    target->ApplySpellImmune(GetId(), IMMUNITY_EFFECT, m_modifier.m_miscvalue, apply);
}

void Aura::HandleAuraModStateImmunity(bool apply, bool Real)
{
    if (apply && Real && GetSpellProto()->HasAttribute(SPELL_ATTR_EX_DISPEL_AURAS_ON_IMMUNITY))
    {
        Unit::SpellIdSet toRemoveSpellList;
        Unit::AuraList const& auraList = GetTarget()->GetAurasByType(AuraType(m_modifier.m_miscvalue));
        for (Unit::AuraList::const_iterator itr = auraList.begin(); itr != auraList.end(); ++itr)
        {
            if (itr->IsEmpty() || (*itr)() == this)                   // skip itself aura (it already added)
                continue;
            toRemoveSpellList.insert(auraList.front()->GetId());
        }

        for (Unit::SpellIdSet::const_iterator i = toRemoveSpellList.begin(); i != toRemoveSpellList.end(); ++i)
            GetTarget()->RemoveAurasDueToSpell(*i);
    }

    GetTarget()->ApplySpellImmune(GetId(), IMMUNITY_STATE, m_modifier.m_miscvalue, apply);
}

void Aura::HandleAuraModSchoolImmunity(bool apply, bool Real)
{
    Unit* target = GetTarget();
    target->ApplySpellImmune(GetId(), IMMUNITY_SCHOOL, m_modifier.m_miscvalue, apply);

    // remove all flag auras (they are positive, but they must be removed when you are immune)
    if (GetSpellProto()->HasAttribute(SPELL_ATTR_EX_DISPEL_AURAS_ON_IMMUNITY)
        && GetSpellProto()->HasAttribute(SPELL_ATTR_EX2_DAMAGE_REDUCED_SHIELD))
        target->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_IMMUNE_OR_LOST_SELECTION);

    // TODO: optimalize this cycle - use RemoveAurasWithInterruptFlags call or something else
    if (Real && apply &&
        GetSpellProto()->HasAttribute(SPELL_ATTR_EX_DISPEL_AURAS_ON_IMMUNITY) &&
        IsPositiveSpell(GetId()))                       //Only positive immunity removes auras
    {
        std::set<uint32> toRemoveSpellList;
        uint32 school_mask = m_modifier.m_miscvalue;
        Unit::SpellAuraHolderMap& Auras = target->GetSpellAuraHolderMap();
        for (Unit::SpellAuraHolderMap::iterator iter = Auras.begin(); iter != Auras.end(); ++iter)
        {
            if (!iter->second || iter->second->IsDeleted())
                continue;

            SpellEntry const* spell = iter->second->GetSpellProto();

            if ((GetSpellSchoolMask(spell) & school_mask)//Check for school mask
                && !spell->HasAttribute(SPELL_ATTR_UNAFFECTED_BY_INVULNERABILITY)   //Spells unaffected by invulnerability
                && !iter->second->IsPositive()                //Don't remove positive spells
                && spell->Id != GetId())                //Don't remove self
            {
                toRemoveSpellList.insert(iter->second->GetId());
            }
        }
        for (std::set<uint32>::iterator i = toRemoveSpellList.begin(); i != toRemoveSpellList.end(); ++i)
            target->RemoveAurasDueToSpell(*i);
    }

    if ( Real && GetSpellProto()->Mechanic == MECHANIC_BANISH )
    {
        if ( apply )
            target->addUnitState(UNIT_STAT_ISOLATED);
        else
            target->clearUnitState(UNIT_STAT_ISOLATED);
    }
}

void Aura::HandleAuraModDmgImmunity(bool apply, bool /*Real*/)
{
    GetTarget()->ApplySpellImmune(GetId(), IMMUNITY_DAMAGE, m_modifier.m_miscvalue, apply);
}

void Aura::HandleAuraModDispelImmunity(bool apply, bool Real)
{
    // all applied/removed only at real aura add/remove
    if(!Real)
        return;

    GetTarget()->ApplySpellDispelImmunity(GetSpellProto(), DispelType(m_modifier.m_miscvalue), apply);
}

void Aura::HandleAuraProcTriggerSpell(bool apply, bool Real)
{
    if(!Real)
        return;

    Unit *target = GetTarget();

    switch (GetId())
    {
        // some spell have charges by functionality not have its in spell data
        case 28200:                                         // Ascendance (Talisman of Ascendance trinket)
            if (apply)
                GetHolder()->SetAuraCharges(6);
            break;
        case 50720:                                         // Vigilance (threat transfering)
            if (apply)
            {
                if (Unit* caster = GetCaster())
                    target->CastSpell(caster, 59665, true);
            }
            else
                target->getHostileRefManager().ResetThreatRedirection();
            break;
        case 72059:                                         // Unstable (Kinetic Bomb - Blood Council encounter)
            if (!apply)
            {
                if (target->GetTypeId() == TYPEID_UNIT)
                    ((Creature*)target)->ForcedDespawn();
            }
            break;
        case 72451:                                         // Mutated Plague (Putricide)
        case 72463:
        case 72671:
        case 72672:
            if (!apply)
            {
                if (Unit *pCaster = GetCaster())
                {
                    if (pCaster->isAlive())
                        target->CastSpell(pCaster, GetModifier()->m_amount, true); // cast healing spell
                }
            }
            break;
        default:
            break;
    }
}

void Aura::HandleAuraModStalked(bool apply, bool /*Real*/)
{
    // used by spells: Hunter's Mark, Mind Vision, Syndicate Tracker (MURP) DND
    if (apply)
        GetTarget()->SetFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_TRACK_UNIT);
    else
        GetTarget()->RemoveFlag(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_TRACK_UNIT);
}

/*********************************************************/
/***                   PERIODIC                        ***/
/*********************************************************/

void Aura::HandlePeriodicTriggerSpell(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;

    Unit *target = GetTarget();

    if (!apply)
    {
        switch(GetId())
        {
            case 66:                                        // Invisibility
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                    target->CastSpell(target, 32612, true, NULL, this);

                return;
            case 28522:                                     // Icebolt (Naxxramas: Sapphiron)
                if (target->HasAura(45776))                 // Should trigger/remove some kind of iceblock
                    // not sure about ice block spell id
                    target->RemoveAurasDueToSpell(45776);

                return;
            case 42783:                                     // Wrath of the Astrom...
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE && GetEffIndex() + 1 < MAX_EFFECT_INDEX)
                    target->CastSpell(target, GetSpellProto()->CalculateSimpleValue(SpellEffectIndex(GetEffIndex()+1)), true);

                return;
            case 46221:                                     // Animal Blood
                if (target->GetTypeId() == TYPEID_PLAYER && m_removeMode == AURA_REMOVE_BY_DEFAULT && target->IsInWater())
                {
                    float position_z = target->GetTerrain()->GetWaterLevel(target->GetPositionX(), target->GetPositionY(), target->GetPositionZ());
                    // Spawn Blood Pool
                    target->CastSpell(target->GetPositionX(), target->GetPositionY(), position_z, 63471, true);
                }

                return;
            case 51121:                                     // Urom Clocking Bomb
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                    target->CastSpell(target, 51132, true);
                return;
            case 51912:                                     // Ultra-Advanced Proto-Typical Shortening Blaster
            case 53102:                                     // Scepter of Domination
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                {
                    if (Unit* pCaster = GetCaster())
                        pCaster->CastSpell(target, GetSpellProto()->EffectTriggerSpell[GetEffIndex()], true, NULL, this);
                }

                return;
            case 52658:                                     // Ionar Static Overload Explode (N)
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                    target->CastSpell(target, 53337, true);

                return;
            case 59795:                                     // Ionar Static Overload Explode (H)
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                    target->CastSpell(target, 59798, true);

                return;
            case 63018:                                     // Searing Light (Ulduar: XT-002)
            case 65121:                                     // Searing Light (h) (Ulduar: XT-002)
                if (Unit *pCaster = GetCaster())
                {
                    if (pCaster->HasAura(GetModifier()->m_amount))
                        pCaster->CastSpell(target, 64210, true);
                }

                return;
            case 63024:                                     // Gravity Bomb (Ulduar: XT-002)
            case 64234:                                     // Gravity Bomb (h) (Ulduar: XT-002)
                if (Unit *pCaster = GetCaster())
                {
                    uint32 spellId = GetId() == 63024 ? 64203 : 64235;
                    if (pCaster->HasAura(GetModifier()->m_amount))
                        pCaster->CastSpell(target, spellId, true);
                }

                return;
            case 66083:                                     // Lightning Arrows (Trial of the Champion encounter)
                if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                {
                    if (Unit* pCaster = GetCaster())
                        pCaster->CastSpell(pCaster, 66085, true, NULL, this);
                }

                return;
            case 70405:                                     // Mutated Transformation (Putricide)
            case 72508:
            case 72509:
            case 72510:
                if (target->GetTypeId() == TYPEID_UNIT)
                    ((Creature*)target)->ForcedDespawn();
                return;
            case 71441:                                     // Unstable Ooze Explosion (Rotface)
                target->CastSpell(target, 67375, true);
                return;
            default:
                break;
        }
    }

    switch (GetId())
    {
        case 70157:                                     // Ice Tomb (Sindragosa)
        {
            if (apply)
            {
                if (GameObject *pGO = target->SummonGameobject(201722, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0.0f, 180))
                {
                    pGO->SetSpellId(GetId());
                    target->AddGameObject(pGO);
                }
                if (Creature *pCreature = target->SummonCreature(36980, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ(), 0.0f, TEMPSUMMON_TIMED_DESPAWN, 180000))
                {
                    pCreature->SetCreatorGuid(target->GetObjectGuid());
                }
            }
            else
            {
                if (GameObject *pGo = target->GetGameObject(GetId()))
                    pGo->Delete();
            }

            return;
        }
        case 71530:                                     // Essence of the Blood Queen (Queen Lana'thel)
        case 71531:
        case 71532:
        case 71533:
        case 71525:
        case 71473:
        case 70867:
        case 70879:
        case 71265:                                     // Swarming Shadows (Queen Lana'thel)
        {
            if (apply)
            {
                target->CastSpell(target, 70871, true, 0, this, target->GetObjectGuid()); // add the buff for healing

                if (Unit *pCaster = GetCaster())
                {
                    // if we were bitten then we remove Frenzied Bloodthirst aura
                    SpellAuraHolderPtr holder = pCaster->GetSpellAuraHolder(70877);
                    if (!holder)
                        holder = pCaster->GetSpellAuraHolder(71474);

                    if (holder)
                    {
                        pCaster->RemoveAurasDueToSpell(70877);
                        pCaster->CastSpell(pCaster, GetId(), true, 0, 0, holder->GetCasterGuid());
                    }
                }
            }
            else
            {
                target->RemoveAurasDueToSpell(70871); // remove the buff
            }
            break;
        }
    }
}

void Aura::HandlePeriodicTriggerSpellWithValue(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;
}

void Aura::HandlePeriodicEnergize(bool apply, bool Real)
{
    if (!Real)
        return;

    Unit *target = GetTarget();

    // For prevent double apply bonuses
    bool loading = (target->GetTypeId() == TYPEID_PLAYER && ((Player*)target)->GetSession()->PlayerLoading());

    if (apply && !loading)
    {
        switch (GetId())
        {
            case 54833:                                     // Glyph of Innervate (value%/2 of casters base mana)
            {
                if (Unit* caster = GetCaster())
                    m_modifier.m_amount = int32(caster->GetCreateMana() * GetBasePoints() / (200 * GetAuraMaxTicks()));
                break;

            }
            case 29166:                                     // Innervate (value% of casters base mana)
            {
                if (Unit* caster = GetCaster())
                {
                    // Glyph of Innervate
                    if (caster->HasAura(54832))
                        caster->CastSpell(caster,54833,true,NULL,this);

                    m_modifier.m_amount = int32(caster->GetCreateMana() * GetBasePoints() / (100 * GetAuraMaxTicks()));
                }
                break;
            }
            case 48391:                                     // Owlkin Frenzy 2% base mana
                m_modifier.m_amount = target->GetCreateMana() * 2 / 100;
                break;
            case 57669:                                     // Replenishment (0.2% from max)
                m_modifier.m_amount = target->GetMaxPower(POWER_MANA) * 2 / 1000;
                break;
            case 61782:                                     // Infinite Replenishment (0.25% from max)
                m_modifier.m_amount = target->GetMaxPower(POWER_MANA) * 25 / 10000;
                break;
            default:
                break;
        }
    }
    if (!apply && !loading)
    {
        switch (GetId())
        {
            case 5229:                                      // Druid Bear Enrage
                if (target->HasAura(51185))               // King of the Jungle self Enrage bonus with infinity duration
                    target->RemoveAurasDueToSpell(51185);
                break;
            default:
                break;
        }
    }

    m_isPeriodic = apply;
}

void Aura::HandleAuraPowerBurn(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;
}

void Aura::HandleAuraPeriodicDummy(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    Unit *target = GetTarget();

    // For prevent double apply bonuses
    bool loading = (target->GetTypeId() == TYPEID_PLAYER && ((Player*)target)->GetSession()->PlayerLoading());

    SpellEntry const*spell = GetSpellProto();
    switch(spell->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            switch(spell->Id)
            {
                case 25281:                             // Turkey Marker
                {
                    if (target && target->GetTypeId() != TYPEID_PLAYER)
                        break;
                    if (Aura* aura = target->GetAura(25281, EFFECT_INDEX_0))
                    if (aura->GetStackAmount() == 15)
                        target->CastSpell(target, 25285, true);     // Friend or Fowl criteria
                    break;
                }
                case 49555:                             // Corpse Explode (Trollgore - Drak'Tharon Keep Normal)
                    if (!apply)
                    {
                        if (target)
                        {
                            if (Unit *caster = GetCaster())
                            {
                                target->CastSpell(target, 49618, true, 0, 0, caster->GetObjectGuid());
                                target->CastSpell(target, 51270, true);
                                target->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.0f);
                                target->SetDeathState(JUST_DIED);
                            }
                        }
                    }
                    break;
                case 59807:                             // Corpse Explode (Trollgore - Drak'Tharon Keep Hero)
                    if (!apply)
                    {
                        if (target)
                        {
                            if (Unit *caster = GetCaster())
                            {
                                target->CastSpell(target, 59809, true, 0, 0, caster->GetObjectGuid());
                                target->CastSpell(target, 51270, true);
                                target->SetFloatValue(OBJECT_FIELD_SCALE_X, 1.0f);
                                target->SetDeathState(JUST_DIED);
                            }
                        }
                    }
                    break;
                case 55093:                                   // Grip of Slad'ran
                case 61474:                                   // Grip of Slad'ran (h)
                {
                    if (apply)
                    {
                        if (target->HasAura(55126) || target->HasAura(61476))
                        {
                            target->RemoveSpellAuraHolder(GetHolder());
                            return;
                        }

                        if (GetHolder()->GetStackAmount() >= 5)
                        {
                            target->RemoveAura(this);
                            target->CastSpell(target, (spell->Id == 55093) ? 55126 : 61476, true);
                        }
                    }
                    break;
                }
                case 62717:                                   // Slag Pot (Ulduar: Ignis)
                case 63477:
                {
                    Unit *caster = GetCaster();

                    if (!caster || !target)
                        return;

                    // Haste buff (Slag Imbued)
                    if (!apply)
                        target->CastSpell(caster, (spell->Id == 62717) ? 62836 : 63536, true);

                    break;
                }
                case 63050:                                   // Sanity (Yogg Saron - Ulduar)
                {
                                                              // here is the special handling of Sanity
                    Unit *caster = GetCaster();
                    if (!caster)
                    {
                        target->RemoveAurasDueToSpell(63050);
                        return;
                    }

                    if (!caster->isAlive())
                    {
                        target->RemoveAurasDueToSpell(63050);
                        return;
                    }

                    uint32 stacks = GetHolder()->GetStackAmount();

                    if ((stacks < 30) && !(target->HasAura(63752)))
                        target->CastSpell(target, 63752, true);

                    if ((stacks > 30) && (target->HasAura(63752)))
                        target->RemoveAurasDueToSpell(63752);

                    if (target->HasAura(64169))               // sanity well Aura
                        GetHolder()->ModStackAmount(20);
                    return;
                }
                case 64217:                                 // Overcharged (spell from Emalon adds)
                {
                    if (GetHolder()->GetStackAmount() > 11)
                    {
                        target->CastSpell(target, 64219, true);
                        target->DealDamage(target, target->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
                    }
                    return;
                }
            }
            break;
        }
        case SPELLFAMILY_ROGUE:
        {
            switch (spell->Id)
            {
                // Master of Subtlety
                case 31666:
                {
                    if (apply)
                    {
                        // for make duration visible
                        if (SpellAuraHolderPtr holder = target->GetSpellAuraHolder(31665))
                        {
                            holder->SetAuraMaxDuration(GetHolder()->GetAuraDuration());
                            holder->RefreshHolder();
                        }
                    }
                    else
                        target->RemoveAurasDueToSpell(31665);
                    break;
                }
                default:
                    break;
            }
            break;
        }
        case SPELLFAMILY_WARLOCK:
        {
            switch (spell->Id)
            {
                case 48018:
                    if (apply)
                        target->CastSpell(target, 62388, true);
                    else
                    {
                        target->RemoveGameObject(spell->Id,true);
                        target->RemoveAurasDueToSpell(62388);
                    }
                break;
            }
            break;
        }
        case SPELLFAMILY_HUNTER:
        {
            Unit* caster = GetCaster();

            // Explosive Shot
            if (apply && !loading && caster)
                m_modifier.m_amount += int32(caster->GetTotalAttackPowerValue(RANGED_ATTACK) * 14 / 100);
            break;
        }
    }

    m_isPeriodic = apply;
}

void Aura::HandlePeriodicHeal(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;

    Unit *target = GetTarget();

    // For prevent double apply bonuses
    bool loading = (target->GetTypeId() == TYPEID_PLAYER && ((Player*)target)->GetSession()->PlayerLoading());

    // Custom damage calculation after
    if (apply)
    {
        if (loading)
            return;

        Unit *caster = GetCaster();
        if (!caster)
            return;

        // Gift of the Naaru (have multiple spellfamilies)
        if (GetSpellProto()->GetSpellFamilyFlags().test<CF_ALL_GIFT_OF_THE_NAARU>())
        {
            float add = 0.0f;
            switch (GetSpellProto()->SpellFamilyName)
            {
                case SPELLFAMILY_MAGE:
                case SPELLFAMILY_WARLOCK:
                case SPELLFAMILY_PRIEST:
                    add = 1.885f * (float)caster->SpellBaseDamageBonusDone(GetSpellSchoolMask(GetSpellProto()));
                    break;

                case SPELLFAMILY_PALADIN:
                case SPELLFAMILY_SHAMAN:
                    add = std::max(1.885f * (float)caster->SpellBaseDamageBonusDone(GetSpellSchoolMask(GetSpellProto())), 1.1f * (float)caster->GetTotalAttackPowerValue(BASE_ATTACK));
                    break;

                case SPELLFAMILY_WARRIOR:
                case SPELLFAMILY_HUNTER:
                case SPELLFAMILY_DEATHKNIGHT:
                    add = 1.1f * (float)std::max(caster->GetTotalAttackPowerValue(BASE_ATTACK), caster->GetTotalAttackPowerValue(RANGED_ATTACK));
                    break;

                case SPELLFAMILY_GENERIC:
                default:
                    sLog.outError("Aura::HandlePeriodicHeal unknown type of aura %u",GetId());
                    break;
            }

            int32 add_per_tick = floor(add / GetAuraMaxTicks());
            m_modifier.m_amount += (add_per_tick > 0 ? add_per_tick : 0);
        }
        // Lifeblood
        else if (GetSpellProto()->SpellIconID == 3088 && GetSpellProto()->SpellVisual[0] == 8145)
        {
            int32 healthBonus = int32 (0.0032f * caster->GetMaxHealth());
            m_modifier.m_amount += healthBonus;
        }
        else
        {
            m_modifier.m_amount = caster->SpellHealingBonusDone(target, GetSpellProto(), m_modifier.m_amount, DOT, GetStackAmount());
        }

        // Rejuvenation
        if (GetSpellProto()->IsFitToFamily<SPELLFAMILY_DRUID, CF_DRUID_REJUVENATION>())
            if (caster->HasAura(64760))                     // Item - Druid T8 Restoration 4P Bonus
                caster->CastCustomSpell(target, 64801, &m_modifier.m_amount, NULL, NULL, true, NULL);
    }
}

void Aura::HandleDamagePercentTaken(bool apply, bool Real)
{
    m_isPeriodic = apply;

    Unit* target = GetTarget();

    if (!Real)
        return;

    // For prevent double apply bonuses
    bool loading = (target->GetTypeId() == TYPEID_PLAYER && ((Player*)target)->GetSession()->PlayerLoading());

    if (apply)
    {
        if (loading)
            return;

        // Hand of Salvation (only it have this aura and mask)
        if (GetSpellProto()->IsFitToFamily<SPELLFAMILY_PALADIN, CF_PALADIN_HAND_OF_SALVATION1>())
        {
            // Glyph of Salvation
            if (target->GetObjectGuid() == GetCasterGuid())
                if (Aura* aur = target->GetAura(63225, EFFECT_INDEX_0))
                    m_modifier.m_amount -= aur->GetModifier()->m_amount;
        }
    }
}

void Aura::HandlePeriodicDamage(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    m_isPeriodic = apply;

    Unit *target = GetTarget();
    SpellEntry const* spellProto = GetSpellProto();

    // For prevent double apply bonuses
    bool loading = (target->GetTypeId() == TYPEID_PLAYER && ((Player*)target)->GetSession()->PlayerLoading());

    // Custom damage calculation after
    if (apply)
    {
        if (loading)
            return;

        Unit *caster = GetCaster();
        if (!caster)
            return;

        switch (spellProto->SpellFamilyName)
        {
            case SPELLFAMILY_WARRIOR:
            {
                // Rend
                if (spellProto->GetSpellFamilyFlags().test<CF_WARRIOR_REND>())
                {
                    // $0.2*(($MWB+$mwb)/2+$AP/14*$MWS) bonus per tick
                    float ap = caster->GetTotalAttackPowerValue(BASE_ATTACK);
                    int32 mws = caster->GetAttackTime(BASE_ATTACK);
                    float mwb_min = caster->GetWeaponDamageRange(BASE_ATTACK,MINDAMAGE);
                    float mwb_max = caster->GetWeaponDamageRange(BASE_ATTACK,MAXDAMAGE);
                    m_modifier.m_amount+=int32(((mwb_min+mwb_max)/2+ap*mws/14000)*0.2f);
                    // If used while target is above 75% health, Rend does 35% more damage
                    if (spellProto->CalculateSimpleValue(EFFECT_INDEX_1) !=0 &&
                        target->GetHealth() > target->GetMaxHealth() * spellProto->CalculateSimpleValue(EFFECT_INDEX_1) / 100)
                        m_modifier.m_amount += m_modifier.m_amount * spellProto->CalculateSimpleValue(EFFECT_INDEX_2) / 100;

                    // Improved Rend - Rank 1
                    if (caster->HasAura(12286))
                        m_modifier.m_amount += int32(m_modifier.m_amount * 0.1f);
                    // Improved Rend - Rank 2
                    if (caster->HasAura(12658))
                        m_modifier.m_amount += int32(m_modifier.m_amount * 0.2f);
                }
                break;
            }
            case SPELLFAMILY_DRUID:
            {
                // Rip
                if (spellProto->GetSpellFamilyFlags().test<CF_DRUID_RIP_BITE>())
                {
                    if (caster->GetTypeId() != TYPEID_PLAYER)
                        break;

                    // 0.01*$AP*cp
                    uint8 cp = caster->GetComboPoints();

                    // Idol of Feral Shadows. Cant be handled as SpellMod in SpellAura:Dummy due its dependency from CPs
                    Unit::AuraList const& dummyAuras = caster->GetAurasByType(SPELL_AURA_DUMMY);
                    for(Unit::AuraList::const_iterator itr = dummyAuras.begin(); itr != dummyAuras.end(); ++itr)
                    {
                        if((*itr)->GetId()==34241)
                        {
                            m_modifier.m_amount += cp * (*itr)->GetModifier()->m_amount;
                            break;
                        }
                    }
                    m_modifier.m_amount += int32(caster->GetTotalAttackPowerValue(BASE_ATTACK) * cp / 100);
                }
                // Insect Swarm
                else if (spellProto->GetSpellFamilyFlags().test<CF_DRUID_INSECT_SWARM>())
                {
                    // Idol of the Crying Wind
                    Unit::AuraList const& dummyAuras = caster->GetAurasByType(SPELL_AURA_DUMMY);
                    for(Unit::AuraList::const_iterator itr = dummyAuras.begin(); itr != dummyAuras.end(); ++itr)
                    {
                        if((*itr)->GetId()==64950)
                        {
                            m_modifier.m_amount += (*itr)->GetModifier()->m_amount;
                            break;
                        }
                    }
                }
                break;
            }
            case SPELLFAMILY_ROGUE:
            {
                // Rupture
                if (spellProto->GetSpellFamilyFlags().test<CF_ROGUE_RUPTURE>())
                {
                    if (caster->GetTypeId() != TYPEID_PLAYER)
                        break;
                    //1 point : ${($m1+$b1*1+0.015*$AP)*4} damage over 8 secs
                    //2 points: ${($m1+$b1*2+0.024*$AP)*5} damage over 10 secs
                    //3 points: ${($m1+$b1*3+0.03*$AP)*6} damage over 12 secs
                    //4 points: ${($m1+$b1*4+0.03428571*$AP)*7} damage over 14 secs
                    //5 points: ${($m1+$b1*5+0.0375*$AP)*8} damage over 16 secs
                    float AP_per_combo[6] = {0.0f, 0.015f, 0.024f, 0.03f, 0.03428571f, 0.0375f};
                    uint8 cp = caster->GetComboPoints();
                    if (cp > 5) cp = 5;
                    m_modifier.m_amount += int32(caster->GetTotalAttackPowerValue(BASE_ATTACK) * AP_per_combo[cp]);
                }
                break;
            }
            case SPELLFAMILY_PALADIN:
            {
                // Holy Vengeance / Blood Corruption
                if (spellProto->GetSpellFamilyFlags().test<CF_PALADIN_SEAL_OF_CORRUPT_VENGE>() && spellProto->SpellVisual[0] == 7902)
                {
                    // AP * 0.025 + SPH * 0.013 bonus per tick
                    float ap = caster->GetTotalAttackPowerValue(BASE_ATTACK);
                    int32 holy = caster->SpellBaseDamageBonusDone(GetSpellSchoolMask(spellProto));
                    if (holy < 0)
                        holy = 0;
                    m_modifier.m_amount += int32(GetStackAmount()) * (int32(ap * 0.025f) + int32(holy * 13 / 1000));
                }
                break;
            }
            default:
                break;
        }

        if (m_modifier.m_auraname == SPELL_AURA_PERIODIC_DAMAGE)
        {
            DamageInfo damageInfo =  DamageInfo(caster, target, GetSpellProto(), m_modifier.m_amount);
            damageInfo.damageType = DOT;
            // SpellDamageBonusDone for magic spells
            if (spellProto->DmgClass == SPELL_DAMAGE_CLASS_NONE || spellProto->DmgClass == SPELL_DAMAGE_CLASS_MAGIC)
            {
                caster->SpellDamageBonusDone(&damageInfo, GetStackAmount());
            }
            // MeleeDamagebonusDone for weapon based spells
            else
            {
                caster->MeleeDamageBonusDone(&damageInfo, GetStackAmount());
            }
            m_modifier.m_amount = damageInfo.damage;
        }
    }
    // remove time effects
    else
    {
        // Parasitic Shadowfiend - handle summoning of two Shadowfiends on DoT expire
        if (spellProto->Id == 41917)
            target->CastSpell(target, 41915, true);
        else if (spellProto->Id == 74562) // SPELL_FIERY_COMBUSTION - Ruby sanctum boss Halion
            target->CastSpell(target, 74607, true, NULL, NULL, GetCasterGuid());
        else if (spellProto->Id == 74792) // SPELL_SOUL_CONSUMPTION - Ruby sanctum boss Halion
            target->CastSpell(target, 74799, true, NULL, NULL, GetCasterGuid());
        // Void Shifted
        else if (spellProto->Id == 54361 || spellProto->Id == 59743)
            target->CastSpell(target, 54343, true, NULL, NULL, GetCasterGuid());
    }

    switch (GetId())
    {
        case 68980:                             // Harvest Soul(s) (Lich King)
        case 74295:
        case 74296:
        case 74297:
        case 74325:
        case 74326:
        case 74327:
        case 73654:
        {
            if (!apply)
            {
                // if died - cast Harvested Soul on Lich King
                if (m_removeMode == AURA_REMOVE_BY_DEATH)
                    target->CastSpell(target, 72679, true);
            }

            break;
        }
        case 70911:                             // Unbound Plague (Putricide)
        case 72854:
        case 72855:
        case 72856:
        {
            if (apply)
            {
                target->CastSpell(target, 70955, true); // Bounce Protection
                if (Unit *pCaster = GetCaster())
                {
                    if (SpellAuraHolderPtr holder = pCaster->GetSpellAuraHolder(GetId()))
                    {
                        GetHolder()->SetAuraDuration(holder->GetAuraDuration());
                        GetHolder()->SendAuraUpdate(false);
                    }
                }
            }
            else
            {
                target->RemoveAurasDueToSpell(70917); // remove Search Periodic
                target->CastSpell(target, 70953, true); // Plague Sickness
            }

            break;
        }
    }
}

void Aura::HandlePeriodicDamagePCT(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;
}

void Aura::HandlePeriodicLeech(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;

    // For prevent double apply bonuses
    bool loading = (GetTarget()->GetTypeId() == TYPEID_PLAYER && ((Player*)GetTarget())->GetSession()->PlayerLoading());

    // Custom damage calculation after
    if (apply)
    {
        if (loading)
            return;

        Unit *caster = GetCaster();
        if (!caster)
            return;

        DamageInfo damageInfo =  DamageInfo(caster, GetTarget(), GetSpellProto(), m_modifier.m_amount);
        damageInfo.damageType = DOT;
        caster->SpellDamageBonusDone(&damageInfo, GetStackAmount());
        m_modifier.m_amount = damageInfo.damage;
    }
}

void Aura::HandlePeriodicManaLeech(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;
}

void Aura::HandlePeriodicHealthFunnel(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;

    // For prevent double apply bonuses
    bool loading = (GetTarget()->GetTypeId() == TYPEID_PLAYER && ((Player*)GetTarget())->GetSession()->PlayerLoading());

    // Custom damage calculation after
    if (apply)
    {
        if (loading)
            return;

        Unit* caster = GetCaster();
        if (!caster)
            return;
        DamageInfo damageInfo =  DamageInfo(caster, GetTarget(), GetSpellProto(), m_modifier.m_amount);
        damageInfo.damageType = DOT;
        caster->SpellDamageBonusDone(&damageInfo, GetStackAmount());
        m_modifier.m_amount = damageInfo.damage;
    }
}

/*********************************************************/
/***                  MODIFY STATS                     ***/
/*********************************************************/

/********************************/
/***        RESISTANCE        ***/
/********************************/

void Aura::HandleAuraModResistanceExclusive(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();

    for(int8 x = SPELL_SCHOOL_NORMAL; x < MAX_SPELL_SCHOOL;x++)
    {
        //int32 oldMaxValue = 0;
        if (m_modifier.m_miscvalue & int32(1<<x))
        {
            float change = target->CheckAuraStackingAndApply(this, UnitMods(UNIT_MOD_RESISTANCE_START + x), TOTAL_VALUE, float(m_modifier.m_amount), apply, int32(1<<x));
            if (change != 0)
                target->ApplyResistanceBuffModsMod(SpellSchools(x), m_modifier.m_amount > 0, change, true);
        }
    }
}

void Aura::HandleAuraModResistance(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();

    for(int8 x = SPELL_SCHOOL_NORMAL; x < MAX_SPELL_SCHOOL;x++)
    {
        if (m_modifier.m_miscvalue & int32(1<<x))
        {
            float change = target->CheckAuraStackingAndApply(this, UnitMods(UNIT_MOD_RESISTANCE_START + x), TOTAL_VALUE, float(m_modifier.m_amount), apply);
            if (change != 0)
                target->ApplyResistanceBuffModsMod(SpellSchools(x), m_modifier.m_amount > 0, float(m_modifier.m_amount), apply);
        }
    }
}

void Aura::HandleAuraModBaseResistancePCT(bool apply, bool /*Real*/)
{
    // only players and pets have base stats
    if (GetTarget()->GetTypeId() == TYPEID_PLAYER || ((Creature*)GetTarget())->IsPet())
    {
        for(int8 x = SPELL_SCHOOL_NORMAL; x < MAX_SPELL_SCHOOL;x++)
        {
            if (m_modifier.m_miscvalue & int32(1<<x))
                GetTarget()->HandleStatModifier(UnitMods(UNIT_MOD_RESISTANCE_START + x), BASE_PCT, float(m_modifier.m_amount), apply);
        }
    }
}

void Aura::HandleModResistancePercent(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();

    for(int8 i = SPELL_SCHOOL_NORMAL; i < MAX_SPELL_SCHOOL; i++)
    {
        if (m_modifier.m_miscvalue & int32(1<<i))
        {
            float change = target->CheckAuraStackingAndApply(this, UnitMods(UNIT_MOD_RESISTANCE_START + i), TOTAL_PCT, float(m_modifier.m_amount), apply, int32(1<<i));
            if (change)
                target->ApplyResistanceBuffModsPercentMod(SpellSchools(i), m_modifier.m_amount > 0, change, apply);
        }
    }
}

void Aura::HandleModBaseResistance(bool apply, bool /*Real*/)
{
    // only players and pets have base stats
    if (GetTarget()->GetTypeId() == TYPEID_PLAYER  || ((Creature*)GetTarget())->IsPet())
    {
        for(int i = SPELL_SCHOOL_NORMAL; i < MAX_SPELL_SCHOOL; i++)
            if (m_modifier.m_miscvalue & (1<<i))
                GetTarget()->HandleStatModifier(UnitMods(UNIT_MOD_RESISTANCE_START + i), TOTAL_VALUE, float(m_modifier.m_amount), apply);
    }
}

/********************************/
/***           STAT           ***/
/********************************/

void Aura::HandleAuraModStat(bool apply, bool /*Real*/)
{
    if (m_modifier.m_miscvalue < -2 || m_modifier.m_miscvalue > 4)
    {
        sLog.outError("WARNING: Spell %u effect %u have unsupported misc value (%i) for SPELL_AURA_MOD_STAT ",GetId(),GetEffIndex(),m_modifier.m_miscvalue);
        return;
    }

    Unit *target = GetTarget();

    for(int32 i = STAT_STRENGTH; i < MAX_STATS; i++)
    {
        // -1 or -2 is all stats ( misc < -2 checked in function beginning )
        if (m_modifier.m_miscvalue < 0 || m_modifier.m_miscvalue == i)
        {
            //m_target->ApplyStatMod(Stats(i), m_modifier.m_amount,apply);
            float change = target->CheckAuraStackingAndApply(this, UnitMods(UNIT_MOD_STAT_START + i), TOTAL_VALUE, float(m_modifier.m_amount), apply, 0, i+1);
            if (change != 0)
                target->ApplyStatBuffMod(Stats(i), (change < 0 && !IsStacking() ? -change : change), apply);
        }
    }
}

void Aura::HandleModPercentStat(bool apply, bool /*Real*/)
{
    if (m_modifier.m_miscvalue < -1 || m_modifier.m_miscvalue > 4)
    {
        sLog.outError("WARNING: Misc Value for SPELL_AURA_MOD_PERCENT_STAT not valid");
        return;
    }

    // only players and pets have base stats
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER && !((Creature*)GetTarget())->IsPet())
        return;

    for (int32 i = STAT_STRENGTH; i < MAX_STATS; ++i)
    {
        if (m_modifier.m_miscvalue == i || m_modifier.m_miscvalue == -1)
            GetTarget()->HandleStatModifier(UnitMods(UNIT_MOD_STAT_START + i), BASE_PCT, float(m_modifier.m_amount), apply);
    }
}

void Aura::HandleModSpellDamagePercentFromStat(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    // Magic damage modifiers implemented in Unit::SpellDamageBonusDone
    // This information for client side use only
    // Recalculate bonus
    ((Player*)GetTarget())->UpdateSpellDamageAndHealingBonus();
}

void Aura::HandleModSpellHealingPercentFromStat(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    // Recalculate bonus
    ((Player*)GetTarget())->UpdateSpellDamageAndHealingBonus();
}

void Aura::HandleAuraModDispelResist(bool apply, bool Real)
{
    if (!Real || !apply)
        return;

    if (GetId() == 33206)
        GetTarget()->CastSpell(GetTarget(), 44416, true, NULL, this, GetCasterGuid());
}

void Aura::HandleModSpellDamagePercentFromAttackPower(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    // Magic damage modifiers implemented in Unit::SpellDamageBonusDone
    // This information for client side use only
    // Recalculate bonus
    ((Player*)GetTarget())->UpdateSpellDamageAndHealingBonus();
}

void Aura::HandleModSpellHealingPercentFromAttackPower(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    // Recalculate bonus
    ((Player*)GetTarget())->UpdateSpellDamageAndHealingBonus();
}

void Aura::HandleModHealingDone(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;
    // implemented in Unit::SpellHealingBonusDone
    // this information is for client side only
    ((Player*)GetTarget())->UpdateSpellDamageAndHealingBonus();
}

void Aura::HandleModTotalPercentStat(bool apply, bool /*Real*/)
{
    if (m_modifier.m_miscvalue < -1 || m_modifier.m_miscvalue > 4)
    {
        sLog.outError("WARNING: Misc Value for SPELL_AURA_MOD_PERCENT_STAT not valid");
        return;
    }

    Unit *target = GetTarget();

    //save current and max HP before applying aura
    uint32 curHPValue = target->GetHealth();
    uint32 maxHPValue = target->GetMaxHealth();

    for (int32 i = STAT_STRENGTH; i < MAX_STATS; i++)
    {
        if (m_modifier.m_miscvalue == i || m_modifier.m_miscvalue == -1)
        {
            target->HandleStatModifier(UnitMods(UNIT_MOD_STAT_START + i), TOTAL_PCT, float(m_modifier.m_amount), apply);
            if (target->GetTypeId() == TYPEID_PLAYER || ((Creature*)target)->IsPet())
                target->ApplyStatPercentBuffMod(Stats(i), float(m_modifier.m_amount), apply );
        }
    }

    //recalculate current HP/MP after applying aura modifications (only for spells with 0x10 flag)
    if (m_modifier.m_miscvalue == STAT_STAMINA && maxHPValue > 0 && GetSpellProto()->HasAttribute(SPELL_ATTR_ABILITY))
    {
        // newHP = (curHP / maxHP) * newMaxHP = (newMaxHP * curHP) / maxHP -> which is better because no int -> double -> int conversion is needed
        // Multiplication of large numbers cause uint32 overflow so using trick
        // a*b/c = (a/c) * (b/c) * c + (a%c) * (b%c) / c + (a/c) * (b%c) + (a%c) * (b/c)
        uint32 max_hp = target->GetMaxHealth();
        // max_hp * curHPValue / maxHPValue
        uint32 newHPValue =
            (max_hp/maxHPValue) * (curHPValue/maxHPValue) * maxHPValue
            + (max_hp%maxHPValue) * (curHPValue%maxHPValue) / maxHPValue
            + (max_hp/maxHPValue) * (curHPValue%maxHPValue)
            + (max_hp%maxHPValue) * (curHPValue/maxHPValue);
        target->SetHealth(newHPValue);
    }
}

void Aura::HandleAuraModResistenceOfStatPercent(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    if (m_modifier.m_miscvalue != SPELL_SCHOOL_MASK_NORMAL)
    {
        // support required adding replace UpdateArmor by loop by UpdateResistence at intellect update
        // and include in UpdateResistence same code as in UpdateArmor for aura mod apply.
        sLog.outError("Aura SPELL_AURA_MOD_RESISTANCE_OF_STAT_PERCENT(182) need adding support for non-armor resistances!");
        return;
    }

    // Recalculate Armor
    GetTarget()->UpdateArmor();
}

/********************************/
/***      HEAL & ENERGIZE     ***/
/********************************/
void Aura::HandleAuraModTotalHealthPercentRegen(bool apply, bool /*Real*/)
{
    m_isPeriodic = apply;
}

void Aura::HandleAuraModTotalManaPercentRegen(bool apply, bool /*Real*/)
{
    if (m_modifier.periodictime == 0)
        m_modifier.periodictime = 1000;

    m_periodicTimer = m_modifier.periodictime;
    m_isPeriodic = apply;
}

void Aura::HandleModRegen(bool apply, bool /*Real*/)        // eating
{
    if (m_modifier.periodictime == 0)
        m_modifier.periodictime = 5000;

    m_periodicTimer = 5000;
    m_isPeriodic = apply;
}

void Aura::HandleModPowerRegen(bool apply, bool Real)       // drinking
{
    if (!Real)
        return;

    Powers pt = GetTarget()->getPowerType();
    if (m_modifier.periodictime == 0)
    {
        // Anger Management (only spell use this aura for rage)
        if (pt == POWER_RAGE)
            m_modifier.periodictime = 3000;
        else if (pt == POWER_RUNIC_POWER)
            m_modifier.periodictime = 5000;
        else
            m_modifier.periodictime = 2000;
    }

    m_periodicTimer = 5000;

    if (GetTarget()->GetTypeId() == TYPEID_PLAYER && m_modifier.m_miscvalue == POWER_MANA)
        ((Player*)GetTarget())->UpdateManaRegen();

    m_isPeriodic = apply;
}

void Aura::HandleModPowerRegenPCT(bool /*apply*/, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    // Update manaregen value
    if (m_modifier.m_miscvalue == POWER_MANA)
        ((Player*)GetTarget())->UpdateManaRegen();
}

void Aura::HandleModManaRegen(bool /*apply*/, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    //Note: an increase in regen does NOT cause threat.
    ((Player*)GetTarget())->UpdateManaRegen();
}

void Aura::HandleComprehendLanguage(bool apply, bool /*Real*/)
{
    if (apply)
        GetTarget()->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_COMPREHEND_LANG);
    else
        GetTarget()->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_COMPREHEND_LANG);
}

void Aura::HandleAuraModIncreaseHealth(bool apply, bool Real)
{
    Unit *target = GetTarget();

    // Special case with temporary increase max/current health
    switch(GetId())
    {
        case 12976:                                         // Warrior Last Stand triggered spell
        case 28726:                                         // Nightmare Seed ( Nightmare Seed )
        case 31616:                                         // Nature's Guardian
        case 34511:                                         // Valor (Bulwark of Kings, Bulwark of the Ancient Kings)
        case 44055: case 55915: case 55917: case 67596:     // Tremendous Fortitude (Battlemaster's Alacrity)
        case 50322:                                         // Survival Instincts
        case 53479:                                         // Hunter pet - Last Stand
        case 54443:                                         // Demonic Empowerment (Voidwalker)
        case 55233:                                         // Vampiric Blood
        case 59465:                                         // Brood Rage (Ahn'Kahet)
        {
            if (Real)
            {
                if (apply)
                {
                    // Demonic Empowerment (Voidwalker) & Vampiric Blood - special cases, store percent in data
                    // recalculate to full amount at apply for proper remove
                    if (GetId() == 54443 || GetId() == 55233)
                        m_modifier.m_amount = target->GetMaxHealth() * m_modifier.m_amount / 100;

                    target->HandleStatModifier(UNIT_MOD_HEALTH, TOTAL_VALUE, float(m_modifier.m_amount), apply);
                    target->ModifyHealth(m_modifier.m_amount);
                }
                else
                {
                    if (int32(target->GetHealth()) > m_modifier.m_amount)
                        target->ModifyHealth(-m_modifier.m_amount);
                    else
                        target->SetHealth(1);
                    target->HandleStatModifier(UNIT_MOD_HEALTH, TOTAL_VALUE, float(m_modifier.m_amount), apply);
                }
            }
            return;
        }
    }

    // generic case
    target->CheckAuraStackingAndApply(this, UNIT_MOD_HEALTH, TOTAL_VALUE, float(m_modifier.m_amount), apply);
}

void  Aura::HandleAuraModIncreaseMaxHealth(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();
    uint32 oldhealth = target->GetHealth();
    double healthPercentage = (double)oldhealth / (double)target->GetMaxHealth();

    target->CheckAuraStackingAndApply(this, UNIT_MOD_HEALTH, TOTAL_VALUE, float(m_modifier.m_amount), apply);

    // refresh percentage
    if (oldhealth > 0)
    {
        uint32 newhealth = uint32(ceil((double)target->GetMaxHealth() * healthPercentage));
        if (newhealth==0)
            newhealth = 1;

        target->SetHealth(newhealth);
    }
}

void Aura::HandleAuraModIncreaseEnergy(bool apply, bool Real)
{
    Unit* target = GetTarget();

    if (!target)
        return;

    Powers powerType = target->getPowerType();

    if (int32(powerType) != m_modifier.m_miscvalue)
    {
        DEBUG_LOG("HandleAuraModIncreaseEnergy: unit %u change energy %u but current type %u", target->GetObjectGuid().GetCounter(), m_modifier.m_miscvalue, powerType);
        powerType = Powers(m_modifier.m_miscvalue);
    }

    UnitMods unitMod = UnitMods(UNIT_MOD_POWER_START + powerType);

    target->HandleStatModifier(unitMod, TOTAL_VALUE, float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraModIncreaseEnergyPercent(bool apply, bool /*Real*/)
{
    Unit* target = GetTarget();

    if (!target)
        return;

    Powers powerType = target->getPowerType();

    if (int32(powerType) != m_modifier.m_miscvalue)
    {
        DEBUG_LOG("HandleAuraModIncreaseEnergy: unit %u change energy %u but current type %u", target->GetObjectGuid().GetCounter(), m_modifier.m_miscvalue, powerType);
        powerType = Powers(m_modifier.m_miscvalue);
    }

    UnitMods unitMod = UnitMods(UNIT_MOD_POWER_START + powerType);

    target->HandleStatModifier(unitMod, TOTAL_PCT, float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraModIncreaseHealthPercent(bool apply, bool /*Real*/)
{
    Unit* target = GetTarget();

    if (!target)
        return;

    uint32 oldhealth = target->GetHealth();

    target->HandleStatModifier(UNIT_MOD_HEALTH, TOTAL_PCT, float(m_modifier.m_amount), apply);

    // spell special cases when current health set to max value at apply
    if (apply)
    {
        switch (GetId())
        {
            case 60430:                                         // Molten Fury
            case 61254:                                         // Will of Sartharion
            case 64193:                                         // Heartbreak
            case 65737:                                         // Heartbreak
            case 64582:                                         // Emergency Mode (Ulduar - Mimiron)
                target->SetHealth(target->GetMaxHealth());
                break;
            default:
                if (oldhealth > target->GetMaxHealth())
                    target->SetHealth(target->GetMaxHealth());
                break;
        }
    }
    else
    {
        if (oldhealth > target->GetMaxHealth())
            target->SetHealth(target->GetMaxHealth());
        else
            target->SetHealth(oldhealth);
    }
}

void Aura::HandleAuraIncreaseBaseHealthPercent(bool apply, bool /*Real*/)
{
    GetTarget()->HandleStatModifier(UNIT_MOD_HEALTH, BASE_PCT, float(m_modifier.m_amount), apply);
}

/********************************/
/***          FIGHT           ***/
/********************************/

void Aura::HandleAuraModParryPercent(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    ((Player*)GetTarget())->UpdateParryPercentage();
}

void Aura::HandleAuraModDodgePercent(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    ((Player*)GetTarget())->UpdateDodgePercentage();
    //sLog.outError("BONUS DODGE CHANCE: + %f", float(m_modifier.m_amount));
}

void Aura::HandleAuraModBlockPercent(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    ((Player*)GetTarget())->UpdateBlockPercentage();
    //sLog.outError("BONUS BLOCK CHANCE: + %f", float(m_modifier.m_amount));
}

void Aura::HandleAuraModRegenInterrupt(bool /*apply*/, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    ((Player*)GetTarget())->UpdateManaRegen();
}

void Aura::HandleAuraModCritPercent(bool apply, bool Real)
{
    Unit *target = GetTarget();

    if (target->GetTypeId() != TYPEID_PLAYER)
        return;

    // apply item specific bonuses for already equipped weapon
    if (Real)
    {
        for(int i = 0; i < MAX_ATTACK; ++i)
            if (Item* pItem = ((Player*)target)->GetWeaponForAttack(WeaponAttackType(i),true,false))
                ((Player*)target)->_ApplyWeaponDependentAuraCritMod(pItem, WeaponAttackType(i), this, apply);
    }

    // mods must be applied base at equipped weapon class and subclass comparison
    // with spell->EquippedItemClass and  EquippedItemSubClassMask and EquippedItemInventoryTypeMask
    // m_modifier.m_miscvalue comparison with item generated damage types

    float amount = float(m_modifier.m_amount);

    if (GetSpellProto()->EquippedItemClass == -1)
    {
        if(IsStacking())
        {
            ((Player*)target)->HandleBaseModValue(CRIT_PERCENTAGE,         FLAT_MOD, amount, apply);
            ((Player*)target)->HandleBaseModValue(OFFHAND_CRIT_PERCENTAGE, FLAT_MOD, amount, apply);
            ((Player*)target)->HandleBaseModValue(RANGED_CRIT_PERCENTAGE,  FLAT_MOD, amount, apply);
        }
        else
        {
            float current = ((Player*)target)->GetBaseModValue(NONSTACKING_CRIT_PERCENTAGE, FLAT_MOD);

            if(amount < current)
                return;

            // unapply old aura
            if(current)
            {
                ((Player*)target)->HandleBaseModValue(CRIT_PERCENTAGE,         FLAT_MOD, current, false);
                ((Player*)target)->HandleBaseModValue(OFFHAND_CRIT_PERCENTAGE, FLAT_MOD, current, false);
                ((Player*)target)->HandleBaseModValue(RANGED_CRIT_PERCENTAGE,  FLAT_MOD, current, false);
            }

            if(!apply)
                amount = target->GetMaxPositiveAuraModifier(SPELL_AURA_MOD_CRIT_PERCENT, true);

            if(amount)
            {
                ((Player*)target)->HandleBaseModValue(CRIT_PERCENTAGE,         FLAT_MOD, amount, true);
                ((Player*)target)->HandleBaseModValue(OFFHAND_CRIT_PERCENTAGE, FLAT_MOD, amount, true);
                ((Player*)target)->HandleBaseModValue(RANGED_CRIT_PERCENTAGE,  FLAT_MOD, amount, true);
            }

            ((Player*)target)->SetBaseModValue(NONSTACKING_CRIT_PERCENTAGE, FLAT_MOD, amount);
        }
    }
    else
    {
        // done in Player::_ApplyWeaponDependentAuraMods
    }
}

void Aura::HandleModHitChance(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();

    if (target->GetTypeId() == TYPEID_PLAYER)
    {
        // stacking check is made further
        ((Player*)target)->UpdateMeleeHitChances();
        ((Player*)target)->UpdateRangedHitChances();
    }
    else
    {
        target->m_modMeleeHitChance = target->GetTotalAuraModifier(SPELL_AURA_MOD_HIT_CHANCE);
        target->m_modRangedHitChance = target->GetTotalAuraModifier(SPELL_AURA_MOD_HIT_CHANCE);
    }
}

void Aura::HandleModSpellHitChance(bool apply, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() == TYPEID_PLAYER)
    {
        ((Player*)GetTarget())->UpdateSpellHitChances();
    }
    else
    {
        GetTarget()->m_modSpellHitChance += apply ? m_modifier.m_amount: (-m_modifier.m_amount);
    }
}

void Aura::HandleModSpellCritChance(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    if (GetTarget()->GetTypeId() == TYPEID_PLAYER)
    {
        ((Player*)GetTarget())->UpdateAllSpellCritChances();
    }
    else
    {
        GetTarget()->m_baseSpellCritChance += apply ? m_modifier.m_amount:(-m_modifier.m_amount);
    }
}

void Aura::HandleModSpellCritChanceShool(bool /*apply*/, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    for(int school = SPELL_SCHOOL_NORMAL; school < MAX_SPELL_SCHOOL; ++school)
        if (m_modifier.m_miscvalue & (1<<school))
            ((Player*)GetTarget())->UpdateSpellCritChance(school);
}

/********************************/
/***         ATTACK SPEED     ***/
/********************************/

void Aura::HandleModCastingSpeed(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();

    if(IsStacking())
        target->ApplyCastTimePercentMod(float(m_modifier.m_amount),apply);
    else
    {
        float amount = float(m_modifier.m_amount);
        bool bIsPositive = amount > 0;

        // don't apply weaker aura
        if((bIsPositive && amount < target->m_modSpellSpeedPctPos) ||
            (!bIsPositive && amount > target->m_modSpellSpeedPctNeg))
        {
            return;
        }

        // unapply old (weaker) aura
        if (bIsPositive)
        {
            if(target->m_modSpellSpeedPctPos)
                target->ApplyCastTimePercentMod(target->m_modSpellSpeedPctPos, false);
        }
        else
        {
            if(target->m_modSpellSpeedPctNeg)
                target->ApplyCastTimePercentMod(target->m_modSpellSpeedPctNeg, false);
        }

        if(!apply)
        {
            if (bIsPositive)
                amount = target->GetMaxPositiveAuraModifier(m_modifier.m_auraname, true);
            else
                amount = target->GetMaxNegativeAuraModifier(m_modifier.m_auraname, true);
        }

        target->ApplyCastTimePercentMod(amount, true);

        if (bIsPositive)
            target->m_modSpellSpeedPctPos = amount;
        else
            target->m_modSpellSpeedPctNeg = amount;
    }
}

void Aura::HandleModMeleeRangedSpeedPct(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();
    target->ApplyAttackTimePercentMod(BASE_ATTACK, float(m_modifier.m_amount), apply);
    target->ApplyAttackTimePercentMod(OFF_ATTACK, float(m_modifier.m_amount), apply);
    target->ApplyAttackTimePercentMod(RANGED_ATTACK, float(m_modifier.m_amount), apply);
}

void Aura::HandleModCombatSpeedPct(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();
    if(IsStacking())
    {
        target->ApplyCastTimePercentMod(m_modifier.m_amount, apply);
        target->ApplyAttackTimePercentMod(BASE_ATTACK, m_modifier.m_amount, apply);
        target->ApplyAttackTimePercentMod(OFF_ATTACK, m_modifier.m_amount, apply);
        target->ApplyAttackTimePercentMod(RANGED_ATTACK, m_modifier.m_amount, apply);
    }
    else
    {
        // Only positive effects are nonstacking in this handler
        float amount = float(m_modifier.m_amount);

        if(amount < target->m_modAttackSpeedPct[NONSTACKING_MOD_ALL])
            return;

        // unapply old aura
        if(target->m_modAttackSpeedPct[NONSTACKING_MOD_ALL])
        {
            target->ApplyCastTimePercentMod(target->m_modAttackSpeedPct[NONSTACKING_MOD_ALL], false);
            target->ApplyAttackTimePercentMod(BASE_ATTACK, target->m_modAttackSpeedPct[NONSTACKING_MOD_ALL], false);
            target->ApplyAttackTimePercentMod(OFF_ATTACK, target->m_modAttackSpeedPct[NONSTACKING_MOD_ALL], false);
            target->ApplyAttackTimePercentMod(RANGED_ATTACK, target->m_modAttackSpeedPct[NONSTACKING_MOD_ALL], false);
        }

        if(!apply)
            amount = target->GetMaxPositiveAuraModifier(GetModifier()->m_auraname, true);

        target->ApplyCastTimePercentMod(amount, true);
        target->ApplyAttackTimePercentMod(BASE_ATTACK, amount, true);
        target->ApplyAttackTimePercentMod(OFF_ATTACK, amount, true);
        target->ApplyAttackTimePercentMod(RANGED_ATTACK, amount, true);

        target->m_modAttackSpeedPct[NONSTACKING_MOD_ALL] = amount;
    }
}

void Aura::HandleModAttackSpeed(bool apply, bool /*Real*/)
{
    GetTarget()->ApplyAttackTimePercentMod(BASE_ATTACK,float(m_modifier.m_amount),apply);
}

void Aura::HandleModMeleeSpeedPct(bool apply, bool /*Real*/)
{
    Unit *target = GetTarget();

    if (IsStacking())
    {
        target->ApplyAttackTimePercentMod(BASE_ATTACK, m_modifier.m_amount, apply);
        target->ApplyAttackTimePercentMod(OFF_ATTACK, m_modifier.m_amount, apply);
    }
    else
    {
        bool bIsPositive = m_modifier.m_amount > 0;

        if((bIsPositive && m_modifier.m_amount < target->m_modAttackSpeedPct[NONSTACKING_POS_MOD_MELEE]) ||
            (!bIsPositive && m_modifier.m_amount > target->m_modAttackSpeedPct[NONSTACKING_NEG_MOD_MELEE]))
            return;

        float amount = float(m_modifier.m_amount);

        // unapply old aura
        if(target->m_modAttackSpeedPct[bIsPositive ? NONSTACKING_POS_MOD_MELEE : NONSTACKING_NEG_MOD_MELEE])
        {
            target->ApplyAttackTimePercentMod(BASE_ATTACK, target->m_modAttackSpeedPct[bIsPositive ? NONSTACKING_POS_MOD_MELEE : NONSTACKING_NEG_MOD_MELEE], false);
            target->ApplyAttackTimePercentMod(OFF_ATTACK, target->m_modAttackSpeedPct[bIsPositive ? NONSTACKING_POS_MOD_MELEE : NONSTACKING_NEG_MOD_MELEE], false);
        }

        if(!apply)
        {
            if (bIsPositive)
                amount = target->GetMaxPositiveAuraModifier(SPELL_AURA_MOD_MELEE_HASTE, true);
            else
                amount = target->GetMaxNegativeAuraModifier(SPELL_AURA_MOD_MELEE_HASTE, true);
        }

        target->ApplyAttackTimePercentMod(BASE_ATTACK, amount, true);
        target->ApplyAttackTimePercentMod(OFF_ATTACK, amount, true);

        target->m_modAttackSpeedPct[bIsPositive ? NONSTACKING_POS_MOD_MELEE : NONSTACKING_NEG_MOD_MELEE] = amount;
    }
}

void Aura::HandleAuraModRangedHaste(bool apply, bool /*Real*/)
{
    GetTarget()->ApplyAttackTimePercentMod(RANGED_ATTACK, float(m_modifier.m_amount), apply);
}

void Aura::HandleRangedAmmoHaste(bool apply, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;
    GetTarget()->ApplyAttackTimePercentMod(RANGED_ATTACK, float(m_modifier.m_amount), apply);
}

/********************************/
/***        ATTACK POWER      ***/
/********************************/

void Aura::HandleAuraModAttackPower(bool apply, bool /*Real*/)
{
    GetTarget()->CheckAuraStackingAndApply(this, UNIT_MOD_ATTACK_POWER, TOTAL_VALUE, float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraModRangedAttackPower(bool apply, bool /*Real*/)
{
    if ((GetTarget()->getClassMask() & CLASSMASK_WAND_USERS)!=0)
        return;

    GetTarget()->CheckAuraStackingAndApply(this, UNIT_MOD_ATTACK_POWER_RANGED, TOTAL_VALUE, float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraModAttackPowerPercent(bool apply, bool /*Real*/)
{
    //UNIT_FIELD_ATTACK_POWER_MULTIPLIER = multiplier - 1
    GetTarget()->CheckAuraStackingAndApply(this, UNIT_MOD_ATTACK_POWER, TOTAL_PCT, float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraModRangedAttackPowerPercent(bool apply, bool /*Real*/)
{
    if ((GetTarget()->getClassMask() & CLASSMASK_WAND_USERS)!=0)
        return;

    //UNIT_FIELD_RANGED_ATTACK_POWER_MULTIPLIER = multiplier - 1
    GetTarget()->CheckAuraStackingAndApply(this, UNIT_MOD_ATTACK_POWER_RANGED, TOTAL_PCT, float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraModRangedAttackPowerOfStatPercent(bool /*apply*/, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    // Recalculate bonus
    if (GetTarget()->GetTypeId() == TYPEID_PLAYER && !(GetTarget()->getClassMask() & CLASSMASK_WAND_USERS))
        ((Player*)GetTarget())->UpdateAttackPowerAndDamage(true);
}

void Aura::HandleAuraModAttackPowerOfStatPercent(bool /*apply*/, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    // Recalculate bonus
    if (GetTarget()->GetTypeId() == TYPEID_PLAYER)
        ((Player*)GetTarget())->UpdateAttackPowerAndDamage(false);
}

void Aura::HandleAuraModAttackPowerOfArmor(bool /*apply*/, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    // Recalculate bonus
    if (GetTarget()->GetTypeId() == TYPEID_PLAYER)
        ((Player*)GetTarget())->UpdateAttackPowerAndDamage(false);
}
/********************************/
/***        DAMAGE BONUS      ***/
/********************************/
void Aura::HandleModDamageDone(bool apply, bool Real)
{
    Unit *target = GetTarget();

    // apply item specific bonuses for already equipped weapon
    if (Real && target->GetTypeId() == TYPEID_PLAYER)
    {
        for(int i = 0; i < MAX_ATTACK; ++i)
            if (Item* pItem = ((Player*)target)->GetWeaponForAttack(WeaponAttackType(i),true,false))
                ((Player*)target)->_ApplyWeaponDependentAuraDamageMod(pItem, WeaponAttackType(i), this, apply);
    }

    // m_modifier.m_miscvalue is bitmask of spell schools
    // 1 ( 0-bit ) - normal school damage (SPELL_SCHOOL_MASK_NORMAL)
    // 126 - full bitmask all magic damages (SPELL_SCHOOL_MASK_MAGIC) including wands
    // 127 - full bitmask any damages
    //
    // mods must be applied base at equipped weapon class and subclass comparison
    // with spell->EquippedItemClass and  EquippedItemSubClassMask and EquippedItemInventoryTypeMask
    // m_modifier.m_miscvalue comparison with item generated damage types

    if ((m_modifier.m_miscvalue & SPELL_SCHOOL_MASK_NORMAL) != 0)
    {
        // apply generic physical damage bonuses including wand case
        if (GetSpellProto()->EquippedItemClass == -1 || target->GetTypeId() != TYPEID_PLAYER)
        {
            target->HandleStatModifier(UNIT_MOD_DAMAGE_MAINHAND, TOTAL_VALUE, float(m_modifier.m_amount), apply);
            target->HandleStatModifier(UNIT_MOD_DAMAGE_OFFHAND, TOTAL_VALUE, float(m_modifier.m_amount), apply);
            target->HandleStatModifier(UNIT_MOD_DAMAGE_RANGED, TOTAL_VALUE, float(m_modifier.m_amount), apply);
        }
        else
        {
            // done in Player::_ApplyWeaponDependentAuraMods
        }

        if (target->GetTypeId() == TYPEID_PLAYER)
        {
            if (m_positive)
                target->ApplyModUInt32Value(PLAYER_FIELD_MOD_DAMAGE_DONE_POS, m_modifier.m_amount, apply);
            else
                target->ApplyModInt32Value(PLAYER_FIELD_MOD_DAMAGE_DONE_NEG, m_modifier.m_amount, apply);
        }
    }

    // Skip non magic case for speedup
    if ((m_modifier.m_miscvalue & SPELL_SCHOOL_MASK_MAGIC) == 0)
        return;

    if (GetSpellProto()->EquippedItemClass != -1 || GetSpellProto()->EquippedItemInventoryTypeMask != 0)
    {
        // wand magic case (skip generic to all item spell bonuses)
        // done in Player::_ApplyWeaponDependentAuraMods

        // Skip item specific requirements for not wand magic damage
        return;
    }

    // Magic damage modifiers implemented in Unit::SpellDamageBonusDone
    // This information for client side use only
    if (target->GetTypeId() == TYPEID_PLAYER)
    {
        if (m_positive)
        {
            for(int i = SPELL_SCHOOL_HOLY; i < MAX_SPELL_SCHOOL; ++i)
            {
                if((m_modifier.m_miscvalue & (1<<i)) != 0)
                    target->ApplyModUInt32Value(PLAYER_FIELD_MOD_DAMAGE_DONE_POS + i, m_modifier.m_amount, apply);
            }
        }
        else
        {
            for(int i = SPELL_SCHOOL_HOLY; i < MAX_SPELL_SCHOOL; ++i)
            {
                if((m_modifier.m_miscvalue & (1<<i)) != 0)
                    target->ApplyModInt32Value(PLAYER_FIELD_MOD_DAMAGE_DONE_NEG + i, m_modifier.m_amount, apply);
            }
        }

        ((Player*)target)->UpdateSpellDamageAndHealingBonus();

        Pet* pet = target->GetPet();
        if (pet)
            pet->UpdateAttackPowerAndDamage();
    }
}

void Aura::HandleModDamagePercentDone(bool apply, bool Real)
{
    DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "AURA MOD DAMAGE type:%u negative:%u", m_modifier.m_miscvalue, m_positive ? 0 : 1);
    Unit *target = GetTarget();

    // apply item specific bonuses for already equipped weapon
    if (Real && target->GetTypeId() == TYPEID_PLAYER)
    {
        for(int i = 0; i < MAX_ATTACK; ++i)
            if (Item* pItem = ((Player*)target)->GetWeaponForAttack(WeaponAttackType(i),true,false))
                ((Player*)target)->_ApplyWeaponDependentAuraDamageMod(pItem, WeaponAttackType(i), this, apply);
    }

    // m_modifier.m_miscvalue is bitmask of spell schools
    // 1 ( 0-bit ) - normal school damage (SPELL_SCHOOL_MASK_NORMAL)
    // 126 - full bitmask all magic damages (SPELL_SCHOOL_MASK_MAGIC) including wand
    // 127 - full bitmask any damages
    //
    // mods must be applied base at equipped weapon class and subclass comparison
    // with spell->EquippedItemClass and  EquippedItemSubClassMask and EquippedItemInventoryTypeMask
    // m_modifier.m_miscvalue comparison with item generated damage types

    if ((m_modifier.m_miscvalue & SPELL_SCHOOL_MASK_NORMAL) != 0)
    {
        // apply generic physical damage bonuses including wand case
        if (GetSpellProto()->EquippedItemClass == -1 || target->GetTypeId() != TYPEID_PLAYER)
        {
            target->HandleStatModifier(UNIT_MOD_DAMAGE_MAINHAND, TOTAL_PCT, float(m_modifier.m_amount), apply);
            target->HandleStatModifier(UNIT_MOD_DAMAGE_OFFHAND, TOTAL_PCT, float(m_modifier.m_amount), apply);
            target->HandleStatModifier(UNIT_MOD_DAMAGE_RANGED, TOTAL_PCT, float(m_modifier.m_amount), apply);
        }
        else
        {
            // done in Player::_ApplyWeaponDependentAuraMods
        }
        // For show in client
        if (target->GetTypeId() == TYPEID_PLAYER)
            target->ApplyModSignedFloatValue(PLAYER_FIELD_MOD_DAMAGE_DONE_PCT, m_modifier.m_amount/100.0f, apply);
    }

    // Skip non magic case for speedup
    if ((m_modifier.m_miscvalue & SPELL_SCHOOL_MASK_MAGIC) == 0)
        return;

    if (GetSpellProto()->EquippedItemClass != -1 || GetSpellProto()->EquippedItemInventoryTypeMask != 0)
    {
        // wand magic case (skip generic to all item spell bonuses)
        // done in Player::_ApplyWeaponDependentAuraMods

        // Skip item specific requirements for not wand magic damage
        return;
    }

    // Magic damage percent modifiers implemented in Unit::SpellDamageBonusDone
    // Send info to client
    if (target->GetTypeId() == TYPEID_PLAYER)
        for(int i = SPELL_SCHOOL_HOLY; i < MAX_SPELL_SCHOOL; ++i)
            target->ApplyModSignedFloatValue(PLAYER_FIELD_MOD_DAMAGE_DONE_PCT + i, m_modifier.m_amount/100.0f, apply);
}

void Aura::HandleModOffhandDamagePercent(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    DEBUG_FILTER_LOG(LOG_FILTER_SPELL_CAST, "AURA MOD OFFHAND DAMAGE");

    GetTarget()->HandleStatModifier(UNIT_MOD_DAMAGE_OFFHAND, TOTAL_PCT, float(m_modifier.m_amount), apply);
}

/********************************/
/***        POWER COST        ***/
/********************************/

void Aura::HandleModPowerCostPCT(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    float amount = m_modifier.m_amount/100.0f;
    for(int i = 0; i < MAX_SPELL_SCHOOL; ++i)
        if (m_modifier.m_miscvalue & (1<<i))
            GetTarget()->ApplyModSignedFloatValue(UNIT_FIELD_POWER_COST_MULTIPLIER + i, amount, apply);
}

void Aura::HandleModPowerCost(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    for(int i = 0; i < MAX_SPELL_SCHOOL; ++i)
        if (m_modifier.m_miscvalue & (1<<i))
            GetTarget()->ApplyModInt32Value(UNIT_FIELD_POWER_COST_MODIFIER + i, m_modifier.m_amount, apply);
}

void Aura::HandleNoReagentUseAura(bool /*Apply*/, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;
    Unit *target = GetTarget();

    if (target->GetTypeId() != TYPEID_PLAYER)
        return;

    ClassFamilyMask mask;
    Unit::AuraList const& noReagent = target->GetAurasByType(SPELL_AURA_NO_REAGENT_USE);
    for(Unit::AuraList::const_iterator i = noReagent.begin(); i !=  noReagent.end(); ++i)
        mask |= (*i)->GetAuraSpellClassMask();

    target->SetUInt64Value(PLAYER_NO_REAGENT_COST_1+0, mask.Flags);
    target->SetUInt32Value(PLAYER_NO_REAGENT_COST_1+2, mask.Flags2);
}

/*********************************************************/
/***                    OTHERS                         ***/
/*********************************************************/

void Aura::HandleShapeshiftBoosts(bool apply)
{
    uint32 spellId1 = 0;
    uint32 spellId2 = 0;
    uint32 HotWSpellId = 0;
    uint32 MasterShaperSpellId = 0;

    ShapeshiftForm form = ShapeshiftForm(GetModifier()->m_miscvalue);

    Unit *target = GetTarget();

    switch(form)
    {
        case FORM_CAT:
            spellId1 = 3025;
            HotWSpellId = 24900;
            MasterShaperSpellId = 48420;
            break;
        case FORM_TREE:
            spellId1 = 34123;
            MasterShaperSpellId = 48422;
            break;
        case FORM_TRAVEL:
            spellId1 = 5419;
            break;
        case FORM_AQUA:
            spellId1 = 5421;
            break;
        case FORM_BEAR:
            spellId1 = 1178;
            spellId2 = 21178;
            HotWSpellId = 24899;
            MasterShaperSpellId = 48418;
            break;
        case FORM_DIREBEAR:
            spellId1 = 9635;
            spellId2 = 21178;
            HotWSpellId = 24899;
            MasterShaperSpellId = 48418;
            break;
        case FORM_BATTLESTANCE:
            spellId1 = 21156;
            break;
        case FORM_DEFENSIVESTANCE:
            spellId1 = 7376;
            break;
        case FORM_BERSERKERSTANCE:
            spellId1 = 7381;
            break;
        case FORM_MOONKIN:
            spellId1 = 24905;
            spellId2 = 69366;
            MasterShaperSpellId = 48421;
            break;
        case FORM_FLIGHT:
            spellId1 = 33948;
            spellId2 = 34764;
            break;
        case FORM_FLIGHT_EPIC:
            spellId1 = 40122;
            spellId2 = 40121;
            break;
        case FORM_METAMORPHOSIS:
            spellId1 = 54817;
            spellId2 = 54879;
            break;
        case FORM_SPIRITOFREDEMPTION:
            spellId1 = 27792;
            spellId2 = 27795;                               // must be second, this important at aura remove to prevent to early iterator invalidation.
            break;
        case FORM_SHADOW:
            spellId1 = 49868;
            spellId2 = 71167;
            break;
        case FORM_GHOSTWOLF:
            spellId1 = 67116;
            break;
        case FORM_AMBIENT:
        case FORM_GHOUL:
        case FORM_STEALTH:
        case FORM_CREATURECAT:
        case FORM_CREATUREBEAR:
        default:
            break;
    }

    if (apply)
    {
        if (spellId1)
        {
            if(target->GetTypeId() == TYPEID_PLAYER)
                ((Player*)target)->RemoveSpellCooldown(spellId1);
            target->CastSpell(target, spellId1, true, NULL, this );
        }
        if (spellId2)
        {
            if(target->GetTypeId() == TYPEID_PLAYER)
                ((Player*)target)->RemoveSpellCooldown(spellId2);
            target->CastSpell(target, spellId2, true, NULL, this);
        }

        if (target->GetTypeId() == TYPEID_PLAYER)
        {
            const PlayerSpellMap& sp_list = ((Player *)target)->GetSpellMap();
            for (PlayerSpellMap::const_iterator itr = sp_list.begin(); itr != sp_list.end(); ++itr)
            {
                if (itr->second.state == PLAYERSPELL_REMOVED) continue;
                if (itr->first==spellId1 || itr->first==spellId2) continue;
                SpellEntry const *spellInfo = sSpellStore.LookupEntry(itr->first);
                if (!spellInfo || !IsNeedCastSpellAtFormApply(spellInfo, form))
                    continue;
                target->CastSpell(target, itr->first, true, NULL, this);
            }
            // remove auras that do not require shapeshift, but are not active in this specific form (like Improved Barkskin)
            Unit::SpellAuraHolderMap& tAuras = target->GetSpellAuraHolderMap();
            for (Unit::SpellAuraHolderMap::iterator itr = tAuras.begin(); itr != tAuras.end();)
            {
                SpellEntry const *spellInfo = itr->second->GetSpellProto();
                if ((itr->second->IsPassive() && spellInfo->HasAttribute(SPELL_ATTR_EX2_NOT_NEED_SHAPESHIFT)
                    && (spellInfo->StancesNot & (1<<(form-1)))) || (spellInfo->Id == 66530 && form == FORM_DIREBEAR))  // Improved Barkskin must not affect Dire Bear Form, but does not have correct data in dbc
                {
                    target->RemoveAurasDueToSpell(itr->second->GetId());
                    itr = tAuras.begin();
                }
                else
                    ++itr;
            }


            // Master Shapeshifter
            if (MasterShaperSpellId)
            {
                Unit::AuraList const& ShapeShifterAuras = target->GetAurasByType(SPELL_AURA_DUMMY);
                for(Unit::AuraList::const_iterator i = ShapeShifterAuras.begin(); i != ShapeShifterAuras.end(); ++i)
                {
                    if ((*i)->GetSpellProto()->SpellIconID == 2851)
                    {
                        int32 ShiftMod = (*i)->GetModifier()->m_amount;
                        target->CastCustomSpell(target, MasterShaperSpellId, &ShiftMod, NULL, NULL, true);
                        break;
                    }
                }
            }

            // Leader of the Pack
            if (((Player*)target)->HasSpell(17007))
            {
                SpellEntry const *spellInfo = sSpellStore.LookupEntry(24932);
                if (spellInfo && (spellInfo->Stances & (1<<(form-1))))
                    target->CastSpell(target, 24932, true, NULL, this);
            }

            // Savage Roar
            if (form == FORM_CAT && ((Player*)target)->HasAura(52610))
                target->CastSpell(target, 62071, true);

            // Survival of the Fittest (Armor part)
            if (form == FORM_BEAR || form == FORM_DIREBEAR)
            {
                Unit::AuraList const& modAuras = target->GetAurasByType(SPELL_AURA_MOD_TOTAL_STAT_PERCENTAGE);
                for (Unit::AuraList::const_iterator i = modAuras.begin(); i != modAuras.end(); ++i)
                {
                    if ((*i)->GetSpellProto()->SpellFamilyName == SPELLFAMILY_DRUID &&
                        (*i)->GetSpellProto()->SpellIconID == 961)
                    {
                        int32 bp = (*i)->GetSpellProto()->CalculateSimpleValue(EFFECT_INDEX_2);
                        if (bp)
                            target->CastCustomSpell(target, 62069, &bp, NULL, NULL, true, NULL, this);
                        break;
                    }
                }
            }

            // Improved Moonkin Form
            if (form == FORM_MOONKIN)
            {
                Unit::AuraList const& dummyAuras = target->GetAurasByType(SPELL_AURA_DUMMY);
                for(Unit::AuraList::const_iterator i = dummyAuras.begin(); i != dummyAuras.end(); ++i)
                {
                    if ((*i)->GetSpellProto()->SpellFamilyName==SPELLFAMILY_DRUID &&
                        (*i)->GetSpellProto()->SpellIconID == 2855)
                    {
                        uint32 spell_id = 0;
                        switch((*i)->GetId())
                        {
                            case 48384:spell_id=50170;break;//Rank 1
                            case 48395:spell_id=50171;break;//Rank 2
                            case 48396:spell_id=50172;break;//Rank 3
                            default:
                                sLog.outError("Aura::HandleShapeshiftBoosts: Not handled rank of IMF (Spell: %u)",(*i)->GetId());
                                break;
                        }

                        if (spell_id)
                            target->CastSpell(target, spell_id, true, NULL, this);
                        break;
                    }
                }
            }

            // Heart of the Wild
            if (HotWSpellId)
            {
                Unit::AuraList const& mModTotalStatPct = target->GetAurasByType(SPELL_AURA_MOD_TOTAL_STAT_PERCENTAGE);
                for(Unit::AuraList::const_iterator i = mModTotalStatPct.begin(); i != mModTotalStatPct.end(); ++i)
                {
                    if ((*i)->GetSpellProto()->SpellIconID == 240 && (*i)->GetModifier()->m_miscvalue == 3)
                    {
                        int32 HotWMod = (*i)->GetModifier()->m_amount;
                        if (GetModifier()->m_miscvalue == FORM_CAT  || GetModifier()->m_miscvalue == FORM_BEAR || GetModifier()->m_miscvalue == FORM_DIREBEAR)
                            HotWMod /= 2;

                        target->CastCustomSpell(target, HotWSpellId, &HotWMod, NULL, NULL, true, NULL, this);
                        break;
                    }
                }
            }
        }
    }
    else
    {
        if (spellId1)
            target->RemoveAurasDueToSpell(spellId1);
        if (spellId2)
            target->RemoveAurasDueToSpell(spellId2);
        if (MasterShaperSpellId)
            target->RemoveAurasDueToSpell(MasterShaperSpellId);

        if (target->GetTypeId() == TYPEID_PLAYER)
        {
            // re-apply passive spells that don't need shapeshift but were inactive in current form:
            const PlayerSpellMap& sp_list = ((Player *)target)->GetSpellMap();
            for (PlayerSpellMap::const_iterator itr = sp_list.begin(); itr != sp_list.end(); ++itr)
            {
                if (itr->second.state == PLAYERSPELL_REMOVED) continue;
                if (itr->first==spellId1 || itr->first==spellId2) continue;
                SpellEntry const *spellInfo = sSpellStore.LookupEntry(itr->first);
                if (!spellInfo || !IsPassiveSpell(spellInfo))
                    continue;
                if (spellInfo->HasAttribute(SPELL_ATTR_EX2_NOT_NEED_SHAPESHIFT) && (spellInfo->StancesNot & (1<<(form-1))))
                    target->CastSpell(target, itr->first, true, NULL, this);
            }
        }

        Unit::SpellAuraHolderMap& tAuras = target->GetSpellAuraHolderMap();
        for (Unit::SpellAuraHolderMap::iterator itr = tAuras.begin(); itr != tAuras.end();)
        {
            if (itr->second->IsRemovedOnShapeLost())
            {
                target->RemoveAurasDueToSpell(itr->second->GetId());
                itr = tAuras.begin();
            }
            else
                ++itr;
        }
    }
}

void Aura::HandleAuraEmpathy(bool apply, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_UNIT)
        return;

    CreatureInfo const * ci = ObjectMgr::GetCreatureTemplate(GetTarget()->GetEntry());
    if (ci && ci->type == CREATURE_TYPE_BEAST)
        GetTarget()->ApplyModUInt32Value(UNIT_DYNAMIC_FLAGS, UNIT_DYNFLAG_SPECIALINFO, apply);
}

void Aura::HandleAuraUntrackable(bool apply, bool /*Real*/)
{
    if (apply)
        GetTarget()->SetByteFlag(UNIT_FIELD_BYTES_1, 2, UNIT_STAND_FLAGS_UNTRACKABLE);
    else
    {
        // do not remove unit flag if there are more than this auraEffect of that kind on unit on unit
        Unit::AuraList const& auras = GetTarget()->GetAurasByType(SPELL_AURA_UNTRACKABLE);
        if ( auras.size() > 1)
            return;

        GetTarget()->RemoveByteFlag(UNIT_FIELD_BYTES_1, 2, UNIT_STAND_FLAGS_UNTRACKABLE);
    }
}

void Aura::HandleAuraModPacify(bool apply, bool Real)
{
    // only at real add/remove aura
    if(!Real)
        return;

    if (!GetTarget())
        return;

    if (apply)
        GetTarget()->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
    else
        if (!GetTarget()->HasAuraType(SPELL_AURA_MOD_PACIFY) &&
            !GetTarget()->HasAuraType(SPELL_AURA_MOD_PACIFY_SILENCE))
            GetTarget()->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_PACIFIED);
}

void Aura::HandleAuraModPacifyAndSilence(bool apply, bool Real)
{
    HandleAuraModPacify(apply, Real);
    HandleAuraModSilence(apply, Real);
}

void Aura::HandleAuraGhost(bool apply, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    if (apply)
    {
        GetTarget()->SetFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST);
    }
    else
    {
        GetTarget()->RemoveFlag(PLAYER_FLAGS, PLAYER_FLAGS_GHOST);
    }
}

void Aura::HandleAuraAllowFlight(bool apply, bool Real)
{
    // all applied/removed only at real aura add/remove
    if (!Real)
        return;

    // allow fly
    WorldPacket data;
    if (apply)
        data.Initialize(SMSG_MOVE_SET_CAN_FLY, 12);
    else
        data.Initialize(SMSG_MOVE_UNSET_CAN_FLY, 12);

    data << GetTarget()->GetPackGUID();
    data << uint32(0);                                      // unk
    GetTarget()->SendMessageToSet(&data, true);
}

void Aura::HandleModRating(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    for (uint32 rating = 0; rating < MAX_COMBAT_RATING; ++rating)
        if (m_modifier.m_miscvalue & (1 << rating))
            ((Player*)GetTarget())->ApplyRatingMod(CombatRating(rating), m_modifier.m_amount, apply);
}

void Aura::HandleModRatingFromStat(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;
    // Just recalculate ratings
    for (uint32 rating = 0; rating < MAX_COMBAT_RATING; ++rating)
        if (m_modifier.m_miscvalue & (1 << rating))
            ((Player*)GetTarget())->ApplyRatingMod(CombatRating(rating), 0, apply);
}

void Aura::HandleForceMoveForward(bool apply, bool Real)
{
    if (!Real)
        return;

    if (apply)
        GetTarget()->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FORCE_MOVE);
    else
        GetTarget()->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FORCE_MOVE);
}

void Aura::HandleAuraModExpertise(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    ((Player*)GetTarget())->UpdateExpertise(BASE_ATTACK);
    ((Player*)GetTarget())->UpdateExpertise(OFF_ATTACK);
}

void Aura::HandleModTargetResistance(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;
    Unit *target = GetTarget();
    // applied to damage as HandleNoImmediateEffect in Unit::CalculateAbsorbAndResist and Unit::CalcArmorReducedDamage
    // show armor penetration
    if (target->GetTypeId() == TYPEID_PLAYER && (m_modifier.m_miscvalue & SPELL_SCHOOL_MASK_NORMAL))
        target->ApplyModInt32Value(PLAYER_FIELD_MOD_TARGET_PHYSICAL_RESISTANCE, m_modifier.m_amount, apply);

    // show as spell penetration only full spell penetration bonuses (all resistances except armor and holy
    if (target->GetTypeId() == TYPEID_PLAYER && (m_modifier.m_miscvalue & SPELL_SCHOOL_MASK_SPELL)==SPELL_SCHOOL_MASK_SPELL)
        target->ApplyModInt32Value(PLAYER_FIELD_MOD_TARGET_RESISTANCE, m_modifier.m_amount, apply);
}

void Aura::HandleShieldBlockValue(bool apply, bool /*Real*/)
{
    BaseModType modType = FLAT_MOD;
    if (m_modifier.m_auraname == SPELL_AURA_MOD_SHIELD_BLOCKVALUE_PCT)
        modType = PCT_MOD;

    if (GetTarget()->GetTypeId() == TYPEID_PLAYER)
        ((Player*)GetTarget())->HandleBaseModValue(SHIELD_BLOCK_VALUE, modType, float(m_modifier.m_amount), apply);
}

void Aura::HandleAuraRetainComboPoints(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    Unit* target = GetTarget();

    // combo points was added in SPELL_EFFECT_ADD_COMBO_POINTS handler
    // remove only if aura expire by time (in case combo points amount change aura removed without combo points lost)
    if (!apply && m_removeMode == AURA_REMOVE_BY_EXPIRE && target->GetComboTargetGuid())
        if (Unit* unit = ObjectAccessor::GetUnit(*GetTarget(),target->GetComboTargetGuid()))
            target->AddComboPoints(unit, -m_modifier.m_amount);
}

void Aura::HandleModUnattackable( bool Apply, bool Real )
{
    if (Real && Apply)
     {
        GetTarget()->CombatStop();
        GetTarget()->RemoveAurasWithInterruptFlags(AURA_INTERRUPT_FLAG_IMMUNE_OR_LOST_SELECTION);
     }
    GetTarget()->ApplyModFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE,Apply);
}

void Aura::HandleSpiritOfRedemption( bool apply, bool Real )
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    Unit *target = GetTarget();

    // prepare spirit state
    if (apply)
    {
        if (target->GetTypeId()==TYPEID_PLAYER)
        {
            // disable breath/etc timers
            ((Player*)target)->StopMirrorTimers();

            // set stand state (expected in this form)
            if (!target->IsStandState())
                target->SetStandState(UNIT_STAND_STATE_STAND);
        }

        target->SetHealth(1);
    }
    // die at aura end
    else
        target->DealDamage(target, target->GetHealth(), NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, GetSpellProto(), false);
}

void Aura::HandleSchoolAbsorb(bool apply, bool Real)
{
    if (!Real)
        return;

    Unit* caster = GetCaster();
    if (!caster)
        return;

    Unit *target = GetTarget();
    SpellEntry const* spellProto = GetSpellProto();
    if (apply)
    {
        // prevent double apply bonuses
        if (target->GetTypeId()!=TYPEID_PLAYER || !((Player*)target)->GetSession()->PlayerLoading())
        {
            float DoneActualBenefit = 0.0f;
            switch(spellProto->SpellFamilyName)
            {
                case SPELLFAMILY_GENERIC:
                    // Stoicism
                    if (spellProto->Id == 70845)
                        DoneActualBenefit = caster->GetMaxHealth() * 0.20f;
                    break;
                case SPELLFAMILY_PRIEST:
                    // Power Word: Shield
                    if (spellProto->GetSpellFamilyFlags().test<CF_PRIEST_POWER_WORD_SHIELD>())
                    {
                        //+80.68% from +spell bonus
                        int32 spellPower = caster->SpellBaseHealingBonusDone(GetSpellSchoolMask(spellProto));
                        float SpellBonus = spellPower * 0.8068f;
                        //Borrowed Time
                        Unit::AuraList const& borrowedTime = caster->GetAurasByType(SPELL_AURA_DUMMY);
                        for(Unit::AuraList::const_iterator itr = borrowedTime.begin(); itr != borrowedTime.end(); ++itr)
                        {
                            SpellEntry const* i_spell = (*itr)->GetSpellProto();
                            if (i_spell->SpellFamilyName==SPELLFAMILY_PRIEST && i_spell->SpellIconID == 2899 && i_spell->EffectMiscValue[(*itr)->GetEffIndex()] == 24)
                            {
                                SpellBonus += spellPower * (*itr)->GetModifier()->m_amount / 100;
                                break;
                            }
                        }
                        // extra absorb from talents
                        int32 BaseBonus = 0, PctAddMod = 0;
                        Unit::AuraList const& pctModAuras = caster->GetAurasByType(SPELL_AURA_ADD_PCT_MODIFIER);
                        for (Unit::AuraList::const_iterator itr = pctModAuras.begin(); itr != pctModAuras.end(); ++itr)
                        {
                            SpellEntry const* i_spell = (*itr)->GetSpellProto();
                            if (i_spell->SpellFamilyName != SPELLFAMILY_PRIEST || (*itr)->GetEffIndex() != EFFECT_INDEX_0)
                                continue;
                            // Twin Disciplines / Spiritual Healing
                            if (i_spell->SpellIconID == 2292 || i_spell->SpellIconID == 46)
                                PctAddMod += (*itr)->GetModifier()->m_amount;
                            // Improved Power Word: Shield
                            else if (i_spell->SpellIconID == 566)
                                SpellBonus *= (100.0f + (*itr)->GetModifier()->m_amount) / 100.0f;
                            // Item - Priest T10 Healer 4P Bonus
                            else if (i_spell->Id == 70798)
                            {
                                BaseBonus -= m_modifier.m_amount * (*itr)->GetModifier()->m_amount / 100;   // base bonus already added as SPELLMOD_ALL_EFFECTS
                                PctAddMod += (*itr)->GetModifier()->m_amount;
                            }
                        }
                        Unit::AuraList const& healingPctAuras = caster->GetAurasByType(SPELL_AURA_MOD_HEALING_DONE_PERCENT);
                        for (Unit::AuraList::const_iterator itr = healingPctAuras.begin(); itr != healingPctAuras.end(); ++itr)
                        {
                            SpellEntry const* i_spell = (*itr)->GetSpellProto();
                            // Focused Power
                            if (i_spell->SpellFamilyName == SPELLFAMILY_PRIEST && i_spell->SpellIconID == 2210)
                            {
                                PctAddMod += (*itr)->GetModifier()->m_amount;
                                break;
                            }
                        }
                        if (PctAddMod)
                        {
                            BaseBonus += m_modifier.m_amount * PctAddMod / 100;
                            SpellBonus *= (100.0f + PctAddMod) / 100.0f;
                        }
                        DoneActualBenefit = BaseBonus + SpellBonus;
                    }

                    break;
                case SPELLFAMILY_MAGE:
                    // Frost Ward, Fire Ward
                    if (spellProto->GetSpellFamilyFlags().test<CF_MAGE_FIRE_WARD, CF_MAGE_FROST_WARD>())
                        //+10% from +spell bonus
                        DoneActualBenefit = caster->SpellBaseDamageBonusDone(GetSpellSchoolMask(spellProto)) * 0.1f;
                    // Ice Barrier
                    else if (spellProto->GetSpellFamilyFlags().test<CF_MAGE_ICE_BARRIER>())
                        //+80.67% from +spell bonus
                        DoneActualBenefit = caster->SpellBaseDamageBonusDone(GetSpellSchoolMask(spellProto)) * 0.8067f;
                    break;
                case SPELLFAMILY_WARLOCK:
                    // Shadow Ward
                    if (spellProto->GetSpellFamilyFlags().test<CF_WARLOCK_MISC_BUFFS>())
                        //+30% from +spell bonus
                        DoneActualBenefit = caster->SpellBaseDamageBonusDone(GetSpellSchoolMask(spellProto)) * 0.30f;
                    break;
                case SPELLFAMILY_PALADIN:
                    // Sacred Shield
                    // (check not strictly needed, only Sacred Shield has SPELL_AURA_SCHOOL_ABSORB in SPELLFAMILY_PALADIN at this time)
                    if (spellProto->GetSpellFamilyFlags().test<CF_PALADIN_SACRED_SHIELD>())
                    {
                        // +75% from spell power
                        DoneActualBenefit = caster->SpellBaseHealingBonusDone(GetSpellSchoolMask(spellProto)) * 0.75f;
                    }
                    break;
                default:
                    break;
            }

            DoneActualBenefit *= caster->CalculateLevelPenalty(GetSpellProto());

            m_modifier.m_amount += (int32)DoneActualBenefit;
            m_modifier.m_baseamount += (int32)DoneActualBenefit;
        }
    }
    else
    {
        if (caster && caster->GetTypeId() == TYPEID_PLAYER && spellProto->Id == 47788 &&
            m_removeMode == AURA_REMOVE_BY_EXPIRE)
        {
            if (Aura *aur = caster->GetAura(63231, EFFECT_INDEX_0))
            {
                ((Player*)caster)->SendModifyCooldown(spellProto->Id,-aur->GetSpellProto()->CalculateSimpleValue(EFFECT_INDEX_0)*IN_MILLISECONDS);
            }
        }
        // Shield of Runes (Runemaster Molgeim: Ulduar)
        else if ((GetId() == 62274 || GetId() == 63489) && m_removeMode == AURA_REMOVE_BY_SHIELD_BREAK)
        {
            uint32 trigger_spell_Id = GetId() == 62274 ? 62277 : 63967;
            target->CastSpell(target, trigger_spell_Id, true);
        }
    }
}

void Aura::PeriodicTick()
{
    Unit* target = GetTarget();
    SpellAuraHolderPtr holder = GetHolder();
    SpellEntry const* spellProto = GetSpellProto();

    if (!holder || !target || !spellProto)
        return;

    if (target->IsImmuneToSpell(spellProto, GetAffectiveCaster() ? GetAffectiveCaster()->IsFriendlyTo(target) : true))
        return;

    switch(m_modifier.m_auraname)
    {
        case SPELL_AURA_PERIODIC_DAMAGE:
        case SPELL_AURA_PERIODIC_DAMAGE_PERCENT:
        {
            // don't damage target if not alive, possible death persistent effects
            if (!target->IsInWorld() ||  !target->isAlive())
                return;

            Unit* pCaster = GetAffectiveCaster();
            if (!pCaster)
                return;

            if (!pCaster->IsInWorld())
                return;

            if (spellProto->Effect[GetEffIndex()] == SPELL_EFFECT_PERSISTENT_AREA_AURA &&
                pCaster->SpellHitResult(target, spellProto) != SPELL_MISS_NONE)
                return;

            // Check for immune (not use charges)
            if (IsSpellCauseDamage(spellProto) && target->IsImmunedToDamage(GetSpellSchoolMask(spellProto)))
                return;

            // some auras remove at specific health level or more
            switch (GetId())
            {
                case 31956:
                case 35321:
                case 38363:
                case 38801:
                case 39215:
                case 43093:
                case 48920:
                case 70292:
                case 71316:
                case 71317:
                {
                    if (target->GetHealth() == target->GetMaxHealth() )
                    {
                        target->RemoveAurasDueToSpell(GetId());
                        return;
                    }
                    break;
                }
                case 38772:
                {
                    uint32 percent =
                        GetEffIndex() < EFFECT_INDEX_2 && spellProto->Effect[GetEffIndex()] == SPELL_EFFECT_DUMMY ?
                        pCaster->CalculateSpellDamage(target, spellProto, SpellEffectIndex(GetEffIndex() + 1)) :
                        100;
                    if (target->GetHealth() * 100 >= target->GetMaxHealth() * percent )
                    {
                        target->RemoveAurasDueToSpell(GetId());
                        return;
                    }
                    break;
                }
                case 70541: // Infest (Lich King)
                case 73779:
                case 73780:
                case 73781:
                {
                    if (target->GetHealth() >= target->GetMaxHealth() * 0.9f )
                    {
                        target->RemoveAurasDueToSpell(GetId());
                        return;
                    }
                    else
                    {
                        // increasing damage (15% more each tick)
                        // don't increase first tick damage
                        if (GetModifier()->m_miscvalue > 0)
                            GetModifier()->m_amount = GetModifier()->m_amount * 1.15f;
                        else
                            GetModifier()->m_miscvalue += 1;
                    }
                    break;
                }
                case 70672: // Gaseous Bloat (Putricide)
                case 72455:
                case 72832:
                case 72833:
                {
                    // drop 1 stack
                    if (GetHolder()->ModStackAmount(-1))
                    {
                        target->RemoveAurasDueToSpell(GetId());
                        return;
                    }

                    break;
                }
                case 74562: // SPELL_FIERY_COMBUSTION - Ruby sanctum boss Halion, added mark (74567, dummy) every tick
                {
                    target->CastSpell(target, 74567, true, NULL, NULL, GetCasterGuid());
                    break;
                }
                case 74792: // SPELL_SOUL_CONSUMPTION - Ruby sanctum boss Halion, added mark (74795, dummy) every tick
                {
                    target->CastSpell(target, 74795, true, NULL, NULL, GetCasterGuid());
                    break;
                }
                case 67297:
                case 65950:
                    pCaster->CastSpell(target, 65951, true);
                    break;
                case 66001:
                case 67282:
                    pCaster->CastSpell(target, 66002, true);
                    break;
                case 67281:
                case 67283:
                    pCaster->CastSpell(target, 66000, true);
                    break;
                case 67296:
                case 67298:
                    pCaster->CastSpell(target, 65952, true);
                    break;
                // Unbound Plague (Putricide)
                case 70911:
                case 72854:
                case 72855:
                case 72856:
                    m_modifier.m_miscvalue += 1; // store ticks number in miscvalue
                    m_modifier.m_amount = m_modifier.m_baseamount * pow(2.7f, m_modifier.m_miscvalue * 0.223f);
                    break;
                // Boiling Blood (Saurfang)
                case 72385:
                case 72441:
                case 72442:
                case 72443:
                    target->CastSpell(target, 72202, true); // Blood Link
                    break;
                default:
                    break;
            }

            DamageInfo damageInfo = DamageInfo(pCaster, target, spellProto);
            damageInfo.CleanDamage(0, 0, BASE_ATTACK, MELEE_HIT_NORMAL);
            damageInfo.damageType = DOT;

            // ignore non positive values (can be result apply spellmods to aura damage
            uint32 amount = m_modifier.m_amount > 0 ? m_modifier.m_amount : 0;

            if (m_modifier.m_auraname == SPELL_AURA_PERIODIC_DAMAGE)
                damageInfo.damage = amount;
            else
                damageInfo.damage = uint32(target->GetMaxHealth()*amount/100);

            // SpellDamageBonus for magic spells
            if (spellProto->DmgClass == SPELL_DAMAGE_CLASS_NONE || spellProto->DmgClass == SPELL_DAMAGE_CLASS_MAGIC)
                target->SpellDamageBonusTaken(&damageInfo,GetStackAmount());
            // MeleeDamagebonus for weapon based spells
            else
            {
                damageInfo.attackType = GetWeaponAttackType(spellProto);
                target->MeleeDamageBonusTaken(&damageInfo, GetStackAmount());
            }

            // Calculate armor mitigation if it is a physical spell
            // But not for bleed mechanic spells
            if ((GetSpellSchoolMask(spellProto) & SPELL_SCHOOL_MASK_NORMAL) &&
                GetEffectMechanic(spellProto, m_effIndex) != MECHANIC_BLEED)
            {
                uint32 pdamageReductedArmor = pCaster->CalcArmorReducedDamage(target, damageInfo.damage);
                damageInfo.cleanDamage += damageInfo.damage - pdamageReductedArmor;
                damageInfo.damage = pdamageReductedArmor;
            }

            // Curse of Agony damage-per-tick calculation
            if (spellProto->SpellFamilyName==SPELLFAMILY_WARLOCK && spellProto->GetSpellFamilyFlags().test<CF_WARLOCK_CURSE_OF_AGONY>() && spellProto->SpellIconID==544)
            {
                // 1..4 ticks, 1/2 from normal tick damage
                if (GetAuraTicks() <= 4)
                    damageInfo.damage = damageInfo.damage/2;
                // 9..12 ticks, 3/2 from normal tick damage
                else if (GetAuraTicks() >= 9)
                    damageInfo.damage += (damageInfo.damage + 1) / 2;       // +1 prevent 0.5 damage possible lost at 1..4 ticks
                // 5..8 ticks have normal tick damage
            }

            // This method can modify pdamage
            bool isCrit = IsCritFromAbilityAura(pCaster, &damageInfo);

            // send critical in hit info for threat calculation
            if (isCrit)
            {
                damageInfo.hitOutCome = MELEE_HIT_CRIT;
                // Resilience - reduce crit damage
                damageInfo.damage -= target->GetSpellCritDamageReduction(damageInfo.damage);
            }

            // only from players
            // FIXME: need use SpellDamageBonus instead?
            if (pCaster->GetTypeId() == TYPEID_PLAYER)
                damageInfo.damage -= target->GetSpellDamageReduction(damageInfo.damage);

            if (GetSpellProto()->Id == 50344) // Dream Funnel Oculus drake spell
                damageInfo.damage = uint32(pCaster->GetMaxHealth()*0.05f);

            target->CalculateDamageAbsorbAndResist(pCaster, &damageInfo, !GetSpellProto()->HasAttribute(SPELL_ATTR_EX_CANT_REFLECTED));

            DETAIL_FILTER_LOG(LOG_FILTER_PERIODIC_AFFECTS, "PeriodicTick: %s attacked %s for %u dmg inflicted by %u abs is %u",
                GetAffectiveCasterGuid().GetString().c_str(), target->GetGuidStr().c_str(), damageInfo.damage, GetId(), damageInfo.absorb);

            pCaster->DealDamageMods(&damageInfo);

            uint32 overkill = damageInfo.damage > target->GetHealth() ? damageInfo.damage - target->GetHealth() : 0;
            SpellPeriodicAuraLogInfo pInfo(this, damageInfo.damage, overkill, damageInfo.absorb, damageInfo.resist, 0.0f, isCrit);
            target->SendPeriodicAuraLog(&pInfo);

            // Set trigger flag
            damageInfo.procAttacker = PROC_FLAG_ON_DO_PERIODIC; //  | PROC_FLAG_SUCCESSFUL_HARMFUL_SPELL_HIT;
            damageInfo.procVictim   = PROC_FLAG_ON_TAKE_PERIODIC;// | PROC_FLAG_TAKEN_HARMFUL_SPELL_HIT;
            damageInfo.procEx = isCrit ? PROC_EX_CRITICAL_HIT : PROC_EX_NORMAL_HIT;

            // damage may be changed in DealDamageMods above, so change flags
            if (!damageInfo.damage)
                damageInfo.procEx     &= ~PROC_EX_DIRECT_DAMAGE;
            else
            {
                damageInfo.procVictim |= PROC_FLAG_TAKEN_ANY_DAMAGE;
                damageInfo.procEx     |= PROC_EX_DIRECT_DAMAGE;
            }

            pCaster->ProcDamageAndSpell(&damageInfo);
            pCaster->DealDamage(target, &damageInfo, true);

            // Drain Soul (chance soul shard)
            if (pCaster->GetTypeId() == TYPEID_PLAYER && spellProto->SpellFamilyName == SPELLFAMILY_WARLOCK && spellProto->GetSpellFamilyFlags().test<CF_WARLOCK_DRAIN_SOUL>())
            {
                // Only from non-grey units
                if (roll_chance_i(10) &&                    // 1-2 from drain with final and without glyph, 0-1 from damage
                    ((Player*)pCaster)->isHonorOrXPTarget(target) &&
                    (target->GetTypeId() != TYPEID_UNIT || ((Player*)pCaster)->isAllowedToLoot((Creature*)target)))
                {
                    pCaster->CastSpell(pCaster, 43836, true, NULL, this);
                }
            }

            break;
        }
        case SPELL_AURA_PERIODIC_LEECH:
        case SPELL_AURA_PERIODIC_HEALTH_FUNNEL:
        {
            // don't damage target if not alive, possible death persistent effects
            if (!target->IsInWorld() ||  !target->isAlive())
                return;

            Unit *pCaster = GetAffectiveCaster();
            if (!pCaster)
                return;

            if (!pCaster->IsInWorld() || !pCaster->isAlive())
                return;

            if (spellProto->Effect[GetEffIndex()] == SPELL_EFFECT_PERSISTENT_AREA_AURA &&
                pCaster->SpellHitResult(target, spellProto) != SPELL_MISS_NONE)
                return;

            // Check for immune
            if (IsSpellCauseDamage(spellProto) && target->IsImmunedToDamage(GetSpellSchoolMask(spellProto)))
                return;

            DamageInfo damageInfo = DamageInfo(pCaster, target, spellProto);
            damageInfo.CleanDamage(0, 0, BASE_ATTACK, MELEE_HIT_NORMAL );
            damageInfo.damageType = DOT;

            damageInfo.damage = m_modifier.m_amount > 0 ? m_modifier.m_amount : 0;

            //Calculate armor mitigation if it is a physical spell
            if (GetSpellSchoolMask(spellProto) & SPELL_SCHOOL_MASK_NORMAL)
            {
                uint32 pdamageReductedArmor = pCaster->CalcArmorReducedDamage(target, damageInfo.damage);
                damageInfo.cleanDamage += damageInfo.damage - pdamageReductedArmor;
                damageInfo.damage = pdamageReductedArmor;
            }

            target->SpellDamageBonusTaken(&damageInfo, GetStackAmount());

            bool isCrit = IsCritFromAbilityAura(pCaster, &damageInfo);

            // send critical in hit info for threat calculation
            if (isCrit)
            {
                damageInfo.hitOutCome = MELEE_HIT_CRIT;
                // Resilience - reduce crit damage
                damageInfo.damage -= target->GetSpellCritDamageReduction(damageInfo.damage);
            }

            // only from players
            // FIXME: need use SpellDamageBonus instead?
            if (GetAffectiveCasterGuid().IsPlayer())
                damageInfo.damage -= target->GetSpellDamageReduction(damageInfo.damage);

            target->CalculateDamageAbsorbAndResist(pCaster, &damageInfo, !spellProto->HasAttribute(SPELL_ATTR_EX_CANT_REFLECTED));

            DETAIL_FILTER_LOG(LOG_FILTER_PERIODIC_AFFECTS, "PeriodicTick: %s health leech of %s for %u dmg inflicted by %u abs is %u",
                GetAffectiveCasterGuid().GetString().c_str(), target->GetGuidStr().c_str(), damageInfo.damage, GetId(),damageInfo.absorb);

            pCaster->DealDamageMods(&damageInfo);

            pCaster->SendSpellNonMeleeDamageLog(target, GetId(), damageInfo.damage, damageInfo.SchoolMask(), damageInfo.absorb, damageInfo.resist, false, 0, isCrit);

            // Set trigger flag
            damageInfo.procAttacker = PROC_FLAG_ON_DO_PERIODIC; //  | PROC_FLAG_SUCCESSFUL_HARMFUL_SPELL_HIT;
            damageInfo.procVictim   = PROC_FLAG_ON_TAKE_PERIODIC;// | PROC_FLAG_TAKEN_HARMFUL_SPELL_HIT;
            damageInfo.procEx = isCrit ? PROC_EX_CRITICAL_HIT : PROC_EX_NORMAL_HIT;

            // damage may be changed in DealDamageMods above, so change flags
            if (!damageInfo.damage)
                damageInfo.procEx     &= ~PROC_EX_DIRECT_DAMAGE;
            else
            {
                damageInfo.procVictim |= PROC_FLAG_TAKEN_ANY_DAMAGE;
                damageInfo.procEx     |= PROC_EX_DIRECT_DAMAGE;
            }

            pCaster->ProcDamageAndSpell(&damageInfo);
            int32 new_damage = pCaster->DealDamage(target, &damageInfo, false);

            if (!target->isAlive() && pCaster->IsNonMeleeSpellCasted(false))
                for (uint32 i = CURRENT_FIRST_NON_MELEE_SPELL; i < CURRENT_MAX_SPELL; ++i)
                    if (Spell* spell = pCaster->GetCurrentSpell(CurrentSpellTypes(i)))
                        if (spell->m_spellInfo->Id == GetId())
                            spell->cancel();

            float multiplier = spellProto->EffectMultipleValue[GetEffIndex()] > 0 ? spellProto->EffectMultipleValue[GetEffIndex()] : 1;

            if (Player* modOwner = pCaster->GetSpellModOwner())
                modOwner->ApplySpellMod(GetId(), SPELLMOD_MULTIPLE_VALUE, multiplier);

            int32 heal = pCaster->SpellHealingBonusTaken(pCaster, spellProto, int32(new_damage * multiplier), DOT, GetStackAmount());

            uint32 absorbHeal = 0;
            pCaster->CalculateHealAbsorb(heal, &absorbHeal);

            int32 gain = pCaster->DealHeal(pCaster, heal - absorbHeal, spellProto, false, absorbHeal);
            pCaster->getHostileRefManager().threatAssist(pCaster, gain * 0.5f * sSpellMgr.GetSpellThreatMultiplier(spellProto), spellProto);
            break;
        }
        case SPELL_AURA_PERIODIC_HEAL:
        case SPELL_AURA_OBS_MOD_HEALTH:
        {
            // don't heal target if not alive, mostly death persistent effects from items
            if (!target->isAlive())
                return;

            Unit *pCaster = GetAffectiveCaster();
            if (!pCaster)
                return;

            // heal for caster damage (must be alive)
            if (target != pCaster && spellProto->SpellVisual[0] == 163 && !pCaster->isAlive())
                return;

            DamageInfo damageInfo = DamageInfo(pCaster, target, spellProto);
            damageInfo.damageType = NODAMAGE;

            // ignore non positive values (can be result apply spellmods to aura damage
            uint32 amount  = m_modifier.m_amount > 0 ? m_modifier.m_amount : 0;

            if (m_modifier.m_auraname == SPELL_AURA_OBS_MOD_HEALTH)
                damageInfo.damage = uint32(target->GetMaxHealth() * amount / 100);
            else
            {
                damageInfo.damage = amount;
                // Wild Growth (1/7 - 6 + 2*ramainTicks) %
                if (spellProto->SpellFamilyName == SPELLFAMILY_DRUID && spellProto->SpellIconID == 2864)
                {
                    int32 ticks = GetAuraMaxTicks();
                    int32 remainingTicks = ticks - GetAuraTicks();
                    int32 addition = int32(amount)*ticks*(-6+2*remainingTicks)/100;

                    if (GetAuraTicks() > 1 && ticks > 1)
                        // Item - Druid T10 Restoration 2P Bonus
                        if (Aura *aura = pCaster->GetAura(70658, EFFECT_INDEX_0))
                            addition += abs(int32((addition * aura->GetModifier()->m_amount) / ((ticks-1)* 100)));

                    damageInfo.damage = damageInfo.damage + addition;
                }
            }
            damageInfo.CleanDamage(-int32(damageInfo.damage), 0, BASE_ATTACK, MELEE_HIT_NORMAL);

            damageInfo.damage = target->SpellHealingBonusTaken(pCaster, spellProto, damageInfo.damage, DOT, GetStackAmount());

            // This method can modify pdamage
            bool isCrit = IsCritFromAbilityAura(pCaster, &damageInfo);

            pCaster->CalculateHealAbsorb(damageInfo.damage, &damageInfo.absorb);
            damageInfo.damage -= damageInfo.absorb;

            DETAIL_FILTER_LOG(LOG_FILTER_PERIODIC_AFFECTS, "PeriodicTick: %s heal of %s for %u health  (absorbed %u) inflicted by %u",
                GetAffectiveCasterGuid().GetString().c_str(), target->GetGuidStr().c_str(), damageInfo.damage, damageInfo.absorb, GetId());

            int32 gain = target->ModifyHealth(damageInfo.damage);
            damageInfo.cleanDamage = damageInfo.damage;
            damageInfo.damage = uint32(gain);
            uint32 overDamage = damageInfo.cleanDamage - damageInfo.damage;
            SpellPeriodicAuraLogInfo pInfo(this, damageInfo.cleanDamage, overDamage, damageInfo.absorb, 0, 0.0f, isCrit);
            target->SendPeriodicAuraLog(&pInfo);

            // Set trigger flag
            damageInfo.procAttacker = PROC_FLAG_ON_DO_PERIODIC;
            damageInfo.procVictim   = PROC_FLAG_ON_TAKE_PERIODIC;
            damageInfo.procEx = PROC_EX_PERIODIC_POSITIVE | (isCrit ? PROC_EX_CRITICAL_HIT : PROC_EX_NORMAL_HIT);

            pCaster->ProcDamageAndSpell(&damageInfo);

            // add HoTs to amount healed in bgs
            if (pCaster->GetTypeId() == TYPEID_PLAYER )
                if ( BattleGround *bg = ((Player*)pCaster)->GetBattleGround() )
                    bg->UpdatePlayerScore(((Player*)pCaster), SCORE_HEALING_DONE, gain);

            target->getHostileRefManager().threatAssist(pCaster, float(gain) * 0.5f * sSpellMgr.GetSpellThreatMultiplier(spellProto), spellProto);

            // heal for caster damage (Health funnel only! spellProto->SpellVisual[0] == 163 wrong - some repair spells here!)
            if (target != pCaster && spellProto->GetSpellFamilyFlags().test<CF_WARLOCK_HEALTH_FUNNEL>())
            {
                uint32 dmg = spellProto->manaPerSecond;
                if (pCaster->GetHealth() <= dmg && pCaster->GetTypeId()==TYPEID_PLAYER)
                {
                    pCaster->RemoveAurasDueToSpell(GetId());

                    // finish current generic/channeling spells, don't affect autorepeat
                    pCaster->FinishSpell(CURRENT_GENERIC_SPELL);
                    pCaster->FinishSpell(CURRENT_CHANNELED_SPELL);
                }
                else
                {
                    DamageInfo funneldamageInfo = DamageInfo(pCaster, pCaster, spellProto);
                    funneldamageInfo.damage = gain;
                    funneldamageInfo.absorb = 0;
                    funneldamageInfo.damageType = DOT;
                    pCaster->DealDamageMods(&funneldamageInfo);
                    pCaster->SendSpellNonMeleeDamageLog(pCaster, GetId(), funneldamageInfo.damage, GetSpellSchoolMask(spellProto), funneldamageInfo.absorb, 0, false, 0, false);
                    pCaster->DealDamage(pCaster, &funneldamageInfo, true);
                }
            }

            // Light's Favor (Lich King)
            // recalculate bonus damage done after each tick
            if (GetId() == 69382)
            {
                if (Aura *aur = GetHolder()->GetAuraByEffectIndex(EFFECT_INDEX_1))
                    aur->GetModifier()->m_amount = int32(target->GetHealthPercent());
            }
            else if (GetId() == 20578 || GetId() == 52749 || GetId() == 54045)
            {
                // cannibalize anim
                target->HandleEmoteCommand(EMOTE_STATE_CANNIBALIZE);
            }


//            uint32 procAttacker = PROC_FLAG_ON_DO_PERIODIC;//   | PROC_FLAG_SUCCESSFUL_HEAL;
//            uint32 procVictim   = 0;//ROC_FLAG_ON_TAKE_PERIODIC | PROC_FLAG_TAKEN_HEAL;
            // ignore item heals
//            if (procSpell && !haveCastItem)
//                pCaster->ProcDamageAndSpell(target, procAttacker, procVictim, PROC_EX_NORMAL_HIT, pdamage, BASE_ATTACK, spellProto);
            break;
        }
        case SPELL_AURA_PERIODIC_MANA_LEECH:
        {
            // don't damage target if not alive, possible death persistent effects
            if (!target->isAlive())
                return;

            // don't energize isolated units (banished)
            if (target->hasUnitState(UNIT_STAT_ISOLATED))
                return;

            if (m_modifier.m_miscvalue < 0 || m_modifier.m_miscvalue >= MAX_POWERS)
                return;

            Powers power = Powers(m_modifier.m_miscvalue);

            // power type might have changed between aura applying and tick (druid's shapeshift)
            if (target->getPowerType() != power)
                return;

            Unit* pCaster = GetAffectiveCaster();
            if (!pCaster)
                return;

            if (!pCaster->isAlive())
                return;

            if (GetSpellProto()->Effect[GetEffIndex()] == SPELL_EFFECT_PERSISTENT_AREA_AURA &&
                pCaster->SpellHitResult(target, spellProto) != SPELL_MISS_NONE)
                return;

            // Check for immune (not use charges)
            if (IsSpellCauseDamage(spellProto) && target->IsImmunedToDamage(GetSpellSchoolMask(spellProto)))
                return;

            // ignore non positive values (can be result apply spellmods to aura damage
            uint32 pdamage = m_modifier.m_amount > 0 ? m_modifier.m_amount : 0;

            // Special case: draining x% of mana (up to a maximum of 2*x% of the caster's maximum mana)
            // It's mana percent cost spells, m_modifier.m_amount is percent drain from target
            if (spellProto->ManaCostPercentage)
            {
                // max value
                uint32 maxmana = pCaster->GetMaxPower(power)  * pdamage * 2 / 100;
                pdamage = target->GetMaxPower(power) * pdamage / 100;
                if (pdamage > maxmana)
                    pdamage = maxmana;
            }

            DETAIL_FILTER_LOG(LOG_FILTER_PERIODIC_AFFECTS, "PeriodicTick: %s power leech of %s for %u dmg inflicted by %u",
                GetAffectiveCasterGuid().GetString().c_str(), target->GetGuidStr().c_str(), pdamage, GetId());

            int32 drain_amount = target->GetPower(power) > pdamage ? pdamage : target->GetPower(power);

            // resilience reduce mana draining effect at spell crit damage reduction (added in 2.4)
            if (power == POWER_MANA)
                drain_amount -= target->GetSpellCritDamageReduction(drain_amount);

            target->ModifyPower(power, -drain_amount);

            float gain_multiplier = 0.0f;

            if (pCaster->GetMaxPower(power) > 0)
            {
                gain_multiplier = spellProto->EffectMultipleValue[GetEffIndex()];

                if (Player *modOwner = pCaster->GetSpellModOwner())
                    modOwner->ApplySpellMod(GetId(), SPELLMOD_MULTIPLE_VALUE, gain_multiplier);
            }

            SpellPeriodicAuraLogInfo pInfo(this, drain_amount, 0, 0, 0, gain_multiplier);
            target->SendPeriodicAuraLog(&pInfo);

            if (int32 gain_amount = int32(drain_amount * gain_multiplier))
            {
                int32 gain = pCaster->ModifyPower(power, gain_amount);

                if (GetId() == 5138)                        // Drain Mana
                    if (Aura* petPart = GetHolder()->GetAuraByEffectIndex(EFFECT_INDEX_1))
                        if (int pet_gain = gain_amount * petPart->GetModifier()->m_amount / 100)
                            pCaster->CastCustomSpell(pCaster, 32554, &pet_gain, NULL, NULL, true);

                target->AddThreat(pCaster, float(gain) * 0.5f, pInfo.critical, GetSpellSchoolMask(spellProto), spellProto);
                if (pCaster->GetTypeId() == TYPEID_PLAYER && spellProto->Id == 5138 && pCaster->HasSpell(30326))
                    if (pCaster->GetPet())
                    {
                        GroupPetList m_groupPets = pCaster->GetPets();
                        if (!m_groupPets.empty())
                        {
                            for (GroupPetList::const_iterator itr = m_groupPets.begin(); itr != m_groupPets.end(); ++itr)
                                if (Pet* _pet = pCaster->GetMap()->GetPet(*itr))
                                    if (_pet && _pet->isAlive())
                                        pCaster->CastCustomSpell(_pet, 32554, &gain_amount, NULL, NULL, true, NULL, NULL, pCaster->GetObjectGuid());
                        }
                    }

            }

            // Some special cases
            switch (GetId())
            {
                case 32960:                                 // Mark of Kazzak
                {
                    if (target->GetTypeId() == TYPEID_PLAYER && target->getPowerType() == POWER_MANA)
                    {
                        // Drain 5% of target's mana
                        pdamage = target->GetMaxPower(POWER_MANA) * 5 / 100;
                        drain_amount = target->GetPower(POWER_MANA) > pdamage ? pdamage : target->GetPower(POWER_MANA);
                        target->ModifyPower(POWER_MANA, -drain_amount);

                        SpellPeriodicAuraLogInfo pInfo(this, drain_amount, 0, 0, 0, 0.0f);
                        target->SendPeriodicAuraLog(&pInfo);
                    }
                    // no break here
                }
                case 21056:                                 // Mark of Kazzak
                case 31447:                                 // Mark of Kaz'rogal
                {
                    uint32 triggerSpell = 0;
                    switch (GetId())
                    {
                        case 21056: triggerSpell = 21058; break;
                        case 31447: triggerSpell = 31463; break;
                        case 32960: triggerSpell = 32961; break;
                    }
                    if (target->GetTypeId() == TYPEID_PLAYER && target->GetPower(power) == 0)
                    {
                        target->CastSpell(target, triggerSpell, true, NULL, this);
                        target->RemoveAurasDueToSpell(GetId());
                    }
                    break;
                }
            }
            break;
        }
        case SPELL_AURA_PERIODIC_ENERGIZE:
        {
            // don't energize target if not alive, possible death persistent effects
            if (!target->isAlive())
                return;

            // don't energize isolated units (banished)
            if (target->hasUnitState(UNIT_STAT_ISOLATED))
                return;

            // ignore non positive values (can be result apply spellmods to aura damage
            uint32 pdamage = m_modifier.m_amount > 0 ? m_modifier.m_amount : 0;

            DETAIL_FILTER_LOG(LOG_FILTER_PERIODIC_AFFECTS, "PeriodicTick: %s energize %s for %u dmg inflicted by %u",
                GetAffectiveCasterGuid().GetString().c_str(), target->GetGuidStr().c_str(), pdamage, GetId());

            if (m_modifier.m_miscvalue < 0 || m_modifier.m_miscvalue >= MAX_POWERS)
                break;

            Powers power = Powers(m_modifier.m_miscvalue);

            if (target->GetMaxPower(power) == 0)
                break;

            SpellPeriodicAuraLogInfo pInfo(this, pdamage, 0, 0, 0, 0.0f);
            target->SendPeriodicAuraLog(&pInfo);

            int32 gain = target->ModifyPower(power,pdamage);

            if (Unit* pCaster = GetCaster())
                target->getHostileRefManager().threatAssist(pCaster, float(gain) * 0.5f * sSpellMgr.GetSpellThreatMultiplier(spellProto), spellProto);
            break;
        }
        case SPELL_AURA_OBS_MOD_MANA:
        {
            // don't energize target if not alive, possible death persistent effects
            if (!target->isAlive())
                return;

            // don't energize isolated units (banished)
            if (target->hasUnitState(UNIT_STAT_ISOLATED))
                return;

            Powers powerType = ( (m_modifier.m_miscvalue > POWER_RUNIC_POWER || m_modifier.m_miscvalue < 0) ? POWER_MANA : Powers(m_modifier.m_miscvalue));

            // ignore non positive values (can be result apply spellmods to aura damage
            uint32 amount = m_modifier.m_amount > 0 ? m_modifier.m_amount : 0;

            uint32 pdamage = uint32(target->GetMaxPower(powerType) * amount / 100);

            DETAIL_FILTER_LOG(LOG_FILTER_PERIODIC_AFFECTS, "PeriodicTick: %s energize %s for %u power %u inflicted by %u",
                GetAffectiveCasterGuid().GetString().c_str(), target->GetGuidStr().c_str(), pdamage, powerType, GetId());

            if (target->GetMaxPower(powerType) == 0)
                break;

            SpellPeriodicAuraLogInfo pInfo(this, pdamage, 0, 0, 0, 0.0f);
            target->SendPeriodicAuraLog(&pInfo);

            int32 gain = target->ModifyPower(powerType, pdamage);

            if (Unit* pCaster = GetCaster())
                target->getHostileRefManager().threatAssist(pCaster, float(gain) * 0.5f * sSpellMgr.GetSpellThreatMultiplier(spellProto), spellProto);
            break;
        }
        case SPELL_AURA_POWER_BURN_MANA:
        {
            // don't mana burn target if not alive, possible death persistent effects
            if (!target->isAlive())
                return;

            Unit *pCaster = GetAffectiveCaster();
            if (!pCaster)
                return;

            // Check for immune (not use charges)
            if (IsSpellCauseDamage(spellProto) && target->IsImmunedToDamage(GetSpellSchoolMask(spellProto)))
                return;

            DamageInfo damageInfo(pCaster, target, spellProto);

            damageInfo.damage = m_modifier.m_amount > 0 ? m_modifier.m_amount : 0;

            Powers powerType = Powers(m_modifier.m_miscvalue);

            if (!target->isAlive() || target->getPowerType() != powerType)
                return;

            // resilience reduce mana draining effect at spell crit damage reduction (added in 2.4)
            if (powerType == POWER_MANA)
                damageInfo.damage -= target->GetSpellCritDamageReduction(damageInfo.damage);

            damageInfo.cleanDamage = abs(target->ModifyPower(powerType, -damageInfo.damage));

            damageInfo.damage = uint32(damageInfo.cleanDamage * spellProto->EffectMultipleValue[GetEffIndex()]);

            // maybe has to be sent different to client, but not by SMSG_PERIODICAURALOG
            pCaster->CalculateSpellDamage(&damageInfo);

            damageInfo.target->CalculateAbsorbResistBlock(pCaster, &damageInfo, spellProto);

            pCaster->DealDamageMods(&damageInfo);

            pCaster->SendSpellNonMeleeDamageLog(&damageInfo);

            // Set trigger flag
            damageInfo.procAttacker = PROC_FLAG_ON_DO_PERIODIC; //  | PROC_FLAG_SUCCESSFUL_HARMFUL_SPELL_HIT;
            damageInfo.procVictim   = PROC_FLAG_ON_TAKE_PERIODIC;// | PROC_FLAG_TAKEN_HARMFUL_SPELL_HIT;
            damageInfo.procEx       = createProcExtendMask(&damageInfo, SPELL_MISS_NONE);

            if (damageInfo.damage)
            {
                damageInfo.procVictim  |= PROC_FLAG_TAKEN_ANY_DAMAGE;
                damageInfo.procEx      |= PROC_EX_DIRECT_DAMAGE;
            }

            pCaster->ProcDamageAndSpell(&damageInfo);
            pCaster->DealSpellDamage(&damageInfo, true);

            break;
        }
        case SPELL_AURA_MOD_REGEN:
        {
            // don't heal target if not alive, possible death persistent effects
            if (!target->isAlive())
                return;

            int32 gain = target->ModifyHealth(m_modifier.m_amount);
            if (Unit *caster = GetAffectiveCaster())
                target->getHostileRefManager().threatAssist(caster, float(gain) * 0.5f  * sSpellMgr.GetSpellThreatMultiplier(spellProto), spellProto);
            break;
        }
        case SPELL_AURA_MOD_POWER_REGEN:
        {
            // don't energize target if not alive, possible death persistent effects
            if (!target->isAlive())
                return;

            // don't energize isolated units (banished)
            if (target->hasUnitState(UNIT_STAT_ISOLATED))
                return;

            Powers pt = target->getPowerType();
            if (int32(pt) != m_modifier.m_miscvalue)
                return;

            if ( spellProto->AuraInterruptFlags & AURA_INTERRUPT_FLAG_NOT_SEATED )
            {
                // eating anim
                target->HandleEmoteCommand(EMOTE_ONESHOT_EAT);
            }
            // Anger Management
            // amount = 1+ 16 = 17 = 3,4*5 = 10,2*5/3
            // so 17 is rounded amount for 5 sec tick grow ~ 1 range grow in 3 sec
            if (pt == POWER_RAGE)
                target->ModifyPower(pt, m_modifier.m_amount * 3 / 5);
            // Butchery
            else if (pt == POWER_RUNIC_POWER && target->isInCombat())
                target->ModifyPower(pt, m_modifier.m_amount);
            break;
        }
        // Here tick dummy auras
        case SPELL_AURA_DUMMY:                              // some spells have dummy aura
        case SPELL_AURA_PERIODIC_DUMMY:
        {
            PeriodicDummyTick();
            break;
        }
        case SPELL_AURA_PERIODIC_TRIGGER_SPELL:
        {
            TriggerSpell();
            break;
        }
        case SPELL_AURA_PERIODIC_TRIGGER_SPELL_WITH_VALUE:
        {
            TriggerSpellWithValue();
            break;
        }
        default:
            break;
    }
}

void Aura::PeriodicDummyTick()
{
    SpellEntry const* spell = GetSpellProto();
    Unit *target = GetTarget();
    switch (spell->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            switch (spell->Id)
            {
                // Forsaken Skills
                case 7054:
                {
                    // Possibly need cast one of them (but
                    // 7038 Forsaken Skill: Swords
                    // 7039 Forsaken Skill: Axes
                    // 7040 Forsaken Skill: Daggers
                    // 7041 Forsaken Skill: Maces
                    // 7042 Forsaken Skill: Staves
                    // 7043 Forsaken Skill: Bows
                    // 7044 Forsaken Skill: Guns
                    // 7045 Forsaken Skill: 2H Axes
                    // 7046 Forsaken Skill: 2H Maces
                    // 7047 Forsaken Skill: 2H Swords
                    // 7048 Forsaken Skill: Defense
                    // 7049 Forsaken Skill: Fire
                    // 7050 Forsaken Skill: Frost
                    // 7051 Forsaken Skill: Holy
                    // 7053 Forsaken Skill: Shadow
                    return;
                }
                // Steal Flesh (The Culling of Stratholme - Salramm the Fleshcrafter)
                case 52708:
                {
                    if (Unit *caster = GetCaster())
                        caster->CastSpell(caster, 52712, true );

                    target->CastSpell(target, 52711, true);
                    return;
                }
                case 7057:                                  // Haunting Spirits
                    if (roll_chance_i(33))
                        target->CastSpell(target,m_modifier.m_amount,true,NULL,this);
                    return;
//              // Panda
//              case 19230: break;
//              // Gossip NPC Periodic - Talk
//              case 33208: break;
//              // Gossip NPC Periodic - Despawn
//              case 33209: break;
//              // Steal Weapon
//              case 36207: break;
//              // Simon Game START timer, (DND)
//              case 39993: break;
//              // Knockdown Fel Cannon: break; The Aggro Burst
//              case 40119: break;
//              // Old Mount Spell
//              case 40154: break;
//              // Magnetic Pull
//              case 40581: break;
//              // Ethereal Ring: break; The Bolt Burst
//              case 40801: break;
//              // Crystal Prison
//              case 40846: break;
//              // Copy Weapon
//              case 41054: break;
//              // Dementia
//              case 41404: break;
//              // Ethereal Ring Visual, Lightning Aura
//              case 41477: break;
//              // Ethereal Ring Visual, Lightning Aura (Fork)
//              case 41525: break;
//              // Ethereal Ring Visual, Lightning Jumper Aura
//              case 41567: break;
//              // No Man's Land
//              case 41955: break;
//              // Headless Horseman - Fire
//              case 42074: break;
//              // Headless Horseman - Visual - Large Fire
//              case 42075: break;
//              // Headless Horseman - Start Fire, Periodic Aura
//              case 42140: break;
//              // Ram Speed Boost
//              case 42152: break;
//              // Headless Horseman - Fires Out Victory Aura
//              case 42235: break;
//              // Pumpkin Life Cycle
//              case 42280: break;
//              // Brewfest Request Chick Chuck Mug Aura
//              case 42537: break;
//              // Squashling
//              case 42596: break;
//              // Headless Horseman Climax, Head: Periodic
//              case 42603: break;
                case 42621:                                 // Fire Bomb
                {
                    // Cast the summon spells (42622 to 42627) with increasing chance
                    uint32 rand = urand(0, 99);
                    for (uint32 i = 1; i <= 6; ++i)
                    {
                        if (rand < i * (i+1) /2 * 5)
                        {
                            target->CastSpell(target, spell->Id + i, true);
                            break;
                        }
                    }
                    break;
                }
//              // Headless Horseman - Conflagrate, Periodic Aura
//              case 42637: break;
//              // Headless Horseman - Create Pumpkin Treats Aura
//              case 42774: break;
//              // Headless Horseman Climax - Summoning Rhyme Aura
//              case 42879: break;
//              // Tricky Treat
//              case 42919: break;
//              // Giddyup!
//              case 42924: break;
//              // Ram - Trot
//              case 42992: break;
//              // Ram - Canter
//              case 42993: break;
//              // Ram - Gallop
//              case 42994: break;
//              // Ram Level - Neutral
//              case 43310: break;
//              // Headless Horseman - Maniacal Laugh, Maniacal, Delayed 17
//              case 43884: break;
//              // Wretched!
//              case 43963: break;
//              // Headless Horseman - Maniacal Laugh, Maniacal, other, Delayed 17
//              case 44000: break;
//              // Energy Feedback
//              case 44328: break;
//              // Romantic Picnic
//              case 45102: break;
//              // Romantic Picnic
//              case 45123: break;
//              // Looking for Love
//              case 45124: break;
//              // Kite - Lightning Strike Kite Aura
//              case 45197: break;
//              // Rocket Chicken
//              case 45202: break;
//              // Copy Offhand Weapon
//              case 45205: break;
//              // Upper Deck - Kite - Lightning Periodic Aura
//              case 45207: break;
//              // Kite -Sky  Lightning Strike Kite Aura
//              case 45251: break;
//              // Ribbon Pole Dancer Check Aura
//              case 45390: break;
//              // Holiday - Midsummer, Ribbon Pole Periodic Visual
//              case 45406: break;
//              // Parachute
//              case 45472: break;
//              // Alliance Flag, Extra Damage Debuff
//              case 45898: break;
//              // Horde Flag, Extra Damage Debuff
//              case 45899: break;
//              // Ahune - Summoning Rhyme Aura
//              case 45926: break;
//              // Ahune - Slippery Floor
//              case 45945: break;
//              // Ahune's Shield
//              case 45954: break;
//              // Nether Vapor Lightning
//              case 45960: break;
//              // Darkness
//              case 45996: break;
                case 46041:                                 // Summon Blood Elves Periodic
                    target->CastSpell(target, 46037, true, NULL, this);
                    target->CastSpell(target, roll_chance_i(50) ? 46038 : 46039, true, NULL, this);
                    target->CastSpell(target, 46040, true, NULL, this);
                    return;
//              // Transform Visual Missile Periodic
//              case 46205: break;
//              // Find Opening Beam End
//              case 46333: break;
//              // Ice Spear Control Aura
//              case 46371: break;
//              // Hailstone Chill
//              case 46458: break;
//              // Hailstone Chill, Internal
//              case 46465: break;
//              // Chill, Internal Shifter
//              case 46549: break;
//              // Summon Ice Spear Knockback Delayer
//              case 46878: break;
                case 47214: // Burninate Effect
                {
                    Unit * caster = GetCaster();
                    if (!caster)
                        return;

                    if (target->GetEntry() == 26570)
                    {
                        if (target->HasAura(54683, EFFECT_INDEX_0))
                            return;
                        else
                        {
                            // Credit Scourge
                            caster->CastSpell(caster, 47208, true);
                            // set ablaze
                            target->CastSpell(target, 54683, true);
                            ((Creature*)target)->ForcedDespawn(4000);
                        }
                    }
                    break;
                }
//              // Fizzcrank Practice Parachute
//              case 47228: break;
//              // Send Mug Control Aura
//              case 47369: break;
//              // Direbrew's Disarm (precast)
//              case 47407: break;
//              // Mole Machine Port Schedule
//              case 47489: break;
//              case 47941: break; // Crystal Spike
//              case 48200: break; // Healer Aura
                case 48630:                                 // Summon Gauntlet Mobs Periodic
                case 59275:                                 // Below may need some adjustment, pattern for amount of summon and where is not verified 100% (except for odd/even tick)
                {
                    bool chance = roll_chance_i(50);

                    target->CastSpell(target, chance ? 48631 : 48632, true, NULL, this);

                    if (GetAuraTicks() % 2)                 // which doctor at odd tick
                        target->CastSpell(target, chance ? 48636 : 48635, true, NULL, this);
                    else                                    // or harponeer, at even tick
                        target->CastSpell(target, chance ? 48634 : 48633, true, NULL, this);

                    return;
                }
//              case 49313: break; // Proximity Mine Area Aura
//              // Mole Machine Portal Schedule
//              case 49466: break;
                case 49555:                                 // Corpse Explode (Drak'tharon Keep - Trollgore)
                case 59807:                                 // Corpse Explode (heroic)
                {
                    if (GetAuraTicks() == 3 && target->GetTypeId() == TYPEID_UNIT)
                        ((Creature*)target)->ForcedDespawn();
                    if (GetAuraTicks() != 2)
                        return;

                    if (Unit* pCaster = GetCaster())
                        pCaster->CastSpell(target, spell->Id == 49555 ? 49618 : 59809, true);

                    return;
                }
//              case 49592: break; // Temporal Rift
//              case 49957: break; // Cutting Laser
//              case 50085: break; // Slow Fall
//              // Listening to Music
//              case 50493: break;
//              // Love Rocket Barrage
//              case 50530: break;
                case 50789:                                 // Summon iron dwarf (left or right)
                case 59860:
                    target->CastSpell(target, roll_chance_i(50) ? 50790 : 50791, true, NULL, this);
                    return;
                case 50792:                                 // Summon iron trogg (left or right)
                case 59859:
                    target->CastSpell(target, roll_chance_i(50) ? 50793 : 50794, true, NULL, this);
                    return;
                case 50801:                                 // Summon malformed ooze (left or right)
                case 59858:
                    target->CastSpell(target, roll_chance_i(50) ? 50802 : 50803, true, NULL, this);
                    return;
                case 50824:                                 // Summon earthen dwarf
                    target->CastSpell(target, roll_chance_i(50) ? 50825 : 50826, true, NULL, this);
                    return;
                case 52441:                                 // Cool Down
                    target->CastSpell(target, 52443, true);
                    return;
                case 53035:                                 // Summon Anub'ar Champion Periodic (Azjol Nerub)
                    target->CastSpell(target, 53014, true); // Summon Anub'ar Champion
                    return;
                case 53036:                                 // Summon Anub'ar Necromancer Periodic (Azjol Nerub)
                    target->CastSpell(target, 53015, true); // Summon Anub'ar Necromancer
                    return;
                case 53037:                                 // Summon Anub'ar Crypt Fiend Periodic (Azjol Nerub)
                    target->CastSpell(target, 53016, true); // Summon Anub'ar Crypt Fiend
                    return;
                case 53520:                                 // Carrion Beetles
                    target->CastSpell(target, 53521, true, NULL, this);
                    target->CastSpell(target, 53521, true, NULL, this);
                    return;
                case 55592:                                 // Clean
                    switch(urand(0,2))
                    {
                        case 0: target->CastSpell(target, 55731, true); break;
                        case 1: target->CastSpell(target, 55738, true); break;
                        case 2: target->CastSpell(target, 55739, true); break;
                    }
                    return;
                case 54798: // FLAMING Arrow Triggered Effect
                {
                    Unit * caster = GetCaster();
                    if (!caster)
                        return;

                    Player *rider = caster->GetCharmerOrOwnerPlayerOrPlayerItself();
                    if (!rider)
                        return;

                    if (target->GetEntry() == 29358)
                    {
                        if (target->HasAura(54683, EFFECT_INDEX_0))
                            return;
                        else
                        {
                            // Credit Frostworgs
                            rider->CastSpell(rider, 54896, true);
                            // set ablaze
                            target->CastSpell(target, 54683, true);
                            ((Creature*)target)->ForcedDespawn(6000);
                        }
                    }
                    else if (target->GetEntry() == 29351)
                    {
                        if (target->HasAura(54683, EFFECT_INDEX_0))
                            return;
                        else
                        {
                            // Credit Frost Giants
                            rider->CastSpell(rider, 54893, true);
                            // set ablaze
                            target->CastSpell(target, 54683, true);
                            ((Creature*)target)->ForcedDespawn(6000);
                        }
                    }

                    break;
                }
                case 62019:                                 // Rune of Summoning
                {
                    target->CastSpell(target, 62020, true, NULL, this);
                    return;
                }
                case 62038: // Biting Cold (Ulduar: Hodir)
                {
                    if (target->GetTypeId() != TYPEID_PLAYER)
                        return;

                    Unit * caster = GetCaster();
                    if (!caster)
                        return;

                    if (!target->HasAura(62821))     // Toasty Fire
                    {
                        // dmg dealing every second
                        target->CastSpell(target, 62188, true, 0, 0, caster->GetObjectGuid());
                    }

                    // aura stack increase every 3 (data in m_miscvalue) seconds and decrease every 1s
                    // Reset reapply counter at move and decrease stack amount by 1
                    if (((Player*)target)->isMoving() || target->HasAura(62821))
                    {
                        if (SpellAuraHolderPtr holder = target->GetSpellAuraHolder(62039))
                        {
                            if (holder->ModStackAmount(-1))
                                target->RemoveSpellAuraHolder(holder);
                        }
                        m_modifier.m_miscvalue = 3;
                        return;
                    }
                    // We are standing at the moment, countdown
                    if (m_modifier.m_miscvalue > 0)
                    {
                        --m_modifier.m_miscvalue;
                        return;
                    }

                    target->CastSpell(target, 62039, true);

                    // recast every ~3 seconds
                    m_modifier.m_miscvalue = 3;
                    return;
                }
                case 62566:                                 // Healthy Spore Summon Periodic
                {
                    target->CastSpell(target, 62582, true);
                    target->CastSpell(target, 62591, true);
                    target->CastSpell(target, 62592, true);
                    target->CastSpell(target, 62593, true);
                    return;
                }
                case 62717:                                 // Slag Pot (periodic dmg)
                case 63477:
                {
                    Unit *caster = GetCaster();

                    if (caster && target)
                        caster->CastSpell(target, (spell->Id == 62717) ? 65722 : 65723, true, 0, this, this->GetCasterGuid(), this->GetSpellProto());
                    return;
                }
                case 63276:                                   // Mark of the Faceless (General Vezax - Ulduar)
                {

                    Unit *caster = GetCaster();

                    if (caster && target)
                        caster->CastCustomSpell(target, 63278, 0, &(spell->EffectBasePoints[0]), 0, false, 0, 0, caster->GetObjectGuid() , spell);
                    return;
                }
                case 69008:                                 // Soulstorm (OOC aura)
                case 68870:                                 // Soulstorm
                {
                    uint32 triggerSpells[8] = {68898, 68904, 68886, 68905, 68896, 68906, 68897, 68907};
                    target->CastSpell(target, triggerSpells[GetAuraTicks() % 8], true);
                    return;
                }
                case 67574:                                // Trial Of Crusader (Spike Aggro Aura - Anub'arak)
                {
                    if (!target->GetMap()->Instanceable())
                        return;

                    if (InstanceData* data = target->GetInstanceData())
                    {
                        if (Creature* pSpike = target->GetMap()->GetCreature(data->GetGuid(34660)))
                            pSpike->AddThreat(target, 1000000.0f);
                    }
                    return;
                }
                case 66118:                                 // Leeching Swarm 10 man
                case 68646:
                {
                    int32 damage = (m_modifier.m_amount * target->GetHealth()) / 100;
                    if (damage < 250)
                        damage = 250;
                    int32 heal = damage * 68 / 100;
                    target->CastCustomSpell(target, 66240, &damage, NULL, NULL, true, NULL, this);
                    if (Unit* caster = GetCaster())
                        target->CastCustomSpell(caster, 66125, &heal, NULL, NULL, true, NULL, this);
                    return;
                }
                case 67630:                                 // Leeching Swarm 25 man
                case 68647:
                {
                    int32 damage = (m_modifier.m_amount * target->GetHealth()) / 100;
                    if (damage < 250)
                        damage = 250;
                    int32 heal = damage * 155 / 100;
                    target->CastCustomSpell(target, 66240, &damage, NULL, NULL, true, NULL, this);
                    if (Unit* caster = GetCaster())
                        target->CastCustomSpell(caster, 66125, &heal, NULL, NULL, true, NULL, this);
                    return;
                }
                case 68875:                                 // Wailing Souls
                case 68876:                                 // Wailing Souls
                {
                    // Sweep around
                    float newAngle = target->GetOrientation() + (spell->Id == 68875 ? 0.09f : 2*M_PI_F - 0.09f);

                    newAngle = MapManager::NormalizeOrientation(newAngle);

                    target->SetFacingTo(newAngle);

                    // Should actually be SMSG_SPELL_START, too
                    target->CastSpell(target, 68873, true);
                    return;
                }
                case 69397:                                   // Soul Rip (Lich King)
                {
                    Unit *caster = GetCaster();
                    if (target && caster)
                    {
                        int32 bp0;
                        if (!GetModifier()->m_amount)
                            GetModifier()->m_amount = 1750;
                        else
                            GetModifier()->m_amount *= 2;

                        bp0 = GetModifier()->m_amount;
                        caster->CastCustomSpell(target, 69398, &bp0, 0, 0, true);
                    }
                    return;
                }
                case 70069:                                   // Ooze Flood Periodic Trigger (Rotface)
                {
                    if (target)
                        target->CastSpell(target, spell->CalculateSimpleValue(GetEffIndex()), true);
                    return;
                }
                case 70498:                                   // Vile Spirits (Lich King)
                {
                    if (target)
                    {
                        if (target->GetMap()->GetDifficulty() == RAID_DIFFICULTY_10MAN_NORMAL)
                        {
                            // on 10man normal max 8 spirits
                            if (GetModifier()->m_miscvalue > 7)
                                return;
                        }

                        target->CastSpell(target, 70497, true);
                    }
                    return;
                }
                case 73001:                                   // Shadow Prison (Blood Council)
                {
                    // cast dmg spell when moving
                    if (target->GetTypeId() == TYPEID_PLAYER && ((Player*)target)->isMoving())
                        target->CastSpell(target, 72999, true);

                    return;
                }
// Exist more after, need add later
                default:
                    break;
            }

            // Drink (item drink spells)
            if (GetEffIndex() > EFFECT_INDEX_0 && spell->EffectApplyAuraName[GetEffIndex()-1] == SPELL_AURA_MOD_POWER_REGEN)
            {
                if (target->GetTypeId() != TYPEID_PLAYER)
                    return;
                // Search SPELL_AURA_MOD_POWER_REGEN aura for this spell and add bonus
                if (Aura* aura = GetHolder()->GetAuraByEffectIndex(SpellEffectIndex(GetEffIndex() - 1)))
                {
                    aura->GetModifier()->m_amount = m_modifier.m_amount;
                    ((Player*)target)->UpdateManaRegen();
                    // Disable continue
                    m_isPeriodic = false;
                    return;
                }
                return;
            }

            // Prey on the Weak
            if (spell->SpellIconID == 2983)
            {
                Unit *victim = target->getVictim();
                if (victim && (target->GetHealth() * 100 / target->GetMaxHealth() > victim->GetHealth() * 100 / victim->GetMaxHealth()))
                {
                    if (!target->HasAura(58670))
                    {
                        int32 basepoints = GetBasePoints();
                        target->CastCustomSpell(target, 58670, &basepoints, 0, 0, true);
                    }
                }
                else
                    target->RemoveAurasDueToSpell(58670);
            }
            break;
        }
        case SPELLFAMILY_MAGE:
        {
            switch (spell->Id)
            {
                // Mirror Image
                case 55342:
                {
                    if (GetAuraTicks() != 1)
                        return;
                    if (Unit* pCaster = GetCaster())
                        pCaster->CastSpell(pCaster, spell->EffectTriggerSpell[GetEffIndex()], true, NULL, this);
                }
                default:
                    break;
            }
            break;
        }
        case SPELLFAMILY_DRUID:
        {
            switch (spell->Id)
            {
                // Frenzied Regeneration
                case 22842:
                {
                    // Converts up to 10 rage per second into health for $d.  Each point of rage is converted into ${$m2/10}.1% of max health.
                    // Should be manauser
                    if (target->getPowerType() != POWER_RAGE)
                        return;
                    uint32 rage = target->GetPower(POWER_RAGE);
                    // Nothing todo
                    if (rage == 0)
                        return;
                    int32 mod = (rage < 100) ? rage : 100;
                    int32 points = target->CalculateSpellDamage(target, spell, EFFECT_INDEX_1);
                    int32 regen = target->GetMaxHealth() * (mod * points / 10) / 1000;
                    target->CastCustomSpell(target, 22845, &regen, NULL, NULL, true, NULL, this);
                    target->SetPower(POWER_RAGE, rage-mod);
                    return;
                }
                // Force of Nature
                case 33831:
                    return;
                default:
                    break;
            }
            break;
        }
        case SPELLFAMILY_WARLOCK:
            switch (spell->Id)
            {
                case 48018:
                {
                    GameObject* obj = target->GetGameObject(spell->Id);
                    if (!obj)
                    {
                         target->RemoveAurasDueToSpell(spell->Id);
                         target->RemoveAurasDueToSpell(62388);
                         return;
                    }
                    // We must take a range of teleport spell, not summon.
                    const SpellEntry* goToCircleSpell = sSpellStore.LookupEntry(48020);
                    if (target->IsWithinDist(obj,GetSpellMaxRange(sSpellRangeStore.LookupEntry(goToCircleSpell->rangeIndex))))
                        target->CastSpell(target, 62388, true);
                    else
                        target->RemoveAurasDueToSpell(62388);
                    break;
                }
                default:
                    break;
            }
            break;
        case SPELLFAMILY_ROGUE:
        {
            switch (spell->Id)
            {
                // Killing Spree
                case 51690:
                {
                    if (target->hasUnitState(UNIT_STAT_STUNNED) || target->isFeared())
                        return;

                    Spell::UnitList targets;
                    {
                        // eff_radius ==0
                        float radius = GetSpellMaxRange(sSpellRangeStore.LookupEntry(spell->rangeIndex));

                        MaNGOS::AnyUnfriendlyVisibleUnitInObjectRangeCheck u_check(target, target, radius);
                        MaNGOS::UnitListSearcher<MaNGOS::AnyUnfriendlyVisibleUnitInObjectRangeCheck> checker(targets, u_check);
                        Cell::VisitAllObjects(target, checker, radius);
                    }

                    if (targets.empty())
                        return;

                    Spell::UnitList::const_iterator itr = targets.begin();
                    std::advance(itr, rand()%targets.size());
                    Unit* victim = *itr;

                    target->CastSpell(victim, 57840, true);
                    target->CastSpell(victim, 57841, true);
                    return;
                }
                default:
                    break;
            }
            break;
        }
        case SPELLFAMILY_HUNTER:
        {
            // Explosive Shot
            if (spell->GetSpellFamilyFlags().test<CF_HUNTER_EXPLOSIVE_SHOT>())
            {
                target->CastCustomSpell(target, 53352, &m_modifier.m_amount, 0, 0, true, 0, this, GetCasterGuid());
                return;
            }
            switch (spell->Id)
            {
                // Harpooner's Mark
                // case 40084:
                //    return;
                // Feeding Frenzy Rank 1 & 2
                case 53511:
                case 53512:
                {
                    Unit* victim = target->getVictim();
                    if ( victim && victim->GetHealth() * 100 < victim->GetMaxHealth() * 35 )
                        target->CastSpell(target, spell->Id == 53511 ? 60096 : 60097, true, NULL, this);
                    return;
                }
                default:
                    break;
            }
            break;
        }
        case SPELLFAMILY_SHAMAN:
        {
            // Astral Shift
            if (spell->Id == 52179)
            {
                // Periodic need for remove visual on stun/fear/silence lost
                if (!target->HasFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_STUNNED | UNIT_FLAG_FLEEING | UNIT_FLAG_SILENCED))
                    target->RemoveAurasDueToSpell(52179);
                return;
            }
            break;
        }
        case SPELLFAMILY_DEATHKNIGHT:
        {
            // Death and Decay
            if (spell->GetSpellFamilyFlags().test<CF_DEATHKNIGHT_DEATH_AND_DECAY>())
            {
                if (Unit *caster = GetCaster())
                    caster->CastCustomSpell(target, 52212, &m_modifier.m_amount, NULL, NULL, true, NULL, this);
                return;
            }
            // Raise Dead
//            if (spell->GetSpellFamilyFlags().test<CF_DEATHKNIGHT_RAISE_DEAD>())
//                return;
            // Chains of Ice
            if (spell->GetSpellFamilyFlags().test<CF_DEATHKNIGHT_CHAINS_OF_ICE2>())
            {
                // Get 0 effect aura
                Aura *slow = target->GetAura(GetId(), EFFECT_INDEX_0);
                if (slow)
                {
                    slow->ApplyModifier(false, true);
                    Modifier *mod = slow->GetModifier();
                    mod->m_amount+= m_modifier.m_amount;
                    if (mod->m_amount > 0) mod->m_amount = 0;
                    slow->ApplyModifier(true, true);
                }
                return;
            }
            // Summon Gargoyle
//            if (spell->GetSpellFamilyFlags().test<CF_DEATHKNIGHT_SUMMON_GARGOYLE>())
//                return;
            // Bladed Armor
            if (spell->SpellIconID == 2653)
            {
                // Increases your attack power by $s1 for every $s2 armor value you have.
                // Calculate AP bonus (from 1 efect of this spell)
                int32 apBonus = m_modifier.m_amount * target->GetArmor() / target->CalculateSpellDamage(target, spell, EFFECT_INDEX_1);
                target->CastCustomSpell(target, 61217, &apBonus, &apBonus, NULL, true, NULL, this);
                return;
            }
            // Death Rune Mastery
            // Reaping
            // Blood of the North
            if (spell->SpellIconID == 22 || spell->SpellIconID == 3041 || spell->SpellIconID == 30412)
            {
                if (target->GetTypeId() != TYPEID_PLAYER)
                    return;
                if (target->isInCombat())
                    return;

                Player *plr = (Player*)GetTarget();
                for(uint32 i = 0; i < MAX_RUNES; ++i)
                {
                    RuneType rune = plr->GetCurrentRune(i);
                    if (rune == RUNE_DEATH)
                        plr->ConvertRune(i, plr->GetBaseRune(i));
                }

                return;
            }
//            if (spell->SpellIconID == 30412)
//                return;
            // Hysteria
            if (spell->GetSpellFamilyFlags().test<CF_DEATHKNIGHT_HYSTERIA>())
            {
                // damage not expected to be show in logs, not any damage spell related to damage apply
                uint32 deal = m_modifier.m_amount * target->GetMaxHealth() / 100;
                target->DealDamage(target, deal, NULL, DIRECT_DAMAGE, SPELL_SCHOOL_MASK_NORMAL, NULL, false);
                return;
            }
            break;
        }
        default:
            break;
    }
}

void Aura::PeriodicCheck()
{

    SpellAuraHolderPtr holder = GetHolder();
    SpellEntry const* spellProto = GetSpellProto();

    if (!holder || !spellProto)
        return;

    Unit* target = GetTarget();
    Unit* caster = GetCaster();

    if (!caster || !target)
        return;

    switch(m_modifier.m_auraname)
    {
        case SPELL_AURA_MOD_CONFUSE:
        case SPELL_AURA_MOD_FEAR:
        case SPELL_AURA_MOD_STUN:
        case SPELL_AURA_MOD_ROOT:
        case SPELL_AURA_TRANSFORM:
        {
            if (caster->GetObjectGuid().IsPlayer() && target->GetObjectGuid().IsCreatureOrVehicle())
            {
                if (caster->SpellResistResult(target, spellProto) != SPELL_MISS_NONE)
                {
                    caster->SendSpellDamageResist(target, spellProto->Id);
                    target->RemoveAurasDueToSpell(GetId());
                }
            }
            break;
        }
        default:
            break;
    }
}

void Aura::HandlePreventFleeing(bool apply, bool Real)
{
    if (!Real)
        return;

    Unit::AuraList const& fearAuras = GetTarget()->GetAurasByType(SPELL_AURA_MOD_FEAR);
    if (!fearAuras.empty())
    {
        if (apply)
            GetTarget()->SetFeared(false, fearAuras.front()->GetCasterGuid());
        else
            GetTarget()->SetFeared(true);
    }
}

void Aura::HandleManaShield(bool apply, bool Real)
{
    if (!Real)
        return;

    // prevent double apply bonuses
    if (apply && (GetTarget()->GetTypeId()!=TYPEID_PLAYER || !((Player*)GetTarget())->GetSession()->PlayerLoading()))
    {
        if (Unit* caster = GetCaster())
        {
            float DoneActualBenefit = 0.0f;
            switch(GetSpellProto()->SpellFamilyName)
            {
                case SPELLFAMILY_MAGE:
                    if (GetSpellProto()->GetSpellFamilyFlags().test<CF_MAGE_MANA_SHIELD>())
                    {
                        // Mana Shield
                        // +50% from +spd bonus
                        DoneActualBenefit = caster->SpellBaseDamageBonusDone(GetSpellSchoolMask(GetSpellProto())) * 0.5f;
                        break;
                    }
                    break;
                default:
                    break;
            }

            DoneActualBenefit *= caster->CalculateLevelPenalty(GetSpellProto());

            m_modifier.m_amount += (int32)DoneActualBenefit;
        }
    }
}

void Aura::HandleArenaPreparation(bool apply, bool Real)
{
    if (!Real)
        return;

    Unit* target = GetTarget();
    target->HandleArenaPreparation(apply);
}

/**
 * Such auras are applied from a caster(=player) to a vehicle.
 * This has been verified using spell #49256
 */
void Aura::HandleAuraControlVehicle(bool apply, bool Real)
{
    if (!Real)
        return;

    Unit* target = GetTarget();
    if (!target->IsVehicle())
        return;

    // TODO: Check for free seat

    Unit *caster = GetCaster();
    if (!caster)
        return;

    if (apply)
    {
        // TODO: find a way to make this work properly
        // some spells seem like store vehicle seat info in basepoints, but not true for all of them, so... ;/
        int32 seat = GetModifier()->m_amount <= MAX_VEHICLE_SEAT ? GetModifier()->m_amount - 1 : -1;

        if (seat >= 0 && caster->GetTypeId() == TYPEID_PLAYER && !target->GetVehicleKit()->HasEmptySeat(seat))
            seat = -1;

        caster->_EnterVehicle(target->GetVehicleKit(), seat);
    }
    else
    {

        if (caster->GetVehicle() && caster->GetVehicle() == target->GetVehicleKit())
        {
            if (m_removeMode == AURA_REMOVE_BY_STACK || m_removeMode == AURA_REMOVE_BY_TRACKING)
                caster->GetVehicle()->RemovePassenger(caster, false);
            else
                caster->_ExitVehicle();
        }

        // some SPELL_AURA_CONTROL_VEHICLE auras have a dummy effect on the player - remove them
        caster->RemoveAurasDueToSpell(GetId());
    }
}

void Aura::HandleAuraLinked(bool apply, bool Real)
{
    if (!Real)
        return;

    uint32 linkedSpell = GetSpellProto()->EffectTriggerSpell[m_effIndex];
    SpellEntry const *spellInfo = sSpellStore.LookupEntry(linkedSpell);
    Unit *pTarget = GetTarget();
    Unit *pCaster = GetCaster();

    if (!spellInfo)
    {
        sLog.outError("HandleAuraLinked for spell %u effect %u: triggering unknown spell %u", GetSpellProto()->Id, m_effIndex, linkedSpell);
        return;
    }

    if (apply)
    {
        if (pCaster && pCaster->GetTypeId() == TYPEID_PLAYER &&
            pTarget->IsVehicle() &&
            spellInfo->HasAttribute(SPELL_ATTR_EX_HIDDEN_AURA) &&
            spellInfo->HasAttribute(SPELL_ATTR_HIDE_IN_COMBAT_LOG))
        {
            float bonus = ((float)((Player*)pCaster)->GetEquipGearScore(false, false) - (float)sWorld.getConfig(CONFIG_UINT32_GEAR_CALC_BASE))
                                 / (float)sWorld.getConfig(CONFIG_UINT32_GEAR_CALC_BASE);

            float curHealthRatio = pTarget->GetHealthPercent() / 100.0f;

            int32 bp0 = int32(((float)spellInfo->EffectBasePoints[EFFECT_INDEX_0] + bonus) * 100);
            int32 bp1 = int32(((float)spellInfo->EffectBasePoints[EFFECT_INDEX_1] + bonus) * 100);
            int32 bp2 = int32(((float)spellInfo->EffectBasePoints[EFFECT_INDEX_2] + bonus) * 100);

            // don't lower stats of vehicle, if GS player below then calculation base
            if (bp0 < 0)
                bp0 = 0;
            if (bp1 < 0)
                bp1 = 0;
            if (bp2 < 0)
                bp2 = 0;

            pTarget->CastCustomSpell(pTarget, spellInfo, &bp0, &bp1, &bp2, true, NULL, this, GetCasterGuid(), GetSpellProto());
            pTarget->SetHealth(uint32((float)pTarget->GetMaxHealth() * curHealthRatio));
        }
        // Ebon Plague and Crypt Fever - set basepoints for linked aura increasing disease damage taken
        else if (GetSpellProto()->SpellFamilyName == SPELLFAMILY_DEATHKNIGHT &&
            (GetSpellProto()->SpellIconID == 264 || GetSpellProto()->SpellIconID == 1933))
        {
            int32 bp0 = GetModifier()->m_amount;
            if (pCaster)
                pCaster->CastCustomSpell(pTarget, spellInfo, &bp0, NULL, NULL, true, NULL, this, GetCasterGuid(), GetSpellProto());
        }
        else
            pTarget->CastSpell(pTarget, spellInfo, true, NULL, this);
    }
    else
        pTarget->RemoveAurasByCasterSpell(linkedSpell, GetCasterGuid());
}

void Aura::HandleAuraAddMechanicAbilities(bool apply, bool Real)
{
    Unit* target = GetTarget();

    if (!target || target->GetTypeId() != TYPEID_PLAYER)    // only players should be affected by this aura
        return;

    uint16 i_OverrideSetId = GetMiscValue();

    const OverrideSpellDataEntry *spellSet = sOverrideSpellDataStore.LookupEntry(i_OverrideSetId);
    if (!spellSet)
        return;

    if (apply)
    {

        // spell give the player a new castbar with some spells.. this is a clientside process..
        // serverside just needs to register the new spells so that player isn't kicked as cheater
        for (int i = 0; i < MAX_OVERRIDE_SPELLS; i++)
            if (uint32 spellId = spellSet->Spells[i])
                static_cast<Player*>(target)->addSpell(spellId, true, false, false, false);

        target->SetUInt16Value(PLAYER_FIELD_BYTES2, 0, i_OverrideSetId);
    }
    else
    {
        target->SetUInt16Value(PLAYER_FIELD_BYTES2, 0, 0);
        for (int i = 0; i < MAX_OVERRIDE_SPELLS; i++)
            if (uint32 spellId = spellSet->Spells[i])
                static_cast<Player*>(target)->removeSpell(spellId, false , false, false);
    }
}

void Aura::HandleAuraOpenStable(bool apply, bool Real)
{
    if (!Real || GetTarget()->GetTypeId() != TYPEID_PLAYER || !GetTarget()->IsInWorld())
        return;

    Player* player = (Player*)GetTarget();

    if (apply)
        player->GetSession()->SendStablePet(player->GetObjectGuid());

    // client auto close stable dialog at !apply aura
}

void Aura::HandleAuraMirrorImage(bool apply, bool Real)
{
    if (!Real)
        return;

    Unit* target = GetTarget();

    if (!target)
        return;

    if (apply)
    {
        Unit* caster = GetCaster();
        if (target->GetTypeId() == TYPEID_UNIT)
        {
            Creature* pCreature = (Creature*)target;
            pCreature->SetByteValue(UNIT_FIELD_BYTES_0, 0, caster->getRace());
            pCreature->SetByteValue(UNIT_FIELD_BYTES_0, 1, caster->getClass());
            pCreature->SetByteValue(UNIT_FIELD_BYTES_0, 2, caster->getGender());
            pCreature->SetByteValue(UNIT_FIELD_BYTES_0, 3, caster->getPowerType());
        }
        target->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_CLONED);

        target->SetDisplayId(caster->GetDisplayId());
    }
    else
    {
        if (target->GetTypeId() == TYPEID_UNIT)
        {
            Creature* pCreature = (Creature*)target;

            const CreatureInfo* cinfo = pCreature->GetCreatureInfo();
            const CreatureModelInfo* minfo = sObjectMgr.GetCreatureModelInfo(pCreature->GetNativeDisplayId());

            pCreature->SetByteValue(UNIT_FIELD_BYTES_0, 0, 0);
            pCreature->SetByteValue(UNIT_FIELD_BYTES_0, 1, cinfo->unit_class);
            pCreature->SetByteValue(UNIT_FIELD_BYTES_0, 2, minfo->gender);
            pCreature->SetByteValue(UNIT_FIELD_BYTES_0, 3, 0);
        }

        target->RemoveFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_CLONED);

        target->SetDisplayId(target->GetNativeDisplayId());
    }
}

void Aura::HandleAuraConvertRune(bool apply, bool Real)
{
    if (!Real)
        return;

    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    Player *plr = (Player*)GetTarget();

    if (plr->getClass() != CLASS_DEATH_KNIGHT)
        return;

    RuneType runeFrom = RuneType(GetSpellProto()->EffectMiscValue[m_effIndex]);
    RuneType runeTo   = RuneType(GetSpellProto()->EffectMiscValueB[m_effIndex]);

    if (apply)
    {
        for(uint32 i = 0; i < MAX_RUNES; ++i)
        {
            if (plr->GetCurrentRune(i) == runeFrom && !plr->GetRuneCooldown(i))
            {
                plr->ConvertRune(i, runeTo, GetId());
                break;
            }
        }
    }
    else
    {
        for(uint32 i = 0; i < MAX_RUNES; ++i)
        {
            if (plr->GetCurrentRune(i) == runeTo && plr->GetBaseRune(i) == runeFrom)
            {
                plr->ConvertRune(i, runeFrom);
                plr->ClearConvertedBy(i);
                break;
            }
        }
    }
}

void Aura::HandlePhase(bool apply, bool Real)
{
    if (!Real)
        return;

    Unit *target = GetTarget();

    // always non stackable
    if (apply)
    {
        Unit::AuraList const& phases = target->GetAurasByType(SPELL_AURA_PHASE);
        if (!phases.empty())
            target->RemoveAurasDueToSpell(phases.front()->GetId(), GetHolder());
    }

    target->SetPhaseMask(apply ? GetMiscValue() : PHASEMASK_NORMAL, true);
    // no-phase is also phase state so same code for apply and remove
    if (GetEffIndex() == EFFECT_INDEX_0 && target->GetTypeId() == TYPEID_PLAYER)
    {
        SpellAreaForAreaMapBounds saBounds = sSpellMgr.GetSpellAreaForAuraMapBounds(GetId());
        if (saBounds.first != saBounds.second)
        {
            uint32 zone, area;
            target->GetZoneAndAreaId(zone, area);

            for(SpellAreaForAreaMap::const_iterator itr = saBounds.first; itr != saBounds.second; ++itr)
            {
                // some auras remove at aura remove
                if (!itr->second->IsFitToRequirements((Player*)target, zone, area))
                    target->RemoveAurasDueToSpell(itr->second->spellId);
                // some auras applied at aura apply
                else if (itr->second->autocast)
                {
                    if (!target->HasAura(itr->second->spellId, EFFECT_INDEX_0))
                        target->CastSpell(target, itr->second->spellId, true);
                }
            }
        }

    }
}

void Aura::HandleAuraSafeFall( bool Apply, bool Real )
{
    // implemented in WorldSession::HandleMovementOpcodes

    // only special case
    if (Apply && Real && GetId() == 32474 && GetTarget()->GetTypeId() == TYPEID_PLAYER)
        ((Player*)GetTarget())->ActivateTaxiPathTo(506, GetId());
}

bool Aura::IsCritFromAbilityAura(Unit* caster, DamageInfo* damageInfo)
{
    if (!GetSpellProto()->IsFitToFamily<SPELLFAMILY_ROGUE, CF_ROGUE_RUPTURE>() && // Rupture
        !GetSpellProto()->IsFitToFamily<SPELLFAMILY_ROGUE, CF_ROGUE_DEADLY_POISON>() &&
        !caster->HasAffectedAura(SPELL_AURA_ABILITY_PERIODIC_CRIT, GetSpellProto()))
        return false;

    if (caster->IsSpellCrit(GetTarget(), GetSpellProto(), GetSpellSchoolMask(GetSpellProto())))
    {
        damageInfo->damage = caster->SpellCriticalDamageBonus(GetSpellProto(), damageInfo->damage, GetTarget());
        return true;
    }

    return false;
}

void Aura::HandleModTargetArmorPct(bool /*apply*/, bool /*Real*/)
{
    if (GetTarget()->GetTypeId() != TYPEID_PLAYER)
        return;

    ((Player*)GetTarget())->UpdateArmorPenetration();
}

void Aura::HandleAuraModAllCritChance(bool apply, bool Real)
{
    // spells required only Real aura add/remove
    if (!Real)
        return;

    Unit *target = GetTarget();

    if (target->GetTypeId() != TYPEID_PLAYER)
        return;

    ((Player*)target)->HandleBaseModValue(CRIT_PERCENTAGE,         FLAT_MOD, float (m_modifier.m_amount), apply);
    ((Player*)target)->HandleBaseModValue(OFFHAND_CRIT_PERCENTAGE, FLAT_MOD, float (m_modifier.m_amount), apply);
    ((Player*)target)->HandleBaseModValue(RANGED_CRIT_PERCENTAGE,  FLAT_MOD, float (m_modifier.m_amount), apply);

    // included in Player::UpdateSpellCritChance calculation
    ((Player*)target)->UpdateAllSpellCritChances();
}

void Aura::HandleAuraStopNaturalManaRegen(bool apply, bool Real)
{
    if (!Real)
        return;
    if (GetTarget()->getClass() != CLASS_DEATH_KNIGHT)
        GetTarget()->ApplyModFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_REGENERATE_POWER, !apply && !GetTarget()->IsUnderLastManaUseEffect());
}

bool Aura::IsLastAuraOnHolder()
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (i != GetEffIndex() && GetHolder()->GetAuraByEffectIndex(SpellEffectIndex(i)))
            return false;
    return true;
}

bool Aura::HasMechanic(uint32 mechanic) const
{
    return GetSpellProto()->Mechanic == mechanic ||
        GetSpellProto()->EffectMechanic[m_effIndex] == mechanic;
}


SpellAuraHolder::SpellAuraHolder(SpellEntry const* spellproto, Unit *target, WorldObject *caster, Item *castItem) :
m_spellProto(spellproto), m_target(target), m_castItemGuid(castItem ? castItem->GetObjectGuid() : ObjectGuid()),
m_auraSlot(MAX_AURAS), m_auraFlags(AFLAG_NONE), m_auraLevel(1), m_procCharges(0),
m_stackAmount(1), m_timeCla(1000), m_removeMode(AURA_REMOVE_BY_DEFAULT), m_AuraDRGroup(DIMINISHING_NONE),
m_permanent(false), m_isRemovedOnShapeLost(true), m_deleted(false), m_in_use(0)
{
    MANGOS_ASSERT(target);
    MANGOS_ASSERT(spellproto && spellproto == sSpellStore.LookupEntry( spellproto->Id ) && "`info` must be pointer to sSpellStore element");
    m_aurasStorage.clear();

    if (!caster)
        m_casterGuid = target->GetObjectGuid();
    else
    {
        // remove this assert when not unit casters will be supported
        MANGOS_ASSERT(caster->isType(TYPEMASK_UNIT))
        m_casterGuid = caster->GetObjectGuid();
    }

    m_originalCasterGuid = m_casterGuid;  // Must be setted after by special case

    m_applyTime      = time(NULL);
    m_isPassive      = IsPassiveSpell(spellproto);
    m_isDeathPersist = IsDeathPersistentSpell(spellproto);
    m_trackedAuraType= IsSingleTargetSpell(spellproto) ? TRACK_AURA_TYPE_SINGLE_TARGET : IsSpellHaveAura(spellproto, SPELL_AURA_CONTROL_VEHICLE) ? TRACK_AURA_TYPE_CONTROL_VEHICLE : TRACK_AURA_TYPE_NOT_TRACKED;
    m_procCharges    = spellproto->procCharges;

    m_isRemovedOnShapeLost = (GetCasterGuid() == m_target->GetObjectGuid() &&
                              m_spellProto->Stances &&
                              !m_spellProto->HasAttribute(SPELL_ATTR_EX2_NOT_NEED_SHAPESHIFT) &&
                              !m_spellProto->HasAttribute(SPELL_ATTR_NOT_SHAPESHIFT));

    Unit* unitCaster = caster && caster->isType(TYPEMASK_UNIT) ? (Unit*)caster : NULL;

    m_duration = m_maxDuration = CalculateSpellDuration(spellproto, unitCaster);

    if (m_maxDuration == -1 || (m_isPassive && spellproto->DurationIndex == 0))
        SetPermanent(true);

    if (unitCaster)
    {
        if (Player* modOwner = unitCaster->GetSpellModOwner())
            modOwner->ApplySpellMod(GetId(), SPELLMOD_CHARGES, m_procCharges);
    }

    // some custom stack values at aura holder create
    switch (m_spellProto->Id)
    {
        // some auras applied with max stack
        case 24575:                                         // Brittle Armor
        case 24659:                                         // Unstable Power
        case 24662:                                         // Restless Strength
        case 26464:                                         // Mercurial Shield
        case 34027:                                         // Kill Command
        case 53257:                                         // Cobra strike
        case 55166:                                         // Tidal Force
        case 58914:                                         // Kill Command (pet part)
        case 62519:                                         // Attuned to Nature
        case 63050:                                         // Sanity (Ulduar - Yogg Saron)
        case 64455:                                         // Feral Essence
        case 66228:                                         // Nether Power (ToC: Lord Jaraxxus)
        case 67106:                                         // Nether Power (ToC: Lord Jaraxxus)
        case 67107:                                         // Nether Power (ToC: Lord Jaraxxus)
        case 67108:                                         // Nether Power (ToC: Lord Jaraxxus)
        case 71564:                                         // Deadly Precision
        case 71756:                                         // Ball of Flames Proc (Blood Prince Council)
        case 74396:                                         // Fingers of Frost
        case 70672:                                         // Gaseous Bloat (Putricide)
        case 72455:
        case 72832:
        case 72833:
            m_stackAmount = m_spellProto->StackAmount;
            break;
    }
}

void SpellAuraHolder::AddAura(Aura const& aura, SpellEffectIndex index)
{
    if (/*Aura* _aura = */GetAuraByEffectIndex(index))
    {
        DEBUG_LOG("SpellAuraHolder::AddAura attempt to add aura (effect %u) to holder of spell %u, but holder already have active aura!", index, GetId());
        RemoveAura(index);
    }
    if (!m_aurasStorage.empty())
    {
        AuraStorage::iterator itr = m_aurasStorage.find(index);
        if (itr != m_aurasStorage.end())
        {
            MAPLOCK_WRITE(m_target, MAP_LOCK_TYPE_AURAS);
            m_aurasStorage.erase(itr);
        }
    }

    m_aurasStorage.insert(AuraStorage::value_type(index,aura));
    m_auraFlags |= (1 << index);
}

void SpellAuraHolder::RemoveAura(SpellEffectIndex index)
{
    m_auraFlags &= ~(1 << index);
}

void SpellAuraHolder::CleanupsBeforeDelete()
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        RemoveAura(SpellEffectIndex(i));

    if (!m_aurasStorage.empty())
        m_aurasStorage.clear();
}

Aura* SpellAuraHolder::GetAuraByEffectIndex(SpellEffectIndex index)
{
    if ((m_auraFlags & (1 << index)) && !m_aurasStorage.empty())
    {
        AuraStorage::iterator itr = m_aurasStorage.find(index);
        if (itr != m_aurasStorage.end())
            return &itr->second;
    }
    return (Aura*)NULL;
}

Aura const* SpellAuraHolder::GetAura(SpellEffectIndex index) const
{
    if ((m_auraFlags & (1 << index)) && !m_aurasStorage.empty())
    {
        AuraStorage::const_iterator itr = m_aurasStorage.find(index);
        if (itr != m_aurasStorage.end())
            return &itr->second;
    }
    return (Aura*)NULL;
}

void SpellAuraHolder::ApplyAuraModifiers(bool apply, bool real)
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX && !IsDeleted(); ++i)
        if (Aura *aur = GetAuraByEffectIndex(SpellEffectIndex(i)))
            aur->ApplyModifier(apply, real);
}

void SpellAuraHolder::_AddSpellAuraHolder()
{
    if (!GetId())
        return;

    if (!m_target)
        return;

    // Try find slot for aura
    uint8 slot = NULL_AURA_SLOT;

    // Lookup free slot
    if (m_target->GetVisibleAurasCount() < MAX_AURAS)
    {
        Unit::VisibleAuraMap const& visibleAuras = m_target->GetVisibleAuras();
        for (size_t i = 0; i < MAX_AURAS ; ++i)
        {
            if (i == visibleAuras.size() || !visibleAuras[i])
            {
                slot = i;
                // update for out of range group members (on 1 slot use)
                m_target->UpdateAuraForGroup(slot);
                break;
            }
        }
    }

    Unit* caster = GetCaster();

    // set infinity cooldown state for spells
    if (caster && caster->GetTypeId() == TYPEID_PLAYER)
    {
        if (m_spellProto->HasAttribute(SPELL_ATTR_DISABLED_WHILE_ACTIVE))
        {
            Item* castItem = m_castItemGuid ? ((Player*)caster)->GetItemByGuid(m_castItemGuid) : NULL;
            caster->AddSpellAndCategoryCooldowns(m_spellProto,castItem ? castItem->GetEntry() : 0,true);
        }
    }

    uint8 flags = GetAuraFlags() | ((GetCasterGuid() == GetTarget()->GetObjectGuid()) ? AFLAG_NOT_CASTER : AFLAG_NONE) | ((GetSpellMaxDuration(m_spellProto) > 0 && !m_spellProto->HasAttribute(SPELL_ATTR_EX5_NO_DURATION)) ? AFLAG_DURATION : AFLAG_NONE) | (IsPositive() ? AFLAG_POSITIVE : AFLAG_NEGATIVE);
    SetAuraFlags(flags);

    SetAuraLevel(caster ? caster->getLevel() : sWorld.getConfig(CONFIG_UINT32_MAX_PLAYER_LEVEL));

    if (IsNeedVisibleSlot(caster))
    {
        SetAuraSlot( slot );
        if (slot < MAX_AURAS)                        // slot found send data to client
        {
            SetVisibleAura(false);
            SendAuraUpdate(false);
        }

        //*****************************************************
        // Update target aura state flag on holder apply
        // TODO: Make it easer
        //*****************************************************

        // Sitdown on apply aura req seated
        if ((m_spellProto->AuraInterruptFlags & AURA_INTERRUPT_FLAG_NOT_SEATED) && !m_target->IsSitState())
            m_target->SetStandState(UNIT_STAND_STATE_SIT);

        // register aura diminishing on apply
        if (getDiminishGroup() != DIMINISHING_NONE )
            m_target->ApplyDiminishingAura(getDiminishGroup(), true);

        // Update Seals information
        if (IsSealSpell(m_spellProto))
            m_target->ModifyAuraState(AURA_STATE_JUDGEMENT, true);

        // Conflagrate aura state on Immolate and Shadowflame
        if (m_spellProto->IsFitToFamily<SPELLFAMILY_WARLOCK, CF_WARLOCK_IMMOLATE, CF_WARLOCK_SHADOWFLAME2>())
            m_target->ModifyAuraState(AURA_STATE_CONFLAGRATE, true);

        // Faerie Fire (druid versions)
        if (m_spellProto->IsFitToFamily<SPELLFAMILY_DRUID, CF_DRUID_FAERIE_FIRE>())
            m_target->ModifyAuraState(AURA_STATE_FAERIE_FIRE, true);

        // Sting (hunter's pet ability)
        if (m_spellProto->Category == 1133)
            m_target->ModifyAuraState(AURA_STATE_FAERIE_FIRE, true);

        // Victorious
        if (m_spellProto->IsFitToFamily<SPELLFAMILY_WARRIOR, CF_WARRIOR_VICTORIOUS>())
            m_target->ModifyAuraState(AURA_STATE_WARRIOR_VICTORY_RUSH, true);

        // Swiftmend state on Regrowth & Rejuvenation
        if (m_spellProto->IsFitToFamily<SPELLFAMILY_DRUID, CF_DRUID_REJUVENATION, CF_DRUID_REGROWTH>())
            m_target->ModifyAuraState(AURA_STATE_SWIFTMEND, true);

        // Deadly poison aura state
        if (m_spellProto->IsFitToFamily<SPELLFAMILY_ROGUE, CF_ROGUE_DEADLY_POISON>())
            m_target->ModifyAuraState(AURA_STATE_DEADLY_POISON, true);

        // Enrage aura state
        if (m_spellProto->Dispel == DISPEL_ENRAGE)
            m_target->ModifyAuraState(AURA_STATE_ENRAGE, true);

        // Bleeding aura state
        if (GetAllSpellMechanicMask(m_spellProto) & (1 << (MECHANIC_BLEED-1)))
            m_target->ModifyAuraState(AURA_STATE_BLEEDING, true);

        switch(m_spellProto->SpellFamilyName)
        {
            case SPELLFAMILY_GENERIC:
                {
                    if (GetSpellSchoolMask(m_spellProto) == (SPELL_SCHOOL_MASK_ARCANE | SPELL_SCHOOL_MASK_HOLY))
                        m_target->ModifyAuraState(AURA_STATE_LIGHT_TARGET, true);
                    else if (GetSpellSchoolMask(m_spellProto) == (SPELL_SCHOOL_MASK_ARCANE | SPELL_SCHOOL_MASK_SHADOW))
                        m_target->ModifyAuraState(AURA_STATE_DARK_TARGET, true);

                        // need more correct research for this aura state and effect (mostly Ulduar vehicle spells)
//                    else if (GetSpellSchoolMask(m_spellProto) == (SPELL_SCHOOL_MASK_ARCANE | SPELL_SCHOOL_MASK_FIRE))
//                        m_target->ModifyAuraState(AURA_STATE_SPELLFIRE, true);
                    break;
                }
            default:
                break;
        }
    }
}

void SpellAuraHolder::_RemoveSpellAuraHolder()
{
    // Remove all triggered by aura spells vs unlimited duration
    // except same aura replace case
    if (m_removeMode!=AURA_REMOVE_BY_STACK)
        CleanupTriggeredSpells();

    Unit* caster = GetCaster();

    if (caster && IsPersistent())
        if (DynamicObject *dynObj = caster->GetDynObject(GetId()))
            dynObj->RemoveAffected(m_target);

    // remove at-store spell cast items (for all remove modes?)
    if (m_target->GetTypeId() == TYPEID_PLAYER && m_removeMode != AURA_REMOVE_BY_DEFAULT && m_removeMode != AURA_REMOVE_BY_DELETE)
        if (ObjectGuid castItemGuid = GetCastItemGuid())
            if (Item* castItem = ((Player*)m_target)->GetItemByGuid(castItemGuid))
                ((Player*)m_target)->DestroyItemWithOnStoreSpell(castItem, GetId());

    // reset cooldown state for spells
    if (caster && caster->GetTypeId() == TYPEID_PLAYER)
    {
        if (GetSpellProto()->Attributes & SPELL_ATTR_DISABLED_WHILE_ACTIVE)
            // note: item based cooldowns and cooldown spell mods with charges ignored (unknown existing cases)
            ((Player*)caster)->SendCooldownEvent(GetSpellProto());
    }

    //passive auras do not get put in slots - said who? ;)
    // Note: but totem can be not accessible for aura target in time remove (to far for find in grid)
    //if (m_isPassive && !(caster && caster->GetTypeId() == TYPEID_UNIT && ((Creature*)caster)->IsTotem()))
    //    return;

    uint8 slot = GetAuraSlot();

    if (slot >= MAX_AURAS)                                   // slot not set
        return;

    if (!m_target->GetVisibleAura(slot))
        return;

    // unregister aura diminishing (and store last time)
    if (getDiminishGroup() != DIMINISHING_NONE )
        m_target->ApplyDiminishingAura(getDiminishGroup(), false);

    SetAuraFlags(AFLAG_NONE);
    SetAuraLevel(0);
    SetVisibleAura(true);

    if (m_removeMode != AURA_REMOVE_BY_DELETE)
    {
        SendAuraUpdate(true);

        // update for out of range group members
        m_target->UpdateAuraForGroup(slot);

        //*****************************************************
        // Update target aura state flag (at last aura remove)
        //*****************************************************
        // Enrage aura state
        if (m_spellProto->Dispel == DISPEL_ENRAGE)
            m_target->ModifyAuraState(AURA_STATE_ENRAGE, false);

        // Bleeding aura state
        if (GetAllSpellMechanicMask(m_spellProto) & (1 << (MECHANIC_BLEED-1)))
        {
            bool found = false;

            Unit::SpellAuraHolderMap const& holders = m_target->GetSpellAuraHolderMap();
            for (Unit::SpellAuraHolderMap::const_iterator itr = holders.begin(); itr != holders.end(); ++itr)
            {
                if (GetAllSpellMechanicMask(itr->second->GetSpellProto()) & (1 << (MECHANIC_BLEED-1)))
                {
                    found = true;
                    break;
                }
            }

            if (!found)
                m_target->ModifyAuraState(AURA_STATE_BLEEDING, false);
        }

        uint32 removeState = 0;
        ClassFamilyMask removeFamilyFlag = m_spellProto->GetSpellFamilyFlags();
        switch(m_spellProto->SpellFamilyName)
        {
            case SPELLFAMILY_GENERIC:
                {
                    if (GetSpellSchoolMask(m_spellProto) == (SPELL_SCHOOL_MASK_ARCANE | SPELL_SCHOOL_MASK_HOLY))
                        removeState = AURA_STATE_LIGHT_TARGET;
                    else if (GetSpellSchoolMask(m_spellProto) == (SPELL_SCHOOL_MASK_ARCANE | SPELL_SCHOOL_MASK_SHADOW))
                        removeState = AURA_STATE_DARK_TARGET;
                    else if (GetSpellSchoolMask(m_spellProto) == (SPELL_SCHOOL_MASK_ARCANE | SPELL_SCHOOL_MASK_FIRE))
                        removeState = AURA_STATE_SPELLFIRE;
                }
                break;
            case SPELLFAMILY_PALADIN:
                if (IsSealSpell(m_spellProto))
                    removeState = AURA_STATE_JUDGEMENT;     // Update Seals information
                break;
            case SPELLFAMILY_WARLOCK:
                // Conflagrate aura state on Immolate and Shadowflame,
                if (m_spellProto->GetSpellFamilyFlags().test<CF_WARLOCK_IMMOLATE, CF_WARLOCK_SHADOWFLAME2>())
                {
                    removeFamilyFlag = ClassFamilyMask::create<CF_WARLOCK_IMMOLATE, CF_WARLOCK_SHADOWFLAME2>();
                    removeState = AURA_STATE_CONFLAGRATE;
                }
                break;
            case SPELLFAMILY_DRUID:
                if (m_spellProto->GetSpellFamilyFlags().test<CF_DRUID_FAERIE_FIRE>())
                    removeState = AURA_STATE_FAERIE_FIRE;   // Faerie Fire (druid versions)
                else if (m_spellProto->GetSpellFamilyFlags().test<CF_DRUID_REJUVENATION, CF_DRUID_REGROWTH>())
                {
                    removeFamilyFlag = ClassFamilyMask::create<CF_DRUID_REJUVENATION, CF_DRUID_REGROWTH>();
                    removeState = AURA_STATE_SWIFTMEND;     // Swiftmend aura state
                }
                break;
            case SPELLFAMILY_WARRIOR:
                if (m_spellProto->GetSpellFamilyFlags().test<CF_WARRIOR_VICTORIOUS>())
                    removeState = AURA_STATE_WARRIOR_VICTORY_RUSH; // Victorious
                break;
            case SPELLFAMILY_ROGUE:
                if (m_spellProto->GetSpellFamilyFlags().test<CF_ROGUE_DEADLY_POISON>())
                    removeState = AURA_STATE_DEADLY_POISON; // Deadly poison aura state
                break;
            case SPELLFAMILY_HUNTER:
                if (m_spellProto->GetSpellFamilyFlags().test<CF_HUNTER_PET_SPELLS>())
                    removeState = AURA_STATE_FAERIE_FIRE;   // Sting (hunter versions)
                break;
            default:
                break;
        }

        // Remove state (but need check other auras for it)
        if (removeState)
        {
            bool found = false;
            Unit::SpellAuraHolderMap const& holders = m_target->GetSpellAuraHolderMap();
            for (Unit::SpellAuraHolderMap::const_iterator i = holders.begin(); i != holders.end(); ++i)
            {
                SpellEntry const *auraSpellInfo = (*i).second->GetSpellProto();
                if (auraSpellInfo->IsFitToFamily(SpellFamily(m_spellProto->SpellFamilyName), removeFamilyFlag))
                {
                    found = true;
                    break;
                }
            }

            // this has been last aura
            if (!found)
                m_target->ModifyAuraState(AuraState(removeState), false);
        }

    }
}

void SpellAuraHolder::CleanupTriggeredSpells()
{
    if (!m_spellProto)
        return;

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        if (!m_spellProto->EffectApplyAuraName[i])
            continue;

        uint32 tSpellId = m_spellProto->EffectTriggerSpell[i];
        if (!tSpellId)
            continue;

        SpellEntry const* tProto = sSpellStore.LookupEntry(tSpellId);
        if (!tProto)
            continue;

        if (GetSpellDuration(tProto) != -1)
            continue;

        // needed for spell 43680, maybe others
        // TODO: is there a spell flag, which can solve this in a more sophisticated way?
        if (m_spellProto->EffectApplyAuraName[i] == SPELL_AURA_PERIODIC_TRIGGER_SPELL &&
            GetSpellDuration(m_spellProto) == int32(m_spellProto->EffectAmplitude[i]))
            continue;

        m_target->RemoveAurasDueToSpell(tSpellId);
    }
}

bool SpellAuraHolder::ModStackAmount(int32 num)
{
    uint32 protoStackAmount = m_spellProto->StackAmount;

    // Can`t mod
    if (!protoStackAmount)
        return true;

    if (num != 0)
        HandleSpellSpecificBoostsForward(num > 0);

    // Modify stack but limit it
    int32 stackAmount = m_stackAmount + num;
    if (stackAmount > (int32)protoStackAmount)
        stackAmount = protoStackAmount;
    else if (stackAmount <=0) // Last aura from stack removed
    {
        m_stackAmount = 0;
        return true; // need remove aura
    }

    // Update stack amount
    SetStackAmount(stackAmount);
    return false;
}

void SpellAuraHolder::SetStackAmount(uint32 stackAmount)
{
    Unit *target = GetTarget();
    Unit *caster = GetCaster();
    if (!target || !caster)
        return;

    bool refresh = stackAmount >= m_stackAmount;
    if (stackAmount != m_stackAmount)
    {
        m_stackAmount = stackAmount;

        for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (Aura* aur = GetAuraByEffectIndex(SpellEffectIndex(i)))
            {
                int32 bp = aur->GetBasePoints();
                int32 amount = m_stackAmount * caster->CalculateSpellDamage(target, m_spellProto, SpellEffectIndex(i), &bp);
                // Reapply if amount change
                if (amount != aur->GetModifier()->m_amount)
                {
                    aur->ApplyModifier(false, true);
                    aur->GetModifier()->m_amount = amount;
                    aur->ApplyModifier(true, true);

                    // change duration if aura refreshes
                    if (refresh)
                    {
                        int32 maxduration = GetSpellMaxDuration(aur->GetSpellProto());
                        int32 duration = GetSpellDuration(aur->GetSpellProto());

                        // new duration based on combo points
                        if (duration != maxduration)
                        {
                            if (Unit *caster = aur->GetCaster())
                            {
                                duration += int32((maxduration - duration) * caster->GetComboPoints() / 5);
                                SetAuraMaxDuration(duration);
                                SetAuraDuration(duration);
                                refresh = false;
                            }
                        }
                    }
                }
            }
        }
    }
    // Turkey Marker
    // Hack for not changing duration of timed achievement
    if (m_spellProto->Id == 25281)
        refresh = false;

    if (refresh)
        // Stack increased refresh duration
        RefreshHolder();
    else
        // Stack decreased only send update
        SendAuraUpdate(false);
}

Unit* SpellAuraHolder::GetCaster() const
{
    if (!m_target)
        return NULL;

    if (GetCasterGuid().IsEmpty())
        return NULL;

    if (m_target->IsInWorld())
        if (GetCasterGuid() == m_target->GetObjectGuid())
            return m_target;

    return ObjectAccessor::GetUnit(*m_target, m_casterGuid);// player will search at any maps
}

Unit* SpellAuraHolder::GetAffectiveCaster() const
{
    if (!m_target)
        return NULL;

    return GetAffectiveCasterGuid() != GetCasterGuid() ?
        ObjectAccessor::GetUnit(*m_target, GetAffectiveCasterGuid()) :
        GetCaster();
}

void SpellAuraHolder::SetAffectiveCasterGuid(ObjectGuid guid)
{
    if (!guid || !guid.IsUnit() || !m_target)
        return;

    m_originalCasterGuid = guid;
    SetCasterGuid(m_target->GetObjectGuid());
};

bool SpellAuraHolder::IsWeaponBuffCoexistableWith() const
{
    // only item casted spells
    if (!GetCastItemGuid())
        return false;

    // Exclude Debuffs
    if (!IsPositive())
        return false;

    // Exclude Non-generic Buffs [ie: Runeforging] and Executioner-Enchant
    if (GetSpellProto()->SpellFamilyName != SPELLFAMILY_GENERIC || GetId() == 42976)
        return false;

    // Exclude Stackable Buffs [ie: Blood Reserve]
    if (GetSpellProto()->StackAmount)
        return false;

    // only self applied player buffs
    if (m_target->GetTypeId() != TYPEID_PLAYER || m_target->GetObjectGuid() != GetCasterGuid())
        return false;

    Item* castItem = ((Player*)m_target)->GetItemByGuid(GetCastItemGuid());
    if (!castItem)
        return false;

    // Limit to Weapon-Slots
    if (!castItem->IsEquipped() ||
        (castItem->GetSlot() != EQUIPMENT_SLOT_MAINHAND && castItem->GetSlot() != EQUIPMENT_SLOT_OFFHAND))
        return false;

    return true;
}

bool SpellAuraHolder::IsNeedVisibleSlot(Unit const* caster) const
{
    bool totemAura = caster && caster->GetTypeId() == TYPEID_UNIT && ((Creature*)caster)->IsTotem();

    if (m_spellProto->procFlags)
        return true;
    else if (HasAuraWithTriggerEffect(m_spellProto))
        return true;
    else if (IsSpellHaveAura(m_spellProto, SPELL_AURA_MOD_IGNORE_SHAPESHIFT))
        return true;
    else if (IsSpellHaveAura(m_spellProto, SPELL_AURA_IGNORE_UNIT_STATE))
        return true;

    // passive auras (except totem auras) do not get placed in the slots
    return !m_isPassive || totemAura || HasAreaAuraEffect(m_spellProto);
}

void SpellAuraHolder::BuildUpdatePacket(WorldPacket& data) const
{
    data << uint8(GetAuraSlot());
    data << uint32(GetId());

    uint8 auraFlags = GetAuraFlags();
    data << uint8(auraFlags);
    data << uint8(GetAuraLevel());

    uint32 stackCount = m_procCharges ? m_procCharges*m_stackAmount : m_stackAmount;
    data << uint8(stackCount <= 255 ? stackCount : 255);

    if (!(auraFlags & AFLAG_NOT_CASTER))
    {
        data << GetAffectiveCasterGuid().WriteAsPacked();
    }

    if (auraFlags & AFLAG_DURATION)
    {
        data << uint32(GetAuraMaxDuration());
        data << uint32(GetAuraDuration());
    }
}

void SpellAuraHolder::SendAuraUpdate(bool remove) const
{
    WorldPacket data(SMSG_AURA_UPDATE);
    data << m_target->GetPackGUID();

    if (remove)
    {
        data << uint8(GetAuraSlot());
        data << uint32(0);
    }
    else
        BuildUpdatePacket(data);

    m_target->SendMessageToSet(&data, true);
}

void SpellAuraHolder::HandleSpellSpecificBoosts(bool apply)
{
    // it's impossible in theory, but possible at fact...
    if (!GetSpellProto())
        return;

    // if holder applyed in deleted case, need do nothing
    if (apply && IsDeleted())
    {
        sLog.outError("SpellAuraHolder::HandleSpellSpecificBoosts called `apply`  for deleted holder %u !", GetId());
        return;
    }

    bool cast_at_remove = false;                            // if spell must be casted at last aura from stack remove
    uint32 spellId1 = 0;
    uint32 spellId2 = 0;
    uint32 spellId3 = 0;
    uint32 spellId4 = 0;

    // Linked spells (boost chain)
    SpellLinkedSet linkedSet = sSpellMgr.GetSpellLinked(GetId(), SPELL_LINKED_TYPE_BOOST);
    if (linkedSet.size() > 0)
    {
        for (SpellLinkedSet::const_iterator itr = linkedSet.begin(); itr != linkedSet.end(); ++itr)
        {
            apply ?
                m_target->CastSpell(m_target, *itr, true, NULL, NULL, GetCasterGuid()) :
                m_target->RemoveAurasByCasterSpell(*itr, GetCasterGuid());
        }
    }

    // pet auras add (effects not checked! must be checked at load from DB)
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
    {
        if (PetAura const* petSpell = sSpellMgr.GetPetAura(GetId(), SpellEffectIndex(i)))
        {
            if (apply)
                m_target->AddPetAura(petSpell);
            else
                m_target->RemovePetAura(petSpell);
        }
    }

    linkedSet.clear();
    if (!apply)
    {
        // Linked spells (CastOnRemove chain)
        linkedSet = sSpellMgr.GetSpellLinked(GetId(), SPELL_LINKED_TYPE_CASTONREMOVE);
        if (linkedSet.size() > 0)
        {
            for (SpellLinkedSet::const_iterator itr = linkedSet.begin(); itr != linkedSet.end(); ++itr)
                m_target->CastSpell(m_target, *itr, true, NULL, NULL, GetCasterGuid());
        }

        // Linked spells (RemoveOnRemove chain)
        linkedSet = sSpellMgr.GetSpellLinked(GetId(), SPELL_LINKED_TYPE_REMOVEONREMOVE);
        if (linkedSet.size() > 0)
        {
            for (SpellLinkedSet::const_iterator itr = linkedSet.begin(); itr != linkedSet.end(); ++itr)
                m_target->RemoveAurasByCasterSpell(*itr, GetCasterGuid());
        }
    }
    linkedSet.clear();

    switch(GetSpellProto()->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            // Bandages
            if (GetSpellProto()->Mechanic == MECHANIC_BANDAGE && !apply)
            {
                cast_at_remove = true;
                spellId1 = 11196;                     // Recently Bandaged
                break;
            }

            switch(GetId())
            {
                case 29865:                                 // Deathbloom (10 man)
                {
                    if (!apply && m_removeMode == AURA_REMOVE_BY_EXPIRE)
                    {
                        cast_at_remove = true;
                        spellId1 = 55594;
                    }
                    else
                        return;
                    break;
                }
                case 37728:                                 // Arena preparation
                {
                    GetTarget()->HandleArenaPreparation(apply);
                    return;
                }
                case 55053:                                 // Deathbloom (25 man)
                {
                    if (!apply && m_removeMode == AURA_REMOVE_BY_EXPIRE)
                    {
                        cast_at_remove = true;
                        spellId1 = 55601;
                    }
                    else
                        return;
                    break;
                }
                case 62274:                                 // Shield of Runes (normal) (Runemaster Molgeim, Assembly of Iron encounter in Ulduar)
                {
                    if (!apply && m_removeMode == AURA_REMOVE_BY_SHIELD_BREAK)
                    {
                        cast_at_remove = true;
                        spellId1 = 62277;
                    }
                    else
                        return;
                    break;
                }
                case 63489:                                 // Shield of Runes (heroic) (Runemaster Molgeim, Assembly of Iron encounter in Ulduar)
                {
                    if (!apply && m_removeMode == AURA_REMOVE_BY_SHIELD_BREAK)
                    {
                        cast_at_remove = true;
                        spellId1 = 63967;
                    }
                    else
                        return;
                    break;
                }
                case 50720:                                 // Vigilance (warrior spell but not have warrior family)
                {
                    spellId1 = 68066;                       // Damage Reduction
                    break;
                }
                case 55001:                                 // Parachute
                {
                    if (apply)
                    {
                        m_target->RemoveSpellsCausingAura(SPELL_AURA_MOUNTED);
                        m_target->RemoveSpellsCausingAura(SPELL_AURA_FLY);
                        m_target->RemoveSpellsCausingAura(SPELL_AURA_MOD_INCREASE_SPEED);
                    }
                    break;
                }
                case 57350:                                 // Illusionary Barrier
                {
                    if (!apply && m_target->getPowerType() == POWER_MANA)
                    {
                        cast_at_remove = true;
                        spellId1 = 60242;                   // Darkmoon Card: Illusion
                    }
                    else
                        return;
                    break;
                }
                case 62056:                                 // Stone Grip (Kologarn encounter)
                case 63985:                                 // Stone Grip (Kologarn encounter) heroic
                {
                    if (!apply)
                    {
                        spellId1 = GetId() == 62056 ? 64290 : 64292;
                    }
                }
                case 62546:                                 // Scorch (Ignis encounter)
                case 63474:                                 // Scorch (Ignis encounter) heroic
                {
                    if (apply)
                    {
                        spellId1 = 62551;
                    }
                    break;
                }
                case 62619:                                 // Potent Pheromones (Freya encounter)
                case 64321:                                 // Potent Pheromones (Freya encounter) heroic
                {
                    if (apply)
                        if (Unit* target = GetTarget())
                            target->RemoveAurasDueToSpell(62532);
                    return;
                }
                case 62692:                                 // Aura of Despair (General Vezax - Ulduar)
                {
                    spellId1 = 64848;
                    break;
                }
                case 63277:                                 // Shadow Crash (General Vezax - Ulduar)
                {
                    spellId1 = 65269;
                    break;
                }
                case 69409:                                 // Soul Reaper (Lich King)
                case 73797:
                case 73798:
                case 73799:
                {
                    Unit *pCaster = GetCaster();
                    if (!apply && pCaster)
                        m_target->CastSpell(pCaster, 69410, true);

                    break;
                }
                case 70157:                                 // Ice Tomb (Sindragosa)
                {
                    spellId1 = 69700;
                    break;
                }
                case 70867:                                 // Soul of Blood Qween
                case 71473:
                case 71532:
                case 71533:
                {
                    spellId1 = 70871;
                    break;
                }
                case 71905:                                 // Soul Fragment
                {
                    if (!apply)
                    {
                        spellId1 = 72521;                   // Shadowmourne Visual Low
                        spellId2 = 72523;                   // Shadowmourne Visual High
                    }
                    else
                        return;
                    break;
                }
                case 63120:                                 // Insane
                {
                    spellId1 = 64464;
                    break;
                }
                case 63830:                                 // Malady of the Mind
                case 63881:
                {
                    if (!apply)
                    {
                        spellId1 = 63881;
                        cast_at_remove = true;
                    }
                    break;
                }
                case 69674:                                 // Mutated Infection
                case 71224:
                case 73022:
                case 73023:
                {
                    if (!apply)
                    {
                        cast_at_remove = true;
                        spellId1 = (GetSpellProto() ? GetSpellProto()->CalculateSimpleValue(EFFECT_INDEX_2) : 0);
                    }
                    break;
                }
                case 70877:                                 // Frenzied Bloodthirst (Queen Lana'thel)
                case 71474:
                {
                    if (!apply && m_removeMode == AURA_REMOVE_BY_EXPIRE)
                    {
                        cast_at_remove = true;
                        spellId1 = 70923; // Uncontrollable Frenzy
                    }
                    break;
                }
                case 73034:                                 // Blighted Spores
                case 73033:
                case 71222:
                case 69290:
                {
                    if (!apply)
                    {
                        if (m_removeMode == AURA_REMOVE_BY_EXPIRE)
                        {
                             cast_at_remove = true;
                             spellId1 = 69291;
                        }
                    }
                    break;
                }
                default:
                    return;
            }
            break;
        }
        case SPELLFAMILY_MAGE:
        {
            // Ice Barrier (non stacking from one caster)
            if (m_spellProto->SpellIconID == 32)
            {
                if ((!apply && m_removeMode == AURA_REMOVE_BY_DISPEL) || m_removeMode == AURA_REMOVE_BY_SHIELD_BREAK)
                {
                    Unit::AuraList const& dummyAuras = m_target->GetAurasByType(SPELL_AURA_DUMMY);
                    for(Unit::AuraList::const_iterator itr = dummyAuras.begin(); itr != dummyAuras.end(); ++itr)
                    {
                        // Shattered Barrier
                        if ((*itr)->GetSpellProto()->SpellIconID == 2945)
                        {
                            cast_at_remove = true;
                            // first rank have 50% chance
                            if ((*itr)->GetId() != 44745 || roll_chance_i(50))
                                spellId1 = 55080;
                            break;
                        }
                    }
                }
                else
                    return;
                break;
            }
            else if (m_spellProto->GetSpellFamilyFlags().test<CF_MAGE_FIREBALL>() && GetSpellProto()->SpellVisual[0] == 67)
            {
                // Glyph of Fireball
                if (Unit * caster = GetCaster())
                    if (caster->HasAura(56368))
                        m_target->RemoveAurasByCasterSpell(GetId(), caster->GetObjectGuid());
            }
            else if (m_spellProto->GetSpellFamilyFlags().test<CF_MAGE_FROSTBOLT>() && GetSpellProto()->SpellVisual[0] == 13)
            {
                // Glyph of Frostbolt
                if (Unit * caster = GetCaster())
                    if (caster->HasAura(56370))
                        m_target->RemoveAurasByCasterSpell(GetId(), caster->GetObjectGuid());
            }
            else if (!apply && m_spellProto->GetSpellFamilyFlags().test<CF_MAGE_ARCANE_MISSILES_CHANNEL>())
            {
                if (Unit * caster = GetCaster())
                {
                    // Remove missile barrage
                    if (SpellAuraHolderPtr holder = caster->GetSpellAuraHolder(44401, caster->GetObjectGuid()))
                        if (holder->DropAuraCharge())
                            caster->RemoveSpellAuraHolder(holder);

                    // Remove Arcane Blast
                    if (caster->HasAura(36032))
                        caster->RemoveAurasByCasterSpell(36032, caster->GetObjectGuid());
                }
            }

            switch(GetId())
            {
                case 11129:                                 // Combustion (remove triggered aura stack)
                {
                    if (!apply)
                        spellId1 = 28682;
                    else
                        return;
                    break;
                }
                case 28682:                                 // Combustion (remove main aura)
                {
                    if (!apply)
                        spellId1 = 11129;
                    else
                        return;
                    break;
                }
                case 44401:                                 // Missile Barrage (triggered)
                case 48108:                                 // Hot Streak (triggered)
                case 57761:                                 // Fireball! (Brain Freeze triggered)
                {
                    // consumed aura (at proc charges 0)
                    if (!apply && m_removeMode == AURA_REMOVE_BY_DEFAULT)
                    {
                        Unit* caster = GetCaster();
                        if (caster && caster->HasAura(70752))   // Item - Mage T10 2P Bonus
                        {
                            cast_at_remove = true;
                            spellId1 = 70753;                   // Pushing the Limit
                        }
                    }
                    else
                        return;
                    break;
                }
                default:
                    return;
            }
            break;
        }
        case SPELLFAMILY_WARRIOR:
        {
            if (!apply)
            {
                // Remove Blood Frenzy only if target no longer has any Deep Wound or Rend (applying is handled by procs)
                if (GetSpellProto()->Mechanic == MECHANIC_BLEED)
                {

                    // If target still has one of Warrior's bleeds, do nothing
                    Unit::AuraList const& PeriodicDamage = m_target->GetAurasByType(SPELL_AURA_PERIODIC_DAMAGE);
                    for(Unit::AuraList::const_iterator i = PeriodicDamage.begin(); i != PeriodicDamage.end(); ++i)
                        if ( (*i)->GetCasterGuid() == GetCasterGuid() &&
                            (*i)->GetSpellProto()->SpellFamilyName == SPELLFAMILY_WARRIOR &&
                            (*i)->GetSpellProto()->Mechanic == MECHANIC_BLEED)
                            return;

                    spellId1 = 30069;                           // Blood Frenzy (Rank 1)
                    spellId2 = 30070;                           // Blood Frenzy (Rank 2)
                    break;
                }
                else if (GetId() == 44521 && m_target && m_target->GetTypeId() == TYPEID_PLAYER)
                {
                    Player* plr = (Player*)m_target;
                    plr->SetPower(POWER_MANA, plr->GetMaxPower(POWER_MANA));
                    plr->SetPower(POWER_RAGE, 0);
                    plr->SetPower(POWER_ENERGY, plr->GetMaxPower(POWER_ENERGY));
                    plr->SetPower(POWER_RUNIC_POWER, 0);
                    return;
                }
                return;
            }
            break;
        }
        case SPELLFAMILY_WARLOCK:
        {
            // Fear (non stacking)
            if (m_spellProto->GetSpellFamilyFlags().test<CF_WARLOCK_FEAR>())
            {
                if (!apply)
                {
                    Unit* caster = GetCaster();
                    if(!caster)
                        return;

                    Unit::AuraList const& dummyAuras = caster->GetAurasByType(SPELL_AURA_DUMMY);
                    for(Unit::AuraList::const_iterator itr = dummyAuras.begin(); itr != dummyAuras.end(); ++itr)
                    {
                        SpellEntry const* dummyEntry = (*itr)->GetSpellProto();
                        // Improved Fear
                        if (dummyEntry->SpellFamilyName == SPELLFAMILY_WARLOCK && dummyEntry->SpellIconID == 98)
                        {
                            cast_at_remove = true;
                            switch((*itr)->GetModifier()->m_amount)
                            {
                                // Rank 1
                                case 0: spellId1 = 60946; break;
                                // Rank 1
                                case 1: spellId1 = 60947; break;
                            }
                            break;
                        }
                    }
                }
                else
                    return;
            }
            // Shadowflame (DoT)
            else if (m_spellProto->GetSpellFamilyFlags().test<CF_WARLOCK_SHADOWFLAME2>())
            {
                // Glyph of Shadowflame
                Unit* caster;
                if (!apply)
                    spellId1 = 63311;
                else if(((caster = GetCaster())) && caster->HasAura(63310))
                    spellId1 = 63311;
                else
                    return;
            }
            break;
        }
        case SPELLFAMILY_PRIEST:
        {
            // Shadow Word: Pain (need visual check fro skip improvement talent) or Vampiric Touch
            if ((m_spellProto->SpellIconID == 234 && m_spellProto->SpellVisual[0]) || m_spellProto->SpellIconID == 2213)
            {
                if (!apply && m_removeMode == AURA_REMOVE_BY_DISPEL)
                {
                    Unit* caster = GetCaster();
                    if(!caster)
                        return;

                    Unit::AuraList const& dummyAuras = caster->GetAurasByType(SPELL_AURA_DUMMY);
                    for(Unit::AuraList::const_iterator itr = dummyAuras.begin(); itr != dummyAuras.end(); ++itr)
                    {
                        // Shadow Affinity
                        if ((*itr)->GetSpellProto()->SpellFamilyName == SPELLFAMILY_PRIEST
                            && (*itr)->GetSpellProto()->SpellIconID == 178)
                        {
                            // custom cast code
                            int32 basepoints0 = (*itr)->GetModifier()->m_amount * caster->GetCreateMana() / 100;
                            caster->CastCustomSpell(caster, 64103, &basepoints0, NULL, NULL, true, NULL);
                            return;
                        }
                    }
                }
                else
                    return;
            }
            // Power Word: Shield
            else if (apply && m_spellProto->GetSpellFamilyFlags().test<CF_PRIEST_POWER_WORD_SHIELD>() && m_spellProto->Mechanic == MECHANIC_SHIELD)
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                // Glyph of Power Word: Shield
                if (Aura* glyph = caster->GetAura(55672, EFFECT_INDEX_0))
                {
                    Aura *shield = GetAuraByEffectIndex(EFFECT_INDEX_0);
                    int32 heal = (glyph->GetModifier()->m_amount * shield->GetModifier()->m_amount)/100;
                    caster->CastCustomSpell(m_target, 56160, &heal, NULL, NULL, true, 0, shield);
                }
                return;
            }

            switch(GetId())
            {
                // Abolish Disease (remove 1 more poison effect with Body and Soul)
                case 552:
                {
                    if (apply)
                    {
                        int chance =0;
                        Unit::AuraList const& dummyAuras = m_target->GetAurasByType(SPELL_AURA_DUMMY);
                        for(Unit::AuraList::const_iterator itr = dummyAuras.begin(); itr != dummyAuras.end(); ++itr)
                        {
                            SpellEntry const* dummyEntry = (*itr)->GetSpellProto();
                            // Body and Soul (talent ranks)
                            if (dummyEntry->SpellFamilyName == SPELLFAMILY_PRIEST && dummyEntry->SpellIconID == 2218 &&
                                dummyEntry->SpellVisual[0]==0)
                            {
                                chance = (*itr)->GetSpellProto()->CalculateSimpleValue(EFFECT_INDEX_1);
                                break;
                            }
                        }

                        if (roll_chance_i(chance))
                            spellId1 = 64134;               // Body and Soul (periodic dispel effect)
                    }
                    else
                        spellId1 = 64134;                   // Body and Soul (periodic dispel effect)
                    break;
                }
                // Dispersion mana reg and immunity
                case 47585:
                    spellId1 = 60069;                       // Dispersion
                    spellId2 = 63230;                       // Dispersion
                    break;
                default:
                    return;
            }
           break;
        }
        case SPELLFAMILY_DRUID:
        {
            // Rip
            if (GetSpellProto()->GetSpellFamilyFlags().test<CF_DRUID_RIP>())
            {
                Unit* caster = GetCaster();
                if (!caster)
                    return;

                if (caster->HasAura(63974))                 // Glyph of Shred triggered
                    caster->RemoveAurasDueToSpell(63974);
            }
            // Barkskin
            else if (GetId()==22812 && m_target->HasAura(63057)) // Glyph of Barkskin
                spellId1 = 63058;                           // Glyph - Barkskin 01
            // Enrage (Druid Bear)
            else if (GetId() == 5229)
            {
                if (apply)
                {
                    if (m_target->HasAura(70726))           // Druid T10 Feral 4P Bonus
                        spellId1 = 70725;                   // Enraged Defense
                    else
                        return;
                }
                else
                {
                    spellId1 = 70725;
                    spellId2 = 51185;                       // King of the Jungle (Enrage damage aura)
                }
            }
            else
                return;
            break;
        }
        case SPELLFAMILY_ROGUE:
        {
            // remove debuf savage combat
            if (GetSpellProto()->GetSpellFamilyFlags().test<CF_ROGUE_CRIPPLING_POISON, CF_ROGUE_DEADLY_POISON,CF_ROGUE_WOUND_POISON, CF_ROGUE_POISON_UNK>())
            {
                // search poison
                bool found = false;
                if (m_target->HasAuraState(AURA_STATE_DEADLY_POISON))
                    found = true;
                else
                {
                    Unit::SpellAuraHolderMap const& auras = m_target->GetSpellAuraHolderMap();
                    for (Unit::SpellAuraHolderMap::const_iterator itr = auras.begin(); itr != auras.end(); ++itr)
                    {
                        if (itr->second->GetSpellProto()->SpellFamilyName == SPELLFAMILY_ROGUE &&
                            itr->second->GetSpellProto()->Dispel == DISPEL_POISON)
                        {
                            found = true;
                            break;
                        }
                    }
                }

                if (!found)
                {
                    m_target->RemoveAurasDueToSpell(58684); // Savage Combat rank 1
                    m_target->RemoveAurasDueToSpell(58683); // Savage Combat rank 2
                }
            }
            // Sprint (skip non player casted spells by category)
            else if (GetSpellProto()->GetSpellFamilyFlags().test<CF_ROGUE_SPRINT>() && GetSpellProto()->Category == 44)
            {
                if (!apply || m_target->HasAura(58039))      // Glyph of Blurred Speed
                    spellId1 = 61922;                       // Sprint (waterwalk)
                else
                   return;
            }
            else
                return;
            break;
        }
        case SPELLFAMILY_HUNTER:
        {
            switch (GetId())
            {
                case 13161:                                 // Aspect of the Beast
                {
                    if (Pet* pet = m_target->GetPet())
                    {
                        spellId1 = 61669;                   // Aspect of the Beast - pet part
                        if (!apply)
                        {
                            pet->RemoveAurasDueToSpell(spellId1);
                            return;
                        }
                    }
                    break;
                }
                case 19574:                                 // Bestial Wrath - immunity
                case 34471:                                 // The Beast Within - immunity
                {
                    spellId1 = 24395;
                    spellId2 = 24396;
                    spellId3 = 24397;
                    spellId4 = 26592;
                    break;
                }
                case 34027:                                 // Kill Command, owner aura (spellmods)
                {
                    if (m_target->HasAura(35029))       // Focused Fire, rank 1
                        spellId1 = 60110;               // Kill Command, Focused Fire rank 1 bonus
                    else if (m_target->HasAura(35030))  // Focused Fire, rank 2
                        spellId1 = 60113;               // Kill Command, Focused Fire rank 2 bonus
                    else
                        return;
                    break;
                }
                case 34074:                                 // Aspect of the Viper
                {
                    if (!apply || m_target->HasAura(60144)) // Viper Attack Speed
                        spellId1 = 61609;                   // Vicious Viper
                    else
                        return;
                    break;
                }
                case 34455:          // Ferocious inspiration and ranks
                    spellId1 = 75593;
                    break;
                case 34459:
                    spellId1 = 75446;
                    break;
                case 34460:
                    spellId1 = 75447;
                    break;
                default:
                    // Freezing Trap Effect
                    if (m_spellProto->GetSpellFamilyFlags().test<CF_HUNTER_FREEZING_TRAP_EFFECT>())
                    {
                        if (!apply)
                        {
                            Unit *caster = GetCaster();
                            // Glyph of Freezing Trap
                            if (caster && caster->HasAura(56845))
                            {
                                cast_at_remove = true;
                                spellId1 = 61394;
                            }
                            else
                                return;
                        }
                        else
                            return;
                    }
                    // Aspect of the Dragonhawk dodge
                    else if (GetSpellProto()->GetSpellFamilyFlags().test<CF_HUNTER_ASPECT_OF_THE_DRAGONHAWK>())
                    {
                        spellId1 = 61848;

                        // triggered spell have same category as main spell and cooldown
                        if (apply && m_target->GetTypeId()==TYPEID_PLAYER)
                            ((Player*)m_target)->RemoveSpellCooldown(61848);
                    }
                    else
                        return;
                    break;
            }
            break;
        }
        case SPELLFAMILY_PALADIN:
        {
            if (m_spellProto->Id == 19746)                  // Aura Mastery (on Concentration Aura remove and apply)
            {
                Unit *caster = GetCaster();
                if (!caster)
                    return;

                if (apply && caster->HasAura(31821))
                    caster->CastSpell(caster, 64364, true, NULL);
                else if (!apply)
                    caster->RemoveAurasDueToSpell(64364);
            }
            if (m_spellProto->Id == 31821)                  // Aura Mastery (on Aura Mastery original buff remove)
            {
                Unit *caster = GetCaster();
                if (!caster)
                    return;

                if (apply && caster->HasAura(19746))
                    caster->CastSpell(caster, 64364, true, NULL);
                else if (!apply)
                    caster->RemoveAurasDueToSpell(64364);
            }
            if (m_spellProto->Id == 31884)                  // Avenging Wrath
            {
                if (!apply)
                    spellId1 = 57318;                       // Sanctified Wrath (triggered)
                else
                {
                    int32 percent = 0;
                    Unit::AuraList const& dummyAuras = m_target->GetAurasByType(SPELL_AURA_DUMMY);
                    for(Unit::AuraList::const_iterator itr = dummyAuras.begin(); itr != dummyAuras.end(); ++itr)
                    {
                        if ((*itr)->GetSpellProto()->SpellIconID == 3029)
                        {
                            percent = (*itr)->GetModifier()->m_amount;
                            break;
                        }
                    }

                    // apply in special way
                    if (percent)
                    {
                        spellId1 = 57318;                    // Sanctified Wrath (triggered)
                        // prevent aura deletion, specially in multi-boost case
                        SetInUse(true);
                        m_target->CastCustomSpell(m_target, spellId1, &percent, &percent, NULL, true, NULL);
                        SetInUse(false);
                    }
                    return;
                }
                break;
            }

            // Only process on player casting paladin aura
            // all aura bonuses applied also in aura area effect way to caster
            if (GetCasterGuid() != m_target->GetObjectGuid() || !GetCasterGuid().IsPlayer())
                return;

            if (GetSpellSpecific(m_spellProto->Id) != SPELL_AURA)
                return;

            // Sanctified Retribution and Swift Retribution (they share one aura), but not Retribution Aura (already gets modded)
            if (!GetSpellProto()->GetSpellFamilyFlags().test<CF_PALADIN_RETRIBUTION_AURA>())
                spellId1 = 63531;                           // placeholder for talent spell mods
            // Improved Concentration Aura (auras bonus)
            spellId2 = 63510;                               // placeholder for talent spell mods
            // Improved Devotion Aura (auras bonus)
            spellId3 = 63514;                               // placeholder for talent spell mods
            break;
        }
        case SPELLFAMILY_DEATHKNIGHT:
        {
            // second part of spell apply
            switch (GetId())
            {
                case 49039: spellId1 = 50397; break;        // Lichborne
                case 46619:                                 // Raise ally
                {
                    if (!m_target || m_target->GetTypeId() != TYPEID_PLAYER)
                        return;
                    Player* m_player = (Player*)m_target;
                    if (apply)
                    {
                        // convert player to ghoul
                        m_player->SetDeathState(GHOULED);
                        m_player->SetHealth(1);
                        m_player->SetRoot(true);
                    }
                    else
                    {
                        m_player->SetRoot(false);
                        m_player->SetHealth(0);
                        m_player->SetDeathState(JUST_DIED);
                    }
                    break;
                }

                case 48263:                                 // Frost Presence
                case 48265:                                 // Unholy Presence
                case 48266:                                 // Blood Presence
                {
                    // else part one per 3 pair
                    if (GetId()==48263 || GetId()==48265)   // Frost Presence or Unholy Presence
                    {
                        // Improved Blood Presence
                        int32 heal_pct = 0;
                        if (apply)
                        {
                            Unit::AuraList const& bloodAuras = m_target->GetAurasByType(SPELL_AURA_DUMMY);
                            for(Unit::AuraList::const_iterator itr = bloodAuras.begin(); itr != bloodAuras.end(); ++itr)
                            {
                                // skip same icon
                                if ((*itr)->GetSpellProto()->SpellFamilyName == SPELLFAMILY_DEATHKNIGHT &&
                                    (*itr)->GetSpellProto()->SpellIconID == 2636)
                                {
                                    heal_pct = (*itr)->GetModifier()->m_amount;
                                    break;
                                }
                            }
                        }

                        if (heal_pct)
                            m_target->CastCustomSpell(m_target, 63611, &heal_pct, NULL, NULL, true, NULL, NULL, GetCasterGuid());
                        else
                            m_target->RemoveAurasDueToSpell(63611);
                    }
                    else
                        spellId1 = 63611;                   // Improved Blood Presence, trigger for heal

                    if (GetId()==48263 || GetId()==48266)   // Frost Presence or Blood Presence
                    {
                        // Improved Unholy Presence
                        int32 power_pct = 0;
                        if (apply)
                        {
                            Unit::AuraList const& unholyAuras = m_target->GetAurasByType(SPELL_AURA_DUMMY);
                            for(Unit::AuraList::const_iterator itr = unholyAuras.begin(); itr != unholyAuras.end(); ++itr)
                            {
                                // skip same icon
                                if ((*itr)->GetSpellProto()->SpellFamilyName == SPELLFAMILY_DEATHKNIGHT &&
                                    (*itr)->GetSpellProto()->SpellIconID == 2633)
                                {
                                    power_pct = (*itr)->GetModifier()->m_amount;
                                    break;
                                }
                            }
                        }
                        if (power_pct || !apply)
                            spellId2 = 49772;                   // Unholy Presence, speed part, spell1 used for Improvement presence fit to own presence
                    }
                    else
                        spellId1 = 49772;                       // Unholy Presence move speed

                    if (GetId()==48265 || GetId()==48266)       // Unholy Presence or Blood Presence
                    {
                        // Improved Frost Presence
                        int32 stamina_pct = 0;
                        if (apply)
                        {
                            Unit::AuraList const& frostAuras = m_target->GetAurasByType(SPELL_AURA_DUMMY);
                            for(Unit::AuraList::const_iterator itr = frostAuras.begin(); itr != frostAuras.end(); ++itr)
                            {
                                // skip same icon
                                if ((*itr)->GetSpellProto()->SpellFamilyName == SPELLFAMILY_DEATHKNIGHT &&
                                    (*itr)->GetSpellProto()->SpellIconID == 2632)
                                {
                                    stamina_pct = (*itr)->GetModifier()->m_amount;
                                    break;
                                }
                            }
                        }

                        if (stamina_pct)
                            m_target->CastCustomSpell(m_target, 61261, &stamina_pct, NULL, NULL, true, NULL, NULL, GetCasterGuid());
                        else
                            m_target->RemoveAurasDueToSpell(61261);
                    }
                    else
                        spellId1 = 61261;                   // Frost Presence, stamina

                    if (GetId()==48265)                     // Unholy Presence
                    {
                        // Improved Unholy Presence, special case for own presence
                        int32 power_pct = 0;
                        if (apply)
                        {
                            Unit::AuraList const& unholyAuras = m_target->GetAurasByType(SPELL_AURA_DUMMY);
                            for(Unit::AuraList::const_iterator itr = unholyAuras.begin(); itr != unholyAuras.end(); ++itr)
                            {
                                // skip same icon
                                if ((*itr)->GetSpellProto()->SpellFamilyName == SPELLFAMILY_DEATHKNIGHT &&
                                    (*itr)->GetSpellProto()->SpellIconID == 2633)
                                {
                                    power_pct = (*itr)->GetModifier()->m_amount;
                                    break;
                                }
                            }
                        }

                        if (power_pct)
                        {
                            int32 bp = 5;
                            m_target->CastCustomSpell(m_target, 63622, &bp, &bp, &bp, true, NULL, NULL, GetCasterGuid());
                            m_target->CastCustomSpell(m_target, 65095, &bp, NULL, NULL, true, NULL, NULL, GetCasterGuid());
                        }
                        else
                        {
                            m_target->RemoveAurasDueToSpell(63622);
                            m_target->RemoveAurasDueToSpell(65095);
                        }
                    }
                    break;
                }
            }

            // Improved Blood Presence
            if (GetSpellProto()->SpellIconID == 2636 && m_isPassive)
            {
                // if presence active: Frost Presence or Unholy Presence
                if (apply && (m_target->HasAura(48263) || m_target->HasAura(48265)))
                {
                    Aura* aura = GetAuraByEffectIndex(EFFECT_INDEX_0);
                    if (!aura)
                        return;

                    int32 bp = aura->GetModifier()->m_amount;
                    m_target->CastCustomSpell(m_target, 63611, &bp, NULL, NULL, true, NULL, NULL, GetCasterGuid());
                }
                else
                    m_target->RemoveAurasDueToSpell(63611);
                return;
            }

            // Improved Frost Presence
            if (GetSpellProto()->SpellIconID == 2632 && m_isPassive)
            {
                // if presence active: Unholy Presence or Blood Presence
                if (apply && (m_target->HasAura(48265) || m_target->HasAura(48266)))
                {
                    Aura* aura = GetAuraByEffectIndex(EFFECT_INDEX_0);
                    if (!aura)
                        return;

                    int32 bp0 = aura->GetModifier()->m_amount;
                    int32 bp1 = 0;                          // disable threat mod part for not Frost Presence case
                    m_target->CastCustomSpell(m_target, 61261, &bp0, &bp1, NULL, true, NULL, NULL, GetCasterGuid());
                }
                else
                    m_target->RemoveAurasDueToSpell(61261);
                return;
            }

            // Improved Unholy Presence
            if (GetSpellProto()->SpellIconID == 2633 && m_isPassive)
            {
                // if presence active: Unholy Presence
                if (apply && m_target->HasAura(48265))
                {
                    int32 bp = 5;
                    m_target->CastCustomSpell(m_target, 63622, &bp, &bp, &bp, true, NULL, NULL, GetCasterGuid());
                    m_target->CastCustomSpell(m_target, 65095, &bp, NULL, NULL, true, NULL, NULL, GetCasterGuid());
                }
                else
                {
                    m_target->RemoveAurasDueToSpell(63622);
                    m_target->RemoveAurasDueToSpell(65095);
                }

                // if presence active: Frost Presence or Blood Presence
                if (!apply || m_target->HasAura(48263) || m_target->HasAura(48266))
                    spellId1 = 49772;
                else
                    return;
                break;
            }
            break;
        }
        default:
            break;
    }

    // Old method override. need rewrite.
    if (spellId1)
        linkedSet.insert(spellId1);
    if (spellId2)
        linkedSet.insert(spellId2);
    if (spellId3)
        linkedSet.insert(spellId3);
    if (spellId4)
        linkedSet.insert(spellId4);

    if (linkedSet.size() > 0)
    {
        // prevent aura deletion, specially in multi-boost case
        SetInUse(true);
        for (SpellLinkedSet::const_iterator itr = linkedSet.begin(); itr != linkedSet.end(); ++itr)
        {
            (apply || cast_at_remove) ?
                m_target->CastSpell(m_target, *itr, true, NULL, NULL, GetCasterGuid()) :
                m_target->RemoveAurasByCasterSpell(*itr, GetCasterGuid());
        }
        SetInUse(false);
    }
}

void SpellAuraHolder::HandleSpellSpecificBoostsForward(bool apply)
{
    // in fact, possible call of this method for not fully created holder...
    if (!GetSpellProto())
        return;

    // if holder applyed in deleted case, need do nothing
    if (apply && IsDeleted())
    {
        sLog.outError("SpellAuraHolder::HandleSpellSpecificBoostsForward called `apply`  for deleted holder %u !", GetId());
        return;
    }

    // Custom proc system (proc before apply or before fade)
    Unit* pCaster = GetCaster();
    if (!pCaster)
        pCaster = m_target;

    if (!pCaster)
        return;

    uint32 procFlag = apply ? PROC_FLAG_ON_AURA_APPLY : PROC_FLAG_ON_AURA_FADE;
    uint32 procEx   = 0;
    switch (m_removeMode)
    {
        case AURA_REMOVE_BY_EXPIRE:
        case AURA_REMOVE_BY_DEFAULT:
            procEx   |= PROC_EX_EXPIRE;
            break;
        case AURA_REMOVE_BY_SHIELD_BREAK:
            procEx   |= PROC_EX_SHIELD_BREAK;
            break;
        case AURA_REMOVE_BY_DISPEL:
            procEx   |= PROC_EX_DISPEL;
            break;
        default:
            break;
    };

    pCaster->ProcDamageAndSpell(m_target, procFlag, PROC_FLAG_NONE, procEx, 0, GetWeaponAttackType(GetSpellProto()), GetSpellProto());

    // Linked spells (boostforward chain)
    SpellLinkedSet linkedSet = sSpellMgr.GetSpellLinked(GetId(), SPELL_LINKED_TYPE_BOOSTFORWARD);

    // Custom cases
    switch(GetSpellProto()->SpellFamilyName)
    {
        case SPELLFAMILY_GENERIC:
        {
            switch(GetId())
            {
                case 70337:                                 // Necrotic Plague (Lich King)
                case 73912:
                case 73913:
                case 73914:
                {
                    if (!apply)
                    {
                        GetTarget()->CastSpell(GetTarget(), 70338, true);
                        if (m_removeMode != AURA_REMOVE_BY_DISPEL)
                            GetTarget()->CastSpell(GetTarget(), 70338, true);
                    }
                    break;
                }
                case 70338:                                 // Necrotic Plague (stacking) (Lich King)
                case 73785:
                case 73786:
                case 73787:
                {
                    if (apply)
                    {
                        GetTarget()->CastSpell(GetTarget(), 74074, true); // Plague Siphon

                        if (Unit *caster = GetCaster())
                        {
                            if (SpellAuraHolderPtr holder = caster->GetSpellAuraHolder(GetId()))
                                SetStackAmount(holder->GetStackAmount());
                        }
                    }
                    else if (m_removeMode != AURA_REMOVE_BY_DEFAULT)
                    {
                        if (m_removeMode == AURA_REMOVE_BY_DISPEL && m_stackAmount > 1)
                            --m_stackAmount;
                        else
                            ++m_stackAmount;

                        GetTarget()->CastSpell(GetTarget(), 70338, true);
                    }
                    break;
                }
            }
            break;
        }
        case SPELLFAMILY_WARLOCK:
        {
            // Shadow embrace (healing reduction part)
            if (m_spellProto->GetSpellFamilyFlags().test<CF_WARLOCK_MISC_DEBUFFS>() && m_spellProto->SpellIconID == 2209)
            {
                switch(GetId())
                {
                    case 32386:
                        linkedSet.insert(60448);
                        break;
                    case 32388:
                        linkedSet.insert(60465);
                        break;
                    case 32389:
                        linkedSet.insert(60466);
                        break;
                    case 32390:
                        linkedSet.insert(60467);
                        break;
                    case 32391:
                        linkedSet.insert(60468);
                        break;
                    default:
                        break;
                }
                break;
            }
            // Improved Health Funnel (damage reducing part)
            else if (m_spellProto->GetSpellFamilyFlags().test<CF_WARLOCK_HEALTH_FUNNEL>())
            {
                if (pCaster->HasAura(18703))
                    linkedSet.insert(60955);
                else if (pCaster->HasAura(18704))
                    linkedSet.insert(60956);
            }
            break;
        }
        case SPELLFAMILY_HUNTER:
        {
            // Cobra strike
            if (m_spellProto->Id == 53257)
            {
                if (m_target->GetObjectGuid().IsPet())
                {
                    if (!apply)
                        if (Unit* owner = ((Pet*)m_target)->GetOwner())
                            if (SpellAuraHolderPtr holder = owner->GetSpellAuraHolder(m_spellProto->Id))
                                if (holder->ModStackAmount(-1))
                                    owner->RemoveSpellAuraHolder(holder);
                }
                else if (apply)
                {
                    if (Pet* pet = m_target->GetPet())
                        if (pet->isAlive())
                            pet->CastSpell(pet,m_spellProto->Id,true);
                }
                return;
            }
            else
                break;
        }
        default:
            break;
    }

    if (linkedSet.size() > 0)
    {
        // prevent aura deletion, specially in multi-boost case
        SetInUse(true);
        for (SpellLinkedSet::const_iterator itr = linkedSet.begin(); itr != linkedSet.end(); ++itr)
        {
            apply ?
                m_target->CastSpell(m_target, *itr, true, NULL, NULL, GetCasterGuid()) :
                m_target->RemoveAurasByCasterSpell(*itr, GetCasterGuid());
        }
        SetInUse(false);
    }
}

SpellAuraHolder::~SpellAuraHolder()
{
//    DEBUG_LOG("SpellAuraHolder:: destructor for SpellAuraHolder of spell %u called.", GetId());
}

void SpellAuraHolder::Update(uint32 diff)
{
    if (!m_spellProto)
    {
        DEBUG_LOG("SpellAuraHolder::Update attempt call Update on holder, but holder not have spellproto!");
        return;
    }

    if (m_duration > 0)
    {
        m_duration -= diff;
        if (m_duration < 0)
            m_duration = 0;

        m_timeCla -= diff;

        if (m_timeCla <= 0)
        {
            if (Unit* caster = GetCaster())
            {
                Powers powertype = Powers(GetSpellProto()->powerType);
                int32 manaPerSecond = GetSpellProto()->manaPerSecond + GetSpellProto()->manaPerSecondPerLevel * caster->getLevel();
                m_timeCla = 1*IN_MILLISECONDS;

                if (manaPerSecond)
                {
                    if (powertype == POWER_HEALTH)
                        caster->ModifyHealth(-manaPerSecond);
                    else
                        caster->ModifyPower(powertype, -manaPerSecond);
                }
            }
        }
    }

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (Aura *aura = GetAuraByEffectIndex(SpellEffectIndex(i)))
            aura->UpdateAura(diff);

    if (!m_target || !m_target->IsInWorld())
        return;

    // Channeled aura required check distance from caster
    if (IsChanneledSpell(m_spellProto) && GetCasterGuid() != m_target->GetObjectGuid())
    {
        Unit* caster = GetCaster();
        if(!caster)
        {
            if (m_target)
                m_target->RemoveAurasByCasterSpell(GetId(), GetCasterGuid());
            return;
        }

        // need check distance for channeled target only
        if (caster->GetChannelObjectGuid() == m_target->GetObjectGuid())
        {
            // Get spell range
            float max_range = GetSpellMaxRange(sSpellRangeStore.LookupEntry(m_spellProto->rangeIndex));

            if(Player* modOwner = caster->GetSpellModOwner())
                modOwner->ApplySpellMod(GetId(), SPELLMOD_RANGE, max_range);

            if(!caster->IsWithinDistInMap(m_target, max_range))
            {
                caster->InterruptSpell(CURRENT_CHANNELED_SPELL);
                return;
            }
        }
    }
}

void SpellAuraHolder::RefreshHolder()
{
    SetAuraDuration(GetAuraMaxDuration());
    SendAuraUpdate(false);
}

void SpellAuraHolder::SetAuraMaxDuration(int32 duration)
{
    m_maxDuration = duration;

    // possible overwrite persistent state
    if (duration > 0)
    {
        if (!(IsPassive() && GetSpellProto()->DurationIndex == 0))
            SetPermanent(false);

        SetAuraFlags(GetAuraFlags() | AFLAG_DURATION);
    }
    else
        SetAuraFlags(GetAuraFlags() & ~AFLAG_DURATION);
}

bool SpellAuraHolder::HasMechanic(uint32 mechanic) const
{
    if (mechanic == m_spellProto->Mechanic)
        return true;

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (GetAura(SpellEffectIndex(i)) && m_spellProto->EffectMechanic[i] == mechanic)
            return true;
    return false;
}

bool SpellAuraHolder::HasMechanicMask(uint32 mechanicMask) const
{
    if (mechanicMask & (1 << (m_spellProto->Mechanic - 1)))
        return true;

    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (GetAura(SpellEffectIndex(i)) && m_spellProto->EffectMechanic[i] && ((1 << (m_spellProto->EffectMechanic[i] -1)) & mechanicMask))
            return true;
    return false;
}

bool SpellAuraHolder::IsPersistent() const
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (Aura const* aur = GetAura(SpellEffectIndex(i)))
            if (aur->IsPersistent())
                return true;
    return false;
}

bool SpellAuraHolder::IsAreaAura() const
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (Aura const* aur = GetAura(SpellEffectIndex(i)))
            if (aur->IsAreaAura())
                return true;
    return false;
}

bool SpellAuraHolder::IsPositive() const
{
    if (GetAuraFlags() & AFLAG_POSITIVE)
        return true;
    else if (GetAuraFlags() & AFLAG_NEGATIVE)
        return false;

    // check, if no aura flags defined
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (Aura const* aur = GetAura(SpellEffectIndex(i)))
            if (!aur->IsPositive())
                return false;
    return true;
}

bool SpellAuraHolder::IsEmptyHolder() const
{
    for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        if (m_auraFlags & (1 << i))
            return false;
    return true;
}

void SpellAuraHolder::UnregisterAndCleanupTrackedAuras()
{
    TrackedAuraType trackedType = GetTrackedAuraType();
    if (!trackedType)
        return;

    if (trackedType == TRACK_AURA_TYPE_SINGLE_TARGET)
    {
        if (Unit* caster = GetCaster())
            caster->GetTrackedAuraTargets(trackedType).erase(GetSpellProto());
    }
    else if (trackedType == TRACK_AURA_TYPE_CONTROL_VEHICLE)
    {
        Unit* caster = GetCaster();
        if (caster && IsSpellHaveAura(GetSpellProto(), SPELL_AURA_CONTROL_VEHICLE, GetAuraFlags()))
        {
            caster->GetTrackedAuraTargets(trackedType).erase(GetSpellProto());
            caster->RemoveAurasDueToSpell(GetSpellProto()->Id);
        }
        else if (caster)
        {
            Unit::TrackedAuraTargetMap scTarget = caster->GetTrackedAuraTargets(trackedType);
            Unit::TrackedAuraTargetMap::iterator find = scTarget.find(GetSpellProto());
            if (find != scTarget.end())
            {
                ObjectGuid vehicleGuid = find->second;
                scTarget.erase(find);
                if (Unit* vehicle = caster->GetMap()->GetUnit(vehicleGuid))
                    vehicle->RemoveAurasDueToSpell(GetSpellProto()->Id, SpellAuraHolderPtr(), AURA_REMOVE_BY_DEFAULT);
            }
        }
    }

    m_trackedAuraType = TRACK_AURA_TYPE_NOT_TRACKED;
}

void SpellAuraHolder::SetVisibleAura(bool remove)
{
    SpellAuraHolderPtr currentHolder = SpellAuraHolderPtr();
    if (!remove)
    {
        for (int32 i = 0; i < MAX_EFFECT_INDEX; ++i)
        {
            if (Aura const* aura = GetAura(SpellEffectIndex(i)))
            {
                currentHolder = aura->GetHolder();
                break;
            }
        }
        //MANGOS_ASSERT(currentHolder);
    }
    m_target->SetVisibleAura(m_auraSlot, currentHolder);
}

void Aura::HandleAuraModReflectSpells(bool Apply, bool Real)
{
    if (!Real)
        return;

    //Unit* target = GetTarget();
    Unit* caster = GetCaster();

    if (Apply)
    {
        switch(GetId() )
        {
            // Improved Spell Reflection
            case 23920:
            {
                if (!caster)
                    return;

                Unit::AuraList const& lDummyAuras = caster->GetAurasByType(SPELL_AURA_DUMMY);
                for(Unit::AuraList::const_iterator i = lDummyAuras.begin(); i != lDummyAuras.end(); ++i)
                {
                    if((*i)->GetSpellProto()->SpellIconID == 1935)
                    {
                        caster->CastSpell(caster, 59725, true);
                        break;
                    }
                }
                break;
            }
            default:
                break;
        }
    }
}

void Aura::HandleAuraSetVehicle(bool apply, bool real)
{
    if (!real)
        return;

    Unit* target = GetTarget();

    if (!target || !target->IsInWorld())
        return;

    uint32 vehicleId = GetMiscValue();

    target->SetVehicleId(apply ? vehicleId : 0);

}

void Aura::HandleAuraFactionChange(bool apply, bool real)
{
    if (!real)
        return;

    Unit* target = GetTarget();

    if (!target || !target->IsInWorld())
        return;

    uint32 newFaction = apply ? GetMiscValue() : target->GetOriginalFaction();

    if (newFaction && newFaction != target->getFaction())
        target->setFaction(newFaction);

}

// FIXME: this is only temp. fix for not allowing charmed player to deal damage/heal
void Aura::HandleAuraAoECharm(bool apply, bool real)
{
    if (!real)
        return;

    Unit *pTarget = GetTarget();

    if (!pTarget || !pTarget->IsInWorld() || pTarget->GetTypeId() != TYPEID_PLAYER)
        return;

    Player *pPlayerTarget = (Player*)pTarget;

    switch(GetId())
    {
        case 70923:                                     // Uncontrollable Frenzy (Queen Lana'thel)
        {
            if (apply)
                pPlayerTarget->setFaction(16);
            else
                pPlayerTarget->setFactionForRace(pPlayerTarget->getRace());

            break;
        }
        default:
        {
            if (apply)
            {
                Unit *pCaster = GetCaster();

                if (pCaster && pCaster != pTarget)
                    pPlayerTarget->setFaction(pCaster->getFaction());
                else
                    pPlayerTarget->setFaction(16);
            }
            else
                pPlayerTarget->setFactionForRace(pPlayerTarget->getRace());

            break;
        }
    }
}

uint32 Aura::CalculateCrowdControlBreakDamage()
{
    if (!GetTarget())
        return 0;

    if (!IsCrowdControlAura(m_modifier.m_auraname))
        return 0;

    // auras with this attribute not have damage cap
    if (GetSpellProto()->HasAttribute(SPELL_ATTR_EX_BREAKABLE_BY_ANY_DAMAGE) &&
        ((GetSpellProto()->AuraInterruptFlags & AURA_INTERRUPT_FLAG_DIRECT_DAMAGE) ||
        (GetSpellProto()->HasAttribute(SPELL_ATTR_BREAKABLE_BY_DAMAGE) && !GetSpellProto()->HasAttribute(SPELL_ATTR_STOP_ATTACK_TARGET))))
        return 0;

    // Damage cap for CC effects
    uint32 damageCap = (int32)((float)GetTarget()->GetMaxHealth() * sWorld.getConfig(CONFIG_FLOAT_CROWDCONTROL_HP_BASE));

    if (damageCap < 50)
        damageCap = 50;

    Unit* caster = GetCaster();

    if (!caster)
        return damageCap;

    MAPLOCK_READ(caster,MAP_LOCK_TYPE_AURAS);

    // Glyphs increasing damage cap
    Unit::AuraList const& overrideClassScripts = caster->GetAurasByType(SPELL_AURA_OVERRIDE_CLASS_SCRIPTS);
    for (Unit::AuraList::const_iterator itr = overrideClassScripts.begin(); itr != overrideClassScripts.end(); ++itr)
    {
        if((*itr)->isAffectedOnSpell(GetSpellProto()))
        {
            // Glyph of Fear, Glyph of Frost nova and similar auras
            if ((*itr)->GetMiscValue() == 7801)
            {
                damageCap += (int32)(damageCap * (*itr)->GetModifier()->m_amount / 100.0f);
                break;
            }
        }
    }
    return damageCap;
}

bool Aura::IsAffectedByCrowdControlEffect(uint32 damage)
{
    if (!IsCrowdControlAura(m_modifier.m_auraname))
        return false;

    if (int32(damage) > abs(m_modifier.m_baseamount))
    {
        m_modifier.m_baseamount = 0;
        return false;
    }

    m_modifier.m_baseamount -= damage;
    return true;
}

void Aura::HandleInitializeImages(bool apply, bool real)
{
    if (!real)
        return;

    Unit* caster = GetCaster();
    Unit* target = GetTarget();

    if (!caster || !target || !target->IsInWorld() || target->GetTypeId() != TYPEID_UNIT)
        return;

    if (apply)
    {
        target->SetName(caster->GetName());
    }
    else
    {
        CreatureInfo const* cinfo = ((Creature*)target)->GetCreatureInfo();
        if (!cinfo)
        {
            sLog.outErrorDb("Aura::HandleInitializeImages try set name to unknown creature %s", target->GetObjectGuid().GetString().c_str());
            return;
        }
        target->SetName(cinfo->Name);
    }
}
