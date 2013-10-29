-- Isle of Conquest

-- creature and gameobject initial guid
SET @CREATURE := 520000;
SET @GAMEOBJECT := 520000;
DELETE FROM `creature` WHERE `guid` BETWEEN @CREATURE AND @CREATURE+9999;
DELETE FROM `gameobject` WHERE `guid` BETWEEN @GAMEOBJECT AND @GAMEOBJECT+9999;

-- use these 2 queries only if you want to enable IoC by direct queueing it
-- DELETE FROM battleground_template WHERE id = 30;
-- INSERT INTO battleground_template (id, MinPlayersPerTeam, MaxPlayersPerTeam, AllianceStartLoc, AllianceStartO, HordeStartLoc, HordeStartO) VALUES
-- (30, 10, 40, 1485, 0, 1486, 3.14159);

SET names utf8;
DELETE FROM mangos_string WHERE entry BETWEEN 20079 AND 20103;
INSERT INTO mangos_string (entry, content_default, content_loc6, content_loc7, content_loc8) VALUES
(20080, 'The battle will begin in 2 minutes.', 'La batalla por la Isla de la Conquista comenzará en 2 minutos.', 'La batalla por la Isla de la Conquista comenzará en 2 minutos.', 'Бой на Острове Завоеваний начнется через 2 минуты!'),
(20081, 'The battle will begin in 1 minute.', 'La batalla por la Isla de la Conquista comenzará en 1 minuto.', 'La batalla por la Isla de la Conquista comenzará en 1 minuto.', 'Бой на Острове Завоеваний начнется уже через 1 минуту! Начинайте готовиться!'),
(20082, 'The battle will begin in 30 seconds!', 'La batalla por la Isla de la Conquista comenzará en 30 segundos. ¡Preparaos!', 'La batalla por la Isla de la Conquista comenzará en 30 segundos. ¡Preparaos!', 'Бой на Острове Завоеваний начнется через 30 секунд! Будьте готовы!'),
(20083, 'The battle has begun!', '¡La batalla por la Isla de la Conquista ha comenzado!', '¡La batalla por la Isla de la Conquista ha comenzado!', 'Бой начался!'),
(20084, 'Alliance Keep', 'Fortaleza de la Alianza', 'Fortaleza de la Alianza', 'крепость Альянса'),
(20085, 'Horde Keep', 'Fortaleza de la Horda', 'Fortaleza de la Horda', 'крепость Орды'),
(20086, 'The Alliance wins!', '¡Gana la Alianza!', '¡Gana la Alianza!', 'Альянс побеждает!'),
(20087, 'The Horde wins!', '¡Gana la Horda!', '¡Gana la Horda!', 'Орда побеждает!'),
(20088, 'The west gate of the Alliance has been destroyed!', '¡La puerta oeste de la fortaleza de la Alianza ha sido destruida!', '¡La puerta oeste de la fortaleza de la Alianza ha sido destruida!', 'Восточные врата Альянса разрушены!'),
(20089, 'The east gate of the Alliance has been destroyed!', '¡La puerta este de la fortaleza de la Alianza ha sido destruida!', '¡La puerta este de la fortaleza de la Alianza ha sido destruida!', 'Западные врата Альянса разрушены!'),
(20090, 'The front gate of the Alliance has been destroyed!', '¡La puerta central de la fortaleza de la Alianza ha sido destruida!', '¡La puerta central de la fortaleza de la Alianza ha sido destruida!', 'Южные врата Альянса разрушены!'),
(20091, 'The west gate of the Horde has been destroyed!', '¡La puerta oeste de la fortaleza de la Horda ha sido destruida!', '¡La puerta oeste de la fortaleza de la Horda ha sido destruida!', 'Восточные врата Орды разрушены!'),
(20092, 'The east gate of the Horde has been destroyed!', '¡La puerta este de la fortaleza de la Horda ha sido destruida!', '¡La puerta este de la fortaleza de la Horda ha sido destruida!', 'Западные врата Орды разрушены!'),
(20093, 'The front gate of Horde has been destroyed!', '¡La puerta central de la fortaleza de la Horda ha sido destruida!', '¡La puerta central de la fortaleza de la Horda ha sido destruida!', 'Южные врата Орды разрушены!'),
(20094, '$n has assaulted the %s', '¡$n ha asaltado %s!', '¡$n ha asaltado %s!', '$n захватывает %s'),
(20095, '$n has defended the %s', '¡$n ha defendido %s!', '¡$n ha defendido %s!', '$n отбивает и возвращает под свой контроль %s'),
(20096, '$n claims the %s! If left unchallenged, the %s will control it in 1 minute!', '¡$n reclama %s! ¡Si nadie se lo impide, la %s tomará el control en 1 minuto!' , '¡$n reclama %s! ¡Si nadie se lo impide, la %s tomará el control en 1 minuto!', '$n захватывает %s! Если ничего не предпринимать, %s получит контроль уже через 1 минуту!'),
(20097, 'The %s has taken the %s', 'La %s ha tomado %s.', 'La %s ha tomado %s.', '%s захватывает %s'),
(20098, 'Workshop', 'el Taller', 'el Taller', 'Мастерская'),
(20099, 'Docks', 'los Muelles', 'los Muelles', 'Причал'),
(20100, 'Refinery', 'la Refinería', 'la Refinería', 'Нефтезавод'),
(20101, 'Quarry', 'la Cantera', 'la Cantera', 'Каменоломня'),
(20102, 'Hangar', 'el Hangar', 'el Hangar', 'Ангар');

-- IOC vehicles

-- Alliance Gunship Cannon
UPDATE creature_template SET vehicle_id = 452, iconName = 'Gunner', AIName = 'NullAI', faction_A = 3, faction_H = 3, ScriptName = '' WHERE entry = 34929;
-- Horde Gunship Cannon
UPDATE creature_template SET vehicle_id = 453, iconName = 'Gunner', AIName = 'NullAI', faction_A = 6, faction_H = 6, ScriptName = '' WHERE entry = 34935;
-- Keep Cannon
UPDATE creature_template SET ScriptName = '', AIName = 'NullAI' WHERE entry IN (34944, 35429);
UPDATE creature_template SET vehicle_id = 160, iconName = 'Gunner', faction_A = 35, faction_H = 35, unit_flags = unit_flags | 4 WHERE entry IN (34944, 35429);

UPDATE creature_template SET mechanic_immune_mask = mechanic_immune_mask|1|2|8|16|32|64|128|1024|2048|4096|8192|131072|262144|8388608|16777216|67108864 WHERE entry IN (34944, 35429, 34793, 35413, 34775, 35415, 34776, 35431, 35069, 35433, 34802, 35419, 35273, 35421);

-- Alli Glaive Thrower
UPDATE creature_template SET AIName = 'NullAI' WHERE entry = 34802;
UPDATE creature_template SET vehicle_id = 447, iconName = 'vehichleCursor', faction_A = 3, faction_H = 3, ScriptName = '' WHERE entry IN (34802, 35419);

-- Horde Glaive Thrower
UPDATE creature_template SET AIName = 'NullAI' WHERE entry = 35273;
UPDATE creature_template SET vehicle_id = 447, iconName = 'vehichleCursor', faction_A = 6, faction_H = 6, ScriptName = '' WHERE entry IN (35273, 35421);

-- Catapult
UPDATE creature_template SET powertype = 3, vehicle_id = 438, iconName = 'vehichleCursor', faction_A = 35, faction_H = 35, speed_walk = 2.4, speed_run = 2.8, ScriptName = '' WHERE entry in (34793, 35413);

-- Demolisher
UPDATE creature_template SET powertype = 3, vehicle_id = 509, iconName = 'vehichleCursor', faction_A = 35, faction_H = 35, ScriptName = '' WHERE entry IN (34775, 35415);

-- Horde Siege Engine
UPDATE creature_template SET AIName = 'NullAI' WHERE entry = 35069;
UPDATE creature_template SET powertype = 3, vehicle_id = 435, iconName = 'vehichleCursor', faction_A = 6, faction_H = 6, ScriptName = '' WHERE entry IN (35069, 35433);

-- Ally Siege Engine
UPDATE creature_template SET AIName = 'NullAI' WHERE entry = 34776;
UPDATE creature_template SET powertype = 3, vehicle_id = 435, iconName = 'vehichleCursor', faction_A = 3, faction_H = 3, ScriptName = '' WHERE entry IN (34776, 35431);

-- Ally/horde Siege Turret
UPDATE creature_template SET AIName = 'NullAI' WHERE entry IN (34777, 36355);
UPDATE creature_template SET powertype = 3, iconName = 'Gunner', vehicle_id = 436, ScriptName = '' WHERE entry IN (34777, 35436, 36355, 36357);

-- Horde/Ally Flame Turret
UPDATE creature_template SET AIName = 'NullAI' WHERE entry IN (34778, 36356);
UPDATE creature_template SET powertype = 3, iconName = 'Gunner', vehicle_id = 437, ScriptName = '' WHERE entry IN (34778, 35417, 36356, 36358);

DELETE FROM npc_spellclick_spells WHERE npc_entry IN (34929, 34935, 34944, 34793, 34775, 34776, 35069, 34802, 35273, 34778, 36356, 34777, 36355);
INSERT INTO npc_spellclick_spells (npc_entry, spell_id, quest_start, quest_start_active, quest_end, cast_flags) VALUES
(34929, 60968, 0, 0, 0, 1),
(34935, 60968, 0, 0, 0, 1),
(34944, 60968, 0, 0, 0, 1),
(34793, 60968, 0, 0, 0, 1),
(34793, 68362, 0, 0, 0, 3),
(34775, 60968, 0, 0, 0, 1),
(34775, 68365, 0, 0, 0, 3),
(34776, 60968, 0, 0, 0, 1),
(34776, 68364, 0, 0, 0, 3),
(35069, 60968, 0, 0, 0, 1),
(34802, 60968, 0, 0, 0, 1),
(34802, 68363, 0, 0, 0, 3),
(35273, 60968, 0, 0, 0, 1),
(35273, 68363, 0, 0, 0, 3),
(34778, 60968, 0, 0, 0, 1),
(36356, 60968, 0, 0, 0, 1),
(34777, 60968, 0, 0, 0, 1),
(36355, 60968, 0, 0, 0, 1);

DELETE FROM creature_spell WHERE guid IN (34929, 35410, 34935, 34944, 35429, 34793, 34775, 34776, 35069, 34802, 35273, 34778, 36356, 34777, 36355);
INSERT INTO creature_spell (guid, spell, `index`) VALUES
(34929, 69495, 0),
(34935, 68825, 0),
(34944, 67452, 0),
(34944, 68169, 1),
(34793, 66218, 0),
(34793, 66296, 1),
(34775, 67440, 0),
(34775, 67441, 1),
(34776, 67816, 0),
(34776, 69502, 1),
(35069, 67816, 0),
(35069, 69502, 1),
(34802, 66456, 0),
(34802, 67195, 1),
(35273, 66456, 0),
(35273, 67195, 1),
(34777, 67462, 0),
(34777, 69505, 1),
(36355, 67462, 0),
(36355, 69505, 1);

DELETE FROM creature_spell WHERE guid IN (34778, 36356);
INSERT INTO creature_spell (guid, spell, `index`) VALUES
(34778, 66183, 0),
(34778, 66186, 1),
(36356, 66183, 0),
(36356, 66186, 1);

-- /IOC vehicles by /dev/rsa

-- alliance boss
UPDATE creature_template SET faction_A = 84, faction_H = 84, difficulty_entry_1 = 35403, ScriptName = 'boss_bg_ioc' WHERE entry = 34924;
-- alli boss guard faction
UPDATE creature_template SET faction_A = 84, faction_H = 84 WHERE entry = 34919;
-- horde boss
UPDATE creature_template SET faction_A = 83, faction_H = 83, difficulty_entry_1 = 35405, ScriptName = 'boss_bg_ioc' WHERE entry = 34922;
-- horde boss guard faction
UPDATE creature_template SET faction_A = 83, faction_H = 83 WHERE entry = 34918;

-- make sure doors arent clickable
UPDATE gameobject_template SET flags = flags | 4 WHERE entry IN (195223,195703,195491,195451,195452,195437,195436);

-- alli flags in keeps
UPDATE gameobject_template SET faction = 83, flags = 0 WHERE entry IN (195397, 195396, 195392, 195391);
-- horde flags in keeps
UPDATE gameobject_template SET faction = 84, flags = 0 WHERE entry IN (195399, 195398, 195394, 195393);

-- Seaforium charges
UPDATE gameobject_template SET data2 = 1, data4 = 1, data7 = 10 WHERE entry IN (195331, 195235);

-- some people say bombs should be consumed after 3 uses, some say they dont disappear.. Im making them non-consumable
-- if huge bombs should have 3 charges, type has to be changed to spellcaster too, as goobers dont have charges
-- bombs in the horde keep
UPDATE gameobject_template SET faction = 1997, flags = 0, data5 = 0 WHERE entry IN (195333, 195232);
-- bombs in the alli keep
UPDATE gameobject_template SET faction = 1995, flags = 0, data5 = 0 WHERE entry IN (195332, 195237);

-- horde teleporters
UPDATE gameobject_template SET faction = 1995, flags = 0 WHERE entry IN (195313, 195314);
UPDATE gameobject_template SET faction = 1995 WHERE entry = 195326;
-- alliance teleporters
UPDATE gameobject_template SET faction = 1997, flags = 0 WHERE entry IN (195315, 195316);
UPDATE gameobject_template SET faction = 1997 WHERE entry = 195320;

-- scriptnames
UPDATE gameobject_template SET ScriptName = '' WHERE entry BETWEEN 195313 AND 195316;
-- gunship portals
-- disabled till fixed
-- UPDATE gameobject_template SET ScriptName = 'go_ic_teleport' WHERE entry IN (195320, 195326);

-- teleports
DELETE FROM `spell_script_target`WHERE `entry` IN (66550, 66551);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
('66551', '0', '195313'), -- horde teleporters
('66550', '0', '195314'),
('66550', '0', '195315'), -- alliance teleporters
('66551', '0', '195316');

-- no regeneration buff for vehicles
DELETE FROM creature_template_addon WHERE entry IN (34929, 34935, 34944, 34793, 34775, 34776, 35069, 34802, 35273, 34778, 36356, 34777, 36355);
INSERT INTO creature_template_addon (entry, auras) VALUES
(34929, 52455),
(34935, 52455),
(34944, 52455),
(34793, 52455),
(34775, 52455),
(34776, 52455),
(35069, 52455),
(34802, 52455),
(35273, 52455),
(34778, 52455),
(36356, 52455),
(34777, 52455),
(36355, 52455);

-- Achievements
DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (11492, 11493, 11494, 11495, 12059, 12066, 12067, 12132, 12163);
INSERT INTO achievement_criteria_requirement VALUES
(11492, 6, 4710, 0),  -- Four Car Garage (x4)
(11493, 6, 4710, 0),
(11494, 6, 4710, 0),
(11495, 6, 4710, 0),
(12059, 6, 4710, 0),  -- Isle of Conquest All-Star
(12066, 6, 4710, 0),  -- A-bomb-inable
(12067, 6, 4710, 0),  -- A-bomb-ination
(12132, 6, 4710, 0),  -- Cut the Blue Wire... No the Red Wire!
(12163, 6, 4710, 0);  -- Back Door Job

###############################
-- SPAWNING STATIC OBJECTS
###############################
DELETE FROM gameobject WHERE map=628;
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
-- chairs
(@GAMEOBJECT , 160415 , 628 , 3 , 1 , 1117.19 , -365.674 , 18.8456 , 0.968657 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+1 , 195418 , 628 , 3 , 1 , 632.156 , -304.503 , 5.4879 , 1.15603 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+2 , 195416 , 628 , 3 , 1 , 643.86 , -270.204 , 5.48898 , 2.36903 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+3 , 160410 , 628 , 3 , 1 , 902.234 , -455.508 , 18.3935 , -1.00356 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+4 , 160410 , 628 , 3 , 1 , 1066.19 , -337.214 , 18.8225 , 0.453785 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+5 , 160418 , 628 , 3 , 1 , 810.237 , -461.2 , 25.4627 , 1.5708 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+6 , 160416 , 628 , 3 , 1 , 798.324 , -444.951 , 22.5601 , -1.02102 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+7 , 160416 , 628 , 3 , 1 , 1081.81 , -358.637 , 18.5531 , 1.92859 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+8 , 160419 , 628 , 3 , 1 , 814.931 , -470.816 , 33.6373 , -3.12412 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+9 , 195410 , 628 , 3 , 1 , 632.876 , -282.461 , 5.45364 , -0.851094 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+10 , 195414 , 628 , 3 , 1 , 635.796 , -276.295 , 5.48659 , -3.03273 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+11 , 160415 , 628 , 3 , 1 , 762.245 , -444.795 , 22.8526 , -1.98095 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- flagpoles
(@GAMEOBJECT+12 , 195131 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.74278 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+13 , 195131 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+14 , 195131 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.91986 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+15 , 195131 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+16 , 195131 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.23147 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+17 , 195439 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+18 , 195439 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- stoves
(@GAMEOBJECT+19 , 174863 , 628 , 3 , 1 , 903.291 , -457.345 , 18.1356 , 2.23402 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+20 , 174863 , 628 , 3 , 1 , 11068.1 , -336.373 , 18.5647 , -2.59181 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+21 , 160411 , 628 , 3 , 1 , 761.462 , -446.684 , 22.5602 , 0.244344 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+22 , 160411 , 628 , 3 , 1 , 1118.32 , -363.969 , 18.5532 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- bench
(@GAMEOBJECT+23 , 186896 , 628 , 3 , 1 , 834.208 , -461.826 , 22.3067 , 1.5708 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+24 , 186922 , 628 , 3 , 1 , 826.153 , -461.985 , 22.5149 , 1.5708 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+25 , 186899 , 628 , 3 , 1 , 817.446 , -470.47 , 25.372 , -1.56207 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+26 , 186904 , 628 , 3 , 1 , 827.001 , -474.415 , 25.372 , 1.57952 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+27 , 186897 , 628 , 3 , 1 , 819.264 , -461.961 , 22.7614 , 1.57952 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- bonfires
(@GAMEOBJECT+28 , 195376 , 628 , 3 , 1 , 1162.91 , -734.578 , 48.8948 , -2.9845 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+29 , 195208 , 628 , 3 , 1 , 1282.34 , -799.762 , 87.1357 , -3.13286 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+30 , 195210 , 628 , 3 , 1 , 1358.06 , -732.178 , 87.1606 , -3.13284 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+31 , 195207 , 628 , 3 , 1 , 1281.76 , -732.844 , 87.1574 , -3.13246 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+32 , 195209 , 628 , 3 , 1 , 1358.81 , -797.899 , 87.2953 , 3.13312 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+33 , 195377 , 628 , 3 , 1 , 1162.21 , -790.543 , 48.9162 , 2.27765 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- braziers
(@GAMEOBJECT+34 , 195402 , 628 , 3 , 1 , 1262.21 , -751.358 , 48.8133 , 2.26893 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+35 , 195403 , 628 , 3 , 1 , 1262.58 , -781.861 , 48.8132 , 2.04203 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+36 , 195425 , 628 , 3 , 1 , 223.818 , -839.352 , 60.7917 , 1.09083 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+37 , 195424 , 628 , 3 , 1 , 224.277 , -822.77 , 60.7917 , 2.06822 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- huge seaforium bombs
(@GAMEOBJECT+38 , 195332 , 628 , 3 , 1 , 297.321 , -851.321 , 48.9163 , -0.942477 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+39 , 195332 , 628 , 3 , 1 , 298.104 , -861.026 , 48.9163 , -2.75761 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+40 , 195332 , 628 , 3 , 1 , 300.372 , -818.733 , 48.9162 , 0.785397 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+41 , 195332 , 628 , 3 , 1 , 302.135 , -810.708 , 48.9162 , -1.0472 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+42 , 195333 , 628 , 3 , 1 , 1268.31 , -745.783 , 48.9188 , 0.785397 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+43 , 195333 , 628 , 3 , 1 , 1268.51 , -738.122 , 48.9175 , -1.0472 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+44 , 195333 , 628 , 3 , 1 , 1273.07 , -786.573 , 48.9419 , -0.942477 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+45 , 195333 , 628 , 3 , 1 , 1273.85 , -796.278 , 48.9364 , -2.75761 , 0 , 0 , 0 , 0 , 10 , 0 , 0),

###############################
-- DYNAMIC OBJECTS
###############################

-- BANNERS, order:
--  contested
--  alli in conflict
--  horde in conflict
--  alli owned
--  horde owned

-- docks
(@GAMEOBJECT+46 , 195157 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+47 , 180059 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+48 , 180061 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+49 , 180058 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+50 , 180060 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- hangar
(@GAMEOBJECT+51 , 195158 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+52 , 180059 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+53 , 180061 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+54 , 180058 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+55 , 180060 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- workshop
(@GAMEOBJECT+56 , 195133 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+57 , 180059 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+58 , 180061 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+59 , 180058 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+60 , 180060 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- quarry
(@GAMEOBJECT+61 , 195338 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+62 , 180059 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+63 , 180061 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+64 , 180058 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+65 , 180060 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- refinery
(@GAMEOBJECT+66 , 195343 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+67 , 180059 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+68 , 180061 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+69 , 180058 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+70 , 180060 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

-- Keeps
--  alli contested
--  horde contested
--  alli owned
--  horde owned
-- Alli keep
(@GAMEOBJECT+71 , 195397 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+72 , 195399 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+73 , 195396 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+74 , 195398 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- Horde keep
(@GAMEOBJECT+75 , 195392 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+76 , 195394 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+77 , 195391 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+78 , 195393 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

-- banner auras
(@GAMEOBJECT+79 , 180100 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+80 , 180101 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+81 , 180102 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(@GAMEOBJECT+82 , 180100 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+83 , 180101 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+84 , 180102 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(@GAMEOBJECT+85 , 180100 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+86 , 180101 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+87 , 180102 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(@GAMEOBJECT+88 , 180100 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+89 , 180101 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+90 , 180102 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(@GAMEOBJECT+91 , 180100 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+92 , 180101 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+93 , 180102 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(@GAMEOBJECT+94 , 180100 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+95 , 180101 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(@GAMEOBJECT+96 , 180100 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+97 , 180101 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

-- tower portcullisses
(@GAMEOBJECT+98 , 195436 , 628 , 3 , 1 , 401.024 , -780.724 , 49.9482 , -2.52896 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+99 , 195436 , 628 , 3 , 1 , 399.802 , -885.208 , 50.1939 , 2.516 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+100 , 195437 , 628 , 3 , 1 , 1156.89 , -843.998 , 48.6322 , 0.732934 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+101 , 195437 , 628 , 3 , 1 , 1157.05 , -682.36 , 48.6322 , -0.829132 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- keep portcullisses
(@GAMEOBJECT+102 , 195452 , 628 , 3 , 1 , 273.033 , -832.199 , 51.4109 , -0.0261791 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+103 , 195451 , 628 , 3 , 1 , 288.203 , -832.767 , 51.4681 , 6.24156 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+104 , 195223 , 628 , 3 , 1 , 1283.05 , -765.878 , 50.8297 , -3.13286 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- teleports
(@GAMEOBJECT+105 , 195315 , 628 , 3 , 1 , 324.635 , -749.128 , 49.3602 , 0.0174525 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+106 , 195315 , 628 , 3 , 1 , 311.92 , -913.972 , 48.8159 , 3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+107 , 195315 , 628 , 3 , 1 , 425.675 , -857.09 , 48.5104 , -1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+108 , 195316 , 628 , 3 , 1 , 323.54 , -888.361 , 48.9197 , 0.0349063 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+109 , 195316 , 628 , 3 , 1 , 326.285 , -777.366 , 49.0208 , 3.12412 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+110 , 195316 , 628 , 3 , 1 , 397.089 , -859.382 , 48.8993 , 1.64061 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+111 , 195314 , 628 , 3 , 1 , 1143.25 , -779.599 , 48.629 , 1.64061 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+112 , 195314 , 628 , 3 , 1 , 1236.53 , -669.415 , 48.2729 , 0.104719 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+113 , 195314 , 628 , 3 , 1 , 1235.09 , -857.898 , 48.9163 , 3.07177 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+114 , 195313 , 628 , 3 , 1 , 1233.27 , -844.526 , 48.8824 , -0.0174525 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+115 , 195313 , 628 , 3 , 1 , 1235.53 , -683.872 , 49.304 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+116 , 195313 , 628 , 3 , 1 , 1158.76 , -746.182 , 48.6277 , -1.51844 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- teleport effects
(@GAMEOBJECT+117 , 195701 , 628 , 3 , 1 , 425.686 , -857.092 , 48.51 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+118 , 195701 , 628 , 3 , 1 , 324.634 , -749.148 , 49.359 , 0.0174525 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+119 , 195701 , 628 , 3 , 1 , 311.911 , -913.986 , 48.8157 , 3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+120 , 195701 , 628 , 3 , 1 , 326.266 , -777.347 , 49.0215 , 3.12412 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+121 , 195701 , 628 , 3 , 1 , 323.55 , -888.347 , 48.9198 , 0.0174525 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+122 , 195701 , 628 , 3 , 1 , 397.116 , -859.378 , 48.8989 , 1.64061 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+123 , 195702 , 628 , 3 , 1 , 1143.25 , -779.623 , 48.6291 , 1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+124 , 195702 , 628 , 3 , 1 , 1158.64 , -746.148 , 48.6277 , -1.50098 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+125 , 195702 , 628 , 3 , 1 , 1233.25 , -844.573 , 48.8836 , 0.0174525 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+126 , 195702 , 628 , 3 , 1 , 1235.07 , -857.957 , 48.9163 , 3.05433 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+127 , 195702 , 628 , 3 , 1 , 1236.46 , -669.344 , 48.2684 , 0.087266 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(@GAMEOBJECT+128 , 195702 , 628 , 3 , 1 , 1235.6 , -683.806 , 49.3028 , -3.07177 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- gunship portals
(@GAMEOBJECT+129 , 195320 , 628 , 3 , 1 , 827.958 , -994.467 , 134.071 , 0 , 0 , 0 , 0 , 0 , 0 , 0, 0),
(@GAMEOBJECT+130 , 195320 , 628 , 3 , 1 , 738.613 , -1106.58 , 134.745 , 2.54818 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+131 , 195320 , 628 , 3 , 1 , 672.283 , -1156.99 , 133.706 , 1.37881 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+132 , 195326 , 628 , 3 , 1 , 827.958 , -994.467 , 134.071 , 0 , 0 , 0 , 0 , 0 , 0 , 0, 0),
(@GAMEOBJECT+133 , 195326 , 628 , 3 , 1 , 738.613 , -1106.58 , 134.745 , 2.54818 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(@GAMEOBJECT+134 , 195326 , 628 , 3 , 1 , 672.283 , -1156.99 , 133.706 , 1.37881 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- seaforium bombs
(@GAMEOBJECT+135 , 195232 , 628 , 3 , 1 , 750.601 , -864.597 , 13.4754 , 1.93731 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+136 , 195232 , 628 , 3 , 1 , 785.509 , -864.715 , 13.3993 , 2.47837 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+137 , 195237 , 628 , 3 , 1 , 750.601 , -864.597 , 13.4754 , 1.93731 , 0 , 0 , 0 , 0 , 10 , 0 , 0),
(@GAMEOBJECT+138 , 195237 , 628 , 3 , 1 , 785.509 , -864.715 , 13.3993 , 2.47837 , 0 , 0 , 0 , 0 , 10 , 0 , 0);

DELETE FROM gameobject_battleground WHERE guid IN (SELECT guid FROM gameobject WHERE map=628);
INSERT INTO gameobject_battleground (guid, event1, event2) VALUES
(@GAMEOBJECT+46 , 0 , 0),
(@GAMEOBJECT+47 , 0 , 1),
(@GAMEOBJECT+48 , 0 , 2),
(@GAMEOBJECT+49 , 0 , 3),
(@GAMEOBJECT+50 , 0 , 4),
(@GAMEOBJECT+51 , 1 , 0),
(@GAMEOBJECT+52 , 1 , 1),
(@GAMEOBJECT+53 , 1 , 2),
(@GAMEOBJECT+54 , 1 , 3),
(@GAMEOBJECT+55 , 1 , 4),
(@GAMEOBJECT+56 , 2 , 0),
(@GAMEOBJECT+57 , 2 , 1),
(@GAMEOBJECT+58 , 2 , 2),
(@GAMEOBJECT+59 , 2 , 3),
(@GAMEOBJECT+60 , 2 , 4),
(@GAMEOBJECT+61 , 3 , 0),
(@GAMEOBJECT+62 , 3 , 1),
(@GAMEOBJECT+63 , 3 , 2),
(@GAMEOBJECT+64 , 3 , 3),
(@GAMEOBJECT+65 , 3 , 4),
(@GAMEOBJECT+66 , 4 , 0),
(@GAMEOBJECT+67 , 4 , 1),
(@GAMEOBJECT+68 , 4 , 2),
(@GAMEOBJECT+69 , 4 , 3),
(@GAMEOBJECT+70 , 4 , 4),
(@GAMEOBJECT+71 , 5 , 1),
(@GAMEOBJECT+72 , 5 , 2),
(@GAMEOBJECT+73 , 5 , 3),
(@GAMEOBJECT+74 , 5 , 4),
(@GAMEOBJECT+75 , 6 , 1),
(@GAMEOBJECT+76 , 6 , 2),
(@GAMEOBJECT+77 , 6 , 3),
(@GAMEOBJECT+78 , 6 , 4),
(@GAMEOBJECT+79 , 0 , 3),
(@GAMEOBJECT+80 , 0 , 4),
(@GAMEOBJECT+81 , 0 , 0),
(@GAMEOBJECT+82 , 1 , 3),
(@GAMEOBJECT+83 , 1 , 4),
(@GAMEOBJECT+84 , 1 , 0),
(@GAMEOBJECT+85 , 2 , 3),
(@GAMEOBJECT+86 , 2 , 4),
(@GAMEOBJECT+87 , 2 , 0),
(@GAMEOBJECT+88 , 3 , 3),
(@GAMEOBJECT+89 , 3 , 4),
(@GAMEOBJECT+90 , 3 , 0),
(@GAMEOBJECT+91 , 4 , 3),
(@GAMEOBJECT+92 , 4 , 4),
(@GAMEOBJECT+93 , 4 , 0),
(@GAMEOBJECT+94 , 5 , 3),
(@GAMEOBJECT+95 , 5 , 4),
(@GAMEOBJECT+96 , 6 , 3),
(@GAMEOBJECT+97 , 6 , 4),
(@GAMEOBJECT+98 , 254 , 0),
(@GAMEOBJECT+99 , 254 , 0),
(@GAMEOBJECT+100 , 254 , 0),
(@GAMEOBJECT+101 , 254 , 0),
(@GAMEOBJECT+102 , 251 , 0),
(@GAMEOBJECT+103 , 251 , 0),
(@GAMEOBJECT+104 , 252 , 0),
(@GAMEOBJECT+105 , 7 , 0),
(@GAMEOBJECT+106 , 7 , 0),
(@GAMEOBJECT+107 , 7 , 0),
(@GAMEOBJECT+108 , 7 , 0),
(@GAMEOBJECT+109 , 7 , 0),
(@GAMEOBJECT+110 , 7 , 0),
(@GAMEOBJECT+111 , 7 , 0),
(@GAMEOBJECT+112 , 7 , 0),
(@GAMEOBJECT+113 , 7 , 0),
(@GAMEOBJECT+114 , 7 , 0),
(@GAMEOBJECT+115 , 7 , 0),
(@GAMEOBJECT+116 , 7 , 0),
(@GAMEOBJECT+117 , 254 , 0),
(@GAMEOBJECT+118 , 254 , 0),
(@GAMEOBJECT+119 , 254 , 0),
(@GAMEOBJECT+120 , 254 , 0),
(@GAMEOBJECT+121 , 254 , 0),
(@GAMEOBJECT+122 , 254 , 0),
(@GAMEOBJECT+123 , 254 , 0),
(@GAMEOBJECT+124 , 254 , 0),
(@GAMEOBJECT+125 , 254 , 0),
(@GAMEOBJECT+126 , 254 , 0),
(@GAMEOBJECT+127 , 254 , 0),
(@GAMEOBJECT+128 , 254 , 0),
(@GAMEOBJECT+129 , 1 , 3),
(@GAMEOBJECT+130 , 1 , 3),
(@GAMEOBJECT+131 , 1 , 3),
(@GAMEOBJECT+132 , 1 , 4),
(@GAMEOBJECT+133 , 1 , 4),
(@GAMEOBJECT+134 , 1 , 4),
(@GAMEOBJECT+135 , 2 , 3),
(@GAMEOBJECT+136 , 2 , 3),
(@GAMEOBJECT+137 , 2 , 4),
(@GAMEOBJECT+138 , 2 , 4);

DELETE FROM battleground_events WHERE map = 628;
INSERT INTO battleground_events (map, event1, event2, description) VALUES
(628, 0, 0, 'Dock - Neutral'),
(628, 0, 1, 'Dock - Alliance contested'),
(628, 0, 2, 'Dock - Horde contested'),
(628, 0, 3, 'Dock - Alliance owned'),
(628, 0, 4, 'Dock - Horde owned'),
(628, 1, 0, 'Hangar - Neutral'),
(628, 1, 1, 'Hangar - Alliance contested'),
(628, 1, 2, 'Hangar - Horde contested'),
(628, 1, 3, 'Hangar - Alliance owned'),
(628, 1, 4, 'Hangar - Horde owned'),
(628, 2, 0, 'Workshop - Neutral'),
(628, 2, 1, 'Workshop - Alliance contested'),
(628, 2, 2, 'Workshop - Horde contested'),
(628, 2, 3, 'Workshop - Alliance owned'),
(628, 2, 4, 'Workshop - Horde owned'),
(628, 3, 0, 'Quarry - Neutral'),
(628, 3, 1, 'Quarry - Alliance contested'),
(628, 3, 2, 'Quarry - Horde contested'),
(628, 3, 3, 'Quarry - Alliance owned'),
(628, 3, 4, 'Quarry - Horde owned'),
(628, 4, 0, 'Refinery - Neutral'),
(628, 4, 1, 'Refinery - Alliance contested'),
(628, 4, 2, 'Refinery - Horde contested'),
(628, 4, 3, 'Refinery - Alliance owned'),
(628, 4, 4, 'Refinery - Horde owned'),
(628, 5, 1, 'Alli keep - Alliance contested'),
(628, 5, 2, 'Alli keep - Horde contested'),
(628, 5, 3, 'Alli keep - Alliance owned'),
(628, 5, 4, 'Alli keep - Horde owned'),
(628, 6, 1, 'Horde keep - Alliance contested'),
(628, 6, 2, 'Horde keep - Horde contested'),
(628, 6, 3, 'Horde keep - Alliance owned'),
(628, 6, 4, 'Horde keep - Horde owned'),
(628, 7, 0, 'Base teleport spawn'),
(628, 8, 0, 'Npcs'),
(628, 9, 0, 'Alli Boss guards'),
(628, 10, 0, 'Horde Boss guards'),
(628, 11, 0, 'Alli Boss'),
(628, 12, 0, 'Horde Boss'),
(628, 251, 0, 'Alli Boss gate'),
(628, 252, 0, 'Horde Boss gate'),
(628, 254, 0, 'Door');

################################################################
-- DYNAMIC CREATURES
################################################################
DELETE FROM creature WHERE map=628;
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
-- workshop siege engines
(@CREATURE, 34776, 628, 3, 1, 0, 0, 773.680542, -884.092041, 16.8090363, 1.58824956, 180000, 0, 0, 250000, 0, 0, 0),
(@CREATURE+1, 35069, 628, 3, 1, 0, 0, 773.680542, -884.092041, 16.8090363, 1.58824956, 180000, 0, 0, 250000, 0, 0, 0),
-- workshop demolishers
(@CREATURE+2, 34775, 628, 3, 1, 0, 0, 751.8281, -852.732666, 12.5250978, 1.46607661, 180000, 0, 0, 70000, 0, 0, 0),
(@CREATURE+3, 34775, 628, 3, 1, 0, 0, 761.809, -854.2274, 12.5263243, 1.46607661, 180000, 0, 0, 70000, 0, 0, 0),
(@CREATURE+4, 34775, 628, 3, 1, 0, 0, 783.4722, -853.9601, 12.54775, 1.71042264, 180000, 0, 0, 70000, 0, 0, 0),
(@CREATURE+5, 34775, 628, 3, 1, 0, 0, 793.055542, -852.71875, 12.5671329, 1.71042264, 180000, 0, 0, 70000, 0, 0, 0),
(@CREATURE+6, 34775, 628, 3, 1, 0, 0, 751.8281, -852.732666, 12.5250978, 1.46607661, 180000, 0, 0, 70000, 0, 0, 0),
(@CREATURE+7, 34775, 628, 3, 1, 0, 0, 761.809, -854.2274, 12.5263243, 1.46607661, 180000, 0, 0, 70000, 0, 0, 0),
(@CREATURE+8, 34775, 628, 3, 1, 0, 0, 783.4722, -853.9601, 12.54775, 1.71042264, 180000, 0, 0, 70000, 0, 0, 0),
(@CREATURE+9, 34775, 628, 3, 1, 0, 0, 793.055542, -852.71875, 12.5671329, 1.71042264, 180000, 0, 0, 70000, 0, 0, 0),
-- dock glaive throwers
(@CREATURE+10, 34802, 628, 3, 1, 0, 0, 779.3125, -342.972229, 12.2104874, 4.712389, 180000, 0, 0, 50000, 0, 0, 0),
(@CREATURE+11, 34802, 628, 3, 1, 0, 0, 790.029541, -342.899323, 12.2128582, 4.71238, 180000, 0, 0, 50000, 0, 0, 0),
(@CREATURE+12, 35273, 628, 3, 1, 0, 0, 779.3125, -342.972229, 12.2104874, 4.712389, 180000, 0, 0, 50000, 0, 0, 0),
(@CREATURE+13, 35273, 628, 3, 1, 0, 0, 790.029541, -342.899323, 12.2128582, 4.71238, 180000, 0, 0, 50000, 0, 0, 0),
-- dock catapults
(@CREATURE+14, 34793, 628, 3, 1, 0, 0, 757.283, -341.7795, 12.2113762, 4.729842, 180000, 0, 0, 15000, 0, 0, 0),
(@CREATURE+15, 34793, 628, 3, 1, 0, 0, 766.947937, -342.053833, 12.2009945, 4.694, 180000, 0, 0, 15000, 0, 0, 0),
(@CREATURE+16, 34793, 628, 3, 1, 0, 0, 800.3785, -342.607635, 12.1669979, 4.6774, 180000, 0, 0, 15000, 0, 0, 0),
(@CREATURE+17, 34793, 628, 3, 1, 0, 0, 810.7257, -342.083344, 12.1675768, 4.6600, 180000, 0, 0, 15000, 0, 0, 0),
(@CREATURE+18, 34793, 628, 3, 1, 0, 0, 757.283, -341.7795, 12.2113762, 4.729842, 180000, 0, 0, 15000, 0, 0, 0),
(@CREATURE+19, 34793, 628, 3, 1, 0, 0, 766.947937, -342.053833, 12.2009945, 4.694, 180000, 0, 0, 15000, 0, 0, 0),
(@CREATURE+20, 34793, 628, 3, 1, 0, 0, 800.3785, -342.607635, 12.1669979, 4.6774, 180000, 0, 0, 15000, 0, 0, 0),
(@CREATURE+21, 34793, 628, 3, 1, 0, 0, 810.7257, -342.083344, 12.1675768, 4.6600, 180000, 0, 0, 15000, 0, 0, 0),
-- spirit guides (alli - docks, hangar, workshop, alli keep, horde keep, alli rescue point)
(@CREATURE+22, 13116, 628, 3, 1, 0, 0, 629.57, -279.83, 11.33, 0.0, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+23, 13116, 628, 3, 1, 0, 0, 780.729, -1103.08, 135.51, 2.27, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+24, 13116, 628, 3, 1, 0, 0, 775.74, -652.77, 9.31, 4.27, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+25, 13116, 628, 3, 1, 0, 0, 278.42, -883.20, 49.89, 1.53, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+26, 13116, 628, 3, 1, 0, 0, 1300.91, -834.04, 48.91, 1.69, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+27, 13116, 628, 3, 1, 0, 0, 438.86, -310.04, 51.81, 5.87, 10, 0, 0, 24420, 4868, 0, 0),
-- spirit guides (horde - docks, hangar, workshop, horde keep, alli keep, horde rescue point)
(@CREATURE+28, 13117, 628, 3, 1, 0, 0, 629.57, -279.83, 11.33, 0.0, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+29, 13117, 628, 3, 1, 0, 0, 780.729, -1103.08, 135.51, 2.27, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+30, 13117, 628, 3, 1, 0, 0, 775.74, -652.77, 9.31, 4.27, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+31, 13117, 628, 3, 1, 0, 0, 1300.91, -834.04, 48.91, 1.69, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+32, 13117, 628, 3, 1, 0, 0, 278.42, -883.20, 49.89, 1.53, 10, 0, 0, 24420, 4868, 0, 0),
(@CREATURE+33, 13117, 628, 3, 1, 0, 0, 1148.65, -1250.98, 16.60, 1.74, 10, 0, 0, 24420, 4868, 0, 0),
-- bosses (horde, alli)
(@CREATURE+34, 34922, 628, 3, 1, 0, 0, 1295.44, -765.733, 70.0541, 0.0, 864000, 0, 0, 600001, 0, 0, 0),
(@CREATURE+35, 34924, 628, 3, 1, 0, 0, 224.983, -831.573, 60.9034, 0.0, 864000, 0, 0, 600001, 0, 0, 0),
-- boss guards (4x horde, 4x alli)
(@CREATURE+36, 34918, 628, 3, 1, 0, 0, 1296.01, -773.256, 69.958, 0.292168, 180000, 0, 0, 4608, 0, 0, 0),
(@CREATURE+37, 34918, 628, 3, 1, 0, 0, 1295.94, -757.756, 69.9587, 6.02165, 180000, 0, 0, 4608, 0, 0, 0),
(@CREATURE+38, 34918, 628, 3, 1, 0, 0, 1295.09, -760.927, 69.9587, 5.94311, 180000, 0, 0, 4608, 0, 0, 0),
(@CREATURE+39, 34918, 628, 3, 1, 0, 0, 1295.13, -769.7, 69.95, 0.34, 180000, 0, 0, 4608, 0, 0, 0),
(@CREATURE+40, 34919, 628, 3, 1, 0, 0, 223.969, -822.958, 60.8151, 0.46337, 180000, 0, 0, 4608, 0, 0, 0),
(@CREATURE+41, 34919, 628, 3, 1, 0, 0, 224.211, -826.952, 60.8188, 6.25961, 180000, 0, 0, 4608, 0, 0, 0),
(@CREATURE+42, 34919, 628, 3, 1, 0, 0, 223.119, -838.386, 60.8145, 5.64857, 180000, 0, 0, 4608, 0, 0, 0),
(@CREATURE+43, 34919, 628, 3, 1, 0, 0, 223.889, -835.102, 60.8201, 6.21642, 180000, 0, 0, 4608, 0, 0, 0),
-- keep cannons
(@CREATURE+44, 34944, 628, 3, 1, 0, 0, 415.825, -754.634, 87.799, 1.78024, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+45, 34944, 628, 3, 1, 0, 0, 410.142, -755.332, 87.7991, 1.78024, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+46, 34944, 628, 3, 1, 0, 0, 424.33, -879.352, 88.0446, 0.436332, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+47, 34944, 628, 3, 1, 0, 0, 425.602, -786.646, 87.7991, 5.74213, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+48, 34944, 628, 3, 1, 0, 0, 426.743, -884.939, 87.9613, 0.436332, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+49, 34944, 628, 3, 1, 0, 0, 404.736, -755.495, 87.7989, 1.78024, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+50, 34944, 628, 3, 1, 0, 0, 428.375, -780.797, 87.7991, 5.79449, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+51, 34944, 628, 3, 1, 0, 0, 429.175, -890.436, 88.0446, 0.436332, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+52, 34944, 628, 3, 1, 0, 0, 430.872, -775.278, 87.7991, 5.88176, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+53, 34944, 628, 3, 1, 0, 0, 408.056, -911.283, 88.0445, 4.64258, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+54, 34944, 628, 3, 1, 0, 0, 413.609, -911.566, 88.0447, 4.66003, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+55, 34944, 628, 3, 1, 0, 0, 402.554, -910.557, 88.0446, 4.57276, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+56, 34944, 628, 3, 1, 0, 0, 1158.91, -660.144, 87.9332, 0.750492, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+57, 34944, 628, 3, 1, 0, 0, 1156.22, -866.809, 87.8754, 5.27089, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+58, 34944, 628, 3, 1, 0, 0, 1163.74, -663.67, 88.3571, 0.558505, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+59, 34944, 628, 3, 1, 0, 0, 1135.18, -683.896, 88.0409, 3.9619, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+60, 34944, 628, 3, 1, 0, 0, 1138.91, -836.359, 88.3728, 2.18166, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+61, 34944, 628, 3, 1, 0, 0, 1162.08, -863.717, 88.358, 5.48033, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+62, 34944, 628, 3, 1, 0, 0, 1167.13, -669.212, 87.9682, 0.383972, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+63, 34944, 628, 3, 1, 0, 0, 1137.72, -688.517, 88.4023, 3.9619, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+64, 34944, 628, 3, 1, 0, 0, 1135.29, -840.878, 88.0252, 2.30383, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+65, 34944, 628, 3, 1, 0, 0, 1144.33, -833.309, 87.9268, 2.14675, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+66, 34944, 628, 3, 1, 0, 0, 1135.29, -840.878, 88.0252, 2.30383, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+67, 34944, 628, 3, 1, 0, 0, 1142.59, -691.946, 87.9756, 3.9619, 180000, 0, 0, 35000, 0, 0, 0),
(@CREATURE+68, 34944, 628, 3, 1, 0, 0, 1166.13, -858.391, 87.9653, 5.63741, 180000, 0, 0, 35000, 0, 0, 0);

DELETE FROM creature_battleground WHERE guid IN (SELECT guid FROM creature WHERE map=628);
INSERT INTO creature_battleground (guid, event1, event2) VALUES
-- siege engines
(@CREATURE , 2 , 3),
(@CREATURE+1 , 2 , 4),
-- demolishers
(@CREATURE+2 , 2 , 3),
(@CREATURE+3 , 2 , 3),
(@CREATURE+4 , 2 , 3),
(@CREATURE+5 , 2 , 3),
(@CREATURE+6 , 2 , 4),
(@CREATURE+7 , 2 , 4),
(@CREATURE+8 , 2 , 4),
(@CREATURE+9 , 2 , 4),
-- glaive throwers
(@CREATURE+10 , 0 , 3),
(@CREATURE+11 , 0 , 3),
(@CREATURE+12 , 0 , 4),
(@CREATURE+13 , 0 , 4),
-- catapults
(@CREATURE+14 , 0 , 3),
(@CREATURE+15 , 0 , 3),
(@CREATURE+16 , 0 , 3),
(@CREATURE+17 , 0 , 3),
(@CREATURE+18 , 0 , 4),
(@CREATURE+19 , 0 , 4),
(@CREATURE+20 , 0 , 4),
(@CREATURE+21 , 0 , 4),
-- spirit guides
(@CREATURE+22 , 0 , 3),
(@CREATURE+23 , 1 , 3),
(@CREATURE+24 , 2 , 3),
(@CREATURE+25 , 5 , 3),
(@CREATURE+26 , 6 , 3),
(@CREATURE+28 , 0 , 4),
(@CREATURE+29 , 1 , 4),
(@CREATURE+30 , 2 , 4),
(@CREATURE+31 , 5 , 4),
(@CREATURE+32 , 6 , 4),
-- bosses
(@CREATURE+34 , 12 , 0),
(@CREATURE+35 , 11 , 0),
-- boss guards
(@CREATURE+36 , 10 , 0),
(@CREATURE+37 , 10 , 0),
(@CREATURE+38 , 10 , 0),
(@CREATURE+39 , 10 , 0),
(@CREATURE+40 , 9 , 0),
(@CREATURE+41 , 9 , 0),
(@CREATURE+42 , 9 , 0),
(@CREATURE+43 , 9 , 0),
-- keep cannons
(@CREATURE+44 , 8 , 0),
(@CREATURE+45 , 8 , 0),
(@CREATURE+46 , 8 , 0),
(@CREATURE+47 , 8 , 0),
(@CREATURE+48 , 8 , 0),
(@CREATURE+49 , 8 , 0),
(@CREATURE+50 , 8 , 0),
(@CREATURE+51 , 8 , 0),
(@CREATURE+52 , 8 , 0),
(@CREATURE+53 , 8 , 0),
(@CREATURE+54 , 8 , 0),
(@CREATURE+55 , 8 , 0),
(@CREATURE+56 , 8 , 0),
(@CREATURE+57 , 8 , 0),
(@CREATURE+58 , 8 , 0),
(@CREATURE+59 , 8 , 0),
(@CREATURE+60 , 8 , 0),
(@CREATURE+61 , 8 , 0),
(@CREATURE+62 , 8 , 0),
(@CREATURE+63 , 8 , 0),
(@CREATURE+64 , 8 , 0),
(@CREATURE+65 , 8 , 0),
(@CREATURE+66 , 8 , 0),
(@CREATURE+67 , 8 , 0),
(@CREATURE+68 , 8 , 0);

DELETE FROM achievement_criteria_requirement WHERE criteria_id IN (12066, 12067, 12163);
INSERT INTO achievement_criteria_requirement VALUES
(12066, 0, 0, 0),  -- A-bomb-inable
(12067, 0, 0, 0),  -- A-bomb-ination
(12163, 0, 0, 0);  -- Back Door Job
