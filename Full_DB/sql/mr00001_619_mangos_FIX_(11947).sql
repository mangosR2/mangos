# Y2kCat
ALTER TABLE db_version_ytdb CHANGE COLUMN 618_FIX_11930 619_FIX_11947 bit;
REPLACE INTO `db_version_ytdb` (`version`) VALUES ('619_FIX_11947');

# NeatElves
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('27571', '0', '0', '1', '16', '36', '0', NULL),('27566', '0', '0', '1', '16', '36', '0', NULL);
UPDATE `creature_template_addon` SET `emote`='36' WHERE `entry` in (5094,5092,5091,4922,4923,4924);
UPDATE `creature_template` SET `equipment_id`='107' WHERE `entry`=4924;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(128087,4979,1,1,1,0,107,-3645.38,-4446.86,15.3801,4.04178,1200,0,0,5568,0,0),
(128091,4979,1,1,1,0,107,-3768.42,-4347.11,11.2243,4.61826,1200,0,0,4906,0,0),
(128136,4979,1,1,1,0,107,-3799.65,-4422.37,13.1507,2.61864,1200,0,0,4906,0,0),
(128137,4979,1,1,1,0,107,-3854.44,-4432.51,10.3735,4.78006,1200,0,0,5568,0,0),
(128138,4979,1,1,1,0,107,-3786.28,-4483.02,13.9447,4.52559,1200,0,0,5568,0,0),
(128139,4979,1,1,1,0,107,-3771.15,-4532.16,11.5835,0.539697,1200,0,0,4906,0,0),
(128140,4979,1,1,1,0,107,-3837.15,-4574.75,8.63795,3.11188,1200,0,0,4906,0,0);
UPDATE `quest_template` SET `OfferRewardText`='What have you got there? A fake obviously!$B$BI''ve been face to face with Margol and I know for a fact that her horn is at least eight times larger than the one you''ve got in your hands, $N. You probably got that off of a stormsnout in the Barrens. No $Gsir:ma''am;, you can''t fool Pebblebitty!' WHERE `entry`=3181;
UPDATE `quest_template` SET `RequestItemsText`='Yes, what you be needin'', $gdad:mon;? I got many tings to be takin'' care of today, and you not be on me agenda as one of them. Pester me, and I make sure that changes.' WHERE `entry`=3541;
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES (123384, 7);
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES (123385, 7);
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES (123386, 7);
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES (123387, 7);
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES (123388, 7);
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES (123389, 7);
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES (123390, 7);
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES (123391, 7);
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES (123392, 7);
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES (123393, 7);
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES (123394, 7);
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES (130673, 7);
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES (106549, 7);
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES (128141, 7);
DELETE FROM `creature` WHERE `guid` = 130673;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(130673,15897,1,1,1,0,0,10150.1,2602.49,1330.83,4.36754,180,0,0,1,0,0);
DELETE FROM `creature` WHERE `guid` = 106549;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(106549,15897,530,1,1,0,0,-4008.46,-11840.8,0.167516,1.7498,180,0,0,1,0,0);
DELETE FROM `creature` WHERE `guid` = 128141;
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES
(128141,15897,530,1,1,0,0,9478.56,-7297.23,14.3493,0.687937,180,0,0,1,0,0);
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES ('2000000769', 'The sound of hurrying feet rang the cave.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM quest_end_scripts WHERE id=9565;
INSERT INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `comments`) VALUES
(9565, 0, 0, 2, 0, 2000000769, 0, 0, 0, 0, ''),
(9565, 2, 10, 17189, 180000, 0, -3128.49, -12540.2, -2.54, 1.5, ''),
(9565, 3, 10, 17189, 180000, 0, -3105.36, -12549.2, -1.28, 4.6, '');
UPDATE creature_template SET flags_extra=flags_extra | 2048 WHERE entry in (17243);
UPDATE `gossip_menu_option` SET `option_text`='Lady Jaina, this may sound like an odd request... but I have a young ward who is quite shy. You are a hero to him, and he asked me to get your autograph.' WHERE `menu_id`=2465 AND `id`=1;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES ('3130', '0', '1', 'Let me browse your goods', '3', '128', '0', '0', '0', '0', '0', NULL, '5', '589', '7', '0', '0', '0', '0', '0', '0');
UPDATE `creature_template` SET `gossip_menu_id`='6944' WHERE `entry`=11138;
UPDATE `creature_template` SET `gossip_menu_id`='12846' WHERE `entry`=4941;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (12846,18070);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES ('2465', '0', '0', 'I''m ready to go to Stormwind.', '1', '1', '-1', '0', '0', '0', '0', NULL, '9', '11222', '0', '0', '0', '0', '0', '0', '0');
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES ('8846', '0', '0', 'Can you send me to Theramore? I have an urgent message to Lady Jaina from King Wrynn.', '1', '1', '-1', '0', '0', '0', '0', NULL, '9', '11223', '0', '0', '0', '0', '0', '0', '0');
UPDATE `gossip_menu_option` SET `action_script_id`='2465' WHERE `menu_id`=2465 AND `id`=1;
DELETE FROM gossip_scripts WHERE id IN (2465,50384);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `comments`) VALUES
(2465, 0, 15, 23122, 'Create Jaina''s Autograph');
REPLACE INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `comments`) VALUES
(11142, 0, 0, 0, 0, 2000001014, 0, 0, 0, 0, '');
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES ('2000001014', 'Perhaps I should explain...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE `creature_template` SET `faction_A`='1883',`faction_H`='1883' WHERE `entry` in (5089,23637);
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `guid`=125126;
UPDATE `creature_template` SET `unit_flags`=`unit_flags` | 32768, `inhabittype`=`inhabittype` | 5 WHERE `entry` IN (23569);
UPDATE `quest_template` SET `NextQuestId`='11141', `NextQuestInChain`='11141' WHERE `entry`=11140;
DELETE FROM creature WHERE guid=28754;
DELETE FROM creature_addon WHERE guid=28754;
DELETE FROM creature_movement WHERE id=28754;
DELETE FROM game_event_creature WHERE guid=28754;
DELETE FROM game_event_creature_data WHERE guid=28754;
DELETE FROM creature_battleground WHERE guid=28754;
DELETE FROM creature WHERE guid=28759;
DELETE FROM creature_addon WHERE guid=28759;
DELETE FROM creature_movement WHERE id=28759;
DELETE FROM game_event_creature WHERE guid=28759;
DELETE FROM game_event_creature_data WHERE guid=28759;
DELETE FROM creature_battleground WHERE guid=28759;
DELETE FROM creature WHERE guid=28725;
DELETE FROM creature_addon WHERE guid=28725;
DELETE FROM creature_movement WHERE id=28725;
DELETE FROM game_event_creature WHERE guid=28725;
DELETE FROM game_event_creature_data WHERE guid=28725;
DELETE FROM creature_battleground WHERE guid=28725;
DELETE FROM creature WHERE guid=28679;
DELETE FROM creature_addon WHERE guid=28679;
DELETE FROM creature_movement WHERE id=28679;
DELETE FROM game_event_creature WHERE guid=28679;
DELETE FROM game_event_creature_data WHERE guid=28679;
DELETE FROM creature_battleground WHERE guid=28679;
DELETE FROM creature WHERE guid=28643;
DELETE FROM creature_addon WHERE guid=28643;
DELETE FROM creature_movement WHERE id=28643;
DELETE FROM game_event_creature WHERE guid=28643;
DELETE FROM game_event_creature_data WHERE guid=28643;
DELETE FROM creature_battleground WHERE guid=28643;
DELETE FROM creature WHERE guid=28741;
DELETE FROM creature_addon WHERE guid=28741;
DELETE FROM creature_movement WHERE id=28741;
DELETE FROM game_event_creature WHERE guid=28741;
DELETE FROM game_event_creature_data WHERE guid=28741;
DELETE FROM creature_battleground WHERE guid=28741;
DELETE FROM creature WHERE guid=28743;
DELETE FROM creature_addon WHERE guid=28743;
DELETE FROM creature_movement WHERE id=28743;
DELETE FROM game_event_creature WHERE guid=28743;
DELETE FROM game_event_creature_data WHERE guid=28743;
DELETE FROM creature_battleground WHERE guid=28743;
DELETE FROM creature WHERE guid=28697;
DELETE FROM creature_addon WHERE guid=28697;
DELETE FROM creature_movement WHERE id=28697;
DELETE FROM game_event_creature WHERE guid=28697;
DELETE FROM game_event_creature_data WHERE guid=28697;
DELETE FROM creature_battleground WHERE guid=28697;
DELETE FROM creature WHERE guid=28648;
DELETE FROM creature_addon WHERE guid=28648;
DELETE FROM creature_movement WHERE id=28648;
DELETE FROM game_event_creature WHERE guid=28648;
DELETE FROM game_event_creature_data WHERE guid=28648;
DELETE FROM creature_battleground WHERE guid=28648;
DELETE FROM creature WHERE guid=28631;
DELETE FROM creature_addon WHERE guid=28631;
DELETE FROM creature_movement WHERE id=28631;
DELETE FROM game_event_creature WHERE guid=28631;
DELETE FROM game_event_creature_data WHERE guid=28631;
DELETE FROM creature_battleground WHERE guid=28631;
DELETE FROM creature WHERE guid=28668;
DELETE FROM creature_addon WHERE guid=28668;
DELETE FROM creature_movement WHERE id=28668;
DELETE FROM game_event_creature WHERE guid=28668;
DELETE FROM game_event_creature_data WHERE guid=28668;
DELETE FROM creature_battleground WHERE guid=28668;
DELETE FROM creature WHERE guid=28590;
DELETE FROM creature_addon WHERE guid=28590;
DELETE FROM creature_movement WHERE id=28590;
DELETE FROM game_event_creature WHERE guid=28590;
DELETE FROM game_event_creature_data WHERE guid=28590;
DELETE FROM creature_battleground WHERE guid=28590;
DELETE FROM creature WHERE guid=28603;
DELETE FROM creature_addon WHERE guid=28603;
DELETE FROM creature_movement WHERE id=28603;
DELETE FROM game_event_creature WHERE guid=28603;
DELETE FROM game_event_creature_data WHERE guid=28603;
DELETE FROM creature_battleground WHERE guid=28603;
DELETE FROM creature WHERE guid=28664;
DELETE FROM creature_addon WHERE guid=28664;
DELETE FROM creature_movement WHERE id=28664;
DELETE FROM game_event_creature WHERE guid=28664;
DELETE FROM game_event_creature_data WHERE guid=28664;
DELETE FROM creature_battleground WHERE guid=28664;
DELETE FROM gameobject WHERE guid = '3991';
DELETE FROM game_event_gameobject WHERE guid = '3991';
DELETE FROM gameobject_battleground WHERE guid = '3991';
DELETE FROM creature WHERE guid=29425;
DELETE FROM creature_addon WHERE guid=29425;
DELETE FROM creature_movement WHERE id=29425;
DELETE FROM game_event_creature WHERE guid=29425;
DELETE FROM game_event_creature_data WHERE guid=29425;
DELETE FROM creature_battleground WHERE guid=29425;
DELETE FROM creature WHERE guid=29451;
DELETE FROM creature_addon WHERE guid=29451;
DELETE FROM creature_movement WHERE id=29451;
DELETE FROM game_event_creature WHERE guid=29451;
DELETE FROM game_event_creature_data WHERE guid=29451;
DELETE FROM creature_battleground WHERE guid=29451;
DELETE FROM creature WHERE guid=29483;
DELETE FROM creature_addon WHERE guid=29483;
DELETE FROM creature_movement WHERE id=29483;
DELETE FROM game_event_creature WHERE guid=29483;
DELETE FROM game_event_creature_data WHERE guid=29483;
DELETE FROM creature_battleground WHERE guid=29483;
DELETE FROM creature WHERE guid=29409;
DELETE FROM creature_addon WHERE guid=29409;
DELETE FROM creature_movement WHERE id=29409;
DELETE FROM game_event_creature WHERE guid=29409;
DELETE FROM game_event_creature_data WHERE guid=29409;
DELETE FROM creature_battleground WHERE guid=29409;
DELETE FROM creature WHERE guid=29448;
DELETE FROM creature_addon WHERE guid=29448;
DELETE FROM creature_movement WHERE id=29448;
DELETE FROM game_event_creature WHERE guid=29448;
DELETE FROM game_event_creature_data WHERE guid=29448;
DELETE FROM creature_battleground WHERE guid=29448;
DELETE FROM creature WHERE guid=29427;
DELETE FROM creature_addon WHERE guid=29427;
DELETE FROM creature_movement WHERE id=29427;
DELETE FROM game_event_creature WHERE guid=29427;
DELETE FROM game_event_creature_data WHERE guid=29427;
DELETE FROM creature_battleground WHERE guid=29427;
DELETE FROM creature WHERE guid=29445;
DELETE FROM creature_addon WHERE guid=29445;
DELETE FROM creature_movement WHERE id=29445;
DELETE FROM game_event_creature WHERE guid=29445;
DELETE FROM game_event_creature_data WHERE guid=29445;
DELETE FROM creature_battleground WHERE guid=29445;
DELETE FROM creature WHERE guid=126482;
DELETE FROM creature_addon WHERE guid=126482;
DELETE FROM creature_movement WHERE id=126482;
DELETE FROM game_event_creature WHERE guid=126482;
DELETE FROM game_event_creature_data WHERE guid=126482;
DELETE FROM creature_battleground WHERE guid=126482;
DELETE FROM creature WHERE guid=126483;
DELETE FROM creature_addon WHERE guid=126483;
DELETE FROM creature_movement WHERE id=126483;
DELETE FROM game_event_creature WHERE guid=126483;
DELETE FROM game_event_creature_data WHERE guid=126483;
DELETE FROM creature_battleground WHERE guid=126483;
DELETE FROM creature WHERE guid=29530;
DELETE FROM creature_addon WHERE guid=29530;
DELETE FROM creature_movement WHERE id=29530;
DELETE FROM game_event_creature WHERE guid=29530;
DELETE FROM game_event_creature_data WHERE guid=29530;
DELETE FROM creature_battleground WHERE guid=29530;
DELETE FROM creature WHERE guid=126478;
DELETE FROM creature_addon WHERE guid=126478;
DELETE FROM creature_movement WHERE id=126478;
DELETE FROM game_event_creature WHERE guid=126478;
DELETE FROM game_event_creature_data WHERE guid=126478;
DELETE FROM creature_battleground WHERE guid=126478;
DELETE FROM creature WHERE guid=29356;
DELETE FROM creature_addon WHERE guid=29356;
DELETE FROM creature_movement WHERE id=29356;
DELETE FROM game_event_creature WHERE guid=29356;
DELETE FROM game_event_creature_data WHERE guid=29356;
DELETE FROM creature_battleground WHERE guid=29356;
DELETE FROM creature WHERE guid=29339;
DELETE FROM creature_addon WHERE guid=29339;
DELETE FROM creature_movement WHERE id=29339;
DELETE FROM game_event_creature WHERE guid=29339;
DELETE FROM game_event_creature_data WHERE guid=29339;
DELETE FROM creature_battleground WHERE guid=29339;
DELETE FROM creature WHERE guid=29504;
DELETE FROM creature_addon WHERE guid=29504;
DELETE FROM creature_movement WHERE id=29504;
DELETE FROM game_event_creature WHERE guid=29504;
DELETE FROM game_event_creature_data WHERE guid=29504;
DELETE FROM creature_battleground WHERE guid=29504;
DELETE FROM creature WHERE guid=126479;
DELETE FROM creature_addon WHERE guid=126479;
DELETE FROM creature_movement WHERE id=126479;
DELETE FROM game_event_creature WHERE guid=126479;
DELETE FROM game_event_creature_data WHERE guid=126479;
DELETE FROM creature_battleground WHERE guid=126479;
DELETE FROM creature WHERE guid=126480;
DELETE FROM creature_addon WHERE guid=126480;
DELETE FROM creature_movement WHERE id=126480;
DELETE FROM game_event_creature WHERE guid=126480;
DELETE FROM game_event_creature_data WHERE guid=126480;
DELETE FROM creature_battleground WHERE guid=126480;
DELETE FROM creature WHERE guid=126481;
DELETE FROM creature_addon WHERE guid=126481;
DELETE FROM creature_movement WHERE id=126481;
DELETE FROM game_event_creature WHERE guid=126481;
DELETE FROM game_event_creature_data WHERE guid=126481;
DELETE FROM creature_battleground WHERE guid=126481;
REPLACE INTO gameobject VALUES ( 3632, 1798, 1, 1,1,-2975.78, -4362.06, 9.12267, 4.27187, 0, 0, 0.844514, -0.535533, 600, 100, 1);
REPLACE INTO gameobject VALUES ( 56054, 186272, 1, 1,1,-2680.84, -4284.7, 3.60707, 0.162664, 0, 0, 0.0812422, 0.996694, 180, 100, 1);
UPDATE `creature` SET `spawndist`='0', `MovementType`='2' WHERE `guid`=125079;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES
(125079,1,-3010.18,-4369.22,8.09579,2.71678),
(125079,2,-3043.54,-4357.81,7.96938,2.87465),
(125079,3,-3046.38,-4325,7.76256,1.55596),
(125079,4,-3019.19,-4329.63,7.49021,6.11441),
(125079,5,-2970.7,-4360.99,9.58275,5.70915),
(125079,6,-2981.58,-4377.94,9.61431,4.14149);
REPLACE INTO gameobject VALUES ( 3991, 1798, 1, 1,1,-2679.66, -4256.77, 3.59599, 4.7808, 0, 0, 0.682509, -0.730877, 600, 100, 1);
UPDATE `creature_template` SET `faction_A`='17', `faction_H`='17' WHERE `entry`=550;
UPDATE `creature_template` SET `faction_A`='17', `faction_H`='17' WHERE `entry`=23589;
UPDATE `creature_template` SET `faction_A`='17', `faction_H`='17' WHERE `entry`=23590;
UPDATE `creature_template` SET `faction_A`='17', `faction_H`='17' WHERE `entry`=24860;
UPDATE `creature_template` SET `faction_A`='17', `faction_H`='17' WHERE `entry`=23591;
DELETE FROM `creature` WHERE `guid` = 126478;
DELETE FROM `creature` WHERE `guid` = 126479;
DELETE FROM `creature` WHERE `guid` = 126480;
DELETE FROM `creature` WHERE `guid` = 126481;
DELETE FROM `creature` WHERE `guid` = 126482;
DELETE FROM `creature` WHERE `guid` = 126483;
UPDATE `gameobject` SET `spawntimesecs`='300' WHERE `id` in (11,186283);
UPDATE `creature` SET `MovementType`='0' WHERE `guid`=28803;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1651851;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16518;
DELETE FROM `creature_ai_scripts` WHERE `id` = 1651851;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=16518;
REPLACE INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`, `comments`) VALUES
(15406, 6, 0, 3, 0, 2000001026, 0, 0, 0, 0, ''),
(15406, 7, 0, 3, 0, 2000001027, 0, 0, 0, 0, '');
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES ('2000001026', 'Pitiful mortal, Onyxia answers to no one!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES ('2000001027', 'Your pathetic challenge has not gone unnoticed. I shall enjoy toying with you before you die.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES ('2000001028', 'Thank you! There''s no telling what those brutes would''ve done to me.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14344', '14', 'Blackhoof Armaments');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('186301', '14344', '0', 'Blackhoof Armaments');
REPLACE INTO `gameobject_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(55901, 1, 0, 0, 23720, 5, 0, 0, 2000001028, 0, 0, 0, 0, 0, 0, 0, ''),
(55909, 1, 0, 0, 23720, 5, 0, 0, 2000001028, 0, 0, 0, 0, 0, 0, 0, ''),
(55911, 1, 0, 0, 23720, 5, 0, 0, 2000001028, 0, 0, 0, 0, 0, 0, 0, ''),
(55912, 1, 0, 0, 23720, 5, 0, 0, 2000001028, 0, 0, 0, 0, 0, 0, 0, ''),
(55922, 1, 0, 0, 23720, 5, 0, 0, 2000001028, 0, 0, 0, 0, 0, 0, 0, ''),
(55923, 1, 0, 0, 23720, 5, 0, 0, 2000001028, 0, 0, 0, 0, 0, 0, 0, ''),
(55924, 1, 0, 0, 23720, 5, 0, 0, 2000001028, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE creature SET position_x = '-2606.220947', position_y = '-3180.635010', position_z = '35.497292', orientation = '3.968691' WHERE guid = '29709';
UPDATE creature_template SET gossip_menu_id = 8105 WHERE entry = 20362;
DELETE FROM `gossip_menu` WHERE `entry` = 50348;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50348;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50348;
UPDATE creature_template SET gossip_menu_id = 8105 WHERE entry = 20381;
DELETE FROM `gossip_menu` WHERE `entry` = 50352;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50352;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50352;
UPDATE creature_template SET gossip_menu_id = 8105 WHERE entry = 20382;
DELETE FROM `gossip_menu` WHERE `entry` = 50354;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50354;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50354;
UPDATE creature_template SET gossip_menu_id = 8105 WHERE entry = 20383;
DELETE FROM `gossip_menu` WHERE `entry` = 50356;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50356;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50356;
UPDATE creature_template SET gossip_menu_id = 8104 WHERE entry = 20385;
DELETE FROM `gossip_menu` WHERE `entry` = 50351;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50351;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50351;
UPDATE creature_template SET gossip_menu_id = 8104 WHERE entry = 20386;
DELETE FROM `gossip_menu` WHERE `entry` = 50353;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50353;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50353;
UPDATE creature_template SET gossip_menu_id = 8104 WHERE entry = 20388;
DELETE FROM `gossip_menu` WHERE `entry` = 50355;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50355;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50355;
UPDATE creature_template SET gossip_menu_id = 8104 WHERE entry = 20390;
DELETE FROM `gossip_menu` WHERE `entry` = 50349;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 50349;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50349;
UPDATE creature_template SET gossip_menu_id = 8452 WHERE entry = 22015;
UPDATE creature_template SET gossip_menu_id = 8451 WHERE entry = 22013;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8451,10558);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8451,10024);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8452,10024);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8451,10025);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8452,10026);
UPDATE `gossip_menu` SET `cond_1`='15', `cond_1_val_1`='61', `cond_1_val_2`='1', `cond_2`='4', `cond_2_val_1`='3703', `cond_2_val_2`='1' WHERE `entry`=8451 AND `text_id`=10025;
UPDATE `gossip_menu` SET `cond_1`='15', `cond_1_val_1`='61', `cond_1_val_2`='1', `cond_2`='4', `cond_2_val_1`='3703', `cond_2_val_2`='1' WHERE `entry`=8452 AND `text_id`=10026;
UPDATE `gossip_menu` SET `cond_1`='15', `cond_1_val_1`='61', `cond_1_val_2`='1', `cond_2`='4', `cond_2_val_1`='3703', `cond_2_val_2`='0' WHERE `entry`=8451 AND `text_id`=10558;
UPDATE `gossip_menu` SET `cond_1`='15', `cond_1_val_1`='61', `cond_1_val_2`='1', `cond_2`='4', `cond_2_val_1`='3703', `cond_2_val_2`='0' WHERE `entry`=8452 AND `text_id`=10559;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(8451, 0, 9, 'I would like to go to the battleground.', 12, 1048576, 0, 0, 0, 0, 0, NULL, 15, 61, 1, 0, 0, 0, 0, 0, 0),
(8452, 0, 9, 'I would like to go to the battleground.', 12, 1048576, 0, 0, 0, 0, 0, NULL, 15, 61, 1, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(8751, 11085, 0, 5, 935, 7, 5, 942, 7),
(8752, 11085, 0, 5, 935, 7, 5, 942, 7);
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|64 WHERE `entry`=21267;
UPDATE  `gossip_scripts` SET `data_flags` = '0' WHERE `id` = 10464 AND `dataint` = 2000000449;
UPDATE  `gossip_scripts` SET `data_flags` = '0' WHERE `id` = 10465 AND `dataint` = 2000000449;
UPDATE  `gossip_scripts` SET `data_flags` = '0' WHERE `id` = 10466 AND `dataint` = 2000000449;
UPDATE  `gossip_scripts` SET `data_flags` = '0' WHERE `id` = 10467 AND `dataint` = 2000000449;
UPDATE  `gossip_scripts` SET `data_flags` = '0' WHERE `id` = 10468 AND `dataint` = 2000000449;
UPDATE  `gossip_scripts` SET `data_flags` = '0' WHERE `id` = 10469 AND `dataint` = 2000000449;
UPDATE  `gossip_scripts` SET `data_flags` = '0' WHERE `id` = 10470 AND `dataint` = 2000000449;
UPDATE  `gossip_scripts` SET `data_flags` = '0' WHERE `id` = 10471 AND `dataint` = 2000000449;
UPDATE  `gossip_scripts` SET `data_flags` = '0' WHERE `id` = 10472 AND `dataint` = 2000000449;
UPDATE  `gossip_scripts` SET `data_flags` = '0' WHERE `id` = 10473 AND `dataint` = 2000000449;
UPDATE  `gossip_scripts` SET `data_flags` = '0' WHERE `id` = 16206 AND `dataint` = 2000000455;
UPDATE  `gossip_scripts` SET `data_flags` = '0' WHERE `id` = 16208 AND `dataint` = 2000000453;
UPDATE  `gossip_scripts` SET `data_flags` = '0' WHERE `id` = 16209 AND `dataint` = 2000000454;
UPDATE  `gossip_scripts` SET `data_flags` = '0' WHERE `id` = 33 AND `dataint` = 2000000709;
UPDATE  `gossip_scripts` SET `data_flags` = '0' WHERE `id` = 1443 AND `dataint` = 2000000709;
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` in (18399,18402);
UPDATE `quest_template` SET `SpecialFlags`='2', `ReqCreatureOrGOId1`='0', `ReqCreatureOrGOCount1`='0' WHERE `entry` in (9962,9967,9970,9972,9973,9977);
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1839851,18398,0,0,100,1,6000,6000,14000,14800,11,32023,1,0,0,0,0,0,0,0,0,0,'ytdb - Brokentoe - Cast Hoof Stomp'),
(1839852,18398,6,0,100,0,0,0,0,0,26,9962,0,0,0,0,0,0,0,0,0,0,'ytdb - Brokentoe - quest complete on death');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = 18398;
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1840051,18400,0,0,100,1,8000,13000,19000,25000,11,31389,1,1,0,0,0,0,0,0,0,0,'ytdb - Rokdar the Sundered Lord  - Cast Knock Away'),
(1840052,18400,0,0,100,1,3000,5000,6000,9000,11,15976,1,0,0,0,0,0,0,0,0,0,'ytdb - Rokdar the Sundered Lord  - Cast Puncture'),
(1840053,18400,0,0,100,1,12000,15000,17000,24000,11,16727,0,1,0,0,0,0,0,0,0,0,'ytdb - Rokdar the Sundered Lord  - Cast War Stomp'),
(1840054,18400,6,0,100,0,0,0,0,0,26,9970,0,0,0,0,0,0,0,0,0,0,'ytdb - Rokdar the Sundered Lord - quest complete on death');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = 18400;
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1840251,18402,0,0,100,1,1000,5000,9000,15000,11,31403,0,0,0,0,0,0,0,0,0,0,'ytdb - Warmaul Champion - Casts Battle Shout'),
(1840252,18402,4,0,100,0,0,0,0,0,11,32323,1,0,0,0,0,0,0,0,0,0,'ytdb - Warmaul Champion - Casts Shoulder Charge on Aggro'),
(1840253,18402,0,0,100,1,8000,10000,12000,15000,11,15708,1,1,0,0,0,0,0,0,0,0,'ytdb - Warmaul Champion - Cast Mortal Strike'),
(1840254,18402,0,0,100,1,3000,5000,8000,12000,11,17963,1,0,0,0,0,0,0,0,0,0,'ytdb - Warmaul Champion - Cast Sundering Cleave'),
(1840255,18402,6,0,100,0,0,0,0,0,26,9973,0,0,0,0,0,0,0,0,0,0,'ytdb - Warmaul Champion - quest complete on death');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = 18402;
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1806951,18069,0,0,100,1,3500,4000,10000,11000,11,39529,1,0,0,0,0,0,0,0,0,0,'ytdb - Mogor - Cast Flame Shock'),
(1806952,18069,0,0,100,1,5000,7000,13000,15500,11,16033,1,0,0,0,0,0,0,0,0,0,'ytdb - Mogor - Cast Chain Lightning'),
(1806953,18069,0,0,100,1,8000,9000,15000,18000,11,18975,0,1,0,0,0,0,0,0,0,0,'ytdb - Mogor - Cast Summon Ice Totem'),
(1806954,18069,2,0,100,0,30,0,0,0,11,28747,0,0,1,-106,0,0,0,0,0,0,'ytdb - Mogor - Casts Enrage at 30% HP'),
(1806955,18069,2,0,100,0,25,0,0,0,11,15982,0,0,0,0,0,0,0,0,0,0,'ytdb - Mogor - Cast Healing Touch When Below 25% HP'),
(1806956,18069,6,0,100,0,0,0,0,0,26,9977,0,0,0,0,0,0,0,0,0,0,'ytdb - Mogor - quest complete on death');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = 18069;
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1839951,18399,0,0,100,1,5000,9000,9000,13000,11,14873,1,0,0,0,0,0,0,0,0,0,'ytdb - Murkblood Twin - Cast Sinister Strike'),
(1839952,18399,6,0,100,0,0,0,0,0,26,9967,0,0,0,0,0,0,0,0,0,0,'ytdb - Murkblood Twin - quest complete on death');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = 18399;
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(1840151,18401, 0, 0, 100, 1, 5000, 5000, 22000, 22000, 11, 32322, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,'ytdb - Skra\gath - Casts Dark Shriek'),
(1840152, 18401, 8, 0, 100, 0, 0, 2, 0, 0, 11, 34336, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'ytdb - Skra\gath - Cast Damage Reduction: Holy on Holy Spellhit'),
(1840153, 18401, 8, 0, 100, 0, 0, 4, 0, 0, 11, 34333, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'ytdb - Skra\gath - Cast Damage Reduction: Fire on Fire Spellhit'),
(1840154, 18401, 8, 0, 100, 0, 0, 8, 0, 0, 11, 34335, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'ytdb - Skra\gath - Cast Damage Reduction: Nature on Nature Spellhit'),
(1840155, 18401, 8, 0, 100, 0, 0, 16, 0, 0, 11, 34334, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'ytdb - Skra\gath - Cast Damage Reduction: Frost on Frost Spellhit'),
(1840156, 18401, 8, 0, 100, 0, 0, 32, 0, 0, 11, 34338, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'ytdb - Skra\gath - Cast Damage Reduction: Shadow on Shadow Spellhit'),
(1840157, 18401, 8, 0, 100, 0, 0, 64, 0, 0, 11, 34331, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'ytdb - Skra\gath - Cast Damage Reduction: Arcane on Arcane Spellhit'),
(1840158,18401, 0, 0, 100, 1, 10000, 10000, 16000, 16000, 11, 29299, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,'ytdb - Skra\gath - Casts Draining Touch'),
(1840159,18401, 0, 0, 100, 1, 11000, 11000, 16000, 16000, 11, 16429, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,'ytdb - Skra\gath - Casts Piercing Shadow'),
(1840160,18401, 0, 0, 100, 1, 7000, 7000, 22000, 22000, 11, 32324, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,'ytdb - Skra\gath - Casts Shadow Burst'),
(1840161,18401,6,0,100,0,0,0,0,0,26,9972,0,0,0,0,0,0,0,0,0,0,'ytdb - Skra\gath - quest complete on death');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = 18401;

# ZuSe
DELETE FROM creature WHERE id='30' AND map='1';
DELETE FROM creature WHERE id='118' AND map='1';

# NeatElves
DELETE FROM `creature` WHERE `guid` = 110024;
DELETE FROM `creature` WHERE `guid` = 110025;
DELETE FROM `creature` WHERE `guid` = 110026;
DELETE FROM `creature` WHERE `guid` = 110027;
DELETE FROM `creature` WHERE `guid` = 110028;
DELETE FROM `creature` WHERE `guid` = 110029;
DELETE FROM `creature` WHERE `guid` = 110030;
DELETE FROM `creature` WHERE `guid` = 110031;
DELETE FROM `creature` WHERE `guid` = 110033;
UPDATE quest_template SET ReqSpellCast1 =0 WHERE entry=13211;
REPLACE INTO `creature_ai_scripts` VALUES ('3113051', '31130', '8', '0', '100', '1', '58641', '-1', '1000', '1000', '33', '31130', '6', '0', '41', '5000', '0', '0', '11', '51195', '0', '0', 'ytdb-q13211');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '31130';
#
UPDATE quest_template SET ReqSpellCast1 =0 WHERE entry=12937;
REPLACE INTO `creature_ai_scripts` VALUES ('3003551', '30035', '8', '0', '100', '1', '55804', '-1', '1000', '1000', '33', '30035', '6', '0', '41', '5000', '0', '0', '0', '0', '0', '0', 'ytdb-q12937');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '30035';
#
UPDATE quest_template SET ReqSpellCast1 =0 WHERE entry=12449;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(49954, 189992, 571, 1, 1, 3863.79, 953.659, 57.0372, 0.698132, 0, 0, 0.34202, 0.939693, 300, 100, 1),
(49955, 189992, 571, 1, 1, 3891.36, 974.522, 57.355, -2.35619, 0, 0, -0.923879, 0.382686, 300, 100, 1),
(49956, 189992, 571, 1, 1, 3796.92, 947.773, 61.5764, -0.034906, 0, 0, -0.0174521, 0.999848, 300, 100, 1),
(49957, 189992, 571, 1, 1, 3848.12, 865.352, 56.8124, -2.53072, 0, 0, -0.953716, 0.300709, 300, 100, 1),
(49958, 189992, 571, 1, 1, 3797.78, 983.648, 59.3593, 2.74016, 0, 0, 0.979924, 0.199371, 300, 100, 1),
(49959, 189992, 571, 1, 1, 3771.34, 956.361, 69.1555, -0.942477, 0, 0, -0.45399, 0.891007, 300, 100, 1),
(49962, 189992, 571, 1, 1, 3767.38, 971.714, 69.9796, 1.58825, 0, 0, 0.713251, 0.700909, 300, 100, 1),
(11282, 189992, 571, 1, 1, 3801.05, 995.441, 56.438, -1.36136, 0, 0, -0.629322, 0.777145, 300, 100, 1),
(11278, 189992, 571, 1, 1, 3771.42, 932.265, 67.9207, -1.69297, 0, 0, -0.748956, 0.66262, 300, 100, 1),
(11277, 189992, 571, 1, 1, 3749.05, 907.771, 62.0943, -1.09956, 0, 0, -0.5225, 0.852639, 300, 100, 1),
(11276, 189992, 571, 1, 1, 3887.97, 897.167, 56.7736, 2.56563, 0, 0, 0.958819, 0.284017, 300, 100, 1),
(11272, 189992, 571, 1, 1, 3734.15, 899.217, 58.2914, -1.15192, 0, 0, -0.54464, 0.83867, 300, 100, 1),
(11271, 189992, 571, 1, 1, 3845.01, 1007.26, 56.7855, 2.18166, 0, 0, 0.88701, 0.461749, 300, 100, 1),
(11270, 189992, 571, 1, 1, 3755.09, 1002.77, 67.1819, 2.37364, 0, 0, 0.927182, 0.37461, 300, 100, 1),
(11266, 189992, 571, 1, 1, 3689.07, 952.267, 60.2225, -0.506145, 0, 0, -0.25038, 0.968148, 300, 100, 1),
(11264, 189992, 571, 1, 1, 3601.98, 1055.91, 61.1882, 2.91469, 0, 0, 0.993571, 0.113208, 300, 100, 1),
(11257, 189992, 571, 1, 1, 3747.02, 1036.43, 55.149, -0.715585, 0, 0, -0.350207, 0.936672, 300, 100, 1),
(11255, 189992, 571, 1, 1, 3713.14, 907.593, 58.2014, -2.68781, 0, 0, -0.97437, 0.22495, 300, 100, 1),
(11249, 189992, 571, 1, 1, 3792.75, 1096.22, 56.1365, 3.03684, 0, 0, 0.998629, 0.0523524, 300, 100, 1),
(11248, 189992, 571, 1, 1, 3706.4, 1023.84, 56.3844, -0.366518, 0, 0, -0.182235, 0.983255, 300, 100, 1),
(11241, 189992, 571, 1, 1, 3910.91, 874.514, 56.2712, -1.48353, 0, 0, -0.67559, 0.737277, 300, 255, 1),
(11240, 189992, 571, 1, 1, 3877.6, 854.806, 57.908, 1.8675, 0, 0, 0.803856, 0.594824, 300, 255, 1),
(11234, 189992, 571, 1, 1, 3844.27, 1092.09, 58.1241, 0.087266, 0, 0, 0.0436192, 0.999048, 300, 255, 1),
(11230, 189992, 571, 1, 1, 3816.82, 1074.38, 58.4506, 0.104719, 0, 0, 0.0523356, 0.99863, 300, 255, 1),
(11228, 189992, 571, 1, 1, 3833.32, 896.107, 57.7204, 3.10665, 0, 0, 0.999847, 0.0174704, 300, 255, 1),
(11226, 189992, 571, 1, 1, 3851.41, 1048.79, 59.6576, -0.645772, 0, 0, -0.317305, 0.948324, 300, 255, 1),
(11219, 189992, 571, 1, 1, 3718.37, 976.985, 70.302, -0.767944, 0, 0, -0.374606, 0.927184, 300, 255, 1),
(11218, 189992, 571, 1, 1, 3743.03, 973.685, 73.8561, -0.750491, 0, 0, -0.366501, 0.930418, 300, 255, 1),
(11217, 189992, 571, 1, 1, 3777.05, 1066.73, 57.1204, -1.90241, 0, 0, -0.814116, 0.580702, 300, 255, 1),
(11215, 189992, 571, 1, 1, 3680.91, 979.943, 57.2695, 1.25664, 0, 0, 0.587785, 0.809017, 300, 255, 1),
(11214, 189992, 571, 1, 1, 3648.35, 927.061, 56.4989, 1.20428, 0, 0, 0.566406, 0.824126, 300, 255, 1),
(11212, 189992, 571, 1, 1, 3861.91, 916.774, 57.7873, -2.33874, 0, 0, -0.920505, 0.390732, 300, 255, 1),
(11211, 189992, 571, 1, 1, 3892.69, 942.402, 56.0333, 2.80997, 0, 0, 0.986285, 0.165053, 300, 255, 1),
(11209, 189992, 571, 1, 1, 3791.52, 908.666, 55.8715, 2.32129, 0, 0, 0.91706, 0.398748, 300, 255, 1),
(11208, 189992, 571, 1, 1, 3716.45, 1068, 58.1806, 1.309, 0, 0, 0.608763, 0.793352, 300, 255, 1),
(11205, 189992, 571, 1, 1, 3596.58, 1001.5, 55.9769, -3.08918, 0, 0, -0.999657, 0.0262016, 300, 255, 1),
(11200, 189992, 571, 1, 1, 3625.81, 974.15, 58.4168, -1.6057, 0, 0, -0.719339, 0.694659, 300, 255, 1),
(11199, 189992, 571, 1, 1, 3659.09, 1069.3, 62.2403, 0.244346, 0, 0, 0.121869, 0.992546, 300, 255, 1),
(11198, 189992, 571, 1, 1, 3781.22, 1020.69, 56.4522, -0.506145, 0, 0, -0.25038, 0.968148, 300, 255, 1),
(11196, 189992, 571, 1, 1, 3584.35, 954.823, 61.287, -0.645772, 0, 0, -0.317305, 0.948324, 300, 255, 1),
(11194, 189992, 571, 1, 1, 3657.34, 1027.81, 58.061, 0.541051, 0, 0, 0.267238, 0.963631, 300, 255, 1),
(11193, 189992, 571, 1, 1, 3675.41, 1010.27, 55.6201, 0.191985, 0, 0, 0.0958452, 0.995396, 300, 255, 1);
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('189992', '14345', '0', 'Ruby Acorn');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14345', '20', 'Ruby Acorn');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(110024, 27530, 571, 1, 1, 0, 0, 3599.12, 1122.7, 242.695, 0.729031, 300, 0, 0, 102820, 0, 0),
(110026, 27530, 571, 1, 1, 0, 0, 3606.16, 966.047, 58.6945, 2.42601, 300, 0, 0, 102820, 0, 0),
(110028, 27530, 571, 1, 1, 0, 0, 3690.58, 1034.33, 55.7121, 1.43117, 300, 0, 0, 102820, 0, 0),
(110027, 27530, 571, 1, 1, 0, 0, 3770.26, 749.045, 94.1753, 1.99355, 300, 0, 0, 102820, 0, 0),
(110025, 27530, 571, 1, 1, 0, 0, 3907.35, 866.472, 56.2255, 2.1293, 300, 0, 0, 102820, 0, 0);
UPDATE creature SET position_x = '3678.088379', position_y = '938.619629', position_z = '57.220123', orientation = '1.509713' WHERE guid = '114299';
UPDATE creature SET position_x = '3722.784180', position_y = '872.281616', position_z = '56.447071', orientation = '3.565874' WHERE guid = '114298';
DELETE FROM `creature` WHERE `guid` = 118693;
DELETE FROM `creature` WHERE `guid` = 118694;
DELETE FROM `creature` WHERE `guid` = 118695;
DELETE FROM `creature` WHERE `guid` = 118696;
DELETE FROM `creature` WHERE `guid` = 118697;
DELETE FROM `creature` WHERE `guid` = 118698;
DELETE FROM `creature` WHERE `guid` = 118699;
DELETE FROM `creature` WHERE `guid` = 118700;
DELETE FROM `creature` WHERE `guid` = 118701;
DELETE FROM `creature` WHERE `guid` = 118702;
DELETE FROM `creature` WHERE `guid` = 118703;
DELETE FROM `creature` WHERE `guid` = 118704;
DELETE FROM `creature` WHERE `guid` = 118705;
DELETE FROM `creature` WHERE `guid` = 118706;
DELETE FROM `creature` WHERE `guid` = 118707;
DELETE FROM `creature` WHERE `guid` = 118708;
DELETE FROM `creature` WHERE `guid` = 118709;
DELETE FROM `creature` WHERE `guid` = 118710;
DELETE FROM `creature` WHERE `guid` = 118711;
DELETE FROM `creature` WHERE `guid` = 118712;
DELETE FROM `creature` WHERE `guid` = 118713;
DELETE FROM `creature` WHERE `guid` = 118714;
UPDATE quest_template SET ReqSpellCast1 =0 WHERE entry=12588;
DELETE FROM `spell_script_target` WHERE `entry` = 51333 AND `type` = 0 AND `targetEntry` = 190550;
UPDATE quest_template SET ReqSpellCast1 =0 WHERE entry=11314;
UPDATE quest_template SET ReqSpellCast1=0 WHERE entry=11880;
REPLACE INTO `creature_ai_scripts` VALUES ('2588251', '25882', '8', '0', '100', '1', '46281', '-1', '1000', '1000', '33', '25882', '6', '0', '41', '1000', '0', '0', '0', '0', '0', '0', 'ytdb-q11880');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '25882';
DELETE FROM `creature` WHERE `guid` = 58954;
DELETE FROM `creature_addon` WHERE `guid` = 58954;
UPDATE quest_template SET ReqSpellCast1=0 WHERE entry=10813;
REPLACE INTO `creature_ai_scripts` VALUES ('2217751', '22177', '8', '0', '100', '1', '38530', '-1', '1000', '1000', '33', '22177', '6', '0', '28', '6', '38495', '0', '0', '0', '0', '0', 'ytdb-q10813');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '22177';
UPDATE quest_template SET ReqSpellCast1=0 WHERE entry=7001;
UPDATE creature_template SET unit_flags=unit_flags|768 WHERE entry=21181;
UPDATE creature_template SET MovementType='0' WHERE entry IN (21686);
delete from creature_linking_template where entry in (21687,21686);
insert into creature_linking_template values (21686, 530, 21685, 3),(21687, 530, 21685, 3);
delete from event_scripts where id=13961;
INSERT INTO event_scripts (id, delay, command, datalong, datalong2, dataint, x, y, z, o, comments) VALUES
('13961', '32','10', '21181', '300000', '0', -3587.79,1805.4,39.66,1.65,''),
('13961', '40', '10', '21685', '300000', '0', -3604.35, 1917.03, 48.26, 4.90,''),
('13961', '40', '10', '21687', '300000', '0', -3599.71, 1921.66, 49.20, 4.90,''),
('13961', '40', '10', '21686', '300000', '0', -3610.05, 1919.59, 48.76, 4.90,'');
REPLACE INTO gameobject (guid, id, map, spawnMask, position_x, position_y, position_z, orientation, spawntimesecs) VALUES ('7737', '185170', '530', '1', '-3600.66', '1924.08', '57.9', '4.83', '-800');
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='24117' WHERE `entry`=11314;
UPDATE creature_template SET gossip_menu_id = 6464 WHERE entry = 5118;
UPDATE gossip_menu SET entry = 6464 WHERE entry = 50321;
UPDATE gossip_menu_option SET menu_id = 6464 WHERE menu_id = 50321;
UPDATE locales_gossip_menu_option SET menu_id = 6464 WHERE menu_id = 50321;
UPDATE gossip_menu SET text_id =7657 WHERE entry=6464 AND text_id=7658;
UPDATE creature_template SET gossip_menu_id = 6469 WHERE entry = 7410;
UPDATE gossip_menu SET entry = 6469 WHERE entry = 50323;
UPDATE gossip_menu_option SET menu_id = 6469 WHERE menu_id = 50323;
UPDATE locales_gossip_menu_option SET menu_id = 6469 WHERE menu_id = 50323;
UPDATE creature_template SET gossip_menu_id = 6468 WHERE entry = 7427;
UPDATE gossip_menu SET entry = 6468 WHERE entry = 50324;
UPDATE gossip_menu_option SET menu_id = 6468 WHERE menu_id = 50324;
UPDATE locales_gossip_menu_option SET menu_id = 6468 WHERE menu_id = 50324;
UPDATE gossip_menu SET text_id =7616 WHERE entry=6468 AND text_id=7683;
UPDATE creature_template SET gossip_menu_id = 6467 WHERE entry = 14942;
UPDATE gossip_menu SET entry = 6467 WHERE entry = 50326;
UPDATE gossip_menu_option SET menu_id = 6467 WHERE menu_id = 50326;
UPDATE locales_gossip_menu_option SET menu_id = 6467 WHERE menu_id = 50326;
UPDATE gossip_menu SET text_id =7616 WHERE entry=6467 AND text_id=7683;
UPDATE creature_template SET gossip_menu_id = 6466 WHERE entry = 347;
UPDATE gossip_menu SET entry = 6466 WHERE entry = 50322;
UPDATE gossip_menu_option SET menu_id = 6466 WHERE menu_id = 50322;
UPDATE locales_gossip_menu_option SET menu_id = 6466 WHERE menu_id = 50322;
UPDATE gossip_menu SET text_id =7616 WHERE entry=6466 AND text_id=7683;
UPDATE creature_template SET gossip_menu_id = 8250 WHERE entry = 16695;
UPDATE gossip_menu SET entry = 8250 WHERE entry = 50328;
UPDATE gossip_menu_option SET menu_id = 8250 WHERE menu_id = 50328;
UPDATE locales_gossip_menu_option SET menu_id = 8250 WHERE menu_id = 50328;
UPDATE gossip_menu SET text_id =7616 WHERE entry=8250 AND text_id=7683;
UPDATE gossip_menu SET text_id =10269 WHERE entry=8250 AND text_id=7684;
UPDATE creature_template SET gossip_menu_id = 8253 WHERE entry = 20119;
UPDATE gossip_menu SET entry = 8253 WHERE entry = 50329;
UPDATE gossip_menu_option SET menu_id = 8253 WHERE menu_id = 50329;
UPDATE locales_gossip_menu_option SET menu_id = 8253 WHERE menu_id = 50329;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8453,7694);
UPDATE `gossip_menu` SET `cond_1`='0', `cond_1_val_1`='0', `cond_1_val_2`='0' WHERE `entry`=8453 AND `text_id`=7693;
UPDATE `gossip_menu` SET `cond_1`='15', `cond_1_val_1`='51', `cond_1_val_2`='1', `cond_2`='4', `cond_2_val_1`='3703', `cond_2_val_2`='1' WHERE `entry`=8453 AND `text_id`=7694;
UPDATE `gossip_menu` SET `cond_1`='15', `cond_1_val_1`='51', `cond_1_val_2`='1', `cond_2`='4', `cond_2_val_1`='3703' WHERE `entry`=8453 AND `text_id`=10560;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (6484,10570);
UPDATE `gossip_menu`SET`cond_2`='4', `cond_2_val_1`='3703', `cond_2_val_2`='1' WHERE `entry`=6484 AND `text_id`=7684;
UPDATE `gossip_menu`SET`cond_1`='15', `cond_1_val_1`='51', `cond_1_val_2`='1', `cond_2`='4', `cond_2_val_1`='3703' WHERE `entry`=6484 AND `text_id`=10570;
UPDATE `quest_template` SET `ReqCreatureOrGOId3`='19266' WHERE `entry`=10137;
UPDATE `quest_template` SET `ReqCreatureOrGOId3`='19265' WHERE `entry`=10155;
UPDATE `quest_template` SET `ReqCreatureOrGOId3`='22368' WHERE `entry`=10720;
#
UPDATE `quest_template` SET `ReqCreatureOrGOId2`='22367' WHERE `entry`=10720;
UPDATE `quest_template` SET `ReqCreatureOrGOId2`='36189' WHERE `entry`=12734;
#
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='22356' WHERE `entry`=10720;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='11937' WHERE `entry`=5581;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='16031' WHERE `entry`=8945;
#
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='21959' WHERE `entry`=10612;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='21959' WHERE `entry`=10613;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='23797' WHERE `entry`=11174;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='24035' WHERE `entry`=11265;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='24035' WHERE `entry`=11231;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='27445' WHERE `entry`=12274;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='30381' WHERE `entry`=13037;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='36764' WHERE `entry`=24498;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='36770' WHERE `entry`=24507;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='38153' WHERE `entry`=24748;
#
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='-181653' WHERE `entry`=9444;
DELETE FROM `gameobject_template` WHERE `entry` = 300145;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=10430 AND `item`=12731;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-25' WHERE `item` in (8973,18947);
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`='-50' WHERE `item` in (8973,18947);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-50' WHERE `item` in (23677);
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `item` in (23677);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='15' WHERE `item` in (12607);
UPDATE `pickpocketing_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `item` in (2676,37350);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-25' WHERE `item` in (2676);
DELETE FROM `pickpocketing_loot_template` WHERE `item` in (3692,35188,24543,23165,20023,18945,9741,9523,9252,9234,6181,5490,5085,4510);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='50' WHERE `item` in (35188);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-50' WHERE `item` in (23165);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='25' WHERE `item` in (18945);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-25' WHERE `item` in (20023);
UPDATE `pickpocketing_loot_template` SET `ChanceOrQuestChance`='-50' WHERE `item` in (7208);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-25' WHERE `item` in (9523);
UPDATE `reference_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1' WHERE `entry`=16652;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='1' WHERE `item`=16652;
UPDATE `quest_template` SET `ExclusiveGroup`='13592' WHERE `entry` in (13592,13744,13749,13755,13760);
UPDATE `quest_template` SET `ExclusiveGroup`='13765' WHERE `entry` in (13765,13771,13776,13781,13786);
UPDATE `quest_template` SET `ExclusiveGroup`='13665' WHERE `entry` in (13756,13665,13745,13750,13761);
UPDATE `quest_template` SET `ExclusiveGroup`='13767' WHERE `entry` in (13767,13772,13777,13782,13787);
UPDATE `quest_template` SET `ExclusiveGroup`='13847' WHERE `entry` in (13847,13851,13852,13854,13855);
UPDATE `quest_template` SET `ExclusiveGroup`='13856' WHERE `entry` in (13856,13857,13858,13859,13860);
UPDATE `quest_template` SET `ExclusiveGroup`='13600' WHERE `entry` in (13600,13603,13616,13741,13742,13743,13746,13747,13748,13752,13753,13754,13757,13758,13759);
UPDATE `quest_template` SET `ExclusiveGroup`='13762' WHERE `entry` in (13762,13763,13764,13768,13769,13770,13773,13774,13775,13778,13779,13780,13783,13784,13785);
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='28293', `ReqCreatureOrGOId2`='28294', `ReqCreatureOrGOId3`='28295', `ReqCreatureOrGOId4`='28296', `ReqCreatureOrGOCount1`='1', `ReqCreatureOrGOCount2`='1', `ReqCreatureOrGOCount3`='1', `ReqCreatureOrGOCount4`='1' WHERE `entry`=12557;
UPDATE `quest_template` SET `ReqCreatureOrGOId2`='16254', `ReqCreatureOrGOCount2`='1' WHERE `entry`=9165;
UPDATE `quest_template` SET `ReqCreatureOrGOId2`='38211', `ReqCreatureOrGOCount2`='1' WHERE `entry` in (24500,24802);
UPDATE `quest_template` SET `ReqCreatureOrGOId2`='29550', `ReqCreatureOrGOCount2`='1' WHERE `entry`=12847;
UPDATE `quest_template` SET `ReqCreatureOrGOId2`='25794', `ReqCreatureOrGOCount2`='1' WHERE `entry`=11723;
UPDATE `quest_template` SET `ReqCreatureOrGOId2`='25742', `ReqCreatureOrGOCount2`='1' WHERE `entry`=11706;
UPDATE `quest_template` SET `SpecialFlags`='2', `ReqCreatureOrGOId1`='0', `ReqCreatureOrGOId2`='0', `ReqCreatureOrGOCount1`='0', `ReqCreatureOrGOCount2`='0' WHERE `entry`=10879;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='34737', `ReqCreatureOrGOCount1`='5' WHERE `entry`=14023;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='34740', `ReqCreatureOrGOCount1`='5' WHERE `entry`=14024;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='34741', `ReqCreatureOrGOCount1`='5' WHERE `entry`=14028;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='34739', `ReqCreatureOrGOCount1`='5' WHERE `entry`=14033;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='34738', `ReqCreatureOrGOCount1`='5' WHERE `entry`=14035;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='34737', `ReqCreatureOrGOCount1`='5' WHERE `entry`=14037;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='34740', `ReqCreatureOrGOCount1`='5' WHERE `entry`=14040;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='34741', `ReqCreatureOrGOCount1`='5' WHERE `entry`=14041;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='34739', `ReqCreatureOrGOCount1`='5' WHERE `entry`=14043;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='34738', `ReqCreatureOrGOCount1`='5' WHERE `entry`=14047;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='32314', `ReqCreatureOrGOCount1`='1' WHERE `entry` in (13365,13358,13342);
UPDATE `quest_template` SET `SpecialFlags`='2',`ReqCreatureOrGOId1`='0',`ReqCreatureOrGOCount1`='0' WHERE `entry`=13219;
UPDATE `quest_template` SET `SpecialFlags`='2',`ReqCreatureOrGOId1`='0',`ReqCreatureOrGOCount1`='0' WHERE `entry`=13214;
UPDATE `quest_template` SET `SpecialFlags`='2',`ReqCreatureOrGOId1`='0',`ReqCreatureOrGOCount1`='0' WHERE `entry`=13215;
UPDATE `quest_template` SET `SpecialFlags`='2',`ReqCreatureOrGOId1`='0',`ReqCreatureOrGOCount1`='0' WHERE `entry`=13216;
UPDATE `quest_template` SET `SpecialFlags`='2',`ReqCreatureOrGOId1`='0',`ReqCreatureOrGOCount1`='0' WHERE `entry`=13217;
UPDATE `quest_template` SET `SpecialFlags`='2',`ReqCreatureOrGOId1`='0',`ReqCreatureOrGOCount1`='0' WHERE `entry`=13218;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='32821', `ReqCreatureOrGOCount1`='1' WHERE `entry`=13059;
UPDATE `quest_template` SET `SpecialFlags`='2',`ReqCreatureOrGOId1`='0',`ReqCreatureOrGOCount1`='0' WHERE `entry`=12932;
UPDATE `quest_template` SET `SpecialFlags`='2',`ReqCreatureOrGOId1`='0',`ReqCreatureOrGOCount1`='0' WHERE `entry`=12933;
UPDATE `quest_template` SET `SpecialFlags`='2',`ReqCreatureOrGOId1`='0',`ReqCreatureOrGOCount1`='0' WHERE `entry`=12935;
UPDATE `quest_template` SET `SpecialFlags`='2',`ReqCreatureOrGOId1`='0',`ReqCreatureOrGOCount1`='0' WHERE `entry`=12936;
UPDATE `quest_template` SET `SpecialFlags`='2',`ReqCreatureOrGOId1`='0',`ReqCreatureOrGOCount1`='0' WHERE `entry`=12948;
UPDATE `quest_template` SET `SpecialFlags`='2',`ReqCreatureOrGOId1`='0',`ReqCreatureOrGOCount1`='0' WHERE `entry`=12954;
UPDATE `quest_template` SET `SpecialFlags`='2',`ReqCreatureOrGOId1`='0',`ReqCreatureOrGOCount1`='0' WHERE `entry` in (12721,12330,11705,12431,12430,12429,12427,7001,9759,10409,10946,11198,12428);
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='18458',`ReqCreatureOrGOCount1`='1' WHERE `entry`=9958;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='27995',`ReqCreatureOrGOCount1`='1' WHERE `entry`=11909;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='27995',`ReqCreatureOrGOCount1`='1' WHERE `entry`=11798;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='28013',`ReqCreatureOrGOCount1`='1' WHERE `entry`=12243;
UPDATE `quest_template` SET `ReqCreatureOrGOId1`='28762',`ReqCreatureOrGOCount1`='1' WHERE `entry`=12677;
UPDATE quest_template SET ReqSpellCast1=0 WHERE entry=12330;
UPDATE `game_event` SET `start_time`='2012-04-08 00:01:00' WHERE `entry`=9;
UPDATE `game_event` SET `start_time`='2012-04-29 00:01:00' WHERE `entry`=10;
UPDATE `creature_template` SET `unit_flags`='8', `InhabitType`='7' WHERE `entry`=28511;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=10257 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=10257 AND `id`=1;
UPDATE `gossip_menu` SET `text_id`='14231' WHERE `entry`=8064 AND `text_id`=14239;
UPDATE `gossip_menu` SET `text_id`='14230' WHERE `entry`=7931 AND `text_id`=14239;
UPDATE `gossip_menu` SET `text_id`='14229' WHERE `entry`=7923 AND `text_id`=14239;
UPDATE `gossip_menu` SET `text_id`='14236' WHERE `entry`=7935 AND `text_id`=14239;
UPDATE `gossip_menu` SET `text_id`='14232' WHERE `entry`=7898 AND `text_id`=14239;
UPDATE `gossip_menu` SET `text_id`='14227' WHERE `entry`=7921 AND `text_id`=14239;
UPDATE `gossip_menu` SET `text_id`='14234' WHERE `entry`=7925 AND `text_id`=14239;
UPDATE `gossip_menu` SET `text_id`='14235' WHERE `entry`=7926 AND `text_id`=14239;
UPDATE `gossip_menu` SET `text_id`='14237' WHERE `entry`=7927 AND `text_id`=14239;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=6597 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=6598 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=6597 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=6598 AND `id`=1;
UPDATE `creature_template` SET `flags_extra`=`flags_extra` &~ 128 WHERE `entry` IN (34704,34720);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8446,10553);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8490,10602);
UPDATE creature_template SET gossip_menu_id = 8490 WHERE entry = 22099;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(8490, 0, 1, 'I want to browse your goods.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE creature_template SET gossip_menu_id = 8436 WHERE entry = 22019;
UPDATE gossip_menu SET entry = 8436 WHERE entry = 22019;
UPDATE gossip_menu_option SET menu_id = 8436 WHERE menu_id = 22019;
UPDATE locales_gossip_menu_option SET menu_id = 8436 WHERE menu_id = 22019;
UPDATE `gossip_menu_option` SET `action_menu_id`='8435' WHERE `menu_id`=8436 AND `id`=0;
UPDATE gossip_menu SET entry = 8435 WHERE entry = 50136;
UPDATE gossip_menu_option SET menu_id = 8435 WHERE menu_id = 50136;
UPDATE locales_gossip_menu_option SET menu_id = 8435 WHERE menu_id = 50136;
UPDATE `gossip_menu_option` SET `action_menu_id`='8437' WHERE `menu_id`=8435 AND `id`=0;
UPDATE gossip_menu SET entry = 8437 WHERE entry = 50137;
UPDATE gossip_menu_option SET menu_id = 8437 WHERE menu_id = 50137;
UPDATE locales_gossip_menu_option SET menu_id = 8437 WHERE menu_id = 50137;
UPDATE `gossip_menu_option` SET `action_menu_id`='8438' WHERE `menu_id`=8437 AND `id`=0;
UPDATE gossip_menu SET entry = 8438 WHERE entry = 50138;
UPDATE gossip_menu_option SET menu_id = 8438 WHERE menu_id = 50138;
UPDATE locales_gossip_menu_option SET menu_id = 8438 WHERE menu_id = 50138;
UPDATE `gossip_menu_option` SET `action_menu_id`='8439' WHERE `menu_id`=8438 AND `id`=0;
UPDATE gossip_menu SET entry = 8439 WHERE entry = 50139;
UPDATE gossip_menu_option SET menu_id = 8439 WHERE menu_id = 50139;
UPDATE locales_gossip_menu_option SET menu_id = 8439 WHERE menu_id = 50139;
UPDATE `gossip_menu_option` SET `action_menu_id`='8440' WHERE `menu_id`=8439 AND `id`=0;
UPDATE gossip_menu SET entry = 8440 WHERE entry = 50140;
UPDATE `creature_template` SET `gossip_menu_id`='8446' WHERE `entry`in (21382,21383,21637);
DELETE FROM `spell_loot_template` WHERE `entry` = 58172 AND `item` = 5500;
DELETE FROM `spell_loot_template` WHERE `entry` = 58172 AND `item` = 5504;
UPDATE `spell_loot_template` SET `ChanceOrQuestChance`='5', `groupid`='0' WHERE `entry`=58172 AND `item`=5498;
UPDATE `spell_loot_template` SET `ChanceOrQuestChance`='100', `groupid`='0' WHERE `entry`=58172 AND `item`=5503;
DELETE FROM `creature_loot_template` WHERE `entry` = 30846 AND `item` = 45909;
UPDATE `spell_loot_template` SET `groupid`='0' WHERE `entry`=64202 AND `item`=36783;
UPDATE `spell_loot_template` SET `groupid`='0' WHERE `entry`=64202 AND `item`=36784;
UPDATE `spell_loot_template` SET `mincountOrRef`='1' WHERE `entry`=64202 AND `item`=36782;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='1' WHERE `item`=44700;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='50' WHERE `entry`=44700 AND `item`=36783;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=44700 AND `item`=36784;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='20' WHERE `item`=36781;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='30' WHERE `item`=24476;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='50' WHERE `item`=7973;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='40' WHERE `item`=5523;
UPDATE `spell_loot_template` SET `ChanceOrQuestChance`='100', `groupid`='0' WHERE `entry`=57844 AND `item`=36782;
UPDATE `spell_loot_template` SET `ChanceOrQuestChance`='50', `groupid`='0' WHERE `entry`=57844 AND `item`=36783;
UPDATE `spell_loot_template` SET `ChanceOrQuestChance`='5', `groupid`='0' WHERE `entry`=57844 AND `item`=36784;
UPDATE `spell_loot_template` SET `maxcount`='1' WHERE `entry`=57844 AND `item`=36782;
DELETE FROM `spell_loot_template` WHERE `entry` = 58160 AND `item` = 36782;
UPDATE `spell_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=58160 AND `item`=13926;
UPDATE `spell_loot_template` SET `ChanceOrQuestChance`='15' WHERE `entry`=58160 AND `item`=24478;
UPDATE `spell_loot_template` SET `ChanceOrQuestChance`='1' WHERE `entry`=58160 AND `item`=24479;
DELETE FROM `spell_loot_template` WHERE `entry` = 58165 AND `item` = 4655;
DELETE FROM `spell_loot_template` WHERE `entry` = 58165 AND `item` = 5504;
DELETE FROM `spell_loot_template` WHERE `entry` = 58165 AND `item` = 36782;
UPDATE `spell_loot_template` SET `ChanceOrQuestChance`='3' WHERE `entry`=58165 AND `item`=5500;
UPDATE `spell_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=58165 AND `item`=7971;
UPDATE `spell_loot_template` SET `ChanceOrQuestChance`='0.5' WHERE `entry`=58165 AND `item`=13926;
UPDATE `creature_loot_template` SET `maxcount`='2' WHERE `item`=15924;
DELETE FROM `spell_loot_template` WHERE `entry` = 58168 AND `item` = 888;
DELETE FROM `spell_loot_template` WHERE `entry` = 58168 AND `item` = 5503;
DELETE FROM `spell_loot_template` WHERE `entry` = 58168 AND `item` = 36782;
UPDATE `spell_loot_template` SET `ChanceOrQuestChance`='5', `groupid`='0' WHERE `entry`=58168 AND `item`=5498;
UPDATE `spell_loot_template` SET `ChanceOrQuestChance`='2.5', `groupid`='0' WHERE `entry`=58168 AND `item`=5500;
UPDATE `spell_loot_template` SET `ChanceOrQuestChance`='100', `groupid`='0' WHERE `entry`=58168 AND `item`=5504;
DELETE FROM `creature_loot_template` WHERE `entry` = 28111 AND `item` = 36784;
DELETE FROM `spell_loot_template` WHERE `entry` = 61898 AND `item` = 36782;
UPDATE `spell_loot_template` SET `item`='43722', `mincountOrRef`='-43722' WHERE `entry`=60445 AND `item`=36782;
REPLACE INTO `spell_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES ('60445', '43723', '100', '0', '-43723', '1');
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(8827, 8827, 23, 1, 2, 3),
(8827, 19971, 0.5, 5, 1, 1),
(8827, 33448, 0, 1, 1, 1),
(8827, 33820, 1.1, 5, 1, 1),
(8827, 34834, 0.8, 5, 1, 1),
(8827, 36783, 0, 2, 1, 3),
(8827, 36784, 0, 6, 1, 1),
(8827, 40195, 46, 1, 3, 5),
(8827, 44983, 1.1, 5, 1, 1),
(8827, 45861, 0, 2, 1, 1),
(8827, 45862, 0, 7, 1, 1),
(8827, 45879, 0, 7, 1, 1),
(8827, 45880, 20, 7, 1, 1),
(8827, 45881, 0, 7, 1, 1),
(8827, 45882, 0, 7, 1, 1),
(8827, 45883, 30, 7, 1, 1),
(8827, 45977, 7, 4, 1, 1),
(8827, 45978, 37, 4, 2, 5),
(8827, 45979, 0, 4, 1, 1),
(8827, 45980, 0, 4, 1, 1),
(8827, 45981, 0, 4, 1, 1),
(8827, 45984, 0, 2, 1, 1),
(8827, 45987, 0, 7, 1, 1),
(8827, 45991, 0.4, 5, 1, 1),
(8827, 45992, 0.4, 5, 1, 1),
(8827, 45998, 0, 2, 1, 1),
(8827, 45999, 0, 3, 1, 3),
(8827, 46000, 0, 3, 1, 3),
(8827, 46001, 0, 3, 1, 3),
(8827, 46002, 0, 3, 1, 3),
(8827, 46003, 0, 3, 1, 3),
(8827, 46006, 23, 1, 1, 1),
(8827, 46023, 0, 6, 1, 1),
(8827, 46359, 0, 3, 1, 1),
(8827, 46360, 0, 6, 1, 1),
(8827, 46361, 0, 3, 2, 2);
DELETE FROM `item_loot_template` WHERE `entry` = 46007;
REPLACE INTO `item_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(46007, 0, 22, 2, -8827, 1),
(46007, 1, 48, 3, -8827, 1),
(46007, 2, 29, 4, -8827, 1),
(46007, 3, 100, 5, -8827, 1),
(46007, 4, 2.5, 6, -8827, 1),
(46007, 5, 1, 7, -8827, 1),
(46007, 6522, 50, 0, 2, 4),
(46007, 10099, 100, 1, -8827, 1),
(46007, 45986, 0.3, 0, 1, 1),
(46007, 46004, 5, 1, 1, 1),
(46007, 48679, 3, 1, 1, 1);
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=5738 AND `item`=5692;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=5738 AND `item`=5693;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=5738 AND `item`=5694;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=5738 AND `item`=5695;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=5738 AND `item`=5737;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=11568 AND `item`=11569;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=11568 AND `item`=11570;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='-33' WHERE `entry`=15103 AND `item`=12234;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='-33' WHERE `entry`=15102 AND `item`=12236;
DELETE FROM `creature_loot_template` WHERE `entry` = 16903 AND `item` = 23339;
DELETE FROM `creature_loot_template` WHERE `entry` = 20158 AND `item` = 23339;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 184115 AND `item` = 23339;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=31955 AND `item`=23339;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=24336 AND `item`=23682;
DELETE FROM `creature_loot_template` WHERE `item` = 24403;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='50' WHERE `entry`=24402 AND `item`=24403;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1' WHERE`entry`=24402 AND `item`=24404;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='50' WHERE `entry`=24402 AND `item`=24405;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1' WHERE `entry`=24402 AND `item`=24406;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='50' WHERE `entry`=24402 AND `item`=24408;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1' WHERE `entry`=24402 AND `item`=24540;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 785;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 2447;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 2449;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 2450;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 2452;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 2453;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 3357;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 3358;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 3818;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 3819;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 3820;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 3821;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 4625;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 8831;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 8836;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 8838;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 8839;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 8845;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 8846;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 13463;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 13464;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 13465;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 13466;
DELETE FROM `item_loot_template` WHERE `entry` = 24402 AND `item` = 13467;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='1', `mincountOrRef`='-765' WHERE `entry`=24402 AND `item`=765;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(765, 765, 0, 1, 1, 1),(765, 785, 0, 1, 1, 1),(765, 2447, 0, 1, 1, 1),
(765, 2449, 0, 1, 1, 1),(765, 2450, 0, 1, 1, 1),(765, 2452, 0, 1, 1, 1),
(765, 2453, 0, 1, 1, 1),(765, 3357, 0, 1, 1, 1),(765, 3358, 0, 1, 1, 1),
(765, 3818, 0, 1, 1, 1),(765, 3819, 0, 1, 1, 1),(765, 3820, 0, 1, 1, 1),
(765, 3821, 0, 1, 1, 1),(765, 4625, 0, 1, 1, 1),(765, 8831, 0, 1, 1, 1),
(765, 8836, 0, 1, 1, 1),(765, 8838, 0, 1, 1, 1),(765, 8839, 0, 1, 1, 1),
(765, 8845, 0, 1, 1, 1),(765, 8846, 0, 1, 1, 1),(765, 13463, 0, 1, 1, 1),
(765, 13464, 0, 1, 1, 1),(765, 13465, 0, 1, 1, 1),(765, 13466, 0, 1, 1, 1),
(765, 13467, 0, 1, 1, 1);
DELETE FROM `creature_loot_template` WHERE `item` in (24406,24405,24404,30652,30651);
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34593 AND `item`=29739;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34594 AND `item`=29739;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34595 AND `item`=29740;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34592 AND `item`=29740;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1' WHERE `entry`=9276 AND `item`=9251;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1' WHERE `entry`=9276 AND `item`=9252;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1' WHERE `entry`=9276 AND `item`=9253;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34592 AND `item`=30809;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34595 AND `item`=30809;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34587 AND `item`=30809;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34594 AND `item`=30810;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34593 AND `item`=30810;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='100' WHERE `entry`=34585 AND `item`=30810;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '-100' WHERE `entry` = 31522 AND `item` = 31524;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '-100' WHERE `entry` = 31522 AND `item` = 31525;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '-100' WHERE `entry` = 32462 AND `item` = 32449;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '-100' WHERE `entry` = 33045 AND `item` = 33040;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '-100' WHERE `entry` = 33045 AND `item` = 33044;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '-100' WHERE `entry` = 34871 AND `item` = 34869;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '-100' WHERE `entry` = 34871 AND `item` = 34870;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=271 AND `item`=2640;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=271 AND `item`=7249;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=164662 AND `item`=11127;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=171938 AND `item`=11583;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 2087 AND `item` = 3920;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 2086 AND `item` = 3921;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 41 AND `item` = 4610;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 124389 AND `item` = 4610;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 19021 AND `item` = 5519;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 103664 AND `item` = 5535;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=19541 AND `item`=5570;
DELETE FROM `creature_loot_template` WHERE `item` in (5056,6175,23776);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 179493 AND `item` = 6175;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 21277 AND `item` = 6684;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='100' WHERE `item` in (19813,19814,19815,19816,19817,19818,19819,19820,19821);
UPDATE `gameobject_template` SET `flags` = 4 WHERE `entry` = 201794;
UPDATE `gameobject` SET `id`=183046 WHERE `id`=142143 AND `map`=530;
UPDATE `gameobject_template` SET `data1`='183046' WHERE `entry`=183046;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(183046, 8839, 100, 0, 1, 3),
(183046, 24401, 10, 0, 1, 1);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 142143 AND `item` = 24401;
UPDATE `gameobject` SET `id`='183045' WHERE `guid` in (26126,97369,97359,97350,97345,97337,97317,97333,26122,26123,97319,97321,97288,97285,26125,97283,26128,97272,97273,97382,97391,97393,97394,97259,97257,97254,97250,97240,26127,97232,97229,97226,97224,97199,97197,26124,97133,97139,97145,26130,97150,71135,97153,97151,97167,26129,97170,97178,97281,97180);
UPDATE `gameobject_template` SET `data1`='183045' WHERE `entry`=183045;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(183045, 22575, 15, 0, 1, 3),
(183045, 22786, 100, 0, 1, 3),
(183045, 22794, 2, 0, 1, 1),
(183045, 24401, 10, 0, 1, 1),
(183045, 35229, -50, 0, 1, 1);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 181271 AND `item` = 24401;
UPDATE `gameobject` SET `id`=183043 WHERE `id`=181275 AND `map`=530;
UPDATE `gameobject_template` SET `data1`='183043' WHERE `entry`=183043;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(183043, 22575, 15, 0, 1, 3),
(183043, 22787, 100, 0, 1, 3),
(183043, 22794, 2, 0, 1, 1),
(183043, 24401, 10, 0, 1, 1),
(183043, 35229, -50, 0, 1, 1);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 181275 AND `item` = 24401;
UPDATE `gameobject` SET `id`='183044' WHERE `guid` in (24519,24510,24509,24508,24507,24512,24511,24506,24520,24522,24521,24505,24504,24513,24503,24514,24515,24516,24495,24494,24493,24496,24492,24498,24497,24491,24490,24489,24499,24500,24501,24502,24518,24517,24478,24476,24477,24474,24475,24473,24472,24471,24470,24469,24479,24416,24415,24414,24413,24412,24411,24410,24409,24480,24430,24429,24428,27625,24427,24426,24425,24419,24468,24466,24467,24465,24417,24418,24431,24432,24433,24434,24435,24436,24438,97304,24421,24423,24464,24463,26111,24462,24461,24460,24457,24459,24458,24456,24455,24482,24454,24453,24452,24448,24451,97279,24450,24449,24487,24488,24485,24486,24484,24447,24446,24443,24444,24445,24442,24441,24483,24440,24422,24424,24481,24439);
UPDATE `gameobject_template` SET `data1`='183044' WHERE `entry`=183044;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(183044, 22575, 15, 0, 1, 2),
(183044, 22785, 100, 0, 1, 3),
(183044, 22794, 2, 0, 1, 1),
(183044, 22795, 10, 0, 1, 1),
(183044, 24401, 10, 0, 1, 1),
(183044, 35229, -50, 0, 1, 1);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 181270 AND `item` = 24401;
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('2846', '14346', '0', 'Tattered Chest');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14346', '1', 'Tattered Chest');
UPDATE `creature_template` SET `lootid`='0' WHERE `entry`=14356;
UPDATE `creature_template` SET `lootid`='0' WHERE `entry`=17304;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('41', '1923', '-100', '0', '1', '1', '0', '0', '0');
DELETE FROM `gameobject` WHERE `guid` = 8453;
DELETE FROM `gameobject` WHERE `guid` = 9060;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-50' WHERE `item`=35222;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `item`=36725;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 192676 AND `item` = 43006;
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('192676', '14347', '0', 'Emerald Acorn');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14347', '6', 'Emerald Acorn');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(49694, 192676, 1, 1, 2, 7894.44, -2202.75, 480.957, 2.29935, 0, 0, 0.912631, 0.408784, 180, 100, 1),
(49715, 192676, 1, 1, 2, 7802.15, -2166.12, 476.387, 2.38573, 0, 0, 0.92943, 0.368999, 180, 100, 1),
(8453, 192676, 1, 1, 2, 7882.03, -2173.15, 479.581, 1.94198, 0, 0, 0.825445, 0.564483, 180, 100, 1),
(9060, 192676, 1, 1, 2, 7855.61, -2135.22, 485.808, 1.47859, 0, 0, 0.673767, 0.738944, 180, 100, 1),
(7738, 192676, 1, 1, 2, 7796.99, -2207.74, 466.963, 2.57423, 0, 0, 0.960032, 0.279892, 180, 100, 1),
(7739, 192676, 1, 1, 2, 7811.28, -2251.82, 460.215, 4.69481, 0, 0, 0.713295, -0.700864, 180, 100, 1),
(7740, 192676, 1, 1, 2, 7859.24, -2232.01, 464.467, 0.886413, 0, 0, 0.428838, 0.903381, 180, 100, 1);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14348', '20', 'Shipment of Animal Parts');
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
('44625', '14348', '0', 'Shipment of Animal Parts 1'),('44626', '14348', '0', 'Shipment of Animal Parts 1'),
('44627', '14348', '0', 'Shipment of Animal Parts 1'),('44628', '14348', '0', 'Shipment of Animal Parts 1'),
('44629', '14348', '0', 'Shipment of Animal Parts 1'),('44630', '14348', '0', 'Shipment of Animal Parts 1'),
('44631', '14348', '0', 'Shipment of Animal Parts 1'),('44632', '14348', '0', 'Shipment of Animal Parts 1'),
('44633', '14348', '0', 'Shipment of Animal Parts 1'),('44634', '14348', '0', 'Shipment of Animal Parts 1'),
('44635', '14348', '0', 'Shipment of Animal Parts 1'),('44636', '14348', '0', 'Shipment of Animal Parts 1'),
('47070', '14348', '0', 'Shipment of Animal Parts 2'),('47071', '14348', '0', 'Shipment of Animal Parts 2'),
('47076', '14348', '0', 'Shipment of Animal Parts 2'),('53211', '14348', '0', 'Shipment of Animal Parts 2'),
('47056', '14348', '0', 'Shipment of Animal Parts 3'),('47057', '14348', '0', 'Shipment of Animal Parts 3'),
('47074', '14348', '0', 'Shipment of Animal Parts 3'),('47075', '14348', '0', 'Shipment of Animal Parts 3'),
('47077', '14348', '0', 'Shipment of Animal Parts 3'),('47081', '14348', '0', 'Shipment of Animal Parts 3'),
('47082', '14348', '0', 'Shipment of Animal Parts 3'),('47058', '14348', '0', 'Shipment of Animal Parts 4'),
('47072', '14348', '0', 'Shipment of Animal Parts 4'),('47073', '14348', '0', 'Shipment of Animal Parts 4'),
('47078', '14348', '0', 'Shipment of Animal Parts 4'),('47079', '14348', '0', 'Shipment of Animal Parts 4'),
('47083', '14348', '0', 'Shipment of Animal Parts 4'),('47084', '14348', '0', 'Shipment of Animal Parts 4');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14349', '20', 'Scourge Scrap Metal');
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
('44677', '14349', '0', 'Scourge Scrap Metal 1'),('44678', '14349', '0', 'Scourge Scrap Metal 1'),
('44679', '14349', '0', 'Scourge Scrap Metal 1'),('44680', '14349', '0', 'Scourge Scrap Metal 1'),
('44681', '14349', '0', 'Scourge Scrap Metal 1'),('44682', '14349', '0', 'Scourge Scrap Metal 1'),
('44683', '14349', '0', 'Scourge Scrap Metal 1'),('44684', '14349', '0', 'Scourge Scrap Metal 1'),
('44685', '14349', '0', 'Scourge Scrap Metal 1'),('44686', '14349', '0', 'Scourge Scrap Metal 1'),
('44687', '14349', '0', 'Scourge Scrap Metal 1'),('44688', '14349', '0', 'Scourge Scrap Metal 1'),
('44689', '14349', '0', 'Scourge Scrap Metal 1'),('44690', '14349', '0', 'Scourge Scrap Metal 1'),
('44691', '14349', '0', 'Scourge Scrap Metal 1'),('44692', '14349', '0', 'Scourge Scrap Metal 1'),
('44693', '14349', '0', 'Scourge Scrap Metal 1'),('44694', '14349', '0', 'Scourge Scrap Metal 1'),
('44695', '14349', '0', 'Scourge Scrap Metal 1'),('44696', '14349', '0', 'Scourge Scrap Metal 1'),
('46756', '14349', '0', 'Scourge Scrap Metal 2'),('46758', '14349', '0', 'Scourge Scrap Metal 2'),
('52982', '14349', '0', 'Scourge Scrap Metal 2'),('52984', '14349', '0', 'Scourge Scrap Metal 2'),
('52986', '14349', '0', 'Scourge Scrap Metal 2'),('46759', '14349', '0', 'Scourge Scrap Metal 3'),
('46760', '14349', '0', 'Scourge Scrap Metal 3'),('52981', '14349', '0', 'Scourge Scrap Metal 3'),
('52983', '14349', '0', 'Scourge Scrap Metal 3'),('52985', '14349', '0', 'Scourge Scrap Metal 3'),
('52987', '14349', '0', 'Scourge Scrap Metal 3'),('46757', '14349', '0', 'Scourge Scrap Metal 4'),
('46761', '14349', '0', 'Scourge Scrap Metal 4'),('52988', '14349', '0', 'Scourge Scrap Metal 4');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14350', '12', 'Horn Fragment');
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
('47798', '14350', '0', 'Horn Fragment 2'),('47800', '14350', '0', 'Horn Fragment 2'),
('47698', '14350', '0', 'Horn Fragment 2'),('47699', '14350', '0', 'Horn Fragment 2'),
('47700', '14350', '0', 'Horn Fragment 2'),('47597', '14350', '0', 'Horn Fragment 1'),
('47598', '14350', '0', 'Horn Fragment 1'),('47599', '14350', '0', 'Horn Fragment 1'),
('47600', '14350', '0', 'Horn Fragment 1'),('47601', '14350', '0', 'Horn Fragment 1'),
('47602', '14350', '0', 'Horn Fragment 1'),('47603', '14350', '0', 'Horn Fragment 1'),
('47604', '14350', '0', 'Horn Fragment 1'),('47605', '14350', '0', 'Horn Fragment 1'),
('47606', '14350', '0', 'Horn Fragment 1'),('47607', '14350', '0', 'Horn Fragment 1'),
('47608', '14350', '0', 'Horn Fragment 1'),('47609', '14350', '0', 'Horn Fragment 1'),
('47610', '14350', '0', 'Horn Fragment 1'),('47611', '14350', '0', 'Horn Fragment 1'),
('47615', '14350', '0', 'Horn Fragment 1'),('47619', '14350', '0', 'Horn Fragment 1'),
('47620', '14350', '0', 'Horn Fragment 1');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14351', '10', 'Granite Boulder');
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
('46630', '14351', '0', 'Granite Boulder 1'),('46631', '14351', '0', 'Granite Boulder 1'),
('46635', '14351', '0', 'Granite Boulder 1'),('46637', '14351', '0', 'Granite Boulder 1'),
('46641', '14351', '0', 'Granite Boulder 1'),('52874', '14351', '0', 'Granite Boulder 1'),
('52875', '14351', '0', 'Granite Boulder 1'),('52876', '14351', '0', 'Granite Boulder 1'),
('46628', '14351', '0', 'Granite Boulder 2'),('46629', '14351', '0', 'Granite Boulder 2'),
('46633', '14351', '0', 'Granite Boulder 2'),('46636', '14351', '0', 'Granite Boulder 2'),
('46638', '14351', '0', 'Granite Boulder 2'),('52878', '14351', '0', 'Granite Boulder 2'),
('52879', '14351', '0', 'Granite Boulder 2');
UPDATE `creature_template` SET `lootid`='0' WHERE `entry`=28752;
DELETE FROM `creature_loot_template` WHERE `item` in (39156);
UPDATE `quest_template` SET `RequiredRaces`='0' WHERE `entry` in (866);
UPDATE `gameobject_template` SET `data1`='3725' WHERE `entry`=3725;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(3725, 765, 100, 0, 1, 3),
(3725, 5056, -25, 0, 1, 1);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1617 AND `item` = 5056;
UPDATE `gameobject` SET `id`='3725' WHERE `guid` in (13386,8903,10016,4799,5483,7932,8903,10908,5757,12259,5621,1096,438,14367,4408,89256,89253,89271,89265,89267,1670,89257,89258,6857,89110,89259,89262,939,89277,16731,12635,12052,16374,13787,7383,89119,10647,11450,3977,9038,8905,7618,16618,15151,16111,70966,3586,2449,1140,2878,89247,3789,8370,70970);
UPDATE `gameobject_template` SET `data1`='3724' WHERE `entry`=3724;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(3724, 2447, 100, 0, 1, 3),
(3724, 5056, -25, 0, 1, 1);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1618 AND `item` = 5056;
UPDATE `gameobject` SET `id`='3724' WHERE `guid` in (6560,188,6931,11319,31508,23080,10184,31522,8158,1146,5729,23088,1546,489,31524,11129,10575,9784,9984,2154,8964,11863,23087,23095,31525,23094,9731,31526,31527,31523,3445,10015,31519,14306,23083,10774,11096,31511,1007,27435,16622,15783,31512,167,8743,31520,11560,8632,5677,6967,11213,1292,23085,1051,13537,8764,9726,13576,1175,31514,613,15143,3512,521,31506,31518,2,13086,31507,8351,23082);
UPDATE `gameobject_template` SET `data1`='3726' WHERE `entry`=3726;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(3726, 2449, 100, 0, 1, 3),
(3726, 5056, -25, 0, 1, 1);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1619 AND `item` = 5056;
UPDATE `gameobject` SET `id`='3726' WHERE `guid` in (27457,27458,89275,89273,89261,89264,16307,5005,12010,27453,27454,6434,89269,12963,16309,27466,16304,16302,27449,89252,27451,89248,89246,89245,89244,11674,495,89237,3283,3190,89179,89197,89201,27452,6190,89148,89151,6361,3562,4908,15068,938,27465,27461,13366,89113,12529,27462,10269,12312,13815,3506,27469,2782,11465,27447,27448,27467,16308,27450);
UPDATE `gameobject_template` SET `data1`='3730' WHERE `entry`=3730;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(3730, 2453, 100, 0, 1, 3),
(3730, 5056, -25, 0, 1, 1);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1622 AND `item` = 5056;
UPDATE `gameobject` SET `id`='3730' WHERE `guid` in (11055,89281,89279,7707,7712,89276,11833,14505,6515,2420,6516,8793,2000,89164,13387,14394,8859,89162,13477,89170,89173,4265,89172,89178,8410,6021,89240,89241,2477,89243,89239,89199,89202,89200,89204,89205,89207,89210,89212,89211,89226,8483,89231,89232,89234,89233,13069,13801,2561,5625,16846,7767,10196,15183,916,16955,13685,89228,89229,7056,3327,89183,89187,8797,89185,89184);
UPDATE `gameobject_template` SET `data1`='3729' WHERE `entry`=3729;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(3729, 2450, 100, 0, 1, 3),
(3729, 2452, 40, 0, 1, 2),
(3729, 5056, -25, 0, 1, 1);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1621 AND `item` = 5056;
UPDATE `gameobject` SET `id`='3729' WHERE `guid` in (199,492,505,516,1559,1785,1813,1965,2490,2511,2715,2772,2799,2804,3153,3411,3781,3974,4128,4131,4313,4651,4753,4761,4932,5059,5421,5827,6197,6198,6642,6820,7146,8027,8228,8336,8342,8353,8402,8580,8662,8698,8805,9082,9448,9543,9716,9765,9837,10029,10049,10082,10314,10711,11216,11743,12048,12116,12152,13218,13284,13309,13323,13357,13382,13521,14589,14978,16708,27470,27471,27475,27478,27481,27482,27484,27489,27490,27491,27492,27493,27497,27498,27499,27501,27502,27505,27506,89107,89108,89109,89111,89112,89114,89115,89116,89117,89118,89149,89152,89163,89166,89167,89169,89175,89176,89181,89188,89192,89196,89208,89214,89217,89220,89221,89224,89236,89238,89242,89249,89250,89251,89254,89255,89260,89263,89266,89268,89270,89272,89274,89278,89280);
UPDATE `gameobject_template` SET `data1`='3727' WHERE `entry`=3727;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(3727, 785, 100, 0, 1, 3),
(3727, 2452, 20, 0, 1, 2),
(3727, 5056, -25, 0, 1, 1);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1620 AND `item` = 5056;
UPDATE `gameobject` SET `id`='3727' WHERE `guid` in (988,992,1014,1015,1017,1062,1064,1066,1075,1076,1085,1114,1122,1125,1142,1236,1250,1285,1381,1394,1402,1448,1525,1592,1708,1912,1913,1914,1922,1962,1969,2064,2132,2162,2217,2218,2292,2327,2424,2444,2456,2527,2665,2697,2877,2955,3004,3047,3060,3102,3157,3213,3282,3302,3317,3351,3364,3442,3455,3504,3505,3507,3508,3509,3524,3525,3611,3651,3652,3677,3731,3797,3847,3873,3878,3924,3929,3948,3949,3950,4023,4024,4114,4115,4161,4180,4198,4210,4211,4220,4260,4303,4317,4345,4353,4355,4361,4419,4457,4474,4500,4576,4640,4792,4798,4813,4839,4840,4870,4907,5080,5084,5170,5172,5209,5220,5270,5292,5369,5371,5378,5380,5424,5440,5454,5465,5467,5538,5581,5609,5684,5728,5815,5816,5826,5909,6044,6075,6106,6128,6143,6148,6172,6210,6231);
UPDATE `gameobject_template` SET `faction`='1801' WHERE `entry`=194622;
UPDATE `gameobject_template` SET `faction`='1802' WHERE `entry`=194618;
UPDATE `gossip_menu_option` SET `action_script_id`='8846' WHERE `menu_id`=8846 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_1_val_2`='2' WHERE `menu_id`=8846 AND `id`=0;
DELETE FROM `gossip_scripts` WHERE `id` = 8846;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `comments`) VALUES ('8846', '0', '15', '42711', 'Stormwind to Dustwallow Teleport');
UPDATE `creature_template` SET `gossip_menu_id`='4764' WHERE `entry`=4488;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (4764,5821);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (4764,5822);
UPDATE `gossip_menu` SET `cond_1`='9', `cond_1_val_1`='6628', `cond_2`='11', `cond_2_val_1`='6767' WHERE `entry`=4764 AND `text_id`=5822;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
('4764', '0', '1', 'Gul''dan', '1', '1', '-1', '0', '4764', '0', '0', NULL, '9', '6628', '0', '11', '6767', '0', '0', '0', '0'),
('4764', '1', '1', 'Kel''Thuzad', '1', '1', '-1', '0', '4764', '0', '0', NULL, '9', '6628', '0', '11', '6767', '0', '0', '0', '0'),
('4764', '2', '1', 'Ner''zhul', '1', '1', '-1', '0', '36', '0', '0', NULL, '9', '6628', '0', '11', '6767', '0', '0', '0', '0');
DELETE FROM `gossip_scripts` WHERE `id` in (36,4764);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `comments`) VALUES
('36', '0', '7', '6628', 'quest complete'),
('4764', '0', '15', '6767', 'cast Mark of Shame');
UPDATE `quest_template` SET `RewMailTemplateId`='0', `RewMailDelaySecs`='0' WHERE `entry`=5238;
DELETE FROM `mail_loot_template` WHERE `entry` = 107;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (3223,3979);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (3224,3980);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (3225,3981);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (3226,3982);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (3227,3983);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(3223, 0, 0, 'I need a vitreous focuser.', 1, 1, -1, 0, 3223, 0, 0, NULL, 24, 13370, 1, 8, 5237, 0, 0, 0, 0),
(3223, 1, 1, 'I wish to purchase arcane quickener from you.', 3, 128, 0, 0, 0, 0, 0, NULL, 8, 5237, 0, 0, 0, 0, 0, 0, 0),
(3223, 2, 1, 'What does the Felstone Field Cauldron need?', 1, 1, 3224, 0, 0, 0, 0, NULL, 8, 5237, 0, 0, 0, 0, 0, 0, 0),
(3223, 3, 1, 'What does the Dalson''s Tears Cauldron need?', 1, 1, 3225, 0, 0, 0, 0, NULL, 8, 5237, 0, 0, 0, 0, 0, 0, 0),
(3223, 4, 1, 'What does the Writhing Haunt Cauldron need?', 1, 1, 3226, 0, 0, 0, 0, NULL, 8, 5237, 0, 0, 0, 0, 0, 0, 0),
(3223, 5, 1, 'What does the Gahrron''s Withering Cauldron need?', 1, 1, 3227, 0, 0, 0, 0, NULL, 8, 5237, 0, 0, 0, 0, 0, 0, 0),
(3228, 0, 0, 'I need a vitreous focuser.', 1, 1, -1, 0, 3223, 0, 0, NULL, 24, 13370, 1, 8, 5238, 0, 0, 0, 0),
(3228, 1, 1, 'I wish to purchase arcane quickener from you.', 3, 128, 0, 0, 0, 0, 0, NULL, 8, 5238, 0, 0, 0, 0, 0, 0, 0),
(3228, 2, 1, 'What does the Felstone Field Cauldron need?', 1, 1, 3224, 0, 0, 0, 0, NULL, 8, 5238, 0, 0, 0, 0, 0, 0, 0),
(3228, 3, 1, 'What does the Dalson''s Tears Cauldron need?', 1, 1, 3225, 0, 0, 0, 0, NULL, 8, 5238, 0, 0, 0, 0, 0, 0, 0),
(3228, 4, 1, 'What does the Writhing Haunt Cauldron need?', 1, 1, 3226, 0, 0, 0, 0, NULL, 8, 5238, 0, 0, 0, 0, 0, 0, 0),
(3228, 5, 1, 'What does the Gahrron''s Withering Cauldron need?', 1, 1, 3227, 0, 0, 0, 0, NULL, 8, 5238, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id` in (3228,3223);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `comments`) VALUES
(3223, 0, 15, 17529, 'cast Vitreous Focuser');
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='5237' WHERE `entry`=3223 AND `text_id`=3979;
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='5238' WHERE `entry`=3228 AND `text_id`=3985;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES ('8088', '10001', '0', '9', '10297', '0', '24', '24289', '1'), ('8088', '10002', '0', '8', '10297', '0', '24', '24289', '1');
UPDATE `quest_template` SET `SpecialFlags`='2' WHERE `entry`=6628;
DELETE FROM `creature_template_addon` WHERE `entry` = 25479;
DELETE FROM `creature_template_addon` WHERE `entry` = 25613;
DELETE FROM `creature_template_addon` WHERE `entry` = 34965;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='100' WHERE `item` in (29233,29234,29235,29236);
DELETE FROM `event_scripts` WHERE `id` = 12607 AND `delay` = 3 AND `command` = 10 AND `datalong` = 19547 AND `datalong2` = 180000;
DELETE FROM `event_scripts` WHERE `id` = 12608 AND `delay` = 0 AND `command` = 10 AND `datalong` = 19549 AND `datalong2` = 180000;
DELETE FROM `event_scripts` WHERE `id` = 12609 AND `delay` = 0 AND `command` = 10 AND `datalong` = 19580 AND `datalong2` = 180000;
DELETE FROM `event_scripts` WHERE `id` = 12610 AND `delay` = 0 AND `command` = 10 AND `datalong` = 19579 AND `datalong2` = 180000;
UPDATE `creature_template` SET `npcflag`='2' WHERE `entry`=34912;
UPDATE `quest_template` SET `StartScript`='13665' WHERE `entry` in (13665,13745,13750,13756,13761,13847,13851,13852,13854,13855,13790,13793,13861,13864,13767,13772,13777,13782,13787,13856,13857,13858,13859,13860,13811,13814,13862,13863,13723,13725,13713,13724,13699,13726,13731,13728,13727,13729);
DELETE FROM `gameobject` WHERE `guid` = 101429;
DELETE FROM `quest_start_scripts` WHERE `id` in (13665);
INSERT INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `comments`) VALUES ('13665', '1', '15', '63845', 'cast Create Lance');
REPLACE INTO gameobject VALUES ( 7738, 300008, 571, 1,1,8574.27, 660.964, 547.602, 3.49673, 0, 0, 0.984276, -0.176638, -180, 0, 1);
REPLACE INTO gameobject VALUES ( 7739, 300008, 571, 1,1,8490.93, 951.753, 547.294, 3.10027, 0, 0, 0.999787, 0.0206601, -180, 0, 1);
REPLACE INTO gameobject VALUES ( 7740, 300008, 571, 1,1,8419.62, 703.832, 547.317, 2.55834, 0, 0, 0.957778, 0.28751, -180, 0, 1);
# DELETE FROM `achievement_criteria_requirement` WHERE `criteria_id` in (12199,12200,12202,12204,12205,12207,13185,13186,13190,13191,13192,13193,13195,13196,13197,13198,13200,13201,13202,13203,13204,13206,13189,12203,12208);
UPDATE `quest_template` SET `RequiredMinRepFaction`='1094', `RequiredMinRepValue`='42000' WHERE `entry` in (14076,10496,14074,14077,14080,14152,14090,14112);
UPDATE `quest_template` SET `RequiredMinRepFaction`='1124', `RequiredMinRepValue`='42000' WHERE `entry` in (14142,14140,14136,14144,14092,14143,14141,14145);
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10673;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10689;
delete from spell_script_target where entry in (19832, 23014);
insert into spell_script_target value (19832, 1, 12435),(23014, 1, 12435);
delete from creature_linking_template where entry in (12557, 14456);
insert into creature_linking_template values (12557, 469, 12435, 6),(14456, 469, 12557, 143);
Delete from spell_script_target where entry = 31550;
insert into spell_script_target values (31550, 1, 17918);
DELETE FROM spell_scripts WHERE id=31550;
INSERT INTO spell_scripts (id, delay, command, comments) VALUES (31550,0,18,'Despawn Time Keepers');

# Fix
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|64 WHERE `entry`=21267;
UPDATE `gameobject_template` SET `faction`=54 WHERE `entry`=178164;
UPDATE `creature_template` SET `unit_class` = 4 WHERE `entry` = 29884;
UPDATE `creature_template` SET `flags_extra` = 2 WHERE `entry` = 23146;
UPDATE gossip_scripts SET data_flags=0 WHERE id=29579;
UPDATE gossip_scripts SET buddy_Entry=0 WHERE id=7519;
UPDATE gossip_scripts SET buddy_Entry=0 WHERE id=7520;
UPDATE gossip_scripts SET buddy_Entry=0 WHERE id=7521;
UPDATE gossip_scripts SET buddy_Entry=0 WHERE id=7525;
UPDATE gossip_scripts SET data_flags=0 WHERE id=9906 AND data_flags=17;
INSERT IGNORE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES
(14230, 'Need TXT YTDB', '', 0, 100, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE quest_end_scripts SET data_flags=0 WHERE id=411 and data_flags=16;
UPDATE gameobject_scripts SET buddy_Entry=0 WHERE buddy_Entry=5;
UPDATE gameobject_scripts SET data_flags=4, buddy_Entry=23720, datalong2=0, search_radius=5 WHERE datalong2=23720;


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

UPDATE db_version SET `cache_id`= '619';
UPDATE db_version SET `version`= 'YTDB_0.14.4_R619_MaNGOS_R11947_SD2_R2507_ACID_R309c_RuDB_R48';
