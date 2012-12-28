UPDATE creature_template SET vehicle_id = 53 WHERE entry = 26590;
UPDATE creature_template SET vehicle_id = 200 WHERE entry = 28605;
UPDATE creature_template SET vehicle_id = 200 WHERE entry = 28607;
UPDATE creature_template SET vehicle_id = 174 WHERE entry = 31722;
UPDATE creature_template SET vehicle_id = 312 WHERE entry = 31857;
UPDATE creature_template SET vehicle_id = 312 WHERE entry = 31858;
UPDATE creature_template SET vehicle_id = 165 WHERE entry = 32535;
UPDATE creature_template SET vehicle_id = 479 WHERE entry = 35634;
UPDATE creature_template SET vehicle_id = 489 WHERE entry = 35768;
UPDATE creature_template SET vehicle_id = 223 WHERE entry = 30248;
UPDATE creature_template SET PowerType = 3 WHERE entry = 29884;
UPDATE creature_template SET vehicle_id = 736 WHERE  entry = 31788;
UPDATE creature_template SET vehicle_id = 0   WHERE  entry IN (33297,33298,33300,33301,33408,33409,33414,33416,33418,34125,36558,36557);
UPDATE creature_template SET vehicle_id = 106 WHERE  entry = 34802;
UPDATE creature_template SET vehicle_id = 106 WHERE  entry = 35419;
UPDATE creature_template SET vehicle_id = 106 WHERE  entry = 35421;
UPDATE creature_template SET vehicle_id = 106 WHERE  entry = 35415;
UPDATE creature_template SET vehicle_id = 36  WHERE  entry = 35413;
UPDATE creature_template SET vehicle_id = 79  WHERE  entry = 35427;
UPDATE creature_template SET vehicle_id = 79  WHERE  entry = 35429;
UPDATE creature_template SET vehicle_id = 223 WHERE  entry = 31749;

UPDATE `creature_template` SET IconName = 'vehichleCursor' WHERE `entry` IN (29144, 26572, 27213, 26472);

UPDATE creature_template SET IconName = 'vehichleCursor' WHERE vehicle_id > 0 AND IconName IS NULL;

DELETE FROM npc_spellclick_spells WHERE npc_entry IN (33109, 33167, 33062, 33060, 33067);
INSERT INTO npc_spellclick_spells VALUES
(33109, 62309, 0, 0, 0, 1),  -- Demolisher
(33167, 62309, 0, 0, 0, 1),  -- Demolisher mechanic seat
(33062, 65030, 0, 0, 0, 1),  -- Chopper
(33060, 65031, 0, 0, 0, 1),  -- Siege engine
(33067, 65031, 0, 0, 0, 1);  -- Siege engine turret

-- Salvaged Chopper
UPDATE `creature_template` SET PowerType = 3, `AIName` = 'NullAI' WHERE `entry` IN (33062, 34045);

-- Siege engine
UPDATE `creature_template` SET `PowerType` = 3, `AIName` = 'NullAI' WHERE `entry` IN (33060);
REPLACE INTO `creature_template_spells` SET `entry` = 33060, `spell1` = 62345, `spell2` = 62522, `spell3` = 62346;
UPDATE `creature_template` SET `AIName` = 'NullAI' WHERE `entry` IN (33067);

-- demolisher
UPDATE `creature_template` SET `PowerType` = 3, `AIName` = 'NullAI' WHERE `entry` IN (33109);
REPLACE INTO `creature_template_spells` SET `entry` = 33109, `spell1` = 62306, `spell2` = 62490, `spell3` = 62308, `spell4` = 62324;

-- Salvaged Siege Turret by traponinet
UPDATE `creature_template` SET `PowerType` = 3 WHERE `entry` = 33067;
DELETE FROM `creature_spell` WHERE `guid` IN (33067);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(33067, 62358, 0, 0, 0, 0),
(33067, 62359, 1, 0, 0, 0),
(33067, 64677, 2, 0, 0, 0);

-- Salvaged Demolisher Mechanic Seat
UPDATE `creature_template` SET `PowerType` = 3 WHERE `entry` = 33167;
DELETE FROM `creature_spell` WHERE `guid` IN (33167);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(33167, 62634, 0, 0, 0, 0),
(33167, 64979, 1, 0, 0, 0),
(33167, 62479, 2, 0, 0, 0),
(33167, 62471, 3, 0, 0, 0),
(33167, 62428, 5, 0, 0, 0);

-- Flame Leviathan mechanic seat
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (33114);
INSERT INTO `npc_spellclick_spells` (npc_entry, spell_id, quest_start, quest_start_active, quest_end, cast_flags) VALUES
(33114,46598, 0, 0, 0, 1);

UPDATE `creature_template` SET `AIName` = 'NullAI' WHERE `entry` IN (33114, 33142, 33143);

-- Earthen Stoneshaper
UPDATE creature_template SET unit_flags=33587968 WHERE entry=33620;
-- Ymirjar Skycaller true fix (delete hack from YTDB)
DELETE FROM creature_template_addon WHERE entry IN (31260, 37643);
-- Traveler's Tundra Mammoth
-- Grand Ice Mammoth
-- Grand Black War Mammoth
-- Grand Caravan Mammoth
DELETE FROM creature_template_addon WHERE entry = 32638;
UPDATE creature_template SET vehicle_id = 312, IconName = 'vehichleCursor' WHERE entry IN (32640, 31857, 31858, 31861, 31862, 32212, 32213);

-- Quests
DELETE FROM `creature_spell` WHERE `guid` IN (28605, 28606, 28607);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(28605, 52264, 0, 0, 0, 0),
(28605, 52268, 1, 0, 0, 0),
(28606, 52264, 0, 0, 0, 0),
(28606, 52268, 1, 0, 0, 0),
(28607, 52264, 0, 0, 0, 0),
(28607, 52268, 1, 0, 0, 0);

-- From Lanc
-- quest 12953
REPLACE INTO `creature_template_spells` SET `entry` = 30066, `spell1` = 55812;

DELETE FROM npc_spellclick_spells WHERE npc_entry IN (30066);
INSERT INTO npc_spellclick_spells VALUES
(30066, 44002, 12953, 1, 12953, 1);
-- INSERT IGNORE INTO spell_script_target VALUES (55812, 1, 30096); -- listed for TargetEntry 30096 does not have any implicit target TARGET_SCRIPT(38) or TARGET_SCRIPT_COORDINATES (46) or TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT (40).

-- From lanc
/* 7th Legion Chain Gun */
UPDATE `creature_template` SET `IconName` = 'Gunner' WHERE `entry` IN (27714);

DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27714);
INSERT INTO npc_spellclick_spells VALUES
(27714, 67373, 0, 0, 0, 1);

/* Broken-down Shredder */
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (27354);
INSERT INTO `npc_spellclick_spells` VALUES
(27354, 48533, 12244, 1, 12244, 1),
(27354, 48533, 12270, 1, 12270, 1);

DELETE FROM `spell_script_target` WHERE `entry` IN (48610);
INSERT INTO `spell_script_target` VALUES (48610, 1, 27423), (48610, 1, 27371);

/* Forsaken Blight Spreader */
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (26523);
INSERT INTO npc_spellclick_spells VALUES
(26523, 47961, 0, 0, 0, 1);

/* Argent Tournament mount */
DELETE FROM `creature_spell` WHERE `guid` IN (33844,33845);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(33844, 62544, 0, 0, 0, 0),
(33844, 64342, 1, 0, 0, 0),
(33844, 63010, 2, 0, 0, 0),
(33844, 62552, 3, 0, 0, 0),
(33844, 64077, 4, 0, 0, 0),
(33844, 62863, 5, 0, 0, 0),
(33844, 63034, 6, 0, 0, 0),
(33845, 62544, 0, 0, 0, 0),
(33845, 64342, 1, 0, 0, 0),
(33845, 63010, 2, 0, 0, 0),
(33845, 62552, 3, 0, 0, 0),
(33845, 64077, 4, 0, 0, 0),
(33845, 62863, 5, 0, 0, 0),
(33845, 63034, 6, 0, 0, 0);

UPDATE creature_template SET KillCredit1 = 33340 WHERE entry IN (33272);
UPDATE creature_template SET KillCredit1 = 33339 WHERE entry IN (33243);

DELETE FROM npc_spellclick_spells WHERE npc_entry IN (33842, 33843);
INSERT INTO npc_spellclick_spells VALUES
(33842, 63791, 13829, 1, 0, 3),
(33842, 63791, 13839, 1, 0, 3),
(33842, 63791, 13838, 1, 0, 3),
(33843, 63792, 13828, 1, 0, 3),
(33843, 63792, 13837, 1, 0, 3),
(33843, 63792, 13835, 1, 0, 3);

-- Quest vehicles Support: Going Bearback (12851)
UPDATE `creature_template` SET `vehicle_id` = 308 WHERE entry IN (29598);
REPLACE INTO `creature_template_spells` SET `entry` = 29598, `spell1` = 54897, `spell2` = 54907;

DELETE FROM npc_spellclick_spells WHERE npc_entry IN (29598);
INSERT INTO npc_spellclick_spells VALUES
(29598, 54908, 12851, 1, 12851, 1);

-- INSERT IGNORE INTO spell_script_target VALUES (54897, 1, 29358); --listed for TargetEntry 29358 does not have any implicit target TARGET_SCRIPT(38) or TARGET_SCRIPT_COORDINATES (46) or TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT (40).

/* Frostbrood Vanquisher */
UPDATE `creature_template` SET `InhabitType` = 3 WHERE `entry` = 28670;

-- from lanc
-- Infected Kodo fix quest (11690)
INSERT IGNORE INTO `spell_script_target` VALUES (45877, 1, 25596);

DELETE FROM npc_spellclick_spells WHERE npc_entry IN (25334, 27107);
INSERT INTO npc_spellclick_spells VALUES
(25334, 47917, 11652, 1, 11652, 1);

-- REPLACE INTO spell_script_target VALUES (47962, 1, 27107); -- listed for TargetEntry 27107 does not have any implicit target TARGET_SCRIPT(38) or TARGET_SCRIPT_COORDINATES (46) or TARGET_FOCUS_OR_SCRIPTED_GAMEOBJECT (40).

-- from lanc
-- Refurbished Shredder (quest 12050)
UPDATE `creature_template` SET `vehicle_id` = 300 WHERE `entry` IN (27061);
DELETE FROM `creature_spell` WHERE `guid` IN (27061);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(27061, 47939, 0, 0, 0, 0),
(27061, 47921, 1, 0, 0, 0),
(27061, 47966, 2, 0, 0, 0),
(27061, 47938, 3, 0, 0, 0);

DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27061);
INSERT INTO npc_spellclick_spells VALUES (27061, 47920, 0, 0, 0, 1);
REPLACE INTO spell_script_target VALUES (47939, 0, 188539);

-- Argent Cannon (quest 13086)
UPDATE `creature_template` SET `vehicle_id` = 244 WHERE `entry` IN (30236);
UPDATE `npc_spellclick_spells` SET `quest_start` = 13086, `quest_start_active` = 1, `quest_end` = 13086 WHERE `npc_entry` = 30236 AND `spell_id` = 57573;

DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27996);
INSERT INTO npc_spellclick_spells VALUES
(27996, 50343, 12498, 1, 12498, 1);

-- Quest 13236 Gift of the Lich King
REPLACE INTO `spell_script_target` VALUES
(58916, 2, 31254),
(58917, 1, 31276);

-- Quest: Defending Wyrmrest Temple (12372)
UPDATE `dbscripts_on_gossip` SET `datalong2` = 3 WHERE `id` = 9568;

UPDATE `creature_template` SET `InhabitType` = 3 WHERE `entry` = 27629;

REPLACE INTO creature_ai_scripts VALUES (2769801,27698,8,0,100,0,49367,-1,0,0,33,27698,6,0,0,0,0,0,0,0,0,0,'q12372');
UPDATE creature_template SET AIName='EventAI' WHERE entry=27698;

-- Quest King of the Mountain (13280)
DELETE FROM npc_spellclick_spells WHERE npc_entry = 31736;
INSERT INTO npc_spellclick_spells VALUES (31736, 59592, 13280, 1, 0, 3);

-- Njorndar Proto-Drake
UPDATE creature_template SET vehicle_id = 228 WHERE entry = 30272;
DELETE FROM npc_spellclick_spells WHERE npc_entry = 30272;
INSERT INTO npc_spellclick_spells VALUES (30272, 57401, 13071, 1, 13071, 1);

-- Updates vehicles by lanc
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (32189, 29433, 29555);
INSERT INTO npc_spellclick_spells VALUES 
(32189, 46598, 0, 0, 0, 1),
(29433, 47020, 0, 0, 0, 1),
(29555, 47020, 0, 0, 0, 1);

UPDATE `creature_template_addon` SET `emote` = 0 WHERE `entry` = 29433;
UPDATE `creature_template_addon` SET `moveflags` = 0 WHERE `entry` = 29625;

-- from lanc
-- All Support Vehicles for mount The Argent Tournament
DELETE FROM `creature_spell` WHERE `guid` IN (33324, 33323, 33322, 33321, 33320, 33319, 33318, 33317, 33316);

SET @GUID := 33324;
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(@GUID, 62544, 0, 0, 0, 0),
(@GUID, 64342, 1, 0, 0, 0),
(@GUID, 63010, 2, 0, 0, 0),
(@GUID, 62552, 3, 0, 0, 0),
(@GUID, 64077, 4, 0, 0, 0),
(@GUID, 62863, 5, 0, 0, 0),
(@GUID, 63034, 6, 0, 0, 0);

SET @GUID := 33323;
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(@GUID, 62544, 0, 0, 0, 0),
(@GUID, 64342, 1, 0, 0, 0),
(@GUID, 63010, 2, 0, 0, 0),
(@GUID, 62552, 3, 0, 0, 0),
(@GUID, 64077, 4, 0, 0, 0),
(@GUID, 62863, 5, 0, 0, 0),
(@GUID, 63034, 6, 0, 0, 0);

SET @GUID := 33322;
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(@GUID, 62544, 0, 0, 0, 0),
(@GUID, 64342, 1, 0, 0, 0),
(@GUID, 63010, 2, 0, 0, 0),
(@GUID, 62552, 3, 0, 0, 0),
(@GUID, 64077, 4, 0, 0, 0),
(@GUID, 62863, 5, 0, 0, 0),
(@GUID, 63034, 6, 0, 0, 0);

SET @GUID := 33321;
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(@GUID, 62544, 0, 0, 0, 0),
(@GUID, 64342, 1, 0, 0, 0),
(@GUID, 63010, 2, 0, 0, 0),
(@GUID, 62552, 3, 0, 0, 0),
(@GUID, 64077, 4, 0, 0, 0),
(@GUID, 62863, 5, 0, 0, 0),
(@GUID, 63034, 6, 0, 0, 0);

SET @GUID := 33320;
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(@GUID, 62544, 0, 0, 0, 0),
(@GUID, 64342, 1, 0, 0, 0),
(@GUID, 63010, 2, 0, 0, 0),
(@GUID, 62552, 3, 0, 0, 0),
(@GUID, 64077, 4, 0, 0, 0),
(@GUID, 62863, 5, 0, 0, 0),
(@GUID, 63034, 6, 0, 0, 0);

SET @GUID := 33319;
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(@GUID, 62544, 0, 0, 0, 0),
(@GUID, 64342, 1, 0, 0, 0),
(@GUID, 63010, 2, 0, 0, 0),
(@GUID, 62552, 3, 0, 0, 0),
(@GUID, 64077, 4, 0, 0, 0),
(@GUID, 62863, 5, 0, 0, 0),
(@GUID, 63034, 6, 0, 0, 0);

SET @GUID := 33318;
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(@GUID, 62544, 0, 0, 0, 0),
(@GUID, 64342, 1, 0, 0, 0),
(@GUID, 63010, 2, 0, 0, 0),
(@GUID, 62552, 3, 0, 0, 0),
(@GUID, 64077, 4, 0, 0, 0),
(@GUID, 62863, 5, 0, 0, 0),
(@GUID, 63034, 6, 0, 0, 0);

SET @GUID := 33317;
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(@GUID, 62544, 0, 0, 0, 0),
(@GUID, 64342, 1, 0, 0, 0),
(@GUID, 63010, 2, 0, 0, 0),
(@GUID, 62552, 3, 0, 0, 0),
(@GUID, 64077, 4, 0, 0, 0),
(@GUID, 62863, 5, 0, 0, 0),
(@GUID, 63034, 6, 0, 0, 0);

SET @GUID := 33316;
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(@GUID, 62544, 0, 0, 0, 0),
(@GUID, 64342, 1, 0, 0, 0),
(@GUID, 63010, 2, 0, 0, 0),
(@GUID, 62552, 3, 0, 0, 0),
(@GUID, 64077, 4, 0, 0, 0),
(@GUID, 62863, 5, 0, 0, 0),
(@GUID, 63034, 6, 0, 0, 0);

DELETE FROM `npc_spellclick_spells` WHERE npc_entry = 33870;
INSERT INTO `npc_spellclick_spells` VALUES
(33870, 63663, 13664, 1, 0, 3);

-- Typo fix for Argent Mount
DELETE FROM `creature_spell` WHERE `guid` IN (33844, 33845);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(33844, 62544, 0, 0, 0, 0),
(33844, 64342, 1, 0, 0, 0),
(33844, 63010, 2, 0, 0, 0),
(33844, 62552, 3, 0, 0, 0),
(33844, 64077, 4, 0, 0, 0),
(33844, 62863, 5, 0, 0, 0),
(33844, 63034, 6, 0, 0, 0),
(33845, 62544, 0, 0, 0, 0),
(33845, 64342, 1, 0, 0, 0),
(33845, 63010, 2, 0, 0, 0),
(33845, 62552, 3, 0, 0, 0),
(33845, 64077, 4, 0, 0, 0),
(33845, 62863, 5, 0, 0, 0),
(33845, 63034, 6, 0, 0, 0);

UPDATE `creature_template` SET `vehicle_id` = 30 WHERE `entry` = 30021;
REPLACE INTO `creature_template_spells` SET `entry` = 30021, `spell1` = 55982, `spell2` = 55980;
UPDATE `creature_template` SET `vehicle_id` = 529 WHERE `entry` = 33782;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (30021, 33782);
INSERT INTO `npc_spellclick_spells` VALUES
(30021, 55785, 0, 0, 0, 3),
(33782, 63151, 0, 0, 0, 1);

-- Rocket Propelled Warhead (quest 12437)
UPDATE `creature_template` SET `InhabitType` = 6, `unit_flags` = `unit_flags`|16384, `speed_walk` = 4, `speed_run` = 4 WHERE `entry` = 27593;
UPDATE `creature_model_info` SET `bounding_radius` = 0.534723,`combat_reach` = 3.5 WHERE `modelid` = 26611;

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` = 27593;
INSERT INTO `npc_spellclick_spells` VALUES
(27593, 49177, 12437, 1, 0, 1);

-- Wintergrasp vehicles

-- Wintergrasp tower cannon
SET @GUID := 28366;
UPDATE `creature_template` SET AIName = 'NullAI' WHERE entry = @GUID;
DELETE FROM `npc_spellclick_spells` WHERE `npc_entry` IN (@GUID);
INSERT INTO `npc_spellclick_spells` VALUES (@GUID, 60962, 0, 0, 0, 1);

-- Wintergrasp siege Engine (Alliance)
SET @GUID := 28312;
UPDATE `creature_template` SET `vehicle_id` = 324, `powertype` = 3, `AIName` = 'NullAI' WHERE `entry` = @GUID;

DELETE FROM `creature_spell` WHERE `guid` IN (@GUID);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
-- (@GUID, 51678, 0, 0, 0, 0);
(@GUID, 54109, 0, 0, 0, 0);

-- Wintergrasp Alliance siege turret (accessory)
SET @GUID := 28319;
UPDATE `creature_template` SET `powertype` = 3, AIName = 'NullAI' WHERE entry = @GUID;

DELETE FROM `creature_spell` WHERE `guid` IN (@GUID);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(@GUID, 57609, 0, 0, 0, 0);

-- Wintergrasp siege Engine (Horde)
SET @GUID := 32627;
UPDATE `creature_template` SET `powertype` = 3, `AIName` = 'NullAI' WHERE `entry` = @GUID;

DELETE FROM `creature_spell` WHERE `guid` IN (@GUID);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
-- (@GUID, 51678, 0, 0, 0, 0);
(@GUID, 54109, 0, 0, 0, 0);

-- Wintergrasp Horde siege turret (accessory)
SET @GUID := 32629;
UPDATE `creature_template` SET `powertype` = 3, AIName = 'NullAI' WHERE entry = @GUID;

DELETE FROM `creature_spell` WHERE `guid` IN (@GUID);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(@GUID, 57609, 0, 0, 0, 0);
-- UPDATE `creature_template` SET faction_A = 1979, faction_H = 1979 WHERE entry = 32629;

-- Wintergrasp Demolisher
SET @GUID := 28094;
UPDATE `creature_template` SET AIName = 'NullAI' WHERE entry = @GUID;

DELETE FROM `creature_spell` WHERE `guid` IN (@GUID);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
-- (@GUID, 50652, 0, 0, 0, 0),
(@GUID, 54107, 0, 0, 0, 0),
-- (@GUID, 50896, 1, 0, 0, 0),
(@GUID, 57618, 1, 0, 0, 0);

-- Wintergrasp Catapult
SET @GUID := 27881;
UPDATE `creature_template` SET `AIName` = 'NullAI' WHERE `entry` = @GUID;

DELETE FROM `creature_spell` WHERE `guid` IN (@GUID);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
-- (@GUID, 50025, 0, 0, 0, 0),
(@GUID, 57606, 0, 0, 0, 0),
(@GUID, 50989, 1, 0, 0, 0);

-- Under Development

-- Highland Mustang
-- DELETE FROM npc_spellclick_spells WHERE npc_entry IN (26472);
-- INSERT INTO npc_spellclick_spells VALUES (26472, 67373, 0, 0, 0, 1);

-- Kor Kron war Rider
-- DELETE FROM npc_spellclick_spells WHERE npc_entry IN (26813);
-- INSERT INTO npc_spellclick_spells VALUES (26813, 47424, 0, 0, 0, 1);

-- Kor Kron war Rider 2
-- DELETE FROM npc_spellclick_spells WHERE npc_entry IN (26572);
-- INSERT INTO npc_spellclick_spells VALUES (26572, 47424, 0, 0, 0, 1);

-- Onslaught Warhorse
-- DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27213);
-- INSERT INTO npc_spellclick_spells VALUES (27213, 67373, 0, 0, 0, 1);

-- Steel Gate Flying manchine
-- DELETE FROM npc_spellclick_spells WHERE npc_entry IN (24418);
-- INSERT INTO npc_spellclick_spells VALUES (24418, 67373, 0, 0, 0, 1);


-- Wooly mammoth bull
-- DELETE FROM npc_spellclick_spells WHERE npc_entry IN (25743);
-- INSERT INTO npc_spellclick_spells VALUES (25743, 43695, 0, 0, 0, 0);

-- Wyrmrest skytalon
-- DELETE FROM npc_spellclick_spells WHERE npc_entry = 32535;
-- INSERT INTO npc_spellclick_spells VALUES (32535, 61245, 0, 0, 0, 1);
