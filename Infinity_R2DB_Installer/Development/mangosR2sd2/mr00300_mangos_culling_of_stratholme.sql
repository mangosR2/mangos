-- ------------------------------
-- Instance CoS                 -
-- ------------------------------

UPDATE `creature_template` SET `AIName` = '', `ScriptName` ='npc_mike' WHERE entry = 30571;
UPDATE `creature_template` SET `AIName` = '', `ScriptName`='npc_chromi_start' WHERE entry=26527;
UPDATE `creature_template` SET `AIName` = '', `ScriptName`='npc_roger' WHERE entry=27903;
UPDATE `creature_template` SET `AIName` = '', `ScriptName`='npc_morigan' WHERE entry=27877;
UPDATE `creature_template` SET `AIName` = '', `ScriptName`='' WHERE entry=30996;
UPDATE `creature_template` SET `AIName` = '', `ScriptName`='npc_stratholme_crates' WHERE entry=27827;
UPDATE `creature_template` SET `AIName` = '', `ScriptName`='npc_jena' WHERE entry=27885;
UPDATE `creature_template` SET `AIName` = '', `ScriptName`='npc_malcolm' WHERE entry=27891;
UPDATE `creature_template` SET `AIName` = '', `ScriptName`='npc_bartleby_cs' WHERE entry=27907;
UPDATE `creature_template` SET `AIName` = '', `ScriptName`='npc_chromi_middle' WHERE entry=27915;
UPDATE `creature_template` SET `AIName` = '', `ScriptName`='npc_uther' WHERE entry=26528;
UPDATE `creature_template` SET `AIName` = '', `ScriptName`='npc_arthas' WHERE entry=26499;

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 27747; -- Need compare with ACID
INSERT INTO `creature_ai_scripts` VALUES 
(2774701, 27747, 1, 0, 100, 6, 0, 0, 0, 0, 21, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 'High Elf Mage-Priest - Prevent Combat Movement and Set Phase to 0 on Spawn'),
(2774702, 27747, 4, 0, 100, 6, 0, 0, 0, 0, 11, 34232, 1, 0, 23, 1, 0, 0, 0, 0, 0, 0, 'High Elf Mage-Priest - Cast Holy Bolt and Set Phase 1 on Aggro'),
(2774703, 27747, 9, 13, 100, 7, 0, 40, 3400, 4800, 11, 34232, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Elf Mage-Priest - Cast Holy Bolt (Phase 1)'),
(2774704, 27747, 3, 13, 100, 6, 7, 0, 0, 0, 21, 1, 0, 0, 23, 1, 0, 0, 0, 0, 0, 0, 'High Elf Mage-Priest - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
(2774705, 27747, 9, 13, 100, 6, 35, 80, 0, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Elf Mage-Priest - Start Combat Movement at 35 Yards (Phase 1)'),
(2774706, 27747, 9, 13, 100, 6, 5, 15, 0, 0, 21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Elf Mage-Priest - Prevent Combat Movement at 15 Yards (Phase 1)'),
(2774707, 27747, 9, 13, 100, 6, 0, 5, 0, 0, 21, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Elf Mage-Priest - Start Combat Movement Below 5 Yards (Phase 1)'),
(2774708, 27747, 3, 11, 100, 7, 100, 15, 100, 100, 23, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Elf Mage-Priest - Set Phase 1 when Mana is above 15% (Phase 2)'),
(2774709, 27747, 14, 0, 100, 7, 5000, 40, 12000, 18000, 11, 15586, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'High Elf Mage-Priest - Cast Heal on Friendlies'),
(2774710, 27747, 2, 0, 100, 6, 15, 0, 0, 0, 22, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Elf Mage-Priest - Set Phase 3 at 15% HP'),
(2774711, 27747, 2, 7, 100, 6, 15, 0, 0, 0, 21, 1, 0, 0, 25, 0, 0, 0, 1, -47, 0, 0, 'High Elf Mage-Priest - Start Combat Movement and Flee at 15% HP (Phase 3)'),
(2774712, 27747, 7, 0, 100, 6, 0, 0, 0, 0, 22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'High Elf Mage-Priest - Set Phase to 0 on Evade');

DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 27745; -- Need compare with ACID
INSERT INTO `creature_ai_scripts` VALUES 
(2774501, 27745, 9, 0, 100, 7, 0, 5, 5000, 8000, 11, 25710, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Footman - Cast Heroic Strike'),
(2774502, 27745, 0, 0, 100, 7, 7000, 12000, 9000, 15000, 11, 52317, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Lordaeron Footman - Cast Defend');

UPDATE `creature_template` SET `AIName` = '',`ScriptName`='npc_arthas_priest' WHERE entry IN (70004, 70005);
UPDATE `creature_template` SET `AIName` = '',`ScriptName`='npc_arthas_marine' WHERE entry IN (70000, 70001, 70002, 70003);
UPDATE `creature_template` SET `AIName` = '',`ScriptName`='npc_dark_conversion' WHERE entry IN (31127, 31126, 28167, 28169);
UPDATE `creature_template` SET `AIName` = '',`ScriptName`='npc_cs_gnoul' WHERE entry=28249;
UPDATE `creature_template` SET `AIName` = '',`ScriptName`='npc_cs_necromancer' WHERE entry=28200;
UPDATE `creature_template` SET `AIName` = '',`ScriptName`='npc_cs_field' WHERE entry=27734;
UPDATE `creature_template` SET `AIName` = '',`ScriptName`='npc_cs_acolyte' WHERE entry=27731;
UPDATE `creature_template` SET `AIName` = '',`ScriptName`='npc_cs_butcher' WHERE entry=27736;
UPDATE `creature_template` SET `AIName` = '',`ScriptName`='boss_meathook' WHERE entry=26529;
UPDATE `creature_template` SET `AIName` = '',`ScriptName`='boss_salramm' WHERE entry=26530;
UPDATE `creature_template` SET `AIName` = '',`ScriptName`='npc_salramm_gnoul' WHERE entry=27733;
UPDATE `creature_template` SET `AIName` = '',`ScriptName`='boss_lord_epoch' WHERE entry=26532;
UPDATE `creature_template` SET `AIName` = '',`ScriptName`='boss_malganis' WHERE entry=26533;
UPDATE `creature_template` SET `AIName` = '',`ScriptName`='npc_time_riftCS' WHERE entry=28409;
UPDATE `creature_template` SET `AIName` = '',`ScriptName`='boss_infinite_corruptor' WHERE entry=32273;

-- ACID CLEAN UP
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=26499);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=26529);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=26499);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=26530);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=26532);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=26533);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=27731);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=27734);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=27736);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=28200);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=28249);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=32273);

-- Clean up ACID texts
DELETE FROM `creature_ai_texts` WHERE  `entry`=-841;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-842;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-843;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-844;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-845;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-846;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-847;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-848;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-849;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-850;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-851;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-852;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-853;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-854;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-855;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-856;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-857;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-858;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-859;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-860;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-861;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-862;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-863;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-864;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-865;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-866;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-867;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-868;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-869;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-870;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-871;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-872;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-873;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-874;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-875;
DELETE FROM `creature_ai_texts` WHERE  `entry`=-876;

-- Quest fix  ( if you already had quest done should be able to do it again you can in off blizz ... soo)
UPDATE `quest_template` SET `SpecialFlags` = 1 WHERE `entry` = 13151;
UPDATE `quest_template` SET `SpecialFlags` = 1 WHERE `entry` = 13149;

-- remove already spawned third chromi for summon after mal ganis is dead
DELETE FROM `creature` WHERE `id`=30997;

-- ----------------------------------------
-- spell scripts and ect spell_area_stuff -
-- ----------------------------------------

REPLACE INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES('35481','4100','0','0','0','0','0','1','1'); -- cause careate two spell with different racemask fore one area
REPLACE INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES('35480','4100','0','0','0','0','0','0','1'); -- cause careate two spell with different racemask fore one area

-- ----------------------------
-- Creature Stuff             -
-- ----------------------------

UPDATE `creature_template` SET `modelid_2` = 24769 WHERE `entry` = 27747;
UPDATE `creature_template` SET `modelid_2` = 24768 WHERE `entry` = 27745;
UPDATE `creature_template` SET `modelid_2` = 24949 WHERE `entry` = 26499;

UPDATE `creature` SET `spawntimesecs`= 36000 WHERE `id` IN (31127, 31126, 28167, 28169);

-- Remove old versions
DELETE FROM `creature` WHERE `id` IN (27731,27734,28249,27736,27915,30571,26499,26497,26528,27891,27892,27884,32273,28439);

-- DB error corrections for above sql query
DELETE FROM `creature_movement` WHERE (`id`='138237' AND `point`='1') OR (`id`='138237' AND `point`='2') OR (`id`='138238' AND `point`='1') OR (`id`='138238' AND `point`='2') OR (`id`='138239' AND `point`='1') OR (`id`='138239' AND `point`='2') OR (`id`='138239' AND `point`='3') OR (`id`='138239' AND `point`='4');
DELETE FROM `creature_movement` WHERE (`id`='138288' AND `point`='1') OR (`id`='138288' AND `point`='2') OR (`id`='138289' AND `point`='1') OR (`id`='138289' AND `point`='2');

-- added some npc s of my own for mirco management
   -- footman
DELETE FROM `creature_template` WHERE `entry` IN(70000, 70001, 70002, 70003);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `vehicle_id`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(70000, 0, 0, 0, 0, 0, 24768, 24768, 0, 0, 'Lordaeron Footman', '', '', 0, 80, 80, 12600, 12600, 0, 0, 9730, 2076, 2076, 0, 1, 1.14286, 1, 1, 420, 630, 0, 157, 2.7, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 336, 504, 126, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 223, 0, 0, 0, 0, 'npc_arthas_marine'),
(70001, 0, 0, 0, 0, 0, 24768, 24768, 0, 0, 'Lordaeron Footman', '', '', 0, 80, 80, 12600, 12600, 0, 0, 9730, 2076, 2076, 0, 1, 1.14286, 1, 1, 420, 630, 0, 157, 2.7, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 336, 504, 126, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 223, 0, 0, 0, 0, 'npc_arthas_marine'),
(70002, 0, 0, 0, 0, 0, 24768, 24768, 0, 0, 'Lordaeron Footman', '', '', 0, 80, 80, 12600, 12600, 0, 0, 9730, 2076, 2076, 0, 1, 1.14286, 1, 1, 420, 630, 0, 157, 2.7, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 336, 504, 126, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 223, 0, 0, 0, 0, 'npc_arthas_marine'),
(70003, 0, 0, 0, 0, 0, 24768, 24768, 0, 0, 'Lordaeron Footman', '', '', 0, 80, 80, 12600, 12600, 0, 0, 9730, 2076, 2076, 0, 1, 1.14286, 1, 1, 420, 630, 0, 157, 2.7, 2000, 2000, 1, 0, 0, 0, 0, 0, 0, 0, 336, 504, 126, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 223, 0, 0, 0, 0, 'npc_arthas_marine');
REPLACE INTO `creature_template_spells` (`entry`, `spell1`, `spell2`) VALUES
(70000, 52317, 25710),
(70001, 52317, 25710),
(70002, 52317, 25710),
(70003, 52317, 25710);

  -- micro manage spawn w/ news one in there recyling old guids
DELETE FROM `creature` WHERE `id` IN (27745, 70000, 70001, 70002, 70003);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(115398, 27745, 595, 3, 1, 0, 0, 1878.83, 1293.39, 144.713, 4.62512, 300, 0, 0, 12600, 0, 0, 0),
(115399, 27745, 595, 3, 1, 0, 0, 1890.86, 1276.52, 143.972, 1.41372, 300, 0, 0, 12600, 0, 0, 0),
(115400, 27745, 595, 3, 1, 0, 0, 1885.96, 1293.62, 144.286, 4.55531, 300, 0, 0, 12600, 0, 0, 0),
(115401, 27745, 595, 3, 1, 0, 0, 1871.08, 1272.27, 144.368, 1.67552, 300, 0, 0, 12600, 0, 0, 0),
(115402, 27745, 595, 3, 1, 0, 0, 1862.39, 1272.2, 144.483, 1.50098, 300, 0, 0, 12600, 0, 0, 0),
(115403, 27745, 595, 3, 1, 0, 0, 1853.78, 1272.17, 144.605, 1.48353, 300, 0, 0, 12600, 0, 0, 0),
(115404, 27745, 595, 3, 1, 0, 0, 1872.02, 1292.99, 145.134, 4.7822, 300, 0, 0, 12600, 0, 0, 0),
(115405, 70000, 595, 3, 1, 0, 0, 2042.13, 1293.14, 143.336, 4.64258, 300, 0, 0, 12600, 0, 0, 0),
(115406, 70001, 595, 3, 1, 0, 0, 2046.71, 1281.91, 143.321, 1.51844, 300, 0, 0, 12600, 0, 0, 0),
(115407, 70002, 595, 3, 1, 0, 0, 2041.97, 1281.66, 143.554, 1.62316, 300, 0, 0, 12600, 0, 0, 0),
(115408, 70003, 595, 3, 1, 0, 0, 2046.86, 1293.33, 143.132, 4.7822, 300, 0, 0, 12600, 0, 0, 0),
(115409, 27745, 595, 3, 1, 0, 0, 1853.45, 1291.8, 145.002, 4.79966, 300, 0, 0, 12600, 0, 0, 0),
(115410, 27745, 595, 3, 1, 0, 0, 1896.66, 1276.79, 144.026, 1.5708, 300, 0, 0, 12600, 0, 0, 0),
(115411, 27745, 595, 3, 1, 0, 0, 1902.72, 1276.73, 143.809, 1.78024, 300, 0, 0, 12600, 0, 0, 0),
(115412, 27745, 595, 3, 1, 0, 0, 1859.01, 1292.22, 145.239, 4.7473, 300, 0, 0, 12600, 0, 0, 0),
(115413, 27745, 595, 3, 1, 0, 0, 1865.2, 1292.56, 145.297, 4.62512, 300, 0, 0, 12600, 0, 0, 0),
(115414, 27745, 595, 3, 1, 0, 0, 1845.58, 1272.22, 144.815, 1.50098, 300, 0, 0, 12600, 0, 0, 0);

   -- priest
DELETE FROM `creature_template` WHERE `entry` IN(70004, 70005);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `vehicle_id`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES
(70004, 0, 0, 0, 0, 0, 24769, 0, 0, 0, 'High Elf Mage-Priest', '', '', 0, 80, 80, 10080, 10080, 8814, 8814, 7784, 2076, 2076, 0, 1, 1.14286, 1, 1, 307, 459, 0, 115, 2.9, 2000, 2000, 8, 0, 0, 0, 0, 0, 0, 0, 246, 367, 92, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 14, 0, 0, 0, 0, 'npc_arthas_priest'),
(70005, 0, 0, 0, 0, 0, 24769, 0, 0, 0, 'High Elf Mage-Priest', '', '', 0, 80, 80, 10080, 10080, 8814, 8814, 7784, 2076, 2076, 0, 1, 1.14286, 1, 1, 307, 459, 0, 115, 2.9, 2000, 2000, 8, 0, 0, 0, 0, 0, 0, 0, 246, 367, 92, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 0, 3, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 14, 0, 0, 0, 0, 'npc_arthas_priest');
REPLACE INTO `creature_template_spells` (`entry`, `spell1`) VALUES
(70004, 34232),
(70005, 34232);

  -- micro manage spawn w/ news one in there recyling old guids
DELETE FROM `creature` WHERE `id` IN (27747, 70004, 70005);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(115421, 27747, 595, 3, 1, 0, 0, 1878.1, 1268.57, 144.42, 1.79769, 300, 0, 0, 10080, 8814, 0, 0),
(115422, 27747, 595, 3, 1, 0, 0, 1873.36, 1268.36, 144.561, 1.55334, 300, 0, 0, 10080, 8814, 0, 0),
(115423, 70004, 595, 3, 1, 0, 0, 2037.91, 1293.03, 143.499, 4.72984, 300, 0, 0, 10080, 8814, 0, 0),
(115424, 70005, 595, 3, 1, 0, 0, 2037.59, 1281.81, 143.666, 1.48353, 300, 0, 0, 10080, 8814, 0, 0),
(115425, 27747, 595, 3, 1, 0, 0, 1868.76, 1268.27, 144.655, 1.53589, 300, 0, 0, 10080, 8814, 0, 0);

-- end of this


-- Add Whats needed --
DELETE FROM `creature` WHERE `id` in (27915, 26499, 26497, 26528, 27891, 27892, 32273, 28439, 30571);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(700000, 27915, 595, 3, 1, 0, 0, 1812.49, 1284.81, 142.248, 4.03364, 300, 0, 0, 17010, 0, 0, 0),
(700001, 26499, 595, 3, 1, 0, 1613, 1920.87, 1287.12, 142.935, 6.25562, 43200, 0, 0, 44100, 7988, 0, 0),
(700002, 26497, 595, 3, 1, 0, 1221, 1896.39, 1292.91, 143.711, 0.016332, 300, 0, 0, 100800, 88140, 0, 0),
(700003, 26528, 595, 3, 1, 0, 1819, 1761.42, 1285.75, 139.945, 4.93874, 300, 0, 0, 126000, 59910, 0, 0),
(700004, 27891, 595, 3, 1, 0, 0, 1603.38, 805.988, 123.272, 1.90688, 300, 0, 0, 8982, 0, 0, 0),
(700005, 27892, 595, 3, 1, 0, 0, 1602.3, 809.385, 123.454, 5.02884, 300, 0, 0, 8982, 0, 0, 0),
(700006, 32273, 595, 3, 1, 0, 1839, 2330.93, 1275.59, 132.848, 3.60489, 300, 0, 0, 417911, 0, 0, 0),
(700007, 28439, 595, 3, 1, 0, 0, 2336.56, 1277.9, 132.885, 3.47923, 300, 0, 0, 1, 0, 0, 0),
(700008, 30571, 595, 3, 1, 0, 0, 1553.37, 578.078, 99.7624, 5.83105, 300, 0, 0, 8982, 0, 0, 0),
(700009, 27884, 595, 3, 1, 0, 0, 1636.7, 725.642, 113.662, 0.893359, 300, 0, 0, 8982, 0, 0, 0);
