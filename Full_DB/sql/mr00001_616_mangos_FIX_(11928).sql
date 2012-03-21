# Y2kCat
ALTER TABLE db_version_ytdb CHANGE COLUMN 615_FIX_11921 616_FIX_11928 bit;
REPLACE INTO `db_version_ytdb` (`version`) VALUES ('616_FIX_11928');

# Fix
DELETE FROM `creature` WHERE `id`=30210;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`) VALUES
(130805,30210,571,1,1,0,0,7390.14,-2725.38,874.256,2.90103,300,0,0,42,0);
UPDATE `game_event` SET `start_time` = '2012-11-20 04:00:00' WHERE `entry` = 41;

# NeatElves
delete from creature_linking_template where entry in (36565, 36272);
insert into creature_linking_template values (36565, 33, 36296, 140),(36272, 33, 36296, 140);
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(7406, 180874, 1, 1, 1, 7531.66, -2851.23, 458.917, 0, 0, 0, 0, 0, 180, 0, 0),
(7409, 180874, 1, 1, 1, 7561.15, -2872.45, 461.1, 0, 0, 0, 0, 0, 180, 0, 0);
REPLACE INTO `game_event_gameobject` (`event`,`guid`) VALUES (7,7406),(7,7409);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (9153,12384),(9159,12395),(9173,12441);
UPDATE `creature_template` SET `gossip_menu_id`=9153 WHERE `entry`=25336;
UPDATE `creature_template` SET `gossip_menu_id`=9159 WHERE `entry`=25376;
UPDATE `creature_template` SET `gossip_menu_id`=9173 WHERE `entry`=25604;
DELETE FROM `gossip_scripts` WHERE `id` = 2908;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (2908, 0, 7, 4941, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE `creature_template_addon` SET `auras`='10848' WHERE `entry`=9299;
UPDATE `creature_template_addon` SET `auras`='10848' WHERE `entry`=8888;
DELETE FROM `creature_addon` WHERE `guid` = 73953;
DELETE FROM `creature_addon` WHERE `guid` = 57125;
DELETE FROM `creature_addon` WHERE `guid` = 57873;
DELETE FROM `creature_addon` WHERE `guid` = 83785;
DELETE FROM `creature_addon` WHERE `guid` = 83821;
DELETE FROM `creature_addon` WHERE `guid` = 83801;
UPDATE `creature_template` SET `npcflag`='0' WHERE `entry`=19827;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry`=17712;
UPDATE `creature_template` SET `flags_extra`='256' WHERE `entry`=17060;
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('10988', '0', '0', '1', '0', '0', '0', '10848');
DELETE FROM creature WHERE guid=23557;
DELETE FROM creature WHERE guid=23479;
DELETE FROM creature WHERE guid=23156;
#
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry` in (16977,16978,21058,22025,16905,16904,16906,21386,21385,21384,21450,20409,20410,20411,20415,20495,20934,19937,19881,19827,19826,19825,19546,19545,19544,19543,19873,19872,17712,17674,18872,18873);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7996,9848),(7995,9847),(8126,10064);
UPDATE `creature_template` SET `gossip_menu_id`=7996 WHERE `entry`=19488;
UPDATE `creature_template` SET `gossip_menu_id`=7995 WHERE `entry`=19489;
UPDATE `creature_template` SET `gossip_menu_id`=8126 WHERE `entry`=20463;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(8126, 0, 1, 'I want to browse your goods.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES ('10212', '9902', '0', '4', '4637', '1', '0', '0', '0');
INSERT IGNORE INTO `spell_script_target` VALUES (45976, 1, 25770), (46177, 1, 25770),(46208, 1, 25741),(46178, 1, 25741);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8566,10735);
UPDATE `creature_template` SET `gossip_menu_id`=8566 WHERE `entry`=22832;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10437,6961);
UPDATE `creature_template` SET `gossip_menu_id`=10437 WHERE `entry`=18911;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES (10437, 1, 1, 'I want to browse your goods.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),(10437, 0, 3, 'Train me.', 5, 16, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `gossip_menu_option` SET `cond_1` = '5', `cond_1_val_1` = '942', `cond_1_val_2` = '4', `cond_2` = '0', `cond_2_val_1` = '0', `cond_2_val_2` = '0' WHERE `menu_id` = 7560 AND `id` = 0;
UPDATE `gossip_menu_option` SET `cond_1` = '5', `cond_1_val_1` = '942', `cond_1_val_2` = '5', `cond_2` = '0', `cond_2_val_1` = '0', `cond_2_val_2` = '0' WHERE `menu_id` = 7560 AND `id` = 1;
UPDATE `gossip_menu_option` SET `cond_1` = '5', `cond_1_val_1` = '942', `cond_1_val_2` = '6', `cond_2` = '0', `cond_2_val_1` = '0', `cond_2_val_2` = '0' WHERE `menu_id` = 7560 AND `id` = 2;
UPDATE `gossip_menu_option` SET `cond_1` = '5', `cond_1_val_1` = '942', `cond_1_val_2` = '7', `cond_2` = '0', `cond_2_val_1` = '0', `cond_2_val_2` = '0' WHERE `menu_id` = 7560 AND `id` = 3;
UPDATE `gossip_menu_option` SET `cond_1` = '5', `cond_1_val_1` = '942', `cond_1_val_2` = '4', `cond_2` = '0', `cond_2_val_1` = '0', `cond_2_val_2` = '0' WHERE `menu_id` = 7559 AND `id` = 0;
UPDATE `gossip_menu_option` SET `cond_1` = '5', `cond_1_val_1` = '942', `cond_1_val_2` = '5', `cond_2` = '0', `cond_2_val_1` = '0', `cond_2_val_2` = '0' WHERE `menu_id` = 7559 AND `id` = 1;
UPDATE `gossip_menu_option` SET `cond_1` = '5', `cond_1_val_1` = '942', `cond_1_val_2` = '6', `cond_2` = '0', `cond_2_val_1` = '0', `cond_2_val_2` = '0' WHERE `menu_id` = 7559 AND `id` = 2;
UPDATE `gossip_menu_option` SET `cond_1` = '5', `cond_1_val_1` = '942', `cond_1_val_2` = '7', `cond_2` = '0', `cond_2_val_1` = '0', `cond_2_val_2` = '0' WHERE `menu_id` = 7559 AND `id` = 3;
UPDATE `creature_template` SET `ScriptName`='' WHERE `entry` in (18581,18564);
DELETE FROM `npc_text` WHERE `ID`=13481;
INSERT INTO `npc_text` (`ID`,`text0_0`,`text0_1`,`lang0`,`prob0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`text1_0`,`text1_1`,`lang1`,`prob1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`text2_0`,`text2_1`,`lang2`,`prob2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`text3_0`,`text3_1`,`lang3`,`prob3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`text4_0`,`text4_1`,`lang4`,`prob4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`text5_0`,`text5_1`,`lang5`,`prob5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`text6_0`,`text6_1`,`lang6`,`prob6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`text7_0`,`text7_1`,`lang7`,`prob7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`) VALUES
(13481,'','I''ll never forget what you did for Thassarian.  I will always be in your debt.',0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0);
UPDATE creature_template SET gossip_menu_id = 9501 WHERE entry = 27350;
UPDATE gossip_menu SET entry = 9501 WHERE entry = 27350;
UPDATE gossip_menu_option SET menu_id = 9501 WHERE menu_id = 27350;
UPDATE locales_gossip_menu_option SET menu_id = 9501 WHERE menu_id = 27350;
UPDATE creature_template SET gossip_menu_id = 9507 WHERE entry = 27376;
UPDATE gossip_menu SET entry = 9507 WHERE entry = 27376;
UPDATE gossip_menu_option SET menu_id = 9507 WHERE menu_id = 27376;
UPDATE locales_gossip_menu_option SET menu_id = 9507 WHERE menu_id = 27376;
UPDATE creature_template SET gossip_menu_id = 9508 WHERE entry = 27378;
UPDATE gossip_menu SET entry = 9508 WHERE entry = 27378;
UPDATE gossip_menu_option SET menu_id = 9508 WHERE menu_id = 27378;
UPDATE locales_gossip_menu_option SET menu_id = 9508 WHERE menu_id = 27378;
UPDATE creature_template SET gossip_menu_id = 9509 WHERE entry = 27379;
UPDATE gossip_menu SET entry = 9509 WHERE entry = 27379;
UPDATE gossip_menu_option SET menu_id = 9509 WHERE menu_id = 27379;
UPDATE locales_gossip_menu_option SET menu_id = 9509 WHERE menu_id = 27379;
UPDATE creature_template SET gossip_menu_id = 9510 WHERE entry = 27381;
UPDATE gossip_menu SET entry = 9510 WHERE entry = 27381;
UPDATE gossip_menu_option SET menu_id = 9510 WHERE menu_id = 27381;
UPDATE locales_gossip_menu_option SET menu_id = 9510 WHERE menu_id = 27381;
UPDATE creature_template SET gossip_menu_id = 1914 WHERE entry = 9299;
REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES ('1914', '2567');
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='3909' WHERE `entry`=1914 AND `text_id`=2568;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1697851;
DELETE FROM `creature_ai_scripts` WHERE `id` = 888851;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1098851;
DELETE FROM `creature_ai_scripts` WHERE `id` = 929951;
UPDATE creature_template SET AIName='' WHERE entry in (8888,9299,10988);
UPDATE creature_template SET gossip_menu_id = 7083 WHERE entry = 16014;
REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES ('7083', '8335');
UPDATE `gossip_menu` SET `cond_1`='4', `cond_1_val_1`='490' WHERE `entry`=7956 AND`text_id`=9774;
REPLACE INTO `gossip_menu` (`entry`, `text_id`) VALUES ('7956', '15532');
UPDATE `creature_template` SET `mingold`='0', `maxgold`='0' WHERE `entry`=9460;
UPDATE gameobject SET spawntimesecs=604800 WHERE guid IN (49739,49740);
UPDATE `gossip_menu_option` SET `id`='0', `option_text`='Why would I want to ride a shredder?' WHERE `menu_id`=9590 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=9590 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0', `option_text`='Why would I want to ride a shredder?' WHERE `menu_id`=9550 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=9550 AND `id`=1;
UPDATE `gossip_menu_option` SET `option_text`='Where can I get a Refurbished Shredder Key?' WHERE `menu_id`=9592 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Where can I get a Refurbished Shredder Key?' WHERE `menu_id`=9555 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='I wish to travel to Light''s Breach.' WHERE `menu_id`=9784 AND `id`=1;
UPDATE `gossip_menu_option` SET `option_text`='I wish to travel to Light''s Breach.' WHERE `menu_id`=9785 AND `id`=1;
UPDATE `gossip_menu_option` SET `cond_1_val_2`='2' WHERE `menu_id`=9784 AND `id`=1;
UPDATE `gossip_menu_option` SET `cond_1_val_2`='2' WHERE `menu_id`=9785 AND `id`=1;
UPDATE `gossip_menu_option` SET `cond_1_val_2`='2' WHERE `menu_id`=9143 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_1_val_2`='2' WHERE `menu_id`=9143 AND `id`=1;
UPDATE `gossip_menu_option` SET `cond_1_val_2`='2', `cond_2_val_2`='2' WHERE `menu_id`=9143 AND `id`=2;
UPDATE `gossip_menu_option` SET `action_script_id`='9143' WHERE `menu_id`=9143 AND `id`=0;
UPDATE `gossip_menu_option` SET `action_script_id`='9143' WHERE `menu_id`=9143 AND `id`=1;
UPDATE `gossip_menu_option` SET `action_script_id`='9143' WHERE `menu_id`=9143 AND `id`=2;
UPDATE `gossip_scripts` SET `id`='9143' WHERE `id`=50119;
UPDATE `quest_template` SET `SrcSpell`='0' WHERE `entry` in (12794,12791);
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(3803551, 38035, 8, 0, 100, 0, 71599, -1, 0, 0, 33, 38035, 6, 0, 41, 10000, 0, 0, 11, 71597, 0, 0, 'ytdb');
UPDATE `gossip_menu` SET `text_id`='7693' WHERE `entry`=8453 AND `text_id`=7694;
UPDATE creature_template SET gossip_menu_id = 8263 WHERE entry in (20271);
UPDATE gossip_menu SET entry = 8263 WHERE entry = 9711;
UPDATE gossip_menu_option SET menu_id = 8263 WHERE menu_id = 9711;
UPDATE locales_gossip_menu_option SET menu_id = 8263 WHERE menu_id = 9711;
UPDATE `gossip_menu` SET `text_id`='10285' WHERE `entry`=8263 AND `text_id`=7694;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(8268, 10292, 0, 14, 0, 128, 0, 0, 0);
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=8268 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=8268 AND `id`=1;
UPDATE `gossip_menu` SET `text_id`='7684' WHERE `entry`=50332 AND `text_id`=10269;
DELETE FROM `game_event_creature` WHERE `guid` = 123533;
DELETE FROM `game_event_creature` WHERE `guid` = 123534;
DELETE FROM `game_event_creature` WHERE `guid` = 123535;
DELETE FROM `game_event_creature` WHERE `guid` = 123536;
DELETE FROM `game_event_creature` WHERE `guid` = 123541;
DELETE FROM `game_event_creature` WHERE `guid` = 123542;
DELETE FROM `game_event_creature` WHERE `guid` = 123543;
DELETE FROM `game_event_creature` WHERE `guid` = 123544;
DELETE FROM `game_event_creature` WHERE `guid` = 123546;
DELETE FROM `game_event_creature` WHERE `guid` = 123547;
DELETE FROM `game_event_creature` WHERE `guid` = 126904;
DELETE FROM `game_event_creature` WHERE `guid` = 123734;
DELETE FROM `game_event_creature` WHERE `guid` = 17009;
DELETE FROM `game_event_creature` WHERE `guid` = 75261;
#
DELETE FROM `creature` WHERE `guid` = 123533;
DELETE FROM `creature` WHERE `guid` = 123534;
DELETE FROM `creature` WHERE `guid` = 123535;
DELETE FROM `creature` WHERE `guid` = 123536;
DELETE FROM `creature` WHERE `guid` = 123541;
DELETE FROM `creature` WHERE `guid` = 123542;
DELETE FROM `creature` WHERE `guid` = 123543;
DELETE FROM `creature` WHERE `guid` = 123544;
DELETE FROM `creature` WHERE `guid` = 123546;
DELETE FROM `creature` WHERE `guid` = 123547;
DELETE FROM `creature` WHERE `guid` = 126904;
DELETE FROM `creature` WHERE `guid` = 123734;
DELETE FROM `creature` WHERE `guid` = 17009;
DELETE FROM `creature` WHERE `guid` = 75261;
DELETE FROM `creature_movement` WHERE `id` = 75261;
UPDATE `creature_template` SET `gossip_menu_id`='10990' WHERE `entry`=38065;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES (10990, 15280, 0, 0, 0, 0, 0, 0, 0);
#
DELETE FROM `creature` WHERE `guid` = 123735;
UPDATE `creature_template` SET `lootid`='0' WHERE `entry`=11142;
DELETE FROM `creature_loot_template` WHERE `entry` = 11142;
DELETE FROM `creature` WHERE `guid` = 47969;
DELETE FROM `creature` WHERE `guid` = 48015;
DELETE FROM `creature` WHERE `guid` = 48039;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1' WHERE `entry` = 11082 AND `item` in (13302,13303,13304,13305,13306,13307);
#
DELETE FROM `gameobject_scripts` WHERE `id` = 71535;
DELETE FROM `gameobject_scripts` WHERE `id` = 71536;
DELETE FROM `gameobject_scripts` WHERE `id` = 71539;
DELETE FROM `gameobject_scripts` WHERE `id` = 71537;
DELETE FROM `gameobject_scripts` WHERE `id` = 71540;
DELETE FROM `gameobject_scripts` WHERE `id` = 71538;
DELETE FROM `creature_questrelation` WHERE `quest` in (8900,8901,8902,8983,9025,9026,9027,9028,8980,8982,8984,11558,8897,8898,8899);
DELETE FROM `creature_involvedrelation` WHERE `quest` in (8900,8901,8902,9024,9025,9026,9027,9028,8979,8980,8982,8983,8984,11558,8897,8898,8899);
DELETE FROM `game_event_quest` WHERE `quest` IN (9024,9025,9026,9027,9028,8979,8980,8982,8983,8984,11558,9029,24661);
DELETE FROM `creature_loot_template` WHERE `item` = 35234;
UPDATE `creature_template` SET `lootid`='0' WHERE `entry` in (25881,25802);
DELETE FROM `gameobject` WHERE `guid` = 44624;
UPDATE `gossip_menu` SET `cond_2`='11', `cond_2_val_1`='24748' WHERE `entry`=6542 AND `text_id`=7772;
UPDATE `gossip_menu` SET `cond_2`='1', `cond_2_val_1`='24746' WHERE `entry`=6542 AND `text_id`=7773;
UPDATE `gossip_menu` SET `cond_1`='11', `cond_1_val_1`='24746' WHERE `entry`=6543 AND `text_id`=7754;
UPDATE `gossip_menu` SET `cond_1`='11', `cond_1_val_1`='24746' WHERE `entry`=6542 AND `text_id`=7749;
UPDATE `gossip_menu` SET `cond_1`='11', `cond_1_val_1`='24746' WHERE `entry`=6540 AND `text_id`=7744;
REPLACE INTO gossip_menu_option (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(6540, 0, 0, 'I am no cultist, you monster! Come to me and face your destruction!', 1, 1, -1, 0, 7, 0, 0, '', 1, 24746, 0, 0, 0, 0, 0, 0, 0),
(6540, 1, 0, 'Crimson Templar! I hold your signet! Heed my call!', 1, 1, -1, 0, 8, 0, 0, '', 1, 24746, 0, 2, 20416, 1, 0, 0, 0),
(6540, 2, 0, 'Earthen Templar! I hold your signet! Heed my call!', 1, 1, -1, 0, 9, 0, 0, '', 1, 24746, 0, 2, 20419, 1, 0, 0, 0),
(6540, 3, 0, 'Hoary Templar! I hold your signet! Heed my call!', 1, 1, -1, 0, 10, 0, 0, '', 1, 24746, 0, 2, 20418, 1, 0, 0, 0),
(6540, 4, 0, 'Azure Templar! I hold your signet! Heed my call!', 1, 1, -1, 0, 11, 0, 0, '', 1, 24746, 0, 2, 20420, 1, 0, 0, 0),
(6542, 0, 0, 'You will listen to this, vile duke! I am not your Twilight\'s Hammer lapdog! I am here to challenge you! Come! Come, and meet your death...', 1, 1, -1, 0, 28, 0, 0, '', 1, 24746, 0, 1, 24748, 0, 0, 0, 0),
(6542, 1, 0, 'Duke of Cynders! I hold your signet! Heed my call', 1, 1, -1, 0, 29, 0, 0, '', 1, 24746, 0, 1, 24748, 0, 2, 20432, 1),
(6542, 2, 0, 'The Duke of Shards! I hold your signet! Heed my call!', 1, 1, -1, 0, 30, 0, 0, '', 1, 24746, 0, 1, 24748, 0, 2, 20435, 1),
(6542, 3, 0, 'The Duke of Zephyrs! I hold your signet! Heed my call!', 1, 1, -1, 0, 31, 0, 0, '', 1, 24746, 0, 1, 24748, 0, 2, 20433, 1),
(6542, 4, 0, 'The Duke of Fathoms! I hold your signet! Heed my call!', 1, 1, -1, 0, 32, 0, 0, '', 1, 24746, 0, 1, 24748, 0, 2, 20436, 1);
DELETE FROM `gossip_scripts` WHERE `id` in (7,8,9,10,11,28,29,30,31,32);
INSERT INTO gossip_scripts (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(7, 0, 15, 24745, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'less wind stone - random'),
(8, 0, 15, 24747, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'less wind stone - fire'),
(9, 0, 15, 24759, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'less wind stone - earth'),
(10, 0, 15, 24757, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'less wind stone - air'),
(11, 0, 15, 24761, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'less wind stone - water'),
(28, 0, 15, 24762, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'wind stone - random'),
(29, 0, 15, 24766, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'wind stone - fire'),
(30, 0, 15, 24771, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'wind stone - earth'),
(31, 0, 15, 24769, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'wind stone - air'),
(32, 0, 15, 24773, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'wind stone - water');
UPDATE creature_template SET gossip_menu_id = 6484 WHERE entry in (15106);
UPDATE gossip_menu SET entry = 6484 WHERE entry = 50332;
UPDATE gossip_menu_option SET menu_id = 6484 WHERE menu_id = 50332;
UPDATE locales_gossip_menu_option SET menu_id = 6484 WHERE menu_id = 50332;
UPDATE creature_template SET gossip_menu_id = 8260 WHERE entry in (20276);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES (8260, 7683, 0, 0, 0, 0, 0, 0, 0),(8260, 10282, 0, 15, 51, 1, 0, 0, 0);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES (8260, 0, 9, 'I would like to go to the battleground.', 12, 1048576, 0, 0, 0, 0, 0, NULL, 15, 51, 1, 0, 0, 0, 0, 0, 0);
UPDATE creature_template SET gossip_menu_id = 6794 WHERE entry in (15379);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES (6794, 8112, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `gossip_menu` WHERE `entry` in (2186,2187);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES (2187, 2820, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(2187, 0, 0, 'Transcript the Tablet', 1, 1, -1, 0, 2187, 0, 0, NULL, 9, 4296, 0, 24, 11470, 1, 0, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id` in (2187);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(2187, 0, 15, 15065, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Create Tablet Transcript');
UPDATE `quest_template` SET `StartScript`='0' WHERE `entry`=994;
DELETE FROM `quest_start_scripts` WHERE `id` = 994;
DELETE FROM `creature_questrelation` WHERE `quest` in (12062,12318,11117,11118,11120,11127,11431,11437,11438,11444,11445,13649);
DELETE FROM `creature_involvedrelation` WHERE `quest` in (12062,12318,11117,11118,11120,11127,11431,11437,11438,11444,11445,13649);
DELETE FROM `game_event_quest` WHERE `quest` IN (12062,12318,11117,11118,11120,11127,11431,11437,11438,11444,11445,13649);
DELETE FROM `creature_loot_template` WHERE `entry` = 36296 AND `item` = 49715;
DELETE FROM `creature_loot_template` WHERE `entry` = 36296 AND `item` = 50250;
DELETE FROM `creature_loot_template` WHERE `entry` = 36296 AND `item` = 50446;
DELETE FROM `creature_loot_template` WHERE `entry` = 36296 AND `item` = 50471;
DELETE FROM `creature_loot_template` WHERE `entry` = 36296 AND `item` = 50741;
UPDATE `item_loot_template` SET `mincountOrRef`='2' WHERE `entry`=54535 AND `item`=49426;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='30', `groupid`='0' WHERE `entry`=54537 AND `item`=49715;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='1' WHERE `entry`=54537 AND `item`=50250;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='30', `groupid`='0' WHERE `entry`=54537 AND `item`=50446;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='5', `groupid`='0' WHERE `entry`=54537 AND `item`=50471;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='30', `groupid`='0' WHERE `entry`=54537 AND `item`=50741;
REPLACE INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('54537', '49426', '100', '0', '2', '2', '0', '0', '0');
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=54536 AND `item`=53641;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='15' WHERE `entry`=54536 AND `item`=54806;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=187892 AND `item`=35723;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='10' WHERE `entry`=187892 AND `item`=35498;
UPDATE `gameobject_template` SET `data1`='187892' WHERE `entry`=188124;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '25', `groupid` = '0' WHERE `entry` = 54516 AND `item` = 33154;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '10', `groupid` = '0' WHERE `entry` = 54516 AND `item` = 33176;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '30', `groupid` = '0' WHERE `entry` = 54516 AND `item` = 33292;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '1', `groupid` = '0' WHERE `entry` = 54516 AND `item` = 37012;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '5', `groupid` = '0' WHERE `entry` = 54516 AND `item` = 49126;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '5', `groupid` = '0' WHERE `entry` = 54516 AND `item` = 49128;
UPDATE `item_loot_template` SET `item`='37011' WHERE `entry`=54516 AND `item`=33176;
DELETE FROM `creature_loot_template` WHERE `entry` = 23682 AND `item` = 34073;
DELETE FROM `creature_loot_template` WHERE `entry` = 23682 AND `item` = 34074;
DELETE FROM `creature_loot_template` WHERE `entry` = 23682 AND `item` = 34075;
DELETE FROM `creature_loot_template` WHERE `entry` = 23682 AND `item` = 49126;
DELETE FROM `creature_loot_template` WHERE `entry` = 23682 AND `item` = 49128;
DELETE FROM `creature_loot_template` WHERE `entry` = 23682 AND `item` = 33154;
DELETE FROM `creature_loot_template` WHERE `entry` = 23682 AND `item` = 33292;
DELETE FROM `creature_loot_template` WHERE `entry` = 23682 AND `item` = 37011;
DELETE FROM `creature_loot_template` WHERE `entry` = 23682 AND `item` = 37012;
DELETE FROM `creature_loot_template` WHERE `entry` = 23682 AND `item` = 24658;
DELETE FROM `creature_loot_template` WHERE `entry` = 23682 AND `item` = 33808;
DELETE FROM `creature_loot_template` WHERE `entry` = 23682 AND `item` = 38175;
DELETE FROM `creature_loot_template` WHERE `entry` = 23682 AND `item` = 39896;
DELETE FROM `creature_loot_template` WHERE `entry` = 15043 AND `item` = 39896;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='40', `mincountOrRef`='3' WHERE `entry`=23682 AND `item`=34068;
UPDATE `quest_template` SET `CompleteScript`='0' WHERE `entry`=14488;
DELETE FROM `quest_end_scripts` WHERE `id` = 14488;
delete from creature_linking_template where entry in (17911,17912,17913,17914);
insert into creature_linking_template values (17911, 329, 17910, 143),(17912, 329, 17910, 143),(17913, 329, 17910, 143),(17914, 329, 17910, 143);
DELETE FROM `event_scripts` WHERE `id` = 11206 AND `delay` = 5 AND `command` = 10 AND `datalong` = 17910;
DELETE FROM `event_scripts` WHERE `id` = 11206 AND `delay` = 5 AND `command` = 10 AND `datalong` = 17911;
DELETE FROM `event_scripts` WHERE `id` = 11206 AND `delay` = 5 AND `command` = 10 AND `datalong` = 17912;
DELETE FROM `event_scripts` WHERE `id` = 11206 AND `delay` = 5 AND `command` = 10 AND `datalong` = 17913;
DELETE FROM `event_scripts` WHERE `id` = 11206 AND `delay` = 5 AND `command` = 10 AND `datalong` = 17914;
DELETE FROM `event_scripts` WHERE `id` = 11206 AND `delay` = 20 AND `command` = 8 AND `datalong` = 17915;
REPLACE INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(11206, 0, 10, 17913, 3000000, 0, 0, 0, 0, 0, 0, 0, 3668.67, -3615.04, 137.77, 4.54, ''),
(11206, 2, 10, 17911, 3000000, 0, 0, 0, 0, 0, 0, 0, 3664.94, -3614.78, 137.49, 5.08, ''),
(11206, 4, 10, 17910, 3000000, 0, 0, 0, 0, 0, 0, 0, 3661.42, -3616.55, 137.46, 5.35, ''),
(11206, 6, 10, 17914, 3000000, 0, 0, 0, 0, 0, 0, 0, 3657.86, -3618.3, 137.4, 5.7, ''),
(11206, 8, 10, 17912, 3000000, 0, 0, 0, 0, 0, 0, 0, 3657.63, -3621.24, 137.74, 5.97, '');
UPDATE `creature_template` SET `faction_A`='35', `faction_H`='35', `flags_extra`='0' WHERE `entry`=10917;
insert ignore into event_scripts (id, delay, command, datalong, datalong2, datalong3, data_flags, comments) values (11206,1,22,14,10917,10,1,''),(11206,1,26,0,10917,10,2,'');
INSERT IGNORE INTO `achievement_criteria_requirement` (`criteria_id`,`type`,`value1`,`value2`) VALUES (13013, 12, 1, 0),(13012, 12, 1, 0);
UPDATE `gossip_menu_option` SET `cond_2`='1', `cond_2_val_1`='63034' WHERE `menu_id`=10398 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_2`='1', `cond_2_val_1`='63034' WHERE `menu_id`=10398 AND `id`=1;
UPDATE `gossip_menu_option` SET `cond_2`='1', `cond_2_val_1`='63034' WHERE `menu_id`=10398 AND `id`=2;
UPDATE `gossip_menu_option` SET `cond_2`='1', `cond_2_val_1`='63034' WHERE `menu_id`=10398 AND `id`=3;
UPDATE `gossip_menu_option` SET `cond_2`='1', `cond_2_val_1`='63034' WHERE `menu_id`=10400 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_2`='1', `cond_2_val_1`='63034' WHERE `menu_id`=10400 AND `id`=1;
UPDATE `gossip_menu_option` SET `cond_2`='1', `cond_2_val_1`='63034' WHERE `menu_id`=10400 AND `id`=2;
UPDATE `gossip_menu_option` SET `cond_2`='1', `cond_2_val_1`='63034' WHERE `menu_id`=10400 AND `id`=3;
UPDATE `gossip_menu_option` SET `cond_2`='1', `cond_2_val_1`='63034' WHERE `menu_id`=10402 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_2`='1', `cond_2_val_1`='63034' WHERE `menu_id`=10402 AND `id`=1;
UPDATE `gossip_menu_option` SET `cond_2`='1', `cond_2_val_1`='63034' WHERE `menu_id`=10402 AND `id`=2;
UPDATE `gossip_menu_option` SET `cond_2`='1', `cond_2_val_1`='63034' WHERE `menu_id`=10402 AND `id`=3;
UPDATE `gossip_menu_option` SET `action_menu_id`='10397' WHERE `menu_id`=10398 AND `id`=1;
UPDATE `gossip_menu_option` SET `action_menu_id`='10397' WHERE `menu_id`=10398 AND `id`=3;
UPDATE `gossip_menu` SET `entry`='10397' WHERE `entry`=50031;
UPDATE `gossip_menu_option` SET `action_menu_id`='10399' WHERE `menu_id`=10400 AND `id`=1;
UPDATE `gossip_menu_option` SET `action_menu_id`='10399' WHERE `menu_id`=10400 AND `id`=3;
UPDATE `gossip_menu` SET `entry`='10399' WHERE `entry`=50030;
UPDATE `gossip_menu_option` SET `action_menu_id`='10401' WHERE `menu_id`=10402 AND `id`=1;
UPDATE `gossip_menu_option` SET `action_menu_id`='10401' WHERE `menu_id`=10402 AND `id`=3;
UPDATE `gossip_menu` SET `entry`='10401' WHERE `entry`=50029;
REPLACE INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES (11091,0,0, 'I''m ready.',1,1,0,0,0,0, '');
UPDATE `creature_template` SET `gossip_menu_id`=9655 WHERE `entry`=28141;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (9655,13078);
REPLACE INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES ('71777', '14', '24576', '1', '24576', '0', '690', '2', '1'), ('71777', '4411', '24657', '1', '24657', '0', '1101', '2', '1');
REPLACE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(7410, 181086, 1, 1, 1, 9869.12, 2493.13, 1315.88, 6.16653, 0, 0, 0.0582931, -0.9983, 300, 0, 1),
(7411, 181086, 530, 1, 1, -4004.66, -11844.5, 0.19541, 4.93701, 0, 0, 0.623403, -0.7819, 300, 0, 1),
(7412, 181086, 0, 1, 1, -4918.78, -983.208, 501.455, 2.30465, 0, 0, 0.913711, 0.406364, 300, 0, 1),
(7413, 181086, 0, 1, 1, -8869.51, 636.686, 95.7873, 0.794388, 0, 0, 0.386832, 0.92215, 300, 0, 1),
(7417, 181086, 1, 1, 1, 1653.44, -4437.37, 18.1863, 1.72627, 0, 0, 0.759883, 0.65006, 300, 0, 1),
(7422, 181086, 1, 1, 1, -1224.34, 68.3642, 129.71, 3.17285, 0, 0, 0.999878, -0.015627, 300, 0, 1),
(7423, 181086, 530, 1, 1, 9612.28, -7184.77, 14.285, 1.82938, 0, 0, 0.792374, 0.610036, 300, 0, 1),
(7425, 181086, 0, 1, 1, 1629.62, 240.116, 63.8516, 0.155664, 0, 0, 0.0777534, 0.996973, 300, 0, 1),
(4276, 201752, 0, 1, 1, -9029.77, 353.325, 92.923, 0.8808, 0, 0, 0.426301, 0.904581, 300, 0, 1),
(4465, 201752, 0, 1, 1, -9029.87, 351.542, 92.9248, 0.489671, 0, 0, 0.242397, 0.970177, 300, 0, 1),
(4614, 201752, 0, 1, 1, -9028.41, 352.69, 92.9163, 0.721364, 0, 0, 0.352912, 0.935656, 300, 0, 1),
(4745, 201752, 0, 1, 1, -9027.7, 351.062, 92.9193, 0.689162, 0, 0, 0.337803, 0.941217, 300, 0, 1),
(4747, 201752, 0, 1, 1, -9029.08, 349.917, 92.932, 0.657746, 0, 0, 0.322977, 0.946407, 300, 0, 1),
(4748, 201752, 0, 1, 1, -9028.77, 352.62, 94.1596, 6.02202, 0, 0, 0.130214, -0.991486, 300, 0, 1),
(5039, 201752, 0, 1, 1, -9028.84, 350.443, 94.1755, 0.771628, 0, 0, 0.376314, 0.926492, 300, 0, 1),
(5040, 201752, 0, 1, 1, -9026.5, 348.864, 93.0359, 2.17356, 0, 0, 0.885134, 0.465337, 300, 0, 1),
(5041, 201752, 0, 1, 1, -9028.21, 348.744, 93.024, 0.889436, 0, 0, 0.430203, 0.902732, 300, 0, 1),
(5042, 201752, 1, 1, 1, 1381.97, -4431.17, 30.6588, 5.49617, 0, 0, 0.383432, -0.923569, 300, 0, 1),
(5045, 201752, 1, 1, 1, 1380.98, -4432.28, 30.6586, 5.55507, 0, 0, 0.356069, -0.93446, 300, 0, 1),
(5047, 201752, 1, 1, 1, 1379.73, -4433.4, 30.6569, 5.69644, 0, 0, 0.28918, -0.957275, 300, 0, 1),
(5050, 201752, 1, 1, 1, 1377.96, -4432.16, 30.6489, 5.58649, 0, 0, 0.341345, -0.939938, 300, 0, 1),
(7471, 201752, 1, 1, 1, 1379.23, -4431.41, 30.6768, 5.559, 0, 0, 0.354231, -0.935158, 300, 0, 1),
(7472, 201752, 1, 1, 1, 1379.85, -4432.91, 31.8999, 5.66896, 0, 0, 0.302309, -0.95321, 300, 0, 1),
(7473, 201752, 1, 1, 1, 1380.81, -4431.58, 31.902, 5.64147, 0, 0, 0.315381, -0.948965, 300, 0, 1),
(7475, 201752, 1, 1, 1, 1377.67, -4434.36, 30.6055, 5.36265, 0, 0, 0.444186, -0.895935, 300, 0, 1),
(4946, 201778, 0, 1, 1, -9031.18, 354.399, 92.9752, 6.12019, 0, 0, 0.0814081, -0.996681, 300, 0, 1),
(4982, 201778, 0, 1, 1, -9028.76, 352.525, 95.4034, 0.503804, 0, 0, 0.249246, 0.96844, 300, 0, 1),
(5046, 201778, 0, 1, 1, -9030.19, 351.409, 94.1683, 0.134668, 0, 0, 0.067283, 0.997734, 300, 0, 1),
(5048, 201778, 0, 1, 1, -9031.52, 349.739, 92.9068, 0.338872, 0, 0, 0.168626, 0.98568, 300, 0, 1),
(7427, 201778, 0, 1, 1, -9030.55, 347.899, 92.9635, 0.751206, 0, 0, 0.366833, 0.930287, 300, 0, 1),
(7428, 201778, 0, 1, 1, -9027.59, 348.911, 94.2683, 1.784, 0, 0, 0.77833, 0.627855, 300, 0, 1),
(7430, 201778, 0, 1, 1, -9028.87, 349.971, 95.4191, 1.82327, 0, 0, 0.790507, 0.612452, 300, 0, 1),
(7431, 201778, 0, 1, 1, -9031.75, 354.82, 92.9939, 6.0605, 0, 0, 0.111113, -0.993808, 300, 0, 1),
(7433, 201778, 0, 1, 1, -9032.22, 352.779, 92.9627, 6.0605, 0, 0, 0.111113, -0.993808, 300, 0, 1),
(7434, 201778, 1, 1, 1, 1375.84, -4432.46, 30.5735, 5.69645, 0, 0, 0.289178, -0.957275, 300, 0, 1),
(7442, 201778, 1, 1, 1, 1377.99, -4431.81, 31.8923, 5.5001, 0, 0, 0.381614, -0.924322, 300, 0, 1),
(7447, 201778, 1, 1, 1, 1379.21, -4430.58, 31.9198, 4.81681, 0, 0, 0.669241, -0.743045, 300, 0, 1),
(7455, 201778, 1, 1, 1, 1379.35, -4432.78, 33.143, 5.61791, 0, 0, 0.326536, -0.945185, 300, 0, 1),
(7461, 201778, 1, 1, 1, 1380.87, -4431.5, 33.1452, 4.66994, 0, 0, 0.721955, -0.69194, 300, 0, 1),
(7463, 201778, 1, 1, 1, 1380.96, -4429.36, 30.6772, 4.6503, 0, 0, 0.728713, -0.68482, 300, 0, 1),
(7465, 201778, 1, 1, 1, 1383.08, -4429.42, 30.651, 4.53642, 0, 0, 0.766505, -0.642238, 300, 0, 1),
(7466, 201778, 1, 1, 1, 1378.64, -4428.42, 30.6846, 5.23543, 0, 0, 0.500243, -0.865885, 300, 0, 1),
(7469, 201778, 1, 1, 1, 1377.05, -4429.39, 30.6467, 5.31397, 0, 0, 0.465863, -0.884857, 300, 0, 1);
INSERT IGNORE INTO `game_event_gameobject` SELECT `guid`,'8' FROM `gameobject` WHERE `id`=201778;
INSERT IGNORE INTO `game_event_gameobject` SELECT `guid`,'8' FROM `gameobject` WHERE `id`=201752;
INSERT IGNORE INTO `game_event_gameobject` SELECT `guid`,'8' FROM `gameobject` WHERE `id`=181086;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES 
(677, 200335, 33, 1, 1, -196.556, 2195.78, 79.7637, 0, 0, 0, 0, 1, 180, 0, 1),(7476, 190678, 33, 1, 1, -222.55, 2206.36, 81.0686, 0, 0, 0, 0, 1, 180, 0, 1);
INSERT IGNORE INTO `game_event_gameobject` SELECT `guid`,'8' FROM `gameobject` WHERE `id`=200335;
INSERT IGNORE INTO `game_event_gameobject` SELECT `guid`,'8' FROM `gameobject` WHERE `id`=190678;
DELETE FROM `creature` WHERE `guid` = 90514;
DELETE FROM `game_event_creature` WHERE `guid` = 90514;
DELETE FROM `creature_questrelation` WHERE `quest` in (24793,14488,24792);
DELETE FROM `creature_involvedrelation` WHERE `quest` in (24793,14488,24792);
DELETE FROM `game_event_quest` WHERE `quest` in (24793,14488,24792);
UPDATE `quest_template` SET `EndText` = 'Steal perfume package from Crown Chemical Co. outside Stormind' WHERE `entry` = 24656;
UPDATE `quest_template` SET `EndText` = 'Steal perfume package from Crown Chemical Co. outside Orgrimmar' WHERE `entry` = 24541;
UPDATE `quest_template` SET `RequestItemsText` ='The cologne isn''t going to give itself out, you know.$B$BGet spraying!' , `OfferRewardText` ='Nice work, $N! People will be buying Crown colognes by the crate-load now that they''ve had a chance to try them.$B$BHere''s a little something for helping us out.' WHERE `entry` = 24635;
UPDATE `quest_template` SET `RequestItemsText` ='That perfume''s not going to spray itself, you know.$B$BGet going!' , `OfferRewardText` ='Great work, $N! People will come running to buy Crown perfumes now that they''ve had a chance to sample their wonders.$B$BHere''s a little something for helping us out.' WHERE `entry` = 24629;
UPDATE `quest_template` SET `RequestItemsText` ='You know, those chocolates aren''t going to fling themselves at people.$B$BYou need to get to work!' , `OfferRewardText` ='Lovely work, $N! People will be tripping over one another to get Crown chocolates now that they''ve had a chance to taste those sweet, romantic treats.$B$BHere''s a little something for helping us out.' WHERE `entry` = 24636;
UPDATE `quest_template` SET `OfferRewardText` ='Hey. You got some time on your hands? I could use someone like you.' WHERE `entry` IN (24804,24805);
UPDATE `quest_template` SET `RequestItemsText` ='You analyze that reek yet, kid?' , `OfferRewardText` ='Hey, thanks, kid. Give it over, let''s take a look.$B$B<He takes the device from you and fiddles with it.>$B$BOh, that ain''t good.' WHERE `entry` IN (24655,24536);
UPDATE `quest_template` SET `RequestItemsText` ='Did they toss ya a crate to deliver?' , `OfferRewardText` ='You got it, huh? Good job, kid. Top notch. Let''s see what we what we got here.$B$B<He cracks open the crate and rummages around inside.' WHERE `entry` IN (24656,24541);
UPDATE `quest_template` SET `OfferRewardText` ='You... You''re not Snivel. Did he send you? He''s so late, I had started to give up hope...$B$B<Tears start welling up in the woman''s eyes once she realizes that you aren''t there to deliver a message from Snivel.>$B$BThat''s not like my Snivel, but what choice is there?' WHERE `entry` = 24848;
UPDATE `quest_template` SET `OfferRewardText` ='You''re not Snivel. He was supposed to be here an hour ago! What have you done with him?$B$B<Roka seems to calm down when you tell her that you''re looking for Snivel, too. Then the tears start to well up in her eyes.>$B$BThis isn''t like my Snivel. Do you think something''s happened to him?' WHERE `entry` = 24850;
UPDATE `quest_template` SET `RequestItemsText` ='Who are you?' , `OfferRewardText` ='All he talked about was leaving town with all his money? Then he really has abandoned me, hasn''t he?$B$BOh, $N. I was such a fool to fall for him, but how could I help myself? He was so irresistible!' WHERE `entry` = 24849;
UPDATE `quest_template` SET `RequestItemsText` ='Who are you?' , `OfferRewardText` ='All he talked about was leaving town with all his money? Then he really has abandoned me, hasn''t he?$B$BI can''t believe I fell for such a horrible goblin! But he was so irresistible when we first met.' WHERE `entry` = 24851;
UPDATE `quest_template` SET `RequestItemsText` ='Did you find the guy, or did he crawl under a rock?' , `OfferRewardText` ='You got his ledger? Really? That''s great, $N. There''s probably loads of good information in here.' WHERE `entry` IN (24657,24576);
UPDATE `quest_template` SET `OfferRewardText` ='Fantastic. Help is exactly what I need.' WHERE `entry` IN (24792,24793);
UPDATE `quest_template` SET `RequestItemsText` ='I don''t remember ordering a cleaing service... why yes, I am Apothecary Hummel.$B$B...wait, what is the meaning of this? You think these meaningless papers can stop me? Hah!' , `OfferRewardText` ='What we do here is none of your business...' WHERE `entry` = 11488;
UPDATE `quest_template` SET `RequestItemsText` ='Did you take care of those no-good scheming villains?' , `OfferRewardText` ='What''ve you got there?$B$BOh hey, this is big. Real big. Most of the crazy details in one little package. Thanks - you really helped us reel this all in. Good working with ya.' WHERE `entry` IN (24745,14483);
UPDATE `quest_template` SET `RequestItemsText` ='Did you teach ''em a lesson?' , `OfferRewardText` ='Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE `entry` IN (24658,24665,24666,24664,24663,24659,24660,24662,24647,24638,24651,24652,24650,24649,24645,24648);
UPDATE creature_template SET flags_extra = flags_extra | 2048 WHERE entry in (6746,6741,6735,5111,6826,6740,6929,11814);
DELETE FROM `item_loot_template` WHERE `entry` = 34077 AND `item` = 33154;
DELETE FROM `item_loot_template` WHERE `entry` = 34077 AND `item` = 33189;
DELETE FROM `item_loot_template` WHERE `entry` = 34077 AND `item` = 33292;
DELETE FROM `creature_questrelation` WHERE `quest` in (11135,11220,11955,11696,11691);
DELETE FROM `creature_involvedrelation` WHERE `quest` in (11135,11220,11955,11696,11691);
DELETE FROM `gameobject_questrelation` WHERE `quest` in (11392,11135,11220,11401,11404,11405,11691);
DELETE FROM `gameobject_involvedrelation` WHERE `quest` in (11392,11135,11220,11401,11404,11405,11691);
DELETE FROM `game_event_quest` WHERE `quest` in (11392,11135,11220,11401,11404,11405,11955,11696,11691);
UPDATE `quest_template` SET `PrevQuestId`='0' WHERE `entry`=11955;
UPDATE `gossip_menu` SET `text_id`='15864' WHERE `entry`=11389 AND `text_id`=68;
UPDATE `gossip_menu_option` SET `option_text`='I would like to buy from you.' WHERE `menu_id`=7603 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='I wish to purchase fishing supplies.' WHERE `menu_id`=7609 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Give me some pointers on my fishing technique.' WHERE `menu_id`=7609 AND `id`=1;
UPDATE `gossip_menu_option` SET `option_text`='I have marks to redeem!' WHERE `menu_id`=7722 AND `id`=1;
UPDATE `creature_template` SET `gossip_menu_id`=7608 WHERE `entry`=18015;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7608,9259),(7722,9431);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(7608,0,1,'I wish to purchase tradeskill supplies.',3,128,0,0,0,0,'');
UPDATE `gossip_menu_option` SET `option_text`='Show me what you have for sale.' WHERE `menu_id`=8659 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_2`='11', `cond_2_val_1`='61438' WHERE `menu_id`=9709 AND `id`=0;
UPDATE `gossip_menu` SET `cond_2`='11', `cond_2_val_1`='61438' WHERE `entry`=9709 AND `text_id`=13271;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (9731,13324);
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='12238' WHERE `entry`=9731 AND `text_id`=13324;
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='12661' WHERE `entry`=9731 AND `text_id`=13325;
UPDATE `gossip_menu` SET `cond_1`='22', `cond_1_val_1`='12238' WHERE `entry`=9731 AND `text_id`=13348;
UPDATE `creature` SET `spawntimesecs`='30' WHERE `id` in (38023,38032,38030,38006,38016,37214,37917,37984,38035);
UPDATE creature SET position_x = '-9028.074219', position_y = '346.521057', position_z = '93.150200', orientation = '3.608294' WHERE guid = '115998';
UPDATE creature SET position_x = '-9033.069336', position_y = '350.929504', position_z = '92.912064', orientation = '3.199099' WHERE guid = '116000';
UPDATE creature SET position_x = '-9031.656250', position_y = '357.244690', position_z = '93.110428', orientation = '3.368743' WHERE guid = '115999';
UPDATE creature SET position_x = '-60.182114', position_y = '1157.825806', position_z = '65.122932', orientation = '2.929710' WHERE guid = '90509';
DELETE FROM creature WHERE guid=92100;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`) VALUES
(92100,37917,0,1,1,0,0,-46.3844,1157.61,64.5399,3.53918,25,0,0,356,0);
UPDATE creature SET position_x = '-35.880653', position_y = '1153.390625', position_z = '64.373764', orientation = '3.042022' WHERE guid = '92100';
INSERT IGNORE INTO `game_event_creature` (`guid`, `event`) VALUES ('92100', '8');
UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE `id` in (38023,38032,38030,38006,38016,37214,37917,37984);
UPDATE gossip_menu_option SET menu_id = 10401 WHERE menu_id = 50029;
UPDATE locales_gossip_menu_option SET menu_id = 10401 WHERE menu_id = 50029;
UPDATE gossip_menu_option SET menu_id = 10399 WHERE menu_id = 50030;
UPDATE locales_gossip_menu_option SET menu_id = 10399 WHERE menu_id = 50030;
UPDATE gossip_menu_option SET menu_id = 10397 WHERE menu_id = 50031;
UPDATE locales_gossip_menu_option SET menu_id = 10397 WHERE menu_id = 50031;
UPDATE creature SET position_x = '1375.704712', position_y = '-4437.526855', position_z = '30.483894', orientation = '2.303526' WHERE guid = '78308';
UPDATE creature SET position_x = '1383.854004', position_y = '-4426.926270', position_z = '30.638952', orientation = '2.433115' WHERE guid = '78306';
UPDATE creature SET position_x = '1375.198486', position_y = '-4430.227051', position_z = '30.585213', orientation = '3.042585' WHERE guid = '78307';
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (10397,10399,10401) AND `id` = 1;
UPDATE `gossip_menu_option`SET`cond_1`='0', `cond_1_val_1`='0' WHERE `menu_id` in (10397,10399,10401) AND `id`=0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` in (10397,10399,10401) AND `id` = 1;
UPDATE `creature_template` SET `npcflag`='2' WHERE `entry`=6806;
UPDATE `creature_template` SET `npcflag`='0' WHERE `entry`=1281;
UPDATE `creature_template` SET `npcflag`='4480' WHERE `entry`=1687;
UPDATE `creature_template` SET `npcflag`='80' WHERE `entry`=3603;
UPDATE `creature_template` SET `gossip_menu_id`='12726' WHERE `entry`=6301;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (12726,17861);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(12726, 0, 1, 'I want to browse your goods.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `npc_gossip` WHERE `npc_guid` = 8433;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 8092;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 8345;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 46422;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 44383;
DELETE FROM `gossip_menu` WHERE `entry` = 6510;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(6510, 7704, 0, 0, 0, 0, 0, 0, 0),(6510, 7705, 0, 15, 10, 1, 0, 0, 0);
UPDATE `gossip_menu` SET `text_id`='7688' WHERE `entry`=6492 AND `text_id`=7599;
UPDATE creature_template SET gossip_menu_id = 6490 WHERE entry = 15105;
UPDATE gossip_menu SET entry = 6490 WHERE entry = 6492;
UPDATE gossip_menu_option SET menu_id = 6490 WHERE menu_id = 6492;
UPDATE locales_gossip_menu_option SET menu_id = 6490 WHERE menu_id = 6492;
UPDATE creature_template SET gossip_menu_id = 10482 WHERE entry = 3701;
UPDATE gossip_menu SET entry = 10482 WHERE entry = 50232;
UPDATE gossip_menu_option SET menu_id = 10482 WHERE menu_id = 50232;
UPDATE locales_gossip_menu_option SET menu_id = 10482 WHERE menu_id = 50232;
UPDATE creature_template SET gossip_menu_id = 8264 WHERE entry = 20272;
UPDATE gossip_menu SET entry = 8264 WHERE entry = 50319;
UPDATE gossip_menu_option SET menu_id = 8264 WHERE menu_id = 50319;
UPDATE locales_gossip_menu_option SET menu_id = 8264 WHERE menu_id = 50319;
UPDATE `gossip_menu` SET `text_id`='10286' WHERE `entry`=8264 AND `text_id`=9983;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 35607;
DELETE FROM `gossip_menu` WHERE `entry` = 35607;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 35607;
UPDATE creature_template SET gossip_menu_id = 10656 WHERE entry = 35607;
UPDATE `gossip_menu_option` SET `action_menu_id`='-1' WHERE `menu_id`=9563;
UPDATE `gossip_menu_option` SET `action_menu_id`='-1' WHERE `menu_id`=9455;
UPDATE `gossip_menu_option` SET `action_menu_id`='-1' WHERE `menu_id`=9457;
UPDATE creature_template SET gossip_menu_id = 10601 WHERE entry = 34952;
DELETE FROM `gossip_menu` WHERE `entry` = 50382;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50382;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50382;
delete from spell_script_target where entry=34874;
insert into spell_script_target values (34874, 1, 17990);
DELETE FROM spell_scripts WHERE id = 34874;
insert into spell_scripts (id, delay, command, datalong, datalong2, comments) values
(34874, 0, 18, 0, 0, 'Despawn Underbog Mushroom');
UPDATE creature_template SET gossip_menu_id = 6460 WHERE entry = 14981;
UPDATE gossip_menu SET entry = 6460 WHERE entry = 50311;
UPDATE gossip_menu_option SET menu_id = 6460 WHERE menu_id = 50311;
UPDATE locales_gossip_menu_option SET menu_id = 6460 WHERE menu_id = 50311;
DELETE FROM `gossip_menu` WHERE `entry` = 50317 AND `text_id` = 7616;
DELETE FROM `gossip_menu` WHERE `entry` = 50317 AND `text_id` = 10560;
UPDATE creature_template SET gossip_menu_id = 8258 WHERE entry = 20118;
UPDATE gossip_menu SET entry = 8258 WHERE entry = 50317;
UPDATE gossip_menu_option SET menu_id = 8258 WHERE menu_id = 50317;
UPDATE locales_gossip_menu_option SET menu_id = 8258 WHERE menu_id = 50317;
UPDATE creature_template SET gossip_menu_id = 6282 WHERE entry = 2302;
UPDATE gossip_menu SET entry = 6282 WHERE entry = 50309;
UPDATE gossip_menu_option SET menu_id = 6282 WHERE menu_id = 50309;
UPDATE locales_gossip_menu_option SET menu_id = 6282 WHERE menu_id = 50309;
UPDATE creature_template SET gossip_menu_id = 6459 WHERE entry = 3890;
UPDATE gossip_menu SET entry = 6459 WHERE entry = 50312;
UPDATE gossip_menu_option SET menu_id = 6459 WHERE menu_id = 50312;
UPDATE locales_gossip_menu_option SET menu_id = 6459 WHERE menu_id = 50312;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES ('10605', '14673', '0', '0', '0', '0', '0', '0', '0');
UPDATE `gossip_menu` SET `cond_1`='15', `cond_1_val_1`='10', `cond_1_val_2`='1' WHERE `entry`=10605 AND `text_id`=14674;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(10605, 0, 9, 'I would like to go to the battleground.', 12, 1048576, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE creature_template SET gossip_menu_id = 5108 WHERE entry = 4613;
UPDATE gossip_menu SET entry = 5108 WHERE entry = 50174;
UPDATE gossip_menu_option SET menu_id =5108 WHERE menu_id = 50174;
UPDATE locales_gossip_menu_option SET menu_id = 5108 WHERE menu_id = 50174;
UPDATE `gossip_menu` SET `text_id`='10277' WHERE `entry`=50316 AND `text_id`=7689;
UPDATE creature_template SET gossip_menu_id = 8256 WHERE entry = 16696;
UPDATE gossip_menu SET entry = 8256 WHERE entry = 50316;
UPDATE gossip_menu_option SET menu_id = 8256 WHERE menu_id = 50316;
UPDATE locales_gossip_menu_option SET menu_id = 8256 WHERE menu_id = 50316;
UPDATE creature_template SET gossip_menu_id = 6462 WHERE entry = 2804;
UPDATE gossip_menu SET entry = 6462 WHERE entry = 50310;
UPDATE gossip_menu_option SET menu_id = 6462 WHERE menu_id = 50310;
UPDATE locales_gossip_menu_option SET menu_id = 6462 WHERE menu_id = 50310;
UPDATE creature_template SET gossip_menu_id = 8261 WHERE entry = 20269;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES ('8261', '10283', '0', '15', '10', '1', '0', '0', '0'),('8261', '7599', '0', '0', '0', '0', '0', '0', '0');
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(8261, 0, 9, 'I would like to go to the battleground.', 12, 1048576, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `gossip_menu` WHERE `entry` in (10398,10400,10402);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(10398, 14431, 0, 1, 63034, 0, 1, 62853, 0),(10398, 14453, 0, 0, 0, 0, 0, 0, 0),
(10400, 14436, 0, 1, 63034, 0, 1, 62853, 0),(10400, 14455, 0, 0, 0, 0, 0, 0, 0),
(10402, 14438, 0, 1, 63034, 0, 1, 62853, 0),(10402, 14453, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10398 AND `id` = 2;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10398 AND `id` = 3;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10400 AND `id` = 2;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10400 AND `id` = 3;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10402 AND `id` = 2;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10402 AND `id` = 3;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 10398 AND `id` = 2;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 10398 AND `id` = 3;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 10400 AND `id` = 2;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 10400 AND `id` = 3;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 10402 AND `id` = 2;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 10402 AND `id` = 3;
UPDATE `gossip_menu_option` SET `cond_1`='1', `cond_1_val_1`='62853' WHERE `menu_id`=10398 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_1`='1', `cond_1_val_1`='62853' WHERE `menu_id`=10398 AND `id`=1;
UPDATE `gossip_menu_option` SET `cond_1`='1', `cond_1_val_1`='62853' WHERE `menu_id`=10400 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_1`='1', `cond_1_val_1`='62853' WHERE `menu_id`=10400 AND `id`=1;
UPDATE `gossip_menu_option` SET `cond_1`='1', `cond_1_val_1`='62853' WHERE `menu_id`=10402 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_1`='1', `cond_1_val_1`='62853' WHERE `menu_id`=10402 AND `id`=1;
DELETE FROM `gossip_menu` WHERE `entry` in (85,141,381,410,411,436,3984,4502,4512,4513,4540,4541,4542,4561,4562,4575,4576,4577,4658,4659,4676,4690,5061,6650,50199);
DELETE FROM `gossip_menu_option` WHERE menu_id in (85,141,381,410,411,436,3984,4502,4512,4513,4540,4541,4542,4561,4562,4575,4576,4577,4658,4659,4676,4690,5061,6650,50199);
DELETE FROM `locales_gossip_menu_option` WHERE menu_id in (85,141,381,410,411,436,3984,4502,4512,4513,4540,4541,4542,4561,4562,4575,4576,4577,4658,4659,4676,4690,5061,6650,50199);
UPDATE `creature_template` SET `gossip_menu_id`=4577 WHERE `entry`=4214;
UPDATE `creature_template` SET `gossip_menu_id`=4562 WHERE `entry`=5166;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(85, 581, 0, 14, 0, 8, 0, 0, 0),
(85, 4796, 0, 14, 0, 1527, 0, 0, 0),
(141, 4793, 0, 14, 0, 1527, 0, 0, 0),
(141, 4794, 0, 14, 0, 8, 0, 0, 0),
(381, 4795, 0, 14, 0, 8, 0, 0, 0),
(381, 4799, 0, 14, 0, 1527, 0, 0, 0),
(410, 4795, 0, 14, 0, 8, 0, 0, 0),
(410, 4797, 0, 14, 0, 1527, 0, 0, 0),
(411, 908, 0, 14, 0, 8, 0, 0, 0),
(411, 4798, 0, 14, 0, 1527, 0, 0, 0),
(436, 4793, 0, 14, 0, 1527, 0, 0, 0),
(436, 4794, 0, 14, 0, 8, 0, 0, 0),
(3984, 4838, 0, 14, 0, 8, 0, 0, 0),
(3984, 4839, 0, 14, 0, 1527, 0, 0, 0),
(4502, 4835, 0, 14, 0, 8, 0, 0, 0),
(4502, 4837, 0, 14, 0, 1527, 0, 0, 0),
(4512, 638, 0, 14, 0, 8, 0, 0, 0),
(4512, 4793, 0, 14, 0, 1527, 0, 0, 0),
(4513, 638, 0, 14, 0, 8, 0, 0, 0),
(4513, 4793, 0, 14, 0, 1527, 0, 0, 0),
(4540, 581, 0, 14, 0, 8, 0, 0, 0),
(4540, 4796, 0, 14, 0, 1527, 0, 0, 0),
(4541, 581, 0, 14, 0, 8, 0, 0, 0),
(4541, 4796, 0, 14, 0, 1527, 0, 0, 0),
(4542, 581, 0, 14, 0, 8, 0, 0, 0),
(4542, 4796, 0, 14, 0, 1527, 0, 0, 0),
(4561, 5695, 0, 14, 0, 8, 0, 0, 0),
(4561, 4833, 0, 14, 0, 1527, 0, 0, 0),
(4562, 4834, 0, 14, 0, 8, 0, 0, 0),
(4562, 4833, 0, 14, 0, 1527, 0, 0, 0),
(4575, 4793, 0, 14, 0, 1527, 0, 0, 0),
(4575, 4795, 0, 14, 0, 8, 0, 0, 0),
(4576, 4793, 0, 14, 0, 1527, 0, 0, 0),
(4576, 4794, 0, 14, 0, 8, 0, 0, 0),
(4577, 4793, 0, 14, 0, 1527, 0, 0, 0),
(4577, 4795, 0, 14, 0, 8, 0, 0, 0),
(4658, 6164, 0, 14, 0, 1527, 0, 0, 0),
(4658, 6165, 0, 14, 0, 8, 0, 0, 0),
(4659, 4835, 0, 14, 0, 8, 0, 0, 0),
(4659, 4837, 0, 14, 0, 1527, 0, 0, 0),
(4676, 4833, 0, 14, 0, 1527, 0, 0, 0),
(4676, 4835, 0, 14, 0, 8, 0, 0, 0),
(4690, 4795, 0, 14, 0, 8, 0, 0, 0),
(4690, 4796, 0, 14, 0, 1527, 0, 0, 0),
(5061, 4835, 0, 14, 0, 8, 0, 0, 0),
(5061, 4837, 0, 14, 0, 1527, 0, 0, 0),
(6650, 9187, 0, 14, 0, 1527, 0, 0, 0),
(6650, 9188, 0, 14, 0, 8, 0, 0, 0),
(50199, 1038, 0, 0, 0, 0, 0, 0, 0),
(50199, 1124, 0, 8, 2458, 0, 0, 0, 0);
#
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(85, 0, 3, 'I would like to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(85, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(85, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(85, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(141, 0, 3, 'I would like training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(141, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(141, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(141, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(381, 0, 3, 'I am in need of training, Keryn.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(381, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(381, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(381, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(410, 0, 3, 'I would like to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(410, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(410, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(410, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(411, 0, 3, 'Good day, Hulfdan, I am looking for training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(411, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(411, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(411, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(436, 0, 3, 'Hello! I am a Rogue in need of training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(436, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(436, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(436, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(3984, 0, 3, 'Yes, I have. Teach me.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(3984, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(3984, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(3984, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(4502, 0, 3, 'Can you train me how to use rogue skills?', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(4502, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(4502, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(4502, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(4512, 0, 3, 'I would like training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(4512, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(4512, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(4512, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(4513, 0, 3, 'I would like training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(4513, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(4513, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(4513, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(4540, 0, 3, 'I would like to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(4540, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(4540, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(4540, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(4541, 0, 3, 'I would like to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(4541, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(4541, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(4541, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(4542, 0, 3, 'I would like to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(4542, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(4542, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(4542, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(4561, 0, 3, 'I''m lookin'' for rogue trainin''.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(4561, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(4561, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(4561, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(4562, 0, 3, 'I''m lookin'' for rogue trainin''.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(4562, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(4562, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(4562, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(4575, 0, 3, 'I seek training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(4575, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(4575, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(4575, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(4576, 0, 3, 'I seek training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(4576, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(4576, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(4576, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(4577, 0, 3, 'I seek training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(4577, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(4577, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(4577, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(4658, 0, 3, 'Can you train me how to use rogue skills?', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(4658, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(4658, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(4658, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(4659, 0, 3, 'Can you train me how to use rogue skills?', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(4659, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(4659, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(4659, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(4676, 0, 3, 'Can you train me how to use rogue skills?', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(4676, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(4676, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(4676, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(4690, 0, 3, 'I seek training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(4690, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(4690, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(4690, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(5061, 0, 3, 'Can you train me how to use rogue skills?', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(5061, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(5061, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(5061, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(6650, 0, 3, 'I require rogue training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(6650, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(6650, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(6650, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0),
(50199, 0, 3, 'I would like training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 8, 0, 0, 0, 0, 0, 0),
(50199, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 8),
(50199, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 8, 0, 0, 0),
(50199, 4, 0, '<Take the letter>', 1, 1, -1, 0, 85, 0, 0, NULL, 15, 24, 1, 14, 0, 8, 22, 6681, 0);
DELETE FROM `gossip_menu` WHERE `entry` in (4007,4008,4009,4010,4011,4012,4017,4023,4092,4101,4472,4473,4474,4506,4524,4549,4550,4551,4621,4647,4648,4657,4674,4675,4693,4694,4695,6652,7262,7368);
DELETE FROM `gossip_menu_option` WHERE menu_id in (4007,4008,4009,4010,4011,4012,4017,4023,4092,4101,4472,4473,4474,4506,4524,4549,4550,4551,4621,4647,4648,4657,4674,4675,4693,4694,4695,6652,7262,7368);
DELETE FROM `locales_gossip_menu_option` WHERE menu_id in (4007,4008,4009,4010,4011,4012,4017,4023,4092,4101,4472,4473,4474,4506,4524,4549,4550,4551,4621,4647,4648,4657,4674,4675,4693,4694,4695,6652,7262,7368);
UPDATE `creature_template` SET `gossip_menu_id`=4092 WHERE `entry` in (8308,3963);
UPDATE `creature_template` SET `gossip_menu_id`=4101 WHERE `entry`=987;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(4007, 4999, 0, 14, 0, 4, 0, 0, 0),
(4007, 5000, 0, 14, 0, 1531, 0, 0, 0),
(4008, 4863, 0, 14, 0, 4, 0, 0, 0),
(4008, 4993, 0, 14, 0, 1531, 0, 0, 0),
(4009, 4316, 0, 14, 0, 4, 0, 0, 0),
(4009, 4993, 0, 14, 0, 1531, 0, 0, 0),
(4010, 4866, 0, 14, 0, 4, 0, 0, 0),
(4010, 5003, 0, 14, 0, 1531, 0, 0, 0),
(4011, 4997, 0, 14, 0, 4, 0, 0, 0),
(4011, 4998, 0, 14, 0, 1531, 0, 0, 0),
(4012, 4868, 0, 14, 0, 4, 0, 0, 0),
(4012, 4998, 0, 14, 0, 1531, 0, 0, 0),
(4017, 4998, 0, 14, 0, 1531, 0, 0, 0),
(4017, 4888, 0, 14, 0, 4, 0, 0, 0),
(4023, 4996, 0, 14, 0, 1531, 0, 0, 0),
(4023, 4997, 0, 14, 0, 4, 0, 0, 0),
(4092, 4993, 0, 14, 0, 1531, 0, 0, 0),
(4092, 4867, 0, 14, 0, 4, 0, 0, 0),
(4101, 5002, 0, 14, 0, 1531, 0, 0, 0),
(4101, 5001, 0, 14, 0, 4, 0, 0, 0),
(4472, 4893, 0, 14, 0, 4, 0, 0, 0),
(4472, 5000, 0, 14, 0, 1531, 0, 0, 0),
(4473, 4893, 0, 14, 0, 4, 0, 0, 0),
(4473, 5000, 0, 14, 0, 1531, 0, 0, 0),
(4474, 4893, 0, 14, 0, 4, 0, 0, 0),
(4474, 5000, 0, 14, 0, 1531, 0, 0, 0),
(4506, 4987, 0, 14, 0, 4, 0, 0, 0),
(4506, 5004, 0, 14, 0, 1531, 0, 0, 0),
(4524, 4997, 0, 14, 0, 4, 0, 0, 0),
(4524, 4998, 0, 14, 0, 1531, 0, 0, 0),
(4549, 4999, 0, 14, 0, 4, 0, 0, 0),
(4549, 5000, 0, 14, 0, 1531, 0, 0, 0),
(4550, 4999, 0, 14, 0, 4, 0, 0, 0),
(4550, 5000, 0, 14, 0, 1531, 0, 0, 0),
(4551, 4999, 0, 14, 0, 4, 0, 0, 0),
(4551, 5000, 0, 14, 0, 1531, 0, 0, 0),
(4621, 4993, 0, 14, 0, 1531, 0, 0, 0),
(4621, 4994, 0, 14, 0, 4, 0, 0, 0),
(4647, 4997, 0, 14, 0, 4, 0, 0, 0),
(4647, 4998, 0, 14, 0, 1531, 0, 0, 0),
(4648, 4987, 0, 14, 0, 4, 0, 0, 0),
(4648, 5004, 0, 14, 0, 1531, 0, 0, 0),
(4657, 5001, 0, 14, 0, 4, 0, 0, 0),
(4657, 5002, 0, 14, 0, 1531, 0, 0, 0),
(4674, 4999, 0, 14, 0, 4, 0, 0, 0),
(4674, 5000, 0, 14, 0, 1531, 0, 0, 0),
(4675, 4999, 0, 14, 0, 4, 0, 0, 0),
(4675, 5000, 0, 14, 0, 1531, 0, 0, 0),
(4693, 4993, 0, 14, 0, 1531, 0, 0, 0),
(4693, 6160, 0, 14, 0, 4, 0, 0, 0),
(4694, 4993, 0, 14, 0, 1531, 0, 0, 0),
(4694, 6160, 0, 14, 0, 4, 0, 0, 0),
(4695, 4863, 0, 14, 0, 4, 0, 0, 0),
(4695, 4993, 0, 14, 0, 1531, 0, 0, 0),
(6652, 9189, 0, 14, 0, 1531, 0, 0, 0),
(6652, 9190, 0, 14, 0, 4, 0, 0, 0),
(7262, 8585, 0, 14, 0, 4, 0, 0, 0),
(7262, 8586, 0, 14, 0, 1531, 0, 0, 0),
(7368, 8804, 0, 14, 0, 4, 0, 0, 0),
(7368, 8823, 0, 14, 0, 1531, 0, 0, 0);
#
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(4007, 0, 3, 'I''d like to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4007, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4007, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4008, 0, 3, 'I am in need of training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4008, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4008, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4009, 0, 3, 'I am in need of training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4009, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4009, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4010, 0, 3, 'I have come for training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4010, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4010, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4011, 0, 3, 'I am in need of training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4011, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4011, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4012, 0, 3, 'I am a hunter and wish to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4012, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4012, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4017, 0, 3, 'Please train me.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4017, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4017, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4023, 0, 3, 'I wish to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4023, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4023, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4092, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4092, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4092, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4101, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4101, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4101, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4472, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4472, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4472, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4473, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4473, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4473, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4474, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4474, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4474, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4506, 0, 3, 'I wish to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4506, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4506, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4524, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4524, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4524, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4549, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4549, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4549, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4550, 0, 3, 'I am here for training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4550, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4550, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4551, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4551, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4551, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4621, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4621, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4621, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4647, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4647, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4647, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4648, 0, 3, 'I wish to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4648, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4648, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4657, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4657, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4657, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4674, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4674, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4674, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4675, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4675, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4675, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4693, 0, 3, 'I''d like to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4693, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4693, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4694, 0, 3, 'I''d like to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4694, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4694, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(4695, 0, 3, 'I''d like to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(4695, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(4695, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(6652, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(6652, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(6652, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(7262, 0, 3, 'I seek training in the ways of the Hunter.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(7262, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(7262, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0),
(7368, 0, 3, 'I am a hunter in need of training, Acteon.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 4, 0, 0, 0, 0, 0, 0),
(7368, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 4),
(7368, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 4, 0, 0, 0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50199;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50199;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES (840,0,0,"Please continue, Hero...",1,1,880,0,0,0,'');
UPDATE `gossip_menu_option` SET `action_menu_id`='-1', `action_script_id`='1541', `cond_1`='9', `cond_1_val_1`='3628', `cond_1_val_2`='1', `cond_2`='2', `cond_2_val_1`='10757', `cond_2_val_2`='1' WHERE `menu_id`=1541 AND `id`=0;
DELETE FROM `gossip_scripts` WHERE `id` = 1541;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('1541', '0', '15', '12885', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Teleport to Razelikh');
UPDATE `gossip_menu_option` SET `cond_1`='9', `cond_1_val_1`='9978' WHERE `menu_id`=7704 AND `id`=0;
REPLACE `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
('7579', '9221', '0', '8', '208', '0', '0', '0', '0'),
('7579', '9257', '0', '8', '9852', '0', '0', '0', '0'),
('7592', '9284', '0', '8', '9856', '0', '0', '0', '0'),
('7607', '9286', '0', '8', '9859', '0', '0', '0', '0'),
('7579', '9256', '0', '8', '9851', '0', '0', '0', '0');
UPDATE `gossip_menu` SET `cond_1_val_1`='9854' WHERE `entry`=7592 AND `text_id`=9283;
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='9991' WHERE `entry`=7719 AND `text_id`=9427;
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='10870' WHERE `entry`=8493 AND `text_id`=10655;
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='11012' WHERE `entry`=8493 AND `text_id`=10854;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7705,9406);
UPDATE `creature_template` SET `gossip_menu_id`=7699 WHERE `entry`=18471;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7699,9403);

# WDB
REPLACE INTO `npc_text` SET `ID`=7748,`prob0`=1,`text0_0`='',`text0_1`='No luck with the Twilight''s Hammer deserter?  Check the mountains to the southeast thoroughly.  There are numerous rumors of a mysterious hermit living there.',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=16024,`prob0`=1,`text0_0`='Shh, mon!  We be hidin'' here.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=16025,`prob0`=1,`text0_0`='Okrilla doesn''t like to let us non-orcs into town, but that doesn''t stop her from putting us to work.  No matter... I prefer it out here anyway.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=16027,`prob0`=1,`text0_0`='',`text0_1`='You are in orc territory.  What do you need, $r?',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=16198,`prob0`=1,`text0_0`='',`text0_1`='I don''t like the feel of this place, $N.  Naga sorceresses and slavedrivers aside... all I can sense inside this cavern is pain.  The ancient one is trying to cry out, but it cannot speak.',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18292,`prob0`=1,`text0_0`='The Warchief has ordered an invasion of the Hellfire Citadel, and we''re starting with these exposed ramparts.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=396,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18294,`prob0`=1,`text0_0`='The Blood Furnace is a testament to the dark past of my people.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=396,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18297,`prob0`=1,`text0_0`='',`text0_1`='The naga are pumping all of the water away for their own use, and entire species are dying out as a result.$B$BIf we don''t do something soon, what life is left on this dying world will disappear forever.',`lang0`=0,`em0_0`=1,`em0_1`=396,`em0_2`=1,`em0_3`=396,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18298,`prob0`=1,`text0_0`='I joined this expedition for one reason, $r: revenge.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=396,`em0_2`=0,`em0_3`=396,`em0_4`=0,`em0_5`=396,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18299,`prob0`=1,`text0_0`='These mushrooms are unlike anything on the surface. They''re said to bring great wisdom and clarity to those who eat them.$B$BI''m going to bring some back with me to Sporeggar.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18300,`prob0`=1,`text0_0`='Being able to study and learn from the Underbog is a once in a lifetime opportunity.$B$BTo think I was practically dead not long ago sitting in a crate in the Slave Pens...',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=396,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18302,`prob0`=1,`text0_0`='Nexus-Prince Haramad kept telling me that if we didn''t find a way through Shaffar''s ward soon that I''d be the next test subject.$B$BHe wasn''t bluffing.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18303,`prob0`=1,`text0_0`='What is an "Ologist", you ask? Why, it means I study everything! I''m more knowledgable about any subject you can think of than anyone you know or anyone you''ll ever know.$B$BGetting through Shaffar''s ward was nothing. Morphalius wouldn''t have a scratch on him if he had just listened to me. Always doing things his way, that one.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18304,`prob0`=1,`text0_0`='',`text0_1`='The dead do not belong in this realm.$B$BWhy, then, do we continually seek them out after putting them to rest?',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18308,`prob0`=1,`text0_0`='',`text0_1`='The spirits here have been tormented for a long time. We only want to rest.',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18324,`prob0`=1,`text0_0`='',`text0_1`='How can I help you?',`lang0`=0,`em0_0`=0,`em0_1`=6,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18342,`prob0`=1,`text0_0`='We came here for war.$B$BThey gave it to us.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18354,`prob0`=1,`text0_0`='Keep your wits about you. There are demons nearby.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=396,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18376,`prob0`=1,`text0_0`='Caza''rez was not as lucky as I was, $N. He rests with the spirits now.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=18,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18512,`prob0`=1,`text0_0`='I envy you in a way, little $r.$B$BYou are so fortunate as to bear witness to the first steps of the rebirth of the mighty Empire of Azjol-Nerub.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18521,`prob0`=1,`text0_0`='Our enemies believe us vanquished from the frozen wastes.$B$BWe will show them the consequence of their ignorance.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18532,`prob0`=1,`text0_0`='',`text0_1`='The Scourge spread so rapidly, I often find myself wondering why they haven''t already won this war.',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18593,`prob0`=1,`text0_0`='Enough hiding. It''s time to take the fight to the iron dwarves.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18613,`prob0`=1,`text0_0`='My people will stand idle no longer. The halls of Ulduar shall be cleansed!',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=18904,`prob0`=1,`text0_0`='Welcome aboard the Skyfire. You ready to chase down the end of the world?',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=16007,`prob0`=1,`text0_0`='',`text0_1`='Blood magic is shunned by many as a dark and forgotten art.  In that and many other ways, it shares some distinct characteristics with demonic magic.  Here, in the demon-scourged remains of the Black Morass, we believe that our blood studies will flourish.',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=16644,`prob0`=1,`text0_0`='',`text0_1`='Hey there, cutie!  Mind rubbing some lotion on my exposed areas?',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;

# NeatElves
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='20' WHERE `item`=4655;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='100' WHERE `item`=4611;
DELETE FROM `creature_loot_template` WHERE `item` = 4655;
DELETE FROM `creature_loot_template` WHERE `item` = 2143;
DELETE FROM `creature_loot_template` WHERE `item` = 5503;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='1' WHERE `item`=5500;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='2' WHERE `item`=2143;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='2' WHERE `item`=5498;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='10' WHERE `item`=5503;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='25' WHERE `item`=5504;
DELETE FROM `pickpocketing_loot_template` WHERE `item` = 5500;
DELETE FROM `pickpocketing_loot_template` WHERE `item` = 5498;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 331 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 2852 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 2855 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 2857 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 3689 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 3690 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 3691 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 3693 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 3694 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 3695 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 3707 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 3719 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 4149 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 153451 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 153453 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 153454 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 153470 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 153471 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 153472 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 153473 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 178185 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 178186 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 181804 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 105581 AND `item` = 5504;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 4095 AND `item` = 5504;
UPDATE `gameobject_loot_template` SET `maxcount`='3' WHERE `item` in (4655,5503,5504);
UPDATE creature_template SET gossip_menu_id = 9983 WHERE entry = 29676;
UPDATE gossip_menu SET entry = 9983 WHERE entry = 50369;
UPDATE gossip_menu_option SET menu_id = 9983 WHERE menu_id = 50369;
UPDATE locales_gossip_menu_option SET menu_id = 9983 WHERE menu_id = 50369;
UPDATE creature_template SET gossip_menu_id = 9829 WHERE entry = 29676;
DELETE FROM `gossip_menu` WHERE `entry` = 50357;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50357;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50357;
UPDATE creature_template SET gossip_menu_id = 10602 WHERE entry = 34953;
DELETE FROM gossip_menu WHERE entry in (10602,50381);
REPLACE INTO gossip_menu (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(10602, 14669, 0, 0, 0, 0, 0, 0, 0),(10602, 14671, 0, 15, 71, 1, 0, 0, 0);
UPDATE gossip_menu_option SET menu_id = 10602 WHERE menu_id = 50381;
UPDATE locales_gossip_menu_option SET menu_id = 10602 WHERE menu_id = 50381;
UPDATE creature_template SET gossip_menu_id = 9983 WHERE entry = 32623;
DELETE FROM `gossip_menu` WHERE `entry` = 50369;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50369;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50369;
UPDATE creature_template SET gossip_menu_id = 9829 WHERE entry = 32620;
UPDATE creature_template SET gossip_menu_id=10311 WHERE entry=3443;
REPLACE INTO gossip_menu VALUES (10311, 14313, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO gossip_menu_option VALUES (10311, 0, 1, 'I want to browse your goods', 3, 128, 0, 0, 0, 0, 0, '', 8, 862, 0, 0, 0, 0, 0, 0, 0);
UPDATE creature_template SET gossip_menu_id = 9983 WHERE entry = 29676;
UPDATE creature_template SET gossip_menu_id = 9829 WHERE entry = 29675;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id` in (8387,5962) AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id` in (5962,8387) AND `id`=1;
UPDATE `creature_template` SET `gossip_menu_id`=9033 WHERE `entry`=24838;
UPDATE `creature_template` SET `gossip_menu_id`=9069 WHERE `entry`=25017;
UPDATE `creature_template` SET `gossip_menu_id`=10120 WHERE `entry` IN (31704,31705,31706,31720,31723,31724);
UPDATE `creature_template` SET `gossip_menu_id`=10259 WHERE `entry`=31716;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (9069,12266),(9033,12211),(1143,1759),(7696,9444),(7704,9425);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (9040,12217),(9041,12218),(9042,12219),(9043,12220),(7726,9437),(7727,9438),(7728,9439);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(7692,0,0,'Treelos, I know that the truth is somewhere inside you.  Tell me what it is.',1,1,7726,0,0,0,''),
(7726,0,0,'Keep it together man!  What about Zangarmarsh?',1,1,7727,0,0,0,''),
(7727,0,0,'I don''t have time for this!  Warden, what happened?!',1,1,7728,0,0,0,''),
(9038,0,0,'The Lady Mehley',1,1,9040,0,0,0,''),
(9038,1,0,'Food & Drink',1,1,9041,0,0,0,''),
(9038,2,0,'Goods & Gear',1,1,9042,0,0,0,''),
(9038,3,0,'"Stash?"',1,1,9043,0,0,0,''),
(9040,0,0,'Food & Drink',1,1,9041,0,0,0,''),
(9040,1,0,'Goods & Gear',1,1,9042,0,0,0,''),
(9040,2,0,'"Stash?',1,1,9043,0,0,0,''),
(9041,0,0,'The Lady Mehley',1,1,9040,0,0,0,''),
(9041,1,0,'Goods & Gear',1,1,9042,0,0,0,''),
(9041,2,0,'"Stash?',1,1,9043,0,0,0,''),
(9042,0,0,'The Lady Mehley',1,1,9040,0,0,0,''),
(9042,1,0,'Food & Drink',1,1,9041,0,0,0,''),
(9042,2,0,'"Stash?',1,1,9043,0,0,0,''),
(9043,0,0,'The Lady Mehley',1,1,9040,0,0,0,''),
(9043,1,0,'Food & Drink',1,1,9041,0,0,0,''),
(9043,2,0,'Goods & Gear',1,1,9042,0,0,0,'');
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='9978' WHERE `entry`=7704 AND `text_id`=9425;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 92754;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 132210;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 132211;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 131997;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 131998;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 132025;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 132028;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 132059;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 132061;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 132088;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 132089;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 132103;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 132105;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 132146;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 132150;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 132178;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 132180;
UPDATE `creature_template` SET `npcflag`='0' WHERE `entry` in (22389,18202,17159,16350,16322);
DELETE FROM `npc_gossip` WHERE `npc_guid` = 82572;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 77352;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 69758;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 70084;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 67803;
DELETE FROM `npc_gossip` WHERE `npc_guid` = 67861;
UPDATE `creature_template` SET `npcflag`=`npcflag`&~1 WHERE `entry` in (16722,16740,16741,21971,17005,18146);
DELETE FROM `npc_gossip` WHERE `npc_guid` in (66775,74433,74516,74466,68288,74964,74639);
UPDATE `creature_template` SET `gossip_menu_id`=6937 WHERE `entry`=15920;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (6937,8226);
UPDATE `creature_template` SET `npcflag`=`npcflag`&~1 WHERE `entry` in (15768,15767,15765,15761,15481,15309,15354);
DELETE FROM `npc_gossip` WHERE `npc_guid` in (91708,50946,91748,92215,124588,124587,124589,126829,40255,39864,102064);
UPDATE `creature_template` SET `gossip_menu_id`=6923 WHERE `entry`=15903;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (6923,8212);
UPDATE `creature_template` SET `gossip_menu_id`=6691 WHERE `entry`=15611;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (6691,8064);
UPDATE `creature_template` SET `gossip_menu_id`=7083 WHERE `entry`=16014;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7083,8335);
UPDATE `creature_template` SET `gossip_menu_id`=6623 WHERE `entry`=15443;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (6623,7874);
UPDATE `creature_template` SET `npcflag`=`npcflag`&~1 WHERE `entry` in (15297,15296,11860,11861,14536,14531,14529,14436,12657);
DELETE FROM `npc_gossip` WHERE `npc_guid` in (55255,55256,126529,126528,38898,20770,45953,6511,6762,10010,38749);
UPDATE `creature_template` SET `gossip_menu_id`=7234 WHERE `entry`=15405;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7234,8534);
UPDATE `creature_template` SET `gossip_menu_id`=6953 WHERE `entry`=15420;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (6953,8239);
UPDATE `creature_template` SET `npcflag`=`npcflag`&~1 WHERE `entry` in (12956);
DELETE FROM `npc_gossip` WHERE `npc_guid` in (24933);
UPDATE `gossip_menu_option` SET `cond_1`='9', `cond_1_val_1`='3453' WHERE `menu_id`=1323 AND `id`=3;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 165554 AND `item` = 11939;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 165554 AND `item` = 11940;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 165554 AND `item` = 11942;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 165554 AND `item` = 11966;
UPDATE `creature_template` SET `InhabitType`='7' WHERE `entry`=30215;
REPLACE INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_start_active`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`) VALUES (56305,4438,12987,1,12987,0,0,2,1);
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
(139208, 0, 65536, 1, 0, 0, 0, '61334 56304');
UPDATE `creature_template` SET `npcflag`=`npcflag`&~1 WHERE `entry` in (18020,14559);
DELETE FROM `npc_gossip` WHERE `npc_guid` in (68631,15803,35025,34978,45897,5140);
UPDATE `creature_template` SET `gossip_menu_id`=3604 WHERE `entry`=11615;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (3604,4356);
UPDATE `creature_template` SET `gossip_menu_id`=4084 WHERE `entry`=11799;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (4084,4977);
UPDATE `creature_template` SET `gossip_menu_id`=4003 WHERE `entry`=12245;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (4003,4857);
UPDATE `creature_template` SET `gossip_menu_id`=4002 WHERE `entry`=12246;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (4002,4856);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(4003, 0, 1, 'I want to browse your goods.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4002, 0, 1, 'I want to browse your goods.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3961 WHERE `entry`=11625;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (3961,4813);
DELETE FROM `creature_loot_template` WHERE `item` = 18255;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='50' WHERE `item`=18255;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='100' WHERE `item`=18249;
DELETE FROM `creature` WHERE `id` = 13022;
REPLACE INTO `game_event` (`entry`, `start_time`, `end_time`, `occurence`, `length`, `holiday`, `description`) VALUES ('73', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '60', '60', '0', 'Night Elf Mohawk');
DELETE FROM `gameobject` WHERE `guid` = 47808;
DELETE FROM `gameobject` WHERE `guid` = 47807;
INSERT IGNORE INTO `game_event_gameobject` SELECT `guid`,'73' FROM `gameobject` WHERE `id`=182077;
INSERT IGNORE INTO `game_event_gameobject` SELECT `guid`,'73' FROM `gameobject` WHERE `id`=201388;
INSERT IGNORE INTO `game_event_creature` SELECT `guid`,'73' FROM `creature` WHERE `id`=36778;
INSERT IGNORE INTO `game_event_creature` SELECT `guid`,'73' FROM `creature` WHERE `id`=31111;
DELETE FROM `npc_gossip` WHERE `npc_guid` in (65760,92150,126499);
UPDATE `creature_template` SET `gossip_menu_id`=8667 WHERE `entry`=23306;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8667,10903);
UPDATE `creature_template` SET `gossip_menu_id`=9004 WHERE `entry`=24727;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (9004,12162);
UPDATE creature_template SET gossip_menu_id = 9981 WHERE entry = 30587;
DELETE FROM `gossip_menu` WHERE `entry` = 50363;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50363;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50363;
UPDATE `gossip_menu` SET `cond_1_val_2`='1' WHERE `entry`=8660 AND `text_id`=11057;
UPDATE creature_template SET gossip_menu_id = 9981 WHERE entry = 30581;
DELETE FROM `gossip_menu` WHERE `entry` = 50361;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50361;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50361;
UPDATE creature_template SET gossip_menu_id = 9981 WHERE entry = 30580;
DELETE FROM `gossip_menu` WHERE `entry` = 50365;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50365;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50365;
UPDATE creature_template SET gossip_menu_id = 9983 WHERE entry = 30567;
DELETE FROM `gossip_menu` WHERE `entry` = 50368;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50368;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50368;
UPDATE creature_template SET gossip_menu_id = 9983 WHERE entry = 30584;
DELETE FROM `gossip_menu` WHERE `entry` = 50364;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50364;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50364;
UPDATE creature_template SET gossip_menu_id = 9983 WHERE entry = 30583;
DELETE FROM `gossip_menu` WHERE `entry` = 50366;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50366;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50366;
UPDATE creature_template SET gossip_menu_id = 9983 WHERE entry = 30582;
UPDATE creature_template SET gossip_menu_id = 9983 WHERE entry = 30590;
DELETE FROM `gossip_menu` WHERE `entry` = 50360;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50360;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50360;
DELETE FROM quest_end_scripts WHERE id =3908;
INSERT INTO quest_end_scripts VALUES 
(3908,1,29,3,9298,10,0,0x02,0,0,0,0,0,0,0,0,'9298 - npc_flag removed'),
(3908,1,0,0,0,0,0,0,2000000598,0,0,0,0,0,0,0,''),
(3908,2,3,0,7000,0,0,0,0,0,0,0,6384.541504,-2527.246094,538.736267,2.524385,''),
(3908,9,3,0,7000,0,0,0,0,0,0,0,6370.125000,-2525.521240,532.268066,2.822828,''),
(3908,16,0,0,0,0,0,0,2000000593,0,0,0,0,0,0,0,''),
(3908,21,1,61,0,0,0,0,0,0,0,0,0,0,0,0,''),
(3908,22,0,2,0,0,0,0,2000000594,0,0,0,0,0,0,0,''),
(3908,24,3,0,3000,0,0,0,0,0,0,0,6364.248047,-2524.001709,527.057617,2.926499,''),
(3908,27,0,0,0,0,0,0,2000000595,0,0,0,0,0,0,0,''),
(3908,28,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(3908,31,0,0,0,0,0,0,2000000596,0,0,0,0,0,0,0,''),
(3908,32,3,0,4000,0,0,0,0,0,0,0,6370.304688,-2524.185791,532.269653,6.268357,''),
(3908,36,3,0,8000,0,0,0,0,0,0,0,6385.985840,-2529.259277,539.029785,5.667530,''),
(3908,44,3,0,4000,0,0,0,0,0,0,0,6395.57,-2536.75,541.548,5.66753,''),
(3908,49,3,0,1000,0,0,0,0,0,0,0,6395.57,-2536.75,541.548,2.86475,''), 
(3908,49,0,0,0,0,0,0,2000000597,0,0,0,0,0,0,0,''),
(3908,50,29,3,9298,10,0,0x01,0,0,0,0,0,0,0,0,'9298 - npc_flag added');
REPLACE INTO db_script_string (entry,content_default) VALUES
(2000000598,'Please, follow me.'),
(2000000593,'I haven\'t really figured out what it is, but there\'s something strange about the hot springs...'),
(2000000594,'%s tosses the sword into the shallow pool.'),
(2000000595,'I\'ve found that when I throw something into this water, it has improved incredibly when I retrieve it.'),
(2000000596,'Well, whatever it is, it works quite well!'),
(2000000597,'And I am determined to find out more... So if you need my help again, you know where I\'ll be.');
UPDATE quest_template SET CompleteScript =3908 WHERE entry =3908;
DELETE FROM `npc_gossip` WHERE `npc_guid` in (41557,52501,78440,40502,41565,39119);
UPDATE `creature_template` SET `gossip_menu_id`=4401 WHERE `entry`=12757;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (4401,5613);
UPDATE `creature_template` SET `gossip_menu_id`=4441 WHERE `entry`=12737;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (4441,5653);
UPDATE `creature_template` SET `gossip_menu_id`=7362 WHERE `entry`=17100;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7362,8794);
UPDATE `creature_template` SET `gossip_menu_id`=5161 WHERE `entry`=12724;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (5161,6193);
UPDATE `creature_template` SET `gossip_menu_id`=10434 WHERE `entry`=12616;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10434,7778);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(10434, 0, 2, 'I need a ride.', 4, 8192, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10500, 0, 2, 'I need a ride.', 4, 8192, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4170, 0, 3, 'Train me.', 5, 16, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=5665 WHERE `entry`=12961;
UPDATE `creature_template` SET `gossip_menu_id`=4981 WHERE `entry`=12863;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (4981,6033);
UPDATE `creature_template` SET `gossip_menu_id`=10500 WHERE `entry`=11901;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10500,7778);
UPDATE `creature_template` SET `gossip_menu_id`=4170 WHERE `entry`=11074;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (4170,5248);
DELETE FROM `npc_gossip` WHERE `npc_guid` in (57995,57994,57996,58209,57300,83062,83249,77761,77675,57509);
UPDATE `creature_template` SET `gossip_menu_id`=7996 WHERE `entry`=19488;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7996,9848);
UPDATE `creature_template` SET `gossip_menu_id`=7995 WHERE `entry`=19489;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7995,9847);
UPDATE `creature_template` SET `gossip_menu_id`=8126 WHERE `entry`=20463;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8126,10064);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(8126, 0, 1, 'I want to browse your goods.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=8003 WHERE `entry`=19634;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8003,9869);
UPDATE `creature_template` SET `gossip_menu_id`=8008 WHERE `entry`=19645;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8008,9875);
UPDATE `creature_template` SET `gossip_menu_id`=8037 WHERE `entry`=19832;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8037,9923);
UPDATE `creature_template` SET `gossip_menu_id`=8068 WHERE `entry`=20110;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8068,9968);
UPDATE `creature_template` SET `gossip_menu_id`=8101 WHERE `entry`=20281;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8101,10019);
UPDATE `creature_template` SET `gossip_menu_id`=8128 WHERE `entry`=20551;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8128,10065);
UPDATE `creature_template` SET `gossip_menu_id`=8228 WHERE `entry`=20985;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8228,10229);
UPDATE `creature_template` SET `npcflag`=`npcflag`&~1 WHERE `entry` in (22980);
DELETE FROM `npc_gossip` WHERE `npc_guid` in (92747,92746,73773,61355,62057,61441,124632,125600,62018,60253,60585);
UPDATE `creature_template` SET `gossip_menu_id`=8388 WHERE `entry`=21118;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8388,10469);
UPDATE `creature_template` SET `gossip_menu_id`=8271 WHERE `entry`=21277;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8271,10300);
UPDATE `creature_template` SET `gossip_menu_id`=8303 WHERE `entry`=21460;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8303,10359);
UPDATE `creature_template` SET `gossip_menu_id`=8620 WHERE `entry`=22941;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8620,10800);
UPDATE `creature_template` SET `gossip_menu_id`=8657 WHERE `entry`=22995;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8657,10877);
UPDATE `creature_template` SET `gossip_menu_id`=8491 WHERE `entry`=22103;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8491,10603);
UPDATE `creature_template` SET `gossip_menu_id`=8506 WHERE `entry`=22215;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8506,10637);
UPDATE `creature_template` SET `gossip_menu_id`=8529 WHERE `entry`=22386;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8529,10667);
UPDATE `gossip_menu_option` SET `action_menu_id`='8757' WHERE `menu_id`=8679 AND `id`=0;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8757,11094);
UPDATE `creature_template` SET `npcflag`=`npcflag`&~1 WHERE `entry` in (6669,9080,9273,8587,6730,7867,2684,3096,3402,3693,3850,4419,4772,5784,6376,6548,17822,15042,10941,10668,10657,10303,9836,9620,9525,6576);
DELETE FROM `npc_gossip` WHERE `npc_guid` in (14659,41746,25188,7334,4535,25073,39986,7178,44227,51200,25159,8583,53198,7854,25172,51199,48529,26131,52117,52665,43201,6820,43206,25660,26535,45678);
UPDATE `creature_template` SET `npcflag`=`npcflag`&~1 WHERE `entry` in (3552,2137,3145,3481,5817);
DELETE FROM `npc_gossip` WHERE `npc_guid` in (17315,14372,17341,92415,35185,35744,39776);
UPDATE `creature_template` SET `gossip_menu_id`=8284 WHERE `entry`=21292;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8284,10323);
UPDATE `creature_template` SET `gossip_menu_id`=12670 WHERE `entry`=5750;
UPDATE creature_template SET gossip_menu_id = 9983 WHERE entry = 30586;
DELETE FROM `gossip_menu` WHERE `entry` = 50362;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50362;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50362;
DELETE FROM `npc_gossip` WHERE `npc_guid` in (118874,97898);
UPDATE `creature_template` SET `gossip_menu_id`=9493 WHERE `entry`=25257;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (9493,12777);
UPDATE `creature_template` SET `gossip_menu_id`=9459 WHERE `entry`=26564;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (9459,12718);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(9459, 0, 3, 'Train me.', 5, 16, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11017, 0, 0, 'Teleport to Light''s Hammer.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11017, 1, 0, 'Teleport to the Oratory of the Damned.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11017, 3, 0, 'Teleport to the Rampart of Skulls.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11017, 4, 0, 'Teleport to the Deathbringer''s Rise.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11017, 5, 0, 'Teleport to the Upper Spire.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11017, 6, 0, 'Teleport to Sindragosa''s Lair.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
# logical
(10996, 2, 0, 'I lost my ring.', 1, 1, 10998, 0, 0, 0, 0, NULL, 8, 24809, 0, 0, 0, 0, 0, 0, 0),
(10996, 3, 0, 'I lost my ring.', 1, 1, 10999, 0, 0, 0, 0, NULL, 8, 24808, 0, 0, 0, 0, 0, 0, 0),
(10996, 4, 0, 'I lost my ring.', 1, 1, 11000, 0, 0, 0, 0, NULL, 8, 24810, 0, 0, 0, 0, 0, 0, 0),
(10996, 5, 0, 'I lost my ring.', 1, 1, 11001, 0, 0, 0, 0, NULL, 8, 24811, 0, 0, 0, 0, 0, 0, 0),
(10996, 6, 0, 'I lost my ring.', 1, 1, 11002, 0, 0, 0, 0, NULL, 8, 25238, 0, 0, 0, 0, 0, 0, 0),
(10998, 0, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10998, 1, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10998, 2, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10998, 3, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10998, 4, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10999, 0, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10999, 1, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10999, 2, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10999, 3, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10999, 4, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11000, 0, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11000, 1, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11000, 2, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11000, 3, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11000, 4, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11001, 0, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11001, 1, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11001, 2, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11001, 3, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11001, 4, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11002, 0, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11002, 1, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11002, 2, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11002, 3, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11002, 4, 0, 'This does not happen again.', 1, 1, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=3650 WHERE `entry`=11627;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (3650,4449);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES 
(10998, 15299, 0, 0, 0, 0, 0, 0, 0),
(10999, 15299, 0, 0, 0, 0, 0, 0, 0),
(11001, 15299, 0, 0, 0, 0, 0, 0, 0),
(11002, 15299, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `mingold`=250000,`maxgold`=300000 WHERE `entry` IN(36612,37957,37958,37959);
UPDATE `creature_template` SET `mingold`=175000,`maxgold`=225000 WHERE `entry` IN (36626,37504,37505,37506);
UPDATE `creature_template` SET `mingold`=400000,`maxgold`=500000 WHERE `entry` IN (36627,38390,38549,38550);
UPDATE `creature_template` SET `mingold`=400000,`maxgold`=500000 WHERE `entry` IN (36678,38431,38585,38586);
UPDATE `creature_template` SET `mingold`=300000,`maxgold`=350000 WHERE `entry` IN (37955,38434,38435,38436);
UPDATE `creature_template` SET `mingold`=1330000,`maxgold`=1400000 WHERE `entry` IN (36853,38265,38266,38267);
UPDATE `creature_template` SET `mingold`=1300000,`maxgold`=1500000 WHERE `entry` IN (36597,39166,39167,39168);
DELETE FROM `npc_gossip` WHERE `npc_guid` in (41368);
UPDATE `creature_template` SET `npcflag`=`npcflag`&~1 WHERE `entry` in (8214);
DELETE FROM `npc_gossip` WHERE `npc_guid` in (53452);
UPDATE `creature_template` SET `gossip_menu_id`=11487 WHERE `entry`=7783;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (11487,1796);
DELETE FROM creature_template_addon WHERE entry =23467;
INSERT INTO creature_template_addon VALUES (23467,0,0,1,0,0,0,37816);
UPDATE `creature_template` SET `npcflag`=`npcflag`&~1 WHERE `entry` in (16599,12807,21382);
DELETE FROM `npc_gossip` WHERE `npc_guid` in (625,33119,26686,25179,13438,92752,92749,92751,2860,60279,43160);
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=9578 AND `id`=1;
UPDATE `creature_template` SET `gossip_menu_id`=11673 WHERE `entry`=2464;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (11673,16334);
UPDATE `creature_template` SET `gossip_menu_id`=11674 WHERE `entry`=2465;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (11674,16335);
UPDATE `creature_template` SET `gossip_menu_id`=11675 WHERE `entry`=2497;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (11675,16336);
UPDATE `creature_template` SET `gossip_menu_id`=4208 WHERE `entry`=1385;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (4208,5345);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(4208, 0, 3, 'Train me.', 5, 16, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1964, 0, 1, 'I want to browse your goods.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4356, 0, 3, 'Train me.', 5, 16, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4842, 0, 3, 'Train me.', 5, 16, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`=1582 WHERE `entry`=5814;
UPDATE `creature_template` SET `gossip_menu_id`=4842 WHERE `entry`=8153;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (4842,5335);
UPDATE `creature_template` SET `gossip_menu_id`=1964 WHERE `entry`=7854;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (1964,2368);
UPDATE `creature_template` SET `gossip_menu_id`=5630 WHERE `entry`=9118;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (5630,6741);
UPDATE `creature_template` SET `gossip_menu_id`=4356 WHERE `entry`=2399;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (4356,5575);
UPDATE `creature_template` SET `gossip_menu_id`=3049 WHERE `entry`=10918;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (3049,3758);
UPDATE `quest_template` SET `PrevQuestId`='2860' WHERE `entry` in (5145,5146,5148);
DELETE FROM `npc_gossip` WHERE `npc_guid` in (65309,65310);
UPDATE `creature_template` SET `gossip_menu_id`=7999 WHERE `entry`=19606;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7999,9853);
UPDATE `creature_template` SET `gossip_menu_id`=7748 WHERE `entry`=18385;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7748,9487);
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=8035 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=8035 AND `id`=1;
UPDATE `creature_template` SET `gossip_menu_id`=5181 WHERE `entry`=18385;
UPDATE `item_loot_template` SET `groupid`='1' WHERE `entry`=44751;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='40' WHERE `entry`=44751 AND `item`=17202;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='1' WHERE `entry`=44751 AND `item`=43962;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0' WHERE `entry`=44751 AND `item`=44749;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0' WHERE `entry`=44751 AND `item`=44750;
UPDATE `creature_template` SET `faction_A`='1801',`faction_H`='1801' WHERE `entry` in (13432,13429,23012);
UPDATE `creature_template` SET `faction_A`='35', `faction_H`='35' WHERE `entry` in (23065,13433);
DELETE FROM `creature_loot_template` WHERE `item` in (17404,17407,17406,17344);
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry` in (18967,18968);
REPLACE INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES ('34102', '3733', '0', '0', '0', '0', '0', '2', '1');
DELETE FROM `creature` WHERE `id`=29397;
UPDATE `creature_template_addon` SET `b2_0_sheath`='1' WHERE `entry`=28239;
DELETE FROM `creature` WHERE `guid` = 57998;
DELETE FROM `creature` WHERE `guid` = 57964;
DELETE FROM `creature` WHERE `guid` = 57963;
DELETE FROM `creature` WHERE `guid` = 57954;
DELETE FROM `creature` WHERE `guid` = 57948;
DELETE FROM `creature` WHERE `guid` = 57945;
DELETE FROM `creature` WHERE `guid` = 57931;
DELETE FROM `creature` WHERE `guid` = 57925;
DELETE FROM `creature` WHERE `guid` = 57922;
DELETE FROM `creature` WHERE `guid` = 57915;
DELETE FROM `creature` WHERE `guid` = 57908;
DELETE FROM `creature` WHERE `guid` = 57892;
DELETE FROM `creature` WHERE `guid` = 57886;
DELETE FROM `creature` WHERE `guid` = 57883;
DELETE FROM `creature` WHERE `guid` = 57881;
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES 
(57870, 0, 0, 1, 40, 0, 0, 22650),
(57891, 0, 0, 1, 40, 0, 0, 22650),
(57893, 0, 0, 1, 40, 0, 0, 22650),
(57894, 0, 0, 1, 40, 0, 0, 22650),
(57910, 0, 0, 1, 40, 0, 0, 22650),
(57916, 0, 0, 1, 40, 0, 0, 22650),
(57918, 0, 0, 1, 40, 0, 0, 22650),
(57926, 0, 0, 1, 40, 0, 0, 22650),
(57927, 0, 0, 1, 40, 0, 0, 22650),
(57929, 0, 0, 1, 40, 0, 0, 22650),
(57955, 0, 0, 1, 40, 0, 0, 22650),
(57976, 0, 0, 1, 40, 0, 0, 22650),
(57979, 0, 0, 1, 40, 0, 0, 22650),
(57981, 0, 0, 1, 40, 0, 0, 22650),
(57984, 0, 0, 1, 40, 0, 0, 22650),
(57999, 0, 0, 1, 40, 0, 0, 22650);
UPDATE `creature_template_addon` SET `b2_1_pvp_state`='16', `auras`='28305' WHERE `entry`=19668;
UPDATE `creature_template_addon` SET `auras`=22650 WHERE `entry` in (16977,16978,21058,22025,16905,16904,16906,21386,21385,21384,21450,20409,20410,20411,20415,20495,20934,19937,19881,19827,19826,19825,19546,19545,19544,19543,19873,19872,17712,17674,18872,18873);
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
('18559', '0', '0', '1', '16', '0', '0', '22650'),('18558', '0', '0', '1', '16', '0', '0', '22650'),('18557', '0', '0', '1', '16', '0', '0', '22650'),('18556', '0', '0', '1', '16', '0', '0', '22650'),('18501', '0', '0', '1', '16', '0', '0', '22650'),('18499', '0', '0', '1', '16', '0', '0', '22650'),('18500', '0', '0', '1', '16', '0', '0', '22650'),('18498', '0', '0', '1', '16', '0', '0', '22650'),('18503', '0', '0', '1', '16', '0', '0', '22650');
UPDATE `creature` SET `MovementType`='0' WHERE `guid`=58300;
UPDATE `creature` SET `MovementType`='0' WHERE `guid`=58284;
DELETE FROM `creature_movement` WHERE `id` = 58300;
DELETE FROM `creature_movement` WHERE `id` = 58284;
UPDATE `creature` SET `MovementType`='0' WHERE `guid`=58338;
UPDATE `creature` SET `MovementType`='0' WHERE `guid`=58256;
DELETE FROM `creature_movement` WHERE `id` = 58338;
DELETE FROM `creature_movement` WHERE `id` = 58256;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES (10212, 9902, 0, 4, 3733, 0, 0, 0, 0),(10212, 14192, 0, 4, 4637, 0, 0, 0, 0);
DELETE FROM `creature_movement_scripts` WHERE `id` = 361;
DELETE FROM `creature_movement_scripts` WHERE `id` = 365;
DELETE FROM `creature_movement_scripts` WHERE `id` = 374;
DELETE FROM `creature_movement_scripts` WHERE `id` = 383;
UPDATE creature SET position_x = '-155.827103', position_y = '964.547852', position_z = '54.283100', orientation = '3.186434' WHERE guid = '58256';
UPDATE creature SET position_x = '-333.631317', position_y = '961.646729', position_z = '54.296490', orientation = '3.145595' WHERE guid = '58284';
DELETE FROM `gossip_menu` WHERE `entry` in (4103,4104,4515,4516,4528,4529,4530,4652,5123,7357,7377,7467,7522,8110);
DELETE FROM `gossip_menu_option` WHERE menu_id in (4103,4104,4515,4516,4528,4529,4530,4652,5123,7357,7377,7467,7522,8110);
DELETE FROM `locales_gossip_menu_option` WHERE menu_id in (4103,4104,4515,4516,4528,4529,4530,4652,5123,7357,7377,7467,7522,8110);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(4103, 5005, 0, 14, 0, 64, 0, 0, 0),
(4103, 5006, 0, 14, 0, 1471, 0, 0, 0),
(4104, 5005, 0, 14, 0, 64, 0, 0, 0),
(4104, 5006, 0, 14, 0, 1471, 0, 0, 0),
(4515, 5007, 0, 14, 0, 64, 0, 0, 0),
(4515, 5008, 0, 14, 0, 1471, 0, 0, 0),
(4516, 5005, 0, 14, 0, 64, 0, 0, 0),
(4516, 5006, 0, 14, 0, 1471, 0, 0, 0),
(4528, 5005, 0, 14, 0, 64, 0, 0, 0),
(4528, 5006, 0, 14, 0, 1471, 0, 0, 0),
(4529, 5005, 0, 14, 0, 64, 0, 0, 0),
(4529, 5006, 0, 14, 0, 1471, 0, 0, 0),
(4530, 5005, 0, 14, 0, 64, 0, 0, 0),
(4530, 5006, 0, 14, 0, 1471, 0, 0, 0),
(4652, 5006, 0, 14, 0, 1471, 0, 0, 0),
(4652, 5005, 0, 14, 0, 64, 0, 0, 0),
(5123, 5005, 0, 14, 0, 64, 0, 0, 0),
(5123, 5006, 0, 14, 0, 1471, 0, 0, 0),
(7357, 8785, 0, 14, 0, 1471, 0, 0, 0),
(7357, 8786, 0, 14, 0, 64, 0, 0, 0),
(7377, 8828, 0, 14, 0, 1471, 0, 0, 0),
(7377, 8829, 0, 14, 0, 64, 0, 0, 0),
(7467, 9050, 0, 14, 0, 64, 0, 0, 0),
(7467, 8785, 0, 14, 0, 1471, 0, 0, 0),
(7522, 9122, 0, 14, 0, 64, 0, 0, 0),
(7522, 8785, 0, 14, 0, 1471, 0, 0, 0),
(8110, 10040, 0, 0, 0, 0, 0, 0, 0);
#
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(4103, 0, 3, 'Teach me the ways of the spirits.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 64, 0, 0, 0, 0, 0, 0),
(4103, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 64),
(4103, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 64, 0, 0, 0),
(4104, 0, 3, 'Teach me the ways of the spirits.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 64, 0, 0, 0, 0, 0, 0),
(4104, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 64),
(4104, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 64, 0, 0, 0),
(4515, 0, 3, 'Teach me the ways of the spirits.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 64, 0, 0, 0, 0, 0, 0),
(4515, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 64),
(4515, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 64, 0, 0, 0),
(4516, 0, 3, 'Teach me the ways of the spirits.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 64, 0, 0, 0, 0, 0, 0),
(4516, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 64),
(4516, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 64, 0, 0, 0),
(4528, 0, 3, 'Teach me the ways of the spirits.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 64, 0, 0, 0, 0, 0, 0),
(4528, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 64),
(4528, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 64, 0, 0, 0),
(4529, 0, 3, 'Teach me the ways of the spirits.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 64, 0, 0, 0, 0, 0, 0),
(4529, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 64),
(4529, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 64, 0, 0, 0),
(4530, 0, 3, 'Teach me the ways of the spirits.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 64, 0, 0, 0, 0, 0, 0),
(4530, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 64),
(4530, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 64, 0, 0, 0),
(4652, 0, 3, 'I''d like to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 64, 0, 0, 0, 0, 0, 0),
(4652, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 64),
(4652, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 64, 0, 0, 0),
(5123, 0, 3, 'Teach me the ways of the spirits.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 64, 0, 0, 0, 0, 0, 0),
(5123, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 64),
(5123, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 64, 0, 0, 0),
(7357, 0, 3, 'I''d like to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 64, 0, 0, 0, 0, 0, 0),
(7357, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 64),
(7357, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 64, 0, 0, 0),
(7377, 0, 3, 'I''d like to train.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 64, 0, 0, 0, 0, 0, 0),
(7377, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 64),
(7377, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 64, 0, 0, 0),
(7377, 3, 0, 'Tell me about your past, forecaster...', 1, 1, 7502, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7467, 0, 3, 'Teach me the ways of the spirits.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 64, 0, 0, 0, 0, 0, 0),
(7467, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 64),
(7467, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 64, 0, 0, 0),
(7522, 0, 3, 'Teach me the ways of the spirits.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 64, 0, 0, 0, 0, 0, 0),
(7522, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 64),
(7522, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 64, 0, 0, 0),
(8110, 0, 3, 'Teach me the ways of the spirits.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 64, 0, 0, 0, 0, 0, 0),
(8110, 2, 0, 'Learn about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 64),
(8110, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 64, 0, 0, 0);
DELETE FROM `creature_loot_template` WHERE `entry` = 20512;
DELETE FROM `creature_loot_template` WHERE `entry` = 21065;
UPDATE `creature_template` SET `lootid`='0', `pickpocketloot`='0' WHERE `entry`=20512;
UPDATE `creature_template` SET `lootid`='0', `pickpocketloot`='0' WHERE `entry`=21065;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-50' WHERE `item`=29338;
DELETE FROM `pickpocketing_loot_template` WHERE `entry` = 20512;
DELETE FROM `pickpocketing_loot_template` WHERE `entry` = 21065;
DELETE FROM `creature` WHERE `guid` = 126616;
DELETE FROM `creature` WHERE `guid` = 39762;
UPDATE `quest_template` SET `RequiredRaces`='0' WHERE `entry` in (6606,969);
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('175324', '14174', '0', 'Frostmaul Shards');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14174', '5', 'Frostmaul Shards');
UPDATE `quest_template` SET `RewRepFaction1`='0', `RewRepValueId1`='0' WHERE `entry`=969;
UPDATE `gossip_menu_option` SET `option_text`='I wish to know about Dual Talent Specialization.' WHERE `option_text` LIKE 'Learn about Dual Talent Specialization.';
UPDATE `creature_template` SET `trainer_class`='0' WHERE `entry` in (26330,16387,26332,26327,2870,4207,22006,26329,22005,26328,313,26326,22008,26331);
UPDATE `creature_template` SET `trainer_type`='0' WHERE `entry`=16672;
UPDATE `creature_template` SET `trainer_type`='0' WHERE `entry`=16674;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(4486, 538, 0, 14, 0, 128, 0, 0, 0),(4486, 539, 0, 14, 0, 1407, 0, 0, 0);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES 
(4486, 0, 3, 'I am interested in mage training.', 5, 16, 0, 0, 0, 0, 0, NULL, 14, 0, 128, 0, 0, 0, 0, 0, 0),
(4486, 2, 0, 'I wish to know about Dual Talent Specialization.', 1, 1, 10371, 0, 0, 0, 0, NULL, 15, 40, 1, 17, 63680, 1, 14, 0, 128),
(4486, 1, 0, 'I wish to unlearn my talents.', 1, 1, 4461, 0, 0, 0, 0, NULL, 15, 10, 1, 14, 0, 128, 0, 0, 0);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(2703, 3375, 0, 0, 0, 0, 0, 0, 0),(2703, 3377, 0, 8, 975, 0, 0, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id` in (2703);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(2703, 0, 15, 16351, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Create Cache of Mau''ari');
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(2703, 1, 0, 'What is E''ko?', 1, 1, -1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2703, 0, 0, 'How do I use the Cache of Mau''ari?', 1, 1, -1, 0, 2703, 0, 0, NULL, 8, 975, 0, 24, 12384, 1, 0, 0, 0);
delete from creature_linking_template where entry IN (20481);
insert into creature_linking_template values (20481, 554, 19221, 4112);
delete from spell_script_target where entry = 34742;
insert into spell_script_target values (34742, 1, 19949);
delete from spell_target_position where id in (34727,34730,34731,34732,34733,34734,34735,34736,34737,34739);
insert into spell_target_position values
(34727, 553, 26, 419, -25, 0),
(34730, 553, 84.83, 362.09, -28.1, 0),
(34731, 553, 56, 428, -25, 0),
(34732, 553, 46.65, 360.87, -27.71, 0),
(34733, 553, 94, 416, -27, 0),
(34734, 553, 94, 376, -27, 0),
(34736, 553, 66, 353, -26, 0),
(34739, 553, 33, 366, -25, 0);
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('39048', '0', '0', '1', '0', '0', '0', '37090');
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('27989', '0', '0', '1', '0', '0', '0', '50487');
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('19913', '0', '0', '1', '0', '0', '0', '39312');
UPDATE `creature_template` SET `AIName`='' WHERE `entry` in (27263,27264,27265);
DELETE FROM `creature_ai_scripts` WHERE `id` = 2726351;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2726451;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2726551;
UPDATE `creature_template` SET `flags_extra`='2' WHERE `entry`=5042;
UPDATE `creature_template` SET `npcflag`=`npcflag`&~1 WHERE `entry` in (13420,13430,22229,22234,23064,23065,16350,12956,9459,14720,14736,14757,14905,15070,14348,7869,7871);
DELETE FROM `npc_gossip` WHERE `npc_guid` in (125582,125581,66020,69115,39867,39866,67805,24933,6764,81179,1015,12584,12431,39810,42308,544,11615);
UPDATE `creature_template` SET `npcflag`='0' WHERE `entry`=14401;
DELETE FROM `npc_trainer` WHERE `entry` = 14401;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='100' WHERE `item`=44956;
UPDATE `creature_template` SET `faction_A`='874', `faction_H`='874' WHERE `entry`=11696;
UPDATE `creature_onkill_reputation` SET `MaxStanding1`='6' WHERE `creature_id`=7157;
UPDATE `creature_onkill_reputation` SET `MaxStanding1`='6' WHERE `creature_id`=7156;
UPDATE `creature_onkill_reputation` SET `MaxStanding1`='6' WHERE `creature_id`=7158;
DELETE FROM `creature` WHERE `guid` = 48507;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES ('10847', '0', '0', 'Start the battle.', '1', '1', '-1', '0', '0', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0');
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES ('8891', '0', '0', 'Call the Headless Horseman.', '1', '1', '-1', '0', '0', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0');
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES ('11389', '0', '0', 'Disturb the stone and summon Lord Ahune.', '1', '1', '-1', '0', '0', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0');
REPLACE INTO game_event_creature_data (guid,entry_id,modelid,equipment_id,spell_start,spell_end,event) VALUES (125532, 0, 21934, 0, 0, 0, 2);
UPDATE `skinning_loot_template` SET `maxcount`='5' WHERE `item` in (15416,15412,15414,15415,8165);
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '10' WHERE `item` = 8165;
DELETE FROM `creature_loot_template` WHERE `item` = 8165;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '25' WHERE `entry` = 9096 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '25' WHERE `entry` = 10083 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '25' WHERE `entry` = 10321 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '25' WHERE `entry` = 10363 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '25' WHERE `entry` = 10366 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '25' WHERE `entry` = 10371 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '25' WHERE `entry` = 10372 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '25' WHERE `entry` = 10683 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '10' WHERE `entry` = 7040 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '10' WHERE `entry` = 7041 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '10' WHERE `entry` = 7044 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '10' WHERE `entry` = 7045 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '10' WHERE `entry` = 7046 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '10' WHERE `entry` = 9461 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '10' WHERE `entry` = 10447 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '10' WHERE `entry` = 10814 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '25' WHERE `entry` = 12739 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '5' WHERE `entry` = 7047 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '5' WHERE `entry` = 7048 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '5' WHERE `entry` = 7049 AND `item` = 15416;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '5' WHERE `entry` = 10442 AND `item` = 15416;
UPDATE creature SET position_x = '-2632.955322', position_y = '-5062.047363', position_z = '34.526554', orientation = '2.793388' WHERE guid = '124249';
UPDATE creature SET position_x = '-2633.055908', position_y = '-5040.113770', position_z = '33.827396', orientation = '4.752185' WHERE guid = '29555';
UPDATE creature SET position_x = '-2623.295410', position_y = '-5054.210449', position_z = '29.387373', orientation = '2.803617' WHERE guid = '29567';
UPDATE creature SET position_x = '-2634.956299', position_y = '-5063.160156', position_z = '25.672487', orientation = '2.644181' WHERE guid = '29539';
UPDATE creature SET position_x = '-2649.522217', position_y = '-5059.541992', position_z = '25.591122', orientation = '3.981714' WHERE guid = '29511';
UPDATE creature SET position_x = '-2660.001465', position_y = '-5050.353516', position_z = '23.036898', orientation = '0.220440' WHERE guid = '124250';
UPDATE creature SET position_x = '-2639.125732', position_y = '-5049.027344', position_z = '22.741447', orientation = '2.313527' WHERE guid = '29543';
UPDATE creature SET position_x = '-2633.415283', position_y = '-5052.655273', position_z = '33.827488', orientation = '3.731173' WHERE guid = '29548';
UPDATE creature SET position_x = '-2646.333252', position_y = '-5053.029785', position_z = '33.827488', orientation = '5.495178' WHERE guid = '29541';
UPDATE `creature` SET `id`='15591',`spawntimesecs`='300' WHERE `guid` in (29543,29511,29539,29567,29555,29548,29541);
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`) VALUES
(29295,15553,1,1,1,0,0,-2684.88,-5043.92,21.9691,0.897453,300,0,0,3052,0),
(29227,15591,1,1,1,0,0,-2690.24,-5042.32,21.7785,6.01589,300,0,0,24416,0),
(29228,15591,1,1,1,0,0,-2680.98,-5044.98,21.9384,3.04473,300,0,0,24416,0);
DELETE FROM `creature` WHERE `guid` = 5402;
DELETE FROM `creature` WHERE `guid` = 5542;
DELETE FROM `creature` WHERE `guid` = 33202;
DELETE FROM `creature` WHERE `guid` = 49725;
DELETE FROM `creature` WHERE `guid` = 49802;
DELETE FROM `creature` WHERE `guid` = 4014;
DELETE FROM `creature` WHERE `guid` = 47965;
DELETE FROM `creature` WHERE `guid` = 91546;
DELETE FROM `creature` WHERE `guid` = 51518;
DELETE FROM `creature` WHERE `guid` = 51593;
DELETE FROM `creature` WHERE `guid` = 51601;
DELETE FROM `creature` WHERE `guid` = 51612;
DELETE FROM `creature` WHERE `guid` = 51622;
DELETE FROM `creature` WHERE `guid` = 51728;
DELETE FROM `creature` WHERE `guid` = 51733;
DELETE FROM `creature` WHERE `guid` = 51764;
DELETE FROM `creature` WHERE `guid` = 13503;
DELETE FROM `creature` WHERE `guid` = 75056;
DELETE FROM `creature` WHERE `guid` = 75055;
DELETE FROM `creature` WHERE `guid` = 75054;
DELETE FROM `creature` WHERE `guid` = 75053;
DELETE FROM `creature` WHERE `guid` = 75052;
DELETE FROM `creature` WHERE `guid` = 53830;
DELETE FROM `creature` WHERE `guid` = 53815;
DELETE FROM `creature` WHERE `guid` = 53844;
DELETE FROM `creature` WHERE `guid` = 53845;
DELETE FROM `creature` WHERE `guid` = 53800;
DELETE FROM `creature` WHERE `guid` = 53814;
DELETE FROM `creature` WHERE `guid` = 53816;
DELETE FROM `creature` WHERE `guid` = 53801;

# NeatElves ACID 309b -> 309c
UPDATE db_version SET `creature_ai_version` = 'ACID 3.0.9c \'Streamlined Perfection\' - Full Release for MaNGOS (3.3.5a Client)';
REPLACE INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
('1512601','15126','4','0','100','0','0','0','0','0','11','22911','1','1','0','0','0','0','0','0','0','0','Rutherford Twing - Cast Charge on Aggro'),
('1512701','15127','4','0','100','0','0','0','0','0','11','22911','1','1','0','0','0','0','0','0','0','0','Samuel Hawke - Cast Charge on Aggro'),
('139702','1397','1','0','50','1','1000','1000','600000','600000','11','324','0','1','0','0','0','0','0','0','0','0','Frostmane Seer - Cast Lightning Shield on Spawn'),
('139713','1397','27','0','100','1','324','1','15000','30000','11','324','0','1','0','0','0','0','0','0','0','0','Frostmane Seer - Cast Lightning Shield on Spawn'),
('1526001','15260','0','0','100','1','3000','3000','5000','5000','11','24957','4','0','0','0','0','0','0','0','0','0','Demented Druid Spirit - Cast Moonfire'),
('1530201','15302','0','0','100','1','8000','8000','30000','30000','11','24840','0','0','0','0','0','0','0','0','0','0','Shade of Taerar - Cast Poison Cloud'),
('1530202','15302','0','0','100','1','12000','12000','12000','12000','11','24839','0','0','0','0','0','0','0','0','0','0','Shade of Taerar - Cast Acid Breath'),
('853401','8534','11','0','100','0','0','0','0','0','11','16574','0','1','0','0','0','0','0','0','0','0','Putrid Gargoyle - Cast Putrid Bile on Spawn'),
('1189701','11897','0','0','100','1','2000','4000','8000','11000','11','8281','0','0','0','0','0','0','0','0','0','0','Duskwing - Cast Sonic Burst'),
('3109802','31098','9','0','100','1','0','5','7000','9000','11','15496','1','0','0','0','0','0','0','0','0','0','Terrifying Abomination - Cast Cleave'),
('1771601','17716','9','0','100','0','0','30','0','0','11','22120','1','0','0','0','0','0','0','0','0','0','Sangrias Stillblade - Cast Charge'),
('221504','2215','0','0','100','1','20000','30000','30000','45000','11','19134','1','1','0','0','0','0','0','0','0','0','High Executor Darthalia - Cast Frightening Shout'),
('246401','2464','0','0','100','1','18700','28500','18700','28500','11','6253','1','0','0','0','0','0','0','0','0','0','Commander Aggro\'gosh - Cast Backhand'),
('262401','2624','4','0','100','0','0','0','0','0','1','-1226','0','0','0','0','0','0','0','0','0','0','Gazban - Say on Aggro'),
('262402','2624','0','0','100','1','6100','12800','7200','15700','11','5403','1','0','0','0','0','0','0','0','0','0','Gazban - Cast Crash of Waves'),
('167402','1674','0','0','100','1','7000','21000','30000','45000','11','3237','4','33','0','0','0','0','0','0','0','0','Rot Hide Gnoll - Cast Curse of Thule'),
('167502','1675','0','0','100','0','7000','14000','30000','45000','11','3237','4','33','0','0','0','0','0','0','0','0','Rot Hide Mongrel - Cast Curse of Thule'),
('175302','1753','0','0','100','1','4000','9000','30000','45000','11','3237','4','33','0','0','0','0','0','0','0','0','Maggot Eye - Cast Curse of Thule'),
('3227101','32271','0','0','100','1','7000','14000','12000','17000','11','26073','0','0','0','0','0','0','0','0','0','0','Legion Overlord - Cast Fire Nova'),
('103701','1037','0','0','100','1','9100','14700','19000','38900','11','3019','0','0','0','0','0','0','0','0','0','0','Dragonmaw Battlemaster - Cast Frenzy'),
('392103','3921','9','0','100','1','0','5','23900','38400','11','25712','1','1','0','0','0','0','0','0','0','0','Thistlefur Ursa - Cast Heroic Strike'),
('496701','4967','0','0','100','1','1000','1000','1800000','1800000','11','7120','0','1','0','0','0','0','0','0','0','0','Archmage Tervosh - Cast Proudmoore\'s Defense'),
('1423201','14232','4','0','100','0','0','0','0','0','11','43128','1','6','0','0','0','0','0','0','0','0','Dart - Cast Raptor Charge on Aggro'),
('2363701','23637','9','0','100','1','0','5','9000','13000','11','11972','1','0','0','0','0','0','0','0','0','0','Deserter Lieutenant - Cast Shield Bash'),
('593201','5932','9','0','100','1','0','8','15000','19000','11','16508','1','0','0','0','0','0','0','0','0','0','Taskmaster Whipfang - Cast Intimidating Roar'),
('1191502','11915','9','0','100','1','0','20','9000','15000','11','13281','4','0','0','0','0','0','0','0','0','0','Gogger Rock Keeper - Cast Earth Shock'),
('731802','7318','0','0','65','1','2000','2000','6000','6000','11','12161','1','0','0','0','0','0','0','0','0','0','Rageclaw - Cast Maul'),
('327501','3275','0','0','80','1','12000','12000','7000','7000','11','11976','1','0','0','0','0','0','0','0','0','0','Kolkar Marauder - Cast Strike'),
('339303','3393','2','0','70','1','30','0','27500','27500','11','19134','4','0','0','0','0','0','0','0','0','0','Captain Fairmount - Cast Frightening Shout When Below 30% HP'),
('952402','9524','0','0','100','1','10000','10000','4000','4000','11','11976','1','0','0','0','0','0','0','0','0','0','Kolkar Invader - Cast Strike'),
('952403','9524','0','0','40','0','0','0','15000','15000','11','8014','4','32','0','0','0','0','0','0','0','0','Kolkar Invader - Cast Tetanus'),
('651701','6517','11','0','100','0','0','0','0','0','11','14178','1','0','0','0','0','0','0','0','0','0','Tar Beast - Cast Sticky Tar'),
('651801','6518','11','0','100','0','0','0','0','0','11','14178','1','0','0','0','0','0','0','0','0','0','Tar Lurker - Cast Sticky Tar'),
('651901','6519','11','0','100','0','0','0','0','0','11','14178','1','0','0','0','0','0','0','0','0','0','Tar Lord - Cast Sticky Tar'),
('652701','6527','11','0','100','0','0','0','0','0','11','14178','1','0','0','0','0','0','0','0','0','0','Tar Creeper - Cast Sticky Tar'),
('1833801','18338','11','0','100','0','0','0','0','0','1','-1206','-1207','0','0','0','0','0','0','0','0','0','Highlord Kruul - Yell on Spawn'),
('1833802','18338','4','0','100','0','0','0','0','0','1','-1208','-1209','-1210','0','0','0','0','0','0','0','0','Highlord Kruul - Yell on Aggro'),
('1833803','18338','5','0','100','1','0','0','0','0','1','-1211','0','0','11','21054','0','0','0','0','0','0','Highlord Kruul - Cast Capture Soul and Yell on Kill'),
('1833804','18338','0','0','100','0','60000','60000','0','0','11','21340','0','1','0','0','0','0','0','0','0','0','Highlord Kruul - Cast Berserk'),
('1833805','18338','0','0','100','1','30000','30000','18000','18000','11','21066','4','0','0','0','0','0','0','0','0','0','Highlord Kruul - Cast Void Bolt'),
('1833806','18338','0','0','100','1','25000','25000','30000','30000','11','21063','4','0','0','0','0','0','0','0','0','0','Highlord Kruul - Cast Twisted Reflection'),
('1833807','18338','0','0','100','1','20000','20000','12000','12000','11','23931','0','0','0','0','0','0','0','0','0','0','Highlord Kruul - Cast Thunderclap'),
('1833808','18338','0','0','100','1','14000','14000','10000','10000','11','20677','1','0','0','0','0','0','0','0','0','0','Highlord Kruul - Cast Cleave'),
('1833809','18338','0','0','100','1','8000','8000','45000','45000','11','33533','0','2','11','33533','0','2','11','33533','0','2','Highlord Kruul - Cast Summon Infernaling'),
('1833810','18338','0','0','100','1','5000','10000','10000','30000','11','21341','0','0','0','0','0','0','0','0','0','0','Highlord Kruul - Cast Shadow Bolt Volley'),
('1833811','18338','6','0','100','0','0','0','0','0','1','-1212','0','0','0','0','0','0','0','0','0','0','Highlord Kruul - Yell on Death'), -- used on despawn (not sure where to put it)
('1952901','19529','9','0','100','1','0','5','12000','15000','11','9080','1','1','0','0','0','0','0','0','0','0','Stormspire Nexus-Guard - Cast Hamstring'),
('1975401','19754','1','0','100','1','1000','1000','15000','30000','11','38107','1','0','0','0','0','0','0','0','0','0','Deathforge Tinkerer - Create Mine OCC'),
('1853301','18533','4','0','100','0','0','0','0','0','11','32924','0','0','1','-1220','0','0','0','0','0','0','Luanga the Imprisoner - Cast Power of Kran\'aish and Yell on Aggro'),
('1853302','18533','0','0','100','1','10000','12000','18000','21000','11','32907','1','0','0','0','0','0','0','0','0','0','Luanga the Imprisoner - Cast Arakkoa Blast'),
('1853303','18533','0','0','100','1','15000','17000','27000','32000','11','6535','0','0','0','0','0','0','0','0','0','0','Luanga the Imprisoner - Cast Lightning Cloud'),
('1853304','18533','0','0','100','1','3000','5000','16000','19000','11','11824','4','0','0','0','0','0','0','0','0','0','Luanga the Imprisoner - Cast Shock'),
('1853305','18533','0','0','100','1','6000','8000','11000','14000','11','12058','4','0','0','0','0','0','0','0','0','0','Luanga the Imprisoner - Cast Chain Lightning'),
('2209501','22095','0','0','100','1','15000','20000','32000','38000','11','39000','0','0','0','0','0','0','0','0','0','0','Infested Root-Walker - Cast Regrowth'),
('2209502','22095','6','0','100','0','0','0','0','0','11','39130','0','0','0','0','0','0','0','0','0','0','Infested Root-Walker - Summon Wood Mites on Death'),
('2230701','22307','0','0','100','1','5000','9000','32000','38000','11','15548','1','0','0','0','0','0','0','0','0','0','Rotting Forest-Rager - Cast Thunderclap'),
('2230702','22307','6','0','100','0','0','0','0','0','11','39130','0','0','0','0','0','0','0','0','0','0','Rotting Forest-Rager - Summon Wood Mites on Death'),
('2316302','23163','0','0','100','1','1000','1000','15000','21000','11','40542','1','1','0','0','0','0','0','0','0','0','Gezzarak the Huntress - Cast Warped Armor'),
('1808810','18088','0','0','100','1','6000','8000','16000','22000','11','34787','4','1','0','0','0','0','0','0','0','0','Bloodscale Enchantress - Cast Freezing Circle'),
('1812001','18120','2','0','100','0','50','0','0','0','11','14895','1','0','0','0','0','0','0','0','0','0','Ango\'rosh Mauler - Cast Overpower'),
('2571701','25717','9','0','100','1','0','5','7000','13000','11','11977','4','32','0','0','0','0','0','0','0','0','Coldarra Scalesworn - Cast Rend'),
('2571702','25717','0','0','100','1','7000','11000','12000','16000','11','12748','0','1','0','0','0','0','0','0','0','0','Coldarra Scalesworn - Cast Frost Nova'),
('2724402','27244','6','0','100','0','0','0','0','0','11','49581','0','7','0','0','0','0','0','0','0','0','Emerald Skytalon - Cast Circle of Life: Summon Reincarnated Skytalon on Death'),
('2768010','27680','0','0','100','1','5000','6000','15000','18000','11','51897','4','1','0','0','0','0','0','0','0','0','Dahlia Suntouch - Cast Banshee Screech'),
('2949004','29490','0','0','80','1','6000','7000','10000','10000','11','20822','4','0','0','0','0','0','0','0','0','0','Captain Hartford - Cast Frostbolt'),
('2935001','29350','0','0','100','1','4000','7000','12000','16000','11','53437','1','0','0','0','0','0','0','0','0','0','Torseg the Exiled - Cast Backbreaker'),
('2935002','29350','0','0','100','1','9000','14000','16000','20000','11','33707','0','1','0','0','0','0','0','0','0','0','Torseg the Exiled - Cast War Stomp'),
('2902815','29028','0','27','100','0','46000','46000','0','0','11','23775','1','16','28','0','23775','0','1','-954','0','0','Prophet of Akali - Cast and Remove Stun Forever and Say'),
('3002301','30023','4','0','100','0','0','0','0','0','11','55948','0','1','0','0','0','0','0','0','0','0','Korrak the Bloodrager - Cast Grow on Aggro'),
('3002305','30023','2','0','100','0','90','0','0','0','11','55948','0','1','0','0','0','0','0','0','0','0','Korrak the Bloodrager - Cast Grow at 90% HP'),
('3002306','30023','2','0','100','0','80','0','0','0','11','55948','0','1','0','0','0','0','0','0','0','0','Korrak the Bloodrager - Cast Grow at 80% HP'),
('3002307','30023','2','0','100','0','70','0','0','0','11','55948','0','1','0','0','0','0','0','0','0','0','Korrak the Bloodrager - Cast Grow at 70% HP'),
('3002308','30023','2','0','100','0','60','0','0','0','11','55948','0','1','0','0','0','0','0','0','0','0','Korrak the Bloodrager - Cast Grow at 60% HP'),
('3002309','30023','2','0','100','0','50','0','0','0','11','55948','0','1','0','0','0','0','0','0','0','0','Korrak the Bloodrager - Cast Grow at 50% HP'),
('3002310','30023','2','0','100','0','40','0','0','0','11','55948','0','1','0','0','0','0','0','0','0','0','Korrak the Bloodrager - Cast Grow at 40% HP'),
('3002311','30023','2','0','100','0','30','0','0','0','11','55948','0','1','0','0','0','0','0','0','0','0','Korrak the Bloodrager - Cast Grow at 30% HP'),
('3002312','30023','2','0','100','0','20','0','0','0','11','55948','0','1','0','0','0','0','0','0','0','0','Korrak the Bloodrager - Cast Grow at 20% HP'),
('3002313','30023','2','0','100','0','10','0','0','0','11','55948','0','1','0','0','0','0','0','0','0','0','Korrak the Bloodrager - Cast Grow at 10% HP'),
('1847801','18478','0','0','100','7','10000','10000','10000','30000','11','16856','1','0','0','0','0','0','0','0','0','0','Avatar of the Martyred - Cast Mortal Strike'),
('1847802','18478','0','0','100','7','5000','7000','12000','18000','11','16145','1','0','0','0','0','0','0','0','0','0','Avatar of the Martyred - Cast Sunder Armor'),
('1920301','19203','0','0','100','3','4000','5000','4000','5000','11','33526','4','0','0','0','0','0','0','0','0','0','Syth Fire Elemental (Normal) - Cast Flame Buffet'),
('1920302','19203','0','0','100','5','4000','5000','4000','5000','11','38141','4','0','0','0','0','0','0','0','0','0','Syth Fire Elemental (Heroic) - Cast Flame Buffet'),
('1920401','19204','0','0','100','3','4000','5000','4000','5000','11','33528','4','0','0','0','0','0','0','0','0','0','Syth Frost Elemental (Normal) - Cast Frost Buffet'),
('1920402','19204','0','0','100','5','4000','5000','4000','5000','11','38142','4','0','0','0','0','0','0','0','0','0','Syth Frost Elemental (Heroic) - Cast Frost Buffet'),
('1920501','19205','0','0','100','3','4000','5000','4000','5000','11','33527','4','0','0','0','0','0','0','0','0','0','Syth Arcane Elemental (Normal) - Cast Arcane Buffet'),
('1920502','19205','0','0','100','5','4000','5000','4000','5000','11','38138','4','0','0','0','0','0','0','0','0','0','Syth Arcane Elemental (Heroic) - Cast Arcane Buffet'),
('1920601','19206','0','0','100','3','4000','5000','4000','5000','11','33529','4','0','0','0','0','0','0','0','0','0','Syth Shadow Elemental (Normal) - Cast Shadow Buffet'),
('1920602','19206','0','0','100','5','4000','5000','4000','5000','11','38143','4','0','0','0','0','0','0','0','0','0','Syth Shadow Elemental (Heroic) - Cast Shadow Buffet'),
('1863203','18632','12','0','100','7','20','0','12000','18000','11','7160','6','1','0','0','0','0','0','0','0','0','Cabal Executioner - Cast Execute when Target is at 20% HP'),
('1863501','18635','0','0','100','3','8000','10000','12000','15000','11','33480','4','0','0','0','0','0','0','0','0','0','Cabal Deathsworn (Normal) - Cast Black Cleave'),
('1863502','18635','0','0','100','5','8000','10000','12000','15000','11','38226','4','0','0','0','0','0','0','0','0','0','Cabal Deathsworn (Heroic) - Cast Black Cleave'),
('1920901','19209','0','0','100','3','7000','11000','11000','15000','11','33480','4','0','0','0','0','0','0','0','0','0','Summoned Cabal Deathsworn (Normal) - Cast Black Cleave'),
('1920902','19209','0','0','100','5','7000','11000','11000','15000','11','38226','4','0','0','0','0','0','0','0','0','0','Summoned Cabal Deathsworn (Heroic) - Cast Black Cleave'),
('3028404','30284','0','0','100','7','20000','23000','24000','27000','11','19134','4','0','0','0','0','0','0','0','0','0','Bonegrinder - Frightenning Shout'),
('3041812','30418','0','0','100','5','10000','13000','11000','13000','11','59152','0','1','0','0','0','0','0','0','0','0','Bound Air Elemental (Heroic) - Forked Lightning'),
('2921301','29213','0','0','100','3','5000','8000','5000','10000','11','53602','1','0','0','0','0','0','0','0','0','0', 'Anub\'ar Darter (Normal) - Cast Dart'),
('2921302','29213','0','0','100','5','5000','8000','5000','10000','11','59349','1','0','0','0','0','0','0','0','0','0', 'Anub\'ar Darter (Heroic) - Cast Dart'),
('2921303','29213','7','0','100','6','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0', 'Anub\'ar Darger - Forced Despawn on Evade'),
('2921401','29214','11','0','100','6','0','0','0','0','11','53611','0','0','0','0','0','0','0','0','0','0', 'Anub\'ar Assassin - Cast Assassin Visual on Spawned'),
('2921402','29214','0','0','100','7','5000','8000','5000','10000','11','52540','1','0','0','0','0','0','0','0','0','0', 'Anub\'ar Assassin - Cast Assassin Backstab'),
('2921403','29214','7','0','100','6','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0', 'Anub\'ar Assassin - Forced Despawn on Evade'),
('2921601','29216','0','0','100','7','5000','8000','7000','10000','11','52532','1','0','0','0','0','0','0','0','0','0', 'Anub\'ar Guardian - Cast Strike'),
('2921602','29216','0','0','100','3','3000','7000','4000','9000','11','53618','1','0','0','0','0','0','0','0','0','0', 'Anub\'ar Guardian (Normal) - Cast Sunder Armor'),
('2921603','29216','0','0','100','5','3000','7000','4000','9000','11','59350','1','0','0','0','0','0','0','0','0','0', 'Anub\'ar Guardian (Heroic) - Cast Sunder Armor'),
('2921604','29216','7','0','100','6','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0', 'Anub\'ar Guardian - Forced Despawn on Evade'),
('2921701','29217','0','0','100','3','5000','8000','5000','10000','11','53617','4','0','0','0','0','0','0','0','0','0', 'Anub\'ar Venomancer (Normal) - Cast Poison Bolt'),
('2921702','29217','0','0','100','5','5000','8000','5000','10000','11','59359','4','0','0','0','0','0','0','0','0','0', 'Anub\'ar Venomancer (Heroic) - Cast Poison Bolt'),
('2921703','29217','0','0','100','3','9000','14000','10000','15000','11','53616','0','0','0','0','0','0','0','0','0','0', 'Anub\'ar Venomancer (Normal) - Cast Poison Bolt Volley'),
('2921704','29217','0','0','100','5','9000','14000','10000','15000','11','59360','0','0','0','0','0','0','0','0','0','0', 'Anub\'ar Venomancer (Heroic) - Cast Poison Bolt Volley'),
('2921705','29217','7','0','100','6','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0', 'Anub\'ar Venomancer - Forced Despawn on Evade'),
('902701','9027','0','0','100','3','22000','22000','15000','15000','11','15708','1','0','0','0','0','0','0','0','0','0','Gorosh the Dervish - Cast Mortal Strike'),
('902702','9027','0','0','100','3','12000','12000','15000','15000','11','13736','0','0','0','0','0','0','0','0','0','0','Gorosh the Dervish - Cast Whirlwind'),
('902703','9027','0','0','100','3','30000','30000','45000','45000','11','21049','0','0','0','0','0','0','0','0','0','0','Gorosh the Dervish - Cast Bloodlust'),
('902800','9028','0','0','100','3','12000','12000','8000','8000','11','6524','0','0','0','0','0','0','0','0','0','0','Grizzle - Cast Ground Tremor'),
('902801','9028','2','0','100','3','51','0','15000','15000','11','8269','0','0','1','-106','0','0','0','0','0','0','Grizzle - Cast Frenzy'),
('903410','9034','0','0','100','3','9000','14000','40000','48000','11','12040','0','1','0','0','0','0','0','0','0','0','Hate\'rel - Cast Shadow Shield'),
('903411','9034','0','0','100','3','14000','17000','15000','20000','11','14033','4','1','0','0','0','0','0','0','0','0','Hate\'rel - Cast Mana Burn'),
('950201','9502','0','0','100','3','12000','12000','10000','10000','11','15588','0','0','0','0','0','0','0','0','0','0','Phalanx - Cast Thunderclap'),
('950202','9502','0','0','100','3','15000','15000','10000','10000','11','14099','1','0','0','0','0','0','0','0','0','0','Phalanx - Cast Mighty Blow'),
('950203','9502','2','0','100','3','51','0','15000','15000','11','15285','0','0','0','0','0','0','0','0','0','0','Phalanx - Cast Fireball Volley'),
('993801','9938','4','0','100','2','0','0','0','0','1','-1194','0','0','0','0','0','0','0','0','0','0','Magmus - Yell on Aggro'),
('993802','9938','0','0','100','3','8000','8000','6000','6000','11','15668','0','0','0','0','0','0','0','0','0','0','Magmus - Cast Fiery Burst'),
('993803','9938','2','0','100','3','51','0','8000','8000','11','15593','0','0','0','0','0','0','0','0','0','0','Magmus - Cast War Stomp'),
('919601','9196','0','0','100','3','12000','12000','18000','18000','11','10101','1','0','0','0','0','0','0','0','0','0','Highlord Omokk - Cast Knock Away'),
('919602','9196','2','0','100','2','20','0','0','0','11','8269','0','0','1','-106','0','0','0','0','0','0','Highlord Omokk - Cast Frenzy'),
('923601','9236','0','0','100','3','2000','3000','45000','45000','11','16098','0','0','0','0','0','0','0','0','0','0','Shadow Hunter Vosh\'gajin - Cast Curse of Blood'),
('923602','9236','0','0','100','3','8000','8000','15000','15000','11','16708','5','0','0','0','0','0','0','0','0','0','Shadow Hunter Vosh\'gajin - Cast Hex'),
('923701','9237','0','0','100','3','8000','8000','6000','6000','11','15618','1','0','0','0','0','0','0','0','0','0','War Master Voone - Cast Snap Kick'),
('923702','9237','0','0','100','3','14000','14000','12000','12000','11','15284','1','0','0','0','0','0','0','0','0','0','War Master Voone - Cast Cleave'),
('923703','9237','0','0','100','3','20000','20000','14000','14000','11','10966','1','0','0','0','0','0','0','0','0','0','War Master Voone - Cast Uppercut'),
('923704','9237','0','0','100','3','12000','12000','10000','10000','11','15708','1','0','0','0','0','0','0','0','0','0','War Master Voone - Cast Mortal Strike'),
('923705','9237','0','0','100','3','32000','32000','16000','16000','11','15615','1','0','0','0','0','0','0','0','0','0','War Master Voone - Cast Pummel'),
('923706','9237','0','0','100','3','1000','1000','8000','8000','11','16075','4','0','0','0','0','0','0','0','0','0','War Master Voone - Cast Throw Axe'),
('973601','9736','0','0','100','3','1000','2000','1000','2000','11','16496','4','0','0','0','0','0','0','0','0','0','Quartermaster Zigris - Cast Shoot'),
('973602','9736','0','0','100','3','16000','16000','14000','14000','11','16497','4','0','0','0','0','0','0','0','0','0','Quartermaster Zigris - Cast Stun Bomb'),
('973603','9736','0','0','100','3','8000','10000','12000','14000','11','15609','4','0','0','0','0','0','0','0','0','0','Quartermaster Zigris - Cast Hooked Net'),
('973604','9736','0','0','100','3','25000','30000','35000','40000','11','15504','0','0','0','0','0','0','0','0','0','0','Quartermaster Zigris - Cast Drink Healing Potion'),
('1022001','10220','0','0','100','3','8000','10000','12000','14000','11','13738','1','0','0','0','0','0','0','0','0','0','Halycon - Cast Rend'),
('1022002','10220','0','0','100','3','5000','9000','10000','13000','11','3391','1','0','0','0','0','0','0','0','0','0','Halycon - Cast Thrash'),
('1022003','10220','6','0','100','2','0','0','0','0','32','10268','0','20','0','0','0','0','0','0','0','0','Halycon - Summon Gizrul the Slavener on Death'),
('1036301','10363','0','0','100','3','17000','17000','20000','20000','11','15548','0','0','0','0','0','0','0','0','0','0','General Drakkisath - Cast Thunderclap'),
('1036302','10363','0','0','100','3','8000','8000','8000','8000','11','15284','1','0','0','0','0','0','0','0','0','0','General Drakkisath - Cast Cleave'),
('1036303','10363','0','0','100','3','6000','6000','17000','20000','11','16419','4','0','0','0','0','0','0','0','0','0','General Drakkisath - Cast Flamestrike'),
('1036304','10363','0','0','100','3','15000','15000','18000','18000','11','16805','5','0','0','0','0','0','0','0','0','0','General Drakkisath - Cast Conflagration'),
('1036305','10363','0','0','100','3','4000','5000','9000','11000','11','12097','1','0','0','0','0','0','0','0','0','0','General Drakkisath - Cast Pierce Armor'),
('1036306','10363','2','0','100','3','51','0','30000','45000','11','16789','0','0','0','0','0','0','0','0','0','0','General Drakkisath - Cast Rage'),
('1037401','10374','0','0','100','3','15000','15000','15000','15000','11','16104','1','0','0','0','0','0','0','0','0','0','Spire Spider - Crystallize'),
('1037402','10374','6','0','100','2','0','0','0','0','11','16103','0','2','0','0','0','0','0','0','0','0','Spire Spider - Cast Summon Spire Spiderling on Death'),
('1042901','10429','0','0','100','3','20000','20000','18000','18000','11','13736','0','0','0','0','0','0','0','0','0','0','Warchief Rend Blackhand - Cast Whirlwind'),
('1042902','10429','0','0','100','3','5000','5000','10000','10000','11','15284','1','0','0','0','0','0','0','0','0','0','Warchief Rend Blackhand - Cast Cleave'),
('1042903','10429','0','0','100','3','9000','9000','16000','16000','11','15708','1','0','0','0','0','0','0','0','0','0','Warchief Rend Blackhand - Cast Mortal Strike'),
('1042904','10429','2','0','100','2','20','0','0','0','11','8269','0','0','1','-106','0','0','0','0','0','0','Warchief Rend Blackhand - Cast Frenzy'),
('1043001','10430','11','0','100','2','0','0','0','0','11','15506','0','0','0','0','0','0','0','0','0','0','The Beast - Cast Immolate on Spawn'),
('1043002','10430','0','0','100','3','23000','23000','20000','20000','11','14100','0','0','0','0','0','0','0','0','0','0','The Beast - Cast Terrifying Roar'),
('1043003','10430','0','0','100','3','20000','20000','10000','10000','11','16785','0','0','0','0','0','0','0','0','0','0','The Beast - Cast Flamebreak'),
('1043004','10430','0','0','100','3','2000','5000','8000','10000','11','16788','4','0','0','0','0','0','0','0','0','0','The Beast - Cast Fireball'),
('1043005','10430','6','0','100','2','0','0','0','0','11','16710','0','2','0','0','0','0','0','0','0','0','The Beast - Cast Finkle is Einhorn on Death'),
('1059601','10596','0','0','100','3','20000','20000','15000','15000','11','16104','0','0','0','0','0','0','0','0','0','0','Mother Smolderweb - Cast Crystallize'),
('1059602','10596','0','0','100','3','10000','10000','12500','12500','11','16468','0','0','0','0','0','0','0','0','0','0','Mother Smolderweb - Cast Mother\'s Milk'),
('1059603','10596','6','0','100','2','0','0','0','0','11','16103','0','2','0','0','0','0','0','0','0','0','Mother Smolderweb - Cast Summon Spire Spiderling on Death'),
('1817902','18179','0','0','100','6','5000','5000','0','0','11','30687','1','0','0','0','0','0','0','0','0','0','Mennu Fire Nova Totem - Cast Explode and Self Kill'),
('1817903','18179','8','0','100','7','0','127','0','0','11','30687','1','0','0','0','0','0','0','0','0','0','Mennu Fire Nova Totem - Cast Explode When Hit By Spell and Self Kill'),
('1791701','17917','0','0','100','3','3000','6000','7000','12000','11','34449','0','0','0','0','0','0','0','0','0','0','Coilfang Water Elemental (Normal) - Cast Water Bolt Volley'),
('1791702','17917','0','0','100','5','3000','6000','7000','12000','11','37924','0','0','0','0','0','0','0','0','0','0','Coilfang Water Elemental (Heroic) - Cast Water Bolt Volley'),
('1810501','18105','4','0','100','6','0','0','0','0','11','8876','0','0','0','0','0','0','0','0','0','0','Ghaz\'an - Cast Thrash on Aggro'),
('3465711','34657','2','1','100','7','50','0','30000','60000','11','68340','1','1','0','0','0','0','0','0','0','0','Jaelyne Evensong - Cast Disengage at 50% HP'),
('3470113','34701','0','0','100','7','10000','25000','20000','30000','11','67534','1','1','0','0','0','0','0','0','0','0','Colosos - Cast Hex of Mending'),
('1144502','11445','0','0','100','3','4200','9600','6100','16300','11','22574','1','0','0','0','0','0','0','0','0','0','Gordok Captain - Cast Dark Strike'),
('1430801','14308','9','0','100','2','8','25','0','0','11','22911','1','1','0','0','0','0','0','0','0','0','Ferra - Cast Charge'),
('1432205','14322','0','0','100','3','7400','13700','20300','27400','11','22833','0','1','0','0','0','0','0','0','0','0','Stomper Kreeg - Cast Booze Spit'),
('1450201','14502','4','0','100','2','0','0','0','0','11','16636','1','0','0','0','0','0','0','0','0','0','Xorothian Dreadsteed - Cast Berserker Charge on Aggro'),
('2790901','27909','6','0','100','6','0','0','0','0','11','49960','0','2','0','0','0','0','0','0','0','0','Darkweb Victim - Summon Random Drakkari on Death'),
('1747703','17477','9','13','100','3','0','40','3400','4800','11','15242','1','0','0','0','0','0','0','0','0','0','dHellfire Imp (Normal) - Cast Fireball (Phase 1)'),
('1749103','17491','9','5','100','7','0','5','4300','8700','11','34969','1','0','0','0','0','0','0','0','0','0','Laughing Swkull Rogue - Cast Poison (Phase 1)'),
('1766901','17669','9','0','100','7','0','5','4000','6000','11','30639','1','0','0','0','0','0','0','0','0','0','Rabid Warhound - dCast Carnivorous Bite'),
('1220101','12201','0','0','100','3','8000','13000','20000','25000','11','21909','0','0','0','0','0','0','0','0','0','0','Princess Theradras - Cast Dust Field'),
('1220102','12201','0','0','100','3','2000','3000','8000','10000','11','21832','4','0','0','0','0','0','0','0','0','0','Princess Theradras - Cast Boulder'),
('1220103','12201','0','0','100','3','20000','25000','20000','25000','11','21869','0','0','0','0','0','0','0','0','0','0','Princess Theradras - Cast Repulsive Gaze'),
('1220104','12201','0','0','100','3','5000','6000','18000','20000','11','3391','0','0','0','0','0','0','0','0','0','0','Princess Theradras - Cast Thrash'),
('1220105','12201','6','0','100','2','0','0','0','0','32','12238','0','21','0','0','0','0','0','0','0','0','Princess Theradras - Summon Zaetar\'s Spirit on Death'),
('1220301','12203','0','0','100','3','0','1000','60000','60000','11','21808','0','1','0','0','0','0','0','0','0','0','Landslide - Cast Landslide'),
('1220302','12203','0','0','100','3','2000','3000','8000','9000','11','5568','0','0','0','0','0','0','0','0','0','0','Landslide - Cast Trample'),
('1220303','12203','0','0','100','3','8000','10000','18000','20000','11','18670','1','0','0','0','0','0','0','0','0','0','Landslide - Cast Knock Away'),
('1222501','12225','0','0','100','3','4000','5000','7000','9000','11','21807','4','0','0','0','0','0','0','0','0','0','Celebras the Cursed - Cast Wrath'),
('1222502','12225','0','0','100','3','7000','10000','15000','20000','11','12747','1','0','0','0','0','0','0','0','0','0','Celebras the Cursed - Cast Entangling Roots'),
('1222503','12225','0','0','100','3','15000','15000','20000','20000','11','21968','0','1','0','0','0','0','0','0','0','0','Celebras the Cursed - Cast Corrupt Forces of Nature'),
('1222504','12225','0','0','100','3','50000','60000','50000','60000','11','21793','0','0','0','0','0','0','0','0','0','0','Celebras the Cursed - Cast Twisted Tranquility'),
('1222505','12225','6','0','100','2','0','0','0','0','12','13716','0','600000','0','0','0','0','0','0','0','0','Celebras the Cursed - Summon Celebras the Redeemed on Death'),
('735800','7358','4','0','100','2','0','0','0','0','1','-1221','0','0','0','0','0','0','0','0','0','0','Amnennar the Coldbringer - Yell on Aggro'),
('735801','7358','5','0','100','2','0','0','0','0','1','-1225','0','0','0','0','0','0','0','0','0','0','Amnennar the Coldbringer - Yell on Killed Unit'),
('735802','7358','0','0','100','3','8000','8000','12000','12000','11','13009','1','0','0','0','0','0','0','0','0','0','Amnennar the Coldbringer - Cast Amnennar\'s Wrath'),
('735803','7358','0','0','100','3','1000','1000','8000','8000','11','15530','4','0','0','0','0','0','0','0','0','0','Amnennar the Coldbringer - Cast Frostbolt'),
('735804','7358','0','0','100','3','10000','15000','15000','15000','11','15531','0','0','0','0','0','0','0','0','0','0','Amnennar the Coldbringer - Cast Frost Nova'),
('735805','7358','2','0','100','2','66','0','0','0','11','12642','1','0','1','-1222','0','0','0','0','0','0','Amnennar the Coldbringer - Cast Summon Frost Spectres and Yell at 66%'),
('735806','7358','2','0','100','2','50','0','0','0','1','-1224','0','0','0','0','0','0','0','0','0','0','Amnennar the Coldbringer - Yell at 50%'),
('735807','7358','2','0','100','2','33','0','0','0','11','12642','1','0','1','-1223','0','0','0','0','0','0','Amnennar the Coldbringer - Cast Summon Frost Spectres and Yell at 33%'),
('397401','3974','4','0','100','2','0','0','0','0','11','17164','0','0','1','-1205','0','0','0','0','0','0','Houndmaster Loksey - Cast Summon Scarlet Hound and Yell on Aggro'),
('397402','3974','0','0','100','3','20000','20000','20000','20000','11','6742','0','0','0','0','0','0','0','0','0','0','Houndmaster Loksey - Cast Bloodlust'),
('398301','3983','4','0','100','2','0','0','0','0','1','-1198','0','0','0','0','0','0','0','0','0','0','Interrogator Vishas - Yell on Aggro'),
('398302','3983','5','0','100','3','0','0','0','0','1','-1201','0','0','0','0','0','0','0','0','0','0','Interrogator Vishas - Yell on Kill Unit'),
('398303','3983','2','0','100','2','60','0','0','0','1','-1199','0','0','0','0','0','0','0','0','0','0','Interrogator Vishas - Yell at 60%'),
('398304','3983','2','0','100','2','30','0','0','0','1','-1200','0','0','0','0','0','0','0','0','0','0','Interrogator Vishas - Yell at 30%'),
('398305','3983','0','0','100','3','5000','5000','5000','15000','11','2767','1','0','0','0','0','0','0','0','0','0','Interrogator Vishas - Cast Shadow Word Pain'),
('454201','4542','0','0','100','3','10000','10000','25000','25000','11','8282','0','0','0','0','0','0','0','0','0','0','High Inquisitor Fairbanks - Cast Curse of Blood'),
('454202','4542','0','0','100','3','30000','30000','30000','30000','11','15090','4','0','0','0','0','0','0','0','0','0','High Inquisitor Fairbanks - Cast Dispel Magic'),
('454203','4542','0','0','100','3','40000','40000','40000','40000','11','12096','5','0','0','0','0','0','0','0','0','0','High Inquisitor Fairbanks - Cast Fear'),
('454204','4542','2','0','100','3','25','0','30000','30000','11','12039','0','0','0','0','0','0','0','0','0','0','High Inquisitor Fairbanks - Cast Heal'),
('454205','4542','0','0','100','3','30000','30000','30000','30000','11','8399','0','0','0','0','0','0','0','0','0','0','High Inquisitor Fairbanks - Cast Sleep'),
('454206','4542','2','0','100','2','25','0','0','0','11','11647','0','0','0','0','0','0','0','0','0','0','High Inquisitor Fairbanks - Cast Power Word: Shield'),
('454301','4543','4','0','100','2','0','0','0','0','1','-1202','0','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Yell on Aggro'),
('454302','4543','5','0','100','3','0','0','0','0','1','-1204','0','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Yell on Kill Unit'),
('454303','4543','0','0','100','3','40000','40000','40000','40000','11','12470','0','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Cast Fire Nova'),
('454304','4543','0','0','100','3','2000','4000','4000','7000','11','9613','4','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Cast Shadow Bolt'),
('454305','4543','0','0','100','3','8000','8000','30000','30000','11','8814','0','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Cast Flame Spike'),
('454306','4543','2','0','100','2','35','0','0','0','1','-1203','0','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Yell at 35%'),
('649001','6490','0','0','100','3','30000','30000','30000','30000','11','5137','1','0','0','0','0','0','0','0','0','0','Azshir the Sleepless - Cast Call of the Grave'),
('649002','6490','0','0','100','3','20000','20000','20000','20000','11','7399','1','0','0','0','0','0','0','0','0','0','Azshir the Sleepless - Cast Terrify'),
('649003','6490','2','0','100','3','50','0','20000','20000','11','9373','4','0','0','0','0','0','0','0','0','0','Azshir the Sleepless - Cast Soul Siphon'),
('1469301','14693','0','0','100','3','45000','45000','45000','45000','11','28873','1','0','0','0','0','0','0','0','0','0','Scorn - Cast Lich Slap'),
('1469302','14693','0','0','100','3','30000','30000','20000','20000','11','8398','0','0','0','0','0','0','0','0','0','0','Scorn - Cast Frostbolt Volley'),
('1469303','14693','0','0','100','3','30000','30000','20000','20000','11','17313','4','0','0','0','0','0','0','0','0','0','Scorn - Cast Mind Flay'),
('1469304','14693','0','0','100','3','30000','30000','15000','15000','11','15531','0','0','0','0','0','0','0','0','0','0','Scorn - Cast Frost Nova'),
('1143901','11439','0','0','100','3','2000','8000','5000','8000','11','15284','1','0','0','0','0','0','0','0','0','0','Illusion of Jandice Barov - Cast Cleave'),
('1451601','14516','0','0','100','3','5000','7000','17000','19000','11','22644','0','0','0','0','0','0','0','0','0','0','Death Knight Darkreaver - Cast Blood Leech'),
('1451602','14516','0','0','100','3','5000','6000','8000','10000','11','15284','1','0','0','0','0','0','0','0','0','0','Death Knight Darkreaver - Cast Cleave'),
('1451603','14516','0','0','100','3','6000','7000','12000','14000','11','17393','4','0','0','0','0','0','0','0','0','0','Death Knight Darkreaver - Cast Shadow Bolt'),
('1451604','14516','0','0','100','3','18000','21000','32000','35000','11','7645','5','0','0','0','0','0','0','0','0','0','Death Knight Darkreaver - Cast Dominate Mind'),
('1451605','14516','6','0','100','2','0','0','0','0','11','23261','0','2','0','0','0','0','0','0','0','0','Death Knight Darkreaver - Cast Summon Darkreaver\'s Fallen Charger on Death'),
('1611801','16118','4','0','100','2','0','0','0','0','11','27688','0','0','0','0','0','0','0','0','0','0','Kormok - Cast Bone Shield on Aggro'),
('1611802','16118','0','0','100','3','10000','12000','15000','15000','11','20741','0','0','0','0','0','0','0','0','0','0','Kormok - Cast Shadow Bolt Volley'),
('1611803','16118','0','0','100','3','15000','15000','12000','15000','11','27687','0','0','0','0','0','0','0','0','0','0','Kormok - Cast Summon Bone Minions'),
('1611804','16118','0','0','100','3','20000','25000','25000','30000','11','27689','0','0','0','0','0','0','0','0','0','0','Kormok - Cast Bloodlust'),
('1611805','16118','2','0','100','2','26','0','0','0','11','27695','0','0','0','0','0','0','0','0','0','0','Kormok - Cast Summon Bone Mages at 26%'),
('1611806','16118','2','0','100','2','20','0','0','0','11','8269','0','0','1','-106','0','0','0','0','0','0','Kormok - Cast Frenzy at 20%'),
('1612001','16120','0','0','100','3','1000','2000','8000','10000','11','15043','4','0','0','0','0','0','0','0','0','0','Bone Mage - Cast Frostbolt'),
('1612002','16120','0','0','100','3','15000','17000','20000','22000','11','15063','0','0','0','0','0','0','0','0','0','0','Bone Mage - Cast Frost Nova'),
('1612003','16120','0','0','100','3','7000','10000','14000','16000','11','16102','4','0','0','0','0','0','0','0','0','0','Bone Mage - Cast Flamestrike'),
('1612004','16120','0','0','100','3','5000','7000','8000','11000','11','17145','0','0','0','0','0','0','0','0','0','0','Bone Mage - Cast Blast Wave'),
('3627201','36272','0','0','100','3','5000','10000','5000','10000','14','-100','0','0','13','100','4','0','0','0','0','0','Apothecary Frye - Reset Threat and attack new target'),
('3629601','36296','0','0','100','3','2000','3000','3000','4000','11','68607','1','0','0','0','0','0','0','0','0','0','Apothecary Hummel - Cast Alluring Perfume Spray'),
('3629602','36296','0','0','100','3','20000','25000','30000','35000','11','68821','0','0','0','0','0','0','0','0','0','0','Apothecary Hummel - Cast Chain Reaction'),
('3656501','36565','0','0','100','3','2000','3000','3000','4000','11','68948','1','0','0','0','0','0','0','0','0','0','Apothecary Baxter - Cast Irresistible Cologne Spray'),
('3656502','36565','0','0','100','3','15000','15000','30000','35000','11','68821','0','0','0','0','0','0','0','0','0','0','Apothecary Baxter - Cast Chain Reaction'),
('3656801','36568','9','0','100','2','3','5','0','0','11','68957','0','0','0','0','0','0','0','0','0','0','Crazed Apothecary - Cast Unstable Reaction on Range Check'),
('1044001','10440','0','0','100','3','12000','12000','10000','25000','11','15708','4','0','0','0','0','0','0','0','0','0','Baron Rivendare - Cast Mortal Strike'),
('1044002','10440','0','0','100','3','8000','8000','7000','17000','11','15284','1','0','0','0','0','0','0','0','0','0','Baron Rivendare - Cast Cleave'),
('1044003','10440','0','0','100','3','5000','5000','10000','10000','11','17393','4','0','0','0','0','0','0','0','0','0','Baron Rivendare - Cast Shadowbolt'),
('1044004','10440','0','0','100','3','30000','30000','45000','45000','11','17473','0','2','0','0','0','0','0','0','0','0','Baron Rivendare - Cast Raise Dead'),
('1044005','10440','8','0','100','3','17473','-1','45000','45000','11','17475','4','2','11','17476','4','2','11','17477','4','2','Baron Rivendare - Cast Raise Dead on Raise Dead Spellhit (1,2,3)'),
('1044006','10440','8','0','100','3','17473','-1','45000','45000','11','17478','4','2','11','17479','4','2','11','17480','4','2','Baron Rivendare - Cast Raise Dead on Raise Dead Spellhit (4,5,6)'),
('1043501','10435','4','0','100','2','0','0','0','0','11','16792','0','0','0','0','0','0','0','0','0','0','Magistrate Barthilas - Cast Furious Anger on Aggro'),
('1043502','10435','0','0','100','3','20000','20000','15000','15000','11','16793','1','0','0','0','0','0','0','0','0','0','Magistrate Barthilas - Cast Draining Blow'),
('1043503','10435','0','0','100','3','15000','15000','15000','15000','11','10887','0','0','0','0','0','0','0','0','0','0','Magistrate Barthilas - Cast Crowd Pummel'),
('1043504','10435','0','0','100','3','10000','10000','20000','20000','11','14099','1','0','0','0','0','0','0','0','0','0','Magistrate Barthilas - Cast Mighty Blow'),
('1043505','10435','6','0','100','2','0','0','0','0','3','0','3637','0','0','0','0','0','0','0','0','0','Magistrate Barthilas - Change model id to Human on Death'),
('1043701','10437','0','0','100','3','15000','15000','20000','20000','11','4962','5','0','0','0','0','0','0','0','0','0','Nerub\'enkan - Cast Encasing Webs'),
('1043702','10437','0','0','100','3','5000','7000','12000','14000','11','6016','1','0','0','0','0','0','0','0','0','0','Nerub\'enkan - Cast Pierce Armor'),
('1043703','10437','0','0','100','3','0','0','4000','5000','11','31602','4','0','0','0','0','0','0','0','0','0','Nerub\'enkan - Cast Crypt Scarabs'),
('1043704','10437','0','0','100','3','10000','10000','17000','20000','11','17235','0','0','0','0','0','0','0','0','0','0','Nerub\'enkan - Cast Raise Undead Scarab'),
('1043901','10439','0','0','100','3','3000','4000','7000','8000','11','5568','0','0','0','0','0','0','0','0','0','0','Ramstein the Gorger - Cast Trample'),
('1043902','10439','0','0','100','3','12000','12000','10000','10000','11','17307','1','0','0','0','0','0','0','0','0','0','Ramstein the Gorger - Cast Trample'),
('1080801','10808','11','0','100','2','0','0','0','0','1','-1197','0','0','0','0','0','0','0','0','0','0','Timmy the Cruel - Yell on Spawn'),
('1080802','10808','0','0','100','3','10000','10000','15000','15000','11','17470','1','0','0','0','0','0','0','0','0','0','Timmy the Cruel - Cast Ravenous Claw'),
('1080803','10808','2','0','100','2','20','0','0','0','11','8599','0','0','1','-106','0','0','0','0','0','0','Timmy the Cruel - Cast Enrage at 20% Health'),
('1114301','11143','4','0','100','2','0','0','0','0','1','-1195','0','0','0','0','0','0','0','0','0','0','Postmaster Malown - Yell on Aggro'),
('1114302','11143','5','0','100','3','0','0','0','0','1','-1196','0','0','0','0','0','0','0','0','0','0','Postmaster Malown - Yell on Unit Kill'),
('1114303','11143','0','0','100','3','5000','8000','5000','8000','11','6253','1','0','0','0','0','0','0','0','0','0','Postmaster Malown - Cast Backhand'),
('1114304','11143','0','0','100','3','15000','17000','15000','17000','11','12542','4','0','0','0','0','0','0','0','0','0','Postmaster Malown - Cast Fear'),
('1114305','11143','0','0','100','3','18000','20000','18000','20000','11','12741','4','0','0','0','0','0','0','0','0','0','Postmaster Malown - Cast Curse of Weakness'),
('1114306','11143','0','0','100','3','20000','23000','20000','23000','11','13338','4','0','0','0','0','0','0','0','0','0','Postmaster Malown - Cast Curse of Tongues'),
('843802','8438','9','0','100','3','0','40','5000','8000','11','12471','1','1','0','0','0','0','0','0','0','0','Hakkari Bloodkeeper - Cast Shadow Bolt'),
('2088103','20881','0','0','100','3','6000','10000','16000','22000','11','36887','0','0','0','0','0','0','0','0','0','0','Unbound Devastator (Normal) - Cast Deafening Roar'),
('2146601','21466','0','0','100','3','10000','10000','10000','10000','11','36929','4','0','0','0','0','0','0','0','0','0','Harbinger Skyriss (Normal) - Cast Mind Rend'),
('2146602','21466','0','0','100','5','10000','10000','10000','10000','11','39021','4','0','0','0','0','0','0','0','0','0','Harbinger Skyriss (Heroic) - Cast Mind Rend'),
('2146701','21467','0','0','100','3','10000','10000','10000','10000','11','36929','4','0','0','0','0','0','0','0','0','0','Harbinger Skyriss (Normal) - Cast Mind Rend'),
('2146702','21467','0','0','100','5','10000','10000','10000','10000','11','39021','4','0','0','0','0','0','0','0','0','0','Harbinger Skyriss (Heroic) - Cast Mind Rend'),
('1971001','19710','4','0','100','6','0','0','0','0','1','-1213','0','0','0','0','0','0','0','0','0','0','Gatewatcher Iron-Hand - Yell on Aggro'),
('1971002','19710','5','0','100','7','0','0','0','0','1','-1216','-1217','0','0','0','0','0','0','0','0','0','Gatewatcher Iron-Hand - Random Yell on Unit Kill'),
('1971003','19710','0','0','100','7','15000','20000','35000','50000','11','35311','0','0','0','0','0','0','0','0','0','0','Gatewatcher Iron-Hand - Cast Stream of Machine Fluid'),
('1971004','19710','0','0','100','3','25000','25000','20000','28000','11','35322','0','0','0','0','0','0','0','0','0','0','Gatewatcher Iron-Hand (Normal) - Cast Shadow Power'),
('1971005','19710','0','0','100','5','25000','25000','20000','28000','11','39193','0','0','0','0','0','0','0','0','0','0','Gatewatcher Iron-Hand (Heroic) - Cast Shadow Power'),
('1971006','19710','0','0','100','7','10000','14000','15000','20000','11','35326','1','0','0','0','0','0','0','0','0','0','Gatewatcher Iron-Hand - Cast Hammer Punch'),
('1971007','19710','0','0','100','3','45000','45000','30000','30000','11','35327','0','0','1','-1219','0','0','0','0','0','0','Gatewatcher Iron-Hand (Normal) - Cast Jackhammer and Yell'),
('1971008','19710','0','0','100','5','45000','45000','30000','30000','11','39194','0','0','1','-1219','0','0','0','0','0','0','Gatewatcher Iron-Hand (Heroic) - Cast Jackhammer and Yell'),
('1971009','19710','0','0','80','7','45000','45000','30000','30000','1','-1214','-1215','0','0','0','0','0','0','0','0','0','Gatewatcher Iron-Hand - Random Yell'),
('1971010','19710','6','0','100','6','0','0','0','0','1','-1218','0','0','0','0','0','0','0','0','0','0','Gatewatcher Iron-Hand - Yell on Death'),
('2048101','20481','0','0','100','7','500','500','500','500','11','35278','0','0','0','0','0','0','0','0','0','0','Raging Flames - Cast Raging Flames'),
('2048102','20481','0','0','100','3','25000','25000','25000','25000','11','35268','0','0','0','0','0','0','0','0','0','0','Raging Flames (Normal) - Cast  Inferno'),
('2048103','20481','0','0','100','5','25000','25000','25000','25000','11','39346','0','0','0','0','0','0','0','0','0','0','Raging Flames (Heroic) - Cast  Inferno'),
('2679604','26796','0','0','100','5','13000','15000','45000','55000','11','19134','1','0','0','0','0','0','0','0','0','0','Commander Stoutbeard - Cast Frightening Shout'),
('2679804','26798','0','0','100','5','13000','15000','45000','55000','11','19134','1','0','0','0','0','0','0','0','0','0','Commander Kolurg - Cast Frightening Shout'),
('3066312','30663','9','0','100','5','0','8','9000','15000','11','59245','0','1','0','0','0','0','0','0','0','0','Azure Binder (Heroic) - Cast Arcane Explosion'),
('3100711','31007','9','0','100','5','0','8','9000','15000','11','59245','0','1','0','0','0','0','0','0','0','0','Azure Binder (Heroic) - Cast Arcane Explosion'),
('2858008','28580','9','0','100','7','0','5','6000','9000','11','61507','1','0','0','0','0','0','0','0','0','0','Hardened Steel Skycaller - Cast Disengage'),
('2896107','28961','2','0','100','6','50','0','0','0','11','19134','1','0','0','0','0','0','0','0','0','0','Titanium Siegebreaker - Cast Frightening Shout at 50% HP'),
('2667014','26670','7','0','100','6','0','0','0','0','22','1','0','0','40','1','0','0','0','0','0','0','Ymirjar Flesh Hunter - Set Phase 1 and Set Melee Weapon Model on Evade'),
('2668502','26685','0','0','100','3','13000','20000','17000','25000','11','48133','4','1','0','0','0','0','0','0','0','0','Massive Jormungar (Normal) - Cast Poison Breath'),
('2668503','26685','0','0','100','5','13000','20000','17000','25000','11','59271','4','1','0','0','0','0','0','0','0','0','Massive Jormungar (Heroic) - Cast Poison Breath'),
('3352401','33524','0','0','100','7','2000','3000','2000','3000','11','63420','1','0','0','0','0','0','0','0','0','0','Saronite Animus - Cast Profound Darkness'),     
('3112505','31125','0','0','100','3','46000','46000','46000','46000','11','58666','1','0','0','0','0','0','0','0','0','0','Archavon the Stone Watcher (10-Man Normal) - Impale'),
('3112506','31125','0','0','100','3','46000','46000','46000','46000','11','60882','1','0','0','0','0','0','0','0','0','0','Archavon the Stone Watcher (25-Man Normal) - Impale'),
('3112507','31125','0','0','100','7','15000','15000','15000','15000','11','58678','4','0','0','0','0','0','0','0','0','0','Archavon the Stone Watcher - Cast Rock Shards'),
('3112508','31125','0','0','100','6','300000','300000','0','0','11','47008','0','1','0','0','0','0','0','0','0','0','Archavon the Stone Watcher - Cast Berserk After 5 Minutes'),
('1498601','14986','11','0','100','2','0','0','0','0','11','24307','0','0','0','0','0','0','0','0','0','0','Shade of Jin\'do - Cast Shade of Jin\'do Passive on Spawn'),
('1498602','14986','0','0','100','3','1000','1000','2000','2000','11','19460','1','0','0','0','0','0','0','0','0','0','Shade of Jin\'do - Cast Shadow Shock'),
('1496501','14965','0','0','100','3','2000','2000','5000','5000','11','22334','0','0','0','0','0','0','0','0','0','0','Frenzied Bloodseeker Bat - Cast Bomb'),
('1504101','15041','0','0','100','3','3000','3000','3000','3000','11','24312','0','0','0','0','0','0','0','0','0','0','Spawn of Mar\'li - Cast Level Up'),
('1508201','15082','0','0','100','3','15000','20000','25000','35000','11','24646','0','0','13','-50','1','0','13','50','5','0','Gri\'lek - Cast Avatar and switch target'),
('1508202','15082','0','0','100','3','8000','16000','12000','16000','11','6524','0','0','0','0','0','0','0','0','0','0','Gri\'lek - Cast Ground Tremor'),
('1508501','15085','0','0','100','3','5000','10000','15000','20000','11','25033','0','0','0','0','0','0','0','0','0','0','Wushoolay - Cast Lightning Cloud'),
('1508502','15085','0','0','100','3','8000','16000','12000','16000','11','24819','4','0','0','0','0','0','0','0','0','0','Wushoolay - Cast Lightning Wave'),
('1511401','15114','0','0','100','3','8000','8000','7000','11000','11','16099','0','0','0','0','0','0','0','0','0','0','Gahz\'ranka - Cast Frost Breath'),
('1511402','15114','0','0','100','3','17000','17000','12000','20000','11','24326','0','0','0','0','0','0','0','0','0','0','Gahz\'ranka - Cast Gahz\'ranka Slam'),
('1511403','15114','0','0','100','3','25000','25000','22000','32000','11','22421','4','0','14','-100','0','0','0','0','0','0','Gahz\'ranka - Cast Massive Geyser and Reset Threat'),
('1194704','11947','2','0','70','3','30','0','25000','35000','11','19134','1','0','0','0','0','0','0','0','0','0','Captain Galvangar - Cast Frightening Shout When Below 30% HP');
REPLACE INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES
('-888','I knew that you would come.','0','1','0','31161','0'),
('-889','You have some fight in you. I\'m impressed.','0','1','0','31161','0'),
('-890','Welcome to the world of the unliving!','0','1','0','31161','0'),
('-891','Well fought...','0','1','0','31161','0'),
('-1194','Emperor Thaurissan does not wish to be disturbed! Turn back now or face your doom, weak mortals!','0','1','0','9938','0'),
('-1195','Prepare to be Malowned!','0','1','0','11143','0'),
('-1196','You just got MALOWNED!','0','1','0','11143','0'),
('-1197','TIMMY!','0','1','0','10808','0'),
('-1198','Tell me... tell me everything!','5847','1','0','3983','0'),
('-1199','Naughty secrets!','5849','1','0','3983','0'),
('-1200','I\'ll rip the secrets from your flesh!','5850','1','0','3983','0'),
('-1201','Purged by pain!','5848','1','0','3983','0'),
('-1202','We hunger for vengeance.','5844','1','0','4543','0'),
('-1203','No rest, for the angry dead.','5846','1','0','4543','0'),
('-1204','More... More souls.','5845','1','0','4543','0'),
('-1205','Release the hounds!','5841','1','0','3974','0'),
('-1206','Azeroth has cowered too long under our shadow! Now, feel the power of the Burning Crusade, and despair!','0','1','0','18338','0'),
('-1207','Your fate is sealed, Azeroth! I will find the Aspect Shards, and then you will not stand against our might!','0','1','0','18338','0'),
('-1208','Cower, little worms! Your heroes are nothing! Your saviors will be our first feast!','0','1','0','18338','0'),
('-1209','Where? Where are the Shards! You cannot hide them from us!','0','1','0','18338','0'),
('-1210','Your world will die, mortals! Your doom is now at hand!','0','1','0','18338','0'),
('-1211','Your own strength feeds me!','0','1','0','18338','0'),
('-1212','Ha! This place is not yet worthy of my infliction.','0','1','0','18338','0'), -- used on despawn (not sure where to put it)
('-1213','You have approximately five seconds to live.','11109','1','0','19710','0'),
('-1214','With the precise angle and velocity...','11112','1','0','19710','0'),
('-1215','Low tech yet quiet effective!','11113','1','0','19710','0'),
('-1216','A foregone conclusion.','11110','1','0','19710','0'),
('-1217','The processing will continue a schedule!','11111','1','0','19710','0'),
('-1218','My calculations did not...','11114','1','0','19710','0'),
('-1219','%s raises his hammer menacingly...','0','3','0','19710','0'),
('-1220','Skywing! I will free you from your curse over my dead body!','0','1','0','18533','0'),
('-1221','You\'ll never leave this place... alive.','5825','1','0','7358','0'),
('-1222','To me, my servants!','5828','1','0','7358','0'),
('-1223','Come, spirits, attend your master!','5829','1','0','7358','0'),
('-1224','I am the hand of the Lich King!','5827','1','0','7358','0'),
('-1225','Too...easy!','5826','1','0','7358','0'),
('-1226','Oh now you\'ve gone and angered me! Time to see the true force of the Stone of Tides!','0','0','0','2624','0');
DELETE FROM creature_ai_texts WHERE entry in (-139,-343,-344,-345,-544,-661,-662,-663,-664,-665,-666,-667,-668,-669,-670,-740,-741,-742,-743,-744,-745,-746,-747,-748,-749,-750,-751,-752,-753,-754,-755,-756,-757,-758,-759,-760,-761,-762,-763);
REPLACE INTO `creature_ai_summons` (`id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`comment` ) VALUES
('20','-169.839203','-324.961395','64.401443','3.124724','300000','10268'),('21','28.067','61.875','-123.405','4.67','600000','12238');
DELETE FROM creature_ai_scripts WHERE id in (1037403,1037404,1037405,1044007);
DELETE FROM creature_ai_scripts WHERE creature_id in (5042,3644,3843,18371,15370,15514,32857,32867,32927);
UPDATE creature_template SET AIName='' WHERE entry in (5042,3644,3843,18371,15370,15514,32857,32867,32927);
UPDATE creature_template SET AIName='EventAI' WHERE entry IN (2624,15260,15302,18338,18533,22095,22307,18478,19203,19204,19205,19206,29217,29216,29214,29213,9027,9028,9502,9938,9196,9236,9237,9736,10220,10363,10429,10430,10596,17917,27909,12201,12203,12225,7358,3974,3983,4542,4543,6490,14693,11439,14516,16118,16120,36568,36296,36565,36272,10439,10437,10435,10808,11143,21466,21467,19710,20481,33524,14986,14965,15041,15082,15085,15114);

# Fix
UPDATE `quest_template` SET `RequestItemsText` ='The cologne isn''t going to give itself out, you know.$B$BGet spraying!' , `OfferRewardText` ='Nice work, $N! People will be buying Crown colognes by the crate-load now that they''ve had a chance to try them.$B$BHere''s a little something for helping us out.' WHERE `entry` = 24635;
UPDATE `quest_template` SET `RequestItemsText` ='That perfume''s not going to spray itself, you know.$B$BGet going!' , `OfferRewardText` ='Great work, $N! People will come running to buy Crown perfumes now that they''ve had a chance to sample their wonders.$B$BHere''s a little something for helping us out.' WHERE `entry` = 24629;
UPDATE `quest_template` SET `RequestItemsText` ='You know, those chocolates aren''t going to fling themselves at people.$B$BYou need to get to work!' , `OfferRewardText` ='Lovely work, $N! People will be tripping over one another to get Crown chocolates now that they''ve had a chance to taste those sweet, romantic treats.$B$BHere''s a little something for helping us out.' WHERE `entry` = 24636;
UPDATE `quest_template` SET `OfferRewardText` ='Hey. You got some time on your hands? I could use someone like you.' WHERE `entry` IN (24804,24805);
UPDATE `quest_template` SET `RequestItemsText` ='You analyze that reek yet, kid?' , `OfferRewardText` ='Hey, thanks, kid. Give it over, let''s take a look.$B$B<He takes the device from you and fiddles with it.>$B$BOh, that ain''t good.' WHERE `entry` IN (24655,24536);
UPDATE `quest_template` SET `RequestItemsText` ='Did they toss ya a crate to deliver?' , `OfferRewardText` ='You got it, huh? Good job, kid. Top notch. Let''s see what we what we got here.$B$B<He cracks open the crate and rummages around inside.' WHERE `entry` IN (24656,24541);
UPDATE `quest_template` SET `OfferRewardText` ='You... You''re not Snivel. Did he send you? He''s so late, I had started to give up hope...$B$B<Tears start welling up in the woman''s eyes once she realizes that you aren''t there to deliver a message from Snivel.>$B$BThat''s not like my Snivel, but what choice is there?' WHERE `entry` = 24848;
UPDATE `quest_template` SET `OfferRewardText` ='You''re not Snivel. He was supposed to be here an hour ago! What have you done with him?$B$B<Roka seems to calm down when you tell her that you''re looking for Snivel, too. Then the tears start to well up in her eyes.>$B$BThis isn''t like my Snivel. Do you think something''s happened to him?' WHERE `entry` = 24850;
UPDATE `quest_template` SET `RequestItemsText` ='Who are you?' , `OfferRewardText` ='All he talked about was leaving town with all his money? Then he really has abandoned me, hasn''t he?$B$BOh, $N. I was such a fool to fall for him, but how could I help myself? He was so irresistible!' WHERE `entry` = 24849;
UPDATE `quest_template` SET `RequestItemsText` ='Who are you?' , `OfferRewardText` ='All he talked about was leaving town with all his money? Then he really has abandoned me, hasn''t he?$B$BI can''t believe I fell for such a horrible goblin! But he was so irresistible when we first met.' WHERE `entry` = 24851;
UPDATE `quest_template` SET `RequestItemsText` ='Did you find the guy, or did he crawl under a rock?' , `OfferRewardText` ='You got his ledger? Really? That''s great, $N. There''s probably loads of good information in here.' WHERE `entry` IN (24657,24576);
UPDATE `quest_template` SET `OfferRewardText` ='Fantastic. Help is exactly what I need.' WHERE `entry` IN (24792,24793);
UPDATE `quest_template` SET `RequestItemsText` ='I don''t remember ordering a cleaing service... why yes, I am Apothecary Hummel.$B$B...wait, what is the meaning of this? You think these meaningless papers can stop me? Hah!' , `OfferRewardText` ='What we do here is none of your business...' WHERE `entry` = 11488;
UPDATE `quest_template` SET `RequestItemsText` ='Did you take care of those no-good scheming villains?' , `OfferRewardText` ='What''ve you got there?$B$BOh hey, this is big. Real big. Most of the crazy details in one little package. Thanks - you really helped us reel this all in. Good working with ya.' WHERE `entry` IN (24745,14483);
UPDATE `quest_template` SET `RequestItemsText` ='Did you teach ''em a lesson?' , `OfferRewardText` ='Good job, kid. You deserve a little somethin''. And hey, come back tomorrow if you get the time; I might have a job for ya.' WHERE `entry` IN (24658,24665,24666,24664,24663,24659,24660,24662,24647,24638,24651,24652,24650,24649,24645,24648);
UPDATE `quest_template` SET `EndText` = 'Steal perfume package from Crown Chemical Co. outside Stormind' WHERE `entry` = 24656; -- Alliance
UPDATE `quest_template` SET `EndText` = 'Steal perfume package from Crown Chemical Co. outside Orgrimmar' WHERE `entry` = 24541; -- Horde
INSERT IGNORE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES
(15532, 'Need TXT YTDB', '', 0, 100, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(16334, 'Need TXT YTDB', '', 0, 100, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(16335, 'Need TXT YTDB', '', 0, 100, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(16336, 'Need TXT YTDB', '', 0, 100, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(2368, 'Need TXT YTDB', '', 0, 100, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);

# NeatElves
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=2242 AND `id`=2;
UPDATE `locales_gossip_menu_option` SET `id`='0'  WHERE `menu_id`=9578 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=2242 AND `id`=2;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(2188, 0, 0, 'Who is this Lar''korwi you spoke of?', 1, 1, 2201, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7725, 0, 0, 'Altruis sent me. He said that you could help me.', 1, 1, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2422, 0, 0, 'What do you think of Dadanga?', 1, 1, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (2201,2835);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7762,9513),(7763,9512),(7764,9511),(7765,9510),(7766,9509),(7767,9508);
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7495 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7495 AND `id`=1;
UPDATE `creature_template` SET `gossip_menu_id`='7629' WHERE `entry`=18294;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7629,9292);
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=4361 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=4361 AND `id`=1;
UPDATE `creature_template` SET `gossip_menu_id`='7619' WHERE `entry`=18066;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7619,9271);
UPDATE `creature_template` SET `gossip_menu_id`='7622' WHERE `entry`=18067;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7622,9276);
UPDATE `creature_template` SET `gossip_menu_id`='7623' WHERE `entry`=18068;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7623,9277);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(7768, 0, 0, 'Hello, Greatmother. Garrosh told me that you wanted to speak with me.', 1, 1, 7767, 0, 0, 0, 0, '', 9, 10044, 0, 0, 0, 0, 0, 0, 0),
(7768, 1, 0, 'Garrosh is beyond redemption, Greatmother. I fear that in helping the Mag''har, I have convinced Garrosh that he is unfit to lead.', 1, 1, 0, 0, 0, 0, 0, '', 9, 10172, 0, 0, 0, 0, 0, 0, 0),
(7767, 0, 0, 'You raised all of the orcs here, Greatmother?', 1, 1, 7766, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7766, 0, 0, 'Do you believe that?', 1, 1, 7765, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7765, 0, 0, 'What can be done? I have tried many different things. I have done my best to help the people of Nagrand. Each time I have approached Garrosh, he has dismissed me.', 1, 1, 7764, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7764, 0, 0, 'Left? How can you choose to leave?', 1, 1, 7763, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7763, 0, 0, 'What is this duty?', 1, 1, 7762, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7762, 0, 0, 'Is there anything I can do for you, Greatmother?', 1, 1, -1, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE gossip_menu_option SET `action_menu_id`='7208' WHERE `menu_id`=3461 AND `id`=3;
UPDATE gossip_menu SET `entry`='7208' WHERE `entry`=50281;
UPDATE gossip_menu_option SET menu_id = 7208 WHERE menu_id = 50281;
UPDATE locales_gossip_menu_option SET menu_id = 7208 WHERE `menu_id` =50281;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7099 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7101 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7102 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7099 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7101 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7102 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7104 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7104 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7135 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7134 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7133 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7132 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7131 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7130 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7129 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7128 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7127 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7135 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7134 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7133 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7132 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7131 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7130 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7129 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7128 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7127 AND `id`=1;
UPDATE `creature_loot_template` SET `lootcondition`='19' WHERE `item` in (38280,38281);


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
# DELETE FROM `creature_addon` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);
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

UPDATE db_version SET `cache_id`= '616';
UPDATE db_version SET `version`= 'YTDB_0.14.4_R616_MaNGOS_R11928_SD2_R2478_ACID_R309c_RuDB_R46';
