-- instance
DELETE FROM `creature` WHERE `map` = 649 AND `id` IN 
(34797,34796,34799,35144,34780,34460,34463,34461,34471,34475,34472,34453,34455,34458,34454,34451,34456,34497,34496,34564,34467,35465,34468,35610,34473,34474,34441,34449,34448,34450,34606, 34605, 34607);

-- announcers
INSERT IGNORE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(114727, 34816, 649, 15, 65535, 0, 0, 559.258, 90.2662, 395.123, 5.01319, 300, 0, 0, 126000, 0, 0, 0);
UPDATE `creature_template` SET `ScriptName` = 'npc_toc_announcer' WHERE `entry` = 34816;
DELETE FROM `creature` WHERE `map` = 649 AND `id` = 35766;

DELETE FROM `npc_text` WHERE `ID` IN (724001, 724002, 724003, 724004, 724005, 724006); 
INSERT INTO `npc_text` (`ID`, `Text0_0`) VALUES
(724001, 'Greetings $N! Are you ready to be tested in Crusaders Coliseum?'),
(724002, 'Are you ready for the next stage?'),
(724003, 'Are you ready to fight the champions of the Silver vanguard?'),
(724004, 'Are you ready for the next stage?'),
(724005, 'Are you ready to continue battle with Anub-Arak?'),
(724006, 'Today, the arena is closed.');

DELETE FROM `locales_npc_text` WHERE `entry` IN (724001, 724002, 724003, 724004, 724005, 724006); 
INSERT INTO `locales_npc_text` (`entry`, `Text0_0_loc1`, `Text0_0_loc2`, `Text0_0_loc3`, `Text0_0_loc4`, `Text0_0_loc5`, `Text0_0_loc6`, `Text0_0_loc7`, `Text0_0_loc8`) VALUES
(724001, 'Greetings $N! Are you ready to be tested in Crusaders Coliseum?', NULL, NULL, NULL, NULL, NULL, NULL, 'Приветствую, $N! Вы готовы пройти Испытание Крестоносца?'),
(724002, 'Are you ready for the next stage?', NULL, NULL, NULL, NULL, NULL, NULL, 'Вы готовы к следующему этапу?'),
(724003, 'Are you ready to fight the champions of the Silver vanguard?', NULL, NULL, NULL, NULL, NULL, NULL, 'Вы готовы драться с чемпионами Серебряного авангарда?'),
(724004, 'Are you ready for the next stage?', NULL, NULL, NULL, NULL, NULL, NULL, 'Вы готовы к следующему этапу?'),
(724005, 'Are you ready to continue battle with Anub-Arak?', NULL, NULL, NULL, NULL, NULL, NULL, 'Вы готовы продолжить бой с Ануб-Араком?'),
(724006, 'Today, the arena is closed.', NULL, NULL, NULL, NULL, NULL, NULL, 'На сегодня арена закрыта.');

UPDATE `creature_template` SET `scriptname`='boss_lich_king_toc' WHERE `entry`=35877;
UPDATE `creature_template` SET `minhealth`= 20000, `maxhealth` = 20000, `ScriptName` = 'npc_fizzlebang_toc' WHERE `entry` = 35458;
UPDATE `creature_template` SET `flags_extra`=0 WHERE `entry` IN (22517, 35651);
DELETE FROM `creature` WHERE `map` = 649 AND `id` IN (35651, 22517);

UPDATE `creature_template` SET `scriptname`='npc_tirion_toc' WHERE `entry`=34996;
UPDATE `creature_template` SET `scriptname`='npc_garrosh_toc' WHERE `entry`=34995;
UPDATE `creature_template` SET `scriptname`='npc_rinn_toc' WHERE `entry`=34990;

-- Grand crusaders
UPDATE `creature_template` SET `scriptname`='mob_toc_warrior', `AIName` ='' WHERE `entry` IN (34475,34453);
UPDATE `creature_template` SET `scriptname`='mob_toc_mage', `AIName` ='' WHERE `entry` IN (34468,34449);
UPDATE `creature_template` SET `scriptname`='mob_toc_shaman', `AIName` ='' WHERE `entry` IN (34463,34455);
UPDATE `creature_template` SET `scriptname`='mob_toc_enh_shaman', `AIName` ='' WHERE `entry` IN (34470,34444);
UPDATE `creature_template` SET `scriptname`='mob_toc_hunter', `AIName` ='' WHERE `entry` IN (34467,34448);
UPDATE `creature_template` SET `scriptname`='mob_toc_rogue', `AIName` ='' WHERE `entry` IN (34472,34454);
UPDATE `creature_template` SET `scriptname`='mob_toc_priest', `AIName` ='' WHERE `entry` IN (34466,34447);
UPDATE `creature_template` SET `scriptname`='mob_toc_shadow_priest', `AIName` ='' WHERE `entry` IN (34473,34441);
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3444101 AND 3444119;
UPDATE `creature_template` SET `scriptname`='mob_toc_dk', `AIName` ='' WHERE `entry` IN (34461,34458);
UPDATE `creature_template` SET `scriptname`='mob_toc_paladin', `AIName` ='' WHERE `entry` IN (34465,34445);
UPDATE `creature_template` SET `scriptname`='mob_toc_retro_paladin', `AIName` ='' WHERE `entry` IN (34471,34456);
UPDATE `creature_template` SET `scriptname`='mob_toc_druid', `AIName` ='' WHERE `entry` IN (34460,34451);
UPDATE `creature_template` SET `scriptname`='mob_toc_boomkin', `AIName` ='' WHERE `entry` IN (34469,34459);
UPDATE `creature_template` SET `scriptname`='mob_toc_warlock' WHERE `entry` IN (34474,34450);

UPDATE `creature_template` SET `scriptname`='mob_toc_pet_warlock', `AIName` ='' WHERE `entry` IN (35465);
UPDATE `creature_template` SET `scriptname`='mob_toc_pet_hunter', `AIName` ='' WHERE `entry` IN (35610);

-- Nortrend beasts
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (34796, 34799, 35144, 34797);
UPDATE `creature_template` SET `scriptname`='mob_snobold_vassal', `AIName` ='' WHERE `entry`=34800;
UPDATE `creature_template` SET `faction_A` = '14', `faction_H` = '14', `ScriptName` = 'mob_fire_bomb' WHERE `entry` = 34854;

UPDATE `creature_template` SET `ScriptName` = 'mob_slime_pool', `minhealth`= 30000, `maxhealth` = 30000, `modelid_3` = 11686 WHERE `entry` = 35176;

-- Jaraxxus
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (34780, 34784, 34813, 34815, 34825, 34826);
UPDATE `creature_template` SET `scriptname`='mob_legion_flame', `minlevel` = 82, `maxlevel` = 82, `modelid_1` = 11686, `modelid_2` = 11686, `modelid_3` = 11686, `modelid_4` = 11686, `AIName` ='', `faction_A`= 14, `faction_H` = 14 WHERE `entry` = 34784;
UPDATE `creature_template` SET `scriptname`='mob_infernal_volcano', `AIName` ='' WHERE `entry` = 34813;
UPDATE `creature_template` SET `scriptname`='mob_fel_infernal', `AIName` ='' WHERE `entry` = 34815;
UPDATE `creature_template` SET `scriptname`='mob_nether_portal', `AIName` ='' WHERE `entry` = 34825;
UPDATE `creature_template` SET `scriptname`='mob_mistress_of_pain', `AIName` ='' WHERE `entry` = 34826;

-- Valkiries
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (34497, 34496, 34568, 34567);
UPDATE `creature_template` SET `npcflag`=1, `scriptname`='mob_light_essence', `AIName` ='' WHERE entry = 34568;
UPDATE `creature_template` SET `npcflag`=1, `scriptname`='mob_dark_essence', `AIName` ='' WHERE entry = 34567;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `AIName` = '', `ScriptName` = 'mob_unleashed_dark' WHERE `entry` = 34628;
UPDATE `creature_template` SET `minlevel` = 82, `maxlevel` = 82, `AIName` = '', `ScriptName` = 'mob_unleashed_light' WHERE `entry` = 34630;
-- Twin pact by Wowka321
DELETE FROM `spell_script_target` WHERE `entry` IN (65875,67303,67304,67305,65876,67306,67307,67308);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES 
('65875', '1', '34497'),
('67303', '1', '34497'),
('67304', '1', '34497'),
('67305', '1', '34497'),
('65876', '1', '34496'),
('67306', '1', '34496'),
('67307', '1', '34496'),
('67308', '1', '34496');

-- Anub'arak
UPDATE `creature_template` SET `scriptname`='boss_anubarak_trial', `unit_flags` = 0, `AIName` ='' WHERE `entry`=34564;

DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (34606, 34605, 34607, 34564, 34660);
UPDATE `creature_template` SET `modelid_1` = 25144, `modelid_2` = 0, `modelid_3` = 25144, `modelid_4` = 0, `faction_A` = 14, `faction_H` = 14, `AIName` = '', `ScriptName` = 'mob_frost_sphere' WHERE `entry` = 34606;
UPDATE `creature_template` SET `scriptname`='mob_swarm_scarab', `AIName` ='' WHERE `entry`=34605;
UPDATE `creature_template` SET `scriptname`='mob_nerubian_borrower', `AIName` ='' WHERE `entry`=34607;
UPDATE `creature_template` SET `scriptname`='mob_anubarak_spike', `faction_A` = 14, `minlevel` = 80, `maxlevel` = 80,`faction_H` = 14, `AIName` ='' WHERE `entry`=34660;
DELETE FROM `creature_template` WHERE `entry` IN (34863, 34864, 34865);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `PowerType`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `vehicle_id`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(34863, 0, 0, 0, 0, 0, 19725, 28549, 0, 0, 'Nerubian Burrow Two', '', '', 0, 1, 1, 1, 1, 0, 0, 0, 17, 35, 35, 0, 1, 1.14286, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, ''),
(34864, 0, 0, 0, 0, 0, 19725, 28549, 0, 0, 'Nerubian Burrow Three', '', '', 0, 1, 1, 1, 1, 0, 0, 0, 17, 35, 35, 0, 1, 1.14286, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, ''),
(34865, 0, 0, 0, 0, 0, 19725, 28549, 0, 0, 'Nerubian Burrow Four', '', '', 0, 1, 1, 1, 1, 0, 0, 0, 17, 35, 35, 0, 1, 1.14286, 1, 0, 1, 2, 0, 0, 1, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, '');

DELETE FROM `creature_template_addon` WHERE `entry` IN (34863, 34864, 34865);
INSERT INTO `creature_template_addon` VALUES
(34863, 0, 0, 1, 0, 0, 0, '66324'),
(34864, 0, 0, 1, 0, 0, 0, '66324'),
(34865, 0, 0, 1, 0, 0, 0, '66324');

-- Must be spawned by the script ???
DELETE FROM `creature` WHERE `id` IN (34862, 34863, 34864, 34865);
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(null, 34862, 649, 15, 1, 0, 0, 735.403, 75.3576, 142.202, 2.09439, 180, 0, 0, 1, 0, 0, 0),
(null, 34863, 649, 15, 1, 0, 0, 692.92, 184.809, 142.203, 5.35816, 180, 0, 0, 1, 0, 0, 0),
(null, 34864, 649, 15, 1, 0, 0, 688.207, 102.847, 142.202, 0.645772, 180, 0, 0, 1, 0, 0, 0),
(null, 34865, 649, 15, 1, 0, 0, 740.545, 189.113, 142.197, 3.75246, 180, 0, 0, 1, 0, 0, 0);

UPDATE `gameobject_template` SET `flags` = '4' WHERE `entry` = 195485;
UPDATE `gameobject` SET `spawnMask` = '15' WHERE `guid` = 2358;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 34862;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 34863;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 34864;
UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 34865;

-- PSZ patch for Fel Fireball (thx)
DELETE FROM `spell_dbc` WHERE `Id` IN (66532, 66963, 66964, 66965);
INSERT INTO `spell_dbc`( `Id`, `Category`, `Dispel`, `Mechanic`, `Attributes`, `AttributesEx`, `AttributesEx2`, `AttributesEx3`, `AttributesEx4`, `AttributesEx5`, `AttributesEx6`, `AttributesEx7`, `Stances`, `StancesNot`, `Targets`, `RequiresSpellFocus`, `CasterAuraSpell`, `TargetAuraSpell`, `ExcludeCasterAuraSpell`, `ExcludeTargetAuraSpell`, `CastingTimeIndex`, `RecoveryTime`, `CategoryRecoveryTime`, `InterruptFlags`, `AuraInterruptFlags`, `ProcFlags`, `ProcChance`, `ProcCharges`, `MaxLevel`, `BaseLevel`, `SpellLevel`, `DurationIndex`, `RangeIndex`, `StackAmount`, `EquippedItemClass`, `EquippedItemSubClassMask`, `EquippedItemInventoryTypeMask`, `Effect1`, `Effect2`, `Effect3`, `EffectDieSides1`, `EffectDieSides2`, `EffectDieSides3`, `EffectRealPointsPerLevel1`, `EffectRealPointsPerLevel2`, `EffectRealPointsPerLevel3`, `EffectBasePoints1`, `EffectBasePoints2`, `EffectBasePoints3`, `EffectMechanic1`, `EffectMechanic2`, `EffectMechanic3`, `EffectImplicitTargetA1`, `EffectImplicitTargetA2`, `EffectImplicitTargetA3`, `EffectImplicitTargetB1`, `EffectImplicitTargetB2`, `EffectImplicitTargetB3`, `EffectRadiusIndex1`, `EffectRadiusIndex2`, `EffectRadiusIndex3`, `EffectApplyAuraName1`, `EffectApplyAuraName2`, `EffectApplyAuraName3`, `EffectAmplitude1`, `EffectAmplitude2`, `EffectAmplitude3`, `EffectMultipleValue1`, `EffectMultipleValue2`, `EffectMultipleValue3`, `EffectItemType1`, `EffectItemType2`, `EffectMiscValue1`, `EffectMiscValue2`, `EffectMiscValue3`, `EffectMiscValueB1`, `EffectMiscValueB2`, `EffectMiscValueB3`, `EffectTriggerSpell1`, `EffectTriggerSpell2`, `EffectTriggerSpell3`, `EffectSpellClassMaskA1`, `EffectSpellClassMaskA2`, `EffectSpellClassMaskA3`, `EffectSpellClassMaskB1`, `EffectSpellClassMaskB2`, `EffectSpellClassMaskB3`, `EffectSpellClassMaskC1`, `EffectSpellClassMaskC2`, `EffectSpellClassMaskC3`, `SpellIconID`, `Comment`, `MaxTargetLevel`, `SpellFamilyName`, `SpellFamilyFlags1`, `SpellFamilyFlags2`, `SpellFamilyFlags3`, `MaxAffectedTargets`, `DmgClass`, `PreventionType`, `DmgMultiplier1`, `DmgMultiplier2`, `DmgMultiplier3`, `AreaGroupId`, `SchoolMask` )
VALUES
(66532, 0, 1, 0, 0, 136, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 9, 0, 0, 101, 0, 0, 0, 0, 28, 13, 0, -1, 0, 0, 2, 6, 0, 775, 301, 0, 0, 0, 0, 15112, 5849, 0, 0, 0, 0, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2352, "Fel Fireball", 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 4 ),
(66963, 0, 1, 0, 0, 136, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 9, 0, 0, 101, 0, 0, 0, 0, 28, 13, 0, -1, 0, 0, 2, 6, 0, 1251, 475, 0, 0, 0, 0, 24374, 9262, 0, 0, 0, 0, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2352, "Fel Fireball", 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 4 ),
(66964, 0, 1, 0, 0, 136, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 19, 0, 0, 9, 0, 0, 101, 0, 0, 0, 0, 28, 13, 0, -1, 0, 0, 2, 6, 0, 925, 401, 0, 0, 0, 0, 18037, 7799, 0, 0, 0, 0, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2352, "Fel Fireball", 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 4 ),
(66965, 0, 1, 0, 0, 136, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 0, 0, 9, 0, 0, 101, 0, 0, 0, 0, 28, 13, 0, -1, 0, 0, 2, 6, 0, 1751, 551, 0, 0, 0, 0, 34124, 10724, 0, 0, 0, 0, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2352, "Fel Fireball", 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 4 );

UPDATE `spell_dbc` SET `InterruptFlags` = 0x04, `Comment` = 'Replacement for spell "Fel Fireball" - set SPELL_INTERRUPT_FLAG_INTERRUPT' WHERE `Id` IN (66532, 66963, 66964, 66965);

UPDATE `creature_template` SET `modelid_1` = '17612', `modelid_2` = '0' WHERE `entry` = 5672;

UPDATE `creature_template` SET `minhealth` = '12000', `maxhealth` = '12000' WHERE `entry` = 35458;

UPDATE `creature_template` SET `flags_extra` = '2' WHERE `entry` = 33184;
UPDATE `creature_template` SET `name` = 'Permafrost', `unit_flags` = '0', `faction_A` = '14', `faction_H` = '14', `modelid_1` = '17612' WHERE `entry` = 33184;

UPDATE `creature_template` SET `flags_extra` = '256' WHERE `entry` = 34800;

UPDATE `creature_template` SET `mechanic_immune_mask` = 769605631 WHERE `entry` IN (34780, 35216, 35268, 35269);
UPDATE `creature_template` SET `mechanic_immune_mask` = 635387903 WHERE `entry` IN (34496, 35347, 35348, 35349);
UPDATE `creature_template` SET `mechanic_immune_mask` = 635387903 WHERE `entry` IN (34497, 35350, 35351, 35352);

UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` IN (34566, 35615, 35616);

UPDATE `creature_template` SET `modelid_2` = '0', `minlevel` = '83', `maxlevel` = '83', `faction_A` = '14', `faction_H` = '14', `dmg_multiplier` = '4' WHERE `entry` = 34660;
UPDATE `creature_template` SET `modelid_2` = '0', `minlevel` = '83', `maxlevel` = '83', `faction_A` = '14', `faction_H` = '14', `dmg_multiplier` = '6' WHERE `entry` = 35652;
UPDATE `creature_template` SET `modelid_2` = '0', `minlevel` = '83', `maxlevel` = '83', `faction_A` = '14', `faction_H` = '14', `dmg_multiplier` = '6' WHERE `entry` = 35653;
UPDATE `creature_template` SET `modelid_2` = '0', `minlevel` = '83', `maxlevel` = '83', `faction_A` = '14', `faction_H` = '14', `dmg_multiplier` = '8' WHERE `entry` = 35654;

UPDATE `gameobject` SET `position_x` = '805.67', `position_y` = '129.72', `orientation` = '2.97' WHERE `id` = 195669;
UPDATE `gameobject` SET `position_x` = '804.48', `position_y` = '139.91', `orientation` = '3.49' WHERE `id` = 195670;
UPDATE `gameobject` SET `position_x` = '804.33', `position_y` = '124.45', `orientation` = '2.77' WHERE `id` = 195671;
