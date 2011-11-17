-- Isle of Conquest
-- use these 2 queries only if you want to enable IoC by direct queueing it
DELETE FROM battleground_template WHERE id = 30;
INSERT INTO battleground_template (id, MinPlayersPerTeam, MaxPlayersPerTeam, AllianceStartLoc, AllianceStartO, HordeStartLoc, HordeStartO) VALUES
(30, 10, 40, 1485, 0, 1486, 3.14159);

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

-- Alliance Gunship Cannon
UPDATE creature_template SET vehicle_id = 452, iconName = 'vehichleCursor', faction_A = 3, faction_H = 3, ScriptName = '' WHERE entry = 34929;
-- Horde Gunship Cannon
UPDATE creature_template SET vehicle_id = 453, iconName = 'vehichleCursor', faction_A = 6, faction_H = 6, ScriptName = '' WHERE entry = 34935;
-- Keep Cannon
UPDATE creature_template SET vehicle_id = 160, iconName = 'vehichleCursor', faction_A = 35, faction_H = 35, unit_flags = unit_flags | 4, ScriptName = 'npc_ic_cannon' WHERE entry = 34944;
UPDATE creature_template SET unit_flags = unit_flags | 4 WHERE entry = 34944;
-- Catapult
UPDATE creature_template SET powertype = 3, vehicle_id = 438, iconName = 'vehichleCursor', faction_A = 35, faction_H = 35, speed_walk = 2.4, speed_run = 2.8, ScriptName = 'npc_ic_vehicle' WHERE entry = 34793;
UPDATE creature_template SET speed_walk = 2.4, speed_run = 2.8 WHERE entry = 35413;
-- Demolisher
UPDATE creature_template SET vehicle_id = 509, iconName = 'vehichleCursor', faction_A = 35, faction_H = 35, ScriptName = 'npc_ic_vehicle' WHERE entry = 34775;
-- Alli Siege Engine
UPDATE creature_template SET powertype = 3, vehicle_id = 447, iconName = 'vehichleCursor', faction_A = 3, faction_H = 3 WHERE entry = 34776;
-- Horde Siege Engine
UPDATE creature_template SET powertype = 3, vehicle_id = 436, iconName = 'vehichleCursor', faction_A = 6, faction_H = 6 WHERE entry = 35069;
-- Alli Glaive Thrower
UPDATE creature_template SET vehicle_id = 447, iconName = 'vehichleCursor', faction_A = 3, faction_H = 3, ScriptName = 'npc_ic_vehicle' WHERE entry = 34802;
-- Horde Glaive Thrower
UPDATE creature_template SET vehicle_id = 447, iconName = 'vehichleCursor', faction_A = 6, faction_H = 6, ScriptName = 'npc_ic_vehicle' WHERE entry = 35273;
-- Flame Turret
UPDATE creature_template SET iconName = 'vehichleCursor' WHERE entry = 34778;
-- Flame Turret
UPDATE creature_template SET iconName = 'vehichleCursor' WHERE entry = 36356;
-- Siege Turret
UPDATE creature_template SET iconName = 'vehichleCursor' WHERE entry = 34777;
-- Siege Turret
UPDATE creature_template SET iconName = 'vehichleCursor' WHERE entry = 36355;

UPDATE creature_template SET mechanic_immune_mask = mechanic_immune_mask|1|2|8|16|32|64|128|1024|2048|4096|8192|131072|262144|8388608|16777216|67108864 WHERE entry IN (34944, 35429, 34793, 35413, 34775, 35415, 34776, 35431, 35069, 35433, 34802, 35419, 35273, 35421);

DELETE FROM npc_spellclick_spells WHERE npc_entry IN (34929, 34935, 34944, 34793, 34775, 34776, 35069, 34802, 35273, 34778, 36356, 34777, 36355);
INSERT INTO npc_spellclick_spells (npc_entry, spell_id, quest_start, quest_start_active, quest_end, cast_flags) VALUES
(34929, 60968, 0, 0, 0, 1),
(34935, 60968, 0, 0, 0, 1),
(34944, 60968, 0, 0, 0, 1),
(34793, 60968, 0, 0, 0, 1),
(34775, 60968, 0, 0, 0, 1),
(34776, 60968, 0, 0, 0, 1),
(35069, 60968, 0, 0, 0, 1),
(34802, 60968, 0, 0, 0, 1),
(35273, 60968, 0, 0, 0, 1),
(34778, 60968, 0, 0, 0, 1),
(36356, 60968, 0, 0, 0, 1),
(34777, 60968, 0, 0, 0, 1),
(36355, 60968, 0, 0, 0, 1);

DELETE FROM vehicle_accessory WHERE entry IN (35069, 34776);
INSERT INTO vehicle_accessory (entry, accessory_entry, seat_id, minion, description) VALUES
(35069, 36355, 7, 1, 'Isle of Conquest Siege Engine'),
(34776, 34777, 7, 1, 'Isle of Conquest Siege Engine');

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
(34802, 68827, 0),
(34802, 69515, 1),
(35273, 68827, 0),
(35273, 69515, 1),
(34778, 68832, 0),
(36356, 68832, 0),
(34777, 67462, 0),
(34777, 69505, 1),
(36355, 67462, 0),
(36355, 69505, 1);

-- alliance boss faction
UPDATE creature_template SET faction_A = 84, faction_H = 84 WHERE entry = 34924;
-- alli boss guard faction
UPDATE creature_template SET faction_A = 84, faction_H = 84 WHERE entry = 34919;
-- horde boss faction
UPDATE creature_template SET faction_A = 83, faction_H = 83 WHERE entry = 34922;
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
UPDATE gameobject_template SET faction = 1995, flags = 16 WHERE entry IN (195313, 195314);
UPDATE gameobject_template SET faction = 1995 WHERE entry = 195326;
-- alliance teleporters
UPDATE gameobject_template SET faction = 1997, flags = 16 WHERE entry IN (195315, 195316);
UPDATE gameobject_template SET faction = 1997 WHERE entry = 195320;

-- scriptnames
UPDATE gameobject_template SET ScriptName = 'go_ic_teleport' WHERE entry BETWEEN 195313 AND 195316;
-- gunship portals
-- disabled till fixed
-- UPDATE gameobject_template SET ScriptName = 'go_ic_teleport' WHERE entry IN (195320, 195326);

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

###############################
-- SPAWNING STATIC OBJECTS
###############################

DELETE FROM gameobject WHERE guid BETWEEN 300000 AND 300142;
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
-- chairs
(300000 , 160415 , 628 , 3 , 1 , 1117.19 , -365.674 , 18.8456 , 0.968657 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300001 , 195418 , 628 , 3 , 1 , 632.156 , -304.503 , 5.4879 , 1.15603 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300002 , 195416 , 628 , 3 , 1 , 643.86 , -270.204 , 5.48898 , 2.36903 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300003 , 160410 , 628 , 3 , 1 , 902.234 , -455.508 , 18.3935 , -1.00356 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300004 , 160410 , 628 , 3 , 1 , 1066.19 , -337.214 , 18.8225 , 0.453785 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300005 , 160418 , 628 , 3 , 1 , 810.237 , -461.2 , 25.4627 , 1.5708 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300006 , 160416 , 628 , 3 , 1 , 798.324 , -444.951 , 22.5601 , -1.02102 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300007 , 160416 , 628 , 3 , 1 , 1081.81 , -358.637 , 18.5531 , 1.92859 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300008 , 160419 , 628 , 3 , 1 , 814.931 , -470.816 , 33.6373 , -3.12412 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300009 , 195410 , 628 , 3 , 1 , 632.876 , -282.461 , 5.45364 , -0.851094 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300010 , 195414 , 628 , 3 , 1 , 635.796 , -276.295 , 5.48659 , -3.03273 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300011 , 160415 , 628 , 3 , 1 , 762.245 , -444.795 , 22.8526 , -1.98095 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- flagpoles
(300012 , 195131 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.74278 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300013 , 195131 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300014 , 195131 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.91986 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300015 , 195131 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300016 , 195131 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.23147 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300017 , 195439 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300018 , 195439 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- stoves
(300019 , 174863 , 628 , 3 , 1 , 903.291 , -457.345 , 18.1356 , 2.23402 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300020 , 174863 , 628 , 3 , 1 , 11068.1 , -336.373 , 18.5647 , -2.59181 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300021 , 160411 , 628 , 3 , 1 , 761.462 , -446.684 , 22.5602 , 0.244344 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300022 , 160411 , 628 , 3 , 1 , 1118.32 , -363.969 , 18.5532 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- bench
(300023 , 186896 , 628 , 3 , 1 , 834.208 , -461.826 , 22.3067 , 1.5708 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300024 , 186922 , 628 , 3 , 1 , 826.153 , -461.985 , 22.5149 , 1.5708 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300025 , 186899 , 628 , 3 , 1 , 817.446 , -470.47 , 25.372 , -1.56207 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300026 , 186904 , 628 , 3 , 1 , 827.001 , -474.415 , 25.372 , 1.57952 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300027 , 186897 , 628 , 3 , 1 , 819.264 , -461.961 , 22.7614 , 1.57952 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- bonfires
(300028 , 195376 , 628 , 3 , 1 , 1162.91 , -734.578 , 48.8948 , -2.9845 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300029 , 195208 , 628 , 3 , 1 , 1282.34 , -799.762 , 87.1357 , -3.13286 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300030 , 195210 , 628 , 3 , 1 , 1358.06 , -732.178 , 87.1606 , -3.13284 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300031 , 195207 , 628 , 3 , 1 , 1281.76 , -732.844 , 87.1574 , -3.13246 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300032 , 195209 , 628 , 3 , 1 , 1358.81 , -797.899 , 87.2953 , 3.13312 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300033 , 195377 , 628 , 3 , 1 , 1162.21 , -790.543 , 48.9162 , 2.27765 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- braziers
(300034 , 195402 , 628 , 3 , 1 , 1262.21 , -751.358 , 48.8133 , 2.26893 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300035 , 195403 , 628 , 3 , 1 , 1262.58 , -781.861 , 48.8132 , 2.04203 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300036 , 195425 , 628 , 3 , 1 , 223.818 , -839.352 , 60.7917 , 1.09083 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300037 , 195424 , 628 , 3 , 1 , 224.277 , -822.77 , 60.7917 , 2.06822 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- huge seaforium bombs
(300038 , 195332 , 628 , 3 , 1 , 297.321 , -851.321 , 48.9163 , -0.942477 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300039 , 195332 , 628 , 3 , 1 , 298.104 , -861.026 , 48.9163 , -2.75761 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300040 , 195332 , 628 , 3 , 1 , 300.372 , -818.733 , 48.9162 , 0.785397 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300041 , 195332 , 628 , 3 , 1 , 302.135 , -810.708 , 48.9162 , -1.0472 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300042 , 195333 , 628 , 3 , 1 , 1268.31 , -745.783 , 48.9188 , 0.785397 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300043 , 195333 , 628 , 3 , 1 , 1268.51 , -738.122 , 48.9175 , -1.0472 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300044 , 195333 , 628 , 3 , 1 , 1273.07 , -786.573 , 48.9419 , -0.942477 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300045 , 195333 , 628 , 3 , 1 , 1273.85 , -796.278 , 48.9364 , -2.75761 , 0 , 0 , 0 , 0 , 0 , 0 , 0),

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
(300050 , 195157 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300051 , 180059 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300052 , 180061 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300053 , 180058 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300054 , 180060 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- hangar
(300055 , 195158 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300056 , 180059 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300057 , 180061 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300058 , 180058 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300059 , 180060 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- workshop
(300060 , 195133 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300061 , 180059 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300062 , 180061 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300063 , 180058 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300064 , 180060 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- quarry
(300065 , 195338 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300066 , 180059 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300067 , 180061 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300068 , 180058 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300069 , 180060 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- refinery
(300070 , 195343 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300071 , 180059 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300072 , 180061 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300073 , 180058 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300074 , 180060 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

-- Keeps
--  alli contested
--  horde contested
--  alli owned
--  horde owned
-- Alli keep
(300075 , 195397 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300076 , 195399 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300077 , 195396 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300078 , 195398 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- Horde keep
(300079 , 195392 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300080 , 195394 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300081 , 195391 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300082 , 195393 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

-- banner auras
(300083 , 180100 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300084 , 180101 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300085 , 180102 , 628 , 3 , 1 , 726.385 , -360.205 , 17.8153 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(300086 , 180100 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300087 , 180101 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300088 , 180102 , 628 , 3 , 1 , 807.78 , -1000.07 , 132.381 , -1.93732 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(300089 , 180100 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300090 , 180101 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300091 , 180102 , 628 , 3 , 1 , 776.229 , -804.283 , 6.45052 , 1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(300092 , 180100 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300093 , 180101 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300094 , 180102 , 628 , 3 , 1 , 251.016 , -1159.32 , 17.2376 , -2.25147 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(300095 , 180100 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300096 , 180101 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300097 , 180102 , 628 , 3 , 1 , 1269.5 , -400.809 , 37.6253 , -1.76278 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(300098 , 180100 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300099 , 180101 , 628 , 3 , 1 , 299.153 , -784.589 , 48.9162 , -0.157079 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

(300100 , 180100 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300101 , 180101 , 628 , 3 , 1 , 1284.76 , -705.668 , 48.9163 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),

-- tower portcullisses
(300102 , 195436 , 628 , 3 , 1 , 401.024 , -780.724 , 49.9482 , -2.52896 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300103 , 195436 , 628 , 3 , 1 , 399.802 , -885.208 , 50.1939 , 2.516 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300104 , 195437 , 628 , 3 , 1 , 1156.89 , -843.998 , 48.6322 , 0.732934 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300105 , 195437 , 628 , 3 , 1 , 1157.05 , -682.36 , 48.6322 , -0.829132 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- keep portcullisses
(300106 , 195452 , 628 , 3 , 1 , 273.033 , -832.199 , 51.4109 , -0.0261791 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300107 , 195451 , 628 , 3 , 1 , 288.203 , -832.767 , 51.4681 , 6.24156 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300108 , 195223 , 628 , 3 , 1 , 1283.05 , -765.878 , 50.8297 , -3.13286 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- teleports
(300109 , 195315 , 628 , 3 , 1 , 324.635 , -749.128 , 49.3602 , 0.0174525 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300110 , 195315 , 628 , 3 , 1 , 311.92 , -913.972 , 48.8159 , 3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300111 , 195315 , 628 , 3 , 1 , 425.675 , -857.09 , 48.5104 , -1.6057 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300112 , 195316 , 628 , 3 , 1 , 323.54 , -888.361 , 48.9197 , 0.0349063 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300113 , 195316 , 628 , 3 , 1 , 326.285 , -777.366 , 49.0208 , 3.12412 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300114 , 195316 , 628 , 3 , 1 , 397.089 , -859.382 , 48.8993 , 1.64061 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300115 , 195314 , 628 , 3 , 1 , 1143.25 , -779.599 , 48.629 , 1.64061 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300116 , 195314 , 628 , 3 , 1 , 1236.53 , -669.415 , 48.2729 , 0.104719 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300117 , 195314 , 628 , 3 , 1 , 1235.09 , -857.898 , 48.9163 , 3.07177 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300118 , 195313 , 628 , 3 , 1 , 1233.27 , -844.526 , 48.8824 , -0.0174525 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300119 , 195313 , 628 , 3 , 1 , 1235.53 , -683.872 , 49.304 , -3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300120 , 195313 , 628 , 3 , 1 , 1158.76 , -746.182 , 48.6277 , -1.51844 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- teleport effects
(300121 , 195701 , 628 , 3 , 1 , 425.686 , -857.092 , 48.51 , -1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300122 , 195701 , 628 , 3 , 1 , 324.634 , -749.148 , 49.359 , 0.0174525 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300123 , 195701 , 628 , 3 , 1 , 311.911 , -913.986 , 48.8157 , 3.08918 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300124 , 195701 , 628 , 3 , 1 , 326.266 , -777.347 , 49.0215 , 3.12412 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300125 , 195701 , 628 , 3 , 1 , 323.55 , -888.347 , 48.9198 , 0.0174525 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300126 , 195701 , 628 , 3 , 1 , 397.116 , -859.378 , 48.8989 , 1.64061 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300127 , 195702 , 628 , 3 , 1 , 1143.25 , -779.623 , 48.6291 , 1.62316 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300128 , 195702 , 628 , 3 , 1 , 1158.64 , -746.148 , 48.6277 , -1.50098 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300129 , 195702 , 628 , 3 , 1 , 1233.25 , -844.573 , 48.8836 , 0.0174525 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300130 , 195702 , 628 , 3 , 1 , 1235.07 , -857.957 , 48.9163 , 3.05433 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300131 , 195702 , 628 , 3 , 1 , 1236.46 , -669.344 , 48.2684 , 0.087266 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
(300132 , 195702 , 628 , 3 , 1 , 1235.6 , -683.806 , 49.3028 , -3.07177 , 0 , 0 , 0 , 0 , 0 , 0 , 1),
-- gunship portals
(300133 , 195320 , 628 , 3 , 1 , 827.958 , -994.467 , 134.071 , 0 , 0 , 0 , 0 , 0 , 0 , 0, 0),
(300134 , 195320 , 628 , 3 , 1 , 738.613 , -1106.58 , 134.745 , 2.54818 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300135 , 195320 , 628 , 3 , 1 , 672.283 , -1156.99 , 133.706 , 1.37881 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300136 , 195326 , 628 , 3 , 1 , 827.958 , -994.467 , 134.071 , 0 , 0 , 0 , 0 , 0 , 0 , 0, 0),
(300137 , 195326 , 628 , 3 , 1 , 738.613 , -1106.58 , 134.745 , 2.54818 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300138 , 195326 , 628 , 3 , 1 , 672.283 , -1156.99 , 133.706 , 1.37881 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
-- seaforium bombs
(300139 , 195232 , 628 , 3 , 1 , 750.601 , -864.597 , 13.4754 , 1.93731 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300140 , 195232 , 628 , 3 , 1 , 785.509 , -864.715 , 13.3993 , 2.47837 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300141 , 195237 , 628 , 3 , 1 , 750.601 , -864.597 , 13.4754 , 1.93731 , 0 , 0 , 0 , 0 , 0 , 0 , 0),
(300142 , 195237 , 628 , 3 , 1 , 785.509 , -864.715 , 13.3993 , 2.47837 , 0 , 0 , 0 , 0 , 0 , 0 , 0);

DELETE FROM gameobject_battleground WHERE guid BETWEEN 300000 AND 300142;
INSERT INTO gameobject_battleground (guid, event1, event2) VALUES
(300050 , 0 , 0),
(300051 , 0 , 1),
(300052 , 0 , 2),
(300053 , 0 , 3),
(300054 , 0 , 4),
(300055 , 1 , 0),
(300056 , 1 , 1),
(300057 , 1 , 2),
(300058 , 1 , 3),
(300059 , 1 , 4),
(300060 , 2 , 0),
(300061 , 2 , 1),
(300062 , 2 , 2),
(300063 , 2 , 3),
(300064 , 2 , 4),
(300065 , 3 , 0),
(300066 , 3 , 1),
(300067 , 3 , 2),
(300068 , 3 , 3),
(300069 , 3 , 4),
(300070 , 4 , 0),
(300071 , 4 , 1),
(300072 , 4 , 2),
(300073 , 4 , 3),
(300074 , 4 , 4),
(300075 , 5 , 1),
(300076 , 5 , 2),
(300077 , 5 , 3),
(300078 , 5 , 4),
(300079 , 6 , 1),
(300080 , 6 , 2),
(300081 , 6 , 3),
(300082 , 6 , 4),
(300083 , 0 , 3),
(300084 , 0 , 4),
(300085 , 0 , 0),
(300086 , 1 , 3),
(300087 , 1 , 4),
(300088 , 1 , 0),
(300089 , 2 , 3),
(300090 , 2 , 4),
(300091 , 2 , 0),
(300092 , 3 , 3),
(300093 , 3 , 4),
(300094 , 3 , 0),
(300095 , 4 , 3),
(300096 , 4 , 4),
(300097 , 4 , 0),
(300098 , 5 , 3),
(300099 , 5 , 4),
(300100 , 6 , 3),
(300101 , 6 , 4),
(300102 , 254 , 0),
(300103 , 254 , 0),
(300104 , 254 , 0),
(300105 , 254 , 0),
(300106 , 251 , 0),
(300107 , 251 , 0),
(300108 , 252 , 0),
(300109 , 7 , 0),
(300110 , 7 , 0),
(300111 , 7 , 0),
(300112 , 7 , 0),
(300113 , 7 , 0),
(300114 , 7 , 0),
(300115 , 7 , 0),
(300116 , 7 , 0),
(300117 , 7 , 0),
(300118 , 7 , 0),
(300119 , 7 , 0),
(300120 , 7 , 0),
(300121 , 254 , 0),
(300122 , 254 , 0),
(300123 , 254 , 0),
(300124 , 254 , 0),
(300125 , 254 , 0),
(300126 , 254 , 0),
(300127 , 254 , 0),
(300128 , 254 , 0),
(300129 , 254 , 0),
(300130 , 254 , 0),
(300131 , 254 , 0),
(300132 , 254 , 0),
(300133 , 1 , 3),
(300134 , 1 , 3),
(300135 , 1 , 3),
(300136 , 1 , 4),
(300137 , 1 , 4),
(300138 , 1 , 4),
(300139 , 2 , 3),
(300140 , 2 , 3),
(300141 , 2 , 4),
(300142 , 2 , 4);

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

DELETE FROM creature WHERE guid BETWEEN 300000 AND  300068;
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, modelid, equipment_id, position_x, position_y, position_z, orientation, spawntimesecs, spawndist, currentwaypoint, curhealth, curmana, DeathState, MovementType) VALUES
-- workshop siege engines
(300000, 34776, 628, 3, 1, 0, 0, 773.680542, -884.092041, 16.8090363, 1.58824956, 0, 0, 0, 250000, 0, 0, 0),
(300001, 35069, 628, 3, 1, 0, 0, 773.680542, -884.092041, 16.8090363, 1.58824956, 0, 0, 0, 250000, 0, 0, 0),
-- workshop demolishers
(300002, 34775, 628, 3, 1, 0, 0, 751.8281, -852.732666, 12.5250978, 1.46607661, 0, 0, 0, 70000, 0, 0, 0),
(300003, 34775, 628, 3, 1, 0, 0, 761.809, -854.2274, 12.5263243, 1.46607661, 0, 0, 0, 70000, 0, 0, 0),
(300004, 34775, 628, 3, 1, 0, 0, 783.4722, -853.9601, 12.54775, 1.71042264, 0, 0, 0, 70000, 0, 0, 0),
(300005, 34775, 628, 3, 1, 0, 0, 793.055542, -852.71875, 12.5671329, 1.71042264, 0, 0, 0, 70000, 0, 0, 0),
(300006, 34775, 628, 3, 1, 0, 0, 751.8281, -852.732666, 12.5250978, 1.46607661, 0, 0, 0, 70000, 0, 0, 0),
(300007, 34775, 628, 3, 1, 0, 0, 761.809, -854.2274, 12.5263243, 1.46607661, 0, 0, 0, 70000, 0, 0, 0),
(300008, 34775, 628, 3, 1, 0, 0, 783.4722, -853.9601, 12.54775, 1.71042264, 0, 0, 0, 70000, 0, 0, 0),
(300009, 34775, 628, 3, 1, 0, 0, 793.055542, -852.71875, 12.5671329, 1.71042264, 0, 0, 0, 70000, 0, 0, 0),
-- dock glaive throwers
(300010, 34802, 628, 3, 1, 0, 0, 779.3125, -342.972229, 12.2104874, 4.712389, 0, 0, 0, 50000, 0, 0, 0),
(300011, 34802, 628, 3, 1, 0, 0, 790.029541, -342.899323, 12.2128582, 4.71238, 0, 0, 0, 50000, 0, 0, 0),
(300012, 35273, 628, 3, 1, 0, 0, 779.3125, -342.972229, 12.2104874, 4.712389, 0, 0, 0, 50000, 0, 0, 0),
(300013, 35273, 628, 3, 1, 0, 0, 790.029541, -342.899323, 12.2128582, 4.71238, 0, 0, 0, 50000, 0, 0, 0),
-- dock catapults
(300014, 34793, 628, 3, 1, 0, 0, 757.283, -341.7795, 12.2113762, 4.729842, 0, 0, 0, 15000, 0, 0, 0),
(300015, 34793, 628, 3, 1, 0, 0, 766.947937, -342.053833, 12.2009945, 4.694, 0, 0, 0, 15000, 0, 0, 0),
(300016, 34793, 628, 3, 1, 0, 0, 800.3785, -342.607635, 12.1669979, 4.6774, 0, 0, 0, 15000, 0, 0, 0),
(300017, 34793, 628, 3, 1, 0, 0, 810.7257, -342.083344, 12.1675768, 4.6600, 0, 0, 0, 15000, 0, 0, 0),
(300018, 34793, 628, 3, 1, 0, 0, 757.283, -341.7795, 12.2113762, 4.729842, 0, 0, 0, 15000, 0, 0, 0),
(300019, 34793, 628, 3, 1, 0, 0, 766.947937, -342.053833, 12.2009945, 4.694, 0, 0, 0, 15000, 0, 0, 0),
(300020, 34793, 628, 3, 1, 0, 0, 800.3785, -342.607635, 12.1669979, 4.6774, 0, 0, 0, 15000, 0, 0, 0),
(300021, 34793, 628, 3, 1, 0, 0, 810.7257, -342.083344, 12.1675768, 4.6600, 0, 0, 0, 15000, 0, 0, 0),
-- spirit guides (alli - docks, hangar, workshop, alli keep, horde keep, alli rescue point)
(300022, 13116, 628, 3, 1, 0, 0, 629.57, -279.83, 11.33, 0.0, 0, 0, 0, 24420, 4868, 0, 0),
(300023, 13116, 628, 3, 1, 0, 0, 780.729, -1103.08, 135.51, 2.27, 0, 0, 0, 24420, 4868, 0, 0),
(300024, 13116, 628, 3, 1, 0, 0, 775.74, -652.77, 9.31, 4.27, 0, 0, 0, 24420, 4868, 0, 0),
(300025, 13116, 628, 3, 1, 0, 0, 278.42, -883.20, 49.89, 1.53, 0, 0, 0, 24420, 4868, 0, 0),
(300026, 13116, 628, 3, 1, 0, 0, 1300.91, -834.04, 48.91, 1.69, 0, 0, 0, 24420, 4868, 0, 0),
(300027, 13116, 628, 3, 1, 0, 0, 438.86, -310.04, 51.81, 5.87, 0, 0, 0, 24420, 4868, 0, 0),
-- spirit guides (horde - docks, hangar, workshop, horde keep, alli keep, horde rescue point)
(300028, 13117, 628, 3, 1, 0, 0, 629.57, -279.83, 11.33, 0.0, 0, 0, 0, 24420, 4868, 0, 0),
(300029, 13117, 628, 3, 1, 0, 0, 780.729, -1103.08, 135.51, 2.27, 0, 0, 0, 24420, 4868, 0, 0),
(300030, 13117, 628, 3, 1, 0, 0, 775.74, -652.77, 9.31, 4.27, 0, 0, 0, 24420, 4868, 0, 0),
(300031, 13117, 628, 3, 1, 0, 0, 1300.91, -834.04, 48.91, 1.69, 0, 0, 0, 24420, 4868, 0, 0),
(300032, 13117, 628, 3, 1, 0, 0, 278.42, -883.20, 49.89, 1.53, 0, 0, 0, 24420, 4868, 0, 0),
(300033, 13117, 628, 3, 1, 0, 0, 1148.65, -1250.98, 16.60, 1.74, 0, 0, 0, 24420, 4868, 0, 0),
-- bosses (horde, alli)
(300034, 34922, 628, 3, 1, 0, 0, 1295.44, -765.733, 70.0541, 0.0, 0, 0, 0, 600001, 0, 0, 0),
(300035, 34924, 628, 3, 1, 0, 0, 224.983, -831.573, 60.9034, 0.0, 0, 0, 0, 600001, 0, 0, 0),
-- boss guards (4x horde, 4x alli)
(300036, 34918, 628, 3, 1, 0, 0, 1296.01, -773.256, 69.958, 0.292168, 0, 0, 0, 4608, 0, 0, 0),
(300037, 34918, 628, 3, 1, 0, 0, 1295.94, -757.756, 69.9587, 6.02165, 0, 0, 0, 4608, 0, 0, 0),
(300038, 34918, 628, 3, 1, 0, 0, 1295.09, -760.927, 69.9587, 5.94311, 0, 0, 0, 4608, 0, 0, 0),
(300039, 34918, 628, 3, 1, 0, 0, 1295.13, -769.7, 69.95, 0.34, 0, 0, 0, 4608, 0, 0, 0),
(300040, 34919, 628, 3, 1, 0, 0, 223.969, -822.958, 60.8151, 0.46337, 0, 0, 0, 4608, 0, 0, 0),
(300041, 34919, 628, 3, 1, 0, 0, 224.211, -826.952, 60.8188, 6.25961, 0, 0, 0, 4608, 0, 0, 0),
(300042, 34919, 628, 3, 1, 0, 0, 223.119, -838.386, 60.8145, 5.64857, 0, 0, 0, 4608, 0, 0, 0),
(300043, 34919, 628, 3, 1, 0, 0, 223.889, -835.102, 60.8201, 6.21642, 0, 0, 0, 4608, 0, 0, 0),
-- keep cannons
(300044, 34944, 628, 3, 1, 0, 0, 415.825, -754.634, 87.799, 1.78024, 0, 0, 0, 35000, 0, 0, 0),
(300045, 34944, 628, 3, 1, 0, 0, 410.142, -755.332, 87.7991, 1.78024, 0, 0, 0, 35000, 0, 0, 0),
(300046, 34944, 628, 3, 1, 0, 0, 424.33, -879.352, 88.0446, 0.436332, 0, 0, 0, 35000, 0, 0, 0),
(300047, 34944, 628, 3, 1, 0, 0, 425.602, -786.646, 87.7991, 5.74213, 0, 0, 0, 35000, 0, 0, 0),
(300048, 34944, 628, 3, 1, 0, 0, 426.743, -884.939, 87.9613, 0.436332, 0, 0, 0, 35000, 0, 0, 0),
(300049, 34944, 628, 3, 1, 0, 0, 404.736, -755.495, 87.7989, 1.78024, 0, 0, 0, 35000, 0, 0, 0),
(300050, 34944, 628, 3, 1, 0, 0, 428.375, -780.797, 87.7991, 5.79449, 0, 0, 0, 35000, 0, 0, 0),
(300051, 34944, 628, 3, 1, 0, 0, 429.175, -890.436, 88.0446, 0.436332, 0, 0, 0, 35000, 0, 0, 0),
(300052, 34944, 628, 3, 1, 0, 0, 430.872, -775.278, 87.7991, 5.88176, 0, 0, 0, 35000, 0, 0, 0),
(300053, 34944, 628, 3, 1, 0, 0, 408.056, -911.283, 88.0445, 4.64258, 0, 0, 0, 35000, 0, 0, 0),
(300054, 34944, 628, 3, 1, 0, 0, 413.609, -911.566, 88.0447, 4.66003, 0, 0, 0, 35000, 0, 0, 0),
(300055, 34944, 628, 3, 1, 0, 0, 402.554, -910.557, 88.0446, 4.57276, 0, 0, 0, 35000, 0, 0, 0),
(300056, 34944, 628, 3, 1, 0, 0, 1158.91, -660.144, 87.9332, 0.750492, 0, 0, 0, 35000, 0, 0, 0),
(300057, 34944, 628, 3, 1, 0, 0, 1156.22, -866.809, 87.8754, 5.27089, 0, 0, 0, 35000, 0, 0, 0),
(300058, 34944, 628, 3, 1, 0, 0, 1163.74, -663.67, 88.3571, 0.558505, 0, 0, 0, 35000, 0, 0, 0),
(300059, 34944, 628, 3, 1, 0, 0, 1135.18, -683.896, 88.0409, 3.9619, 0, 0, 0, 35000, 0, 0, 0),
(300060, 34944, 628, 3, 1, 0, 0, 1138.91, -836.359, 88.3728, 2.18166, 0, 0, 0, 35000, 0, 0, 0),
(300061, 34944, 628, 3, 1, 0, 0, 1162.08, -863.717, 88.358, 5.48033, 0, 0, 0, 35000, 0, 0, 0),
(300062, 34944, 628, 3, 1, 0, 0, 1167.13, -669.212, 87.9682, 0.383972, 0, 0, 0, 35000, 0, 0, 0),
(300063, 34944, 628, 3, 1, 0, 0, 1137.72, -688.517, 88.4023, 3.9619, 0, 0, 0, 35000, 0, 0, 0),
(300064, 34944, 628, 3, 1, 0, 0, 1135.29, -840.878, 88.0252, 2.30383, 0, 0, 0, 35000, 0, 0, 0),
(300065, 34944, 628, 3, 1, 0, 0, 1144.33, -833.309, 87.9268, 2.14675, 0, 0, 0, 35000, 0, 0, 0),
(300066, 34944, 628, 3, 1, 0, 0, 1135.29, -840.878, 88.0252, 2.30383, 0, 0, 0, 35000, 0, 0, 0),
(300067, 34944, 628, 3, 1, 0, 0, 1142.59, -691.946, 87.9756, 3.9619, 0, 0, 0, 35000, 0, 0, 0),
(300068, 34944, 628, 3, 1, 0, 0, 1166.13, -858.391, 87.9653, 5.63741, 0, 0, 0, 35000, 0, 0, 0);

DELETE FROM creature_battleground WHERE guid BETWEEN 300000 AND 300068;
INSERT INTO creature_battleground (guid, event1, event2) VALUES
-- siege engines
(300000 , 2 , 3),
(300001 , 2 , 4),
-- demolishers
(300002 , 2 , 3),
(300003 , 2 , 3),
(300004 , 2 , 3),
(300005 , 2 , 3),
(300006 , 2 , 4),
(300007 , 2 , 4),
(300008 , 2 , 4),
(300009 , 2 , 4),
-- glaive throwers
(300010 , 0 , 3),
(300011 , 0 , 3),
(300012 , 0 , 4),
(300013 , 0 , 4),
-- catapults
(300014 , 0 , 3),
(300015 , 0 , 3),
(300016 , 0 , 3),
(300017 , 0 , 3),
(300018 , 0 , 4),
(300019 , 0 , 4),
(300020 , 0 , 4),
(300021 , 0 , 4),
-- spirit guides
(300022 , 0 , 3),
(300023 , 1 , 3),
(300024 , 2 , 3),
(300025 , 5 , 3),
(300026 , 6 , 3),
(300028 , 0 , 4),
(300029 , 1 , 4),
(300030 , 2 , 4),
(300031 , 5 , 4),
(300032 , 6 , 4),
-- bosses
(300034 , 12 , 0),
(300035 , 11 , 0),
-- boss guards
(300036 , 10 , 0),
(300037 , 10 , 0),
(300038 , 10 , 0),
(300039 , 10 , 0),
(300040 , 9 , 0),
(300041 , 9 , 0),
(300042 , 9 , 0),
(300043 , 9 , 0),
-- keep cannons
(300044 , 8 , 0),
(300045 , 8 , 0),
(300046 , 8 , 0),
(300047 , 8 , 0),
(300048 , 8 , 0),
(300049 , 8 , 0),
(300050 , 8 , 0),
(300051 , 8 , 0),
(300052 , 8 , 0),
(300053 , 8 , 0),
(300054 , 8 , 0),
(300055 , 8 , 0),
(300056 , 8 , 0),
(300057 , 8 , 0),
(300058 , 8 , 0),
(300059 , 8 , 0),
(300060 , 8 , 0),
(300061 , 8 , 0),
(300062 , 8 , 0),
(300063 , 8 , 0),
(300064 , 8 , 0),
(300065 , 8 , 0),
(300066 , 8 , 0),
(300067 , 8 , 0),
(300068 , 8 , 0);
