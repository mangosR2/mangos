-- Frozen halls (3 small instances) additions
-- Forge of souls
-- UPDATE `creature_template` SET `ScriptName`='mob_soul_storm', `AIName` ='' WHERE `entry`=; 

UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_FSintro' WHERE `entry` IN (37597, 37596);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_FSextro' WHERE `entry` IN (38160, 38161);
UPDATE `creature_template` SET `scale` = 0.8 WHERE `entry` IN (37221, 36955, 36658, 37225, 37223, 37226, 37554);
UPDATE `creature_template` SET `npcflag`='3' WHERE `entry` IN (38160, 38161);
UPDATE `creature_template` SET `equipment_id` = 1290 WHERE `entry` = 37554;

UPDATE `creature` SET `position_z` = 628.157 WHERE id = 36658;
DELETE FROM vehicle_accessory WHERE accessory_entry = 36658;

-- Halls of reflection
UPDATE `instance_template` SET `ScriptName` = 'instance_halls_of_reflection' WHERE map=668;

UPDATE `gameobject_template` SET `faction`='1375' WHERE `entry` IN (197341, 202302, 201385, 201596);

UPDATE `creature_template` SET `speed_walk`='1.5', `speed_run`='2.0' WHERE `entry` IN (36954, 37226);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRintro' WHERE `entry` IN (37221, 37223);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_falric' WHERE `entry` IN (38112);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_marwyn' WHERE `entry` IN (38113);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_lich_king_intro_hor' WHERE `entry` IN (36954);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='boss_lich_king_hr' WHERE `entry` IN (37226);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_jaina_and_sylvana_HRextro' WHERE `entry` IN (36955, 37554);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_undead_hor' WHERE `entry` IN (36940,36941,37069);
UPDATE `creature_template` SET `scale`='0.8' WHERE `entry` IN (37221, 36955);
UPDATE `creature_template` SET `equipment_id` = 1290 WHERE `entry` = 37554;
UPDATE `creature_template` SET `equipment_id`='0' WHERE `entry`=36954;
UPDATE `creature_template` SET `scale`='0.8' WHERE `entry` IN (36658, 37225, 37223, 37226, 37554);
UPDATE `creature_template` SET `unit_flags`='768', `type_flags`='268435564' WHERE `entry` IN (38177, 38176, 38173, 38172, 38567, 38175);
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_frostworn_general' WHERE `entry`=36723;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_spiritual_reflection' WHERE `entry`=37068;

REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(70464, 1, 36881),
(69708, 1, 37226),
(70194, 1, 37226);

REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(70224, 1, 37014),
(70225, 1, 37014);

REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(69431, 1, 37497),
(69431, 1, 37496),
(69431, 1, 37588),
(69431, 1, 37584),
(69431, 1, 37587);

REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(135341, 38112, 668, 3, 1, 0, 0, 5276.81, 2037.45, 709.32, 5.58779, 604800, 0, 0, 377468, 0, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(135342, 38113, 668, 3, 1, 0, 0, 5341.72, 1975.74, 709.32, 2.40694, 604800, 0, 0, 539240, 0, 0, 0);

REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(14531739, 201596, 668, 1, 128, 5275.28, 1694.23, 786.147, 0.981225, 0, 0, 0.471166, 0.882044, 25, 0, 1);

DELETE from `creature` WHERE `id`=36955;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(151040, 36955, 668, 3, 128, 0, 0, 5547.27, 2256.95, 733.011, 0.835987, 7200, 0, 0, 252000, 881400, 0, 0);

DELETE from `creature` WHERE `id`=37554;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(151041, 37554, 668, 3, 64, 0, 0, 5547.27, 2256.95, 733.011, 0.835987, 7200, 0, 0, 252000, 881400, 0, 0);

UPDATE `creature` SET `position_x` = 5551.29, `position_y` = 2261.33, `position_z` = 733.012, `orientation` = 4.0452 WHERE `id` = 37226;

UPDATE `creature_template` SET `modelid_1` = 11686, `modelid_2` = 11686, `modelid_3` = 11686, `modelid_4` = 11686 WHERE `entry` IN (37014,37704);

DELETE FROM `gameobject` WHERE `id` IN (201385,201596,202079);

UPDATE `gameobject_template` SET `faction` = '114',`data0` = '0' WHERE `gameobject_template`.`entry` IN (197341,197342,197343);
UPDATE `gameobject` SET `state` = 1 WHERE `id` IN (197342,197343);

-- offlike way for icewalls operation
DELETE from `creature` WHERE `id`=37014;
UPDATE `creature_template` SET `AIName`='', `Scriptname`='npc_queldelar_hor' where `entry` IN (37158);
DELETE from `creature` WHERE `map` = 668 AND `id` IN (37221,37223,37554,36955);

-- Captains chest (override)
DELETE FROM `gameobject` WHERE `id` IN (202212,201710,202337,202336);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(972562, 202212, 668, 1, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1),
(972563, 201710, 668, 1, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1),
(972564, 202337, 668, 2, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1),
(972565, 202336, 668, 2, 65535,  5241.047, 1663.4364, 784.295166, 0.54, 0, 0, 0, 0, -604800, 100, 1);
-- Dalaran portal (override)
UPDATE `gameobject` SET `phaseMask` = 65535, `orientation` = 0, `rotation2` = 0, `rotation3` = 0, `spawntimesecs` = -604800, `animprogress` = 100 WHERE `id` = 202079 AND `map` = 668;

/* Original Icewalls from YTDB
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(3485, 201385, 668, 3, 1, 5540.39, 2086.48, 731.066, 1.00057, 0, 0, 0.479677, 0.877445, 604800, 100, 1),
(3438, 201385, 668, 3, 1, 5494.3, 1978.27, 736.689, 1.0885, 0, 0, 0.517777, 0.855516, 604800, 100, 1),
(3386, 201385, 668, 3, 1, 5434.27, 1881.12, 751.303, 0.923328, 0, 0, 0.445439, 0.895312, 604800, 100, 1),
(3383, 201385, 668, 3, 1, 5323.61, 1755.85, 770.305, 0.784186, 0, 0, 0.382124, 0.924111, 604800, 100, 1);
*/

-- EVENT AI

-- ICC trash mobs from Xfurry
-- ###########
-- LOWER SPIRE
-- ###########

-- The Damned (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id`=3701101;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3701101,37011,0,0,100,30,10000,15000,10000,15000,11,70960,0,0,0,0,0,0,0,0,0,0, 'The Dammed  - cast Bone Flurry');
DELETE FROM `creature_ai_scripts` WHERE `id`=3701102;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3701102,37011,6,0,100,30,0,0,0,0,11,70961,0,0,0,0,0,0,0,0,0,0, 'The Dammed  - cast Shattred Bones');
-- Nerub'ar Broodkeeper (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3672501, 3672502, 3672503, 3672504);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3672501,36725,10,0,100,31,1,60,0,0,38,0,0,0,0,0,0,0,0,0,0,0, 'Nerubar broodkeeper - set aggressive'),
(3672502,36725,0,0,100,31,5000,7000,5000,7000,11,70965,4,0,0,0,0,0,0,0,0,0, 'Nerubar Broodkeeper - crypt scarabs'),
(3672503,36725,14,0,100,31,50,30,8000,13000,11,36725,6,0,0,0,0,0,0,0,0,0, 'Nerubar broodkeeper - dark mending'),
(3672504,36725,0,0,100,31,7000,11000,7000,11000,11,70980,4,0,0,0,0,0,0,0,0,0, 'Nerubar broodkeeper - web wrap');
-- Deathbound Ward (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3700701, 3700702, 3700703);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3700701,37007,10,0,100,31,1,80,0,0,38,0,0,0,0,0,0,0,0,0,0,0, 'Deathbound ward - set aggressive'),
(3700702,37007,0,0,100,31,5000,7000,5000,7000,11,71021,1,0,0,0,0,0,0,0,0,0, 'Deathbound ward - saber lash'),
(3700703,37007,0,0,100,31,15000,20000,20000,30000,11,71022,0,0,0,0,0,0,0,0,0,0, 'Deathbound ward - disrupting shout');

-- #####################
-- ORATORY OF THE DAMMED
-- #####################

-- Deathspeaker Attendant (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3681101, 3681102, 3681103);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3681101,36811,0,0,100,31,3000,5000,6000,8000,11,69387,4,0,0,0,0,0,0,0,0,0, 'Deathspeaker attendant - shadow bolt'),
(3681102,36811,0,0,100,11,10000,15000,10000,15000,11,69355,0,0,0,0,0,0,0,0,0,0, 'Deathspeaker attendant - shadow nova 10'),
(3681103,36811,0,0,100,21,10000,15000,10000,15000,11,71106,0,0,0,0,0,0,0,0,0,0, 'Deathspeaker attendant - shadow nova 25');
-- Deathspeaker Disciple (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3680701, 3680702, 3680703, 3680704);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3680701,36807,0,0,100,31,3000,6000,7000,10000,11,69387,4,0,0,0,0,0,0,0,0,0, 'Deathspeaker disciple - shadow bolt'),
(3680702,36807,16,0,100,31,69391,30,5000,9000,11,69391,6,0,0,0,0,0,0,0,0,0, 'Deathspeaker disciple - dark blessing'),
(3680703,36807,14,0,100,11,50,50,7000,11000,11,69389,6,0,0,0,0,0,0,0,0,0, 'Deathspeaker disciple - shadow mend 10'),
(3680704,36807,14,0,100,21,50,50,7000,11000,11,71107,6,0,0,0,0,0,0,0,0,0, 'Deathspeaker disciple - shadow mend 25');
-- Deathspeaker Servant (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3680501, 3680502, 3680503, 3680504, 3680505);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3680501,36805,0,0,100,31,7000,10000,7000,10000,11,69405,4,0,0,0,0,0,0,0,0,0, 'Deathspeaker Servant - consuming shadows'),
(3680502,36805,0,0,100,11,4000,7000,4000,7000,11,69576,4,0,0,0,0,0,0,0,0,0, 'Deathspeaker servant - chaos bolt 10'),
(3680503,36805,0,0,100,21,4000,7000,4000,7000,11,71108,4,0,0,0,0,0,0,0,0,0, 'Deathspeaker servant - chaos bolt 25'),
(3680504,36805,0,0,100,11,7000,13000,7000,13000,11,69404,4,0,0,0,0,0,0,0,0,0, 'Deathspeaker servant - curse of agony 10'),
(3680505,36805,0,0,100,21,7000,13000,7000,13000,11,71112,4,0,0,0,0,0,0,0,0,0, 'Deathspeaker servant - curse of agony 25');

-- ################
-- RAMPART OF SKULL
-- ################

-- Frenzied Abomination (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3754601, 3754602);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3754601,37546,0,0,100,31,3000,5000,3000,5000,11,70191,1,0,0,0,0,0,0,0,0,0, 'Frenzied abomination - abomination cleave'),
(3754602,37546,2,0,100,30,10,9,0,0,11,70371,0,0,0,0,0,0,0,0,0,0, 'Frenzied abomination - enrage');
-- Spire Minion (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3754501, 3754502);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3754501,37545,0,0,100,31,3000,6000,3000,6000,11,70396,1,0,0,0,0,0,0,0,0,0, 'Spire minion - ghoul slash'),
(3754502,37545,0,0,100,31,30000,30000,30000,30000,11,70363,0,0,0,0,0,0,0,0,0,0, 'Spire minion - cannibalize');

-- ###########
-- PLAGUEWORKS
-- ###########

-- Blighted Abomination (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3702201, 3702202, 3702203);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3702201,37022,0,0,100,31,2000,5000,2000,5000,11,40504,1,0,0,0,0,0,0,0,0,0, 'Blighted abomination - cleave'),
(3702202,37022,0,0,100,31,7000,15000,20000,30000,11,71150,0,0,0,0,0,0,0,0,0,0, 'Blighted abomination - plague cloud'),
(3702203,37022,0,0,100,31,5000,10000,10000,15000,11,71140,4,0,0,0,0,0,0,0,0,0, 'Blighted abomination - scourge hook');
-- Plague Scientist (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` IN (3702301, 3702302, 3702303);
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3702301,37023,0,0,100,31,10000,10000,10000,10000,11,71103,4,0,0,0,0,0,0,0,0,0, 'Plague scientist - combobulating spray'),
(3702302,37023,0,0,100,31,8000,11000,8000,11000,11,73079,4,0,0,0,0,0,0,0,0,0, 'Plague scientist - plague blast'),
(3702303,37023,0,0,100,31,15000,20000,15000,20000,11,69871,6,0,0,0,0,0,0,0,0,0, 'Plague scientist - plague stream');

-- Vengefull fleshreaper (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id`=3703801;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3703801,37038,0,0,100,31,5000,10000,5000,10000,11,71164,5,0,0,0,0,0,0,0,0,0, 'Vengefull fleshreaper - leaping face maul');

-- #############
-- CRIMSON HALLS
-- #############

-- Darkfallen Archmage (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3766401 AND 3766407;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3766401,37664,0,0,100,11,5000,10000,30000,35000,11,70408,0,0,0,0,0,0,0,0,0,0, 'Darkfallen archmage - amplify magic 10'),
(3766402,37664,0,0,100,21,5000,10000,30000,35000,11,72336,0,0,0,0,0,0,0,0,0,0, 'Darkfallen archmage - amplify magic 25'),
(3766403,37664,0,0,100,11,7000,11000,7000,11000,11,70407,0,0,0,0,0,0,0,0,0,0, 'Darkfallen archmage - blast wave 10'),
(3766404,37664,0,0,100,21,7000,11000,7000,11000,11,71151,0,0,0,0,0,0,0,0,0,0, 'Darkfallen archmage - blast wave 25'),
(3766405,37664,0,0,100,11,9000,13000,9000,13000,11,70409,4,0,0,0,0,0,0,0,0,0, 'Darkfallen archmage - fireball 10'),
(3766406,37664,0,0,100,21,9000,13000,9000,13000,11,71153,4,0,0,0,0,0,0,0,0,0, 'Darkfallen archmage - fireball 25'),
(3766407,37664,0,0,100,31,10000,10000,10000,10000,11,70410,5,0,0,0,0,0,0,0,0,0, 'Darkfallen archmage - polymorph spider');
-- Darkfallen Blood Knight (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3759501 AND 3759503;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3759501,37595,4,0,100,6,0,0,0,0,11,71736,0,0,0,0,0,0,0,0,0,0, 'Darkfallen blood knight - vampiric aura'),
(3759502,37595,0,0,100,31,5000,9000,5000,9000,11,70450,1,0,0,0,0,0,0,0,0,0, 'Darkfallen blood knight - blood mirror'),
(3759503,37595,0,0,100,31,3000,6000,3000,6000,11,70437,1,0,0,0,0,0,0,0,0,0, 'Darkfallen blood knight - unholy strike');
-- Darkfallen Noble (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3766301 AND 3766303;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3766301,37663,0,0,100,31,7000,11000,7000,11000,11,70645,4,0,0,0,0,0,0,0,0,0, 'Darkfallen noble - chains of shadow'),
(3766302,37663,0,0,100,11,3000,6000,3000,6000,11,72960,4,0,0,0,0,0,0,0,0,0, 'Darkfallen noble - shadow bolt 10'),
(3766303,37663,0,0,100,21,3000,6000,3000,6000,11,72961,4,0,0,0,0,0,0,0,0,0, 'Darkfallen noble - shadow bolt 25');
-- Darkfallen Advisor (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3757101 AND 3757104;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3757101,37571,0,0,100,11,5000,9000,5000,9000,11,72057,4,0,0,0,0,0,0,0,0,0, 'Darkfallen advisor - lich slap 10'),
(3757102,37571,0,0,100,21,5000,9000,5000,9000,11,72421,4,0,0,0,0,0,0,0,0,0, 'Darkfallen advisor - lich slap 25'),
(3757103,37571,16,0,100,31,72066,40,10000,20000,11,72066,6,0,0,0,0,0,0,0,0,0, 'Darkfallen advisor - shroud of spell warding'),
(3757104,37571,16,0,100,31,72065,50,10000,20000,11,72065,6,0,0,0,0,0,0,0,0,0, 'Darkfallen advisor - shroud of protection');
-- Darkfallen Lieutenant (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3766501 AND 3766503;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3766501,37665,0,0,100,11,5000,7000,5000,7000,11,70435,1,0,0,0,0,0,0,0,0,0, 'Darkfallen lieutenant - rend flesh 10'),
(3766502,37665,0,0,100,21,5000,7000,5000,7000,11,71154,1,0,0,0,0,0,0,0,0,0, 'Darkfallen lieutenant - rend flesh 25'),
(3766503,37665,0,0,100,31,5000,7000,20000,25000,11,70423,1,0,0,0,0,0,0,0,0,0, 'Darkfallen lieutenant - vampiric curse');
-- Darkfallen Tactician (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3766601 AND 3766603;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3766601,37666,0,0,100,31,5000,7000,10000,13000,11,70432,1,0,0,0,0,0,0,0,0,0, 'Darkfallen tactitian - blood sap'),
(3766602,37666,0,0,100,31,7000,10000,7000,10000,11,70437,1,0,0,0,0,0,0,0,0,0, 'Darkfallen tactitian - unholy strike'),
(3766603,37666,4,0,100,6,0,0,0,0,11,70431,0,0,0,0,0,0,0,0,0,0, 'Darkfallen tactitian - shadowstep');
-- Darkfallen Commander (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3766201 AND 3766203;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3766201,37662,4,0,100,6,0,0,0,0,11,70750,0,0,0,0,0,0,0,0,0,0, 'Darkfallen commander - battle shout'),
(3766202,37662,0,0,100,11,3000,5000,5000,7000,11,70449,5,0,0,0,0,0,0,0,0,0, 'Darkfallen commander - vampire rush 10'),
(3766203,37662,0,0,100,21,3000,5000,5000,7000,11,71155,5,0,0,0,0,0,0,0,0,0, 'Darkfallen commander - vampire rush 25');

-- #########
-- FROSTWING
-- #########

-- Frostwing whelp (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3753201 AND 3753203;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3753201,37532,0,0,100,31,5000,7000,10000,13000,11,71350,4,0,0,0,0,0,0,0,0,0, 'Frostwing whelp - focus fire'),
(3753202,37532,0,0,100,11,4000,5000,4000,5000,11,71361,4,0,0,0,0,0,0,0,0,0, 'Frostwing whelp - frost blast 10'),
(3753203,37532,0,0,100,21,4000,5000,4000,5000,11,71362,4,0,0,0,0,0,0,0,0,0, 'Frostwing whelp - frost blast 25');
-- Ymirjar battle maiden (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3713201 AND 3713202;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3713201,37132,0,0,100,31,4000,6000,10000,11000,11,71258,0,0,0,0,0,0,0,0,0,0, 'Ymirjar battle maiden - adrenaline rush'),
(3713202,37132,0,0,100,31,5000,7000,5000,7000,11,71257,3,0,0,0,0,0,0,0,0,0, 'Ymirjar battle maiden - barbaric strike');
-- Ymirjar deathbringer (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3812501 AND 3812507;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3812501,38125,0,0,100,31,4000,6000,6000,8000,11,71298,4,0,0,0,0,0,0,0,0,0, 'Ymirjar deathbringer - banish'),
(3812502,38125,0,0,100,11,7000,13000,15000,20000,11,71299,0,0,0,0,0,0,0,0,0,0, 'Ymirjar deathbringer - deaths embrace 10'),
(3812503,38125,0,0,100,21,7000,13000,15000,20000,11,71300,0,0,0,0,0,0,0,0,0,0, 'Ymirjar deathbringer - deaths embrace 25'),
(3812504,38125,0,0,100,11,4000,7000,4000,7000,11,71296,4,0,0,0,0,0,0,0,0,0, 'Ymirjar deathbringer - shadow bolt 10'),
(3812505,38125,0,0,100,21,4000,7000,4000,7000,11,71297,4,0,0,0,0,0,0,0,0,0, 'Ymirjar deathbringer - shadow bolt 25'),
(3812506,38125,16,0,100,31,69929,30,35000,50000,11,69929,6,0,0,0,0,0,0,0,0,0, 'Ymirjar deathbringer - spirit steam'),
(3812507,38125,0,0,100,31,20000,25000,25000,30000,11,71303,0,0,0,0,0,0,0,0,0,0, 'Ymirjar deathbringer - summon ymirjar');
-- Ymirjar huntress (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3713401 AND 3713405;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3713401,37134,0,0,100,31,5000,10000,7000,14000,11,71249,0,0,0,0,0,0,0,0,0,0, 'Ymirjar huntress - ice trap'),
(3713402,37134,0,0,100,31,8000,13000,10000,15000,11,71251,0,0,0,0,0,0,0,0,0,0, 'Ymirjar huntress - rapid shot'),
(3713403,37134,0,0,100,31,2000,4000,2000,4000,11,71253,4,0,0,0,0,0,0,0,0,0, 'Ymirjar huntress - shoot'),
(3713404,37134,0,0,100,31,6000,8000,7000,10000,11,71252,4,0,0,0,0,0,0,0,0,0, 'Ymirjar huntress - volley'),
(3713405,37134,4,0,100,6,0,0,0,0,11,71705,0,0,0,0,0,0,0,0,0,0, 'Ymirjar huntress - summon warhawk');
-- Ymirjar frostbinder (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3712701 AND 3712703;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3712701,37127,0,0,100,31,7000,10000,7000,10000,11,71306,5,0,0,0,0,0,0,0,0,0, 'Ymirjar frostbinder - twisted winds'),
(3712702,37127,0,0,100,31,15000,20000,15000,20000,11,71274,5,0,0,0,0,0,0,0,0,0, 'Ymirjar frostbinder - frozen orb'),
(3712703,37127,4,0,100,6,0,0,0,0,11,71270,0,0,0,0,0,0,0,0,0,0, 'Ymirjar frostbinder - arctic chill');

#-- ###############
#-- VALITHRIA EVENT
#-- ###############

#-- Grottnous abomination
#UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=37886;
#DELETE FROM `creature_ai_scripts` WHERE `id`=3788601;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3788601,37886,0,0,100,3,7000,13000,7000,13000,11,70633,0,0,0,0,0,0,0,0,0,0, 'Gluttnous abomination - gut spray 10n');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3788602;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3788602,37886,0,0,100,5,7000,13000,7000,13000,11,71283,0,0,0,0,0,0,0,0,0,0, 'Gluttnous abomination - gut spray 25n');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3788603;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3788603,37886,0,0,100,9,7000,13000,7000,13000,11,72025,0,0,0,0,0,0,0,0,0,0, 'Gluttnous abomination - gut spray 10h');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3788604;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3788604,37886,0,0,100,17,7000,13000,7000,13000,11,72026,0,0,0,0,0,0,0,0,0,0, 'Gluttnous abomination - gut spray 25h');
#-- Blistering Zombies
#UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=37934;
#DELETE FROM `creature_ai_scripts` WHERE `id`=3793401;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3793401,37934,4,0,100,31,0,0,0,0,11,70749,0,0,0,0,0,0,0,0,0,0, 'Blistering zombies - corrosion');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3793402;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3793402,37934,6,0,100,3,0,0,0,0,11,70744,0,0,0,0,0,0,0,0,0,0, 'Blistering zombies - acid burst 10n');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3793403;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3793403,37934,6,0,100,5,0,0,0,0,11,71733,0,0,0,0,0,0,0,0,0,0, 'Blistering zombies - acid burst 25n');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3793404;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3793404,37934,6,0,100,9,0,0,0,0,11,72017,0,0,0,0,0,0,0,0,0,0, 'Blistering zombies - acid burst 10h');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3793405;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3793405,37934,6,0,100,17,0,0,0,0,11,72018,0,0,0,0,0,0,0,0,0,0, 'Blistering zombies - acid burst 25h');
#-- Suppresser
#UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=37863;
#DELETE FROM `creature_ai_scripts` WHERE `id`=3786301;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3786301,37863,4,0,100,31,0,0,0,0,11,70588,1,0,0,0,0,0,0,0,0,0, 'Suppresser - suppression');
#-- Blazing Skeleton
#UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=36791;
#DELETE FROM `creature_ai_scripts` WHERE `id`=3679101;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3679101,36791,0,0,100,3,5000,10000,5000,10000,11,70754,4,0,0,0,0,0,0,0,0,0, 'Blazin skeleton - fireball 10n');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3679102;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3679102,36791,0,0,100,5,5000,10000,5000,10000,11,71748,4,0,0,0,0,0,0,0,0,0, 'Blazin skeleton - fireball 25n');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3679103;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3679103,36791,0,0,100,9,5000,10000,5000,10000,11,72023,4,0,0,0,0,0,0,0,0,0, 'Blazin skeleton - fireball 10h');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3679104;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3679104,36791,0,0,100,17,5000,10000,5000,10000,11,72024,4,0,0,0,0,0,0,0,0,0, 'Blazin skeleton - fireball 25h');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3679105;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3679105,36791,0,0,100,11,10000,15000,10000,15000,11,69325,0,0,0,0,0,0,0,0,0,0, 'Blazin skeleton - lay waste 10');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3679106;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3679106,36791,0,0,100,21,10000,15000,10000,15000,11,71730,0,0,0,0,0,0,0,0,0,0, 'Blazin skeleton - lay waste 10');
-- Mana void
-- UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=38068;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=38068);
-- INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
-- (3806801,38068,4,0,100,31,0,0,0,0,11,71085,0,0,0,0,0,0,0,0,0,0, 'Mana void - mana void aura');
#UPDATE `creature_template` SET `modelid1` = 11686 WHERE `entry` = 38068;
#-- Risen archmage
#UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=37868;
#DELETE FROM `creature_ai_scripts` WHERE `id`=3786801;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3786801,37868,0,0,100,3,7000,11000,7000,11000,11,70759,0,0,0,0,0,0,0,0,0,0, 'Risen archmage - frostbolt volley 10n');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3786802;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3786802,37868,0,0,100,5,7000,11000,7000,11000,11,71889,0,0,0,0,0,0,0,0,0,0, 'Risen archmage - frostbolt volley 25n');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3786803;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3786803,37868,0,0,100,9,7000,11000,7000,11000,11,72015,0,0,0,0,0,0,0,0,0,0, 'Risen archmage - frostbolt volley 10h');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3786804;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3786804,37868,0,0,100,17,7000,11000,7000,11000,11,72016,0,0,0,0,0,0,0,0,0,0, 'Risen archmage - frostbolt volley 25h');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3786805;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3786805,37868,0,0,100,11,25000,30000,25000,30000,11,71179,0,0,0,0,0,0,0,0,0,0, 'Risen archmage - mana void 10');
#DELETE FROM `creature_ai_scripts` WHERE `id`=3786806;
#INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
#(3786806,37868,0,0,100,21,25000,30000,25000,30000,11,71741,0,0,0,0,0,0,0,0,0,0, 'Risen archmage - mana void 10');

-- ############
-- SVALNA EVENT
-- ############

-- Captain Rupert (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3712501 AND 3712503;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3712501,37125,0,0,100,31,5000,7000,7000,11000,11,71787,4,0,0,0,0,0,0,0,0,0, 'Captain Rupert - fel bomb'),
(3712502,37125,0,0,100,31,7000,9000,9000,13000,11,71594,4,0,0,0,0,0,0,0,0,0, 'Captain Rupert - machine gun'),
(3712503,37125,0,0,100,31,10000,13000,15000,17000,11,71786,4,0,0,0,0,0,0,0,0,0, 'Captain Rupert - rocket');
-- Captain Grondel (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3712401 AND 3712404;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3712401,37124,0,0,100,31,10000,10000,10000,10000,11,71553,5,0,0,0,0,0,0,0,0,0, 'Captain Groundel - charge'),
(3712402,37124,0,0,100,31,5000,10000,10000,15000,11,71554,3,0,0,0,0,0,0,0,0,0, 'Captain Groundel - sunder armor'),
(3712403,37124,0,0,100,31,5000,7000,5000,7000,11,71552,1,0,0,0,0,0,0,0,0,0, 'Captain Groundel - mortal strike'),
(3712404,37124,0,0,100,31,5000,9000,10000,15000,11,71785,4,0,0,0,0,0,0,0,0,0, 'Captain Groundel - conflagration');
-- Captain Brandon (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3712301 AND 3712304;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3712301,37123,0,0,100,31,10000,10000,10000,10000,11,71549,1,0,0,0,0,0,0,0,0,0, 'Captain Brandon - crusader strike'),
(3712302,37123,2,0,100,30,25,24,0,0,11,71550,0,0,0,0,0,0,0,0,0,0, 'Captain Brandon - divine shield'),
(3712303,37123,0,0,100,31,5000,8000,7000,10000,11,71784,4,0,0,0,0,0,0,0,0,0, 'Captain Brandon - hammer of betrayal'),
(3712304,37123,0,0,100,31,7000,10000,8000,12000,11,71551,4,0,0,0,0,0,0,0,0,0, 'Captain Brandon - judgement of command');
-- Captain Arnath (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3712201 AND 3712207;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3712201,37122,14,0,100,31,50,30,5000,10000,11,71595,6,0,0,0,0,0,0,0,0,0, 'Captain Arnath - flash heal'),
(3712202,37122,0,0,100,21,15000,20000,20000,25000,11,14515,4,0,0,0,0,0,0,0,0,0, 'Captain Arnath - dominate mind'),
(3712203,37122,16,0,100,31,71548,30,30000,35000,11,71548,6,0,0,0,0,0,0,0,0,0, 'Captain Arnath - power shield'),
(3712204,37122,0,0,100,3,5000,10000,9000,15000,11,71546,4,0,0,0,0,0,0,0,0,0, 'Captain Arnath - smite 10n'),
(3712205,37122,0,0,100,5,5000,10000,9000,15000,11,71547,4,0,0,0,0,0,0,0,0,0, 'Captain Arnath - smite 25n'),
(3712206,37122,0,0,100,9,5000,10000,9000,15000,11,71778,4,0,0,0,0,0,0,0,0,0, 'Captain Arnath - smite 10h'),
(3712207,37122,0,0,100,17,5000,10000,9000,15000,11,71779,4,0,0,0,0,0,0,0,0,0, 'Captain Arnath - smite 25h');
-- Crok and Svalna need SD2 script
-- this is just a basic of spells
-- Crok Scourgebane (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3712901 AND 3712904;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3712901,37129,0,0,100,31,5000,7000,7000,9000,11,71489,1,0,0,0,0,0,0,0,0,0, 'Crock Scrougebane - deathstrike'),
(3712902,37129,0,0,100,31,7000,9000,10000,12000,11,71488,1,0,0,0,0,0,0,0,0,0, 'Crock Scrougebane - scourgestrike'),
(3712903,37129,0,0,100,21,10000,15000,10000,15000,11,71490,4,0,0,0,0,0,0,0,0,0, 'Crock Scrougebane - deathcoil'),
(3712904,37129,4,0,100,6,0,0,0,0,39,30,0,0,0,0,0,0,0,0,0,0, 'Crock Scrougebane - call for help');
-- Svalna (need compare with YTDB)
DELETE FROM `creature_ai_scripts` WHERE `id` BETWEEN 3712601 AND 3712604;
INSERT INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES 
(3712601,37126,4,0,100,6,0,0,0,0,11,71465,0,0,0,0,0,0,0,0,0,0, 'Sister Svalna - divine surge'),
(3712602,37126,0,0,100,11,15000,20000,20000,25000,11,71468,0,0,0,0,0,0,0,0,0,0, 'Sister Svalna - aether burst 10'),
(3712603,37126,0,0,100,21,15000,20000,20000,25000,11,71469,0,0,0,0,0,0,0,0,0,0, 'Sister Svalna - aether burst 25'),
(3712604,37126,0,0,100,31,25000,30000,60000,70000,11,70196,5,0,11,71463,0,0,0,0,0,0, 'Sister Svalna - sprear');

-- PreSindragosa_Event.
DELETE FROM spell_template WHERE id=75001;
INSERT INTO `spell_template` (`id`, `attr`, `attr_ex`, `attr_ex2`, `attr_ex3`, `proc_flags`, `proc_chance`, `duration_index`, `effect0`, `effect0_implicit_target_a`, `effect0_implicit_target_b`, `effect0_radius_idx`, `effect0_apply_aura_name`, `effect0_misc_value`, `effect0_misc_value_b`, `effect0_trigger_spell`, `comments`) VALUES('75001','0','0','0','0','0','101','21','28','42','0','13','0','132001','64','0','Summon Dark Matter');

DELETE FROM `creature_template` WHERE (`entry`=132001);
INSERT INTO `creature_template` (`entry`, `difficulty_entry_1`, `difficulty_entry_2`, `difficulty_entry_3`, `KillCredit1`, `KillCredit2`, `modelid_1`, `modelid_2`, `modelid_3`, `modelid_4`, `name`, `subname`, `IconName`, `gossip_menu_id`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `armor`, `faction_A`, `faction_H`, `npcflag`, `speed_walk`, `speed_run`, `scale`, `rank`, `mindmg`, `maxdmg`, `dmgschool`, `attackpower`, `dmg_multiplier`, `baseattacktime`, `rangeattacktime`, `unit_class`, `unit_flags`, `dynamicflags`, `family`, `trainer_type`, `trainer_spell`, `trainer_class`, `trainer_race`, `minrangedmg`, `maxrangedmg`, `rangedattackpower`, `type`, `type_flags`, `lootid`, `pickpocketloot`, `skinloot`, `resistance1`, `resistance2`, `resistance3`, `resistance4`, `resistance5`, `resistance6`, `PetSpellDataId`, `mingold`, `maxgold`, `AIName`, `MovementType`, `InhabitType`, `unk16`, `unk17`, `RacialLeader`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `movementId`, `RegenHealth`, `vehicle_id`, `equipment_id`, `trainer_id`, `vendor_id`, `mechanic_immune_mask`, `flags_extra`, `ScriptName`) VALUES (132001, 0, 0, 0, 0, 0, 18050, 0, 0, 0, 'Unleashed Dark Matter', '', '', 0, 81, 81, 290000, 290000, 0, 0, 10029, 4, 6, 0, 1, 1.14286, 1, 1, 436, 654, 0, 163, 3, 2000, 2000, 1, 32768, 0, 0, 0, 0, 0, 0, 349, 523, 130, 10, 4160, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'EventAI', 0, 3, 10, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8193, 0, '');

-- Creature id: 132001
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '132001';
DELETE FROM creature_ai_scripts WHERE creature_id=132001;
INSERT INTO creature_ai_scripts VALUES 
('13200101','132001','11','0','100','30','0','0','0','0','17','32','292000','0','17','33','30000','0','17','24','292000','0','Set Max Health and Mana and Current Health at Spawn.'),
('13200102','132001','10','0','100','30','0','1000','0','0','38','0','0','0','13','100','6','0','0','0','0','0','Set Combat and Threat at OOC LOS 1000 yards.'),
('13200103','132001','12','0','100','30','5','5','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Force Despawn at target hp <5 Percent.'),
('13200104','132001','0','0','100','31','10000','10000','10000','10000','11','4507','1','2','0','0','0','0','0','0','0','0','Cast Taunt.'),
('13200105','132001','10','0','100','30','0','100','0','0','13','100','6','0','11','4507','6','10','39','20','0','0','Set Combat and Threat at OOC LOS 100 yards and Cast Taunt.'),
('13200106','132001','1','0','100','30','30000','30000','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Force Despawn in OOC Timer.'),
('13200107','132001','11','0','100','30','0','0','0','0','17','25','30000','0','0','0','0','0','0','0','0','0','Set Mana 30000 at spawn.'),
('13200108','132001','6','0','100','30','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Despawn at death.'),
('13200109','132001','0','0','100','31','3000','3000','7000','9000','11','75384','1','14','0','0','0','0','0','0','0','0','Cast Shadow Bolt.'),
('13200110','132001','0','0','100','31','2600','14700','16500','22400','11','73805','0','14','0','0','0','0','0','0','0','0','Cast Explosion.'),
('13200111','132001','11','0','100','30','0','0','0','0','2','6','0','0','0','0','0','0','0','0','0','0','Set Faction 6 at spawn.'),
('13200112','132001','2','0','100','30','50','0','0','0','17','24','292000','0','0','0','0','0','0','0','0','0','Get Health Full at 50% HP.'),
('13200113','132001','21','0','100','30','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Force despawn Just Reached Home.');


-- Summon id: 1571
DELETE FROM creature_ai_summons WHERE id=1571;
INSERT INTO creature_ai_summons VALUES 
('1571','4167.64','2521.1','211.033','5.20468','300000','Spider Sindragosa Ward.');
-- Summon id: 1572
DELETE FROM creature_ai_summons WHERE id=1572;
INSERT INTO creature_ai_summons VALUES 
('1572','4153.39','2509.87','211.033','5.1698','300000','Spider Sindragosa Ward.');
-- Summon id: 1573
DELETE FROM creature_ai_summons WHERE id=1573;
INSERT INTO creature_ai_summons VALUES 
('1573','4195.66','2519.99','211.033','4.44643','300000','Spider Sindragosa Ward.');
-- Summon id: 1574
DELETE FROM creature_ai_summons WHERE id=1574;
INSERT INTO creature_ai_summons VALUES 
('1574','4214.11','2501.91','211.033','3.91093','300000','Spider Sindragosa Ward.');
-- Summon id: 1575
DELETE FROM creature_ai_summons WHERE id=1575;
INSERT INTO creature_ai_summons VALUES 
('1575','4186.58','2403.26','211.033','1.63162','300000','Frostwarden Sindragosa Ward');
-- Summon id: 1576
DELETE FROM creature_ai_summons WHERE id=1576;
INSERT INTO creature_ai_summons VALUES 
('1576','4182.35','2403.33','211.033','1.71824','300000','Frostwarden Sindragosa Ward');
-- Summon id: 1577
DELETE FROM creature_ai_summons WHERE id=1577;
INSERT INTO creature_ai_summons VALUES 
('1577','4173.8','2402.91','211.033','1.64624','300000','Frostwarden Sindragosa Ward');
-- Summon id: 1578
DELETE FROM creature_ai_summons WHERE id=1578;
INSERT INTO creature_ai_summons VALUES 
('1578','4173.62','2564.28','211.033','4.77937','300000','Frostwarden Sindragosa Ward');
-- Summon id: 1579
DELETE FROM creature_ai_summons WHERE id=1579;
INSERT INTO creature_ai_summons VALUES 
('1579','4182.44','2565.95','211.033','4.47787','300000','Frostwarden Sindragosa Ward');
-- Summon id: 1580
DELETE FROM creature_ai_summons WHERE id=1580;
INSERT INTO creature_ai_summons VALUES 
('1580','4189.71','2565.48','211.033','4.59937','300000','Frostwarden Sindragosa Ward');

-- Creature id: 37503
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '37503';
DELETE FROM creature_ai_scripts WHERE creature_id=37503;
INSERT INTO creature_ai_scripts VALUES 
('3750301','37503','11','0','100','30','0','0','0','0','2','14','1','0','18','33554432','0','0','0','0','0','0','Spider Event Controller - Set Faction 14 and Set Unit_Flag Not Selectable.'),
('3750302','37503','0','0','100','31','180000','180000','180000','180000','34','10','2','0','41','2000','0','0','0','0','0','0','Spider Event Controller - Force Despawn and Stop Event.'),
('3750303','37503','17','0','100','30','0','1000','1000','0','38','0','0','0','0','0','0','0','0','0','0','0','Summoned all - Set In Combat.'),
('3750304','37503','0','0','100','31','60000','60000','60000','60000','32','37228','1','1578','32','37229','1','1579','32','37228','1','1580','Spider Event Controller - Summon Frostwarden Warrior and Sorceress'),
('3750305','37503','0','0','100','31','60000','60000','60000','60000','32','37228','1','1575','32','37229','1','1576','32','37228','1','1577','Spider Event Controller - Summon Frostwarden Warrior and Sorceress'),
('3750306','37503','0','0','100','31','3000','3000','20000','20000','32','37501','1','1754','0','0','0','0','0','0','0','0','Spider Event Controller - Summon Nerub Champion.'),
('3750307','37503','4','0','100','30','0','0','0','0','21','0','0','0','20','0','0','0','4','17167','0','0','Spider Event Controller - Preevent Stop Combat Movement and False Auto Attack and Play sound.'),
('3750308','37503','10','0','100','31','0','500','1000','1000','38','0','0','0','0','0','0','0','0','0','0','0','Spider Event Controller - Start Event'),
('3750309','37503','0','0','100','31','3000','3000','20000','20000','32','37501','1','1571','32','37502','1','1573','32','37501','1','1572','Spider Event Controller - Summon Nerub Champion and Webweaver.');

-- Creature id: 37502
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '37502';
DELETE FROM creature_ai_scripts WHERE creature_id=37502;
INSERT INTO creature_ai_scripts VALUES 
('3750201','37502','0','0','100','31','0','0','2500','3000','11','71326','1','8','29','10','0','0','20','0','0','0','Nerub Webweaver - Cast Crypt Scarabs and Ranged Movement and False Auto Attack.');

-- Creature id: 37501
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '37501';
DELETE FROM creature_ai_scripts WHERE creature_id=37501;
INSERT INTO creature_ai_scripts VALUES 
('3750101','37501','0','0','100','31','1000','1000','10000','10000','11','71801','1','10','0','0','0','0','0','0','0','0','Nerub Champion - Cast Rush.');

-- Creature id: 38199
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '38199';
DELETE FROM creature_ai_scripts WHERE creature_id=38199;
INSERT INTO creature_ai_scripts VALUES 
('3819901','38199','11','0','100','30','0','0','0','0','18','33555078','0','0','11','71324','0','2','41','7000','0','0','Frost Blade - Cast Frost Blade and Set Unit_Flags and Force Despawn 7 seconds at Spawn.');

-- Creature id: 37228
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '37228';
DELETE FROM creature_ai_scripts WHERE creature_id=37228;
INSERT INTO creature_ai_scripts VALUES 
('3722801','37228','0','0','100','31','3000','3000','15000','17000','11','71325','1','10','0','0','0','0','0','0','0','0','Frostwarden Warrior - Cast FrostBlade.'),
('3722802','37228','0','0','100','31','9000','9000','20000','20000','11','71317','1','2','0','0','0','0','0','0','0','0','Frostwarden Warrior - Cast Glacial Strike.');

-- Creature id: 37229
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '37229';
DELETE FROM creature_ai_scripts WHERE creature_id=37229;
INSERT INTO creature_ai_scripts VALUES 
('3722901','37229','0','0','100','31','4000','4000','11000','13000','11','71320','1','2','0','0','0','0','0','0','0','0','Frostwarden Sorceress - Cast Frost Nova.'),
('3722902','37229','0','0','100','31','7000','7000','16000','21000','11','71318','1','9','0','0','0','0','0','0','0','0','Frostwarden Sorceress - Cast Frostbolt.'),
('3722903','37229','0','0','100','31','9000','9000','23000','27000','11','71331','1','10','0','0','0','0','0','0','0','0','Frostwarden Sorceress - Cast Ice Tomb.');

DELETE FROM `creature_template_addon` WHERE (`entry`=37501);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES (37501, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `creature_template_addon` WHERE (`entry`=38197);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES (38197, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `creature_template_addon` WHERE (`entry`=37502);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES (37502, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `creature_template_addon` WHERE (`entry`=38198);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES (38198, 0, 0, 0, 0, 0, 0, '');






