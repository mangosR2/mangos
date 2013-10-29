-- Data for fill worlstate template values (clean mangos)
TRUNCATE TABLE `worldstate_template`;

-- Flags definition
SET @FLAG_ACTIVE          = 2; -- 0x2
SET @FLAG_INITIAL_STATE   = 65536; -- 0x10000
SET @FLAG_NOT_EXPIREABLE  = 262144; -- 0x40000

-- Combinations of flag
SET @FLAG_INITIAL_ACTIVE = @FLAG_ACTIVE + @FLAG_INITIAL_STATE;
SET @FLAG_INITIAL_ACTIVE_NONEXPIRE = @FLAG_ACTIVE + @FLAG_INITIAL_STATE + @FLAG_NOT_EXPIREABLE;

-- Common
DELETE FROM `worldstate_template` WHERE `type` = 1 AND `condition` = 0;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(1941, 1, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1942, 1, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1943, 1, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2259, 1, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'common'),
(2260, 1, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'common'),
(2261, 1, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'common'),
(2262, 1, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'common'),
(2263, 1, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'common'),
(2264, 1, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'common'),
(2851, 1, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(3695, 1, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4273, 1, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Arena season ID
(3191, 1, 0, @FLAG_INITIAL_ACTIVE_NONEXPIRE, 8, 0, '', 'Current arena season'),
(3901, 1, 0, @FLAG_INITIAL_ACTIVE_NONEXPIRE, 7, 0, '', 'Previous arena season'),
-- Wintergrasp
(3710, 1, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Battle for Wintergrasp active 1'),
(3801, 1, 0, @FLAG_INITIAL_ACTIVE, 1, 0, '', 'Battle for Wintergrasp active 2 (negative)'),
(3802, 1, 0, @FLAG_INITIAL_ACTIVE, 0, 3801, '', 'WinterGrasp defender (0- ally, 1-horde)'),
(3803, 1, 0, @FLAG_INITIAL_ACTIVE, 1, 3801, '', 'WinterGrasp attacker (0- ally, 1-horde)'),
(3781, 1, 0, @FLAG_INITIAL_ACTIVE, 1331819537, 0, '', 'Wintergrasp timer 1'),
(4354, 1, 0, @FLAG_INITIAL_ACTIVE, 1331819537, 0, '', 'Wintergrasp timer 2');

-- Common values, where excluded in instances and some maps
DELETE FROM `worldstate_template` WHERE `type` = 9 AND `condition` = 0;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
-- Non-instance (UnCommon)
(2322, 9, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2323, 9, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2324, 9, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2325, 9, 0, @FLAG_INITIAL_ACTIVE, 0, 0, '', '');

-- Eastern Plaguelands
DELETE FROM `worldstate_template` WHERE `type` = 5 AND `condition` = 139;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
-- Counters
(2327, 5, 139, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2328, 5, 139, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- North pass
(2352, 5, 139, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2372, 5, 139, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2373, 5, 139, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- PlagueWood
(2353, 5, 139, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2370, 5, 139, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2371, 5, 139, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Crown guard
(2355, 5, 139, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2378, 5, 139, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2379, 5, 139, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- East wall
(2361, 5, 139, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2354, 5, 139, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2356, 5, 139, @FLAG_INITIAL_ACTIVE, 0, 0, '', '');

-- Hellfire peninsula
DELETE FROM `worldstate_template` WHERE `type` = 5 AND `condition` = 3483;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
-- Stadium
(2470, 5, 3483, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2471, 5, 3483, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2472, 5, 3483, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
-- Overlook
(2480, 5, 3483, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2481, 5, 3483, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2482, 5, 3483, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
-- Broken hill
(2483, 5, 3483, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2484, 5, 3483, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2485, 5, 3483, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
-- Counter horde
(2478, 5, 3483, @FLAG_INITIAL_ACTIVE, 0, 2489, '', ''),
(2489, 5, 3483, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
-- Counter ally
(2476, 5, 3483, @FLAG_INITIAL_ACTIVE, 0, 2490, '', ''),
(2490, 5, 3483, @FLAG_INITIAL_ACTIVE, 1, 0, '', '');

-- Terrokar forest
DELETE FROM `worldstate_template` WHERE `type` = 5 AND `condition` = 3519;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
-- Counter
(2620, 5, 3519, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2621, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 2620, '', ''),
(2622, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 2620, '', ''),
-- TF locked
(2508, 5, 3519, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2767, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2768, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- TF lock timer
(2509, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2512, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2510, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Tower 1
(2681, 5, 3519, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2682, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2683, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Tower 2
(2686, 5, 3519, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2684, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2685, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Tower 3
(2690, 5, 3519, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2688, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2689, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Tower 5
(2693, 5, 3519, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2691, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2692, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Tower 4
(2696, 5, 3519, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2694, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2695, 5, 3519, @FLAG_INITIAL_ACTIVE, 0, 0, '', '');

-- Zangarmarsh
DELETE FROM `worldstate_template` WHERE `type` = 5 AND `condition` = 3521;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
-- Beacon east
(2555, 5, 3521, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2556, 5, 3521, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2557, 5, 3521, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
-- Beacon west
(2558, 5, 3521, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2559, 5, 3521, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2560, 5, 3521, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
-- Tower West
(2644, 5, 3521, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2645, 5, 3521, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2646, 5, 3521, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
-- GraveYard
(2647, 5, 3521, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2648, 5, 3521, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2649, 5, 3521, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Tower East
(2650, 5, 3521, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2651, 5, 3521, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2652, 5, 3521, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),

-- (2653, 5, 3521, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Unk'),

-- Ally flag
(2655, 5, 3521, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2656, 5, 3521, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
-- Horde flag
(2657, 5, 3521, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2658, 5, 3521, @FLAG_INITIAL_ACTIVE, 0, 0, '', '');

-- Halaa WorldPvP area
DELETE FROM `worldstate_template` WHERE `type` = 5 AND `condition` = 3518;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
-- Nagrand
(2491, 5, 3518, @FLAG_INITIAL_ACTIVE, 15, 0, '', ''),
(2493, 5, 3518, @FLAG_INITIAL_ACTIVE, 15, 0, '', ''),
(2503, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2502, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Wywern north
(2762, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2662, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2663, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2664, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Wywern south
(2760, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2670, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2668, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2669, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Wywern west
(2761, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2667, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2665, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2666, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Wywern east
(2763, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2659, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2660, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2661, 5, 3518, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Halaa common
(2671, 5, 3518, @FLAG_INITIAL_ACTIVE, 1,  0, '', ''),
(2672, 5, 3518, @FLAG_INITIAL_ACTIVE, 0,  0, '', ''),
(2673, 5, 3518, @FLAG_INITIAL_ACTIVE, 0,  0, '', ''),
(2676, 5, 3518, @FLAG_INITIAL_ACTIVE, 0,  0, '', ''),
(2677, 5, 3518, @FLAG_INITIAL_ACTIVE, 0,  0, '', '');

-- Silithus
DELETE FROM `worldstate_template` WHERE `type` = 5 AND `condition` = 1377;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(2313, 5, 1377, @FLAG_INITIAL_ACTIVE, 0, 2317, '', ''),
(2314, 5, 1377, @FLAG_INITIAL_ACTIVE, 0, 2317, '', ''),
(2317, 5, 1377, @FLAG_INITIAL_ACTIVE, 200,  0, '', '');

-- WinterGrasp
DELETE FROM `worldstate_template` WHERE `type` = 5 AND `condition` = 4197;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
-- Vehicle numbers
(3680, 5, 4197, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Vehicle number ally'),
(3681, 5, 4197, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Vehicle max number ally'),
(3690, 5, 4197, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Vehicle number horde'),
(3691, 5, 4197, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Vehicle max number horde'),
-- Another vehicle numbers (old version?)
(3490, 5, 4197, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Vehicle number horde'),
(3491, 5, 4197, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Vehicle max number horde'),
-- Workshops
(3698, 5, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', 'WORLDSTATE_WORKSHOP_K_W'),
(3699, 5, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', 'WORLDSTATE_WORKSHOP_K_E'),
(3700, 5, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', 'WORLDSTATE_WORKSHOP_NW'),
(3701, 5, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', 'WORLDSTATE_WORKSHOP_NE'),
(3702, 5, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', 'WORLDSTATE_WORKSHOP_SW'),
(3703, 5, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', 'WORLDSTATE_WORKSHOP_SE'),
-- Buildings
(3773, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191810'),
(3763, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190375'),
-- South tower
(3704, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190356'),
(3705, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190357'),
(3706, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190358'),
-- Wall
(3765, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191797'),
(3771, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191798'),
(3768, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191805'),
-- Tower of keep
(3711, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190221'),
(3712, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190378'),
(3713, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190373'),
(3714, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190377'),
-- Buildings
(3749, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190219'),
(3750, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190220'),
(3764, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191795'),
(3772, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191796'),
(3762, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191799'),
(3766, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191800'),
(3770, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191801'),
(3751, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191802'),
(3752, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191803'),
(3767, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191804'),
(3769, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191806'),
(3759, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191807'),
(3760, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191808'),
(3761, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '191809'),
(3753, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190369'),
(3758, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190370'),
(3754, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190371'),
(3757, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190372'),
(3755, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190374'),
(3756, 10, 4197, @FLAG_INITIAL_ACTIVE, 1, 0, '', '190376');

-- Gameobjects link to WS
UPDATE `gameobject_template` SET `data23` = 3773 WHERE `entry` = 191810;
UPDATE `gameobject_template` SET `data23` = 3763 WHERE `entry` = 190375;
UPDATE `gameobject_template` SET `data23` = 3704 WHERE `entry` = 190356;
UPDATE `gameobject_template` SET `data23` = 3705 WHERE `entry` = 190357;
UPDATE `gameobject_template` SET `data23` = 3706 WHERE `entry` = 190358;
UPDATE `gameobject_template` SET `data23` = 3765 WHERE `entry` = 191797;
UPDATE `gameobject_template` SET `data23` = 3771 WHERE `entry` = 191798;
UPDATE `gameobject_template` SET `data23` = 3768 WHERE `entry` = 191805;
UPDATE `gameobject_template` SET `data23` = 3711 WHERE `entry` = 190221;
UPDATE `gameobject_template` SET `data23` = 3712 WHERE `entry` = 190378;
UPDATE `gameobject_template` SET `data23` = 3713 WHERE `entry` = 190373;
UPDATE `gameobject_template` SET `data23` = 3714 WHERE `entry` = 190377;
UPDATE `gameobject_template` SET `data23` = 3749 WHERE `entry` = 190219;
UPDATE `gameobject_template` SET `data23` = 3750 WHERE `entry` = 190220;
UPDATE `gameobject_template` SET `data23` = 3764 WHERE `entry` = 191795;
UPDATE `gameobject_template` SET `data23` = 3772 WHERE `entry` = 191796;
UPDATE `gameobject_template` SET `data23` = 3762 WHERE `entry` = 191799;
UPDATE `gameobject_template` SET `data23` = 3766 WHERE `entry` = 191800;
UPDATE `gameobject_template` SET `data23` = 3770 WHERE `entry` = 191801;
UPDATE `gameobject_template` SET `data23` = 3751 WHERE `entry` = 191802;
UPDATE `gameobject_template` SET `data23` = 3752 WHERE `entry` = 191803;
UPDATE `gameobject_template` SET `data23` = 3767 WHERE `entry` = 191804;
UPDATE `gameobject_template` SET `data23` = 3769 WHERE `entry` = 191806;
UPDATE `gameobject_template` SET `data23` = 3759 WHERE `entry` = 191807;
UPDATE `gameobject_template` SET `data23` = 3760 WHERE `entry` = 191808;
UPDATE `gameobject_template` SET `data23` = 3761 WHERE `entry` = 191809;
UPDATE `gameobject_template` SET `data23` = 3753 WHERE `entry` = 190369;
UPDATE `gameobject_template` SET `data23` = 3758 WHERE `entry` = 190370;
UPDATE `gameobject_template` SET `data23` = 3754 WHERE `entry` = 190371;
UPDATE `gameobject_template` SET `data23` = 3757 WHERE `entry` = 190372;
UPDATE `gameobject_template` SET `data23` = 3755 WHERE `entry` = 190374;
UPDATE `gameobject_template` SET `data23` = 3756 WHERE `entry` = 190376;

-- Battlegrounds
-- Alterac valley
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = 30;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
-- Stoneheart Grave
(1301, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1302, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1303, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1304, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Stormpike first aid station
(1325, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1326, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1327, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1328, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Frostwolf Hut
(1329, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1330, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1331, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1332, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Stormpike first aid station
(1333, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1334, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1335, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1336, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Frostwolf Grave
(1337, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1338, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1339, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1340, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Snowfall Grave
(1341, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1342, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1343, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1344, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Iceblood grave
(1346, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1347, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1348, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1349, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Dunbaldar South Bunker
(1361, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1370, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1375, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1378, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Dunbaldar North Bunker
(1362, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1374, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1379, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1371, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Icewing Bunker
(1363, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1372, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1376, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1380, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Stoneheart Bunker
(1364, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1373, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1377, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1381, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Iceblood Tower
(1368, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1385, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1390, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1395, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Tower Point
(1367, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1384, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1389, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1394, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Frostwolf East
(1366, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1383, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1388, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1393, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Frostwolf West
(1365, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1382, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1387, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1392, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Mines
(1355, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'South mine - alliance'),
(1356, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'South mine - horde'),
(1357, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', 'South mine - neytral'),
(1358, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'North mine - alliance'),
(1359, 4, 30, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'North mine - horde'),
(1360, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', 'North mine - neytral'),
-- Weather?
(1966, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', 'Snowfall'),
-- Counters
(3127, 4, 30, @FLAG_INITIAL_ACTIVE, 600, 3134, '', 'Alliance score'),
(3128, 4, 30, @FLAG_INITIAL_ACTIVE, 600, 3133, '', 'Horde score'),
(3133, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(3134, 4, 30, @FLAG_INITIAL_ACTIVE, 1, 0, '', '');

-- WS
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = 489;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(1545, 4, 489, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1546, 4, 489, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1581, 4, 489, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1582, 4, 489, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1601, 4, 489, @FLAG_INITIAL_ACTIVE, 3, 0, '', ''),
(2338, 4, 489, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2339, 4, 489, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(4247, 4, 489, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(4248, 4, 489, @FLAG_INITIAL_ACTIVE, 25, 0, '', '');

-- AB
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = 529;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
-- Stable
(1842, 4, 529, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1767, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1768, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1769, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1770, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Farm
(1845, 4, 529, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1772, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1773, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1774, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1775, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Blacksmith
(1846, 4, 529, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1782, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1783, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1784, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1785, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Goldmine
(1843, 4, 529, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1787, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1788, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1789, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1790, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Lumbermill
(1844, 4, 529, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(1792, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1793, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1794, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1795, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Unk
(1861, 4, 529, @FLAG_INITIAL_ACTIVE, 2, 0, '', ''),
-- Occupied
(1776, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1777, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1778, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(1779, 4, 529, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Resources
(1780, 4, 529, @FLAG_INITIAL_ACTIVE, 1600, 0, '', ''),
(1955, 4, 529, @FLAG_INITIAL_ACTIVE, 1400, 0, '', '');

-- EY
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = 566;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
-- Counters
(2749, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 2752, '', ''),
(2750, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 2753, '', ''),
(2752, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2753, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Blood elf
(2722, 4, 566, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2723, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2724, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Fel reaver
(2725, 4, 566, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2726, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2727, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Mage tower
(2728, 4, 566, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2729, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2730, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Draenei ruins
(2731, 4, 566, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2732, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2733, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Flags
(2757, 4, 566, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(2769, 4, 566, @FLAG_INITIAL_ACTIVE, 1, 0, '', 'Flag aliance'),
(2770, 4, 566, @FLAG_INITIAL_ACTIVE, 1, 0, '', 'Flag horde'),
-- Unk 1
(2735, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2736, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2737, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2738, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2739, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2740, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2741, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(2742, 4, 566, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Unk2
(2565, 4, 566, @FLAG_INITIAL_ACTIVE, 142, 0, '', ''),
(3085, 4, 566, @FLAG_INITIAL_ACTIVE, 379, 0, '', '');

-- Strand of the ancients
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = 607;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
-- Timer
(3559, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Minutes'),
(3560, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', '10 secs'),
(3561, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'secs'),
(3564, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Battle finish timer (data - 3559,3560,3561)'),
(3565, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Round timer (data - 3559,3560,3561)'),
(3571, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Bonus timer (data - 3559,3560,3561)'),
-- State (?)
(3536, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(3537, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 3536, '', ''),
-- Attackers
(4352, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4353, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Gateways
(3614, 4, 607, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(3617, 4, 607, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(3620, 4, 607, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(3623, 4, 607, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(3638, 4, 607, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(3849, 4, 607, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
-- Horde GY
(3632, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(3633, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(3634, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Alliance GY
(3635, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(3636, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(3637, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Alliance attack token
(3626, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(3627, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Horde attack token
(3628, 4, 607, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(3629, 4, 607, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
-- Defence token
(3630, 4, 607, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(3631, 4, 607, @FLAG_INITIAL_ACTIVE, 0, 0, '', '');

-- Isle of conquest
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = 628;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
-- Counters
(4221, 4, 628, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(4222, 4, 628, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(4226, 4, 628, @FLAG_INITIAL_ACTIVE, 300, 4221, '', ''),
(4227, 4, 628, @FLAG_INITIAL_ACTIVE, 300, 4222, '', ''),
-- Workshop
(4294, 4, 628, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(4228, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4293, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4229, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4230, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Hangar
(4296, 4, 628, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(4300, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4297, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4299, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4298, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Docks
(4301, 4, 628, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(4302, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4303, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4304, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4305, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Quarry
(4306, 4, 628, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(4307, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4308, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4309, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4310, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Refinery
(4311, 4, 628, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(4312, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4313, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4314, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4315, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
-- Gates
(4317, 4, 628, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(4318, 4, 628, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(4319, 4, 628, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(4320, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4321, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4322, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4323, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4324, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4325, 4, 628, @FLAG_INITIAL_ACTIVE, 0, 0, '', ''),
(4326, 4, 628, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(4327, 4, 628, @FLAG_INITIAL_ACTIVE, 1, 0, '', ''),
(4328, 4, 628, @FLAG_INITIAL_ACTIVE, 1, 0, '', '');

-- Arenas
-- Dalaran arena
SET @MAP := 617;
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = @MAP;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(3610, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Arena counters activate'),
(3600, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 3610, '', 'Arena Green command counter'),
(3601, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 3610, '', 'Arena Gold command counter');

-- Ring of Valor
SET @MAP := 618;
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = @MAP;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(3610, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Arena counter activate'),
(3600, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 3610, '', 'Arena Green command counter'),
(3601, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 3610, '', 'Arena Gold command counter');

-- Instances
-- Zulaman
SET @MAP := 568;
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = @MAP;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(3104, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Main WS'),
(3106, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 3104, '', 'Counter');

-- Violet hold
SET @MAP := 608;
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = @MAP;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(3816, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Main WS'),
(3815, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 3816, '', 'Prisons'),
(3810, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 3816, '', 'Portals');

-- Ruby sanctum
SET @MAP := 724;
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = @MAP;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(5051, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Main WS'),
(5050, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 5051, '', 'Counter shadow'),
(5049, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 5051, '', 'Counter real');

-- Culling of Stratholme
SET @MAP := 595;
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = @MAP;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(3479, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Crates WS'),
(3480, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 3479, '', 'Crates count');

-- Hyjal
SET @MAP := 534;
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = @MAP;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(2453, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Enemy WS'),
(2454, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 2453, '', 'Enemy count'),
(2842, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Waves');

-- Old hillsbrad
SET @MAP := 560;
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = @MAP;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(2436, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Old Hillsbrad WS');

-- Dark portal
SET @MAP := 269;
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = @MAP;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(2541, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Main WS'),
(2540, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 2541, '', 'Shield'),
(2784, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Rift');

-- Ulduar raid
SET @MAP := 603;
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = @MAP;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(4132, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Algalon timer'),
(4131, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 4132, '', 'Algalon timer counter');

-- Halls of reflection
SET @MAP := 668;
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = @MAP;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(4884, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'HOR Waves main WS'),
(4882, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 4884, '', 'HOR Waves counter');

-- Trial of Crusader
SET @MAP := 649;
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = @MAP;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(4390, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'TOC attempts main WS'),
(4389, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 4390, '', 'TOC attempts counter');

-- Oculus
SET @MAP := 578;
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = @MAP;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(3524, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Oculus CONSTRUCTS'),
(3486, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 3524, '', 'Oculus CONSTRUCTS_COUNT');

-- ICC
SET @MAP := 631;
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = @MAP;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(4903, 4, @MAP, @FLAG_INITIAL_STATE, 0, 0, '', 'Quest 24874/24879 active'),
(4904, 4, @MAP, @FLAG_INITIAL_STATE, 0, 4903, '', 'Quest 24874/24879 remining time');

-- Culling of stratholme
SET @MAP := 595;
DELETE FROM `worldstate_template` WHERE `type` = 4 AND `condition` = @MAP;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(3479, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'COS Crates'),
(3480, 4, @MAP, @FLAG_INITIAL_ACTIVE, 0, 3479, '', 'COS Crates count');

-- Zones
-- Ebon hold
-- SET @MAP := 609;
SET @_ZONE := 4298;
DELETE FROM `worldstate_template` WHERE `type` = 5 AND `condition` = @_ZONE;
INSERT INTO `worldstate_template` (`state_id`, `type`, `condition`, `flags`, `default`, `linked_id`, `ScriptName`, `comment`) VALUES
(3592, 5, @_ZONE, @FLAG_INITIAL_ACTIVE, 0, 3605, '', 'Remains'),
(3603, 5, @_ZONE, @FLAG_INITIAL_ACTIVE, 0, 3603, '', 'Countdown'),
(3605, 5, @_ZONE, @FLAG_INITIAL_ACTIVE, 0, 0, '', 'Main WS');

-- Arenas
