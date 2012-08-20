# Y2kCat
ALTER TABLE db_version_ytdb CHANGE COLUMN 626_FIX_12073 627_FIX_12092 bit;
REPLACE INTO `db_version_ytdb` (`version`) VALUES ('627_FIX_12092');

# Error_LOG_SD2
delete from spell_script_target where entry=44233;
insert into spell_script_target values
(44233,0,188165),
(44233,0,188166);
delete from spell_script_target where entry in (32124);
insert into spell_script_target values
(32124,1,17968);

# FIX
UPDATE `creature_template` SET `unit_flags` = 4, `spell1` = 43997, `spell2` = 43986 WHERE `entry` = 27992;
UPDATE `creature_template` SET `unit_flags` = 4, `spell1` = 43997, `spell2` = 43986 WHERE `entry` = 27993;
REPLACE INTO `game_event_gameobject` SELECT `guid`,'9' FROM `gameobject` WHERE `id`=194047;
REPLACE INTO `game_event_gameobject` SELECT `guid`,'9' FROM `gameobject` WHERE `id`=113768;
REPLACE INTO `game_event_gameobject` SELECT `guid`,'9' FROM `gameobject` WHERE `id`=113769;
REPLACE INTO `game_event_gameobject` SELECT `guid`,'9' FROM `gameobject` WHERE `id`=113770;
REPLACE INTO `game_event_gameobject` SELECT `guid`,'9' FROM `gameobject` WHERE `id`=113771;

# NeatElves
UPDATE `quest_template` SET `RequiredRaces`='690' WHERE `entry`=10102;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='1' WHERE `item`=18228;
UPDATE `quest_template` SET `Details`=NULL WHERE `Details`='';
UPDATE `quest_template` SET `Objectives`=NULL WHERE `Objectives`='';
UPDATE `quest_template` SET `OfferRewardText`=NULL WHERE `OfferRewardText`='';
UPDATE `quest_template` SET `RequestItemsText`=NULL WHERE `RequestItemsText`='';
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-50' WHERE `item`=30157;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-50' WHERE `item`=31347;
DELETE FROM `gameobject_template_scripts` WHERE `id` in (178145);
REPLACE INTO `gameobject_template_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(178145, 0, 10, 11920, 300000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template_scripts` WHERE `id` in (176581);
REPLACE INTO `gameobject_template_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(176581, 0, 10, 11876, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `gameobject_template_scripts` WHERE `id` in (175944);
REPLACE INTO `gameobject_template_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(175944, 0, 10, 10882, 30000, 0, 0, 0, 0, 0, 0, 0, -5008.338, -2118.894, 83.657, 0.874, '');
DELETE FROM `gameobject_template_scripts` WHERE `id` in (182024);
REPLACE INTO `gameobject_template_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(182024, 0, 10, 17830, 30000, 0, 0, 0, 0, 0, 0, 0, -368.557, 172.036, -21.784, 4.61, ''),
(182024, 1, 0, 1, 0, 17830, 10, 0, 2000000802, 0, 0, 0, 0, 0, 0, 0, '');
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('2000000802', 'Insolent fool! You thought to steal Zelemar\'s blood? You shall pay with your own!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `gameobject_template_scripts` WHERE `id` in (181956);
REPLACE INTO `gameobject_template_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(181956, 0, 10, 17716, 30000, 0, 0, 0, 0, 0, 0, 0, 8094.632, -7542.740, 151.568, 0.287, '');
delete from spell_script_target where entry in (29770);
insert into spell_script_target values
(29770,1,15550);
DELETE FROM creature_linking_template WHERE entry IN (15548,15547);
INSERT INTO creature_linking_template VALUES
(15547,532,16151,1,0),
(15548,532,16151,1,0);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1715', '9', '5929', '0'), ('1716', '9', '5930', '0'), ('1717', '-2', '1715', '1716');
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES
(3881, 4721, 0, 0, 0, 0, 0, 0, 0, 0),
(3882, 4718, 0, 0, 0, 0, 0, 0, 0, 0),
(3882, 4719, 0, 0, 0, 0, 0, 0, 0, 1717),
(3883, 4733, 0, 0, 0, 0, 0, 0, 0, 0),
(3884, 4734, 0, 0, 0, 0, 0, 0, 0, 0),
(3885, 4735, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(3881, 0, 0, 'I seek to understand the importance of strength of the body.', 1, 1, 3883, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3882, 0, 0, 'What do you represent, spirit?', 1, 1, 3881, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1717),
(3883, 0, 0, 'I seek to understand the importance of strength of the heart.', 1, 1, 3884, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3884, 0, 0, 'I have heard your words, Great Bear Spirit, and I understand.  I now seek your blessings to fully learn the way of the Claw.', 1, 1, 3885, 0, 3884, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1715),
(3884, 1, 0, 'I have heard your words, Great Bear Spirit, and I understand.  I now seek your blessings to fully learn the way of the Claw.', 1, 1, 3885, 0, 3885, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1716);
DELETE FROM `gossip_scripts` WHERE `id` in (3884,3885);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
('3884', '1', '7', '5929', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest complete 5929'),
('3885', '1', '7', '5930', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest complete 5930');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(1718, -1, 252, 273),
(1719, -1, 252, 340),
(1720, 9, 30, 0),
(1721, 9, 272, 0),
(1722, -2, 1720, 1721);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES
(4041, 4913, 0, 0, 0, 0, 0, 0, 0, 284),
(4041, 4914, 0, 0, 0, 0, 0, 0, 0, 1719),
(4041, 4915, 0, 0, 0, 0, 0, 0, 0, 1718);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES
(4042, 4916, 0, 0, 0, 0, 0, 0, 0, 284),
(4042, 4918, 0, 0, 0, 0, 0, 0, 0, 1718),
(4042, 4917, 0, 0, 0, 0, 0, 0, 0, 1719);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES
('50009', '5376', '0', '0', '0', '0', '0', '0', '0', '1720'),
('50009', '5375', '0', '0', '0', '0', '0', '0', '0', '1721'),
('50018', '5374', '0', '0', '0', '0', '0', '0', '0', '1720'),
('50018', '5373', '0', '0', '0', '0', '0', '0', '0', '1721');
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(4041, 0, 0, 'I''d like to fly to Rut''theran Village.', 1, 1, -1, 0, 4041, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1719),
(4041, 1, 0, 'Do you know where I can find Half Pendant of Aquatic Agility?', 1, 1, 50009, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1722),
(4042, 0, 0, 'I''d like to fly to Thunder Bluff.', 1, 1, -1, 0, 4042, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1718),
(4042, 1, 0, 'Do you know where I can find Half Pendant of Aquatic Endurance?', 1, 1, 50018, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1722);
DELETE FROM `gossip_scripts` WHERE `id` in (4041,4042);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
('4041', '0', '30', '315', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fly to Rut''theran Village'),
('4042', '0', '30', '316', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'fly to Thunder Bluff');
UPDATE `creature_template` SET `faction_A`='35', `faction_H`='35' WHERE `entry`=9528;
UPDATE `creature_template` SET `faction_A`='35', `faction_H`='35' WHERE `entry`=9529;
DELETE FROM `gossip_scripts` WHERE `id` in (50413,2208);
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(2208, 0, 0, 0, 0, 0, 0, 0, 2000000056, 0, 0, 0, 0, 0, 0, 0, ''),
(2208, 0, 15, 15120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'cast Cenarion Beacon');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(1232, -1, 874, 340),
(1723, -1, 1232, 1046),
(1233, -1, 798, 273),
(1724, -1, 1233, 1046);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES
(50413, 2842, 0, 0, 0, 0, 0, 0, 0, 0),
(50413, 2843, 0, 0, 0, 0, 0, 0, 0, 340),
(2208, 2844, 0, 0, 0, 0, 0, 0, 0, 0),
(2208, 2845, 0, 0, 0, 0, 0, 0, 0, 273),
(2208, 2848, 0, 0, 0, 0, 0, 0, 0, 874),
(50413, 2849, 0, 0, 0, 0, 0, 0, 0, 798);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(2208, 0, 0, 'Please make me a Cenarion Beacon.', 1, 1, -1, 0, 2208, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1723),
(50413, 0, 0, 'Please make me a Cenarion Beacon.', 1, 1, -1, 0, 2208, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1724),
(2208, 1, 0, 'What plants are in Felwood that might be corrupted?', 1, 1, -1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 874),
(50413, 1, 0, 'What plants are in Felwood that might be corrupted?', 1, 1, -1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 798);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1725', '9', '6627', '0');
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES ('4763', '5820', '0', '0', '0', '0', '0', '0', '0', '1725');
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
('4763', '0', '0', 'My answer - Ysera.', '1', '1', '-1', '0', '4763', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '1725'),
('4763', '1', '0', 'My answer - Neltharion.', '1', '1', '-1', '0', '39', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '1725'),
('4763', '2', '0', 'My answer - Nozdormu.', '1', '1', '-1', '0', '4763', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '1725'),
('4763', '3', '0', 'My answer - Alexstrasza.', '1', '1', '-1', '0', '4763', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '1725'),
('4763', '4', '0', 'My answer - Malygos.', '1', '1', '-1', '0', '4763', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '1725');
DELETE FROM `gossip_scripts` WHERE `id` in (4763,39);
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(39, 0, 7, 6627, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Quest complete 6627'),
(4763, 0, 15, 6766, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'cast Test of Lore');
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `id` in (9545,9547);
UPDATE `creature` SET `spawndist`='0', `MovementType`='2' WHERE `guid` in (47678);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(1726, 5, 59, 4),
(1727, 2, 17203, 1),
(1728, 24, 18628, 1),
(1729, -1, 1727, 1728),
(1730, 8, 7604, 0),
(1731, -3, 1730, 0),
(1732, -1, 1729, 1731);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES
(4781, 3673, 0, 0, 0, 0, 0, 0, 0, 0),
(4781, 5834, 0, 0, 0, 0, 0, 0, 0, 1726);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(4781, 0, 1, 'Show me what I have access to, Lothos.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1726),
(4781, 1, 0, 'Hmm, I listen. Also that you offer?', 1, 1, -1, 0, 4781, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1732);
DELETE FROM `gossip_scripts` WHERE `id` in (4781);
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(4781, 0, 15, 23059, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'cast Create Thorium Brotherhood Contract');
UPDATE `gameobject_template` SET `data1`='177790' WHERE `entry`=177844;
UPDATE `gameobject_template` SET `flags`='4', `faction`='1801' WHERE `entry`=177844;
UPDATE `gameobject_template` SET `flags`='4', `faction`='1802' WHERE `entry`=177790;
UPDATE `gameobject_template` SET `data1`='0', `data7`='0' WHERE `entry`=177795;
UPDATE `gameobject_template` SET `faction`='1801' WHERE `entry`=177794;
UPDATE `gameobject_template` SET `faction`='1802' WHERE `entry`=177792;
UPDATE `gameobject` SET `spawntimesecs`='60' WHERE `guid`=42463;
UPDATE `gameobject` SET `spawntimesecs`='60' WHERE `guid`=48668;
UPDATE `gameobject` SET `spawntimesecs`='300' WHERE `guid`=3816;
UPDATE `gameobject` SET `spawntimesecs`='300' WHERE `guid`=19138;
DELETE FROM `gameobject` WHERE `guid` = 40488;
DELETE FROM `gameobject` WHERE `guid` = 26074;
DELETE FROM `gameobject` WHERE `guid` = 37369;
DELETE FROM `gameobject` WHERE `guid` = 37368;
DELETE FROM `gameobject` WHERE `guid` = 40489;
DELETE FROM `gameobject` WHERE `guid` = 12309;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(40487, 177792, 1, 1, 1, 7838.95, -259.246, -26.4806, 0.191986, 0, 0, 0.0958456, 0.995396, 60, 100, 1),
(18962, 177793, 1, 1, 1, 7838.95, -259.246, -26.4806, 0.191986, 0, 0, 0.0958456, 0.995396, 60, 100, 1);
UPDATE `quest_template` SET `PrevQuestId`='0' WHERE `entry`=10048;
UPDATE `quest_template` SET `NextQuestId`='0', `NextQuestInChain`='0' WHERE `entry`=9943;
UPDATE `quest_template` SET `NextQuestId`='0', `NextQuestInChain`='0' WHERE `entry`=9947;
UPDATE `quest_template` SET `PrevQuestId`='0' WHERE `entry`=10049;
UPDATE `quest_template` SET `PrevQuestId`='0', `NextQuestId`='0', `NextQuestInChain`='0' WHERE `entry`=9949;
UPDATE `quest_template` SET `PrevQuestId`='0', `NextQuestId`='0', `NextQuestInChain`='0' WHERE `entry`=9950;
DELETE FROM `gameobject_involvedrelation` WHERE `quest` = 636;
DELETE FROM `creature_questrelation` WHERE `quest` in (9950,9949,10048,10049);
DELETE FROM `creature_involvedrelation` WHERE `quest` in (9949,9950,1289,10549,10048,10049);

# Skirnir
INSERT IGNORE INTO gameobject_addon VALUES (22015, 0.0, 0.0, -0.694658, 0.71934);

# NeatElves
DELETE FROM `creature_involvedrelation` WHERE `quest` in (9034,9036,9037,9038,9039,9040,9041,9042,9043,9044,9046,9047,9048,9049,9050,9054,9055,9056,9057,9058,9059,9060,9061,9068,9069,9070,9071,9072,9073,9074,9075,9077,9078,9079,9080,9081,9082,9083,9084,9086,9087,9088,9089,9090,9091,9092,9093,9095,9096,9097,9098,9099,9100,9101,9102,9103,9104,9105,9106,9107,9108,9109,9110,9111,9112,9113,9114,9115,9116,9117,9118,11087);
UPDATE `quest_template` SET `OfferRewardText`='This crate is covered with clawed scratches, and the marks of water damage. Prying it open reveals soggy and rotted straw, as if something of value was stored in the crate. You search through the straw...$B$B...and find an armload of red-colored bottles.' WHERE `entry`=281;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Netherstorm flame!' WHERE `entry` =11835;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Durotar flame!' WHERE `entry` =11846;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Eversong woods flame!' WHERE `entry` =11848;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Ghostland flame!' WHERE `entry` =11850;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Mulgore flame!' WHERE `entry` =11852;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Shadowmoon Valley flame!' WHERE `entry` =11855;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Borean Tundra flame!' WHERE `entry` =13493;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Sholazar Basin flame!' WHERE `entry` =13494;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Dragonblight flame!' WHERE `entry` =13495;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Howling Fjords flame!' WHERE `entry` =13496;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Grizzly Hills flame!' WHERE `entry` =13497;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Storm Peaks flame!' WHERE `entry` =13498;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Crystalsong Forest flame!' WHERE `entry` =13499;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Zul''Drak flame!' WHERE `entry` =13500;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Tanaris flame!',`RequestItemsText`=NULL WHERE `entry`=11838;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Nagrand flame!', `RequestItemsText`=NULL WHERE `entry`=11821;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Blade''s Edge Mountains flame!', `RequestItemsText`=NULL WHERE `entry`=11807;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Blade''s Edge Mountains flame!', `RequestItemsText`=NULL WHERE `entry`=11843;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Arathi Highlands flame!' WHERE `entry`=11804;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Blasted Lands flame!' WHERE `entry`=11808;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Burning Steppes flame!' WHERE `entry`=11810;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Dun Morogh flame!' WHERE `entry`=11813;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Duskwood flame!' WHERE `entry`=11814;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Elwynn Forest flame!' WHERE `entry`=11816;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Loch Modan flame!' WHERE `entry`=11820;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Redridge Mountains flame!' WHERE `entry`=11822;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Hinterlands flame!' WHERE `entry`=11826;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Wetlands flame!' WHERE `entry`=11828;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Western Plaguelands flame!' WHERE `entry`=11827;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Westfall flame!' WHERE `entry`=11583;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Ashenvale flame!' WHERE `entry`=11805;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Azuremyst Isle flame!' WHERE `entry`=11806;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Bloodmyst Isle flame!' WHERE `entry`=11809;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Darkshore flame!' WHERE `entry`=11811;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Desolace flame!' WHERE `entry`=11812;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Dustwallow Marsh flame!' WHERE `entry`=11815;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Feralas flame!' WHERE `entry`=11817;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Silithus flame!' WHERE `entry`=11831;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Tanaris flame!' WHERE `entry`=11833;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Teldrassil flame!' WHERE `entry`=11824;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Winterspring flame!' WHERE `entry`=11834;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Hellfire Peninsula flame!' WHERE `entry`=11818;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Howling Fjord flame!' WHERE `entry`=13488;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Grizzly Hills flame!' WHERE `entry`=13489;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Storm Peaks flame!' WHERE `entry`=13490;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Hillsbrad Foothills flame!' WHERE `entry`=11819;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Crystalsong Forest flame!' WHERE `entry`=13491;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Zul''Drak flame!' WHERE `entry`=13492;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Netherstorm flame!' WHERE `entry`=11830;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Shadowmoon Valley flame!' WHERE `entry`=11823;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Terokkar Forest flame!' WHERE `entry`=11825;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Zangarmarsh flame!' WHERE `entry`=11829;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Borean Tundra flame!' WHERE `entry`=13485;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Sholazar Basin flame!' WHERE `entry`=13486;
UPDATE `quest_template` SET `OfferRewardText`='Honor the Dragonblight flame!' WHERE `entry`=13487;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Howling Fjord bonfire!' WHERE `entry`=13444;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Grizzly Hills bonfire!' WHERE `entry`=13445;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Storm Peaks bonfire!' WHERE `entry`=13446;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Crystalsong Forest bonfire!' WHERE `entry`=13447;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Zul''Drak bonfire!' WHERE `entry`=13449;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Sholazar Basin bonfire!' WHERE `entry`=13450;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Dragonblight bonfire!' WHERE `entry`=13451;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Howling Fjord bonfire!' WHERE `entry`=13453;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Grizzly Hills bonfire!' WHERE `entry`=13454;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Storm Peaks bonfire!' WHERE `entry`=13455;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Crystalsong Forest bonfire!' WHERE `entry`=13457;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Zul''Drak bonfire!' WHERE `entry`=13458;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Zangarmarsh bonfire!' WHERE `entry`=11758;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Borean Tundra bonfire!' WHERE `entry`=13440;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Borean Tundra bonfire!' WHERE `entry`=13441;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Sholazar Basin bonfire!' WHERE `entry`=13442;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Dragonblight bonfire!' WHERE `entry`=13443;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Burning Steppes bonfire!' WHERE `entry`=11768;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Arathi Highlands bonfire!' WHERE `entry`=11764;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Badlands bonfire!' WHERE `entry`=11766;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Eversong Woods bonfire!' WHERE `entry`=11772;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Hillsbrad Foothills bonfire!' WHERE `entry`=11776;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Silverpine bonfire!' WHERE `entry`=11580;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Stranglethorn Vale bonfire!' WHERE `entry`=11801;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Swamp of Sorrows bonfire!' WHERE `entry`=11781;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Hinterlands bonfire!' WHERE `entry`=11784;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Tirisfal Glades bonfire!' WHERE `entry`=11786;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Hellfire Peninsula bonfire!' WHERE `entry`=11747;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Nagrand bonfire!' WHERE `entry`=11750;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Netherstorm bonfire!' WHERE `entry`=11759;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Shadowmoon Valley bonfire!' WHERE `entry`=11752;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Terokkar Forest bonfire!' WHERE `entry`=11754;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Netherstorm bonfire!' WHERE `entry`=11799;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Shadowmoon Valley bonfire!' WHERE `entry`=11779;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Terokkar Forest bonfire!' WHERE `entry`=11782;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Zangarmarsh bonfire!' WHERE `entry`=11787;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Blade''s Edge Mountains bonfire!' WHERE `entry`=11736;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Dustwallow Marsh bonfire!' WHERE `entry`=11744;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Teldrassil bonfire!' WHERE `entry`=11753;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Blade''s Edge Mountains bonfire!' WHERE `entry`=11767;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Hellfire Peninsula bonfire!' WHERE `entry`=11775;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Nagrand bonfire!' WHERE `entry`=11778;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Ashenvale bonfire!' WHERE `entry`=11734;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Azuremyst Isle bonfire!' WHERE `entry`=11735;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Bloodmyst Isle bonfire!' WHERE `entry`=11738;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Darkshore bonfire!' WHERE `entry`=11740;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Desolace bonfire!' WHERE `entry`=11741;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Stonetalon Mountains bonfire!' WHERE `entry`=11780;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Tanaris bonfire!' WHERE `entry`=11802;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Barrens bonfire!' WHERE `entry`=11783;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Winterspring bonfire!' WHERE `entry`=11803;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Loch Modan bonfire!' WHERE `entry`=11749;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Redridge Mountains bonfire!' WHERE `entry`=11751;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Hinterlands bonfire!' WHERE `entry`=11755;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Wetlands bonfire!' WHERE `entry`=11757;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Ashenvale bonfire!' WHERE `entry`=11765;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Desolace bonfire!' WHERE `entry`=11769;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Durotar bonfire!' WHERE `entry`=11770;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Dustwallow Marsh bonfire!' WHERE `entry`=11771;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Feralas bonfire!' WHERE `entry`=11773;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Blasted Lands bonfire!' WHERE `entry`=11737;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Burning Steppes bonfire!' WHERE `entry`=11739;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Dun Morogh bonfire!' WHERE `entry`=11742;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Duskwood bonfire!' WHERE `entry`=11743;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Elywnn Forest bonfire!' WHERE `entry`=11745;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Arathi Highlands bonfire!' WHERE `entry`=11732;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Western Plaguelands bonfire!' WHERE `entry`=11756;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Mulgore bonfire!' WHERE `entry`=11777;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Silithus bonfire!' WHERE `entry`=11800;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Westfall bonfire!' WHERE `entry`=11581;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Alliance''s Hillsbrad Foothills bonfire!' WHERE `entry`=11748;
UPDATE `quest_template` SET `OfferRewardText`='Desecrate the Horde''s Thousand Needles bonfire!' WHERE `entry`=11785;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(72560, 192517, 604, 3, 1, 1837.86, 1873.78, 188.544, 3.14159, 0, 0, 1, 1.26759e-006, 180, 0, 1);
REPLACE INTO `gameobject_addon` (`guid`, `path_rotation0`, `path_rotation1`, `path_rotation2`, `path_rotation3`) VALUES
(1425, 0, 0, -0.0043634, 0.99999),
(2048, 0, 0, -0.0043634, 0.99999),
(4760, 0, 0, 0.612217, 0.79069),
(5351, 0, 0, -0.0043634, 0.99999),
(5861, 0, 0, 0.915312, 0.402747),
(5863, 0, 0, 1, -4.37114e-008),
(5864, 0, 0, 1, -4.37114e-008),
(5865, 0, 0, 1, -4.37114e-008),
(5866, 0, 0, 1, -4.37114e-008),
(5870, 0.00544418, -0.00290476, 0.918772, 0.394739),
(5876, -0.00276125, -0.00551835, -0.370553, 0.928791),
(5878, 0.00544418, -0.00290476, 0.918772, 0.394739),
(5888, -0.00276125, -0.00551835, -0.370553, 0.928791),
(5891, 0.00544418, -0.00290476, 0.918772, 0.394739),
(5897, -0.00276125, -0.00551835, -0.370553, 0.928791),
(5898, 0.00544418, -0.00290476, 0.918772, 0.394739),
(6968, 0, 0, 0.612217, 0.79069),
(6997, 0, 0, -0.0043634, 0.99999),
(7022, 0, 0, 0.678801, 0.734323),
(7076, 0, 0, 0.989651, 0.143493),
(7640, 0, 0, 0.989651, 0.143493),
(9014, 0, 0, -0.0043634, 0.99999),
(9077, 0, 0, 0.612217, 0.79069),
(9176, 0, 0, -0.0043634, 0.99999),
(12509, 0, 0, 0.989651, 0.143493),
(14254, 0, 0, 0.612217, 0.79069),
(14579, 0, 0, -0.0043634, 0.99999),
(15118, 0, 0, -0.0043634, 0.99999),
(15363, 0, 0, 1, -4.37114e-008),
(15505, 0, 0, 0.678801, 0.734323),
(16394, 0, 0, 1, -4.37114e-008),
(19207, 0, 0, -0.0043634, 0.99999),
(22011, 0, 0, -0.526214, 0.850352),
(22012, 0, 0, 0.45399, 0.891007),
(22013, 0, 0, -0.526214, 0.850352),
(22014, 0, 0, -0.526214, 0.850352),
(26004, -0.00276125, -0.00551835, -0.370553, 0.928791),
(42070, 0, 0, 0.989651, 0.143493),
(42071, 0, 0, -0.426569, 0.904455),
(42072, 0, 0, -0.426569, 0.904455),
(43822, 0, 0, 0.915312, 0.402747),
(43823, 0, 0, 0.995805, 0.0915015),
(43824, 0, 0, -0.370557, 0.92881),
(43825, 0, 0, -0.748956, 0.66262),
(43826, 0, 0, -0.760406, 0.649448),
(43852, 0, 0, 0.915312, 0.402747),
(43853, 0, 0, 0.915312, 0.402747),
(43854, 0, 0, -0.760406, 0.649448),
(43855, 0, 0, -0.748956, 0.66262),
(43856, 0, 0, -0.370557, 0.92881),
(43857, 0, 0, 0.995805, 0.0915015),
(43906, 0, 0, 3.25841e-007, 1),
(46165, 0, 0, 0.99999, -0.00436333),
(46166, 0, 0, 0.99999, -0.00436333),
(46167, 0, 0, 0.99999, -0.00436333),
(46172, 0, 0, 0.99999, -0.00436333),
(46898, 0, 0, -0.263031, 0.964787),
(46899, 0, 0, 0.522499, 0.85264),
(51417, 0, 0, 0.996917, -0.0784592),
(51626, 0, 0, 0.951057, 0.309017),
(51627, 0, 0, 0.951057, 0.309017),
(51628, 0, 0, 0.951057, 0.309017),
(51633, 0, 0, 0.999048, 0.0436193),
(51634, 0, 0, 0.999048, 0.0436193),
(51635, 0, 0, 0.999048, 0.0436193),
(51701, 0, 0, 0.999048, 0.0436193),
(51702, 0, 0, 0.999048, 0.0436193),
(51703, 0, 0, 0.999048, 0.0436193),
(51980, 0, 0, 0.333807, 0.942641),
(51981, 0, 0, 0.333807, 0.942641),
(51982, 0, 0, 0.333807, 0.942641),
(52199, 0, 0, -0.370557, 0.92881),
(52241, 0, 0, -0.760406, 0.649448),
(52267, 0, 0, 0.915312, 0.402747),
(52316, 0, 0, -0.748956, 0.66262),
(52333, 0, 0, 0.99999, -0.00436333),
(52335, 0, 0, 0.995805, 0.0915015),
(53540, 0, 0, 0.915312, 0.402747),
(66241, 0, 0, -0.378575, 0.92557),
(66242, 0, 0, -0.378575, 0.92557),
(70491, 0, 0, 1, -4.37114e-008),
(70650, 0, 0, 1, -4.37114e-008),
(71089, 0, 0, 1, -4.37114e-008),
(72560, 0, 0, 1, -4.37114e-008);
UPDATE `gameobject` SET `spawntimesecs` = -43200 WHERE `id` = 193597;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES ('3801', '4773', '0', '0', '0', '0', '0', '0', '0', '1741');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
('1733', '9', '5862', '0'),
('1734', '11', '17961', '0'),
('1735', '-1', '1733', '1734'),
('1736', '8', '5862', '0'),
('1737', '8', '5944', '0'),
('1738', '-3', '1737', '0'),
('1739', '-1', '1734', '1736'),
('1740', '-1', '1738', '1739'),
('1741', '-2', '1735', '1740');
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (3801);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_script_id`) VALUES
(3801,0,0,"I am ready for the illusion, Myranda.",1,1,-1,3801);
UPDATE `gossip_menu_option` SET `condition_id`='1741' WHERE `menu_id` in (3801) AND `id`=0;
DELETE FROM `gossip_scripts` WHERE `id` = 3801;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('3801', '0', '15', '17961', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'cast Scarlet Illusion');
DELETE FROM `conditions` WHERE `condition_entry` = 1584;
DELETE FROM `conditions` WHERE `condition_entry` = 1586;
DELETE FROM `conditions` WHERE `condition_entry` = 1585;
DELETE FROM `conditions` WHERE `condition_entry` = 1587;
UPDATE `gossip_menu_option` SET `condition_id`='1582' WHERE `menu_id`=8852 AND `id`=0;
UPDATE `gossip_menu_option` SET `condition_id`='1583' WHERE `menu_id`=8898 AND `id`=0;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(1574, 8, 11261, 0),
(1575, -3, 1574, 0),
(1583, -1, 1573, 1575),
(1579, 8, 11250, 0),
(1581, -3, 1579, 0),
(1582, -1, 1580, 1581);
UPDATE `creature_template` SET `minlevel` = 1, `maxlevel` = 1 WHERE `entry` = 18162;
UPDATE `quest_template` SET `NextQuestId` = 0, `NextQuestInChain` = 0 WHERE `entry` = 7732;
UPDATE creature_loot_template SET ChanceOrQuestChance=ABS(ChanceOrQuestChance) WHERE item in (814);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='10' WHERE `item`=22554;
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14453', '8', 'Dented Footlocker');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('179494', '14453', '0', 'Dented Footlocker');
UPDATE `gameobject` SET `spawntimesecs`='120' WHERE `id`=179494;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(8234, 179494, 0, 1, 1, -6886.06, -1229.12, 215.483, -2.67035, 0, 0, -0.972369, 0.233447, 120, 100, 1),
(8235, 179494, 0, 1, 1, -6772.75, -1124.14, 206.103, 0.418879, 0, 0, 0.207912, 0.978148, 120, 100, 1),
(8237, 179494, 0, 1, 1, -6563.64, -1231.7, 186.145, 1.95477, 0, 0, 0.829038, 0.559192, 120, 100, 1),
(8239, 179494, 0, 1, 1, -6538.47, -1266.37, 180.943, 0.872665, 0, 0, 0.422618, 0.906308, 120, 100, 1),
(8240, 179494, 0, 1, 1, -6463.42, -1194.57, 181.996, -1.50098, 0, 0, -0.681997, 0.731355, 120, 100, 1);
UPDATE `quest_template` SET `PrevQuestId`='3372' WHERE `entry`=3566;
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('2000000803', 'Fools. Obsidion! Rise, and destroy the interlopers!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE `creature` SET `spawntimesecs`='2' WHERE `guid`=53464;
UPDATE `creature_template` SET `faction_A`='35', `faction_H`='35' WHERE `entry`=8400;
DELETE FROM `gossip_scripts` WHERE `id` = 1282;
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(1282, 0, 10, 8391, 60000, 0, 0, 0, 0, 0, 0, 0, -6460.42, -1267.62, 180.785, 3.15905, 'summon Lathoric'),
(1282, 4, 0, 1, 0, 8391, 50, 0, 2000000803, 0, 0, 0, 0, 0, 0, 0, ''),
(1282, 6, 28, 0, 0, 8400, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(1282, 60, 28, 7, 0, 8400, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(1282, 59, 22, 0, 0, 8400, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(1282, 0, 27, 4, 0, 148498, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(1282, 60, 27, 8, 0, 148498, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(1282, 8, 22, 14, 1, 8400, 50, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 5119;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 5120;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17306;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17326;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17327;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17328;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17422;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17423;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17502;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17503;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17504;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 18225;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 18226;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 18227;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 18231;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 18233;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 5120;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 17326;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 17327;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 17422;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 17423;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 17502;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 17504;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 18145;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 18146;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 18147;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 18206;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 4583;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 4584;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17306;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17326;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17327;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17328;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17422;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17423;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17502;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17503;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17504;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 18225;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 18231;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 18233;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 18234;
DELETE FROM `creature_loot_template` WHERE `entry` = 13618 AND `item` = 17643;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 3395;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 4583;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 4584;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 5758;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 8146;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 8251;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 8254;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 12203;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 12208;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 12693;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 17422;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 17423;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 17502;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 17503;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 17504;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 18234;
DELETE FROM `skinning_loot_template` WHERE `entry` = 14282 AND `item` = 8169;
DELETE FROM `skinning_loot_template` WHERE `entry` = 14282 AND `item` = 8171;
DELETE FROM `skinning_loot_template` WHERE `entry` = 14282 AND `item` = 8368;
DELETE FROM `skinning_loot_template` WHERE `entry` = 14282 AND `item` = 21887;
DELETE FROM `skinning_loot_template` WHERE `entry` = 14282 AND `item` = 25649;
UPDATE `creature_template` SET `lootid`='0' WHERE `lootid`='13618';
UPDATE creature_loot_template SET ChanceOrQuestChance=ABS(ChanceOrQuestChance) WHERE item in (17642,17643);
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` = 14282;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`='20' WHERE `entry`=10990 AND `item`=8170;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`='20' WHERE `entry`=13676 AND `item`=8170;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`='0' WHERE `entry`=14282 AND `item`=4304;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`='20' WHERE `entry`=14282 AND `item`=8170;
DELETE FROM `skinning_loot_template` WHERE `entry` = 10981 AND `item` = 8368;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`='20' WHERE `entry`=10981 AND `item`=8170;
UPDATE `creature_template` SET `faction_A`='1274', `faction_H`='1274' WHERE `entry` IN (10990,22727,31921,37237,22726,13676,22764,32084,37405);
UPDATE `creature_template` SET `faction_A`='1275', `faction_H`='1275' WHERE `entry` IN (10981,22737,31975,37294,14282,22738,31977,37296);
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 5119;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 5120;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17306;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17326;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17327;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17328;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17422;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17423;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17502;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17503;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 17504;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 18225;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 18226;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 18227;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 18231;
DELETE FROM `creature_loot_template` WHERE `entry` = 10990 AND `item` = 18233;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 5120;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 17326;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 17327;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 17422;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 17423;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 17502;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 17504;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 18145;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 18146;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 18147;
DELETE FROM `creature_loot_template` WHERE `entry` = 13676 AND `item` = 18206;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 4583;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 4584;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17306;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17326;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17327;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17328;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17422;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17423;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17502;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17503;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 17504;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 18225;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 18231;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 18233;
DELETE FROM `creature_loot_template` WHERE `entry` = 10981 AND `item` = 18234;
DELETE FROM `creature_loot_template` WHERE `entry` = 13618 AND `item` = 17643;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 3395;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 4583;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 4584;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 5758;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 8146;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 8251;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 8254;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 12203;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 12208;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 12693;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 17422;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 17423;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 17502;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 17503;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 17504;
DELETE FROM `creature_loot_template` WHERE `entry` = 14282 AND `item` = 18234;
DELETE FROM `skinning_loot_template` WHERE `entry` = 14282 AND `item` = 8169;
DELETE FROM `skinning_loot_template` WHERE `entry` = 14282 AND `item` = 8171;
DELETE FROM `skinning_loot_template` WHERE `entry` = 14282 AND `item` = 8368;
DELETE FROM `skinning_loot_template` WHERE `entry` = 14282 AND `item` = 21887;
DELETE FROM `skinning_loot_template` WHERE `entry` = 14282 AND `item` = 25649;
UPDATE `creature_template` SET `lootid`='0' WHERE `lootid`='13618';
UPDATE creature_loot_template SET ChanceOrQuestChance=ABS(ChanceOrQuestChance) WHERE item in (17642,17643);
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` = 14282;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`='20' WHERE `entry`=10990 AND `item`=8170;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`='20' WHERE `entry`=13676 AND `item`=8170;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`='0' WHERE `entry`=14282 AND `item`=4304;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`='20' WHERE `entry`=14282 AND `item`=8170;
DELETE FROM `skinning_loot_template` WHERE `entry` = 10981 AND `item` = 8368;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`='20' WHERE `entry`=10981 AND `item`=8170;
UPDATE `creature_template` SET `faction_A`='1274', `faction_H`='1274' WHERE `entry` IN (10990,22727,31921,37237,22726,13676,22764,32084,37405);
UPDATE `creature_template` SET `faction_A`='1275', `faction_H`='1275' WHERE `entry` IN (10981,22737,31975,37294,14282,22738,31977,37296);
DELETE FROM `skinning_loot_template` WHERE `item` = 8368;
DELETE FROM `skinning_loot_template` WHERE `item` = 7428;
DELETE FROM `page_text` WHERE (`entry`=3773);
INSERT INTO `page_text` (`entry`, `text`, `next_page`) VALUES (3773, 'The way of the priest is a new one for our people, but it draws on the ancient traditions of our seers. In your lessons, you will learn the wisdom of the Earthmother as illuminated by the Light. Meet with me in the circle at the center of Camp Narache and we will begin your lessons.$B$BSeer Ravenfeather', 0);
DELETE FROM `page_text` WHERE (`entry`=3774);
INSERT INTO `page_text` (`entry`, `text`, `next_page`) VALUES (3774, 'I have been awaiting your arrival, sunwalker. Chief Hawkwind himself told me of your interest in our order and I have agreed to begin your training. Please meet with me in the circle at the center of Camp Narache when you are ready to begin your instruction.$B$BSunwalker Helaku', 0);
DELETE FROM `page_text` WHERE (`entry`=4330);
INSERT INTO `page_text` (`entry`, `text`, `next_page`) VALUES (4330, '<Much of the coded missive was destroyed by fire.>$B$B...his calling...$B     ...the will of Grand Master Fahrad that we act by dawn tomorrow. The one who calls is restless ...        renewed urgency    ....$B  ...mustn\'t forgo the element of surprise ... an eventuality, you must divert attention away from the objec....$B...but with all luck attributed to the Twilight\'s Hammer....$B$B              ...fter the operation is done, both groups will reconvene back at Ravenholdt Manor. May you be fleet of foot and quiet of blade.$B$BBurn this.', 0);
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('30395', '0', '0', '1', '0', '0', '0', NULL), ('30469', '0', '8', '1', '0', '0', '0', NULL);
DELETE FROM `gameobject_loot_template` WHERE `item` in (43697,43668);
#
DELETE FROM `creature_loot_template` WHERE `item` in (43662,43726,43823,43693,43821,43665,43669,43724,43699,48418,43670);
#
DELETE FROM `creature_involvedrelation` WHERE `id` = 20735 AND `quest` = 13245;
DELETE FROM `creature_involvedrelation` WHERE `id` = 20735 AND `quest` = 13246;
DELETE FROM `creature_involvedrelation` WHERE `id` = 20735 AND `quest` = 13247;
DELETE FROM `creature_involvedrelation` WHERE `id` = 20735 AND `quest` = 13248;
DELETE FROM `creature_involvedrelation` WHERE `id` = 20735 AND `quest` = 13249;
DELETE FROM `creature_involvedrelation` WHERE `id` = 20735 AND `quest` = 13250;
DELETE FROM `creature_involvedrelation` WHERE `id` = 20735 AND `quest` = 13251;
DELETE FROM `creature_involvedrelation` WHERE `id` = 20735 AND `quest` = 13252;
DELETE FROM `creature_involvedrelation` WHERE `id` = 20735 AND `quest` = 13253;
DELETE FROM `creature_involvedrelation` WHERE `id` = 20735 AND `quest` = 13254;
DELETE FROM `creature_involvedrelation` WHERE `id` = 20735 AND `quest` = 13255;
DELETE FROM `creature_involvedrelation` WHERE `id` = 20735 AND `quest` = 13256;
DELETE FROM `creature_involvedrelation` WHERE `id` = 20735 AND `quest` = 14199;
#
DELETE FROM `creature` WHERE `guid` in (15653,15783,123545,15584);
DELETE FROM `gameobject` WHERE `guid` = 40084;
DELETE FROM `creature_involvedrelation` WHERE `quest` in (7507,7508,7509);
DELETE FROM `creature_questrelation` WHERE `quest` in (7507,7508,7509);

delete from creature_movement_template where entry=9679;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, script_id) values
(9679,1,549.21,-281.07,-75.27,0),
(9679,2,554.39,-267.39,-73.68,0),
(9679,3,533.59,-249.38,-67.04,0),
(9679,4,519.44,-217.02,-59.34,0),
(9679,5,506.55,-153.49,-62.34,641);
delete from creature_movement_template where entry=9022;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, script_id) values
(9022,1,280.42,-82.86,-77.12,0),
(9022,2,287.64,-87.01,-76.79,0),
(9022,3,354.63,-64.95,-67.53,641);
DELETE FROM db_script_string WHERE entry in (2000000804,2000000805,2000000806,2000000807);
insert into db_script_string (entry, content_default) values
(2000000804,'Get him out of there!'),
(2000000805,'Perhaps Ograbisi will use your head as a tiny little hat when I\'m through with you.'),
(2000000806,'Where I come from, you get shanked for opening another inmate\'s cell door!'),
(2000000807,'Ograbisi needs new hat.');
delete from gameobject_template_scripts where id in (170562,170567,170568,170569);
insert into gameobject_template_scripts (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, comments) values
(170562, 1, 0, 0, 0, 9023, 20, 3, 2000000804, 'Windsor - say on Dughal door open'),
(170568, 1, 0, 0, 0, 9677, 20, 3, 2000000807 ,'Ograbisi - say on Jaz door open'),
(170568, 2, 22, 54, 5, 9681, 20, 3, 0, 'Jaz - change faction to hostile'),
(170568, 2, 22, 54, 5, 9677, 20, 3, 0, 'Ograbisi - change faction to hostile'),
(170569, 1, 0, 0, 0, 9678, 20, 3, 2000000805, 'Shill - say on Shill door open'),
(170569, 1, 22, 54, 5, 9678, 20, 3, 0, 'Shill - change faction to hostile'),
(170567, 1, 0, 0, 0, 9680, 20, 3, 2000000806, 'Crest - say on Crest door open'),
(170567, 1, 22, 54, 5, 9680, 20, 3, 0, 'Crest - change faction to hostile');
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='10' WHERE `item`=11382;
UPDATE `gameobject_loot_template` SET `groupid`='1' WHERE`entry`=165658;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='0' WHERE `entry`=165658 AND `item`=11370;
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('181283', '14454', '0', 'Emitter Spare Part');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14454', '12', 'Emitter Spare Part');
UPDATE `quest_template` SET `RequiredSkillValue`='230' WHERE `entry`=4083;
UPDATE `quest_template` SET `RewSpellCast`='0' WHERE `entry`=4083;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(19214, 164869, 230, 1, 1, 1215.11, -218.722, -85.6731, 0.0494741, 0, 0, 0.0247345, 0.999694, -300, 0, 1);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
('1584', '8', '4083', '0'),
('1585', '17', '14891', '1'),
('1586', '7', '186', '230'),
('1587', '-1', '1585', '1586'),
('1742', '-1', '1584', '1587'),
('1743', '-3', '1584', '0'),
('1744', '-1', '1587', '1743');
DELETE FROM `gossip_menu` WHERE `entry` = 1945;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES
('1945', '2598', '0', '0', '0', '0', '0', '0', '0', '0'),
('1945', '2605', '0', '0', '0', '0', '0', '0', '0', '1742'),
('50019', '2604', '0', '0', '0', '0', '0', '0', '0', '0'),
('50020', '2606', '0', '0', '0', '0', '0', '0', '0', '0');
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(1945, 0, 0, 'Gloom''rel, tell me your secrets!', 1, 1, 50019, 0, 1945, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1744),
(1945, 1, 0, 'I have pald your price, Gloom''rel. Now teach me your secrets!', 1, 1, 50020, 0, 40, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1742);
DELETE FROM `gossip_scripts` WHERE `id` in (1945,40);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES 
('40', '0', '15', '14894', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'cast Smelt Dark Iron'),
('1945', '1', '9', '19214', '300', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'spawn Spectral Chalice');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(52086, 15957, 531, 1, 1, 0, 0, -9188.45, 2091.56, -64.17, 6.01, 604800, 0, 0, 1, 0, 0, 0);
delete from creature where id = 15718;
UPDATE creature_template SET unit_flags=33554432, flags_extra=0 WHERE entry in (15957,15712,15717);
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` = 15712;
UPDATE `creature_template`SET`mingold`='0', `maxgold`='0', `flags_extra`='2' WHERE `entry` in (18797,20662);
REPLACE INTO gossip_menu (entry, text_id) VALUES (7724, 9432),(7724, 9749);
DELETE FROM gossip_menu_option WHERE menu_id = 7724;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, box_coded, box_money, box_text, option_id, npc_option_npcflag, action_script_id) VALUES
(7724, 0, 0, 'Give me a battle standard. I will take control of Twin Spire Ruins.', 0, 0, '', 1, 1, 7724),
(7724, 1, 1, 'I have marks to redeem!', 0, 0, '', 3, 128, 0);
DELETE FROM gossip_scripts WHERE id = 7724;
INSERT INTO gossip_scripts (id, delay, command, datalong, datalong2, comments) VALUES
(7724, 0, 15, 32430, 0, 'Cast Battle Standard - Alliance');
REPLACE INTO gossip_menu (entry, text_id) VALUES (7722, 9430);
DELETE FROM gossip_menu_option WHERE menu_id = 7722;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, box_coded, box_money, box_text, option_id, npc_option_npcflag, action_script_id) VALUES
(7722, 0, 0, 'Give me a battle standard. I will take control of Twin Spire Ruins.', 0, 0, '', 1, 1, 7722),
(7722, 1, 1, 'I have marks to redeem!', 0, 0, '', 3, 128, 0);
DELETE FROM gossip_scripts WHERE id = 7722;
INSERT INTO gossip_scripts (id, delay, command, datalong, datalong2, comments) VALUES
(7722, 0, 15, 32431, 0, 'Cast Battle Standard - Horde');
UPDATE gameobject SET animprogress = 255 WHERE id IN (181899, 182096, 182097, 182098, 182173, 182174, 182175, 182522, 182523, 182528, 182529, 183104, 183411, 183412, 183413, 183414, 182210);	  	
UPDATE gameobject_template SET flags = 32 WHERE entry = 182529;
UPDATE gameobject_template SET flags = 32 WHERE entry IN (183412, 183413, 183414, 182210);
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=18225;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=18225;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
('1822501','18225','11','0','100','0','0','0','0','0','11','31961','0','0','20','0','0','0','21','0','0','0','Fire Bomb Target - Cast Fire Bomb on Spawn and set Combat Movement and Auto Attack to false');
DELETE FROM gameobject_template_scripts WHERE id=182267;
INSERT INTO gameobject_template_scripts VALUES
(182267,0,17,24538,10,0,0,0,0,0,0,0,0,0,0,0,'Add 10 Fire Bombs to inventory'),
(182267,0,30,520,0,0,0,0,0,0,0,0,0,0,0,0,'Send Taxi path 520');
DELETE FROM gameobject_template_scripts WHERE id=182301;
INSERT INTO gameobject_template_scripts VALUES
(182301,0,17,24538,10,0,0,0,0,0,0,0,0,0,0,0,'Add 10 Fire Bombs to inventory'),
(182301,0,30,520,0,0,0,0,0,0,0,0,0,0,0,0,'Send Taxi path 520');
DELETE FROM gameobject_template_scripts WHERE id=182280;
INSERT INTO gameobject_template_scripts VALUES
(182280,0,17,24538,10,0,0,0,0,0,0,0,0,0,0,0,'Add 10 Fire Bombs to inventory'),
(182280,0,30,523,0,0,0,0,0,0,0,0,0,0,0,0,'Send Taxi path 523');
DELETE FROM gameobject_template_scripts WHERE id=182302;
INSERT INTO gameobject_template_scripts VALUES
(182302,0,17,24538,10,0,0,0,0,0,0,0,0,0,0,0,'Add 10 Fire Bombs to inventory'),
(182302,0,30,523,0,0,0,0,0,0,0,0,0,0,0,0,'Send Taxi path 523');
DELETE FROM gameobject_template_scripts WHERE id=182281;
INSERT INTO gameobject_template_scripts VALUES
(182281,0,17,24538,10,0,0,0,0,0,0,0,0,0,0,0,'Add 10 Fire Bombs to inventory'),
(182281,0,30,522,0,0,0,0,0,0,0,0,0,0,0,0,'Send Taxi path 522');
DELETE FROM gameobject_template_scripts WHERE id=182303;
INSERT INTO gameobject_template_scripts VALUES
(182303,0,17,24538,10,0,0,0,0,0,0,0,0,0,0,0,'Add 10 Fire Bombs to inventory'),
(182303,0,30,522,0,0,0,0,0,0,0,0,0,0,0,0,'Send Taxi path 522');
DELETE FROM gameobject_template_scripts WHERE id=182282;
INSERT INTO gameobject_template_scripts VALUES
(182282,0,17,24538,10,0,0,0,0,0,0,0,0,0,0,0,'Add 10 Fire Bombs to inventory'),
(182282,0,30,524,0,0,0,0,0,0,0,0,0,0,0,0,'Send Taxi path 524');
DELETE FROM gameobject_template_scripts WHERE id=182304;
INSERT INTO gameobject_template_scripts VALUES
(182304,0,17,24538,10,0,0,0,0,0,0,0,0,0,0,0,'Add 10 Fire Bombs to inventory'),
(182304,0,30,524,0,0,0,0,0,0,0,0,0,0,0,0,'Send Taxi path 524');
UPDATE `creature_template` SET `MovementType` = 2 WHERE `entry` in (17635,17995);
DELETE FROM `creature_movement_template` WHERE `entry` in (17635, 17995);
INSERT INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(17635, 1, 2501.349, -4725.994, 90.974),
(17635, 2, 2491.211, -4693.162, 82.363),
(17635, 3, 2493.059, -4655.492, 75.194),
(17635, 4, 2562.227, -4646.404, 79.003),
(17635, 5, 2699.748, -4567.377, 87.460),
(17635, 6, 2757.274, -4527.591, 89.080),
(17635, 7, 2850.868, -4417.565, 89.421),
(17635, 8, 2888.340, -4328.486, 90.562),
(17635, 9, 2913.271, -4167.140, 93.919),
(17635, 10, 3035.656, -4260.176, 96.141),
(17635, 11, 3088.544, -4250.208, 97.769),
(17635, 12, 3147.302, -4318.796, 130.410),
(17635, 13, 3166.813, -4349.198, 137.569),
(17995, 1, 2501.349, -4725.994, 90.974),
(17995, 2, 2491.211, -4693.162, 82.363),
(17995, 3, 2493.059, -4655.492, 75.194),
(17995, 4, 2562.227, -4646.404, 79.003),
(17995, 5, 2699.748, -4567.377, 87.460),
(17995, 6, 2757.274, -4527.591, 89.080),
(17995, 7, 2850.868, -4417.565, 89.421),
(17995, 8, 2888.340, -4328.486, 90.562),
(17995, 9, 2913.271, -4167.140, 93.919),
(17995, 10, 3035.656, -4260.176, 96.141),
(17995, 11, 3088.544, -4250.208, 97.769),
(17995, 12, 3147.302, -4318.796, 130.410),
(17995, 13, 3166.813, -4349.198, 137.569);
DELETE FROM `creature_questrelation` WHERE `quest` = 7677;
DELETE FROM `creature_involvedrelation` WHERE `quest` = 7677;
delete from spell_script_target where entry=26063;
insert into spell_script_target values
(26063,0,180795);
-- Cthun
UPDATE `creature_template` SET unit_flags=unit_flags|33554432 WHERE `entry` in (15910,15904,15800);
delete from creature_linking_template where entry IN (15589,15725,15726,15904,15802,15728,15334,15910);
insert into creature_linking_template values
(15589,531,15727,4,0),
(15725,531,15589,4096,0),
(15726,531,15727,4128,0),
(15904,531,15727,4128,0),
(15802,531,15727,4128,0),
(15728,531,15727,4128,0),
(15334,531,15727,4128,0),
(15910,531,15727,4128,0);
DELETE FROM `item_loot_template` WHERE (`entry`=46007) AND (`item`=48681);
DELETE FROM `item_loot_template` WHERE (`entry`=46007) AND (`item`=48679);
DELETE FROM `item_loot_template` WHERE (`entry`=46007) AND (`item`=49667);
INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (46007, 49667, 10, 0, 1, 1);
# INSERT INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (46007, 48679, 10, 0, 1, 1);
UPDATE `gossip_menu_option` SET `action_script_id`='7762' WHERE `menu_id`=7762 AND `id`=0;
DELETE FROM gossip_scripts WHERE id = 7762;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
('7762', '0', '7', '10044', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'quest complete 10044');
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES ('7768', '9819', '0', '0', '0', '0', '0', '0', '0', '963');
delete from spell_script_target where entry in (35301);
insert ignore into spell_script_target values
(35301,1,21062),
(35289,1,21062);
delete from spell_script_target where entry in (36859);
insert into spell_script_target values
(36859,1,20904);
UPDATE creature_template SET MovementType=0, unit_flags=unit_flags|33554432 WHERE entry=18225;
UPDATE `quest_template` SET `PrevQuestId` = 3372 WHERE `entry` = 3566;
UPDATE `gossip_menu` SET `entry`='9789' WHERE `entry`=50235;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES ('6520', '7722', '0', '0', '0', '0', '0', '0', '0', '0');
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 4783;
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (4783,6520);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(4783, 0, 0, 'How to me to bring up my pet?', 1, 1, 9789, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0, 253),
(4783, 1, 2, 'I wish to unlearn my pet''s skills.', 1, 1, 6520, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0, 253),
(6520, 0, 13, 'Yes, please do.', 17, 16, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
delete from spell_script_target where entry=29534;
insert into spell_script_target values
(29534,0,181597);
UPDATE creature_template SET faction_A=370, faction_H=370 WHERE entry=21101;
DELETE FROM creature_template_addon WHERE entry=20886;
delete from spell_script_target where entry in (35754,35770);
insert into spell_script_target values
(35754,1,20978),
(35770,1,20978),
(35754,1,21030);
UPDATE creature_template SET MovementType=0 WHERE entry IN (20978,21030);
delete from creature_linking_template where entry IN (24858);
insert into creature_linking_template values
(24858,568,23574,4112,0);
delete from creature_linking_template where entry IN (24143);
insert into creature_linking_template values
(24143,568,23577,4096,0);

# Fix
UPDATE `creature_template` SET `npcflag` = 128 WHERE `entry` = 27914;
DELETE FROM `npc_vendor` WHERE (`entry`=27914);
INSERT INTO `npc_vendor` (entry, item, maxcount, incrtime, ExtendedCost) VALUES 
(27914, 38160, 0, 0, 2412),
(27914, 38161, 0, 0, 2412),
(27914, 38162, 0, 0, 2412),
(27914, 38163, 0, 0, 2412),
(27914, 38286, 0, 0, 2412),
(27914, 38285, 0, 0, 2412),
(27914, 38294, 0, 0, 2409),
(27914, 38308, 0, 0, 2411),
(27914, 38291, 0, 0, 2408);
INSERT IGNORE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES
(9430, 'Need TXT YTDB', '', 0, 100, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);

# Error_LOG_SD2
delete from spell_script_target where entry=44233;
delete from spell_script_target where entry in (32124);


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

UPDATE db_version SET `cache_id`= '627';
UPDATE db_version SET `version`= 'YTDB_0.14.5_R627_MaNGOS_R12092_SD2_R2667_ACID_R309d_RuDB_R53';
