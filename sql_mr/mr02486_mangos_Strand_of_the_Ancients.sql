-- Strand of the Ancients

-- creature and gameobject initial guid
SET @CREATURE := 510000;
SET @GAMEOBJECT := 510000;

DELETE FROM `creature` WHERE `guid` BETWEEN @CREATURE AND @CREATURE+9999;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @GAMEOBJECT AND @GAMEOBJECT+9999;

DELETE FROM battleground_template WHERE id = 9;
INSERT INTO battleground_template (id, MinPlayersPerTeam, MaxPlayersPerTeam, AllianceStartLoc, AllianceStartO, HordeStartLoc, HordeStartO) VALUES (9, 5, 15, 1367, 0, 1368, 0);
-- Rigger Sparklight
UPDATE creature_template SET npcflag = 1, ScriptName = 'npc_sa_vendor' WHERE entry IN (29260, 29262);
-- Seaforium source
-- left this to remove old bad hack
-- DELETE FROM creature_template WHERE entry = 50000;
-- modify some "should not be changed" data in DB
-- dummy radius for passing some check, only 1 charge and 10 seconds delay
UPDATE gameobject_template SET data2 = 1, data4 = 1, data7 = 10 WHERE entry = 190752;
-- set factions for 2 Massive Seaforium Bombs
-- use these if needed in Your DB (maybe already have better factions?)
-- UPDATE gameobject_template SET faction = 3 WHERE entry = 190753;
-- UPDATE gameobject_template SET faction = 6 WHERE entry = 194086;

-- Achievements
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (6447);
INSERT INTO achievement_criteria_requirement VALUES
(6447, 6, 4384, 0);

-- Doors
UPDATE gameobject_template SET faction = 14 WHERE entry IN (192549, 190727, 190726, 190723, 190724, 190722);
-- Cleanup for UDB, as ytdb doesnt have flag 16 there..
-- UPDATE gameobject_template SET flags=flags|16 WHERE entry = 192829;
UPDATE gameobject_template SET faction = 3 WHERE entry = 194082;
UPDATE gameobject_template SET faction = 6 WHERE entry = 194083;
-- make Defender's Portal usable by all factions (rest is handled by script)
UPDATE gameobject_template SET faction=0 , ScriptName = 'go_sa_def_portal' WHERE entry = 191575;

-- Massive Seaforium Charge (fix wrong use area - "Not valid area" message)
UPDATE item_template SET area = 0, Map = 607 WHERE entry = 39213;

-- Seaforium barrels
UPDATE gameobject_template SET faction = 12, data0 = 52415, data1 = 1 WHERE entry = 190753;
UPDATE gameobject_template SET faction = 29, data0 = 52415, data1 = 1 WHERE entry = 194086;
UPDATE locales_gameobject SET name_loc3 = 'Zephyriumbombe', name_loc6 = 'Barril de Seforio', name_loc7 = 'Barril de Seforio' WHERE entry IN (190753, 194086);

-- Banners - horde/alli occupied, clickable banner
UPDATE gameobject_template SET flags = 0 WHERE entry IN (191309, 191310);

-- Vehicles support
-- Battleground Demolisher
UPDATE creature_template SET npcflag = 0, minlevel = 70, maxlevel = 70, minhealth = 80000, maxhealth = 80000, mechanic_immune_mask = mechanic_immune_mask|1|2|8|16|32|64|128|1024|2048|4096|8192|131072|262144|8388608|16777216|67108864, vehicle_id = 158, ScriptName = '', AIName = 'NullAI' WHERE entry IN (28781, 32796);
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (28781, 32796);
INSERT INTO npc_spellclick_spells VALUES
(28781, 60968, 0, 0, 0, 1),
(32796, 60968, 0, 0, 0, 1);
-- Demolishers must not heal
DELETE FROM creature_template_addon WHERE entry IN (28781, 32796);
INSERT INTO creature_template_addon VALUES
(28781, 0, 0, 0, 0, 0, 0, 52455),
(32796, 0, 0, 0, 0, 0, 0, 52455);

-- Antipersonnel Cannon
UPDATE `creature_template` SET npcflag = 0, minlevel = 80, maxlevel = 80, iconName = 'Gunner', unit_flags=4, minhealth = 44910, maxhealth = 44910, faction_A = 35, faction_H = 35, RegenHealth=0, mechanic_immune_mask = mechanic_immune_mask|1|2|8|16|32|64|128|1024|2048|4096|8192|131072|262144|8388608|16777216|67108864, ScriptName = '', AIName = 'NullAI' WHERE entry IN (27894, 32795);
DELETE FROM npc_spellclick_spells WHERE npc_entry IN (27894, 32795);
INSERT INTO npc_spellclick_spells VALUES
(27894, 60968, 0, 0, 0, 1),
(32795, 60968, 0, 0, 0, 1);
-- Cannon must not heal
DELETE FROM creature_template_addon WHERE entry IN (27894, 32795);
INSERT INTO creature_template_addon VALUES
(27894, 0, 0, 0, 0, 0, 0, 52455),
(32795, 0, 0, 0, 0, 0, 0, 52455);

-- Rigger Sparklight
DELETE FROM creature WHERE map=607;
INSERT INTO creature (guid,id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,DeathState,MovementType)  VALUES
(@CREATURE, 29260, 607, 3, 1, 0, 0, 1360.81, -322.18, 36.83, 0.32, 800, 0, 0, 6986, 0, 0, 0),
(@CREATURE+1, 29262, 607, 3, 1, 0, 0, 1363.87, 220.95, 37.06, 2.67, 800, 0, 0, 6986, 0, 0, 0),
-- Antipersonnel Cannon
(@CREATURE+2, 27894, 607, 3, 1, 0, 0, 1421.94, -196.53, 42.18, 0.90, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+3, 27894, 607, 3, 1, 0, 0, 1455.09, -219.92, 41.95, 1.03, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+4, 27894, 607, 3, 1, 0, 0, 1405.33, 84.25, 41.18, 5.40, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+5, 27894, 607, 3, 1, 0, 0, 1436.51, 110.02, 41.40, 5.32, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+6, 27894, 607, 3, 1, 0, 0, 1236.33, 92.17, 64.96, 5.68, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+7, 27894, 607, 3, 1, 0, 0, 1215.04, 57.73, 64.73, 5.71, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+8, 27894, 607, 3, 1, 0, 0, 1232.35, -187.34, 66.94, 0.37, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+9, 27894, 607, 3, 1, 0, 0, 1249.95, -223.74, 66.72, 0.43, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+10, 27894, 607, 3, 1, 0, 0, 1068.82, -127.38, 96.44, 0.06, 800, 0, 0, 63000, 0, 0, 0),
(@CREATURE+11, 27894, 607, 3, 1, 0, 0, 1068.35, -87.04, 93.80, 6.24, 800, 0, 0, 63000, 0, 0, 0),
-- Battleground Demolisher
(@CREATURE+12, 28781, 607, 3, 1, 0, 0, 1582.57, -96.37, 8.47, 5.57, 10, 0, 0, 80000, 0, 0, 0),
(@CREATURE+13, 28781, 607, 3, 1, 0, 0, 1610.55, -117.52, 8.77, 2.44, 10, 0, 0, 80000, 0, 0, 0),
(@CREATURE+14, 28781, 607, 3, 1, 0, 0, 1594.24, 39.16, 7.49, 0.62, 10, 0, 0, 80000, 0, 0, 0),
(@CREATURE+15, 28781, 607, 3, 1, 0, 0, 1618.60, 62.26, 7.17, 3.61, 10, 0, 0, 80000, 0, 0, 0),
(@CREATURE+16, 28781, 607, 3, 1, 0, 0, 1371.2, -317.169, 34.9982, 1.93504, 10, 0, 0, 80000, 0, 0, 0),
(@CREATURE+17, 28781, 607, 3, 1, 0, 0, 1365.52, -301.854, 34.0439, 1.91998, 10, 0, 0, 80000, 0, 0, 0),
(@CREATURE+18, 28781, 607, 3, 1, 0, 0, 1353.28, 224.092, 35.2432, 4.35363, 10, 0, 0, 80000, 0, 0, 0),
(@CREATURE+19, 28781, 607, 3, 1, 0, 0, 1347.65, 208.805, 34.2892, 4.39378, 10, 0, 0, 80000, 0, 0, 0),
-- Horde and Alliance Spirit Guides
(@CREATURE+20, 13116, 607, 3, 1, 0, 0, 1400.49, -293.963, 32.0608, 2.08096, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+21, 13117, 607, 3, 1, 0, 0, 1400.49, -293.963, 32.0608, 2.08096, 10, 0, 0, 37420, 6310, 0, 0),
(@CREATURE+22, 13116, 607, 3, 1, 0, 0, 1400.49, -293.963, 32.0608, 2.08096, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+23, 13117, 607, 3, 1, 0, 0, 1400.49, -293.963, 32.0608, 2.08096, 10, 0, 0, 37420, 6310, 0, 0),
(@CREATURE+24, 13116, 607, 3, 1, 0, 0, 1389.22, 205.673, 32.0597, 4.445, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+25, 13117, 607, 3, 1, 0, 0, 1389.22, 205.673, 32.0597, 4.445, 10, 0, 0, 37420, 6310, 0, 0),
(@CREATURE+26, 13116, 607, 3, 1, 0, 0, 1389.22, 205.673, 32.0597, 4.445, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+27, 13117, 607, 3, 1, 0, 0, 1389.22, 205.673, 32.0597, 4.445, 10, 0, 0, 37420, 6310, 0, 0),
(@CREATURE+28, 13116, 607, 3, 1, 0, 0, 1111.58, 6.40605, 69.2963, 6.20037, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+29, 13117, 607, 3, 1, 0, 0, 1111.58, 6.40605, 69.2963, 6.20037, 10, 0, 0, 37420, 6310, 0, 0),
(@CREATURE+30, 13116, 607, 3, 1, 0, 0, 1111.58, 6.40605, 69.2963, 6.20037, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+31, 13117, 607, 3, 1, 0, 0, 1111.58, 6.40605, 69.2963, 6.20037, 10, 0, 0, 37420, 6310, 0, 0),
(@CREATURE+32, 13116, 607, 3, 1, 0, 0, 952.963, -192.742, 92.3584, 0.35779, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+33, 13117, 607, 3, 1, 0, 0, 952.963, -192.742, 92.3584, 0.35779, 10, 0, 0, 37420, 6310, 0, 0),
(@CREATURE+34, 13116, 607, 3, 1, 0, 0, 1448.78, -52.9605, 5.74272, 0.0530517, 10, 0, 0, 37890, 6310, 0, 0),
(@CREATURE+35, 13117, 607, 3, 1, 0, 0, 1448.78, -52.9605, 5.74272, 0.0530517, 10, 0, 0, 37420, 6310, 0, 0);

DELETE FROM creature_battleground WHERE guid IN (SELECT guid FROM creature WHERE map=607);
INSERT INTO creature_battleground VALUES
-- Workshops
(@CREATURE, 9, 0),
(@CREATURE+1, 9, 0),
-- Antipersonnel Cannon
(@CREATURE+2, 10, 0),
(@CREATURE+3, 10, 0),
(@CREATURE+4, 10, 0),
(@CREATURE+5, 10, 0),
(@CREATURE+6, 10, 0),
(@CREATURE+7, 10, 0),
(@CREATURE+8, 10, 0),
(@CREATURE+9, 10, 0),
(@CREATURE+10, 10, 0),
(@CREATURE+11, 10, 0),
-- Battleground Demolisher
(@CREATURE+12, 9, 0),
(@CREATURE+13, 9, 0),
(@CREATURE+14, 9, 0),
(@CREATURE+15, 9, 0),
(@CREATURE+16, 12, 0),
(@CREATURE+17, 12, 0),
(@CREATURE+18, 13, 0),
(@CREATURE+19, 13, 0),
-- Horde and Alliance Spirit Guides
(@CREATURE+20, 0, 1),
(@CREATURE+21, 0, 2),
(@CREATURE+22, 0, 3),
(@CREATURE+23, 0, 4),
(@CREATURE+24, 1, 1),
(@CREATURE+25, 1, 2),
(@CREATURE+26, 1, 3),
(@CREATURE+27, 1, 4),
(@CREATURE+28, 2, 1),
(@CREATURE+29, 2, 2),
(@CREATURE+30, 2, 3),
(@CREATURE+31, 2, 4),
(@CREATURE+32, 3, 3),
(@CREATURE+33, 3, 4),
(@CREATURE+34, 4, 3),
(@CREATURE+35, 4, 4);

DELETE FROM gameobject WHERE map=607;
INSERT INTO gameobject VALUES
-- Titan Relic & Doors
(@GAMEOBJECT, 194082, 607, 3, 1, 836.502, -108.811, 111.587, 0.121379, 0, 0, 0.0606524, 0.998159, 86400, 0, 1),
(@GAMEOBJECT+1, 194083, 607, 3, 1, 836.502, -108.811, 111.587, 0.121379, 0, 0, 0.0606524, 0.998159, 86400, 0, 1),
(@GAMEOBJECT+2, 190727, 607, 3, 1, 1054.47, -107.76, 82.16, 0.06, 0, 0, 0.008726535, 0.9999619, 600, 0, 1),
(@GAMEOBJECT+3, 190726, 607, 3, 1, 1228.62, -212.12, 55.34, 0.48, 0, 0, 0.008726535, 0.9999619, 600, 0, 1),
(@GAMEOBJECT+4, 190723, 607, 3, 1, 1215.82, 80.64, 53.38, 5.68, 0, 0, 0.008726535, 0.9999619, 600, 0, 1),
(@GAMEOBJECT+5, 190724, 607, 3, 1, 1431.05, -219.21, 30.89, 0.83, 0, 0, 0.008726535, 0.9999619, 600, 0, 1),
(@GAMEOBJECT+6, 190722, 607, 3, 1, 1413.15, 107.78, 28.69, 5.42, 0, 0, 0.008726535, 0.9999619, 600, 0, 1),
(@GAMEOBJECT+7, 192549, 607, 3, 1, 873.3, -108.286, 117.171, 0.00894308, 0, 0, 0.00447152, 0.99999, 600, 0, 1),

-- Flags
(@GAMEOBJECT+8, 180058, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Alliance contested banner
(@GAMEOBJECT+9, 180060, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Horde contested banner
(@GAMEOBJECT+10, 180058, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Alliance occupied banner (not clickable)
(@GAMEOBJECT+11, 180060, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Horde occupied banner
(@GAMEOBJECT+12, 180100, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Alliance Banner Aura, for contested state
(@GAMEOBJECT+13, 180101, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Horde Banner Aura, for contested state
(@GAMEOBJECT+14, 180100, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Alliance Banner Aura, for occupied state
(@GAMEOBJECT+15, 180101, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Horde Banner Aura, for occupied state
(@GAMEOBJECT+16, 191311, 607, 3, 1, 1337.23, -157.79, 30.8947, 3.51587, 0, 0, 0.982541, -0.186048, 86400, 100, 1), -- Flagpole

(@GAMEOBJECT+17, 180058, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Alliance Banner
(@GAMEOBJECT+18, 180060, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Horde Banner
(@GAMEOBJECT+19, 180058, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Alliance Banner
(@GAMEOBJECT+20, 180060, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Horde Banner
(@GAMEOBJECT+21, 180100, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Alliance Banner Aura
(@GAMEOBJECT+22, 180101, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Horde Banner Aura
(@GAMEOBJECT+23, 180100, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Alliance Banner Aura
(@GAMEOBJECT+24, 180101, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Horde Banner Aura
(@GAMEOBJECT+25, 191311, 607, 3, 1, 1315.55, 11.8483, 31.2072, 2.85221, 0, 0, 0.989551, 0.144186, 86400, 100, 1), -- Flagpole

(@GAMEOBJECT+26, 180058, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Alliance Banner
(@GAMEOBJECT+27, 180060, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Horde Banner
(@GAMEOBJECT+28, 180058, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Alliance Banner
(@GAMEOBJECT+29, 180060, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Horde Banner
(@GAMEOBJECT+30, 180100, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Alliance Banner Aura
(@GAMEOBJECT+31, 180101, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Horde Banner Aura
(@GAMEOBJECT+32, 180100, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Alliance Banner Aura
(@GAMEOBJECT+33, 180101, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Horde Banner Aura
(@GAMEOBJECT+34, 191311, 607, 3, 1, 1206.8, -68.2148, 70.0845, 3.14279, 0, 0, 1, -0.00059919, 86400, 100, 1), -- Flagpole
-- Defender's Portal
(@GAMEOBJECT+35, 191575, 607, 3, 1, 1468.12, -225.7, 30.8969, 5.68042, 0, 0, 0.296839, -0.954928, 25, 0, 1),
(@GAMEOBJECT+36, 191575, 607, 3, 1, 1394.07, 72.3632, 31.0541, 0.818809, 0, 0, 0.398063, 0.917358, 25, 0, 1),
(@GAMEOBJECT+37, 191575, 607, 3, 1, 1216.12, 47.7665, 54.2785, 4.05465, 0, 0, 0.897588, -0.440835, 25, 0, 1),
(@GAMEOBJECT+38, 191575, 607, 3, 1, 1255.73, -233.153, 56.4357, 5.01833, 0, 0, 0.591105, -0.806595, 25, 0, 1),
(@GAMEOBJECT+39, 191575, 607, 3, 1, 1065.02, -89.9522, 81.0758, 1.58771, 0, 0, 0.71306, 0.701103, 25, 0, 1),
(@GAMEOBJECT+40, 191575, 607, 3, 1, 880.162, -95.979, 109.835, 3.14672, 0, 0, 0.999997, -0.00256531, 25, 0, 1),
(@GAMEOBJECT+41, 191575, 607, 3, 1, 880.68, -120.799, 109.835, 3.16636, 0, 0, 0.999923, -0.0123816, 25, 0, 1),
-- Seaforium Bombs
-- Western base bombs
(@GAMEOBJECT+42, 190753 , 607 , 3 , 1 , 1333.45 , 211.354 , 31.0538 , 5.03666 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+43, 190753 , 607 , 3 , 1 , 1334.29 , 209.582 , 31.0532 , 1.28088 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+44, 190753 , 607 , 3 , 1 , 1332.72 , 210.049 , 31.0532 , 1.28088 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+45, 190753 , 607 , 3 , 1 , 1334.28 , 210.78 , 31.0538 , 3.85856 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+46, 190753 , 607 , 3 , 1 , 1332.64 , 211.39 , 31.0532 , 1.29266 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+47, 190753 , 607 , 3 , 1 , 1371.41 , 194.028 , 31.5107 , 0.753095 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+48, 190753 , 607 , 3 , 1 , 1372.39 , 194.951 , 31.4679 , 0.753095 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+49, 190753 , 607 , 3 , 1 , 1371.58 , 196.942 , 30.9349 , 1.01777 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+50, 190753 , 607 , 3 , 1 , 1370.43 , 196.614 , 30.9349 , 0.957299 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+51, 190753 , 607 , 3 , 1 , 1369.46 , 196.877 , 30.9351 , 2.45348 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+52, 190753 , 607 , 3 , 1 , 1370.35 , 197.361 , 30.9349 , 1.08689 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+53, 190753 , 607 , 3 , 1 , 1369.47 , 197.941 , 30.9349 , 0.984787 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+54, 194086 , 607 , 3 , 1 , 1333.45 , 211.354 , 31.0538 , 5.03666 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+55, 194086 , 607 , 3 , 1 , 1334.29 , 209.582 , 31.0532 , 1.28088 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+56, 194086 , 607 , 3 , 1 , 1332.72 , 210.049 , 31.0532 , 1.28088 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+57, 194086 , 607 , 3 , 1 , 1334.28 , 210.78 , 31.0538 , 3.85856 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+58, 194086 , 607 , 3 , 1 , 1332.64 , 211.39 , 31.0532 , 1.29266 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+59, 194086 , 607 , 3 , 1 , 1371.41 , 194.028 , 31.5107 , 0.753095 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+60, 194086 , 607 , 3 , 1 , 1372.39 , 194.951 , 31.4679 , 0.753095 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+61, 194086 , 607 , 3 , 1 , 1371.58 , 196.942 , 30.9349 , 1.01777 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+62, 194086 , 607 , 3 , 1 , 1370.43 , 196.614 , 30.9349 , 0.957299 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+63, 194086 , 607 , 3 , 1 , 1369.46 , 196.877 , 30.9351 , 2.45348 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+64, 194086 , 607 , 3 , 1 , 1370.35 , 197.361 , 30.9349 , 1.08689 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+65, 194086 , 607 , 3 , 1 , 1369.47 , 197.941 , 30.9349 , 0.984787 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
-- Beach bombs
(@GAMEOBJECT+66, 190753 , 607 , 3 , 1 , 1592.49 , 47.5969 , 7.52271 , 4.63218 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+67, 190753 , 607 , 3 , 1 , 1593.91 , 47.8036 , 7.65856 , 4.63218 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+68, 190753 , 607 , 3 , 1 , 1593.13 , 46.8106 , 7.54073 , 4.63218 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+69, 190753 , 607 , 3 , 1 , 1589.22 , 36.3616 , 7.45975 , 4.64396 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+70, 190753 , 607 , 3 , 1 , 1588.24 , 35.5842 , 7.55613 , 4.79564 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+71, 190753 , 607 , 3 , 1 , 1588.14 , 36.7611 , 7.49675 , 4.79564 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+72, 190753 , 607 , 3 , 1 , 1595.74 , 35.5278 , 7.46602 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+73, 190753 , 607 , 3 , 1 , 1596 , 36.6475 , 7.47991 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+74, 190753 , 607 , 3 , 1 , 1597.03 , 36.2356 , 7.48631 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+75, 190753 , 607 , 3 , 1 , 1597.93 , 37.1214 , 7.51725 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+76, 190753 , 607 , 3 , 1 , 1598.16 , 35.888 , 7.50018 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+77, 190753 , 607 , 3 , 1 , 1579.6 , -98.0917 , 8.48478 , 1.37996 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+78, 190753 , 607 , 3 , 1 , 1581.2 , -98.401 , 8.47483 , 1.37996 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+79, 190753 , 607 , 3 , 1 , 1580.38 , -98.9556 , 8.4772 , 1.38781 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+80, 190753 , 607 , 3 , 1 , 1585.68 , -104.966 , 8.88551 , 0.493246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+81, 190753 , 607 , 3 , 1 , 1586.15 , -106.033 , 9.10616 , 0.493246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+82, 190753 , 607 , 3 , 1 , 1584.88 , -105.394 , 8.82985 , 0.493246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+83, 190753 , 607 , 3 , 1 , 1581.87 , -100.899 , 8.46164 , 0.929142 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+84, 190753 , 607 , 3 , 1 , 1581.48 , -99.4657 , 8.46926 , 0.929142 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+85, 190753 , 607 , 3 , 1 , 1583.2 , -91.2291 , 8.49227 , 1.40038 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+86, 190753 , 607 , 3 , 1 , 1581.94 , -91.0119 , 8.49977 , 1.40038 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+87, 190753 , 607 , 3 , 1 , 1582.33 , -91.951 , 8.49353 , 1.1844 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+88, 194086 , 607 , 3 , 1 , 1592.49 , 47.5969 , 7.52271 , 4.63218 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+89, 194086 , 607 , 3 , 1 , 1593.91 , 47.8036 , 7.65856 , 4.63218 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+90, 194086 , 607 , 3 , 1 , 1593.13 , 46.8106 , 7.54073 , 4.63218 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+91, 194086 , 607 , 3 , 1 , 1589.22 , 36.3616 , 7.45975 , 4.64396 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+92, 194086 , 607 , 3 , 1 , 1588.24 , 35.5842 , 7.55613 , 4.79564 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+93, 194086 , 607 , 3 , 1 , 1588.14 , 36.7611 , 7.49675 , 4.79564 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+94, 194086 , 607 , 3 , 1 , 1595.74 , 35.5278 , 7.46602 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+95, 194086 , 607 , 3 , 1 , 1596 , 36.6475 , 7.47991 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+96, 194086 , 607 , 3 , 1 , 1597.03 , 36.2356 , 7.48631 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+97, 194086 , 607 , 3 , 1 , 1597.93 , 37.1214 , 7.51725 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+98, 194086 , 607 , 3 , 1 , 1598.16 , 35.888 , 7.50018 , 4.90246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+99, 194086 , 607 , 3 , 1 , 1579.6 , -98.0917 , 8.48478 , 1.37996 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+100, 194086 , 607 , 3 , 1 , 1581.2 , -98.401 , 8.47483 , 1.37996 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+101, 194086 , 607 , 3 , 1 , 1580.38 , -98.9556 , 8.4772 , 1.38781 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+102, 194086 , 607 , 3 , 1 , 1585.68 , -104.966 , 8.88551 , 0.493246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+103, 194086 , 607 , 3 , 1 , 1586.15 , -106.033 , 9.10616 , 0.493246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+104, 194086 , 607 , 3 , 1 , 1584.88 , -105.394 , 8.82985 , 0.493246 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+105, 194086 , 607 , 3 , 1 , 1581.87 , -100.899 , 8.46164 , 0.929142 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+106, 194086 , 607 , 3 , 1 , 1581.48 , -99.4657 , 8.46926 , 0.929142 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+107, 194086 , 607 , 3 , 1 , 1583.2 , -91.2291 , 8.49227 , 1.40038 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+108, 194086 , 607 , 3 , 1 , 1581.94 , -91.0119 , 8.49977 , 1.40038 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+109, 194086 , 607 , 3 , 1 , 1582.33 , -91.951 , 8.49353 , 1.1844 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
-- Eastern base bombs
(@GAMEOBJECT+110 , 190753 , 607 , 3 , 1 , 1342.06 , -304.049 , 30.9532 , 5.59507 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+111, 190753 , 607 , 3 , 1 , 1340.96 , -304.536 , 30.9458 , 1.28323 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+112, 190753 , 607 , 3 , 1 , 1341.22 , -303.316 , 30.9413 , 0.486051 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+113, 190753 , 607 , 3 , 1 , 1342.22 , -302.939 , 30.986 , 4.87643 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+114, 190753 , 607 , 3 , 1 , 1382.16 , -287.466 , 32.3063 , 4.80968 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+115, 190753 , 607 , 3 , 1 , 1381 , -287.58 , 32.2805 , 4.80968 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+116, 190753 , 607 , 3 , 1 , 1381.55 , -286.536 , 32.3929 , 2.84225 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+117, 190753 , 607 , 3 , 1 , 1382.75 , -286.354 , 32.4099 , 1.00442 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+118, 190753 , 607 , 3 , 1 , 1379.92 , -287.34 , 32.2872 , 3.81615 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+119, 194086 , 607 , 3 , 1 , 1342.06 , -304.049 , 30.9532 , 5.59507 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+120, 194086 , 607 , 3 , 1 , 1340.96 , -304.536 , 30.9458 , 1.28323 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+121, 194086 , 607 , 3 , 1 , 1341.22 , -303.316 , 30.9413 , 0.486051 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+122, 194086 , 607 , 3 , 1 , 1342.22 , -302.939 , 30.986 , 4.87643 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+123, 194086 , 607 , 3 , 1 , 1382.16 , -287.466 , 32.3063 , 4.80968 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+124, 194086 , 607 , 3 , 1 , 1381 , -287.58 , 32.2805 , 4.80968 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+125, 194086 , 607 , 3 , 1 , 1381.55 , -286.536 , 32.3929 , 2.84225 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+126, 194086 , 607 , 3 , 1 , 1382.75 , -286.354 , 32.4099 , 1.00442 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+127, 194086 , 607 , 3 , 1 , 1379.92 , -287.34 , 32.2872 , 3.81615 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
-- Middle bombs (both beach and relic side)
(@GAMEOBJECT+128 , 190753 , 607 , 3 , 1 , 1100.52 , -2.41391 , 70.2984 , 0.131054 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+129, 190753 , 607 , 3 , 1 , 1099.35 , -2.13851 , 70.3375 , 4.4586 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+130, 190753 , 607 , 3 , 1 , 1099.59 , -1.00329 , 70.238 , 2.49903 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+131, 190753 , 607 , 3 , 1 , 1097.79 , 0.571316 , 70.159 , 4.00307 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+132, 190753 , 607 , 3 , 1 , 1098.74 , -7.23252 , 70.7972 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+133, 190753 , 607 , 3 , 1 , 1098.46 , -5.91443 , 70.6715 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+134, 190753 , 607 , 3 , 1 , 1097.53 , -7.39704 , 70.7959 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+135, 190753 , 607 , 3 , 1 , 1097.32 , -6.64233 , 70.7424 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+136, 190753 , 607 , 3 , 1 , 1096.45 , -5.96664 , 70.7242 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+137, 190753 , 607 , 3 , 1 , 971.725 , 0.496763 , 86.8467 , 2.09233 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+138, 190753 , 607 , 3 , 1 , 973.589 , 0.119518 , 86.7985 , 3.17225 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+139, 190753 , 607 , 3 , 1 , 972.524 , 1.25333 , 86.8351 , 5.28497 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+140, 190753 , 607 , 3 , 1 , 971.993 , 2.05668 , 86.8584 , 5.28497 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+141, 190753 , 607 , 3 , 1 , 973.635 , 2.11805 , 86.8197 , 2.36722 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+142, 190753 , 607 , 3 , 1 , 974.791 , 1.74679 , 86.7942 , 1.5936 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+143, 190753 , 607 , 3 , 1 , 974.771 , 3.0445 , 86.8125 , 0.647199 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+144, 190753 , 607 , 3 , 1 , 979.554 , 3.6037 , 86.7923 , 1.69178 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+145, 190753 , 607 , 3 , 1 , 979.758 , 2.57519 , 86.7748 , 1.76639 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+146, 190753 , 607 , 3 , 1 , 980.769 , 3.48904 , 86.7939 , 1.76639 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+147, 190753 , 607 , 3 , 1 , 979.122 , 2.87109 , 86.7794 , 1.76639 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+148, 190753 , 607 , 3 , 1 , 986.167 , 4.85363 , 86.8439 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+149, 190753 , 607 , 3 , 1 , 986.176 , 3.50367 , 86.8217 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+150, 190753 , 607 , 3 , 1 , 987.33 , 4.67389 , 86.8486 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+151, 190753 , 607 , 3 , 1 , 985.23 , 4.65898 , 86.8368 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+152, 190753 , 607 , 3 , 1 , 984.556 , 3.54097 , 86.8137 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+153, 194086 , 607 , 3 , 1 , 1100.52 , -2.41391 , 70.2984 , 0.131054 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+154, 194086 , 607 , 3 , 1 , 1099.35 , -2.13851 , 70.3375 , 4.4586 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+155, 194086 , 607 , 3 , 1 , 1099.59 , -1.00329 , 70.238 , 2.49903 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+156, 194086 , 607 , 3 , 1 , 1097.79 , 0.571316 , 70.159 , 4.00307 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+157, 194086 , 607 , 3 , 1 , 1098.74 , -7.23252 , 70.7972 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+158, 194086 , 607 , 3 , 1 , 1098.46 , -5.91443 , 70.6715 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+159, 194086 , 607 , 3 , 1 , 1097.53 , -7.39704 , 70.7959 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+160, 194086 , 607 , 3 , 1 , 1097.32 , -6.64233 , 70.7424 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+161, 194086 , 607 , 3 , 1 , 1096.45 , -5.96664 , 70.7242 , 4.1523 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+162, 194086 , 607 , 3 , 1 , 971.725 , 0.496763 , 86.8467 , 2.09233 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+163, 194086 , 607 , 3 , 1 , 973.589 , 0.119518 , 86.7985 , 3.17225 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+164, 194086 , 607 , 3 , 1 , 972.524 , 1.25333 , 86.8351 , 5.28497 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+165, 194086 , 607 , 3 , 1 , 971.993 , 2.05668 , 86.8584 , 5.28497 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+166, 194086 , 607 , 3 , 1 , 973.635 , 2.11805 , 86.8197 , 2.36722 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+167, 194086 , 607 , 3 , 1 , 974.791 , 1.74679 , 86.7942 , 1.5936 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+168, 194086 , 607 , 3 , 1 , 974.771 , 3.0445 , 86.8125 , 0.647199 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+169, 194086 , 607 , 3 , 1 , 979.554 , 3.6037 , 86.7923 , 1.69178 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+170, 194086 , 607 , 3 , 1 , 979.758 , 2.57519 , 86.7748 , 1.76639 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+171, 194086 , 607 , 3 , 1 , 980.769 , 3.48904 , 86.7939 , 1.76639 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+172, 194086 , 607 , 3 , 1 , 979.122 , 2.87109 , 86.7794 , 1.76639 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+173, 194086 , 607 , 3 , 1 , 986.167 , 4.85363 , 86.8439 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+174, 194086 , 607 , 3 , 1 , 986.176 , 3.50367 , 86.8217 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+175, 194086 , 607 , 3 , 1 , 987.33 , 4.67389 , 86.8486 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+176, 194086 , 607 , 3 , 1 , 985.23 , 4.65898 , 86.8368 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+177, 194086 , 607 , 3 , 1 , 984.556 , 3.54097 , 86.8137 , 1.5779 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+178, 192687 , 607 , 3 , 1 , 1415.57 , 105.176 , 41.5615 , 5.44516 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+179, 192689 , 607 , 3 , 1 , 1433.34 , -216.488 , 43.4646 , 0.871786 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+180, 192690 , 607 , 3 , 1 , 1231.73 , -210.455 , 67.8883 , 0.512855 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+181, 192691 , 607 , 3 , 1 , 1218.8 , 78.7113 , 65.5368 , 5.64543 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+182, 192685 , 607 , 3 , 1 , 1057.88 , -107.601 , 94.7255 , 0.0471208 , 0 , 0 , 0 , 0 , 10 , 0 , 0);

DELETE FROM gameobject_battleground WHERE guid IN (SELECT guid FROM gameobject WHERE map=607);
INSERT INTO gameobject_battleground VALUES
-- Titan Relic & Doors
(@GAMEOBJECT, 14, 1),
(@GAMEOBJECT+1, 14, 2),
(@GAMEOBJECT+2, 11, 0),
(@GAMEOBJECT+3, 11, 0),
(@GAMEOBJECT+4, 11, 0),
(@GAMEOBJECT+5, 11, 0),
(@GAMEOBJECT+6, 11, 0),
(@GAMEOBJECT+7, 11, 0),

(@GAMEOBJECT+8, 0, 1),
(@GAMEOBJECT+9, 0, 2),
(@GAMEOBJECT+10, 0, 3),
(@GAMEOBJECT+11, 0, 4),
(@GAMEOBJECT+12, 0, 1),
(@GAMEOBJECT+13, 0, 2),
(@GAMEOBJECT+14, 0, 3),
(@GAMEOBJECT+15, 0, 4),
(@GAMEOBJECT+16, 11, 0),

(@GAMEOBJECT+17, 1, 1),
(@GAMEOBJECT+18, 1, 2),
(@GAMEOBJECT+19, 1, 3),
(@GAMEOBJECT+20, 1, 4),
(@GAMEOBJECT+21, 1, 1),
(@GAMEOBJECT+22, 1, 2),
(@GAMEOBJECT+23, 1, 3),
(@GAMEOBJECT+24, 1, 4),
(@GAMEOBJECT+25, 11, 0),

(@GAMEOBJECT+26, 2, 1),
(@GAMEOBJECT+27, 2, 2),
(@GAMEOBJECT+28, 2, 3),
(@GAMEOBJECT+29, 2, 4),
(@GAMEOBJECT+30, 2, 1),
(@GAMEOBJECT+31, 2, 2),
(@GAMEOBJECT+32, 2, 3),
(@GAMEOBJECT+33, 2, 4),
(@GAMEOBJECT+34, 11, 0),
-- Defender's Portal
(@GAMEOBJECT+35, 11, 0),
(@GAMEOBJECT+36, 11, 0),
(@GAMEOBJECT+37, 11, 0),
(@GAMEOBJECT+38, 11, 0),
(@GAMEOBJECT+39, 11, 0),
(@GAMEOBJECT+40, 11, 0),
(@GAMEOBJECT+41, 11, 0),
-- Seaforium Bombs
-- Western base bombs
(@GAMEOBJECT+42, 6, 3),
(@GAMEOBJECT+43, 6, 3),
(@GAMEOBJECT+44, 6, 3),
(@GAMEOBJECT+45, 6, 3),
(@GAMEOBJECT+46, 6, 3),
(@GAMEOBJECT+47, 6, 3),
(@GAMEOBJECT+48, 6, 3),
(@GAMEOBJECT+49, 6, 3),
(@GAMEOBJECT+50, 6, 3),
(@GAMEOBJECT+51, 6, 3),
(@GAMEOBJECT+52, 6, 3),
(@GAMEOBJECT+53, 6, 3),
(@GAMEOBJECT+54, 6, 4),
(@GAMEOBJECT+55, 6, 4),
(@GAMEOBJECT+56, 6, 4),
(@GAMEOBJECT+57, 6, 4),
(@GAMEOBJECT+58, 6, 4),
(@GAMEOBJECT+59, 6, 4),
(@GAMEOBJECT+60, 6, 4),
(@GAMEOBJECT+61, 6, 4),
(@GAMEOBJECT+62, 6, 4),
(@GAMEOBJECT+63, 6, 4),
(@GAMEOBJECT+64, 6, 4),
(@GAMEOBJECT+65, 6, 4),
-- Beach bombs
(@GAMEOBJECT+66, 8, 3),
(@GAMEOBJECT+67, 8, 3),
(@GAMEOBJECT+68, 8, 3),
(@GAMEOBJECT+69, 8, 3),
(@GAMEOBJECT+70, 8, 3),
(@GAMEOBJECT+71, 8, 3),
(@GAMEOBJECT+72, 8, 3),
(@GAMEOBJECT+73, 8, 3),
(@GAMEOBJECT+74, 8, 3),
(@GAMEOBJECT+75, 8, 3),
(@GAMEOBJECT+76, 8, 3),
(@GAMEOBJECT+77, 8, 3),
(@GAMEOBJECT+78, 8, 3),
(@GAMEOBJECT+79, 8, 3),
(@GAMEOBJECT+80, 8, 3),
(@GAMEOBJECT+81, 8, 3),
(@GAMEOBJECT+82, 8, 3),
(@GAMEOBJECT+83, 8, 3),
(@GAMEOBJECT+84, 8, 3),
(@GAMEOBJECT+85, 8, 3),
(@GAMEOBJECT+86, 8, 3),
(@GAMEOBJECT+87, 8, 3),
(@GAMEOBJECT+88, 8, 4),
(@GAMEOBJECT+89, 8, 4),
(@GAMEOBJECT+90, 8, 4),
(@GAMEOBJECT+91, 8, 4),
(@GAMEOBJECT+92, 8, 4),
(@GAMEOBJECT+93, 8, 4),
(@GAMEOBJECT+94, 8, 4),
(@GAMEOBJECT+95, 8, 4),
(@GAMEOBJECT+96, 8, 4),
(@GAMEOBJECT+97, 8, 4),
(@GAMEOBJECT+98, 8, 4),
(@GAMEOBJECT+99, 8, 4),
(@GAMEOBJECT+100, 8, 4),
(@GAMEOBJECT+101, 8, 4),
(@GAMEOBJECT+102, 8, 4),
(@GAMEOBJECT+103, 8, 4),
(@GAMEOBJECT+104, 8, 4),
(@GAMEOBJECT+105, 8, 4),
(@GAMEOBJECT+106, 8, 4),
(@GAMEOBJECT+107, 8, 4),
(@GAMEOBJECT+108, 8, 4),
(@GAMEOBJECT+109, 8, 4),
-- Eastern base bombs
(@GAMEOBJECT+110, 5, 4),
(@GAMEOBJECT+111, 5, 3),
(@GAMEOBJECT+112, 5, 3),
(@GAMEOBJECT+113, 5, 3),
(@GAMEOBJECT+114, 5, 3),
(@GAMEOBJECT+115, 5, 3),
(@GAMEOBJECT+116, 5, 3),
(@GAMEOBJECT+117, 5, 3),
(@GAMEOBJECT+118, 5, 3),
(@GAMEOBJECT+119, 5, 4),
(@GAMEOBJECT+120, 5, 4),
(@GAMEOBJECT+121, 5, 4),
(@GAMEOBJECT+122, 5, 4),
(@GAMEOBJECT+123, 5, 4),
(@GAMEOBJECT+124, 5, 4),
(@GAMEOBJECT+125, 5, 4),
(@GAMEOBJECT+126, 5, 4),
(@GAMEOBJECT+127, 5, 4),
-- Middle bombs (both beach and relic side)
(@GAMEOBJECT+128, 7, 3),
(@GAMEOBJECT+129, 7, 3),
(@GAMEOBJECT+130, 7, 3),
(@GAMEOBJECT+131, 7, 3),
(@GAMEOBJECT+132, 7, 3),
(@GAMEOBJECT+133, 7, 3),
(@GAMEOBJECT+134, 7, 3),
(@GAMEOBJECT+135, 7, 3),
(@GAMEOBJECT+136, 7, 3),
(@GAMEOBJECT+137, 7, 3),
(@GAMEOBJECT+138, 7, 3),
(@GAMEOBJECT+139, 7, 3),
(@GAMEOBJECT+140, 7, 3),
(@GAMEOBJECT+141, 7, 3),
(@GAMEOBJECT+142, 7, 3),
(@GAMEOBJECT+143, 7, 3),
(@GAMEOBJECT+144, 7, 3),
(@GAMEOBJECT+145, 7, 3),
(@GAMEOBJECT+146, 7, 3),
(@GAMEOBJECT+147, 7, 3),
(@GAMEOBJECT+148, 7, 3),
(@GAMEOBJECT+149, 7, 3),
(@GAMEOBJECT+150, 7, 3),
(@GAMEOBJECT+151, 7, 3),
(@GAMEOBJECT+152, 7, 3),
(@GAMEOBJECT+153, 7, 4),
(@GAMEOBJECT+154, 7, 4),
(@GAMEOBJECT+155, 7, 4),
(@GAMEOBJECT+156, 7, 4),
(@GAMEOBJECT+157, 7, 4),
(@GAMEOBJECT+158, 7, 4),
(@GAMEOBJECT+159, 7, 4),
(@GAMEOBJECT+160, 7, 4),
(@GAMEOBJECT+161, 7, 4),
(@GAMEOBJECT+162, 7, 4),
(@GAMEOBJECT+163, 7, 4),
(@GAMEOBJECT+164, 7, 4),
(@GAMEOBJECT+165, 7, 4),
(@GAMEOBJECT+166, 7, 4),
(@GAMEOBJECT+167, 7, 4),
(@GAMEOBJECT+168, 7, 4),
(@GAMEOBJECT+169, 7, 4),
(@GAMEOBJECT+170, 7, 4),
(@GAMEOBJECT+171, 7, 4),
(@GAMEOBJECT+172, 7, 4),
(@GAMEOBJECT+173, 7, 4),
(@GAMEOBJECT+174, 7, 4),
(@GAMEOBJECT+175, 7, 4),
(@GAMEOBJECT+176, 7, 4),
(@GAMEOBJECT+177, 7, 4),
(@GAMEOBJECT+178, 15, 0),
(@GAMEOBJECT+179, 16, 0),
(@GAMEOBJECT+180, 17, 0),
(@GAMEOBJECT+181, 18, 0),
(@GAMEOBJECT+182, 19, 0);

DELETE FROM battleground_events WHERE map = 607;
INSERT INTO battleground_events (map, event1, event2, description) VALUES
(607, 0, 1, 'East gy - A contested'),   -- flags, spirit healers only
(607, 0, 2, 'East gy - H contested'),
(607, 0, 3, 'East gy - A occupied'),
(607, 0, 4, 'East gy - H occupied'),
(607, 1, 1, 'West gy - A contested'),
(607, 1, 2, 'West gy - H contested'),
(607, 1, 3, 'West gy - A occupied'),
(607, 1, 4, 'West gy - H occupied'),
(607, 2, 1, 'Central gy - A contested'),
(607, 2, 2, 'Central gy - H contested'),
(607, 2, 3, 'Central gy - A occupied'),
(607, 2, 4, 'Central gy - H occupied'),
(607, 3, 3, 'Relic gy A'),
(607, 3, 4, 'Relic gy H'),
(607, 4, 3, 'Beach gy A'),
(607, 4, 4, 'Beach gy H'),
(607, 5, 3, 'East bombs - A occupied'), -- bombs only
(607, 5, 4, 'East bombs - H occupied'),
(607, 6, 3, 'West bombs - A occupied'),
(607, 6, 4, 'West bombs - H occupied'),
(607, 7, 3, 'Central bombs - A occupied'),
(607, 7, 4, 'Central bombs - H occupied'),
(607, 8, 3, 'Beach bombs - A occupied'),
(607, 8, 4, 'Beach bombs - H occupied'),
(607, 9, 0, 'Dock demolishers, factory npcs'),
(607, 10, 0, 'Defender cannons'),
(607, 11, 0, 'Gameobjects'),            -- flagpoles, defender portals, gates, relic
(607, 12, 0, 'E base demolishers'),
(607, 13, 0, 'W base demolishers'),
(607, 14, 1, 'Titan Relic - A attacking'),
(607, 14, 2, 'Titan Relic - H attacking'),
(607, 15, 0, 'Green sigil'),
(607, 16, 0, 'Blue sigil'),
(607, 17, 0, 'Red sigil'),
(607, 18, 0, 'Purple sigil'),
(607, 19, 0, 'Yellow sigil');

-- Fix Rotation for all Objects in Map
UPDATE gameobject SET rotation0=0, rotation1=0, rotation2=SIN(orientation*0.5), rotation3=COS(orientation*0.5) WHERE map = 607;

DELETE FROM mangos_string WHERE entry BETWEEN 20000 AND 20044;
INSERT INTO mangos_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES
(20000, 'The battle for Strand of the Ancients begins in 2 minute.', NULL, NULL, 'Die Schlacht um den Strand der Uralten beginnt in 2 Minuten.', NULL, NULL, 'La batalla por la Playa de los Ancestros comenzará en 2 minutos.', 'La batalla por la Playa de los Ancestros comenzará en 2 minutos.', 'Битва за Берег Древних начнется через 2 минуты.'),
(20001, 'The battle for Strand of the Ancients begins in 1 minute.', NULL, NULL, 'Die Schlacht um den Strand der Uralten beginnt in 1 Minute.', NULL, NULL, 'La batalla por la Playa de los Ancestros comenzará en 1 minuto.', 'La batalla por la Playa de los Ancestros comenzará en 1 minuto.', 'Битва за Берег Древних начнется через 1 минуту.'),
(20002, 'The battle for Strand of the Ancients begins in 30 seconds.', NULL, NULL, 'Die Schlacht um den Strand der Uralten beginnt in 30 Sekunden.', NULL, NULL, 'La batalla por la Playa de los Ancestros comenzará en 30 segundos. ¡Preparaos!', 'La batalla por la Playa de los Ancestros comenzará en 30 segundos. ¡Preparaos!', 'Битва за Берег Древних начнется через 30 секунд. Приготовтесь!'),
(20003, 'The battle for Strand of the Ancients has begun!', NULL, NULL, 'Lasst die Schlacht um den Strand der Uralten beginnen!', NULL, NULL, '¡Que comience la batalla por la Playa de los Ancestros!', '¡Que comience la batalla por la Playa de los Ancestros!', 'Битва за Берег Древних началась! '),
(20004, 'The %s is under attack!', NULL, NULL, '%s wird angegriffen!', NULL, NULL, '¡La puerta %s esta siendo asediada!', '¡La puerta %s esta siendo asediada!', 'Врата %s подвергаются нападению!'),
(20005, 'The %s is damaged!', NULL, NULL, '%s ist beschadigt!', NULL, NULL, '¡La puerta %s ha sido dañada!', '¡La puerta %s ha sido dañada!', 'Врата %s повреждены!'),
(20006, 'The %s was destroyed!', NULL, NULL, '%s ist zerstort!', NULL, NULL, '¡La puerta %s ha sido destruida!', '¡La puerta %s ha sido destruida!', 'Врата %s уничтожены!'),
(20007, 'Gate of the Green Emerald', NULL, NULL, 'Das Tor des Smaragdhorizonts', NULL, NULL, 'de la Esmeralda Verde', 'de la Esmeralda Verde', 'Зеленого изумруда'),
(20008, 'Gate of the Blue Sapphire', NULL, NULL, 'Das Tor des Saphirhimmels', NULL, NULL, 'del Zafiro Azul', 'del Zafiro Azul', 'Синего сапфира'),
(20009, 'Gate of the Purple Amethyst', NULL, NULL, 'Das Tor des Amethysystems', NULL, NULL, 'de la Amatista Púrpura', 'de la Amatista Púrpura', 'Лилового аметиста'),
(20010, 'Gate of the Red Sun', NULL, NULL, 'Das Tor der Rubinsonne', NULL, NULL, 'del Sol Rojo', 'del Sol Rojo', 'Красного солнца'),
(20011, 'Gate of the Yellow Moon', NULL, NULL, 'Das Tor des Goldmondes', NULL, NULL, 'de la Luna Amarilla', 'de la Luna Amarilla', 'Желтой луны'),
(20012, 'Chamber of Ancient Relics', NULL, NULL,'Die Kammer der Uralten', NULL, NULL, 'Cámara de Reliquias Antiguas', 'Cámara de Reliquias Antiguas', 'Комната древних святынь'),
(20013, 'East graveyard!', NULL, NULL, 'ostlicher Friedhof!', NULL, NULL, 'Cementerio Este', 'Cementerio Este', 'Восточное кладбище!'),
(20014, 'West graveyard!', NULL, NULL, 'westlicher Friedhof!', NULL, NULL, 'Cementerio Oeste', 'Cementerio Oeste', 'Западное кладбище!'),
(20015, 'South graveyard!', NULL, NULL, 'sudlicher Friedhof!', NULL, NULL, 'Cementerio Sur', 'Cementerio Sur', 'Южное кладбище!'),
(20016, '$n placed a Seaforium Charge!', NULL, NULL, '$n plaziert eine Zephyriumladung!', NULL, NULL, '¡$n ha colocado una carga de seforio!', '¡$n ha colocado una carga de seforio!', '$n заложил сифориевый заряд!'),
(20017, 'The Alliance won the first round, the Relic of Titan was captured!', NULL, NULL, 'Die Allianz hat die erste Runde gewonnen, das Titanenportal erobert!', NULL, NULL, '¡La Alianza gana la primera ronda! ¡La reliquia de Titán ha sido capturada!', '¡La Alianza gana la primera ronda! ¡La reliquia de Titán ha sido capturada!', 'Первый раунд за Альянсом! Реликвия Титана захвачена!'),
(20018, 'The Horde won the first round, the Relic of Titan was captured!', NULL, NULL, 'Die Horde hat die erste Runde gewonnen, das Titanenportal erobert!', NULL, NULL, '¡La Horda gana la primera ronda! ¡La reliquia de Titán ha sido capturada!', '¡La Horda gana la primera ronda! ¡La reliquia de Titán ha sido capturada!', 'Первый раунд за Ордой! Реликвия Титана захвачена!'),
(20019, 'The Alliance won the second round, the Relic of Titan was captured!', NULL, NULL, 'Die Allianz hat die zweite Runde gewonnen, das Titanenportal erobert!', NULL, NULL, '¡La Horda gana la segunda ronda! ¡La reliquia de Titán ha sido capturada!', '¡La Horda gana la segunda ronda! ¡La reliquia de Titán ha sido capturada!', 'Второй раунд за Альянсом! Реликвия Титана захвачена!'),
(20020, 'The Horde won the second round, the Relic of Titan was captured!', NULL, NULL, 'Die Horde hat die zweite Runde gewonnen, das Titanenportal erobert!', NULL, NULL, '¡La Alianza gana la segunda ronda! ¡La reliquia de Titán ha sido capturada!', '¡La Alianza gana la segunda ronda! ¡La reliquia de Titán ha sido capturada!', 'Второй раунд за Ордой! Реликвия Титана захвачена!'),
(20021, 'The Eastern Graveyard has been captured by the Horde!', NULL, NULL, NULL, NULL, NULL, '¡La Horda ha capturado el cementerio oriental!', '¡La Horda ha capturado el cementerio oriental!', 'Орда захватила Восточное кладбище!'),
(20022, 'The Western Graveyard has been captured by the Horde!', NULL, NULL, NULL, NULL, NULL, '¡La Horda ha capturado el cementerio occidental!', '¡La Horda ha capturado el cementerio occidental!', 'Орда захватила Западное кладбище!'),
(20023, 'The Southern Graveyard has been captured by the Horde!', NULL, NULL, NULL, NULL, NULL, '¡La Horda ha capturado el cementerio sur!', '¡La Horda ha capturado el cementerio sur!', 'Орда захватила Южное кладбище!'),
(20024, 'The Eastern Graveyard has been captured by the Alliance!', NULL, NULL, NULL, NULL, NULL, '¡La Alianza ha capturado el cementerio oriental!', '¡La Alianza ha capturado el cementerio oriental!', 'Альянс захватил Восточное кладбище!'),
(20025, 'The Western Graveyard has been captured by the Alliance!', NULL, NULL, NULL, NULL, NULL, '¡La Alianza ha capturado el cementerio occidental!', '¡La Alianza ha capturado el cementerio occidental!', 'Альянс захватил Западное кладбище!'),
(20026, 'The Southern Graveyard has been captured by the Alliance!', NULL, NULL, NULL, NULL, NULL, '¡La Alianza ha capturado el cementerio sur!', '¡La Alianza ha capturado el cementerio sur!', 'Альянс захватил Южное кладбище!'),
(20027, 'The chamber has been breached! The Titan Relic is vulnerable!', NULL, NULL, NULL, NULL, NULL, '¡La puerta de la Cámara de Reliquias antiguas ha sido destruida! ¡La reliquia de titán es vulnerable!', '¡La puerta de la Cámara de Reliquias antiguas ha sido destruida! ¡La reliquia de titán es vulnerable!', 'Комната древних святынь разрушена!'),
(20028, 'The Gate of the Green Emerald was destroyed!', NULL, NULL, 'Das Tor des Smaragdhorizonts ist zerstort!', NULL, NULL, '¡La puerta de la Esmeralda Verde ha sido destruida!', '¡La puerta de la Esmeralda Verde ha sido destruida!', 'Врата Зеленого Изумруда разрушены!'),
(20029, 'The Gate of the Blue Sapphire was destroyed!', NULL, NULL, 'Das Tor des Saphirhimmels ist zerstort!', NULL, NULL, '¡La puerta del Zafiro Azul ha sido destruida!', '¡La puerta del Zafiro Azul ha sido destruida!', 'Врата Синего Сапфира разрушены!'),
(20030, 'The Gate of the Purple Amethyst was destroyed!', NULL, NULL, 'Das Tor des Amethyststerns ist zerstort worden', NULL, NULL, '¡La puerta de la Amatista Púrpura ha sido destruida!', '¡La puerta de la Amatista Púrpura ha sido destruida!', 'Врата Лилового Аметиста разрушены!'),
(20031, 'The Gate of the Red Sun was destroyed!', NULL, NULL, 'Das Tor der Rubinsonne ist zerstort worden!', NULL, NULL, '¡La puerta del Sol Rojo ha sido destruida!', '¡La puerta del Sol Rojo ha sido destruida!', 'Врата Красного Солнца разрушены!'),
(20032, 'The Gate of the Yellow Moon was destroyed!', NULL, NULL, 'Das Tor des Goldmondes ist zerstort worden!', NULL, NULL, '¡La puerta de la Luna Amarilla ha sido destruida!', '¡La puerta de la Luna Amarilla ha sido destruida!', 'Врата Желтой Луны разрушены!'),
(20033, 'The Chamber of Ancient Relics is under attack!',  NULL,  NULL,  NULL,  NULL,  NULL, '¡La puerta de la Cámara de Reliquias antiguas esta siendo asediada!',  '¡La puerta de la Cámara de Reliquias antiguas esta siendo asediada!',  'Комната древних святынь повреждена!'),
(20034, 'The Gate of the Green Emerald is damaged!', NULL, NULL, 'Das Tor des Smaragdhorizonts ist beschadigt worden', NULL, NULL, '¡La puerta de la Esmeralda Verde ha sido dañada!', '¡La puerta de la Esmeralda Verde ha sido dañada!', 'Врата Зеленого Изумруда повреждены!'),
(20035, 'The Gate of the Blue Sapphire is damaged!', NULL, NULL, 'Das Tor des Saphirhimmels ist beschadigt worden!', NULL, NULL, '¡La puerta del Zafiro Azul ha sido dañada!', '¡La puerta del Zafiro Azul ha sido dañada!', 'Врата Синего Сапфира повреждены!'),
(20036, 'The Gate of the Purple Amethyst is damaged!', NULL, NULL, 'Das Tor des Amethyststerns ist beschadigt worden!', NULL, NULL, '¡La puerta de la Amatista Púrpura ha sido dañada!', '¡La puerta de la Amatista Púrpura ha sido dañada!', 'Врата Лилового Аметиста повреждены!'),
(20037, 'The Gate of the Red Sun is damaged!', NULL, NULL, 'Das Tor der Rubinsonne ist beschadigt worden!', NULL, NULL, '¡La puerta del Sol Rojo ha sido dañada!', '¡La puerta del Sol Rojo ha sido dañada!', 'Врата Красного Солнца повреждены!'),
(20038, 'The Gate of the Yellow Moon is damaged!', NULL, NULL, 'Das Tor des Goldmondes ist beschadigt worden!', NULL, NULL, '¡La puerta de la Luna Amarilla ha sido dañada!', '¡La puerta de la Luna Amarilla ha sido dañada!', 'Врата Желтой Луны повреждены!'),
(20039, 'The Horde won the first round, the Relic of Titan was no captured!', NULL, NULL, 'Runde 1 - Beendet!', NULL, NULL, '¡Ronda 1 acabada!', '¡Ronda 1 acabada!', 'Первый раунд за Ордой! Реликвия Титана не была захвачена!'),
(20040, 'The Alliance won the first round, the Relic of Titan was no captured!', NULL, NULL, 'Runde 1 - Beendet!', NULL, NULL, '¡Ronda 1 acabada!', '¡Ronda 1 acabada!', 'Первый раунд за Альянсом! Реликвия Титана не была захвачена!'),
(20041, 'The Horde won the second round, the Relic of Titan was no captured!', NULL, NULL, 'Runde 2 - Beendet!', NULL, NULL, '¡Ronda 2 acabada!', '¡Ronda 2 acabada!', 'Второй раунд за Ордой! Реликвия Титана не была захвачена!'),
(20042, 'The Alliance won the second round, the Relic of Titan was no captured!', NULL, NULL, 'Runde 2 - Beendet!', NULL, NULL, '¡Ronda 2 acabada!', '¡Ronda 2 acabada!', 'Второй раунд за Альянсом! Реликвия Титана не была захвачена!'),
(20043, 'Round 1 - Finished!',  NULL,  NULL,  'Runde 1 - Beendet!',  NULL,  NULL,  '¡Ronda 1 acabada!', '¡Ronda 1 acabada!', 'Первый раунд окончен'),
(20044, 'The game has ended in a draw!', NULL, NULL, 'Das Spiel ist unentschieden!!!', NULL, NULL, '¡El campo de batalla ha acabado en empate!', '¡El campo de batalla ha acabado en empate!', 'Ничья!!!');
