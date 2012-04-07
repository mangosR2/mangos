# Y2kCat
ALTER TABLE db_version_ytdb CHANGE COLUMN 616_FIX_11928 617_FIX_11928 bit;
REPLACE INTO `db_version_ytdb` (`version`) VALUES ('617_FIX_11928');

# NeatElves
UPDATE `areatrigger_teleport` SET `required_quest_done`='0' WHERE `id`=2886;
UPDATE `areatrigger_teleport` SET `required_quest_done`='0' WHERE `id`=3529;
UPDATE `areatrigger_teleport` SET `required_quest_done`='0' WHERE `id`=3528;
UPDATE `creature_template` SET `gossip_menu_id`='7608' WHERE `entry`=18015;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7608,9259);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(7608, 0, 1, 'I want to browse your goods.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8524, 0, 0, 'Yes, Scryer. You may possess me.', 1, 1, -1, 0, 0, 0, 0, NULL, 9, 10838, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template` SET `gossip_menu_id`='4510' WHERE `entry`=3408;
UPDATE gossip_menu SET `entry`='4510' WHERE `entry`=50205;
UPDATE gossip_menu_option SET menu_id = 4510 WHERE menu_id = 50205;
UPDATE locales_gossip_menu_option SET menu_id = 4510 WHERE `menu_id` =50205;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(4510, 4987, 14, 0, 1, 0, 0, 0),(6214, 7374, 0, 0, 0, 0, 0, 0),(8524, 10643, 0, 9, 10838, 0, 0, 0);
UPDATE `gossip_menu` SET `cond_1`='9', `cond_1_val_1`='10129' WHERE `entry`=7967 AND `text_id`=10027;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=6214 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=6214 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7615 AND `id`=1;
DELETE FROM `creature_questrelation` WHERE `id` in (15350,32615,15351,32626);
DELETE FROM `creature_involvedrelation` WHERE `id` in (15350,32615,15351,32626);
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6598 AND `id` = 0;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 6597 AND `id` = 0;
UPDATE `creature_template` SET `npcflag`=`npcflag`&~2 WHERE `entry` in (15350,32615,15351,32626);
DELETE FROM `game_event_quest` WHERE `event` in (18,19,20,21,30,42);
UPDATE `creature_template` SET `faction_A`='80', `faction_H`='80' WHERE `entry`=11696;
UPDATE `creature_template` SET `npcflag`=`npcflag`&~1 WHERE `entry` in (11696);
UPDATE `creature_template_addon` SET `b2_1_pvp_state`='1' WHERE `entry`=10618;
UPDATE `creature_template_addon` SET `b2_1_pvp_state`='1' WHERE `entry`=10619;
UPDATE `creature_template_addon` SET `b2_1_pvp_state`='17' WHERE `entry`=11696;
UPDATE `creature_template` SET `InhabitType`='4' WHERE `entry`=7455;
UPDATE `locales_npc_text` SET `Text0_0_loc8` = NULL WHERE `Text0_0_loc8` = '';
UPDATE `locales_npc_text` SET `Text0_1_loc8` = NULL WHERE `Text0_1_loc8` = '';
UPDATE `locales_npc_text` SET `Text1_0_loc8` = NULL WHERE `Text1_0_loc8` = '';
UPDATE `locales_npc_text` SET `Text1_1_loc8` = NULL WHERE `Text1_1_loc8` = '';
UPDATE `locales_npc_text` SET `Text2_0_loc8` = NULL WHERE `Text2_0_loc8` = '';
UPDATE `locales_npc_text` SET `Text2_1_loc8` = NULL WHERE `Text2_1_loc8` = '';
UPDATE `locales_npc_text` SET `Text3_0_loc8` = NULL WHERE `Text3_0_loc8` = '';
UPDATE `locales_npc_text` SET `Text3_1_loc8` = NULL WHERE `Text3_1_loc8` = '';
UPDATE `locales_npc_text` SET `Text4_0_loc8` = NULL WHERE `Text4_0_loc8` = '';
UPDATE `locales_npc_text` SET `Text4_1_loc8` = NULL WHERE `Text4_1_loc8` = '';
UPDATE `locales_npc_text` SET `Text5_0_loc8` = NULL WHERE `Text5_0_loc8` = '';
UPDATE `locales_npc_text` SET `Text5_1_loc8` = NULL WHERE `Text5_1_loc8` = '';
UPDATE `locales_npc_text` SET `Text6_0_loc8` = NULL WHERE `Text6_0_loc8` = '';
UPDATE `locales_npc_text` SET `Text6_1_loc8` = NULL WHERE `Text6_1_loc8` = '';
UPDATE `locales_npc_text` SET `Text7_0_loc8` = NULL WHERE `Text7_0_loc8` = '';
UPDATE `locales_npc_text` SET `Text7_1_loc8` = NULL WHERE `Text7_1_loc8` = '';
UPDATE `locales_gossip_menu_option` SET `box_text_loc8`=NULL WHERE `box_text_loc8`='';
UPDATE `gossip_menu_option` SET `box_text`=NULL WHERE `box_text`='';
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES ('7415', '0', '0', 'I am ready.', '1', '1', '-1', '0', '7415', '0', '0', NULL, '9', '9554', '0', '2', '23843', '1', '0', '0', '0');
DELETE FROM `gossip_scripts` WHERE `id` in (7415);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('7415', '0', '15', '32474', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'cast Buffeting Winds of Susurrus');
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES ('7531', '9136', '0', '9', '9756', '0', '1', '31609', '0');
UPDATE `creature_template` SET `spell1`='0', `ScriptName`='' WHERE `entry` in (17204,17658,5905);
DELETE FROM `pickpocketing_loot_template` WHERE `item` = 25433;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='35' WHERE `item`=25433;
UPDATE `creature` SET `id`='33211' WHERE `guid` in (129881,129880);
UPDATE `creature` SET `spawntimesecs`='15' WHERE `id`=33211;
DELETE FROM `spell_area` WHERE `spell` = 62574;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(94944, 33224, 571, 1, 1, 0, 0, 3749.25, -4306.49, 181.612, 4.85941, 60, 5, 0, 1, 120, 0, 1),
(94945, 33224, 571, 1, 1, 0, 0, 3788.91, -4342.29, 181.496, 0.508298, 60, 5, 0, 1, 120, 0, 1),
(94946, 33224, 571, 1, 1, 0, 0, 3730.27, -4300.56, 182.257, 0.817285, 60, 5, 0, 1, 120, 0, 1),
(94947, 33224, 571, 1, 1, 0, 0, 3712.97, -4301.96, 182.882, 2.34591, 60, 5, 0, 1, 120, 0, 1),
(94948, 33224, 571, 1, 1, 0, 0, 3772.44, -4306.68, 184.075, 3.56133, 60, 5, 0, 1, 120, 0, 1),
(94949, 33224, 571, 1, 1, 0, 0, 3756.24, -4302.3, 181.72, 3.36517, 60, 5, 0, 1, 120, 0, 1),
(94950, 33224, 571, 1, 1, 0, 0, 3746.83, -4301.16, 181.845, 2.52243, 60, 5, 0, 1, 120, 0, 1),
(95325, 33224, 571, 1, 1, 0, 0, 3791.96, -4335.24, 180.627, 2.74927, 60, 5, 0, 1, 120, 0, 1),
(99798, 33224, 571, 1, 1, 0, 0, 3806.21, -4344.59, 180.806, 1.34619, 60, 5, 0, 1, 120, 0, 1),
(127678, 33224, 571, 1, 1, 0, 0, 3807.2, -4354.72, 181.681, 1.24928, 60, 5, 0, 1, 120, 0, 1),
(127679, 33224, 571, 1, 1, 0, 0, 3789.06, -4322.4, 183.95, 1.86524, 60, 5, 0, 1, 120, 0, 1),
(127680, 33224, 571, 1, 1, 0, 0, 3802.25, -4334.69, 183.056, 0.985268, 60, 5, 0, 1, 120, 0, 1),
(127681, 33224, 571, 1, 1, 0, 0, 3779.12, -4320.42, 180.95, 0.935185, 60, 5, 0, 1, 120, 0, 1),
(127682, 33224, 571, 1, 1, 0, 0, 3772.65, -4314.66, 180.2, 0.618314, 60, 5, 0, 1, 120, 0, 1);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('241', '1', 'Npc 33224, 33211'), ('242', '1', 'Npc 33224, 33211');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('243', '1', 'Npc 33224, 33211'), ('244', '1', 'Npc 33224, 33211');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('245', '1', 'Npc 33224, 33211'), ('246', '1', 'Npc 33224, 33211');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('247', '1', 'Npc 33224, 33211'), ('248', '1', 'Npc 33224, 33211');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('249', '1', 'Npc 33224, 33211'), ('250', '1', 'Npc 33224, 33211');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('251', '1', 'Npc 33224, 33211'), ('252', '1', 'Npc 33224, 33211');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('253', '1', 'Npc 33224, 33211'), ('254', '1', 'Npc 33224, 33211');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES ('129881', '241', '0', 'Npc 33211'), ('94944', '241', '10', 'Npc 33224');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES ('129880', '242', '0', 'Npc 33211'), ('94945', '242', '10', 'Npc 33224');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES ('115916', '243', '0', 'Npc 33211'), ('94946', '243', '10', 'Npc 33224');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES ('115917', '244', '0', 'Npc 33211'), ('94947', '244', '10', 'Npc 33224');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES ('115918', '245', '0', 'Npc 33211'), ('94948', '245', '10', 'Npc 33224');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES ('115919', '246', '0', 'Npc 33211'), ('94949', '246', '10', 'Npc 33224');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES ('115920', '247', '0', 'Npc 33211'), ('94950', '247', '10', 'Npc 33224');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES ('115921', '248', '0', 'Npc 33211'), ('95325', '248', '10', 'Npc 33224');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES ('115922', '249', '0', 'Npc 33211'), ('99798', '249', '10', 'Npc 33224');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES ('115923', '250', '0', 'Npc 33211'), ('127678', '250', '10', 'Npc 33224');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES ('115924', '251', '0', 'Npc 33211'), ('127679', '251', '10', 'Npc 33224');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES ('115925', '252', '0', 'Npc 33211'), ('127680', '252', '10', 'Npc 33224');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES ('115926', '253', '0', 'Npc 33211'), ('127681', '253', '10', 'Npc 33224');
REPLACE INTO `pool_creature` (`guid`, `pool_entry`, `chance`, `description`) VALUES ('115927', '254', '0', 'Npc 33211'), ('127682', '254', '10', 'Npc 33224');
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 33224;
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(3322451, 33224, 22, 0, 100, 1, 58, 1, 62574, 0, 41, 0, 0, 0, 12, 33220, 0, 60000, 28, 6, 62574, 0, 'ytdb-On Kiss Transform'),
(3322452, 33224, 22, 0, 100, 1, 58, 11, 62574, 0, 11, 62581, 6, 38, 28, 6, 62574, 0, 0, 0, 0, 0, 'ytdb-On Kiss Borodavki');
UPDATE `creature_ai_scripts` SET `action2_type`='21' WHERE `id`=3322051;
DELETE FROM `gossip_scripts` WHERE `id` = 10316;
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES (10316, 0, 15, 62554, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(3322052, 33220, 1, 0, 100, 0, 55000, 56000, 0, 0, 1, -332202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'ytdb');
REPLACE INTO `creature_ai_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) VALUES
(-332202, 'And now, I must return to the waters of the lake.', '', '', '', '', '', '', '', '', 0, 0, 0, 0, 'ytdb');
# poka tak
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 33211;
REPLACE INTO `creature_ai_scripts` (`id`, `creature_id`, `event_type`, `event_inverse_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `action1_param2`, `action1_param3`, `action2_type`, `action2_param1`, `action2_param2`, `action2_param3`, `action3_type`, `action3_param1`, `action3_param2`, `action3_param3`, `comment`) VALUES
(3321152, 33211, 22, 0, 100, 1, 58, 11, 62574, 0, 11, 62581, 6, 38, 28, 6, 62574, 0, 0, 0, 0, 0, 'ytdb-On Kiss Borodavki'),
(3321151, 33211, 22, 0, 100, 1, 58, 1, 62574, 0, 11, 62537, 0, 0, 28, 6, 62574, 0, 41, 15000, 0, 0, 'ytdb-On Kiss Love');
UPDATE `gossip_menu_option` SET `cond_3`='1', `cond_3_val_1`='63034' WHERE `cond_2`=1 AND `cond_2_val_1`=62853;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 194340 AND `item` = 45062;
DELETE FROM gameobject WHERE guid = '72056';
UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE `id` in (31236,31229,33422,31233,31228,33499,31403);
UPDATE creature SET position_x = '5424.145020', position_y = '401.917145', position_z = '167.945312', orientation = '5.967615' WHERE guid = '130054';
UPDATE creature SET position_x = '5424.099121', position_y = '434.446991', position_z = '169.291306', orientation = '1.520690' WHERE guid = '127735';
UPDATE creature SET position_x = '5444.089844', position_y = '434.033447', position_z = '165.555313', orientation = '0.875093' WHERE guid = '127734';
UPDATE creature SET position_x = '5485.949707', position_y = '427.895782', position_z = '163.299744', orientation = '4.918323' WHERE guid = '127730';
UPDATE creature SET position_x = '5502.888672', position_y = '443.296844', position_z = '162.868454', orientation = '6.204021' WHERE guid = '127731';
UPDATE creature SET position_x = '5515.604004', position_y = '469.351624', position_z = '161.065033', orientation = '0.253059' WHERE guid = '127732';
UPDATE creature SET position_x = '5487.376465', position_y = '482.522949', position_z = '164.250916', orientation = '2.595902' WHERE guid = '127728';
UPDATE creature SET position_x = '5456.859375', position_y = '473.850983', position_z = '164.537277', orientation = '3.031798' WHERE guid = '127729';
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('194213', '14175', '0', 'Winter Hyacinth');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14175', '10', 'Winter Hyacinth');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(127683,33537,571,1,1,0,0,9082.11,2060.1,67.4166,3.6709,180,0,0,12600,0,0,0),(127684,33537,571,1,1,0,0,9073.24,2043.05,67.8435,0.992695,180,0,0,12600,0,0,0),(127685,33537,571,1,1,0,0,9069.62,2078.67,66.9822,1.83543,180,0,0,12600,0,0,2);
UPDATE creature SET position_x = '9074.741211', position_y = '2049.062988', position_z = '67.278084', orientation = '2.191997' WHERE guid = '127684';
UPDATE creature SET position_x = '9037.719727', position_y = '2115.381836', position_z = '52.302624', orientation = '0.118548' WHERE guid = '127685';
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('127683', '0', '1', '1', '0', '0', '0', NULL),('127684', '0', '0', '1', '0', '69', '0', NULL);
UPDATE `creature_template_addon` SET `bytes1`='1' WHERE `entry`=34794;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `orientation`) VALUES
(127685,1,9057.12,2115.93,58.1148,0.226147),(127685,2,9072.52,2064.26,67.2821,4.97545),(127685,3,9059.1,2115.36,58.6392,1.82758),(127685,4,9035.57,2114.82,51.8051,3.27585);
DELETE FROM gameobject WHERE guid = '73238';
INSERT INTO gameobject VALUES ( 73238, 194539, 571, 1,1,8441.49, 450.144, 596.07, 1.45332, 0, 0, 0.664377, 0.747398, 0, 100, 1);
DELETE FROM gameobject WHERE guid = '73240';
INSERT INTO gameobject VALUES ( 73240, 194538, 571, 1,1,8471.59, 449.475, 596.072, 1.45725, 0, 0, 0.665844, 0.746091, 0, 100, 1);
DELETE FROM gameobject WHERE guid = '73239';
INSERT INTO gameobject VALUES ( 73239, 194537, 571, 1,1,8461.64, 466.649, 596.072, 1.54364, 0, 0, 0.697441, 0.716642, 0, 100, 1);
UPDATE `creature_template_addon` SET `auras`='51195 29266' WHERE `entry`=33439;
UPDATE `creature_template_addon` SET `auras`='29266 41290' WHERE `entry`=33455;
UPDATE `gameobject` SET `spawntimesecs`='-180' WHERE `guid`=16031;
UPDATE `gameobject` SET `spawntimesecs`='-180' WHERE `guid`=16226;
DELETE FROM `event_scripts` WHERE `id` in (21077,21075,21076);
REPLACE INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(21077, 0, 10, 33439, 30000, 0, 0, 0, 0, 0, 0, 0, 8461.7, 468.58, 596.072, 4.63618, ''),
(21076, 0, 10, 33457, 30000, 0, 0, 0, 0, 0, 0, 0, 8471.26, 452.094, 596.072, 4.73278, ''),
(21075, 0, 10, 33455, 30000, 0, 0, 0, 0, 0, 0, 0, 8441.61, 452.456, 596.072, 2.01059, ''),
(21076, 0, 9, 16031, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(21075, 0, 9, 16226, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM `creature_ai_scripts` WHERE `id` = 3349851;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33498;
UPDATE `creature_template` SET `gossip_menu_id`='3130' WHERE `entry`=10618;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7469 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7469 AND `id`=1;
UPDATE `creature_template` SET `gossip_menu_id`='12502' WHERE `entry`=11079;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (12502,17586);
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='12249' WHERE `entry`=9631 AND `text_id`=13032;
UPDATE `creature_template` SET `gossip_menu_id`='7236' WHERE `entry`=16399;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (7236,8536);
UPDATE `creature_template` SET `gossip_menu_id`='0', `npcflag`='2' WHERE `entry`=33648;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (9631,13031);
# надо по квесту убит 3 нпц, по одному каждого вида, убил гномерегана - у него этот текст, как добавить по условию ?)
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10464,14492);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10465,14492);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10466,14492);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10467,14492);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10471,14492);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10468,14489);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10469,14489);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10470,14489);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10472,14489);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10473,14489);
DELETE FROM `quest_end_scripts` WHERE `id` = 333 AND `delay` = 10 AND `command` = 20;
UPDATE `quest_end_scripts` SET `data_flags`='1' WHERE `id`=333 AND `delay`=5 AND `command`=10;
DELETE FROM `creature` WHERE `guid` = 52895;
REPLACE INTO `creature_movement_template` (`entry`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(1433, 1, -8768.19, 715.132, 99.5343, 2500, 143301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1433, 2, -8776.53, 714.943, 99.5343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_movement_scripts` SET `delay`='1' WHERE `id`=143301;
UPDATE `creature_movement_scripts` SET `datalong2`='1427', `datalong3`='10', `data_flags`='4' WHERE `id`=143303 AND `delay`=0 AND `command`=0;
UPDATE `creature_movement_scripts` SET `comments`='despawn self, this script is used by many creatures' WHERE `id`=641 AND `command`=18;
DELETE FROM `creature_movement_scripts` WHERE `id` = 143306;
UPDATE `creature_movement_template` SET `script_id`='641' WHERE `entry`=1433 AND `point`=36;
UPDATE `creature_movement_template` SET `orientation`='2.597' WHERE `entry`=1433 AND `point`=15;
UPDATE `creature_movement_template` SET `orientation`='3.123' WHERE `entry`=1433 AND `point`=1;
UPDATE `creature_template_addon` SET `auras`=NULL WHERE `entry`=10556;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(92101, 4065, 0, 1, 1, 0, 0, -9283.71, -3027.75, 120.66, 1.28981, 300, 5, 0, 521, 0, 0, 1),
(92102, 4065, 0, 1, 1, 0, 0, -9392.3, -3017.34, 136.81, 3.45104, 300, 5, 0, 521, 0, 0, 1),
(4547, 4065, 0, 1, 1, 0, 0, -9308.72, -2942.36, 128.656, 4.43853, 300, 0, 0, 521, 0, 0, 2),
(94942, 4065, 0, 1, 1, 0, 0, -9337.76, -3025.9, 135.564, 2.82787, 300, 5, 0, 521, 0, 0, 1),
(94943, 4065, 0, 1, 1, 0, 0, -9278.73, -2939.37, 134.909, 1.10709, 300, 5, 0, 521, 0, 0, 1);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(4547, 1, -9307.15, -2944.28, 128.676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.20397, 0, 0),
(4547, 2, -9301.33, -2954.65, 128.753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.62416, 0, 0),
(4547, 3, -9290.17, -2958.82, 128.753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.000702, 0, 0),
(4547, 4, -9275.54, -2953.19, 128.661, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.358058, 0, 0),
(4547, 5, -9268.44, -2937.71, 128.753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.2377, 0, 0),
(4547, 6, -9274.3, -2923.29, 128.752, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.35297, 0, 0),
(4547, 7, -9289.67, -2916.54, 128.753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.81243, 0, 0),
(4547, 8, -9304.1, -2924.26, 128.753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.05728, 0, 0),
(4547, 9, -9308.74, -2939.14, 128.737, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.55208, 0, 0);
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64811' WHERE `entry`=10468 AND `text_id`=14489;
UPDATE `gossip_menu_option` SET `cond_3`='11', `cond_3_val_1`='64811' WHERE `menu_id`=10468 AND `id`=0;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64813' WHERE `entry`=10470 AND `text_id`=14489;
UPDATE `gossip_menu_option` SET `cond_3`='11', `cond_3_val_1`='64813' WHERE `menu_id`=10470 AND `id`=0;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64815' WHERE `entry`=10472 AND `text_id`=14489;
UPDATE `gossip_menu_option` SET `cond_3`='11', `cond_3_val_1`='64815' WHERE `menu_id`=10472 AND `id`=0;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64816' WHERE `entry`=10473 AND `text_id`=14489;
UPDATE `gossip_menu_option` SET `cond_3`='11', `cond_3_val_1`='64816' WHERE `menu_id`=10473 AND `id`=0;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64812' WHERE `entry`=10469 AND `text_id`=14489;
UPDATE `gossip_menu_option` SET `cond_3`='11', `cond_3_val_1`='64812' WHERE `menu_id`=10469 AND `id`=0;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64809' WHERE `entry`=10466 AND `text_id`=14492;
UPDATE `gossip_menu_option` SET `cond_3`='11', `cond_3_val_1`='64809' WHERE `menu_id`=10466 AND `id`=0;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64805' WHERE `entry`=10464 AND `text_id`=14492;
UPDATE `gossip_menu_option` SET `cond_3`='11', `cond_3_val_1`='64805' WHERE `menu_id`=10464 AND `id`=0;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64814' WHERE `entry`=10471 AND `text_id`=14492;
UPDATE `gossip_menu_option` SET `cond_3`='11', `cond_3_val_1`='64814' WHERE `menu_id`=10471 AND `id`=0;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64808' WHERE `entry`=10465 AND `text_id`=14492;
UPDATE `gossip_menu_option` SET `cond_3`='11', `cond_3_val_1`='64808' WHERE `menu_id`=10465 AND `id`=0;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64810' WHERE `entry`=10467 AND `text_id`=14492;
UPDATE `gossip_menu_option` SET `cond_3`='11', `cond_3_val_1`='64810' WHERE `menu_id`=10467 AND `id`=0;
DELETE FROM `creature` WHERE `guid` in (127746,127742,127745,127747,127743,127744,127728,127729,127730,127731,127732,127733,127734,127735);
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `id` in (33499);
UPDATE `creature_template` SET `spell1`='0', `ScriptName`='' WHERE `entry`=11260;
UPDATE `creature_template_addon` SET `b2_0_sheath`='1', `emote`='234' WHERE `entry`=33499;
UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE `id` in (27357,27367);
UPDATE creature SET position_x = '5455.783691', position_y = '425.591888', position_z = '164.255173', orientation = '0.671465' WHERE guid = '127736';
UPDATE creature SET position_x = '5427.031250', position_y = '441.722687', position_z = '169.265457', orientation = '3.188671' WHERE guid = '127740';
UPDATE creature SET position_x = '5456.755371', position_y = '463.464386', position_z = '164.964340', orientation = '1.035896' WHERE guid = '127739';
UPDATE creature SET position_x = '5403.619141', position_y = '369.978607', position_z = '168.969223', orientation = '6.174750' WHERE guid = '127741';
UPDATE creature SET position_x = '5426.360352', position_y = '359.055603', position_z = '163.375443', orientation = '5.021790' WHERE guid = '127738';
UPDATE creature SET position_x = '5470.620117', position_y = '374.517426', position_z = '158.252075', orientation = '4.994304' WHERE guid = '127737';
DELETE FROM `creature_ai_scripts` WHERE `id` = 3327351;
DELETE FROM `creature_ai_scripts` WHERE `id` = 3327352;
DELETE FROM `creature_ai_scripts` WHERE `id` = 3327353;
DELETE FROM `creature_ai_scripts` WHERE `id` = 3327354;
DELETE FROM `creature_ai_scripts` WHERE `id` = 3327355;
DELETE FROM `creature_ai_texts` WHERE `entry` = -332734;
DELETE FROM `creature_ai_texts` WHERE `entry` = -332733;
DELETE FROM `creature_ai_texts` WHERE `entry` = -332732;
DELETE FROM `creature_ai_texts` WHERE `entry` = -332731;
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=33273;
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('2000000599', 'Are those winter hyacinths? For me?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), 
('2000000600', 'It''s been so long since a traveler has come here bearing flowers.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2000000601', 'The lake has been too lonely these past years. The travelers stopped coming and evil came to these waters.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), 
('2000000602', 'Your gift is a rare kindness, traveler. Please take this blade with my gratitude. Long ago, another traveler left it here, but I have little use for it.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE `id` in (27357,27367);
DELETE FROM `event_scripts` WHERE `id` in (20990);
REPLACE INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(20990, 15, 9, 71552, 45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(20990, 0, 9, 143, 60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(20990, 0, 10, 33273, 55000, 0, 0, 0, 0, 0, 0, 0, 4535.06, -1605.02, 157.1, 0.361706, ''),
(20990, 0, 0, 0, 33273, 10, 0, 2, 2000000599, 0, 0, 0, 0, 0, 0, 0, ''),
(20990, 4, 0, 0, 33273, 10, 0, 2, 2000000600, 0, 0, 0, 0, 0, 0, 0, ''),
(20990, 8, 0, 0, 33273, 10, 0, 2, 2000000601, 0, 0, 0, 0, 0, 0, 0, ''),
(20990, 14, 0, 0, 33273, 10, 0, 2, 2000000602, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE `gameobject` SET `position_z`='156.85' WHERE `guid`=143;
UPDATE `gameobject` SET `position_z`='157.1' WHERE `guid`=71552;
UPDATE `creature_template_addon` SET `bytes1`='1', `emote`='0' WHERE `entry`=33273;
UPDATE creature SET position_x = '3475.163330', position_y = '-2817.673584', position_z = '201.293289', orientation = '5.287273' WHERE guid = '130264';
UPDATE creature SET position_x = '3495.739014', position_y = '-2836.986084', position_z = '202.368881', orientation = '6.207765' WHERE guid = '116631';
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='71450' WHERE `entry`=10990 AND `text_id`=15282;
INSERT INTO creature VALUES (127728,33778,571,1,1,0,0,8508.99,1191.04,604.339,6.21327,180,0,0,36525,0,0,0);
INSERT INTO creature VALUES (127729,33778,571,1,1,0,0,8488.2,1184.87,604.339,4.32832,180,0,0,36525,0,0,0);
INSERT INTO creature VALUES (127730,33778,571,1,1,0,0,8484.85,1196.8,604.339,3.25546,180,0,0,36525,0,0,0);
INSERT INTO creature VALUES (127731,33778,571,1,1,0,0,8617.36,571.136,586.303,3.495,180,0,0,36525,0,0,0);
INSERT INTO creature VALUES (127732,33778,571,1,1,0,0,8635.54,582.817,586.304,1.56842,180,0,0,36525,0,0,0);
INSERT INTO creature VALUES (127733,33778,571,1,1,0,0,8642.41,571.696,586.304,0.43745,180,0,0,36525,0,0,0);
UPDATE creature SET position_x = '8619.045898', position_y = '936.341064', position_z = '547.690552', orientation = '2.953075' WHERE guid = '98215';
UPDATE `gameobject` SET `spawntimesecs`='-180' WHERE `guid`=73044;
UPDATE `gameobject` SET `spawntimesecs`='-180' WHERE `guid`=73045;
UPDATE `gameobject` SET `spawntimesecs`='-180' WHERE `guid`=73046;
UPDATE `gameobject` SET `spawntimesecs`='-180', `animprogress`='0' WHERE `guid`=73047;
UPDATE `creature_template` SET `unit_flags`='33587200', `InhabitType`='5', `flags_extra`='2' WHERE `entry`=28253;
DELETE FROM `event_scripts` WHERE `id` in (18475,18474);
REPLACE INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(18474, 6, 7, 12537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(18475, 0, 9, 73045, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(18475, 0, 9, 73044, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(18475, 0, 9, 73046, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(18475, 0, 9, 73047, 30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE `gossip_menu_option` SET `cond_2`='11', `cond_2_val_1`='63034' WHERE `menu_id`=10468 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_2`='11', `cond_2_val_1`='64813' WHERE `menu_id`=10470 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_2`='11', `cond_2_val_1`='64815' WHERE `menu_id`=10472 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_2`='11', `cond_2_val_1`='64816' WHERE `menu_id`=10473 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_2`='11', `cond_2_val_1`='64812' WHERE `menu_id`=10469 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_2`='11', `cond_2_val_1`='64809' WHERE `menu_id`=10466 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_2`='11', `cond_2_val_1`='64805' WHERE `menu_id`=10464 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_2`='11', `cond_2_val_1`='64814' WHERE `menu_id`=10471 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_2`='11', `cond_2_val_1`='64808' WHERE `menu_id`=10465 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_2`='11', `cond_2_val_1`='64810' WHERE `menu_id`=10467 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_3`='0', `cond_3_val_1`='0' WHERE `menu_id`=10468 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_3`='0', `cond_3_val_1`='0' WHERE `menu_id`=10470 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_3`='0', `cond_3_val_1`='0' WHERE `menu_id`=10472 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_3`='0', `cond_3_val_1`='0' WHERE `menu_id`=10473 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_3`='0', `cond_3_val_1`='0' WHERE `menu_id`=10469 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_3`='0', `cond_3_val_1`='0' WHERE `menu_id`=10466 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_3`='0', `cond_3_val_1`='0' WHERE `menu_id`=10464 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_3`='0', `cond_3_val_1`='0' WHERE `menu_id`=10471 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_3`='0', `cond_3_val_1`='0' WHERE `menu_id`=10465 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_3`='0', `cond_3_val_1`='0' WHERE `menu_id`=10467 AND `id`=0;
INSERT INTO `creature` VALUES (127734,33291,571,1,1,0,0,5123.83,-52.4984,347.385,0.476944,60,0,0,1,60,0,0);
INSERT INTO `creature` VALUES (127735,33291,571,1,1,0,0,5121.65,-69.795,347.452,5.9818,60,0,0,1,60,0,0);
INSERT INTO `creature` VALUES (127742,33291,571,1,1,0,0,5153.52,-80.5957,347.407,3.07425,60,0,0,1,60,0,0);
INSERT INTO `creature` VALUES (127743,33291,571,1,1,0,0,5125.86,-102.365,347.593,1.22621,60,0,0,1,60,0,0);
INSERT INTO `creature` VALUES (127744,33291,571,1,1,0,0,5158.67,-56.4608,347.322,2.9211,60,0,0,1,60,0,0);
INSERT INTO `creature` VALUES (127745,33291,571,1,1,0,0,5113.93,-36.257,347.858,0.318293,60,0,0,1,60,0,0);
INSERT INTO `creature` VALUES (127746,33291,571,1,1,0,0,5119.33,-22.3762,347.312,5.2451,60,0,0,1,60,0,0);
INSERT INTO `creature` VALUES (127747,33291,571,1,1,0,0,5143.1,-18.4616,347.322,4.47383,60,0,0,1,60,0,0);
INSERT INTO `creature` VALUES (127686,33291,571,1,1,0,0,5160.8,-25.8661,347.322,3.46774,60,0,0,1,60,0,0);
DELETE FROM `spell_scripts` WHERE `id` in (62767);
REPLACE INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES 
('62767', '0', '14', '45776', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', ''), 
('62767', '2', '0', '0', '33303', '10', '0', '2', '2000000603', '0', '0', '0', '0', '0', '0', '0', ''),
('62767', '10', '15', '45776', '2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', ''), 
('62767', '5', '0', '0', '33303', '10', '0', '2', '2000000604', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('2000000604', 'It has brought me naught but ill. Mayhap you can find someone who will contain its power.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), 
('2000000603', 'Thank you, mortal, for freeing me from this curse. I beg you, take this blade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('16475', '0', '8', '1', '16', '0', '0', NULL),('17311', '0', '1', '1', '16', '0', '0', NULL);
REPLACE INTO `creature_addon` (`guid`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('72114', '0', '0', '1', '56', '0', '0', NULL);
DELETE FROM `creature_addon` WHERE `guid` in (72125,72046,72048,72049,72052,72053,72077,72081,72083,72085,72086,72092,72099,72100,72101,72102,72105,72106,72107,72108,72111,72115,72146,72147,72148,72152,72153,72166,72167,72173,72175,72183,72184,72186,72187,72188,72194,72195,72198,72200,72202,72203,72204,72215,72220,72223,72225,72229,72230,72231,72232,72235,72237,72239,72240,72241,72248,72252,66965,71147,66970,75128);
UPDATE `gossip_menu` SET `cond_2`='0', `cond_2_val_1`='0' WHERE `entry`=7403 AND `text_id`=8870;
UPDATE `creature_template_addon` SET `auras`='22650' WHERE `entry`=32149;
UPDATE `creature_template` SET `gossip_menu_id`='685' WHERE `entry`=1289;
UPDATE `creature_template` SET `gossip_menu_id`='12128' WHERE `entry`=9503;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES (12128, 17034, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `guid`=75128;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(7368, 3, 0, 'Acteon, where is the best area to hunt for moongraze stags?', 1, 1, 7423, 0, 0, 0, 0, NULL, 9, 10324, 0, 0, 0, 0, 0, 0, 0),
(7368, 4, 0, 'Acteon, where is the best place to hunt moongraze bucks?', 1, 1, 7424, 0, 0, 0, 0, NULL, 9, 10324, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES (7403, 8880, 0, 8, 9527, 0, 8, 9528, 0),
# текст всегда, 14407 - когда валим искателей
(10340, 14408, 0, 0, 0, 0, 0, 0, 0),
(7425, 8974, 0, 0, 0, 0, 0, 0, 0),
(7399, 8892, 0, 0, 0, 0, 0, 0, 0),
(7400, 8868, 0, 0, 0, 0, 0, 0, 0),
(7398, 8893, 0, 0, 0, 0, 0, 0, 0),
(7400, 8892, 0, 0, 0, 0, 0, 0, 0);
UPDATE `gossip_menu` SET `cond_1`='0', `cond_1_val_1`='0' WHERE `entry`=7403 AND `text_id`=8870;
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='9527' WHERE `entry`=7403 AND `text_id`=8869;
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='9506',`cond_2`='8', `cond_2_val_1`='9537' WHERE `entry`=7399 AND `text_id`=8892;
UPDATE `gossip_menu` SET `cond_1_val_1`='9506' WHERE `entry`=7399 AND `text_id`=8865;
DELETE FROM `gossip_menu` WHERE `entry` = 33477;
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='9506',`cond_2`='8', `cond_2_val_1`='9537' WHERE `entry`=7399 AND `text_id`=8892;
UPDATE `gossip_menu` SET `cond_1_val_1`='9506' WHERE `entry`=7399 AND `text_id`=8865;
UPDATE `gossip_menu` SET `cond_2`='8', `cond_2_val_1`='9305' WHERE `entry`=7353 AND `text_id`=8776;
UPDATE `gossip_menu_option` SET `action_menu_id`='7425' WHERE `menu_id`=7370 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_1`='22', `cond_1_val_1`='9527' WHERE `menu_id`=7403 AND `id`=0;
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='9506', `cond_2`='8', `cond_2_val_1`='9537' WHERE `entry`=7398 AND `text_id`=8893;
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='9506' WHERE `entry`=7400 AND `text_id`=8868;
UPDATE `gossip_menu` SET `cond_1`='8', `cond_1_val_1`='9506', `cond_2`='8', `cond_2_val_1`='9537' WHERE `entry`=7400 AND `text_id`=8892;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-25' WHERE `item`=23757;
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('2000000605', 'As soon as the neutralizing agent is mixed with the waters of the lake, water, contaminated crystal, seems to have cleared.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
UPDATE `creature` SET `spawntimesecs`='30', `spawndist`='0', `MovementType`='0' WHERE `id`=16922;
DELETE FROM `event_scripts` WHERE `id` in (13021);
REPLACE INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(13021, 0, 0, 2, 0, 0, 0, 0, 2000000605, 0, 0, 0, 0, 0, 0, 0, '');
# npc 16922 despawn, нет команды
UPDATE `creature_template_addon` SET `bytes1`='0' WHERE `entry`=31231;
DELETE FROM creature WHERE guid=112314;
DELETE FROM creature WHERE guid=112310;
DELETE FROM creature WHERE guid=112315;
DELETE FROM creature WHERE guid=112319;
UPDATE creature SET position_x = '5779.123047', position_y = '204.976822', position_z = '181.682709', orientation = '4.250337' WHERE guid = '127713';
DELETE FROM creature WHERE guid=111097;
DELETE FROM creature WHERE guid=127727;
DELETE FROM creature WHERE guid=127725;
DELETE FROM creature WHERE guid=127720;
DELETE FROM creature WHERE guid=127719;
DELETE FROM creature WHERE guid=127724;
DELETE FROM creature WHERE guid=127721;
DELETE FROM creature WHERE guid=127722;
UPDATE creature SET position_x = '5837.558105', position_y = '576.595215', position_z = '177.538101', orientation = '3.318052' WHERE guid = '127717';
UPDATE creature SET position_x = '5782.634766', position_y = '926.963440', position_z = '158.768631', orientation = '3.616502' WHERE guid = '112318';
UPDATE creature SET position_x = '5447.742188', position_y = '395.050476', position_z = '167.945740', orientation = '1.795957' WHERE guid = '112320';
DELETE FROM creature WHERE guid=112309;
DELETE FROM creature WHERE guid=112307;
DELETE FROM creature WHERE guid=112312;
UPDATE creature SET position_x = '5738.099121', position_y = '174.121552', position_z = '181.606323', orientation = '0.458434' WHERE guid = '127700';
UPDATE creature SET position_x = '5604.433594', position_y = '125.379807', position_z = '150.705765', orientation = '4.157661' WHERE guid = '112311';
UPDATE creature SET position_x = '5712.291016', position_y = '112.166061', position_z = '168.346069', orientation = '0.097937' WHERE guid = '127699';
UPDATE creature SET position_x = '5800.292480', position_y = '145.030563', position_z = '181.802673', orientation = '2.535821' WHERE guid = '112308';
UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE `id`=31231;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-33' WHERE `item`=43225;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=1802 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=1802 AND `id`=1;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES 
(1802, 2434, 0, 9, 3909, 0, 0, 0, 0),(7501, 9097, 0, 0, 0, 0, 0, 0, 0),(7465, 9076, 0, 8, 9700, 0, 0, 0, 0);
UPDATE `gossip_menu_option` SET `option_text`='Buy somethin'', will ya?', `cond_1`='9', `cond_1_val_1`='3909' WHERE `menu_id`=1802 AND `id`=0;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(7465, 0, 0, 'Where do i begin searching for the portal?', 1, 1, 7501, 0, 0, 0, 0, NULL, 9, 9700, 0, 0, 0, 0, 0, 0, 0),
(7531, 0, 0, 'I am a prisoner - that it is not clear? Draenic offspring grabbed me at the exit from the Sun Gate. They destroyed the control panels and destroyed the gate. Sunny King would be very unhappy.', 1, 1, 7537, 0, 0, 0, 0, NULL, 9, 9756, 0, 1, 31609, 0, 0, 0, 0),
(7537, 0, 0, 'Oh yeah, Sironas. I almost forgot that there was Sironas. I served under the Sironas there in Outland. However, I have not heard of this abomination - damn draenei caught me before I was able to fully materialize in this world.', 1, 1, 7536, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7536, 0, 0, 'Incredible. How Sironas managed to make it?', 1, 1, 7535, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7535, 0, 0, 'Sironas - eredar ... I mean, yes, this is obvious.', 1, 1, 7534, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7534, 0, 0, 'Vector Spiral enormous. I hope they have more than one abomination to the protection of the many weaknesses.', 1, 1, 7533, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7533, 0, 0, 'Yes, and you believed me. Thanks for the info, blood elf. You have no idea how to help us.', 1, 1, -1, 0, 7533, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7449, 0, 0, 'Hover over me one more illusion, Admetius.', 1, 1, -1, 0, 7449, 0, 0, NULL, 9, 9756, 0, 11, 31609, 0, 0, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id` in (7449,7533);
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
('7449', '0', '15', '31609', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', ''),
('7533', '1', '0', '0', '17824', '10', '0', '2', '2000000606', '0', '0', '0', '0', '0', '0', '0', ''),
('7533', '0', '8', '17974', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7517 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7471 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7471 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7459 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7459 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7470 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7470 AND `id`=1;
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('2000000606', 'Treacherous whelp! Sironas will destroy you and your people!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `creature` WHERE `guid` = 122679;
UPDATE `quest_template` SET `RequiredRaces`='1024' WHERE `entry` in (9753,9756,9760,9761);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-50' WHERE `entry`=17606 AND `item`=24236;
UPDATE `quest_template` SET `PrevQuestId`='9703' WHERE `entry`=9753;
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `guid`=68629;
UPDATE `gossip_menu` SET `cond_1`='11', `cond_1_val_1`='31609', `cond_2`='0', `cond_2_val_1`='0' WHERE `entry`=7531 AND `text_id`=9134;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(7531, 9136, 0, 9, 9756, 0, 1, 31609, 0),
(7453, 9028, 0, 0, 0, 0, 0, 0, 0),
(7454, 9030, 0, 0, 0, 0, 0, 0, 0),
(7456, 9031, 0, 0, 0, 0, 0, 0, 0),
(7457, 9032, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(7452, 0, 0, 'Jessera, could you point me to a aquatic stinkhorn?', 1, 1, 7453, 0, 0, 0, 0, NULL, 9, 9648, 0, 0, 0, 0, 0, 0, 0),
(7452, 1, 0, 'Jessera, show me the way to the ruinous polyspore.', 1, 1, 7454, 0, 0, 0, 0, NULL, 9, 9648, 0, 0, 0, 0, 0, 0, 0),
(7452, 2, 0, 'Jessera, could you show me where to look for a fel cone fungus?', 1, 1, 7456, 0, 0, 0, 0, NULL, 9, 9648, 0, 0, 0, 0, 0, 0, 0),
(7452, 3, 0, 'Jessera how to get to the blood mushroom?', 1, 1, 7457, 0, 0, 0, 0, NULL, 9, 9648, 0, 0, 0, 0, 0, 0, 0);
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7833 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7833 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7455 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7455 AND `id`=1;
UPDATE `quest_template` SET `RequiredRaces`='1024' WHERE `entry` in (9753,9756,9760,9761);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-50' WHERE `entry`=17606 AND `item`=24236;
UPDATE `quest_template` SET `PrevQuestId`='9703' WHERE `entry`=9753;
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `guid`=68629;
UPDATE `gossip_menu` SET `cond_1`='11', `cond_1_val_1`='31609', `cond_2`='0', `cond_2_val_1`='0' WHERE `entry`=7531 AND `text_id`=9134;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(7531, 9136, 0, 9, 9756, 0, 1, 31609, 0),
(7453, 9028, 0, 0, 0, 0, 0, 0, 0),
(7454, 9030, 0, 0, 0, 0, 0, 0, 0),
(7456, 9031, 0, 0, 0, 0, 0, 0, 0),
(7457, 9032, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(7452, 0, 0, 'Jessera, could you point me to a aquatic stinkhorn?', 1, 1, 7453, 0, 0, 0, 0, NULL, 9, 9648, 0, 0, 0, 0, 0, 0, 0),
(7452, 1, 0, 'Jessera, show me the way to the ruinous polyspore.', 1, 1, 7454, 0, 0, 0, 0, NULL, 9, 9648, 0, 0, 0, 0, 0, 0, 0),
(7452, 2, 0, 'Jessera, could you show me where to look for a fel cone fungus?', 1, 1, 7456, 0, 0, 0, 0, NULL, 9, 9648, 0, 0, 0, 0, 0, 0, 0),
(8298, 0, 0, 'You can read the spell that will allow me to breathe underwater?', 1, 1, -1, 0, 8298, 0, 0, NULL, 9, 9682, 0, 0, 0, 0, 0, 0, 0),
(8298, 1, 0, 'You can read the spell that will allow me to breathe underwater?', 1, 1, -1, 0, 8298, 0, 0, NULL, 9, 9674, 0, 0, 0, 0, 0, 0, 0),
(7452, 3, 0, 'Jessera how to get to the blood mushroom?', 1, 1, 7457, 0, 0, 0, 0, NULL, 9, 9648, 0, 0, 0, 0, 0, 0, 0);
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7833 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7833 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=7455 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7455 AND `id`=1;
DELETE FROM `gossip_scripts` WHERE `id` in (8298);
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
('8298', '0', '15', '31319', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
UPDATE `quest_template` SET `PrevQuestId`='13700' WHERE `entry` in (13789,13790,13861);
UPDATE `quest_template` SET `PrevQuestId`='13701' WHERE `entry` in (13810,13811,13862);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='50', `maxcount`='3' WHERE `item`=20384;
DELETE FROM `creature_loot_template` WHERE `entry` = 5357 AND `item` = 18956;
DELETE FROM `creature_loot_template` WHERE `entry` = 5358 AND `item` = 18956;
DELETE FROM `creature_loot_template` WHERE `entry` = 5359 AND `item` = 18956;
DELETE FROM `creature_loot_template` WHERE `entry` = 5360 AND `item` = 18956;
DELETE FROM `creature_loot_template` WHERE `entry` = 5361 AND `item` = 18956;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='100' WHERE `item`=18956;
DELETE FROM `creature_loot_template` WHERE `entry` = 14529 AND `item` = 18953;
DELETE FROM `creature_loot_template` WHERE `entry` = 14527 AND `item` = 18952;
DELETE FROM `creature_loot_template` WHERE `entry` = 14536 AND `item` = 18954;
DELETE FROM `creature_loot_template` WHERE `entry` = 14531 AND `item` = 18955;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `item` in (17684,24487,24488,24514);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=10503 AND `item`=13725;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='100' WHERE `item` in (20514,20515);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-20' WHERE `item`=22224;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-25' WHERE `item` in (22373,22374,22375,22376,22570,24426,24427);
DELETE FROM `creature_loot_template` WHERE `item` in (23205,25756,41337,30713);
DELETE FROM `creature_loot_template` WHERE `entry` = 16807 AND `item` = 25462;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-40' WHERE `entry`=23929 AND `item`=33337;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=25514 AND `item`=34804;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 187689 AND `item` = 34802;
DELETE FROM `creature_loot_template` WHERE `entry` = 34106 AND `item` = 39682;
DELETE FROM `reference_loot_template` WHERE `entry` = 39681 AND `item` = 39684;
UPDATE `reference_loot_template` SET `groupid`='0' WHERE `entry`=39681 AND `item`=49050;
DELETE FROM `reference_loot_template` WHERE `entry` = 39681 AND `item` = 39686;
UPDATE `reference_loot_template` SET `groupid` = '0' WHERE `entry` = 39681;
UPDATE `creature_loot_template` SET `maxcount`='20' WHERE `entry`=34106;
UPDATE `creature_loot_template` SET `maxcount`='20' WHERE `entry`=33432;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-33' WHERE `item`=36957;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-15' WHERE `item`=37010;
DELETE FROM `creature_loot_template` WHERE `entry` = 26644 AND `item` = 37200;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-20' WHERE `entry`=27131 AND `item`=37200;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-50' WHERE `item`=37251;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-35' WHERE `item`=37882;
DELETE FROM `pickpocketing_loot_template` WHERE `entry` = 21779;
UPDATE `creature_template` SET `pickpocketloot`='0' WHERE `entry`=21779;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `item`=30442;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='5' WHERE `item`=11754;
DELETE FROM `skinning_loot_template` WHERE `entry` = 34192;
DELETE FROM `skinning_loot_template` WHERE `entry` = 34216;
DELETE FROM `skinning_loot_template` WHERE `entry` = 36;
UPDATE `creature_template` SET `skinloot`='0' WHERE `entry` in (36,34192,34216);
DELETE FROM `reference_loot_template` WHERE `entry` in (39681,36811,35623);
DELETE FROM `skinning_loot_template` WHERE `entry` in (25752,25753,25758,25766,25792,25793,25814,26677,27641,27970,27971,27972,28835,29380,29382,29384,29389,29724,29861,30063,30353,30905,30971,31383,31385,31387,32358,32500,33216,33343,33344,33346,33886,33887,33888,34183,34191,34193,34214,34217,34220,34267,34268,34269,34270,34271,34272,34273,34274);
UPDATE `creature_template` SET `skinloot`='25752' WHERE `entry` in (25752,25753,25758,25766,25792,25793,25814,26677,27641,27970,27971,27972,28835,29380,29382,29384,29389,29724,29861,30063,30353,30905,30971,31383,31385,31387,32358,32500,33216,33343,33344,33346,33886,33887,33888,34183,34191,34193,34214,34217,34220,34267,34268,34269,34270,34271,34272,34273,34274);
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(25752, 36811, 100, 0, -36811, 1, 0, 0, 0),
(25752, 39681, 10, 0, -39681, 1, 0, 0, 0),
(25752, 49050, 1, 0, 1, 1, 28, 68067, 49050);
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(36811, 36811, 0, 1, 1, 3, 0, 0, 0),
(36811, 36812, 0, 1, 1, 3, 0, 0, 0),
(36811, 36813, 0, 1, 1, 3, 0, 0, 0),
(36811, 36814, 0, 1, 1, 3, 0, 0, 0),
(36811, 41337, 0, 1, 1, 3, 0, 0, 0),
(36811, 41338, 0, 1, 1, 3, 0, 0, 0),
(36811, 42931, 0, 1, 1, 3, 0, 0, 0),
(39681, 39681, 0, 1, 1, 1, 0, 0, 0),
(39681, 39682, 0, 1, 1, 1, 0, 0, 0),
(39681, 39683, 0, 1, 1, 1, 0, 0, 0),
(39681, 39684, 0, 1, 1, 1, 0, 0, 0),
(39681, 39685, 0, 1, 1, 1, 0, 0, 0),
(39681, 39690, 0, 1, 1, 1, 0, 0, 0),
(35623, 35623, 0, 1, 2, 5, 0, 0, 0),
(35623, 35624, 0, 1, 2, 5, 0, 0, 0),
(35623, 36860, 0, 1, 2, 5, 0, 0, 0),
(35623, 35627, 0, 1, 2, 5, 0, 0, 0);
DELETE FROM `skinning_loot_template` WHERE `entry` in (33113,34003,33293,33885,33432,34106);
UPDATE `creature_template` SET `skinloot`='33113' WHERE `entry` in (33113,34003,33293,33885,33432,34106);
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(33113, 36811, 100, 0, -36811, 1, 0, 0, 0),
(33113, 35623, 50, 0, -35623, 1, 0, 0, 0),
(33113, 39681, 10, 0, -39681, 1, 0, 0, 0),
(33113, 49050, 1, 0, 1, 1, 28, 68067, 49050);
DELETE FROM `skinning_loot_template` WHERE `entry` in (25707,25709,26333,26417,26421,26782,26792,27254,28323,29036,30258,30329,30861,30526,30524,31463,31470,23874);
UPDATE `creature_template` SET `skinloot`='25707' WHERE `entry` in (25707,25709,26333,26417,26421,26782,26792,27254,28323,29036,30258,30329,30861,30526,30524,31463,31470,23874);
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(25707, 33452, 30, 1, 1, 1, 0, 0, 0),
(25707, 36901, 0, 1, 1, 1, 0, 0, 0),
(25707, 36903, 0, 1, 1, 1, 0, 0, 0),
(25707, 36904, 0, 1, 1, 1, 0, 0, 0),
(25707, 36905, 0, 1, 1, 1, 0, 0, 0),
(25707, 36906, 0, 1, 1, 1, 0, 0, 0),
(25707, 36907, 0, 1, 1, 1, 0, 0, 0),
(25707, 37704, 7, 1, 1, 2, 0, 0, 0),
(25707, 39516, 40, 1, 1, 1, 0, 0, 0);
DELETE FROM `skinning_loot_template` WHERE `entry` in (17977,21582,21251,23029);
UPDATE `creature_template` SET `skinloot`='17977' WHERE `entry` in (17977,21582,21251,23029);
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(17977, 22575, 0, 1, 2, 5, 0, 0, 0),
(17977, 22785, 0, 2, 2, 8, 0, 0, 0),
(17977, 22786, 0, 2, 2, 8, 0, 0, 0),
(17977, 22787, 0, 3, 2, 8, 0, 0, 0),
(17977, 22789, 0, 2, 2, 8, 0, 0, 0),
(17977, 22790, 0, 3, 2, 8, 0, 0, 0),
(17977, 22793, 0, 3, 2, 8, 0, 0, 0),
(17977, 22794, 1, 1, 1, 1, 0, 0, 0);
DELETE FROM `skinning_loot_template` WHERE `entry` in (17723,20164,17725,20188,17734,20187,17770,20169,17871,20190,20774,21023,21040,21325,21326,21694,21914,21863,20983);
UPDATE `creature_template` SET `skinloot`='17723' WHERE `entry` in (17723,20164,17725,20188,17734,20187,17770,20169,17871,20190,20774,21023,21040,21325,21326,21694,21914,21863,20983);
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(17723, 22575, 10, 1, 1, 2, 0, 0, 0),
(17723, 22785, 5, 1, 1, 1, 0, 0, 0),
(17723, 22786, 5, 1, 1, 1, 0, 0, 0),
(17723, 22787, 5, 1, 1, 1, 0, 0, 0),
(17723, 22789, 5, 1, 1, 1, 0, 0, 0),
(17723, 22790, 2, 1, 1, 1, 0, 0, 0),
(17723, 22794, 1, 1, 1, 1, 0, 0, 0),
(17723, 24401, 0, 1, 1, 1, 0, 0, 0),
(17723, 25813, 20, 1, 1, 1, 0, 0, 0),
(17723, 29453, 20, 1, 1, 1, 0, 0, 0);
DELETE FROM `skinning_loot_template` WHERE `entry` in (18124,18125,18127,19402,19519,19734,22095,22307);
UPDATE `creature_template` SET `skinloot`='18124' WHERE `entry` in (18124,18125,18127,19402,19519,19734,22095,22307);
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(18124, 22575, 9, 1, 1, 2, 0, 0, 0),
(18124, 22785, 5, 1, 1, 1, 0, 0, 0),
(18124, 22786, 5, 1, 1, 1, 0, 0, 0),
(18124, 22787, 5, 1, 1, 1, 0, 0, 0),
(18124, 22789, 5, 1, 1, 1, 0, 0, 0),
(18124, 22790, 2, 1, 1, 1, 0, 0, 0),
(18124, 22794, 0.5, 1, 1, 1, 0, 0, 0),
(18124, 24401, 0, 1, 1, 1, 0, 0, 0),
(18124, 25813, 20, 1, 1, 1, 0, 0, 0),
(18124, 27859, 20, 1, 1, 1, 0, 0, 0);
DELETE FROM `skinning_loot_template` WHERE `entry` in (30845,31229,32357,32913,33392,32914,33393,32915,33391,33354,33729,33430,33732,33431,33731,33525,33735,34300);
UPDATE `creature_template` SET `skinloot`='30845' WHERE `entry` in (30845,31229,32357,32913,33392,32914,33393,32915,33391,33354,33729,33430,33732,33431,33731,33525,33735,34300);
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(30845, 35947, 30, 1, 1, 1, 0, 0, 0),
(30845, 36901, 10, 1, 1, 1, 0, 0, 0),
(30845, 36903, 0, 1, 1, 1, 0, 0, 0),
(30845, 36904, 0, 1, 1, 1, 0, 0, 0),
(30845, 36905, 0, 1, 1, 1, 0, 0, 0),
(30845, 36906, 0, 1, 1, 1, 0, 0, 0),
(30845, 36907, 0, 1, 1, 1, 0, 0, 0),
(30845, 37704, 0, 1, 1, 2, 0, 0, 0),
(30845, 39516, 40, 1, 1, 1, 0, 0, 0);
DELETE FROM `skinning_loot_template` WHERE `entry` in (17156,17157,18062,18881,18882,20498,21050,21936,22313,22390,22344,22391,30814);
UPDATE `creature_template` SET `skinloot`='17156' WHERE `entry` in (17156,17157,18062,18881,18882,20498,21050,21936,22313,22390,22344,22391,30814);
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(17156, 23077, 1, 0, -23077, 1, 0, 0, 0),
(17156, 22573, 20, 0, 1, 3, 0, 0, 0),
(17156, 24189, 100, 0, 1, 1, 0, 0, 0);
DELETE FROM `skinning_loot_template` WHERE `entry` in (18182,18690,18885,18886,19188,19823,19824,19940,20202,20599,20772,21181,21844,22011,22054,22275,23165,19066,23333);
UPDATE `creature_template` SET `skinloot`='18182' WHERE `entry` in (18182,18690,18885,18886,19188,19823,19824,19940,20202,20599,20772,21181,21844,22011,22054,22275,23165,19066,23333);
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(18182, 23077, 5, 0, -23077, 1, 0, 0, 0),
(18182, 22573, 20, 0, 1, 3, 0, 0, 0),
(18182, 24189, 100, 0, 1, 1, 0, 0, 0);
DELETE FROM `skinning_loot_template` WHERE `entry` in (18343,20268);
UPDATE `creature_template` SET `skinloot`='18343' WHERE `entry` in (18343,20268);
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(18343, 21929, 30, 0, -21929, 1, 0, 0, 0),
(18343, 23425, 100, 0, 4, 10, 0, 0, 0),
(18343, 23436, 2, 0, -23436, 1, 0, 0, 0);
DELETE FROM `reference_loot_template` WHERE `entry` = 23077;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(23077, 21929, 0, 1, 1, 1, 0, 0, 0),
(23077, 23077, 0, 1, 1, 1, 0, 0, 0),
(23077, 23079, 0, 1, 1, 1, 0, 0, 0),
(23077, 23107, 0, 1, 1, 1, 0, 0, 0),
(23077, 23112, 0, 1, 1, 1, 0, 0, 0),
(23077, 23117, 0, 1, 1, 1, 0, 0, 0);
DELETE FROM `skinning_loot_template` WHERE `entry` in (23725,24271,24329,26283,26284,26291,26347,26406,28069,28411,28597,28840,28877,29013,29124,29307,31365,29436,29832,30390,29844,30040,30053,30160,30876,26316,24316,26290,30930,32447,33699,33700,33722,33723,34069,34185,34086,34201,34134,34141,34135,34142,34190,34229,34196,34245,34197,34226);
UPDATE `creature_template` SET `skinloot`='23725' WHERE `entry` in (23725,24271,24329,26283,26284,26291,26347,26406,28069,28411,28597,28840,28877,29013,29124,29307,31365,29436,29832,30390,29844,30040,30053,30160,30876,26316,24316,26290,30930,32447,33699,33700,33722,33723,34069,34185,34086,34201,34134,34141,34135,34142,34190,34229,34196,34245,34197,34226);
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(23725, 37701, 5, 0, 1, 3, 0, 0, 0),
(23725, 39220, 100, 0, 1, 1, 0, 0, 0);
UPDATE `creature_template` SET `skinloot`='0' WHERE `entry` in (30341,26872,29485);
DELETE FROM `skinning_loot_template` WHERE `entry` in (26872,30341,29485);
DELETE FROM `skinning_loot_template` WHERE `entry` in (26794,30532,27977,31381,34085,34186);
UPDATE `creature_template` SET `skinloot`='26794' WHERE `entry` in (26794,30532,27977,31381,34085,34186);
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(26794, 36909, 30, 0, 5, 10, 0, 0, 0),
(26794, 36920, 5, 0, -36920, 1, 0, 0, 0),
(26794, 36918, 3, 0, -36918, 1, 0, 0, 0),
(26794, 37701, 30, 0, 5, 8, 0, 0, 0),
(26794, 39220, 100, 0, 2, 8, 0, 0, 0);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='5' WHERE `item`=39152;
DELETE FROM `reference_loot_template` WHERE `entry` = 22575;
DELETE FROM `reference_loot_template` WHERE `entry` = 33452;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(33432, 36811, 50, 0, 3, 20, 0, 0, 0),
(33432, 36812, 50, 0, 3, 20, 0, 0, 0),
(33432, 36813, 50, 0, 3, 20, 0, 0, 0),
(33432, 36814, 50, 0, 3, 20, 0, 0, 0),
(33432, 41337, 50, 0, 3, 20, 0, 0, 0),
(33432, 41338, 50, 0, 3, 20, 0, 0, 0),
(33432, 42931, 50, 0, 3, 20, 0, 0, 0),
(34106, 36811, 50, 0, 3, 20, 0, 0, 0),
(34106, 36812, 50, 0, 3, 20, 0, 0, 0),
(34106, 36813, 50, 0, 3, 20, 0, 0, 0),
(34106, 36814, 50, 0, 3, 20, 0, 0, 0),
(34106, 41337, 50, 0, 3, 20, 0, 0, 0),
(34106, 41338, 50, 0, 3, 20, 0, 0, 0),
(34106, 42931, 50, 0, 3, 20, 0, 0, 0);
DELETE FROM `creature_loot_template` WHERE `entry` not in (33432,34106) AND `item` in (42931,36811,36812,36813,36814,41337,41338,42931);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='5' WHERE `item`=34984;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='10' WHERE `item` in (24101,24102);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='15' WHERE `entry`=9025 AND `item`=45050;
UPDATE `creature` LEFT JOIN (`creature_movement`) ON (`creature_movement`.`id`=`creature`.`guid`) LEFT JOIN (`creature_movement_template`) ON (`creature_movement_template`.`entry`=`creature`.`id`) SET `creature`.`currentwaypoint`=0 WHERE `creature`.`MovementType`=0 AND `creature`.`currentwaypoint`=1 AND (`creature_movement`.`id` IS NULL AND `creature_movement_template`.`entry` IS NULL);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10453,14489);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10454,14489);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10455,14489);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10456,14489);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10457,14489);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10458,14489);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10459,14489);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10460,14489);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10462,14489);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10461,14489);
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64805' WHERE `entry`=10453 AND `text_id`=14489;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64808' WHERE `entry`=10454 AND `text_id`=14489;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64809' WHERE `entry`=10455 AND `text_id`=14489;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64810' WHERE `entry`=10456 AND `text_id`=14489;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64811' WHERE `entry`=10457 AND `text_id`=14489;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64812' WHERE `entry`=10458 AND `text_id`=14489;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64813' WHERE `entry`=10459 AND `text_id`=14489;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64814' WHERE `entry`=10460 AND `text_id`=14489;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64815' WHERE `entry`=10461 AND `text_id`=14489;
UPDATE `gossip_menu` SET `cond_1`='1', `cond_1_val_1`='64816' WHERE `entry`=10462 AND `text_id`=14489;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(10453, 0, 0, 'I am ready to fight!', 1, 1, -1, 0, 0, 0, 0, NULL, 1, 63034, 0, 11, 64805, 0, 0, 0, 0),
(10454, 0, 0, 'I am ready to fight!', 1, 1, -1, 0, 0, 0, 0, NULL, 1, 63034, 0, 11, 64808, 0, 0, 0, 0),
(10455, 0, 0, 'I am ready to fight!', 1, 1, -1, 0, 0, 0, 0, NULL, 1, 63034, 0, 11, 64809, 0, 0, 0, 0),
(10456, 0, 0, 'I am ready to fight!', 1, 1, -1, 0, 0, 0, 0, NULL, 1, 63034, 0, 11, 64810, 0, 0, 0, 0),
(10457, 0, 0, 'I am ready to fight!', 1, 1, -1, 0, 0, 0, 0, NULL, 1, 63034, 0, 11, 64811, 0, 0, 0, 0),
(10458, 0, 0, 'I am ready to fight!', 1, 1, -1, 0, 0, 0, 0, NULL, 1, 63034, 0, 11, 64812, 0, 0, 0, 0),
(10459, 0, 0, 'I am ready to fight!', 1, 1, -1, 0, 0, 0, 0, NULL, 1, 63034, 0, 11, 64813, 0, 0, 0, 0),
(10460, 0, 0, 'I am ready to fight!', 1, 1, -1, 0, 0, 0, 0, NULL, 1, 63034, 0, 11, 64814, 0, 0, 0, 0),
(10461, 0, 0, 'I am ready to fight!', 1, 1, -1, 0, 0, 0, 0, NULL, 1, 63034, 0, 11, 64815, 0, 0, 0, 0),
(10462, 0, 0, 'I am ready to fight!', 1, 1, -1, 0, 0, 0, 0, NULL, 1, 63034, 0, 11, 64816, 0, 0, 0, 0);
UPDATE `gossip_menu_option` SET `cond_2_val_1`='64811' WHERE `menu_id`=10468 AND `id`=0;
UPDATE `gossip_menu_option` SET `cond_1_val_1`='63034' WHERE `menu_id` in (10464,10465,10466,10467,10468,10469,10470,10471,10472,10473) AND `id`=0;
UPDATE `quest_template` SET `RequestItemsText`='Back so soon? In case I didn''t make myself clear we need you to kill 10 Stonesplinter Shaman and 10 Stonesplinter Bonesnappers, $n. Now go get ''em, Trogg-Slayer!' WHERE `entry`=263;
UPDATE `quest_template` SET `OfferRewardText`='This is quite a find, $n. I can''t have you selling this to anyone else, so I''m willing to offer generously.' WHERE `entry`=14203;
UPDATE `quest_template` SET `OfferRewardText`='That a weapon of such power has been redeemed from the clutches of evil is a great omen in these times, $n. With Quel''Delar and staunch Sunreaver allies at our side, the Lich King will have good reason to fear.$B$BThe crusade maintains an arsenal of exceptional weapons for our strongest allies. Allow me to offer you your choice from among them in return for entrusting us with the care of Quel''Delar.' WHERE `entry`=24799;
UPDATE `creature_template_addon` SET `bytes1`='0', `auras`='29266' WHERE `entry`=17600;
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (6381, 6808);
INSERT INTO achievement_criteria_requirement (criteria_id, TYPE, value1, value2) VALUES (6381, 12, 0, 0),(6808, 12, 1, 0);
DELETE FROM npc_text WHERE ID IN (10991);
INSERT INTO npc_text (ID, text0_0, text0_1, lang0, prob0, em0_0, em0_1, em0_2, em0_3, em0_4, em0_5, text1_0, text1_1, lang1, prob1, em1_0, em1_1, em1_2, em1_3, em1_4, em1_5, text2_0, text2_1, lang2, prob2, em2_0, em2_1, em2_2, em2_3, em2_4, em2_5, text3_0, text3_1, lang3, prob3, em3_0, em3_1, em3_2, em3_3, em3_4, em3_5, text4_0, text4_1, lang4, prob4, em4_0, em4_1, em4_2, em4_3, em4_4, em4_5, text5_0, text5_1, lang5, prob5, em5_0, em5_1, em5_2, em5_3, em5_4, em5_5, text6_0, text6_1, lang6, prob6, em6_0, em6_1, em6_2, em6_3, em6_4, em6_5, text7_0, text7_1, lang7, prob7, em7_0, em7_1, em7_2, em7_3, em7_4, em7_5) VALUES
(10991,'What can I say, $N?  Yer the finest o\' the Sha\'tari Skyguard!$B$BJust don\'t be lettin\' that go ta yer head.  I can still teach ya a thing or two, $G lad : lass;!$B$B<Sky Commander Keller grins at you and winks.>','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0);
UPDATE creature_template_addon SET auras=NULL WHERE entry=36659;
UPDATE creature_template_addon SET auras=NULL WHERE entry=36626;
UPDATE quest_template SET SpecialFlags=SpecialFlags|1 WHERE entry=11027;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='70' WHERE `entry`=32777 AND `item`=32569;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='10' WHERE `entry`=32777 AND `item`=32576;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='10' WHERE `entry`=32777 AND `item`=32578;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='20' WHERE `entry`=32777 AND `item`=32643;
UPDATE `item_loot_template` SET `ChanceOrQuestChance`='30' WHERE `entry`=32777 AND `item`=33784;
DELETE FROM spell_script_target WHERE entry IN (40825, 40830);
INSERT INTO spell_script_target (entry, TYPE, targetEntry) VALUES (40825, 1, 22291),(40825, 1, 22195),(40825, 1, 20557),(40830, 1, 22291),(40830, 1, 22195),(40830, 1, 20557);
DELETE FROM spell_script_target WHERE entry=44807;
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (44807, 1, 24850),(44807, 1, 24892);
DELETE FROM spell_script_target WHERE entry IN (44883, 44844, 44884);
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (44884, 1, 25160),(44844, 1, 25160),(44883, 1, 24882);
DELETE FROM spell_script_target WHERE entry IN (44885, 46350);
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (44885, 1, 25160),(46350, 1, 25160);
DELETE FROM spell_script_target WHERE entry=46707;
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (46707, 1, 25653);
DELETE FROM creature_template_addon WHERE entry=25588;
INSERT INTO creature_template_addon (entry, auras) VALUES (25588, '45769');
DELETE FROM creature_linking_template WHERE entry=16505;
INSERT INTO creature_linking_template (entry, map, master_entry, flag) VALUES (16505, 533, 15953, 7);
DELETE FROM spell_target_position WHERE id=46473;
INSERT INTO spell_target_position (id, target_map, target_position_x, target_position_y, target_position_z, target_orientation) VALUES (46473, 580, 1667.640, 633.466, 28.050, 6.05);
DELETE FROM spell_script_target WHERE entry=46818;
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (46818, 1, 26262);
DELETE FROM creature_linking_template WHERE entry=25588;
INSERT INTO creature_linking_template (entry, map, master_entry, flag) VALUES (25588, 580, 25315, 4);
DELETE FROM spell_script_target WHERE entry IN (45976, 46177, 45989, 46208, 46178);
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (45976, 1, 25770),(46177, 1, 25770),(46208, 1, 25741),(46178, 1, 25741);
DELETE FROM creature_linking_template WHERE
 (entry = 19224 AND map = 555)
 OR
 (entry = 19226 AND map = 555)
 OR
 (entry = 28695 AND map = 602)
 OR
 (entry = 28681 AND map = 602);
INSERT INTO creature_linking_template (entry, map, master_entry, flag) VALUES
(19224, 555, 18732, 4112),(19226, 555, 18732, 4112),(28695, 602, 28587, 4112),(28681, 602, 28587, 4112);
DELETE FROM spell_script_target WHERE entry = 47747;
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (47747, 1, 26918);
DELETE FROM spell_script_target WHERE entry = 39364;
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (39364, 1, 18732);
DELETE FROM spell_script_target WHERE entry IN (61975, 61901);
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (61975, 1, 32867),(61901, 1, 32867);
DELETE FROM creature_linking_template WHERE entry IN (32857, 32927);
INSERT INTO creature_linking_template (entry, map, master_entry, flag) VALUES (32857, 603, 32867, 143),(32927, 603, 32867, 143);
DELETE FROM creature_linking_template WHERE entry IN (15546, 15934);
INSERT INTO creature_linking_template (entry, map, master_entry, flag) VALUES (15546, 509, 15369, 4112),(15934, 509, 15369, 4096);
DELETE FROM creature_linking_template WHERE entry IN (15514);
INSERT INTO creature_linking_template (entry, map, master_entry, flag) VALUES (15514, 509, 15370, 1030);
DELETE FROM creature_linking_template WHERE entry IN (36565, 36272);
INSERT INTO creature_linking_template (entry, map, master_entry, flag) VALUES (36565, 33, 36296, 140),(36272, 33, 36296, 140);
DELETE FROM creature_linking_template WHERE entry IN (17911, 17912, 17913, 17914);
INSERT INTO creature_linking_template (entry, map, master_entry, flag)  VALUES
(17911, 329, 17910, 143),(17912, 329, 17910, 143),(17913, 329, 17910, 143),(17914, 329, 17910, 143);
DELETE FROM spell_script_target WHERE entry = 34874;
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (34874, 1, 17990);
DELETE FROM creature_linking_template WHERE entry = 17827;
INSERT INTO creature_linking_template (entry, map, master_entry, flag) VALUES (17827, 564, 1782, 3);
DELETE FROM spell_script_target WHERE entry = 34742;
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (34742, 1, 19949);
DELETE FROM creature_linking_template WHERE entry IN (20481, 21062);
INSERT INTO creature_linking_template (entry, map, master_entry, flag) VALUES (20481, 554, 19221, 4112),
(21062, 554, 19220, 4096);
delete from creature_linking_template where entry IN (20481);
insert into creature_linking_template values (20481, 554, 19221, 4112);
DELETE FROM spell_scripts WHERE id IN (34874, 27695);
INSERT INTO spell_scripts (id, delay, command, datalong, datalong2, comments) VALUES
(34874, 0, 18, 0, 0, 'Despawn Underbog Mushroom'),
(27695, 0, 15, 27696, 1, 'Cast Summon Bone Mage'),
(27695, 0, 15, 27697, 1, 'Cast Summon Bone Mage'),
(27695, 0, 15, 27698, 1, 'Cast Summon Bone Mage'),
(27695, 0, 15, 27699, 1, 'Cast Summon Bone Mage');
DELETE FROM spell_script_target WHERE entry=69294;
INSERT INTO spell_script_target SELECT 69294, b.type, b.targetEntry FROM spell_script_target AS b WHERE b.entry=17731;
Delete from spell_script_target where entry=57885;
insert into spell_script_target values (57885, 1, 23837);
DELETE FROM creature_linking_template WHERE entry=17827;
INSERT INTO creature_linking_template VALUES (17827, 546, 17826, 1);
DELETE FROM creature_linking_template WHERE entry =2946;
INSERT INTO creature_linking_template (entry, map, master_entry, flag) VALUES (2946,1,2433,3);
DELETE FROM creature_linking_template WHERE entry=1725;
INSERT INTO creature_linking_template VALUES (1725,36,644,1);
UPDATE spell_script_target SET type=2 WHERE entry=49555;
UPDATE creature_template_addon SET emote=0 WHERE entry =19569;
DELETE FROM creature_template_addon WHERE (entry=20159);
INSERT INTO creature_template_addon (entry,mount,bytes1,b2_0_sheath,b2_1_pvp_state,emote,moveflags,auras) VALUES (20159,18696,0,0,0,0,0,'');
DELETE FROM creature_template_addon WHERE entry=17885;
UPDATE `creature_template_addon` SET `bytes1`='0', `auras`='29266' WHERE `entry`=17508;
UPDATE creature_template_addon SET b2_1_pvp_state=b2_1_pvp_state|1 WHERE entry in (5661,31261);
DELETE FROM creature_addon WHERE guid IN (SELECT guid FROM creature WHERE id IN (29062, 29063, 29064, 29096, 29097, 29098));
DELETE FROM creature_template_addon WHERE entry IN (29062, 29063, 29064, 29096, 29097, 29098);
INSERT INTO creature_template_addon (entry, b2_0_sheath) VALUES (29062, 1), (29063, 1), (29064, 1), (29096, 1), (29097, 1), (29098, 1);
INSERT IGNORE INTO creature_template_addon (entry, b2_0_sheath, b2_1_pvp_state) VALUES (5489, 1, 1),(12336, 1, 1),(1351, 1, 1),(5484, 1, 1);
REPLACE INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(79089, 22515, 601, 3, 1, 0, 0, 478.14856, 269.0094, 250.543488, 6.126106, 120, 0, 0, 1, 0, 0, 0),
(79090, 22515, 601, 3, 1, 0, 0, 478.290863, 224.826492, 250.234558, 0.401425719, 120, 0, 0, 1, 0, 0, 0),
(79091, 22515, 601, 3, 1, 0, 0, 478.5473, 297.0447, 250.543488, 5.794493, 120, 0, 0, 1, 0, 0, 0),
(79092, 22515, 601, 3, 1, 0, 0, 478.739258, 252.849823, 250.543488, 0.05235988, 120, 0, 0, 1, 0, 0, 0),
(79093, 22515, 601, 3, 1, 0, 0, 488.555817, 692.949768, 771.76355, 4.886922, 120, 0, 0, 1, 0, 0, 0),
(79094, 22515, 601, 3, 1, 0, 0, 489.9746, 671.2391, 772.1313, 0.2617994, 120, 0, 0, 1, 0, 0, 0),
(79095, 22515, 601, 3, 1, 0, 0, 504.010376, 637.693054, 777.4791, 0.5061455, 120, 0, 0, 1, 0, 0, 0),
(79096, 22515, 601, 3, 1, 0, 0, 517.486145, 706.398, 777.334534, 5.358161, 120, 0, 0, 1, 0, 0, 0),
(127687, 22515, 601, 3, 1, 0, 0, 525.0097, 397.78, 240.898956, 4.92182827, 120, 0, 0, 1, 0, 0, 0),
(127751, 22515, 601, 3, 1, 0, 0, 529.0418, 706.9407, 777.2984, 1.08210409, 120, 0, 0, 1, 0, 0, 0),
(127752, 22515, 601, 3, 1, 0, 0, 548.8313, 409.552521, 283.359, 4.5553093, 120, 0, 0, 1, 0, 0, 0),
(127753, 22515, 601, 3, 1, 0, 0, 549.4818, 352.190552, 240.898972, 1.57079637, 120, 0, 0, 1, 0, 0, 0),
(127754, 22515, 601, 3, 1, 0, 0, 550.83, 254.738068, 128.89653, 2.60054064, 120, 0, 0, 1, 0, 0, 0),
(127755, 22515, 601, 3, 1, 0, 0, 552.6253, 706.4077, 777.176636, 3.4382987, 120, 0, 0, 1, 0, 0, 0),
(127756, 22515, 601, 3, 1, 0, 0, 553.3398, 640.386841, 777.4195, 1.20427716, 120, 0, 0, 1, 0, 0, 0),
(127757, 22515, 601, 3, 1, 0, 0, 554.9153, 257.097229, 223.972351, 3.92699075, 120, 0, 0, 1, 0, 0, 0),
(127758, 22515, 601, 3, 1, 0, 0, 555.675659, 419.087677, 283.917, 0.6981317, 120, 0, 0, 1, 0, 0, 0),
(127759, 22515, 601, 3, 1, 0, 0, 566.1641, 682.087341, 769.0793, 2.21656823, 120, 0, 0, 1, 0, 0, 0),
(127760, 22515, 601, 3, 1, 0, 0, 571.611755, 394.763458, 240.898956, 4.537856, 120, 0, 0, 1, 0, 0, 0),
(127761, 22515, 601, 3, 1, 0, 0, 620.621765, 298.262482, 250.5435, 3.700098, 120, 0, 0, 1, 0, 0, 0),
(127762, 22515, 601, 3, 1, 0, 0, 620.7037, 224.561844, 250.232086, 2.53072739, 120, 0, 0, 1, 0, 0, 0),
(127763, 22515, 601, 3, 1, 0, 0, 621.319031, 268.481934, 250.5435, 3.33357882, 120, 0, 0, 1, 0, 0, 0),
(127873, 22515, 601, 3, 1, 0, 0, 622.9042, 252.944992, 250.5435, 3.12413931, 120, 0, 0, 1, 0, 0, 0);
REPLACE INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(88483,846,0,1,1,0,0,-10084.3,1559.49,40.8883,3.00608,180,5,0,300,0,0,1);
REPLACE INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(91085,846,0,1,1,0,0,-10082.4,1556.31,41.0149,2.17749,180,5,0,300,0,0,1);
REPLACE INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(127874,846,0,1,1,0,0,-11281.5,1017.69,94.4474,5.30334,180,5,0,300,0,0,1);
REPLACE INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(128050,846,0,1,1,0,0,-11275.7,1022.68,94.7905,5.70782,180,5,0,300,0,0,1);
REPLACE INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(128051,846,0,1,1,0,0,-10984.3,1607.5,45.5599,4.52265,180,5,0,328,0,0,1);
REPLACE INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(128052,846,0,1,1,0,0,-10970.2,1608.44,46.5447,0.128347,180,5,0,300,0,0,1);
REPLACE INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(128053,846,0,1,1,0,0,-10974,1621.75,45.8095,1.69129,180,5,0,300,0,0,1);
REPLACE INTO game_event_creature (guid, event) VALUES (88483,29),(91085,29),(127874,29),(128050,29),(128051,29),(128052,29),(128053,29);
REPLACE INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
(3746, 176360, 329, 1, 1, 3500.44, -3296.51, 132.178, 4.55695, 0, 0, -0.711057, -0.703135, -180, 255, 1),
(3747, 176360, 329, 1, 1, 3566.72, -3351.26, 131.838, 2.31857, 0, 0, 0.916517, 0.399995, -180, 255, 1),
(3749, 176360, 329, 1, 1, 3662.24, -3629.09, 139.66, 2.20469, 0, 0, -0.382585, 0.92392, -180, 255, 1),
(3753, 176360, 329, 1, 1, 3660.25, -3477.18, 139.511, 4.82007, 0, 0, -0.685653, -0.727929, -180, 255, 1),
(3751, 176360, 329, 1, 1, 3652.15, -3165.96, 129.285, 5.34443, 0, 0, 0.452331, -0.89185, -180, 255, 1),
(3750, 176360, 329, 1, 1, 3682.91, -3401.05, 133.941, 0.670026, 0, 0, -0.929145, 0.369716, -180, 255, 1);
REPLACE INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES (7482, 152614, 1, 1,1,-11341.9, -4760.26, 19.3222, 2.40736, 0, 0, 0.933366, 0.358925, 180, 255, 1);
REPLACE INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
(98436, 30446, 571, 1, 1, 0, 0, 8382.5, -2549.35, 1145.97, 3.82227, 120, 0, 0, 1, 0, 0, 0),
(98435, 30446, 571, 1, 1, 0, 0, 8361.87, -2526.85, 1141.39, 3.68264, 120, 0, 0, 1, 0, 0, 0),
(98773, 30446, 571, 1, 1, 0, 0, 8354.63, -2549.88, 1148.54, 4.95674, 120, 0, 0, 1, 0, 0, 0),
(105081, 30446, 571, 1, 1, 0, 0, 8331.42, -2502.39, 1140.05, 4.53786, 120, 0, 0, 1, 0, 0, 0),
(128054, 30446, 571, 1, 1, 0, 0, 8310.22, -2550.68, 1153.69, 1.91986, 120, 0, 0, 1, 0, 0, 0),
(128074, 30446, 571, 1, 1, 0, 0, 8300.43, -2564.86, 1153.59, 0.261799, 120, 0, 0, 1, 0, 0, 0),
(128075, 30446, 571, 1, 1, 0, 0, 8393.97, -2540.06, 1131.91, 5.07891, 120, 0, 0, 1, 0, 0, 0);
UPDATE creature_template SET faction_A=16, faction_H=16 WHERE entry =10882;
DELETE FROM gossip_menu WHERE entry IN (263, 264);
INSERT INTO gossip_menu (entry, text_id) VALUES (263,762),(264,761);
DELETE FROM gossip_menu_option WHERE menu_id =264;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, cond_1, cond_1_val_1, cond_1_val_2, cond_2, cond_2_val_1, cond_2_val_2, cond_3, cond_3_val_1, cond_3_val_2) VALUES 
(264, 0, 0, 'Where is the key to this lock?', 1, 1, 263, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM gossip_menu WHERE entry IN (261, 262);
INSERT INTO gossip_menu (entry, text_id) VALUES (261,760),(262,759);
DELETE FROM gossip_menu_option WHERE menu_id =262;
INSERT INTO gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, cond_1, cond_1_val_1, cond_1_val_2, cond_2, cond_2_val_1, cond_2_val_2, cond_3, cond_3_val_1, cond_3_val_2) VALUES 
(262, 0, 0, 'Where is the key to this lock?', 1, 1, 261, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE creature_template SET gossip_menu_id = 262 WHERE entry = 2239;
DELETE FROM `gossip_menu` WHERE `entry` = 50391;
DELETE FROM `gossip_menu` WHERE `entry` = 50392;
DELETE FROM `gossip_menu` WHERE `entry` = 50394;
DELETE FROM  gossip_menu_option WHERE menu_id = 50391;
UPDATE locales_gossip_menu_option SET menu_id = 262 WHERE menu_id = 50391;
UPDATE creature_template SET gossip_menu_id=9487 WHERE entry=27267;
DELETE FROM gossip_menu_option WHERE menu_id=9487;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(9487,0,1,'Let me browse your goods',3,128,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
DELETE FROM gossip_menu WHERE entry=9487;
INSERT INTO gossip_menu (entry, text_id) VALUES (9487, 12759);
REPLACE INTO gossip_menu (entry, text_id) VALUES (9521, 12827),(9525, 12830),(9526, 12832),(9527, 12833);
UPDATE `gossip_menu_option` SET `action_menu_id`='9527' WHERE `action_menu_id`='50423';
UPDATE `gossip_menu_option` SET `action_menu_id`='9521' WHERE `action_menu_id`='50424';
UPDATE `gossip_menu_option` SET `action_menu_id`='9526' WHERE `action_menu_id`='50425';
UPDATE `gossip_menu_option` SET `action_menu_id`='9525' WHERE `action_menu_id`='50426';
DELETE FROM `gossip_menu` WHERE `entry` = 50423;
DELETE FROM `gossip_menu` WHERE `entry` = 50424;
DELETE FROM `gossip_menu` WHERE `entry` = 50425;
DELETE FROM `gossip_menu` WHERE `entry` = 50426;
DELETE FROM gossip_scripts WHERE id=9607;
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,x,y,z,o,comments) VALUES
(9607,0,15,49747,0,0,0,0x02,0,0,0,0,0,0,'create item 37925 - limit 1');
UPDATE gossip_menu_option SET action_script_id=9874 WHERE menu_id=9874;
DELETE FROM gossip_scripts WHERE id in (9874,30154);
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,x,y,z,o,comments) VALUES
(9874,0,0,0,30154,10,0,0x02,2000000347,0,0,0,0,0,'Say'),
(9874,0,22,14,30154,10,0,0x07,0,0,0,0,0,0,'change faction'),
(9874,1,26,0,30154,10,0,0,0,0,0,0,0,0,'start attack');
UPDATE `db_script_string` SET `content_default`='I''m not afraid of anything -- bring it on!' WHERE `entry`=2000000347;
DELETE FROM gossip_menu WHERE entry IN (7519,7520,7521,7525);
INSERT INTO gossip_menu (entry, text_id, script_id) VALUES
(7519, 9118, 7519),
(7520, 9119, 7520),
(7521, 9121, 7521),
(7525, 9125, 7525);
DELETE FROM gossip_scripts WHERE id IN (7519, 7520,7521, 7525);
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,x,y,z,o,comments) VALUES
(7519,0,8,17890,1,10,0,0,0,0,0,0,0,0,'killcredit'),
(7520,0,8,17893,1,10,0,0,0,0,0,0,0,0,'killcredit'),
(7521,0,8,17885,1,10,0,0,0,0,0,0,0,0,'killcredit'),
(7525,0,8,17894,1,10,0,0,0,0,0,0,0,0,'killcredit');
UPDATE creature_template SET flags_extra=flags_extra | 2048 WHERE entry in (17890,17893,17894,17895);
UPDATE `gossip_menu_option` SET `action_menu_id`='0' WHERE `menu_id`=7520 AND `id`=0;
DELETE FROM `gossip_menu` WHERE `entry` = 50009;
DELETE FROM gossip_menu WHERE entry=1442;
INSERT INTO gossip_menu (entry, text_id) VALUES (1442, 2115);
UPDATE creature_template SET gossip_menu_id=8899 WHERE entry=24130;
DELETE FROM gossip_menu_option WHERE menu_id=8899;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(8899,0,0,'Please loan me that spyglass.',1,1,8928,0,8899,0,0,'',16,33341,1,8,11256,0,0,0,0);
DELETE FROM gossip_scripts WHERE id=8899;
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,x,y,z,o,comments) VALUES
(8899,0,15,43103,0,0,0,0,0,0,0,0,0,0,'cast Loan Spyglass');
DELETE FROM gossip_menu WHERE entry IN (8899,8928);
INSERT INTO gossip_menu (entry, text_id) VALUES (8899, 11689),(8928, 11910);
DELETE FROM gossip_menu_option WHERE menu_id IN (7478,7477,7476,7475);
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(7478,0,0,'Why do you suffer?',1,1,7477,0,0,0,0,'',0,0,0,0,0,0,0,0,0),
(7477,0,0,'What is Ysera and how were you blessed?',1,1,7476,0,0,0,0,'',0,0,0,0,0,0,0,0,0),
(7476,0,0,'Until what?',1,1,7475,0,0,0,0,'',0,0,0,0,0,0,0,0,0),
(7475,0,0,'So why are you still here?',1,1,7474,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
UPDATE creature SET spawntimesecs=15 WHERE id IN (27378, 27381, 27376, 27379);
REPLACE INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(9509,0,0,'Afraid not. Your days as a sanitation engineer are coming to an end.',1,1,0,0,9509,0,0,'',9,12245,0,0,0,0,0,0,0);
DELETE FROM gossip_scripts WHERE id in (9509,27379);
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,x,y,z,o,comments) VALUES
(9509,0,1,5,27379,10,0,0x01,0,0,0,0,0,0,'play emote'),
(9509,0,0,0,27379,10,1,0,2000000064,0,0,0,0,0,'Say'),
(9509,0,22,190,27379,10,0,0x01,0,0,0,0,0,0,'change faction'),
(9509,0,29,1,27379,10,0,0x02,0,0,0,0,0,0,'change NPC_flag'),
(9509,0,18,60000,0,0,0,0,0,0,0,0,0,0,'despawn');
DELETE FROM db_script_string WHERE entry=2000000064;
INSERT INTO db_script_string (entry,content_default) VALUES 
(2000000064,'No! I beg you! Please don\'t kill me!');
DELETE FROM gossip_menu_option WHERE menu_id=9507;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(9507,0,0,'I\'m afraid not, Schneider. Your time has come!',1,1,0,0,9507,0,0,'',9,12245,0,0,0,0,0,0,0);
DELETE FROM gossip_scripts WHERE id in (9507,27376);
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,x,y,z,o,comments) VALUES
(9507,0,1,5,27376,10,0,0x01,0,0,0,0,0,0,'play emote'),
(9507,0,0,0,27376,10,1,0,2000000066,0,0,0,0,0,'Say'),
(9507,0,22,190,27376,10,0,0x01,0,0,0,0,0,0,'change faction'),
(9507,0,29,1,27376,10,0,0x02,0,0,0,0,0,0,'change NPC_flag'),
(9507,0,18,60000,0,0,0,0,0,0,0,0,0,0,'despawn');
DELETE FROM db_script_string WHERE entry=2000000066;
INSERT INTO db_script_string (entry,content_default) VALUES 
(2000000066,'What do you mean my time has come?! I\'ll kill you where you stand!');
DELETE FROM gossip_menu_option WHERE menu_id=9510;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(9510,0,0,'No, chancellor, I wouldn\'t say that I\'m here to \'rescue\' you, per se.',1,1,0,0,9510,0,0,'',9,12245,0,0,0,0,0,0,0);
DELETE FROM gossip_scripts WHERE id in (9510,27381);
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,x,y,z,o,comments) VALUES
(9510,0,1,5,27381,10,0,0x01,0,0,0,0,0,0,'play emote'),
(9510,0,0,0,27381,10,1,0,2000000075,0,0,0,0,0,'Say'),
(9510,0,22,190,27381,10,0,0x01,0,0,0,0,0,0,'change faction'),
(9510,0,29,1,27381,10,0,0x02,0,0,0,0,0,0,'change NPC_flag'),
(9510,0,18,60000,0,0,0,0,0,0,0,0,0,0,'despawn');
DELETE FROM db_script_string WHERE entry=2000000075;
INSERT INTO db_script_string (entry,content_default) VALUES 
(2000000075,'What is the meaning of this?! Stop! I\'ll double whatever they\'re paying you!');
DELETE FROM gossip_menu_option WHERE menu_id=9508;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(9508,0,0,'Not today, senior scrivener!',1,1,0,0,9508,0,0,'',9,12245,0,0,0,0,0,0,0);
DELETE FROM gossip_scripts WHERE id in (9508,27378);
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,x,y,z,o,comments) VALUES
(9508,0,1,274,27378,10,0,0x01,0,0,0,0,0,0,'play emote'),
(9508,0,0,0,27378,10,1,0,2000000065,0,0,0,0,0,'Say'),
(9508,0,22,190,27378,10,0,0x01,0,0,0,0,0,0,'change faction'),
(9508,0,29,1,27378,10,0,0x02,0,0,0,0,0,0,'change NPC_flag'),
(9508,0,18,60000,0,0,0,0,0,0,0,0,0,0,'despawn');
DELETE FROM db_script_string WHERE entry=2000000065;
INSERT INTO db_script_string (entry,content_default) VALUES 
(2000000065,'You can\'t possibly mean to.... I\'ll write you up for this, $c!');
DELETE FROM gossip_menu_option WHERE menu_id IN (10178,10177,10176);
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(10178,0,0,'Tell me of youself, Xarantaur. Why are you called the Witness?',1,1,10177,0,0,0,0,'',0,0,0,0,0,0,0,0,0),
(10177,0,0,'please, go on.',1,1,10176,0,0,0,0,'',0,0,0,0,0,0,0,0,0),
(10176,0,0,'They?',1,1,10175,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 50009;
DELETE FROM `gossip_scripts` WHERE `id` = 17893;
DELETE FROM gossip_menu_option WHERE menu_id=9906;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(9906,0,0,'I am sorry to disturb your rest, chieftain, but your brother\'s spirit may be in danger. Would you tell me what you remember of him?',1,1,-1,0,9906,0,0,'',9,13037,0,0,0,0,0,0,0);
DELETE FROM gossip_scripts WHERE id=9906;
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(9906,0,15,56760,0x00,0,0,0,0,0,0,0,0,0,0,0,'cast spell 56760'),
(9906,0,1,1,30395,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(9906,0,0,0,30395,10,0,0x02,2000000607,0,0,0,0,0,0,0,'say 1'),
(9906,7,1,1,30395,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(9906,7,0,0,30395,10,0,0x02,2000000608,0,0,0,0,0,0,0,'say 2'),
(9906,13,1,6,30395,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotQuestion'),
(9906,13,0,0,30395,10,0,0x02,2000000609,0,0,0,0,0,0,0,'say 3'),
(9906,19,1,5,30395,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotExclamation'),
(9906,19,0,0,30395,10,0,0x02,2000000610,0,0,0,0,0,0,0,'say 4'),
(9906,25,1,274,30395,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotNo'),
(9906,25,0,0,30395,10,0,0x02,2000000611,0,0,0,0,0,0,0,'say 5'),
(9906,32,1,25,30395,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotPoint'),
(9906,32,0,0,30395,10,0,0x05,2000000612,0,0,0,0,0,0,0,'say 6'),
(9906,38,1,1,30395,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(9906,38,0,0,30395,10,0,0x02,2000000613,0,0,0,0,0,0,0,'say 7'),
(9906,43,8,30381,1,0,0,0,0,0,0,0,0,0,0,0,'killcredit');
REPLACE INTO db_script_string (entry,content_default) VALUES
(2000000607,'My brother, Stormhoof, was a far greater warrior than I. While I trained to be the chieftain of our clan, he prepared for a larger quest.'),
(2000000608,'How could he be in danger? All he wanted was to give us power over the elements that made life harsh for us here.'),
(2000000609,'He sought an artifact... a horn, I think. He left the village on a long journey in search of it.'),
(2000000610,'I know that a terrible enemy pursued him after he won the horn, but I... I don\'t recall... what happened... next.'),
(2000000611,'It is as though my memories are shrouded in mist. I cannot even recall what became of my brother. Is this how you mean that he is in danger?'),
(2000000612,'The disturbances in the tomb, they must be involved. Look around you, $N. Do you see them?'),
(2000000613,'Yes, they are at fault, but I am powerless to stop them. Will you warn the people of Tunka\'lo, stranger, that their past and their ancestors are in danger?');
DELETE FROM spell_scripts WHERE id IN (56796, 56797);
INSERT INTO spell_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(56796,1,0,0,0,0,0,0,2000000614,0,0,0,0,0,0,0,'say Correct Time Period'),
(56797,1,0,0,0,0,0,0,2000000615,0,0,0,0,0,0,0,'say Incorrect Time Period');
REPLACE INTO db_script_string (entry,content_default) VALUES
(2000000614,'The Lorehammer ist reacting. This must be from Stormhoof\'s time.'),
(2000000615,'The Lorehammer is silent. This isn\'t from Stormhoof\'s time.');
DELETE FROM gossip_menu_option WHERE menu_id=7452;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(7452,0,0,'Jessera, could you direct me towards the aquatic stinkhorn?',1,1,7453,0,0,0,0,'',9,9648,0,0,0,0,0,0,0),
(7452,1,0,'Jessera, could you direct me towards the ruinous polyspore?',1,1,7454,0,0,0,0,'',9,9648,0,0,0,0,0,0,0),
(7452,2,0,'Jessera, could you direct me towards the fel cone fungus?',1,1,7456,0,0,0,0,'',9,9648,0,0,0,0,0,0,0),
(7452,3,0,'Jessera, could you direct me towards the blood mushrooms?',1,1,7457,0,0,0,0,'',9,9648,0,0,0,0,0,0,0);
DELETE FROM gossip_menu_option WHERE menu_id=7449;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(7449,0,0,'I need the illusion cast upon me again, Admetius.',1,1,-1,0,7449,0,0,'',9,9756,0,11,31609,0,0,0,0);
DELETE FROM gossip_scripts WHERE id=7449;
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(7449,0,15,31609,0,0,0,0,0,0,0,0,0,0,0,0,'cast spell 31609');
DELETE FROM gossip_menu_option WHERE menu_id IN (7531,7537,7536,7535,7534,7533);
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(7531,0,0,'I\'m a prisoner, what does it look like? The draenei filth captured me as I exited the sun gate. They killed our portal controllers and destroyed the gate. The Sun King will be most displeased with this turn of events.',1,1,7537,0,0,0,0,'',9,9756,0,1,31609,0,0,0,0),
(7537,0,0,'Ah yes, Sironas. I had nearly forgotten that Sironas was here. I served under Sironas back on Outland. I hadn\'t heard of this abomination, though; those damnable draenei captured me before I even fully materialized on this world.',1,1,7536,0,0,0,0,'',0,0,0,0,0,0,0,0,0),
(7536,0,0,'Incredible. How did Sironas accomplish such a thing?',1,1,7535,0,0,0,0,'',0,0,0,0,0,0,0,0,0),
(7535,0,0,'Sironas is an eredar... I mean, yes, obviously.',1,1,7534,0,0,0,0,'',0,0,0,0,0,0,0,0,0),
(7534,0,0,'The Vector Coil is massive. I hope we have more than one abomination guarding the numerous weak points.',1,1,7533,0,0,0,0,'',0,0,0,0,0,0,0,0,0),
(7533,0,0,'I did and you believed me. Thank you for the information, blood elf. You have helped us more than you could know.',1,1,-1,0,7533,0,0,'',0,0,0,0,0,0,0,0,0);
DELETE FROM gossip_scripts WHERE id=7533;
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(7533,0,8,17974,1,0,0,0,0,0,0,0,0,0,0,0,'killcredit for quest 9756'),
(7533,0,1,5,17824,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotExclamation'),
(7533,0,0,0,17824,10,0,0,2000000606,0,0,0,0,0,0,0,'say text');
DELETE FROM gossip_scripts WHERE id=8870;
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(8870,0,15,42756,0,0,0,0,0,0,0,0,0,0,0,0,'killcredit');
DELETE FROM gossip_scripts WHERE id=8879;
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(8879,0,15,42799,0,0,0,0,0,0,0,0,0,0,0,0,'killcredit');
DELETE FROM gossip_menu_option WHERE menu_id IN (7493,7492,7491);
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(7493,0,0,'<Turn to the next page.>',1,1,7492,0,0,0,0,'',0,0,0,0,0,0,0,0,0),
(7492,0,0,'<Turn to the next page.>',1,1,7491,0,0,0,0,'',0,0,0,0,0,0,0,0,0),
(7491,0,0,'<Turn to the next page.>',1,1,7490,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
DELETE FROM gossip_menu WHERE entry IN (7492,7491,7490);
INSERT INTO gossip_menu (entry, text_id) VALUES (7492, 9080),(7491, 9081),(7490, 9082);
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=4824 AND `id`=1;
UPDATE `gossip_menu_option` SET `id`='0', `option_text`='Please teach me.' WHERE `menu_id`=4824 AND `id`=1;
UPDATE `gossip_menu` SET `text_id`='5880' WHERE `entry`=4824 AND `text_id`=10292;
UPDATE creature_template SET MovementType=2 WHERE entry=17592;
DELETE FROM creature_movement_template WHERE entry=17592;
INSERT INTO creature_movement_template VALUES 
(17592,1,-1202.27,-12468.78,94.93,2.8860,0,0,0,0,0,0,0,0,0,0,0,0);
DELETE FROM event_scripts WHERE id=11087;
INSERT INTO event_scripts VALUES
(11087,0,10,17592,180000,0,0,0,0,0,0,0,-1233.44,-12563.59,157.842,1.270,'Razormaw spawn'),
(11087,9,26,0,17592,50,0,0,0,0,0,0,0,0,0,0,'start attack');
DELETE FROM gossip_menu_option WHERE menu_id=7465;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(7465,0,0,'Where should I begin my search for the portal?',1,1,7501,0,0,0,0,'',9,9700,0,0,0,0,0,0,0);
UPDATE gossip_menu_option SET action_script_id=9865 WHERE menu_id=9865;
DELETE FROM gossip_scripts WHERE id in (9865,30012);
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(9865,0,22,14,30012,20,0,0x07,0,0,0,0,0,0,0,0,'change faction'),
(9865,0,0,0,30012,20,0,0,2000000616,2000000617,2000000618,2000000619,0,0,0,0,'Say'),
(9865,1,26,0,30012,20,0,0,0,0,0,0,0,0,0,0,'start attack');
REPLACE INTO db_script_string (entry,content_default) VALUES
(2000000616,'Good luck... You\'ll need it!'),
(2000000617,'May the best win!'),
(2000000618,'You will not defeat me!'),
(2000000619,'You\'re not worthy of Thorim!');
REPLACE INTO gossip_menu (entry, text_id, cond_1, cond_1_val_1) VALUES
(8678, 10918, 8, 11061);
DELETE FROM gossip_menu_option WHERE menu_id=8724 AND id=0;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(8724,0,1,'Let me browse your goods.',3,128,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
DELETE FROM gossip_menu_option WHERE menu_id=8722 AND id=0;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(8722,0,1,'Let me browse your goods.',3,128,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
UPDATE gossip_menu SET cond_1=5, cond_1_val_1=1038, cond_1_val_2=7 WHERE entry=8679 AND text_id=11028;
REPLACE INTO gossip_menu (entry, text_id) VALUES (8679, 10919);
DELETE FROM gossip_menu_option WHERE menu_id=8721 AND id=0;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(8721,0,1,'Let me browse your goods.',3,128,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
DELETE FROM gossip_scripts WHERE id=9821;
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(9821,0,17,31760,0x01,0,0,0,0,0,0,0,0,0,0,0,'give item Minischwing');
DELETE FROM gossip_menu_option WHERE menu_id=8723 AND id=0;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(8723,0,1,'Let me browse your goods.',3,128,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
DELETE FROM gossip_menu_option WHERE menu_id=7772;
INSERT INTO gossip_menu_option VALUES 
(7772,1,0,'Scout Neftis, I need a new disguise',1,1,-1,0,7772,0,0,'',9,10041,0,11,32756,0,0,0,0);
DELETE FROM gossip_scripts WHERE id in (7772,18714);
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(7772,0,15,48917,0,0,0,0,0,0,0,0,0,0,0,0,'');
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=9894 AND `id`=1;
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=9894 AND `id`=1;
UPDATE gossip_menu_option SET action_script_id=7761, cond_1=1, cond_1_val_1=32756 WHERE menu_id=7760;
UPDATE gossip_menu_option SET action_script_id=7758, cond_1=1, cond_1_val_1=32756 WHERE menu_id=7759;
UPDATE gossip_menu_option SET action_script_id=7755, cond_1=1, cond_1_val_1=32756 WHERE menu_id=7757;
DELETE FROM gossip_scripts WHERE id IN (7761,7758,7755,18717,18716,18719);
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(7761,0,8,26466,0,0,0,0,0,0,0,0,0,0,0,0,'Shadowy Advisor Kill Credit'),
(7758,0,8,26464,0,0,0,0,0,0,0,0,0,0,0,0,'Shadowy Initiate Kill Credit'),
(7755,0,8,26465,0,0,0,0,0,0,0,0,0,0,0,0,'Shadowy Laborer Kill Credit');
UPDATE gossip_menu_option SET action_script_id=10026 WHERE menu_id=10026;
UPDATE `gossip_scripts` SET `id`='10026' WHERE `id`=31085;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=9576 AND `id`=1;
DELETE FROM gossip_scripts WHERE id=8672;
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(8672,0,15,40964,0x01,0,0,0,0,0,0,0,0,0,0,0,'Fel Crystalforge: Create 1 Flask');
DELETE FROM gossip_scripts WHERE id=10005;
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(10005,0,15,57888,1,0,0,0,0,0,0,0,0,0,0,0,'Through the Eye: Eye of the Lich King Gossip Force Cast'),
(10005,1,0,3,23837,5,0,0,2000000620,0,0,0,0,0,0,0,'Raid Boss Wisper'),
(10005,6,10,30836,65000,0,0,0,0,0,0,0,6831.23,3817.08,621.153,4.18879,'Summon Image of Vardmadra'),
(10005,6,15,57885,1,0,0,0,0,0,0,0,0,0,0,0,'Through the Eye: Summon Image of a Shadow Cultist'),
(10005,7,20,2,30835,50,0,0,0,0,0,0,0,0,0,0,'Cultist go to Image of Vardmadra'),
(10005,15,28,8,30835,50,0,0,0,0,0,0,0,0,0,0,'Image of a Shadow Cultist Stand_State_Kneel'),
(10005,16,0,0,30835,50,0,0,2000000622,0,0,0,0,0,0,0,'Image of a Shadow Cultist say 1'),
(10005,18,0,0,30836,50,0,0,2000000623,0,0,0,0,0,0,0,'Image of Vardmadra say 1'),
(10005,19,0,0,30835,50,0,0,2000000624,0,0,0,0,0,0,0,'Image of a Shadow Cultist say 2'),
(10005,27,0,2,30835,50,0,0,2000000621,0,0,0,0,0,0,0,'emote Image of a Shadow Cultist'),
(10005,27,0,0,30836,50,0,0,2000000625,0,0,0,0,0,0,0,'Image of Vardmadra say 2'),
(10005,30,0,0,30835,50,0,0,2000000626,0,0,0,0,0,0,0,'Image of a Shadow Cultist say 3'),
(10005,36,0,0,30836,50,0,0,2000000627,0,0,0,0,0,0,0,'Image of Vardmadra say 3'),
(10005,41,0,0,30835,50,0,0,2000000628,0,0,0,0,0,0,0,'Image of a Shadow Cultist say 4'),
(10005,45,0,0,30836,50,0,0,2000000629,0,0,0,0,0,0,0,'Image of Vardmadra say 4'),
(10005,54,0,0,30836,50,0,0,2000000630,0,0,0,0,0,0,0,'Image of Vardmadra say 5'),
(10005,57,28,0,30835,50,0,0,0,0,0,0,0,0,0,0,'Image of a Shadow Cultist Stand_State_Stand'),
(10005,59,0,0,30835,50,0,0,2000000631,0,0,0,0,0,0,0,'Image of a Shadow Cultist say 5'),
(10005,60,8,30750,1,0,0,0,0,0,0,0,0,0,0,0,'Through the Eye: Kill Credit to Master'),
(10005,71,14,57889,1,0,0,0,0,0,0,0,0,0,0,0,'remove aura Through the Eye:');
REPLACE INTO db_script_string (entry,content_default) VALUES
(2000000620,'Scrying upon many insignificant situations within Icecrown,$B you stumble upon something interesting...'),
(2000000621,'The cultist practically sputters.'),
(2000000622,'My lady.'),
(2000000623,'Report.'),
(2000000624,'There is word from Jotunheim. The sleep-watchers there believe that they have found someone of significance.'),
(2000000625,'Describe this vrykul. What does he look like?'),
(2000000626,'Look like, my lady? A vrykul, I suppose. They did not actually show him to me. Ever since The Shadow Vault....'),
(2000000627,'I am not interested in excuses. Perhaps they gave you a name?'),
(2000000628,'A name? Oh, yes, the name! I believe it was Iskalder.'),
(2000000629,'Iskalder? You fool! Have you no idea who that is? He\'s only the greatest vrykul warrior who ever lived!'),
(2000000630,'Return to Jotunheim and tell them to keep him asleep until I arrive. I will judge this vrykul with my own eyes.'),
(2000000631,'Right away, my lady.');
DELETE FROM creature_movement_template WHERE entry=30835;
INSERT INTO creature_movement_template VALUES 
(30835,1,6829.647,3815.412,621.067,47000,0,0,0,0,0,0,0,0,0,0.6175,0,0),
(30835,2,6816.33,3801.11,621.153,0,1,0,0,0,0,0,0,0,0,0,0,0);
UPDATE creature_template SET minlevel=80, maxlevel=80, minhealth=12600, maxhealth=12600, minmana=7988, maxmana=7988, MovementType=1 WHERE entry=30835;
UPDATE creature_template SET minlevel=80, maxlevel=80, minhealth=12600, maxhealth=12600 WHERE entry=30836;
DELETE FROM gossip_menu_option WHERE menu_id=9690;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(9690,0,0,'I lost my cloth. Can you rip me off another piece?',1,1,-1,0,9690,0,0,'',9,13129,0,0,0,0,0,0,0);
DELETE FROM gossip_scripts WHERE id=9690;
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(9690,0,17,43214,1,0,0,0,0,0,0,0,0,0,0,0,'Create Kurzel\'s Blouse Scrap');
DELETE FROM gossip_scripts WHERE id=6918;
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(6918,0,15,26375,0,0,0,0,0,0,0,0,0,0,0,0,'Create Lunar Festival Invitation');
DELETE FROM creature_movement_template WHERE entry=17318;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(17318,1,-5093.294,-11254.67,0.2400,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,2,-5091.673,-11253.76,0.51914,65000,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,3,-5097.712,-11257.97,0.8819,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,4,-5100.406,-11253.42,0.0595,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,5,-5108.406,-11250.42,-0.4404,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,6,-5115.156,-11248.17,0.0595,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,7,-5118.698,-11250.37,0.4533,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,8,-5120.282,-11250.83,1.1859,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,9,-5122.282,-11250.33,0.6859,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,10,-5126.282,-11249.83,-0.0640,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,11,-5128.282,-11249.58,0.4359,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,12,-5130.282,-11249.33,1.1859,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,13,-5132.032,-11249.08,2.1859,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,14,-5133.032,-11248.83,2.9359,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,15,-5135.032,-11248.83,3.4359,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,16,-5137.032,-11248.58,4.1859,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,17,-5143.782,-11247.58,4.9359,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17318,18,-5146.408,-11246.36,5.2825,0,1,0,0,0,0,0,0,0,0,0,0,0);
DELETE FROM creature_movement_template WHERE entry=17243;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(17243,1,-5063.434,-11256.43,0.9326,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,2,-5078.62,-11254.58,0.5082,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,3,-5081.806,-11253.73,0.5838,60000,0,0,0,0,0,0,0,0,0,3.0200,0,0),
(17243,4,-5081.806,-11253.73,0.5838,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,5,-5067.804,-11258.46,0.5815,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,6,-5064.747,-11259.5,0.5810,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,7,-5064.858,-11261.34,0.2768,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,8,-5060.358,-11265.34,0.7768,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,9,-5050.608,-11273.59,1.0268,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,10,-5047.413,-11274.72,1.4722,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,11,-5046.759,-11276.35,2.3970,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,12,-5045.509,-11277.85,3.1470,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,13,-5044.009,-11279.35,3.8970,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,14,-5042.759,-11280.85,5.1470,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,15,-5041.009,-11283.1,6.6470,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,16,-5039.759,-11284.35,7.3970,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,17,-5033.259,-11292.1,7.8970,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17243,18,-5031.403,-11293.48,8.2005,0,1,0,0,0,0,0,0,0,0,0,0,0);
UPDATE creature_template SET MovementType=2 WHERE entry=17318;
UPDATE creature_template SET MovementType=2 WHERE entry=17243;
UPDATE quest_template SET StartScript=9579 WHERE entry=9579;
DELETE FROM quest_start_scripts WHERE id=9579;
INSERT INTO quest_start_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(9579,0,10,17426, 11000,0,0,0,0,0,0,0,-2089.374,-11298.09,63.54,5.689,'Galaen spawn'),
(9579,2,1,6,17426,5,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotQuestion'),
(9579,2,0,0,17426,5,0,0,2000000632,0,0,0,0,0,0,0,'Say 1'),
(9579,4,1,274,17426,5,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotNo'),
(9579,4,0,0,17426,5,0,0,2000000633,0,0,0,0,0,0,0,'say 2'),
(9579,8,1,1,17426,5,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(9579,8,0,0,17426,5,0,0,2000000634,0,0,0,0,0,0,0,'say 3');
REPLACE INTO db_script_string (entry,content_default) VALUES
(2000000632,'Morae... Is that you?'),
(2000000633,'No... you\'re not Morae, but I sense that you have met. When you see her, tell her that I survived the crash, only to be done in by the infiltrators.'),
(2000000634,'Let her know... my last thought was of her...');
DELETE FROM gossip_menu_option WHERE menu_id=8716 AND id=0;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(8716,0,1,'Let me browse your goods.',3,128,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
DELETE FROM gossip_menu_option WHERE menu_id=8717 AND id=0;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(8717,0,1,'Let me browse your goods.',3,128,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
DELETE FROM gossip_menu_option WHERE menu_id=8726 AND id=0;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(8726,0,1,'Jho\'nass, let me see what you have to offer.',3,128,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
DELETE FROM gossip_menu_option WHERE menu_id=8754;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(8754,0,1,'I\'m interested in purchasing a new drake.',3,128,0,0,0,0,0,'',5,1015,7,0,0,0,0,0,0);
DELETE FROM gossip_menu_option WHERE menu_id=8513;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES 
(8513,1,0,'Spiritcaller, I need more spirit calling totems.',1,1,-1,0,8513,0,0,'',24,31663,1,9,10853,0,0,0,0);
DELETE FROM gossip_scripts WHERE id in (8513,22312);
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(8513,0,17,31663,1,0,0,0,0,0,0,0,0,0,0,0,'create item Spirit Calling Totems');
DELETE FROM gossip_menu_option WHERE menu_id=7999;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES 
(7999,0,0,'Grek, will you try out this new weapon oil Rakoria made?',1,1,-1,0,7999,0,0,'',9,10201,0,0,0,0,0,0,0);
DELETE FROM gossip_scripts WHERE id=7999;
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(7999,0,0,0,19606,10,0,0,2000000635,0,0,0,0,0,0,0,'Grek say 1'),
(7999,5,1,15,19606,10,0,0,0,0,0,0,0,0,0,0,'Grek emote OneShotRoar'),
(7999,6,0,0,19606,10,0,0,2000000636,0,0,0,0,0,0,0,'Grek say 2'),
(7999,6,8,19606,1,0,0,0,0,0,0,0,0,0,0,0,'killcredit for quest 10201');
REPLACE INTO db_script_string (entry,content_default) VALUES
(2000000635,'Grek try!'),
(2000000636,'This oil no good for Grek! What Grek look like to you, some weakling in robes?');
UPDATE gossip_menu_option SET action_menu_id=-1, action_script_id=7426, cond_1=9, cond_1_val_1=9537 WHERE menu_id=7426 AND id=0;
DELETE FROM gossip_scripts WHERE id=7426;
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(7426,3,1,11,17243,50,0,0,0,0,0,0,0,0,0,0,'emote OneShotLaugh'),
(7426,3,0,2,17243,50,0,0,2000000637,0,0,0,0,0,0,0,'text emote'),
(7426,5,1,6,17243,50,0,0,0,0,0,0,0,0,0,0,'emote OneShotQuestion'),
(7426,5,0,0,17243,50,7,0,2000000638,0,0,0,0,0,0,0,'say 1'),
(7426,11,1,1,17243,50,0,0,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(7426,11,0,0,17243,50,7,0,2000000639,0,0,0,0,0,0,0,'say 2'),
(7426,14,1,25,17243,50,0,0,0,0,0,0,0,0,0,0,'emote OneShotPoint'),
(7426,14,0,0,17243,50,7,0,2000000640,0,0,0,0,0,0,0,'say 3'),
(7426,17,0,0,17243,50,7,0,2000000641,0,0,0,0,0,0,0,'say 4'),
(7426,17,22,14,17243,50,0,0x01,0,0,0,0,0,0,0,0,'change faction'),
(7426,18,26,0,17243,50,0,0,0,0,0,0,0,0,0,0,'start attack');
REPLACE INTO db_script_string (entry,content_default) VALUES
(2000000637,'%s laughs.'),
(2000000638,'Does it frighten you to know that there are those that would serve the Legion with such devotion as to remain unwavering citizens of your pointless civilizations until called upon?'),
(2000000639,'Live in fear, die by the will of Kael\'thas... It\'s all the same.'),
(2000000640,'And now, I cut you!'),
(2000000641,'DIE!');
DELETE FROM event_scripts WHERE id=10675;
INSERT INTO event_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(10675,0,10,17318,100000,0,0,0,0,0,0,0,-5116.128,-11263.03,0.961,0,'Summon Geezle'),
(10675,0,10,17243,100000,0,0,0,0,0,0,0,-5040.419,-11260.58,13.647,0,'Summon Engineer "Spark" Overgrind'),
(10675,1,29,1,17243,200,0,0x02,0,0,0,0,0,0,0,0,'remove npc_flag'),
(10675,20,0,2,17243,50,0,0,2000000642,0,0,0,0,0,0,0,'text_emote Spark'),
(10675,21,0,0,17318,50,0,0,2000000114,0,0,0,0,0,0,0,'Geezle say 1'),
(10675,21,1,1,17318,50,0,0,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(10675,26,1,5,17243,50,0,0,0,0,0,0,0,0,0,0,'emote OneShotExclamation'),
(10675,26,0,0,17243,50,0,0,2000000123,0,0,0,0,0,0,0,'Spark say 1'),
(10675,28,1,1,17243,50,0,0,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(10675,23,1,1,17243,50,0,0,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(10675,33,0,0,17243,50,0,0,2000000248,0,0,0,0,0,0,0,'Spark say 2'),
(10675,44,1,1,17318,50,0,0,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(10675,44,0,0,17318,50,0,0,2000000115,0,0,0,0,0,0,0,'Geezle say 2'),
(10675,50,1,1,17243,50,0,0,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(10675,50,0,0,17243,50,0,0,2000000292,0,0,0,0,0,0,0,'Spark say 3'),
(10675,53,1,5,17243,50,0,0,0,0,0,0,0,0,0,0,'emote OneShotExclamation'),
(10675,57,1,1,17243,50,0,0,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(10675,57,0,0,17243,50,0,0,2000000293,0,0,0,0,0,0,0,'Spark say 4'),
(10675,60,1,25,17243,50,0,0,0,0,0,0,0,0,0,0,'emote OneShotPoint'),
(10675,65,1,1,17318,50,0,0,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(10675,65,0,0,17318,50,0,0,2000000122,0,0,0,0,0,0,0,'Geezle say 2'),
(10675,65,8,17243,1,0,0,0,0,0,0,0,0,0,0,0,'Kill Credit for quest 9531');
REPLACE INTO db_script_string (entry,content_default) VALUES (2000000642,'%s picks up the naga flag.');
UPDATE quest_template SET NextQuestInChain=13037 WHERE entry=13034;
DELETE FROM quest_end_scripts WHERE id=13034;
INSERT INTO quest_end_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(13034,0,1,6,30381,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotQuestion'),
(13034,0,0,0,30381,10,0,0x02,2000001042,0,0,0,0,0,0,0,'say 1'),
(13034,8,1,1,30381,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(13034,8,0,0,30381,10,0,0x02,2000001043,0,0,0,0,0,0,0,'say 2'),
(13034,14,1,274,30381,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotNo'),
(13034,14,0,0,30381,10,0,0x02,2000001044,0,0,0,0,0,0,0,'say 3'),
(13034,21,1,25,30381,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotPoint'),
(13034,21,0,0,30381,10,0,0x02,2000001045,0,0,0,0,0,0,0,'say 4'),
(13034,25,1,1,30381,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(13034,25,0,0,30381,10,0,0x02,2000001046,0,0,0,0,0,0,0,'say 5');
UPDATE `db_script_string` SET `content_default`='The Lorehammer...' WHERE `entry`=2000001045;
UPDATE `db_script_string` SET `content_default`='This isn\'t right at all, $N. In the tale Wind Tamer Barah told me, Stormhoof was a hero, not a villain.' WHERE `entry`=2000001042;
UPDATE `db_script_string` SET `content_default`='The North Wind is the ancient enemy of the taunka, a ruler among the elements, and the very force which bleeds the life from these ancient people.' WHERE `entry`=2000001043;
UPDATE `db_script_string` SET `content_default`='They would rather die than bow before the North Wind. Something is amiss here.' WHERE `entry`=2000001044;
UPDATE `db_script_string` SET `content_default`='It confirms our suspicions. The threads of time have been severed and rewoven in the wrong pattern. But, how?' WHERE `entry`=2000001046;
DELETE FROM event_scripts WHERE id=15939;
INSERT INTO event_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES
(15939,0,10,24381,30000,0,0,0x01,0,0,0,0,2406.41,-5739.39,274.034,1.19678,'Image of Megalith spawn'),
(15939,0,10,24385,30000,0,0,0x01,0,0,0,0,2416.132,-5736.042,273.17,3.417,'Image of Stone Giant spawn'),
(15939,0,10,24385,30000,0,0,0x01,0,0,0,0,2404.33,-5724.32,269.855,4.8266,'Image of Stone Giant spawn'),
(15939,0,10,24385,30000,0,0,0x01,0,0,0,0,2409.06,-5726.67,270.832,4.5098,'Image of Stone Giant spawn'),
(15939,0,10,24385,30000,0,0,0x01,0,0,0,0,2413.187,-5731.13,271.952,4.10142,'Image of Stone Giant spawn'),
(15939,5,1,61,24381,20,0,0x01,0,0,0,0,0,0,0,0,'Image of Megalith play emote'),
(15939,5,0,0,24381,20,0,0x02,2000000348,0,0,0,0,0,0,0,'Image of Megalith say 1'),
(15939,10,1,61,24381,20,0,0x01,0,0,0,0,0,0,0,0,'Image of Megalith play emote'),
(15939,10,0,0,24381,20,0,0x02,2000000349,0,0,0,0,0,0,0,'Image of Megalith say 2'),
(15939,16,1,35,24381,20,0,0x01,0,0,0,0,0,0,0,0,'Image of Megalith play emote'),
(15939,16,0,0,24381,20,0,0x02,2000000350,0,0,0,0,0,0,0,'Image of Megalith say 3'),
(15939,21,15,43693,1,0,0,0,0,0,0,0,0,0,0,0,'Image of Megalith Kill Credit'),
(15939,21,1,35,24381,20,0,0x01,0,0,0,0,0,0,0,0,'Image of Megalith play emote'),
(15939,21,0,0,24381,20,0,0x02,2000000643,0,0,0,0,0,0,0,'Image of Megalith say 4');
REPLACE INTO db_script_string (entry,content_default) VALUES 
(2000000348,'Arise from the earth, my brothers!'),
(2000000349,'Our iron masters have a mission for us!'),
(2000000350,'Follow me into the mountains to carry out the plan of the masters!'),
(2000000643,'We will not fail!');
UPDATE creature_template SET InhabitType=1 WHERE entry=24035;
UPDATE `creature_template` SET `unit_flags` = 32768 WHERE `entry` = 29747;
UPDATE `creature_template` SET `unit_flags` = 32768 WHERE `entry` = 29790;
UPDATE creature_template SET unit_flags=unit_flags|33554432 WHERE entry IN (18374, 20308);
UPDATE creature_template SET MovementType = 0 WHERE entry IN (13716, 12238, 10268);
UPDATE creature SET position_x='-9719.611', position_y='1514.752', position_z='27.55229', orientation='0.7679449' WHERE id = 15369;
UPDATE creature_template SET MovementType = 0 WHERE entry IN (18757,18759);
UPDATE creature_template SET MovementType=0 WHERE entry in (598,636,4416);
UPDATE gameobject SET spawntimesecs=86400 WHERE map=36 AND id=75293;
DELETE FROM creature_involvedrelation WHERE quest IN (1132,1133,1135);
DELETE FROM creature_questrelation WHERE quest IN (1132,1133,1135); 
UPDATE quest_template SET OfferRewardText='You\'ve done it! Praise be to Elune and whichever powers you worship, $N. You have done an honorable and noble thing this day. I am certain Arko\'narin will be pleased that you not only took the time to save her, but to also slay the creature who tortured one of her best friends.$b$bI wish I could do more for you, but please, take this.' WHERE entry=5385;
UPDATE quest_template SET RequestItemsText='The Stormpike Brigade cannot charge into battle bareback! We require harnesses for our mounts, after all, we are not savages.$B$BWhile we could easily slay the rams that roam near our base for the leather required to fashion a harness, doing so would be idiotic. We need those rams for mounts.$B$BYou must strike at our enemy\'s base, slaying the frostwolves they use as mounts and taking their hides. Return their hides to me so that harnesses may be made for the cavalry. Go!' WHERE entry=7026;
UPDATE quest_template SET RequestItemsText= 'While some of our soldiers are busy capturing wolves for the stable master, others must provide for the simple necessities that riding requires. I am speaking of riding harnesses, of course.$B$BYou must strike at the indigenous rams of the region. The very same rams that the Stormpike cavalry uses as mounts!$B$BSlay them and return to me with their hides. Once we have gathered enough hides, we will fashion harnesses for the riders. The Frostwolf Wolf Riders will ride once more!' WHERE entry=7002;
UPDATE quest_template SET RequestItemsText='Finally, you\'ve arrived... and discretely also. Good.$b$bOur world is full of fools, $n. Even the mighty Thrall has greater flaws than most can see. He turns his back on the power needed to make this land ours completely! We\'re not the same people who were manipulated and used by creatures from the Nether. We are our own people. We are proud... and we are strong.' WHERE entry=3090;
UPDATE quest_template SET OfferRewardText='And now you\'ve joined our ranks also. Don\'t misunderstand, $n. Just because you have access to power that many will be jealous of, it does not mean you will be accepted easily. Thrall allows our kind into Orgrimmar because we are still his fellow kin--he cannot turn his back on us, or we would become as pathetic as the humans who enslaved him. My point is: be careful. You can be powerful, but if you are foolish, then you are as good dead.$b$bIf you need training in spells then return to me.' WHERE entry=3090;
DELETE FROM creature WHERE id = 18533;
DELETE FROM creature WHERE id=17426;
DELETE FROM creature WHERE id=10776;
UPDATE gameobject_template SET flags=flags |2 WHERE entry IN (179549, 179550);
UPDATE creature_model_info SET modelid_other_gender =19419 WHERE modelid =19418;
UPDATE creature_model_info SET modelid_other_gender =19420 WHERE modelid =19419;
DELETE FROM quest_end_scripts WHERE id =963;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(963,1,10,3843,41000,0,0,0,0,0,0,0,6426.84,603.166,9.46655,4.14031,'Anaya - appears'),
(963,4,0,0,0,0,0,0,2000000647,0,0,0,0,0,0,0,''),
(963,4,1,18,0,0,0,0,0,0,0,0,0,0,0,0,''),
(963,9,0,0,3843,10,0,0x02,2000000648,0,0,0,0,0,0,0,''), 
(963,9,1,1,3843,10,0,0,0,0,0,0,0,0,0,0,''),
(963,15,0,0,0,0,0,0,2000000649,0,0,0,0,0,0,0,''),
(963,15,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
(963,20,0,0,0,0,0,0,2000000650,0,0,0,0,0,0,0,''),
(963,20,1,6,0,0,0,0,0,0,0,0,0,0,0,0,''),
(963,25,0,0,3843,10,0,0x02,2000000651,0,0,0,0,0,0,0,''), 
(963,25,1,1,3843,10,0,0,0,0,0,0,0,0,0,0,''),
(963,30,0,0,3843,10,0,0x02,2000000652,0,0,0,0,0,0,0,''), 
(963,30,1,1,3843,10,0,0,0,0,0,0,0,0,0,0,''),
(963,35,0,0,0,0,0,0,2000000653,0,0,0,0,0,0,0,''),
(963,35,1,6,0,0,0,0,0,0,0,0,0,0,0,0,''),
(963,39,0,0,3843,10,0,0x02,2000000654,0,0,0,0,0,0,0,''), 
(963,42,0,2,0,0,0,0,2000000655,0,0,0,0,0,0,0,'Anaya - disappear'),
(963,47,0,0,0,0,0,0,2000000656,0,0,0,0,0,0,0,''),
(963,51,1,18,0,0,0,0,0,0,0,0,0,0,0,0,'');
REPLACE INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES 
(2000000647,'Anaya...? Do my eyes deceive me? Is it really you?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000648,'The ages have been cruel to you and I, my love, but be assured, it is, and at long last we are reunited.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000649,'That the fates should be so cruel as to permit us only this after a thousand years apart...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000650,'Do you hate me, my love? That I was forced to destroy your living form, that your spirit be released from unhappy bondage.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000651,'Let it not trouble your heart, beloved. You have freed me from slavery, and for that I love you all the more.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000652,'Sadly, even this must be cut short... The ties that bind me to this world weaken, and pull me away...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000653,'No! Anaya... Anaya! Don\'t leave me! Please...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000654,'Farewell, Cerellean, until we are joined once again...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000655,'Anaya\'s soft voice trails away into the mists. "Know that I love you always..."',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000656,'How, my love? How will I find the strength to face the ages of the world without you by my side...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
UPDATE quest_template SET CompleteScript =963 WHERE entry =963;
DELETE FROM quest_start_scripts WHERE id =947;
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(947,1,0,0,0,0,2,0,2000000657,0,0,0,0,0,0,0,''),
(947,1,1,2,0,0,0,0,0,0,0,0,0,0,0,0,''),
(947,5,0,0,0,0,2,0,2000000658,0,0,0,0,0,0,0,'');
REPLACE INTO db_script_string (entry,content_default) VALUES
(2000000657,'Thank you, $N. And luck to you.'),
(2000000658,'Cliffspring Falls lies along the mountains to the east and north.');
UPDATE quest_template SET StartScript =947 WHERE entry =947;
DELETE FROM quest_end_scripts WHERE id =5341;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(5341,1,0,1,0,0,0,0,2000000659,0,0,0,0,0,0,0,''),
(5341,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,'');
REPLACE INTO db_script_string (entry, content_default) VALUES
(2000000659,'The deeds are mine, brother! Soon you shall be out of my way for good!');
UPDATE quest_template SET CompleteScript =5341 WHERE entry =5341;
DELETE FROM quest_end_scripts WHERE id =4974;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(4974,1,0,6,0,0,0,0,2000000670,0,0,0,0,0,0,0,''),
(4974,1,1,5,0,0,0,0,0,0,0,0,0,0,0,0,''),
(4974,5,15,16609,0,0,0,0,0,0,0,0,0,0,0,0,''),
(4974,6,0,6,0,0,0,0,2000000671,0,0,0,0,0,0,0,''),
(4974,6,1,1,0,0,0,0,0,0,0,0,0,0,0,0,'');
REPLACE INTO db_script_string (entry,content_default) VALUES
(2000000670,'Honor your heroes! On this day, they have dealt a great blow against one of our most hated enemies! The false Warchief, Rend Blackhand, has fallen! '),
(2000000671,'Be bathed in my power! Drink in my might! Battle for the glory of the Horde!');
UPDATE quest_template SET CompleteScript =4974 WHERE entry =4974;
DELETE FROM quest_start_scripts WHERE id =790;
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(790,1,0,0,0,0,0,0,2000000672,0,0,0,0,0,0,0,'');
REPLACE INTO db_script_string (entry,content_default) VALUES
(2000000672,'Go swiftly $N. My fate is in your hands.');
UPDATE quest_template SET StartScript =790 WHERE entry =790;
DELETE FROM quest_end_scripts WHERE id =670;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(670,1,0,0,0,0,0,0,2000000673,0,0,0,0,0,0,0,'');
REPLACE INTO db_script_string (entry,content_default) VALUES
(2000000673,'Wait, $N!!! It looks like we\'re going to need some help here...');
UPDATE quest_template SET CompleteScript =670 WHERE entry =670;
DELETE FROM quest_end_scripts WHERE id=1117;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(1117,1,0,2,0,0,0,0,2000000674,0,0,0,0,0,0,0,''),
(1117,2,1,94,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1117,7,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1117,8,0,0,0,0,0,0,2000000675,0,0,0,0,0,0,0,'');         
REPLACE INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES 
(2000000674,'%s begins to dance.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000675,'Hahah! $N, you make quite a partner!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
UPDATE quest_template SET CompleteScript =1117 WHERE entry =1117;
DELETE FROM event_scripts WHERE id =313;
INSERT INTO event_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(313,1,0,0,2238,10,0,0x02,2000000676,0,0,0,0,0,0,0,'force 2238 to: say text'),
(313,3,0,0,2238,10,0,0x02,2000000677,0,0,0,0,0,0,0,'force 2238 to: say text');
REPLACE INTO db_script_string VALUES 
(2000000676,'Have you freed Drull yet? I don\'t know where he\'s being held.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000677,'I will only slow you down, but no pink-skinned humans will keep me from freedom!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(6114, 19878, 1, 1, 1, -6232.08, -3855.08, -58.75, 4.04244, 0, 0, 0.900263, -0.435347, -10, 255, 1);
DELETE FROM quest_end_scripts WHERE id=1112;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1112,1,0,2,0,0,0,0,2000000644,0,0,0,0,0,0,0,''),
(1112,2,9,6114,10,0,0,0,0,0,0,0,0,0,0,0,'resp gobject'),
(1112,4,0,2,0,0,0,0,2000000645,0,0,0,0,0,0,0,''),
(1112,8,0,0,0,0,0,0,2000000646,0,0,0,0,0,0,0,'');         
REPLACE INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES 
(2000000644,'%s places the crate of parts on the ground.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000645,'%s grabs a part and puts it in his pocket...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000646,'There, that should do it...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
UPDATE quest_template SET CompleteScript =1112 WHERE entry =1112;
DELETE FROM quest_end_scripts WHERE id =553;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(553,2,10,2433,600000,0,0,0,0,0,0,0,-747.107,-586.97,19.8435,3.17531,'');
UPDATE quest_template SET CompleteScript =553 WHERE entry =553;
UPDATE creature_template SET MovementType=1 WHERE entry =2433;
DELETE FROM quest_end_scripts WHERE id =10210;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(10210,2,0,0,18166,10,0,0x00,2000000678,0,0,0,0,0,0,0,'');
REPLACE INTO db_script_string (entry,content_default) VALUES
(2000000678,'Do not burden A\'dal with mundane questions, $r. This being\'s will is all that keeps our enemies from crushing this city.');
UPDATE quest_template SET CompleteScript =10210 WHERE entry =10210;
DELETE FROM quest_start_scripts WHERE id=10349;
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(10349,1,0,4,19294,50,0,0x00,2000000679,0,0,0,0,0,0,0,'');
REPLACE INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES
(2000000679,'Up here on the hill, $N.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
UPDATE quest_template SET StartScript =10349 WHERE entry =10349;
UPDATE creature SET MovementType =2, spawndist =0 WHERE guid =6219;
DELETE FROM creature_movement WHERE id =6219;
UPDATE creature_template SET MovementType=2 WHERE entry =5042;
DELETE FROM creature_movement_template WHERE entry =5042;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(5042,1,-8759.619141,812.343262,97.635002,0,0,0,0,0,0,0,0,0,0,3.866064,0,0),
(5042,2,-8761.613281,810.578735,97.635002,0,0,0,0,0,0,0,0,0,0,2.078497,0,0),
(5042,3,-8762.094727,811.249756,97.635002,10000,0,0,0,0,0,0,0,0,0,2.087138,0,0),
(5042,4,-8762.094727,811.249756,97.635002,5000,0,0,0,2000000680,2000000681,2000000682,0,0,0,2.087138,0,0),
(5042,5,-8765.120117,809.343445,97.635002,0,0,0,0,0,0,0,0,0,0,2.332182,0,0),
(5042,6,-8768.819336,813.976074,97.635002,0,0,0,0,0,0,0,0,0,0,0.817934,0,0),
(5042,7,-8765.601563,816.681702,97.635002,0,0,0,0,0,0,0,0,0,0,5.020599,0,0),
(5042,8,-8765.492188,816.109558,97.635002,15000,0,0,0,0,0,0,0,0,0,4.902794,0,0),
(5042,9,-8766.139648,815.697876,97.635002,0,0,0,0,0,0,0,0,0,0,3.767895,0,0),
(5042,10,-8762.848633,818.439941,97.635002,0,0,0,0,0,0,0,0,0,0,6.002351,0,0),
(5042,11,-8757.198242,817.106812,97.635002,0,0,0,0,0,0,0,0,0,0,5.241303,0,0),
(5042,12,-8755.508789,815.287170,97.635002,0,0,0,0,0,0,0,0,0,0,5.487926,0,0),
(5042,13,-8755.646484,815.127991,97.635002,15000,0,0,0,0,0,0,0,0,0,4.323179,0,0),
(5042,14,-8755.615234,815.615784,97.635002,0,0,0,0,0,0,0,0,0,0,2.836093,0,0),
(5042,15,-8766.103516,820.150940,97.635002,0,0,0,0,0,0,0,0,0,0,3.842188,0,0),
(5042,16,-8766.365234,820.027039,97.635002,10000,0,0,0,0,0,0,0,0,0,3.583006,0,0),
(5042,17,-8766.365234,820.027039,97.635002,5000,0,0,0,2000000680,2000000681,2000000682,0,0,0,3.583006,0,0);
DELETE FROM creature_addon WHERE guid =6219;
INSERT INTO creature_addon VALUES 
(6219,0,1,1,16,0,0,NULL);
REPLACE INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES 
(2000000680,'Let me help you with those.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000681,'Drink this, it will help.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000682,'You\'re going to be just fine.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM quest_end_scripts WHERE id =10109;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(10109,1,0,0,0,0,0,0,2000000684,0,0,0,0,0,0,0,''),
(10109,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,'');
REPLACE INTO db_script_string (entry,content_default) VALUES
(2000000684,'Oh sweet, delicious, spotted eggs - you will be mine...');
UPDATE quest_template SET CompleteScript =10109 WHERE entry =10109;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(7483, 186425, 1, 1, 1, -2967.28, -3871.99, 33.0624, 2.28237, 0, 0, 0.909128, 0.416517, -120, 255, 1);
DELETE FROM event_scripts WHERE id=15452;
INSERT INTO event_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(15452,2,9,7483,120,0,0,0,0,0,0,0,-2967.28,-3871.99,33.0624,2.28237,''),
(15452,4,20,2,4792,30,0,0,0,0,0,0,0,0,0,0,'4792 - movement chenged to 2:waypoint'); 
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(28803, 4792, 1, 1, 1, 0, 0, -2952.76, -3885.41, 34.3089, 2.28638, 3, 0, 0, 1981, 0, 0, 0);
DELETE FROM creature_movement WHERE id =28803;
UPDATE creature_template SET MovementType=0 WHERE entry =4792;
DELETE FROM creature_movement_template WHERE entry =4792;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(4792,1,-2952.76,-3885.41,34.3089,4000,0,0,0,0,0,0,0,42515,0,2.28638,0,0),
(4792,2,-2952.76,-3885.41,34.3089,2000,0,0,0,0,0,0,0,7,0,2.28638,0,0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(53051, 2175, 1, 1, 1, 0, 0, 6563.79, 302.533, 31.4362, 2.00627, 7200, 0, 0, 205, 0, 0, 2);
DELETE FROM creature_movement WHERE id =53051;
UPDATE creature_template SET MovementType=2 WHERE entry =2175;
DELETE FROM creature_movement_template WHERE entry =2175;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(2175,1,6559.828613,310.876770,31.215986,0,0,0,0,0,0,0,0,0,0,1.451383,0,0),
(2175,2,6561.889160,320.476868,30.921394,0,0,0,0,0,0,0,0,0,0,0.765729,0,0),
(2175,3,6568.238281,327.336151,32.368652,0,0,0,0,0,0,0,0,0,0,1.319435,0,0),
(2175,4,6570.533691,339.091400,32.307487,0,0,0,0,0,0,0,0,0,0,1.698782,0,0),
(2175,5,6572.156250,353.609955,31.284197,0,0,0,0,0,0,0,0,0,0,0.936945,0,0),
(2175,6,6593.719727,383.150604,31.572701,0,0,0,0,0,0,0,0,0,0,1.146664,0,0),
(2175,7,6599.039551,396.586975,30.727522,0,0,0,0,0,0,0,0,0,0,1.433335,0,0),
(2175,8,6602.390137,418.766083,31.165703,0,0,0,0,0,0,0,0,0,0,0.900834,0,0),
(2175,9,6606.318848,423.509644,31.157431,0,0,0,0,0,0,0,0,0,0,0.221465,0,0),
(2175,10,6616.116211,424.974945,31.000898,0,0,0,0,0,0,0,0,0,0,5.922670,0,0),
(2175,11,6636.376953,419.026703,29.010912,0,0,0,0,0,0,0,0,0,0,5.777377,0,0),
(2175,12,6657.032715,409.434296,26.556162,0,0,0,0,0,0,0,0,0,0,0.193979,0,0),
(2175,13,6675.918945,410.257019,25.547438,0,0,0,0,0,0,0,0,0,0,6.140223,0,0),
(2175,14,6695.203125,404.067078,24.828104,0,0,0,0,0,0,0,0,0,0,4.506602,0,0),
(2175,15,6695.883301,373.393646,25.136600,0,0,0,0,0,0,0,0,0,0,4.440632,0,0),
(2175,16,6689.889648,349.379028,26.400373,0,0,0,0,0,0,0,0,0,0,4.618919,0,0),
(2175,17,6691.195313,323.849304,28.159472,0,0,0,0,0,0,0,0,0,0,4.540374,0,0),
(2175,18,6681.623047,314.013672,29.669083,0,0,0,0,0,0,0,0,0,0,4.380942,0,0),
(2175,19,6667.468262,275.654816,30.267225,0,0,0,0,0,0,0,0,0,0,4.697455,0,0),
(2175,20,6668.593750,247.849518,28.504326,0,0,0,0,0,0,0,0,0,0,5.117630,0,0),
(2175,21,6676.170410,231.132706,27.711407,0,0,0,0,0,0,0,0,0,0,5.969774,0,0),
(2175,22,6689.022949,231.703094,27.766466,0,0,0,0,0,0,0,0,0,0,0.326684,0,0),
(2175,23,6702.458984,241.172089,26.806551,0,0,0,0,0,0,0,0,0,0,6.174771,0,0),
(2175,24,6726.355469,239.691452,25.160912,0,0,0,0,0,0,0,0,0,0,0.661007,0,0),
(2175,25,6753.208496,267.495026,21.477236,0,0,0,0,0,0,0,0,0,0,1.411063,0,0),
(2175,26,6756.228516,281.506897,21.428823,0,0,0,0,0,0,0,0,0,0,1.065487,0,0),
(2175,27,6764.580566,292.463043,22.999851,0,0,0,0,0,0,0,0,0,0,0.520421,0,0),
(2175,28,6787.861328,305.656586,22.122314,0,0,0,0,0,0,0,0,0,0,0.614668,0,0),
(2175,29,6806.000488,323.796661,19.734020,0,0,0,0,0,0,0,0,0,0,1.327810,0,0),
(2175,30,6804.635742,336.962769,20.646959,0,0,0,0,0,0,0,0,0,0,1.889370,0,0),
(2175,31,6793.736328,364.936554,21.682915,0,0,0,0,0,0,0,0,0,0,1.997291,0,0),
(2175,32,6782.484375,380.526764,23.072964,0,0,0,0,0,0,0,0,0,0,2.540001,0,0),
(2175,33,6766.454102,391.010406,23.814056,0,0,0,0,0,0,0,0,0,0,3.014382,0,0),
(2175,34,6737.812988,392.672638,23.280460,0,0,0,0,0,0,0,0,0,0,3.874393,0,0),
(2175,35,6727.025879,379.069153,25.304657,0,0,0,0,0,0,0,0,0,0,4.265522,0,0),
(2175,36,6723.543945,370.312500,25.086088,0,0,0,0,0,0,0,0,0,0,4.497210,0,0),
(2175,37,6721.027832,359.625397,24.618927,0,0,0,0,0,0,0,0,0,0,2.091535,0,0),
(2175,38,6709.465332,368.083221,25.166035,0,0,0,0,0,0,0,0,0,0,2.746561,0,0),
(2175,39,6694.074219,370.499786,25.060530,0,0,0,0,0,0,0,0,0,0,3.572800,0,0),
(2175,40,6680.048828,363.218506,22.939146,0,0,0,0,0,0,0,0,0,0,3.850831,0,0),
(2175,41,6659.834961,340.230530,27.431948,0,0,0,0,0,0,0,0,0,0,3.035587,0,0),
(2175,42,6635.553223,340.877594,27.819754,0,0,0,0,0,0,0,0,0,0,2.847817,0,0),
(2175,43,6616.479492,342.005737,28.615425,0,0,0,0,0,0,0,0,0,0,4.040717,0,0),
(2175,44,6600.464355,319.145264,28.771915,0,0,0,0,0,0,0,0,0,0,3.789390,0,0),
(2175,45,6587.536621,309.326050,29.084263,0,0,0,0,0,0,0,0,0,0,3.435963,0,0),
(2175,46,6574.889160,303.877075,30.995256,0,0,0,0,0,0,0,0,0,0,3.853795,0,0),
(2175,47,6566.875977,300.239319,31.333450,0,0,0,0,0,0,0,0,0,0,2.642709,0,0);
UPDATE creature_template SET modelid_1 =5561, MovementType =2 WHERE entry =2624;
DELETE FROM creature_movement_template WHERE entry =2624;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(2624,1,-12171.821289,627.650208,-58.610931,300000,0,0,0,0,0,0,0,0,0,5.132788,0,0),
(2624,2,-12171.821289,627.650208,-58.610931,300000,0,0,0,0,0,0,0,0,0,5.132788,0,0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(91201, 2541, 0, 1, 1, 0, 730, -13808.2, 379.781, 94.5829, 2.12071, 21600, 0, 0, 1848, 0, 0, 2);
DELETE FROM creature_movement WHERE id =91201;
UPDATE creature_template SET MovementType=2 WHERE entry =2541;
DELETE FROM creature_movement_template WHERE entry =2541;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(2541,1,-13807.7,379.781,94.488,60000,0,0,0,0,0,0,0,0,0,5.28713,0,0),
(2541,2,-13809.358398,381.717133,94.676376,0,0,0,0,0,0,0,0,0,0,2.141616,0,0),
(2541,3,-13814.273438,389.437561,89.216988,0,0,0,0,0,0,0,0,0,0,2.137688,0,0),
(2541,4,-13818.897461,396.468140,86.558105,0,0,0,0,0,0,0,0,0,0,2.180885,0,0),
(2541,5,-13823.467773,402.931122,85.740700,0,0,0,0,0,0,0,0,0,0,2.161250,0,0),
(2541,6,-13827.564453,409.323181,86.239975,0,0,0,0,0,0,0,0,0,0,2.098418,0,0),
(2541,7,-13832.723633,417.115356,88.738747,0,0,0,0,0,0,0,0,0,0,2.141615,0,0),
(2541,8,-13836.623047,423.109894,92.147766,0,0,0,0,0,0,0,0,0,0,2.141615,0,0),
(2541,9,-13837.980469,425.191101,91.692436,30000,0,0,0,0,0,0,0,0,0,2.141613,0,0),
(2541,10,-13836.735352,423.379791,92.045624,0,0,0,0,0,0,0,0,0,0,5.314620,0,0),
(2541,11,-13832.362305,416.563904,88.512192,0,0,0,0,0,0,0,0,0,0,5.287132,0,0),
(2541,12,-13827.254883,408.333832,86.061050,0,0,0,0,0,0,0,0,0,0,5.279277,0,0),
(2541,13,-13822.513672,401.615967,85.810425,0,0,0,0,0,0,0,0,0,0,5.259645,0,0),
(2541,14,-13817.540039,393.823364,87.325035,0,0,0,0,0,0,0,0,0,0,5.283206,0,0),
(2541,15,-13813.183594,387.202240,90.234016,0,0,0,0,0,0,0,0,0,0,5.298913,0,0),
(2541,16,-13809.500000,381.667023,94.651039,0,0,0,0,0,0,0,0,0,0,5.298913,0,0),
(2541,17,-13807.7,379.781,94.488,60000,0,0,0,0,0,0,0,0,0,5.28713,0,0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(12723, 2428, 0, 1, 1, 0, 0, -465.482, -1476.91, 90.1814, 5.11627, 300, 0, 0, 664, 0, 0, 2);
DELETE FROM creature_movement WHERE id =12723;
UPDATE creature_template SET MovementType=2 WHERE entry =2428;
DELETE FROM creature_movement_template WHERE entry =2428;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(2428,1,-465.079193,-1483.147217,91.367836,0,0,0,0,0,0,0,0,0,0,4.373711,0,0),
(2428,2,-467.233398,-1486.831177,90.525681,0,0,0,0,0,0,0,0,0,0,4.714181,0,0),
(2428,3,-464.421356,-1495.301392,91.425011,0,0,0,0,0,0,0,0,0,0,5.286733,0,0),
(2428,4,-454.225372,-1500.158081,91.866760,0,0,0,0,0,0,0,0,0,0,6.076842,0,0),
(2428,5,-446.071136,-1499.209717,91.990479,0,0,0,0,0,0,0,0,0,0,0.397625,0,0),
(2428,6,-442.775818,-1497.457520,91.979225,0,0,0,0,0,0,0,0,0,0,0.780115,0,0),
(2428,7,-440.181763,-1493.508301,92.142456,0,0,0,0,0,0,0,0,0,0,0.720424,0,0),
(2428,8,-436.128601,-1488.059204,92.779976,0,0,0,0,0,0,0,0,0,0,0.663876,0,0),
(2428,9,-434.729065,-1487.673096,92.807098,10000,0,0,0,0,0,0,0,0,0,5.918977,0,0),
(2428,10,-432.721558,-1478.002197,91.411346,0,0,0,0,0,0,0,0,0,0,2.143568,0,0),
(2428,11,-438.388916,-1473.162842,92.399216,0,0,0,0,0,0,0,0,0,0,2.962739,0,0),
(2428,12,-446.334808,-1473.437378,93.033279,0,0,0,0,0,0,0,0,0,0,2.932894,0,0),
(2428,13,-448.836823,-1472.795898,92.995796,0,0,0,0,0,0,0,0,0,0,2.698060,0,0),
(2428,14,-455.776337,-1468.620117,90.647476,0,0,0,0,0,0,0,0,0,0,3.008293,0,0),
(2428,15,-466.100525,-1470.405884,89.059067,0,0,0,0,0,0,0,0,0,0,4.296347,0,0),
(2428,16,-466.278809,-1476.681030,90.047028,0,0,0,0,0,0,0,0,0,0,4.572017,0,0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(125166, 23843, 1, 1, 1, 0, 0, -2948.36, -3893.17, 35.0324, 2.46798, 360, 0, 0, 1321, 1381, 0, 2),
(16024, 5661, 0, 1, 1, 0, 0, 1739.17, 385.329, -62.208, 3.9619, 300, 0, 0, 484, 0, 0, 2),
(15925, 5662, 0, 1, 1, 0, 0, 1684.96, 417.041, -62.2979, 0.069381, 300, 0, 0, 1753, 0, 0, 2),
(59407, 19264, 530, 1, 1, 0, 0, -229.017, 3096.15, -61.7425, 0.670469, 300, 0, 0, 22108, 0, 0, 2),
(83051, 19569, 530, 1, 1, 0, 0, 3389.06, 4296.1, 120.867, 0.680678, 300, 0, 0, 8832, 0, 0, 2),
(81127, 19635, 530, 1, 1, 0, 0, 3024.03, 3964.66, 156.178, 1.35076, 300, 0, 0, 6542, 0, 0, 2),
(60911, 21117, 530, 1, 1, 0, 0, 2313.01, 6004.88, 142.826, 4.67748, 300, 0, 0, 4892, 2846, 0, 2);
DELETE FROM creature_movement WHERE id =15925;
UPDATE creature_template SET MovementType=2 WHERE entry =5662;
DELETE FROM creature_movement_template WHERE entry =5662;
INSERT INTO creature_movement_template(entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2)  VALUES
(5662,1,1695.428955,418.495880,-62.302494,0,0,0,0,0,0,0,0,0,0,0.382597,0,0),
(5662,2,1705.885986,423.176483,-62.363857,0,0,0,0,0,0,0,0,0,0,0.615860,0,0),
(5662,3,1699.295166,419.844879,-62.326771,0,0,0,0,0,0,0,0,0,0,3.598803,0,0),
(5662,4,1699.295166,419.844879,-62.326771,9000,566201,0,0,0,0,0,0,0,0,1.817519,0,0),
(5662,5,1684.588135,417.201996,-62.299622,0,0,0,0,0,0,0,0,0,0,3.276789,0,0),
(5662,6,1695.428955,418.495880,-62.302494,0,0,0,0,0,0,0,0,0,0,0.382597,0,0),
(5662,7,1705.885986,423.176483,-62.363857,0,0,0,0,0,0,0,0,0,0,0.615860,0,0),
(5662,8,1695.695190,418.917114,-62.306961,0,0,0,0,0,0,0,0,0,0,3.541467,0,0),
(5662,9,1684.064697,417.013062,-62.299198,0,0,0,0,0,0,0,0,0,0,3.077297,0,0),
(5662,10,1694.521362,418.849396,-62.299263,0,0,0,0,0,0,0,0,0,0,0.439145,0,0),
(5662,11,1706.859131,423.499146,-62.368931,0,0,0,0,0,0,0,0,0,0,0.705394,0,0),
(5662,12,1695.695190,418.917114,-62.306961,0,0,0,0,0,0,0,0,0,0,3.541467,0,0),
(5662,13,1684.064697,417.013062,-62.299198,0,0,0,0,0,0,0,0,0,0,3.077297,0,0),
(5662,14,1689.675049,418.061279,-62.299198,0,0,0,0,0,0,0,0,0,0,0.413227,0,0),
(5662,15,1689.675049,418.061279,-62.299198,9000,566201,0,0,0,0,0,0,0,0,1.984023,0,0),
(5662,16,1684.501953,417.680359,-62.299198,0,0,0,0,0,0,0,0,0,0,3.374179,0,0),
(5662,17,1695.428955,418.495880,-62.302494,0,0,0,0,0,0,0,0,0,0,0.382597,0,0),
(5662,18,1705.885986,423.176483,-62.363857,0,0,0,0,0,0,0,0,0,0,0.615860,0,0),
(5662,19,1695.695190,418.917114,-62.306961,0,0,0,0,0,0,0,0,0,0,3.541467,0,0),
(5662,20,1684.064697,417.013062,-62.299198,0,0,0,0,0,0,0,0,0,0,3.077297,0,0),
(5662,21,1695.428955,418.495880,-62.302494,0,0,0,0,0,0,0,0,0,0,0.382597,0,0),
(5662,22,1705.885986,423.176483,-62.363857,0,0,0,0,0,0,0,0,0,0,0.615860,0,0),
(5662,23,1695.695190,418.917114,-62.306961,0,0,0,0,0,0,0,0,0,0,3.541467,0,0),
(5662,24,1684.064697,417.013062,-62.299198,0,0,0,0,0,0,0,0,0,0,3.077297,0,0);
REPLACE INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES 
(2000000685,'Can you see yourselves? That is the most pathetic excuse for sword slinging I\'ve ever seen!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000686,'You\'re dead, not buried. Now show me your best!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000687,'Alright you sorry sacks of bones. Let\'s see what you\'ve got. Strike your opponent, and don\'t stop till I say so.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM creature_movement_scripts WHERE id =566201;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(566201,1,0,0,0,0,33,0,2000000685,2000000686,0,0,0,0,0,0,''),
(566201,1,1,25,0,0,0,0,0,0,0,0,0,0,0,0,''),
(566201,6,0,0,0,0,33,0,2000000687,0,0,0,0,0,0,0,''),
(566201,6,1,1,0,0,0,0,0,0,0,0,0,0,0,0,'');
DELETE FROM creature_movement WHERE id =81127;
UPDATE creature_template SET MovementType=2 WHERE entry =19635;
DELETE FROM creature_movement_template WHERE entry =19635;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(19635,1,3023.668701,3970.790283,156.792496,5000,0,0,0,0,0,0,0,0,0,1.544344,0,0),
(19635,2,3023.276367,3963.297852,155.981323,0,0,0,0,0,0,0,0,0,0,4.839086,0,0),
(19635,3,3020.386963,3962.136963,155.980499,10000,1963501,0,0,0,0,0,0,0,0,2.997329,0,0),
(19635,4,3022.087646,3954.899414,155.299423,0,0,0,0,0,0,0,0,0,0,5.145391,0,0),
(19635,5,3024.165771,3951.851807,155.078247,0,0,0,0,0,0,0,0,0,0,5.671606,0,0),
(19635,6,3029.484619,3949.131592,154.962784,0,0,0,0,0,0,0,0,0,0,5.534946,0,0),
(19635,7,3031.932617,3946.068115,154.881149,0,0,0,0,0,0,0,0,0,0,3.291849,0,0),
(19635,8,3026.801025,3944.633057,155.083755,10000,1963501,0,0,0,0,0,0,0,0,3.244727,0,0),
(19635,9,3036.321045,3941.581055,154.661682,5000,0,0,0,0,0,0,0,0,0,5.310323,0,0),
(19635,10,3028.683350,3949.196045,154.971436,0,0,0,0,0,0,0,0,0,0,2.797050,0,0),
(19635,11,3023.388916,3951.223389,155.062622,0,0,0,0,0,0,0,0,0,0,2.365866,0,0),
(19635,12,3021.252441,3956.728760,155.462265,0,0,0,0,0,0,0,0,0,0,1.246674,0,0),
(19635,13,3023.433594,3962.784668,155.922806,0,0,0,0,0,0,0,0,0,0,3.509407,0,0),
(19635,14,3019.621094,3962.043701,155.999985,10000,1963501,0,0,0,0,0,0,0,0,3.179540,0,0),
(19635,15,3023.862793,3964.391846,156.071335,0,0,0,0,0,0,0,0,0,0,1.724197,0,0);
DELETE FROM creature_movement_scripts WHERE id =1963501;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(1963501,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1963501,4,1,1,18853,5,0,0x01,0,0,0,0,0,0,0,0,'');
DELETE FROM creature_movement WHERE id =83051;
UPDATE creature_template SET MovementType=2 WHERE entry =19569;
DELETE FROM creature_movement_template WHERE entry =19569;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(19569,1,3389.060059,4296.100098,120.848160,45000,1956901,0,0,0,0,0,0,0,0,0.744240,0,0),
(19569,2,3381.905762,4300.326172,120.184814,0,0,0,0,0,0,0,0,0,0,1.697713,0,0),
(19569,3,3379.541992,4317.499023,121.136162,0,0,0,0,0,0,0,0,0,0,1.729914,0,0),
(19569,4,3379.257813,4319.730469,122.639893,0,0,0,0,0,0,0,0,0,0,1.667083,0,0),
(19569,5,3378.786865,4328.068848,122.639893,0,0,0,0,0,0,0,0,0,0,1.348211,0,0),
(19569,6,3380.937988,4335.489258,122.639893,0,0,0,0,0,0,0,0,0,0,0.569881,0,0),
(19569,7,3386.134766,4336.301270,122.639893,45000,1956902,0,0,0,0,0,0,0,0,0.159118,0,0),
(19569,8,3374.047119,4341.089844,122.683640,0,0,0,0,0,0,0,0,0,0,2.789416,0,0),
(19569,9,3371.338379,4343.159668,122.711769,0,0,0,0,0,0,0,0,0,0,3.209072,0,0),
(19569,10,3367.229980,4343.403809,122.719383,0,0,0,0,0,0,0,0,0,0,3.736861,0,0),
(19569,11,3363.592041,4340.945313,122.696693,45000,1956903,0,0,0,0,0,0,0,0,3.817756,0,0),
(19569,12,3367.613037,4344.059082,122.726578,0,0,0,0,0,0,0,0,0,0,1.085357,0,0),
(19569,13,3374.608398,4356.839844,123.633865,0,0,0,0,0,0,0,0,0,0,0.224561,0,0),
(19569,14,3379.820557,4357.930176,123.630714,45000,1956903,0,0,0,0,0,0,0,0,0.200999,0,0),
(19569,15,3375.745605,4344.927734,122.724937,0,0,0,0,0,0,0,0,0,0,4.663628,0,0),
(19569,16,3377.947510,4319.350586,122.640915,0,0,0,0,0,0,0,0,0,0,4.783795,0,0),
(19569,17,3378.478760,4315.868164,121.044647,0,0,0,0,0,0,0,0,0,0,4.850554,0,0),
(19569,18,3382.309570,4281.611816,121.106400,0,0,0,0,0,0,0,0,0,0,4.889825,0,0),
(19569,19,3382.718018,4279.004395,122.639908,0,0,0,0,0,0,0,0,0,0,4.881972,0,0),
(19569,20,3383.637939,4271.147461,122.639908,0,0,0,0,0,0,0,0,0,0,5.364202,0,0),
(19569,21,3388.751953,4267.105469,122.639908,0,0,0,0,0,0,0,0,0,0,0.110671,0,0),
(19569,22,3392.288330,4267.629883,122.639908,45000,1956904,0,0,0,0,0,0,0,0,0.118525,0,0),
(19569,23,3382.101074,4279.108887,122.639908,0,0,0,0,0,0,0,0,0,0,1.673613,0,0),
(19569,24,3381.781982,4281.360352,121.115196,0,0,0,0,0,0,0,0,0,0,1.720737,0,0),
(19569,25,3381.141113,4290.219727,120.606789,0,0,0,0,0,0,0,0,0,0,0.711501,0,0),
(19569,26,3383.739014,4292.459473,120.963112,0,0,0,0,0,0,0,0,0,0,0.711501,0,0),
(19569,27,3389.087646,4296.379395,120.831299,0,0,0,0,0,0,0,0,0,0,0.652596,0,0);
DELETE FROM creature_movement_scripts WHERE id BETWEEN 1956901 AND 1956904;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(1956901,20,1,133,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1956901,39,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1956901,40,0,0,0,0,0,0,2000000688,0,0,0,0,0,0,0,''),
(1956901,40,1,5,0,0,0,0,0,0,0,0,0,0,0,0,''), 
(1956902,20,1,133,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1956902,39,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1956902,40,0,0,0,0,0,0,2000000689,0,0,0,0,0,0,0,''),
(1956902,40,1,5,0,0,0,0,0,0,0,0,0,0,0,0,''), 
(1956903,20,1,133,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1956903,39,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1956903,40,0,0,0,0,0,0,2000000690,0,0,0,0,0,0,0,''),
(1956903,40,1,5,0,0,0,0,0,0,0,0,0,0,0,0,''), 
(1956904,20,1,133,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1956904,39,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1956904,40,0,0,0,0,0,0,2000000691,0,0,0,0,0,0,0,''),
(1956904,40,1,5,0,0,0,0,0,0,0,0,0,0,0,0,''); 
REPLACE INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES 
(2000000688,'I hope those blood elves across the way don\'t think that I\'m spying on them!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000689,'If I were smart, I\'d be selling this research for a seat on the rocket ship. I have a feeling we\'re going to need to get out of here soon!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000690,'If this is right, we don\'t have long! Oh well.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000691,'This is the last time that I buy second-hand equipment from ethereal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM creature_movement WHERE id =59407;
UPDATE creature_template SET MovementType=2 WHERE entry =19264;
DELETE FROM creature_movement_template WHERE entry =19264;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(19264,1,-220.411362,3101.738281,-59.809574,0,0,0,0,0,0,0,0,0,0,3.722862,0,0),
(19264,2,-234.289047,3093.545898,-63.015488,0,0,0,0,0,0,0,0,0,0,3.869732,0,0),
(19264,3,-247.626877,3080.040771,-65.403610,0,0,0,0,0,0,0,0,0,0,4.001679,0,0),
(19264,4,-233.713669,3095.337891,-62.886951,0,0,0,0,0,0,0,0,0,0,0.590694,0,0);
DELETE FROM creature_movement WHERE id =60911;
UPDATE creature_template SET MovementType=2 WHERE entry =21117;
DELETE FROM creature_movement_template WHERE entry =21117;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(21117,1,2312.97,6003.31,142.866,60000,2111701,0,0,0,0,0,0,0,0,4.62147,0,0),
(21117,2,2313.59,6003.63,142.87,0,0,0,0,0,0,0,0,0,0,0.487132,0,0),
(21117,3,2324.04,6011.98,142.519,0,0,0,0,0,0,0,0,0,0,0.60023,0,0),
(21117,4,2326.82,6010.78,142.47,60000,2111701,0,0,0,0,0,0,0,0,5.67076,0,0),
(21117,5,2326.28,6010.58,142.488,0,0,0,0,0,0,0,0,0,0,3.4151,0,0),
(21117,6,2313.59,6005.18,142.729,0,0,0,0,0,0,0,0,0,0,3.68527,0,0);
DELETE FROM creature_movement_scripts WHERE id =2111701;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(2111701,5,15,28892,1,0,0,0,0,0,0,0,0,0,0,0,''),
(2111701,58,15,6273,1,0,0,0,0,0,0,0,0,0,0,0,'');
DELETE FROM creature_movement WHERE id =125166;
UPDATE creature_template SET MovementType=2 WHERE entry =23843;
DELETE FROM creature_movement_template WHERE entry =23843;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(23843,1,-2948.36,-3893.17,35.0324,15000,0,0,0,0,0,0,0,0,0,2.46798,0,0),
(23843,2,-2953.999512,-3888.347656,34.991009,0,2384301,0,0,0,0,0,0,0,0,2.425621,0,0),
(23843,3,-2955.796631,-3887.216797,33.729000,0,0,0,0,0,0,0,0,0,0,2.241044,0,0),
(23843,4,-2957.362305,-3885.061523,33.099495,0,0,0,0,0,0,0,0,0,0,1.656708,0,0),
(23843,5,-2957.227539,-3882.921387,32.732502,0,0,0,0,0,0,0,0,0,0,6.123266,0,0),
(23843,6,-2955.981201,-3882.954590,32.843334,54000,2384302,0,0,0,0,0,0,0,0,5.505160,0,0),
(23843,7,-2955.550293,-3885.083008,33.167164,0,0,0,0,0,0,0,0,0,0,5.543641,0,0),
(23843,8,-2953.841553,-3885.881592,33.924187,0,0,0,0,0,0,0,0,0,0,5.390487,0,0),
(23843,9,-2952.985840,-3887.905762,35.022324,0,0,0,0,0,0,0,0,0,0,5.340224,0,0),
(23843,10,-2947.744629,-3893.744873,35.030769,0,2384303,0,0,0,0,0,0,0,0,5.611184,0,0),
(23843,11,-2948.36,-3893.17,35.0324,300000,0,0,0,0,0,0,0,0,0,2.46798,0,0);
DELETE FROM creature_movement_scripts WHERE id in (2384301,2384302,2384303);
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(2384301,0,29,2,23843,5,0,0x02,0,0,0,0,0,0,0,0,'23843 - npc_flag removed for event'),
(2384302,3,1,381,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2384302,4,9,90623,45,0,0,0,0,0,0,0,-2954.89,-3883.94,32.9969,2.60053,''),
(2384302,6,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2384302,8,0,0,0,0,0,0,2000000692,0,0,0,0,0,0,0,''),
(2384302,8,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2384302,14,0,0,0,0,0,0,2000000693,0,0,0,0,0,0,0,''),
(2384302,14,1,25,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2384302,19,0,0,0,0,0,0,2000000694,0,0,0,0,0,0,0,''),
(2384302,25,0,0,4792,10,0,0x02,2000000695,0,0,0,0,0,0,0,''),
(2384302,25,1,6,4792,10,0,0,0,0,0,0,0,0,0,0,''),
(2384302,30,0,0,0,0,0,0,2000000696,0,0,0,0,0,0,0,''),
(2384302,30,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2384302,36,0,0,4792,10,0,0x02,2000000697,0,0,0,0,0,0,0,''),
(2384302,36,1,1,4792,10,0,0,0,0,0,0,0,0,0,0,''),
(2384302,41,0,0,0,0,0,0,2000000698,0,0,0,0,0,0,0,''),
(2384302,41,1,5,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2384302,49,1,381,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2384302,53,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2384303,0,29,2,23843,5,0,0x01,0,0,0,0,0,0,0,0,'23843 - npc_flag added after event');
REPLACE INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES 
(2000000692,'I brought you a housewarming gift, Jarl.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000693,'Go on, open it. I think you\'ll like it.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000694,'Jarl?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000695,'Unless it\'s something I can eat, I don\'t want it.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000696,'Jarl, you haven\'t been yourself ever since I arrived. What\'s going on?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000697,'Nothing. Wanna help me whip up some frog leg stew?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000698,'I came out here to visit you, Jarl! And I find you living in an empty cabin in the middle of nowhere, babbling about frogs? You\'re hopeless!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM creature_movement WHERE id =16024;
UPDATE creature_template SET MovementType=2 WHERE entry =5661;
DELETE FROM creature_movement_template WHERE entry =5661;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(5661,1,1739.17,385.329,-62.208,30000,0,0,0,0,0,0,0,0,0,3.9619,0,0),
(5661,2,1739.17,385.329,-62.208,130000,566101,0,0,0,0,0,0,0,0,3.9619,0,0),
(5661,3,1739.17,385.329,-62.208,60000,0,0,0,0,0,0,0,0,0,3.9619,0,0);
DELETE FROM creature_movement_scripts WHERE id =566101;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(566101,1,0,0,0,0,33,0,2000000699,0,0,0,0,0,0,0,''),
(566101,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
(566101,7,0,0,0,0,33,0,2000000700,0,0,0,0,0,0,0,''),
(566101,7,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
(566101,9,10,5680,20000,0,0,0,0,0,0,0,1736.281494,380.897797,-62.291233,3.806411,'summon - male human captive '),
(566101,9,10,5681,20000,0,0,0,0,0,0,0,1737.646362,379.267090,-62.290298,3.689483,'summon - female human captive'),
(566101,33,0,0,0,0,33,0,2000000701,0,0,0,0,0,0,0,''),
(566101,33,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
(566101,39,0,0,0,0,33,0,2000000702,0,0,0,0,0,0,0,''),
(566101,39,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
(566101,41,10,5685,30000,0,0,0,0,0,0,0,1736.281494,380.897797,-62.291233,3.806411,'summon - captive ghoul'),
(566101,41,10,5686,30000,0,0,0,0,0,0,0,1737.646362,379.267090,-62.290298,3.689483,'summon - captive zombie'),
(566101,70,0,0,0,0,33,0,2000000703,0,0,0,0,0,0,0,''),
(566101,70,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
(566101,76,0,0,0,0,33,0,2000000704,0,0,0,0,0,0,0,''),
(566101,76,1,11,0,0,0,0,0,0,0,0,0,0,0,0,''),
(566101,79,10,5687,60000,0,0,0,0,0,0,0,1735.34,378.212,-62.2618,3.76033,'summon - Captive Abomination'),
(566101,130,0,0,0,0,33,0,2000000705,0,0,0,0,0,0,0,''),
(566101,130,1,1,0,0,0,0,0,0,0,0,0,0,0,0,'');
REPLACE INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES 
(2000000699,'Edward. Tyler. Prepare for your first challenge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000700,'Lysta, summon in the captives.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000701,'Not a challenge at all it seems. Let us see how hou handle your second test. Lysta, bring forth the minions of the Lich King.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000702,'Lysta, summon in undead captives.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000703,'It is time to force your final challenge young warriors! Prepare for your hardest fight yet.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000704,'Lysta, summon forth... the abomination!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000705,'Well done Edward and Tyler. You are progressing along in your training quite nicely. We shall test your mettle again soon.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM `creature` WHERE `guid` = 16022;
DELETE FROM `creature` WHERE `guid` = 16009;
DELETE FROM `creature` WHERE `guid` = 126907;
DELETE FROM `creature` WHERE `guid` = 126908;
DELETE FROM `creature` WHERE `guid` = 126909;
UPDATE creature_template SET faction_A=7, faction_H=7, MovementType=2 WHERE entry in (5680,5681,5685,5686,5687);
DELETE FROM creature_movement_template WHERE entry =5680;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(5680,1,1736.281494,380.897797,-62.291233,20000,568001,0,0,0,0,0,0,0,0,3.806411,0,0);
DELETE FROM creature_movement_scripts WHERE id =568001;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(568001,0,15,36400,1,0,0,0,0,0,0,0,0,0,0,0,''),
(568001,3,26,0,5653,20,0x04,0,0,0,0,0,0,0,0,0,'');
DELETE FROM creature_movement_template WHERE entry =5681;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(5681,1,1737.646362,379.267090,-62.290298,20000,568101,0,0,0,0,0,0,0,0,3.689483,0,0);
DELETE FROM creature_movement_scripts WHERE id =568101;
INSERT INTO creature_movement_scripts VALUES 
(568101,0,15,36400,1,0,0,0,0,0,0,0,0,0,0,0,''),
(568101,3,26,0,5654,20,0x04,0,0,0,0,0,0,0,0,0,'');
DELETE FROM creature_movement_template WHERE entry =5685;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(5685,1,1736.281494,380.897797,-62.291233,30000,568501,0,0,0,0,0,0,0,0,3.806411,0,0);
DELETE FROM creature_movement_scripts WHERE id =568501;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(568501,0,15,36400,1,0,0,0,0,0,0,0,0,0,0,0,''),
(568501,3,26,0,5653,20,0x04,0,0,0,0,0,0,0,0,0,'');
DELETE FROM creature_movement_template WHERE entry =5686;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(5686,1,1737.646362,379.267090,-62.290298,30000,568601,0,0,0,0,0,0,0,0,3.689483,0,0);
DELETE FROM creature_movement_scripts WHERE id =568601;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(568601,0,15,36400,1,0,0,0,0,0,0,0,0,0,0,0,''),
(568601,3,26,0,5654,20,0x04,0,0,0,0,0,0,0,0,0,'');
DELETE FROM creature_movement_template WHERE entry =5687;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(5687,1,1735.34,378.212,-62.2618,60000,568701,0,0,0,0,0,0,0,0,3.76033,0,0);
DELETE FROM creature_movement_scripts WHERE id =568701;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(568701,0,15,36400,1,0,0,0,0,0,0,0,0,0,0,0,''),
(568701,3,26,0,5653,20,0x04,0,0,0,0,0,0,0,0,0,''),
(568701,5,26,0,5654,20,0x04,0,0,0,0,0,0,0,0,0,'');
DELETE FROM quest_start_scripts WHERE id =2608;
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2608,1,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2608,3,0,0,0,0,0,0,2000000069,0,0,0,0,0,0,0,''),
(2608,6,0,0,0,0,0,0,2000000070,0,0,0,0,0,0,0,''),
(2608,10,3,0,5000,0,0,0,0,0,0,0,-8805.29,338.5,95.09,1.7,''),
(2608,15,3,0,8000,0,0,0,0,0,0,0,-8804.15,325.58,95.09,4.9,''),
(2608,23,3,0,3000,0,0,0,0,0,0,0,-8805.56,331.96,95.09,3.15,''),
(2608,28,7,2608,0,0,0,0,0,0,0,0,0,0,0,0,'');
DELETE FROM quest_start_scripts WHERE id =2480;
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2480,2,3,0,3000,0,0,0,0,0,0,0,-4.33,-900.68,57.54,1.54,''),
(2480,20,0,0,0,0,0,0,2000000068,0,0,0,0,0,0,0,''),
(2480,30,7,2480,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2480,31,3,0,3000,0,0,0,0,0,0,0,-4.66,-903.92,57.54,3.48,'');
DELETE FROM quest_start_scripts WHERE id =3625;
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(3625,2,3,0,1000,0,0,0,0,0,0,0,-12040.5,-1008.7,49.4,3.66,''),
(3625,6,1,28,0,0,0,0,0,0,0,0,0,0,0,0,''),
(3625,12,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(3625,14,3,0,4000,0,0,0,0,0,0,0,-12033.3,-1004.47,49.78,3.96,''),
(3625,19,7,3625,0,0,0,0,0,0,0,0,0,0,0,0,'');
DELETE FROM quest_start_scripts WHERE id =3321;
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(3321,2,3,0,2000,0,0,0,0,0,0,0,-7197.78,-3765.41,8.79,1.19,''),
(3321,4,1,28,0,0,0,0,0,0,0,0,0,0,0,0,''),
(3321,10,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(3321,12,3,0,2000,0,0,0,0,0,0,0,-7197.94,-3767.04,8.77,5.03,''),
(3321,15,7,3321,0,0,0,0,0,0,0,0,0,0,0,0,'');
DELETE FROM quest_start_scripts WHERE id =2765;
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2765,2,3,0,2000,0,0,0,0,0,0,0,-12033.3,-1009.85,49.87,5.42,''),
(2765,4,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2765,8,3,0,4000,0,0,0,0,0,0,0,-12040,-1006.27,49.62,2.55,''),
(2765,12,1,28,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2765,17,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2765,18,3,0,4000,0,0,0,0,0,0,0,-12037.8,-1004.74,49.53,2.18,''),
(2765,22,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2765,28,3,0,4000,0,0,0,0,0,0,0,-12040.7,-1009.02,49.42,3.63,''),
(2765,32,1,28,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2765,36,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2765,37,3,0,2000,0,0,0,0,0,0,0,-12035.4,-1006.07,49.5,3.78,''),
(2765,40,7,2765,0,0,0,0,0,0,0,0,0,0,0,0,'');
DELETE FROM quest_start_scripts WHERE id =1713;
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1713,1,0,0,0,0,0,0,2000000062,0,0,0,0,0,0,0,''),
(1713,1,20,2,6176,10,0,0,0,0,0,0,0,0,0,0,'6176 - movement chenged to 2:waypoint'),
(1713,61,15,8606,1,0,0,0,0,0,0,0,0,0,0,0,''),
(1713,62,0,2,0,0,0,0,2000000071,0,0,0,0,0,0,0,'');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(13959, 6176, 0, 1, 1, 0, 0, 250.84, -1470.58, 55.4491, 1.39626, 300, 0, 0, 1342, 0, 0, 0);
DELETE FROM creature_movement WHERE id =13959;
UPDATE creature_template SET MovementType=0 WHERE entry =6176;
DELETE FROM creature_movement_template WHERE entry =6176;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(6176,1,253.05,-1459.09,52.09,0,0,0,0,0,0,0,0,0,0,1.39,0,0),
(6176,2,256.87,-1440.35,50.09,0,0,0,0,0,0,0,0,0,0,0.78,0,0),
(6176,3,273.74,-1433.18,50.29,0,0,0,0,0,0,0,0,0,0,6.17,0,0),
(6176,4,297.77,-1436.7,46.96,0,0,0,0,0,0,0,0,0,0,6.14,0,0),
(6176,5,329.59,-1442.08,40.31,0,0,0,0,0,0,0,0,0,0,5.1,0,0),
(6176,6,332.73,-1455.6,42.24,0,0,0,0,0,0,0,0,0,0,4.23,0,0),
(6176,7,323.83,-1468.92,42.24,30000,0,0,0,0,0,0,0,0,0,5.8,0,0),
(6176,8,332.73,-1455.6,42.24,0,0,0,0,0,0,0,0,0,0,4.23,0,0),
(6176,9,329.59,-1442.08,40.31,0,0,0,0,0,0,0,0,0,0,5.1,0,0),
(6176,10,297.77,-1436.7,46.96,0,0,0,0,0,0,0,0,0,0,6.14,0,0),
(6176,11,273.74,-1433.18,50.29,0,0,0,0,0,0,0,0,0,0,6.17,0,0),
(6176,12,256.87,-1440.35,50.09,0,0,0,0,0,0,0,0,0,0,0.78,0,0),
(6176,13,253.05,-1459.09,52.09,0,0,0,0,0,0,0,0,0,0,1.39,0,0),
(6176,14,250.84,-1470.58,55.4491,0,0,0,0,0,0,0,0,0,0,1.39626,0,0),
(6176,15,250.84,-1470.58,55.4491,5000,617601,0,0,0,0,0,0,0,0,1.46601,0,0);
DELETE FROM creature_movement_scripts WHERE id =617601;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(617601,0,20,1,6176,10,0,0,0,0,0,0,0,0,0,0,'6176 - movement chenged to 0:idle');
UPDATE db_script_string SET content_default ='%s begins a spell of summoning...',content_loc8=NULL WHERE entry =2000000071;
UPDATE db_script_string SET content_default ='Follow, $N. I will soon begin the summoning...',content_loc8=NULL WHERE entry =2000000062;
DELETE FROM `creature_movement_scripts` WHERE `id` = 424;
DELETE FROM `creature_movement_scripts` WHERE `id` = 425;
UPDATE locales_gossip_menu_option SET `id`='0' WHERE `menu_id`=8523 AND `id`=1;
DELETE FROM gossip_menu_option WHERE menu_id=8523;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(8523,0,0,'Felsworn Gas Mask broken. You do not have another?',1,1,-1,0,8523,0,0,'',9,10819,0,24,31366,1,0,0,0);
DELETE FROM gossip_scripts WHERE id in (8523,22127);
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(8523,0,15,39101,0,0,0,0,0,0,0,0,0,0,0,0,'Create Felsword Gas Mask'),
(8523,1,0,0,22127,10,0,0,2000001204,0,0,0,0,0,0,0,'Antelarion say');
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=8752 AND `id`=1;
DELETE FROM gossip_menu_option WHERE menu_id=8752;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(8752,0,1,'I want to browse your goods.',3,128,0,0,0,0,0,'',5,934,7,5,935,7,5,942,7);
DELETE FROM gossip_menu_option WHERE menu_id=8751;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(8751,0,1,'I want to browse your goods.',3,128,0,0,0,0,0,'',5,932,7,5,935,7,5,942,7);
DELETE FROM gossip_menu_option WHERE menu_id=7608;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES 
(7608,0,1,'I would like to buy from you.',3,128,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=7722 AND `id`=1;
DELETE FROM gossip_menu_option WHERE menu_id=7722;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES 
(7722,0,1,'I have marks to redeem!',3,128,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
UPDATE creature_template SET MovementType=0 WHERE entry=17682;
UPDATE gameobject_template SET flags=0, data2=30000 WHERE entry=181928;
DELETE FROM gameobject_scripts WHERE id=21671;
INSERT INTO gameobject_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(21671,0,8,17682,1,0,0,0,0,0,0,0,0,0,0,0,'Kill credit for quest 9667'),
(21671,3,0,0,17682,25,0,0x02,2000000706,0,0,0,0,0,0,0,'Princess Stillpine say'),
(21671,6,20,2,17682,25,0,0,0,0,0,0,0,0,0,0,'Movement');
DELETE FROM creature_movement_template WHERE entry=17682;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(17682,1,-2532.386,-12301.55,14.2525,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17682,2,-2545.85,-12304.65,13.29737,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17682,3,-2550.173,-12304.65,13.34731,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17682,4,-2553.749,-12305.99,13.18505,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17682,5,-2558.249,-12307.24,12.93505,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17682,6,-2560.249,-12307.74,12.43505,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17682,7,-2564.027,-12308.31,12.58437,0,0,0,0,0,0,0,0,0,0,0,0,0),
(17682,8,-2576.286,-12302.81,11.78959,0,1,0,0,0,0,0,0,0,0,0,0,0);
REPLACE INTO db_script_string (entry,content_default) VALUES
(2000000706,'Thank you for saving me, $N! My father will be delighted!');
UPDATE quest_template SET StartScript=11351, CompleteScript=11351 WHERE entry=11351;
DELETE FROM quest_start_scripts WHERE id=11351;
INSERT INTO quest_start_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(11351,0,3,0,0,0,0,0,0,0,0,0,0,0,0,2.2864,''),
(11351,1,1,25,24362,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotPoint'),
(11351,2,0,0,24362,10,0,0x02,2000001065,0,0,0,0,0,0,0,'say text'),
(11351,7,3,0,0,0,0,0,0,0,0,0,0,0,0,1.0821,'');
REPLACE INTO db_script_string (entry,content_default) VALUES 
(2000001065,'They keep their tools in boxes that look like this. Look for them near the pavilions.');
DELETE FROM quest_end_scripts WHERE id=11351;
INSERT INTO quest_end_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES 
(11351,0,1,1,24362,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(11351,0,0,0,24362,10,0,0x02,2000001066,0,0,0,0,0,0,0,'say 1'),
(11351,6,0,0,24362,10,0,0x02,2000001067,0,0,0,0,0,0,0,'say 2'),
(11351,14,1,1,24362,10,0,0x01,0,0,0,0,0,0,0,0,'emote OneShotTalk'),
(11351,14,0,0,24362,10,0,0x02,2000001068,0,0,0,0,0,0,0,'say 3');
REPLACE INTO db_script_string (entry,content_default) VALUES 
(2000001066,'I\'m only going to carve the runes I think will give you command over a giant.'),
(2000001067,'I\'m omitting the runes for "north" and "west" because I\'m not sure how they impact the giant. I\'m also including a rune to limit how long you can control it'),
(2000001068,'There we go, the Rune of Command... hopefully. Not nearly as vicious as its Iron Dwarf cousin, but functional.');
UPDATE creature_template SET MovementType=0 WHERE entry IN(19862, 20137, 19864);
REPLACE INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(7810,0,3,'I would like to train.',5,16,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
REPLACE INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(7288,1,1,'Let me browse your goods.',3,128,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
REPLACE INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(7290,1,5,'A fine offer, Floyd. I wish to make Hellfire Peninsula my home.',8,65536,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0),
(7290,3,1,'I\'m looking for some specialty goods. Let me browse your wares, Floyd.',3,128,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
DELETE FROM gossip_menu_option WHERE menu_id=8894;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(8894,0,0,'I need to fly to the Windrunner. Official Business!',1,1,-1,0,8894,0,0,'',9,11229,0,0,0,0,0,0,0),
(8894,1,0,'I need a riding bat to intercept the Alliance reinforcements.',1,1,-1,0,34,0,0,'',9,11170,0,0,0,0,0,0,0);
DELETE FROM gossip_scripts WHERE id IN (8894,34,50100);
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,x,y,z,o,comments) VALUES
(8894,0,15,43074,0,0,0,0,0,0,0,0,0,0,'cast Taxi to the Windrunner'),
(34,0,15,43136,0,0,0,0,0,0,0,0,0,0,'cast Test at Sea Taxi');
UPDATE creature_template SET MovementType=0, movementId=0 WHERE entry=20518;
UPDATE creature_template SET gossip_menu_id=8127 WHERE entry=20518;
DELETE FROM `creature` WHERE `guid` = 123855;
DELETE FROM gossip_menu_option WHERE menu_id=8062;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(8062,0,0,'Attempt to contact Wind Trader Marid.',1,1,-1,0,8062,0,0,'',9,10270,0,0,0,0,0,0,0),
(8062,1,0,'Attempt to contact Wind Trader Marid.',1,1,-1,0,8062,0,0,'',8,10270,0,19,10271,0,0,0,0);
DELETE FROM gossip_scripts WHERE id=8062;
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,x,y,z,o,comments) VALUES
(8062,0,10,20518,60000,0,0,0,0,0,4007.38,1517.12,-115.535,0.87,'spawn Image of Wind Trader Marid');
DELETE FROM gossip_menu WHERE entry IN (8127);
INSERT INTO gossip_menu (entry, text_id) VALUES (8127, 9971);
DELETE FROM event_scripts WHERE id IN (15826,16133);
INSERT INTO event_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES
(15826,0,0,2,24279,10,0,0x06,2000000710,0,0,0,0,0,0,0,'text emote'),
(15826,1,0,1,24251,10,0,0x02,2000000711,2000000712,2000000713,0,0,0,0,0,'Chief Plaguebringer Harris yell'),
(16133,0,0,2,24042,10,0,0x06,2000000714,0,0,0,0,0,0,0,'text emote');
REPLACE INTO db_script_string (entry,content_default) VALUES 
(2000000710,'The failed concoction spills on the floor and appears to come to life!'),
(2000000711,'It\'s alive!'),
(2000000712,'The mixture! It moves!'),
(2000000713,'Steady your hand, you fool! Those are rare components you\'re spilling on the floor!'),
(2000000714,'$N\'s concoction is ruined. A new one must be created from scratch.');
UPDATE creature_template SET minlevel=67, maxlevel=68, minhealth=75, maxhealth=77, faction_A=14, faction_H=14 WHERE entry=24279;
DELETE FROM event_scripts WHERE id=15726;
INSERT INTO event_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,dataint3,dataint4,x,y,z,o,comments) VALUES
(15726,0,10,24173,60000,0,0,0x01,0,0,0,0,2919.028,-4503.459,280.5269,5.4937,'Frostgore spawn'),
(15726,24,1,25,24173,50,0,0x01,0,0,0,0,0,0,0,0,'Frostgore play emote'),
(15726,24,0,0,24173,50,0,0x02,2000000707,0,0,0,0,0,0,0,'Frostgore say 1'),
(15726,30,1,25,24173,50,0,0x01,0,0,0,0,0,0,0,0,'Frostgore play emote'),
(15726,30,0,0,24173,50,0,0x02,2000000708,0,0,0,0,0,0,0,'Frostgore say 2'),
(15726,31,1,25,24173,50,0,0x01,0,0,0,0,0,0,0,0,'Frostgore play emote'),
(15726,33,26,0,24173,50,0,0x02,0,0,0,0,0,0,0,0,'Frostgore start attack');
REPLACE INTO db_script_string (entry,content_default) VALUES 
(2000000707,'Are YOU the one who interrupted my dinner? Well, are you?'),
(2000000708,'You\'re too ugly and scrawny to be a female yeti! And now you\'re making me mad...');
UPDATE creature_template SET MovementType=2 WHERE entry=24173;
DELETE FROM creature_movement_template WHERE entry=24173;
INSERT INTO creature_movement_template VALUES 
(24173,1,2919.028,-4503.459,280.5269,0,0,0,0,0,0,0,0,0,0,0,0,0),
(24173,2,2920.23,-4520.284,276.1576,0,0,0,0,0,0,0,0,0,0,0,0,0),
(24173,3,2922.561,-4528.931,274.6995,0,0,0,0,0,0,0,0,0,0,0,0,0),
(24173,4,2924.239,-4537.918,273.8873,0,0,0,0,0,0,0,0,0,0,0,0,0),
(24173,5,2944.427,-4555.303,273.6897,60000,0,0,0,0,0,0,0,0,0,0,0,0);
DELETE FROM gossip_menu_option WHERE menu_id=1443;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(1443,0,0,'You can cook?  So can I!  Is there a recipe you can teach me?',1,1,1501,0,1443,0,0,'',7,185,175,17,13028,1,0,0,0),
(1443,1,0,'You\'re an alchemist?  So am I.  Perhaps you can teach me what you know...',1,1,1442,0,33,0,0,'',7,171,180,17,3451,1,0,0,0);
DELETE FROM gossip_scripts WHERE id IN (1443,33);
INSERT INTO gossip_scripts (id,delay,command,datalong,datalong2,datalong3,datalong4,data_flags,dataint,dataint2,x,y,z,o,comments) VALUES
(1443,0,15,13029,0,0,0,0,0,0,0,0,0,0,'learn Goldthorn Tea'),
(1443,0,0,0,8696,10,0,0x01,2000000709,0,0,0,0,0,'say 1'),
(33,0,15,13030,0,0,0,0,0,0,0,0,0,0,'learn Major Troll\'s Blood Elixir'),
(33,0,0,0,8696,10,0,0x01,2000000709,0,0,0,0,0,'say 2');
REPLACE INTO db_script_string (entry, content_default) VALUES 
(2000000709,'Thank again, $n.  Now I\'ll just wait here until it\'s safe to leave.');
REPLACE INTO gossip_menu (entry, text_id) VALUES (9055, 9051);
DELETE FROM gossip_menu_option WHERE menu_id=9055;
UPDATE `creature_template` SET `gossip_menu_id`='9055' WHERE `entry`=25036;
INSERT INTO gossip_menu_option (menu_id,id,option_icon,option_text,option_id,npc_option_npcflag,action_menu_id,action_poi_id,action_script_id,box_coded,box_money,box_text,cond_1,cond_1_val_1,cond_1_val_2,cond_2,cond_2_val_1,cond_2_val_2,cond_3,cond_3_val_1,cond_3_val_2) VALUES
(9055,0,5,'Make this inn your home.',8,65536,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0),
(9055,1,1,'I want to browse your goods.',3,128,0,0,0,0,0,'',0,0,0,0,0,0,0,0,0);
DELETE FROM event_scripts WHERE id=12823;
INSERT INTO event_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(12823,0,10,19862,180000,0,0,0,0,0,0,0,-1175.41,2264.59,53.1733,3.15905,''),
(12823,1,0,0,19862,30,0,2,2000000715,0,0,0,0,0,0,0,'Say on spawn'),
(12823,3,26,0,19862,30,0,0x02,0,0,0,0,0,0,0,0,'start attack'),
(12823,6,10,19864,180000,0,0,0,0,0,0,0,-1195.07,2268.22,47.38,5.68977,''),
(12823,7,0,0,19864,20,0,2,2000000716,0,0,0,0,0,0,0,'Say on spawn'),
(12823,6,10,20137,180000,0,0,0,0,0,0,0,-1190.11,2258.2,46.6871,1.36136,''),
(12823,6,10,20137,180000,0,0,0,0,0,0,0,-1196.75,2264.76,47.9826,6.19592,''),
(12823,6,10,20137,180000,0,0,0,0,0,0,0,-1196.12,2260.61,48.0384,0.43633,''),
(12823,6,10,20137,180000,0,0,0,0,0,0,0,-1193.53,2259.04,47.484,0.820305,''),
(12823,6,10,20137,180000,0,0,0,0,0,0,0,-1190.24,2269.2,46.0973,4.97419,'');
REPLACE INTO db_script_string (entry, content_default) VALUES 
(2000000715,'Urtrak kill you!'),
(2000000716,'Vengeance is ours!  Attack my brothers!');
DELETE FROM quest_end_scripts WHERE id =943;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(943,0,0,2,0,0,0,0,2000000723,0,0,0,0,0,0,0,''),
(943,4,10,3582,26000,0,0,0,0,0,0,0,-3807.34,-839.492,16.9485,2.92982,''),
(943,5,3,0,1000,0,0,0,0,0,0,0,-3813.62,-837.888,17.1641,5.9409,''),
(943,6,0,0,0,0,0,0,2000000089,0,0,0,0,0,0,0,''),
(943,10,0,0,3582,20,0,0x02,2000000724,0,0,0,0,0,0,0,'force 3582 to: say text'),
(943,15,0,0,3582,20,0,0x02,2000000725,0,0,0,0,0,0,0,'force 3582 to: say text'),
(943,20,0,0,3582,20,0,0x02,2000000726,0,0,0,0,0,0,0,'force 3582 to: say text'),
(943,25,0,0,3582,20,0,0x02,2000000727,0,0,0,0,0,0,0,'force 3582 to: say text'),
(943,30,0,2,0,0,0,0,2000000728,0,0,0,0,0,0,0,''),
(943,32,3,0,1000,0,0,0,0,0,0,0,-3813.62,-837.888,17.1641,1.43117,''),
(943,35,0,0,0,0,0,0,2000000079,0,0,0,0,0,0,0,'');
REPLACE INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES 
(2000000723,'%s begins to manipulate the Stone of Relu over the two fossils.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000724,'Who hath summoned forth Aman?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000725,'Ah, I see you toil with relics of the past.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000726,'Be warned that even your creators are fallible.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000727,'Digging too deep into your past might bring an abrupt end to your future.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000728,'Aman dissipates before your eyes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(2000000717, 'Denalan removes the seeds from the Glowing Fruit...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000718, 'Let''s see how these seeds grow in my prepared soil...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000719, 'Denalan plants fruit seeds.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000720, 'Bogling rises from the soil!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000721, 'Denalan hurries to his planter.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000722, 'I hope this frond takes root...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM quest_end_scripts WHERE id =930;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(930,1,0,2,0,0,0,0,2000000717,0,0,0,0,0,0,0,''),
(930,4,3,0,1000,0,0,0,0,0,0,0,9508.02,715.749,1255.89,1.03055,''),
(930,4,0,0,0,0,0,0,2000000718,0,0,0,0,0,0,0,''),
(930,5,3,0,1000,0,0,0,0,0,0,0,9507.66,718.009,1255.89,1.80417,''),
(930,6,3,0,1000,0,0,0,0,0,0,0,9505.56,719.088,1256.2,2.65632,''),
(930,8,0,2,0,0,0,0,2000000719,0,0,0,0,0,0,0,''),
(930,8,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(930,11,3,0,1000,0,0,0,0,0,0,0,9506.92,713.766,1255.89,0.257643,''),
(930,13,3,0,1000,0,0,0,0,0,0,0,9506.92,713.766,1255.89,0.279253,''),
(930,14,10,3569,20000,0,0,0,0,0,0,0,9504.13,721.459,1255.94,6.24727,''),
(930,14,10,3569,20000,0,0,0,0,0,0,0,9504.09,720.294,1255.94,1.00709,''),
(930,14,10,3569,20000,0,0,0,0,0,0,0,9505.13,722.011,1255.94,0.0244875,''),
(930,14,0,2,0,0,0,0,2000000720,0,0,0,0,0,0,0,'');
DELETE FROM quest_end_scripts WHERE id =7642;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(7642,0,29,3,1416,10,0,0x02,0,0,0,0,0,0,0,0,'1416 - npc_flag removed'),
(7642,2,0,0,0,0,0,0,2000000012,0,0,0,0,0,0,0,''),
(7642,4,20,2,1416,30,0,0,0,0,0,0,0,0,0,0,'1416 - movement chenged to 2:waypoint'),
(7642,105,29,3,1416,10,0,0x01,0,0,0,0,0,0,0,0,'1416 - npc_flag added');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(6438, 1416, 0, 1, 1, 0, 0, -8387, 685.202, 95.356, 2.286, 430, 0, 0, 2769, 0, 0, 0);
DELETE FROM creature_movement WHERE id =6438;
UPDATE creature_template SET MovementType=0 WHERE entry =1416;
DELETE FROM creature_movement_template WHERE entry =1416;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(1416,1,-8393.09,687.41,95.27,0,0,0,0,0,0,0,0,0,0,3.72,0,0),
(1416,2,-8400.51,681.85,95.96,0,0,0,0,0,0,0,0,0,0,5,0,0),
(1416,3,-8388.72,646.85,94.82,0,0,0,0,0,0,0,0,0,0,3.92,0,0),
(1416,4,-8422.25,618.12,95.46,3000,0,0,0,0,0,0,0,0,0,3.2,0,0),
(1416,5,-8422.25,618.12,95.46,6000,0,0,0,0,0,0,69,0,0,3.2,0,0),
(1416,6,-8422.25,618.12,95.46,1000,0,0,0,0,0,0,0,0,0,3.2,0,0),
(1416,7,-8421.99,617.93,95.45,2000,0,0,0,0,0,0,0,0,0,5.34,0,0),
(1416,8,-8421.99,617.93,95.45,6000,0,0,0,0,0,0,233,0,0,5.34,0,0),
(1416,9,-8421.99,617.93,95.45,0,0,2000000011,0,0,0,0,0,0,0,5.34,0,0),
(1416,10,-8388.72,646.85,94.82,0,0,0,0,0,0,0,0,0,0,1.98295,0,0),
(1416,11,-8400.51,681.85,95.96,0,0,0,0,0,0,0,0,0,0,0.798564,0,0),
(1416,12,-8393.09,687.41,95.27,0,0,0,0,0,0,0,0,0,0,6.03867,0,0),
(1416,13,-8387,685.202,95.356,0,0,0,0,0,0,0,0,0,0,2.47925,0,0),
(1416,14,-8387,685.202,95.356,2000,141601,0,0,0,0,0,0,0,0,2.47925,0,0);
DELETE FROM creature_movement_scripts WHERE id =141601;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(141601,2,20,1,1416,10,0,0,0,0,0,0,0,0,0,0,'1416 - movement chenged to 0:idle');
DELETE FROM quest_end_scripts WHERE id =1391;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1391,0,0,2,0,0,0,0,2000000281,0,0,0,0,0,0,0,''),
(1391,2,0,0,0,0,0,0,2000000282,0,0,0,0,0,0,0,''),
(1391,7,0,0,0,0,0,0,2000000283,0,0,0,0,0,0,0,''),
(1391,8,1,64,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1391,13,0,2,0,0,0,0,2000000284,0,0,0,0,0,0,0,''),
(1391,14,0,0,0,0,0,0,2000000285,0,0,0,0,0,0,0,''),
(1391,14,15,7293,1,0,0,0,0,0,0,0,0,0,0,0,''),
(1391,15,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1391,16,3,0,1000,0,0,0,0,0,0,0,-10423.5,-3240.63,20.1786,4.68979,''),
(1391,17,3,0,1000,0,0,0,0,0,0,0,-10420.6,-3240.03,20.1786,2.11212,''),
(1391,19,3,0,1000,0,0,0,0,0,0,0,-10422.1,-3237.58,20.1786,3.80072,''),
(1391,20,3,0,1000,0,0,0,0,0,0,0,-10424.4,-3239.73,20.1786,3.8633,''),
(1391,22,3,0,1000,0,0,0,0,0,0,0,-10422.4,-3238.96,20.1786,0.236333,''),
(1391,26,15,5,1,0,0,0,0,0,0,0,0,0,0,0,'');
UPDATE creature SET Spawntimesecs =30 WHERE guid =2968;
DELETE FROM quest_end_scripts WHERE id =1383;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1383,0,29,2,5414,10,0,0x02,0,0,0,0,0,0,0,0,'5414 - npc_flag removed'),
(1383,1,0,0,0,0,0,0,2000000289,0,0,0,0,0,0,0,''),
(1383,4,3,0,1000,0,0,0,0,0,0,0,-10351.1,-1527.88,92.7248,6.23291,''),
(1383,6,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1383,10,0,0,0,0,0,0,2000000290,0,0,0,0,0,0,0,''),
(1383,10,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1383,15,3,0,1000,0,0,0,0,0,0,0,-10351.1,-1527.88,92.7248,3.14159,''),
(1383,16,29,2,5414,10,0,0x01,0,0,0,0,0,0,0,0,'5414 - npc_flag added'),
(1383,16,0,0,0,0,0,0,2000000291,0,0,0,0,0,0,0,'');
DELETE FROM quest_end_scripts WHERE id =1191;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1191,0,29,3,4709,10,0,0x02,0,0,0,0,0,0,0,0,'4709 - npc_flag removed'),
(1191,2,3,0,16000,0,0,0,0,0,0,0,-6273.41,-3841.7,-58.75,1.9,''),
(1191,18,3,0,1000,0,0,0,0,0,0,0,-6273.41,-3841.7,-58.75,1.9,''),
(1191,20,9,19056,120,0,0,0,0,0,0,0,0,0,0,0,''),
(1191,25,3,0,16000,0,0,0,0,0,0,0,-6226.13,-3944.94,-58.6251,5.48331,''),
(1191,51,29,3,4709,10,0,0x01,0,0,0,0,0,0,0,0,'4709 - npc_flag added');
DELETE FROM quest_end_scripts WHERE id =997;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(997,2,0,0,0,0,0,0,2000000048,0,0,0,0,0,0,0,''),
(997,2,3,0,1000,0,0,0,0,0,0,0,9508.02,715.749,1255.89,1.03055,''),
(997,3,3,0,1000,0,0,0,0,0,0,0,9507.66,718.009,1255.89,1.80417,''),
(997,4,3,0,1000,0,0,0,0,0,0,0,9505.56,719.088,1256.2,2.65632,''),
(997,6,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(997,9,3,0,1000,0,0,0,0,0,0,0,9506.92,713.766,1255.89,0.259253,''),
(997,11,3,0,1000,0,0,0,0,0,0,0,9506.92,713.766,1255.89,0.279253,''),
(997,11,0,0,0,0,0,0,2000000049,0,0,0,0,0,0,0,'');
DELETE FROM quest_end_scripts WHERE id =10715;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(10715,0,29,3,22103,10,0,0x02,0,0,0,0,0,0,0,0,'22103 - npc_flag removed'),
(10715,1,3,0,1000,0,0,0,0,0,0,0,2915.57,5957.42,3.27419,2.97874,''),
(10715,5,1,69,0,0,0,0,0,0,0,0,0,0,0,0,''),
(10715,12,1,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(10715,14,3,0,1000,0,0,0,0,0,0,0,2919.11,5956.93,3.16149,1.03933,''),
(10715,16,3,0,1000,0,0,0,0,0,0,0,2919.11,5956.93,3.16149,1.58825,''),
(10715,17,29,3,22103,10,0,0x01,0,0,0,0,0,0,0,0,'22103 - npc_flag added'),
(10715,17,0,0,0,0,0,0,2000000444,0,0,0,0,0,0,0,'');
DELETE FROM quest_end_scripts WHERE id =9397;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(9397,1,3,0,1000,0,0,0,0,0,0,0,-597.806,4110.68,90.848,2.02116,''),
(9397,3,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(9397,5,10,17262,20000,0,0,0,0,0,0,0,-597.244,4111.88,90.7789,0.805268,''),
(9397,6,0,0,0,0,0,0,2000000441,0,0,0,0,0,0,0,''),
(9397,10,3,0,1000,0,0,0,0,0,0,0,-596.347,4108.47,91.0061,5.15176,''),
(9397,12,3,0,1000,0,0,0,0,0,0,0,-596.347,4108.47,91.0061,4.10152,'');
DELETE FROM quest_end_scripts WHERE id =10349;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(10349,0,29,3,19294,10,0,0x02,0,0,0,0,0,0,0,0,'19294 - npc_flag removed'),
(10349,1,0,0,0,0,0,0,2000000442,0,0,0,0,0,0,0,''),
(10349,2,20,2,19294,30,0,0,0,0,0,0,0,0,0,0,'19294 - movement chenged to 2:waypoint'),
(10349,20,29,3,19294,10,0,0x01,0,0,0,0,0,0,0,0,'19294 - npc_flag added');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(76910, 19294, 530, 1, 1, 0, 0, -294.766, 4715.08, 28.1862, 0.20944, 300, 0, 0, 11430, 5410, 0, 0);
DELETE FROM creature_movement WHERE id =76910;
UPDATE creature_template SET MovementType=0 WHERE entry =19294;
DELETE FROM creature_movement_template WHERE entry =19294;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(19294,1,-287.691,4730.5,18.3553,0,0,0,0,0,0,0,0,0,0,1.18652,0,0),
(19294,2,-287.691,4730.5,18.3553,20000,1929401,0,0,0,0,0,0,0,0,1.18652,0,0),
(19294,3,-294.766,4715.08,28.1862,0,0,0,0,0,0,0,0,0,0,4.0815,0,0),
(19294,4,-294.766,4715.08,28.1862,0,0,0,0,0,0,0,0,0,0,0.20944,0,0),
(19294,5,-294.766,4715.08,28.1862,5000,1929402,0,0,0,0,0,0,0,0,0.20944,0,0);
DELETE FROM creature_movement_scripts WHERE id BETWEEN 1929401 AND 1929402;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(1929401,2,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(1929401,5,9,82673,5,0,0,0,0,0,0,0,0,0,0,0,''),
(1929401,9,0,0,0,0,0,0,2000000443,0,0,0,0,0,0,0,''),
(1929401,9,10,20599,120000,0,0,0,0,0,0,0,-287.019,4731.63,18.217,2.58308,''),
(1929402,2,20,1,19294,10,0,0,0,0,0,0,0,0,0,0,'19294 - movement chenged to 0:idle');
DELETE FROM quest_end_scripts WHERE id =407;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(407,0,0,0,0,0,0,0,2000000245,0,0,0,0,0,0,0,''),
(407,3,15,3287,1,0,0,0,0,0,0,0,0,0,0,0,''),
(407,3,3,0,2000,0,0,0,0,0,0,0,2287.97,236.253,27.0892,2.6613,''),
(407,6,3,0,2000,0,0,0,0,0,0,0,2292,239.481,27.0892,0.693878,''),
(407,8,0,0,0,0,0,0,2000000246,0,0,0,0,0,0,0,''),
(407,10,3,0,2000,0,0,0,0,0,0,0,2292.52,235.226,27.0892,4.8345,''),
(407,13,3,0,2000,0,0,0,0,0,0,0,2288.96,237.96,27.0892,2.48773,''),
(407,19,15,5,1,0,0,0,0,0,0,0,0,0,0,0,'');
UPDATE creature SET Spawntimesecs =30, Curhealth =176 WHERE guid =17438;
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(2000000729, 'Ah, that sure does hit the spot! I think i''ll get myself a couple more...can you watch these barrels for me, $N?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000730, 'How goes the barrel watching...?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000731, 'Well, back to business for me. But it sure was nice taking that short break, and it''s always nice drinking Thunder Ale!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM quest_end_scripts WHERE id =308;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(308,0,0,0,0,0,0,0,2000000729,0,0,0,0,0,0,0,''),
(308,0,29,2,1373,10,0,0x02,0,0,0,0,0,0,0,0,'1373 - npc_flag removed'),
(308,1,20,2,1373,30,0,0,0,0,0,0,0,0,0,0,'1373 - movement chenged to 2:waypoint'),
(308,12,9,6011,55,0,0,0,0,0,0,0,-5607.24,-547.934,392.985,0.471239,''),
(308,23,0,0,0,0,0,0,2000000092,0,0,0,0,0,0,0,'');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(8405, 1373, 0, 1, 1, 0, 0, -5605.96, -544.451, 392.43, 0.977384, 180, 0, 0, 328, 0, 0, 0);
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(6011, 270, 0, 1, 1, -5607.24, -547.934, 392.985, 0.471239, 0, 0, 0.69985, -0.71429, -600, 0, 1);
DELETE FROM creature_movement WHERE id =8405;
UPDATE creature_template SET MovementType=0 WHERE entry =1373;
DELETE FROM creature_movement_template WHERE entry =1373;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(1373,1,-5601.64,-541.38,392.42,0,0,0,0,0,0,0,0,0,0,0.5,0,0),
(1373,2,-5597.94,-542.04,392.42,0,0,0,0,0,0,0,0,0,0,5.5,0,0),
(1373,3,-5597.95,-548.43,395.48,0,0,0,0,0,0,0,0,0,0,4.7,0,0),
(1373,4,-5605.31,-549.33,399.09,0,0,0,0,0,0,0,0,0,0,3.1,0,0),
(1373,5,-5607.55,-546.63,399.09,0,0,0,0,0,0,0,0,0,0,1.5,0,0),
(1373,6,-5597.52,-538.75,399.09,0,0,0,0,0,0,0,0,0,0,1.5,0,0),
(1373,7,-5597.62,-530.24,399.65,0,0,0,0,0,0,0,0,0,0,3,0,0),
(1373,8,-5603.67,-529.91,399.65,20000,0,0,0,0,0,0,0,0,0,4.2,0,0),
(1373,9,-5603.67,-529.91,399.65,0,0,0,0,0,0,0,0,0,0,4.2,0,0),
(1373,10,-5597.62,-530.24,399.65,0,0,0,0,0,0,0,0,0,0,3,0,0),
(1373,11,-5597.52,-538.75,399.09,0,0,0,0,0,0,0,0,0,0,1.5,0,0),
(1373,12,-5607.55,-546.63,399.09,0,0,0,0,0,0,0,0,0,0,1.5,0,0),
(1373,13,-5605.31,-549.33,399.09,0,0,0,0,0,0,0,0,0,0,3.1,0,0),
(1373,14,-5597.95,-548.43,395.48,0,0,0,0,0,0,0,0,0,0,4.7,0,0),
(1373,15,-5597.94,-542.04,392.42,0,0,0,0,0,0,0,0,0,0,5.5,0,0),
(1373,16,-5601.64,-541.38,392.42,0,0,2000000730,0,0,0,0,0,0,0,0.5,0,0),
(1373,17,-5605.96,-544.451,392.43,0,0,0,0,0,0,0,0,0,0,0.5,0,0),
(1373,18,-5605.96,-544.451,392.43,2000,137301,0,0,0,0,0,0,0,0,0.977384,0,0);
DELETE FROM creature_movement_scripts WHERE id =137301;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(137301,0,0,0,0,0,0,0,2000000731,0,0,0,0,0,0,0,''),
(137301,1,29,2,1373,10,0,0x01,0,0,0,0,0,0,0,0,'1373 - npc_flag added'),
(137301,2,20,1,1373,10,0,0,0,0,0,0,0,0,0,0,'1373 - movement chenged to 0:idle');
UPDATE quest_template SET PrevQuestId =-310 WHERE entry =308;
UPDATE gameobject_template SET size =1.1 WHERE entry =270;
DELETE FROM quest_end_scripts WHERE id =10919;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(10919,1,20,2,20206,30,0,0,0,0,0,0,0,0,0,0,'20206 - movement chenged to 2:waypoint');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(59114, 20206, 530, 1, 1, 0, 0, -684.603, 2626.44, 89.1955, 2.22254, 300, 0, 0, 42, 0, 0, 0);
DELETE FROM creature_movement WHERE id =59114;
UPDATE creature_template SET MovementType=0 WHERE entry =20206;
DELETE FROM creature_movement_template WHERE entry =20206;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(20206,1,-684.603,2626.44,89.1955,2000,2020601,0,0,0,0,0,0,0,0,2.22254,0,0),
(20206,2,-697.934,2612.59,89.4752,0,0,0,0,0,0,0,0,0,0,3.9,0,0),
(20206,3,-688.665,2580.78,86.9841,0,0,0,0,0,0,0,0,0,0,5.16,0,0),
(20206,4,-689.199,2588.81,87.446,0,0,0,0,0,0,0,0,0,0,0.8,0,0),
(20206,5,-667.044,2611.74,85.7029,0,0,0,0,0,0,0,0,0,0,0.8,0,0),
(20206,6,-656.048,2652.06,86.5892,0,0,0,0,0,0,0,0,0,0,0.88,0,0),
(20206,7,-659.047,2651.34,87.048,0,0,0,0,0,0,0,0,0,0,2.14,0,0),
(20206,8,-697.934,2612.59,89.4752,0,0,0,0,0,0,0,0,0,0,0.16,0,0),
(20206,9,-656.055,2674.2,88.1354,0,0,0,0,0,0,0,0,0,0,1.52,0,0),
(20206,10,-691.042,2652.45,92.1508,0,0,0,0,0,0,0,0,0,0,3.49,0,0),
(20206,11,-688.807,2701.25,94.8354,0,0,0,0,0,0,0,0,0,0,1.51,0,0),
(20206,12,-667.514,2716.08,94.4471,0,0,0,0,0,0,0,0,0,0,0.6,0,0),
(20206,13,-688.593,2723.67,94.4145,0,0,0,0,0,0,0,0,0,0,1.75,0,0),
(20206,14,-687.635,2743.1,93.9095,0,0,0,0,0,0,0,0,0,0,1.65,0,0),
(20206,15,-697.062,2748.04,93.938,0,0,0,0,0,0,0,0,0,0,2.61,0,0),
(20206,16,-687.635,2743.1,93.9095,0,0,0,0,0,0,0,0,0,0,1.65,0,0),
(20206,17,-685.121,2689.01,93.8042,0,0,0,0,0,0,0,0,0,0,4.73,0,0),
(20206,18,-688.862,2627.19,89.8591,0,0,0,0,0,0,0,0,0,0,4.66,0,0),
(20206,19,-685.494,2626.74,89.2711,3000,2020602,0,0,0,0,0,0,0,0,6.15,0,0);
DELETE FROM creature_movement_scripts WHERE id BETWEEN 2020601 AND 2020602;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(2020601,1,25,1,20206,10,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(2020602,0,25,0,20206,10,0,0,0,0,0,0,0,0,0,0,'RUN OFF'),
(2020602,2,20,1,20206,10,0,0,0,0,0,0,0,0,0,0,'20206 - movement chenged to 0:idle');
REPLACE INTO gossip_menu (entry, text_id) VALUES (8724, 11025);
REPLACE INTO gossip_menu (entry, text_id) VALUES (8722, 10999);
REPLACE INTO gossip_menu (entry, text_id) VALUES (8721, 10986);
REPLACE INTO gossip_menu (entry, text_id) VALUES (8717, 10975);
REPLACE INTO gossip_menu (entry, text_id) VALUES (8716, 10965);
REPLACE INTO gossip_menu (entry, text_id) VALUES (8726, 11035);
UPDATE `db_script_string` SET `content_default`='ACK! That''s the worst thing I''ve ever tasted! I wouldn''t let my ram drink that!' WHERE `entry`=2000001203;
DELETE FROM `event_scripts` WHERE `id` = 14536;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(14536, 2, 10, 21514, 3000000, 0, 0, 0, 0, 0, 0, 0, 3632.31, 7159.56, 142.12, 3.56, 'Gorgrom the Dragon-Eater spawn (quest 10802)');
UPDATE creature_template SET npcflag=2 WHERE entry =3692;
UPDATE creature_template SET faction_A=40, faction_H=40 WHERE entry =9520;
DELETE FROM event_scripts WHERE id=12650;
INSERT INTO event_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(12650,1,0,2,18384,10,0,0x02,2000000732,0,0,0,0,0,0,0,'force 18384 to: text_emote'),
(12650,2,20,2,18384,10,0,0,0,0,0,0,0,0,0,0,'18384 - movement chenged to 2:waypoint'),
(12650,10,10,19616,100000,0,0,0,0,0,0,0,-2670.76,4399.93,36.4068,6.2184,''),
(12650,44,8,18384,0,0,0,0,0,0,0,0,0,0,0,0,''),
(12650,45,29,3,18384,10,0,0x01,0,0,0,0,0,0,0,0,'18384 - npc_flag added'),
(12650,46,0,0,18384,10,0,0x02,2000000736,0,0,0,0,0,0,0,'force 18384 to: say text');
DELETE FROM creature_movement_template WHERE entry =19616;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(19616,1,-2670.76,4399.93,36.4068,7000,1961601,0,0,0,0,0,0,0,0,6.2184,0,0),
(19616,2,-2657.991943,4398.609863,36.867481,0,0,0,0,0,0,0,0,0,0,4.423763,0,0),
(19616,3,-2658.390869,4387.985840,36.141254,0,0,0,0,0,0,0,0,0,0,3.976087,0,0),
(19616,4,-2667.968018,4377.346191,36.118217,16000,1961602,0,0,0,0,0,0,0,0,3.760031,0,0);
DELETE FROM creature_movement_scripts WHERE id IN (1961601,1961602);
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(1961601,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'Terokkar Wolf Spirit - RUN ON'),
(1961602,5,0,2,0,0,0,0,2000000733,0,0,0,0,0,0,0,'Terokkar Wolf Spirit - text_emote '),
(1961602,8,0,2,0,0,0,0,2000000734,0,0,0,0,0,0,0,'Terokkar Wolf Spirit - text_emote'),
(1961602,12,1,2,18384,10,0,0x02,0,0,0,0,0,0,0,0,'force 18384 to: emote'),
(1961602,12,0,0,18384,10,0,0x02,2000000735,0,0,0,0,0,0,0,'force 18384 to: say text'),
(1961602,15,18,1,0,0,0,0,0,0,0,0,0,0,0,0,'DESPAWN_SELF');
REPLACE INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES 
(2000000732,'%s dons his wolf-fur vestments.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000733,'%s howls in response to Malukaz\'s call.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000734,'%s expresses its approval.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000735,'May our bond with you never be broken again, spirit.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000736,'We have done it! Thrall would be proud.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
UPDATE creature_template SET MovementType=2 WHERE entry=19616;
DELETE FROM quest_start_scripts WHERE id=10791;
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(10791,0,29,3,18384,10,0,0x02,0,0,0,0,0,0,0,0,'18384 - npc_flag removed'),
(10791,60,29,3,18384,10,0,0x01,0,0,0,0,0,0,0,0,'18384 - npc_flag added');
UPDATE quest_template SET StartScript =10791 WHERE entry =10791;
UPDATE creature_template SET MovementType=0 WHERE entry =18384;
DELETE FROM creature_movement_template WHERE entry =18384;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(18384,1,-2671.77,4373.86,35.9781,15000,1838401,0,0,0,0,0,0,0,0,0.680678,0,0),
(18384,2,-2671.77,4373.86,35.9781,2000,0,0,0,0,0,0,0,0,0,0.680678,0,0);
DELETE FROM creature_movement_scripts WHERE id =1838401;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(1838401,3,15,28892,1,0,0,0,0,0,0,0,0,0,0,0,''),
(1838401,10,15,6273,1,0,0,0,0,0,0,0,0,0,0,0,''),
(1838401,11,20,1,18384,10,0,0,0,0,0,0,0,0,0,0,'18384 - movement chenged to 0:idle');
UPDATE creature_template SET InhabitType =1 WHERE entry IN (7044,7045,7046,14388);
DELETE FROM quest_start_scripts WHERE id =945;
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(945,0,29,3,3584,20,0,0x02,0,0,0,0,0,0,0,0,'3584 - npc_flag removed'),
(945,0,0,0,0,0,0,0,2000000037,0,0,0,0,0,0,0,''),
(945,1,20,2,3584,10,0,0,0,0,0,0,0,0,0,0,'3584 - movement chenged to 2:waypoint'),
(945,125,0,0,0,0,0,0,2000000038,0,0,0,0,0,0,0,''),
(945,126,7,945,15,0,0,0,0,0,0,0,0,0,0,0,'');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(42717, 3584, 1, 1, 1, 0, 0, 4519.74, 410.481, 33.8577, 2.48947, 275, 0, 0, 510, 0, 0, 0);
DELETE FROM creature_movement WHERE id =42717;
UPDATE creature_template SET MovementType=0 WHERE entry =3584;
DELETE FROM creature_movement_template WHERE entry =3584;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(3584,1,4519.230957,417.529144,33.440063,0,0,0,0,0,0,0,0,0,0,1.190926,0,0),
(3584,2,4512.455566,407.857300,33.007423,0,0,0,0,0,0,0,0,0,0,4.365510,0,0),
(3584,3,4508.820313,391.784698,33.213333,0,0,0,0,0,0,0,0,0,0,4.700872,0,0),
(3584,4,4508.804688,379.068665,33.510887,0,0,0,0,0,0,0,0,0,0,4.967903,0,0),
(3584,5,4510.121094,371.737549,32.556828,0,0,0,0,0,0,0,0,0,0,5.656689,0,0),
(3584,6,4515.750977,369.166870,32.418545,0,0,0,0,0,0,0,0,0,0,0.114134,0,0),
(3584,7,4533.650391,372.638855,32.330315,0,0,0,0,0,0,0,0,0,0,0.048941,0,0),
(3584,8,4561.888672,371.260559,31.502369,0,0,0,0,0,0,0,0,0,0,6.226099,0,0),
(3584,9,4587.557617,369.793610,31.489859,0,0,0,0,0,0,0,0,0,0,6.226099,0,0),
(3584,10,4606.408691,363.987183,31.482786,0,0,0,0,0,0,0,0,0,0,5.605645,0,0),
(3584,11,4611.415039,358.138702,31.530359,0,0,0,0,0,0,0,0,0,0,4.572849,0,0),
(3584,12,4609.736816,352.563110,31.524164,0,0,0,0,0,0,0,0,0,0,3.741901,0,0),
(3584,13,4607.202637,350.328522,31.675350,0,0,0,0,0,0,0,0,0,0,3.235322,0,0),
(3584,14,4590.898926,349.048767,35.975346,0,0,0,0,0,0,0,0,0,0,3.375123,0,0),
(3584,15,4578.678711,349.265137,39.730797,0,0,0,0,0,0,0,0,0,0,3.456019,0,0),
(3584,16,4571.161621,347.033508,42.748024,0,0,0,0,0,0,0,0,0,0,3.524349,0,0),
(3584,17,4556.167480,342.132233,47.494907,0,0,0,0,0,0,0,0,0,0,3.918380,0,0),
(3584,18,4553.874512,339.653229,48.355488,0,0,0,0,0,0,0,0,0,0,4.924476,0,0),
(3584,19,4555.426758,336.032623,48.629227,0,0,0,0,0,0,0,0,0,0,5.339161,0,0),
(3584,20,4560.783691,328.653870,50.453144,0,0,0,0,0,0,0,0,0,0,5.123174,0,0),
(3584,21,4565.415527,318.956848,53.154335,0,0,0,0,0,0,0,0,0,0,4.940963,0,0),
(3584,22,4567.048828,307.529083,54.425560,0,0,0,0,0,0,0,0,0,0,4.622093,0,0),
(3584,23,4565.214844,300.283081,55.697414,0,0,0,0,0,0,0,0,0,0,3.872040,0,0),
(3584,24,4560.484863,297.058289,57.214367,0,0,0,0,0,0,0,0,0,0,3.507935,0,0),
(3584,25,4547.601563,287.237671,57.106766,0,358401,0,0,0,0,0,0,0,0,3.541708,0,0),
(3584,26,4512.656738,284.457428,57.374947,0,0,0,0,0,0,0,0,0,0,3.593539,0,0),
(3584,27,4480.849121,267.229187,59.365849,0,0,0,0,0,0,0,0,0,0,3.423108,0,0),
(3584,28,4466.090820,263.685333,59.227402,0,358402,0,0,0,0,0,0,0,0,3.052090,0,0);
DELETE FROM creature_movement_scripts WHERE id BETWEEN 358401 AND 358402;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(358401,0,25,1,3584,5,0,0,0,0,0,0,0,0,0,0,'RUN ON'), 
(358402,0,25,0,3584,5,0,0,0,0,0,0,0,0,0,0,'RUN OFF'),
(358402,1,20,1,3584,10,0,0,0,0,0,0,0,0,0,0,'3584 - movement chenged to 0:idle'),
(358402,1,29,3,3584,20,0,0x01,0,0,0,0,0,0,0,0,'3584 - npc_flag added'),
(358402,2,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'despawn self');
UPDATE `db_script_string` SET `content_default`='It will be done, my lord.', `content_loc8`=NULL WHERE `entry`=2000000037;
UPDATE `db_script_string` SET `content_default`='I can make it the rest of the way. $N. THANKS!', `content_loc8`=NULL WHERE `entry`=2000000038;
DELETE FROM quest_start_scripts WHERE id =11108;
INSERT INTO quest_start_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(11108,0,29,3,23139,20,0,0x02,0,0,0,0,0,0,0,0,'23139 - npc_flag removed'),
(11108,1,0,0,0,0,0,0,2000000124,0,0,0,0,0,0,0,''),
(11108,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
(11108,5,3,0,12000,0,0,0,0,0,0,0,-5108.58,598.509,85.4239,2.47553,''),
(11108,18,0,1,0,0,0,0,2000000125,0,0,0,0,0,0,0,''),
(11108,18,1,22,0,0,0,0,0,0,0,0,0,0,0,0,''),
(11108,25,0,0,0,0,0,0,2000000126,0,0,0,0,0,0,0,''),
(11108,25,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
(11108,28,10,23467,88000,0,0,0,0,0,0,0,-5113.25,606.427,85.0531,5.2527,'spawn Lord Illidan'), -- spawn anim missing (ACID needed);
(11108,32,0,1,0,0,0,0,2000000127,0,0,0,0,0,0,0,''),
(11108,32,1,66,0,0,0,0,0,0,0,0,0,0,0,0,''),
(11108,37,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''), -- should kneel all the time...; 
(11108,40,0,0,0,0,0,0,2000000128,0,0,0,0,0,0,0,''),
(11108,40,1,1,0,0,0,0,0,0,0,0,0,0,0,0,''),
(11108,44,1,5,0,0,0,0,0,0,0,0,0,0,0,0,''),
(11108,48,0,0,23467,20,0,0x02,2000000737,0,0,0,0,0,0,0,'force 23467 to: say text'),
(11108,48,1,1,23467,10,0,0x02,0,0,0,0,0,0,0,0,'force 23467 to: emote'),
(11108,52,0,0,0,0,0,0,2000000129,0,0,0,0,0,0,0,''),
(11108,52,1,6,0,0,0,0,0,0,0,0,0,0,0,0,''),
(11108,55,0,0,23467,20,0,0x02,2000000738,0,0,0,0,0,0,0,'force 23467 to: say text'),
(11108,55,1,1,23467,10,0,0x02,0,0,0,0,0,0,0,0,'force 23467 to: emote'),
(11108,60,0,0,23467,20,0,0x02,2000000739,0,0,0,0,0,0,0,'force 23467 to: say text'),
(11108,60,1,1,23467,10,0,0x02,0,0,0,0,0,0,0,0,'force 23467 to: emote'),
(11108,65,0,0,23467,20,0,0x02,2000000740,0,0,0,0,0,0,0,'force 23467 to: say text'),
(11108,65,1,1,23467,10,0,0x02,0,0,0,0,0,0,0,0,'force 23467 to: emote'),
(11108,70,0,0,23467,20,0,0x02,2000000741,0,0,0,0,0,0,0,'force 23467 to: say text'),
(11108,70,1,1,23467,10,0,0x02,0,0,0,0,0,0,0,0,'force 23467 to: emote'),
(11108,71,15,41528,0,0,0,0,0,0,0,0,0,0,0,0,''),
(11108,71,6,530,0,0,0,0,0,0,0,0,-5122.05,603.562,84.678,0.0421238,''),
(11108,80,0,0,23467,20,0,0x02,2000000742,0,0,0,0,0,0,0,'force 23467 to: say text'),
(11108,80,1,1,23467,10,0,0x02,0,0,0,0,0,0,0,0,'force 23467 to: emote'),
(11108,90,0,0,23467,20,0,0x02,2000000743,0,0,0,0,0,0,0,'force 23467 to: say text'),
(11108,90,1,1,23467,10,0,0x02,0,0,0,0,0,0,0,0,'force 23467 to: emote'),
(11108,115,1,254,23467,10,0,0x02,0,0,0,0,0,0,0,0,'force 23467 to: emote'),
(11108,115,0,0,0,0,0,0,2000000130,0,0,0,0,0,0,0,''),
(11108,123,0,0,0,0,0,0,2000000131,0,0,0,0,0,0,0,''),
(11108,123,1,25,0,0,0,0,0,0,0,0,0,0,0,0,''), 
(11108,135,7,11108,0,0,0,0,0,0,0,0,0,0,0,0,''),
(11108,142,0,0,23141,30,0,0x02,2000000744,0,0,0,0,0,0,0,'force 23141 to: say text'),
(11108,147,15,6273,0,0,0,0,0,0,0,0,0,0,0,0,''),
(11108,150,15,41540,0,0,0,0,0,0,0,0,0,0,0,0,''),
(11108,150,29,3,23139,40,0,0x01,0,0,0,0,0,0,0,0,'23139 - npc_flag added'),
(11108,150,3,0,12000,0,0,0,0,0,0,0,-5085,578.657,86.6483,2,''),
(11108,163,3,0,1000,0,0,0,0,0,0,0,-5085,578.657,86.6483,2.36871,'');
REPLACE INTO db_script_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES 
(2000000737,'What is the meaning of this, Mor\'ghor?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000738,'SILENCE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000739,'Blathering idiot. You incomprehensibly incompetent buffoon...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000740,'THIS is your hero?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000741,'You have been deceived, imbecile.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000742,'This... whole... operation... HAS BEEN COMPROMISED!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000743,'I expect to see this insect\'s carcass in pieces in my lair within the hour. Fail and you will suffer a fate so much worse than death.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000744,'You will not harm the boy, Mor\'ghor! Quickly, $N, climb on my back!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
UPDATE creature_template SET gossip_menu_id=361 WHERE entry=24734;
REPLACE INTO gossip_menu (entry, text_id) VALUES (361, 838);
UPDATE creature_template SET gossip_menu_id=9111 WHERE entry=25108;
REPLACE INTO gossip_menu (entry, text_id) VALUES (9111, 12320);
UPDATE creature_template SET gossip_menu_id=9127 WHERE entry=25069;
UPDATE creature_template SET gossip_menu_id=9063 WHERE entry=25061;
REPLACE INTO gossip_menu (entry, text_id) VALUES (9127, 12340);
REPLACE INTO gossip_menu (entry, text_id) VALUES (9063, 12256);
UPDATE creature_template SET gossip_menu_id=9064 WHERE entry=25057;
UPDATE creature_template SET gossip_menu_id=9105 WHERE entry=25169;
REPLACE INTO gossip_menu (entry, text_id) VALUES (9064, 12258);
REPLACE INTO gossip_menu (entry, text_id) VALUES (9105, 12309);
UPDATE creature_template SET gossip_menu_id=9052 WHERE entry=24965;
UPDATE creature_template SET gossip_menu_id=9115 WHERE entry=25112;
REPLACE INTO gossip_menu (entry, text_id) VALUES (9115, 12323);
REPLACE INTO gossip_menu (entry, text_id) VALUES (9052, 12241);
UPDATE creature_template SET gossip_menu_id=7888 WHERE entry=19015;
UPDATE creature_template SET gossip_menu_id=9050 WHERE entry=24975;
UPDATE creature_template SET gossip_menu_id=9087 WHERE entry=25046;
UPDATE creature_template SET gossip_menu_id=9126 WHERE entry=25032;
UPDATE creature_template SET gossip_menu_id=9198 WHERE entry=25950;
REPLACE INTO gossip_menu (entry, text_id) VALUES (9050, 12237);
REPLACE INTO gossip_menu (entry, text_id) VALUES (9087, 12286);
REPLACE INTO gossip_menu (entry, text_id) VALUES (9126, 12338);
REPLACE INTO gossip_menu (entry, text_id) VALUES (9198, 12497);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(9050, 0, 1, 'I want to browse your goods.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9087, 0, 1, 'I want to browse your goods.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9126, 0, 1, 'I want to browse your goods.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9198, 0, 1, 'I want to browse your goods.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE creature_template SET gossip_menu_id=7817 WHERE entry=18749;
UPDATE creature SET MovementType =2, spawndist =0 WHERE guid =71531;
DELETE FROM creature_movement WHERE id =71531;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(71531,1,-411.535004,1526.661865,19.769915,8000,0,0,0,0,0,0,0,0,0,1.665648,0,0),
(71531,2,-410.567261,1511.668823,19.768469,0,0,0,0,0,0,0,0,0,0,5.734002,0,0),
(71531,3,-405.984619,1510.651978,19.770836,0,0,0,0,0,0,0,0,0,0,6.244507,0,0),
(71531,4,-398.266327,1509.927246,18.868746,0,0,0,0,0,0,0,0,0,0,5.236845,0,0),
(71531,5,-397.206757,1505.541504,19.770813,8000,0,0,0,0,0,0,0,0,0,4.731056,0,0),
(71531,6,-397.345581,1510.765747,18.868782,0,0,0,0,0,0,0,0,0,0,3.110781,0,0),
(71531,7,-410.945068,1510.723267,19.769274,0,0,0,0,0,0,0,0,0,0,2.202073,0,0),
(71531,8,-411.469086,1517.479004,19.769274,0,0,0,0,0,0,0,0,0,0,1.634225,0,0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(53334, 7046, 0, 1, 1, 0, 0, -8342.42, -985.418, 183.41, 5.5862, 500, 10, 0, 3374, 0, 0, 1),
(18533, 7046, 0, 1, 1, 0, 0, -8055.33, -777.452, 131.311, 2.8381, 500, 0, 0, 3374, 0, 0, 2);
DELETE FROM creature_movement WHERE id =18533;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(18533,1,-8086.620117,-775.126404,131.652908,0,0,0,0,0,0,0,0,0,0,3.177157,0,0),
(18533,2,-8110.073730,-773.378540,131.266373,0,0,0,0,0,0,0,0,0,0,3.286329,0,0),
(18533,3,-8148.431641,-775.719604,129.124344,0,0,0,0,0,0,0,0,0,0,3.194458,0,0),
(18533,4,-8176.274414,-772.494812,125.801186,0,0,0,0,0,0,0,0,0,0,4.045829,0,0),
(18533,5,-8183.855957,-789.497253,128.930984,0,0,0,0,0,0,0,0,0,0,4.345068,0,0),
(18533,6,-8187.551758,-808.887146,129.815704,0,0,0,0,0,0,0,0,0,0,4.533561,0,0),
(18533,7,-8191.507324,-845.639099,131.319199,0,0,0,0,0,0,0,0,0,0,4.619959,0,0),
(18533,8,-8190.327148,-863.342163,131.988174,0,0,0,0,0,0,0,0,0,0,4.937254,0,0),
(18533,9,-8187.399414,-891.661926,132.915833,0,0,0,0,0,0,0,0,0,0,4.525711,0,0),
(18533,10,-8199.707031,-944.993042,133.562973,0,0,0,0,0,0,0,0,0,0,4.832025,0,0),
(18533,11,-8192.185547,-971.153931,134.172623,0,0,0,0,0,0,0,0,0,0,4.369428,0,0),
(18533,12,-8202.662109,-991.910339,142.708084,0,0,0,0,0,0,0,0,0,0,3.987730,0,0),
(18533,13,-8219.370117,-1013.947449,146.032059,0,0,0,0,0,0,0,0,0,0,4.447183,0,0),
(18533,14,-8249.361328,-1074.177246,143.306992,0,0,0,0,0,0,0,0,0,0,4.117319,0,0),
(18533,15,-8270.126953,-1105.832642,144.593979,0,0,0,0,0,0,0,0,0,0,4.439331,0,0),
(18533,16,-8272.521484,-1124.024536,147.210693,0,0,0,0,0,0,0,0,0,0,5.122618,0,0),
(18533,17,-8264.153320,-1136.061035,145.519104,0,0,0,0,0,0,0,0,0,0,5.417136,0,0),
(18533,18,-8254.407227,-1140.797852,145.576065,0,0,0,0,0,0,0,0,0,0,5.904078,0,0),
(18533,19,-8245.886719,-1145.225708,145.467941,0,0,0,0,0,0,0,0,0,0,4.859507,0,0),
(18533,20,-8239.940430,-1158.397949,144.186966,0,0,0,0,0,0,0,0,0,0,5.134395,0,0),
(18533,21,-8236.834961,-1173.593384,142.618164,10000,0,0,0,0,0,0,0,0,0,4.557133,0,0),
(18533,22,-8240.801758,-1192.994873,142.557190,0,0,0,0,0,0,0,0,0,0,4.545349,0,0),
(18533,23,-8243.348633,-1210.685547,142.557190,0,0,0,0,0,0,0,0,0,0,4.857151,0,0),
(18533,24,-8239.961914,-1232.372314,142.557190,0,0,0,0,0,0,0,0,0,0,5.072542,0,0),
(18533,25,-8236.131836,-1238.948730,142.557190,0,0,0,0,0,0,0,0,0,0,5.280668,0,0),
(18533,26,-8228.038086,-1245.412231,142.557190,0,0,0,0,0,0,0,0,0,0,6.071556,0,0),
(18533,27,-8212.964844,-1246.510132,142.557190,0,0,0,0,0,0,0,0,0,0,0.069537,0,0),
(18533,28,-8202.294922,-1241.772827,142.557190,0,0,0,0,0,0,0,0,0,0,0.748906,0,0),
(18533,29,-8192.313477,-1233.143311,140.221924,0,0,0,0,0,0,0,0,0,0,0.708619,0,0),
(18533,30,-8173.321289,-1220.178833,139.775620,0,0,0,0,0,0,0,0,0,0,1.340203,0,0),
(18533,31,-8170.199219,-1201.872314,140.714157,0,0,0,0,0,0,0,0,0,0,1.553467,0,0),
(18533,32,-8169.882324,-1176.632446,139.527786,0,0,0,0,0,0,0,0,0,0,1.561321,0,0),
(18533,33,-8161.087891,-1155.040771,139.103592,0,0,0,0,0,0,0,0,0,0,1.188257,0,0),
(18533,34,-8152.128418,-1124.671143,136.424896,0,0,0,0,0,0,0,0,0,0,1.455293,0,0),
(18533,35,-8148.317383,-1091.823486,133.985825,0,0,0,0,0,0,0,0,0,0,1.455293,0,0),
(18533,36,-8147.701660,-1064.808716,132.422546,0,0,0,0,0,0,0,0,0,0,1.718401,0,0),
(18533,37,-8154.354492,-1037.246582,134.918289,0,0,0,0,0,0,0,0,0,0,1.871554,0,0),
(18533,38,-8163.104980,-1017.010254,134.520004,0,0,0,0,0,0,0,0,0,0,2.012925,0,0),
(18533,39,-8174.620605,-994.825867,135.710403,0,0,0,0,0,0,0,0,0,0,2.063976,0,0),
(18533,40,-8188.728516,-968.577942,134.070755,0,0,0,0,0,0,0,0,0,0,2.063976,0,0),
(18533,41,-8194.696289,-945.956482,133.776260,0,0,0,0,0,0,0,0,0,0,1.730182,0,0),
(18533,42,-8193.266602,-919.078308,132.860306,0,0,0,0,0,0,0,0,0,0,1.486708,0,0),
(18533,43,-8190.548340,-886.826172,132.894485,0,0,0,0,0,0,0,0,0,0,1.486708,0,0),
(18533,44,-8188.512207,-863.197815,131.951706,0,0,0,0,0,0,0,0,0,0,1.482781,0,0),
(18533,45,-8193.900391,-847.401672,131.654312,0,0,0,0,0,0,0,0,0,0,1.930459,0,0),
(18533,46,-8190.060547,-833.532715,129.844711,0,0,0,0,0,0,0,0,0,0,1.243235,0,0),
(18533,47,-8181.791992,-818.111816,129.523682,0,0,0,0,0,0,0,0,0,0,0.960491,0,0),
(18533,48,-8163.118164,-791.536194,129.945190,0,0,0,0,0,0,0,0,0,0,0.834828,0,0),
(18533,49,-8149.748047,-780.054565,129.161575,0,0,0,0,0,0,0,0,0,0,0.548157,0,0),
(18533,50,-8130.574707,-772.343811,130.217499,0,0,0,0,0,0,0,0,0,0,0.375370,0,0),
(18533,51,-8110.000977,-770.394897,131.819260,0,0,0,0,0,0,0,0,0,0,6.246222,0,0),
(18533,52,-8085.464844,-770.881165,131.677322,0,0,0,0,0,0,0,0,0,0,6.128413,0,0),
(18533,53,-8058.931152,-776.806396,131.300537,0,0,0,0,0,0,0,0,0,0,6.038095,0,0),
(18533,54,-8025.802734,-782.507141,129.207504,0,0,0,0,0,0,0,0,0,0,6.155902,0,0),
(18533,55,-8016.106445,-783.642761,128.347946,0,0,0,0,0,0,0,0,0,0,0.167239,0,0),
(18533,56,-7989.696289,-779.664307,125.212257,0,0,0,0,0,0,0,0,0,0,0.072991,0,0),
(18533,57,-7984.610840,-780.710205,125.062645,0,0,0,0,0,0,0,0,0,0,5.881013,0,0),
(18533,58,-7980.229492,-785.275085,125.198174,0,0,0,0,0,0,0,0,0,0,5.064199,0,0),
(18533,59,-7979.303223,-790.620972,125.554955,0,0,0,0,0,0,0,0,0,0,4.647943,0,0),
(18533,60,-7985.024414,-813.502686,128.772903,0,0,0,0,0,0,0,0,0,0,4.455523,0,0),
(18533,61,-7990.128418,-821.285706,130.294815,0,0,0,0,0,0,0,0,0,0,4.066755,0,0),
(18533,62,-7995.506836,-824.858582,131.461121,0,0,0,0,0,0,0,0,0,0,3.430583,0,0),
(18533,63,-8001.534668,-825.366089,132.451279,0,0,0,0,0,0,0,0,0,0,2.798337,0,0),
(18533,64,-8012.029785,-819.431580,133.167816,0,0,0,0,0,0,0,0,0,0,2.468469,0,0),
(18533,65,-8022.267578,-808.576904,132.803024,0,0,0,0,0,0,0,0,0,0,2.291755,0,0),
(18533,66,-8035.145508,-793.922241,131.780991,0,0,0,0,0,0,0,0,0,0,2.291755,0,0),
(18533,67,-8049.646973,-778.053528,131.064331,0,0,0,0,0,0,0,0,0,0,2.531301,0,0);
DELETE FROM `creature` WHERE `guid` = 6589;
DELETE FROM `creature` WHERE `guid` = 6594;
DELETE FROM `creature` WHERE `guid` = 6638;
DELETE FROM `creature` WHERE `guid` = 6659;
DELETE FROM `creature` WHERE `guid` = 6748;
DELETE FROM `creature` WHERE `guid` = 6766;
DELETE FROM `creature` WHERE `guid` = 6773;
DELETE FROM `creature` WHERE `guid` = 6775;
DELETE FROM `creature` WHERE `guid` = 6793;
DELETE FROM `creature` WHERE `guid` = 6795;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(6469, 7044, 0, 1, 1, 0, 0, -8143.2, -2888.34, 135.543, 2.7803, 500, 0, 0, 2964, 0, 0, 2),
(6496, 7044, 0, 1, 1, 0, 0, -7587, -2753.57, 133.237, 4.64548, 500, 0, 0, 2964, 0, 0, 2),
(6527, 7044, 0, 1, 1, 0, 0, -7887.52, -2901.16, 133.264, 0.286463, 500, 0, 0, 2964, 0, 0, 2);
DELETE FROM creature_movement WHERE id =6469;
DELETE FROM creature_movement WHERE id =6496;
DELETE FROM creature_movement WHERE id =6527;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(6527, 1, -7887.52, -2901.83, 133.315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 2, -7904.57, -2902.71, 133.755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 3, -7937.02, -2904.86, 132.602, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 4, -7977.45, -2901.48, 134.907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 5, -8002.48, -2918.63, 135.621, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 6, -8020.77, -2922.13, 132.556, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 7, -8040.16, -2922.81, 133.084, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 8, -8060.55, -2922.08, 135.276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 9, -8069.98, -2903.44, 133.912, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 10, -8077.13, -2868.77, 139.619, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 11, -8019.29, -2874.49, 135.584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 12, -7995.48, -2879.11, 136.263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 13, -7965.53, -2886.95, 135.314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 14, -7944.04, -2881.33, 136.275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 15, -7921.68, -2874.33, 135.123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 16, -7905.97, -2889.25, 134.633, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6527, 17, -7892.15, -2898.02, 134.113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 1, -7587.71, -2753.68, 133.177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 2, -7598.58, -2772.81, 133.401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 3, -7611.69, -2795.86, 133.625, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 4, -7631.85, -2831.3, 133.494, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 5, -7645.65, -2870.67, 135.292, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 6, -7657.31, -2892.75, 134.415, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 7, -7679.54, -2910.96, 133.451, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 8, -7699.81, -2921.18, 132.51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 9, -7725.8, -2911.88, 133.441, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 10, -7731.43, -2901.38, 133.079, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 11, -7724.99, -2890.05, 131.849, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 12, -7700.2, -2870.91, 133.438, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 13, -7658.22, -2837.32, 133.63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 14, -7634.87, -2807.44, 134.014, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 15, -7630.23, -2786.38, 135.317, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 16, -7614.07, -2775.65, 133.969, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6496, 17, -7595.53, -2759.98, 133.383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6469, 1, -8153.3, -2874.13, 135.436, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.96597, 0, 0),
(6469, 2, -8173.46, -2839.14, 134.98, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.83246, 0, 0),
(6469, 3, -8180.89, -2814.9, 137.014, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.86608, 0, 0),
(6469, 4, -8187.5, -2778.63, 136.857, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.68151, 0, 0),
(6469, 5, -8185.32, -2756.38, 135.924, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.43629, 0, 0),
(6469, 6, -8180.05, -2728.25, 136.828, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.29492, 0, 0),
(6469, 7, -8173.73, -2709.68, 135.751, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.25957, 0, 0),
(6469, 8, -8171.51, -2694.18, 134.422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.5973, 0, 0),
(6469, 9, -8179.31, -2681.29, 133.785, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.41018, 0, 0),
(6469, 10, -8197.54, -2667.88, 135.563, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.84928, 0, 0),
(6469, 11, -8209.85, -2667.54, 135.958, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.25376, 0, 0),
(6469, 12, -8222.87, -2677.79, 135.297, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.99892, 0, 0),
(6469, 13, -8228.39, -2687.87, 134.783, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.34056, 0, 0),
(6469, 14, -8230.31, -2701.77, 134.818, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.83222, 0, 0),
(6469, 15, -8227.13, -2721.26, 134.608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.88327, 0, 0),
(6469, 16, -8223.57, -2741.88, 134.794, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.88327, 0, 0),
(6469, 17, -8220.71, -2759.39, 136.797, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.01286, 0, 0),
(6469, 18, -8216.1, -2771.61, 137.482, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.21313, 0, 0),
(6469, 19, -8203.16, -2790.85, 137.323, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.33094, 0, 0),
(6469, 20, -8186.23, -2828.33, 137.181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.12673, 0, 0),
(6469, 21, -8164.35, -2888.01, 133.985, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.77141, 0, 0),
(6469, 22, -8166.43, -2929.01, 133.334, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.56328, 0, 0),
(6469, 23, -8170.41, -2958.3, 133.349, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.61433, 0, 0),
(6469, 24, -8163.14, -2995.35, 135.791, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.28584, 0, 0),
(6469, 25, -8148.71, -3012.72, 134.425, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.72095, 0, 0),
(6469, 26, -8141.62, -3015.69, 134.422, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6.14663, 0, 0),
(6469, 27, -8131.51, -3016.78, 134.423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.30955, 0, 0),
(6469, 28, -8119.16, -3011.6, 134.491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.646486, 0, 0),
(6469, 29, -8104.84, -3000.31, 134.754, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.681829, 0, 0),
(6469, 30, -8093.87, -2990.69, 134.723, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.897814, 0, 0),
(6469, 31, -8077.5, -2969.51, 134.486, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.925303, 0, 0),
(6469, 32, -8066.4, -2959.89, 134.769, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.685757, 0, 0),
(6469, 33, -8059.79, -2953.8, 135.33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.23392, 0, 0),
(6469, 34, -8055.65, -2938.94, 135.143, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.82925, 0, 0),
(6469, 35, -8061.08, -2924.45, 135.34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.23858, 0, 0),
(6469, 36, -8093.47, -2899.57, 134.066, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.61557, 0, 0),
(6469, 37, -8110.15, -2896.43, 134.398, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.93366, 0, 0),
(6469, 38, -8134.7, -2887.86, 135.774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.41529, 0, 0);
DELETE FROM `creature` WHERE `guid` = 6812;
DELETE FROM `creature` WHERE `guid` = 6821;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(6751, 8964, 0, 1, 1, 0, 0, -7686.98, -1121.87, 287.51, 4.70997, 900, 0, 0, 6645, 0, 0, 2),
(6809, 8964, 0, 1, 1, 0, 0, -7562.28, -1120.6, 306.937, 4.37475, 900, 0, 0, 6645, 0, 0, 2);
DELETE FROM creature_movement WHERE id =6751;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(6751,1,-7682.419434,-1139.717163,290.120544,0,0,0,0,0,0,0,0,0,0,5.542560,0,0),
(6751,2,-7667.471191,-1158.277466,293.115143,0,0,0,0,0,0,0,0,0,0,5.741265,0,0),
(6751,3,-7620.151367,-1202.644409,294.141357,0,0,0,0,0,0,0,0,0,0,0.065179,0,0),
(6751,4,-7579.832031,-1203.193848,295.948303,0,0,0,0,0,0,0,0,0,0,0.349493,0,0),
(6751,5,-7548.394531,-1191.723877,291.223572,0,0,0,0,0,0,0,0,0,0,0.578044,0,0),
(6751,6,-7518.044434,-1173.715820,285.622742,0,0,0,0,0,0,0,0,0,0,1.031219,0,0),
(6751,7,-7502.417969,-1148.823364,283.536102,0,0,0,0,0,0,0,0,0,0,1.323388,0,0),
(6751,8,-7498.728027,-1116.375977,281.746887,0,0,0,0,0,0,0,0,0,0,1.782846,0,0),
(6751,9,-7506.532227,-1085.590454,290.476166,0,0,0,0,0,0,0,0,0,0,2.015325,0,0),
(6751,10,-7519.973145,-1048.825684,288.985870,0,0,0,0,0,0,0,0,0,0,2.351475,0,0),
(6751,11,-7554.224609,-1021.561890,294.023743,0,0,0,0,0,0,0,0,0,0,2.786585,0,0),
(6751,12,-7589.068848,-1020.711121,292.664886,0,0,0,0,0,0,0,0,0,0,3.471453,0,0),
(6751,13,-7612.987305,-1028.649048,285.319397,0,0,0,0,0,0,0,0,0,0,3.804462,0,0),
(6751,14,-7635.766113,-1050.280029,294.725616,0,0,0,0,0,0,0,0,0,0,4.423356,0,0),
(6751,15,-7673.547852,-1074.890869,291.274200,0,0,0,0,0,0,0,0,0,0,4.763425,0,0),
(6751,16,-7672.183105,-1122.793945,288.217224,0,0,0,0,0,0,0,0,0,0,5.131773,0,0),
(6751,17,-7656.216309,-1159.517944,321.283325,0,0,0,0,0,0,0,0,0,0,5.738093,0,0);
DELETE FROM creature_movement WHERE id =6809;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(6809,1,-7563.273438,-1127.953247,311.226379,0,0,0,0,0,0,0,0,0,0,3.114915,0,0),
(6809,2,-7593.496094,-1135.776978,306.465668,0,0,0,0,0,0,0,0,0,0,2.675092,0,0),
(6809,3,-7602.822266,-1131.379517,304.650085,0,0,0,0,0,0,0,0,0,0,3.280634,0,0),
(6809,4,-7613.586914,-1134.620728,303.177094,0,0,0,0,0,0,0,0,0,0,3.429859,0,0),
(6809,5,-7619.845215,-1137.958496,301.537964,0,0,0,0,0,0,0,0,0,0,2.313808,0,0),
(6809,6,-7628.595215,-1133.894165,299.233276,0,0,0,0,0,0,0,0,0,0,2.039704,0,0),
(6809,7,-7639.815430,-1126.926636,308.131409,0,0,0,0,0,0,0,0,0,0,1.112934,0,0),
(6809,8,-7638.557129,-1115.165771,308.690277,0,0,0,0,0,0,0,0,0,0,0.622054,0,0),
(6809,9,-7628.140625,-1104.623779,297.551025,0,0,0,0,0,0,0,0,0,0,0.571731,0,0),
(6809,10,-7614.627930,-1086.770996,294.469177,0,0,0,0,0,0,0,0,0,0,0.096565,0,0),
(6809,11,-7595.332520,-1082.728516,301.069275,0,0,0,0,0,0,0,0,0,0,5.754574,0,0),
(6809,12,-7562.574707,-1093.496582,309.158783,0,0,0,0,0,0,0,0,0,0,4.153158,0,0),
(6809,13,-7572.640137,-1107.931030,304.962280,0,0,0,0,0,0,0,0,0,0,3.707840,0,0),
(6809,14,-7580.027832,-1111.902100,311.149811,0,0,0,0,0,0,0,0,0,0,3.634797,0,0),
(6809,15,-7593.734375,-1118.027466,308.061707,0,0,0,0,0,0,0,0,0,0,3.875130,0,0),
(6809,16,-7606.640625,-1133.207275,302.427185,0,0,0,0,0,0,0,0,0,0,3.677209,0,0),
(6809,17,-7621.479004,-1134.391602,299.434143,0,0,0,0,0,0,0,0,0,0,2.923227,0,0),
(6809,18,-7628.450195,-1127.853516,318.811218,0,0,0,0,0,0,0,0,0,0,2.020019,0,0),
(6809,19,-7626.373535,-1107.105225,312.316559,0,0,0,0,0,0,0,0,0,0,1.031202,0,0),
(6809,20,-7611.946777,-1089.722412,316.947052,0,0,0,0,0,0,0,0,0,0,0.589808,0,0),
(6809,21,-7594.472168,-1082.229248,327.068268,0,0,0,0,0,0,0,0,0,0,5.327334,0,0);
DELETE FROM `creature` WHERE `guid` = 6482;
DELETE FROM `creature` WHERE `guid` = 6495;
DELETE FROM `creature` WHERE `guid` = 6524;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(6477, 14388, 0, 1, 1, 0, 0, -8150, -540, 200.85, 1.866, 430, 0, 0, 3322, 0, 0, 2);
DELETE FROM creature_movement WHERE id =6477;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(6477,1,-8155.341797,-522.864746,200.452225,0,0,0,0,0,0,0,0,0,0,2.100823,0,0),
(6477,2,-8166.093262,-510.075409,202.344910,0,0,0,0,0,0,0,0,0,0,1.993224,0,0),
(6477,3,-8169.655273,-502.598267,200.659500,0,0,0,0,0,0,0,0,0,0,2.400061,0,0),
(6477,4,-8178.066895,-497.835266,200.167679,0,0,0,0,0,0,0,0,0,0,2.930990,0,0),
(6477,5,-8186.220215,-498.525574,199.483261,0,0,0,0,0,0,0,0,0,0,3.443070,0,0),
(6477,6,-8195.250000,-501.355164,199.025787,0,0,0,0,0,0,0,0,0,0,3.667694,0,0),
(6477,7,-8200.072266,-504.222565,198.899292,0,0,0,0,0,0,0,0,0,0,4.126367,0,0),
(6477,8,-8203.391602,-512.750488,199.670441,0,0,0,0,0,0,0,0,0,0,4.769608,0,0),
(6477,9,-8199.357422,-524.386047,200.328934,0,0,0,0,0,0,0,0,0,0,5.163093,0,0),
(6477,10,-8188.878906,-541.613098,199.787247,0,0,0,0,0,0,0,0,0,0,5.213360,0,0),
(6477,11,-8179.262207,-551.732117,199.891693,0,0,0,0,0,0,0,0,0,0,5.097118,0,0),
(6477,12,-8177.944824,-556.196899,199.939713,0,0,0,0,0,0,0,0,0,0,4.466454,0,0),
(6477,13,-8183.082520,-570.314575,200.279633,0,0,0,0,0,0,0,0,0,0,4.625894,0,0),
(6477,14,-8182.242188,-582.372559,200.449921,0,0,0,0,0,0,0,0,0,0,5.066495,0,0),
(6477,15,-8179.322754,-601.886536,200.002472,0,0,0,0,0,0,0,0,0,0,4.900780,0,0),
(6477,16,-8175.931152,-619.675110,200.348175,0,0,0,0,0,0,0,0,0,0,4.900780,0,0),
(6477,17,-8168.956543,-624.981873,199.968918,0,0,0,0,0,0,0,0,0,0,5.840116,0,0),
(6477,18,-8161.550293,-625.940674,199.943161,0,0,0,0,0,0,0,0,0,0,0.169541,0,0),
(6477,19,-8152.820313,-622.463196,199.902283,0,0,0,0,0,0,0,0,0,0,0.809641,0,0),
(6477,20,-8149.236816,-613.010986,199.761581,0,0,0,0,0,0,0,0,0,0,1.245537,0,0),
(6477,21,-8145.275391,-602.236084,200.101608,0,0,0,0,0,0,0,0,0,0,1.092385,0,0),
(6477,22,-8140.277344,-592.598022,202.015961,0,0,0,0,0,0,0,0,0,0,0.988712,0,0),
(6477,23,-8133.604980,-582.307373,200.452087,0,0,0,0,0,0,0,0,0,0,1.540847,0,0),
(6477,24,-8133.604980,-582.307373,200.452087,0,0,0,0,0,0,0,0,0,0,1.540847,0,0),
(6477,25,-8141.006836,-567.152405,200.486115,0,0,0,0,0,0,0,0,0,0,1.875427,0,0),
(6477,26,-8149.025879,-542.259338,200.613174,0,0,0,0,0,0,0,0,0,0,1.793748,0,0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(3695, 572, 0, 1, 1, 0, 0, -10084.3, 1558.13, 41.064, 3.65463, 72000, 5, 0, 404, 456, 0, 1),
(126879, 572, 0, 1, 1, 0, 0, -11277.3, 1021.93, 94.7337, 5.18302, 72000, 0, 0, 404, 456, 0, 2);
DELETE FROM creature_movement WHERE id =126879;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES
(126879,1,-11257.083984,988.193298,83.333633,0,0,0,0,0,0,0,0,0,0,5.691633,0,0),
(126879,2,-11244.374023,962.303589,83.268967,0,0,0,0,0,0,0,0,0,0,5.057828,0,0),
(126879,3,-11240.503906,948.932190,75.621887,0,0,0,0,0,0,0,0,0,0,5.309946,0,0),
(126879,4,-11212.638672,921.358337,54.390621,0,0,0,0,0,0,0,0,0,0,5.101033,0,0),
(126879,5,-11194.571289,895.301819,48.434921,0,0,0,0,0,0,0,0,0,0,5.399480,0,0),
(126879,6,-11172.559570,876.755981,41.317257,0,0,0,0,0,0,0,0,0,0,6.030151,0,0),
(126879,7,-11146.256836,866.019714,38.482368,0,0,0,0,0,0,0,0,0,0,5.631956,0,0),
(126879,8,-11125.966797,851.422791,40.382790,0,0,0,0,0,0,0,0,0,0,5.641383,0,0),
(126879,9,-11086.842773,834.863525,40.771549,0,0,0,0,0,0,0,0,0,0,0.273191,0,0),
(126879,10,-11059.468750,846.813660,38.656860,0,0,0,0,0,0,0,0,0,0,6.257144,0,0),
(126879,11,-11039.079102,843.254517,36.393223,0,0,0,0,0,0,0,0,0,0,5.480391,0,0),
(126879,12,-11012.395508,812.002136,37.440369,0,0,0,0,0,0,0,0,0,0,5.319386,0,0),
(126879,13,-11002.748047,788.432556,36.436584,0,0,0,0,0,0,0,0,0,0,5.571501,0,0),
(126879,14,-10982.679688,761.666016,43.991882,0,0,0,0,0,0,0,0,0,0,5.115180,0,0),
(126879,15,-10962.611328,736.809204,46.480606,0,0,0,0,0,0,0,0,0,0,6.213784,0,0),
(126879,16,-10913.859375,722.066284,42.726974,600000,0,0,0,0,0,0,0,0,0,5.943607,0,0),
(126879,17,-10913.859375,722.066284,42.726974,2,424,0,0,0,0,0,0,0,0,5.943607,0,0);
DELETE FROM creature_movement_scripts WHERE id =424;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(424,2,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'despawn self');
DELETE FROM gossip_scripts WHERE id IN (5382, 5381, 35);
INSERT INTO gossip_scripts (id, command, datalong, datalong2, comments) VALUES
(5381, 15,  10843, 0, 'Heavy Mageweave Bandage'),
(5382, 15,  18631, 0, 'Runecloth Bandages'),
(35, 15,  18632, 0, 'Heavy Runecloth Bandages');
DELETE FROM gossip_menu_option WHERE menu_id in (5381,5382);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(5381, 0, 0, 'Teach me how to create and apply a Heavy Mageweave Bandage, Doctor.', 1, 1, -1, 0, 5381, 0, 0, '', 8, 6622, 0, 7, 129, 240, 17, 10841, 1),
(5381, 1, 0, 'Teach me how to create and apply a Runecloth Bandage, Doctor.', 1, 1, -1, 0, 5382, 0, 0, '', 8, 6622, 0, 7, 129, 260, 17, 18629, 1),
(5381, 2, 0, 'Teach me how to create and apply a Heavy Runecloth Bandage, Doctor.', 1, 1, -1, 0, 35, 0, 0, '', 8, 6622, 0, 7, 129, 290, 17, 18630, 1),
(5382, 0, 0, 'Teach me how to create and apply a Heavy Mageweave Bandage, Doctor.', 1, 1, -1, 0, 5381, 0, 0, '', 8, 6624, 0, 7, 129, 240, 17, 10841, 1),
(5382, 1, 0, 'Teach me how to create and apply a Runecloth Bandage, Doctor.', 1, 1, -1, 0, 5382, 0, 0, '', 8, 6624, 0, 7, 129, 260, 17, 18629, 1),
(5382, 2, 0, 'Teach me how to create and apply a Heavy Runecloth Bandage, Doctor.', 1, 1, -1, 0, 35, 0, 0, '', 8, 6624, 0, 7, 129, 290, 17, 18630, 1);
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 5382 AND `id` = 1;
DELETE FROM `npc_trainer` WHERE `entry` in (12920,12939);
UPDATE `creature_template` SET `npcflag`='3' WHERE `entry` in (12920,12939);
UPDATE quest_template SET DetailsEmote1=6, DetailsEmote2=1, OfferRewardEmote1=7, OfferRewardEmote2=1 WHERE entry=7025;
UPDATE creature SET spawntimesecs=600 WHERE id IN (13602);
DELETE FROM pool_template WHERE entry=14176;
INSERT INTO pool_template VALUES (14176,3,'The Deadmines - Large Battered Chests');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(20905, 75293, 36, 1, 1, -312.046, -477.501, 49.5979, -1.55334, 0, 0, -0.700908, 0.713252, 86400, 100, 1),
(25766, 75293, 36, 1, 1, -77.7409, -788.596, 26.1097, 1.16937, 0, 0, 0.551937, 0.833886, 86400, 100, 1),
(25768, 75293, 36, 1, 1, -209.206, -602.72, 19.3065, -0.139626, 0, 0, -0.0697563, 0.997564, 86400, 100, 1),
(25769, 75293, 36, 1, 1, -63.0889, -797.013, 39.0067, 1.55334, 0, 0, 0.700908, 0.713252, 86400, 100, 1),
(25771, 75293, 36, 1, 1, -300.887, -532.542, 49.4236, 0.226893, 0, 0, 0.113203, 0.993572, 86400, 100, 1),
(7486, 75293, 36, 1, 1, -155.3, -913.896, 10.2809, 0.90757, 0, 0, 0.438371, 0.898794, 86400, 100, 1),
(7487, 75293, 36, 1, 1, -121.301, -810.208, 16.9638, 1.76278, 0, 0, 0.771624, 0.636079, 86400, 100, 1);
REPLACE INTO pool_gameobject VALUES (20905,14176,0,'The Deadmines - Large Battered Chest 1');
REPLACE INTO pool_gameobject VALUES (25766,14176,0,'The Deadmines - Large Battered Chest 2');
REPLACE INTO pool_gameobject VALUES (25768,14176,0,'The Deadmines - Large Battered Chest 3');
REPLACE INTO pool_gameobject VALUES (25769,14176,0,'The Deadmines - Large Battered Chest 4');
REPLACE INTO pool_gameobject VALUES (25771,14176,0,'The Deadmines - Large Battered Chest 5');
REPLACE INTO pool_gameobject VALUES (7486,14176,0,'The Deadmines - Large Battered Chest 6');
REPLACE INTO pool_gameobject VALUES (7487,14176,0,'The Deadmines - Large Battered Chest 7');
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `guid`=71704;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(102294, 19673, 530, 1, 1, 0, 0, -3127.5, 4922.79, -98.2781, 2.44596, 6, 0, 0, 28575, 0, 0, 2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(102294, 1, -3129.8, 4926.13, -98.4561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.808878, 0, 0),
(102294, 2, -3124.58, 4931.7, -98.6768, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6.24855, 0, 0),
(102294, 3, -3110.8, 4938.22, -99.5145, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.069034, 0, 0),
(102294, 4, -3095.94, 4940.46, -99.6997, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.061178, 0, 0),
(102294, 5, -3095.94, 4940.46, -99.6997, 50000, 1967301, 0, 0, 0, 0, 0, 0, 0, 0, 0.061178, 0, 0);
DELETE FROM creature_movement_scripts WHERE id =1967301;
INSERT INTO creature_movement_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES 
(1967301,1,0,0,19676,10,0,0x02,2000000747,2000000746,2000000745,0,0,0,0,0,'Consortium Engineer force 19676 to: say random text (Mana Tombs event started)'),
(1967301,10,0,0,19672,20,0,0x02,2000000748,2000000749,0,0,0,0,0,0,'Consortium Engineer force 19672 to: say random text'),
(1967301,20,0,0,19676,10,0,0x02,2000000750,0,0,0,0,0,0,0,'Consortium Engineer force 19676 to: say text'),
(1967301,26,0,0,0,0,0,0,2000000751,2000000752,0,0,0,0,0,0,'Consortium Engineer  - say random text'),
(1967301,26,25,1,0,0,0,0,0,0,0,0,0,0,0,0,'Consortium Engineer - RUN ON'),
(1967301,27,3,0,2000,0,0,0,0,0,0,0,-3086.069824,4943.743164,-101.047249,6.106854,''),
(1967301,29,3,0,2000,0,0,0,0,0,0,0,-3068.30,4942.736328,-101.047302,6.275572,''),
(1967301,31,3,0,1000,0,0,0,0,0,0,0,-3070.30,4942.736328,-101.047302,2.97685,''),
(1967301,32,25,0,0,0,0,0,0,0,0,0,0,0,0,0,'Consortium Engineer - RUN OFF'),
(1967301,35,0,2,0,0,0,0,2000000753,0,0,0,0,0,0,0,'Consortium Engineer  - text_emote'),
(1967301,39,1,15,0,0,0,0,0,0,0,0,0,0,0,0,'Consortium Engineer - roar emote'),
(1967301,40,0,0,0,0,0,0,2000000754,0,0,0,0,0,0,0,'Consortium Engineer  - say random text'),
(1967301,43,15,5,0,0,0,0,0,0,0,0,0,0,0,0,'cast: die'),
(1967301,44,0,2,19676,35,0,0x02,2000000755,0,0,0,0,0,0,0,'Consortium Engineer force 19676 to: text_emote'),
(1967301,45,0,0,19676,35,0,0x02,2000000756,2000000757,0,0,0,0,0,0,'Consortium Engineer force 19676 to: say random text'),
(1967301,48,18,0,0,0,0,0,0,0,0,0,0,0,0,0,'despawn self (Mana Tombs event ended)');
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(2000000745, 'I can''t belive you imbeciles went to school for this! Does anybody here know what they''re doing?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000746, 'Is it done yet? What is talking so damned long?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000747, 'Is that damned thing safe to go through yet?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000748, 'Not really.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000749, 'Will you stop asking that?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000750, 'Alright, it looks safe. Get in there, engineer!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000751, 'Here goes nothing!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000752, 'This is gonna leave a mark...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000753, '%s runs his hands across his body to make sure everything is intact.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000754, 'I made it! I made it!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000755, '%s shakes his head in disapproval.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000756, 'I didn''t like him much anyway. Too much talk, not enough "do."', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000757, 'Nice going you incompetent morons! Another one of our engineers vaporized!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT IGNORE INTO `item_required_target` VALUES ('38467', '1', '28213');
UPDATE `creature_template` SET `unit_flags` = 2 WHERE `entry` = 35607;
UPDATE `creature_template` SET `unit_flags` = 2 WHERE `entry` = 35594;
UPDATE quest_template SET RequestItemsText = 'Back so soon? In case I didn\'t make myself clear we need you to kill 10 Stonesplinter Shaman and 10 Stonesplinter Bonesnappers, $N. Now go get \'em, Trogg-Slayer!' WHERE entry = 263;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(9050,0,1,'Let me browse your goods.',3,128,0,0,0,0,''),
(9087,0,1,'Let me browse your goods.',3,128,0,0,0,0,''),
(9126,0,1,'Let me browse your goods.',3,128,0,0,0,0,''),
(9198,0,1,'Let me browse your goods.',3,128,0,0,0,0,''),
(9289,0,0,'Your insight is appreciated.',1,1,9290,0,0,0,'');
DELETE FROM `spell_scripts` WHERE `id`=45071;
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('45071', '1', '16', '12318', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
UPDATE `gossip_menu_option` SET `cond_1_val_1`='2777' WHERE `menu_id`=10318 AND `id`=3;
UPDATE `gossip_menu_option` SET `cond_1_val_1`='2778' WHERE `menu_id`=10318 AND `id`=4;
UPDATE `gossip_menu_option` SET `cond_1_val_1`='2779' WHERE `menu_id`=10318 AND `id`=5;
UPDATE `gossip_menu_option` SET `cond_1_val_1`='2780' WHERE `menu_id`=10318 AND `id`=6;
UPDATE `gossip_menu_option` SET `cond_1_val_1`='2781' WHERE `menu_id`=10318 AND `id`=7;
UPDATE `gossip_menu_option` SET `cond_1_val_1`='2783' WHERE `menu_id`=10358 AND `id`=3;
UPDATE `gossip_menu_option` SET `cond_1_val_1`='2784' WHERE `menu_id`=10358 AND `id`=4;
UPDATE `gossip_menu_option` SET `cond_1_val_1`='2785' WHERE `menu_id`=10358 AND `id`=5;
UPDATE `gossip_menu_option` SET `cond_1_val_1`='2786' WHERE `menu_id`=10358 AND `id`=6;
UPDATE `gossip_menu_option` SET `cond_1_val_1`='2787' WHERE `menu_id`=10358 AND `id`=7;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(40278, 188126, 530, 1, 1, -1709.69, 5461.01, -7.92767, 1.85005, 0, 0, 0.798635, 0.601815, 180, 255, 1),
(40279, 188126, 530, 1, 1, -1745.81, 5533.84, -7.92614, -0.977383, 0, 0, -0.469471, 0.882948, 180, 255, 1),
(40274, 188127, 530, 1, 1, -1987.36, 5320.47, -6.77673, -1.23918, 0, 0, -0.580703, 0.814116, 180, 255, 1),
(40275, 188127, 530, 1, 1, -2025.81, 5396.9, -6.56243, 2.11185, 0, 0, 0.870356, 0.492424, 180, 255, 1);
DELETE FROM quest_end_scripts WHERE id =931;
INSERT INTO quest_end_scripts (id, delay, command, datalong, datalong2, datalong3, datalong4, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments) VALUES
(931,2,0,2,0,0,0,0,2000000721,0,0,0,0,0,0,0,''),
(931,2,3,0,1000,0,0,0,0,0,0,0,9508.02,715.749,1255.89,1.03055,''),
(931,3,3,0,1000,0,0,0,0,0,0,0,9507.66,718.009,1255.89,1.80417,''),
(931,4,3,0,1000,0,0,0,0,0,0,0,9505.56,719.088,1256.2,2.65632,''),
(931,6,0,0,0,0,0,0,2000000722,0,0,0,0,0,0,0,''),
(931,6,1,16,0,0,0,0,0,0,0,0,0,0,0,0,''),
(931,9,3,0,1000,0,0,0,0,0,0,0,9506.92,713.766,1255.89,0.259253,''),
(931,11,3,0,1000,0,0,0,0,0,0,0,9506.92,713.766,1255.89,0.279253,''),
(931,11,9,39594,15,0,0,0,0,0,0,0,9502.75,718.022,1255.94,5.99887,''),
(931,11,9,39592,15,0,0,0,0,0,0,0,9504.34,721.465,1255.94,5.87713,''),
(931,11,9,39593,15,0,0,0,0,0,0,0,9503.46,720.08,1255.94,5.68628,'');
DELETE FROM gameobject WHERE guid = '49657';
DELETE FROM gameobject WHERE guid = '49663';
UPDATE `creature_movement_scripts` SET `datalong`='101490' WHERE `id`=2384302 AND `delay`=4 AND `command`=9 AND `datalong`=90623;
UPDATE `creature_movement_scripts` SET `datalong`='3792' WHERE `id`=1929401 AND `delay`=5 AND `command`=9 AND `datalong`=82673;
DELETE FROM gameobject_questrelation WHERE id =269;
DELETE FROM gameobject_involvedrelation WHERE id =269;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(20960, 7856, 1, 1, 1, 0, 0, -7953.5, -5253.57, 0.694111, 3.32224, 300, 0, 0, 2138, 0, 0, 2);
DELETE FROM creature_movement WHERE id = 20960;
INSERT INTO creature_movement (id, point, position_x, position_y, position_z, waittime, script_id, textid1, textid2, textid3, textid4, textid5, emote, spell, wpguid, orientation, model1, model2) VALUES 
(20960, 1, -7955.58, -5257.35, 0.647152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20960, 2, -7946.61, -5254.11, 0.578651, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20960, 3, -7929.52, -5251.87, 0.570438, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20960, 4, -7943.27, -5254.3, 0.5747, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20960, 5, -7948.61, -5256.08, 0.62027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20960, 6, -7962.06, -5261.57, 0.624113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20960, 7, -7970.59, -5266.94, 0.608315, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20960, 8, -7986.01, -5281.18, 0.575205, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20960, 9, -7992.82, -5286.59, 0.575205, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20960, 10, -8001.21, -5286.79, 0.575205, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20960, 11, -8001.21, -5286.79, 0.575205, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20960, 12, -7986.39, -5281.76, 0.575205, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20960, 13, -7978.44, -5275.57, 0.576416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20960, 14, -7960.76, -5260.08, 0.623071, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `gameobject` WHERE `guid` = 28562;
DELETE FROM `gameobject` WHERE `guid` = 28572;
DELETE FROM `gameobject` WHERE `guid` = 28564;
DELETE FROM `gameobject` WHERE `guid` = 28563;
DELETE FROM `gameobject` WHERE `guid` = 28575;
DELETE FROM `gameobject` WHERE `guid` = 28566;
DELETE FROM `gameobject` WHERE `guid` = 28571;
DELETE FROM `gameobject` WHERE `guid` = 28573;
DELETE FROM `gameobject` WHERE `guid` = 28569;
DELETE FROM `gameobject` WHERE `guid` = 28570;
DELETE FROM `gameobject` WHERE `guid` = 28561;
DELETE FROM `gameobject` WHERE `guid` = 28565;
DELETE FROM `gameobject` WHERE `guid` = 28568;
DELETE FROM `gameobject` WHERE `guid` = 28574;
DELETE FROM `gameobject` WHERE `guid` = 28567;
DELETE FROM `gameobject` WHERE `guid` = 28577;
DELETE FROM `gameobject` WHERE `guid` = 28581;
DELETE FROM `gameobject` WHERE `guid` = 28582;
DELETE FROM `gameobject` WHERE `guid` = 28576;
DELETE FROM `gameobject` WHERE `guid` = 28578;
DELETE FROM `gameobject` WHERE `guid` = 28580;
DELETE FROM `gameobject` WHERE `guid` = 28584;
DELETE FROM `gameobject` WHERE `guid` = 28583;
DELETE FROM `gameobject` WHERE `guid` = 28585;
DELETE FROM `gameobject` WHERE `guid` = 28579;
DELETE FROM `gameobject` WHERE `guid` = 28586;
DELETE FROM `gameobject` WHERE `guid` = 28591;
DELETE FROM `gameobject` WHERE `guid` = 28593;
DELETE FROM `gameobject` WHERE `guid` = 28594;
DELETE FROM `gameobject` WHERE `guid` = 28589;
DELETE FROM `gameobject` WHERE `guid` = 28595;
DELETE FROM `gameobject` WHERE `guid` = 28590;
DELETE FROM `gameobject` WHERE `guid` = 28588;
DELETE FROM `gameobject` WHERE `guid` = 28587;
DELETE FROM `gameobject` WHERE `guid` = 28592;
DELETE FROM `gameobject` WHERE `guid` = 28601;
DELETE FROM `gameobject` WHERE `guid` = 28596;
DELETE FROM `gameobject` WHERE `guid` = 28603;
DELETE FROM `gameobject` WHERE `guid` = 28604;
DELETE FROM `gameobject` WHERE `guid` = 28600;
DELETE FROM `gameobject` WHERE `guid` = 28605;
DELETE FROM `gameobject` WHERE `guid` = 28602;
DELETE FROM `gameobject` WHERE `guid` = 28599;
DELETE FROM `creature` WHERE `guid` = 7209;
DELETE FROM `creature_loot_template` WHERE `item` = 4278;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 68865 AND `item` = 5897;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 21277 AND `item` = 5897;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='75',`maxcount`='2' WHERE `item`=13545;
UPDATE `gameobject_template` SET `faction`='35', `flags`='6', `data1`='105176' WHERE `entry`=105176;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('105176', '7389', '-100', '0', '1', '1', '0', '0', '0');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
('14180', '1', 'Shellfish Trap 1+2'),
('14181', '1', 'Shellfish Trap 1+2'),
('14182', '1', 'Shellfish Trap 1+2'),
('14183', '1', 'Shellfish Trap 1+2'),
('14184', '1', 'Shellfish Trap 1+2'),
('14185', '1', 'Shellfish Trap 1+2'),
('14186', '1', 'Shellfish Trap 1+2'),
('14187', '1', 'Shellfish Trap 1+2'),
('14188', '1', 'Shellfish Trap 1+2'),
('14189', '1', 'Shellfish Trap 1+2'),
('14190', '1', 'Shellfish Trap 1+2'),
('14191', '1', 'Shellfish Trap 1+2'),
('14192', '1', 'Shellfish Trap 1+2'),
('14193', '1', 'Shellfish Trap 1+2'),
('14194', '1', 'Shellfish Trap 1+2'),
('14195', '1', 'Shellfish Trap 1+2');
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES
('7507', '14180', '0', 'Shellfish Trap 1'), ('28558', '14180', '0', 'Shellfish Trap 2'),
('7510', '14181', '0', 'Shellfish Trap 1'), ('28557', '14181', '0', 'Shellfish Trap 2'),
('7514', '14182', '0', 'Shellfish Trap 1'), ('28550', '14182', '0', 'Shellfish Trap 2'),
('1471', '14183', '0', 'Shellfish Trap 1'), ('28549', '14183', '0', 'Shellfish Trap 2'),
('7515', '14184', '0', 'Shellfish Trap 1'), ('28553', '14184', '0', 'Shellfish Trap 2'),
('7519', '14185', '0', 'Shellfish Trap 1'), ('28555', '14185', '0', 'Shellfish Trap 2'),
('7520', '14186', '0', 'Shellfish Trap 1'), ('28548', '14186', '0', 'Shellfish Trap 2'),
('7528', '14187', '0', 'Shellfish Trap 1'), ('28547', '14187', '0', 'Shellfish Trap 2'),
('7529', '14188', '0', 'Shellfish Trap 1'), ('28559', '14188', '0', 'Shellfish Trap 2'),
('7531', '14189', '0', 'Shellfish Trap 1'), ('28560', '14189', '0', 'Shellfish Trap 2'),
('7532', '14190', '0', 'Shellfish Trap 1'), ('28556', '14190', '0', 'Shellfish Trap 2'),
('66338', '14191', '0', 'Shellfish Trap 1'), ('28551', '14191', '0', 'Shellfish Trap 2'),
('7488', '14192', '0', 'Shellfish Trap 1'), ('28546', '14192', '0', 'Shellfish Trap 2'),
('7489', '14193', '0', 'Shellfish Trap 1'), ('28552', '14193', '0', 'Shellfish Trap 2'),
('7492', '14194', '0', 'Shellfish Trap 1'), ('28598', '14194', '0', 'Shellfish Trap 2'),
('7504', '14195', '0', 'Shellfish Trap 1'), ('28597', '14195', '0', 'Shellfish Trap 2');
UPDATE `gameobject_template` SET `data1`='0' WHERE `entry`=176635;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 176635;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(7507, 176582, 1, 1, 1, -1754.22, 3332.64, -43.293, 0.401426, 0, 0, 0.199368, 0.979925, 180, 100, 1),
(7510, 176582, 1, 1, 1, -1831.1, 3343.21, -44.4896, 0.244346, 0, 0, 0.121869, 0.992546, 180, 100, 1),
(7514, 176582, 1, 1, 1, -1920.99, 3326.93, -74.3969, -2.68781, 0, 0, -0.97437, 0.22495, 180, 100, 1),
(1471, 176582, 1, 1, 1, -1869.41, 3139.91, -29.0381, -0.401426, 0, 0, -0.199368, 0.979925, 180, 100, 1),
(7515, 176582, 1, 1, 1, -1860.29, 3183.45, -34.1432, 3.00197, 0, 0, 0.997564, 0.0697546, 180, 100, 1),
(7519, 176582, 1, 1, 1, -1796.36, 3300.82, -69.3038, 3.08923, 0, 0, 0.999657, 0.0261783, 180, 100, 1),
(7520, 176582, 1, 1, 1, -2005.05, 3358.99, -80.155, -1.79769, 0, 0, -0.782608, 0.622514, 180, 100, 1),
(7528, 176582, 1, 1, 1, -1861.97, 3384.48, -69.699, -0.994838, 0, 0, -0.477159, 0.878817, 180, 100, 1),
(7529, 176582, 1, 1, 1, -1834.32, 3425.38, -48.2402, -1.43117, 0, 0, -0.656059, 0.75471, 180, 100, 1),
(7531, 176582, 1, 1, 1, -2024.38, 3293.43, -43.9713, -1.25664, 0, 0, -0.587786, 0.809016, 180, 100, 1),
(7532, 176582, 1, 1, 1, -1975.23, 3193.08, -66.2544, -1.13446, 0, 0, -0.537298, 0.843393, 180, 100, 1),
(66338, 176582, 1, 1, 1, -1962.74, 3303.61, -42.876, 2.53073, 0, 0, 0.953717, 0.300705, 180, 100, 1),
(7488, 176582, 1, 1, 1, -1980.03, 3252.06, -32.7441, 0.610865, 0, 0, 0.300706, 0.953717, 180, 100, 1),
(7489, 176582, 1, 1, 1, -1799.84, 3226.16, -45.5012, -1.79769, 0, 0, -0.782608, 0.622514, 180, 100, 1),
(7492, 176582, 1, 1, 1, -1994.45, 3401.67, -80.061, -2.9147, 0, 0, -0.993572, 0.113203, 180, 100, 1),
(7504, 176582, 1, 1, 1, -1683.83, 3321.01, -44.2335, 2.14675, 0, 0, 0.878816, 0.477161, 180, 100, 1),
(28558, 176635, 1, 1, 1, -1754.22, 3332.64, -43.293, 0.401426, 0, 0, 0.199368, 0.979925, 180, 100, 1),
(28557, 176635, 1, 1, 1, -1831.1, 3343.21, -44.4896, 0.244346, 0, 0, 0.121869, 0.992546, 180, 100, 1),
(28550, 176635, 1, 1, 1, -1920.99, 3326.93, -74.3969, -2.68781, 0, 0, -0.97437, 0.22495, 180, 100, 1),
(28549, 176635, 1, 1, 1, -1869.41, 3139.91, -29.0381, -0.401426, 0, 0, -0.199368, 0.979925, 180, 100, 1),
(28553, 176635, 1, 1, 1, -1860.29, 3183.45, -34.1432, 3.00197, 0, 0, 0.997564, 0.0697546, 180, 100, 1),
(28555, 176635, 1, 1, 1, -1796.36, 3300.82, -69.3038, 3.08923, 0, 0, 0.999657, 0.0261783, 180, 100, 1),
(28548, 176635, 1, 1, 1, -2005.05, 3358.99, -80.155, -1.79769, 0, 0, -0.782608, 0.622514, 180, 100, 1),
(28547, 176635, 1, 1, 1, -1861.97, 3384.48, -69.699, -0.994838, 0, 0, -0.477159, 0.878817, 180, 100, 1),
(28559, 176635, 1, 1, 1, -1834.32, 3425.38, -48.2402, -1.43117, 0, 0, -0.656059, 0.75471, 180, 100, 1),
(28560, 176635, 1, 1, 1, -2024.38, 3293.43, -43.9713, -1.25664, 0, 0, -0.587786, 0.809016, 180, 100, 1),
(28556, 176635, 1, 1, 1, -1975.23, 3193.08, -66.2544, -1.13446, 0, 0, -0.537298, 0.843393, 180, 100, 1),
(28551, 176635, 1, 1, 1, -1962.74, 3303.61, -42.876, 2.53073, 0, 0, 0.953717, 0.300705, 180, 100, 1),
(28546, 176635, 1, 1, 1, -1980.03, 3252.06, -32.7441, 0.610865, 0, 0, 0.300706, 0.953717, 180, 100, 1),
(28552, 176635, 1, 1, 1, -1799.84, 3226.16, -45.5012, -1.79769, 0, 0, -0.782608, 0.622514, 180, 100, 1),
(28598, 176635, 1, 1, 1, -1994.45, 3401.67, -80.061, -2.9147, 0, 0, -0.993572, 0.113203, 180, 100, 1),
(28597, 176635, 1, 1, 1, -1683.83, 3321.01, -44.2335, 2.14675, 0, 0, 0.878816, 0.477161, 180, 100, 1),
(7553, 176592, 1, 1, 1, -1754.22, 3332.64, -43.293, 0.401426, 0, 0, 0.199368, 0.979925, 180, 100, 1),
(7554, 176592, 1, 1, 1, -1831.1, 3343.21, -44.4896, 0.244346, 0, 0, 0.121869, 0.992546, 180, 100, 1),
(7556, 176592, 1, 1, 1, -1920.99, 3326.93, -74.3969, -2.68781, 0, 0, -0.97437, 0.22495, 180, 100, 1),
(7557, 176592, 1, 1, 1, -1869.41, 3139.91, -29.0381, -0.401426, 0, 0, -0.199368, 0.979925, 180, 100, 1),
(7558, 176592, 1, 1, 1, -1860.29, 3183.45, -34.1432, 3.00197, 0, 0, 0.997564, 0.0697546, 180, 100, 1),
(71223, 176592, 1, 1, 1, -1796.36, 3300.82, -69.3038, 3.08923, 0, 0, 0.999657, 0.0261783, 180, 100, 1),
(71246, 176592, 1, 1, 1, -2005.05, 3358.99, -80.155, -1.79769, 0, 0, -0.782608, 0.622514, 180, 100, 1),
(71247, 176592, 1, 1, 1, -1861.97, 3384.48, -69.699, -0.994838, 0, 0, -0.477159, 0.878817, 180, 100, 1),
(44245, 176592, 1, 1, 1, -1834.32, 3425.38, -48.2402, -1.43117, 0, 0, -0.656059, 0.75471, 180, 100, 1),
(44246, 176592, 1, 1, 1, -2024.38, 3293.43, -43.9713, -1.25664, 0, 0, -0.587786, 0.809016, 180, 100, 1),
(44247, 176592, 1, 1, 1, -1975.23, 3193.08, -66.2544, -1.13446, 0, 0, -0.537298, 0.843393, 180, 100, 1),
(44248, 176592, 1, 1, 1, -1962.74, 3303.61, -42.876, 2.53073, 0, 0, 0.953717, 0.300705, 180, 100, 1),
(44249, 176592, 1, 1, 1, -1980.03, 3252.06, -32.7441, 0.610865, 0, 0, 0.300706, 0.953717, 180, 100, 1),
(44250, 176592, 1, 1, 1, -1799.84, 3226.16, -45.5012, -1.79769, 0, 0, -0.782608, 0.622514, 180, 100, 1),
(44251, 176592, 1, 1, 1, -1994.45, 3401.67, -80.061, -2.9147, 0, 0, -0.993572, 0.113203, 180, 100, 1),
(28554, 176592, 1, 1, 1, -1683.83, 3321.01, -44.2335, 2.14675, 0, 0, 0.878816, 0.477161, 180, 100, 1);
REPLACE INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `ScriptName`) VALUES
(176592, 6, 1287, 'TEMP Shellfish Trap', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17679, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(15312, 2653, 0, 1, 1, -986, -3874, 149.125, 5.489, 0, 0, 0.386739, -0.922189, 60, 255, 1),
(1603, 2653, 0, 1, 1, -989, -3852, 149.946, 5.489, 0, 0, 0.386739, -0.922189, 60, 255, 1),
(14939, 2653, 0, 1, 1, -926, -3857, 145.847, 0.037, 0, 0, 0.0184989, 0.999829, 60, 255, 1),
(15855, 2653, 0, 1, 1, -817, -3883, 144.968, 2.956, 0, 0, 0.995697, 0.0926632, 60, 255, 1),
(4347, 2653, 0, 1, 1, -883, -3979.5, 139.893, 4.69, 0, 0, 0.714978, -0.699147, 60, 255, 1),
(15080, 2653, 0, 1, 1, -884, -3912, 134.78, 5.318, 0, 0, 0.464077, -0.885795, 60, 255, 1),
(16145, 2653, 0, 1, 1, -930, -3875, 147.403, 2.463, 0, 0, 0.942989, 0.332824, 60, 255, 1),
(16826, 2653, 0, 1, 1, -968, -3890, 151.423, 5.489, 0, 0, 0.386739, -0.922189, 60, 255, 1),
(1724, 2653, 0, 1, 1, -798, -3897, 144.968, 0.587, 0, 0, 0.289304, 0.957237, 60, 255, 1),
(15590, 2653, 0, 1, 1, -931, -3953, 148.85, 3.308, 0, 0, 0.996541, -0.0831077, 60, 255, 1),
(2029, 2653, 0, 1, 1, -946.57, -3893, 154.072, 5.351, 0, 0, 0.449399, -0.893331, 60, 255, 1),
(7559, 2653, 0, 1, 1, -836, -3929, 148.626, 0.973, 0, 0, 0.467535, 0.883975, 60, 255, 1),
(7562, 2653, 0, 1, 1, -911, -3946, 151.794, 5.935, 0, 0, 0.173215, -0.984884, 60, 255, 1),
(7563, 2653, 0, 1, 1, -897, -3949, 138.035, 5.191, 0, 0, 0.519352, -0.85456, 60, 255, 1),
(7572, 2653, 0, 1, 1, -938, -3848, 148.087, 1.133, 0, 0, 0.536682, 0.843785, 60, 255, 1),
(7578, 2653, 0, 1, 1, -925, -3892, 144.599, 2.709, 0, 0, 0.976699, 0.214614, 60, 255, 1),
(7587, 2653, 0, 1, 1, -858, -3999, 146.267, 5.997, 0, 0, 0.142605, -0.98978, 60, 255, 1),
(7588, 2653, 0, 1, 1, -896, -4000, 144.195, 1.695, 0, 0, 0.749628, 0.661859, 60, 255, 1),
(7590, 2653, 0, 1, 1, -819.6, -3912.4, 145.84, 0.56, 0, 0, 0.276356, 0.961055, 60, 255, 1),
(7599, 2653, 0, 1, 1, -857.528, -3931.43, 149.044, -0.20944, 0, 0, -0.104529, 0.994522, 60, 255, 1),
(7601, 2653, 0, 1, 1, -883, -3885, 135.184, 5.9, 0, 0, 0.190423, -0.981702, 60, 255, 1),
(7602, 2653, 0, 1, 1, -854, -3930, 148.799, 0.317, 0, 0, 0.157837, 0.987465, 60, 255, 1),
(7610, 2653, 0, 1, 1, -852.465, -3889.12, 140.951, 2.4, 0, 0, 0.932039, 0.362358, 60, 255, 1),
(7611, 2653, 0, 1, 1, -882.01, -3885.88, 135.174, 2.98451, 0, 0, 0.996917, 0.0784606, 60, 255, 1),
(7613, 2653, 0, 1, 1, -842.014, -3939.07, 150.111, 1.309, 0, 0, 0.608763, 0.793352, 60, 255, 1),
(7614, 2653, 0, 1, 1, -830.497, -3885.8, 147.603, 0.087266, 0, 0, 0.0436192, 0.999048, 60, 255, 1),
(7616, 2653, 0, 1, 1, -947.561, -3927.05, 145.284, -2.23402, 0, 0, -0.898794, 0.438372, 60, 255, 1),
(7617, 2653, 0, 1, 1, -793.146, -3898.25, 145.014, 0.10472, 0, 0, 0.0523361, 0.99863, 60, 255, 1),
(7619, 2653, 0, 1, 1, -874.558, -3911.16, 134.068, -0.977384, 0, 0, -0.469471, 0.882948, 60, 255, 1),
(7620, 2653, 0, 1, 1, -942.624, -3954.16, 146.634, -0.244346, 0, 0, -0.121869, 0.992546, 60, 255, 1),
(7623, 2653, 0, 1, 1, -911.687, -3877.76, 141.116, 2.51327, 0, 0, 0.951056, 0.309019, 60, 255, 1);
UPDATE `gameobject_loot_template` SET `maxcount`='2' WHERE `entry`=1667 AND `item`=3340;
UPDATE `gameobject_loot_template` SET `maxcount`='2' WHERE `entry`=2653 AND `item`=4278;
UPDATE `gameobject_loot_template` SET `maxcount`='2' WHERE `entry`=19903 AND `item`=5833;
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
('14177', '10', 'Incendicite Mineral Vein 1'),
('14179', '20', 'Lesser Bloodstone Ore'),
('14178', '10', 'Incendicite Mineral Vein 2');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES
('1610', '14177', '0', 'Incendicite Mineral Vein 1'),
('2653', '14179', '0', 'Lesser Bloodstone Ore'),
('1667', '14178', '0', 'Incendicite Mineral Vein 2');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(9304, 1610, 0, 1, 1, -3920, -2278, 40.389, 2.61, 0, 0, 0.964884, 0.262678, 60, 255, 1),
(8091, 1667, 0, 1, 1, -3813.83, -2279.43, 33.753, -2.1293, 0, 0, -0.874619, 0.48481, 60, 255, 1),
(8537, 1610, 0, 1, 1, -3837.11, -2527.33, 38.9886, -1.09956, 0, 0, -0.5225, 0.852639, 60, 255, 1),
(8865, 1667, 0, 1, 1, -3863.12, -2476.62, 41.4935, -0.069813, 0, 0, -0.0348994, 0.999391, 60, 255, 1),
(8819, 1610, 0, 1, 1, -3864.54, -2323.02, 44.058, 1.0821, 0, 0, 0.515036, 0.857168, 60, 255, 1),
(8637, 1667, 0, 1, 1, -3805.75, -2471.3, 27.4686, -0.785398, 0, 0, -0.382683, 0.92388, 60, 255, 1),
(8653, 1610, 0, 1, 1, -3768, -2464, 27.379, 4.378, 0, 0, 0.814921, -0.579572, 60, 255, 1),
(8395, 1667, 0, 1, 1, -3756, -2442, 32.318, 5.26, 0, 0, 0.489567, -0.871966, 60, 255, 1),
(8312, 1610, 0, 1, 1, -3838, -2483, 36.203, 3.624, 0, 0, 0.971051, -0.238872, 60, 255, 1),
(8232, 1667, 0, 1, 1, -3788, -2441, 25.965, 5.26, 0, 0, 0.489567, -0.871966, 60, 255, 1),
(8067, 1610, 0, 1, 1, -3853, -2341, 44.169, 3.433, 0, 0, 0.989404, -0.145189, 60, 255, 1),
(7948, 1667, 0, 1, 1, -3946, -2363, 18.208, 3.602, 0, 0, 0.97362, -0.228176, 60, 255, 1),
(779, 1610, 0, 1, 1, -3861, -2391, 26.408, 0.79, 0, 0, 0.384808, 0.922997, 60, 255, 1),
(16469, 1667, 0, 1, 1, -3937, -2298, 19.066, 5.445, 0, 0, 0.406932, -0.913459, 60, 255, 1),
(7533, 1610, 0, 1, 1, -3861, -2506, 40.788, 5.632, 0, 0, 0.31987, -0.947461, 60, 255, 1),
(7534, 1667, 0, 1, 1, -3779.64, -2485.89, 26.3598, 3.624, 0, 0, 0.971051, -0.238872, 60, 255, 1),
(7537, 1610, 0, 1, 1, -3880.72, -2459.3, 34.2359, 1.294, 0, 0, 0.602795, 0.797896, 60, 255, 1),
(7538, 1667, 0, 1, 1, -3879, -2400, 26.334, 2.602, 0, 0, 0.963825, 0.266535, 60, 255, 1),
(7539, 1610, 0, 1, 1, -3884.85, -2310.76, 25.4112, 2.89725, 0, 0, 0.992546, 0.121868, 60, 255, 1),
(7540, 1667, 0, 1, 1, -3830.57, -2431.7, 26.5262, 2.67035, 0, 0, 0.972369, 0.233447, 60, 255, 1),
(7541, 1610, 0, 1, 1, -3895.7, -2362.62, 22.8919, 0.994838, 0, 0, 0.477159, 0.878817, 60, 255, 1),
(7543, 1667, 0, 1, 1, -3830.66, -2501.42, 38.5958, 2.51327, 0, 0, 0.951056, 0.309019, 60, 255, 1),
(7544, 1610, 0, 1, 1, -3756.49, -2480.01, 32.6535, 1.09956, 0, 0, 0.5225, 0.852639, 60, 255, 1),
(7545, 1667, 0, 1, 1, -3886.07, -2401.82, 26.3338, 0.331613, 0, 0, 0.165048, 0.986286, 60, 255, 1),
(7546, 1610, 0, 1, 1, -3801.1, -2353.66, 33.2039, 0.034907, 0, 0, 0.0174526, 0.999848, 60, 255, 1),
(7547, 1667, 0, 1, 1, -3809.23, -2396.89, 28.0163, -1.81514, 0, 0, -0.78801, 0.615662, 60, 255, 1),
(7549, 1610, 0, 1, 1, -3942.23, -2285.07, 17.1541, -0.2618, 0, 0, -0.130526, 0.991445, 60, 255, 1),
(7550, 1667, 0, 1, 1, -3887, -2452, 32.045, 2.071, 0, 0, 0.860118, 0.510096, 60, 255, 1),
(7552, 1610, 0, 1, 1, -3993.14, -2598.76, 59.9468, -2.11185, 0, 0, -0.870356, 0.492423, 60, 255, 1);
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='0' WHERE `entry`=180248 AND `item`=19807;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 177804 AND `item` = 16002;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 177804 AND `item` = 16003;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 186468 AND `item` = 33187;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 185226 AND `item` = 31708;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 185224 AND `item` = 31709;
DELETE FROM `creature_loot_template` WHERE `entry` = 24048 AND `item` = 33187;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 184075 AND `item` = 40731;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 190696 AND `item` = 39063;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='0', `groupid`='1' WHERE `entry`=190696;
UPDATE `creature_template` SET `lootid`='0' WHERE `entry`=24048;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 176150 AND `item` = 15696;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('193996', '42780', '10', '0', '1', '3', '0', '0', '0');
DELETE FROM `gameobject_loot_template` WHERE `entry` = 190461 AND `item` = 38340;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 190467 AND `item` = 38397;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 185226 AND `item` = 31710;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 185224 AND `item` = 31710;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 190471 AND `item` = 38335;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 191182 AND `item` = 38337;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `item` in (49871,41614,38384,38393,38396,38397,38398,39668,39669,39670,38381,38379,38370,38369,38344,38345,38343,38342,38341,38338,38337,38336,38335,34102,30468,30356,28969,28283,24471,23849,30630);
UPDATE `gameobject_loot_template` SET `lootcondition`='8', `condition_value1`='13420' WHERE `entry`=193997 AND `item`=44724;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='10',`maxcount`='3' WHERE `entry`=190586 AND `item`=42780;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='50' WHERE `item`=42780;
DELETE FROM `creature_loot_template` WHERE `item` in (32468,32464,30356);
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '5', `groupid` = '1' WHERE `entry` = 32724 AND `item` = 32464;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '5', `groupid` = '1' WHERE `entry` = 32724 AND `item` = 32468;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '5', `groupid` = '1' WHERE `entry` = 32724 AND `item` = 32470;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1' WHERE `entry` = 32724 AND `item` = 32725;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '0', `groupid` = '1' WHERE `entry` = 32724 AND `item` = 32727;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '60', `groupid` = '1' WHERE `entry` = 32724 AND `item` = 32728;
DELETE FROM `creature_loot_template` WHERE `entry` = 17150 AND `item` = 25416;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='50' WHERE `entry`=17149 AND `item`=25416;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='25' WHERE `item`=24246;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-25' WHERE `item`=23849;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='5' WHERE `entry`=176582 AND `item`=6367;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='10' WHERE `entry`=176582 AND `item`=2143;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 19017 AND `item` = 4788;
DELETE FROM `pickpocketing_loot_template` WHERE `entry` = 5683 AND `item` = 1477;
DELETE FROM `pickpocketing_loot_template` WHERE `entry` = 5683 AND `item` = 2981;
DELETE FROM `pickpocketing_loot_template` WHERE `entry` = 5836 AND `item` = 2981;
DELETE FROM `creature_loot_template` WHERE `item` in (4788,6457);
DELETE FROM `gameobject_loot_template` WHERE `item` in (6457,4788);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 181800 AND `item` = 13187;
DELETE FROM `pickpocketing_loot_template` WHERE `item` in (9308,5075);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='40' WHERE `item`=9308;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='40' WHERE `item`=1274;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='30' WHERE `item`=2799;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='25', `maxcount`='3' WHERE `item`=5075;
UPDATE `creature_loot_template` SET `groupid`='0' WHERE `item` in (12430,12431,12433,12434,12435,12436);
UPDATE `gameobject_loot_template` SET `lootcondition`='9', `condition_value1`='4867' WHERE `entry`=175886 AND `item`=12533;
UPDATE `creature_loot_template` SET `lootcondition`='9', `condition_value1`='4867' WHERE `entry`=9196 AND `item`=12534;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `entry`=10836 AND `item`=12739;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-40', `mincountOrRef`='1' WHERE `item`=11467;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-50' WHERE `item`=9592;
UPDATE `creature_loot_template` SET `item`='16652', `ChanceOrQuestChance`='100', `mincountOrRef`='-16652' WHERE `entry`=3696 AND `item`=16647;
UPDATE `creature_loot_template` SET `item`='16652', `ChanceOrQuestChance`='100', `mincountOrRef`='-16652' WHERE `entry`=3664 AND `item`=16645;
UPDATE `creature_loot_template` SET `item`='16652', `ChanceOrQuestChance`='100', `mincountOrRef`='-16652' WHERE `entry`=3792 AND `item`=16646;
UPDATE `creature_loot_template` SET `item`='16652', `ChanceOrQuestChance`='100', `mincountOrRef`='-16652' WHERE `entry`=3879 AND `item`=16648;
UPDATE `creature_loot_template` SET `item`='16652', `ChanceOrQuestChance`='100', `mincountOrRef`='-16652' WHERE `entry`=3893 AND `item`=16655;
UPDATE `creature_loot_template` SET `item`='16652', `ChanceOrQuestChance`='100', `mincountOrRef`='-16652' WHERE `entry`=3900 AND `item`=16654;
UPDATE `creature_loot_template` SET `item`='16652', `ChanceOrQuestChance`='100', `mincountOrRef`='-16652' WHERE `entry`=10641 AND `item`=16646;
UPDATE `creature_loot_template` SET `item`='16652', `ChanceOrQuestChance`='100', `mincountOrRef`='-16652' WHERE `entry`=10643 AND `item`=16650;
DELETE FROM `creature_loot_template` WHERE `item` in (16645,16646,16647,16648,16649,16650,16651,16653,16654,16655,16656);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='50' WHERE `item`=29425;
DELETE FROM `creature_loot_template` WHERE `entry` = 18850 AND `item` = 29426;
DELETE FROM `creature_loot_template` WHERE `entry` = 18855 AND `item` = 29426;
DELETE FROM `creature_loot_template` WHERE `entry` = 18857 AND `item` = 29426;
DELETE FROM `creature_loot_template` WHERE `entry` = 19453 AND `item` = 29426;
DELETE FROM `creature_loot_template` WHERE `entry` = 19707 AND `item` = 29426;
DELETE FROM `creature_loot_template` WHERE `entry` = 20221 AND `item` = 29426;
DELETE FROM `creature_loot_template` WHERE `entry` = 18853 AND `item` = 29426;
DELETE FROM `creature_loot_template` WHERE `entry` = 19643 AND `item` = 29426;
DELETE FROM `creature_loot_template` WHERE `entry` = 18852 AND `item` = 29426;
DELETE FROM `creature_loot_template` WHERE `entry` = 19779 AND `item` = 29426;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='50' WHERE `item`=29426;

# Fix
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(131127,32666,530,1,1,0,0,9830.201,-7389.711,13.68803,5.532694,120,0,0,1,0,0),
(131128,32667,530,1,1,0,0,9859.044,-7406.975,13.7113,1.658063,120,0,0,1,0,0),
(131129,31144,530,1,1,0,0,9869.401,-7389.657,13.69022,3.90953755,120,0,0,1,0,0),
(131130,31144,530,1,1,0,0,9871.973,-7392.763,13.6818113,3.35103226,120,0,0,1,0,0),
(131131,31146,530,1,1,0,0,9850.529,-7395.442,13.72216,4.694936,120,0,0,1,0,0);
INSERT IGNORE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES
(17586, 'Need TXT YTDB', '', 0, 100, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);


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

UPDATE db_version SET `cache_id`= '617';
UPDATE db_version SET `version`= 'YTDB_0.14.4_R617_MaNGOS_R11928_SD2_R2478_ACID_R309c_RuDB_R47';
