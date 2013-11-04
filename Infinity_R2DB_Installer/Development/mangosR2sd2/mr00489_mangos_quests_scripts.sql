-- ----------------------
-- QUEST && Ect Support -
-- ----------------------
-- temp fix need to find true fix
-- help fix quest 12813 currently
-- insert been commented out til i figure out how to handle this guy in this area  he shouldn't be here like this or in this form or something
DELETE FROM `creature` WHERE `id`=29560;
-- INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
-- (88692, 29560, 571, 1, 1, 0, 0, 7458.74, 4846.24, 54.1606, 0.0676441, 300, 0, 0, 63000, 19970, 0, 0);


-- ----------------------------------------------------------------
-- Start of Quest and related data and fixes ----------------------
-- ----------------------------------------------------------------


-- -------------
-- Quest 11560 -
-- -------------
UPDATE `gameobject_template` SET `data2` = 11560 WHERE `entry` = 187373;
UPDATE `creature_template` SET `ScriptName` = "npc_tadpole" WHERE `entry` = 25201;
DELETE FROM `scripted_event_id` WHERE `id` = 11560;
INSERT INTO `scripted_event_id` (`id`,`ScriptName`) VALUES (11560,"go_tadpole_cage"); 

-- --------------
-- Quest 12240  -
-- --------------
UPDATE `creature_template` SET `modelid_1` = 17612 WHERE `entry` = 27353;
DELETE FROM `creature` WHERE `id`=27238;
UPDATE `creature_template` SET `armor` = 7618, `faction_A` = 67, `faction_H` = 67 WHERE `entry` = 27238;

-- -------------
-- Quest 14104 -
-- -------------
DELETE FROM `dbscripts_on_event` WHERE `id` = 22030;
INSERT INTO `dbscripts_on_event` (`id`,`delay`,`command`,`datalong`,`datalong2`,`x`,`y`,`z`,`o`,`comments`) VALUES (22030,3,10,35012,300000,10006.4,650.6,10.34,4.542,"");

-- ------------
-- Quest 9164 -
-- ------------
UPDATE `creature` SET `MovementType` = 0 WHERE `id` IN (16206, 16208, 16209); -- in YTDB is 2

-- ---
-- -Quest 8468
-- ---
-- Thaelis has wrong faction was gettting killed by his own kind 8P
UPDATE `creature_template` SET `faction_A` = 16, `faction_H` = 16 WHERE `entry` = 15949;

-- ------------
-- Quest 13828, 13829, 13835, 13838, 13837, 13839, 13625, 13677
-- ------------
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_melee_target' WHERE `entry` = 33229;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_ranged_target' WHERE `entry` = 33243;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_charge_target' WHERE `entry` = 33272;

-- ------------
-- Quest 13663
-- ------------
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_black_knights_gryphon' WHERE `entry` = 33519;
UPDATE creature_template SET vehicle_id = 402 WHERE entry = 33519; -- vehicle_id can be 88 107 108 112 143 etc.
UPDATE creature_template SET KillCredit1 = 38595 WHERE entry = 33448;

-- ------------------
-- Quests 13665, 13745, 13750, 13756, 13761, 13767, 13772, 13777, 13782, 13787, 13790, 13793, 13811, 13814
-- ------------------
-- dk fix

UPDATE quest_template SET RequiredClasses = 0 WHERE entry = 13794;
UPDATE quest_template SET PrevQuestId = 13794, ExclusiveGroup = 0 WHERE entry = 13795;

-- it is also necessary (otherwise spell=63010 do not work)
UPDATE creature_template SET unit_flags = 8 WHERE entry IN
(33217,33316,33317,33318,33319,33320,33321,33322,33323,33324);

-- The Valiant's Challenge (10 quests)
UPDATE `creature_template` SET `KillCredit1` = 33708 WHERE `entry` = 33707;
UPDATE `creature_template_addon` SET `b2_0_sheath` = 0 WHERE `entry` = 33707;
-- UPDATE `dbscripts_on_gossip` SET datalong = 33707 WHERE id IN (33518,50102); -- Not found in YTDB
 
-- Among the Champions (4 quests) (may do not need)
DELETE FROM `dbscripts_on_gossip` WHERE id IN (10453,10454,10455,10456,10457,10458,10459,10460,10461,10462);
/*
DELETE FROM gossip_menu_option WHERE menu_id IN (10453,10454,10455,10456,10457,10458,10459,10460,10461,10462);
INSERT INTO `gossip_menu_option`(`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,
`action_menu_id`,`action_poi_id`,`action_script_id`,`box_coded`,`box_money`,`box_text`) VALUES
(10453,0,0,'I am ready to fight!',1,1,-1,0,10453,0,0,NULL ,1,62853,0,6,469,0,0,0,0),
(10454,0,0,'I am ready to fight!',1,1,-1,0,10454,0,0,NULL ,1,62853,0,6,469,0,0,0,0),
(10455,0,0,'I am ready to fight!',1,1,-1,0,10455,0,0,NULL ,1,62853,0,6,469,0,0,0,0),
(10456,0,0,'I am ready to fight!',1,1,-1,0,10456,0,0,NULL ,1,62853,0,6,469,0,0,0,0),
(10457,0,0,'I am ready to fight!',1,1,-1,0,10457,0,0,NULL ,1,62853,0,6,67,0,0,0,0),
(10458,0,0,'I am ready to fight!',1,1,-1,0,10458,0,0,NULL ,1,62853,0,6,67,0,0,0,0),
(10459,0,0,'I am ready to fight!',1,1,-1,0,10459,0,0,NULL ,1,62853,0,6,67,0,0,0,0),
(10460,0,0,'I am ready to fight!',1,1,-1,0,10460,0,0,NULL ,1,62853,0,6,469,0,0,0,0),
(10461,0,0,'I am ready to fight!',1,1,-1,0,10461,0,0,NULL ,1,62853,0,6,67,0,0,0,0),
(10462,0,0,'I am ready to fight!',1,1,-1,0,10462,0,0,NULL ,1,62853,0,6,67,0,0,0,0);
*/
INSERT INTO `dbscripts_on_gossip`(`id`,`delay`,`command`,`datalong`,`datalong2`,`buddy_entry`,`search_radius`,
`data_flags`,`dataint`,`dataint2`,`dataint3`,`dataint4`,`x`,`y`,`z`,`o`,`comments`) VALUES
(10453,1,22,14,2,0,0,4,0,0,0,0,0,0,0,0,''),
(10453,0,0,0,0,0,0,4,2000000449,2000000450,2000000451,0,0,0,0,0,''),
(10454,1,22,14,2,0,0,4,0,0,0,0,0,0,0,0,''),
(10454,0,0,0,0,0,0,4,2000000449,2000000450,2000000451,0,0,0,0,0,''),
(10455,1,22,14,2,0,0,4,0,0,0,0,0,0,0,0,''),
(10455,0,0,0,0,0,0,4,2000000449,2000000450,2000000451,0,0,0,0,0,''),
(10456,1,22,14,2,0,0,4,0,0,0,0,0,0,0,0,''),
(10456,0,0,0,0,0,0,4,2000000449,2000000450,2000000451,0,0,0,0,0,''),
(10457,1,22,14,2,0,0,4,0,0,0,0,0,0,0,0,''),
(10457,0,0,0,0,0,0,4,2000000449,2000000450,2000000451,0,0,0,0,0,''),
(10458,1,22,14,2,0,0,4,0,0,0,0,0,0,0,0,''),
(10458,0,0,0,0,0,0,4,2000000449,2000000450,2000000451,0,0,0,0,0,''),
(10459,1,22,14,2,0,0,4,0,0,0,0,0,0,0,0,''),
(10459,0,0,0,0,0,0,4,2000000449,2000000450,2000000451,0,0,0,0,0,''),
(10460,1,22,14,2,0,0,4,0,0,0,0,0,0,0,0,''),
(10460,0,0,0,0,0,0,4,2000000449,2000000450,2000000451,0,0,0,0,0,''),
(10461,1,22,14,2,0,0,4,0,0,0,0,0,0,0,0,''),
(10461,0,0,0,0,0,0,4,2000000449,2000000450,2000000451,0,0,0,0,0,''),
(10462,1,22,14,2,0,0,4,0,0,0,0,0,0,0,0,''),
(10462,0,0,0,0,0,0,4,2000000449,2000000450,2000000451,0,0,0,0,0,'');

UPDATE `dbscripts_on_gossip` SET buddy_entry = 0, search_radius = 0, data_flags = 4 WHERE command = 22 AND id IN (10469,10468,10470,10472,10473,10466,10464,10471,10465,10467);

-- valiants
UPDATE creature_template SET unit_flags = 0, AIName = '', ScriptName = 'npc_valiants' WHERE entry IN (33285,33306,33382,33383,33384,33558,33559,33561,33562,33564);

-- Champions
UPDATE creature_template SET ScriptName = 'npc_champions', AIName = '' WHERE entry IN
(33738,33739,33740,33743,33744,33745,33746,33747,33748,33749);

DELETE FROM `creature_spell` WHERE `guid` IN (33217,33316,33317,33318,33319,33320,33321,33322,33323,33324);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(33217, 63010, 0, 0, 0, 0),
(33217, 64342, 1, 0, 0, 0),
(33316, 63010, 0, 0, 0, 0),
(33316, 64342, 1, 0, 0, 0),
(33316, 63034, 6, 0, 0, 0),
(33317, 63010, 0, 0, 0, 0),
(33317, 64342, 1, 0, 0, 0),
(33317, 63034, 6, 0, 0, 0),
(33318, 63010, 0, 0, 0, 0),
(33318, 64342, 1, 0, 0, 0),
(33318, 63034, 6, 0, 0, 0),
(33319, 63010, 0, 0, 0, 0),
(33319, 64342, 1, 0, 0, 0),
(33319, 63034, 6, 0, 0, 0),
(33320, 63010, 0, 0, 0, 0),
(33320, 64342, 1, 0, 0, 0),
(33320, 63034, 6, 0, 0, 0),
(33321, 63010, 0, 0, 0, 0),
(33321, 64342, 1, 0, 0, 0),
(33321, 63034, 6, 0, 0, 0),
(33322, 63010, 0, 0, 0, 0),
(33322, 64342, 1, 0, 0, 0),
(33322, 63034, 6, 0, 0, 0),
(33323, 63010, 0, 0, 0, 0),
(33323, 64342, 1, 0, 0, 0),
(33323, 63034, 6, 0, 0, 0),
(33324, 63010, 0, 0, 0, 0),
(33324, 64342, 1, 0, 0, 0),
(33324, 63034, 6, 0, 0, 0);


-- ------------------
-- Quest 12065/12066
-- ------------------
-- Just a side note i dont think the mobs are correctly spawned/Placed around this area need to research or get someone to screen shot in live

-- Added Quest credit
DELETE FROM `creature_ai_scripts` WHERE (`id`='2677351');
INSERT INTO `creature_ai_scripts` VALUES ('2677351', '26773', '8', '0', '100', '1', '50546', '-1', '1000', '1000', '11', '47390', '6', '6', '33', '26773', '6', '0', '0', '0', '0', '0', 'ytdb/R2');
-- npc 26773 -- not selectable -- kill bunny credit
UPDATE `creature_template` SET `unit_flags` = 33554688 WHERE `entry` = 26773;

-- ------------------
-- Quest 12860/12927-
-- ------------------

-- correct target and take quest item away when quest is done and remove uneeded reqspellcast
UPDATE `quest_template` SET `ReqSourceId1` = 41179, `ReqSourceCount1` = 1, `ReqCreatureOrGOId1` = 29746 WHERE `entry` = 12860;

-- correct target and take quest item away when quest is done and remove uneeded reqspellcast
UPDATE `quest_template` SET `ReqSourceId1` = 41179, `ReqSourceCount1` = 1, `ReqCreatureOrGOId1` = 29746 WHERE `entry` = 12927;

-- ---------------
-- Quest 12813 ---
-- ---------------

UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 29329;
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 29330;
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 29333;
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 29338;

-- fixed spawn of onslaught harbor guards
INSERT IGNORE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(600009, 29330, 571, 1, 1, 0, 989, 7459.84, 4851.9, 54.1595, 0.00143623, 600, 0, 0, 12600, 0, 0, 0),
(600010, 29330, 571, 1, 1, 0, 989, 7459.58, 4840.95, 54.1595, 0.0367786, 600, 0, 0, 12387, 0, 0, 0);

-- ACID scripts (ytdb and R2 acid combined 8P ) and related fixes

-- Still needs texts if any
-- Timers could use adjusting 

-- onslaught Paladin
UPDATE `creature_template` SET `maxmana` = 7988 WHERE `entry` = 29329;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2932951; -- not found in YTDB and ScriptName = spell_dummy_npc in creature_template (cause disabling)
INSERT INTO `creature_ai_scripts` VALUES ('2932951', '29329', '8', '0', '100', '0', '52741', '-1', '0', '0', '11', '54415', '0', '22', '33', '29398', '6', '0', '41', '0', '0', '0', 'ytdb-q12813');
DELETE FROM `creature_ai_scripts` WHERE (`id`='2932952');
INSERT INTO `creature_ai_scripts` VALUES ('2932952', '29329', '0', '0', '100', '0', '4000', '6000', '10000', '14000', '11', '19131', '1', '4', '0', '0', '0', '0', '0', '0', '0', '0', 'R2 - cast shield charge');
DELETE FROM `creature_ai_scripts` WHERE (`id`='2932953');
INSERT INTO `creature_ai_scripts` VALUES ('2932953', '29329', '0', '0', '100', '0', '7000', '9000', '13000', '16000', '11', '32774', '1', '4', '0', '0', '0', '0', '0', '0', '0', '0', 'R2 - cast Avengers shield');

-- onslaught gryphon rider
UPDATE `creature_template_spells` SET `spell2` = 40652, `spell3` = 0 WHERE `entry` = 29333; -- removed incorrect and dupe throw spear spell
UPDATE `creature_template` SET `maxmana` = 7988, `maxhealth` = 12600 WHERE `entry` = 29333;
DELETE FROM `creature_ai_scripts` WHERE (`id`='2933351');
INSERT INTO `creature_ai_scripts` VALUES ('2933351', '29333', '8', '0', '100', '0', '52741', '-1', '0', '0', '11', '54415', '0', '22', '33', '29398', '6', '0', '41', '0', '0', '0', 'ytdb_q12813');
DELETE FROM `creature_ai_scripts` WHERE (`id`='2933352');
INSERT INTO `creature_ai_scripts` VALUES ('2933352', '29333', '9', '0', '100', '0', '10', '40', '5000', '7000', '11', '54617', '1', '4', '0', '0', '0', '0', '0', '0', '0', '0', 'R2 - cast throw spear ');
DELETE FROM `creature_ai_scripts` WHERE (`id`='2933353');
INSERT INTO `creature_ai_scripts` VALUES ('2933353', '29333', '9', '0', '100', '0', '1', '5', '5000', '7000', '11', '40652', '1', '4', '0', '0', '0', '0', '0', '0', '0', '0', 'R2 - cast wing clip');

-- onslaught harbor guard
DELETE FROM `creature_ai_scripts` WHERE `id` = 2933051; -- not found in YTDB and ScriptName = spell_dummy_npc in creature_template (cause disabling)
INSERT INTO `creature_ai_scripts` VALUES ('2933051', '29330', '8', '0', '100', '0', '52741', '-1', '0', '0', '11', '54415', '0', '22', '33', '29398', '6', '0', '41', '0', '0', '0', 'ytdb-q12813');
DELETE FROM `creature_ai_scripts` WHERE (`id`='2933052');
INSERT INTO `creature_ai_scripts` VALUES ('2933052', '29330', '9', '0', '100', '0', '5', '30', '5000', '6000', '11', '6660', '1', '4', '0', '0', '0', '0', '0', '0', '0', '0', 'R2 - cast shoot');
DELETE FROM `creature_ai_scripts` WHERE (`id`='2933053');
INSERT INTO `creature_ai_scripts` VALUES ('2933053', '29330', '9', '0', '100', '0', '5', '30', '7000', '8000', '11', '18802', '1', '4', '0', '0', '0', '0', '0', '0', '0', '0', 'R2 - cast frost shoot');

-- just some area related fixes

-- onslauhgt raven bishop
UPDATE `creature_template` SET `maxmana` = 17628 WHERE `entry` = 29338;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2933801;  -- not found in YTDB and ScriptName = spell_dummy_npc and AIName = '' in creature_template (cause disabling)
INSERT INTO `creature_ai_scripts` VALUES ('2933801', '29338', '0', '0', '100', '0', '6000', '7500', '8000', '10000', '11', '50740', '1', '4', '0', '0', '0', '0', '0', '0', '0', '0', 'R2 - cast raven flock');
DELETE FROM `creature_ai_scripts` WHERE (`id`='2933802');
INSERT INTO `creature_ai_scripts` VALUES ('2933802', '29338', '2', '0', '100', '0', '40', '30', '20', '40', '11', '50750', '0', '21', '0', '0', '0', '0', '0', '0', '0', '0', 'R2 - cast raven heal');
-- need to implent blessing of the light  need to do more research on this spell   -- server side script effevt

-- onslaught darkweaver
UPDATE `creature_template` SET `maxmana` = 35256 WHERE `entry` = 29614;

-- ---------------
-- Quest 14107 ---
-- ---------------

-- still needs support to grip of scourge server side effect and immue to the spell for quest

UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_fallen_hero_spirit' WHERE `entry` = 32149;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_scourge_conventor' WHERE `entry` = 32257;

UPDATE `gameobject_template` SET `castBarCaption` = 'Discarded Soul Crytal' WHERE `entry` = 195344;
UPDATE `creature_template` SET `KillCredit1` = 35055 WHERE `entry` = 32149; -- set fallen proxy
UPDATE `creature_template` SET `faction_A` = 7, `faction_H` = 7 WHERE `entry` = 32149; -- Fallens arent suppose to attack unless attacked
UPDATE `creature_template` SET `maxmana` = 7786 WHERE `entry` = 32149; -- updated fallen mana to 3.3.5 standard
UPDATE `creature_template` SET `maxmana` = 7988 WHERE `entry` = 32257; -- updated scourgeconv mob mana to 3.3.5
UPDATE `creature_template` SET `modelid_1` = 27651, `modelid_2` = 27651, `modelid_3` = 27651 WHERE `entry` = 32257; -- conventors are skeletons
-- ---------------------
-- Quest::14111---------
-- ---------------------
UPDATE `quest_template` SET `RewSpell` = 0, `RewSpellCast` = 0 WHERE `entry` = 14111;

-- ----------------------------------------
-- Quest 12470 ----------------------------
-- ----------------------------------------
UPDATE creature_template SET ScriptName='npc_hourglass', AIName = '' WHERE entry=27840;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 27840;
UPDATE `creature_template` SET `unit_flags` = 516, `dynamicflags` = 8 WHERE `entry` = 27840; -- added root, disable movement, passive

-- spawn more sands   (really should be able to use the whole area)
INSERT IGNORE INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(600011, 300209, 571, 1, 1, 4102.71, -444.36, 124.134, 1.774, 0, 0, 0.775178, 0.631742, -300, 0, 1),
(600012, 300209, 571, 1, 1, 4076.75, -441.368, 120.635, 0.995666, 0, 0, 0.477523, 0.878619, -300, 0, 1),
(600013, 300209, 571, 1, 1, 4070.94, -418.43, 120.234, 6.23349, 0, 0, 0.0248472, -0.999691, -300, 0, 1),
(600014, 300209, 571, 1, 1, 4128.17, -436.042, 125.947, 3.17357, 0, 0, 0.999872, -0.0159903, -300, 0, 1),
(600015, 300209, 571, 1, 1, 4145.28, -419.433, 124.344, 3.38956, 0, 0, 0.992324, -0.123666, -300, 0, 1),
(600016, 300209, 571, 1, 1, 4150.45, -390.681, 120.723, 3.66602, 0, 0, 0.965819, -0.259218, -300, 0, 1),
(600017, 300209, 571, 1, 1, 4126.18, -391.728, 119.142, 5.33813, 0, 0, 0.455137, -0.890421, -300, 0, 1);
-- ----------------------------------------
-- Bury Those Cockroaches Quest 11608 -----
-- ----------------------------------------
 
UPDATE creature_template SET ScriptName='npc_seaforium_depth_charge' WHERE entry=25401;

-- ----------------------------------------
-- Quest 11466 fixes and improvements -----
-- ----------------------------------------

DELETE FROM creature_addon WHERE guid = 115895;
INSERT INTO creature_addon (guid,mount,bytes1,b2_0_sheath,b2_1_pvp_state,emote) VALUES
(115895,0,0,0,0,10);

UPDATE creature_template SET ScriptName = 'npc_olga', AIName = '' WHERE entry = 24639;
UPDATE creature_template SET ScriptName = 'npc_jack_adams', AIName = '' WHERE entry = 24788;

-- -------------------------
-- -Quest:: 11656 ----------
-- -------------------------
-- better support

DELETE FROM `creature_ai_scripts` WHERE (`id`='2551051');
INSERT INTO `creature_ai_scripts` VALUES ('2551051', '25510', '8', '0', '100', '1', '45692', '-1', '0', '0', '33', '25510', '6', '0', '11', '64561', '0', '22', '41', '240000', '0', '0', 'ytdb-q11656');

DELETE FROM `creature_ai_scripts` WHERE (`id`='2551151');
INSERT INTO `creature_ai_scripts` VALUES ('2551151', '25511', '8', '0', '100', '1', '45692', '-1', '0', '0', '33', '25511', '6', '0', '11', '64561', '0', '22', '41', '240000', '0', '0', 'ytdb-q11656');

DELETE FROM `creature_ai_scripts` WHERE (`id`='2551251');
INSERT INTO `creature_ai_scripts` VALUES ('2551251', '25512', '8', '0', '100', '1', '45692', '-1', '0', '0', '33', '25512', '6', '0', '11', '64561', '0', '22', '41', '240000', '0', '0', 'ytdb-q11656');

DELETE FROM `creature_ai_scripts` WHERE (`id`='2551351');
INSERT INTO `creature_ai_scripts` VALUES ('2551351', '25513', '8', '0', '100', '1', '45692', '-1', '0', '0', '33', '25513', '6', '0', '11', '64561', '0', '22', '41', '240000', '0', '0', 'ytdb-q11656');

-- -------------------------
-- Quest :: 12644
-- -------------------------

UPDATE gameobject_template SET
ScriptName='go_still_at_it_quest'
WHERE entry IN(190638,190637,190635,190636,190639);

UPDATE creature_template SET
ScriptName='npc_tipsy_mcmanus'
WHERE entry=28566;

DELETE FROM `gameobject` WHERE `guid` = 200000; -- may redundant (found in YTDB)
INSERT INTO `gameobject` VALUES ('200000','190643','571','1','1','5545.45','5767.53','-77.8042','5.39307','0','0','0.959937','0.280215','-25','0','1');

DELETE FROM `creature` where `id` = 28537; -- may redundant (found in YTDB)
INSERT INTO creature VALUES
(600018,28537,571,1,1,0,0,5550.404,5768.214,-78.02,1.278,300,0,0,0,0,0,0);
UPDATE `creature_template` SET `minhealth` = 0, `maxhealth` = 1 WHERE `entry` = 28537;

DELETE from spell_script_target WHERE entry in(51932,51931,51933);
INSERT into `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(51932, 1, 28537),
(51931, 1, 28537),
(51933, 1, 28537);

UPDATE creature_template SET
flags_extra=flags_extra |128
WHERE entry=28537;

-- -------------------------
-- Quest :: 12645
-- -------------------------

UPDATE item_template SET ScriptName = 'item_jungle_punch_sample' WHERE entry = 38697;
UPDATE creature_template SET ScriptName = 'mob_taste_test' WHERE entry IN (28047,28568,27986);

-- -------------------------
-- quest 11542/11543 
-- -------------------------

UPDATE `creature_template` SET `scale` = 4, `modelid_1` = 11686, `modelid_2` = 11686 WHERE `entry` IN (25090, 25091, 25092);

INSERT IGNORE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(600019, 25092, 530, 1, 1, 0, 0, 13261.8, -7144.76, 29.6207, 3.73767, 25, 0, 0, 1, 0, 0, 0),
(600020, 25092, 530, 1, 1, 0, 0, 13313.5, -7149.11, 23.029, 0.326681, 25, 0, 0, 1, 0, 0, 0),
(600021, 25092, 530, 1, 1, 0, 0, 13263.9, -7144.98, 18.0722, 2.95227, 25, 0, 0, 1, 0, 0, 0),
(600022, 25092, 530, 1, 1, 0, 0, 13271.3, -7146.79, 19.1243, 5.98391, 25, 0, 0, 1, 0, 0, 0),
(600023, 25092, 530, 1, 1, 0, 0, 13289.9, -7151.84, 20.5758, 2.77005, 25, 0, 0, 1, 0, 0, 0),
(600024, 25092, 530, 1, 1, 0, 0, 13300.4, -7149.66, 3.98094, 1.67521, 25, 0, 0, 1, 0, 0, 0),
(600025, 25092, 530, 1, 1, 0, 0, 13305.6, -7147.99, 19.165, 2.99467, 25, 0, 0, 1, 0, 0, 0),
(600026, 25092, 530, 1, 1, 0, 0, 13331.7, -7150.1, 25.3583, 3.09835, 25, 0, 0, 1, 0, 0, 0),
(600027, 25092, 530, 1, 1, 0, 0, 13348.8, -7151.36, 29.4228, 3.06536, 25, 0, 0, 1, 0, 0, 0);

INSERT IGNORE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(600028, 25090, 530, 1, 1, 0, 0, 13252.6, -7054.9, 22.4681, 3.5688, 25, 0, 0, 1, 0, 0, 0),
(600029, 25090, 530, 1, 1, 0, 0, 13229.6, -7052.88, 4.3433, 2.60276, 25, 0, 0, 1, 0, 0, 0),
(600030, 25090, 530, 1, 1, 0, 0, 13213.4, -7053.09, 18.7827, 1.69955, 25, 0, 0, 1, 0, 0, 0),
(600031, 25090, 530, 1, 1, 0, 0, 13226.3, -7052.35, 17.7073, 2.66795, 25, 0, 0, 1, 0, 0, 0),
(600032, 25090, 530, 1, 1, 0, 0, 13256.7, -7056.42, 23.4799, 6.09779, 25, 0, 0, 1, 0, 0, 0),
(600033, 25090, 530, 1, 1, 0, 0, 13241, -7054.83, 19.4747, 3.12191, 25, 0, 0, 1, 0, 0, 0),
(600034, 25090, 530, 1, 1, 0, 0, 13272, -7058.13, 27.1397, 2.9664, 25, 0, 0, 1, 0, 0, 0);

INSERT IGNORE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(600035, 25091, 530, 1, 1, 0, 0, 13328.7, -6993.48, 11.8975, 1.60531, 25, 0, 0, 1, 0, 0, 0),
(600036, 25091, 530, 1, 1, 0, 0, 13346, -6993.5, 3.21209, 1.40346, 25, 0, 0, 1, 0, 0, 0),
(600037, 25091, 530, 1, 1, 0, 0, 13323, -6989.96, 18.1137, 5.29668, 25, 0, 0, 1, 0, 0, 0),
(600038, 25091, 530, 1, 1, 0, 0, 13309.5, -6987.26, 16.2246, 4.39818, 25, 0, 0, 1, 0, 0, 0),
(600039, 25091, 530, 1, 1, 0, 0, 13354.3, -6990.59, 19.2655, 1.4121, 25, 0, 0, 1, 0, 0, 0),
(600040, 25091, 530, 1, 1, 0, 0, 13360.6, -6991.35, 20.7843, 6.2588, 25, 0, 0, 1, 0, 0, 0),
(600041, 25091, 530, 1, 1, 0, 0, 13339.9, -6989.69, 17.719, 6.27843, 25, 0, 0, 1, 0, 0, 0),
(600045, 25091, 530, 1, 1, 0, 0, 13379.1, -6991.55, 25.1392, 3.19418, 25, 0, 0, 1, 0, 0, 0),
(600046, 25091, 530, 1, 1, 0, 0, 13328.7, -6993.48, 11.8975, 1.60531, 25, 0, 0, 1, 0, 0, 0);

-- EventAI -- one additional has been made to YTDB acid  a despawn  so quest graphics and effects reset for next player  at the moment its 2 mins to despawn and 30 secs to respawn (credit triggers are invis) quest might take longer then 2 mins 
DELETE FROM `creature_ai_scripts` WHERE (`id`='2509051');
INSERT INTO `creature_ai_scripts` VALUES ('2509051', '25090', '8', '0', '100', '1', '45115', '-1', '0', '0', '33', '25090', '6', '0', '11', '73119', '0', '22', '41', '120000', '0', '0', 'ytdb-q11542,11543&R2');

DELETE FROM `creature_ai_scripts` WHERE (`id`='2509151');
INSERT INTO `creature_ai_scripts` VALUES ('2509151', '25091', '8', '0', '100', '1', '45115', '-1', '0', '0', '33', '25091', '6', '0', '11', '73119', '0', '22', '41', '120000', '0', '0', 'ytdb-q11542,11543&R2');

DELETE FROM `creature_ai_scripts` WHERE (`id`='2509251');
INSERT INTO `creature_ai_scripts` VALUES ('2509251', '25092', '8', '0', '100', '1', '45115', '-1', '0', '0', '33', '25092', '6', '0', '11', '73119', '0', '22', '41', '120000', '0', '0', 'ytdb-q11542,11543&R2');

-- -------------------------
-- fix quest toxic_test 9051 -- still not working is kill credit
-- -------------------------
UPDATE `quest_template` SET `ReqCreatureOrGOId1` = 6498, `ReqCreatureOrGOCount1` = 1 WHERE `entry` = 9051; -- fixes spell credit
UPDATE `quest_template` SET `ReqSourceId1` = 22432, `ReqSourceCount1` = 1 WHERE `entry` = 9051; -- take item out of player inventory upon completetion

-- ------------------------------
-- Quest: Drake Hunt (11940/11919)
-- ------------------------------
UPDATE `creature_template` SET ScriptName='npc_nexus_drake', AIName='' WHERE entry = 26127;

-- -------------------------------
-- Quest: Merciful Freedom (11676)
-- -------------------------------
UPDATE gameobject_template SET ScriptName='go_scourge_cage' WHERE entry IN (187854,187855,187856,187857,187858,187859,187860,187862,187863,187864,187865,187866,187867,187868,187870,187871,187872,187873,187874,187861,190803);

-- ------------------------
-- Quest: Abduction (11590)
-- ------------------------

UPDATE `creature_template` SET
minhealth=6387,
maxhealth=7185,
minlevel=64,
maxlevel=70,
minmana=7031,
maxmana=7196
WHERE entry=25474;

UPDATE `creature_template` SET `ScriptName`='npc_beryl_sorcerer' , AIName='' WHERE entry=25316;

-- ---------------------------------------------------
-- Mob support for Quest: Powering Our Defenses (8490)
-- ---------------------------------------------------
-- Enraged Wraith
UPDATE `creature_template` SET AIName='EventAI', flags_extra=flags_extra|64 WHERE entry=17086;

DELETE FROM `creature_ai_scripts` WHERE creature_id = 17086;
INSERT INTO `creature_ai_scripts` VALUES
(1708601,17086,2,0,100,0,25,0,0,0,11,8599,0,1,1,-106,0,0,0,0,0,0,'R2 - Enraged Wraith - Cast Enrage on 50% HP');

-- ---------------
-- Gamel the Cruel
-- ---------------
UPDATE creature SET spawntimesecs = 30 WHERE id = 26449;

UPDATE creature_template SET AIName = 'EventAI', dmg_multiplier = 2 WHERE entry = 26449;
DELETE FROM creature_ai_scripts WHERE creature_id = 26449;
INSERT INTO creature_ai_scripts VALUES
(2644901, 26449, 0,0,80,1, 2000,2000,5000,5000, 11,19643,1,0, 0,0,0,0, 0,0,0,0,'R2 - Gamel the Cruel - mortal strike');

-- --------------------------------------------------
-- fixes for Quest Kickin'Nass and Takin manes (12630)
-- --------------------------------------------------
UPDATE `creature_template` SET `flags_extra` = 64 WHERE `entry` = 28523;
DELETE FROM creature WHERE id=28523;  -- deletes  nass kc bunny credit needs to be summoned not already spawn

-- -----------------------------
-- Quest Fixes to Hard_to_sallow
-- -----------------------------
DELETE FROM `creature_ai_scripts` WHERE (`id`='2629302');
INSERT INTO `creature_ai_scripts` VALUES ('2629302', '26293', '2', '0', '100', '0', '70', '50', '0', '0', '1', '-262930', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'R2 - Hulking Jormungar - emote between 70% and 50% ');

DELETE FROM `creature_ai_texts` WHERE entry IN ('-262930');
INSERT INTO `creature_ai_texts` VALUES ('-262930', 'The Hulking Jormungar falters for a moment, opening its mouth wide.', '', '', '', '', '', '', '', '', '3', '0', '0', '0', 'R2 - Hulking Jormungar-raid emote');

-- ------------------------------------------
-- Support for quest The Denouncement (12273)
-- ------------------------------------------

-- Texts
DELETE FROM creature_ai_texts WHERE entry IN (-272371,-272351,-272341,-272361);
INSERT INTO creature_ai_texts VALUES
(-272371,'High general Abbendis personally told me that it was a mistake to come north and that we\'re doomed! I urge you all to lay down your weapons and leave before it\'s too late!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'R2 - Commander Jordan yell'),
(-272351,'Renounce the Scarlet Onslaught! Don\'t listen to the lies of the high general and the grand admiral any longer!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'R2 - Lead Cannoneer Zierhut yell'),
(-272341,'You are being misled! The Onslaught is all lies! The Scourge and the Forsaken are not our enemies! Wake up!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'R2 - Blacksmith Goodman yell'),
(-272361,'Abbendis is nothing but a harlot and Grand Admiral Westwind is selling her cheap like he sold us out!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'R2 - Stable Master Mercer yell');

-- ACID
DELETE FROM creature_ai_scripts WHERE id IN (2723701,2723702,2723703,2723704,2723705,2723501,2723502,2723503,2723504,2723401,2723402,2723403,2723404,2723405,2723601,2723602,2723603,2723604);
INSERT INTO creature_ai_scripts VALUES

-- Commander Jordan (27237)

-- yell
(2723701,27237,4,0,100,6,0,0,0,0,1,-272371,0,0,0,0,0,0,0,0,0,0,'R2 - Commander Jordan - Yell on Aggro'),
-- Avenging Wrath (50837)
(2723702,27237,0,0,100,1,1000,3000,25000,30000,11,50837,0,0,0,0,0,0,0,0,0,0,'R2 - Commander Jordan - Cast Avenging Wrath'),
-- Consecration (32773)
(2723703,27237,9,0,100,1,0,10,18000,23000,11,32773,0,1,0,0,0,0,0,0,0,0,'R2 -Commander Jordan - Cast Consecration'),
-- Kill credit (48723/48724)
(2723704,27237,8,0,100,0,48712,-1,0,0,22,1,0,0,0,0,0,0,0,0,0,0,'R2 - Commander Jordan - Set Phase 2 after spell hit'),
(2723705,27237,6,1,100,0,0,0,0,0,33,27426,6,3,0,0,0,0,0,0,0,0,'R2 -Commander Jordan - Kill Credit on Death (Phase 2)'),


-- Lead Cannoneer Zierhut (27235)

-- yell
(2723501,27235,4,0,100,6,0,0,0,0,1,-272351,0,0,0,0,0,0,0,0,0,0,'R2 - Lead Cannoneer Zierhut - Yell on Aggro'),
-- Torch Toss (50832)
(2723502,27235,0,0,100,1,3000,7000,12000,15000,11,50832,4,0,0,0,0,0,0,0,0,0,'R2 - Lead Cannoneer Zierhut - Cast Torch Toss'),
-- Kill Credit (48725/48726)
(2723503,27235,8,0,100,0,48712,-1,0,0,22,1,0,0,0,0,0,0,0,0,0,0,'R2 - Lead Cannoneer Zierhut - Set Phase 2 after spell hit'),
(2723504,27235,6,1,100,0,0,0,0,0,33,27427,6,3,0,0,0,0,0,0,0,0,'R2 - Lead Cannoneer Zierhut - Kill Credit on Death (Phase 2)'),

-- Blacksmith Goodman (27234)

-- yell
(2723401,27234,4,0,100,6,0,0,0,0,1,-272341,0,0,0,0,0,0,0,0,0,0,' R2 - Blacksmith Goodman - Yell on Aggro'),
-- Crush Armor (33661)
(2723402,27234,0,0,100,1,2000,5000,5000,7000,11,33661,1,0,0,0,0,0,0,0,0,0,'R2 - Blacksmith Goodman - Cast Crush Armor'),
-- Skull Crack (15621)
(2723403,27234,0,0,100,1,6000,9000,10000,14000,11,15621,1,1,0,0,0,0,0,0,0,0,'R2 - Blacksmith Goodman - Cast Skull Crack'),
-- Kill credit (48727/48728)
(2723404,27234,8,0,100,0,48712,-1,0,0,22,1,0,0,0,0,0,0,0,0,0,0,'R2 - Blacksmith Goodman - Set Phase 2 after spell hit'),
(2723405,27234,6,1,100,0,0,0,0,0,33,27428,6,3,0,0,0,0,0,0,0,0,'R2 - Blacksmith Goodman - Kill Credit on Death (Phase 2)'),

-- Stable Master Mercer (27236)

-- yell
(2723601,27236,4,0,100,6,0,0,0,0,1,-272361,0,0,0,0,0,0,0,0,0,0,'R2 - Stable Master Mercer - Yell on Aggro'),
-- Summon Warhorse (50829)
(2723602,27236,4,0,100,0,0,0,0,0,11,50829,0,1,12,28187,6,0,0,0,0,0,'R2 - Stable Master Mercer - Summon Warhorse on Aggro'),
-- Kill credit (48729/48730)
(2723603,27236,8,0,100,0,48712,-1,0,0,22,1,0,0,0,0,0,0,0,0,0,0,'R2 - Stable Master Mercer - Set Phase 2 after spell hit'),
(2723604,27236,6,1,100,0,0,0,0,0,33,27429,6,3,0,0,0,0,0,0,0,0,'R2 - Stable Master Mercer - Kill Credit on Death (Phase 2)');

-- ----------------------------------------------
-- Support for quest Defiling Uther's Tomb (9444)
-- ----------------------------------------------
DELETE FROM creature_ai_scripts WHERE creature_id=27002;
INSERT INTO creature_ai_scripts VALUES
(2700201,27002,11,0,100,0,0,0,0,0,1,-270021,0,0,0,0,0,0,0,0,0,0,'Grom\'thar the Thunderbringer - Yell on Spawn'),
(2700202,27002,9,0,100,1,5,45,19000,25000,11,52167,1,0,0,0,0,0,0,0,0,0,'Grom\'thar the Thunderbringer - Cast Magnataur Charge'),
(2700203,27002,0,0,100,1,7000,14000,12000,16000,11,52166,0,1,0,0,0,0,0,0,0,0,'Grom\'thar the Thunderbringer - Cast Thunder'),
(2700204,27002,6,0,100,0,0,0,0,0,1,-270022,0,0,0,0,0,0,0,0,0,0,'Grom\'thar the Thunderbringer - Yell on Death');

DELETE FROM creature_ai_texts WHERE entry IN (-270021,-270022);
INSERT INTO creature_ai_texts (entry, content_default, type, comment) VALUES
(-270021,'I\'ll consume your flesh and pick my teeth with your bones!',1,'R2 - Grom\'thar the Thunderbringer yell1'),
(-270022,'You\'re no magnataur! Where... did you... find... such strength?',1,'R2 - Grom\'thar the Thunderbringer yell2');

-- ----------
-- Quest 9076
-- ----------
UPDATE `creature` SET `equipment_id` = 160, `spawndist` = 0, `MovementType` = 0 WHERE `id` = 16294;

-- -------------------------------------------------
-- Support for quest A Necessary Distraction (10637)
-- -------------------------------------------------

-- Azaloth (21506)

-- TODO ( really tired right now)
-- still need to make him attack and make the circle of casters around him being channeled a dumby spell -> only visual stuff is missing

UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 21506;

DELETE FROM creature_ai_scripts WHERE creature_id=21506;
INSERT INTO creature_ai_scripts VALUES
(2150601, 21506, 8, 0, 100, 1, 37834, -1, 0, 0, 1, -21506, 0, 0, 28, 0, 37833, 0, 33, 21892, 6, 0, 'Azaloth  - Yell and Start Combat Movements -R2'),
(2150602,21506,0,0,100,1,4000,4000,8000,8000,11,40504,1,0,0,0,0,0,0,0,0,0,'Azaloth - Cast Cleave-R2'),
(2150603,21506,0,0,100,1,3000,3000,17000,17000,11,11443,1,1,0,0,0,0,0,0,0,0,'Azaloth Cast Cripple-R2'),
(2150604,21506,0,0,100,1,10000,12000,33000,33000,11,38741,4,3,0,0,0,0,0,0,0,0,'Azaloth - Cast Rain of Fire-R2'),
(2150605,21506,0,0,100,1,6000,6000,14000,14000,11,38750,1,3,0,0,0,0,0,0,0,0,'Azaloth - Cast War Stomp-R2');


DELETE FROM creature_ai_texts WHERE entry=-21506;
INSERT INTO creature_ai_texts (entry,content_default,type,comment) VALUES
(-21506,'Illidan\s lapdogs! You will pay for my imprisonment with your lives!',1,'Azaloth yell1');

UPDATE `creature_template_addon` SET `b2_0_sheath` = 0, `auras` = '' WHERE `entry` = 21506;
