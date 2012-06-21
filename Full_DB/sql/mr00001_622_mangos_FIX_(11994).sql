# Y2kCat
ALTER TABLE db_version_ytdb CHANGE COLUMN 621_FIX_11992 622_FIX_11994 bit;
REPLACE INTO `db_version_ytdb` (`version`) VALUES ('622_FIX_11994');

# Fix
UPDATE `gameobject_template` SET `data3` = 0 WHERE `entry` = 38;
UPDATE `game_event` SET `start_time` = '2012-07-01 00:01:00' WHERE `entry` = 5;
UPDATE `game_event` SET `start_time` = '2012-08-05 00:01:00' WHERE `entry` = 3;
UPDATE `game_event` SET `end_time` = '2010-12-31 22:00:00' WHERE `entry` = 6;
UPDATE `game_event` SET `start_time` = '2013-01-22 08:00:00' WHERE `entry` = 7;
UPDATE `game_event` SET `start_time` = '2013-02-05 00:01:00' WHERE `entry` = 8;
UPDATE `game_event` SET `start_time` = '2013-04-08 00:01:00' WHERE `entry` = 9;
UPDATE `game_event` SET `start_time` = '2013-04-29 00:01:00' WHERE `entry` = 10;

# NeatElves
UPDATE creature_template SET unit_flags=unit_flags|768, npcflag=npcflag&~2 WHERE entry=15608;

REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('2000000787', 'Who disturbs my slumber? That spear... I still carry the scar!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('14139', '1', '0', '1', '0', '21894', '10', '4', '2000000787', '0', '0', '0', '0', '0', '0', '0', '');
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 9546;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(9546, 0, 2, 'Where would you like to fly to?.', 4, 8192, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9546, 1, 0, 'Greer, I need a gryphon to ride and some bombs to drop on New agamand!', 1, 1, -1, 0, 9546, 0, 0, NULL, 9, 11332, 0, 0, 0, 0, 0, 0, 0, 719),
(9546, 2, 0, 'I need to get to Wintergarde Keep fast!', 1, 1, -1, 0, 0, 0, 0, NULL, 9, 12297, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`, `condition_id`) VALUES ('185881', '32506', '0.01', '0', '1', '1', '0', '0', '0', '0'), ('185877', '32506', '0.01', '0', '1', '1', '0', '0', '0', '0');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14363', '50', 'Nethercite Deposit');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('185877', '14363', '0', 'Nethercite Deposit');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(104944, 185878, 530, 1, 1, -5413.37, 502.89, 50.3503, 3.53388, 0, 0, 0.980825, -0.194888, 900, 100, 1),
(104945, 185878, 530, 1, 1, -5401.75, 620.436, 87.8733, 4.99471, 0, 0, 0.600589, -0.799558, 900, 100, 1),
(104946, 185878, 530, 1, 1, -5395.88, -96.0399, 70.6927, 1.25856, 0, 0, 0.588563, 0.808451, 900, 100, 1),
(104947, 185878, 530, 1, 1, -5370.7, 332.931, -23.9374, 0.367152, 0, 0, 0.182547, 0.983197, 900, 100, 1),
(104948, 185878, 530, 1, 1, -5294.94, 385.327, 51.1458, 2.74692, 0, 0, 0.980592, 0.196058, 900, 100, 1),
(104949, 185878, 530, 1, 1, -5290.96, 526.961, 36.1121, 2.26153, 0, 0, 0.904738, 0.425968, 900, 100, 1),
(104950, 185878, 530, 1, 1, -5259.96, 300.686, 72.6904, 6.19873, 0, 0, 0.0422151, -0.999109, 900, 100, 1),
(104951, 185878, 530, 1, 1, -5259.24, 38.3811, 49.7569, 5.60182, 0, 0, 0.334131, -0.942527, 900, 100, 1),
(104952, 185878, 530, 1, 1, -5250.18, 494.885, 49.2206, 1.40545, 0, 0, 0.646299, 0.763084, 900, 100, 1),
(104953, 185878, 530, 1, 1, -5247.33, 241.345, 99.5143, 5.1895, 0, 0, 0.519993, -0.854171, 900, 100, 1),
(104954, 185878, 530, 1, 1, -5232.68, 150.809, 85.4377, 1.97328, 0, 0, 0.834178, 0.551496, 900, 100, 1),
(104955, 185878, 530, 1, 1, -5227.9, 796.571, 172.153, 0.0388566, 0, 0, 0.0194271, 0.999811, 900, 100, 1),
(104956, 185878, 530, 1, 1, -5225.91, -100.738, 57.4938, 4.48262, 0, 0, 0.783503, -0.621388, 900, 100, 1),
(104957, 185878, 530, 1, 1, -5213.92, 351.263, 97.1322, 4.40411, 0, 0, 0.807285, -0.590161, 900, 100, 1),
(104958, 185878, 530, 1, 1, -5194.49, 206.798, 74.1543, 1.4942, 0, 0, 0.679514, 0.733663, 900, 100, 1),
(104959, 185878, 530, 1, 1, -5191.52, 127.259, 72.6518, 1.23894, 0, 0, 0.580604, 0.814186, 900, 100, 1),
(104960, 185878, 530, 1, 1, -5180.2, 375.065, 72.1615, 5.90422, 0, 0, 0.188351, -0.982102, 900, 100, 1),
(104961, 185878, 530, 1, 1, -5176.76, -14.9165, 77.7322, 0.740202, 0, 0, 0.36171, 0.932291, 900, 100, 1),
(104962, 185878, 530, 1, 1, -5159.69, 78.8867, 80.6268, 1.02688, 0, 0, 0.491177, 0.87106, 900, 100, 1),
(104963, 185878, 530, 1, 1, -5158.5, 412.726, 79.3425, 5.53116, 0, 0, 0.367215, -0.930136, 900, 100, 1),
(104964, 185878, 530, 1, 1, -5146.31, 166.942, 148.673, 4.23916, 0, 0, 0.85316, -0.52165, 900, 100, 1),
(104965, 185878, 530, 1, 1, -5141.72, 500.874, 82.7841, 0.588631, 0, 0, 0.290085, 0.957001, 900, 100, 1),
(104966, 185878, 530, 1, 1, -5138.87, 136.34, 129.84, 4.6515, 0, 0, 0.728303, -0.685255, 900, 100, 1),
(104967, 185878, 530, 1, 1, -5138.62, 917.87, 35.3379, 2.00628, 0, 0, 0.843163, 0.537657, 900, 100, 1),
(104968, 185878, 530, 1, 1, -5130.37, 748.809, 68.2889, 4.97901, 0, 0, 0.606847, -0.794819, 900, 100, 1),
(104969, 185878, 530, 1, 1, -5118.49, 98.2888, 129.198, 4.82822, 0, 0, 0.664992, -0.746851, 900, 100, 1),
(104970, 185878, 530, 1, 1, -5118.02, 359.032, 188.428, 4.79288, 0, 0, 0.678084, -0.734984, 900, 100, 1),
(104971, 185878, 530, 1, 1, -5110.49, 254.215, 149.77, 5.29946, 0, 0, 0.472269, -0.881455, 900, 100, 1),
(104972, 185878, 530, 1, 1, -5109.6, 699.635, 82.6144, 1.35205, 0, 0, 0.625697, 0.780066, 900, 100, 1),
(104973, 185878, 530, 1, 1, -5109, 499.983, 84.3125, 5.24997, 0, 0, 0.493933, -0.8695, 900, 100, 1),
(104974, 185878, 530, 1, 1, -5106.02, 196.631, 135.391, 1.21931, 0, 0, 0.572585, 0.819846, 900, 100, 1),
(104975, 185878, 530, 1, 1, -5094.4, -103.216, 68.4281, 1.62769, 0, 0, 0.726933, 0.686708, 900, 100, 1),
(104976, 185878, 530, 1, 1, -5082.57, 396.26, 207.414, 3.70118, 0, 0, 0.961112, -0.276157, 900, 100, 1),
(104977, 185878, 530, 1, 1, -5064.47, 177.739, 125.745, 0.830534, 0, 0, 0.403434, 0.915009, 900, 100, 1),
(104978, 185878, 530, 1, 1, -5064.46, 18.1924, 79.939, 3.10032, 0, 0, 0.999787, 0.0206348, 900, 100, 1),
(104979, 185878, 530, 1, 1, -5063.76, 803.302, 52.5334, 2.53643, 0, 0, 0.95457, 0.297985, 900, 100, 1),
(104980, 185878, 530, 1, 1, -5063.03, 278.639, 174.863, 0.551726, 0, 0, 0.272377, 0.962191, 900, 100, 1),
(104981, 185878, 530, 1, 1, -5062.53, 127.324, 162.467, 1.30178, 0, 0, 0.605895, 0.795545, 900, 100, 1),
(104982, 185878, 530, 1, 1, -5057.59, 588.585, 89.4865, 0.655397, 0, 0, 0.321865, 0.946786, 900, 100, 1),
(104983, 185878, 530, 1, 1, -5045.81, 363.624, 170.645, 6.1045, 0, 0, 0.0892239, -0.996012, 900, 100, 1),
(104984, 185878, 530, 1, 1, -5037.57, 632.943, 89.1723, 5.22485, 0, 0, 0.504815, -0.863228, 900, 100, 1),
(104985, 185878, 530, 1, 1, -5029.17, 246.955, 96.4423, 5.40549, 0, 0, 0.424897, -0.905242, 900, 100, 1),
(104986, 185878, 530, 1, 1, -5026.64, 454.626, 86.4524, 4.70649, 0, 0, 0.709189, -0.705018, 900, 100, 1),
(104987, 185878, 530, 1, 1, -5020.17, 119.821, 77.4466, 2.09503, 0, 0, 0.866184, 0.499725, 900, 100, 1),
(104988, 185878, 530, 1, 1, -5005.56, 550.779, 89.4748, 1.47065, 0, 0, 0.670828, 0.741613, 900, 100, 1),
(104989, 185878, 530, 1, 1, -5002.06, 494.201, 86.1354, 1.02298, 0, 0, 0.489477, 0.872016, 900, 100, 1),
(104990, 185878, 530, 1, 1, -4999, 445.744, 87.9224, 2.05185, 0, 0, 0.855194, 0.518308, 900, 100, 1),
(104991, 185878, 530, 1, 1, -4996.1, 170.092, 81.9368, 5.49581, 0, 0, 0.383597, -0.923501, 900, 100, 1),
(104992, 185878, 530, 1, 1, -4988.7, 226.831, 80.763, 3.32026, 0, 0, 0.996012, -0.0892149, 900, 100, 1),
(104993, 185878, 530, 1, 1, -4982.54, 324.642, 83.6776, 3.92894, 0, 0, 0.923506, -0.383584, 900, 100, 1),
(104994, 185878, 530, 1, 1, -4973.74, 797.697, 55.7351, 4.92011, 0, 0, 0.629988, -0.776605, 900, 100, 1),
(104995, 185878, 530, 1, 1, -4968.93, 600.838, 79.4459, 4.30908, 0, 0, 0.834405, -0.551152, 900, 100, 1),
(104996, 185878, 530, 1, 1, -4968.51, 75.4443, 69.5985, 0.642053, 0, 0, 0.315541, 0.948912, 900, 100, 1),
(104997, 185878, 530, 1, 1, -4954.18, 370.533, 84.1992, 3.85434, 0, 0, 0.937168, -0.348878, 900, 100, 1),
(104998, 185878, 530, 1, 1, -4940.75, 401.365, 84.2221, 0.488903, 0, 0, 0.242024, 0.97027, 900, 100, 1),
(104999, 185878, 530, 1, 1, -4930.81, 138.949, 53.6837, 1.88298, 0, 0, 0.808436, 0.588584, 900, 100, 1),
(105000, 185878, 530, 1, 1, -4929.65, 316.246, 134.089, 2.62911, 0, 0, 0.967349, 0.253446, 900, 100, 1),
(105001, 185878, 530, 1, 1, -4925.43, -8.52092, 56.052, 5.27197, 0, 0, 0.484339, -0.87488, 900, 100, 1),
(105002, 185878, 530, 1, 1, -4920.99, 205.371, 62.4706, 2.76263, 0, 0, 0.982102, 0.18835, 900, 100, 1),
(105003, 185878, 530, 1, 1, -4916.29, 712.739, 66.21, 1.23267, 0, 0, 0.578048, 0.816002, 900, 100, 1),
(105004, 185878, 530, 1, 1, -4911.38, 588.623, 58.0783, 2.97782, 0, 0, 0.996649, 0.0817949, 900, 100, 1),
(105005, 185878, 530, 1, 1, -4895.8, 195.274, 52.0633, 4.45909, 0, 0, 0.790759, -0.612128, 900, 100, 1),
(105006, 185878, 530, 1, 1, -4888.35, 413.436, 66.1353, 2.72729, 0, 0, 0.978621, 0.205673, 900, 100, 1),
(105007, 185878, 530, 1, 1, -4870.81, 559.978, 49.1191, 5.00808, 0, 0, 0.595231, -0.803555, 900, 100, 1),
(105008, 185878, 530, 1, 1, -4870.62, 480.736, 65.7166, 3.34304, 0, 0, 0.994932, -0.100553, 900, 100, 1),
(105009, 185878, 530, 1, 1, -4850.34, 946.364, -28.0504, 1.04025, 0, 0, 0.496989, 0.867757, 900, 100, 1),
(105010, 185878, 530, 1, 1, -4843.82, 437.207, 56.9693, 1.84685, 0, 0, 0.797672, 0.603092, 900, 100, 1),
(105011, 185878, 530, 1, 1, -4310.21, 274.086, 128.542, 0.119741, 0, 0, 0.0598347, 0.998208, 900, 100, 1),
(105012, 185878, 530, 1, 1, -4231.3, 580.719, 37.4166, 3.71687, 0, 0, 0.958916, -0.283689, 900, 100, 1),
(105013, 185878, 530, 1, 1, -4187.49, 268.491, 122.763, 5.84137, 0, 0, 0.219115, -0.975699, 900, 100, 1),
(105014, 185878, 530, 1, 1, -4181.68, 434.904, 31.6365, 1.68268, 0, 0, 0.745537, 0.666464, 900, 100, 1),
(105015, 185878, 530, 1, 1, -4109.57, 601.786, 3.69305, 0.912995, 0, 0, 0.440807, 0.897602, 900, 100, 1),
(105016, 185878, 530, 1, 1, -4090.21, 453.875, 30.4954, 2.46808, 0, 0, 0.943831, 0.330427, 900, 100, 1);
DELETE FROM `creature` WHERE `id` = 21707;
DELETE FROM `creature` WHERE `id` = 21428;
DELETE FROM `creature` WHERE `id` = 21706;
DELETE FROM `creature` WHERE `id` = 21708;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
('1525', '8', '11015', '0'), ('1526', '8', '11016', '0'),
('1527', '8', '11017', '0'), ('1528', '8', '11018', '0'),
('1529', '-2', '1526', '1527'), ('1530', '-2', '1529', '1528'),
('1531', '-1', '1525', '1530');
UPDATE `gossip_menu` SET `condition_id`='1531' WHERE `entry`=8652 AND `text_id`=10864;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8666,10950);
UPDATE `creature_template` SET `mechanic_immune_mask` = 7668197 WHERE `entry` = 22960;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='40' WHERE `item`=30810;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8666,10901);
UPDATE `creature_template` SET `mechanic_immune_mask` = 1114593 WHERE `entry` = 23028;
UPDATE `creature_template` SET `flags_extra` = 64 WHERE `entry` IN (28218,28220,28242,28212,28103,28208);
UPDATE `creature` SET `MovementType`='0' WHERE `guid`=28803;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='20',`maxcount`='1' WHERE `item`=5113;
DELETE FROM `creature` WHERE `id` = 24476;
DELETE FROM `npc_vendor` WHERE (`entry`=18960) AND (`item`=25848);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (18960, 25848, 0, 0, 0);
DELETE FROM `npc_vendor` WHERE (`entry`=19004) AND (`item`=25848);
INSERT INTO `npc_vendor` (`entry`, `item`, `maxcount`, `incrtime`, `ExtendedCost`) VALUES (19004, 25848, 0, 0, 0);
UPDATE creature_template SET unit_flags=unit_flags|33816576 WHERE entry=17954;
UPDATE gameobject_template SET flags=flags|34 WHERE entry=183049;
UPDATE gameobject_template SET flags=flags|48 WHERE entry IN (184125,184126);
delete from spell_target_position where id in (720, 1121);
insert into spell_target_position values
(720,531,-8043.01,1254.21,-84.19,0),
(1121,531,-8022.68,1150.08,-89.33,0);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (9200,12500);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (9201,12502);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (9297,12606);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (9295,12607);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (9296,12608);
DELETE FROM  `gossip_menu_option` WHERE `menu_id` in (9199,9200,9297);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(9199, 0, 0, 'Who are you?', 1, 1, 9200, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9199, 1, 0, 'What brings you to the Sunwell?', 1, 1, 9297, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9200, 0, 0, 'What can we do to assist you?', 1, 1, 9201, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9297, 0, 0, 'You''re not alone here?', 1, 1, 9295, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9297, 1, 0, 'What would Kil''jaeden want with a mortal woman?', 1, 1, 9296, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `id` = 22362;
REPLACE INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES ('42016', '3939', '11013', '1', '0', '0', '0', '2', '1'), ('42016', '3939', '11013', '0', '0', '0', '0', '2', '1');
REPLACE INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES ('46302', '4080', '0', '0', '0', '0', '0', '2', '1'), ('46302', '4131', '0', '0', '0', '0', '0', '2', '1');
UPDATE creature_template SET faction_A = '1741', faction_H = '1741' WHERE entry = '25174';
UPDATE creature SET position_x = '12858.286133', position_y = '-7050.052246', position_z = '18.902540', orientation = '5.703012' WHERE guid = '129082';
DELETE FROM `creature` WHERE `id` = 24815;
DELETE FROM creature WHERE guid=100531;
DELETE FROM creature_addon WHERE guid=100531;
DELETE FROM creature_movement WHERE id=100531;
DELETE FROM game_event_creature WHERE guid=100531;
DELETE FROM game_event_creature_data WHERE guid=100531;
DELETE FROM creature_battleground WHERE guid=100531;
DELETE FROM creature WHERE guid=100530;
DELETE FROM creature_addon WHERE guid=100530;
DELETE FROM creature_movement WHERE id=100530;
DELETE FROM game_event_creature WHERE guid=100530;
DELETE FROM game_event_creature_data WHERE guid=100530;
DELETE FROM creature_battleground WHERE guid=100530;
DELETE FROM creature WHERE guid=100518;
DELETE FROM creature_addon WHERE guid=100518;
DELETE FROM creature_movement WHERE id=100518;
DELETE FROM game_event_creature WHERE guid=100518;
DELETE FROM game_event_creature_data WHERE guid=100518;
DELETE FROM creature_battleground WHERE guid=100518;
DELETE FROM creature WHERE guid=100528;
DELETE FROM creature_addon WHERE guid=100528;
DELETE FROM creature_movement WHERE id=100528;
DELETE FROM game_event_creature WHERE guid=100528;
DELETE FROM game_event_creature_data WHERE guid=100528;
DELETE FROM creature_battleground WHERE guid=100528;
UPDATE creature_template SET faction_A = '1960', faction_H = '1960' WHERE entry = '24967';
REPLACE INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES ('46302', '4080', '0', '0', '0', '0', '0', '2', '1'), ('46302', '4131', '0', '0', '0', '0', '0', '2', '1');
REPLACE INTO creature VALUES (128144,37512,530,1,1,0,339,12807.8,-7088.31,7.50413,5.51888,5,0,0,10479,0,0,0);
REPLACE INTO creature VALUES (128145,37512,530,1,1,0,339,12805.8,-7090.79,7.50184,5.53066,5,0,0,10479,0,0,0);
REPLACE INTO creature VALUES (128146,37512,530,1,1,0,339,12802.1,-7085.79,5.80169,5.50709,5,0,0,10479,0,0,0);
REPLACE INTO creature VALUES (128147,37512,530,1,1,0,339,12792.4,-7112.89,5.41684,3.78786,5,0,0,10479,0,0,0);
REPLACE INTO creature VALUES (128148,37512,530,1,1,0,339,12796.3,-7117.59,5.41724,3.8554,5,0,0,10479,0,0,0);
REPLACE INTO creature VALUES (128149,37512,530,1,1,0,339,12792.1,-6984.81,18.6976,2.21549,5,0,0,10479,0,0,0);
REPLACE INTO creature VALUES (128216,37512,530,1,1,0,339,12799.6,-6976.99,18.6976,2.25948,5,0,0,10479,0,0,0);
REPLACE INTO creature VALUES (128225,24994,530,1,1,0,0,12800.5,-6997.36,18.6306,1.29501,5,0,0,69860,0,0,0);
REPLACE INTO creature VALUES (128259,24994,530,1,1,0,0,12811.9,-6987.28,18.6312,3.49962,5,0,0,69860,0,0,0);
REPLACE INTO creature VALUES (128260,25142,530,1,1,0,199,12796.7,-6999.96,47.3198,4.03762,5,0,0,6986,0,0,0);
REPLACE INTO creature VALUES (128261,25142,530,1,1,0,199,12794.5,-6979.47,47.52,2.21707,5,0,0,6986,0,0,0);
REPLACE INTO creature VALUES (128262,25142,530,1,1,0,199,12801.3,-6980.19,47.5803,0.613286,5,0,0,6986,0,0,0);
REPLACE INTO creature VALUES (128263,25142,530,1,1,0,199,12795,-6988.04,47.5888,3.79807,5,0,0,6542,0,0,0);
REPLACE INTO creature VALUES (128264,25142,530,1,1,0,199,12850.2,-7041.43,47.7625,5.55422,5,0,0,6542,0,0,0);
REPLACE INTO creature VALUES (128265,25142,530,1,1,0,199,12850.3,-7035.65,47.8291,0.868534,5,0,0,6986,0,0,0);
REPLACE INTO creature VALUES (128266,25142,530,1,1,0,199,12842.7,-7040.82,47.8365,3.9308,5,0,0,6986,0,0,0);
REPLACE INTO creature VALUES (128267,25142,530,1,1,0,199,12850.2,-7064.49,3.28172,5.13089,5,0,0,6986,0,0,0);
REPLACE INTO creature VALUES (128268,25142,530,1,1,0,199,12873.9,-7043.64,3.2935,5.69952,5,0,0,6542,0,0,0);
REPLACE INTO creature VALUES (128269,25142,530,1,1,0,199,12881,-7028.05,3.27038,6.02782,5,0,0,6986,0,0,0);
REPLACE INTO creature VALUES (128270,25142,530,1,1,0,199,12882.9,-7012.35,3.08184,0.244148,5,0,0,6986,0,0,0);
UPDATE creature SET position_x = '12833.437500', position_y = '-7004.896484', position_z = '71.532654', orientation = '4.135809' WHERE guid = '52375';
REPLACE INTO creature VALUES (128271,24994,530,1,1,0,0,12837.6,-7014.02,71.5299,2.78964,5,0,0,69860,0,0,0);
REPLACE INTO creature VALUES (128272,24994,530,1,1,0,0,12814.3,-7013.03,71.5392,0.134991,5,0,0,69860,0,0,0);
REPLACE INTO creature VALUES (128273,25142,530,1,1,0,199,12844.4,-7029.01,71.3385,0.389456,5,0,0,6542,0,0,0);
REPLACE INTO creature VALUES (128305,25142,530,1,1,0,199,12837.5,-7034.01,71.3662,3.92767,5,0,0,6542,0,0,0);
REPLACE INTO creature VALUES (128306,25142,530,1,1,0,199,12813,-7023.21,71.5023,3.55696,5,0,0,6986,0,0,0);
REPLACE INTO creature VALUES (128995,25142,530,1,1,0,199,12824.7,-7030.2,71.4917,4.63846,5,0,0,6986,0,0,0);
REPLACE INTO creature VALUES (128996,25142,530,1,1,0,199,12846.1,-7016.44,71.2072,6.07024,5,0,0,6986,0,0,0);
REPLACE INTO creature VALUES (128999,25142,530,1,1,0,199,12844.5,-7001.84,71.2073,0.599942,5,0,0,6542,0,0,0);
REPLACE INTO creature VALUES (129000,25142,530,1,1,0,199,12816.2,-6996.33,71.1676,2.09534,5,0,0,6542,0,0,0);
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('25142', '0', '0', '2', '0', '0', '0', NULL);
REPLACE INTO creature VALUES (129081,25142,530,1,1,0,336,12836.2,-7048.81,19.0953,3.8405,5,0,0,6986,0,0,0);
REPLACE INTO creature VALUES (129082,25142,530,1,1,0,336,12858.2,-7051.09,18.9152,5.61471,5,0,0,6986,0,0,0);
REPLACE INTO creature VALUES (129083,25142,530,1,1,0,336,12849.9,-7049.4,18.923,4.03999,5,0,0,6986,0,0,0);
REPLACE INTO creature VALUES (129084,25142,530,1,1,0,336,12857,-7042,18.9508,0.7853,5,0,0,6986,0,0,0);
REPLACE INTO creature VALUES (129085,25142,530,1,1,0,336,12832.7,-7100.9,5.10339,0.600742,5,0,0,6986,0,0,0);
REPLACE INTO creature VALUES (129086,25142,530,1,1,0,336,12847.1,-7116.2,6.06832,0.612523,5,0,0,6986,0,0,0);
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('78648', '20359', '0', '0', '0', '0', '0', NULL);
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
('100527', '0', '1', '0', '0', '0', '0', NULL),
('100524', '0', '1', '0', '0', '0', '0', NULL),
('100525', '0', '1', '0', '0', '0', '0', NULL),
('100526', '0', '1', '0', '0', '0', '0', NULL),
('100529', '0', '1', '0', '0', '0', '0', NULL),
('58010', '0', '1', '0', '0', '0', '0', NULL),
('57803', '0', '1', '0', '0', '0', '0', NULL),
('57801', '0', '1', '0', '0', '0', '0', NULL),
('100523', '0', '1', '0', '0', '0', '0', NULL),
('100522', '0', '1', '0', '0', '0', '0', NULL),
('100521', '0', '1', '0', '0', '0', '0', NULL),
('100520', '0', '1', '0', '0', '0', '0', NULL),
('100519', '0', '1', '0', '0', '0', '0', NULL);
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('24918', '0', '8', '0', '0', '0', '0', NULL);
# INSERT IGNORE INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES ('45368', '530', '12793.6455', '-6894.34', '30.897', '5.301'), ('45371', '530', '12780.543', '-6876.923', '22.787', '5.386');
UPDATE creature_template SET MovementType=0 WHERE entry IN (17838,17879,17880,21104,17839,21697,21698,18553,17835,21818,17892,18994,18995,17881,21862,18625);
UPDATE creature_template SET MovementType=0 WHERE entry IN (20738,20745,22171,22172,21712,22167,22164,22169,20741,22166,22168,20737);
UPDATE creature_template SET InhabitType=InhabitType|4 WHERE entry=17838;
UPDATE creature_template SET faction_A=168, faction_H=168 WHERE entry IN (21697,21698,21712,22167);
UPDATE creature_template SET unit_flags=unit_flags|768, npcflag=npcflag&~2 WHERE entry=15608;
UPDATE creature_template SET unit_flags=unit_flags|33536 WHERE entry=17023;
UPDATE creature_template SET unit_flags=unit_flags|33554688 WHERE entry IN (21862,18625,17838,18553,18555);
REPLACE INTO creature (guid,id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,DeathState,MovementType) VALUES
(127070, 21862, 269, 3, 1, 0, 0, -2025.52, 7119.707, 22.74707, 3.071779, 7200, 0, 0, 5589, 0, 0, 0),
(129135, 18625, 269, 3, 1, 0, 0, -2025.422, 7119.652, 22.74706, 6.161012, 7200, 0, 0, 5589, 0, 0, 0),
(129136, 18625, 269, 3, 1, 0, 0, -2024.31, 7127.75, 22.65419, 0.4712389, 7200, 0, 0, 5589, 0, 0, 0),
(129157, 18625, 269, 3, 1, 0, 0, -2033.517, 7110.752, 22.85045, 2.635447, 7200, 0, 0, 5589, 0, 0, 0),
(91346, 15608, 269, 3, 1, 0, 0, -2025.295, 7119.58, 22.74709, 3.001966, 300, 0, 0, 6070400, 0, 0, 0);
DELETE FROM creature_template_addon WHERE entry IN (15608,21862,18553,18555);
INSERT INTO creature_template_addon VALUES
(15608,0,0,0,0,0,0,'31635 31556'),
(21862,0,0,0,0,0,0,'32570'),
(18553,0,0,0,0,0,0,'32563'),
(18555,0,0,0,0,0,0,'32566');
Delete from creature_linking_template where entry in (17838,17879,17880,17881,21697,21698,21104,17839,17835,21818,17892,18994,18995,18553);
insert into creature_linking_template values
(17838,269,15608,16,0),
(17879,269,15608,16,0),
(17880,269,15608,16,0),
(17881,269,15608,16,0),
(21697,269,15608,16,0),
(21698,269,15608,16,0),
(21104,269,15608,16,0),
(17839,269,15608,16,0),
(17835,269,15608,16,0),
(21818,269,15608,16,0),
(17892,269,15608,16,0),
(18994,269,15608,16,0),
(18995,269,15608,16,0),
(18553,269,15608,16,0);
REPLACE INTO gossip_menu (entry, text_id) VALUES (8662, 11093);
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=23141;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(1525, 9, 11108, 0),
(1526, 8, 11108, 0),
(1527, -1, 1526, 774),
(1528, 5, 1015, 5),
(1529, 5, 1015, 6),
(1530, 9, 12297, 0),
(1531, 5, 349, 5);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES ('8662', '0', '0', 'Have gone!', '1', '1', '0', '0', '8662', '0', '0', NULL, '9', '11108', '2', '0', '0', '0', '0', '0', '0', '1525');
DELETE FROM `gossip_scripts` WHERE `id` = 8662;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('8662', '0', '15', '41540', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'cast Flight of the Netherwing');
UPDATE `gossip_menu_option` SET `condition_id`='1527' WHERE `menu_id`=8754 AND `id`=0;
UPDATE `gossip_menu` SET `condition_id`='1528' WHERE `entry`=8666 AND `text_id`=10950;
UPDATE `gossip_menu` SET `condition_id`='1529' WHERE `entry`=8666 AND `text_id`=11032;
UPDATE `gossip_menu` SET `condition_id`='1525' WHERE `entry`=8662 AND `text_id`=11093;
UPDATE `gossip_menu_option` SET `condition_id`='1530' WHERE `menu_id`=9546 AND `id`=2;
UPDATE `gossip_menu` SET `condition_id`='1529' WHERE `entry`=8652 AND `text_id`=10864;
UPDATE `creature_template` SET `gossip_menu_id`='9051' WHERE `entry`=24937;
REPLACE INTO gossip_menu (entry, text_id) VALUES (9051, 12239);
DELETE FROM `spell_area` WHERE `spell` = 42016;
REPLACE INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES
(40214, 3759, 11013, 0, 0, 0, 0, 2, 1),
(40214, 3939, 11013, 0, 0, 0, 0, 2, 1),
(40214, 3965, 11013, 0, 0, 0, 0, 2, 1),
(40214, 3966, 11013, 0, 0, 0, 0, 2, 1);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1532', '-1', '348', '490'), ('1533', '-1', '348', '489');
REPLACE INTO gossip_menu (entry, text_id) VALUES (6506, 10565);
REPLACE INTO gossip_menu (entry, text_id) VALUES (6478, 10571);
UPDATE `gossip_menu` SET `condition_id`='1532' WHERE `entry`=6506 AND `text_id`=7700;
UPDATE `gossip_menu` SET `condition_id`='1533' WHERE `entry`=6506 AND `text_id`=10565;
UPDATE `gossip_menu` SET `condition_id`='1532' WHERE `entry`=6478 AND `text_id`=7679;
UPDATE `gossip_menu` SET `condition_id`='1533' WHERE `entry`=6478 AND `text_id`=10571;
delete from creature where id=19220;
UPDATE creature_template SET MovementType=0 WHERE entry IN (19220,19168,20990,19510,20988,20059,19735);
UPDATE creature_template SET MovementType=0 WHERE entry IN (21537,21539,21523,21522,21540,21541,21542);
DELETE FROM `creature` WHERE `id` = 2638;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-20' WHERE `item`=34500;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=35232 AND `item`=24669;
DELETE FROM `item_loot_template` WHERE `entry` = 35232 AND `item` = 29434;
UPDATE `gossip_menu_option` SET `cond_1`='0', `cond_1_val_1`='0', `cond_1_val_2`='0', `cond_2`='0', `cond_2_val_1`='0', `cond_2_val_2`='0', `condition_id`='0' WHERE `menu_id`=9143 AND `id`=0;
DELETE FROM `conditions` WHERE `condition_entry` = 739;
DELETE FROM `conditions` WHERE `condition_entry` = 836;
DELETE FROM `conditions` WHERE `condition_entry` = 1026;
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14364', '15', 'Kaskala Supplies');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('188164', '14364', '0', 'Kaskala Supplies');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(20586, 188164, 571, 1, 1, 2850.95, 4360.08, 2.86494, 3.0123, 0, 0, 0.997911, 0.0646013, 300, 100, 1),
(44615, 188164, 571, 1, 1, 2861.54, 4319.45, 1.57662, 2.80809, 0, 0, 0.986129, 0.16598, 300, 100, 1),
(44616, 188164, 571, 1, 1, 2878.02, 4869.76, -2.43621, -1.76278, 0, 0, -0.771624, 0.636079, 300, 100, 1),
(44617, 188164, 571, 1, 1, 2879.1, 4905.58, 2.53965, -2.68781, 0, 0, -0.97437, 0.22495, 300, 100, 1),
(44618, 188164, 571, 1, 1, 2890.17, 4936.33, 1.87172, -1.93731, 0, 0, -0.824125, 0.566409, 300, 100, 1),
(44619, 188164, 571, 1, 1, 2904.35, 4343.52, 3.8419, 5.66694, 0, 0, 0.30327, -0.952905, 300, 100, 1),
(44620, 188164, 571, 1, 1, 2913.26, 4930.27, 2.56173, -2.82743, 0, 0, -0.987688, 0.156436, 300, 100, 1),
(44621, 188164, 571, 1, 1, 2916.97, 4348.23, 3.43156, 2.4311, 0, 0, 0.937561, 0.347821, 300, 100, 1),
(44622, 188164, 571, 1, 1, 2918.71, 4889.01, 2.5603, 0.90757, 0, 0, 0.438371, 0.898794, 300, 100, 1),
(44623, 188164, 571, 1, 1, 2923.61, 4830.15, 0.39622, -0.191985, 0, 0, -0.0958451, 0.995396, 300, 100, 1),
(20587, 188164, 571, 1, 1, 2929.54, 4821.67, -1.11707, 2.28638, 0, 0, 0.909961, 0.414694, 300, 100, 1),
(10984, 188164, 571, 1, 1, 2969.29, 4851.23, 0.408302, 1.74533, 0, 0, 0.766045, 0.642787, 300, 100, 1),
(10982, 188164, 571, 1, 1, 2970.12, 4832.7, 0.397131, 0.168013, 0, 0, 0.0839077, 0.996474, 300, 100, 1),
(10981, 188164, 571, 1, 1, 2985.65, 4617.58, -4.80682, -1.67551, 0, 0, -0.743143, 0.669133, 300, 100, 1),
(10979, 188164, 571, 1, 1, 2988.11, 4615.75, 0.396222, -1.67551, 0, 0, -0.743144, 0.669131, 300, 100, 1),
(10978, 188164, 571, 1, 1, 2991.87, 4628.22, 0.39622, -0.610864, 0, 0, -0.300705, 0.953717, 300, 100, 1),
(10976, 188164, 571, 1, 1, 3000.35, 4847.27, 0.397131, 3.71409, 0, 0, 0.95931, -0.282356, 300, 100, 1),
(10974, 188164, 571, 1, 1, 3021.48, 4658.09, 0.396221, -2.46091, 0, 0, -0.942641, 0.333809, 300, 100, 1),
(10973, 188164, 571, 1, 1, 3022.77, 4882.04, 0.396479, 1.98622, 0, 0, 0.837728, 0.546087, 300, 100, 1),
(10972, 188164, 571, 1, 1, 3024.14, 4664.19, -5.18239, -2.46091, 0, 0, -0.942641, 0.333809, 300, 100, 1),
(10971, 188164, 571, 1, 1, 3027.96, 4724.95, 0.39621, -0.052359, 0, 0, -0.0261765, 0.999657, 300, 100, 1),
(10970, 188164, 571, 1, 1, 3028.04, 4697.86, 0.396387, 5.91434, 0, 0, 0.183379, -0.983042, 300, 100, 1),
(10969, 188164, 571, 1, 1, 3035.66, 4777.6, 0.396206, -2.40855, 0, 0, -0.93358, 0.358368, 300, 100, 1),
(10968, 188164, 571, 1, 1, 3051.93, 4808.58, 2.03703, 0.820303, 0, 0, 0.398748, 0.91706, 300, 100, 1),
(10967, 188164, 571, 1, 1, 3056.26, 4769.32, 1.67914, 2.54818, 0, 0, 0.956305, 0.292372, 300, 100, 1),
(10966, 188164, 571, 1, 1, 3058.02, 4826.49, 1.37582, 1.85005, 0, 0, 0.798636, 0.601815, 300, 100, 1),
(10964, 188164, 571, 1, 1, 3060.99, 4765.1, 1.13404, -1.74533, 0, 0, -0.766044, 0.642789, 300, 100, 1),
(10963, 188164, 571, 1, 1, 3075.67, 4824.07, 1.22049, 1.88495, 0, 0, 0.809015, 0.587788, 300, 100, 1),
(10962, 188164, 571, 1, 1, 3083.98, 4848.85, 3.17761, 0.575957, 0, 0, 0.284015, 0.95882, 300, 100, 1),
(10958, 188164, 571, 1, 1, 3091.62, 4835.64, 1.77486, 4.63695, 0, 0, 0.733269, -0.679938, 300, 100, 1),
(10956, 188164, 571, 1, 1, 3091.62, 4835.64, 1.77486, 4.63695, 0, 0, 0.733269, -0.679938, 300, 100, 1),
(10951, 188164, 571, 1, 1, 3092.69, 4880.6, 0.396219, -1.79769, 0, 0, -0.782608, 0.622515, 300, 100, 1),
(10948, 188164, 571, 1, 1, 3093.4, 4881.64, -5.18705, -2.58308, 0, 0, -0.961261, 0.275641, 300, 100, 1),
(10946, 188164, 571, 1, 1, 3094.19, 4792.84, 1.99428, 1.27409, 0, 0, 0.594823, 0.803857, 300, 100, 1),
(10943, 188164, 571, 1, 1, 3099.82, 4804.06, 1.22049, 1.309, 0, 0, 0.608763, 0.793352, 300, 100, 1),
(10940, 188164, 571, 1, 1, 3109.01, 4778.86, 6.53474, -3.07177, 0, 0, -0.999391, 0.0349061, 300, 100, 1),
(10939, 188164, 571, 1, 1, 3122.12, 4826.62, 1.44228, 0.471238, 0, 0, 0.233445, 0.97237, 300, 100, 1),
(10932, 188164, 571, 1, 1, 3123.7, 4742.73, 7.44305, 3.07177, 0, 0, 0.999391, 0.0349061, 300, 100, 1),
(10930, 188164, 571, 1, 1, 3133.73, 4752.5, 8.12196, -0.314158, 0, 0, -0.156434, 0.987688, 300, 100, 1);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-10' WHERE `item`=34248;
DELETE FROM `creature_involvedrelation` WHERE `quest` = 11513;
DELETE FROM `creature_questrelation` WHERE `quest` = 11513;
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14365', '26', 'Apexis Shard Formation');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('185911', '14365', '0', 'Apexis Shard Formation');
UPDATE `gossip_menu_option` SET `option_text`='Place 35 Apexis Shards near the dragon egg to crack it open.' WHERE `menu_id`=8685 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Place 35 Apexis Shards near the dragon egg to crack it open.' WHERE `menu_id`=8690 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Place 35 Apexis Shards near the dragon egg to crack it open.' WHERE `menu_id`=8691 AND `id`=0;
DELETE FROM `gameobject` WHERE `id` = 187875;
DELETE FROM `gameobject` WHERE `id` = 187850;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='100' WHERE `item`=32569;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `item`=32569;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='30',`maxcount`='1' WHERE `ChanceOrQuestChance`<'100' AND `item`=32569;
DELETE FROM `creature_loot_template` WHERE `item` in (32576,32670,32671,32672,32673,32674,32675,32676,32677,32678,32679);
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`, `condition_id`) VALUES
(19973, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(20557, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22175, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22180, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22181, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22182, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22195, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22204, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22241, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22242, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22243, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22244, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22254, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22275, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22281, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22291, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22298, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(22304, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(23061, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(23154, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(23174, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(23230, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(23261, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(23281, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(23282, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(23333, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(23353, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(23354, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(23355, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(23385, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(23386, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(23390, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(23391, 32576, 5, 0, -32576, 1, 0, 0, 0, 0),
(24917, 32576, 5, 0, -32576, 1, 0, 0, 0, 0);
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`, `condition_id`) VALUES
('32576', '32576', '0', '1', '1', '1', '0', '0', '0', '0'),
('32576', '32670', '5', '1', '1', '1', '0', '0', '0', '0'),
('32576', '32671', '5', '1', '1', '1', '0', '0', '0', '0'),
('32576', '32672', '5', '1', '1', '1', '0', '0', '0', '0'),
('32576', '32673', '5', '1', '1', '1', '0', '0', '0', '0'),
('32576', '32674', '5', '1', '1', '1', '0', '0', '0', '0'),
('32576', '32675', '2', '1', '1', '1', '0', '0', '0', '0'),
('32576', '32676', '2', '1', '1', '1', '0', '0', '0', '0'),
('32576', '32677', '5', '1', '1', '1', '0', '0', '0', '0'),
('32576', '32678', '5', '1', '1', '1', '0', '0', '0', '0'),
('32576', '32679', '5', '1', '1', '1', '0', '0', '0', '0');
UPDATE `quest_template` SET `RequestItemsText`='In my dreams, I can sometimes hear the doomed moans of my brethren! Please, good $Gsir:madam;, free them from the bonds and quiet their cries.' WHERE `entry`=289;
UPDATE `quest_template` SET `OfferRewardText`='Ah, you wish to petition me for a test of valor. Splendid.$B$BThere are many tasks throughout the city and surrounding lands that hold much challenge, and they could use a $Gman:woman; with your skills.$B$BThis test should not be taken lightly, $N. This, like many things along our path, could take our lives. The Church always wishes to bolster its ranks, but it understands the sacrifices needed to ensure the paladins serving it are worthy.$B$BAre you prepared?' WHERE `entry`=1649;
UPDATE `quest_template` SET `RequestItemsText`='How goes your mission, $C.' WHERE `entry`=323;
DELETE FROM `page_text` WHERE `entry` = 877;
delete from creature_linking_template where entry in (18925,18806);
insert into creature_linking_template values
(18925,550,18805,4112,0),
(18806,550,18805,4112,0);
DELETE FROM `creature` WHERE `guid` = 61704;
REPLACE INTO `creature_template_addon` (`entry`, `auras`) VALUES ('24917', '44855');
UPDATE `creature` SET `id`='21196' WHERE `guid`=77860;
UPDATE `creature` SET `id`='20795' WHERE `guid`=92448;
UPDATE creature SET position_x = '-2629.419678', position_y = '1365.326782', position_z = '33.796543', orientation = '3.270391' WHERE guid = '63282';
UPDATE creature SET position_x = '-2667.588623', position_y = '1347.309814', position_z = '34.445335', orientation = '3.423544' WHERE guid = '63901';
UPDATE `creature` SET `spawndist`='8', `curhealth`='6761', `curmana`='0', `MovementType`='1' WHERE `guid`=77860;
UPDATE `creature` SET `spawndist`='0', `curhealth`='6803', `curmana`='2991', `MovementType`='0' WHERE `guid`=92448;
UPDATE creature SET position_x = '-2593.266602', position_y = '1383.786743', position_z = '44.274952', orientation = '3.778532' WHERE guid = '92448';
DELETE FROM creature WHERE guid=124435;
DELETE FROM creature_addon WHERE guid=124435;
DELETE FROM creature_movement WHERE id=124435;
DELETE FROM game_event_creature WHERE guid=124435;
DELETE FROM game_event_creature_data WHERE guid=124435;
DELETE FROM creature_battleground WHERE guid=124435;
DELETE FROM creature WHERE guid=124384;
DELETE FROM creature_addon WHERE guid=124384;
DELETE FROM creature_movement WHERE id=124384;
DELETE FROM game_event_creature WHERE guid=124384;
DELETE FROM game_event_creature_data WHERE guid=124384;
DELETE FROM creature_battleground WHERE guid=124384;
DELETE FROM creature WHERE guid=124676;
DELETE FROM creature_addon WHERE guid=124676;
DELETE FROM creature_movement WHERE id=124676;
DELETE FROM game_event_creature WHERE guid=124676;
DELETE FROM game_event_creature_data WHERE guid=124676;
DELETE FROM creature_battleground WHERE guid=124676;
DELETE FROM creature WHERE guid=124675;
DELETE FROM creature_addon WHERE guid=124675;
DELETE FROM creature_movement WHERE id=124675;
DELETE FROM game_event_creature WHERE guid=124675;
DELETE FROM game_event_creature_data WHERE guid=124675;
DELETE FROM creature_battleground WHERE guid=124675;
DELETE FROM creature WHERE guid=124329;
DELETE FROM creature_addon WHERE guid=124329;
DELETE FROM creature_movement WHERE id=124329;
DELETE FROM game_event_creature WHERE guid=124329;
DELETE FROM game_event_creature_data WHERE guid=124329;
DELETE FROM creature_battleground WHERE guid=124329;
DELETE FROM creature WHERE guid=124328;
DELETE FROM creature_addon WHERE guid=124328;
DELETE FROM creature_movement WHERE id=124328;
DELETE FROM game_event_creature WHERE guid=124328;
DELETE FROM game_event_creature_data WHERE guid=124328;
DELETE FROM creature_battleground WHERE guid=124328;
DELETE FROM creature WHERE guid=124677;
DELETE FROM creature_addon WHERE guid=124677;
DELETE FROM creature_movement WHERE id=124677;
DELETE FROM game_event_creature WHERE guid=124677;
DELETE FROM game_event_creature_data WHERE guid=124677;
DELETE FROM creature_battleground WHERE guid=124677;
DELETE FROM creature WHERE guid=124678;
DELETE FROM creature_addon WHERE guid=124678;
DELETE FROM creature_movement WHERE id=124678;
DELETE FROM game_event_creature WHERE guid=124678;
DELETE FROM game_event_creature_data WHERE guid=124678;
DELETE FROM creature_battleground WHERE guid=124678;
DELETE FROM creature WHERE guid=111487;
DELETE FROM creature_addon WHERE guid=111487;
DELETE FROM creature_movement WHERE id=111487;
DELETE FROM game_event_creature WHERE guid=111487;
DELETE FROM game_event_creature_data WHERE guid=111487;
DELETE FROM creature_battleground WHERE guid=111487;
DELETE FROM creature WHERE guid=111491;
DELETE FROM creature_addon WHERE guid=111491;
DELETE FROM creature_movement WHERE id=111491;
DELETE FROM game_event_creature WHERE guid=111491;
DELETE FROM game_event_creature_data WHERE guid=111491;
DELETE FROM creature_battleground WHERE guid=111491;
DELETE FROM creature WHERE guid=111490;
DELETE FROM creature_addon WHERE guid=111490;
DELETE FROM creature_movement WHERE id=111490;
DELETE FROM game_event_creature WHERE guid=111490;
DELETE FROM game_event_creature_data WHERE guid=111490;
DELETE FROM creature_battleground WHERE guid=111490;
DELETE FROM creature WHERE guid=111488;
DELETE FROM creature_addon WHERE guid=111488;
DELETE FROM creature_movement WHERE id=111488;
DELETE FROM game_event_creature WHERE guid=111488;
DELETE FROM game_event_creature_data WHERE guid=111488;
DELETE FROM creature_battleground WHERE guid=111488;
DELETE FROM creature WHERE guid=111493;
DELETE FROM creature_addon WHERE guid=111493;
DELETE FROM creature_movement WHERE id=111493;
DELETE FROM game_event_creature WHERE guid=111493;
DELETE FROM game_event_creature_data WHERE guid=111493;
DELETE FROM creature_battleground WHERE guid=111493;
DELETE FROM creature WHERE guid=111489;
DELETE FROM creature_addon WHERE guid=111489;
DELETE FROM creature_movement WHERE id=111489;
DELETE FROM game_event_creature WHERE guid=111489;
DELETE FROM game_event_creature_data WHERE guid=111489;
DELETE FROM creature_battleground WHERE guid=111489;
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES ('2000000683', '%s becomes energized with arcane magic.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `spell_scripts` WHERE `id` = 44969;
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('44969', '0', '0', '2', '0', '0', '0', '2', '2000000683', '0', '0', '0', '0', '0', '0', '0', '');
DELETE FROM `creature` WHERE `id` = 25047;
DELETE FROM spell_script_target WHERE entry IN (72260, 72202, 72278,72279,72280);
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES
(72260, 1, 37813),
(72278, 1, 37813),
(72279, 1, 37813),
(72280, 1, 37813),
(72202, 1, 37813);
DELETE FROM spell_script_target WHERE entry = 72771;
INSERT INTO spell_script_target VALUES (72771, 1, 38508);
delete from creature_linking_template where entry in (38508);
insert into creature_linking_template values
(38508,631,37813,4112,0);
UPDATE creature_template SET AIName='EventAI' WHERE entry=38508;
DELETE FROM creature_ai_scripts WHERE creature_id=38508;
INSERT INTO creature_ai_scripts VALUES 
('3850801','38508','11','0','100','30','0','0','0','0','21','0','0','0','20','0','0','0','0','0','0','0','Blood Beast - Set Combat movement and auto attack false on Spawn'),
('3850802','38508','0','0','100','30','3000','3000','0','0','20','1','0','0','21','1','0','0','38','0','0','0','Blood Beast - Set Combat movement and auto attack true and set in combat with zone');
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=100 WHERE `item` in (22545,22561,22560);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 183395;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 183396;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 183397;
UPDATE `gameobject_template` SET `data1`='183394' WHERE `entry`=183395;
UPDATE `gameobject_template` SET `data1`='183394' WHERE `entry`=183396;
UPDATE `gameobject_template` SET `data1`='183394' WHERE `entry`=183397;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 185169 AND `item` = 29434;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 185168 AND `item` = 30592;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 185169 AND `item` = 30592;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='10' WHERE `entry`=18436 AND `item`=30594;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='10' WHERE `entry`=18433 AND `item`=30594;
UPDATE `gameobject_loot_template` SET `item`='30592', `ChanceOrQuestChance`='10', `mincountOrRef`='-30592' WHERE `entry`=185169 AND `item`=30594;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`, `condition_id`) VALUES
(30592, 30592, 0, 1, 1, 1, 0, 0, 0, 0),
(30592, 30593, 0, 1, 1, 1, 0, 0, 0, 0),
(30592, 30594, 0, 1, 1, 1, 0, 0, 0, 0);
REPLACE INTO `gossip_menu` (`entry`,`text_id`,`condition_id`) VALUES (4862,5940,1531);
UPDATE `creature_template` SET `InhabitType` = 3 WHERE `entry` = 31070;
UPDATE `creature_template` SET `npcflag` = 0, `speed_walk` = 7.2, `speed_run` = 4.28571, `InhabitType` = 3 WHERE `entry` = 29709;
UPDATE `gameobject_template` SET `data1`='184740' WHERE `entry`=184741;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 184741;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1' WHERE `entry` = 184740;
UPDATE `gameobject_template` SET `data1`='164658' WHERE `entry`=164778;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 164778;
UPDATE `gameobject_template` SET `data1`='164659' WHERE `entry`=164779;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 164779;
UPDATE `gameobject_template` SET `data1`='164660' WHERE `entry`=164780;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 164780;
UPDATE `gameobject_template` SET `data1`='164661' WHERE `entry`=164781;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 164781;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('836', '-2', '728', '828');
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10598 AND `id` = 1;
UPDATE `gossip_menu_option` SET `condition_id`='836' WHERE `menu_id`=10598 AND `id`=0;
DELETE FROM `page_text` WHERE `entry`=3562;
INSERT INTO `page_text` (`entry`, `text`, `next_page`) VALUES
(3562, 'The tiny gnome peered over the railing into the secluded Dalaran courtyard.$B$B"The view from the balcony is amazing.  You have to come see!"$B$BArmor legplates creaked as Marcus walked over, taking in a deep breath as he absently scratched his scruffy chin.$B$B"The Hero''s Welcome is no slouch.  And there''s something in the room that might interest you."$B$BTavi bounded into the room, pausing only a moment before jumping onto the massive bed.  She turned to gaze at Marcus with her huge saucer-like eyes, narrowing them playfully and replacing her glowing smile with a diabolical grin.', 3563);
UPDATE `quest_template` SET `RequiredRaces`='690' WHERE `entry` in (10623,10663,12423);
UPDATE `quest_template` SET `RequiredRaces`='1101' WHERE `entry` in (10621,10662,11185,11237,8829);
UPDATE `quest_template` SET `PrevQuestId`='10626' WHERE `entry`=10662;
UPDATE `quest_template` SET `PrevQuestId`='10664', `ExclusiveGroup`='-10665' WHERE `entry` in (10665,10666);
UPDATE `quest_template` SET `PrevQuestId`='10665', `ExclusiveGroup`='-10667' WHERE `entry` in (10667,10670);
UPDATE `quest_template` SET `PrevQuestId`='10667' WHERE `entry`=10676;
UPDATE `gameobject` SET `position_x`=-3420.991,`position_y`=1373.175,`position_z`=257.5233,`orientation`=3.141593 WHERE `id`=185032;
UPDATE `quest_template` SET `PrevQuestId`='0' WHERE `entry`=10679;
DELETE FROM `item_loot_template` WHERE `entry` = 34595 AND `item` = 27498;
DELETE FROM `item_loot_template` WHERE `entry` = 34594 AND `item` = 27498;
DELETE FROM `item_loot_template` WHERE `entry` = 34593 AND `item` = 27498;
DELETE FROM `item_loot_template` WHERE `entry` = 34592 AND `item` = 27498;
DELETE FROM `item_loot_template` WHERE `entry` = 34587 AND `item` = 27498;
DELETE FROM `item_loot_template` WHERE `entry` = 34585 AND `item` = 27498;
DELETE FROM `item_loot_template` WHERE `entry` = 34584 AND `item` = 27498;
DELETE FROM `item_loot_template` WHERE `entry` = 34583 AND `item` = 27498;
DELETE FROM `item_loot_template` WHERE `entry` = 27511 AND `item` = 27498;
DELETE FROM `item_loot_template` WHERE `entry` = 33926 AND `item` = 27498;
DELETE FROM `item_loot_template` WHERE `entry` = 28499 AND `item` = 27498;
DELETE FROM `item_loot_template` WHERE `entry` = 20601 AND `item` = 10305;
DELETE FROM `item_loot_template` WHERE `entry` = 20603 AND `item` = 10305;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=20601 AND `item`=27498;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=20603 AND `item`=27498;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='1' WHERE `entry`=33926 AND `item`=33457;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=27511 AND `item`=33457;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34583 AND `item`=33457;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34587 AND `item`=33457;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34584 AND `item`=33457;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34585 AND `item`=33457;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34592 AND `item`=22829;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34592 AND `item`=22832;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34592 AND `item`=27860;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34592 AND `item`=33457;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34592 AND `item`=27855;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34593 AND `item`=22829;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34593 AND `item`=22832;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34593 AND `item`=27860;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34593 AND `item`=33457;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34594 AND `item`=22829;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34594 AND `item`=22832;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34594 AND `item`=33457;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34595 AND `item`=22829;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34595 AND `item`=22832;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34595 AND `item`=27855;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34595 AND `item`=27860;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34595 AND `item`=33457;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1', `maxcount` = '3' WHERE `entry` in (34592,34593,34594,34595) AND `item` in (28104,32062);
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '2', `maxcount` = '2' WHERE `entry` in (34592,34593,34594,34595) AND `item` in (22823,22824,22827,22830,22831,22833,22834,22835,22840,32067,32068);
UPDATE creature_loot_template SET ChanceOrQuestChance=ABS(ChanceOrQuestChance) WHERE item in (23984);
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(602,4841,1,1,1,0,0,-3949.688,-3471.041,29.15445,4.288023,360,0,0,1902,0,2);
UPDATE `creature_template` SET `MovementType`=2 WHERE `entry`=4841;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(602,1,-3942.966,-3455.51,28.89743),
(602,2,-3943.117,-3456.498,28.89743),
(602,3,-3948.063,-3467.443,29.64743),
(602,4,-3950.123,-3472.004,29.02243),
(602,5,-3953.303,-3479.054,28.64743),
(602,6,-3953.303,-3479.054,28.64743);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `item`=5945;
UPDATE `creature_template_addon` SET `auras`='49343' WHERE `entry`=27693;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(104346, 32630, 571, 1, 1, 0, 0, 6913.31, -1725.26, 954.792, 0.723418, 28800, 0, 0, 18900, 0, 2);
UPDATE `creature_template` SET `MovementType`=2 WHERE `entry`=32630;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(104346,1,7024.75,-1625.538,957.3694),
(104346,2,7025.494,-1624.87,957.3694),
(104346,3,7167.578,-1501.694,962.5693),
(104346,4,7440.402,-1295.861,997.2911),
(104346,5,7210.958,-1046.892,1006.18),
(104346,6,6998.465,-1076.847,1024.819),
(104346,7,6874.249,-1097.382,927.736),
(104346,8,6614.792,-875.7547,812.7645),
(104346,9,6563.275,-811.7673,749.8757),
(104346,10,6299.502,-797.577,529.1257),
(104346,11,6194.549,-1013.144,501.5424),
(104346,12,6319.254,-1251.661,468.6258),
(104346,13,6309.161,-1537.857,615.0423),
(104346,14,6748.211,-1664.307,919.3118),
(104346,15,6913.308,-1725.261,954.7917),
(104346,16,7167.578,-1501.694,962.5693),
(104346,17,7440.402,-1295.861,997.2911);
DELETE FROM `item_loot_template` WHERE `item` = 954;
DELETE FROM `creature_loot_template` WHERE `item` = 954;
DELETE FROM `reference_loot_template` WHERE `entry` = 954;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='0.5' WHERE `item` in (4419);
DELETE FROM `item_loot_template` WHERE `entry` = 21511 AND `item` = 1477;
DELETE FROM `item_loot_template` WHERE `entry` = 21510 AND `item` = 1477;
DELETE FROM `item_loot_template` WHERE `entry` = 9540 AND `item` = 1477;
DELETE FROM `item_loot_template` WHERE `entry` = 6827 AND `item` = 1477;
DELETE FROM `pickpocketing_loot_template` WHERE `entry` = 4297 AND `item` = 1477;
UPDATE `item_loot_template`SET`ChanceOrQuestChance`='100' WHERE `entry`=6307 AND `item`=1477;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 2560 AND `item` = 1477;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 4096 AND `item` = 1477;
DELETE FROM `creature_loot_template` WHERE `item` = 1477;
DELETE FROM `item_loot_template` WHERE `entry` = 6307 AND `item` = 6304;
DELETE FROM `item_loot_template` WHERE `entry` = 6307 AND `item` = 6305;
DELETE FROM `item_loot_template` WHERE `entry` = 6307 AND `item` = 6306;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`, `condition_id`) VALUES
(1477, 6304, 0, 1, 1, 1, 0, 0, 0, 0),
(1477, 6305, 0, 1, 1, 1, 0, 0, 0, 0),
(1477, 6306, 0, 1, 1, 1, 0, 0, 0, 0);
DELETE FROM `pickpocketing_loot_template` WHERE `entry` = 7396 AND `item` = 4419;
DELETE FROM `item_loot_template` WHERE `entry` = 15699 AND `item` = 4419;
DELETE FROM `item_loot_template` WHERE `entry` = 9540 AND `item` = 4419;
DELETE FROM `item_loot_template` WHERE `entry` = 8484 AND `item` = 4419;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=9540 AND `item`=10305;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 153123 AND `item` = 4419;
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('2560', '14366', '0', 'Half-Buried Bottle');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14366', '5', 'Half-Buried Bottle');
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='35', `groupid`='1' WHERE `entry`=2560 AND `item`=4098;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1' WHERE `entry`=2560 AND `item`=4100;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1' WHERE `entry`=2560 AND `item`=4101;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1' WHERE `entry`=2560 AND `item`=4102;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='10' WHERE `entry`=2560 AND `item`=4419;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='1' WHERE `entry`=2560 AND `item`=7975;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='25' WHERE `entry`=8484 AND `item`=3928;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='25' WHERE `entry`=8484 AND `item`=6149;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=8484 AND `item`=10305;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='10' WHERE `entry`=15699 AND `item`=10305;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1' WHERE `entry`=15699 AND `item`=8932;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1' WHERE `entry`=15699 AND `item`=8950;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1' WHERE `entry`=15699 AND `item`=8952;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1' WHERE `entry`=15699 AND `item`=8953;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='50' WHERE `entry`=15699 AND `item`=13443;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='50' WHERE `entry`=15699 AND `item`=13446;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='15' WHERE `entry`=15699 AND `item`=15564;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='80' WHERE `entry`=15699 AND `item`=8766;
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('176224', '14367', '0', 'Supply Crate');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14367', '2', 'Supply Crate');
DELETE FROM `gameobject_loot_template` WHERE `entry` = 176224 AND `item` = 10305;
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('153123', '14368', '0', 'Kim''jael''s Equipment');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14368', '5', 'Kim''jael''s Equipment');
UPDATE `gameobject` SET `spawntimesecs`='120' WHERE `id`=153123;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1' WHERE `entry` = 153123 AND `item` = 1645;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1' WHERE `entry` = 153123 AND `item` = 3927;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1' WHERE `entry` = 153123 AND `item` = 4599;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1' WHERE `entry` = 153123 AND `item` = 4601;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1' WHERE `entry` = 153123 AND `item` = 4602;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1' WHERE `entry` = 153123 AND `item` = 4608;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=153123 AND `item`=3928;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=153123 AND `item`=6149;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='1' WHERE `entry`=153123 AND `item`=10305;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='-20' WHERE `entry`=153123 AND `item`=10715;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='-20' WHERE `entry`=153123 AND `item`=10717;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='-20' WHERE `entry`=153123 AND `item`=10718;
UPDATE`gameobject_loot_template`  SET `ChanceOrQuestChance`='-20' WHERE `entry`=153123 AND `item`=10722;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='1', `mincountOrRef`='-3914' WHERE `item`=3914;
DELETE FROM `item_loot_template` WHERE `entry` = 5758 AND `item` = 4500;
DELETE FROM `item_loot_template` WHERE `entry` = 5759 AND `item` = 4500;
DELETE FROM `item_loot_template` WHERE `entry` = 10752 AND `item` = 4500;
DELETE FROM `item_loot_template` WHERE `entry` = 19296 AND `item` = 4500;
DELETE FROM `item_loot_template` WHERE `entry` = 19425 AND `item` = 804;
DELETE FROM `item_loot_template` WHERE `entry` = 19425 AND `item` = 1725;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='0.2' WHERE `item` in (3914,1725,4500);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 2850 AND `item` = 1725;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 2852 AND `item` = 1725;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 2855 AND `item` = 1725;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 2857 AND `item` = 1725;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 4149 AND `item` = 1725;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 74448 AND `item` = 1725;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 75299 AND `item` = 1725;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 105581 AND `item` = 1725;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 153451 AND `item` = 1725;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 153453 AND `item` = 1725;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 153454 AND `item` = 1725;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 153462 AND `item` = 1725;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 181804 AND `item` = 1725;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='1', `mincountOrRef`='-3914' WHERE `item`=3914;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='1', `mincountOrRef`='-3914',`item`=3914 WHERE `item`=1725;
UPDATE `npc_vendor` SET `maxcount`='2' WHERE `entry`=14847 AND `item`=2290;
UPDATE `npc_vendor` SET `maxcount`='3' WHERE `entry`=14847 AND `item`=3012;
UPDATE `npc_vendor` SET `maxcount`='2' WHERE `entry`=14847 AND `item`=4425;
UPDATE `npc_vendor` SET `maxcount`='3' WHERE `entry`=14847 AND `item`=954;
UPDATE `npc_vendor` SET `maxcount`='3' WHERE `entry`=14847 AND `item`=1181;
UPDATE `npc_vendor` SET `maxcount`='3' WHERE `entry`=14847 AND `item`=3013;
UPDATE `npc_vendor` SET `maxcount`='2' WHERE `entry`=14847 AND `item`=2289;
UPDATE `npc_vendor` SET `maxcount`='2' WHERE `entry`=14847 AND `item`=4421;
DELETE FROM `npc_vendor` WHERE `entry` = 24780 AND `item` = 27498;
DELETE FROM `npc_vendor` WHERE `entry` = 24780 AND `item` = 27499;
DELETE FROM `npc_vendor` WHERE `entry` = 24780 AND `item` = 27503;
UPDATE `creature_template` SET `equipment_id` = 2323 WHERE `entry` = 37205;
INSERT INTO `creature_equip_template` VALUES ('2323', '49767', '0', '0');

# Herurg
UPDATE `creature_template` SET `equipment_id` = 853 WHERE `entry` = 34980;

# NeatElves
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `guid`=62584;
UPDATE `creature` SET `curmana`='200' WHERE `guid` in (62389,62584);
UPDATE `creature_template` SET `minmana`='200', `maxmana`='200' WHERE `entry` in (17900,17901);
DELETE FROM `gossip_scripts` WHERE `id` in (7559, 50010, 50011, 50012, 7560, 50005, 50006, 50007);
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(7559, 0, 8, 17900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(7559, 0, 15, 31808, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(7560, 0, 8, 17901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(7560, 0, 15, 31807, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(50005, 0, 15, 31812, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(50005, 0, 8, 17901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(50006, 0, 15, 31813, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(50006, 0, 8, 17901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(50007, 0, 8, 17901, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(50007, 0, 15, 31814, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(50010, 0, 8, 17900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(50010, 0, 15, 31810, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(50011, 0, 8, 17900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(50011, 0, 15, 31811, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(50012, 0, 8, 17900, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(50012, 0, 15, 31815, 0, 0, 0, 8, 0, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE `creature_template` SET `MovementType`=0 WHERE `entry`=32630;
UPDATE `creature_template` SET `flags_extra`=64 WHERE `entry` IN (30544,30407);
UPDATE `creature_template` SET `faction_H`=2068,`faction_A`=2068 WHERE `entry` IN (30830,30831,30829);
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry`=13044;
UPDATE `quest_template` SET `RequiredClasses`=1502 WHERE `entry`=13104;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=36794;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=21033;
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=21659;
UPDATE `creature_template` SET `unit_flags`='32768', `pickpocketloot`='0' WHERE `entry`=24960;
UPDATE `creature_template` SET `lootid`='24960', `pickpocketloot`='0' WHERE `entry`=24966;
UPDATE `creature_template` SET `unit_flags`='33587200', `flags_extra`='2' WHERE `entry`=25047;
DELETE FROM `pickpocketing_loot_template` WHERE `entry` in (24960,24966);
DELETE FROM `creature_loot_template` WHERE `entry` = 24966;
INSERT IGNORE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES
(5940, 'Need TXT YTDB', '', 0, 100, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);


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

UPDATE db_version SET `cache_id`= '622';
UPDATE db_version SET `version`= 'YTDB_0.14.5_R622_MaNGOS_R11994_SD2_R2567_ACID_R309c_RuDB_R50';
