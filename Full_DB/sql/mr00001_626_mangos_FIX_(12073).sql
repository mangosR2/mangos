# Y2kCat
ALTER TABLE db_version_ytdb CHANGE COLUMN 625_FIX_12029 626_FIX_12073 bit;
REPLACE INTO `db_version_ytdb` (`version`) VALUES ('626_FIX_12073');

# Error_LOG
# delete from spell_script_target where entry=44233;
# insert into spell_script_target values
# (44233,0,188165),
# (44233,0,188166);
# delete from spell_script_target where entry in (32124);
# insert into spell_script_target values
# (32124,1,17968);

# NeatElves
UPDATE `pool_template` SET `max_limit`='18' WHERE `entry`=1227;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(26029, 182139, 530, 1, 1, -133.788, 6952.09, 19.2631, 1.3114, 0, 0, 0.609714, 0.792621, 120, 100, 1),
(26030, 182139, 530, 1, 1, -97.1974, 6998.89, 19.1707, 3.54586, 0, 0, 0.97964, -0.20076, 120, 100, 1),
(26031, 182139, 530, 1, 1, -202.643, 7049.52, 19.327, 3.5757, 0, 0, 0.976536, -0.215353, 120, 100, 1),
(26032, 182139, 530, 1, 1, -235.074, 7040.57, 18.7178, 6.10075, 0, 0, 0.0910912, -0.995843, 120, 100, 1),
(26033, 182139, 530, 1, 1, -107.417, 7106.15, 19.4062, 1.68838, 0, 0, 0.747433, 0.664337, 120, 100, 1),
(26034, 182139, 530, 1, 1, -34.6708, 7115.12, 20.3811, 2.83349, 0, 0, 0.988158, 0.153443, 120, 100, 1),
(38685, 182139, 530, 1, 1, -79.6786, 7132.48, 18.6876, 2.13056, 0, 0, 0.874925, 0.484259, 120, 100, 1),
(38686, 182139, 530, 1, 1, -147.765, 7290.63, 23.3198, 4.92658, 0, 0, 0.627472, -0.778639, 120, 100, 1),
(38687, 182139, 530, 1, 1, -163.823, 7333.81, 23.5985, 4.3768, 0, 0, 0.815268, -0.579083, 120, 100, 1),
(38688, 182139, 530, 1, 1, -354.537, 7244.25, 50.1074, 1.51716, 0, 0, 0.687891, 0.725814, 120, 100, 1),
(38689, 182139, 530, 1, 1, -354.904, 7264.76, 50.6482, 4.82369, 0, 0, 0.666682, -0.745343, 120, 100, 1),
(38690, 182139, 530, 1, 1, -205.034, 7347.71, 31.9097, -1.309, 0, 0, -0.608763, 0.793352, 120, 100, 1),
(1635, 182139, 530, 1, 1, -199.924, 7315.18, 56.7761, 1.97222, 0, 0, 0.833885, 0.551938, 120, 100, 1),
(3714, 182139, 530, 1, 1, -206.092, 7350.44, 56.7761, -1.36136, 0, 0, -0.629322, 0.777145, 120, 100, 1),
(4501, 182139, 530, 1, 1, -132.601, 7246.44, 29.7679, 2.18166, 0, 0, 0.88701, 0.461749, 120, 100, 1),
(5691, 182139, 530, 1, 1, -198.688, 7012.56, 25.5302, 2.18166, 0, 0, 0.88701, 0.461749, 120, 100, 1),
(5693, 182139, 530, 1, 1, -119.5, 6919.59, 17.6368, -1.93732, 0, 0, -0.824127, 0.566404, 120, 100, 1),
(6242, 182139, 530, 1, 1, -310.054, 7228, 30.5561, 1.74533, 0, 0, 0.766045, 0.642787, 120, 100, 1),
(6292, 182139, 530, 1, 1, -293.075, 7218.43, 24.5668, 0.366518, 0, 0, 0.182235, 0.983255, 120, 100, 1),
(6300, 182139, 530, 1, 1, -361.882, 7242.5, 52.6647, 0.59341, 0, 0, 0.292371, 0.956305, 120, 100, 1),
(6303, 182139, 530, 1, 1, -167.25, 7263.1, 23.3273, 2.96704, 0, 0, 0.996194, 0.0871655, 120, 100, 1),
(6304, 182139, 530, 1, 1, -134.533, 7020.82, 23.6492, -0.925024, 0, 0, -0.446198, 0.894934, 120, 100, 1),
(6890, 182139, 530, 1, 1, -119.41, 7268.5, 23.2162, -2.65289, 0, 0, -0.970294, 0.241927, 120, 100, 1),
(6990, 182139, 530, 1, 1, -156.05, 7301.58, 22.7274, -1.36136, 0, 0, -0.629322, 0.777145, 120, 100, 1),
(7070, 182139, 530, 1, 1, -178.847, 7316.93, 21.8591, -0.139624, 0, 0, -0.0697553, 0.997564, 120, 100, 1),
(7111, 182139, 530, 1, 1, -216.573, 7067.33, 18.9056, -2.26892, 0, 0, -0.906306, 0.422622, 120, 100, 1),
(8052, 182139, 530, 1, 1, -99.8542, 7166.18, 19.2331, 1.90241, 0, 0, 0.814116, 0.580702, 120, 100, 1),
(8056, 182139, 530, 1, 1, -69.0226, 7153.78, 19.3556, 2.94959, 0, 0, 0.995395, 0.0958539, 120, 100, 1),
(8057, 182139, 530, 1, 1, -107.885, 7149.89, 19.2729, 1.16937, 0, 0, 0.551937, 0.833886, 120, 100, 1),
(8058, 182139, 530, 1, 1, -135.537, 7087.72, 17.4921, 1.79769, 0, 0, 0.782608, 0.622514, 120, 100, 1),
(8065, 182139, 530, 1, 1, -112.642, 6976.46, 17.7378, 2.02458, 0, 0, 0.848048, 0.52992, 120, 100, 1),
(8071, 182139, 530, 1, 1, -118.233, 7007.3, 18.6213, -0.017452, 0, 0, -0.00872589, 0.999962, 120, 100, 1),
(8079, 182139, 530, 1, 1, -233.861, 7032.65, 18.4706, 1.43117, 0, 0, 0.656059, 0.75471, 120, 100, 1),
(8084, 182139, 530, 1, 1, -0.602159, 7158.36, 17.3827, 1.93731, 0, 0, 0.824125, 0.566409, 120, 100, 1);
REPLACE INTO `game_event_mail` (`event`, `raceMask`, `quest`, `mailTemplateId`, `senderEntry`) VALUES
(50, 690, 12420, 197, 27487),
(51, 690, 12420, 198, 27487),
(52, 690, 12420, 199, 27487),
(53, 690, 12420, 200, 27487),
(54, 690, 12420, 201, 27487),
(55, 690, 12420, 202, 27487),
(56, 690, 12421, 203, 27487),
(57, 690, 12420, 204, 27487),
(59, 690, 12420, 205, 27487),
(58, 690, 12420, 206, 27487),
(60, 690, 12420, 207, 27487),
(61, 690, 12420, 208, 27487),
(50, 1101, 12421, 212, 27487),
(51, 1101, 12421, 213, 27487),
(52, 1101, 12421, 214, 27487),
(53, 1101, 12421, 215, 27487),
(54, 1101, 12421, 216, 27487),
(55, 1101, 12421, 217, 27487),
(56, 1101, 12420, 218, 27487),
(57, 1101, 12421, 219, 27487),
(58, 1101, 12421, 220, 27487),
(59, 1101, 12421, 221, 27487),
(60, 1101, 12421, 222, 27487),
(61, 1101, 12421, 223, 27487);
DELETE FROM `creature` WHERE `guid` = 62210;
DELETE FROM `creature` WHERE `guid` = 62212;
DELETE FROM `creature` WHERE `guid` in (81373,81375,81374,81372,81371,81370,81369,81368,81354);
DELETE FROM `game_event_creature` WHERE `guid` in (81373,81375,81374,81372,81371,81370,81369,81368,81354);
UPDATE `creature_involvedrelation` SET `id`='16817' WHERE `id`=16788 AND `quest`=9365;
UPDATE `creature_involvedrelation` SET `id`='16818' WHERE `id`=16788 AND `quest`=9339;
UPDATE `creature_questrelation` SET `id`='16818' WHERE `id`=16788 AND `quest`=9339;
UPDATE `creature_template` SET `npcflag`='0' WHERE `entry`=16788;
DELETE FROM `creature` WHERE `guid` = 57719;
DELETE FROM `game_event_creature` WHERE `guid` = 57719;
REPLACE gameobject VALUES (45559, 181305, 530, 1,1,-3794.19, -11520, -134.936, 5.08077, 0, 0, 0.565638, -0.824653, 180, 100, 1);
DELETE FROM `game_event_gameobject` WHERE `guid` = 69557;
DELETE FROM `gameobject` WHERE `guid` = 69557;
UPDATE `gameobject` SET `id`='181288' WHERE `id`= 300068;
DELETE FROM `gameobject_template` WHERE `entry` = 300068;
REPLACE INTO gameobject VALUES ( 37423, 181302, 1, 1,1,8707.71, 927.48, 15.3919, 3.29546, 0, 0, 0.997042, -0.0768555, 180, 100, 1);
DELETE FROM `creature` WHERE `guid` = 117103;
DELETE FROM `creature` WHERE `guid` = 117104;
DELETE FROM `creature` WHERE `guid` = 117105;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2539751;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2539851;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2539951;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=25397;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=25398;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=25399;
DELETE FROM `spell_script_target` WHERE `entry` = 45536;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
('45536', '0', '191088'),('45536', '0', '191089'),('45536', '0', '191090');
UPDATE `quest_template` SET `RewChoiceItemId1` = 28173, `RewChoiceItemId2` = 28169, `RewChoiceItemId3` = 28172, `RewChoiceItemId4` = 28175, `RewChoiceItemCount1` = 1, `RewChoiceItemCount2` = 1, `RewChoiceItemCount3` = 1, `RewChoiceItemCount4` = 1, `RewItemId1` = 28168, `RewItemCount1` = 1, `RewRepValueId1` = 8, `RewMoneyMaxLevel` = 107700 WHERE `entry` = 10172;

# xfurry  
-- general fixes
UPDATE creature_template SET InhabitType=InhabitType|4 WHERE entry IN (38004,38451,38332,38454);
UPDATE creature_template SET RegenHealth = 0 WHERE entry IN (37970,37972,37973);
UPDATE creature SET spawnMask = 15 WHERE id in (37970,37972,37973);
-- delete c_t_a - this is handled in script
delete from creature_template_addon where entry in (37973,37970,37972);
-- script targets
delete from spell_script_target where entry=70983;
insert into spell_script_target values
(70983,1,37973),
(70983,1,37970),
(70983,1,37972);
delete from spell_script_target where entry=71075;
insert into spell_script_target values
(71075,1,37973),
(71075,1,37972);
delete from spell_script_target where entry=71079;
insert into spell_script_target values
(71079,1,37973),
(71079,1,37970);
delete from spell_script_target where entry=71082;
insert into spell_script_target values
(71082,1,37970),
(71082,1,37972);
-- linking
delete from creature_linking_template where entry in (37972,37973,38008,38332,38451,38369,38422,38454,38458);
insert into creature_linking_template values
(37972,631,37970,3,0),
(37973,631,37970,3,0),
(38008,631,37970,3,0),
(38332,631,37970,4112,0),
(38451,631,37970,4112,0),
(38369,631,37970,4112,0),
(38422,631,37970,4112,0),
(38454,631,37970,4112,0),
(38458,631,37970,4112,0);

# NeatElves
UPDATE `gameobject_template` SET `faction` = 14 WHERE `entry` = 175124;
delete from creature_linking_template where entry in (34605,34606,34607,34660,34862);
insert into creature_linking_template values
(34605,649,34564,4112,0),
(34606,649,34564,4112,0),
(34607,649,34564,4112,0),
(34660,649,34564,4112,0),
(34862,649,34564,4112,0);
-- script targets
delete from spell_script_target where entry IN (65872,66332,66339,66181,66170);
insert into spell_script_target values
(65872,1,34660),
(66332,1,34862),
(66339,1,34862),
(66181,1,34606),
(66170,1,34660);
UPDATE `creature_template` SET InhabitType=InhabitType|4 WHERE `entry` = 34606;
DELETE FROM `creature_loot_template` WHERE `entry` = 21728 AND `item` = 27511;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`= -100 WHERE `item`=23270;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`, `condition_id`) VALUES
(37703, 37700, 0, 1, 3, 5, 0, 0, 0, 0),
(37703, 37701, 0, 1, 3, 5, 0, 0, 0, 0),
(37703, 37702, 0, 1, 3, 5, 0, 0, 0, 0),
(37703, 37703, 0, 1, 3, 5, 0, 0, 0, 0),
(37703, 37704, 0, 1, 3, 5, 0, 0, 0, 0),
(37703, 37705, 0, 1, 3, 5, 0, 0, 0, 0);
UPDATE `item_loot_template` SET `mincountOrRef`='20' WHERE `entry`=44663 AND `item`=33470;
DELETE FROM `item_loot_template` WHERE `entry` = 44663 AND `item` = 37700;
DELETE FROM `item_loot_template` WHERE `entry` = 44663 AND `item` = 37701;
DELETE FROM `item_loot_template` WHERE `entry` = 44663 AND `item` = 37702;
DELETE FROM `item_loot_template` WHERE `entry` = 44663 AND `item` = 37704;
DELETE FROM `item_loot_template` WHERE `entry` = 44663 AND `item` = 37705;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100', `groupid`='0', `mincountOrRef`='-37703', `maxcount`='3' WHERE `entry`=44663 AND `item`=37703;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`, `condition_id`) VALUES
(29918, 29918, 0, 1, 1, 1, 0, 0, 0, 0),
(29918, 29920, 0, 1, 1, 1, 0, 0, 0, 0),
(29918, 29921, 0, 1, 1, 1, 0, 0, 0, 0),
(29918, 29922, 0, 1, 1, 1, 0, 0, 0, 0),
(29918, 29923, 0, 1, 1, 1, 0, 0, 0, 0),
(29918, 29924, 0, 1, 1, 1, 0, 0, 0, 0),
(29918, 29925, 0, 1, 1, 1, 0, 0, 0, 0),
(29918, 29947, 0, 1, 1, 1, 0, 0, 0, 0),
(29918, 29948, 0, 1, 1, 1, 0, 0, 0, 0),
(29918, 29949, 0, 1, 1, 1, 0, 0, 0, 0),
(29918, 30447, 0, 1, 1, 1, 0, 0, 0, 0),
(29918, 30448, 1, 1, 1, 1, 0, 0, 0, 0),
(29918, 32944, 1, 1, 1, 1, 0, 0, 0, 0);
DELETE FROM `creature_loot_template` WHERE `entry` = 19514 AND `item` = 29920;
DELETE FROM `creature_loot_template` WHERE `entry` = 19514 AND `item` = 29921;
DELETE FROM `creature_loot_template` WHERE `entry` = 19514 AND `item` = 29922;
DELETE FROM `creature_loot_template` WHERE `entry` = 19514 AND `item` = 29923;
DELETE FROM `creature_loot_template` WHERE `entry` = 19514 AND `item` = 29924;
DELETE FROM `creature_loot_template` WHERE `entry` = 19514 AND `item` = 29925;
DELETE FROM `creature_loot_template` WHERE `entry` = 19514 AND `item` = 29947;
DELETE FROM `creature_loot_template` WHERE `entry` = 19514 AND `item` = 29948;
DELETE FROM `creature_loot_template` WHERE `entry` = 19514 AND `item` = 29949;
DELETE FROM `creature_loot_template` WHERE `entry` = 19514 AND `item` = 30447;
DELETE FROM `creature_loot_template` WHERE `entry` = 19514 AND `item` = 30448;
DELETE FROM `creature_loot_template` WHERE `entry` = 19514 AND `item` = 32944;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='100', `groupid`='0', `mincountOrRef`='-29918', `maxcount`='3' WHERE `entry`=19514 AND `item`=29918;
DELETE FROM `skinning_loot_template` WHERE (`entry`=31233) AND (`item`=33568);
INSERT INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (31233, 33568, 0, 1, 1, 6);
UPDATE `creature_template` SET `type_flags` = 34816 WHERE `entry` = 29724;
DELETE FROM `creature` WHERE `id` in (22418);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`) VALUES
(32239,22418, 534, 1, 1, 18783, 0, 5503.713, -3523.436,1608.781, 0.0, 604800, 0, 0, 7588, 0);
delete from spell_script_target where entry in (32111);
insert into spell_script_target values
(32111,1,17946);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES ('7574', '9204', '0', '0', '0', '0', '0', '0', '0', '1711');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1711', '5', '930', '3');

REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('2000000798', 'Thank you, $r. I will join your struggle against the stormforged.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2000000799', 'Does not compute. Unit malfunctioning. Directive: shut down.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2000000800', 'Free again? Keeper Mimir\'s work awaits.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2000000801', 'New directive: assist in the defeat of the iron dwarves.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
('9871', '1', '0', '0', '0', '29384', '5', '0', '2000000798', '2000000799', '2000000800', '2000000801', '0', '0', '0', '0', ''),
('9871', '2', '18', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
DELETE FROM `creature_ai_scripts` WHERE `id` = 2938451;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=29384;
DELETE FROM `creature_ai_texts` WHERE `entry` = -293842;
DELETE FROM `creature_ai_texts` WHERE `entry` = -293841;
UPDATE `creature_template` SET InhabitType=InhabitType|4 WHERE entry in (30282,30084,32295,30592);
delete from spell_script_target where entry in (56140,56429);
insert into spell_script_target values
(56140,1,30118),
(56429,1,22517);
-- linking
delete from creature_linking_template where entry in (30245,30249);
insert into creature_linking_template values
(30245,616,28859,4096,0),
(30249,616,28859,4096,0);
-- Movement from Trinity Core
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(116900, 28859, 616, 3, 1, 0, 0, 808.535, 1213.55, 295.972, 3.22503, 604800, 0, 0, 6972500, 212900, 2);
delete from creature_movement_template where entry=28859;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z) values
(28859, 1, 812.7299, 1391.672, 283.2763),
(28859, 2, 848.2912, 1358.61, 283.2763),
(28859, 3, 853.9227, 1307.911, 283.2763),
(28859, 4, 847.1437, 1265.538, 283.2763),
(28859, 5, 839.9229, 1245.245, 283.2763),
(28859, 6, 827.3463, 1221.818, 283.2763),
(28859, 7, 803.2727, 1203.851, 283.2763),
(28859, 8, 772.9372, 1197.981, 283.2763),
(28859, 9, 732.1138, 1200.647, 283.2763),
(28859, 10, 693.8761, 1217.995, 283.2763),
(28859, 11, 664.5038, 1256.539, 283.2763),
(28859, 12, 650.1497, 1303.485, 283.2763),
(28859, 13, 662.9109, 1350.291, 283.2763),
(28859, 14, 677.6391, 1377.607, 283.2763),
(28859, 15, 704.8198, 1401.162, 283.2763),
(28859, 16, 755.2642, 1417.1, 283.2763);
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 10137 AND `id` = 1;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10137 AND `id` = 1;
UPDATE `gossip_menu_option` SET `condition_id`='1712' WHERE `menu_id`=10137 AND `id`=0;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1712', '-2', '767', '768');
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 9262;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(9262, 0, 0, 'I am prepared to face Saragosa!', 1, 1, -1, 0, 26206, 0, 0, NULL, 9, 11957, 0, 0, 0, 0, 0, 0, 0, 551),
(9262, 1, 0, 'Keristrasa, I am finished here. Please return me to the Transitus Shield.', 1, 1, -1, 0, 50019, 0, 0, NULL, 9, 11967, 0, 0, 0, 0, 0, 0, 0, 552);
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 9262;
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` = 9699;
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(40224,142189,1,1,1,-10249.2,-3981.8,1.66783,-0.750491,0,0,0.366501,-0.930418,300,100,1),
(8087,142189,1,1,1,-10119.7,-4052.46,5.33005,-0.366519,0,0,0.182236,-0.983255,300,100,1),
(8090,142189,1,1,1,-10154.2,-3948.635,7.744733,2.652894,0,0,0.970295,0.241925,300,100,1);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14414', '1', 'Inconspicuous Landmark');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('142189', '14414', '0', 'Inconspicuous Landmark');
UPDATE `creature_template` SET `npcflag`=0 WHERE `entry`=8151;
UPDATE `gossip_menu_option` SET `option_text`='How can I prove myself to the Timbermaw furbolg?' WHERE `menu_id`=3622 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Let me take a look at what you have to offer.' WHERE `menu_id`=4002 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='I am curious to see what a bucket of bolts has to offer.' WHERE `menu_id`=4003 AND `id`=0;
UPDATE `creature_template` SET `gossip_menu_id`=3963 WHERE `entry`=11626;
UPDATE `creature_template` SET `gossip_menu_id`=8080 WHERE `entry`=17310;
UPDATE `creature_template` SET `gossip_menu_id`=7407 WHERE `entry`=17303;
UPDATE `creature_template` SET `gossip_menu_id`=7405 WHERE `entry`=17287;
REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES (3963, 4815),(7405, 8874),(7407, 8876),(8080, 9986);

# xfurry
update creature_template set unit_flags=unit_flags&~33554432 where entry=17096;
UPDATE `creature_template` SET MovementType=0 WHERE entry in (17007,19872,19873,19874,19875,19876);
DELETE FROM creature_linking_template WHERE entry IN (17007,19872,19873,19874,19875,19876);
INSERT INTO creature_linking_template VALUES
(17007,532,15687,3,0),
(19872,532,15687,3,0),
(19873,532,15687,3,0),
(19874,532,15687,3,0),
(19875,532,15687,3,0),
(19876,532,15687,3,0);

# ACID 309c -> 309d
UPDATE db_version SET `creature_ai_version` = 'ACID 3.0.9d \'Streamlined Perfection\' - Full Release for MaNGOS (3.3.5a Client)';
REPLACE INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES
('-139','You have come to play? Then let us play!','0','0','0','9520','0'),
('-142','%s submits.','0','2','0','9520','0'),
('-175','You will suffer eternally!','0','1','0','21181','0'),
('-176','Little creature made of flesh, your wish is granted! Death comes for you!','0','1','0','21181','0'),
('-581','By the Light, you will leave this tomb!','0','0','0','1854','0'),
('-661','You have chosen death.','0','0','0','18493','0'),
('-662','%s growls in your direction before taking time to sniff you.','0','2','0','3695','0'),
('-663','%s faces southeast and whimpers before looking back at you. ','0','2','0','3695','0'),
('-818','You will rest with the honored dead.','0','0','0','18493','0'),
('-821','You will pay for this violation.','0','0','0','18493','0'),
('-1227','This is sacred ground!','10530','1','0','18702','0'),
('-1228','This is sacred ground!','10533','1','0','18702','0'),
('-1229','This is sacred ground!','10536','1','0','18702','0'),
('-1230','How dare you come here?','10531','1','0','18702','0'),
('-1231','How dare you come here?','10534','1','0','18702','0'),
('-1232','How dare you come here?','10537','1','0','18702','0'),
('-1233','Outsiders are forbidden!','10532','1','0','18702','0'),
('-1234','Outsiders are forbidden!','10535','1','0','18702','0'),
('-1235','Outsiders are forbidden!','10538','1','0','18702','0'),
('-1236','If you hear the whisper, you\'re dying...','0','0','0','Mana-Tombs','0'),
('-1237','Welcome to the Void...','0','0','0','Mana-Tombs','0'),
('-1238','You\'re far from home, stranger.','0','0','0','Mana-Tombs','0'),
('-1239','What have the netherwinds brought us?','0','0','0','Mana-Tombs','0'),
('-1240','Arak-ha!','0','0','0','Sethekk Halls','0'),
('-1241','Protect the Veil!','0','0','0','Sethekk Halls','0'),
('-1242','Darkfire -- avenge us!','0','0','0','Sethekk Halls','0'),
('-1243','Ssssekk-sara Rith-nealaak!','0','0','0','Sethekk Halls','0'),
('-1244','In Terokk\'s name!','0','0','0','Sethekk Halls','0'),
('-1245','%s begins to summon in a Cabal Deathsworn!','0','2','0','18634','0'),
('-1246','%s begins to summon in a Cabal Acolyte!','0','2','0','18634','0'),
('-1247','Cabal Summoner summons a Cabal Deathsworn to his aid!','0','2','0','19209','0'),
('-1248','Cabal Summoner summons a Cabal Acolyte to his aid!','0','2','0','19208','0'),
('-1249','You\'re a slave. That\'s all you\'ll ever be.','10407','1','0','17862','0'),
('-1250','I don\'t know what Blackmoore sees in you. For my money, you\'re just another ignorant savage!','10408','1','0','17862','0'),
('-1251','Thrall will never be free!','10409','1','0','17862','0'),
('-1252','Did you really think you would leave here alive?','10410','1','0','17862','0'),
('-1253','Guards! Urgh..Guards..!','10411','1','0','17862','0'),
('-1254','You there, fetch water quickly! Get these flames out before they spread to the rest of the keep! Hurry, damn you!','10428','1','0','17848','0'),
('-1255','I know what you\'re up to, and I mean to put an end to it, permanently!','10429','1','0','17848','0'),
('-1256','No more middling for you.','10432','1','0','17848','0'),
('-1257','You will not interfere!','10433','1','0','17848','0'),
('-1258','Time to bleed!','10430','1','0','17848','0'),
('-1259','Run, you blasted cowards!','10431','1','0','17848','0'),
('-1260','Thrall... must not... go free.','10434','1','0','17848','0'),
('-1261','Enough! I will erase your very existence!','10421','1','0','18096','0'),
('-1262','You cannot fight fate!','10422','1','0','18096','0'),
('-1263','You are...irrelevant.','10425','1','0','18096','0'),
('-1264','Thrall will remain a slave. Taretha will die. You have failed.','10426','1','0','18096','0'),
('-1265','Not so fast!','10423','1','0','18096','0'),
('-1266','Struggle as much as you like!','10424','1','0','18096','0'),
('-1267','No!...The master... will not... be pleased.','10427','1','0','18096','0'),
('-1268','At last I am liberated. It has been too long since I have tasted true freedom!','11309','1','0','21875','0'),
('-1269','I have no equal.','11306','1','0','21875','0'),
('-1270','Perish, mortal.','11307','1','0','21875','0'),
('-1271','Yes, YES! Ahahah!','11308','1','0','21875','0'),
('-1272','I\'m thinking of a vacation. I hear Hearthglen is nice.','0','0','0','Old Hillsbrad Foothills','0'),
('-1273','Quitting time can\'t come too soon.','0','0','0','Old Hillsbrad Foothills','0'),
('-1274','I hear that Blackmoore has been acting strange.','0','0','0','Old Hillsbrad Foothills','0'),
('-1275','This area is restricted!','0','0','0','Old Hillsbrad Foothills','0'),
('-1276','Halt!','0','0','0','Old Hillsbrad Foothills','0'),
('-1277','Surrender immediately!','0','0','0','Old Hillsbrad Foothills','0'),
('-1278','Stop them!','0','0','0','Old Hillsbrad Foothills','0'),		
('-1279','Why...?','0','0','0','Old Hillsbrad Foothills','0'),
('-1280','Blackmoore will have... your head!','0','0','0','Old Hillsbrad Foothills','0'),
('-1281','I was just... following orders.','0','0','0','Old Hillsbrad Foothills','0'),
('-1282','Cursed scum!','0','0','0','Old Hillsbrad Foothills','0'),		
('-1283','He\'s here, stop him!','0','0','0','Old Hillsbrad Foothills','0'),
('-1284','Give up or die!','0','0','0','Old Hillsbrad Foothills','0'),
('-1285','You won\'t get far....','0','0','0','Old Hillsbrad Foothills','0'),
('-1286','You think you\'ve won?','0','0','0','Old Hillsbrad Foothills','0'),
('-1287','I\'ll...','0','0','0','Old Hillsbrad Foothills','0'),
('-1288','You don\'t stand a chance!','0','0','0','Old Hillsbrad Foothills','0'),
('-1289','We have all the time in the world....','0','0','0','Old Hillsbrad Foothills','0'),
('-1290','All that you know... will be undone.','0','0','0','Old Hillsbrad Foothills','0'),
('-1291','You cannot escape us!','0','0','0','Old Hillsbrad Foothills','0'),
('-1292','Hm, hungry.','0','0','0','18598','0'),
('-1293','So-ngh-thirsty.','0','0','0','18598','0'),
('-1294','Intruders have breached the hatchery! Sound the alarm! Protect the eggs at all costs!','0','1','0','12557','0'),
('-1295','Foolish mortal, you serve me now!','0','1','0','12557','0'),
('-1296','The power of the light is truly great and merciful.','0','0','0','14484, 14485','0'),
('-1297','We shall be reunited once more, my love...','0','0','0','14484, 14485','0'),
('-1298','At last, it ends...','0','0','0','14484, 14485','0'),
('-1299','Stranger, find the fallen Prince Menethil and end his reign of terror.','0','0','0','14484, 14485','0'),
('-1300','Should I live through this, I shall make it my life\'s sole ambition to destroy Arthas...','0','0','0','14484, 14485','0'),
('-1301','I won\'t make it... go... go on without me...','0','0','0','14484, 14485','0'),
('-1302','Death take me! I cannot go on! I have nothing left...','0','0','0','14484, 14485','0');
DELETE FROM creature_ai_scripts WHERE creature_id in (18313,18319,18328,18701,23035,18634,18639,18092,18093,18094,17835,17892,18995,21818,17961,30661,30662,30663,30664,30665,30666,30667,30668,30918,30961,30962,30963,32191,29983,36612,36626,36627,36678,36789,36724,36725,36791,36805,36807,36808,36811,36829,36855,36880,37007,37011,37012,37022,37023,37038,37122,37123,37124,37125,37126,37127,37129,37132,37133,37134,37230,37531,37532,37544,37545,37546,37571,37595,37662,37663,37664,37665,37666,37755,37813,37863,37868,37886,37934,37970,37972,37973,38004,38068,38125,38248,38490,38494,19428);
REPLACE INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
('952001','9520','4','0','100','0','0','0','0','0','1','-139','0','0','0','0','0','0','0','0','0','0','Grark Lorkrub - Say on Aggro'),
('952002','9520','2','0','100','0','25','0','0','0','2','35','1','0','24','0','0','0','1','-142','0','0','Grark Lorkrub - Become Friendly and Evade at 25% HP'),
('952003','9520','1','0','100','0','120000','120000','0','0','2','40','0','0','0','0','0','0','0','0','0','0','Grark Lorkrub - Become Hostile After 2 Minutes'),
('853001','8530','6','0','100','0','0','0','0','0','12','11064','0','0','0','0','0','0','0','0','0','0','Cannibal Ghoul - Summon Darrowshire Spirit on Death'),
('853101','8531','6','0','100','0','0','0','0','0','12','11064','0','0','0','0','0','0','0','0','0','0','Gibbering Ghoul - Summon Darrowshire Spirit on Death'),
('853201','8532','6','0','100','0','0','0','0','0','12','11064','0','0','0','0','0','0','0','0','0','0','Diseased Flayer - Summon Darrowshire Spirit on Death'),
('1448401','14484','11','0','100','0','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Injured Peasant - Set Combat Movement False on Spawn'),
('1448402','14484','1','0','20','1','2000','6000','4000','8000','11','23072','0','0','0','0','0','0','0','0','0','0','Injured Peasant - Cast Seething Plague'),
('1448403','14484','1','0','50','1','2000','6000','4000','8000','11','23127','0','0','0','0','0','0','0','0','0','0','Injured Peasant - Cast Death\'s Door'),
('1448404','14484','1','0','10','0','10000','15000','0','0','1','-1300','-1301','-1302','0','0','0','0','0','0','0','0','Injured Peasant - Random Yell'),
('1448405','14484','8','0','25','32','23107','-1','0','0','1','-1296','-1297','-1298','1','-1296','-1298','-1299','1','-1297','-1298','-1299','Injured Peasant - Random Yell on Spell Hit'),
('1448501','14485','11','0','100','0','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Plagued Peasant - Set Combat Movement False on Spawn'),
('1448502','14485','1','0','60','1','2000','6000','4000','8000','11','23127','0','0','0','0','0','0','0','0','0','0','Plagued Peasant - Cast Death\'s Door'),
('1448503','14485','1','0','20','1','2000','6000','4000','8000','11','23072','0','0','0','0','0','0','0','0','0','0','Plagued Peasant - Cast Seething Plague'),
('1448504','14485','1','0','10','0','10000','15000','0','0','1','-1300','-1301','-1302','0','0','0','0','0','0','0','0','Plagued Peasant - Random Yell'),
('1448505','14485','8','0','25','32','23107','-1','0','0','1','-1296','-1297','-1298','1','-1296','-1298','-1299','1','-1297','-1298','-1299','Plagued Peasant - Random Yell on Spell Hit'),
('185402','1854','4','0','100','0','0','0','0','0','1','-581','0','0','0','0','0','0','0','0','0','0','High Priest Thel\'danis - Say on Aggro'),
('369501','3695','22','0','100','1','101','0','0', '0','1','-662','0','0','1','-663','0','0','0','0','0','0','Grimclaw - Text Emote on Recive Wave Emote'),
('2386403','23864','1','0','100','0','11000','11000','0','0','19','768','0','0','0','0','0','0','0','0','0','0','Zelfrax - Remove Non-Attackable Flag'),
('494901','4949','0','0','100','1','2000','2000','9000','9000','11','16033','1','0','0','0','0','0','0','0','0','0','Thrall - Cast Chain Lightning'),
('494902','4949','0','0','100','1','8000','8000','15000','15000','11','16034','1','0','0','0','0','0','0','0','0','0','Thrall - Cast Shock'),
('305701','3057','0','0','100','1','30000','30000','25000','25000','11','16636','4','0','0','0','0','0','0','0','0','0','Cairne Bloodhoof - Cast Berserker Charge'),
('305702','3057','0','0','100','1','5000','5000','7000','7000','11','16044','1','0','0','0','0','0','0','0','0','0','Cairne Bloodhoof - Cast Cleave'),
('305703','3057','0','0','100','1','10000','10000','15000','15000','11','16856','1','0','0','0','0','0','0','0','0','0','Cairne Bloodhoof - Cast Mortal Strike'),
('305704','3057','0','0','100','1','15000','15000','15000','15000','11','23931','0','0','0','0','0','0','0','0','0','0','Cairne Bloodhoof - Cast Thunderclap'),
('305705','3057','0','0','100','1','10000','10000','20000','20000','11','22916','1','0','0','0','0','0','0','0','0','0','Cairne Bloodhoof - Cast Uppercut'),
('2130601','21306','1','0','20','1','6000','9000','10000','15000','2','14','1','0','0','0','0','0',' 0','0','0','0','Cursed Scarab - 20% Should Change Faction'),
('2118101','21181','11','0','100','0','0','0','0','0','11','36329','0','0','1','-175','0','0','0','0','0','0','Cyrukh the Firelord - Cast Cyrukh Fire Kit and Yell on Spawned'),
('2118102','21181','4','0','100','0','0','0','0','0','1','-176','0','0','0','0','0','0','0','0','0','0','Cyrukh the Firelord - Yell on Aggro'),
('2118103','21181','0','0','100','1','10000','13000','10000','13000','11','39429','4','0','0','0','0','0','0','0','0','0','Cyrukh the Firelord - Cast Fel Flamestrike'),
('2118104','21181','0','0','100','1','20000','23000','20000','23000','11','18945','1','0','0','0','0','0','0','0','0','0','Cyrukh the Firelord - Cast Knock Away'),
('2118105','21181','0','0','100','1','15000','18000','19000','22000','11','39425','0','0','0','0','0','0','0','0','0','0','Cyrukh the Firelord - Cast Trample'),
('2118106','21181','6','0','100','0','0','0','0','0','11','37235','0','2','0','0','0','0','0','0','0','0','Cyrukh the Firelord - Cast Cyrukh Defeated on Death'),
('2118107','21181','21','0','100','0','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Cyrukh the Firelord - Forced Despawn on Reached Home'),
('2140301','21403','1','0','100','1','1000','1000','4000','4000','11','36804','0','0','0','0','0','0 ','0','0','0','0','Invis Legion Hold Caster - Cast Electrical Shock OOC'),
('2168601','21686','0','0','100','1','15000','17000','15000','17000','11','7159','1','0','0','0','0','0','0','0','0','0','Borak, Son of Oronok - Cast Backstab'),
('2168602','21686','0','0','100','1','8000','10000','8000','10000','11','27611','1','0','0','0','0','0','0','0','0','0','Borak, Son of Oronok - Cast Eviscerate'),
('2168603','21686','0','0','100','1','40000','45000','40000','45000','11','30470','0','0','0','0','0','0','0','0','0','0','Borak, Son of Oronok - Cast Slice and Dice'),
('2168701','21687','4','0','100','0','0','0','0','0','11','31403','0','2','11','12169','0','2','0','0','0','0','Grom\'tor, Son of Oronok - Cast Battle Shout and Shield Block on Aggro'),
('2168702','21687','0','0','100','1','12000','15000','12000','15000','11','29426','1','0','0','0','0','0','0','0','0','0','Grom\'tor, Son of Oronok - Cast Heroic Strike'),
('2168703','21687','0','0','100','1','20000','23000','20000','23000','11','16145','1','0','0','0','0','0','0','0','0','0','Grom\'tor, Son of Oronok - Cast Sunder Armor'),
('2168704','21687','0','0','100','1','25000','28000','23000','26000','11','26281','1','0','0','0','0','0','0','0','0','0','Grom\'tor, Son of Oronok - Cast Taunt'),
('2168705','21687','2','0','100','1','30','0','30000','40000','11','15062','0','0','0','0','0','0','0','0','0','0','Grom\'tor, Son of Oronok - Cast Shield Wall'),
('2346701','23467','11','0','100','0','0','0','0', '0','11','24240','0','1','0','0','0','0','0','0',' 0','0','Lord Illidan - Cast Spawn - Red Lightning on Spawn'),
('1847801','18478','4','0','100','6','0','0','0','0','23','1','0','0','0','0','0','0','0','0','0','0','Avatar of the Martyred - Set Phase 1 on Aggro'),
('1847802','18478','0','0','100','7','12100','16800','10900','24100','11','16856','1','0','0','0','0','0','0','0','0','0','Avatar of the Martyred - Cast Mortal Strike'),
('1847803','18478','9','5','100','7','0','5','6200','15700','11','16145','1','0','0','0','0','0','0','0','0','0','Avatar of the Martyred - Cast Sunder Armor (Phase 1)'),
('1847804','18478','24','5','100','7','16145','5','5000','5000','23','1','0','0','0','0','0','0','0','0','0','0','Avatar of the Martyred - Set Phase 2 on Target Max Sunder Armor Aura Stack (Phase 1)'),
('1847805','18478','28','3','100','7','16145','1','5000','5000','23','-1','0','0','0','0','0','0','0','0','0','0','Avatar of the Martyred - Set Phase 1 on Target Missing Sunder Armor Aura Stack (Phase 2)'),
('1847806','18478','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Avatar of the Martyred - Set Phase to 0 on Evade'),
('1849302','18493','0','0','15','6','0','0','0','0','1','-818','-821','-661','0','0','0','0','0','0','0','0','Auchenai Soulpriest - Random Say on Aggro'),
('1849303','18493','4','0','100','2','0','0','0','0','11','32860','1','0','23','1','0','0','0','0','0','0','Auchenai Soulpriest (Normal)- Cast Shadow Bolt and Set Phase 1 on Aggro'),
('1849304','18493','9','253','100','3','0','40','3600','6000','11','32860','1','0','0','0','0','0','0','0','0','0','Auchenai Soulpriest (Normal)- Cast Shadow Bolt (Phase 1)'),
('1849305','18493','4','0','100','4','0','0','0','0','11','38378','1','0','23','1','0','0','0','0','0','0','Auchenawi Soulpriest (Heroic)- Cast Shadow Bolt and Set Phase 1 on Aggro'),
('1849306','18493','9','253','100','5','0','40','3600','4800','11','38378','1','0','0','0','0','0','0','0','0','0','Auchenai Soulpriest (Heroic)- Cast Shadow Bolt (Phase 1)'),
('1849307','18493','3','253','100','6','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Auchenai Soulpriest - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 1)'),
('1849308','18493','9','253','100','6','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Auchenai Soulpriest - Start Combat Movement at 35 Yards (Phase 1)'),
('1849309','18493','9','253','100','6','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Auchenai Soulpriest - Prevent Combat Movement at 15 Yards (Phase 1)'),
('1849310','18493','9','253','100','6','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Auchenai Soulpriest - Start Combat Movement Below 5 Yards'),
('1849311','18493','3','251','100','7','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Auchenai Soulpriest - Set Phase 1 when Mana is above 30% (Phase 2)'),
('1849312','18493','0','249','100','6','3000','6000','0','0','31','3','7','0','0','0','0','0','0','0','0','0','Auchenai Soulpriest - Set Random Summon Phase 3-7 (Phase 1 and 2)'),
('1849313','18493','0','249','100','3','10800','19300','18300','33700','11','32858','4','1','0','0','0','0','0','0','0','0','Auchenai Soulpriest (Normal) - Cast Touch of the Forgotten (Phase 1 and 2)'),
('1849314','18493','0','249','100','5','10800','13300','16900','27700','11','38377','4','1','0','0','0','0','0','0','0','0','Auchenai Soulpriest (Heroic) - Cast Touch of the Forgotten (Phase 1 and 2)'),
('1849315','18493','2','249','100','3','50','0','19200','37400','11','32859','4','33','0','0','0','0','0','0','0','0','Auchenai Soulpriest - Cast Falter at 50% HP (Phase 1 and 2)'),
('1849316','18493','0','247','100','7','3000','5000','3000','5000','11','32853','0','1','22','1','0','0','0','0','0','0','Auchenai Soulpriest - Summon Unliving Soldier and Set Phase 1 (Phase 3)'),
('1849317','18493','0','239','100','7','3000','5000','3000','5000','11','32854','0','1','22','1','0','0','0','0','0','0','Auchenai Soulpriest - Summon Unliving Sorcerer and Set Phase 1 (Phase 4)'),
('1849318','18493','0','223','100','7','3000','5000','3000','5000','11','32855','0','1','22','1','0','0','0','0','0','0','Auchenai Soulpriest - Summon Unliving Cleric and Set Phase 1 (Phase 5)'),
('1849319','18493','0','191','100','7','3000','5000','3000','5000','11','32856','0','1','22','1','0','0','0','0','0','0','Auchenai Soulpriest - Summon Unliving Stalker and Set Phase 1 (Phase 6)'),
('1849320','18493','0','127','100','7','3000','5000','3000','5000','11','32857','0','1','22','1','0','0','0','0','0','0','Auchenai Soulpriest - Summon Phantasmal Possessor and Set Phase 1 (Phase 7)'),
('1849321','18493','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Auchenai Soulpriest - Set Phase to 0 on Evade'),
('1849501','18495','1','0','100','3','1000','1000','30000','60000','11','32861','0','33','0','0','0','0','0','0','0','0','Auchenai Vindicator (Normal) - Cast Shadowguard'),
('1849502','18495','1','0','100','5','1000','1000','30000','60000','11','38379','0','33','0','0','0','0','0','0','0','0','Auchenai Vindicator (Heroic) - Cast Shadowguard'),
('1849503','18495','0','0','15','6','0','0','0','0','1','-818','-821','-661','23','1','0','0','0','0','0','0','Auchenai Vindicator - Random Say and Set Phase 1 on Aggro'),
('1849504','18495','0','125','100','3','7200','13300','18100','25300','11','17439','1','0','0','0','0','0','0','0','0','0','Auchenai Vindicator (Normal) - Cast Shadow Shock (Phase 1)'),
('1849505','18495','0','125','100','5','7200','10900','15700','24100','11','17289','1','0','0','0','0','0','0','0','0','0','Auchenai Vindicator (Heroic) - Cast Shadow Shock (Phase 1)'),
('1849506','18495','0','125','100','6','2000','5000','0','0','31','2','6','0','0','0','0','0','0','0','0','0','Auchenai Vindicator - Set Random Summon Phase 2-6 (Phase 1)'),
('1849507','18495','0','123','100','7','1000','1000','1000','1000','11','32853','0','1','22','1','0','0','0','0','0','0','Auchenai Vindicator - Summon Unliving Soldier and Set Phase 1 (Phase 2)'),
('1849508','18495','0','119','100','7','1000','1000','1000','1000','11','32854','0','1','22','1','0','0','0','0','0','0','Auchenai Vindicator - Summon Unliving Sorcerer and Set Phase 1 (Phase 3)'),
('1849509','18495','0','111','100','7','1000','1000','1000','1000','11','32855','0','1','22','1','0','0','0','0','0','0','Auchenai Vindicator - Summon Unliving Cleric and Set Phase 1 (Phase 4)'),
('1849510','18495','0','95','100','7','1000','1000','1000','1000','11','32856','0','1','22','1','0','0','0','0','0','0','Auchenai Vindicator - Summon Unliving Stalker and Set Phase 1 (Phase 5)'),
('1849511','18495','0','63','100','7','1000','1000','1000','1000','11','32857','0','1','22','1','0','0','0','0','0','0','Auchenai Vindicator - Summon Phantasmal Possessor and Set Phase 1 (Phase 6)'),
('1849701','18497','1','0','100','7','1000','3000','5000','5000','11','38168','0','33','0','0','0','0','0','0','0','0','Auchenai Monk - Cast Spiritual Sight OOC'),
('1849702','18497','0','0','15','6','0','0','0','0','1','-818','-821','-661','23','1','0','0','0','0','0','0','Auchenai Monk - Random Say and Set Phase 1 on Aggro'),
('1849703','18497','0','125','100','7','18100','40400','20500','33700','11','37321','1','0','0','0','0','0','0','0','0','0','Auchenai Monk - Cast Overpower (Phase 1)'),
('1849704','18497','0','125','100','7','11500','14000','16900','30100','11','32849','0','0','0','0','0','0','0','0','0','0','Auchenai Monk - Cast Cyclone Strike (Phase 1)'),
('1849705','18497','13','125','100','7','8400','19300','0','0','11','32846','1','1','0','0','0','0','0','0','0','0','Auchenai Monk - Cast Counter Kick on Target Spell Cast (Phase 1)'),
('1849706','18497','27','125','100','7','38168','1','1000','3000','11','38168','0','1','0','0','0','0','0','0','0','0','Auchenai Monk - Cast Spiritual Sight on Missing Spiritual Sight Aura (Phase 1)'),
('1849707','18497','0','125','100','6','2000','5000','0','0','31','2','6','0','0','0','0','0','0','0','0','0','Auchenai Monk - Set Random Summon Phase 2-6 (Phase 1)'),
('1849708','18497','0','123','100','7','1000','1000','1000','1000','11','32853','0','1','22','1','0','0','0','0','0','0','Auchenai Monk - Summon Unliving Soldier and Set Phase 0 (Phase 2)'),
('1849709','18497','0','119','100','7','1000','1000','1000','1000','11','32854','0','1','22','1','0','0','0','0','0','0','Auchenai Monk - Summon Unliving Sorcerer and Set Phase 0 (Phase 3)'),
('1849710','18497','0','111','100','7','1000','1000','1000','1000','11','32855','0','1','22','1','0','0','0','0','0','0','Auchenai Monk - Summon Unliving Cleric and Set Phase 0 (Phase 4)'),
('1849711','18497','0','95','100','7','1000','1000','1000','1000','11','32856','0','1','22','1','0','0','0','0','0','0','Auchenai Monk - Summon Unliving Stalker and Set Phase 0 (Phase 5)'),
('1849712','18497','0','63','100','7','1000','1000','1000','1000','11','32857','0','1','22','1','0','0','0','0','0','0','Auchenai Monk - Summon Phantasmal Possessor and Set Phase 0 (Phase 6)'),
('1849802','18498','0','0','100','7','4800','10900','7200','14500','11','11972','1','32','0','0','0','0','0','0','0','0','Unliving Soldier - Cast Shield Bash'),
('1849902','18499','4','0','100','2','0','0','0','0','11','12466','1','1','23','1','0','0','0','0','0','0','Unliving Sorcerer (Normal)- Cast Fireball and Set Phase 1 on Aggro'),
('1849904','18499','4','0','100','4','0','0','0','0','11','17290','1','1','23','1','0','0','0','0','0','0','Unliving Sorcerer (Heroic) - Cast Fireball and Set Phase 1 on Aggro'),
('1849911','18499','0','0','100','3','3600','7800','7800','14500','11','15043','1','1','0','0','0','0','0','0','0','0','Unliving Sorcerer (Normal) - Cast Frostbolt'),
('1849912','18499','0','0','100','5','6000','8000','7800','14500','11','15530','1','1','0','0','0','0','0','0','0','0','Unliving Sorcerer (Heroic) - Cast Frostbolt'),
('1849913','18499','0','0','100','3','10900','16900','9700','15700','11','15744','0','1','0','0','0','0','0','0','0','0','Unliving Sorcerer (Normal) - Cast Blast Wave'),
('1849914','18499','0','0','100','5','10900','16900','7200','10900','11','22424','0','1','0','0','0','0','0','0','0','0','Unliving Sorcerer (Heroic) - Cast Blast Wave'),
('1850001','18500','14','0','100','3','1000','20','9700','16800','11','25058','6','0','0','0','0','0','0','0','0','0','Unliving Cleric (Normal) - Cast Renew on Friendlies'),
('1850002','18500','14','0','100','5','3000','20','9700','16800','11','38210','6','0','0','0','0','0','0','0','0','0','Unliving Cleric (Heroic) - Cast Renew on Friendlies'),
('1850003','18500','14','0','100','3','2000','20','12100','16900','11','33324','6','1','0','0','0','0','0','0','0','0','Unliving Cleric (Normal) - Cast Major Heal on Friendlies'),
('1850004','18500','14','0','100','5','6000','20','10800','16900','11','22883','6','1','0','0','0','0','0','0','0','0','Unliving Cleric (Heroic) - Cast Heal on Friendlies'),
('1850102','18501','9','1','100','3','5','30','2400','4800','11','15547','1','0','40','2','0','0','0','0','0','0','Unliving Stalker (Normal) - Cast Shoot and Set Ranged Weapon Model (Phase 1)'),
('1850103','18501','9','1','100','5','5','30','2400','4800','11','16100','1','0','40','2','0','0','0','0','0','0','Unliving Stalker (Heroic) - Cast Shoot and Set Ranged Weapon Model (Phase 1)'),
('1850107','18501','9','0','100','3','5','20','13300','22900','11','31975','4','0','0','0','0','0','0','0','0','0','Unliving Stalker (Normal) - Cast Serpent Sting'),
('1850108','18501','9','0','100','5','5','20','15700','22900','11','35511','4','0','0','0','0','0','0','0','0','0','Unliving Stalker (Heroic) - Cast Serpent Sting'),
('1850109','18501','0','0','100','7','2400','10400','3900','7200','11','32829','0','32','0','0','0','0','0','0','0','0','Unliving Stalker - Cast Spirit Vengeance'),
('1850110','18501','0','0','100','5','6000','11000','12000','16000','11','37551','5','1','40','2','0','0','0','0','0','0','Unliving Stalker (Heroic)- Cast Viper Sting'),
('1850601','18506','11','0','100','2','0','0','0','0','11','32811','0','1','0','0','0','0','0','0','0','0','Raging Soul - Cast Greater Invisibility on Spawn'),
('1850602','18506','4','0','100','2','0','0','0','0','28','0','32811','0','0','0','0','0','0','0','0','0','Raging Soul - Remove Greater Invisibility on Aggro'),
('1850603','18506','0','0','100','2','2000','5000','0','0','11','32888','1','0','0','0','0','0','0','0','0','0','Raging Soul (Normal) - Cast Rage'),
('1850604','18506','0','0','100','4','2000','5000','0','0','11','38380','1','0','0','0','0','0','0','0','0','0','Raging Soul (Heroic) - Cast Rage'),
('1850605','18506','7','0','100','6','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Raging Soul - Despawn on Evade'),
('1855602','18556','13','0','100','7','7200','18100','0','0','11','11972','1','1','0','0','0','0','0','0','0','0','Phasing Soldier - Cast Shield Bash on Target Spell Casting'),
('1855701','18557','14','0','100','3','1000','20','9700','16800','11','25058','6','0','0','0','0','0','0','0','0','0','Phasing Cleric (Normal) - Cast Renew on Friendlies'),
('1855702','18557','14','0','100','5','3000','20','9700','16800','11','38210','6','0','0','0','0','0','0','0','0','0','Phasing Cleric (Heroic) - Cast Renew on Friendlies'),
('1855703','18557','14','0','100','3','2000','20','12100','16900','11','33324','6','1','0','0','0','0','0','0','0','0','Phasing Cleric (Normal) - Cast Major Heal on Friendlies'),
('1855704','18557','14','0','100','5','6000','20','10800','16900','11','22883','6','1','0','0','0','0','0','0','0','0','Phasing Cleric (Heroic) - Cast Heal on Friendlies'),
('1855802','18558','4','0','100','2','0','0','0','0','11','12466','1','1','23','1','0','0','0','0','0','0','Phasing Sorcerer (Normal)- Cast Fireball and Set Phase 1 on Aggro'),
('1855804','18558','4','0','100','4','0','0','0','0','11','17290','1','1','23','1','0','0','0','0','0','0','Phasing Sorcerer (Heroic) - Cast Fireball and Set Phase 1 on Aggro'),
('1855811','18558','0','0','100','3','3600','7800','7800','14500','11','15043','1','1','0','0','0','0','0','0','0','0','Phasing Sorcerer (Normal) - Cast Frostbolt'),
('1855812','18558','0','0','100','5','6000','8000','7800','14500','11','15530','1','1','0','0','0','0','0','0','0','0','Phasing Sorcerer (Heroic) - Cast Frostbolt'),
('1855813','18558','0','0','100','3','10900','16900','9700','15700','11','15744','0','1','0','0','0','0','0','0','0','0','Phasing Sorcerer (Normal) - Cast Blast Wave'),
('1855814','18558','0','0','100','5','10900','16900','7200','10900','11','22424','0','1','0','0','0','0','0','0','0','0','Phasing Sorcerer (Heroic) - Cast Blast Wave'),
('1855902','18559','9','1','100','3','5','30','2400','4800','11','15547','1','0','40','2','0','0','0','0','0','0','Phasing Stalker (Normal) - Cast Shoot and Set Ranged Weapon Model (Phase 1)'),
('1855903','18559','9','1','100','5','5','30','2400','4800','11','16100','1','0','40','2','0','0','0','0','0','0','Phasing Stalker (Heroic) - Cast Shoot and Set Ranged Weapon Model (Phase 1)'),
('1855907','18559','9','0','100','3','5','20','13300','22900','11','31975','4','0','0','0','0','0','0','0','0','0','Phasing Stalker (Normal) - Cast Serpent Sting'),
('1855908','18559','9','0','100','5','5','20','15700','22900','11','35511','4','0','0','0','0','0','0','0','0','0','Phasing Stalker (Heroic) - Cast Serpent Sting'),
('1855909','18559','0','0','100','7','2400','10400','3900','7200','11','32829','0','32','0','0','0','0','0','0','0','0','Phasing Stalker - Cast Spirit Vengeance'),
('1855910','18559','0','0','100','5','6000','11000','12000','16000','11','37551','5','1','40','2','0','0','0','0','0','0','Phasing Stalker (Heroic)- Cast Viper Sting'),
('1870005','18700','0','0','100','7','6000','14000','8000','14000','11','13584','1','0','0','0','0','0','0','0','0','0','Reanimated Bones - Cast Strike'),
('1870201','18702','0','0','10','38','0','0','0','0','1','-1227','-1230','-1233','1','-1228','-1231','-1234','1','-1229','-1232','-1235','Auchenai Necromancer - Random Select for Random Yell on Aggro'),
('1870202','18702','0','0','100','7','1000','15200','4800','15700','11','35839','1','32','0','0','0','0','0','0','0','0','Auchenai Necromancer - Cast Drain Soul'), -- Super Fast Recasts until sucessful
('1870203','18702','0','0','100','7','12100','29000','22900','35000','11','32863','1','33','0','0','0','0','0','0','0','0','Auchenai Necromancer (Normal) - Cast Seed of Corruption'),
('1870204','18702','0','0','100','7','12100','17500','4800','9600','11','38252','1','33','0','0','0','0','0','0','0','0','Auchenai Necromancer (Heroic) - Cast Seed of Corruption'),
('1870205','18702','14','0','100','3','1000','15','15700','26500','11','33325','6','1','0','0','0','0','0','0','0','0','Auchenai Necromancer (Normal) - Cast Shadow Mend on Friendlies'),
('1870206','18702','14','0','100','5','2500','15','6100','8400','11','37367','6','1','0','0','0','0','0','0','0','0','Auchenai Necromancer (Heroic) - Cast Shadow Mend on Friendlies'),
('1941201','19412','11','0','100','6','0','0','0','0','1','-840','0','0','11','7765','0','0','0','0','0','0','D\'ore - Text Emote and Cast Projection on Spawn'),
('1830901','18309','4','0','15','38','0','0','0','0','1','-1236','-1237','-1237','1','-1237','-1238','-1239','1','-1236','-1238','-1239','Ethereal Scavenger - Random Say on Aggro'),
('1830902','18309','0','0','100','7','2400','4800','7200','21700','11','33871','1','32','0','0','0','0','0','0','0','0','Ethereal Scavenger - Cast Shield Bash'),
('1830903','18309','0','0','100','7','2400','8300','12100','20500','11','33865','4','0','0','0','0','0','0','0','0','0','Ethereal Scavenger - Cast Singe'),
('1830904','18309','0','0','100','7','14100','28200','8100','16200','11','34920','1','0','0','0','0','0','0','0','0','0','Ethereal Scavenger - Cast Strike'),
('1831101','18311','4','0','15','38','0','0','0','0','1','-1236','-1237','-1237','1','-1237','-1238','-1239','1','-1237','-1238','-1239','Ethereal Crypt Raider - Random Say on Aggro'),
('1831102','18311','9','0','100','6','8','25','0','0','11','22911','1','0','0','0','0','0','0','0','0','0','Ethereal Crypt Raider - Cast Charge'),
('1831103','18311','0','0','100','7','5800','8400','60200','66200','11','31403','0','1','0','0','0','0','0','0','0','0','Ethereal Crypt Raider - Cast Battle Shout'),
('1831104','18311','0','0','100','7','3600','13300','12100','18300','11','32315','1','0','0','0','0','0','0','0','0','0','Ethereal Crypt Raider - Cast Soul Strike'),
('1831105','18311','2','0','100','6','25','0','0','0','11','8599','0','1','1','-46','0','0','0','0','0','0','Ethereal Crypt Raider - Cast Enrage at 25% HP'),
('1831201','18312','4','0','15','38','0','0','0','0','1','-1236','-1237','-1237','1','-1237','-1238','-1239','1','-1236','-1238','-1239','Ethereal Spellbinder - Random Say on Aggro'),
('1831202','18312','0','0','100','3','4800','12400','14500','28900','11','17883','4','0','0','0','0','0','0','0','0','0','Ethereal Spellbinder (Normal) - Cast Immolate'),
('1831203','18312','0','0','100','5','4800','12400','14500','28900','11','37668','4','0','0','0','0','0','0','0','0','0','Ethereal Spellbinder (Heroic) - Cast Immolate'),
('1831204','18312','0','0','100','7','7200','14500','6100','16900','11','37470','1','0','0','0','0','0','0','0','0','0','Ethereal Spellbinder - Cast Counterspell'),
('1831205','18312','0','0','100','6','15700','20900','0','0','11','32316','0','1','0','0','0','0','0','0','0','0','Ethereal Spellbinder - Summon Wraith'),
('1831301','18313','4','0','15','38','0','0','0','0','1','-1236','-1237','-1237','1','-1237','-1238','-1239','1','-1237','-1238','-1239','Ethereal Sorcerer - Random Say on Aggro'),
('1831302','18313','0','0','100','3','5200','15700','15200','21200','11','15791','1','0','0','0','0','0','0','0','0','0','Ethereal Sorcerer (Normal)- Cast Arcane Missiles'),
('1831303','18313','0','0','100','5','5200','15700','15200','21200','11','22273','1','0','0','0','0','0','0','0','0','0','Ethereal Sorcerer (Heroic) - Cast Arcane Missiles'),
('1831304','18313','0','0','100','7','5100','11600','10800','21700','11','25603','4','1','0','0','0','0','0','0','0','0','Ethereal Sorcerer - Cast Slow'),
('1831305','18313','0','0','100','7','14000','25600','70700','71100','11','32349','0','0','11','32353','0','0','0','0','0','0','Ethereal Sorcerer - Summon 2 Arcane Fiends'),
('1831401','18314','4','0','15','38','0','0','0','0','1','-1236','-1237','-1237','1','-1237','-1238','-1239','1','-1236','-1237','-1238','Nexus Stalker - Random Say on Aggro'),
('1831402','18314','0','0','100','7','4300','12100','9700','22100','11','34940','4','0','0','0','0','0','0','0','0','0','Nexus Stalker - Cast Gouge'),
('1831403','18314','0','0','100','3','5900','12100','10900','21700','11','33925','1','0','0','0','0','0','0','0','0','0','Nexus Stalker (Normal) - Cast Phantom Strike'),
('1831404','18314','0','0','100','5','5900','12100','10900','21700','11','39332','1','0','0','0','0','0','0','0','0','0','Nexus Stalker (Heroic) - Cast Phantom Strike'),
('1831501','18315','4','0','15','38','0','0','0','0','1','-1236','-1237','-1237','1','-1237','-1238','-1239','1','-1236','-1237','-1238','Ethereal Theurgist - Random Say on Aggro'),
('1831502','18315','9','0','100','3','0','5','7700','14400','11','15580','1','0','0','0','0','0','0','0','0','0','Ethereal Theurgist (Normal) - Cast Strike'),
('1831503','18315','9','0','100','5','0','5','7700','14400','11','34920','1','0','0','0','0','0','0','0','0','0','Ethereal Theurgist (Heroic) - Cast Strike'),
('1831504','18315','0','0','100','3','4200','13300','18100','24100','11','17145','0','0','0','0','0','0','0','0','0','0','Ethereal Theurgist (Normal) - Cast Blast Wave'),
('1831505','18315','0','0','100','5','4200','13300','18100','24100','11','38064','0','0','0','0','0','0','0','0','0','0','Ethereal Theurgist (Heroic) - Cast Blast Wave'),
('1831506','18315','0','0','100','7','2400','7200','18000','24000','11','13323','5','1','0','0','0','0','0','0','0','0','Ethereal Theurgist - Cast Polymorph'),
('1831701','18317','4','0','15','38','0','0','0','0','1','-1236','-1237','-1237','1','-1237','-1238','-1239','1','-1236','-1238','-1239','Ethereal Priest - Random Say on Aggro'),
('1831702','18317','0','0','100','3','4800','7700','10800','20500','11','34944','0','1','0','0','0','0','0','0','0','0','Ethereal Priest (Normal) - Cast Holy Nova'),
('1831703','18317','0','0','100','5','4800','7700','10800','20500','11','37669','0','1','0','0','0','0','0','0','0','0','Ethereal Priest (Heroic) - Cast Holy Nova'),
('1831704','18317','0','0','100','3','3400','9600','10800','18100','11','17139','0','1','0','0','0','0','0','0','0','0','Ethereal Priest (Normal) - Cast Power Word: Shield'),
('1831705','18317','0','0','100','5','3400','9600','10800','18100','11','35944','0','1','0','0','0','0','0','0','0','0','Ethereal Priest (Heroic) - Cast Power Word: Shield'),
('1831706','18317','14','0','100','3','4000','40','25000','35000','11','22883','6','1','0','0','0','0','0','0','0','0','Ethereal Priest (Normal) - Cast Heal on Friendlies'),
('1831707','18317','14','0','100','5','6000','40','25000','35000','11','34945','6','1','0','0','0','0','0','0','0','0','Ethereal Priest (Heroic) - Cast Heal on Friendlies'),
('1833101','18331','11','0','100','6','0','0','0','0','11','16592','0','1','0','0','0','0','0','0','0','0','Ethereal Darkcaster - Cast Shadowform on Spawn'),
('1833102','18331','4','0','15','38','0','0','0','0','1','-1236','-1237','-1237','1','-1237','-1238','-1239','1','-1236','-1238','-1239','Ethereal Darkcaster - Random Say on Aggro'),
('1833103','18331','4','0','100','6','0','0','0','0','11','38061','0','1','0','0','0','0','0','0','0','0','Ethereal Darkcaster - Cast Vampiric Aura on Aggro'),
('1833104','18331','0','0','100','7','4300','8400','8400','18100','11','34942','1','0','0','0','0','0','0','0','0','0','Ethereal Darkcaster - Cast Shadow Word Pain'),
('1833105','18331','0','0','100','3','5600','10800','15600','25300','11','34930','4','0','0','0','0','0','0','0','0','0','Ethereal Darkcaster (Normal) - Cast Mana Burn'),
('1833106','18331','0','0','100','5','5600','10800','15600','25300','11','34931','4','0','0','0','0','0','0','0','0','0','Ethereal Darkcaster (Heroic) - Cast Mana Burn'),
('1834301','18343','0','0','100','3','7400','16800','7200','15500','11','8374','1','0','0','0','0','0','0','0','0','0','Tavarok (Normal) - Cast Arcing Smash'),
('1834302','18343','0','0','100','5','5400','12300','7200','15500','11','38761','1','0','0','0','0','0','0','0','0','0','Tavarok (Heroic) - Cast Arcing Smash'),
('1834303','18343','0','0','100','7','8500','17400','21700','27700','11','33919','0','1','0','0','0','0','0','0','0','0','Tavarok - Cast Earthquake'),
('1834304','18343','0','0','100','7','16900','37400','13300','25300','11','32361','4','1','0','0','0','0','0','0','0','0','Tavarok - Cast Crystal Prison'),
('1839403','18394','9','5','100','7','0','30','7800','13300','11','34934','1','0','0','0','0','0','0','0','0','0','Ethereal Wraith - Cast Shadowbolt Volley (Phase 1)'),
('1842901','18429','9','0','100','3','0','8','8400','10200','11','15253','0','1','0','0','0','0','0','0','0','0','Arcane Fiend (Normal) - Cast Arcane Explosion'),
('1842902','18429','9','0','100','5','0','8','6600','10200','11','33860','0','1','0','0','0','0','0','0','0','0','Arcane Fiend (Heroic) - Cast Arcane Explosion'),
('1842903','18429','0','0','100','7','8400','13700','10800','13300','11','15122','1','0','0','0','0','0','0','0','0','0','Arcane Fiend - Cast Counter Spell'),
('1843003','18430','9','13','100','7','0','40','3600','3600','11','32369','1','23','1','0','0','0','0','0','0','0','Ethereal Apprentice - Cast Fireball (Phase 1)'),
('1843004','18430','9','11','100','7','0','40','3600','3600','11','32370','1','23','-1','0','0','0','0','0','0','0','Ethereal Apprentice - Cast Frostbolt (Phase 2)'),
('1843005','18430','3','9','100','6','15','0','0','0','21','1','0','0','22','3','0','0','0','0','0','0','Ethereal Apprentice - Start Combat Movement and Set Phase 3 when Mana is at 15% (Phase 1 and 2)'),
('1843006','18430','9','9','100','6','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Ethereal Apprentice - Start Combat Movement at 35 Yards (Phase 1 and 2)'),
('1843007','18430','9','9','100','6','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Ethereal Apprentice - Prevent Combat Movement at 15 Yards (Phase 1 and 2)'),
('1843008','18430','9','0','100','6','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Ethereal Apprentice - Start Combat Movement Below 5 Yards'),
('1843009','18430','3','7','100','7','100','30','100','100','22','1','0','0','0','0','0','0','0','0','0','0','Ethereal Apprentice - Set Phase 1 when Mana is above 30% (Phase 3)'),
('1843101','18431','0','0','100','7','0','1000','3000','8000','11','15254','1','0','0','0','0','0','0','0','0','0','Ethereal Beacon - Cast  Arcane Bolt'),
('1843102','18431','0','0','100','2','20000','20000','0','0','11','32372','0','0','41','2000','0','0','0','0','0','0','Ethereal Beacon (Normal) - Cast Summon Ethereal Apprentice and Forced Despawn'),
('1843103','18431','0','0','100','4','10000','10000','0','0','11','32372','0','0','41','2000','0','0','0','0','0','0','Ethereal Beacon (Heroic) - Cast Summon Ethereal Apprentice and Forced Despawn'),
('1930601','19306','0','0','100','7','5800','10800','14600','18100','11','25602','4','0','0','0','0','0','0','0','0','0','Mana Leech - Cast Faerie Fire'),
('1930602','19306','0','0','100','7','8200','14500','13300','20500','11','15785','4','1','0','0','0','0','0','0','0','0','Mana Leech - Cast Mana Burn'),
('1930701','19307','0','0','100','7','3600','16900','15700','24100','11','34922','1','0','0','0','0','0','0','0','0','0','Nexus Terror - Cast Shadows Embrace'),
('1930702','19307','0','0','100','7','4800','19700','10800','21700','11','34322','0','0','0','0','0','0','0','0','0','0','Nexus Terror - Cast Psychic Scream'),
('1930703','19307','0','0','100','7','7100','20900','26500','37400','11','34925','4','0','0','0','0','0','0','0','0','0','Nexus Terror - Cast Curse of Impotence'),
('1930704','19307','0','0','100','7','8400','17100','15700','25300','11','38065','1','1','0','0','0','0','0','0','0','0','Nexus Terror (Heroic) - Cast Death Coil');
REPLACE INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
('1831801','18318','4','0','15','38','0','0','0','0','1','-1240','-1241','-1242','1','-1242','-1243','-1244','1','-1240','-1241','-1244','Sethekk Initiate - Random Say on Aggro'),
('1831802','18318','4','0','100','6','0','0','0','0','23','1','0','0','0','0','0','0','0','0','0','0','Sethekk Initiate - Set Phase 1 on Aggro'),
('1831803','18318','9','5','100','7','0','5','10800','18100','11','16145','1','0','0','0','0','0','0','0','0','0','Sethekk Initiate - Cast Sunder Armor (Phase 1)'),
('1831804','18318','24','5','100','7','16145','5','5000','5000','23','1','0','0','0','0','0','0','0','0','0','0','Sethekk Initiate - Set Phase 2 on Target Max Sunder Armor Aura Stack (Phase 1)'),
('1831805','18318','28','3','100','7','16145','1','5000','5000','23','-1','0','0','0','0','0','0','0','0','0','0','Sethekk Initiate - Set Phase 1 on Target Missing Sunder Armor Aura Stack (Phase 2)'),
('1831806','18318','0','0','100','7','7400','15700','27300','47100','11','33961','0','1','0','0','0','0','0','0','0','0','Sethekk Initiate - Cast Spell Reflection'),
('1831901','18319','1','0','100','7','1000','1000','1800000','1800000','11','32689','0','1','0','0','0','0','0','0','0','0','Time-Lost Scryer - Cast Arcane Destruction on Spawn'),
('1831902','18319','4','0','15','38','0','0','0','0','1','-1240','-1241','-1242','1','-1242','-1243','-1244','1','-1240','-1241','-1244','Time-Lost Scryer - Random Say on Aggro'),
('1831903','18319','0','0','100','3','7800','13300','10400','17700','11','22273','1','0','0','0','0','0','0','0','0','0','Time-Lost Scryer (Normal)- Cast Arcane Missiles'),
('1831904','18319','0','0','100','5','7800','13300','10400','17700','11','33989','1','0','0','0','0','0','0','0','0','0','Time-Lost Scryer (Heroic) - Cast Arcane Missiles'),
('1831905','18319','14','0','100','3','3300','15','9600','15700','11','17843','6','0','0','0','0','0','0','0','0','0','Time-Lost Scryer (Normal) - Cast Flash Heal on Friendies'),
('1831906','18319','14','0','100','5','4900','15','9600','15700','11','17138','6','0','0','0','0','0','0','0','0','0','Time-Lost Scryer (Heroic) - Cast Flash Heal on Friendies'),
('1831907','18319','14','0','100','3','7900','15','13200','21700','11','12160','6','1','0','0','0','0','0','0','0','0','Time-Lost Scryer (Normal) - Cast Rejuvenation on Friendies'),
('1831908','18319','14','0','100','5','11800','15','13200','21700','11','15981','6','1','0','0','0','0','0','0','0','0','Time-Lost Scryer (Heroic) - Cast Rejuvenation on Friendies'),
('1831909','18319','27','0','100','7','32689','1','5000','5000','11','32689','0','1','0','0','0','0','0','0','0','0','Time-Lost Scryer - Cast Arcane Destruction on Missing Arcane Destruction Aura'),
('1832001','18320','4','0','100','6','0','0','0','0','23','1','0','0','0','0','0','0','0','0','0','0','Time-Lost Shadowmage - Set Phase 1 on Aggro'),
('1832002','18320','0','5','100','3','4800','9600','21700','33800','11','32682','1','0','0','0','0','0','0','0','0','0','Time-Lost Shadowmage (Normal) - Cast Curse of the Dark Talon (Phase 1)'),
('1832003','18320','0','5','100','5','4800','9600','21700','33800','11','38149','1','0','0','0','0','0','0','0','0','0','Time-Lost Shadowmage (Heroic) - Cast Curse of the Dark Talon (Phase 1)'),
('1832004','18320','24','5','100','3','32682','5','5000','5000','23','1','0','0','0','0','0','0','0','0','0','0','Time-Lost Shadowmage (Normal) - Set Phase 2 on Target Max Curse of the Dark Talon Aura Stack (Phase 1)'),
('1832005','18320','24','5','100','5','38149','5','5000','5000','23','1','0','0','0','0','0','0','0','0','0','0','Time-Lost Shadowmage (Heroic) - Set Phase 2 on Target Max Curse of the Dark Talon Aura Stack (Phase 1)'),
('1832006','18320','28','3','100','3','32682','1','5000','5000','23','-1','0','0','0','0','0','0','0','0','0','0','Time-Lost Shadowmage (Normal) - Set Phase 1 on Target Missing Curse of the Dark Talon Aura Stack (Phase 2)'),
('1832007','18320','28','3','100','5','38149','1','5000','5000','23','-1','0','0','0','0','0','0','0','0','0','0','Time-Lost Shadowmage (Heroic) - Set Phase 1 on Target Missing Curse of the Dark Talon Aura Stack (Phase 2)'),
('1832008','18320','0','0','100','7','6600','18600','9300','21800','11','32677','1','0','0','0','0','0','0','0','0','0','Time-Lost Shadowmage - Cast Shadow Missiles'),
('1832009','18320','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Time-Lost Shadowmage - Set Phase to 0 on Evade'),
('1832101','18321','4','0','15','38','0','0','0','0','1','-1240','-1241','-1242','1','-1242','-1243','-1244','1','-1240','-1241','-1244','Sethekk Talon Lord - Random Say on Aggro'),
('1832102','18321','0','0','100','7','2400','7200','16300','24300','11','32674','4','0','0','0','0','0','0','0','0','0','Sethekk Talon Lord - Cast Avengers Shield'),
('1832103','18321','0','0','100','7','9300','16700','14300','25400','11','32654','5','0','0','0','0','0','0','0','0','0','Sethekk Talon Lord - Cast Talon of Justice'),
('1832201','18322','4','0','15','38','0','0','0','0','1','-1240','-1241','-1242','1','-1242','-1243','-1244','1','-1241','-1242','-1243','Sethekk Ravenguard - Random Say on Aggro'),
('1832202','18322','0','0','100','3','7200','20500','10800','21700','11','33964','1','0','0','0','0','0','0','0','0','0','Sethekk Ravenguard (Normal) - Cast Bloodthirst'),
('1832203','18322','0','0','100','5','7200','20500','10800','21700','11','40423','1','0','0','0','0','0','0','0','0','0','Sethekk Ravenguard (Heroic) - Cast Bloodthirst'),
('1832204','18322','0','0','100','7','6100','17400','16800','21700','11','32651','0','0','0','0','0','0','0','0','0','0','Sethekk Ravenguard - Cast Howling Screech'),
('1832205','18322','2','0','100','6','15','0','0','0','11','34970','0','1','0','0','0','0','0','0','0','0','Sethekk Ravenguard - Cast Frenzy at 15% HP'),
('1832301','18323','4','0','15','38','0','0','0','0','1','-1240','-1241','-1242','1','-1242','-1243','-1244','1','-1241','-1242','-1243','Sethekk Guard - Random Say on Aggro'),
('1832302','18323','0','0','100','7','3600','15700','10900','22100','11','33967','0','0','0','0','0','0','0','0','0','0','Sethekk Guard - Cast Thunderclap'),
('1832501','18325','0','0','100','7','8700','17700','13200','24100','11','27641','4','0','0','0','0','0','0','0','0','0','Sethekk Prophet - Cast Fear'),
('1832502','18325','6','0','100','6','0','0','0','0','12','18703','1','10000','0','0','0','0','0','0','0','0','Sethekk Prophet - Spawn Sethekk Spirit on Death'),
('1832601','18326','4','0','15','38','0','0','0','0','1','-1240','-1241','-1242','1','-1242','-1243','-1244','1','-1241','-1242','-1243','Sethekk Shaman - Random Say on Aggro'),
('1832602','18326','4','0','100','6','0','0','0','0','22','1','0','0','0','0','0','0','0','0','0','0','Sethekk Shaman - Set Phase 1 on Aggro'),
('1832603','18326','0','5','100','7','7900','14500','90000','90000','11','32663','1','1','0','0','0','0','0','0','0','0','Sethekk Shaman - Summon Dark Vortex (Phase 1)'),
('1832604','18326','17','5','100','7','18701','5000','5000','0','23','1','0','0','0','0','0','0','0','0','0','0','Sethekk Shaman - Set Phase 2 on Dark Vortex Spawn (Phase 1)'),
('1832605','18326','25','3','100','7','18701','5000','5000','0','23','-1','0','0','0','0','0','0','0','0','0','0','Sethekk Shaman - Set Phase 1 on Dark Vortex Death (Phase 2)'),
('1832606','18326','0','0','100','3','4300','9100','7200','14500','11','15501','1','0','0','0','0','0','0','0','0','0','Sethekk Shaman (Normal) - Cast Earth Shock'),
('1832607','18326','0','0','100','5','4300','9100','7200','14500','11','22885','1','0','0','0','0','0','0','0','0','0','Sethekk Shaman (Heroic) - Cast Earth Shock'),
('1832608','18326','6','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Sethekk Shaman - Set Phase 0 on Death'),
('1832701','18327','4','0','15','38','0','0','0','0','1','-1240','-1241','-1242','1','-1240','-1242','-1244','1','-1241','-1242','-1243','Time-Lost Controller - Random Say on Aggro'),
('1832702','18327','0','0','100','7','9100','24100','27800','48300','11','32764','0','1','0','0','0','0','0','0','0','0','Time-Lost Controller - Summon Charming Totem'),
('1832703','18327','0','0','100','7','8400','23200','9700','32600','11','35013','4','0','0','0','0','0','0','0','0','0','Time-Lost Controller - Cast Shrink'),
('1832801','18328','4','0','15','38','0','0','0','0','1','-1240','-1241','-1242','1','-1240','-1242','-1244','1','-1241','-1242','-1243','Sethekk Oracle - Random Say on Aggro'),
('1832802','18328','0','0','100','3','6100','12100','18500','27700','11','32690','1','0','0','0','0','0','0','0','0','0','Sethekk Oracle (Normal) - Cast Arcane Lightning'),
('1832803','18328','0','0','100','5','1200','12100','7200','13300','11','38146','1','0','0','0','0','0','0','0','0','0','Sethekk Oracle (Heroic) - Cast Arcane Lightning'),
('1832804','18328','0','0','100','7','2400','8700','8400','19300','11','32129','1','32','0','0','0','0','0','0','0','0','Sethekk Oracle - Cast Faerie Fire'),
('1870101','18701','0','0','100','7','3600','7200','8400','19300','11','12471','1','0','0','0','0','0','0','0','0','0','Dark Vortex - Cast Shadow Bolt'),
('1870102','18701','7','0','100','6','0','0','0','0','18','33554432','0','0','41','0','0','0','0','0','0','0','Dark Vortex - Set Unit Flags and Despawn on Evade'),
('1920301','19203','4','0','100','6','0','0','0','0','23','1','0','0','0','0','0','0','0','0','0','0','Syth Fire Elemental - Set Phase 1 on Aggro'),
('1920302','19203','0','5','100','3','2400','9700','8400','18100','11','33526','1','0','0','0','0','0','0','0','0','0','Syth Fire Elemental (Normal) - Cast Flame Buffet (Phase 1)'),
('1920303','19203','0','5','100','5','1200','3600','6000','7200','11','38141','1','0','0','0','0','0','0','0','0','0','Syth Fire Elemental (Heroic) - Cast Flame Buffet (Phase 1)'),
('1920304','19203','24','5','100','3','33526','5','3000','3000','23','1','0','0','0','0','0','0','0','0','0','0','Syth Fire Elemental (Normal) - Set Phase 2 on Target Max Flame Buffet Aura Stack (Phase 1)'),
('1920305','19203','24','5','100','5','38141','5','3000','3000','23','1','0','0','0','0','0','0','0','0','0','0','Syth Fire Elemental (Heroic) - Set Phase 2 on Target Max Flame Buffet Aura Stack (Phase 1)'),
('1920306','19203','28','3','100','3','33526','1','3000','3000','23','-1','0','0','0','0','0','0','0','0','0','0','Syth Fire Elemental (Normal) - Set Phase 1 on Target Missing Flame Buffet Aura Stack (Phase 2)'),
('1920307','19203','28','3','100','5','38141','1','3000','3000','23','-1','0','0','0','0','0','0','0','0','0','0','Syth Fire Elemental (Heroic) - Set Phase 1 on Target Missing Flame Buffet Aura Stack (Phase 2)'),
('1920308','19203','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Syth Fire Elemental - Set Phase to 0 on Evade'),
('1920401','19204','4','0','100','6','0','0','0','0','23','1','0','0','0','0','0','0','0','0','0','0','Syth Frost Elemental - Set Phase 1 on Aggro'),
('1920402','19204','0','5','100','3','1600','7600','8400','18100','11','33528','1','0','0','0','0','0','0','0','0','0','Syth Frost Elemental (Normal) - Cast Frost Buffet (Phase 1)'),
('1920403','19204','0','5','100','5','1200','3600','6000','7200','11','38142','1','0','0','0','0','0','0','0','0','0','Syth Frost Elemental (Heroic) - Cast Frost Buffet (Phase 1)'),
('1920404','19204','24','5','100','3','33528','5','3000','3000','23','1','0','0','0','0','0','0','0','0','0','0','Syth Frost Elemental (Normal) - Set Phase 2 on Target Max Frost Buffet Aura Stack (Phase 1)'),
('1920405','19204','24','5','100','5','38142','5','3000','3000','23','1','0','0','0','0','0','0','0','0','0','0','Syth Frost Elemental (Heroic) - Set Phase 2 on Target Max Frost Buffet Aura Stack (Phase 1)'),
('1920406','19204','28','3','100','3','33528','1','3000','3000','23','-1','0','0','0','0','0','0','0','0','0','0','Syth Frost Elemental (Normal) - Set Phase 1 on Target Missing Frost Buffet Aura Stack (Phase 2)'),
('1920407','19204','28','3','100','5','38142','1','3000','3000','23','-1','0','0','0','0','0','0','0','0','0','0','Syth Frost Elemental (Heroic) - Set Phase 1 on Target Missing Frost Buffet Aura Stack (Phase 2)'),
('1920408','19204','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Syth Frost Elemental - Set Phase to 0 on Evade'),
('1920501','19205','4','0','100','6','0','0','0','0','23','1','0','0','0','0','0','0','0','0','0','0','Syth Arcane Elemental - Set Phase 1 on Aggro'),
('1920502','19205','0','5','100','3','1600','7600','8400','18100','11','33527','1','0','0','0','0','0','0','0','0','0','Syth Arcane Elemental (Normal) - Cast Arcane Buffet (Phase 1)'),
('1920503','19205','0','5','100','5','1200','3600','6000','7200','11','38138','1','0','0','0','0','0','0','0','0','0','Syth Arcane Elemental (Heroic) - Cast Arcane Buffet (Phase 1)'),
('1920504','19205','24','5','100','3','33527','5','3000','3000','23','1','0','0','0','0','0','0','0','0','0','0','Syth Arcane Elemental (Normal) - Set Phase 2 on Target Max Arcane Buffet Aura Stack (Phase 1)'),
('1920505','19205','24','5','100','5','38138','5','3000','3000','23','1','0','0','0','0','0','0','0','0','0','0','Syth Arcane Elemental (Heroic) - Set Phase 2 on Target Max Arcane Buffet Aura Stack (Phase 1)'),
('1920506','19205','28','3','100','3','33527','1','3000','3000','23','-1','0','0','0','0','0','0','0','0','0','0','Syth Arcane Elemental (Normal) - Set Phase 1 on Target Missing Arcane Buffet Aura Stack (Phase 2)'),
('1920507','19205','28','3','100','5','38138','1','3000','3000','23','-1','0','0','0','0','0','0','0','0','0','0','Syth Arcane Elemental (Heroic) - Set Phase 1 on Target Missing Arcane Buffet Aura Stack (Phase 2)'),
('1920508','19205','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Syth Arcane Elemental - Set Phase to 0 on Evade'),
('1920601','19206','4','0','100','6','0','0','0','0','23','1','0','0','0','0','0','0','0','0','0','0','Syth Shadow Elemental - Set Phase 1 on Aggro'),
('1920602','19206','0','5','100','3','1600','7600','8400','18100','11','33529','1','0','0','0','0','0','0','0','0','0','Syth Shadow Elemental (Normal) - Cast Shadow Buffet (Phase 1)'),
('1920603','19206','0','5','100','5','1200','3600','6000','7200','11','38143','1','0','0','0','0','0','0','0','0','0','Syth Shadow Elemental (Heroic) - Cast Shadow Buffet (Phase 1)'),
('1920604','19206','24','5','100','3','33529','5','3000','3000','23','1','0','0','0','0','0','0','0','0','0','0','Syth Shadow Elemental (Normal) - Set Phase 2 on Target Max Shadow Buffet Aura Stack (Phase 1)'),
('1920605','19206','24','5','100','5','38143','5','3000','3000','23','1','0','0','0','0','0','0','0','0','0','0','Syth Shadow Elemental (Heroic) - Set Phase 2 on Target Max Shadow Buffet Aura Stack (Phase 1)'),
('1920606','19206','28','3','100','3','33529','1','3000','3000','23','-1','0','0','0','0','0','0','0','0','0','0','Syth Shadow Elemental (Normal) - Set Phase 1 on Target Missing Shadow Buffet Aura Stack (Phase 2)'),
('1920607','19206','28','3','100','5','38143','1','3000','3000','23','-1','0','0','0','0','0','0','0','0','0','0','Syth Shadow Elemental (Heroic) - Set Phase 1 on Target Missing Shadow Buffet Aura Stack (Phase 2)'),
('1920608','19206','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Syth Shadow Elemental - Set Phase to 0 on Evade'),
('1942801','19428','0','0','100','3','4800','14500','13300','22900','11','17503','1','0','0','0','0','0','0','0','0','0','Cobalt Serpent (Normal) - Cast Frostbolt'),
('1942802','19428','0','0','100','5','4800','14500','13300','22900','11','38238','1','0','0','0','0','0','0','0','0','0','Cobalt Serpent (Heroic) - Cast Frostbolt'),
('1942803','19428','0','0','100','3','5600','22100','8400','25400','11','38193','1','0','0','0','0','0','0','0','0','0','Cobalt Serpent (Normal) - Cast Lightning Breath'),
('1942804','19428','0','0','100','5','3600','22100','7200','14400','11','38133','1','0','0','0','0','0','0','0','0','0','Cobalt Serpent (Heroic) - Cast Lightning Breath'),
('1942805','19428','0','0','100','7','6200','21700','12100','22800','11','38110','0','0','0','0','0','0','0','0','0','0','Cobalt Serpent - Cast Wing Buffet'),
('1942901','19429','9','0','100','2','8','25','0','0','11','38059','1','1','0','0','0','0','0','0','0','0','Avian Darkhawk (Normal) - Cast Sonic Charge'),
('1942902','19429','9','0','100','4','8','25','0','0','11','39197','1','1','0','0','0','0','0','0','0','0','Avian Darkhawk (Heroic) - Cast Sonic Charge'),
('1942903','19429','0','0','100','3','4800','13600','10900','24100','11','32901','1','0','0','0','0','0','0','0','0','0','Avian Darkhawk (Normal) - Cast Carnivorous Bite'),
('1942904','19429','0','0','100','5','4800','13600','10900','24100','11','39198','1','0','0','0','0','0','0','0','0','0','Avian Darkhawk (Heroic) - Cast Carnivorous Bite'),
('2189101','21891','0','0','100','7','4300','12100','15600','19300','11','38056','1','32','0','0','0','0','0','0','0','0','Avian Ripper - Cast Flesh Rip'),
('2190401','21904','9','0','100','2','8','25','0','0','11','38059','1','1','0','0','0','0','0','0','0','0','Avian Warhawk (Normal) - Cast Sonic Charge'),
('2190402','21904','9','0','100','4','8','25','0','0','11','39197','1','1','0','0','0','0','0','0','0','0','Avian Warhawk (Heroic) - Cast Sonic Charge'),
('2190403','21904','0','0','100','3','3800','11100','10900','21700','11','32901','1','0','0','0','0','0','0','0','0','0','Avian Warhawk (Normal) - Cast Carnivorous Bite'),
('2190404','21904','0','0','100','5','3800','11100','10900','21700','11','39198','1','0','0','0','0','0','0','0','0','0','Avian Warhawk (Heroic) - Cast Carnivorous Bite'),
('2190405','21904','0','0','100','7','6200','25500','12100','24100','11','18144','0','1','0','0','0','0','0','0','0','0','Avian Warhawk - Cast Swoop'),
('2313401','23134','8','0','100','5','0','7','0','0','11','40237','0','0','0','0','0','0','0','0','0','0','Hawk Spirit (Heroic) - Cast Protection of the Hawk on SpellHit'),
('2313501','23135','8','0','100','5','0','7','0','0','11','40241','0','0','0','0','0','0','0','0','0','0','Falcon Spirit (Heroic) - Cast Speed of the Falcon on SpellHit'),
('2313601','23136','8','0','100','5','0','7','0','0','11','40240','0','0','0','0','0','0','0','0','0','0','Eagle Spirit (Heroic) - Cast Spite of the Eagle on SpellHit'),
('1863102','18631','13','0','100','7','5000','10000','0','0','11','15614','6','1','0','0','0','0','0','0','0','0','Cabal Cultist - Cast Kick on Target Spell Casting'),
('1863103','18631','2','0','100','6','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Cabal Cultist - Flee at 15% HP'),
('1863201','18632','4','0','10','38','0','0','0','0','1','-1249','-1250','-1251','1','-1252','-1253','-1254','1','-1250','-1252','-1254','Cabal Executioner - Random Say on Aggro'),
('1863202','18632','0','0','100','3','7200','15900','15700','32500','11','33500','0','0','0','0','0','0','0','0','0','0','Cabal Executioner (Normal) - Cast Whirlwind'),
('1863203','18632','0','0','100','5','7200','15900','15700','32500','11','15578','0','0','0','0','0','0','0','0','0','0','Cabal Executioner (Heroic) - Cast Whirlwind'),
('1863204','18632','12','0','100','7','20','0','8000','12000','11','7160','6','1','0','0','0','0','0','0','0','0','Cabal Executioner - Cast Execute when Target is at 20% HP'),
('1863205','18632','2','0','100','6','25','0','0','0','11','30485','0','0','0','0','0','0','0','0','0','0','Cabal Executioner - Cast Enrage at 25% HP'),
('1863301','18633','4','0','10','38','0','0','0','0','1','-1249','-1250','-1251','1','-1252','-1253','-1254','1','-1249','-1251','-1253','Cabal Acolyte - Random Say on Aggro'),
('1863302','18633','1','0','100','7','1000','1000','3600000','3600000','11','33482','0','1','0','0','0','0','0','0','0','0','Cabal Acolyte - Cast Shadow Defense on Spawn'),
('1863303','18633','14','0','100','3','6500','15','15700','27700','11','12039','6','0','0','0','0','0','0','0','0','0','Cabal Acolyte (Normal) - Cast Heal on Friendlies'),
('1863304','18633','14','0','100','5','10000','15','15700','27700','11','38209','6','0','0','0','0','0','0','0','0','0','Cabal Acolyte (Heroic) - Cast Heal on Friendlies'),
('1863305','18633','14','0','100','3','8100','15','13200','19300','11','25058','6','0','0','0','0','0','0','0','0','0','Cabal Acolyte (Normal) - Cast Renew on Friendlies'),
('1863306','18633','14','0','100','5','12500','15','13200','19300','11','38210','6','0','0','0','0','0','0','0','0','0','Cabal Acolyte (Heroic) - Cast Renew on Friendlies'),
('1863307','18633','2','0','100','6','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Cabal Acolyte - Flee at 15% HP'),
('1863401','18634','1','0','100','7','3000','8000','5000','7000','11','33335','1','0','0','0','0','0','0','0','0','0','Cabal Summoner - Cast Shadow Bolt OOC (Part of Visual Event)'),
('1863402','18634','4','0','10','38','0','0','0','0','1','-1249','-1250','-1251','1','-1252','-1253','-1254','1','-1251','-1253','-1254','Cabal Summoner - Random Say on Aggro'),
('1863403','18634','0','0','100','3','1800','6200','4800','16900','11','14034','1','0','0','0','0','0','0','0','0','0','Cabal Summoner (Normal) - Cast Fireball'),
('1863404','18634','0','0','100','5','1800','6200','4800','16900','11','15228','1','0','0','0','0','0','0','0','0','0','Cabal Summoner (Heroic) - Cast Fireball'),
('1863405','18634','0','0','100','7','3600','33200','12100','27900','11','33507','0','1','1','-1246','0','0','0','0','0','0','Cabal Summoner - Summon Cabal Acolyte and Emote'),
('1863406','18634','0','0','100','7','4300','17200','13300','25300','11','33506','0','1','1','-1245','0','0','0','0','0','0','Cabal Summoner - Summon Cabal Deathsworn and Emote'),
('1863501','18635','4','0','10','38','0','0','0','0','1','-1249','-1250','-1251','1','-1252','-1253','-1254','1','-1250','-1252','-1254','Cabal Deathsworn - Random Say on Aggro'),
('1863502','18635','0','0','100','3','10200','18100','14100','26200','11','33480','1','0','0','0','0','0','0','0','0','0','Cabal Deathsworn (Normal) - Cast Black Cleave'),
('1863503','18635','0','0','100','5','10200','18100','14100','26200','11','38226','1','0','0','0','0','0','0','0','0','0','Cabal Deathsworn (Heroic) - Cast Black Cleave'),
('1863504','18635','0','0','100','7','10900','28200','12100','22900','11','11428','1','0','0','0','0','0','0','0','0','0','Cabal Deathsworn - Cast Knockdown'),
('1863505','18635','2','0','100','6','25','0','0','0','11','8599','0','0','0','0','0','0','0','0','0','0','Cabal Deathsworn - Cast Enrage at 25% HP'),
('1863701','18637','11','0','100','6','0','0','0','0','11','16592','0','1','0','0','0','0','0','0','0','0','Cabal Shadow Priest - Cast Shadowform on Spawn'),
('1863702','18637','4','0','10','38','0','0','0','0','1','-1249','-1250','-1251','1','-1252','-1253','-1254','1','-1250','-1252','-1254','Cabal Shadow Priest - Random Say on Aggro'),
('1863703','18637','0','0','100','3','3200','10800','4800','9700','11','17165','1','0','0','0','0','0','0','0','0','0','Cabal Shadow Priest (Normal) - Cast Mind Flay'),
('1863704','18637','0','0','100','5','3200','10800','2400','4800','11','38243','1','0','0','0','0','0','0','0','0','0','Cabal Shadow Priest (Heroic) - Cast Mind Flay'),
('1863705','18637','0','0','100','3','3600','12100','5400','12900','11','14032','4','0','0','0','0','0','0','0','0','0','Cabal Shadow Priest (Normal) - Cast Shadow Word: Pain'),
('1863706','18637','0','0','100','5','3100','12100','4800','7200','11','17146','4','0','0','0','0','0','0','0','0','0','Cabal Shadow Priest (Heroic) - Cast Shadow Word: Pain'),
('1863802','18638','4','0','10','38','0','0','0','0','1','-1249','-1250','-1251','1','-1252','-1253','-1254','1','-1250','-1251','-1252','Cabal Zealot - Random Say on Aggro'),
('1863803','18638','4','0','100','2','0','0','0','0','11','12471','1','0','23','1','0','0','0','0','0','0','Cabal Zealot (Normal) - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('1863804','18638','9','13','100','3','0','40','3600','4800','11','12471','1','0','0','0','0','0','0','0','0','0','Cabal Zealot (Normal) - Cast Shadow Bolt (Phase 1)'),
('1863805','18638','4','0','100','4','0','0','0','0','11','15472','1','0','23','1','0','0','0','0','0','0','Cabal Zealot (Heroic) - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('1863806','18638','9','13','100','5','0','40','3600','4800','11','15472','1','0','0','0','0','0','0','0','0','0','Cabal Zealot (Heroic) - Cast Shadow Bolt (Phase 1)'),
('1863807','18638','3','13','100','6','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Cabal Zealot - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 1)'),
('1863808','18638','9','13','100','6','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Cabal Zealot - Start Combat Movement at 35 Yards (Phase 1)'),
('1863809','18638','9','13','100','6','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Cabal Zealot - Prevent Combat Movement at 15 Yards (Phase 1)'),
('1863810','18638','9','13','100','6','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Cabal Zealot - Start Combat Movement Below 5 Yards'),
('1863811','18638','3','11','100','7','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Cabal Zealot - Set Phase 1 when Mana is above 30% (Phase 2)'),
('1863812','18638','2','0','100','6','50','0','0','0','11','33499','0','1','22','3','0','0','0','0','0','0','Cabal Zealot - Cast Shape of the Beast and Set Phase 3 at 50% HP'),
('1863813','18638','7','0','100','6','0','0','0','0','28','0','33499','0','22','0','0','0','0','0','0','0','Cabal Zealot - Remove Shape of the Beast Aura and Set Phase to 0 on Evade'),
('1863901','18639','1','0','100','7','4000','4000','8000','8000','11','33335','1','0','0','0','0','0','0','0','0','0','Cabal Spellbinder - Cast Shadow Bolt OOC (Part of Visual Event)'),
('1863902','18639','1','0','100','7','10000','10000','8000','8000','5','5','0','0','0','0','0','0','0','0','0','0','Cabal Spellbinder - Emote OOC (Part of Visual Event)'),
('1863903','18639','4','0','10','38','0','0','0','0','1','-1249','-1250','-1251','1','-1252','-1253','-1254','1','-1249','-1252','-1253','Cabal Spellbinder - Random Say on Aggro'),
('1863904','18639','0','0','100','7','5700','19300','9600','16900','11','32691','1','0','0','0','0','0','0','0','0','0','Cabal Spellbinder - Cast Spell Shock'),
('1863905','18639','0','0','100','7','8000','12000','20000','30000','11','33502','5','1','0','0','0','0','0','0','0','0','Cabal Spellbinder - Cast Brain Wash'),
('1864003','18640','4','0','10','38','0','0','0','0','1','-1249','-1250','-1251','1','-1252','-1253','-1254','1','-1251','-1253','-1254','Cabal Warlock - Random Say on Aggro'),
('1864004','18640','4','0','100','2','0','0','0','0','11','12471','1','0','23','1','0','0','0','0','0','0','Cabal Warlock (Normal) - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('1864005','18640','9','5','100','3','0','40','3600','4800','11','12471','1','0','0','0','0','0','0','0','0','0','Cabal Warlock (Normal) - Cast Shadow Bolt (Phase 1)'),
('1864006','18640','4','0','100','4','0','0','0','0','11','15232','1','0','23','1','0','0','0','0','0','0','Cabal Warlock (Heroic) - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('1864007','18640','9','5','100','5','0','40','3600','4800','11','15232','1','0','0','0','0','0','0','0','0','0','Cabal Warlock (Heroic) - Cast Shadow Bolt (Phase 1)'),
('1864008','18640','3','5','100','6','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Cabal Warlock - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 1)'),
('1864009','18640','9','5','100','6','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Cabal Warlock - Start Combat Movement at 35 Yards (Phase 1)'),
('1864010','18640','9','5','100','6','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Cabal Warlock - Prevent Combat Movement at 15 Yards (Phase 1)'),
('1864011','18640','9','5','100','6','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Cabal Warlock - Start Combat Movement Below 5 Yards'),
('1864012','18640','3','3','100','7','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Cabal Warlock - Set Phase 1 when Mana is above 30% (Phase 2)'),
('1864013','18640','0','0','100','3','7800','24100','19300','36200','11','32863','4','32','0','0','0','0','0','0','0','0','Cabal Warlock (Normal) - Cast Seed of Corruption'),
('1864014','18640','0','0','100','5','7800','24100','19300','36200','11','38252','4','32','0','0','0','0','0','0','0','0','Cabal Warlock (Heroic) - Cast Seed of Corruption'),
('1864015','18640','27','0','100','7','13787','1','15000','30000','11','13787','0','1','0','0','0','0','0','0','0','0','Cabal Warlock - Cast Demon Armor on Missing Buff'),
('1864016','18640','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Cabal Warlock - Set Phase to 0 on Evade'),
('1864103','18641','9','5','100','3','0','30','2400','3600','11','20801','1','0','0','0','0','0','0','0','0','0','Cabal Familiar (Normal) - Cast Firebolt (Phase 1)'),
('1864105','18641','9','5','100','5','0','30','2400','3600','11','38239','1','0','0','0','0','0','0','0','0','0','Cabal Familiar (Heroic) - Cast Firebolt (Phase 1)'),
('1864201','18642','0','0','100','7','4800','14500','12100','18100','11','30849','1','0','0','0','0','0','0','0','0','0','Fel Guardhound - Cast Spell Lock'),
('1866301','18663','0','0','100','7','9100','9100','8000','12000','11','32202','1','0','0','0','0','0','0','0','0','0','Maiden of Discipline - Cast Lash of Pain'),
('1879401','18794','11','0','100','6','0','0','0','0','21','0','0','0','11','32958','0','0','30','1','3','5','Cabal Ritualist - Prevent Combat Movement and Cast Crystal Channel and Random Phase Select on Spawn'),
('1879402','18794','4','0','10','38','0','0','0','0','1','-1249','-1250','-1251','1','-1252','-1253','-1254','1','-1249','-1251','-1253','Cabal Ritualist - Random Say on Aggro'),
('1879403','18794','4','61','100','2','0','0','0','0','11','15497','1','0','0','0','0','0','0','0','0','0','Cabal Ritualist (Normal) - Cast Frostbolt on Aggro (Phase 1)'),
('1879404','18794','9','61','100','3','0','40','3600','4800','11','15497','1','0','0','0','0','0','0','0','0','0','Cabal Ritualist (Normal) - Cast Frostbolt (Phase 1)'),
('1879405','18794','4','61','100','4','0','0','0','0','11','12675','1','0','23','1','0','0','0','0','0','0','Cabal Ritualist (Heroic) - Cast Frostbolt on Aggro (Phase 1)'),
('1879406','18794','9','61','100','5','0','40','3600','4800','11','12675','1','0','0','0','0','0','0','0','0','0','Cabal Ritualist (Heroic) - Cast Frostbolt (Phase 1)'),
('1879407','18794','3','61','100','6','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Cabal Ritualist - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 1)'),
('1879408','18794','9','61','100','6','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Cabal Ritualist - Start Combat Movement at 35 Yards (Phase 1)'),
('1879409','18794','9','61','100','6','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Cabal Ritualist - Prevent Combat Movement at 15 Yards (Phase 1)'),
('1879410','18794','9','61','100','6','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Cabal Ritualist - Start Combat Movement Below 5 Yards (Phase 1)'),
('1879411','18794','9','61','100','3','0','8','12100','16900','11','15532','0','1','0','0','0','0','0','0','0','0','Cabal Ritualist (Normal) - Cast Frost Nova'),
('1879412','18794','9','61','100','5','0','8','12100','16900','11','15063','0','1','0','0','0','0','0','0','0','0','Cabal Ritualist (Heroic) - Cast Frost Nova'),
('1879422','18794','0','55','100','7','2400','14300','5200','21700','11','33487','4','1','0','0','0','0','0','0','0','0','Cabal Ritualist - Cast Addle Humanoid (Phase 3)'),
('1879423','18794','3','47','100','7','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Cabal Ritualist - Set Phase 3 when Mana is above 30% (Phase 4)'),
('1879424','18794','4','31','100','6','0','0','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Cabal Ritualist - Start Combat Movement on Aggro (Phase 5)'),
('1879425','18794','0','31','100','7','3600','6200','4800','11200','11','9574','1','0','0','0','0','0','0','0','0','0','Cabal Ritualist - Cast Flame Buffet (Phase 5)'),
('1879426','18794','0','31','100','3','6100','20200','8400','22900','11','20795','1','0','0','0','0','0','0','0','0','0','Cabal Ritualist (Normal) - Cast Fire Blast (Phase 5)'),
('1879427','18794','0','31','100','5','6100','20200','8400','22900','11','14145','1','0','0','0','0','0','0','0','0','0','Cabal Ritualist (Heroic) - Cast Fire Blast (Phase 5)'),
('1879428','18794','9','31','100','7','0','5','12100','19300','11','12540','5','0','0','0','0','0','0','0','0','0','Cabal Ritualist - Cast Gouge (Phase 5)'),
('1879429','18794','2','0','100','6','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Cabal Ritualist - Flee at 15% HP'),
('1879431','18794','21','0','100','6','0','0','0','0','11','32958','0','1','0','0','0','0','0','0','0','0','Cabal Ritualist - Cast Crystal Channel on Reaching Home'),
('1879601','18796','4','0','10','6','0','0','0','0','1','-1255','-1256','0','0','0','0','0','1','0','0','0','Fel Overseer - Random Say on Aggro'),
('1879602','18796','4','0','100','6','0','0','0','0','11','27577','1','0','0','0','0','0','0','0','0','0','Fel Overseer - Cast Intercept on Aggro'),
('1879603','18796','0','0','100','7','13300','18900','15700','26500','11','30471','1','0','0','0','0','0','0','0','0','0','Fel Overseer - Cast Uppercut'),
('1879604','18796','0','0','100','5','4800','9300','15700','20300','11','16856','1','0','0','0','0','0','0','0','0','0','Fel Overseer (Heroic) - Cast Mortal Strike'),
('1879605','18796','2','0','100','5','30','0','30000','30000','11','19134','0','1','0','0','0','0','0','0','0','0','Fel Overseer (Heroic) - Cast Frightening Shout at 30% HP'),
('1879606','18796','6','0','100','6','0','0','0','0','34','2','3','0','0','0','0','0','0','0','0','0','Fel Overseer - Set Instance Data on Death'),
('1883001','18830','4','0','10','38','0','0','0','0','1','-1249','-1250','-1251','1','-1252','-1253','-1254','1','-1252','-1253','-1254','Cabal Fanatic - Random Say on Aggro'),
('1883002','18830','0','0','100','7','9600','20500','13300','22900','11','12021','1','0','0','0','0','0','0','0','0','0','Cabal Fanatic - Cast Fixate');
REPLACE INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
('1884801','18848','4','0','10','6','0','0','0','0','1','-1257','0','0','0','0','0','0','1','0','0','0','Malicious Instructor - Say on Aggro'),
('1884802','18848','0','0','100','7','10800','15700','18100','29100','11','33493','1','32','0','0','0','0','0','0','0','0','Malicious Instructor - Cast Mark of Malice'),
('1884803','18848','0','0','100','7','9600','16900','7200','18100','11','33501','0','0','0','0','0','0','0','0','0','0','Malicious Instructor - Cast Shadow Nova'),
('1884804','18848','0','0','100','5','16100','25300','21700','25300','11','6713','1','0','0','0','0','0','0','0','0','0','Malicious Instructor (Heroic) - Cast Disarm'),
('1920801','19208','11','0','100','6','0','0','0','0','1','-1248','0','0','0','0','0','0','0','0','0','0','Summoned Cabal Acolyte - Emote on Spawn'),
('1920802','19208','1','0','100','7','1000','1000','3600000','3600000','11','33482','0','1','0','0','0','0','0','0','0','0','Summoned Cabal Acolyte - Cast Shadow Defense on Spawn'),
('1920803','19208','14','0','100','3','6500','15','15700','27700','11','12039','6','0','0','0','0','0','0','0','0','0','Summoned Cabal Acolyte (Normal) - Cast Heal on Friendlies'),
('1920804','19208','14','0','100','5','10000','15','15700','27700','11','38209','6','0','0','0','0','0','0','0','0','0','Summoned Cabal Acolyte (Heroic) - Cast Heal on Friendlies'),
('1920805','19208','14','0','100','3','8100','15','13200','19300','11','25058','6','0','0','0','0','0','0','0','0','0','Summoned Cabal Acolyte (Normal) - Cast Renew on Friendlies'),
('1920806','19208','14','0','100','5','12500','15','13200','19300','11','38210','6','0','0','0','0','0','0','0','0','0','Summoned Cabal Acolyte (Heroic) - Cast Renew on Friendlies'),
('1920807','19208','2','0','100','6','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Summoned Cabal Acolyte - Flee at 15% HP'),
('1920808','19208','7','0','100','6','0','0','0','0','41','0','0','0','18','33554432','0','0','0','0','0','0','Summoned Cabal Acolyte - Despawn on Evade'),
('1920901','19209','11','0','100','6','0','0','0','0','1','-1247','0','0','0','0','0','0','0','0','0','0','Summoned Cabal Deathsworn - Emote on Spawn'),
('1920902','19209','0','0','100','3','10200','18100','14100','26200','11','33480','1','0','0','0','0','0','0','0','0','0','Summoned Cabal Deathsworn (Normal) - Cast Black Cleave'),
('1920903','19209','0','0','100','5','10200','18100','14100','26200','11','38226','1','0','0','0','0','0','0','0','0','0','Summoned Cabal Deathsworn (Heroic) - Cast Black Cleave'),
('1920904','19209','0','0','100','7','10900','28200','12100','22900','11','11428','1','0','0','0','0','0','0','0','0','0','Summoned Cabal Deathsworn - Cast Knockdown'),
('1920905','19209','2','0','100','6','25','0','0','0','11','8599','0','0','0','0','0','0','0','0','0','0','Summoned Cabal Deathsworn - Cast Enrage at 25% HP'),
('1920906','19209','7','0','100','6','0','0','0','0','41','0','0','0','18','33554432','0','0','0','0','0','0','Summoned Cabal Deathsworn - Despawn on Evade'),
('235001','2350','0','0','100','7','7800','15700','48300','66300','11','3396','1','32','0','0','0','0','0','0','0','0','Forest Moss Creeper - Cast Corrosive Poison'),
('1781401','17814','9','0','100','7','0','5','6200','14100','11','11976','1','0','0','0','0','0','0','0','0','0','Lordaeron Watchman - Cast Strike'),
('1781402','17814','0','0','100','7','10800','22900','15700','25300','11','12169','0','1','0','0','0','0','0','0','0','0','Lordaeron Watchman - Cast Shield Block'),
('1781404','17814','6','0','10','6','0','0','0','0','1','-1285','0','0','0','0','0','0','0','0','0','0','Lordaeron Watchman - Random Say on Death'),
('1781502','17815','9','5','100','3','5','30','2400','2400','11','15620','1','0','40','2','0','0','0','0','0','0','Lordaeron Sentry (Normal) - Cast Shoot and Set Ranged Weapon Model (Phase 1)'),
('1781503','17815','9','5','100','5','5','30','2400','2400','11','16100','1','0','40','2','0','0','0','0','0','0','Lordaeron Sentry (Heroic) - Cast Shoot and Set Ranged Weapon Model (Phase 1)'),
('1781901','17819','1','0','10','7','30000','180000','180000','360000','1','-1272','-1273','-1274','0','0','0','0','0','0','0','0','Durnholde Sentry - Random Say OOC'),
('1781902','17819','0','0','100','7','8400','14100','10100','20500','11','9080','1','0','0','0','0','0','0','0','0','0','Durnholde Sentry - Cast Hamstring'),
('1781903','17819','0','0','100','7','4600','14200','13200','24300','11','15496','1','0','0','0','0','0','0','0','0','0','Durnholde Sentry - Cast Cleave'),
('1781904','17819','0','0','100','7','6200','9700','26600','45900','11','14895','1','0','0','0','0','0','0','0','0','0','Durnholde Sentry - Cast Overpower'),
('1781905','17819','2','0','100','6','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Durnholde Sentry - Flee at 15% HP'),
('1781906','17819','6','0','10','38','0','0','0','0','1','-1279','-1280','-1281','1','-1280','-1281','-1282','1','-1279','-1281','-1282','Durnholde Sentry - Random Say on Death'),
('1782002','17820','1','0','10','7','30000','180000','180000','360000','1','-1272','-1273','-1274','0','0','0','0','0','0','0','0','Durnholde Rifleman - Random Say OOC'),
('1782003','17820','4','0','10','38','0','0','0','0','1','-1275','-1276','-1277','1','-1276','-1277','-1278','1','-1275','-1276','-1278','Durnholde Rifleman - Random Say on Aggro'),
('1782004','17820','9','5','100','3','5','30','2400','3600','11','16100','1','0','40','2','0','0','0','0','0','0','Durnholde Rifleman (Normal) - Cast Shoot and Set Ranged Weapon Model (Phase 1)'),
('1782005','17820','9','5','100','5','5','30','2400','3600','11','22907','1','0','40','2','0','0','0','0','0','0','Durnholde Rifleman (Heroic) - Cast Shoot and Set Ranged Weapon Model (Phase 1)'),
('1782006','17820','9','5','100','6','30','80','0','0','21','1','1','0','20','1','0','0','0','0','0','0','Durnholde Rifleman - Start Combat Movement and Start Melee at 30 Yards (Phase 1)'),
('1782007','17820','9','5','100','6','0','10','0','0','21','1','0','0','40','1','0','0','20','1','0','0','Durnholde Rifleman - Start Combat Movement and Set Melee Weapon Model and Start Melee Below 10 Yards (Phase 1)'),
('1782008','17820','9','5','100','6','11','25','0','0','21','0','1','0','20','0','0','0','0','0','0','0','Durnholde Rifleman - Prevent Combat Movement and Prevent Melee at 25 Yards (Phase 1)'),
('1782009','17820','0','5','100','3','12500','20200','12100','22900','11','31942','1','1','40','2','0','0','0','0','0','0','Durnholde Rifleman (Normal) - Cast Multi-Shot and Set Ranged Weapon Model (Phase 1)'),
('1782010','17820','0','5','100','5','12500','20200','12100','22900','11','38383','1','1','40','2','0','0','0','0','0','0','Durnholde Rifleman (Heroic) - Cast Multi-Shot and Set Ranged Weapon Model (Phase 1)'),
('1782011','17820','0','0','100','7','10900','26500','22900','36200','11','23601','4','1','40','2','0','0','0','0','0','0','Durnholde Rifleman - Cast Scatter Shot and Set Ranged Weapon Model'),
('1782012','17820','2','0','100','6','15','0','0','0','23','1','0','0','0','0','0','0','0','0','0','0','Durnholde Rifleman - Set Phase 2 at 15% HP'),
('1782013','17820','2','3','100','6','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Durnholde Rifleman - Start Combat Movement and Flee at 15% HP (Phase 2)'),
('1782014','17820','7','0','100','6','0','0','0','0','22','1','0','0','40','1','0','0','0','0','0','0','Durnholde Rifleman - Set Phase 1 and Set Melee Weapon Model on Evade'),
('1782015','17820','6','0','10','38','0','0','0','0','1','-1279','-1280','-1281','1','-1280','-1281','-1282','1','-1279','-1280','-1282','Durnholde Rifleman - Random Say on Death'),
('1783301','17833','1','0','10','7','30000','180000','180000','360000','1','-1272','-1273','-1274','0','0','0','0','0','0','0','0','Durnholde Warden - Random Say OOC'),
('1783302','17833','4','0','10','38','0','0','0','0','1','-1275','-1276','-1277','1','-1276','-1277','-1278','1','-1275','-1277','-1278','Durnholde Warden - Random Say on Aggro'),
('1783303','17833','0','0','100','3','3800','8400','10800','24100','11','15654','1','32','0','0','0','0','0','0','0','0','Durnholde Warden (Normal) - Cast Shadow Word: Pain'),
('1783304','17833','0','0','100','5','3800','8400','10800','15700','11','34941','1','32','0','0','0','0','0','0','0','0','Durnholde Warden (Heroic) - Cast Shadow Word: Pain'),
('1783305','17833','0','0','100','7','18800','33800','30100','48300','11','22884','0','1','0','0','0','0','0','0','0','0','Durnholde Warden - Cast Psychic Scream'),
('1783306','17833','0','0','100','7','7000','12000','10000','16000','11','17201','0','1','0','0','0','0','0','0','0','0','Durnholde Warden - Cast Dispel Magic'),
('1783307','17833','14','0','100','3','7500','15','12100','18200','11','15586','6','1','0','0','0','0','0','0','0','0','Durnholde Warden (Normal) - Cast Heal on Friendlies'),
('1783308','17833','14','0','100','5','11200','15','12100','12100','11','22883','6','1','0','0','0','0','0','0','0','0','Durnholde Warden (Heroic) - Cast Heal on Friendlies'),
('1783309','17833','2','0','100','6','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Durnholde Warden - Flee at 15% HP'),
('1783310','17833','6','0','10','38','0','0','0','0','1','-1279','-1280','-1281','1','-1280','-1281','-1282','1','-1279','-1281','-1282','Durnholde Warden - Random Say on Death'),
('1784001','17840','2','0','100','6','50','0','0','0','11','8269','0','0','1','-106','0','0','0','0','0','0','Durnholde Tracking Hound - Cast Frenzy at 50% HP'),
('1784801','17848','11','0','100','7','0','0','0','0','1','-1254','0','0','0','0','0','0','0','0','0','0','Lieutenant Drake - Yell on Spawn'),
('1784802','17848','4','0','100','6','0','0','0','0','1','-1255','0','0','0','0','0','0','0','0','0','0','Lieutenant Drake - Yell on Aggro'),
('1784803','17848','0','0','100','7','6100','6100','7200','22900','11','9080','1','0','0','0','0','0','0','0','0','0','Lieutenant Drake - Cast Hamstring'),
('1784804','17848','0','0','100','7','8400','10900','16900','27800','11','31911','1','1','1','-1258','0','0','0','0','0','0','Lieutenant Drake - Cast Mortal Strike and Yell'),
('1784805','17848','0','0','100','7','13300','14500','18100','22900','11','31909','0','1','0','0','0','0','0','0','0','0','Lieutenant Drake - Cast Whirlwind'),
('1784806','17848','0','0','100','7','20500','24100','12100','26600','11','33792','4','0','0','0','0','0','0','0','0','0','Lieutenant Drake - Cast Exploding Shot'),
('1784807','17848','0','0','100','7','25000','30000','25000','35000','11','33789','5','1','1','-1259','0','0','0','0','0','0','Lieutenant Drake - Cast Frightening Shout and Yell'),
('1784808','17848','5','0','100','7','0','0','0','0','1','-1256','-1257','0','0','0','0','0','0','0','0','0','Lieutenant Drake - Yell on Player Kill'),
('1784809','17848','6','0','100','6','0','0','0','0','1','-1260','0','0','0','0','0','0','0','0','0','0','Lieutenant Drake - Yell on Death'),
('1786001','17860','4','0','10','38','0','0','0','0','1','-1275','-1276','-1277','1','-1276','-1277','-1278','1','-1275','-1277','-1278','Durnholde Veteran - Random Say on Aggro'),
('1786002','17860','0','0','100','7','4800','10900','3600','10900','11','15581','1','0','0','0','0','0','0','0','0','0','Durnholde Veteran - Cast Sinister Strike'),
('1786003','17860','9','0','100','7','0','5','6100','12200','11','15582','1','0','0','0','0','0','0','0','0','0','Durnholde Veteran - Cast Backstab'),
('1786004','17860','2','0','100','6','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Durnholde Veteran - Flee at 15% HP'),
('1786005','17860','6','0','10','38','0','0','0','0','1','-1279','-1280','-1281','1','-1280','-1281','-1282','1','-1279','-1281','-1282','Durnholde Veteran - Random Say on Death'),
('1786201','17862','4','0','100','6','0','0','0','0','11','8258','0','0','0','0','0','0','0','0','0','0','Captain Skarloc - Cast Devotion Aura on Aggro'),
('1786202','17862','0','0','100','7','1100','3200','10800','15200','11','13005','1','0','0','0','0','0','0','0','0','0','Captain Skarloc - Cast Hammer of Justice'),
('1786203','17862','9','0','100','5','0','5','13300','13300','11','38385','0','0','0','0','0','0','0','0','0','0','Captain Skarloc (Heroic) - Cast Consecration'),
('1786204','17862','0','0','100','7','2200','4300','13300','21700','11','31904','0','0','0','0','0','0','0','0','0','0','Captain Skarloc - Cast Holy Shield'),
('1786205','17862','0','0','100','7','10000','14000','10000','14000','11','29380','0','0','0','0','0','0','0','0','0','0','Captain Skarloc - Cast Cleanse'),
('1786206','17862','2','0','100','7','50','0','13300','15700','11','29427','0','1','0','0','0','0','0','0','0','0','Captain Skarloc - Cast Holy Light at 50% HP'),
('1786207','17862','16','0','100','7','8258','5','10000','10000','11','8258','0','1','0','0','0','0','0','0','0','0','Captain Skarloc - Cast Devotion Aura on Missing Devotion Aura'),
('1786208','17862','5','0','100','7','0','0','0','0','1','-1251','-1252','0','0','0','0','0','0','0','0','0','Captain Skarloc - Yell on Player Kill'),
('1786209','17862','0','0','100','7','25000','30000','25000','30000','1','-1249','-1250','0','0','0','0','0','0','0','0','0','Captain Skarloc - Yell on Timer'),
('1786210','17862','6','0','100','6','0','0','0','0','1','-1253','0','0','0','0','0','0','0','0','0','0','Captain Skarloc - Yell on Death'),
('1809201','18092','4','0','10','6','0','0','0','0','1','-1283','-1284','0','0','0','0','0','0','0','0','0','Tarren Mill Guardsman - Random Say on Aggro'),
-- ('1809202','18092','4','0','100','6','0','0','0','0','11','15749','1','0','0','0','0','0','0','0','0','0','Tarren Mill Guardsman - Cast Shield Charge'),
-- ('1809203','18092','0','0','100','7','5000','7000','9000','13000','11','16856','1','0','0','0','0','0','0','0','0','0','Tarren Mill Guardsman - Cast Mortal Strike'),
('1809204','18092','6','0','10','6','0','0','0','0','1','-1285','-1286','-1287','0','0','0','0','0','0','0','0','Tarren Mill Guardsman - Random Say on Death'),
('1809301','18093','0','0','100','7','3200','9100','12100','18100','11','32588','1','32','0','0','0','0','0','0','0','0','Tarren Mill Protector - Cast Concussion Blow'),
('1809302','18093','14','0','100','7','7600','15','9600','15700','11','17843','6','1','0','0','0','0','0','0','0','0','Tarren Mill Protector (Normal) - Cast Flash Heal on Friendlies'),
('1809303','18093','14','0','100','7','11600','15','9600','9600','11','17138','6','1','0','0','0','0','0','0','0','0','Tarren Mill Protector (Heroic) - Cast Flash Heal on Friendlies'),
-- ('1809304','18093','0','0','100','7','5000','7000','9000','13000','11','15496','1','0','0','0','0','0','0','0','0','0','Tarren Mill Protector - Cast Cleave'),
-- ('1809305','18093','0','0','100','7','11000','20000','17000','22000','11','17234','1','0','0','0','0','0','0','0','0','0','Tarren Mill Protector - Cast Shadow Shock'),
-- ('1809306','18093','0','0','100','7','3000','9000','15000','20000','11','29380','0','1','0','0','0','0','0','0','0','0','Tarren Mill Protector - Cast Cleanse'),
-- ('1809307','18093','2','0','100','7','50','0','45000','70000','11','31976','0','1','0','0','0','0','0','0','0','0','Tarren Mill Protector - Cast Shadow Shield at 50% HP'),
('1809401','18094','1','0','100','6','0','0','0','0','21','0','0','0','20','0','0','0','23','1','0','0','Tarren Mill Lookout - Prevent Combat Movement and Prevent Melee and Set Phase 1 on Spawn'),
('1809402','18094','4','0','10','6','0','0','0','0','1','-1283','-1284','0','0','0','0','0','0','0','0','0','Tarren Mill Lookout - Random Say on Aggro'),
('1809403','18094','9','5','100','3','5','30','2300','5000','11','15620','1','0','40','2','0','0','0','0','0','0','Tarren Mill Lookout (Normal) - Cast Shoot and Set Ranged Weapon Model (Phase 1)'),
('1809404','18094','9','5','100','5','5','30','2300','5000','11','16100','1','0','40','2','0','0','0','0','0','0','Tarren Mill Lookout (Heroic) - Cast Shoot and Set Ranged Weapon Model (Phase 1)'),
('1809405','18094','9','5','100','6','30','80','0','0','21','1','1','0','20','1','0','0','0','0','0','0','Tarren Mill Lookout - Start Combat Movement and Start Melee at 30 Yards (Phase 1)'),
('1809406','18094','9','5','100','6','0','10','0','0','21','1','0','0','40','1','0','0','20','1','0','0','Tarren Mill Lookout - Start Combat Movement and Set Melee Weapon Model and Start Melee Below 10 Yards (Phase 1)'),
('1809407','18094','9','5','100','6','11','25','0','0','21','0','1','0','20','0','0','0','0','0','0','0','Tarren Mill Lookout - Prevent Combat Movement and Prevent Melee at 25 Yards (Phase 1)'),
-- ('1809408','18094','0','5','100','7','14000','19000','14000','19000','11','17174','4','1','40','2','0','0','0','0','0','0','Tarren Mill Lookout - Cast Concussive Shot and Set Ranged Weapon Model (Phase 1)'),
('1809409','18094','0','5','100','7','8400','20800','7200','21700','11','35511','1','1','40','2','0','0','0','0','0','0','Tarren Mill Lookout - Cast Serpent Sting and Set Ranged Weapon Model (Phase 1)'),
('1809410','18094','2','0','100','6','15','0','0','0','23','1','0','0','0','0','0','0','0','0','0','0','Tarren Mill Lookout - Set Phase 2 at 15% HP'),
('1809411','18094','2','3','100','6','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Tarren Mill Lookout - Start Combat Movement and Flee at 15% HP (Phase 2)'),
('1809412','18094','7','0','100','6','0','0','0','0','22','1','0','0','40','1','0','0','0','0','0','0','Tarren Mill Lookout - Set Phase 1 and Set Melee Weapon Model on Evade'),
('1809413','18094','6','0','10','6','0','0','0','0','1','-1285','-1286','-1287','0','0','0','0','0','0','0','0','Tarren Mill Lookout - Random Say on Death'),
('1809601','18096','4','0','100','6','0','0','0','0','1','-1261','-1262','0','0','0','0','0','0','0','0','0','Epoch Hunter - Yell on Aggro'),
('1809602','18096','0','0','100','7','6400','10300','18100','26600','11','31914','0','0','1','-1265','-1266','0','0','0','0','0','Epoch Hunter - Cast Sand Breath and Yell'),
('1809603','18096','0','0','100','7','25000','30000','25000','30000','11','31916','5','0','0','0','0','0','0','0','0','0','Epoch Hunter - Cast Impending Death'),
('1809604','18096','0','0','100','7','12400','20300','20500','26600','11','31475','0','0','0','0','0','0','0','0','0','0','Epoch Hunter - Cast Wing Buffet'),
('1809605','18096','0','0','100','7','1100','8800','15700','25300','11','33834','0','0','0','0','0','0','0','0','0','0','Epoch Hunter - Cast Magic Disruption Aura'),
('1809606','18096','5','0','100','7','0','0','0','0','1','-1263','-1264','0','0','0','0','0','0','0','0','0','Epoch Hunter - Yell on Player Kill'),
('1809607','18096','6','0','100','6','0','0','0','0','1','-1267','0','0','0','0','0','0','0','0','0','0','Epoch Hunter - Yell on Death'),
('1817001','18170','4','0','10','6','0','0','0','0','1','-1288','-1289','0','0','0','0','0','0','0','0','0','Infinite Slayer - Random Say on Aggro'),
('1817002','18170','9','0','100','7','0','5','11700','18100','11','16856','1','0','0','0','0','0','0','0','0','0','Infinite Slayer - Cast Mortal Strike'),
('1817003','18170','6','0','10','6','0','0','0','0','1','-1290','-1291','0','0','0','0','0','0','0','0','0','Infinite Slayer - Random Say on Death'),
('1817102','18171','4','0','10','6','0','0','0','0','1','-1288','-1289','0','0','0','0','0','0','0','0','0','Infinite Defiler - Random Say on Aggro'),
('1817103','18171','4','0','100','2','0','0','0','0','11','15232','1','0','23','1','0','0','0','0','0','0','Infinite Defiler (Normal) - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('1817104','18171','9','5','100','3','0','40','3600','4800','11','15232','1','0','0','0','0','0','0','0','0','0','Infinite Defiler (Normal) - Cast Shadow Bolt (Phase 1)'),
('1817105','18171','4','0','100','4','0','0','0','0','11','38386','1','0','23','1','0','0','0','0','0','0','Infinite Defiler (Heroic) - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('1817106','18171','9','5','100','5','0','40','3600','4800','11','38386','1','0','0','0','0','0','0','0','0','0','Infinite Defiler (Heroic) - Cast Shadow Bolt (Phase 1)'),
('1817107','18171','3','5','100','6','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Infinite Defiler - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 1)'),
('1817108','18171','9','5','100','6','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Infinite Defiler - Start Combat Movement at 35 Yards (Phase 1)'),
('1817109','18171','9','5','100','6','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Infinite Defiler - Prevent Combat Movement at 15 Yards (Phase 1)'),
('1817110','18171','9','5','100','6','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Infinite Defiler - Start Combat Movement Below 5 Yards'),
('1817111','18171','3','3','100','7','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Infinite Defiler - Set Phase 1 when Mana is above 30% (Phase 2)'),
('1817112','18171','0','0','100','7','4400','5800','12100','15700','11','21068','4','33','0','0','0','0','0','0','0','0','Infinite Defiler - Cast Corruption'),
('1817113','18171','0','0','100','3','3400','8100','19300','22900','11','31977','4','0','0','0','0','0','0','0','0','0','Infinite Defiler (Normal) - Cast Curse of Infinity'),
('1817114','18171','0','0','100','5','3400','8100','19300','22900','11','38387','4','0','0','0','0','0','0','0','0','0','Infinite Defiler (Heroic) - Cast Bane of Infinity'),
('1817115','18171','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Infinite Defiler - Set Phase to 0 on Evade'),
('1817116','18171','6','0','10','6','0','0','0','0','1','-1290','-1291','0','0','0','0','0','0','0','0','0','Infinite Defiler - Random Say on Death'),
('1817201','18172','4','0','10','6','0','0','0','0','1','-1288','-1289','0','0','0','0','0','0','0','0','0','Infinite Saboteur - Random Say on Aggro'),
('1817202','18172','9','0','100','7','0','5','9100','18200','11','15496','1','0','0','0','0','0','0','0','0','0','Infinite Saboteur - Cast Cleave'),
('1817203','18172','0','0','100','7','4200','8200','12100','18300','11','17234','1','0','0','0','0','0','0','0','0','0','Infinite Saboteur - Cast Shadow Shock'),
('1817204','18172','0','0','100','7','1000','5600','62700','66400','11','31976','0','1','0','0','0','0','0','0','0','0','Infinite Saboteur - Cast Shadow Shield'),
('1817205','18172','6','0','10','6','0','0','0','0','1','-1290','-1291','0','0','0','0','0','0','0','0','0','Infinite Saboteur - Random Say on Death'),
('1859801','18598','1','0','50','39','40000','60000','120000','180000','1','-588','-589','-1292','1','-589','-1292','-1293','1','-588','-1292','-1293','Orc Prisoner - Random Say OOC'),
('1893403','18934','4','0','10','38','0','0','0','0','1','-1275','-1276','-1277','1','-1276','-1277','-1278','1','-1275','-1276','-1277','Durnholde Mage - Random Say on Aggro'),
('1893404','18934','4','0','100','2','0','0','0','0','11','12466','1','0','23','1','0','0','0','0','0','0','Durnholde Mage (Normal) - Cast Fireball and Set Phase 1 on Aggro'),
('1893405','18934','9','13','100','3','0','40','8500','12100','11','12466','1','0','0','0','0','0','0','0','0','0','Durnholde Mage (Normal) - Cast Fireball (Phase 1)'),
('1893406','18934','4','0','100','4','0','0','0','0','11','17290','1','0','23','1','0','0','0','0','0','0','Durnholde Mage (Heroic) - Cast Fireball and Set Phase 1 on Aggro'),
('1893407','18934','9','13','100','5','0','40','3600','3600','11','17290','1','0','0','0','0','0','0','0','0','0','Durnholde Mage (Heroic) - Cast Fireball (Phase 1)'),
('1893408','18934','3','13','100','6','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Durnholde Mage - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 1)'),
('1893409','18934','9','13','100','6','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Durnholde Mage - Start Combat Movement at 35 Yards (Phase 1)'),
('1893410','18934','9','13','100','6','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Durnholde Mage - Prevent Combat Movement at 15 Yards (Phase 1)'),
('1893411','18934','9','13','100','6','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Durnholde Mage - Start Combat Movement Below 5 Yards'),
('1893412','18934','3','11','100','7','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Durnholde Mage - Set Phase 1 when Mana is above 30% (Phase 2)'),
('1893413','18934','0','0','100','7','2600','11300','10900','21700','11','13341','1','0','0','0','0','0','0','0','0','0','Durnholde Mage (Normal) - Cast Fire Blast'),
('1893414','18934','0','0','100','7','2600','11300','10900','21700','11','16144','1','0','0','0','0','0','0','0','0','0','Durnholde Mage (Heroic) - Cast Fire Blast'),
('1893415','18934','0','0','100','7','8900','36400','13300','30500','11','15244','0','0','0','0','0','0','0','0','0','0','Durnholde Mage (Normal) - Cast Cone of Cold'),
('1893416','18934','0','0','100','7','8900','18200','13300','30500','11','38384','0','0','0','0','0','0','0','0','0','0','Durnholde Mage (Heroic) - Cast Cone of Cold'),
('1893417','18934','0','0','100','7','8700','24500','14500','28100','11','13323','5','1','0','0','0','0','0','0','0','0','Durnholde Mage - Cast Polymorph'),
('1893418','18934','27','0','100','7','12544','1','5000','5000','11','12544','0','1','0','0','0','0','0','0','0','0','Durnholde Mage - Cast Frost Armor on Missing Buff'),
('1893419','18934','2','0','100','6','15','0','0','0','22','3','0','0','0','0','0','0','0','0','0','0','Durnholde Mage - Set Phase 3 at 15% HP'),
('1893420','18934','2','7','100','6','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Durnholde Mage - Start Combat Movement and Flee at 15% HP (Phase 3)'),
('1893421','18934','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Durnholde Mage - Set Phase to 0 on Evade'),
('1893422','18934','6','0','10','38','0','0','0','0','1','-1279','-1280','-1281','1','-1280','-1281','-1282','1','-1279','-1280','-1281','Durnholde Mage - Random Say on Death'),
('1783501','17835','4','0','100','6','0','0','0','0','30','1','1','2','0','0','0','0','0','0','0','0','Infinite Assassin - Select Random Phase on Aggro'),
('1783502','17835','0','0','20','6','0','0','0','0','1','-442','-446','-447','0','0','0','0','0','0','0','0','Infinite Assassin - Chance Say on Aggro'),
('1783503','17835','0','5','100','3','1200','11100','4500','15300','11','14873','1','0','0','0','0','0','0','0','0','0','Infinite Assassin (Normal) - Cast Sinister Strike'),
('1783504','17835','0','5','100','5','500','7300','3500','14500','11','15667','1','0','0','0','0','0','0','0','0','0','Infinite Assassin (Heroic) - Cast Sinister Strike'),
('1783505','17835','0','5','100','3','1900','10100','10400','21600','11','14874','1','0','0','0','0','0','0','0','0','0','Infinite Assassin (Normal) - Cast Rupture'),
('1783506','17835','0','5','100','5','1000','15800','10100','20500','11','15583','1','0','0','0','0','0','0','0','0','0','Infinite Assassin (Heroic) - Cast Rupture'),
('1783507','17835','0','5','100','5','800','7800','12200','62800','11','30981','1','32','0','0','0','0','0','0','0','0','Infinite Assassin (Heroic) - Cast Crippling Poison'),
('1783508','17835','0','3','100','7','1200','12400','20100','24900','11','30832','1','0','0','0','0','0','0','0','0','0','Infinite Assassin - Cast Kidney Shot'),
('1783509','17835','0','3','100','5','1000','6500','12300','24200','11','38520','1','0','0','0','0','0','0','0','0','0','Infinite Assassin (Heroic) - Cast Deadly Poison'),
('1783510','17835','9','3','100','3','0','5','4800','7200','11','7159','1','0','0','0','0','0','0','0','0','0','Infinite Assassin (Normal) - Cast Backstab'),
('1783511','17835','9','3','100','5','0','5','4800','7200','11','15657','1','0','0','0','0','0','0','0','0','0','Infinite Assassin (Heroic) - Cast Backstab'),
('1783512','17835','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Infinite Assassin - Set Phase to 0 on Evade'),
('1789201','17892','1','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Infinite Chronomancer - Prevent Combat Movement on Spawn'),
('1789202','17892','0','0','20','6','0','0','0','0','1','-439','-440','-441','0','0','0','0','0','0','0','0','Infinite Chronomancer - Chance Say on Aggro'),
('1789203','17892','4','0','100','6','0','0','0','0','28','0','31326','0','30','1','1','3','0','0','0','0','Infinite Chronomancer - Remove Corrupt Medivh and Select Random Phase on Aggro'),
('1789204','17892','4','29','100','2','0','0','0','0','11','15497','1','0','0','0','0','0','0','0','0','0','Infinite Chronomancer (Normal) - Cast Frostbolt on Aggro (Phase 1)'),
('1789205','17892','9','29','100','3','0','40','2900','5400','11','15497','1','0','0','0','0','0','0','0','0','0','Infinite Chronomancer (Normal) - Cast Frostbolt (Phase 1)'),
('1789206','17892','4','29','100','4','0','0','0','0','11','12675','1','0','23','1','0','0','0','0','0','0','Infinite Chronomancer (Heroic) - Cast Frostbolt on Aggro (Phase 1)'),
('1789207','17892','9','29','100','5','0','40','2900','5400','11','12675','1','0','0','0','0','0','0','0','0','0','Infinite Chronomancer (Heroic) - Cast Frostbolt (Phase 1)'),
('1789208','17892','3','29','100','6','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Infinite Chronomancer - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 1)'),
('1789209','17892','9','29','100','6','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Infinite Chronomancer - Start Combat Movement at 35 Yards (Phase 1)'),
('1789210','17892','9','29','100','6','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Infinite Chronomancer - Prevent Combat Movement at 15 Yards (Phase 1)'),
('1789211','17892','9','29','100','6','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Infinite Chronomancer - Start Combat Movement Below 5 Yards (Phase 1)'),
('1789212','17892','0','29','100','3','3700','12900','33800','39800','11','15063','1','1','0','0','0','0','0','0','0','0','Infinite Chronomancer (Normal) - Cast Frost Nova'),
('1789213','17892','0','29','100','5','3600','8300','22200','25700','11','15531','1','1','0','0','0','0','0','0','0','0','Infinite Chronomancer (Heroic) - Cast Frost Nova'),
('1789214','17892','3','27','100','7','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Infinite Chronomancer - Set Phase 1 when Mana is above 30% (Phase 2)'),
('1789215','17892','4','23','100','2','0','0','0','0','11','15124','1','0','0','0','0','0','0','0','0','0','Infinite Chronomancer (Normal) - Cast Arcane Bolt on Aggro (Phase 3)'),
('1789216','17892','9','23','100','3','0','40','2900','5400','11','15124','1','0','0','0','0','0','0','0','0','0','Infinite Chronomancer (Normal) - Cast Arcane Bolt (Phase 3)'),
('1789217','17892','4','23','100','4','0','0','0','0','11','15230','1','0','23','1','0','0','0','0','0','0','Infinite Chronomancer (Heroic) - Cast Arcane Bolt on Aggro (Phase 3)'),
('1789218','17892','9','23','100','5','0','40','1200','3400','11','15230','1','0','0','0','0','0','0','0','0','0','Infinite Chronomancer (Heroic) - Cast Arcane Bolt (Phase 3)'),
('1789219','17892','3','23','100','6','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Infinite Chronomancer - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 3)'),
('1789220','17892','9','23','100','6','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Infinite Chronomancer - Start Combat Movement at 35 Yards (Phase 3)'),
('1789221','17892','9','23','100','6','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Infinite Chronomancer - Prevent Combat Movement at 15 Yards (Phase 3)'),
('1789222','17892','9','23','100','6','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Infinite Chronomancer - Start Combat Movement Below 5 Yards (Phase 3)'),
('1789223','17892','0','23','100','3a','8600','18200','9500','10100','11','33860','1','1','0','0','0','0','0','0','0','0','Infinite Chronomancer (Normal) - Cast Arcane Explosion'),
('1789224','17892','0','23','100','3','8600','18200','8000','10100','11','33623','1','1','0','0','0','0','0','0','0','0','Infinite Chronomancer (Heroic) - Cast Arcane Explosion'),
('1789225','17892','3','15','100','7','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Infinite Chronomancer - Set Phase 3 when Mana is above 30% (Phase 4)'),
('1789226','17892','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Infinite Chronomancer - Set Phase to 0 on Evade');
REPLACE INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
('1899501','18995','1','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Infinite Vanquisher - Prevent Combat Movement on Spawn'),
('1899502','18995','4','0','100','2','0','0','0','0','11','12739','1','0','23','1','0','0','0','0','0','0','Infinite Vanquisher (Normal) - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('1899503','18995','9','5','100','3','0','40','3500','4700','11','12739','1','0','0','0','0','0','0','0','0','0','Infinite Vanquisher (Normal) - Cast Shadow Bolt (Phase 1)'),
('1899504','18995','4','0','100','4','0','0','0','0','11','15472','1','0','23','1','0','0','0','0','0','0','Infinite Vanquisher (Heroic) - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('1899505','18995','9','5','100','5','0','40','3500','4700','11','15472','1','0','0','0','0','0','0','0','0','0','Infinite Vanquisher (Heroic) - Cast Shadow Bolt (Phase 1)'),
('1899506','18995','3','5','100','6','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Infinite Vanquisher - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 1)'),
('1899507','18995','9','5','100','6','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Infinite Vanquisher - Start Combat Movement at 35 Yards (Phase 1)'),
('1899508','18995','9','5','100','6','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Infinite Vanquisher - Prevent Combat Movement at 15 Yards (Phase 1)'),
('1899509','18995','9','5','100','6','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Infinite Vanquisher - Start Combat Movement Below 5 Yards'),
('1899510','18995','0','0','100','3','7500','9000','2400','5500','11','15241','1','0','0','0','0','0','0','0','0','0','Infinite Vanquisher (Normal) - Cast Scorch'),
('1899511','18995','0','0','100','5','7500','9000','2400','5500','11','36807','1','0','0','0','0','0','0','0','0','0','Infinite Vanquisher (Heroic) - Cast Scorch'),
('1899512','18995','0','0','100','3','5900','6000','5900','6000','11','13341','1','1','0','0','0','0','0','0','0','0','Infinite Vanquisher (Normal) - Cast Fire Blast'),
('1899513','18995','0','0','100','5','5900','6000','5900','6000','11','38526','1','1','0','0','0','0','0','0','0','0','Infinite Vanquisher (Heroic) - Cast Fire Blast'),
('1899514','18995','3','3','100','7','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Infinite Vanquisher - Set Phase 1 when Mana is above 30% (Phase 2)'),
('1899515','18995','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Infinite Vanquisher - Set Phase to 0 on Evade'),
('2169801','21698','0','0','100','7','15000','23000','20000','25000','11','31458','0','0','0','0','0','0','0','0','0','0','Infinite Timereaver - Cast Hasten'),
('2169802','21698','0','0','100','7','8000','8000','10000','20000','11','31464','1','0','0','0','0','0','0','0','0','0','Infinite Timereaver - Cast Mortal Wound'),
('2169803','21698','0','0','100','5','30000','30000','25000','35000','11','38592','0','0','0','0','0','0','0','0','0','0','Infinite Timereaver (Heroic) - Cast Spell Reflection'),
('2169804','21698','0','0','100','3','25000','35000','20000','30000','11','31475','0','0','0','0','0','0','0','0','0','0','Infinite Timereaver (Normal) - Cast Wing Buffet'),
('2169805','21698','0','0','100','5','25000','35000','20000','30000','11','38593','0','0','0','0','0','0','0','0','0','0','Infinite Timereaver (Heroic) - Cast Wing Buffet'),
('1781601','17816','0','0','100','7','4100','12100','15700','20100','11','31551','1','0','0','0','0','0','0','0','0','0','Bogstrok - Cast Piercing Jab'),
('1781701','17817','0','0','100','7','2400','18100','10800','16900','11','35760','4','32','0','0','0','0','0','0','0','0','Bogstrok - Cast Decayed Strength'),
('1793801','17938','0','0','100','3','9700','20500','27700','39800','11','17883','1','0','0','0','0','0','0','0','0','0','Coilfang Observer (Normal) - Cast Immolate'),
('1793802','17938','0','0','100','5','9700','20500','27700','39800','11','37668','1','0','0','0','0','0','0','0','0','0','Coilfang Observer (Heroic) - Cast Immolate'),
('1793803','17938','0','0','100','3','9600','21700','10900','21700','11','32191','1','0','0','0','0','0','0','0','0','0','Coilfang Observer (Normal) - Cast Heavy Dynamite'),
('1793804','17938','0','0','100','5','9600','21700','10900','21700','11','37666','1','0','0','0','0','0','0','0','0','0','Coilfang Observer (Heroic) - Cast Heavy Dynamite'),
('1794001','17940','0','0','100','3','9400','20500','20500','34100','11','16005','4','0','0','0','0','0','0','0','0','0','Coilfang Technician (Normal) - Cast Rain of Fire'),
('1794002','17940','0','0','100','5','9400','20500','20500','34100','11','39376','4','0','0','0','0','0','0','0','0','0','Coilfang Technician (Heroic) - Cast Rain of Fire'),
('1794102','17941','0','0','100','7','13700','18000','25400','33800','11','31985','0','1','0','0','0','0','0','0','0','0','Mennu the Betrayer - Summon Tainted Stoneskin Totem'),
('1794103','17941','0','0','100','7','19200','23300','26200','26200','11','31981','0','1','0','0','0','0','0','0','0','0','Mennu the Betrayer - Summon Tainted Earthgrab Totem'),
('1794104','17941','0','0','100','7','20200','30600','26200','26200','11','31991','0','1','0','0','0','0','0','0','0','0','Mennu the Betrayer - Summon Corrupted Nova Totem'),
('1794105','17941','2','0','100','7','60','0','15700','22900','11','34980','0','1','0','0','0','0','0','0','0','0','Mennu the Betrayer - Summon Healing Ward Totem at 60% HP'),
('1794106','17941','0','0','100','7','12100','18500','19300','29100','11','35010','1','0','0','0','0','0','0','0','0','0','Mennu the Betrayer - Cast Lightning Bolt'),
('1794201','17942','0','0','100','7','9100','25900','18800','34500','11','40504','1','0','0','0','0','0','0','0','0','0','Quagmirran - Cast Cleave'),
('1794202','17942','0','0','100','7','20300','31200','20500','32600','11','32055','1','0','0','0','0','0','0','0','0','0','Quagmirran - Cast Uppercut'),
('1794203','17942','0','0','100','7','15600','26500','42200','49100','13','100','5','0','11','38153','1','0','0','0','0','0','Quagmirran - Threat Mod and Cast Acid Spray'),
('1794204','17942','0','0','100','3','22900','34800','21700','38500','11','34780','1','0','0','0','0','0','0','0','0','0','Quagmirran (Normal) - Cast Poison Volley'),
('1794205','17942','0','0','100','5','22900','34800','21700','38500','11','39340','1','0','0','0','0','0','0','0','0','0','Quagmirran (Heroic) - Cast Poison Volley'),
('1795705','17957','0','0','100','7','14200','24100','29000','29000','11','19134','5','0','0','0','0','0','0','0','0','0','Coilfang Champion - Cast Frightening Shout'),
('1795706','17957','0','0','100','7','4700','17900','10100','22200','11','15284','1','1','0','0','0','0','0','0','0','0','Coilfang Champion - Cast Cleave'),
('1795801','17958','0','0','100','7','4900','16900','10400','22900','11','15655','1','0','0','0','0','0','0','0','0','0','Coilfang Defender - Cast Shield Slam'),
('1795802','17958','0','0','100','7','10500','15700','13200','28900','11','31554','0','1','0','0','0','0','0','0','0','0','Coilfang Defender - Cast Spell Reflection'),
('1795904','17959','0','0','100','7','5800','10800','15700','26600','11','9080','1','0','0','0','0','0','0','0','0','0','Coilfang Slavehandler - Cast Hamstring'),
('1795905','17959','0','0','100','7','10100','22300','22100','32500','11','16172','4','0','0','0','0','0','0','0','0','0','Coilfang Slavehandler - Cast Head Crack'),
('1796009','17960','0','0','100','6','12200','19300','26500','42300','11','31555','4','33','0','0','0','0','0','0','0','0','Coilfang Soothsayer - Cast Decayed Intellect'),
('1796101','17961','0','0','100','3','4700','14700','21700','25300','11','15234','1','0','0','0','0','0','0','0','0','0','Coilfang Enchantress (Normal) - Cast Lightning Bolt'),
('1796102','17961','0','0','100','5','4700','14700','21700','25300','11','37664','1','0','0','0','0','0','0','0','0','0','Coilfang Enchantress (Heroic) - Cast Lightning Bolt'),
('1796103','17961','0','0','100','3','11200','22500','18100','26500','11','32193','4','0','0','0','0','0','0','0','0','0','Coilfang Enchantress (Normal) - Cast Lightning Cloud'),
('1796104','17961','0','0','100','5','11200','22500','18100','26500','11','37665','4','0','0','0','0','0','0','0','0','0','Coilfang Enchantress (Heroic) - Cast Lightning Cloud'),
('1796105','17961','0','0','100','7','5600','19300','18100','26500','11','32173','4','0','0','0','0','0','0','0','0','0','Coilfang Enchantress - Cast Entangling Roots'),
('1796201','17962','0','0','100','7','9800','17200','14500','24100','11','33787','1','0','0','0','0','0','0','0','0','0','Coilfang Collaborator - Cast Cripple'),
('1796203','17962','2','0','100','7','20','0','120000','120000','11','8269','0','1','1','-106','0','0','0','0','0','0','Coilfang Collaborator - Cast Frenzy at 20% HP'),
('1796314','17963','2','0','100','6','25','0','0','0','23','1','0','0','0','0','0','0','0','0','0','0','Wastewalker Slave - Set Phase 2 at 25% HP'),
('1796315','17963','2','7','100','6','25','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Wastewalker Slave - Start Combat Movement and Flee at 25% HP (Phase 2)'),
('1796401','17964','0','0','100','3','2300','9100','19300','19300','11','13738','1','32','0','0','0','0','0','0','0','0','Wastewalker Worker (Normal) - Cast Rend'),
('1796402','17964','0','0','100','5','2300','9100','19300','19300','11','37662','1','32','0','0','0','0','0','0','0','0','Wastewalker Worker (Heroic) - Cast Rend'),
('1796403','17964','2','0','100','6','25','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Wastewalker Worker - Flee at 25% HP'),
('1799101','17991','0','0','100','3','8400','15700','20700','35100','11','31956','1','32','0','0','0','0','0','0','0','0','Rokmar the Crackler (Normal) - Cast Grievous Wound'),
('1799102','17991','0','0','100','5','8400','15700','20700','35100','11','38801','1','32','0','0','0','0','0','0','0','0','Rokmar the Crackler (Heroic) - Cast Grievous Wound'),
('1799103','17991','0','0','100','7','15300','37400','22900','32600','11','31948','4','1','0','0','0','0','0','0','0','0','Rokmar the Crackler - Cast Ensnaring Moss'),
('1799104','17991','0','0','100','7','9700','14900','12100','22900','11','35008','4','1','0','0','0','0','0','0','0','0','Rokmar the Crackler - Cast Water Spit'),
('2112601','21126','0','0','100','3','3600','9200','12100','13400','11','34944','0','0','0','0','0','0','0','0','0','0','Coilfang Scale-Healer (Normal) - Cast Holy Nova'),
('2112602','21126','0','0','100','5','3600','9200','12100','13400','11','37669','0','0','0','0','0','0','0','0','0','0','Coilfang Scale-Healer (Heroic) - Cast Holy Nova'),
('2112603','21126','16','0','100','3','17139','15','7200','13300','11','17139','6','0','0','0','0','0','0','0','0','0','Coilfang Scale-Healer (Normal) - Cast Power Word: Shield on Friendlies'),
('2112604','21126','16','0','100','5','36052','15','7200','13300','11','36052','6','0','0','0','0','0','0','0','0','0','Coilfang Scale-Healer (Heroic) - Cast Power Word: Shield on Friendlies'),
('2112701','21127','0','0','100','7','4900','10800','6100','14900','11','15667','1','0','0','0','0','0','0','0','0','0','Coilfang Tempest - Cast Sinister Strike'),
('2112702','21127','0','0','100','7','10800','22900','26900','44600','11','36872','4','33','0','0','0','0','0','0','0','0','Coilfang Tempest - Cast Deadly Poison'),
('2112801','21128','0','0','100','7','1300','4900','12100','21300','11','34984','5','0','0','0','0','0','0','0','0','0','Coilfang Ray - Cast Psychic Horror'),
('2968001','29680','0','0','100','3','1000','4000','7000','11000','11','54978','1','0','0','0','0','0','0','0','0','0','Slad\'ran Viper (Normal) - Casts Venomous Bite'),
('2968002','29680','0','0','100','5','1000','4000','7000','11000','11','58996','1','0','0','0','0','0','0','0','0','0','Slad\'ran Viper (Heroic) - Casts Venomous Bite'),
('1740101','17401','0','0','100','7','1000','4400','11100','11300','11','13321','4','0','0','0','0','0','0','0','0','0','Felhound Manastalker - Cast Mana Burn'),
('1740102','17401','0','0','100','7','3300','9600','12900','18100','11','30849','1','0','0','0','0','0','0','0','0','0','Felhound Manastalker - Cast Spell Lock'),
('1747703','17477','9','13','100','3','0','40','3600','4800','11','15242','1','0','0','0','0','0','0','0','0','0','dHellfire Imp (Normal) - Cast Fireball (Phase 1)'),
('1747705','17477','9','13','100','5','0','40','3600','4800','11','17290','1','0','0','0','0','0','0','0','0','0','Hellfire Imp (Heroic) - Cast Fireball (Phase 1)'),
('1889401','18894','0','0','100','7','4800','4800','8400','15700','11','18072','1','0','0','0','0','0','0','0','0','0','Felguard Brute - Cast Uppercut'),
('1889402','18894','0','0','100','7','4000','10900','12100','18100','11','15615','1','0','0','0','0','0','0','0','0','0','Felguard Brute - Cast Pummel'),
('1901603','19016','9','5','100','3','0','40','3600','4800','11','11921','1','0','0','0','0','0','0','0','0','0','Hellfire Familiar (Normal) - Cast Fireball (Phase 1)'),
('1901605','19016','9','5','100','5','0','40','3600','4800','11','17290','1','0','0','0','0','0','0','0','0','0','Hellfire Familiar (Heroic) - Cast Fireball (Phase 1)'),
('2471501','24715','9','0','100','6','0','5','0','0','11','44279','0','2','37','0','0','0','0','0','0','0','High Explosive Sheep - Cast High Explosive Sheep and Die on Range Check'),
('1143901','11439','0','0','100','3','2000','8000','5000','8000','11','15284','1','0','0','0','0','0','0','0','0','0','Illusion of Jandice Barov - Cast Cleave'),
('2090504','20905','4','0','100','4','0','0','0','0','11','39023','1','0','23','1','0','0','34','5','1','0','Blazing Trickster (Heroic) - Cast Fireball and Set Phase 1 and Set Instance Data on Aggro'),
('2744701','27447','11','0','100','6','0','0','0','0','11','50053','0','0','0','0','0','0','0','0','0','0','Varos Cloudstrider - Cast Centrifuge Shield on Spawn'),
('2744702','27447','4','0','100','6','0','0','0','0','1','-1165','0','0','0','0','0','0','0','0','0','0','Varos Cloudstrider - Yell on Aggro'),
('2744703','27447','0','0','100','7','12000','18000','12000','18000','11','51002','0','0','1','-1166','-1167','-1168','0','0','0','0','Varos Cloudstrider - Cast Call Azure Ring Captain and Random Yell'),
('2744704','27447','0','0','100','3','10000','15000','18000','24000','11','51054','4','33','0','0','0','0','0','0','0','0','Varos Cloudstrider (Normal) - Cast Amplify Magic'),
('2744705','27447','0','0','100','5','10000','15000','18000','24000','11','59371','4','33','0','0','0','0','0','0','0','0','Varos Cloudstrider (Heroic) - Cast Amplify Magic'),
('2744706','27447','0','0','100','3','7000','10000','8000','10000','11','50785','4','0','0','0','0','0','0','0','0','0','Varos Cloudstrider (Normal) - Cast Energize Cores'),
('2744707','27447','0','0','100','5','7000','10000','8000','10000','11','59372','4','0','0','0','0','0','0','0','0','0','Varos Cloudstrider (Heroic) - Cast Energize Cores'),
('2744708','27447','5','0','100','7','0','0','0','0','1','-1169','-1170','0','0','0','0','0','0','0','0','0','Varos Cloudstrider - Yell on Player Kill'),
('2744709','27447','6','0','100','6','0','0','0','0','1','-1171','0','0','0','0','0','0','0','0','0','0','Varos Cloudstrider - Yell on Death'),
('3066101','30661','9','0','100','3','0','5','13000','16000','11','58459','1','0','0','0','0','0','0','0','0','0','Azure Invader (Normal) - Cast Impale'),
('3066102','30661','9','0','100','5','0','5','13000','16000','11','59256','1','0','0','0','0','0','0','0','0','0','Azure Invader (Heroic) - Cast Impale'),
('3066103','30661','0','0','100','7','8000','11000','5000','9000','11','15496','1','0','0','0','0','0','0','0','0','0','Azure Invader - Cast Cleave'),
('3066201','30662','9','0','100','3','0','30','13000','16000','11','58462','4','0','0','0','0','0','0','0','0','0','Azure Spellbreaker (Normal) - Cast Arcane Blast'),
('3066202','30662','9','0','100','5','0','30','13000','16000','11','59257','4','0','0','0','0','0','0','0','0','0','Azure Spellbreaker (Heroic) - Cast Arcane Blast'),
('3066203','30662','0','0','100','7','3000','6000','7000','10000','11','25603','1','1','0','0','0','0','0','0','0','0','Azure Spellbreaker - Cast Slow'),
('3066301','30663','1','0','100','6','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Azure Binder - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('3066302','30663','4','0','100','2','0','0','0','0','11','58456','1','0','23','1','0','0','0','0','0','0','Azure Binder (Normal) - Cast Arcane Barrage and Set Phase 1 on Aggro'),
('3066303','30663','9','5','100','3','0','30','3400','4800','11','58456','1','0','0','0','0','0','0','0','0','0','Azure Binder (Normal) - Cast Arcane Barrage (Phase 1)'),
('3066304','30663','4','0','100','4','0','0','0','0','11','59248','1','0','23','1','0','0','0','0','0','0','Azure Binder (Heroic) - Cast Arcane Barrage and Set Phase 1 on Aggro'),
('3066305','30663','9','5','100','5','0','30','3400','4800','11','59248','1','0','0','0','0','0','0','0','0','0','Azure Binder (Heroic) - Cast Arcane Barrage (Phase 1)'),
('3066306','30663','3','5','100','6','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Azure Binder - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('3066307','30663','9','5','100','6','25','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Azure Binder - Start Combat Movement at 25 Yards (Phase 1)'),
('3066308','30663','9','5','100','6','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Azure Binder - Prevent Combat Movement at 15 Yards (Phase 1)'),
('3066309','30663','9','5','100','6','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Azure Binder - Start Combat Movement Below 5 Yards'),
('3066310','30663','9','0','100','3','0','8','9000','15000','11','58455','0','1','0','0','0','0','0','0','0','0','Azure Binder (Normal) - Cast Arcane Explosion'),
('3066311','30663','9','0','100','5','0','8','9000','15000','11','59245','0','1','0','0','0','0','0','0','0','0','Azure Binder (Heroic) - Cast Arcane Explosion'),
('3066312','30663','3','3','100','7','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Azure Binder - Set Phase 1 when Mana is above 15% (Phase 2)'),
('3066313','30663','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Azure Binder - Set Phase to 0 on Evade'),
('3066401','30664','0','0','100','7','1000','5000','14000','20000','11','58469','0','0','0','0','0','0','0','0','0','0','Azure Mage Slayer - Cast Arcane Empowerment'),
('3066501','30665','1','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Prevent Combat Movement on Spawn'),
('3066502','30665','0','0','100','6','0','0','0','0','30','1','3','5','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Random Phase Select on Aggro'),
('3066503','30665','4','253','100','2','0','0','0','0','11','15043','1','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter (Normal) - Cast Frostbolt on Aggro (Phase 1)'),
('3066504','30665','9','253','100','3','0','40','2400','3800','11','15043','1','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter (Normal) - Cast Frostbolt (Phase 1)'),
('3066505','30665','4','253','100','4','0','0','0','0','11','20822','1','0','23','1','0','0','0','0','0','0','Veteran Mage Hunter (Heroic) - Cast Frostbolt on Aggro (Phase 1)'),
('3066506','30665','9','253','100','5','0','40','2400','3800','11','20822','1','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter (Heroic) - Cast Frostbolt (Phase 1)'),
('3066507','30665','3','253','100','6','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Veteran Mage Hunter - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 1)'),
('3066508','30665','9','253','100','7','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Start Combat Movement at 35 Yards (Phase 1)'),
('3066509','30665','9','253','100','7','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Prevent Combat Movement at 15 Yards (Phase 1)'),
('3066510','30665','9','253','100','7','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Start Combat Movement Below 5 Yards (Phase 1)'),
('3066511','30665','3','251','100','7','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Set Phase 1 when Mana is above 30% (Phase 2)'),
('3066512','30665','4','247','100','2','0','0','0','0','11','12466','1','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter (Normal) - Cast Fireball on Aggro (Phase 3)'),
('3066513','30665','9','247','100','3','0','40','2400','3800','11','12466','1','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter (Normal) - Cast Fireball (Phase 3)'),
('3066514','30665','4','247','100','4','0','0','0','0','11','20823','1','0','23','1','0','0','0','0','0','0','Veteran Mage Hunter (Heroic) - Cast Fireball on Aggro (Phase 3)'),
('3066515','30665','9','247','100','5','0','40','2400','3800','11','20823','1','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter (Heroic) - Cast Fireball (Phase 3)'),
('3066516','30665','3','247','100','6','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Veteran Mage Hunter - Start Combat Movement and Set Phase 4 when Mana is at 15% (Phase 3)'),
('3066517','30665','9','247','100','7','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Start Combat Movement at 35 Yards (Phase 3)'),
('3066518','30665','9','247','100','7','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Prevent Combat Movement at 15 Yards (Phase 3)'),
('3066519','30665','9','247','100','7','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Start Combat Movement Below 5 Yards (Phase 3)'),
('3066520','30665','3','239','100','7','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Set Phase 3 when Mana is above 30% (Phase 4)'),
('3066521','30665','4','223','100','2','0','0','0','0','11','13748','1','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter (Normal) - Cast Arcane Bolt on Aggro (Phase 5)'),
('3066522','30665','9','223','100','3','0','40','2400','3800','11','13748','1','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter (Normal) - Cast Arcane Bolt (Phase 5)'),
('3066523','30665','4','223','100','4','0','0','0','0','11','20829','1','0','23','1','0','0','0','0','0','0','Veteran Mage Hunter (Heroic) - Cast Arcane Bolt on Aggro (Phase 5)'),
('3066524','30665','9','223','100','5','0','40','2400','3800','11','20829','1','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter (Heroic) - Cast Arcane Bolt (Phase 5)'),
('3066525','30665','3','223','100','6','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Veteran Mage Hunter - Start Combat Movement and Set Phase 6 when Mana is at 15% (Phase 5)'),
('3066526','30665','9','223','100','7','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Start Combat Movement at 35 Yards (Phase 5)'),
('3066527','30665','9','223','100','7','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Prevent Combat Movement at 15 Yards (Phase 5)'),
('3066528','30665','9','223','100','7','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Start Combat Movement Below 5 Yards (Phase 5)'),
('3066529','30665','3','191','100','7','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Set Phase 5 when Mana is above 30% (Phase 6)'),
('3066530','30665','2','0','100','6','15','0','0','0','22','7','0','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Set Phase 7 at 15% HP'),
('3066531','30665','2','127','100','6','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Veteran Mage Hunter - Start Combat Movement and Flee at 15% HP (Phase 7)'),
('3066532','30665','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Veteran Mage Hunter - Set Phase to 0 on Evade'),
('3066601','30666','9','0','100','7','0','5','5000','9000','11','41056','0','0','0','0','0','0','0','0','0','0','Azure Captain - Cast Whirlwind'),
('3066602','30666','0','0','100','7','3000','6000','7000','10000','11','32736','1','0','0','0','0','0','0','0','0','0','Azure Captain - Cast Mortal Strike'),
('3066701','30667','1','0','100','6','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Azure Sorceror - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('3066702','30667','4','0','100','2','0','0','0','0','11','60181','4','0','23','1','0','0','0','0','0','0','Azure Sorceror (Normal) - Cast Arcane Stream and Set Phase 1 on Aggro'),
('3066703','30667','9','5','100','3','5','35','6000','8000','11','60181','4','0','0','0','0','0','0','0','0','0','Azure Sorceror (Normal) - Cast Arcane Stream (Phase 1)'),
('3066704','30667','4','0','100','4','0','0','0','0','11','60204','4','0','23','1','0','0','0','0','0','0','Azure Sorceror (Heroic) - Cast Arcane Stream and Set Phase 1 on Aggro'),
('3066705','30667','9','5','100','5','5','35','6000','8000','11','60204','4','0','0','0','0','0','0','0','0','0','Azure Sorceror (Heroic) - Cast Arcane Stream (Phase 1)'),
('3066706','30667','3','5','100','6','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Azure Sorceror - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('3066707','30667','9','5','100','6','30','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Azure Sorceror - Start Combat Movement at 30 Yards (Phase 1)'),
('3066708','30667','9','5','100','6','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Azure Sorceror - Prevent Combat Movement at 15 Yards (Phase 1)'),
('3066709','30667','9','5','100','6','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Azure Sorceror - Start Combat Movement Below 5 Yards'),
('3066710','30667','9','0','100','3','0','8','9000','15000','11','60182','0','1','0','0','0','0','0','0','0','0','Azure Sorceror (Normal) - Cast Mana Detonation'),
('3066711','30667','9','0','100','5','0','8','9000','15000','11','60205','0','1','0','0','0','0','0','0','0','0','Azure Sorceror (Heroic) - Cast Mana Detonation'),
('3066712','30667','3','3','100','7','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Azure Sorceror - Set Phase 1 when Mana is above 15% (Phase 2)'),
('3066713','30667','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Azure Sorceror - Set Phase to 0 on Evade'),
('3066801','30668','9','0','100','7','0','8','9000','14000','11','52719','1','0','0','0','0','0','0','0','0','0','Azure Raider - Cast Concussion Blow'),
('3066802','30668','0','0','100','7','7000','14000','12000','18000','11','60158','0','1','0','0','0','0','0','0','0','0','Azure Raider - Cast Magic Reflection'),
('3091801','30918','1','0','100','6','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Azure Binder - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('3091802','30918','4','0','100','2','0','0','0','0','11','58457','1','0','23','1','0','0','0','0','0','0','Azure Binder (Normal) - Cast Frostbolt and Set Phase 1 on Aggro'),
('3091803','30918','9','5','100','3','0','40','3400','4800','11','58457','1','0','0','0','0','0','0','0','0','0','Azure Binder (Normal) - Cast Frostbolt (Phase 1)'),
('3091804','30918','4','0','100','4','0','0','0','0','11','59251','1','0','23','1','0','0','0','0','0','0','Azure Binder (Heroic) - Cast Frostbolt and Set Phase 1 on Aggro'),
('3091805','30918','9','5','100','5','0','40','3400','4800','11','59251','1','0','0','0','0','0','0','0','0','0','Azure Binder (Heroic) - Cast Frostbolt (Phase 1)'),
('3091806','30918','3','5','100','6','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Azure Binder - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('3091807','30918','9','5','100','6','25','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Azure Binder - Start Combat Movement at 25 Yards (Phase 1)'),
('3091808','30918','9','5','100','6','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Azure Binder - Prevent Combat Movement at 15 Yards (Phase 1)'),
('3091809','30918','9','5','100','6','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Azure Binder - Start Combat Movement Below 5 Yards'),
('3091810','30918','9','0','100','3','0','8','9000','15000','11','58458','0','1','0','0','0','0','0','0','0','0','Azure Binder (Normal) - Cast Frost Nova'),
('3091811','30918','9','0','100','5','0','8','9000','15000','11','59253','0','1','0','0','0','0','0','0','0','0','Azure Binder (Heroic) - Cast Frost Nova'),
('3091812','30918','3','3','100','7','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Azure Binder - Set Phase 1 when Mana is above 15% (Phase 2)'),
('3091813','30918','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Azure Binder - Set Phase to 0 on Evade'),
('3096101','30961','4','0','100','2','0','0','0','0','23','1','0','0','0','0','0','0','0','0','0','0','Azure Invader - Set Phase 1 on Aggro'),
('3096102','30961','9','5','100','3','0','5','5000','9000','11','58461','1','0','0','0','0','0','0','0','0','0','Azure Invader - Cast Sunder Armor (Phase 1)'),
('3096103','30961','24','5','100','3','58461','5','5000','5000','23','1','0','0','0','0','0','0','0','0','0','0','Azure Invader - Set Phase 2 on Target Max Sunder Armor Aura Stack (Phase 1)'),
('3096104','30961','28','3','100','3','58461','1','5000','5000','23','-1','0','0','0','0','0','0','0','0','0','0','Azure Invader - Set Phase 1 on Target Missing Sunder Armor Aura Stack (Phase 2)'),
('3096105','30961','0','0','100','7','3000','6000','7000','12000','11','58460','1','0','0','0','0','0','0','0','0','0','Azure Invader - Cast Brutal Strike'),
('3096106','30961','7','0','100','2','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Azure Invader - Set Phase to 0 on Evade'),
('3096201','30962','0','0','100','3','7000','11000','11000','17000','11','58463','0','0','0','0','0','0','0','0','0','0','Azure Spellbreaker (Normal) - Cast Cone of Cold'),
('3096202','30962','0','0','100','5','7000','11000','11000','17000','11','59258','0','0','0','0','0','0','0','0','0','0','Azure Spellbreaker (Heroic) - Cast Cone of Cold'),
('3096203','30962','9','0','100','7','0','30','9000','13000','11','58464','4','1','0','0','0','0','0','0','0','0','Azure Spellbreaker - Cast Chains of Ice'),
('3096301','30963','13','0','100','6','0','0','0','0','11','30849','6','1','0','0','0','0','0','0','0','0','Azure Mage Slayer (Normal) - Cast Spell Lock on Target Spell Casting'),
('3219101','32191','9','0','100','7','0','5','5000','7000','11','58471','1','0','0','0','0','0','0','0','0','0','Azure Stalker - Cast Backstab'),
('3219102','32191','0','0','100','7','11000','16000','13000','21000','11','58470','0','1','0','0','0','0','0','0','0','0','Azure Stalker - Cast Tactical Blink'),
('2738601','27386','11','0','100','6','0','0','0','0','11','48584','0','0','0','0','0','0','0','0','0','0','Avenging Spirit - Cast Wither on Spawn'),
('2739201','27392','11','0','100','6','0','0','0','0','11','48593','0','0','0','0','0','0','0','0','0','0','Avenging Spirit Summoner - Cast Summon Avenging Spirit on Spawned'),
('2739202','27392','1','0','100','6','3000','3000','0','0','11','48592','0','0','0','0','0','0','0','0','0','0','Avenging Spirit Summoner - Cast Summon Avenging Spirit on OOC Timer'),
('2312301','23123','0','0','100','3','2000','3000','2000','3000','11','40185','4','0','0','0','0','0','0','0','0','0','Doom Blossom - Cast Shadow Bolt'),
('2346901','23469','6','0','100','2','0','0','0','0','11','41542','0','2','0','0','0','0','0','0','0','0','Enslaved Soul - Cast Soul Release on Death'),
('1255701','12557','4','0','100','2','0','0','0','0','1','-1294','0','0','0','0','0','0','0','0','0','0','Grethlok the Controller - Yell on Aggro'),
('1255702','12557','9','0','100','3','0','30','5000','8000','11','22273','1','0','0','0','0','0','0','0','0','0','Grethlok the Controller - Cast Arcane Missiles'),
('1255703','12557','0','0','100','3','8000','11000','20000','24000','11','22274','4','1','0','0','0','0','0','0','0','0','Grethlok the Controller - Cast Greater Polymorph'),
('1255704','12557','0','0','100','3','11000','14000','16000','20000','11','14515','4','0','1','-1295','0','0','0','0','0','0','Grethlok the Controller - Cast Dominate Mind and Yell'),
('1255705','12557','0','0','100','3','15000','21000','10000','17000','11','13747','4','0','0','0','0','0','0','0','0','0','Grethlok the Controller - Cast Slow'),
('1460501','14605','11','0','100','2','0','0','0','0','38','0','0','0','0','0','0','0','0','0','0','0','Bone Construct - Set in Combat with Zone on Spawned'),
('1460502','14605','9','0','100','3','0','5','5000','8000','11','8355','1','0','0','0','0','0','0','0','0','0','Bone Construct - Cast Exploit Weakness'),
('2187501','21875','11','0','100','2','0','0','0','0','1','-1268','0','0','21','0','0','0','0','0','0','0','Shadow of Leotheras - Yell and Stop Combat Movemnt on Spawn'),
('2187502','21875','5','0','100','3','0','0','0','0','1','-1269','-1270','-1271','0','0','0','0','0','0','0','0','Shadow of Leotheras - Yell on Player Kill'),
('2187503','21875','0','0','100','3','2000','3000','3000','3000','11','37674','0','0','0','0','0','0','0','0','0','0','Shadow of Leotheras - Cast Chaos Blast'),
('2187504','21875','9','0','100','3','25','60','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Shadow of Leotheras - Start Combat Movement at 25 Yards'),
('2187505','21875','9','0','100','3','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Shadow of Leotheras - Prevent Combat Movement at 15 Yards');
REPLACE INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
('2200901','22009','0','0','100','3','5000','10000','5000','10000','11','38253','4','0','0','0','0','0','0','0','0','0','Tainted Elemental - Cast Poison Bolt'),
('2200902','22009','9','0','100','3','25','60','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Tainted Elemental - Start Combat Movement at 25 Yards'),
('2200903','22009','9','0','100','3','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Tainted Elemental - Prevent Combat Movement at 15 Yards'),
('2214001','22140','0','0','100','3','5000','8000','12000','20000','11','38575','4','0','0','0','0','0','0','0','0','0','Toxic Sporebat - Cast Toxic Spores'),
('3460501','34605','0','0','100','31','10000','15000','10000','15000','11','66092','0','32','0','0','0','0','0','0','0','0','Swarm Scarab - Cast Determination'),
('3672401','36724','0','0','100','31','3000','5000','7000','11000','11','71029','0','0','0','0','0','0','0','0','0','0','Servant of the Throne - Cast Glacial Blast'),
-- ('3672501','36725','10','0','100','31','1','60','1000','1000','38','0','0','0','0','0','0','0','0','0','0','0','Nerub\'ar Broodkeeper - Zone Combat Pulse on 60 Yards LOS'),  -- Might Require This To Switch To On-Aggro (Plus Set on Infinite Loop Repeat)
('3672502','36725','0','0','100','31','5000','7000','5000','9000','11','70965','4','0','0','0','0','0','0','0','0','0','Nerub\'ar Broodkeeper - Cast Crypt Scarabs'),
('3672503','36725','0','0','100','31','7000','11000','7000','11000','11','70980','4','0','0','0','0','0','0','0','0','0','Nerub\'ar Broodkeeper - Cast Web Wrap'),
('3672504','36725','14','0','100','31','50','30','8000','13000','11','36725','6','0','0','0','0','0','0','0','0','0','Nerub\'ar Broodkeeper - Cast Dark Mending on Friendlies'),
('3679101','36791','1','0','100','30','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Blazing Skeleton - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('3679102','36791','4','0','100','2','0','0','0','0','11','70754','1','0','23','1','0','0','0','0','0','0','Blazing Skeleton (10-Man Normal) - Cast Fireball and Set Phase 1 on Aggro'),
('3679103','36791','9','5','100','3','0','60','46000','60000','11','70754','1','0','0','0','0','0','0','0','0','0','Blazing Skeleton (10-Man Normal) - Cast Fireball (Phase 1)'),
('3679104','36791','4','0','100','4','0','0','0','0','11','71748','1','0','23','1','0','0','0','0','0','0','Blazing Skeleton (25-Man Normal) - Cast Fireball and Set Phase 1 on Aggro'),
('3679105','36791','9','5','100','5','0','60','46000','60000','11','71748','1','0','0','0','0','0','0','0','0','0','Blazing Skeleton (25-Man Normal) - Cast Fireball (Phase 1)'),
('3679106','36791','4','0','100','8','0','0','0','0','11','72023','1','0','23','1','0','0','0','0','0','0','Blazing Skeleton (10-Man Heroic) - Cast Fireball and Set Phase 1 on Aggro'),
('3679107','36791','9','5','100','9','0','60','46000','60000','11','72023','1','0','0','0','0','0','0','0','0','0','Blazing Skeleton (10-Man Heroic) - Cast Fireball (Phase 1)'),
('3679108','36791','4','0','100','16','0','0','0','0','11','72024','1','0','23','1','0','0','0','0','0','0','Blazing Skeleton (25-Man Heroic) - Cast Fireball and Set Phase 1 on Aggro'),
('3679109','36791','9','5','100','17','0','60','46000','60000','11','72024','1','0','0','0','0','0','0','0','0','0','Blazing Skeleton (25-Man Heroic) - Cast Fireball (Phase 1)'),
('3679110','36791','3','5','100','30','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Blazing Skeleton - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('3679111','36791','9','5','100','30','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Start Combat Movement at 35 Yards (Phase 1)'),
('3679112','36791','9','5','100','30','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Prevent Combat Movement at 15 Yards (Phase 1)'),
('3679113','36791','9','5','100','30','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Start Combat Movement Below 5 Yards'),
('3679114','36791','3','3','100','31','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Set Phase 1 when Mana is above 15% (Phase 2)'),
('3679115','36791','0','0','100','11','8000','15000','18000','25000','11','69325','0','1','0','0','0','0','0','0','0','0','Blazing Skeleton (10-Man) - Cast Lay Waste'),
('3679116','36791','0','0','100','21','8000','15000','18000','25000','11','71730','0','1','0','0','0','0','0','0','0','0','Blazing Skeleton (25-Man) - Cast Lay Waste'),
('3679117','36791','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Set Phase to 0 on Evade'),
('3680501','36805','0','0','100','11','4000','7000','4000','7000','11','69576','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant (10-Man) - Cast Chaos Bolt'),
('3680502','36805','0','0','100','21','4000','7000','4000','7000','11','71108','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant (25-Man) - Cast Chaos Bolt'),
('3680503','36805','0','0','100','11','7000','13000','7000','13000','11','69404','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant (10-Man) - Cast Curse of Agony'),
('3680504','36805','0','0','100','21','7000','13000','7000','13000','11','71112','4','0','0','0','0','0','0','0','0','0','Deathspeaker Servant (25-Man) - Cast Curse of Agony'),
('3680505','36805','0','0','100','31','5000','9000','7000','12000','11','69405','4','32','0','0','0','0','0','0','0','0','Deathspeaker Servant - Cast Consuming Shadows'),
('3680701','36807','1','0','100','30','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Deathspeaker Disciple - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('3680702','36807','4','0','100','30','0','0','0','0','11','69387','1','0','23','1','0','0','0','0','0','0','Deathspeaker Disciple - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('3680703','36807','9','5','100','31','0','40','7000','10000','11','69387','4','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Cast Shadow Bolt (Phase 1)'),
('3680704','36807','3','5','100','30','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Deathspeaker Disciple - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('3680705','36807','9','5','100','30','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Start Combat Movement at 35 Yards (Phase 1)'),
('3680706','36807','9','5','100','30','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Prevent Combat Movement at 15 Yards (Phase 1)'),
('3680707','36807','9','5','100','30','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Start Combat Movement Below 5 Yards (Phase 1)'),
('3680708','36807','3','3','100','31','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Set Phase 1 when Mana is above 15% (Phase 2)'),
('3680709','36807','16','0','100','31','69391','30','5000','9000','11','69391','6','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Cast Dark Blessing on Friendlies'),
('3680710','36807','14','0','100','11','50','50','7000','11000','11','69389','6','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple (10-Man) - Cast Shadow Mend on Friendlies'),
('3680711','36807','14','0','100','21','50','50','7000','11000','11','71107','6','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple (25-Man) - Cast Shadow Mend on Friendlies'),
('3680712','36807','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Disciple - Set Phase to 0 on Evade'),
('3680801','36808','0','0','100','31','3000','6000','3000','6000','11','69492','1','0','0','0','0','0','0','0','0','0','Deathspeaker Zealot - Cast Shadow Cleave'),
('3681101','36811','1','0','100','30','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Deathspeaker Attendant - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('3681102','36811','4','0','100','30','0','0','0','0','11','69387','1','0','23','1','0','0','0','0','0','0','Deathspeaker Attendant - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('3681103','36811','9','5','100','31','0','40','6000','8000','11','69387','4','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant - Cast Shadow Bolt (Phase 1)'),
('3681104','36811','3','5','100','30','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Deathspeaker Attendant - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('3681105','36811','9','5','100','30','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant - Start Combat Movement at 35 Yards (Phase 1)'),
('3681106','36811','9','5','100','30','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant - Prevent Combat Movement at 15 Yards (Phase 1)'),
('3681107','36811','9','5','100','30','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant - Start Combat Movement Below 5 Yards (Phase 1)'),
('3681108','36811','3','3','100','31','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant - Set Phase 1 when Mana is above 15% (Phase 2)'),
('3681109','36811','0','0','100','11','10000','15000','10000','15000','11','69355','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant (10-Man) - Cast Shadow Nova'),
('3681110','36811','0','0','100','21','10000','15000','10000','15000','11','71106','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant (25-Man) - Cast Shadow Nova'),
('3681111','36811','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Deathspeaker Attendant - Set Phase to 0 on Evade'),
('3682901','36829','4','0','100','30','0','0','0','0','11','69491','0','0','0','0','0','0','0','0','0','0','Deathspeaker High Priest - Cast Aura of Darkness on Aggro'),
('3682902','36829','0','0','100','31','5000','7000','10000','12000','11','69483','4','0','0','0','0','0','0','0','0','0','Deathspeaker High Priest - Cast Dark Reckoning'),
('3688001','36880','0','0','100','11','5000','12000','10000','15000','11','71114','0','0','0','0','0','0','0','0','0','0','Decaying Colossus (10-Man) - Cast Massive Stomp'),
('3688002','36880','0','0','100','21','5000','12000','10000','15000','11','71115','0','0','0','0','0','0','0','0','0','0','Decaying Colossus (25-Man) - Cast Massive Stomp'),
-- ('3700701','37007','10','0','100','31','1','80','1000','1000','38','0','0','0','0','0','0','0','0','0','0','0','Deathbound Ward - Zone Combat Pulse on 80 Yards LOS'),  -- Might Require This To Switch To On-Aggro (Plus Set on Infinite Loop Repeat)
('3700702','37007','0','0','100','31','5000','7000','5000','7000','11','71021','1','0','0','0','0','0','0','0','0','0','Deathbound Ward - Cast Saber Lash'),
('3700703','37007','0','0','100','31','12000','20000','16000','24000','11','71022','0','1','0','0','0','0','0','0','0','0','Deathbound Ward - Cast Disrupting Shout'),
('3701101','37011','0','0','100','31','10000','15000','10000','15000','11','70960','0','0','0','0','0','0','0','0','0','0','The Dammed - Cast Bone Flurry'),
('3701102','37011','6','0','100','30','0','0','0','0','11','70961','0','7','0','0','0','0','0','0','0','0','The Dammed - Cast Shattred Bones on Death'),
('3701201','37012','0','0','100','31','5000','7000','5000','7000','11','70964','1','0','0','0','0','0','0','0','0','0','Ancient Skeletal Soldier - Cast Shield Bash'),
('3702201','37022','4','0','100','30','0','0','0','0','11','71140','1','1','0','0','0','0','0','0','0','0','Blighted Abomination - Cast Scourge Hook on Aggro'),
('3702202','37022','9','0','100','31','0','5','3000','5000','11','40504','4','0','0','0','0','0','0','0','0','0','Blighted Abomination - Cast Cleave'),
('3702203','37022','0','0','100','31','16000','21000','12000','18000','11','71140','4','0','0','0','0','0','0','0','0','0','Blighted Abomination - Cast Scourge Hook'),
('3702204','37022','0','0','100','31','5000','11000','24000','32000','11','71150','0','0','0','0','0','0','0','0','0','0','Blighted Abomination - Cast Plague Cloud'),
('3702301','37023','0','0','100','31','10000','16000','12000','18000','11','71103','4','33','0','0','0','0','0','0','0','0','Plague Scientist - Cast Combobulating Spray'),
('3702302','37023','0','0','100','31','4000','9000','8000','11000','11','73079','4','0','0','0','0','0','0','0','0','0','Plague Scientist - Cast Plague Blast'),
('3702303','37023','0','0','100','31','15000','20000','15000','20000','11','69871','4','33','0','0','0','0','0','0','0','0','Plague Scientist - Cast Plague Stream'),
('3703801','37038','9','0','100','31','5','30','5000','10000','11','71164','5','0','0','0','0','0','0','0','0','0','Vengeful Fleshreaper - Cast Leaping Face Maul'),
('3712201','37122','1','0','100','30','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Captain Arnath - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('3712202','37122','4','0','100','2','0','0','0','0','11','71546','1','0','23','1','0','0','0','0','0','0','Captain Arnath (10-Man Normal) - Cast Smite and Set Phase 1 on Aggro'),
('3712203','37122','9','5','100','3','0','40','3400','4800','11','71546','4','0','0','0','0','0','0','0','0','0','Captain Arnath (10-Man Normal) - Cast Smite (Phase 1)'),
('3712204','37122','4','0','100','4','0','0','0','0','11','71547','1','0','23','1','0','0','0','0','0','0','Captain Arnath (25-Man Normal) - Cast Smite and Set Phase 1 on Aggro'),
('3712205','37122','9','5','100','5','0','40','3400','4800','11','71547','4','0','0','0','0','0','0','0','0','0','Captain Arnath (25-Man Normal) - Cast Smite (Phase 1)'),
('3712206','37122','4','0','100','8','0','0','0','0','11','71778','1','0','23','1','0','0','0','0','0','0','Captain Arnath (10-Man Heroic) - Cast Smite and Set Phase 1 on Aggro'),
('3712207','37122','9','5','100','9','0','40','3400','4800','11','71778','4','0','0','0','0','0','0','0','0','0','Captain Arnath (10-Man Heroic) - Cast Smite (Phase 1)'),
('3712208','37122','4','0','100','16','0','0','0','0','11','71779','1','0','23','1','0','0','0','0','0','0','Captain Arnath (25-Man Heroic) - Cast Smite and Set Phase 1 on Aggro'),
('3712209','37122','9','5','100','17','0','40','3400','4800','11','71779','4','0','0','0','0','0','0','0','0','0','Captain Arnath (25-Man Heroic) - Cast Smite (Phase 1)'),
('3712210','37122','3','5','100','30','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Captain Arnath - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('3712211','37122','9','5','100','30','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Captain Arnath - Start Combat Movement at 35 Yards (Phase 1)'),
('3712212','37122','9','5','100','30','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Captain Arnath - Prevent Combat Movement at 15 Yards (Phase 1)'),
('3712213','37122','9','5','100','30','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Captain Arnath - Start Combat Movement Below 5 Yards'),
('3712214','37122','3','3','100','31','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Captain Arnath - Set Phase 1 when Mana is above 15% (Phase 2)'),
('3712215','37122','0','0','100','21','12000','180000','20000','25000','11','14515','5','1','0','0','0','0','0','0','0','0','Captain Arnath (25-Man) - Cast Dominate Mind'),
('3712216','37122','14','0','100','31','50000','60','12000','15000','11','71595','6','1','0','0','0','0','0','0','0','0','Captain Arnath (10-Man) - Cast Flash Heal on Friendlies'),
('3712217','37122','14','0','100','31','500000','60','12000','15000','11','71783','6','1','0','0','0','0','0','0','0','0','Captain Arnath (25-Man) - Cast Flash Heal on Friendlies'),
('3712218','37122','2','0','100','11','50','0','30000','38000','11','71780','0','1','0','0','0','0','0','0','0','0','Captain Arnath (10-Man) - Cast Power Shield at 50% HP'),
('3712219','37122','2','0','100','21','50','0','30000','38000','11','71781','0','1','0','0','0','0','0','0','0','0','Captain Arnath (25-Man) - Cast Power Shield at 50% HP'),
('3712220','37122','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Captain Arnath - Set Phase to 0 on Evade'),
('3712301','37123','9','0','100','31','0','5','5000','8000','11','71549','1','0','0','0','0','0','0','0','0','0','Captain Brandon - Cast Crusader Strike'),
('3712302','37123','0','0','100','31','8000','11000','12000','16000','11','71784','1','1','0','0','0','0','0','0','0','0','Captain Brandon - Cast Hammer of Betrayal'),
('3712303','37123','0','0','100','31','7000','10000','8000','12000','11','71551','4','0','0','0','0','0','0','0','0','0','Captain Brandon - Cast Judgement of Command'),
('3712304','37123','2','0','100','30','25','0','0','0','11','71550','0','1','0','0','0','0','0','0','0','0','Captain Brandon - Cast Divine Shield at 25% HP'),
('3712401','37124','4','0','100','30','0','0','0','0','23','1','0','0','0','0','0','0','0','0','0','0','Captain Grondel - Set Phase 1 on Aggro'),
('3712402','37124','9','0','100','31','8','25','15000','19000','11','71553','5','1','0','0','0','0','0','0','0','0','Captain Groundel - Cast Charge'),
('3712403','37124','0','0','100','31','5000','9000','10000','15000','11','71785','4','0','0','0','0','0','0','0','0','0','Captain Groundel - Cast Conflagration'),
('3712404','37124','0','0','100','31','8000','12000','12000','15000','11','71552','4','1','0','0','0','0','0','0','0','0','Captain Groundel - Cast Mortal Strike'),
('3712405','37124','9','5','100','31','0','5','5000','9000','11','71554','1','0','0','0','0','0','0','0','0','0','Captain Grondel - Cast Sunder Armor (Phase 1)'),
('3712406','37124','24','5','100','31','71554','5','5000','5000','23','1','0','0','0','0','0','0','0','0','0','0','Captain Grondel - Set Phase 2 on Target Max Sunder Armor Aura Stack (Phase 1)'),
('3712407','37124','28','3','100','31','71554','1','5000','5000','23','-1','0','0','0','0','0','0','0','0','0','0','Captain Grondel - Set Phase 1 on Target Missing Sunder Armor Aura Stack (Phase 2)'),
('3712408','37124','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Captain Grondel - Set Phase to 0 on Evade'),
('3712501','37125','0','0','100','31','5000','9000','9000','13000','11','71788','4','0','0','0','0','0','0','0','0','0','Captain Rupert (10-Man) - Cast Machine Gun'),
('3712502','37125','0','0','100','31','5000','9000','9000','13000','11','71789','4','0','0','0','0','0','0','0','0','0','Captain Rupert (25-Man) - Cast Machine Gun'),
('3712503','37125','0','0','100','31','9000','12000','7000','11000','11','71787','4','0','0','0','0','0','0','0','0','0','Captain Rupert - Cast Fel Bomb'),
('3712504','37125','0','0','100','31','16000','24000','18000','26000','11','71786','5','1','0','0','0','0','0','0','0','0','Captain Rupert - Cast Rocket Launch'),
('3712601','37126','4','0','100','30','0','0','0','0','11','71465','0','1','1','-1137','0','0','0','0','0','0','Sister Svalna - Cast Divine Surge and Yell on Aggro'),
('3712602','37126','0','0','100','11','15000','20000','20000','25000','11','71468','0','0','0','0','0','0','0','0','0','0','Sister Svalna (10-Man) - Cast Aether Burst'),
('3712603','37126','0','0','100','21','15000','20000','20000','25000','11','71469','0','0','0','0','0','0','0','0','0','0','Sister Svalna (25-Man) - Cast Aether Burst'),
('3712604','37126','0','0','100','31','25000','30000','60000','70000','11','70196','5','1','11','71463','0','0','0','0','0','0','Sister Svalna - Cast Impaling Spear'),
('3712605','37126','5','0','100','6','0','0','0','0','1','-1138','0','0','0','0','0','0','0','0','0','0','Sister Svalna - Yell on Player Kill'),
('3712606','37126','6','0','100','6','0','0','0','0','1','-1149','-1150','0','0','0','0','0','0','0','0','0','Sister Svalna - Random Yell on Death'),
('3712701','37127','4','0','100','30','0','0','0','0','11','71270','0','1','0','0','0','0','0','0','0','0','Ymirjar Frostbinder - Cast Arctic Chill on Aggro'),
('3712702','37127','0','0','100','31','7000','14000','12000','17000','11','71306','5','0','0','0','0','0','0','0','0','0','Ymirjar Frostbinder - Cast Twisted Winds'),
('3712703','37127','0','0','100','31','15000','20000','15000','20000','11','71274','0','0','0','0','0','0','0','0','0','0','Ymirjar Frostbinder - Cast Frozen Orb'),
('3712901','37129','4','0','100','30','0','0','0','0','39','30','0','0','0','0','0','0','0','0','0','0','Crock Scrougebane - Call for Help on Aggro'),
('3712902','37129','9','0','100','31','0','5','5000','8000','11','71488','1','0','0','0','0','0','0','0','0','0','Crock Scrougebane - Cast Scourge Strike'),
('3712903','37129','0','0','100','31','12000','17000','14000','19000','11','71489','1','1','0','0','0','0','0','0','0','0','Crock Scrougebane - Cast Death Strike'),
('3712904','37129','0','0','100','21','10000','15000','10000','15000','11','71490','4','1','0','0','0','0','0','0','0','0','Crock Scrougebane - Cast Death Coil'),
('3713201','37132','0','0','100','31','14000','21000','17000','24000','11','71258','0','1','0','0','0','0','0','0','0','0','Ymirjar Battle-Maiden - Cast Adrenaline Rush'),
('3713202','37132','9','0','100','31','0','5','5000','8000','11','71257','1','0','0','0','0','0','0','0','0','0','Ymirjar Battle-Maiden - Cast Barbaric Strike'),
('3713301','37133','0','0','100','31','8000','13000','8000','13000','11','41056','0','0','0','0','0','0','0','0','0','0','Ymirjar Warlord - Cast Whirlwind'),
('3713401','37134','1','0','100','30','0','0','0','0','21','0','0','0','20','0','0','0','23','1','0','0','Ymirjar Huntress - Prevent Combat Movement and Prevent Melee and Set Phase 1 on Spawn'),
('3713402','37134','1','0','100','30','3000','3000','0','0','11','71705','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Summon Warhawk OOC'),
('3713403','37134','9','1','100','31','5','35','2300','3900','11','71253','4','0','40','2','0','0','0','0','0','0','Ymirjar Huntress - Cast Shoot and Set Ranged Weapon Model (Phase 1)'),
('3713404','37134','9','1','100','31','10','40','9000','14000','11','71252','5','0','40','2','0','0','0','0','0','0','Ymirjar Huntress - Cast Volley and Set Ranged Weapon Model (Phase 1)'),
('3713405','37134','0','1','100','31','12000','16000','14000','18000','11','71251','4','1','40','2','0','0','0','0','0','0','Ymirjar Huntress - Cast Rapid Shot and Set Ranged Weapon Model (Phase 1)'),
('3713406','37134','9','1','100','31','30','80','0','0','21','1','1','0','20','1','0','0','0','0','0','0','Ymirjar Huntress - Start Combat Movement and Start Melee at 25 Yards (Phase 1)'),
('3713407','37134','9','1','100','31','0','10','0','0','21','1','0','0','40','1','0','0','20','1','0','0','Ymirjar Huntress - Start Combat Movement and Set Melee Weapon Model and Start Melee Below 10 Yards (Phase 1)'),
('3713408','37134','9','1','100','31','11','25','0','0','21','0','1','0','20','0','0','0','0','0','0','0','Ymirjar Huntress - Prevent Combat Movement and Prevent Melee at 25 Yards (Phase 1)'),
('3713409','37134','0','0','100','31','5000','10000','7000','14000','11','71249','0','0','0','0','0','0','0','0','0','0','Ymirjar Huntress - Cast Ice Trap'),
('3713410','37134','7','0','100','30','0','0','0','0','22','1','0','0','40','1','0','0','21','0','0','0','Ymirjar Huntress - Set Phase to 1 and Set Melee Weapon Model and Prevent Combat Movement on Evade'),
('3723001','37230','0','0','100','31','5000','7000','5000','7000','11','70361','3','0','0','0','0','0','0','0','0','0','Spire Frostwyrm - Cast Cleave'),
('3723002','37230','0','0','100','7','20000','25000','20000','25000','11','70116','4','0','0','0','0','0','0','0','0','0','Spire Frostwyrm (10-Man) - Cast Frost Breath'),
('3723003','37230','0','0','100','25','20000','25000','20000','25000','11','72641','4','0','0','0','0','0','0','0','0','0','Spire Frostwyrm (25-Man) - Cast Frost Breath'),
('3723004','37230','0','0','100','7','15000','20000','15000','20000','11','70362','4','0','0','0','0','0','0','0','0','0','Spire Frostwyrm (10-Man) - Cast Blizzard'),
('3723005','37230','0','0','100','25','15000','20000','15000','20000','11','71118','4','0','0','0','0','0','0','0','0','0','Spire Frostwyrm (25-Man) - Cast Blizzard'),
('3723006','37230','2','0','100','30','10','0','0','0','11','47008','0','1','0','0','0','0','0','0','0','0','Spire Frostwyrm - Cast Enrage at 10% HP'),
('3753101','37531','0','0','100','11','6000','12000','8000','14000','11','71337','0','0','0','0','0','0','0','0','0','0','Frostwarden Handler (10-Man) - Cast Concussive Shock'),
('3753102','37531','0','0','100','21','6000','12000','8000','14000','11','71338','0','0','0','0','0','0','0','0','0','0','Frostwarden Handler (25-Man) - Cast Concussive Shock'),
('3753201','37532','0','0','100','31','3000','5000','15000','19000','11','71350','4','1','0','0','0','0','0','0','0','0','Frostwing Whelp - Cast Focus Fire'),
('3753202','37532','0','0','100','11','6000','9000','4000','7000','11','71361','4','0','0','0','0','0','0','0','0','0','Frostwing Whelp (10-Man) - Cast Frost Blast'),
('3753203','37532','0','0','100','21','6000','9000','4000','7000','11','71362','4','0','0','0','0','0','0','0','0','0','Frostwing Whelp (25-Man) - Cast Frost Blast'),
('3754401','37544','0','0','100','31','3000','5000','6000','9000','11','70189','4','0','0','0','0','0','0','0','0','0','Spire Gargoyle - Cast Poison Spit'),
('3754501','37545','9','0','100','31','0','5','6000','9000','11','70396','1','0','0','0','0','0','0','0','0','0','Spire Minion - Cast Ghoul Slash'),
('3754502','37545','2','0','100','31','50','0','15000','24000','11','70363','4','1','0','0','0','0','0','0','0','0','Spire Minion - Cast Cannibalize at 50% HP'),
('3754601','37546','0','0','100','31','3000','5000','3000','5000','11','70191','1','0','0','0','0','0','0','0','0','0','Frenzied Abomination - Cast Abomination Cleave'),
('3754602','37546','2','0','100','30','10','0','0','0','11','70371','0','0','0','0','0','0','0','0','0','0','Frenzied Abomination - Cast Enrage at 10% HP'),
('3757101','37571','0','0','100','11','5000','9000','6000','11000','11','72057','4','0','0','0','0','0','0','0','0','0','Darkfallen Advisor (10-Man) - Cast Lich Slap'),
('3757102','37571','0','0','100','21','5000','9000','6000','11000','11','72421','4','0','0','0','0','0','0','0','0','0','Darkfallen Advisor (25-Man) - Cast Lich Slap'),
('3757103','37571','16','0','100','31','72066','40','10000','20000','11','72066','6','1','0','0','0','0','0','0','0','0','Darkfallen Advisor - Cast Shroud of Spell Warding on Friendlies'),
('3757104','37571','16','0','100','31','72065','50','10000','20000','11','72065','6','1','0','0','0','0','0','0','0','0','Darkfallen Advisor - Cast Shroud of Protection on Friendlies'),
('3759501','37595','4','0','100','30','0','0','0','0','11','71736','0','1','0','0','0','0','0','0','0','0','Darkfallen Blood Knight - Cast Vampiric Aura on Aggro'),
('3759502','37595','9','0','100','31','0','5','3000','6000','11','70437','1','0','0','0','0','0','0','0','0','0','Darkfallen Blood Knight - Cast Unholy Strike'),
('3759503','37595','0','0','100','31','8000','13000','8000','14000','11','70450','1','0','0','0','0','0','0','0','0','0','Darkfallen Blood Knight - Cast Blood Mirror'),  -- Unknown What This Spell Even Does (Might Be Part Of Event?)
('3766201','37662','4','0','100','30','0','0','0','0','11','70750','0','1','0','0','0','0','0','0','0','0','Darkfallen Commander - Cast Battle Shout on Aggro'),
('3766202','37662','0','0','100','11','2000','5000','12000','17000','11','70449','4','0','0','0','0','0','0','0','0','0','Darkfallen Commander (10-Man) - Cast Vampire Rush'),
('3766203','37662','0','0','100','21','2000','5000','12000','17000','11','71155','4','0','0','0','0','0','0','0','0','0','Darkfallen Commander (25-Man) - Cast Vampire Rush'),
('3766301','37663','1','0','100','30','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Darkfallen Noble - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('3766302','37663','4','0','100','10','0','0','0','0','11','72960','1','0','23','1','0','0','0','0','0','0','Darkfallen Noble (10-Man) - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('3766303','37663','9','13','100','11','0','40','4000','6000','11','72960','4','0','0','0','0','0','0','0','0','0','Darkfallen Noble (10-Man) - Cast Shadow Bolt (Phase 1)'),
('3766304','37663','4','0','100','20','0','0','0','0','11','72961','1','0','23','1','0','0','0','0','0','0','Darkfallen Noble (25-Man) - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('3766305','37663','9','13','100','21','0','40','4000','6000','11','72961','4','0','0','0','0','0','0','0','0','0','Darkfallen Noble (25-Man) - Cast Shadow Bolt (Phase 1)'),
('3766306','37663','3','13','100','30','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Darkfallen Noble - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('3766307','37663','9','13','100','30','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Start Combat Movement at 35 Yards (Phase 1)'),
('3766308','37663','9','13','100','30','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Prevent Combat Movement at 15 Yards (Phase 1)'),
('3766309','37663','9','13','100','30','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Start Combat Movement Below 5 Yards'),
('3766310','37663','3','11','100','31','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Set Phase 1 when Mana is above 15% (Phase 2)'),
('3766311','37663','0','0','100','31','7000','12000','13000','17000','11','70645','5','1','0','0','0','0','0','0','0','0','Darkfallen Noble - Cast Chains of Shadow'),
('3766312','37663','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Noble - Set Phase to 0 on Evade');
REPLACE INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
('3766401','37664','1','0','100','30','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Darkfallen Archmage - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('3766402','37664','4','0','100','10','0','0','0','0','11','70409','1','0','23','1','0','0','0','0','0','0','Darkfallen Archmage (10-Man) - Cast Fireball and Set Phase 1 on Aggro'),
('3766403','37664','9','5','100','11','0','40','9000','13000','11','70409','1','0','0','0','0','0','0','0','0','0','Darkfallen Archmage (10-Man) - Cast Fireball (Phase 1)'),
('3766404','37664','4','0','100','20','0','0','0','0','11','71153','1','0','23','1','0','0','0','0','0','0','Darkfallen Archmage (25-Man) - Cast Fireball and Set Phase 1 on Aggro'),
('3766405','37664','9','5','100','21','0','40','9000','13000','11','71153','1','0','0','0','0','0','0','0','0','0','Darkfallen Archmage (25-Man) - Cast Fireball (Phase 1)'),
('3766406','37664','3','5','100','30','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Darkfallen Archmage - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('3766407','37664','9','5','100','30','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Start Combat Movement at 35 Yards (Phase 1)'),
('3766408','37664','9','5','100','30','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Prevent Combat Movement at 15 Yards (Phase 1)'),
('3766409','37664','9','5','100','30','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Start Combat Movement Below 5 Yards'),
('3766410','37664','3','3','100','31','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Set Phase 1 when Mana is above 15% (Phase 2)'),
('3766411','37664','9','0','100','11','0','8','7000','11000','11','70407','0','1','0','0','0','0','0','0','0','0','Darkfallen Archmage (10-Man) - Cast Blast Wave'),
('3766412','37664','9','0','100','21','0','8','7000','11000','11','71151','0','1','0','0','0','0','0','0','0','0','Darkfallen Archmage (25-Man) - Cast Blast Wave'),
('3766413','37664','0','0','100','11','5000','12000','25000','35000','11','70408','4','32','0','0','0','0','0','0','0','0','Darkfallen Archmage (10-Man) - Cast Amplify Magic'),
('3766414','37664','0','0','100','21','5000','12000','25000','35000','11','72336','4','32','0','0','0','0','0','0','0','0','Darkfallen Archmage (25-Man) - Cast Amplify Magic'),
('3766415','37664','0','0','100','31','10000','16000','15000','21000','11','70410','5','1','0','0','0','0','0','0','0','0','Darkfallen Archmage - Cast Polymorph Spider'),
('3766416','37664','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Darkfallen Archmage - Set Phase to 0 on Evade'),
('3766501','37665','0','0','100','11','5000','9000','8000','13000','11','70435','1','0','0','0','0','0','0','0','0','0','Darkfallen Lieutenant (10-Man) - Cast Rend Flesh'),
('3766502','37665','0','0','100','21','5000','9000','8000','13000','11','71154','1','0','0','0','0','0','0','0','0','0','Darkfallen Lieutenant (25-Man) - Cast Rend Flesh'),
('3766503','37665','0','0','100','31','4000','9000','20000','27000','11','70423','1','1','0','0','0','0','0','0','0','0','Darkfallen Lieutenant - Cast Vampiric Curse'),
('3766601','37666','9','0','100','31','0','5','6000','11000','11','70437','1','0','0','0','0','0','0','0','0','0','Darkfallen Tactician - Cast Unholy Strike'),
('3766602','37666','0','0','100','31','7000','12000','12000','16000','11','70432','5','1','0','0','0','0','0','0','0','0','Darkfallen Tactician - Cast Blood Sap'),
('3766603','37666','9','0','100','31','10','30','16000','24000','11','70431','0','1','0','0','0','0','0','0','0','0','Darkfallen Tactician - Cast Shadowstep'),
('3786301','37863','1','0','100','30','3000','3000','0','0','11','70588','0','0','0','0','0','0','0','0','0','0','Suppresser - Cast Suppression OOC'),
('3786302','37863','4','0','100','30','0','0','0','0','11','70588','0','0','0','0','0','0','0','0','0','0','Suppresser - Cast Suppression on Aggro'),
('3786801','37868','0','0','100','3','1000','3000','14000','21000','11','70759','4','0','0','0','0','0','0','0','0','0','Risen Archmage (10-Man Normal) - Cast Frostbolt Volley'),
('3786802','37868','0','0','100','5','1000','3000','14000','21000','11','71889','4','0','0','0','0','0','0','0','0','0','Risen Archmage (25-Man Normal) - Cast Frostbolt Volley'),
('3786803','37868','0','0','100','9','1000','3000','14000','21000','11','72015','4','0','0','0','0','0','0','0','0','0','Risen Archmage (10-Man Heroic) - Cast Frostbolt Volley'),
('3786804','37868','0','0','100','17','1000','3000','7000','21000','11','72016','4','0','0','0','0','0','0','0','0','0','Risen Archmage (25-Man Heroic) - Cast Frostbolt Volley'),
('3786805','37868','0','0','100','11','20000','30000','30000','38000','11','71179','0','1','0','0','0','0','0','0','0','0','Risen Archmage (10-Man) - Cast Mana Void'),
('3786806','37868','0','0','100','21','20000','30000','30000','38000','11','71741','0','1','0','0','0','0','0','0','0','0','Risen Archmage (25-Man) - Cast Mana Void'),
('3788601','37886','6','0','100','2','0','0','0','0','11','70633','0','7','0','0','0','0','0','0','0','0','Gluttonous Abomination (10-Man Normal) - Cast Gut Spray on Death'),
('3788602','37886','6','0','100','4','0','0','0','0','11','71283','0','7','0','0','0','0','0','0','0','0','Gluttonous Abomination (25-Man Normal) - Cast Gut Spray on Death'),
('3788603','37886','6','0','100','8','0','0','0','0','11','72025','0','7','0','0','0','0','0','0','0','0','Gluttonous Abomination (10-Man Heroic) - Cast Gut Spray on Death'),
('3788604','37886','6','0','100','16','0','0','0','0','11','72026','0','7','0','0','0','0','0','0','0','0','Gluttonous Abomination (25-Man Heroic) - Cast Gut Spray on Death'),
('3789001','37890','11','0','100','30','0','0','0','0','11','12980','0','0','0','0','0','0','0','0','0','0','Cult Fanatic - Cast Simple Teleport on Spawn'),
('3789002','37890','0','0','100','31','2000','5000','3000','6000','11','70670','1','0','0','0','0','0','0','0','0','0','Cult Fanatic - Cast Shadow Cleave'),
('3789003','37890','0','0','100','31','4000','7000','5000','9000','11','70659','1','0','0','0','0','0','0','0','0','0','Cult Fanatic - Cast Necrotic Strike'),
('3789004','37890','8','0','100','30','70897','-1','0','0','11','71236','0','1','0','0','0','0','0','0','0','0','Cult Fanatic - Cast Dark Martyrdom on Dark Martyrdom Spell Hit'),
('3789005','37890','8','0','100','30','71236','-1','0','0','11','70958','0','2','37','0','0','0','0','0','0','0','Cult Fanatic - Cast Summon Reanimated Fanatic and Die on Dark Martyrdom Spell Hit'),
('3789006','37890','8','0','100','30','70895','-1','0','0','11','70900','0','1','0','0','0','0','0','0','0','0','Cult Fanatic - Cast Dark Transformation on Dark Transformation Spell Hit'),
('3789007','37890','8','0','100','30','70900','-1','0','0','11','70674','0','2','11','17683','0','2','36','38135','0','0','Cult Fanatic - Cast Vampiric Might and Full Heal and Update Entry on Dark Transformation Spell Hit'),
('3793401','37934','4','0','100','30','0','0','0','0','11','70749','0','0','0','0','0','0','0','0','0','0','Blistering Zombies - Cast Corrosion on Aggro'),
('3793402','37934','6','0','100','2','0','0','0','0','11','70744','0','7','0','0','0','0','0','0','0','0','Blistering Zombies (10-Man Normal) - Cast Acid Burst on Death'),
('3793403','37934','6','0','100','4','0','0','0','0','11','71733','0','7','0','0','0','0','0','0','0','0','Blistering Zombies (25-Man Normal) - Cast Acid Burst on Death'),
('3793404','37934','6','0','100','8','0','0','0','0','11','72017','0','7','0','0','0','0','0','0','0','0','Blistering Zombies (10-Man Heroic) - Cast Acid Burst on Death'),
('3793405','37934','6','0','100','16','0','0','0','0','11','72018','0','7','0','0','0','0','0','0','0','0','Blistering Zombies (25-Man Heroic) - Cast Acid Burst on Death'),
('3794901','37949','11','0','100','30','0','0','0','0','11','12980','0','0','0','0','0','0','0','0','0','0','Cult Adherent - Cast Simple Teleport on Spawn'),
('3794902','37949','0','0','100','31','3000','7000','5000','12000','11','71129','4','0','0','0','0','0','0','0','0','0','Cult Adherent - Cast Frost Fever'),
('3794903','37949','0','0','100','31','10000','15000','15000','20000','11','71237','4','0','0','0','0','0','0','0','0','0','Cult Adherent - Cast Curse of Torpor'),
('3794904','37949','0','0','100','31','3000','5000','3000','5000','11','70594','4','0','0','0','0','0','0','0','0','0','Cult Adherent - Cast Deathchill Bolt'),
('3794905','37949','8','0','100','30','70897','-1','0','0','11','70903','0','1','0','0','0','0','0','0','0','0','Cult Adherent - Cast Dark Martyrdom on Dark Martyrdom Spell Hit'),
('3794906','37949','8','0','100','30','70903','-1','0','0','11','70962','0','2','37','0','0','0','0','0','0','0','Cult Adherent - Cast Summon Reanimated Adherent and Die on Dark Martyrdom Spell Hit'),
('3794907','37949','8','0','100','30','70896','-1','0','0','11','70901','0','1','0','0','0','0','0','0','0','0','Cult Adherent - Cast Dark Empowerment on Dark Empowerment Spell Hit'),
('3794908','37949','8','0','100','30','70901','-1','0','0','36','38136','0','0','23','1','0','0','11','17683','0','2','Cult Adherent - Update Entry, Increase Phase and Cast Full Heal on Dark Empowerment Spell Hit'),
('3794909','37949','0','1','100','31','10000','15000','10000','15000','11','70906','0','0','0','0','0','0','0','0','0','0','Cult Adherent (Phase 1) - Cast Deathchill Blast'),
('3794910','37949','2','1','100','31','30','0','60000','60000','11','70768','0','0','0','0','0','0','0','0','0','0','Cult Adherent (Phase 1) - Cast Shroud of the Occult on Health Check'),
('3800901','38009','11','0','100','30','0','0','0','0','11','71235','0','0','0','0','0','0','0','0','0','0','Reanimated Fanatic - Cast Fanatic\'s Determination on Spawn'),
('3800902','38009','0','0','100','31','2000','5000','3000','6000','11','70670','1','0','0','0','0','0','0','0','0','0','Reanimated Fanatic - Cast Shadow Cleave'),
('3800903','38009','0','0','100','31','4000','7000','5000','9000','11','70659','1','0','0','0','0','0','0','0','0','0','Reanimated Fanatic - Cast Necrotic Strike'),
('3801001','38010','11','0','100','30','0','0','0','0','11','71234','0','0','0','0','0','0','0','0','0','0','Reanimated Adherent - Cast Adherent\'s Determination on Spawn'),
('3801002','38010','0','0','100','31','3000','7000','5000','12000','11','71129','4','0','0','0','0','0','0','0','0','0','Reanimated Adherent - Cast Frost Fever'),
('3801003','38010','0','0','100','31','10000','15000','10000','15000','11','71237','4','0','0','0','0','0','0','0','0','0','Reanimated Adherent - Cast Curse of Torpor'),
('3801004','38010','0','0','100','31','3000','5000','3000','5000','11','70594','4','0','0','0','0','0','0','0','0','0','Reanimated Adherent - Cast Deathchill Bolt'),
('3806801','38068','1','0','100','30','1000','1000','0','0','11','71085','0','0','0','0','0','0','0','0','0','0','Mana Void - Cast Mana Void on Spawn'),
('3812501','38125','1','0','100','30','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Ymirjar Deathbringer - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('3812502','38125','4','0','100','10','0','0','0','0','11','71296','1','0','23','1','0','0','0','0','0','0','Ymirjar Deathbringer (10-Man) - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('3812503','38125','9','13','100','11','0','40','3400','4800','11','71296','1','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer (10-Man) - Cast Shadow Bolt (Phase 1)'),
('3812504','38125','4','0','100','20','0','0','0','0','11','71297','1','0','23','1','0','0','0','0','0','0','Ymirjar Deathbringer (25-Man) - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('3812505','38125','9','13','100','21','0','40','3400','4800','11','71297','1','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer (25-Man) - Cast Shadow Bolt (Phase 1)'),
('3812506','38125','3','13','100','30','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Ymirjar Deathbringer - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('3812507','38125','9','13','100','30','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Start Combat Movement at 35 Yards (Phase 1)'),
('3812508','38125','9','13','100','30','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Prevent Combat Movement at 15 Yards (Phase 1)'),
('3812509','38125','9','13','100','30','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Start Combat Movement Below 5 Yards'),
('3812510','38125','3','11','100','31','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Set Phase 1 when Mana is above 15% (Phase 2)'),
('3812511','38125','0','0','100','31','4000','6000','6000','8000','11','71298','5','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Cast Banish'),
('3812512','38125','16','0','100','31','69929','40','35000','50000','11','69929','6','1','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Cast Spirit Stream on Friendlies'),
('3812513','38125','2','0','100','11','50','0','18000','25000','11','71299','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer (10-Man) - Cast Death\'s Embrace at 50% HP'),
('3812514','38125','2','0','100','21','50','0','18000','25000','11','71300','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer (25-Man) - Cast Death\'s Embrace at 50% HP'),
('3812515','38125','2','0','100','30','50','0','0','0','11','71303','0','1','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Cast Summon Ymirjar at 50% HP'),
('3812516','38125','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Ymirjar Deathbringer - Set Phase to 0 on Evade'),
('3816301','38163','11','0','100','30','0','0','0','0','11','71267','0','0','0','0','0','0','0','0','0','0','Swarming Shadows - Cast Swarming Shadows on Spawn'),
('3822201','38222','11','0','100','30','0','0','0','0','11','71494','0','0','0','0','0','0','0','0','0','0','Vengeful Shade - Cast Vengeful Blast on Spawn'),
('3822202','38222','0','0','100','30','5000','5000','0','0','37','0','0','0','0','0','0','0','0','0','0','0','Vengeful Shade - Die after 5 seconds'),
('3824801','38248','4','0','100','30','0','0','0','0','11','71443','3','0','0','0','0','0','0','0','0','0','Impaling Spear - Cast Impaling Spear on Aggro'),
('3824802','38248','6','0','100','30','0','0','0','0','28','1','71443','0','0','0','0','0','0','0','0','0','Impaling Spear - Remove Impaling Spear on Death'),
('3842201','38422','11','0','100','30','0','0','0','0','11','72633','0','0','0','0','0','0','0','0','0','0','Shock Vortex - Cast Shock Vortex on Spawn'),
('3842202','38422','1','0','100','30','7000','7000','0','0','11','71945','0','0','0','0','0','0','0','0','0','0','Shock Vortex - Cast Shock Vortex'),
('3849001','38490','0','0','100','31','10000','13000','10000','13000','11','64652','0','0','0','0','0','0','0','0','0','0','Rotting Frost Giant - Cast Stomp'),
('3849002','38490','0','0','100','31','20000','30000','20000','30000','11','72865','4','33','0','0','0','0','0','0','0','0','Rotting Frost Giant - Cast Death Plague'),
('3849003','38490','2','0','100','30','10','0','0','0','11','47008','0','1','0','0','0','0','0','0','0','0','Rotting Frost Giant - Cast Enrage at 10% HP'),
('3849401','38494','0','0','100','31','10000','13000','10000','13000','11','64652','0','0','0','0','0','0','0','0','0','0','Rotting Frost Giant - Cast Stomp'),
('3849402','38494','0','0','100','31','20000','30000','20000','30000','11','72865','4','33','0','0','0','0','0','0','0','0','Rotting Frost Giant - Cast Death Plague'),
('3849403','38494','2','0','100','30','10','0','0','0','11','47008','0','1','0','0','0','0','0','0','0','0','Rotting Frost Giant - Cast Enrage at 10% HP'),
('3850801','38508','11','0','100','30','0','0','0','0','21','0','0','0','20','0','0','0','0','0','0','0','Blood Beast - Prevent Combat Movement and Auto Attack on Spawn'),
('3850802','38508','0','0','100','30','3000','3000','0','0','20','1','0','0','21','1','0','0','38','0','0','0','Blood Beast - Enable Combat Movement and Auto Attack and Set in Combat with Zone'),
('1700701','17007','11','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Lady Keira Berrybuck - Prevent Combat Movement on Spawned'),
('1700702','17007','4','0','100','2','0','0','0','0','11','29381','0','0','0','0','0','0','0','0','0','0','Lady Keira Berrybuck - Cast Greater Blessing of Might on Aggro'),
('1700703','17007','14','0','100','3','0','50','7000','13000','11','29380','6','0','0','0','0','0','0','0','0','0','Lady Keira Berrybuck - Cast Cleanse on Friendly HP'),
('1700704','17007','2','0','100','3','30','0','30000','30000','11','29382','0','0','0','0','0','0','0','0','0','0','Lady Keira Berrybuck - Cast Divine Shield'),
('1700705','17007','14','0','100','35','0','0','10000','15000','11','29383','0','0','11','29562','0','0','0','0','0','0','Lady Keira Berrybuck - Cast Holy Light'),
('1700706','17007','9','0','100','3','20','35','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Lady Keira Berrybuck - Start Combat Movement on Ranged Check'),
('1700707','17007','9','0','100','3','0','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Lady Keira Berrybuck - Prevent Combat Movement on Ranged Check'),
('1700708','17007','21','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Lady Keira Berrybuck - Prevent Combat Movement on Reached Home'),
('1716701','17167','0','0','100','3','2000','5000','2000','5000','11','31012','1','0','0','0','0','0','0','0','0','0','Conjured Elemental - Cast Water Bolt'),
('1987201','19872','11','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Lady Catriona Von\'Indi - Prevent Combat Movement on Spawned'),
('1987202','19872','15','0','100','3','0','50','11000','15000','11','15090','6','0','0','0','0','0','0','0','0','0','Lady Catriona Von\'Indi - Cast Dispel Magic on Friendly CC'),
('1987203','19872','14','0','100','3','0','50','4000','9000','11','29564','6','0','0','0','0','0','0','0','0','0','Lady Catriona Von\'Indi - Cast Greater Heal on Friendly HP'),
('1987204','19872','0','0','100','3','5000','7000','17000','22000','11','29563','4','0','0','0','0','0','0','0','0','0','Lady Catriona Von\'Indi - Cast Holy Fire'),
('1987205','19872','0','0','100','3','1000','3000','15000','25000','11','29408','0','0','0','0','0','0','0','0','0','0','Lady Catriona Von\'Indi - Cast Power Word: Shield'),
('1987206','19872','9','0','100','3','20','35','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Lady Catriona Von\'Indi - Start Combat Movement on Ranged Check'),
('1987207','19872','9','0','100','3','0','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Lady Catriona Von\'Indi - Prevent Combat Movement on Ranged Check'),
('1987208','19872','21','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Lady Catriona Von\'Indi - Prevent Combat Movement on Reached Home'),
('1987301','19873','0','0','100','3','6000','7000','10000','12000','11','8379','1','0','0','0','0','0','0','0','0','0','Lord Crispin Ference - Cast Disarm'),
('1987302','19873','0','0','100','3','8000','10000','7000','11000','11','29567','1','0','0','0','0','0','0','0','0','0','Lord Crispin Ference - Cast Heroic Strike'),
('1987303','19873','0','0','100','3','7000','9000','11000','14000','11','11972','1','0','0','0','0','0','0','0','0','0','Lord Crispin Ference - Cast Shield Bash'),
('1987304','19873','0','0','100','3','1000','3000','18000','25000','11','29390','0','0','0','0','0','0','0','0','0','0','Lord Crispin Ference - Cast Shield Wall'),
('1987401','19874','0','0','100','3','1000','3000','7000','12000','11','13005','1','0','0','0','0','0','0','0','0','0','Baron Rafe Dreuger - Cast Hammer of Justice'),
('1987402','19874','0','0','100','3','25000','30000','25000','30000','11','29386','0','0','0','0','0','0','0','0','0','0','Baron Rafe Dreuger - Cast Judgement of Command'),
('1987403','19874','0','0','100','3','7000','9000','30000','35000','11','29385','0','0','0','0','0','0','0','0','0','0','Baron Rafe Dreuger - Cast Seal of Command'),
('1987501','19875','11','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Baroness Dorothea Millstipe - Prevent Combat Movement on Spawned'),
('1987502','19875','4','0','100','2','0','0','0','0','11','29406','0','0','0','0','0','0','0','0','0','0','Baroness Dorothea Millstipe - Cast Shadowform on Aggro'),
('1987503','19875','0','0','100','3','1000','1000','5000','12000','11','29570','4','0','0','0','0','0','0','0','0','0','Baroness Dorothea Millstipe - Cast Mind Flay'),
('1987504','19875','0','0','100','3','7000','8000','5000','10000','11','29405','4','0','0','0','0','0','0','0','0','0','Baroness Dorothea Millstipe - Cast Mana Burn'),
('1987505','19875','9','0','100','3','20','35','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Baroness Dorothea Millstipe - Start Combat Movement on Ranged Check'),
('1987506','19875','9','0','100','3','0','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Baroness Dorothea Millstipe - Prevent Combat Movement on Ranged Check'),
('1987507','19875','21','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Baroness Dorothea Millstipe - Prevent Combat Movement on Reached Home'),
('1987601','19876','0','0','100','3','5000','7000','7000','11000','11','9080','1','0','0','0','0','0','0','0','0','0','Lord Robin Daris - Cast Hamstring'),
('1987602','19876','0','0','100','3','8000','10000','14000','18000','11','29572','1','0','0','0','0','0','0','0','0','0','Lord Robin Daris - Cast Mortal Strike'),
('1987603','19876','0','0','100','3','15000','20000','15000','20000','11','29573','0','0','0','0','0','0','0','0','0','0','Lord Robin Daris - Cast Whirlwind'),
('1623601','16236','11','0','100','6','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Eye Stalk - Prevent Combat Movement on Spawn'),
('1623602','16236','0','0','100','3','5000','7000','14000','17000','11','29407','1','0','0','0','0','0','0','0','0','0','Eye Stalk (Normal) - Cast Mind Flay'),
('1623603','16236','0','0','100','5','5000','7000','14000','17000','11','54805','1','0','0','0','0','0','0','0','0','0','Eye Stalk (Heroic) - Cast Mind Flay'),
('1636001','16360','0','0','100','7','5000','9000','12000','17000','11','29306','1','0','0','0','0','0','0','0','0','0','Zombie Chow - Cast Infected Wound'),
('2004001','20040','4','0','100','2','0','0','0','0','11','35035','0','0','0','0','0','0','0','0','0','0','Crystalcore Devastator - Cast Countercharge on Aggro'),
('2004002','20040','0','0','100','3','25000','25000','23000','23000','11','37102','1','0','0','0','0','0','0','0','0','0','Crystalcore Devastator - Cast Knock Away'),
('2004003','20040','2','0','100','2','5','0','0','0','11','34937','0','0','0','0','0','0','0','0','0','0','Crystalcore Devastator - Cast Powered Down on Health Check'),
('2424001','24240','11','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Alyson Antille - Prevent Combat Movement on Spawned'),
('2424002','24240','9','0','100','3','0','6','60000','60000','11','33390','0','0','0','0','0','0','0','0','0','0','Alyson Antille - Cast Arcane Torrent on Range Check'),
('2424003','24240','15','0','100','3','0','40','10000','12000','11','43577','6','0','0','0','0','0','0','0','0','0','Alyson Antille - Cast Dispel Magic on Friendly CC'),
('2424004','24240','14','0','100','3','30000','80','2000','3000','11','43575','6','0','0','0','0','0','0','0','0','0','Alyson Antille - Cast Flash Heal on Friendly HP'),
('2424005','24240','9','0','100','3','25','60','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Alyson Antille - Start Combat Movement at 25 Yards'),
('2424006','24240','9','0','100','3','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Alyson Antille - Prevent Combat Movement at 15 Yards'),
('2424007','24240','21','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Alyson Antille - Prevent Combat Movement on Reached Home'),
('2424101','24241','0','0','100','3','10000','12000','10000','12000','11','15496','1','0','0','0','0','0','0','0','0','0','Thurg - Cast Cleave'),
('2424102','24241','16','0','100','3','43578','50','12000','15000','11','43578','6','0','0','0','0','0','0','0','0','0','Thurg - Cast Bloodlust on Friendly Missing Buff'),
('2424201','24242','11','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Slither - Prevent Combat Movement on Spawned'),
('2424202','24242','0','0','100','3','2000','4000','2000','4000','11','43579','4','0','0','0','0','0','0','0','0','0','Slither - Cast Venom Spit'),
('2424203','24242','9','0','100','3','25','60','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Slither - Start Combat Movement at 25 Yards'),
('2424204','24242','9','0','100','3','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Slither - Prevent Combat Movement at 15 Yards'),
('2424205','24242','21','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Slither - Prevent Combat Movement on Reached Home'),
('2424301','24243','0','0','100','3','8000','12000','8000','12000','11','43582','0','0','0','0','0','0','0','0','0','0','Lord Raadan - Cast Flame Breath'),
('2424302','24243','9','0','100','3','0','5','12000','13000','11','43583','0','0','0','0','0','0','0','0','0','0','Lord Raadan - Cast Thunderclap on Range Check'),
('2424401','24244','11','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Gazakroth - Prevent Combat Movement on Spawned'),
('2424402','24244','0','0','100','3','1000','2000','1000','2000','11','43584','4','0','0','0','0','0','0','0','0','0','Gazakroth - Cast Firebolt'),
('2424403','24244','9','0','100','3','25','60','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Gazakroth - Start Combat Movement at 25 Yards'),
('2424404','24244','9','0','100','3','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Gazakroth - Prevent Combat Movement at 15 Yards'),
('2424405','24244','21','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Gazakroth - Prevent Combat Movement on Reached Home'),
('2424501','24245','0','0','100','3','12000','15000','12000','15000','11','43586','4','0','0','0','0','0','0','0','0','0','Fenstalker - Cast Volatile Infection'),
('2424601','24246','9','0','100','3','0','5','8000','12000','11','43590','0','0','0','0','0','0','0','0','0','0','Darkheart - Cast Psychic Wail on Range Check'),
('2424701','24247','0','0','100','3','12000','15000','12000','15000','11','43593','4','0','0','0','0','0','0','0','0','0','Koragg - Cast Cold Stare'),
('2424702','24247','0','0','100','3','10000','12000','10000','12000','11','43592','1','0','0','0','0','0','0','0','0','0','Koragg - Cast Mighty Blow'),
('2453001','24530','0','0','100','3','1500','1500','9000','13000','11','43356','1','0','0','0','0','0','0','0','0','0','Amani Elder Lynx - Cast Pounce'),
('2453003','24530','2','0','100','3','30','0','90000','90000','11','34970','0','0','1','-46','0','0','0','0','0','0','Amani Elder Lynx - Cast Enrage at 30% HP'),
('1137301','11373','0','0','100','3','5000','8000','7000','11000','11','24097','1','0','0','0','0','0','0','0','0','0','Razzashi Cobra - Cast Poison'),
('1137302','11373','0','0','100','3','8000','13000','10000','15000','11','27919','4','0','0','0','0','0','0','0','0','0','Razzashi Cobra - Cast Spit');
UPDATE creature_template SET AIName='' WHERE entry IN (23035,21818,29983,36612,36626,36627,36678,36789,36855,37755,37813,37970,37972,37973,38004);
UPDATE creature_template SET AIName='EventAI' WHERE entry IN (3057,3695,4949,8530,8531,8532,11373,16360,17007,17167,17848,17862,18096,18327,18431,19872,19873,19874,19875,19876,20040,21181,21306,21403,21686,21687,21698,21875,22009,22140,23123,23134,23135,23467,23469,24240,24241,24242,24243,24244,24245,24246,24247,24715,27386,27392,29680,34605,37890,37949,38009,38010,38163,38222,38422,38508);

# NeatElves
UPDATE `gameobject_template` SET `flags`='4', `data1`='178104' WHERE `entry`=178105;
UPDATE `gameobject_template` SET `flags`='4', `data1`='178104' WHERE `entry`=178106;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 178105;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 178106;
DELETE FROM `gameobject` WHERE `guid` = 42804;
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14415', '15', 'Resonite Crystal');
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
(42808, 14415, 0, 'Resonite Crystal'),
(42809, 14415, 0, 'Resonite Crystal'),
(42803, 14415, 0, 'Resonite Crystal'),
(42807, 14415, 0, 'Resonite Crystal'),
(42796, 14415, 0, 'Resonite Crystal'),
(42794, 14415, 0, 'Resonite Crystal'),
(42798, 14415, 0, 'Resonite Crystal'),
(42810, 14415, 0, 'Resonite Crystal'),
(42806, 14415, 0, 'Resonite Crystal'),
(42800, 14415, 0, 'Resonite Crystal'),
(42799, 14415, 0, 'Resonite Crystal'),
(42812, 14415, 0, 'Resonite Crystal'),
(42814, 14415, 0, 'Resonite Crystal'),
(42813, 14415, 0, 'Resonite Crystal'),
(42795, 14415, 0, 'Resonite Crystal'),
(42811, 14415, 0, 'Resonite Crystal'),
(12796, 14415, 0, 'Resonite Crystal'),
(14020, 14415, 0, 'Resonite Crystal'),
(15061, 14415, 0, 'Resonite Crystal'),
(42815, 14415, 0, 'Resonite Crystal'),
(8143, 14415, 0, 'Resonite Crystal'),
(42802, 14415, 0, 'Resonite Crystal'),
(42801, 14415, 0, 'Resonite Crystal'),
(12006, 14415, 0, 'Resonite Crystal'),
(42797, 14415, 0, 'Resonite Crystal'),
(19120, 14415, 0, 'Resonite Crystal'),
(19121, 14415, 0, 'Resonite Crystal'),
(19119, 14415, 0, 'Resonite Crystal'),
(19118, 14415, 0, 'Resonite Crystal');
UPDATE `gameobject` SET `spawntimesecs`='300' WHERE `guid`=71339;
UPDATE `gameobject` SET `spawntimesecs`='300' WHERE `guid`=69330;
UPDATE creature_template SET gossip_menu_id =6476 WHERE entry = 15116;
REPLACE INTO gossip_menu (entry, text_id) VALUES (6476, 7677);
UPDATE `creature_template` SET `faction_A`='1602', `faction_H`='1602' WHERE `entry`=16661;
REPLACE INTO `creature_questrelation` (`id`, `quest`) VALUES ('10879', '7492'), ('10881', '7492'), ('20724', '7492');
UPDATE `quest_template` SET `RequiredRaces`='690' WHERE `entry`=7492;
UPDATE `creature_questrelation` SET `id`='10881' WHERE `id`=10880 AND `quest`=1000;
UPDATE `quest_template` SET `RequiredRaces`='0' WHERE `entry`=1126;
UPDATE `quest_template`SET`NextQuestId`='1124', `PrevQuestId`='0', `NextQuestInChain`='1124' WHERE `entry`=6762;
UPDATE creature_template SET gossip_menu_id =7812 WHERE entry = 17631;
UPDATE creature_template SET gossip_menu_id =7812 WHERE entry = 17632;
REPLACE INTO gossip_menu (entry, text_id) VALUES (7812, 9564);
UPDATE creature_template SET gossip_menu_id =11778 WHERE entry = 4265;
REPLACE INTO gossip_menu (entry, text_id) VALUES (11778, 16510);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(7812, 0, 6, 'I would like to check my deposit box.', 9, 131072, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11778, 1, 1, 'Show me what you have for sale.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE creature_template SET gossip_menu_id =5782 WHERE entry = 20724;
UPDATE `gameobject_template` SET `data1`='13359' WHERE `entry`=13873;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 13873;
UPDATE `gameobject_template` SET `flags`='4', `data1`='12654' WHERE `entry`=13360;
UPDATE `gameobject_template` SET `flags`='4', `data1`='12654' WHERE `entry`=13872;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 13360;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 13872;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(511, 13359, 1, 1, 1, 7417.82, -851, 17.574, 0.628, 0, 0, 0.308866, 0.951106, 300, 100, 1),
(3208, 13359, 1, 1, 1, 7286.63, -988, 33.378, 1.208, 0, 0, 0.567939, 0.82307, 300, 100, 1),
(3311, 13359, 1, 1, 1, 7408.14, -919, 13.574, -2, 0, 0, -0.841471, 0.540302, 300, 100, 1),
(6452, 13359, 1, 1, 1, 7381.15, -985, 31.5038, 2.88, 0, 0, 0.991458, 0.130424, 300, 100, 1),
(7066, 13359, 1, 1, 1, 7357.62, -804, 8.267, -3, 0, 0, -0.997495, 0.0707372, 300, 100, 1),
(11706, 13359, 1, 1, 1, 7312.63, -951, 32.62, 1.78, 0, 0, 0.777072, 0.629412, 300, 100, 1),
(14350, 13359, 1, 1, 1, 7416.72, -1062, 38.1199, 2.635, 0, 0, 0.968092, 0.250596, 300, 100, 1),
(1630, 13359, 1, 1, 1, 7389.11, -1065, 38.538, -1, 0, 0, -0.479426, 0.877583, 300, 100, 1),
(4005, 13359, 1, 1, 1, 7247.78, -864, 30.767, -2, 0, 0, -0.841471, 0.540302, 300, 100, 1),
(12462, 13359, 1, 1, 1, 7369.33, -782, 7.816, 4.778, 0, 0, 0.683534, -0.729919, 300, 100, 1),
(15614, 13359, 1, 1, 1, 7459.36, -836, 1.29, 4.28, 0, 0, 0.84233, -0.538962, 300, 100, 1);
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(42804, 12653, 1, 1, 1, 7247.78, -864, 30.767, -2, 0, 0, -0.841471, 0.540302, 300, 100, 1),
(8095, 12653, 1, 1, 1, 7286.63, -988, 33.378, 1.208, 0, 0, 0.567939, 0.82307, 300, 100, 1),
(8102, 12653, 1, 1, 1, 7312.63, -951, 32.62, 1.78, 0, 0, 0.777072, 0.629412, 300, 100, 1),
(8103, 12653, 1, 1, 1, 7357.62, -804, 8.267, -3, 0, 0, -0.997495, 0.0707372, 300, 100, 1),
(8104, 12653, 1, 1, 1, 7369.33, -782, 7.816, 4.778, 0, 0, 0.683534, -0.729919, 300, 100, 1),
(8105, 12653, 1, 1, 1, 7381.15, -985, 31.5038, 2.88, 0, 0, 0.991458, 0.130424, 300, 100, 1),
(8106, 12653, 1, 1, 1, 7389.11, -1065, 38.538, -1, 0, 0, -0.479426, 0.877583, 300, 100, 1),
(8107, 12653, 1, 1, 1, 7408.14, -919, 13.574, -2, 0, 0, -0.841471, 0.540302, 300, 100, 1),
(8108, 12653, 1, 1, 1, 7416.72, -1062, 38.1199, 2.635, 0, 0, 0.968092, 0.250596, 300, 100, 1),
(8110, 12653, 1, 1, 1, 7417.82, -851, 17.574, 0.628, 0, 0, 0.308866, 0.951106, 300, 100, 1),
(8112, 12653, 1, 1, 1, 7459.36, -836, 1.29, 4.28, 0, 0, 0.84233, -0.538962, 300, 100, 1);
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(8113, 13873, 1, 1, 1, 7247.78, -864, 30.767, -2, 0, 0, -0.841471, 0.540302, 300, 100, 1),
(8114, 13873, 1, 1, 1, 7286.63, -988, 33.378, 1.208, 0, 0, 0.567939, 0.82307, 300, 100, 1),
(8115, 13873, 1, 1, 1, 7312.63, -951, 32.62, 1.78, 0, 0, 0.777072, 0.629412, 300, 100, 1),
(8117, 13873, 1, 1, 1, 7357.62, -804, 8.267, -3, 0, 0, -0.997495, 0.0707372, 300, 100, 1),
(8118, 13873, 1, 1, 1, 7369.33, -782, 7.816, 4.778, 0, 0, 0.683534, -0.729919, 300, 100, 1),
(8119, 13873, 1, 1, 1, 7381.15, -985, 31.5038, 2.88, 0, 0, 0.991458, 0.130424, 300, 100, 1),
(8120, 13873, 1, 1, 1, 7389.11, -1065, 38.538, -1, 0, 0, -0.479426, 0.877583, 300, 100, 1),
(8127, 13873, 1, 1, 1, 7408.14, -919, 13.574, -2, 0, 0, -0.841471, 0.540302, 300, 100, 1),
(8129, 13873, 1, 1, 1, 7416.72, -1062, 38.1199, 2.635, 0, 0, 0.968092, 0.250596, 300, 100, 1),
(8131, 13873, 1, 1, 1, 7417.82, -851, 17.574, 0.628, 0, 0, 0.308866, 0.951106, 300, 100, 1),
(8132, 13873, 1, 1, 1, 7459.36, -836, 1.29, 4.28, 0, 0, 0.84233, -0.538962, 300, 100, 1);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
('14416', '1', 'Cat Figurine 1+2'),('14417', '1', 'Cat Figurine 1+2'),('14418', '1', 'Cat Figurine 1+2'),
('14419', '1', 'Cat Figurine 1+2'),('14420', '1', 'Cat Figurine 1+2'),('14421', '1', 'Cat Figurine 1+2'),
('14422', '1', 'Cat Figurine 1+2'),('14423', '1', 'Cat Figurine 1+2'),('14424', '1', 'Cat Figurine 1+2'),
('14425', '1', 'Cat Figurine 1+2'),('14426', '1', 'Cat Figurine 1+2');
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
('511', '14416', '0', 'Cat Figurine 1'),('8113', '14416', '10', 'Cat Figurine 2'),
('3208', '14417', '0', 'Cat Figurine 1'),('8114', '14417', '10', 'Cat Figurine 2'),
('3311', '14418', '0', 'Cat Figurine 1'),('8115', '14418', '10', 'Cat Figurine 2'),
('6452', '14419', '0', 'Cat Figurine 1'),('8117', '14419', '10', 'Cat Figurine 2'),
('7066', '14420', '0', 'Cat Figurine 1'),('8118', '14420', '10', 'Cat Figurine 2'),
('11706', '14421', '0', 'Cat Figurine 1'),('8119', '14421', '10', 'Cat Figurine 2'),
('14350', '14422', '0', 'Cat Figurine 1'),('8120', '14422', '10', 'Cat Figurine 2'),
('1630', '14423', '0', 'Cat Figurine 1'),('8127', '14423', '10', 'Cat Figurine 2'),
('4005', '14424', '0', 'Cat Figurine 1'),('8129', '14424', '10', 'Cat Figurine 2'),
('12462', '14425', '0', 'Cat Figurine 1'),('8131', '14425', '10', 'Cat Figurine 2'),
('15614', '14426', '0', 'Cat Figurine 1'),('8132', '14426', '10', 'Cat Figurine 2');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14427', '1', 'Ancient Statuette');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('17783', '14427', '0', 'Ancient Statuette');
DELETE FROM `gameobject_loot_template` WHERE `entry` = 17783 AND `item` = 5498;
UPDATE `gameobject_template` SET `flags`='4' WHERE `entry`=17783;
UPDATE `gameobject_template` SET `flags`='4' WHERE `entry` in (153123,191209,191210,126049,128293,126049,128293,191209,191210,264,321,331,2739,2907,3640,13891,19021,68865,105175,141853,152094,152095,165554,171938,175566,175928,176753,177785,177792,177794,178185,178186,179004,179005,179006,179007,179008,180216,180501,181644,181671,181680,181757,181771,181872,181873,181874,181875,181876,182095,182127,182166,182599,182600,182601,182606,183441,184075,184443,184691,184744,184980,185233,186423,186463,186662,186729,186938,187333,187660,187885,187886,187898,187899,187900,187901,187902,188016,188017,188018,188237,188238,188263,188489,188502,188503,188650,189288,189295,190208,190223,190399,190542,190543,190696,190718,190719,191531,191532,191533,191534,191535,191536,191537,191773,191781,191844,191845,192243,192818,192828,192910,192911,192912,193200,193201,193943,193944,193945,193946,194126,201778);
UPDATE `gameobject_template` SET `flags`='20' WHERE `entry`=179545;
UPDATE `gameobject_template` SET `flags`='20' WHERE `entry`=194159;
UPDATE `gameobject_template` SET `flags`='16' WHERE `entry`=193597;
UPDATE `gameobject_template` SET `flags`='16' WHERE `entry`=194200;
UPDATE `gameobject_template` SET `flags`='16' WHERE `entry`=194201;
UPDATE `gameobject_template` SET `flags`='6' WHERE `entry`=103815;
UPDATE `gameobject_template` SET `flags`='6' WHERE `entry`=121264;
UPDATE `gameobject_template` SET `flags`='6' WHERE `entry`=129127;
UPDATE `gameobject_template` SET `flags`='6' WHERE `entry`=191543;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(66019, 13872, 1, 1, 1, 7203.75, -860, 41.626, 1.518, 0, 0, 0.688196, 0.725525, 120, 100, 1),
(66020, 13872, 1, 1, 1, 7240.99, -888, 34.821, -1, 0, 0, -0.479426, 0.877583, 120, 100, 1),
(66021, 13872, 1, 1, 1, 7244.85, -956, 37.689, 1.222, 0, 0, 0.573687, 0.819075, 120, 100, 1),
(66022, 13872, 1, 1, 1, 7262.83, -866, 32.906, 2.57, 0, 0, 0.959437, 0.281922, 120, 100, 1),
(66023, 13872, 1, 1, 1, 7283.04, -793, 23.596, 4.895, 0, 0, 0.639688, -0.768634, 120, 100, 1),
(66024, 13872, 1, 1, 1, 7298.42, -862, 29.827, -2, 0, 0, -0.841471, 0.540302, 120, 100, 1),
(66025, 13872, 1, 1, 1, 7317.71, -914, 32.254, 1.777, 0, 0, 0.776127, 0.630577, 120, 100, 1),
(66026, 13872, 1, 1, 1, 7328.4, -928, 4.692, 4.676, 0, 0, 0.719854, -0.694125, 120, 100, 1),
(66027, 13872, 1, 1, 1, 7352.02, -772, 7.951, -1, 0, 0, -0.479426, 0.877583, 120, 100, 1),
(66028, 13872, 1, 1, 1, 7363.67, -958, 15.798, 5.968, 0, 0, 0.156941, -0.987608, 120, 100, 1),
(66029, 13872, 1, 1, 1, 7378.33, -828, 17.493, 1.78, 0, 0, 0.777072, 0.629412, 120, 100, 1),
(66030, 13872, 1, 1, 1, 7382.99, -924, 32.254, 1.676, 0, 0, 0.743307, 0.668951, 120, 100, 1),
(66031, 13872, 1, 1, 1, 7383.58, -828, 17.567, 1.46, 0, 0, 0.66687, 0.745174, 120, 100, 1),
(66032, 13872, 1, 1, 1, 7384.15, -1009, 31.562, -3, 0, 0, -0.997495, 0.0707372, 120, 100, 1),
(8133, 13872, 1, 1, 1, 7393.72, -881, 14.189, 1.313, 0, 0, 0.610348, 0.792133, 120, 100, 1),
(8136, 13872, 1, 1, 1, 7395.24, -1124, 41.174, 0.803, 0, 0, 0.390799, 0.920476, 120, 100, 1),
(8138, 13872, 1, 1, 1, 7430.09, -865, 3.619, -2, 0, 0, -0.841471, 0.540302, 120, 100, 1),
(8140, 13872, 1, 1, 1, 7438.6, -1087, 38.0979, 2.356, 0, 0, 0.923842, 0.382773, 120, 100, 1),
(8141, 13872, 1, 1, 1, 7439.39, -769, 15.291, 3.242, 0, 0, 0.99874, -0.0501826, 120, 100, 1),
(8145, 13872, 1, 1, 1, 7457.69, -856, 1.149, 0.988, 0, 0, 0.474151, 0.880443, 120, 100, 1),
(8156, 13872, 1, 1, 1, 7490.79, -888, 16.76, -1, 0, 0, -0.479426, 0.877583, 120, 100, 1),
(8165, 13872, 1, 1, 1, 7493.77, -1003, -10, 3.044, 0, 0, 0.99881, 0.048777, 120, 100, 1),
(8168, 13872, 1, 1, 1, 7505.54, -1026, -10, 1.082, 0, 0, 0.514993, 0.857194, 120, 100, 1),
(8171, 13360, 1, 1, 1, 7203.75, -860, 41.626, 1.518, 0, 0, 0.688196, 0.725525, 120, 100, 1),
(8175, 13360, 1, 1, 1, 7240.99, -888, 34.821, -1, 0, 0, -0.479426, 0.877583, 120, 100, 1),
(8181, 13360, 1, 1, 1, 7244.85, -956, 37.689, 1.222, 0, 0, 0.573687, 0.819075, 120, 100, 1),
(8184, 13360, 1, 1, 1, 7262.83, -866, 32.906, 2.57, 0, 0, 0.959437, 0.281922, 120, 100, 1),
(8185, 13360, 1, 1, 1, 7283.04, -793, 23.596, 4.895, 0, 0, 0.639688, -0.768634, 120, 100, 1),
(8188, 13360, 1, 1, 1, 7298.42, -862, 29.827, -2, 0, 0, -0.841471, 0.540302, 120, 100, 1),
(8189, 13360, 1, 1, 1, 7317.71, -914, 32.254, 1.777, 0, 0, 0.776127, 0.630577, 120, 100, 1),
(8193, 13360, 1, 1, 1, 7328.4, -928, 4.692, 4.676, 0, 0, 0.719854, -0.694125, 120, 100, 1),
(8199, 13360, 1, 1, 1, 7352.02, -772, 7.951, -1, 0, 0, -0.479426, 0.877583, 120, 100, 1),
(8202, 13360, 1, 1, 1, 7363.67, -958, 15.798, 5.968, 0, 0, 0.156941, -0.987608, 120, 100, 1),
(8203, 13360, 1, 1, 1, 7378.33, -828, 17.493, 1.78, 0, 0, 0.777072, 0.629412, 120, 100, 1),
(8204, 13360, 1, 1, 1, 7382.99, -924, 32.254, 1.676, 0, 0, 0.743307, 0.668951, 120, 100, 1),
(8207, 13360, 1, 1, 1, 7383.58, -828, 17.567, 1.46, 0, 0, 0.66687, 0.745174, 120, 100, 1),
(8211, 13360, 1, 1, 1, 7384.15, -1009, 31.562, -3, 0, 0, -0.997495, 0.0707372, 120, 100, 1),
(8212, 13360, 1, 1, 1, 7393.72, -881, 14.189, 1.313, 0, 0, 0.610348, 0.792133, 120, 100, 1),
(8213, 13360, 1, 1, 1, 7395.24, -1124, 41.174, 0.803, 0, 0, 0.390799, 0.920476, 120, 100, 1),
(8214, 13360, 1, 1, 1, 7430.09, -865, 3.619, -2, 0, 0, -0.841471, 0.540302, 120, 100, 1),
(8215, 13360, 1, 1, 1, 7438.6, -1087, 38.0979, 2.356, 0, 0, 0.923842, 0.382773, 120, 100, 1),
(8216, 13360, 1, 1, 1, 7439.39, -769, 15.291, 3.242, 0, 0, 0.99874, -0.0501826, 120, 100, 1),
(8217, 13360, 1, 1, 1, 7457.69, -856, 1.149, 0.988, 0, 0, 0.474151, 0.880443, 120, 100, 1),
(8218, 13360, 1, 1, 1, 7490.79, -888, 16.76, -1, 0, 0, -0.479426, 0.877583, 120, 100, 1),
(8223, 13360, 1, 1, 1, 7493.77, -1003, -10, 3.044, 0, 0, 0.99881, 0.048777, 120, 100, 1),
(8233, 13360, 1, 1, 1, 7505.54, -1026, -10, 1.082, 0, 0, 0.514993, 0.857194, 120, 100, 1);
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
('6834', '14428', '0', 'Mathystra Relic 1'),('8171', '14428', '0', 'Mathystra Relic 2'),('66019', '14428', '0', 'Mathystra Relic 3'),
('7711', '14429', '0', 'Mathystra Relic 1'),('8175', '14429', '0', 'Mathystra Relic 2'),('66020', '14429', '0', 'Mathystra Relic 3'),
('6946', '14430', '0', 'Mathystra Relic 1'),('8181', '14430', '0', 'Mathystra Relic 2'),('66021', '14430', '0', 'Mathystra Relic 3'),
('1351', '14431', '0', 'Mathystra Relic 1'),('8184', '14431', '0', 'Mathystra Relic 2'),('66022', '14431', '0', 'Mathystra Relic 3'),
('2483', '14432', '0', 'Mathystra Relic 1'),('8185', '14432', '0', 'Mathystra Relic 2'),('66023', '14432', '0', 'Mathystra Relic 3'),
('7020', '14433', '0', 'Mathystra Relic 1'),('8188', '14433', '0', 'Mathystra Relic 2'),('66024', '14433', '0', 'Mathystra Relic 3'),
('10873', '14434', '0', 'Mathystra Relic 1'),('8189', '14434', '0', 'Mathystra Relic 2'),('66025', '14434', '0', 'Mathystra Relic 3'),
('16256', '14435', '0', 'Mathystra Relic 1'),('8193', '14435', '0', 'Mathystra Relic 2'),('66026', '14435', '0', 'Mathystra Relic 3'),
('4439', '14436', '0', 'Mathystra Relic 1'),('8199', '14436', '0', 'Mathystra Relic 2'),('66027', '14436', '0', 'Mathystra Relic 3'),
('9409', '14437', '0', 'Mathystra Relic 1'),('8202', '14437', '0', 'Mathystra Relic 2'),('66028', '14437', '0', 'Mathystra Relic 3'),
('10671', '14438', '0', 'Mathystra Relic 1'),('8203', '14438', '0', 'Mathystra Relic 2'),('66029', '14438', '0', 'Mathystra Relic 3'),
('4230', '14439', '0', 'Mathystra Relic 1'),('8204', '14439', '0', 'Mathystra Relic 2'),('66030', '14439', '0', 'Mathystra Relic 3'),
('8362', '14440', '0', 'Mathystra Relic 1'),('8207', '14440', '0', 'Mathystra Relic 2'),('66031', '14440', '0', 'Mathystra Relic 3'),
('9769', '14441', '0', 'Mathystra Relic 1'),('8211', '14441', '0', 'Mathystra Relic 2'),('66032', '14441', '0', 'Mathystra Relic 3'),
('6805', '14442', '0', 'Mathystra Relic 1'),('8212', '14442', '0', 'Mathystra Relic 2'),('8133', '14442', '0', 'Mathystra Relic 3'),
('8721', '14443', '0', 'Mathystra Relic 1'),('8213', '14443', '0', 'Mathystra Relic 2'),('8136', '14443', '0', 'Mathystra Relic 3'),
('8327', '14444', '0', 'Mathystra Relic 1'),('8214', '14444', '0', 'Mathystra Relic 2'),('8138', '14444', '0', 'Mathystra Relic 3'),
('12362', '14445', '0', 'Mathystra Relic 1'),('8215', '14445', '0', 'Mathystra Relic 2'),('8140', '14445', '0', 'Mathystra Relic 3'),
('980', '14446', '0', 'Mathystra Relic 1'),('8216', '14446', '0', 'Mathystra Relic 2'),('8141', '14446', '0', 'Mathystra Relic 3'),
('9084', '14447', '0', 'Mathystra Relic 1'),('8217', '14447', '0', 'Mathystra Relic 2'),('8145', '14447', '0', 'Mathystra Relic 3'),
('193', '14448', '0', 'Mathystra Relic 1'),('8218', '14448', '0', 'Mathystra Relic 2'),('8156', '14448', '0', 'Mathystra Relic 3'),
('12403', '14449', '0', 'Mathystra Relic 1'),('8223', '14449', '0', 'Mathystra Relic 2'),('8165', '14449', '0', 'Mathystra Relic 3'),
('3869', '14450', '0', 'Mathystra Relic 1'),('8233', '14450', '0', 'Mathystra Relic 2'),('8168', '14450', '0', 'Mathystra Relic 3');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
('14428', '1', 'Mathystra Relic 1+2+3'),('14429', '1', 'Mathystra Relic 1+2+3'),('14430', '1', 'Mathystra Relic 1+2+3'),
('14431', '1', 'Mathystra Relic 1+2+3'),('14432', '1', 'Mathystra Relic 1+2+3'),('14433', '1', 'Mathystra Relic 1+2+3'),
('14434', '1', 'Mathystra Relic 1+2+3'),('14435', '1', 'Mathystra Relic 1+2+3'),('14436', '1', 'Mathystra Relic 1+2+3'),
('14437', '1', 'Mathystra Relic 1+2+3'),('14438', '1', 'Mathystra Relic 1+2+3'),('14439', '1', 'Mathystra Relic 1+2+3'),
('14440', '1', 'Mathystra Relic 1+2+3'),('14441', '1', 'Mathystra Relic 1+2+3'),('14442', '1', 'Mathystra Relic 1+2+3'),
('14443', '1', 'Mathystra Relic 1+2+3'),('14444', '1', 'Mathystra Relic 1+2+3'),('14445', '1', 'Mathystra Relic 1+2+3'),
('14446', '1', 'Mathystra Relic 1+2+3'),('14447', '1', 'Mathystra Relic 1+2+3'),('14448', '1', 'Mathystra Relic 1+2+3'),
('14449', '1', 'Mathystra Relic 1+2+3'),('14450', '1', 'Mathystra Relic 1+2+3'),('14451', '12', 'Master Mathystra Relic 1+2+3');
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`) VALUES
('14428', '14451', '0', 'Mathystra Relic 1+2+3'),('14429', '14451', '0', 'Mathystra Relic 1+2+3'),
('14430', '14451', '0', 'Mathystra Relic 1+2+3'),('14431', '14451', '0', 'Mathystra Relic 1+2+3'),
('14432', '14451', '0', 'Mathystra Relic 1+2+3'),('14433', '14451', '0', 'Mathystra Relic 1+2+3'),
('14434', '14451', '0', 'Mathystra Relic 1+2+3'),('14435', '14451', '0', 'Mathystra Relic 1+2+3'),
('14436', '14451', '0', 'Mathystra Relic 1+2+3'),('14437', '14451', '0', 'Mathystra Relic 1+2+3'),
('14438', '14451', '0', 'Mathystra Relic 1+2+3'),('14439', '14451', '0', 'Mathystra Relic 1+2+3'),
('14440', '14451', '0', 'Mathystra Relic 1+2+3'),('14441', '14451', '0', 'Mathystra Relic 1+2+3'),
('14442', '14451', '0', 'Mathystra Relic 1+2+3'),('14443', '14451', '0', 'Mathystra Relic 1+2+3'),
('14444', '14451', '0', 'Mathystra Relic 1+2+3'),('14445', '14451', '0', 'Mathystra Relic 1+2+3'),
('14446', '14451', '0', 'Mathystra Relic 1+2+3'),('14447', '14451', '0', 'Mathystra Relic 1+2+3'),
('14448', '14451', '0', 'Mathystra Relic 1+2+3'),('14449', '14451', '0', 'Mathystra Relic 1+2+3'),
('14450', '14451', '0', 'Mathystra Relic 1+2+3');
UPDATE `creature_template` SET `spell1`=62974,`spell2`=62286,`spell3`=62299,`spell4`=64660, `mechanic_immune_mask`=344276858 WHERE `entry`=34045;
UPDATE `creature_template` SET `spell1`=62974,`spell2`=62286,`spell3`=62299,`spell4`=64660, `mechanic_immune_mask`=344276858 WHERE `entry`=33062;
UPDATE `creature_template` SET `lootid`='0' WHERE `entry`=2909;
DELETE FROM `creature_loot_template` WHERE `entry` = 2909;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1', `mincountOrRef`='50' WHERE `entry`=54218 AND `item`=35223;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1', `mincountOrRef`='50' WHERE `entry`=54218 AND `item`=45047;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1', `mincountOrRef`='50' WHERE `entry`=54218 AND `item`=46779;
UPDATE creature_loot_template SET ChanceOrQuestChance=ABS(ChanceOrQuestChance) WHERE item in (17502,17503,17504,17326,17327,17328);
UPDATE `creature_template` SET `npcflag`='0' WHERE `entry`=3210;
UPDATE `creature_template` SET `npcflag`='0' WHERE `entry`=3211;
UPDATE `creature_template` SET `npcflag`='0' WHERE `entry`=3213;
UPDATE `creature_template` SET `npcflag`='0' WHERE `entry`=3214;
UPDATE `creature_template` SET `npcflag`='2' WHERE `entry`=21469;
REPLACE INTO gossip_menu (entry, text_id) VALUES (5081, 6288),(5141, 6173),(5142, 6174),(7973, 9805);
UPDATE `creature_template` SET `gossip_menu_id`=5142 WHERE `entry`=13442;
UPDATE `creature_template` SET `gossip_menu_id`=5141 WHERE `entry`=13443;
UPDATE `creature_template` SET `gossip_menu_id`=5081 WHERE `entry`=13447;
UPDATE `creature_template` SET `gossip_menu_id`=7973 WHERE `entry`=19375;
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14452', '1', 'Glinting Mud');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('154357', '14452', '0', 'Glinting Mud');
REPLACE INTO gossip_menu (entry, text_id) VALUES (1621, 2273);
UPDATE `gossip_menu` SET `condition_id`='1713' WHERE `entry`=1621 AND `text_id`=2274;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1713', '8', '3741', '0');
UPDATE `creature_template` SET `gossip_menu_id`=5241 WHERE `entry`=32099;
UPDATE `creature_template` SET `gossip_menu_id`=5241 WHERE `entry`=22658;
UPDATE `creature_template` SET `gossip_menu_id`=5241 WHERE `entry`=37420;
UPDATE `creature_template` SET `gossip_menu_id`=5124 WHERE `entry`=32080;
UPDATE `creature_template` SET `gossip_menu_id`=5124 WHERE `entry`=22571;
UPDATE `creature_template` SET `gossip_menu_id`=5124 WHERE `entry`=37401;
UPDATE `creature_template` SET `gossip_menu_id`=5141 WHERE `entry`=22541;
UPDATE `creature_template` SET `gossip_menu_id`=5141 WHERE `entry`=31965;
UPDATE `creature_template` SET `gossip_menu_id`=5141 WHERE `entry`=37284;
UPDATE `creature_template` SET `gossip_menu_id`=10875 WHERE `entry`=38157;
UPDATE `creature_template` SET `gossip_menu_id`=10875 WHERE `entry`=38639;
UPDATE `creature_template` SET `gossip_menu_id`=10875 WHERE `entry`=38640;
UPDATE `creature_template` SET `gossip_menu_id`=6484 WHERE `entry`=22647;
UPDATE `creature_template` SET `gossip_menu_id`=6484 WHERE `entry`=31979;
UPDATE `creature_template` SET `gossip_menu_id`=6484 WHERE `entry`=37298;
UPDATE `creature_template` SET `gossip_menu_id`=8453 WHERE `entry`=22656;
UPDATE `creature_template` SET `gossip_menu_id`=8453 WHERE `entry`=32092;
UPDATE `creature_template` SET `gossip_menu_id`=8453 WHERE `entry`=37413;
UPDATE `creature_template` SET `gossip_menu_id`=5442 WHERE `entry`=22628;
UPDATE `creature_template` SET `gossip_menu_id`=5442 WHERE `entry`=32032;
UPDATE `creature_template` SET `gossip_menu_id`=5442 WHERE `entry`=37352;
UPDATE `creature_template` SET `gossip_menu_id`=5146 WHERE `entry`=22597;
UPDATE `creature_template` SET `gossip_menu_id`=5146 WHERE `entry`=32766;
UPDATE `creature_template` SET `gossip_menu_id`=5146 WHERE `entry`=37480;
UPDATE `creature_template` SET `gossip_menu_id`=5147 WHERE `entry`=22722;
UPDATE `creature_template` SET `gossip_menu_id`=5147 WHERE `entry`=31823;
UPDATE `creature_template` SET `gossip_menu_id`=5147 WHERE `entry`=37484;
UPDATE `creature_template` SET `gossip_menu_id`=5142 WHERE `entry`=22527;
UPDATE `creature_template` SET `gossip_menu_id`=5142 WHERE `entry`=31923;
UPDATE `creature_template` SET `gossip_menu_id`=5142 WHERE `entry`=37239;
UPDATE `creature_template` SET `gossip_menu_id`=5081 WHERE `entry`=22735;
UPDATE `creature_template` SET `gossip_menu_id`=5081 WHERE `entry`=31960;
UPDATE `creature_template` SET `gossip_menu_id`=5081 WHERE `entry`=37278;
UPDATE `creature_template` SET `gossip_menu_id`=5281 WHERE `entry`=22575;
UPDATE `creature_template` SET `gossip_menu_id`=5281 WHERE `entry`=32101;
UPDATE `creature_template` SET `gossip_menu_id`=5281 WHERE `entry`=37422;
UPDATE `creature_template` SET `gossip_menu_id`=6261 WHERE `entry`=22736;
UPDATE `creature_template` SET `gossip_menu_id`=6261 WHERE `entry`=31961;
UPDATE `creature_template` SET `gossip_menu_id`=6261 WHERE `entry`=37279;
UPDATE `creature_template` SET `gossip_menu_id`=6262 WHERE `entry`=22759;
UPDATE `creature_template` SET `gossip_menu_id`=6262 WHERE `entry`=32076;
UPDATE `creature_template` SET `gossip_menu_id`=6262 WHERE `entry`=37397;
UPDATE `creature_template` SET `gossip_menu_id`=7499 WHERE `entry`=20548;
UPDATE `creature_template` SET `gossip_menu_id`=9680 WHERE `entry`=31210;
UPDATE `creature` SET `position_x`=3214.92, `position_y`=4065.25, `position_z`=106.16 WHERE `id`=20333;
UPDATE `creature` SET `position_x`=2755.55, `position_y`=3863.32, `position_z`=142.27 WHERE `id`=20336;
UPDATE `creature` SET `position_x`=2819.01, `position_y`=4351.10, `position_z`=144.97 WHERE `id`=20337;
UPDATE `creature` SET `position_x`=2947.31, `position_y`=4327.47, `position_z`=154.02 WHERE `id`=20338;
DELETE FROM `npc_text` WHERE `ID`=10540;
INSERT INTO `npc_text` (`ID`,`prob0`,`text0_0`) VALUES
(10540,1,"Begone, overseer!  We've already spoken.$B$BStop dragging your feet and execute your orders at Ruuan Weald!");
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1714', '9', '10722', '2');
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES
(8436, 10540, 0, 0, 0, 0, 0, 0, 0, 1714);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1714', '8', '10722', '0');
UPDATE `gameobject` SET `spawntimesecs` = -43200 WHERE `guid` = 30032;
DELETE FROM `creature_loot_template` WHERE (`entry`=11583) AND (`item`=16963);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (11583, 16963, 0, 3, 1, 1);
UPDATE `gameobject` SET `spawntimesecs` = 120 WHERE `guid` = 44135;

# SD2_2647
UPDATE creature_template SET ScriptName='npc_blood_orb_control' WHERE entry=38008;
UPDATE creature_template SET ScriptName='npc_ball_of_flame' WHERE entry IN (38332,38451);
UPDATE creature_template SET ScriptName='npc_kinetic_bomb' WHERE entry=38454;
UPDATE creature_template SET ScriptName='npc_dark_nucleus' WHERE entry=38369;
UPDATE creature_template SET ScriptName='boss_taldaram_icc' WHERE entry=37973;
UPDATE creature_template SET ScriptName='boss_keleseth_icc' WHERE entry=37972;
UPDATE creature_template SET ScriptName='boss_valanar_icc' WHERE entry=37970;
UPDATE creature_template SET ScriptName='npc_anubarak_spike' WHERE entry=34660;
UPDATE creature_template SET ScriptName='npc_frost_sphere' WHERE entry=34606;
UPDATE creature_template SET ScriptName='npc_nerubian_borrow' WHERE entry=34862;
UPDATE creature_template SET ScriptName='boss_sindragosa' WHERE entry=36853;
UPDATE creature_template SET ScriptName='npc_rimefang_icc' WHERE entry=37533;
UPDATE creature_template SET ScriptName='npc_spinestalker_icc' WHERE entry=37534;
UPDATE creature_template SET ScriptName='' WHERE entry=18095;
UPDATE creature_template SET ScriptName='npc_doomfire_spirit' WHERE entry=18104;
UPDATE instance_template SET ScriptName='instance_eye_of_eternity' WHERE map=616;
UPDATE creature_template SET ScriptName='boss_malygos' WHERE entry=28859;
DELETE FROM scripted_event_id WHERE id IN (20711);
INSERT INTO scripted_event_id VALUES
(20711,'event_go_focusing_iris');
UPDATE creature_template SET ScriptName='npc_power_spark' WHERE entry=30084;
UPDATE creature_template SET ScriptName='boss_festergut' WHERE entry=36626;


# Gossip_FIX
UPDATE `gossip_menu_option` SET `action_menu_id` = '-1' WHERE `action_menu_id` =0 AND `action_script_id` >0;

# NPC_ADDON_FIX
INSERT IGNORE INTO `creature_template_addon`
SELECT
`creature_template`.`difficulty_entry_1`,
`creature_template_addon`.`mount`,
`creature_template_addon`.`bytes1`,
`creature_template_addon`.`b2_0_sheath`,
`creature_template_addon`.`b2_1_pvp_state`,
`creature_template_addon`.`emote`,
`creature_template_addon`.`moveflags`,
`creature_template_addon`.`auras`
FROM
`creature_template`, `creature_template_addon`
WHERE
`creature_template_addon`.`entry`=`creature_template`.`entry`
AND `creature_template`.`difficulty_entry_1`>0;
INSERT IGNORE INTO `creature_template_addon`
SELECT
`creature_template`.`difficulty_entry_2`,
`creature_template_addon`.`mount`,
`creature_template_addon`.`bytes1`,
`creature_template_addon`.`b2_0_sheath`,
`creature_template_addon`.`b2_1_pvp_state`,
`creature_template_addon`.`emote`,
`creature_template_addon`.`moveflags`,
`creature_template_addon`.`auras`
FROM
`creature_template`, `creature_template_addon`
WHERE
`creature_template_addon`.`entry`=`creature_template`.`entry`
AND `creature_template`.`difficulty_entry_2`>0;
INSERT IGNORE INTO `creature_template_addon`
SELECT
`creature_template`.`difficulty_entry_3`,
`creature_template_addon`.`mount`,
`creature_template_addon`.`bytes1`,
`creature_template_addon`.`b2_0_sheath`,
`creature_template_addon`.`b2_1_pvp_state`,
`creature_template_addon`.`emote`,
`creature_template_addon`.`moveflags`,
`creature_template_addon`.`auras`
FROM
`creature_template`, `creature_template_addon`
WHERE
`creature_template_addon`.`entry`=`creature_template`.`entry`
AND `creature_template`.`difficulty_entry_3`>0;

# NPC_FIX
UPDATE
`creature_template`, `creature_template` AS `copy`
SET
`copy`.`RegenHealth`=`creature_template`.`RegenHealth`,
`copy`.`unit_class`=`creature_template`.`unit_class`,
`copy`.`unit_flags`=`creature_template`.`unit_flags`,
`copy`.`npcflag`=`creature_template`.`npcflag`,
`copy`.`dynamicflags`=`creature_template`.`dynamicflags`,
`copy`.`equipment_id`=`creature_template`.`equipment_id`,
`copy`.`faction_A`=`creature_template`.`faction_A`,
`copy`.`faction_H`=`creature_template`.`faction_H`,
`copy`.`speed_run`=`creature_template`.`speed_run`,
`copy`.`speed_walk`=`creature_template`.`speed_walk`,
`copy`.`scale`=`creature_template`.`scale`,
`copy`.`dmgschool`=`creature_template`.`dmgschool`,
`copy`.`mingold`=`creature_template`.`mingold`,
`copy`.`maxgold`=`creature_template`.`maxgold`,
`copy`.`Vehicle_Id`=`creature_template`.`Vehicle_Id`,
`copy`.`mechanic_immune_mask`=`creature_template`.`mechanic_immune_mask`
WHERE
`copy`.`entry`=`creature_template`.`difficulty_entry_1`;
UPDATE
`creature_template`, `creature_template` AS `copy`
SET
`copy`.`RegenHealth`=`creature_template`.`RegenHealth`,
`copy`.`unit_class`=`creature_template`.`unit_class`,
`copy`.`unit_flags`=`creature_template`.`unit_flags`,
`copy`.`npcflag`=`creature_template`.`npcflag`,
`copy`.`dynamicflags`=`creature_template`.`dynamicflags`,
`copy`.`equipment_id`=`creature_template`.`equipment_id`,
`copy`.`faction_A`=`creature_template`.`faction_A`,
`copy`.`faction_H`=`creature_template`.`faction_H`,
`copy`.`speed_run`=`creature_template`.`speed_run`,
`copy`.`speed_walk`=`creature_template`.`speed_walk`,
`copy`.`scale`=`creature_template`.`scale`,
`copy`.`dmgschool`=`creature_template`.`dmgschool`,
`copy`.`mingold`=`creature_template`.`mingold`,
`copy`.`maxgold`=`creature_template`.`maxgold`,
`copy`.`Vehicle_Id`=`creature_template`.`Vehicle_Id`,
`copy`.`mechanic_immune_mask`=`creature_template`.`mechanic_immune_mask`
WHERE
`copy`.`entry`=`creature_template`.`difficulty_entry_2`;
UPDATE
`creature_template`, `creature_template` AS `copy`
SET
`copy`.`RegenHealth`=`creature_template`.`RegenHealth`,
`copy`.`unit_class`=`creature_template`.`unit_class`,
`copy`.`unit_flags`=`creature_template`.`unit_flags`,
`copy`.`npcflag`=`creature_template`.`npcflag`,
`copy`.`dynamicflags`=`creature_template`.`dynamicflags`,
`copy`.`equipment_id`=`creature_template`.`equipment_id`,
`copy`.`faction_A`=`creature_template`.`faction_A`,
`copy`.`faction_H`=`creature_template`.`faction_H`,
`copy`.`speed_run`=`creature_template`.`speed_run`,
`copy`.`speed_walk`=`creature_template`.`speed_walk`,
`copy`.`scale`=`creature_template`.`scale`,
`copy`.`dmgschool`=`creature_template`.`dmgschool`,
`copy`.`mingold`=`creature_template`.`mingold`,
`copy`.`maxgold`=`creature_template`.`maxgold`,
`copy`.`Vehicle_Id`=`creature_template`.`Vehicle_Id`,
`copy`.`mechanic_immune_mask`=`creature_template`.`mechanic_immune_mask`
WHERE
`copy`.`entry`=`creature_template`.`difficulty_entry_3`;

# Final_FIX
UPDATE quest_template SET SpecialFlags=SpecialFlags|1 WHERE QuestFlags=QuestFlags|4096;
UPDATE quest_template SET SpecialFlags=SpecialFlags|1 WHERE QuestFlags=QuestFlags|32768;
DELETE FROM `creature_addon` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);
# DELETE FROM `creature_movement` WHERE `id` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `npc_gossip` WHERE `npc_guid` NOT IN (SELECT `guid` FROM `creature`);
# DELETE FROM `game_event_gameobject` WHERE `guid` NOT IN (SELECT `guid` FROM `gameobject`);
# DELETE FROM `game_event_creature` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);
# UPDATE creature_template SET unit_flags=unit_flags&~2048 WHERE unit_flags&2048=2048;
# UPDATE creature_template SET unit_flags=unit_flags&~524288 WHERE unit_flags&524288=524288;
# UPDATE creature_template SET unit_flags=unit_flags&~67108864 WHERE unit_flags&67108864=67108864;
# UPDATE creature_template SET unit_flags=unit_flags&~8388608 WHERE unit_flags&8388608=8388608;
UPDATE `creature`, `creature_template` SET `creature`.`curhealth`=`creature_template`.`minhealth`,`creature`.`curmana`=`creature_template`.`minmana` WHERE `creature`.`id`=`creature_template`.`entry` and `creature_template`.`RegenHealth` = '1';
UPDATE `creature` SET `spawndist` = 5 WHERE `spawndist` = 0 AND `MovementType`=1;
UPDATE `creature` SET `spawndist`=0 WHERE `MovementType`=0;
UPDATE `creature` SET `spawntimesecs` = 300 WHERE `spawntimesecs` = 25;
UPDATE `gameobject` SET `spawntimesecs` = 300 WHERE `spawntimesecs` = 25;
UPDATE `creature_template` SET `scale` = 1 WHERE `scale` = 0;
UPDATE `creature` SET `spawndist` = 0, `MovementType` = 2 WHERE guid in (select distinct(id) from creature_movement);
# UPDATE `creature` SET `spawndist` = 0, `MovementType` = 2 WHERE id in (select distinct(entry) from creature_movement_template);
# UPDATE `creature` LEFT JOIN (`creature_movement`) ON (`creature_movement`.`id`=`creature`.`guid`) LEFT JOIN (`creature_movement_template`) ON (`creature_movement_template`.`entry`=`creature`.`id`) SET `creature`.`spawndist`=5, `creature`.`MovementType`=1 WHERE `creature`.`MovementType`=2 AND (`creature_movement`.`id` IS NULL AND `creature_movement_template`.`entry` IS NULL);
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 0;
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 3;
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 10;
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 25;
UPDATE `gameobject` SET `state`=1 WHERE `state`=0 AND `id` IN (SELECT entry FROM `gameobject_template` WHERE `type`=3);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (SELECT `id` FROM `creature_questrelation`);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (SELECT `id` FROM `creature_involvedrelation`);
UPDATE `gameobject` SET `state` = 0 WHERE `id` IN (SELECT `entry` FROM `gameobject_template` WHERE `type` = 0 AND `data0` = 1);
# UPDATE `gameobject_template` SET `flags`=`flags`&~4 WHERE `type` IN (2,19,17);
# DELETE FROM `gameobject_scripts` WHERE `id` NOT IN (SELECT `guid` FROM `gameobject`);
# DELETE FROM `gameobject_scripts` WHERE `command` in (11, 12) and `datalong` NOT IN (SELECT `guid` FROM `gameobject`);
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` NOT IN (SELECT `entry` FROM `creature_template`);
# UPDATE creature_addon SET moveflags=moveflags &~ 0x00000100;
# UPDATE creature_addon SET moveflags=moveflags &~ 0x00000800;
# UPDATE creature_addon SET moveflags=moveflags &~ 0x00200000;
# UPDATE creature_addon SET moveflags=moveflags &~ 0x08000000;
# UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00000100;
# UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00000800;
# UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00200000;
# UPDATE creature_template_addon SET moveflags=moveflags &~ 0x08000000;
UPDATE `item_template` SET `spelltrigger_2` = 0 WHERE `spellid_2` = 0 AND `spelltrigger_2` = 6;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `AIName` = 'EventAI' AND `ScriptName` = 'generic_creature';
UPDATE `creature_template` SET npcflag = npcflag|1 WHERE `gossip_menu_id` > 0;
UPDATE quest_template SET SpecialFlags=SpecialFlags|1 WHERE SpecialFlags=4;

UPDATE db_version SET `cache_id`= '626';
UPDATE db_version SET `version`= 'YTDB_0.14.5_R626_MaNGOS_R12073_SD2_R2647_ACID_R309d_RuDB_R52';
