-- ------------------------
-- Instance Sunwell Plateau
-- ------------------------

-- ------------
-- Kalegcos ---
-- YTDB:614 ---
-- ------------

-- make normal and spectral realm bunnie invis to players
UPDATE `creature_template` SET `flags_extra` = 128 WHERE `entry` IN(25795, 25796);
-- correct spawn of kalegcos
UPDATE `creature` SET `position_x` = 1704.49, `position_y` = 925.522, `position_z` = -74.5584, `orientation` = 4.72577 WHERE `id` = 24891;
-- correct spawn of Sathrovarr
UPDATE `creature` SET `position_x` = 1704.63, `position_y` = 916.777, `position_z` = -74.5584, `orientation` = 1.68785 WHERE `id` = 24892;
-- disable spellProcEvent for invisibility spells
DELETE FROM `spell_proc_event` WHERE `entry` IN (46021, 44801);
INSERT INTO `spell_proc_event` SET `entry` = 46021;
INSERT INTO `spell_proc_event` SET `entry` = 44801;
-- prevent cast spell to players (it is self target)
DELETE FROM `spell_dbc` WHERE `Id` = 44807;
INSERT INTO `spell_dbc` (`Id`, `Category`, `Dispel`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `Stances`, `StancesNot`, `Targets`, `RequiresSpellFocus`, `CasterAuraState`, `TargetAuraState`, `CasterAuraStateNot`, `TargetAuraStateNot`, `CasterAuraSpell`, `TargetAuraSpell`, `ExcludeCasterAuraSpell`, `ExcludeTargetAuraSpell`, `CastingTimeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `InterruptFlags`, `AuraInterruptFlags`, `ProcFlags`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `PowerType`, `ManaCost`, `ManaCostPerLevel`, `ManaPerSecond`, `ManaPerSecondPerLevel`, `RangeIndex`, `Speed`, `StackAmount`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `Effect1`, `Effect2`, `Effect3`, `EffectDieSides1`, `EffectDieSides2`, `EffectDieSides3`, `EffectRealPointsPerLevel1`, `EffectRealPointsPerLevel2`, `EffectRealPointsPerLevel3`, `EffectBasePoints1`, `EffectBasePoints2`, `EffectBasePoints3`, `EffectMechanic1`, `EffectMechanic2`, `EffectMechanic3`, `EffectImplicitTargetA1`, `EffectImplicitTargetA2`, `EffectImplicitTargetA3`, `EffectImplicitTargetB1`, `EffectImplicitTargetB2`, `EffectImplicitTargetB3`, `EffectRadiusIndex1`, `EffectRadiusIndex2`, `EffectRadiusIndex3`, `EffectApplyAuraName1`, `EffectApplyAuraName2`, `EffectApplyAuraName3`, `EffectAmplitude1`, `EffectAmplitude2`, `EffectAmplitude3`, `EffectMultipleValue1`, `EffectMultipleValue2`, `EffectMultipleValue3`, `EffectItemType1`, `EffectItemType2`, `EffectMiscValue1`, `EffectMiscValue2`, `EffectMiscValue3`, `EffectMiscValueB1`, `EffectMiscValueB2`, `EffectMiscValueB3`, `EffectTriggerSpell1`, `EffectTriggerSpell2`, `EffectTriggerSpell3`, `EffectSpellClassMaskA1`, `EffectSpellClassMaskA2`, `EffectSpellClassMaskA3`, `EffectSpellClassMaskB1`, `EffectSpellClassMaskB2`, `EffectSpellClassMaskB3`, `EffectSpellClassMaskC1`, `EffectSpellClassMaskC2`, `EffectSpellClassMaskC3`, `SpellIconID`, `Comment`, `ManaCostPercentage`, `StartRecoveryCategory`, `StartRecoveryTime`, `MaxTargetLevel`, `SpellFamilyName`, `SpellFamilyFlags1`, `SpellFamilyFlags2`, `SpellFamilyFlags3`, `MaxAffectedTargets`, `DmgClass`, `PreventionType`, `DmgMultiplier1`, `DmgMultiplier2`, `DmgMultiplier3`, `AreaGroupId`, `SchoolMask`, `RuneCostID` )
VALUES (44807, 0, 0, 0, 264592, 0, 4, 268435456, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 101, 0, 0, 26, 26, 6, 0, 0, 0, 0, 0, 1, 0, 0, -1, 0, 0, 6, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, 22, 0, 0, 7, 0, 0, 28, 0, 0, 23, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 44806, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 95, "Crazed Rage", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0 );
UPDATE `spell_dbc` SET
`EffectImplicitTargetA1` = 1,
`EffectImplicitTargetB1` = 1,
`Comment` = 'Replacement target for spell 44807 ("Crazed Rage")'
WHERE `Id` = 44807;

-- ------------
-- Brutallus --
-- YTDB:614 ---
-- ------------

-- remove static spawn as Madrigosa is summoned when needed
DELETE FROM `creature` WHERE `id` = 24895 AND `map` = 580;
-- brutallus should be a ground only walker
UPDATE `creature_template` SET `InhabitType` = 1 WHERE `entry` = 24882;
-- Death cloud invis to players
UPDATE `creature_template` SET `flags_extra` = 128 WHERE `entry` = 25703;

-- -------------
-- Felmyst -----
-- YTDB:614 ----
-- -------------

-- remove static spawn as Felmyst is summoned when needed
DELETE FROM `creature` WHERE `id` = 25038;

UPDATE `creature_template` SET `ScriptName` = 'npc_felmyst_vapor' WHERE `entry` = 25265;
UPDATE `creature_template` SET `ScriptName` = 'npc_felmyst_vapor_cloud' WHERE `entry` = 25267;

-- Demonic Vapor :: unit flags (not attackable, pacified, not selectable), bosslevel, factions, speed, spawn/dmg aura
UPDATE `creature_template` SET `modelid_2` = 11686, `minlevel` = 73, `maxlevel` = 73, `faction_A` = 16, `faction_H` = 16, `unit_flags` = 33685506 WHERE `entry` = 25265;
DELETE FROM `creature_template_addon` WHERE `entry` = '25265';
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
(25265, 0, 0, 0, 0, 0, 0, '45411');

-- Demonic Vapor Cloud :: unit flags (not attackable, pacified, not selectable), bosslevel, factions
UPDATE `creature_template` SET `modelid_2` = 11686, `minlevel` = 73, `maxlevel` = 73, `faction_A` = 16, `faction_H` = 16, `unit_flags` = 33685506 WHERE `entry` = 25267;

-- Unyielding Death: Aura
DELETE FROM `creature_template_addon` WHERE `entry` = 25268;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
(25268, 0, 0, 0, 0, 0, 0, '45415');

-- ------------
-- The Twins --
-- YTDB:614 ---
-- ------------

-- Shadowy Image fixes
UPDATE `creature_template` SET `minlevel` = 73, `maxlevel` = 73, `minhealth` = 10000, `maxhealth` = 10000, `faction_A` = 14, `faction_H` = 14, `unit_flags` = `unit_flags` | 33554432 | 2 WHERE `entry` = 25214;

-- ------------
-- M'uru ------
-- YTDB:614 ---
-- ------------
UPDATE `creature_template` SET `AIName` = '', `equipment_id` = 0 WHERE `entry` IN(25741, 25840);

-- Dark fiend fixes
UPDATE `creature_template` SET `ScriptName` = 'mob_dark_fiend', `AIName` = '' WHERE `entry` = 25744;
-- move slower then the player they are suppose run away from then
UPDATE `creature_template` SET `speed_walk` = 0.7, `speed_run` = 0.7 WHERE `entry` = 25744;
-- shorter attack range ( needs to be for chase explode )
UPDATE `creature_model_info` SET `combat_reach` = 0.5 WHERE `modelid` IN(1126,23842);

-- Singularity

-- move slower then the player they are suppose run away from then
UPDATE `creature_template` SET `faction_A` = 14, `faction_H` = 14, `speed_walk` = 0.7, `speed_run` = 0.7 WHERE `entry` = 25855;

UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 2, `ScriptName` = 'mob_singularity' WHERE `entry` = 25855;

UPDATE `creature_template` SET `modelid_1` = 25206, `modelid_2` = 25206 WHERE `entry` = 25855;
-- added throw character aura if they get to close and acrance form aura
DELETE FROM `creature_template_addon` WHERE `entry` = 25855;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
(25855, 0, 0, 0, 0, 0, 0, '46228 48019');
-- short their attack range to they have to be close before effect iss triggered
UPDATE `creature_model_info` SET `bounding_radius` = 0.75, `combat_reach` = 0.5 WHERE `modelid` = 25206;

-- fixes to the portal targets --

-- specify target of spells
DELETE FROM `spell_script_target` WHERE `entry` IN(45976, 46177, 46178, 46208);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(45976, 1, 25770),
(46177, 1, 25770),
(46178, 1, 25741),
(46208, 1, 25741);
-- added no movement to template as well
UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 4 WHERE `entry` = 25770;
-- disable movement in spawn distance
UPDATE `creature` SET spawndist = 0, `MovementType` = 0 WHERE `id` = 25770;

-- --------------------------------
-- kil jaeden
-- YTDB:614 ---
-- --------------------------------

-- Replace Kil'jaeden with Kil'jaeden controller
DELETE FROM creature WHERE id IN(25608, 25315);
INSERT INTO creature (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`)
VALUES (800110, 25608, 580, 1, 1, 0, 0, 1698.61, 628.414, 27.5395, 3.99799, 604800, 0, 0, 9347800, 1693500, 0, 0);
-- Kalecgos summoning by script
DELETE FROM creature WHERE id = 25319;
-- Kalecgos speed
UPDATE `creature_template` SET `speed_walk` = 5, `speed_run` = 5 WHERE `entry` = 25319;
-- Anveena position
UPDATE `creature` SET position_z = 60.0 WHERE id = 26046;
-- Orb of the Blue Flight
UPDATE `gameobject_template` SET `type` = 10, `flags` = 16 WHERE `entry` = 188415;
UPDATE `gameobject_template` SET `ScriptName` = 'go_orb_of_the_blue_flight' WHERE `entry` = 188415;
-- Felfire Portal
UPDATE `creature_template` SET `unit_flags` = 33554438, `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 25603;
UPDATE `creature_template` SET `ScriptName` = 'mob_felfire_portal' WHERE `entry` = 25603;
-- Kil'jaeden
UPDATE `creature_template` SET `unit_flags` = `unit_flags` | 4 WHERE `entry` = 25315;
-- Shield Orb
UPDATE `creature_template` SET `ScriptName` = 'mob_shield_orb' WHERE `entry` = 25502;
UPDATE `creature_template` SET `speed_walk` = 2, `speed_run` = 2 WHERE `entry` = 25502;
-- armageddon creature
UPDATE `creature_template` SET `ScriptName` = 'npc_armageddon_target' WHERE `entry` = 25735;
UPDATE `creature_template` SET `modelid_1` = 15880, `unit_flags` = 33554438, `faction_A` = 14, `faction_H` = 14, `minlevel` = 73, `maxlevel` = 73 WHERE `entry` = 25735;

-- ---------------------------------------------
-- InstanceFixes and Related Data --------------
-- YTDB:614 ------------------------------------
-- ---------------------------------------------
UPDATE `gameobject_template` SET `flags` = `flags` | 6 WHERE `entry` IN(187990, 188118);
UPDATE `gameobject_template` SET `flags` = 38  WHERE `entry` = 188075;

-- Some missing doors
DELETE FROM `gameobject` WHERE `id` = 188118 AND `map` = 580;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(400000, 188118, 580, 1, 1, 1777.03, 674.714, 71.1903, 2.31614, 0, 0, 0.916031, 0.401107, 25, 255, 1);

DELETE FROM `gameobject` WHERE `id` = 187990 AND `map` = 580;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(400001, 187990, 580, 1, 1, 1849.54, 597.848, 81.9718, 5.59911, 0, 0, 0.335408, -0.942073, 25, 255, 1);

DELETE FROM `gameobject` WHERE `id` = 187766 AND `map` = 580;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(400002, 187766, 580, 1, 1, 1710.29, 531.319, 93.3079, 4.30948, 0, 0, 0.834295, -0.551318, 25, 255, 1);

DELETE FROM `gameobject` WHERE `id` = 187764 AND `map` = 580;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(400003, 187764, 580, 1, 1, 1832.99, 671.026, 42.7647, 4.45321, 0, 0, 0.792556, -0.609799, 25, 255, 1);

DELETE FROM `gameobject` WHERE `id` = 187765 AND `map` = 580;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(400004, 187765, 580, 1, 1, 1693.96, 711.259, 83.7941, 6.18337, 0, 0, 0.0498847, -0.998755, 25, 255, 1);
