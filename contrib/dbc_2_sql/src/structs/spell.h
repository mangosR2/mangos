/*
 DBC to SQL Converter
    Copyright (C) 2009  David Vas, Anubisss
    <http://code.google.com/p/dbctosql/>
    updated by Przemratajczak and Darkrulerz
	
	DBC to SQL Converter
    Copyright (C) 2010 -2011  Infinity_mangos_Project
    www.github.com/fallenangelX
    updated this time around by fallenangelX and singlem

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef __SPELL_H__
#define __SPELL_H__

char const *SPELL_DBC   = "Spell.dbc";
char const *SPELL_SQL   = "spell_dbc_dev.sql";
char const *SPELL_TABLE = "spell_dbc_dev";

#define SPELL_DBC_CLIENT_BUILD  12340 // 3.3.5

#define SPELL_DBC_COLUMN_NUMS   234
#define SPELL_DBC_ROWS_NUMS     49839

// Spell.dbc struct: MaNGOS 10120
char const *spell_translation[SPELL_DBC_COLUMN_NUMS][2] =
{
    {"uint32",   "Id"},                                           // 0        m_ID
    {"uint32",   "Category"},                                     // 1        m_category
    {"uint32",   "Dispel"},                                       // 2        m_dispelType
    {"uint32",   "Mechanic"},                                     // 3        m_mechanic
    {"uint32",   "Attributes"},                                   // 4        m_attribute
    {"uint32",   "AttributesEx"},                                 // 5        m_attributesEx
    {"uint32",   "AttributesEx2"},                                // 6        m_attributesExB
    {"uint32",   "AttributesEx3"},                                // 7        m_attributesExC
    {"uint32",   "AttributesEx4"},                                // 8        m_attributesExD
    {"uint32",   "AttributesEx5"},                                // 9        m_attributesExE
    {"uint32",   "AttributesEx6"},                                // 10       m_attributesExF
    {"uint32",   "AttributesEx7"},                                // 11       m_attributesExG
    {"uint32",   "Stances"},                                      // 12       m_shapeshiftMask
    {"uint32",   "unk_320_2"},                                    // 13       3.2.0
    {"uint32",   "StancesNot"},                                   // 14       m_shapeshiftExclude
    {"uint32",   "unk_320_3"},                                    // 15       3.2.0
    {"uint32",   "Targets"},                                      // 16       m_targets
    {"uint32",   "TargetCreatureType"},                           // 17       m_targetCreatureType
    {"uint32",   "RequiresSpellFocus"},                           // 18       m_requiresSpellFocus
    {"uint32",   "FacingCasterFlags"},                            // 19       m_facingCasterFlags
    {"uint32",   "CasterAuraState"},                              // 20       m_casterAuraState
    {"uint32",   "TargetAuraState"},                              // 21       m_targetAuraState
    {"uint32",   "ExcludeCasterAuraState"},                       // 22       m_excludeCasterAuraState
    {"uint32",   "ExcludeTargetAuraState"},                       // 23       m_excludeTargetAuraState
    {"uint32",   "CasterAuraSpell"},                              // 24       m_casterAuraSpell
    {"uint32",   "TargetAuraSpell"},                              // 25       m_targetAuraSpell
    {"uint32",   "ExcludeCasterAuraSpell"},                       // 26       m_excludeCasterAuraSpell
    {"uint32",   "ExcludeTargetAuraSpell"},                       // 27       m_excludeTargetAuraSpell
    {"uint32",   "CastingTimeIndex"},                             // 28       m_castingTimeIndex
    {"uint32",   "RecoveryTime"},                                 // 29       m_recoveryTime
    {"uint32",   "CategoryRecoveryTime"},                         // 30       m_categoryRecoveryTime
    {"uint32",   "InterruptFlags"},                               // 31       m_interruptFlags
    {"uint32",   "AuraInterruptFlags"},                           // 32       m_auraInterruptFlags
    {"uint32",   "ChannelInterruptFlags"},                        // 33       m_channelInterruptFlags
    {"uint32",   "ProcFlags"},                                    // 34       m_procTypeMask
    {"uint32",   "ProcChance"},                                   // 35       m_procChance
    {"uint32",   "ProcCharges"},                                  // 36       m_procCharges
    {"uint32",   "MaxLevel"},                                     // 37       m_maxLevel
    {"uint32",   "BaseLevel"},                                    // 38       m_baseLevel
    {"uint32",   "SpellLevel"},                                   // 39       m_spellLevel
    {"uint32",   "DurationIndex"},                                // 40       m_durationIndex
    {"uint32",   "PowerType"},                                    // 41       m_powerType
    {"uint32",   "ManaCost"},                                     // 42       m_manaCost
    {"uint32",   "ManaCostPerlevel"},                             // 43       m_manaCostPerLevel
    {"uint32",   "ManaPerSecond"},                                // 44       m_manaPerSecond
    {"uint32",   "ManaPerSecondPerLevel"},                        // 45       m_manaPerSecondPerLeve
    {"uint32",   "RangeIndex"},                                   // 46       m_rangeIndex
    {"float",    "Speed"},                                        // 47       m_speed
    {"uint32",   "ModalNextSpell"},                               // 48       m_modalNextSpell not used
    {"uint32",   "StackAmount"},                                  // 49       m_cumulativeAura
    {"uint32",   "Totem1"},                                       // 50       m_totem
    {"uint32",   "Totem2"},                                       // 51       m_totem
    {"int32",    "Reagent1"},                                     // 52       m_reagent
    {"int32",    "Reagent2"},                                     // 53       m_reagent
    {"int32",    "Reagent3"},                                     // 54       m_reagent
    {"int32",    "Reagent4"},                                     // 55       m_reagent
    {"int32",    "Reagent5"},                                     // 56       m_reagent
    {"int32",    "Reagent6"},                                     // 57       m_reagent
    {"int32",    "Reagent7"},                                     // 58       m_reagent
    {"int32",    "Reagent8"},                                     // 59       m_reagent
    {"uint32",   "ReagentCount1"},                                // 60       m_reagentCount
    {"uint32",   "ReagentCount2"},                                // 61       m_reagentCount
    {"uint32",   "ReagentCount3"},                                // 62       m_reagentCount
    {"uint32",   "ReagentCount4"},                                // 63       m_reagentCount
    {"uint32",   "ReagentCount5"},                                // 64       m_reagentCount
    {"uint32",   "ReagentCount6"},                                // 65       m_reagentCount
    {"uint32",   "ReagentCount7"},                                // 66       m_reagentCount
    {"uint32",   "ReagentCount8"},                                // 67       m_reagentCount
    {"int32",    "EquippedItemClass"},                            // 68       m_equippedItemClass (value)
    {"int32",    "EquippedItemSubClassMask"},                     // 69       m_equippedItemSubclass (mask)
    {"int32",    "EquippedItemInventoryTypeMask"},                // 70       m_equippedItemInvTypes (mask)
    {"uint32",   "Effect1"},                                      // 71       m_effect
    {"uint32",   "Effect2"},                                      // 72       m_effect
    {"uint32",   "Effect3"},                                      // 73       m_effect
    {"int32",    "EffectDieSides1"},                              // 74       m_effectDieSides
    {"int32",    "EffectDieSides2"},                              // 75       m_effectDieSides
    {"int32",    "EffectDieSides3"},                              // 76       m_effectDieSides
    {"float",    "EffectRealPointsPerLevel1"},                    // 77       m_effectRealPointsPerLevel
    {"float",    "EffectRealPointsPerLevel2"},                    // 78       m_effectRealPointsPerLevel
    {"float",    "EffectRealPointsPerLevel3"},                    // 79       m_effectRealPointsPerLevel
    {"int32",    "EffectBasePoints1"},                            // 80       m_effectBasePoints (don't must be used in spell/auras explicitly, must be used 
    {"int32",    "EffectBasePoints2"},                            // 81       m_effectBasePoints (don't must be used in spell/auras explicitly, must be used 
    {"int32",    "EffectBasePoints3"},                            // 82       m_effectBasePoints (don't must be used in spell/auras explicitly, must be used cached Spell::m_currentBasePoints)
    {"uint32",   "EffectMechanic1"},                              // 83       m_effectMechanic
    {"uint32",   "EffectMechanic2"},                              // 84       m_effectMechanic
    {"uint32",   "EffectMechanic3"},                              // 85       m_effectMechanic
    {"uint32",   "EffectImplicitTargetA1"},                       // 86       m_implicitTargetA
    {"uint32",   "EffectImplicitTargetA2"},                       // 87       m_implicitTargetA
    {"uint32",   "EffectImplicitTargetA3"},                       // 88       m_implicitTargetA
    {"uint32",   "EffectImplicitTargetB1"},                       // 89       m_implicitTargetB
    {"uint32",   "EffectImplicitTargetB2"},                       // 90       m_implicitTargetB
    {"uint32",   "EffectImplicitTargetB3"},                       // 91       m_implicitTargetB
    {"uint32",   "EffectRadiusIndex1"},                           // 92       m_effectRadiusIndex - spellradius.dbc
    {"uint32",   "EffectRadiusIndex2"},                           // 93       m_effectRadiusIndex - spellradius.dbc
    {"uint32",   "EffectRadiusIndex3"},                           // 94       m_effectRadiusIndex - spellradius.dbc
    {"uint32",   "EffectApplyAuraName1"},                         // 95       m_effectAura
    {"uint32",   "EffectApplyAuraName2"},                         // 96       m_effectAura
    {"uint32",   "EffectApplyAuraName3"},                         // 97       m_effectAura
    {"uint32",   "EffectAmplitude1"},                             // 98       m_effectAuraPeriod
    {"uint32",   "EffectAmplitude2"},                             // 99       m_effectAuraPeriod
    {"uint32",   "EffectAmplitude3"},                             // 100      m_effectAuraPeriod
    {"float",    "EffectMultipleValue1"},                         // 101      m_effectAmplitude
    {"float",    "EffectMultipleValue2"},                         // 102      m_effectAmplitude
    {"float",    "EffectMultipleValue3"},                         // 103      m_effectAmplitude
    {"uint32",   "EffectChainTarget1"},                           // 104      m_effectChainTargets
    {"uint32",   "EffectChainTarget2"},                           // 105      m_effectChainTargets
    {"uint32",   "EffectChainTarget3"},                           // 106      m_effectChainTargets
    {"uint32",   "EffectItemType1"},                              // 107      m_effectItemType
    {"uint32",   "EffectItemType2"},                              // 108      m_effectItemType
    {"uint32",   "EffectItemType3"},                              // 109      m_effectItemType
    {"int32",    "EffectMiscValue1"},                             // 110      m_effectMiscValue
    {"int32",    "EffectMiscValue2"},                             // 111      m_effectMiscValue
    {"int32",    "EffectMiscValue3"},                             // 112      m_effectMiscValue
    {"int32",    "EffectMiscValueB1"},                            // 113      m_effectMiscValueB
    {"int32",    "EffectMiscValueB2"},                            // 114      m_effectMiscValueB
    {"int32",    "EffectMiscValueB3"},                            // 115      m_effectMiscValueB
    {"uint32",   "EffectTriggerSpell1"},                          // 116      m_effectTriggerSpell
    {"uint32",   "EffectTriggerSpell2"},                          // 117      m_effectTriggerSpell
    {"uint32",   "EffectTriggerSpell3"},                          // 118      m_effectTriggerSpell
    {"float",    "EffectPointsPerComboPoint1"},                   // 119      m_effectPointsPerCombo
    {"float",    "EffectPointsPerComboPoint2"},                   // 120      m_effectPointsPerCombo
    {"float",    "EffectPointsPerComboPoint3"},                   // 121      m_effectPointsPerCombo
    {"uint32",   "EffectSpellClassMaskA1"},                       // 122      m_effectSpellClassMaskA, effect 0
    {"uint32",   "EffectSpellClassMaskA2"},                       // 123      m_effectSpellClassMaskA, effect 0
    {"uint32",   "EffectSpellClassMaskA3"},                       // 124      m_effectSpellClassMaskA, effect 0
    {"uint32",   "EffectSpellClassMaskB1"},                       // 125      m_effectSpellClassMaskB, effect 1
    {"uint32",   "EffectSpellClassMaskB2"},                       // 126      m_effectSpellClassMaskB, effect 1
    {"uint32",   "EffectSpellClassMaskB3"},                       // 127      m_effectSpellClassMaskB, effect 1
    {"uint32",   "EffectSpellClassMaskC1"},                       // 128      m_effectSpellClassMaskC, effect 2
    {"uint32",   "EffectSpellClassMaskC2"},                       // 129      m_effectSpellClassMaskC, effect 2
    {"uint32",   "EffectSpellClassMaskC3"},                       // 130      m_effectSpellClassMaskC, effect 2
    {"uint32",   "SpellVisual1"},                                 // 131      m_spellVisualID
    {"uint32",   "SpellVisual2"},                                 // 132      m_spellVisualID
    {"uint32",   "SpellIconID"},                                  // 133      m_spellIconID
    {"uint32",   "ActiveIconID"},                                 // 134      m_activeIconID
    {"uint32",   "SpellPriority"},                                // 135      m_spellPriority not used
    {"char*",    "SpellName1"},                                   // 136      m_name_lang
    {"char*",    "SpellName2"},                                   // 137      m_name_lang
    {"char*",    "SpellName3"},                                   // 138      m_name_lang
    {"char*",    "SpellName4"},                                   // 139      m_name_lang
    {"char*",    "SpellName5"},                                   // 140      m_name_lang
    {"char*",    "SpellName6"},                                   // 141      m_name_lang
    {"char*",    "SpellName7"},                                   // 142      m_name_lang
    {"char*",    "SpellName8"},                                   // 143      m_name_lang
    {"char*",    "SpellName9"},                                   // 144      m_name_lang
    {"char*",    "SpellName10"},                                  // 145      m_name_lang
    {"char*",    "SpellName11"},                                  // 146      m_name_lang
    {"char*",    "SpellName12"},                                  // 147      m_name_lang
    {"char*",    "SpellName13"},                                  // 148      m_name_lang
    {"char*",    "SpellName14"},                                  // 149      m_name_lang
    {"char*",    "SpellName15"},                                  // 150      m_name_lang
    {"char*",    "SpellName16"},                                  // 151      m_name_lang
    {"uint32",   "SpellNameFlag"},                                // 152      not used
    {"char*",    "Rank1"},                                        // 153      m_nameSubtext_lang
    {"char*",    "Rank2"},                                        // 154      m_nameSubtext_lang
    {"char*",    "Rank3"},                                        // 155      m_nameSubtext_lang
    {"char*",    "Rank4"},                                        // 156      m_nameSubtext_lang
    {"char*",    "Rank5"},                                        // 157      m_nameSubtext_lang
    {"char*",    "Rank6"},                                        // 158      m_nameSubtext_lang
    {"char*",    "Rank7"},                                        // 159      m_nameSubtext_lang
    {"char*",    "Rank8"},                                        // 160      m_nameSubtext_lang
    {"char*",    "Rank9"},                                        // 161      m_nameSubtext_lang
    {"char*",    "Rank10"},                                       // 162      m_nameSubtext_lang
    {"char*",    "Rank11"},                                       // 163      m_nameSubtext_lang
    {"char*",    "Rank12"},                                       // 164      m_nameSubtext_lang
    {"char*",    "Rank13"},                                       // 165      m_nameSubtext_lang
    {"char*",    "Rank14"},                                       // 166      m_nameSubtext_lang
    {"char*",    "Rank15"},                                       // 167      m_nameSubtext_lang
    {"char*",    "Rank16"},                                       // 168      m_nameSubtext_lang
    {"uint32",   "RankFlags"},                                    // 169      not used
    {"text",     "Description1"},                                 // 170      m_description_lang not used
    {"char*",    "Description2"},                                 // 171      m_description_lang not used
    {"char*",    "Description3"},                                 // 172      m_description_lang not used
    {"char*",    "Description4"},                                 // 173      m_description_lang not used
    {"char*",    "Description5"},                                 // 174      m_description_lang not used
    {"char*",    "Description6"},                                 // 175      m_description_lang not used
    {"char*",    "Description7"},                                 // 176      m_description_lang not used
    {"char*",    "Description8"},                                 // 177      m_description_lang not used
    {"char*",    "Description9"},                                 // 178      m_description_lang not used
    {"char*",    "Description10"},                                // 179      m_description_lang not used
    {"char*",    "Description11"},                                // 180      m_description_lang not used
    {"char*",    "Description12"},                                // 181      m_description_lang not used
    {"char*",    "Description13"},                                // 182      m_description_lang not used
    {"char*",    "Description14"},                                // 183      m_description_lang not used
    {"char*",    "Description15"},                                // 184      m_description_lang not used
    {"char*",    "Description16"},                                // 185      m_description_lang not used
    {"uint32",   "DescriptionFlags"},                             // 186      not used
    {"char*",    "ToolTip1"},                                     // 187      m_auraDescription_lang not used
    {"char*",    "ToolTip2"},                                     // 188      m_auraDescription_lang not used
    {"char*",    "ToolTip3"},                                     // 189      m_auraDescription_lang not used
    {"char*",    "ToolTip4"},                                     // 190      m_auraDescription_lang not used
    {"char*",    "ToolTip5"},                                     // 191      m_auraDescription_lang not used
    {"char*",    "ToolTip6"},                                     // 192      m_auraDescription_lang not used
    {"char*",    "ToolTip7"},                                     // 193      m_auraDescription_lang not used
    {"char*",    "ToolTip8"},                                     // 194      m_auraDescription_lang not used
    {"char*",    "ToolTip9"},                                     // 195      m_auraDescription_lang not used
    {"char*",    "ToolTip10"},                                    // 196      m_auraDescription_lang not used
    {"char*",    "ToolTip11"},                                    // 197      m_auraDescription_lang not used
    {"char*",    "ToolTip12"},                                    // 198      m_auraDescription_lang not used
    {"char*",    "ToolTip13"},                                    // 199      m_auraDescription_lang not used
    {"char*",    "ToolTip14"},                                    // 200      m_auraDescription_lang not used
    {"char*",    "ToolTip15"},                                    // 201      m_auraDescription_lang not used
    {"char*",    "ToolTip16"},                                    // 202      m_auraDescription_lang not used
    {"uint32",   "ToolTipFlags"},                                 // 203      not used
    {"uint32",   "ManaCostPct"},                                  // 204      m_manaCostPct
    {"uint32",   "StartRecoveryCategory"},                        // 205      m_startRecoveryCategory
    {"uint32",   "StartRecoveryTime"},                            // 206      m_startRecoveryTime
    {"uint32",   "MaxTargetLevel"},                               // 207      m_maxTargetLevel
    {"uint32",   "SpellFamilyName"},                              // 208      m_spellClassSet
    {"uint32",   "SpellFamilyFlags1"},                            // 209      m_spellClassMask NOTE: size is 12 bytes!!!
    {"uint32",   "SpellFamilyFlags2"},                            // 210      m_spellClassMask NOTE: size is 12 bytes!!!
    {"uint32",   "SpellFamilyFlags3"},                            // 211      addition to m_spellClassMask
    {"uint32",   "MaxAffectedTargets"},                           // 212      m_maxTargets
    {"uint32",   "DmgClass"},                                     // 213      m_defenseType
    {"uint32",   "PreventionType"},                               // 214      m_preventionType
    {"uint32",   "StanceBarOrder"},                               // 215      m_stanceBarOrder not used
    {"float",    "DmgMultiplier1"},                               // 216      m_effectChainAmplitude
    {"float",    "DmgMultiplier2"},                               // 217      m_effectChainAmplitude
    {"float",    "DmgMultiplier3"},                               // 218      m_effectChainAmplitude
    {"uint32",   "MinFactionId"},                                 // 219      m_minFactionID not used
    {"uint32",   "MinReputation"},                                // 220      m_minReputation not used
    {"uint32",   "RequiredAuraVision"},                           // 221      m_requiredAuraVision not used
    {"uint32",   "TotemCategory1"},                               // 222      m_requiredTotemCategoryID
    {"uint32",   "TotemCategory2"},                               // 223      m_requiredTotemCategoryID
    {"int32",    "AreaGroupId"},                                  // 224      m_requiredAreaGroupId
    {"uint32",   "SchoolMask"},                                   // 225      m_schoolMask
    {"uint32",   "RuneCostID"},                                   // 226      m_runeCostID
    {"uint32",   "SpellMissileID"},                               // 227      m_spellMissileID not used
    {"uint32",   "PowerDisplayId"},                               // 228      PowerDisplay.dbc, new in 3.1
    {"float",    "EffectBonusCoefficient1"},                                   // 229      3.2.0
    {"float",    "EffectBonusCoefficient2"},                                   // 230      3.2.0
    {"float",    "EffectBonusCoefficient3"},                                   // 231      3.2.0
    {"uint32",   "SpellDescriptionVariableID"},                   // 232      3.2.0
    {"uint32",   "SpellDifficultyId"},                            // 233      3.3.0
};

char const *SPELL_TABLE_INDEX = spell_translation[0][1];

#endif
