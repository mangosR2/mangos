-- ------------------------------------- --
-- ------- I am a temporary file ------- --
-- After a month my data will be deleted --
-- ------------------------------------- --
-- ===================================== --

-- ---------- --
-- 2013-09-06 --
-- ---------- --

-- mr2912

DELETE FROM `spell_dbc` WHERE `Id` = 47939;

-- ---------- --
-- 2013-09-07 --
-- ---------- --

-- mr2922

-- Replace DBC values for spell 69846 - "Frost Bomb"
DELETE FROM `spell_dbc` WHERE `Id` = 69846;
INSERT INTO `spell_dbc`
(`Id`, `Category`, `Dispel`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `Stances`, `StancesNot`, `Targets`, `RequiresSpellFocus`, `CasterAuraState`, `TargetAuraState`, `CasterAuraStateNot`, `TargetAuraStateNot`, `CasterAuraSpell`, `TargetAuraSpell`, `ExcludeCasterAuraSpell`, `ExcludeTargetAuraSpell`, `CastingTimeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `InterruptFlags`, `AuraInterruptFlags`, `ProcFlags`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `PowerType`, `ManaCost`, `ManaCostPerLevel`, `ManaPerSecond`, `ManaPerSecondPerLevel`, `RangeIndex`, `Speed`, `StackAmount`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `Effect1`, `Effect2`, `Effect3`, `EffectDieSides1`, `EffectDieSides2`, `EffectDieSides3`, `EffectRealPointsPerLevel1`, `EffectRealPointsPerLevel2`, `EffectRealPointsPerLevel3`, `EffectBasePoints1`, `EffectBasePoints2`, `EffectBasePoints3`, `EffectMechanic1`, `EffectMechanic2`, `EffectMechanic3`, `EffectImplicitTargetA1`, `EffectImplicitTargetA2`, `EffectImplicitTargetA3`, `EffectImplicitTargetB1`, `EffectImplicitTargetB2`, `EffectImplicitTargetB3`, `EffectRadiusIndex1`, `EffectRadiusIndex2`, `EffectRadiusIndex3`, `EffectApplyAuraName1`, `EffectApplyAuraName2`, `EffectApplyAuraName3`, `EffectAmplitude1`, `EffectAmplitude2`, `EffectAmplitude3`, `EffectMultipleValue1`, `EffectMultipleValue2`, `EffectMultipleValue3`, `EffectItemType1`, `EffectItemType2`, `EffectMiscValue1`, `EffectMiscValue2`, `EffectMiscValue3`, `EffectMiscValueB1`, `EffectMiscValueB2`, `EffectMiscValueB3`, `EffectTriggerSpell1`, `EffectTriggerSpell2`, `EffectTriggerSpell3`, `EffectSpellClassMaskA1`, `EffectSpellClassMaskA2`, `EffectSpellClassMaskA3`, `EffectSpellClassMaskB1`, `EffectSpellClassMaskB2`, `EffectSpellClassMaskB3`, `EffectSpellClassMaskC1`, `EffectSpellClassMaskC2`, `EffectSpellClassMaskC3`, `SpellIconID`, `Comment`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxTargetLevel`, `SpellFamilyName`, `SpellFamilyFlags1`, `SpellFamilyFlags2`, `SpellFamilyFlags3`, `MaxAffectedTargets`, `DmgClass`, `PreventionType`, `DmgMultiplier1`, `DmgMultiplier2`, `DmgMultiplier3`, `AreaGroupId`, `SchoolMask`, `RuneCostID`)
VALUES (69846, 0, 0, 0, 384, 136, 4, 0, 0, 0, 0, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 9, 0, 0, 101, 0, 0, 0, 0, 18, 0, 0, 0, 0, 0, 13, 8, 0, -1, 0, 0, 3, 28, 0, 1, 1, 0, 0, 0, 0, -1, -1, 0, 0, 0, 0, 87, 87, 0, 0, 0, 0, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 37186, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1236, "Frost Bomb", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 16, 0 );

UPDATE `spell_dbc` SET
`Speed` = 0 -- old value = 8
WHERE `Id` = 69846;

-- ---------- --
-- 2013-09-15 --
-- ---------- --

-- mr2935
UPDATE `spell_target_position` SET `target_position_z` = 1050.99 WHERE `id` IN(72546, 73655);
