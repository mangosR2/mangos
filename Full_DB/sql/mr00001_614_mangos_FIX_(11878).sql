# Y2kCat
ALTER TABLE db_version_ytdb CHANGE COLUMN 613_FIX_11874 614_FIX_11878 bit;
REPLACE INTO `db_version_ytdb` (`version`) VALUES ('614_FIX_11878');

# NeatElves
UPDATE `game_event` SET `start_time`='2012-02-05 00:01:00' WHERE `entry`=3;
UPDATE `game_event` SET `start_time`='2012-03-04 00:01:00' WHERE `entry`=4;
UPDATE `game_event` SET `start_time`='2012-04-01 00:01:00' WHERE `entry`=5;
UPDATE `game_event` SET `start_time`='2012-12-15 08:00:00' WHERE `entry` = 2;
UPDATE `game_event` SET `start_time`='2012-12-25 05:00:00' WHERE `entry` = 49;
UPDATE `gameobject_template` SET `faction` = 114, `flags` = 32 WHERE `entry` = 13965;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '25' WHERE `item` =34597;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '100' WHERE `entry` =187367 AND `item` =34597;
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14152', '10', 'Winterfin Clam');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('187367', '14152', '0', '');
UPDATE `gameobject` SET `spawntimesecs` = '300' WHERE `guid` = 40494;
UPDATE `gameobject` SET `spawntimesecs` = '300' WHERE `guid` = 40493;
UPDATE `gameobject` SET `spawntimesecs` = '300' WHERE `guid` = 40492;
UPDATE `gameobject` SET `spawntimesecs` = '300' WHERE `guid` = 40490;
UPDATE `gameobject` SET `spawntimesecs` = '300' WHERE `guid` = 40491;
UPDATE `gameobject` SET `spawntimesecs` = '300' WHERE `guid` = 60227;
UPDATE `gameobject` SET `spawntimesecs` = '300' WHERE `guid` = 59566;
UPDATE `gameobject` SET `spawntimesecs` = '300' WHERE `guid` = 40499;
UPDATE `gameobject` SET `spawntimesecs` = '300' WHERE `guid` = 40498;
UPDATE `gameobject` SET `spawntimesecs` = '300' WHERE `guid` = 40495;
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14153', '20', 'Volcanic Ash');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('181098', '14153', '0', '');
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '50',`lootcondition` = '1',`condition_value1` = '27420' WHERE `item` in (21936,21935,21937);
UPDATE creature SET position_x = '1625.876343', position_y = '-4417.429688', position_z = '15.451848', orientation = '5.581781' WHERE guid = '39866';
UPDATE creature SET position_x = '1629.696289', position_y = '-4412.760254', position_z = '16.302666', orientation = '5.414491' WHERE guid = '39867';
UPDATE creature SET position_x = '1622.372437', position_y = '-4416.227539', position_z = '14.674357', orientation = '3.865685' WHERE guid = '39860';
UPDATE creature SET position_x = '1617.499023', position_y = '-4413.309570', position_z = '14.303246', orientation = '0.634556' WHERE guid = '126583';
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(15793, 15793, 0, 1, 1, 1, 0, 0, 0),
(15793, 15794, 0, 1, 1, 1, 0, 0, 0),
(15793, 15798, 0, 1, 1, 1, 0, 0, 0);
DELETE FROM `gameobject_loot_template` WHERE `item` = 15794;
DELETE FROM `gameobject_loot_template` WHERE `item` = 15798;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '20',`mincountOrRef` = '-15793' WHERE `entry` =144064 AND `item` =15793;
DELETE FROM `creature` WHERE `id` = 15527;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 9437;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 39901;
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = '25610' WHERE `entry` =11676;
UPDATE creature_template SET flags_extra = flags_extra | 2048 WHERE entry =25610;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '-50' WHERE `item` =34908;
UPDATE `creature_template_addon` SET `b2_0_sheath` = '1',`auras` = NULL WHERE `entry` =28782;
UPDATE `creature_template` SET `npcflag` = '0' WHERE `entry` =25610;
UPDATE creature_template SET flags_extra = flags_extra &~ 2048 WHERE entry =25610;
UPDATE `creature_template` SET `lootid` = '0' WHERE `entry` =22019;
DELETE FROM `creature_loot_template` WHERE `entry` = 22019;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '25',`lootcondition` = '8',`condition_value1` = '10893' WHERE `item` =31121;
UPDATE `creature_template` SET `faction_A` = '16',`faction_H` = '16' WHERE `entry` in (21389,21492);
UPDATE `creature_template` SET `npcflag` = '0' WHERE `entry` in (22396,21383,21637,21810,22308);
UPDATE `quest_template` SET `PrevQuestId` = '10682' WHERE `entry` =10717;
UPDATE `creature_template` SET `AIName` = '' WHERE `entry` =27212;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` =27212;
DELETE FROM `creature_ai_texts` WHERE `entry` = -272125;
DELETE FROM `creature_ai_texts` WHERE `entry` = -272124;
DELETE FROM `creature_ai_texts` WHERE `entry` = -272123;
DELETE FROM `creature_ai_texts` WHERE `entry` = -272122;
DELETE FROM `creature_ai_texts` WHERE `entry` = -272121;
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(2000000582, 'You''re late, overseer.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000583, 'Destiny will not wait. Your craftsmen must increase their production of the war golems before the stone giant leader and his army reach Ulduar.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000584, 'Tell your rune-smiths to continue converting what stone giants you can. Those that will not submit must be destroyed.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000585, 'If the stone giants interfere with our work at Ulduar, I will hold you and your thane responsible. Mortals must not be allowed to come to the aid of the giants.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000586, 'Return to your duties, overseer. Be certain to impress upon your workers the urgency of their tasks.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `event_scripts` WHERE `id` =188596;
REPLACE INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(188596, 0, 10, 27212, 20000, 0, 0, 0, 0, 0, 0, 0, 3404.62, -5394.55, 270.199, 1.20872, ''),
(188596, 2, 0, 0, 27212, 50, 0, 0, 2000000582, 0, 0, 0, 0, 0, 0, 0, ''),
(188596, 4, 0, 0, 27212, 50, 0, 0, 2000000583, 0, 0, 0, 0, 0, 0, 0, ''),
(188596, 6, 0, 0, 27212, 50, 0, 0, 2000000584, 0, 0, 0, 0, 0, 0, 0, ''),
(188596, 8, 0, 0, 27212, 50, 0, 0, 2000000585, 0, 0, 0, 0, 0, 0, 0, ''),
(188596, 10, 0, 0, 27212, 50, 0, 0, 2000000586, 0, 0, 0, 0, 0, 0, 0, ''),
(188596, 11, 8, 27212, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE `quest_template` SET `OfferRewardText`='<Getry looks you over.>$B$BThis is all Ickoris could send?' WHERE `entry`=11703;
UPDATE `creature` SET `spawndist` = '5',`MovementType` = '1' WHERE `id` in (33211,33224);
UPDATE `creature_template` SET `npcflag` = '0' WHERE `entry` =33220;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(10316, 0, 0, 'Glad to help, my lady. I''m told you were once the guardian of a fabled sword. Do you know where I might find it?', 1, 1, 10315, 0, 10316, 0, 0, '', 24, 44981, 1, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('10316', '0', '15', '62554', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
UPDATE `creature` SET `position_x` = '-3738.565',`position_y` = '-4442.265',`position_z` = '56.23981',`orientation` = '0.41887',`MovementType` = '2' WHERE `guid` =78829;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(78829, 1, -3740.01, -4437.76, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 2, -3742.82, -4433.89, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 3, -3746.76, -4431.05, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 4, -3751.26, -4429.58, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 5, -3756.03, -4429.63, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 6, -3760.63, -4431.11, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 7, -3764.42, -4433.89, 56.2261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 8, -3767.25, -4437.72, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 9, -3768.72, -4442.31, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 10, -3768.66, -4447.08, 56.2247, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 11, -3767.22, -4451.63, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 12, -3764.42, -4455.48, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 13, -3767.22, -4451.63, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 14, -3768.66, -4447.08, 56.2247, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 15, -3768.72, -4442.31, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 16, -3767.25, -4437.72, 56.2018, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 17, -3764.42, -4433.89, 56.2261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 18, -3760.63, -4431.11, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 19, -3756.03, -4429.63, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 20, -3751.26, -4429.58, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 21, -3746.76, -4431.05, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 22, -3742.82, -4433.89, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 23, -3740.01, -4437.76, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 24, -3738.56, -4442.27, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 25, -3738.58, -4447.06, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 26, -3740.03, -4451.58, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 27, -3742.87, -4455.45, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 28, -3746.7, -4458.25, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 29, -3751.22, -4459.75, 56.2626, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 30, -3756.02, -4459.73, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 31, -3751.22, -4459.75, 56.2626, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 32, -3746.7, -4458.25, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 33, -3742.87, -4455.45, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 34, -3740.03, -4451.58, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 35, -3738.58, -4447.06, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78829, 36, -3738.56, -4442.27, 56.2398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `npc_text` SET `prob0`=1,`text0_0`='I wandered for the rest of my natural life in search of knowledge, seeing more wonder and meeting more strange and mysterious races than any of my people before me. I travelled across the length and breadth of ancient Kalimdor until there was no more to see, no new lands across the horizon.$B$BYet... there was still so much I did not know as I felt my final journey approaching and I wept for the things I would never know.$B$BAs I fell, my life at an end, that is when they found me.' WHERE `ID`=14121;
UPDATE `npc_text` SET `prob0`=1,`text0_0`='The bronze dragonflight. They snatched me from the brink of death and took me before their master, Nozdormu. He said they had been watching me and wanted me to continue my hunt. He granted me immortality as a watcher, tasked to bear witness to the history of Azeroth as one of his agents.$B$BI am Xarantaur the Witness, and it is my duty to preserve the true history of Azeroth lest it be forgotten.' WHERE `ID`=14122;
UPDATE `gossip_menu_option` SET `action_menu_id` = '-1' WHERE `menu_id` =9812 AND `id` =0;
UPDATE `gossip_menu_option` SET `option_text` = 'Let me browse your goods.' WHERE `menu_id` =6059 AND `id` =3;
UPDATE `gossip_menu_option` SET `option_text` = 'What can you teach me?' WHERE `menu_id` =6087 AND `id` =0;
UPDATE `gossip_menu_option` SET `option_text` = 'I would like to buy from you.' WHERE `menu_id` =6087 AND `id` =1;
UPDATE `gossip_menu_option` SET `option_text` = 'I would like to buy from you.' WHERE `menu_id` =6086 AND `id` =0;
DELETE FROM `gossip_menu` WHERE `entry`=6088 AND `text_id`=7242;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6088,7242);
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1541 AND `id` = 0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(1541,0,0, 'I wish to face the Defiler.',1,1,0,0,0,0, '');
DELETE FROM `gossip_menu` WHERE `entry`=9754 AND `text_id`=13397;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9754,13397);
UPDATE `gossip_menu_option` SET `option_text` = 'Yes, Hargus. I wish to purchase supplies.' WHERE `menu_id` =9735 AND `id` =0;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 9769 AND `id` = 0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9769,0,0, 'I missed the gate to Acherus, Orbaz. Could you please open another?',1,1,0,0,0,0, '');
UPDATE `gossip_menu_option` SET `option_text` = 'Place 35 Apexis Shards near the dragon egg to crack it open.' WHERE `menu_id` =8689 AND `id` =0;
UPDATE `creature_template` SET `gossip_menu_id`=6768 WHERE `entry`=13418;
DELETE FROM `gossip_menu` WHERE `entry`=6768 AND `text_id`=6194;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6768,6194);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (6768,8704,8673,8676) AND `id` IN (0);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(6768,0,1, 'Let me browse your seasonal fare.',3,128,0,0,0,0, ''),
(8673,0,0, 'Use the fel crystalforge to make another purchase.',1,1,8672,0,0,0, ''),
(8676,0,0, 'Use the Bash''ir crystalforge to make another purchase.',1,1,8677,0,0,0, ''),
(8704,0,0, 'Insert 35 Apexis Shards, and begin!',1,1,0,0,0,0, '');
UPDATE `gossip_menu` SET `text_id` = '10927' WHERE `entry` =8681 AND `text_id` =11011;
DELETE FROM `gossip_menu` WHERE `entry`=8673 AND `text_id`=10911;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8673,10911);
DELETE FROM `gossip_menu` WHERE `entry`=8676 AND `text_id`=10914;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8676,10914);
DELETE FROM `gossip_menu` WHERE `entry` = 50420;
DELETE FROM `gossip_menu` WHERE `entry` = 50421;
UPDATE `gossip_menu_option` SET `action_menu_id` = '8673' WHERE `menu_id` =8672 AND `id` =0;
UPDATE `gossip_menu_option` SET `action_menu_id` = '8673' WHERE `menu_id` =8672 AND `id` =1;
UPDATE `gossip_menu_option` SET `action_menu_id` = '8676' WHERE `menu_id` =8677 AND `id` =0;
UPDATE `gossip_menu_option` SET `action_menu_id` = '8676' WHERE `menu_id` =8677 AND `id` =1;
UPDATE `gossip_menu_option` SET `option_text` = 'I am interested in warlock training.' WHERE `menu_id` =2384 AND `id` =1;
UPDATE `gossip_menu_option` SET `option_text` = '<Reach down and pull the Injured Rainspeaker Oracle to its feet.>' WHERE `menu_id` =9677 AND `id` =1;
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9713,9674,9684,9728) AND `id` IN (0);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(9713,0,0, 'I''m ready to start the distillation, uh, Tipsy.',1,1,0,0,0,0, ''),
(9684,0,0, 'I am ready to travel to your village now.',1,1,0,0,0,0, ''),
(9728,0,0, '<Check for a pulse...>',1,1,0,0,0,0, ''),
(9674,0,0, 'You look safe enough... let''s do this.',1,1,0,0,0,0, '');
DELETE FROM `gossip_menu` WHERE `entry`=9679 AND `text_id`=13124;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9679,13124);
DELETE FROM `gossip_menu` WHERE `entry`=9684 AND `text_id`=13124;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9684,13124);
UPDATE `gossip_menu` SET `cond_1` = '8',`cond_1_val_1` = '12523' WHERE `entry` =9635 AND `text_id` =13042;
DELETE FROM `gossip_menu` WHERE `entry`=9635 AND `text_id`=13322;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9635,13322);
DELETE FROM `gossip_menu` WHERE `entry`=8560 AND `text_id`=10723;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8560,10723);
DELETE FROM `gossip_menu` WHERE `entry`=8558 AND `text_id`=10722;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8558,10722);
UPDATE `gossip_menu_option` SET `cond_1` = '5',`cond_1_val_1` = '934',`cond_1_val_2` = '6' WHERE `menu_id` =8560 AND `id` =0;
UPDATE `gossip_menu` SET `cond_1` = '5',`cond_1_val_1` = '934',`cond_1_val_2` = '6' WHERE `entry` =8560 AND `text_id` =7778;
UPDATE `gossip_menu` SET `cond_1` = '5',`cond_1_val_1` = '932',`cond_1_val_2` = '6' WHERE `entry` =8558 AND `text_id` =7778;
UPDATE `gossip_menu_option` SET `cond_1` = '5',`cond_1_val_1` = '932',`cond_1_val_2` = '6' WHERE `menu_id` =8558 AND `id` =0;
DELETE FROM `gossip_menu` WHERE `entry`=9562 AND `text_id`=12881;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9562,12881);
DELETE FROM `gossip_menu` WHERE `entry`=9562 AND `text_id`=12882;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9562,12882);
UPDATE `gossip_menu` SET `cond_1` = '8',`cond_1_val_1` = '12311' WHERE `entry` =9562 AND `text_id` =12882;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(9024, 0, 0, '<Get on the work bench and let Walt put you in the golem suit.>', 1, 1, 0, 0, 0, 0, 0, '', 9, 11485, 0, 0, 0, 0, 0, 0, 0),
(9024, 1, 0, '<Get on the work bench and let Walt put you in the golem suit.>', 1, 1, 0, 0, 0, 0, 0, '', 9, 11489, 0, 0, 0, 0, 0, 0, 0),
(9024, 2, 0, '<Get on the work bench and let Walt put you in the golem suit.>', 1, 1, 0, 0, 0, 0, 0, '', 9, 11491, 0, 0, 0, 0, 0, 0, 0),
(9024, 3, 0, '<Get on the work bench and let Walt put you in the golem suit.>', 1, 1, 0, 0, 0, 0, 0, '', 9, 11494, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `gossip_menu` WHERE `entry`=10922 AND `text_id`=15171;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10922,15171);
DELETE FROM `gossip_menu` WHERE `entry`=10909 AND `text_id`=15157;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10909,15157);
UPDATE `creature_template` SET `gossip_menu_id`=10922 WHERE `entry`=37592;
UPDATE `creature_template` SET `gossip_menu_id`=10909 WHERE `entry`=37554;
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (10950) AND `id` IN (0,1);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (10909) AND `id` IN (0);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(10950,0,0, 'Can you remove the sword?',1,1,0,0,0,0, ''),
(10950,1,0, 'Dark Lady, I think I hear Arthas coming. Whatever you''re going to do, do it quickly.',1,1,0,0,0,0, ''),
(10909,0,0, 'We''re ready! Let''s go!',1,1,0,0,0,0, '');
DELETE FROM `gossip_menu` WHERE `entry`=8805 AND `text_id`=11291;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8805,11291);
UPDATE `creature_template` SET `gossip_menu_id`=9879 WHERE `entry`=26916;
UPDATE `gossip_menu_option` SET `option_text` = 'I would like to buy from you.' WHERE `menu_id` =4005 AND `id` =0;
DELETE FROM `gossip_menu` WHERE `entry`=8310 AND `text_id`=10373;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8310,10373);
UPDATE `creature_template` SET `gossip_menu_id`=8310 WHERE `entry`=20977;
UPDATE `gossip_menu_option` SET `action_menu_id`=7829 WHERE `menu_id`=7830 AND `id`=0;
DELETE FROM `gossip_menu` WHERE `entry`=7840 AND `text_id`=9597;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7840,9597);
DELETE FROM `gossip_menu` WHERE `entry`=7852 AND `text_id`=9613;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7852,9613);
UPDATE `gossip_menu_option` SET `action_menu_id` = '7831' WHERE `menu_id` =7829 AND `id` =0;
UPDATE `creature_template` SET `gossip_menu_id`=8038 WHERE `entry`=19840;
DELETE FROM `gossip_menu` WHERE `entry`=8038 AND `text_id`=9925;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8038,9925);
DELETE FROM `gossip_menu` WHERE `entry`=5710 AND `text_id`=6878;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5710,6878);
DELETE FROM `gossip_menu` WHERE `entry`=5711 AND `text_id`=6879;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5711,6879);
DELETE FROM `gossip_menu` WHERE `entry`=5712 AND `text_id`=6880;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (5712,6880);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (5710,5711,5712,5713) AND `id` IN (0);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(5710,0,0, 'Why you little...',1,1,0,0,0,0, ''),
(5711,0,0, 'Mark my words, I will catch you, imp. And when I do!',1,1,0,0,0,0, ''),
(5712,0,0, 'DIE!',1,1,0,0,0,0, ''),
(5713,0,0, 'Prepare to meet your maker.',1,1,0,0,0,0, '');
UPDATE `creature_template` SET `gossip_menu_id`=5710 WHERE `entry`=14354;
DELETE FROM `gossip_menu` WHERE `entry`=10171 AND `text_id`=14115;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (10171,14115);
UPDATE `creature_template` SET `gossip_menu_id`=10171 WHERE `entry`=32301;
DELETE FROM `gossip_menu` WHERE `entry`=8036 AND `text_id`=10045;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8036,10045);
DELETE FROM `gossip_menu` WHERE `entry`=8116 AND `text_id`=10045;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8116,10045);
DELETE FROM `gossip_menu` WHERE `entry`=8113 AND `text_id`=10045;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8113,10045);
DELETE FROM `gossip_menu` WHERE `entry`=8115 AND `text_id`=10045;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8115,10045);
UPDATE `gossip_menu` SET `cond_1` = '2',`cond_1_val_1` = '29366',`cond_1_val_2` = '1' WHERE `entry` =8036 AND `text_id` =10045 AND `script_id` =0;
UPDATE `gossip_menu` SET `cond_1` = '2',`cond_1_val_1` = '29396',`cond_1_val_2` = '1' WHERE `entry` =8113 AND `text_id` =10045 AND `script_id` =0;
UPDATE `gossip_menu` SET `cond_1` = '2',`cond_1_val_1` = '29397',`cond_1_val_2` = '1' WHERE `entry` =8115 AND `text_id` =10045 AND `script_id` =0;
UPDATE `gossip_menu` SET `cond_1` = '2',`cond_1_val_1` = '29411',`cond_1_val_2` = '1' WHERE `entry` =8116 AND `text_id` =10045 AND `script_id` =0;
DELETE FROM `gossip_menu` WHERE `entry`=940 AND `text_id`=1513;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (940,1513);
DELETE FROM `gossip_menu` WHERE `entry`=4005 AND `text_id`=4869;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4005,4869);
UPDATE `gossip_menu` SET `cond_1` = '5',`cond_1_val_1` = '68',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '674' WHERE `entry` =4005 AND `text_id` =4869;
UPDATE `gossip_menu_option` SET `cond_1` = '5',`cond_1_val_1` = '68',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '674' WHERE `menu_id` =4005 AND `id` =0;
UPDATE `creature_template` SET `gossip_menu_id` = '4004' WHERE `entry` =2357;
UPDATE `creature_template` SET `gossip_menu_id` = '4004' WHERE `entry` =4885;
UPDATE `locales_gossip_menu_option` SET `id` = '0' WHERE `menu_id` =4004 AND `id` =2;
UPDATE `gossip_menu_option` SET `id` = '0' WHERE `menu_id` =4004 AND `id` =2;
DELETE FROM `gossip_menu` WHERE `entry`=4004 AND `text_id`=5855;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4004,5855);
UPDATE `gossip_menu_option` SET `cond_1` = '5',`cond_1_val_1` = '72',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '1100' WHERE `menu_id` =4004 AND `id` =0;
UPDATE `gossip_menu` SET `cond_1` = '5',`cond_1_val_1` = '72',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '1100' WHERE `entry` =4004 AND `text_id` =4859;
DELETE FROM `gossip_menu` WHERE `entry`=4006 AND `text_id`=5843;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4006,5843);
UPDATE `gossip_menu_option` SET `cond_1` = '5',`cond_1_val_1` = '81',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '658' WHERE `menu_id` =4006 AND `id` =0;
UPDATE `gossip_menu` SET `cond_1` = '5',`cond_1_val_1` = '81',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '658' WHERE `entry` =4006 AND `text_id` =4862;
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (8036,8113,8115,8116,7840,7852) AND `id` IN (0);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(8036,0,0, '<Begin emergency shutdown.>',1,1,0,0,0,0, ''),
(8113,0,0, '<Begin emergency shutdown.>',1,1,0,0,0,0, ''),
(8115,0,0, '<Begin emergency shutdown.>',1,1,0,0,0,0, ''),
(8116,0,0, '<Begin emergency shutdown.>',1,1,0,0,0,0, ''),
(7840,0,0, 'We''re ready, Thrall.',1,1,0,0,0,0, ''),
(7852,0,0, 'We''ll get you out, Taretha. Don''t worry. I doubt the wizard would wander too far away.',1,1,0,0,0,0, '');
UPDATE `locales_gossip_menu_option` SET `id` = '0' WHERE `menu_id` =3161 AND `id` =1;
UPDATE `gossip_menu_option` SET `id` = '0' WHERE `menu_id` =3161 AND `id` =1;
DELETE FROM `gossip_menu` WHERE `entry`=3161 AND `text_id`=5841;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (3161,5841);
UPDATE `gossip_menu_option` SET `cond_1` = '5',`cond_1_val_1` = '76',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '688' WHERE `menu_id` =3161 AND `id` =0;
UPDATE `gossip_menu` SET `cond_1` = '5',`cond_1_val_1` = '76',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '688' WHERE `entry` =3161 AND `text_id` =3893;
UPDATE `locales_gossip_menu_option` SET `id` = '0' WHERE `menu_id` =3185 AND `id` =1;
UPDATE `gossip_menu_option` SET `id` = '0' WHERE `menu_id` =3185 AND `id` =1;
UPDATE `gossip_menu_option` SET `cond_1` = '5',`cond_1_val_1` = '69',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '1093' WHERE `menu_id` =3185 AND `id` =0;
DELETE FROM `gossip_menu` WHERE `entry`=3162 AND `text_id`=5842;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (3162,5842);
UPDATE `gossip_menu_option` SET `cond_1` = '5',`cond_1_val_1` = '530',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '562' WHERE `menu_id` =3162 AND `id` =0;
UPDATE `gossip_menu` SET `cond_1` = '5',`cond_1_val_1` = '530',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '562' WHERE `entry` =3162 AND `text_id` =3896;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 3186 AND `id` = 2;
UPDATE `locales_gossip_menu_option` SET `id` = '0' WHERE `menu_id` =3186 AND `id` =1;
UPDATE `gossip_menu_option` SET `id` = '0' WHERE `menu_id` =3186 AND `id` =1;
UPDATE `locales_gossip_menu_option` SET `id` = '0' WHERE `menu_id` =8213 AND `id` =1;
UPDATE `gossip_menu_option` SET `id` = '0' WHERE `menu_id` =8213 AND `id` =1;
DELETE FROM `gossip_menu` WHERE `entry`=8213 AND `text_id`=10239;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8213,10239);
UPDATE `gossip_menu_option` SET `cond_1` = '5',`cond_1_val_1` = '930',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '77' WHERE `menu_id` =8213 AND `id` =0;
UPDATE `gossip_menu` SET `cond_1` = '5',`cond_1_val_1` = '930',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '77' WHERE `entry` =8213 AND `text_id` =10208;
DELETE FROM `gossip_menu` WHERE `entry`=8098 AND `text_id`=10305;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (8098,10305);
UPDATE `gossip_menu_option` SET `cond_1` = '5',`cond_1_val_1` = '911',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '178' WHERE `menu_id` =8098 AND `id` =0;
UPDATE `gossip_menu` SET `cond_1` = '5',`cond_1_val_1` = '911',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '178' WHERE `entry` =8098 AND `text_id` =10011;
DELETE FROM `gossip_menu` WHERE `entry`=3185 AND `text_id`=3942;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (3185,3942);
DELETE FROM `gossip_menu` WHERE `entry`=3186 AND `text_id`=3945;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (3186,3945);
UPDATE `gossip_menu` SET `cond_1` = '5',`cond_1_val_1` = '69',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '1093' WHERE `entry` =3185 AND `text_id` =3942;
UPDATE `gossip_menu` SET `cond_1` = '5',`cond_1_val_1` = '54',`cond_1_val_2` = '7',`cond_2` = '14',`cond_2_val_1` = '1037' WHERE `entry` =3186 AND `text_id` =3945;
UPDATE `creature_template` SET `npcflag` = '1' WHERE `entry` =21602;
UPDATE `gossip_menu` SET `cond_1` = '22',`cond_1_val_1` = '256' WHERE `entry` =1632 AND `text_id` =2289 AND `script_id` =0;
DELETE FROM `gossip_menu` WHERE `entry`=2801 AND `text_id`=3494;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (2801,3494);
UPDATE `gossip_menu` SET `cond_1` = '8',`cond_1_val_1` = '385' WHERE `entry` =2801 AND `text_id` =3495 AND `script_id` =0;
UPDATE `creature_template` SET `gossip_menu_id`=6229 WHERE `entry`=7010;
DELETE FROM `gossip_menu` WHERE `entry`=6229 AND `text_id`=7403;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (6229,7403);
UPDATE `gossip_menu` SET `cond_1` = '14',`cond_1_val_2` = '1227' WHERE `entry` =4486 AND `text_id` =539 AND `script_id` =0;
DELETE FROM `gossip_menu` WHERE `entry`=4486 AND `text_id`=538;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4486,538);
UPDATE `gossip_menu_option` SET `option_text` = 'Gorzeeki, I wish to make a purchase.' WHERE `menu_id` =5818 AND `id` =0;
UPDATE `gossip_menu_option` SET `option_text` = 'I seek further druidic training to have a closer understanding of the Earth Mother''s will.' WHERE `menu_id` =4644 AND `id` =1;
UPDATE `gossip_menu_option` SET `option_text` = 'I seek training as a druid.' WHERE `menu_id` =3926 AND `id` =1;
UPDATE `gossip_menu_option` SET `option_text` = '<Push a random button.>' WHERE `menu_id` =8023 AND `id` =0;
UPDATE `gossip_menu_option` SET `option_text` = 'May I browse your epic gem recipes?' WHERE `menu_id` =9873 AND `id` =2;
UPDATE `gossip_menu_option` SET `option_text` = 'Train me.' WHERE `menu_id` =9873 AND `id` =1;
DELETE FROM `gossip_menu` WHERE `entry`=4185 AND `text_id`=5287;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4185,5287);
DELETE FROM `gossip_menu` WHERE `entry`=3926 AND `text_id`=4786;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (3926,4786);
DELETE FROM `gossip_menu` WHERE `entry`=4644 AND `text_id`=5716;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4644,5716);
UPDATE `gossip_menu` SET `cond_1` = '14',`cond_1_val_2` = '511' WHERE `entry` =4644 AND `text_id` =5717 AND `script_id` =0;
UPDATE `gossip_menu` SET `cond_1` = '14',`cond_1_val_2` = '511' WHERE `entry` =3926 AND `text_id` =4785 AND `script_id` =0;
UPDATE `gossip_menu` SET `cond_1` = '7',`cond_1_val_1` = '165',`cond_1_val_2` = '1' WHERE `entry` =4185 AND `text_id` =5285 AND `script_id` =0;
UPDATE `creature_template` SET `gossip_menu_id`=705 WHERE `entry`=1326;
DELETE FROM `gossip_menu` WHERE `entry`=705 AND `text_id`=1257;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (705,1257);
UPDATE `creature_template` SET `gossip_menu_id`=341 WHERE `entry`=3628;
DELETE FROM `gossip_menu` WHERE `entry`=341 AND `text_id`=820;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (341,820);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (705) AND `id` IN (0);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(705,0,1, 'I want to browse your goods.',3,128,0,0,0,0, '');
UPDATE `creature_template` SET `lootid` = '0' WHERE `entry` =1257;
DELETE FROM `creature_loot_template` WHERE `entry` = 1257;
UPDATE `creature_template` SET `gossip_menu_id`=688 WHERE `entry`=1319;
UPDATE `creature_template` SET `gossip_menu_id`=689 WHERE `entry`=1339;
UPDATE `creature_template` SET `gossip_menu_id`=4139 WHERE `entry`=11026;
DELETE FROM `gossip_menu` WHERE `entry`=4139 AND `text_id`=5124;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (4139,5124);
DELETE FROM `npc_gossip` WHERE `npc_guid` = 6452;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 6301;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 40056;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 39860;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 98109;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(643, 1203, 0, 7, 182, 1, 0, 0, 0),
(648, 1208, 0, 0, 0, 0, 0, 0, 0),
(682, 1232, 0, 0, 0, 0, 0, 0, 0),
(1041, 1133, 0, 17, 9788, 0, 0, 0, 0),
(1041, 1123, 0, 17, 9787, 0, 0, 0, 0),
(4469, 3974, 0, 14, 0, 1533, 0, 0, 0),
(4470, 3974, 0, 14, 0, 1533, 0, 0, 0),
(4471, 3974, 0, 14, 0, 1533, 0, 0, 0),
(4503, 5722, 0, 14, 0, 1279, 0, 0, 0),
(4504, 5722, 0, 14, 0, 1279, 0, 0, 0),
(4505, 5722, 0, 14, 0, 1279, 0, 0, 0),
(4508, 4783, 0, 14, 0, 511, 0, 0, 0);
DELETE FROM `gossip_menu` WHERE `entry` = 682 AND `text_id` = 6812;
UPDATE `gossip_menu` SET `cond_1` = '7',`cond_1_val_1` = '186',`cond_1_val_2` = '1' WHERE `entry` =660 AND `text_id` =1225;
UPDATE `gossip_menu` SET `cond_1` = '7',`cond_1_val_1` = '165',`cond_1_val_2` = '1' WHERE `entry` =648 AND `text_id` =1210;
UPDATE `gossip_menu` SET `cond_1` = '7',`cond_1_val_1` = '356',`cond_1_val_2` = '200' WHERE `entry` =645 AND `text_id` =6959;
UPDATE `creature_template` SET `skinloot` = '0',`flags_extra` = '64' WHERE `entry` =15554;
DELETE FROM `skinning_loot_template` WHERE `entry` = 15554;
DELETE FROM `creature` WHERE `guid` = 125111;
DELETE FROM `creature_loot_template` WHERE `entry` = 15552 AND `item` = 31889;
UPDATE `gameobject` SET `spawntimesecs` = '-43200' WHERE `guid` =19053;
UPDATE `gameobject` SET `spawntimesecs` = '-43200' WHERE `guid` =38612;
UPDATE `creature_template` SET `gossip_menu_id` = '17890' WHERE `entry` =17890;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES ('17890', '9118', '0', '0', '0', '0', '0', '0', '0');
UPDATE `creature_template` SET `gossip_menu_id` = '17885' WHERE `entry` =17885;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES ('17885', '9121', '0', '0', '0', '0', '0', '0', '0');
UPDATE `creature_template` SET `gossip_menu_id` = '7486' WHERE `entry` =17832;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES ('7486', '9070', '0', '0', '0', '0', '0', '0', '0');
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(7486, 0, 0, 'Take Blood Knight Insignia', 1, 1, -1, 0, 7486, 0, 0, '', 9, 9692, 1, 24, 24226, 1, 0, 0, 0);
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('7486', '0', '17', '24226', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'create item 24226');
#
UPDATE `creature_template` SET `lootid` = '0',`flags_extra` = '2' WHERE `entry` =17832;
DELETE FROM `creature_loot_template` WHERE `entry` = 17832;
UPDATE `creature_template` SET `unit_flags` = '64', `InhabitType` = '7' WHERE `entry` IN (37126, 38258);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '-25' WHERE `item`= 22138;
DELETE FROM `gameobject_loot_template` WHERE `item` = 14047;
UPDATE `creature_template` SET `lootid` = '0' WHERE `entry` = 466;
DELETE FROM `creature_loot_template` WHERE `entry` = 466;
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 201872;
UPDATE `gameobject_template` SET `flags` = 0 WHERE `entry` IN (201872,201873,201874,201875,202177,202178,202179,202180);
UPDATE `achievement_criteria_requirement` SET `type`='7', `value1`='52092' WHERE `criteria_id`=6835 AND `type`=18;
UPDATE `creature_template_addon` SET `auras`= NULL WHERE `entry` = 28586;
DELETE FROM `creature` WHERE `guid` = 114762;
DELETE FROM `creature` WHERE `guid` = 114763;
UPDATE `gossip_menu_option` SET `cond_2`='0', `cond_2_val_1`='0' WHERE `menu_id`=9301 AND `id`=0;
REPLACE INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(17841, 0, 10, 27273, 10000, 0, 0, 0, 0, 0, 0, 0, 285.6, -357.5, 91.0833, 5.75959, ''),
(17841, 3, 10, 27273, 10000, 0, 0, 0, 0, 0, 0, 0, 307, -357.5, 91.0833, 6.02139, ''),
(17841, 6, 10, 27273, 10000, 0, 0, 0, 0, 0, 0, 0, 285.6, -357.5, 91.0833, 5.75959, '');
DELETE FROM `creature_ai_scripts` WHERE `id` = 2700353;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2700351;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2700352;
DELETE FROM `creature_ai_texts` WHERE `entry` = -50011;
DELETE FROM `creature_ai_texts` WHERE `entry` = -50010;

# FIX
UPDATE creature_equip_template SET entry=40503 WHERE entry=101008;
UPDATE creature_equip_template SET entry=40504 WHERE entry=101009;
UPDATE creature_equip_template SET entry=40505 WHERE entry=101010;
UPDATE `creature_template` SET `equipment_id` = 40503 WHERE `equipment_id` = 101008;
UPDATE `creature_template` SET `equipment_id` = 40504 WHERE `equipment_id` = 101009;
UPDATE `creature_template` SET `equipment_id` = 40505 WHERE `equipment_id` = 101010;
DELETE FROM `creature_loot_template` WHERE (`entry`=19847) AND (`item`=28677);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (19847, 28677, -100, 0, 1, 1);

# WDB
INSERT IGNORE INTO `npc_text` VALUES ('15931', 'Be wary, allies. There are bound to be traps to protect the Firelord from our incursion.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('15776', '', 'A decade ago, a great battle took place here on the summit of Mount Hyjal. Archimonde the Defiler commanded a swarm of demons to march upon the World Tree and claim its power for his own.$B$BHis defeat signaled the end of the Legion\'s invasion of Azeroth... But many of his corrupted supporters remained behind.', '0', '1', '0', '1', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('15777', '', 'Yes and no. He may be a demon now, but Tyrus Blackhorn was a night elf once. Like many of his brothers he was wooed and transformed by the promises of power the demonic army whispered in his ear.$B$BHe was captured after his master\'s defeat and imprisoned here on the summit, his immortal form bound by sacred energies.$B$BBut perhaps the dimmest flicker of a soul still burns within him... We must at least reach out to know for sure.', '0', '1', '0', '274', '0', '1', '0', '273', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('16121', '', 'We mortal races know so little of Aessina, the spirit of the wilderness who lurks in dense untamed woods. She is the soul of the forest, its beating heart, the source of life energy that breaks down stone, devours ancient ruins, and fills dense thickets with mystery and fear. Aessina is the center of the web of life.$B$BThe night elves have built shrines to her throughout Kalimdor. She is revered, yes... But not understood.$B$BWhat would it be like, do you think, to get even a glimpse of this reclusive, powerful ancient?  ', '0', '1', '0', '1', '0', '6', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('16105', 'This place isn\'t quite as cool as the ruins, and the air in here is a bit humid if I do say so myself, but it does have a comfy, home feel to it.$B$BDon\'t you think?', '', '0', '1', '0', '1', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('16008', 'You can teach a soldier how to kill, but you can\'t teach him to want to kill.  That is one thing we don\'t have to worry about down here.  Every single one of my boys can\'t wait to take a piece out of those naga for what they did to us, and I can\'t say I feel  much different.$B$BWe need to find a way to make contact with the surface, but before that, I want to make a bit of \"contact\" with these naga.  We have some brothers to avenge.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('16194', 'I don\'t care if I die inside this husk, $n.  I\'ll pay these naga back for every one of my fellow soldiers they\'ve killed or enslaved!$b$bThe others can worry about escape.  I\'ll worry about doling out punishment to these snakes.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('16195', '', 'Why are they doing this?  For pearls?  For war?  This ancient, Nespirah, is far more powerful than the naga understand.  If they\'re able to turn her towards their will... the damage they could cause would be tremendous.', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('16114', 'It was during those darkest of days that Goldrinn\'s tenacity in war became legendary. While others quaked at the visage of those demon hordes, their multitudes only spurred the great wolf ancient to ever greater feats of strength. He would wade into their ranks, fangs bared and spattered with their vile ichor, his great claws thrashing them by the dozen...$B$BIt was said he stayed behind to cover the Night Elf retreat from Eldre\'Thalas, the ancient city we know now as Dire Maul.$B$BDid he die? I\'m not certain the spirit of animal ferocity can ever truly die, $N.', '', '0', '1', '0', '5', '0', '1', '0', '274', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('16014', 'Amazing materials down here. Amazing! Substitutes for everything. Substitutes for substitutes. Everything\'s possible!', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('16193', 'We\'ve killed dozens of naga to get this far, but they still keep coming.  What will it take to escape this wretched cavern?', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('16631', 'In the Command Center, just outside of Old Town\'s southeast gates, you\'ll find the quartermasters.', 'In the Command Center, just outside of Old Town\'s southeast gates, you\'ll find the quartermasters.', '7', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17152', 'I\'m not surprised.$b$bSo many questions, I cannot ignore...$b$bWhy all these weapons for an archaeological dig? And what is being done with the unearthed relics? Under what authority is the excavation being conducted?$b$bThe answers don\'t seem to be forthcoming. I\'ll just have to find out for myself, I suppose.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17157', 'Speculation, my dear $gboy:girl;!$b$bOnce our eager little furrier has unearthed enough treasure, he\'ll be one of Azeroth\'s most influential figures.$b$bWe\'ll all be properly positioned when that comes to pass.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17305', 'The ambassador lies dead in a pool of his own gore.$b$bThrough his rent clothing, you can make out a row of enormous, deep teethmarks.$b$bEven stranger, the wounds appear to be cauterized, even charred in places.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17150', 'I must admit, I am intrigued by this ambitious little upstart.$b$bI\'m not rushing to judgement, mind you, but I\'ve heard some unsettling rumors.$b$bTime will tell if his motives are just.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17148', 'This is quite an operation here, wouldn\'t you say?', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17156', 'Why, just look at the treasure he has accumulated!$b$bI\'m not always comfortable with his methods, but there\'s no denying the results...$b$bBest not to dwell upon unpleasant thoughts. It\'s bad manners, you know.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17160', 'I see what you mean, I suppose...$b$bYou know, I\'m just here because I want to expand my horizons a bit, see the world and whatnot.$b$bI\'m not terribly concerned with the goings on of others.$b$bNice to meet you, though.$B', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('16736', '', 'The materials I offer are rare and powerful.', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17308', 'Terrible business!$b$bThere was a horrific growling noise that seemed to echo throught the region.$b$bPoor fellow...$b$bYou\'ll excuse me - I do believe I need a drink.', '', '0', '1', '0', '0', '0', '0', '0', '0', 'I cannot be certain of what I saw.$b$bIt was over before I realized what was happening.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17161', '', 'Exquisite weather here, wouldn\'t you say, $c?', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17159', 'He\'s a bit animated for my tastes, but the world needs all kinds, I suppose.$b$bWhy do you ask?$B', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17105', 'The gryphon appears to be trapped. It looks like it would be easily possible to break its bonds though.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17164', '', 'Word has it that some of the relics in these parts hold mystical power!$b$bHe seems to be fascinated with such things...', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17165', '', 'I\'m sorry, $c.$b$bI really don\'t know enough to discuss such things. And honestly, I would prefer to keep it that way.', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17155', 'I say! Raise a glass, my friend!$b$bTake in the sights here.$b$bThis entire region has been hidden away for ages, you know.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17742', '', 'The admiral and his forces pushed forward to take one of the bases you scouted for him earlier. You should go and meet them.', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17410', 'Woohoo!$b$bWe\'ll have to do that again sometime!$b$bWell, I\'m off to do some more research. I\'ll catch up to you when I\'m ready.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17251', 'This Schnottz fellow is proving to be a wise investment.$b$bGood that I was insightful enough to get in on the ground floor.', '', '0', '1', '0', '0', '0', '0', '0', '0', 'Like father always said; it takes a shrewd mind, sharp instincts, and unfailing courage to become a successful investor.$b$bI must admit, I smelled this opportunity a mile away.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17158', 'Now, isn\'t this the place to be?$b$bTouring unexplored corners of the world with likeminded fellows?$b$bWhat could be better?', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17111', 'Dad always told me the big fellas hit hard, but that they\'re slow...$b$bI\'m pretty sure dad never met this guy!', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('16840', 'I cannot. I merely collect.$B$BIbdil may help you. His way is to mend.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17370', 'I was blinded by all of the excitement.$b$bI should have seen this coming from a mile away...', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17163', '', 'Oh, it\'s been wonderful!$b$bThe commander is so confident, and that accent! I must admit, he\'s quite captivating.$b$bDo you know if he\'s married?', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('17014', 'I\'ll be headin\' back shortly, $glad:lass;. Just one more go, for good time\'s sake.', '', '0', '1', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT IGNORE INTO `npc_text` VALUES ('16113', 'From the moment the wild creatures first stirred on Azeroth, Goldrinn was there. His is the spirit of the hunter, the animal instinct that kicks in when wild things smell food or feel their children are in jeopardy. He appears as a great white wolf, ferocious and cunning.$B$BHe\'s known across all cultures. The orcs even have their own name for him: \"Lo\'Gosh.\"$B$BTen thousand years ago, when demons first breached Azeroth, Goldrinn stood with the other ancients to mount a desperate defense.', '', '0', '1', '0', '1', '0', '273', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '', '', '0', '0', '0', '0', '0', '0', '0', '0');

# NeatElves ACID 309a -> 309b
UPDATE db_version SET `creature_ai_version` = 'ACID 3.0.9b \'Streamlined Perfection\' - Full Release for MaNGOS (3.3.5a Client)';
REPLACE INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
('1522401','15224','11','0','100','0','0','0','0','0','11','24780','0','1','20','0','0','0','0','0','0','0','Dream Fog - Cast Dream Fog and Disable Autoattack on Spawn'),
('2281601','22816','6','0','100','0','0','0','0','0','11','39477','1','36','0','0','0','0','0','0','0','0','Black Cat - Cast Back Luck on Death'),
('265402','2654','0','0','100','0','0','0','0','0','11','11017','0','1','0','0','0','0','0','0','0','0','Witherbark Caller - Summon Witherbark Felhunter on Aggro'),
('565502','5655','1','0','100','1','1000','2000','2000','4000','10','4','21','22','0','0','0','0','0','0','0','0','Robert Gossom - OOC Random Emote'),
('565602','5656','1','0','100','1','1000','2000','2000','4000','10','4','21','22','0','0','0','0','0','0','0','0','Richard Van Brunt - OOC Random Emote'),
('565702','5657','1','0','100','1','1000','2000','2000','4000','10','4','21','22','0','0','0','0','0','0','0','0','Marla Fowler - OOC Random Emote'),
('565802','5658','1','0','100','1','1000','2000','2000','4000','10','4','21','22','0','0','0','0','0','0','0','0','Chloe Curthas - OOC Random Emote'),
('565902','5659','1','0','100','1','1000','2000','2000','4000','10','4','21','22','0','0','0','0','0','0','0','0','Andrew Hartwell - OOC Random Emote'),
('566002','5660','1','0','100','1','1000','2000','2000','4000','10','4','21','22','0','0','0','0','0','0','0','0','Riley Walker - OOC Random Emote'),
('2378601','23786','4','0','100','32','0','0','0','0','1','-359','-360','-361','1','-1173','-1174','-1175','0','0','0','0','Stonemaul Spirit - Random Say on Aggro'),
('1562901','15629','0','0','100','0','15000','20000','15000','20000','11','21307','0','0','0','0','0','0','0','0','0','0','Nightmare Phantasm - Cast Swell of Souls'),
('1562902','15629','0','0','100','0','7000','14000','12000','18000','11','17228','0','0','0','0','0','0','0','0','0','0','Nightmare Phantasm - Cast Shadowbolt Volley'),
('326501','3265','1','0','100','0','0','0','0','0','11','6479','0','0','0','0','0','0','0','0','0','0','Razormane Hunter - Spawn Razormane Wolf on Spawn'),
('326502','3265','9','0','100','1','5','25','2300','3900','40','2','0','0','11','6660','1','0','0','0','0','0','Razormane Hunter - Set Ranged Weapon Model and Cast Shoot'),
('326503','3265','9','0','100','1','25','80','0','0','21','1','1','0','20','1','0','0','0','0','0','0','Razormane Hunter - Start Combat Movement and Start Melee over 25th yard '),
('326504','3265','9','0','100','1','10','25','0','0','21','0','1','0','20','0','0','0','0','0','0','0','Razormane Hunter - Prevent Combat Movement and Prevent Melee between 10 and 25 yard '),
('326505','3265','9','0','100','1','0','10','0','0','21','1','0','0','40','1','0','0','20','1','0','0','Razormane Hunter - Start Combat Movement and Set Melee Weapon Model and Start Melee Below 10 Yards ('),
('326506','3265','2','0','100','0','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Razormane Hunter - Flee at 15% HP'),
('326507','3265','7','0','100','0','0','0','0','0','0','0','0','0','40','1','0','0','0','0','0','0','Razormane Hunter -  Set Melee Weapon Model on Evade'),
('1858801','18588','0','0','100','1','2000','2000','30000','30000','11','6726','1','0','0','0','0','0','0','0','0','0','Floon - Cast Silence'),
('1858802','18588','0','0','100','1','4000','4000','5000','7000','11','9672','1','0','0','0','0','0','0','0','0','0','Floon - Cast Frostbolt'),
('1858803','18588','0','0','100','1','9000','9000','20000','20000','11','11831','0','0','0','0','0','0','0','0','0','0','Floon - Cast Frost Nova'),
('1858601','18586','1','0','100','1','1000','1000','600000','600000','11','12550','0','0','0','0','0','0','0','0','0','0','Coosh\'coosh - Cast Lightning Shield on Spawn'),
('1858602','18586','27','0','100','1','12550','3','10000','20000','11','12550','0','0','0','0','0','0','0','0','0','0','Coosh\'coosh - Cast Lightning Shield on Missing Buff'),
('1858603','18586','0','0','100','1','2000','2000','5000','5000','11','9532','1','0','0','0','0','0','0','0','0','0','Coosh\'coosh - Cast Lightning Bolt'),
('2734901','27349','8','0','100','0','48188','-1','0','0','33','27253','6','0','1','-174','0','0','41','0','0','0','Scarlet Onslaught Prisoner - Quest Credit and Text Emote and Despawn on Flask of Blight Spellhit (Quest: 12206)'),
('2417301','24173','11','0','100','0','0','0','0','0','18','256','0','0','0','0','0','0','0','0','0','0','Frostgore - Set Not Attackable Flag on Spawn'),
('2417302','24173','0','0','100','1','3000','13000','16000','19000','11','52058','1','0','0','0','0','0','0','0','0','0','Frostgore - Cast Ground Slam'),
('2427901','24279','4','0','30','0','0','0','0','0','11','3335','1','0','0','0','0','0','0','0','0','0','Animated Plague Slime - Cast Dark Sludge on Aggro'),
('2437101','24371','6','0','100','0','0','0','0','0','1','-1172','0','0','0','0','0','0','0','0','0','0','Megalith - Yell on Death'),
('2463801','24638','0','0','100','1','2000','5000','2000','5000','11','43619','4','0','0','0','0','0','0','0','0','0','Keeper Witherleaf - Cast Wrath'),
('2463802','24638','2','0','100','0','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Keeper Witherlea - Flee at 15% HP'),
('1604802','16048','8','0','100','2','27203','-1','0','0','12','16042','1','60000','41','0','0','0','0','0','0','0','Lord Valthalak Trigger - Spawn Lord Valthalak and Despawn Trigger on Summon Various DND Spellhit'),
('1604401','16044','8','0','100','2','27184','-1','0','0','12','16080','1','60000','41','0','0','0','0','0','0','0','Mor Grayhoof Trigger - Spawn Mor Grayhoof and Despawn Trigger on Summon Mor Grayhoof DND Spellhit'),
('1604402','16044','8','0','100','2','27203','-1','0','0','12','16080','1','60000','41','0','0','0','0','0','0','0','Mor Grayhoof Trigger - Spawn Mor Grayhoof and Despawn Trigger on Summon Various DND Spellhit'),
('1604501','16045','8','0','100','2','27190','-1','0','0','12','16097','1','60000','41','0','0','0','0','0','0','0','Isalien Trigger - Spawn Isalien and Despawn Trigger on Summon Isalien DND Spellhit'),
('1604502','16045','8','0','100','2','27203','-1','0','0','12','16097','1','60000','41','0','0','0','0','0','0','0','Isalien Trigger - Spawn Isalien and Despawn Trigger on Summon Various DND Spellhit'),
('1604601','16046','8','0','100','2','27191','-1','0','0','12','16102','1','60000','12','16101','6','60000','41','0','0','0','Jarien and Sothos Trigger - Spawn Jarien and Sothos and Despawn Trigger on Summon Jarien and Sothos DND Spellhit'),
('1604602','16046','8','0','100','2','27203','-1','0','0','12','16102','1','60000','12','16101','6','60000','41','0','0','0','Jarien and Sothos Trigger - Spawn Jarien and Sothos and Despawn Trigger on Summon Various DND Spellhit'),
('1604701','16047','8','0','100','2','27201','-1','0','0','12','16118','1','60000','41','0','0','0','0','0','0','0','Kormok Trigger - Spawn Kormok and Despawn Trigger on Summon Kormok DND Spellhit'),
('1604702','16047','8','0','100','2','27203','-1','0','0','12','16118','1','60000','41','0','0','0','0','0','0','0','Kormok Trigger - Spawn Kormok and Despawn Trigger on Summon Various DND Spellhit'),
('1044001','10440','4','0','100','2','0','0','0','0','34','6','1','0','0','0','0','0','0','0','0','0','Baron Rivendare - Set Instance Data on Aggro'),
('1044002','10440','0','0','100','3','12000','12000','10000','25000','11','15708','4','0','0','0','0','0','0','0','0','0','Baron Rivendare - Cast Mortal Strike'),
('1044003','10440','0','0','100','3','8000','8000','7000','17000','11','15284','1','0','0','0','0','0','0','0','0','0','Baron Rivendare - Cast Cleave'),
('1044004','10440','0','0','100','3','5000','5000','10000','10000','11','17393','4','0','0','0','0','0','0','0','0','0','Baron Rivendare - Cast Shadowbolt'),
('1044005','10440','0','0','100','3','30000','30000','45000','45000','11','17473','0','2','0','0','0','0','0','0','0','0','Baron Rivendare - Cast Raise Dead'),
('1044006','10440','8','0','100','3','17473','-1','45000','45000','11','17475','4','2','11','17476','4','2','11','17477','4','2','Baron Rivendare - Cast Raise Dead on Raise Dead Spellhit (1,2,3)'),
('1044007','10440','8','0','100','3','17473','-1','45000','45000','11','17478','4','2','11','17479','4','2','11','17480','4','2','Baron Rivendare - Cast Raise Dead on Raise Dead Spellhit (4,5,6)'),
('2926601','29266','4','0','100','6','0','0','0','0','1','-811','0','0','31','1','3','0','0','0','0','0', 'Xevozz - Yell and Set Random Phase on Aggro'),
('2926602','29266','0','0','100','6','10000','10000','0','0','1','-1187','0','0','0','0','0','0','0','0','0','0', 'Xevozz - Yell and Initial Summon Spheres'),
('2926603','29266','0','0','100','7','55000','55000','45000','45000','1','-1185','-1186','0','0','0','0','0','0','0','0','0', 'Xevozz - Yell Summon Spheres'),
('2926604','29266','0','0','100','35','10000','10000','45000','45000','11','54102','0','2','11','54137','0','2','11','54138','0','2', 'Xevozz (Normal) - Cast Summon Spheres'),
('2926605','29266','0','0','100','3','15000','15000','50000','50000','11','54226','4','0','0','0','0','0','0','0','0','0', 'Xevozz (Normal) - Cast Arcane Buffet'),
('2926606','29266','0','0','100','5','15000','15000','50000','50000','11','59485','4','0','0','0','0','0','0','0','0','0', 'Xevozz (Heroic) - Cast Arcane Buffet'),
('2926607','29266','0','12','100','5','10000','10000','45000','45000','11','61337','0','2','11','61338','0','0','31','1','3','0', 'Xevozz (Heroic) - Cast Summon Spheres (Phase 1)'),
('2926608','29266','0','11','100','5','10000','10000','45000','45000','11','61337','0','2','11','61339','0','0','31','1','3','0', 'Xevozz (Heroic) - Cast Summon Spheres (Phase 2)'),
('2926609','29266','0','7','100','5','10000','10000','45000','45000','11','61339','0','2','11','61338','0','0','31','1','3','0', 'Xevozz (Heroic) - Cast Summon Spheres (Phase 3)'),
('2926610','29266','0','0','100','3','20000','25000','20000','25000','11','54202','0','0','0','0','0','0','0','0','0','0', 'Xevozz (Normal) - Cast Arcane Barrage Volley'),
('2926611','29266','0','0','100','5','20000','25000','20000','25000','11','59483','0','0','0','0','0','0','0','0','0','0', 'Xevozz (Heroic) - Cast Arcane Barrage Volley'),
('2926612','29266','5','0','100','6','0','0','0','0','1','-812','-813','-814','0','0','0','0','0','0','0','0', 'Xevozz - Random Yell on Player Kill'),
('2926613','29266','6','0','100','6','0','0','0','0','1','-815','0','0','0','0','0','0','0','0','0','0', 'Xevozz - Yell on Death'),
('2931201','29312','0','0','100','5','1000','3000','30000','45000','11','59466','4','33','0','0','0','0','0','0','0','0','Lavanthor (Heroic) - Cast Cauterizing Flames'),
('2931202','29312','0','0','100','3','4000','7000','10000','14000','11','54235','1','0','0','0','0','0','0','0','0','0','Lavanthor (Normal) - Cast Firebolt'),
('2931203','29312','0','0','100','5','4000','7000','10000','14000','11','59468','1','0','0','0','0','0','0','0','0','0','Lavanthor (Heroic) - Cast Firebolt'),
('2931204','29312','0','0','100','3','8000','11000','16000','22000','11','54282','0','0','0','0','0','0','0','0','0','0','Lavanthor (Normal) - Cast Flame Breath'),
('2931205','29312','0','0','100','5','8000','11000','16000','22000','11','59469','0','0','0','0','0','0','0','0','0','0','Lavanthor (Heroic) - Cast Flame Breath'),
('2931206','29312','0','0','100','3','11000','15000','30000','40000','11','59594','4','1','0','0','0','0','0','0','0','0','Lavanthor (Normal) - Cast Lava Burn'),
('2931207','29312','0','0','100','5','11000','15000','30000','40000','11','54249','4','1','0','0','0','0','0','0','0','0','Lavanthor (Heroic) - Cast Lava Burn'),
('2931401','29314','4','0','100','6','0','0','0','0','1','-1188','0','0','0','0','0','0','0','0','0','0', 'Zuramat the Obliterator - Yell on Aggro'),
('2931402','29314','0','0','100','7','5000','10000','10000','15000','11','54369','0','0','0','0','0','0','0','0','0','0', 'Zuramat the Obliterator - Cast Summon Void Sentry'),
('2931403','29314','0','0','100','3','10000','10000','15000','15000','11','54361','4','0','0','0','0','0','0','0','0','0', 'Zuramat the Obliterator (Normal) - Cast Void Shift'),
('2931404','29314','0','0','100','5','10000','10000','15000','15000','11','59743','4','0','0','0','0','0','0','0','0','0', 'Zuramat the Obliterator (Heroic) - Cast Void Shift'),
('2931405','29314','0','0','100','3','20000','25000','20000','25000','11','54524','0','0','1','-1193','0','0','0','0','0','0', 'Zuramat the Obliterator (Normal) - Cast Shroud of Darkness'),
('2931406','29314','0','0','100','5','20000','25000','20000','25000','11','59745','0','0','1','-1193','0','0','0','0','0','0', 'Zuramat the Obliterator (Heroic) - Cast Shroud of Darkness'),
('2931407','29314','5','0','100','7','0','0','0','0','1','-1189','-1190','-1191','0','0','0','0','0','0','0','0', 'Zuramat the Obliterator - Random Yell on Player Kill'),
('2931408','29314','6','0','100','6','0','0','0','0','1','-1192','0','0','0','0','0','0','0','0','0','0', 'Zuramat the Obliterator - Yell on Death'),
('2931601','29316','0','0','100','39','2000','7000','2000','7000','11','59525','4','0','11','54417','4','0','0','0','0','0', 'Moragg - Random Cast Ray of Pain or Ray of Suffering'),
('2931602','29316','0','0','100','7','10000','15000','10000','15000','11','54527','1','0','0','0','0','0','0','0','0','0', 'Moragg - Cast Corrosive Saliva'),
('2931603','29316','0','0','100','7','30000','30000','30000','35000','11','54396','4','0','0','0','0','0','0','0','0','0', 'Moragg - Cast Optic Link'),
('2932101','29321','6','0','100','6','0','0','0','0','11','59516','0','7','0','0','0','0','0','0','0','0', 'Ichor Globule - Cast Splash on Death'),
('3113401','31134','11','0','100','6','0','0','0','0','1','-1181','0','0','0','0','0','0','0','0','0','0', 'Cyanigosa - Yell on Spawn'),
('3113402','31134','1','0','100','6','12000','12000','12000','12000','11','58668','0','0','0','0','0','0','0','0','0','0','Cyanigosa - Cast Cyanigosa Transform OOC'),
('3113403','31134','1','0','100','6','15000','15000','15000','15000','19','512','0','0','0','0','0','0','0','0','0','0','Cyanigosa - Remove Unit Flag Passive OOC'),
('3113404','31134','4','0','100','6','0','0','0','0','1','-1176','0','0','0','0','0','0','0','0','0','0', 'Cyanigosa - Yell on Aggro'),
('3113405','31134','0','0','100','3','8000','11000','8000','11000','11','58690','0','0','0','0','0','0','0','0','0','0', 'Cyanigosa (Normal) - Cast Tail Sweep'),
('3113406','31134','0','0','100','5','8000','11000','8000','11000','11','59283','0','0','0','0','0','0','0','0','0','0', 'Cyanigosa (Heroic) - Cast Tail Sweep'),
('3113407','31134','0','0','100','3','10000','12000','10000','15000','11','58688','0','0','0','0','0','0','0','0','0','0', 'Cyanigosa (Normal) - Cast Uncontrollable Energy'),
('3113408','31134','0','0','100','5','10000','12000','10000','15000','11','59281','0','0','0','0','0','0','0','0','0','0', 'Cyanigosa (Heroic) - Cast Uncontrollable Energy'),
('3113409','31134','0','0','100','3','20000','25000','20000','25000','11','58693','4','0','0','0','0','0','0','0','0','0', 'Cyanigosa (Normal) - Cast Blizzard'),
('3113410','31134','0','0','100','5','20000','25000','20000','25000','11','59369','4','0','0','0','0','0','0','0','0','0', 'Cyanigosa (Heroic) - Cast Blizzard'),
('3113411','31134','0','0','100','7','5000','7000','8000','13000','11','59374','4','0','0','0','0','0','0','0','0','0', 'Cyanigosa - Cast Mana Destruction'),
('3113412','31134','0','0','100','7','35000','35000','35000','35000','11','58694','0','0','0','0','0','0','0','0','0','0', 'Cyanigosa - Cast Arcane Vacuum'),
('3113413','31134','5','0','100','6','0','0','0','0','1','-1177','-1178','-1179','0','0','0','0','0','0','0','0', 'Cyanigosa - Random Yell on Player Kill'),
('3113414','31134','6','0','100','6','0','0','0','0','1','-1180','0','0','0','0','0','0','0','0','0','0', 'Cyanigosa - Yell on Death'),
('3113415','31134','7','0','100','6','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0', 'Cyanigosa - Forced Despawn on Evade'),
('3223001','32230','4','0','100','6','0','0','0','0','1','-1188','0','0','0','0','0','0','0','0','0','0', 'Void Lord - Yell on Aggro'),
('3223002','32230','0','0','100','7','5000','10000','10000','15000','11','54369','0','0','0','0','0','0','0','0','0','0', 'Void Lord - Cast Summon Void Sentry'),
('3223003','32230','0','0','100','3','10000','10000','15000','15000','11','54361','4','0','0','0','0','0','0','0','0','0', 'Void Lord (Normal) - Cast Void Shift'),
('3223004','32230','0','0','100','5','10000','10000','15000','15000','11','59743','4','0','0','0','0','0','0','0','0','0', 'Void Lord (Heroic) - Cast Void Shift'),
('3223005','32230','0','0','100','3','20000','25000','20000','25000','11','54524','0','0','1','-1193','0','0','0','0','0','0', 'Void Lord (Normal) - Cast Shroud of Darkness'),
('3223006','32230','0','0','100','5','20000','25000','20000','25000','11','59745','0','0','1','-1193','0','0','0','0','0','0', 'Void Lord (Heroic) - Cast Shroud of Darkness'),
('3223007','32230','5','0','100','7','0','0','0','0','1','-1189','-1190','-1191','0','0','0','0','0','0','0','0', 'Void Lord - Random Yell on Player Kill'),
('3223008','32230','6','0','100','6','0','0','0','0','1','-1192','0','0','0','0','0','0','0','0','0','0', 'Void Lord - Yell on Death'),
('3223101','32231','4','0','100','6','0','0','0','0','1','-811','0','0','31','1','3','0','0','0','0','0', 'Ethereal Wind Trader - Yell and Set Random Phase on Aggro'),
('3223102','32231','0','0','100','6','10000','10000','0','0','1','-1187','0','0','0','0','0','0','0','0','0','0', 'Ethereal Wind Trader - Yell and Initial Summon Spheres'),
('3223103','32231','0','0','100','7','55000','55000','45000','45000','1','-1185','-1186','0','0','0','0','0','0','0','0','0', 'Ethereal Wind Trader - Yell Summon Spheres'),
('3223104','32231','0','0','100','35','10000','10000','45000','45000','11','54102','0','2','11','54137','0','2','11','54138','0','2', 'Ethereal Wind Trader (Normal) - Cast Summon Spheres'),
('3223105','32231','0','0','100','3','15000','15000','50000','50000','11','54226','4','0','0','0','0','0','0','0','0','0', 'Ethereal Wind Trader (Normal) - Cast Arcane Buffet'),
('3223106','32231','0','0','100','5','15000','15000','50000','50000','11','59485','4','0','0','0','0','0','0','0','0','0', 'Ethereal Wind Trader (Heroic) - Cast Arcane Buffet'),
('3223107','32231','0','12','100','5','10000','10000','45000','45000','11','61337','0','2','11','61338','0','0','31','1','3','0', 'Ethereal Wind Trader (Heroic) - Cast Summon Spheres (Phase 1)'),
('3223108','32231','0','11','100','5','10000','10000','45000','45000','11','61337','0','2','11','61339','0','0','31','1','3','0', 'Ethereal Wind Trader (Heroic) - Cast Summon Spheres (Phase 2)'),
('3223109','32231','0','7','100','5','10000','10000','45000','45000','11','61339','0','2','11','61338','0','0','31','1','3','0', 'Ethereal Wind Trader (Heroic) - Cast Summon Spheres (Phase 3)'),
('3223110','32231','0','0','100','3','20000','25000','20000','25000','11','54202','0','0','0','0','0','0','0','0','0','0', 'Ethereal Wind Trader (Normal) - Cast Arcane Barrage Volley'),
('3223111','32231','0','0','100','5','20000','25000','20000','25000','11','59483','0','0','0','0','0','0','0','0','0','0', 'Ethereal Wind Trader (Heroic) - Cast Arcane Barrage Volley'),
('3223112','32231','5','0','100','6','0','0','0','0','1','-812','-813','-814','0','0','0','0','0','0','0','0', 'Ethereal Wind Trader - Random Yell on Player Kill'),
('3223113','32231','6','0','100','6','0','0','0','0','1','-815','0','0','0','0','0','0','0','0','0','0', 'Ethereal Wind Trader - Yell on Death'),
('3223501','32235','0','0','100','7','10000','15000','10000','15000','11','54527','1','0','0','0','0','0','0','0','0','0', 'Chaos Watcher - Cast Corrosive Saliva'),
('3223502','32235','0','0','100','7','30000','30000','30000','35000','11','54396','4','0','0','0','0','0','0','0','0','0', 'Chaos Watcher - Cast Optic Link'),
('3223503','32235','0','0','100','39','2000','4000','2000','4000','11','59525','4','0','11','54417','4','0','0','0','0','0', 'Chaos Watcher - Random Cast Ray of Pain or Ray of Suffering'),
('3223701','32237','0','0','100','5','1000','3000','30000','45000','11','59466','4','33','0','0','0','0','0','0','0','0','Lava Hound (Heroic) - Cast Cauterizing Flames'),
('3223702','32237','0','0','100','3','4000','7000','10000','14000','11','54235','1','0','0','0','0','0','0','0','0','0','Lava Hound (Normal) - Cast Firebolt'),
('3223703','32237','0','0','100','5','4000','7000','10000','14000','11','59468','1','0','0','0','0','0','0','0','0','0','Lava Hound (Heroic) - Cast Firebolt'),
('3223704','32237','0','0','100','3','8000','11000','16000','22000','11','54282','0','0','0','0','0','0','0','0','0','0','Lava Hound (Normal) - Cast Flame Breath'),
('3223705','32237','0','0','100','5','8000','11000','16000','22000','11','59469','0','0','0','0','0','0','0','0','0','0','Lava Hound (Heroic) - Cast Flame Breath'),
('3223706','32237','0','0','100','3','11000','15000','30000','40000','11','59594','4','1','0','0','0','0','0','0','0','0','Lava Hound (Normal) - Cast Lava Burn'),
('3223707','32237','0','0','100','5','11000','15000','30000','40000','11','54249','4','1','0','0','0','0','0','0','0','0','Lava Hound (Heroic) - Cast Lava Burn'),
('2797701','27977','4','0','100','6','0','0','0','0','1','-1182','0','0','0','0','0','0','0','0','0','0','Krystallus - Yell on Aggro'),
('2797702','27977','0','0','100','7','10000','15000','10000','20000','11','59750','4','0','0','0','0','0','0','0','0','0','Krystallus - Cast Ground Spike'),
('2797703','27977','0','0','100','3','30000','35000','20000','35000','11','50843','4','0','0','0','0','0','0','0','0','0','Krystallus (Normal) - Cast Boulder Toss'),
('2797704','27977','0','0','100','5','30000','35000','20000','35000','11','59742','4','0','0','0','0','0','0','0','0','0','Krystallus (Heroic) - Cast Boulder Toss'),
('2797705','27977','0','0','100','3','18000','18000','30000','30000','11','50868','0','0','0','0','0','0','0','0','0','0','Krystallus (Normal) - Cast Stomp'),
('2797706','27977','0','0','100','5','18000','18000','30000','30000','11','59744','0','0','0','0','0','0','0','0','0','0','Krystallus (Heroic) - Cast Stomp'),
('2797707','27977','0','0','100','3','21000','21000','30000','30000','11','50827','0','0','0','0','0','0','0','0','0','0','Krystallus - Cast Ground Slam Right After Stomp'),
('2797708','27977','0','0','100','3','28000','28000','30000','30000','11','50810','0','7','0','0','0','0','0','0','0','0','Krystallus (Normal) - Cast Shatter Right After Ground Slam'),
('2797709','27977','0','0','100','5','28000','28000','30000','30000','11','61546','0','7','0','0','0','0','0','0','0','0','Krystallus (Heroic) - Cast Shatter Right After Ground Slam'),
('2797710','27977','5','0','100','7','0','0','0','0','1','-1183','0','0','0','0','0','0','0','0','0','0','Krystallus - Yell on Player Kill'),
('2797711','27977','6','0','100','6','0','0','0','0','1','-1184','0','0','0','0','0','0','0','0','0','0','Krystallus - Yell on Death'),
('1647401','16474','11','0','100','7','0','0','0','0','20','0','0','0','0','0','0','0','0','0','0','0','Blizzard - Disable Autoattack on Spawn'),
('1647402','16474','0','0','100','3','0','500','3000','3000','11','28547','0','2','0','0','0','0','0','0','0','0','Blizzard (Normal) - Cast Chill'),
('1647403','16474','0','0','100','5','0','500','3000','3000','11','55699','0','2','0','0','0','0','0','0','0','0','Blizzard (Heroic) - Cast Chill'),
('2604601','26046','11','0','100','2','0','0','0','0','11','46367','0','0','0','0','0','0','0','0','0','0','Anveena - Cast Anveena\'s Prison on Spawn'),
('3295801','32958','11','0','100','2','0','0','0','0','11','62052','0','0','38','0','0','0','0','0','0','0','Lightning Elemental (Normal) - Cast Lightning Elemental Passive and Set in Combat on Spawn'),
('3295802','32958','11','0','100','4','0','0','0','0','11','63492','0','0','38','0','0','0','0','0','0','0','Lightning Elemental (Heroic) - Cast Lightning Elemental Passive and Set in Combat on Spawn');
REPLACE INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES
('-174','The %s moans but seems otherwise unaffected by the blight.','0','2','0','27349','0'),
('-1172','I have fallen! Fear not, brethren! Let nothing keep you from the Stoneforge!','0','1','0','24371','0'),
('-1173','Me crush puny friend of dragons!','0','0','0','23786','0'),
('-1174','You leave Stonemaul lands now!','0','0','0','23786','0'),
('-1175','Why you wake ghost? Where other Stonemauls?!','0','0','0','23786','0'),
('-1176', 'We finish this now, champions of Kirin Tor!','13947','1','0','31134','0'),
('-1177', 'I will end the Kirin Tor!','13952','1','0','31134','0'),
('-1178', 'Dalaran will fall!','13953','1','0','31134','0'),
('-1179', 'So ends your defiance of the Spell-Weaver!','13954','1','0','31134','0'),
('-1180', 'Perhaps... we have... underestimated... you.','13955','1','0','31134','0'),
('-1181', 'A valiant defense, but this city must be razed. I will fulfill Malygos\'s wishes myself!','13946','1','0','31134','0'),
('-1182','Crush....','14176','1','0','27977','0'),
('-1183','Ha...ha...ha...ha...','14177','1','0','27977','0'),
('-1184','Uuuuhhhhhhhhhh......','14179','1','0','27977','0'),
('-1185', 'The air teems with latent energy... quite the harvest!','14501','1','0','29266','0'),
('-1186', 'Plentiful, exploitable resources... primed for acquisition!','14502','1','0','29266','0'),
('-1187', 'Intriguing... a high quantity of arcane energy is near. Time for some prospecting...','14500','1','0','29266','0'),
('-1188', 'Eradicate.','13996','1','0','29314','0'),
('-1189', 'More... energy.','13999','1','0','29314','0'),
('-1190', 'Relinquish.','14000','1','0','29314','0'),
('-1191', 'Fall... to shadow.','14001','1','0','29314','0'),
('-1192', 'Disperse.','14002','1','0','29314','0'),
('-1193', 'Know... my... pain.','13997','1','0','29314','0');
DELETE FROM creature_ai_texts WHERE entry in (-142,-143,-144,-145,-146,-147,-810);
DELETE FROM creature_ai_scripts WHERE id = 326508;
DELETE FROM creature_ai_scripts WHERE creature_id = 4509;
UPDATE creature_template SET AIName='' WHERE entry = 4509;
UPDATE creature_template SET AIName='EventAI' WHERE entry IN (15629,18588,18586,24173,24279,24371,24638,16044,16045,16046,16047,10440,29314,29316,31134,32231,27977,26046,32958);
UPDATE creature_template SET AIName='EventAI' WHERE entry IN (23786);

# Herurg
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(7306, 194905, 603, 3, 1, 147.036, -123.838, 409.805, 6.28083, 0, 0, 0.00117889, -0.999999, 604800, 0, 0),
(7308, 194905, 603, 3, 1, 147.831, -103.135, 409.805, 6.2769, 0, 0, 0.00314203, -0.999995, 604800, 0, 0),
(73313, 194905, 603, 3, 1, 401.308, -13.8236, 409.524, 3.14159, 0, 0, 0, 0, 604800, 0, 0),
(7309, 194905, 603, 3, 1, 148.213, -43.8613, 409.805, 0.00156927, 0, 0, 0.000784635, 1, 604800, 0, 0),
(7311, 194905, 603, 3, 1, 148.187, -27.1173, 409.805, 0.00156927, 0, 0, 0.000784635, 1, 604800, 0, 0),
(7315, 194905, 603, 3, 1, 148.043, 27.1395, 409.805, 0.0015707, 0, 0, 0.000785351, 1, 604800, 0, 0),
(7316, 194905, 603, 3, 1, 148.286, 51.8011, 409.804, 0.00942516, 0, 0, 0.00471256, 0.999989, 604800, 0, 0);

# NeatElves
UPDATE `creature` SET `MovementType` = 1, `spawndist` = 10 WHERE `id` =26570;
DELETE FROM `creature_movement` WHERE `id` in (78366,78356,78355);
UPDATE `creature_template` SET `spell1` = 0, `ScriptName` = '' WHERE `entry` =26570;
UPDATE `creature_template` SET `flags_extra`='2' WHERE `entry`=23102;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`) VALUES 
(78318,23102,530,1,1,0,0,-2414.89038,4436.77,163.188354,0.209439516,120,0,0,881,0),
(78590,23102,530,1,1,0,0,-2414.979,4458.585,165.8086,2.80998015,120,0,0,881,0),
(78591,23102,530,1,1,0,0,-2418.69775,4446.772,165.705322,2.18166161,120,0,0,881,0),
(78592,23102,530,1,1,0,0,-2423.714,4453.51563,165.694977,0.575958669,120,0,0,881,0),
(79169,23102,530,1,1,0,0,-2426.56567,4437.25732,168.060211,3.63028479,120,0,0,881,0),
(80012,23102,530,1,1,0,0,-2428.65723,4460.04932,166.3208,0.7679449,120,0,0,881,0),
(82738,23102,530,1,1,0,0,-2432.37817,4444.567,170.260162,4.59021568,120,0,0,881,0),
(82740,23102,530,1,1,0,0,-2432.45435,4434.5835,170.945572,0.820304751,120,0,0,881,0),
(82741,23102,530,1,1,0,0,-2432.74561,4458.09668,166.1593,1.27409029,120,0,0,881,0),
(82742,23102,530,1,1,0,0,-2435.68359,4440.8667,171.700333,4.049164,120,0,0,881,0),
(82744,23102,530,1,1,0,0,-2443.70239,4634.14355,158.2777,0,120,0,0,881,0),
(82745,23102,530,1,1,0,0,-2466.943,4699.982,155.832977,0,120,0,0,881,0),
(82748,23102,530,1,1,0,0,-2482.24243,4661.68066,161.495926,0,120,0,0,881,0);
UPDATE `npc_trainer` SET `reqskill`='762', `reqskillvalue`='150' WHERE `spell`=34767;
DELETE FROM `npc_trainer` WHERE `entry` = 16275 AND `spell` = 23214;
DELETE FROM `npc_trainer` WHERE `entry` = 16679 AND `spell` = 23214;
DELETE FROM `npc_trainer` WHERE `entry` = 16680 AND `spell` = 23214;
DELETE FROM `npc_trainer` WHERE `entry` = 16681 AND `spell` = 23214;
DELETE FROM `npc_trainer` WHERE `entry` = 20406 AND `spell` = 23214;
DELETE FROM `npc_trainer` WHERE `entry` = 23128 AND `spell` = 23214;
UPDATE `gossip_menu` SET `cond_1`='6', `cond_1_val_1`='67' WHERE `entry`=9627 AND `text_id`=13024;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(9500, 1, 0, 'You''re free to go Orsonn, but first tell me what''s wrong with the furbolg.', 1, 1, 9502, 0, 0, 0, 0, NULL, 9, 12231, 0, 0, 0, 0, 0, 0, 0),
(9504, 1, 0, 'Who was this stranger?', 1, 1, 9505, 0, 0, 0, 0, NULL, 9, 12231, 0, 0, 0, 0, 0, 0, 0);
UPDATE `gameobject` SET `spawntimesecs`='-300' WHERE `guid`=49322;
UPDATE `gameobject` SET `spawntimesecs`='-180' WHERE `guid`=67063;
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(7319, 182529, 530, 1, 1, 253.535, 7083.8, 36.9946, -0.0174535, 0, 0, -0.00872664, 0.999962, 300, 100, 1),
(7321, 182281, 530, 1, 1, -1385.07, 7779.34, -11.2055, 0.785398, 0, 0, 0.382683, 0.92388, 180, 100, 1),
(7322, 182282, 530, 1, 1, -1649.99, 7732.57, -15.4506, -2.40855, 0, 0, -0.93358, 0.35837, 180, 100, 1),
(7323, 182273, 530, 1, 1, -1389.53, 7782.51, -11.6257, -1.51844, 0, 0, -0.688356, 0.725373, 180, 100, 1),
(7325, 182274, 530, 1, 1, -1662.28, 7735, -15.9663, 1.88495, 0, 0, 0.809015, 0.587788, 180, 100, 1);
DELETE FROM `creature_template_addon` WHERE (`entry`=18757);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES (18757, 0, 0, 1, 0, 0, 0, 32839);
UPDATE `gameobject_template` SET `faction` = 1314 WHERE `entry` = 181955;
UPDATE `gameobject` SET `state`='1' WHERE `guid`=49069;
UPDATE `gameobject` SET `spawntimesecs` = -180 WHERE `id` IN (182301,182302,182303,182304,182305,182306,182307,182308,182297,182298,182299,182300);
UPDATE `gameobject` SET `spawntimesecs` = -180 WHERE `id` IN (182267,182280,182281,182282,182222,182272,182273,182274,182266,182275,182276,182277);
UPDATE `creature_template` SET `MovementType` = 0 WHERE `entry` IN (17647);
DELETE FROM `creature` WHERE `guid` = 102409;
DELETE FROM `creature` WHERE `guid` = 102410;
DELETE FROM `creature` WHERE `guid` = 102415;
DELETE FROM `creature` WHERE `guid` = 102416;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(75885, 21484, 530, 1, 1, 0, 0, -1524.84, 7930.34, -20.182, 3.6405, 600, 0, 0, 104790, 0, 0, 0),
(62992, 18759, 530, 1, 1, 0, 0, 273.866, 7082.68, 87.0635, 3.01942, 180, 0, 0, 1, 0, 0, 0),
(64420, 18759, 530, 1, 1, 0, 0, 375.806, 7332.96, 63.1065, 2.94961, 180, 0, 0, 1, 0, 0, 0),
(64450, 18759, 530, 1, 1, 0, 0, 340.453, 6833.1, 61.798, 3.01942, 180, 0, 0, 1, 0, 0, 0),
(123462, 18757, 530, 1, 1, 0, 0, 273.866, 7082.68, 87.0635, 3.01942, 180, 0, 0, 1, 0, 0, 0),
(82794, 18757, 530, 1, 1, 0, 0, 375.806, 7332.96, 63.1065, 2.94961, 180, 0, 0, 1, 0, 0, 0),
(77096, 18757, 530, 1, 1, 0, 0, 340.453, 6833.1, 61.798, 3.01942, 180, 0, 0, 1, 0, 0, 0),
(78645, 21483, 530, 1, 1, 0, 0, -1570.01, 7993.8, -22.4505, 5.02655, 600, 0, 0, 104790, 0, 0, 0);
UPDATE `quest_template` SET `CompletedText` = 'Return to Chemist Fuely in Undercity.' WHERE `entry` = 4642;
DELETE FROM `creature_loot_template` WHERE `entry` = 6557 AND `item` = 12291;
DELETE FROM `creature` WHERE `guid` = 22149;
DELETE FROM `creature` WHERE `guid` = 22588;
DELETE FROM `creature` WHERE `guid` = 22987;
DELETE FROM `creature` WHERE `guid` = 23174;
DELETE FROM `creature` WHERE `guid` = 23180;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-50' WHERE `item`=12235;
DELETE FROM `creature` WHERE `id` = 9477;
DELETE FROM `creature` WHERE `guid` = 127171;
UPDATE `gossip_scripts` SET `datalong2`='2' WHERE `id`=8782;
REPLACE INTO gossip_menu (entry, text_id) VALUES (4821, 5874);
UPDATE `gossip_menu` SET `cond_1`='14', `cond_1_val_2`='128' WHERE `entry`=4821 AND `text_id`=5874;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(20518, 20518, 0, 1, 1, 1, 0, 0, 0),
(20518, 20526, 0, 1, 1, 1, 0, 0, 0),
(20518, 20527, 0, 1, 1, 1, 0, 0, 0),
(20518, 20528, 0, 1, 1, 1, 0, 0, 0),
(20531, 20531, 0, 1, 1, 1, 0, 0, 0),
(20531, 20532, 0, 1, 1, 1, 0, 0, 0),
(20531, 20533, 0, 1, 1, 1, 0, 0, 0),
(20531, 20535, 0, 1, 1, 1, 0, 0, 0),
(20540, 20540, 0, 1, 1, 1, 0, 0, 0),
(20540, 20542, 0, 1, 1, 1, 0, 0, 0),
(20540, 20543, 0, 1, 1, 1, 0, 0, 0),
(20540, 20544, 0, 1, 1, 1, 0, 0, 0);
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='1', `mincountOrRef`='-20518', `maxcount`='1' WHERE `entry`=20469 AND`item`=20518;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='1', `mincountOrRef`='-20531' WHERE `entry`=20469 AND`item`=20531;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='1', `mincountOrRef`='-20540' WHERE `entry`=20469 AND`item`=20540;
DELETE FROM `item_loot_template` WHERE `entry` = 20469 AND `item` = 20526;
DELETE FROM `item_loot_template` WHERE `entry` = 20469 AND `item` = 20527;
DELETE FROM `item_loot_template` WHERE `entry` = 20469 AND `item` = 20528;
DELETE FROM `item_loot_template` WHERE `entry` = 20469 AND `item` = 20532;
DELETE FROM `item_loot_template` WHERE `entry` = 20469 AND `item` = 20533;
DELETE FROM `item_loot_template` WHERE `entry` = 20469 AND `item` = 20535;
DELETE FROM `item_loot_template` WHERE `entry` = 20469 AND `item` = 20542;
DELETE FROM `item_loot_template` WHERE `entry` = 20469 AND `item` = 20543;
DELETE FROM `item_loot_template` WHERE `entry` = 20469 AND `item` = 20544;
DELETE FROM `item_loot_template` WHERE `entry` = 20469 AND `item` = 10305;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='40', `maxcount`='5' WHERE `item`=20404;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='20' WHERE `entry`=20469 AND `item`=27498;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1' WHERE `entry` = 20469 AND `item` = 20541;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1' WHERE `entry` = 20469 AND `item` = 20545;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1', `maxcount` = '3' WHERE `entry` = 20469 AND `item` = 20552;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1' WHERE `entry` = 20469 AND `item` = 20676;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1', `maxcount` = '3' WHERE `entry` = 20469 AND `item` = 20677;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1', `maxcount` = '3' WHERE `entry` = 20469 AND `item` = 20678;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1', `maxcount` = '3' WHERE `entry` = 20469 AND `item` = 20679;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=20469 AND`item`=20546;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=20469 AND`item`=20547;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=20469 AND`item`=20548;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=20469 AND`item`=20553;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=20469 AND`item`=20554;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=20469 AND`item`=20555;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=20469 AND`item`in (20518,20531,20540);
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='50' WHERE `entry`=20469 AND `item`=27498;

# Fix
DELETE FROM `creature` WHERE `id`=36841;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(127651, 36841, 658, 3, 1, 30350, 0, 924.946, -60.1648, 591.879, 2.23727, 86400, 0, 0, 81900, 0, 0),
(127652, 36841, 658, 3, 1, 30350, 0, 1062.15, -29.8507, 633.879, 4.43314, 86400, 0, 0, 81900, 0, 0),
(127653, 36841, 658, 3, 1, 30350, 0, 1073.6, -31.0122, 633.409, 4.60767, 86400, 0, 0, 81900, 0, 0),
(127654, 36841, 658, 3, 1, 30350, 0, 997.253, -139.257, 615.875, 2.72271, 86400, 0, 0, 81900, 0, 0),
(127655, 36841, 658, 3, 1, 30350, 0, 1049.77, -113.33, 629.814, 4.10152, 86400, 0, 0, 81900, 0, 0),
(127657, 36841, 658, 3, 1, 30350, 0, 930.109, -56.8899, 591.849, 2.35398, 86400, 0, 0, 81900, 0, 0),
(127658, 36841, 658, 3, 1, 30350, 0, 928.118, -43.5252, 590.876, 2.24204, 86400, 0, 0, 81900, 0, 0),
(127659, 36841, 658, 3, 1, 30350, 0, 1069.91, 100.042, 631.062, 4.86947, 86400, 0, 0, 81900, 0, 0),
(127661, 36841, 658, 3, 1, 30350, 0, 1000.4, -127.873, 616.247, 3.40339, 86400, 0, 0, 81900, 0, 0),
(127662, 36841, 658, 3, 1, 30350, 0, 1059.17, 95.9063, 630.781, 4.93928, 86400, 0, 0, 81900, 0, 0),
(127663, 36841, 658, 3, 1, 30350, 0, 1042.16, -104.3, 630.038, 3.89208, 86400, 0, 0, 81900, 0, 0);
DELETE FROM `creature` WHERE `id`=36877;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(127664, 36877, 658, 3, 1, 30363, 0, 1050, -69.6466, 633.079, 4.36332, 86400, 0, 0, 12600, 0, 0),
(127665, 36877, 658, 3, 1, 30363, 0, 1019.08, -121.824, 623.826, 3.7001, 86400, 0, 0, 12600, 0, 0),
(127666, 36877, 658, 3, 1, 30363, 0, 1069.39, -12.8058, 633.627, 4.53786, 86400, 0, 0, 12600, 0, 0),
(127667, 36877, 658, 3, 1, 30363, 0, 1069.37, -52.0087, 633.92, 4.5204, 86400, 0, 0, 12600, 0, 0),
(127668, 36877, 658, 3, 1, 30363, 0, 1068.93, -88.7526, 632.828, 4.2237, 86400, 0, 0, 12600, 0, 0),
(127669, 36877, 658, 3, 1, 30363, 0, 1043.91, -124.614, 627.748, 3.59538, 86400, 0, 0, 12600, 0, 0),
(127670, 36877, 658, 3, 1, 30363, 0, 1071.27, 38.0161, 629.829, 4.95674, 86400, 0, 0, 12600, 0, 0),
(127671, 36877, 658, 3, 1, 30363, 0, 1077.58, -14.7182, 632.726, 4.45059, 86400, 0, 0, 12600, 0, 0),
(127672, 36877, 658, 3, 1, 30363, 0, 1058.1, 92.9099, 630.413, 5.07441, 86400, 0, 0, 12600, 0, 0),
(127673, 36877, 658, 3, 1, 30363, 0, 1079.09, 34.3066, 629.8, 4.60767, 86400, 0, 0, 12600, 0, 0),
(127674, 36877, 658, 3, 1, 30363, 0, 1070.37, 96.1438, 631.075, 4.9102, 86400, 0, 0, 12600, 0, 0),
(127675, 36877, 658, 3, 1, 30363, 0, 1055.68, -52.7134, 633.511, 4.60767, 86400, 0, 0, 12600, 0, 0);
DELETE FROM `creature` WHERE `id`=37728;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(127676, 37728, 658, 3, 1, 30363, 0, 1071.24, 49.4809, 630.71, 1.90241, 86400, 0, 0, 20160, 44070, 0),
(127677, 37728, 658, 3, 1, 30363, 0, 1067, 48.1719, 630.606, 2.02458, 86400, 0, 0, 20160, 44070, 0);
DELETE FROM `creature_loot_template` WHERE `entry` = 23290 AND `item` = 32724;

# NeatElves
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='50' WHERE `entry`=23286 AND`item`=32724;
DELETE FROM `creature` WHERE `id` = 23290;
DELETE FROM `gossip_menu` WHERE `entry` = 646 AND `text_id` = 7016 AND `script_id` = 0;
UPDATE `gossip_menu` SET `cond_1`='7', `cond_1_val_1`='185', `cond_1_val_2`='200' WHERE `entry`=646 AND `text_id`=7017;
UPDATE `gossip_menu` SET `cond_1`='6', `cond_1_val_1`='67' WHERE `entry`=10043 AND `text_id`=14014;
UPDATE creature_template SET gossip_menu_id = 8234 WHERE entry = 19935;
REPLACE INTO gossip_menu (entry, text_id) VALUES (8234, 10324);
UPDATE `locales_gossip_menu_option` SET `box_text_loc8`=NULL WHERE `box_text_loc8`='';
DELETE FROM `gossip_menu` WHERE `entry` = 7985 AND `text_id` = 9837;
DELETE FROM `gossip_menu` WHERE `entry` = 7986 AND `text_id` = 9838;
DELETE FROM `gossip_menu` WHERE `entry` = 7987 AND `text_id` = 9839;
DELETE FROM `gossip_menu` WHERE `entry` = 7988 AND `text_id` = 9840;
DELETE FROM `gossip_menu` WHERE `entry` = 7989 AND `text_id` = 9841;
DELETE FROM `gossip_menu` WHERE `entry` = 7990 AND `text_id` = 9842;
DELETE FROM `gossip_menu` WHERE `entry` = 17885 AND `text_id` = 9121;
DELETE FROM `gossip_menu` WHERE `entry` = 17890 AND `text_id` = 9118;
DELETE FROM `gossip_menu` WHERE `entry` = 17893 AND `text_id` = 9119;
DELETE FROM `gossip_menu` WHERE `entry` = 30481 AND `text_id` = 13788;
UPDATE creature_template SET gossip_menu_id = 7521 WHERE entry = 17885;
REPLACE INTO gossip_menu (entry, text_id) VALUES (7521, 9121);
UPDATE creature_template SET gossip_menu_id = 7525 WHERE entry = 17827;
REPLACE INTO gossip_menu (entry, text_id) VALUES (7525, 9125);
UPDATE creature_template SET gossip_menu_id = 7519 WHERE entry = 17890;
REPLACE INTO gossip_menu (entry, text_id) VALUES (7519, 9118);
UPDATE creature_template SET gossip_menu_id = 7520 WHERE entry = 17893;
REPLACE INTO gossip_menu (entry, text_id) VALUES (7520, 9119);
UPDATE `gossip_menu_option` SET `menu_id`='7520' WHERE `menu_id`=17893;
UPDATE creature_template SET gossip_menu_id = 6802 WHERE entry = 15732;
REPLACE INTO gossip_menu (entry, text_id) VALUES (6802, 8125);
UPDATE creature_template SET gossip_menu_id = 9707 WHERE entry = 28016;
REPLACE INTO gossip_menu (entry, text_id) VALUES (9707, 13265);
UPDATE creature_template SET gossip_menu_id = 10932 WHERE entry = 36990;
REPLACE INTO gossip_menu (entry, text_id) VALUES (10932, 15191);
UPDATE creature_template SET gossip_menu_id = 10925 WHERE entry = 37581;
REPLACE INTO gossip_menu (entry, text_id) VALUES (10925, 15174);
UPDATE creature_template SET gossip_menu_id = 10224 WHERE entry = 24137;
REPLACE INTO gossip_menu (entry, text_id) VALUES (10224, 14215);
UPDATE creature_template SET gossip_menu_id = 6769 WHERE entry = 13433;
REPLACE INTO gossip_menu (entry, text_id) VALUES (6769, 6194);
UPDATE creature_template SET gossip_menu_id = 5181 WHERE entry = 13435;
UPDATE creature_template SET gossip_menu_id = 5181 WHERE entry = 13434;
REPLACE INTO gossip_menu (entry, text_id) VALUES (5181, 6194);
REPLACE INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(6769,0,1, 'I want to browse your goods.',3,128,0,0,0,0, ''),
(5181,0,1, 'I want to browse your goods.',3,128,0,0,0,0, '');
UPDATE creature_template SET gossip_menu_id = 9915 WHERE entry = 30481;
REPLACE INTO gossip_menu (entry, text_id) VALUES (9915, 13788);
UPDATE creature_template SET gossip_menu_id = 6795 WHERE entry = 15378;
REPLACE INTO gossip_menu (entry, text_id) VALUES (6795, 8113);
UPDATE creature_template SET gossip_menu_id = 6793 WHERE entry = 15380;
REPLACE INTO gossip_menu (entry, text_id) VALUES (6793, 8111);
UPDATE creature_template SET gossip_menu_id = 6644 WHERE entry = 15502;
REPLACE INTO gossip_menu (entry, text_id) VALUES (6644, 7899);
UPDATE creature_template SET gossip_menu_id = 6645 WHERE entry = 15503;
REPLACE INTO gossip_menu (entry, text_id) VALUES (6645, 7900);
UPDATE creature_template SET gossip_menu_id = 6655 WHERE entry = 15504;
REPLACE INTO gossip_menu (entry, text_id) VALUES (6655, 7911);
UPDATE `creature_template` SET `npcflag`='1' WHERE `entry`=20165;
UPDATE `creature_template` SET `gossip_menu_id`='0' WHERE `entry`=22938;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 54495;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 123730;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 9361;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 6123;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 9369;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 80216;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 53887;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 97740;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 747;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 131554;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 131555;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 131556;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 131557;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 131558;
UPDATE creature_template SET gossip_menu_id = 7811 WHERE entry = 16616;
UPDATE creature_template SET gossip_menu_id = 9286 WHERE entry = 25632;
REPLACE INTO gossip_menu (entry, text_id) VALUES (7959, 9780);
REPLACE INTO gossip_menu (entry, text_id) VALUES (9586, 13470);
REPLACE INTO gossip_menu (entry, text_id) VALUES (9834, 16638);
REPLACE INTO gossip_menu (entry, text_id) VALUES (11874, 16642);
REPLACE INTO gossip_menu (entry, text_id) VALUES (8638, 10835);
UPDATE `gossip_menu` SET `text_id`='2318' WHERE `entry`=1665 AND `text_id`=2317;
REPLACE INTO gossip_menu (entry, text_id) VALUES (1667, 2317);
UPDATE `gossip_menu_option`SET`action_menu_id`='1667' WHERE `menu_id`=1664 AND `id`=0;
UPDATE `gossip_menu_option`SET`menu_id`='1667', `action_menu_id`='1665' WHERE `menu_id`=1665 AND `id`=0;
DELETE FROM `gossip_menu` WHERE `entry` = 1666 AND `text_id` = 2318;
UPDATE `quest_template` SET `RequiredSkill`=0,`RequiredSkillValue`=0 WHERE `entry`=12517;
UPDATE `quest_template` SET `RequiredSkill`=0,`RequiredSkillValue`=0 WHERE `entry`=12518;
UPDATE `quest_template` SET `RequiredSkill`=0,`RequiredSkillValue`=0 WHERE `entry`=13311;
UPDATE `quest_template` SET `RequiredSkill`=0,`RequiredSkillValue`=0 WHERE `entry`=12798;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-30' WHERE `item`=11114;
REPLACE INTO pool_template VALUES (14153,10,'Dinosaur Bone');
REPLACE INTO pool_gameobject_template VALUES (161527,14153,0,'');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(283, 161527, 1, 1, 1, -7879.14, -896.516, -271.63, 1.41372, 0, 0, 0.649449, 0.760405, 180, 100, 1),
(989, 161527, 1, 1, 1, -7741.71, -742.488, -262.382, 2.23402, 0, 0, 0.898794, 0.438372, 180, 100, 1),
(2448, 161527, 1, 1, 1, -7752.41, -750.97, -266.476, -1.67552, 0, 0, -0.743146, 0.669129, 180, 100, 1),
(2611, 161527, 1, 1, 1, -7760.56, -843.386, -269.013, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1),
(2879, 161527, 1, 1, 1, -7824.72, -917.786, -267.953, 0.663225, 0, 0, 0.325568, 0.945519, 180, 100, 1),
(4795, 161527, 1, 1, 1, -7889.81, -618.472, -259.848, -0.471239, 0, 0, -0.233445, 0.97237, 180, 100, 1),
(6236, 161527, 1, 1, 1, -7884.15, -618.194, -260.14, -0.087267, 0, 0, -0.0436197, 0.999048, 180, 100, 1),
(9172, 161527, 1, 1, 1, -7513.46, -682.216, -254.202, 1.88496, 0, 0, 0.809018, 0.587783, 180, 100, 1),
(11300, 161527, 1, 1, 1, -7874.33, -621.346, -260.631, -1.18682, 0, 0, -0.559191, 0.829039, 180, 100, 1),
(14057, 161527, 1, 1, 1, -7847.43, -648.261, -260.871, 1.55334, 0, 0, 0.700908, 0.713252, 180, 100, 1),
(15557, 161527, 1, 1, 1, -7876.51, -614.429, -261.048, 0.087266, 0, 0, 0.0436192, 0.999048, 180, 100, 1),
(7326, 161527, 1, 1, 1, -7890.34, -610.22, -259.979, 1.55334, 0, 0, 0.700908, 0.713252, 180, 100, 1),
(7327, 161527, 1, 1, 1, -7780.08, -675.24, -258.412, 0.244346, 0, 0, 0.121869, 0.992546, 180, 100, 1),
(7332, 161527, 1, 1, 1, -7746.34, -612.641, -267.134, -1.55334, 0, 0, -0.700909, 0.713251, 180, 100, 1),
(7339, 161527, 1, 1, 1, -7632.41, -753.307, -262.798, 2.16421, 0, 0, 0.882948, 0.469471, 180, 100, 1),
(7340, 161527, 1, 1, 1, -7665.87, -633.516, -266.971, 2.93214, 0, 0, 0.994521, 0.104536, 180, 100, 1),
(7343, 161527, 1, 1, 1, -7758.49, -548.042, -263.93, 0.052359, 0, 0, 0.0261765, 0.999657, 180, 100, 1),
(7345, 161527, 1, 1, 1, -7712.33, -586.951, -269.257, 0.59341, 0, 0, 0.292371, 0.956305, 180, 100, 1),
(7348, 161527, 1, 1, 1, -7837.3, -784.114, -272.911, -1.09956, 0, 0, -0.522498, 0.85264, 180, 100, 1),
(7333, 161527, 1, 1, 1, -7573.92, -808.227, -266.537, 2.26892, 0, 0, 0.906306, 0.422622, 180, 100, 1);
UPDATE `gossip_menu_option` SET `cond_1`='9', `cond_1_val_1`='12536' WHERE `menu_id`=9674 AND `id`=0;

# FIX
UPDATE `quest_template` SET `RequiredRaces` = 0 WHERE `entry` = 1486;
UPDATE `creature_template` SET `gossip_menu_id` = 7525, `npcflag` = 1 WHERE `entry` = 20165;
UPDATE `creature_template` SET `gossip_menu_id` = 8310, `npcflag` = 1 WHERE `entry` = 21602;


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
DELETE FROM `creature_movement` WHERE `id` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `npc_gossip` WHERE `npc_guid` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `game_event_gameobject` WHERE `guid` NOT IN (SELECT `guid` FROM `gameobject`);
DELETE FROM `game_event_creature` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);
UPDATE creature_template SET unit_flags=unit_flags&~2048 WHERE unit_flags&2048=2048;
UPDATE creature_template SET unit_flags=unit_flags&~524288 WHERE unit_flags&524288=524288;
UPDATE creature_template SET unit_flags=unit_flags&~67108864 WHERE unit_flags&67108864=67108864;
UPDATE creature_template SET unit_flags=unit_flags&~8388608 WHERE unit_flags&8388608=8388608;
UPDATE `creature`, `creature_template` SET `creature`.`curhealth`=`creature_template`.`minhealth`,`creature`.`curmana`=`creature_template`.`minmana` WHERE `creature`.`id`=`creature_template`.`entry` and `creature_template`.`RegenHealth` = '1';
UPDATE `creature` SET `MovementType` = 0 WHERE `spawndist` = 0 AND `MovementType`=1;
UPDATE `creature` SET `spawndist`=0 WHERE `MovementType`=0;
UPDATE `creature` SET `spawntimesecs` = 300 WHERE `spawntimesecs` = 25;
UPDATE `gameobject` SET `spawntimesecs` = 300 WHERE `spawntimesecs` = 25;
UPDATE `creature_template` SET `scale` = 1 WHERE `scale` = 0;
UPDATE `creature` SET `spawndist` = 0, `MovementType` = 2 WHERE guid in (select distinct(id) from creature_movement);
UPDATE `creature` SET `spawndist` = 0, `MovementType` = 2 WHERE id in (select distinct(entry) from creature_movement_template);
UPDATE `creature` LEFT JOIN (`creature_movement`) ON (`creature_movement`.`id`=`creature`.`guid`) LEFT JOIN (`creature_movement_template`) ON (`creature_movement_template`.`entry`=`creature`.`id`) SET `creature`.`spawndist`=5, `creature`.`MovementType`=1 WHERE `creature`.`MovementType`=2 AND (`creature_movement`.`id` IS NULL AND `creature_movement_template`.`entry` IS NULL);
# UPDATE `creature` SET `spawndist` = 5, `MovementType` = 1 WHERE MovementType=2 and guid not in (select distinct(id) from creature_movement);
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 0;
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 3;
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 10;
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 25;
UPDATE `gameobject` SET `state`=1 WHERE `state`=0 AND `id` IN (SELECT entry FROM `gameobject_template` WHERE `type`=3);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (SELECT `id` FROM `creature_questrelation`);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (SELECT `id` FROM `creature_involvedrelation`);
UPDATE `gameobject` SET `state` = 0 WHERE `id` IN (SELECT `entry` FROM `gameobject_template` WHERE `type` = 0 AND `data0` = 1);
UPDATE `gameobject_template` SET `flags`=`flags`&~4 WHERE `type` IN (2,19,17);
DELETE FROM `gameobject_scripts` WHERE `id` NOT IN (SELECT `guid` FROM `gameobject`);
DELETE FROM `gameobject_scripts` WHERE `command` in (11, 12) and `datalong` NOT IN (SELECT `guid` FROM `gameobject`);
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` NOT IN (SELECT `entry` FROM `creature_template`);
UPDATE creature_addon SET moveflags=moveflags &~ 0x00000100;
# UPDATE creature_addon SET moveflags=moveflags &~ 0x00000800;
UPDATE creature_addon SET moveflags=moveflags &~ 0x00200000;
UPDATE creature_addon SET moveflags=moveflags &~ 0x08000000;
UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00000100;
# UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00000800;
UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00200000;
UPDATE creature_template_addon SET moveflags=moveflags &~ 0x08000000;
UPDATE `item_template` SET `spelltrigger_2` = 0 WHERE `spellid_2` = 0 AND `spelltrigger_2` = 6;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `AIName` = 'EventAI' AND `ScriptName` = 'generic_creature';
UPDATE `creature_template` SET npcflag = npcflag|1 WHERE `gossip_menu_id` > 0;
UPDATE quest_template SET SpecialFlags=SpecialFlags|1 WHERE SpecialFlags=4;

UPDATE db_version SET `cache_id`= '614';
UPDATE db_version SET `version`= 'YTDB_0.14.4_R614_MaNGOS_R11878_SD2_R2403_ACID_R309b_RuDB_R45';
