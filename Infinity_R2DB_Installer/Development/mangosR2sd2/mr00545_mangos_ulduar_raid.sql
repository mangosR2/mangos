/* ULDUAR from Xfurry*/

-- --------------- --
-- Flame Leviathan --
-- --------------- --
DELETE FROM `creature` WHERE `id` IN(33060, 33062, 33109); -- Loading vehicles by script
UPDATE `creature_template_addon` SET `auras` = '52455' WHERE `entry` IN(33060, 33109, 33062, 34045); -- Prevent vehicles auto regen health
UPDATE `creature_template` SET `modelid_2` = 28783 WHERE `entry` = 33189; -- Liquid Pyrite
UPDATE `creature_template_addon` SET `mount` = 0 WHERE `entry` = 33214; -- Mechanolift 304-A
UPDATE `creature_template` SET `unit_flags` = 0, `minlevel` = 80, `maxlevel` = 80 WHERE `entry` = 33090; -- Pool of Tar

UPDATE `creature_template` SET `ScriptName` = 'boss_flame_leviathan' WHERE `entry` = 33113;
UPDATE `creature` SET `position_x` = 432.09, `position_y` = -13.3, `position_z` = 409.9 WHERE `id` = 33113;
UPDATE `creature_template` SET `ScriptName` = 'npc_brann_bronzebeard' WHERE `entry` = 33579;
UPDATE `creature_template` SET `npcflag` = `npcflag` | 1 WHERE `entry` = 33579;
UPDATE `creature_template` SET `ScriptName` = 'mob_defense_turret' WHERE `entry` = 33142;
UPDATE `creature_template` SET `ScriptName` = 'mob_pool_of_tar' WHERE `entry` = 33090;
UPDATE `creature_template` SET `ScriptName` = 'mob_mechanolift' WHERE `entry` = 33214;
UPDATE `creature_template` SET `ScriptName` = 'mob_freyas_ward' WHERE `entry` = 33367;
UPDATE `creature_template` SET `ScriptName` = 'mob_hodirs_fury' WHERE `entry` = 33212;
UPDATE `creature_template` SET `ScriptName` = 'mob_mimiron_inferno' WHERE `entry` = 33370;
UPDATE `creature_template` SET `ScriptName` = 'mob_thorims_hammer' WHERE `entry` = 33365;
UPDATE `creature_template` SET `ScriptName` = 'mob_lorekeeper' WHERE `entry` = 33686;
UPDATE `creature_template` SET `faction_A` = 1965, `faction_H` = 1965, `unit_flags` = 2|33554432 WHERE `entry` IN (33370, 33365, 33212);
UPDATE `creature_template` SET `movementId` = 0, `vehicle_id` = 0, `unit_flags` = `unit_flags` | 4  WHERE `entry` = 33369;
UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` IN (33366, 33369, 33364, 33108);

DELETE FROM `spell_script_target` WHERE `entry` IN(62906, 62909, 62911, 62533);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(62906, 1, 33367), -- Freya's Ward
(62909, 1, 33370), -- Mimiron's Inferno
(62911, 1, 33365), -- Thorim's Hammer
(62533, 1, 33212); -- Hodir's Fury

DELETE FROM `spell_script_target` WHERE `entry` IN(63295, 63294, 63292);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(63295, 1, 33367), -- Freya Dummy Green - Freya's Ward
(63294, 1, 33212), -- Freya Dummy Blue - Hodir's Fury
(63294, 1, 33365), -- Freya Dummy Blue - Thorim's Hammer
(63292, 1, 33370); -- Freya Dummy Yellow - Mimiron's Inferno

-- ------------------------ --
-- Ignis the Furnace Master --
-- ------------------------ --
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` &~ 33554596, `ScriptName` = 'boss_ignis' WHERE `entry` = 33118;
UPDATE `creature_template` SET `ScriptName` = 'mob_iron_construct' WHERE `entry` = 33121;
UPDATE `creature_template` SET `minlevel` = 80, `maxlevel` = 80, `scale` = 0.5 WHERE `entry` = 33221;

-- ---------- --
-- Razorscale --
-- ---------- --
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` &~ 33554596, `ScriptName` = 'boss_razorscale' WHERE `entry` = 33186;
UPDATE `creature` SET `position_x` = 590.346741, `position_y` = -226.947647, `position_z` = 442.897583 WHERE `id` = 33186;

UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` IN(33287, 33816, 33259, 34257, 34256, 34255); -- Prevent combat with other bosses

DELETE FROM `spell_script_target` WHERE `entry` IN(63524, 63657, 63658, 63659, 62505);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(63524, 1, 33282), -- Harpoon Shot - Razorscale Harpoon Fire State
(63657, 1, 33282), -- Harpoon Shot - Razorscale Harpoon Fire State
(63658, 1, 33282), -- Harpoon Shot - Razorscale Harpoon Fire State
(63659, 1, 33282), -- Harpoon Shot - Razorscale Harpoon Fire State
(62505, 1, 33186); -- Harpoon Shot - Razorscale

UPDATE `gameobject_template` SET `data3` = 180000, `ScriptName` = 'go_repair_harpoon' WHERE `entry` IN (194543, 194542, 194541, 194519);
-- only 2 harpoons for 10 man
UPDATE `gameobject` SET `spawnMask` = 2 WHERE `guid` IN (73595, 73592);
-- mole machines & adds
UPDATE `creature_template` SET `ScriptName` = 'mob_mole_machine' WHERE `entry` = 33245;
UPDATE `creature_template` SET `ScriptName` = 'mob_dark_rune_watcher' WHERE `entry` = 33453;
UPDATE `creature_template` SET `ScriptName` = 'mob_dark_rune_sentinel' WHERE `entry` = 33846;
UPDATE `creature_template` SET `ScriptName` = 'mob_dark_rune_guardian' WHERE `entry` = 33388;
UPDATE `creature_template` SET `ScriptName` = 'npc_expedition_commander' WHERE `entry` = 33210;
UPDATE `creature_template` SET `ScriptName` = 'mob_devouring_flame_target' WHERE `entry` = 34188;

-- -------------------- --
-- XT-002 Deconstructor --
-- -------------------- --
UPDATE `creature_template` SET `ScriptName` = 'boss_xt_002' WHERE `entry` = 33293;
UPDATE `creature_template` SET `scriptname` = 'mob_xtheart' WHERE `entry` = 33329;
UPDATE `creature_template` SET `ScriptName` = 'mob_pummeler' WHERE `entry` = 33344;
UPDATE `creature_template` SET `ScriptName` = 'npc_scrapbot' WHERE `entry` = 33343;
UPDATE `creature_template` SET `ScriptName` = 'mob_boombot' WHERE `entry` = 33346;
UPDATE `creature_template` SET `ScriptName` = 'mob_voidzone' WHERE `entry` = 34001;
UPDATE `creature_template` SET `ScriptName` = 'mob_lifespark', `minhealth` = 176400, `maxhealth` = 176400, `faction_A` = 14, `faction_H` = 14 WHERE `entry` = 34004;
DELETE FROM `creature` WHERE `id` = 34004;
UPDATE `creature` SET `spawnMask` = 3 WHERE `id` = 33337; -- XT-Toy Pile

-- ---------------- --
-- Assembly of Iron --
-- ---------------- --
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` &~ 33554432 &~ 128 &~ 32 &~ 4 WHERE `entry` IN(32927, 32867);
UPDATE `creature_template` SET `ScriptName` = 'npc_ulduar_lightning_elemental' WHERE `entry` = 32958;
UPDATE `creature_template` SET `mechanic_immune_mask` =
536870912|67108864|8388608|4194304|2097152|524288|131072|65536|8192|4096|2048|1024|512|256|128|64|32|16|8|2|1
WHERE `entry` IN (32857, 33694); -- 619397115
UPDATE `creature_template` SET `unit_flags` = 33554432 | 2 WHERE `entry` IN (33051, 33705);

-- LOOT FOR THESE THREE SHOUDL BE PROGRESSIVE, MAYBE THIS IS NOT THE RIGHT WAY TO DO IT
-- update loot id:
-- brundir
UPDATE `creature_template` SET `lootid` = 32857 WHERE `entry` = 32857;
UPDATE `creature_template` SET `lootid` = 33694 WHERE `entry` = 33694;
-- molgeim = steelbreaker (I dont know exactly which items are missing from molgeim's loot so i'm leaving it the same for now);
UPDATE `creature_template` SET `lootid` = 32867 WHERE `entry` = 32927;
UPDATE `creature_template` SET `lootid` = 33693 WHERE `entry` = 33692;
-- Rewrite loot for council: this will allow us to use hard mode loot because only the last killed boss will be lootable
-- 10 man version
-- Brundir:
DELETE FROM `creature_loot_template` WHERE `entry` = 32857;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(32857, 45322, 0, 2, 1, 1),
(32857, 45324, 0, 1, 1, 1),
(32857, 45329, 0, 2, 1, 1),
(32857, 45330, 0, 1, 1, 1),
(32857, 45331, 0, 2, 1, 1),
(32857, 45332, 0, 1, 1, 1),
(32857, 45333, 0, 2, 1, 1),
(32857, 45378, 0, 2, 1, 1),
(32857, 45418, 0, 1, 1, 1),
(32857, 45423, 0, 1, 1, 1),
-- emblem 100% drop
(32857, 47241, 100, 0, 1, 1);
-- 25 man version
-- Brundir:
DELETE FROM `creature_loot_template` WHERE `entry` = 33694;
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(33694, 45224, 0, 3, 1, 1),
(33694, 45228, 0, 3, 1, 1),
(33694, 45233, 0, 3, 1, 1),
(33694, 45234, 0, 3, 1, 1),
(33694, 45236, 0, 3, 1, 1),
(33694, 45226, 0, 2, 1, 1),
(33694, 45235, 0, 2, 1, 1),
(33694, 45237, 0, 2, 1, 1),
(33694, 45238, 0, 2, 1, 1),
(33694, 45239, 0, 2, 1, 1),
(33694, 45193, 0, 1, 1, 1),
(33694, 45225, 0, 1, 1, 1),
(33694, 45227, 0, 1, 1, 1),
(33694, 45232, 0, 1, 1, 1),
(33694, 45240, 0, 1, 1, 1),
(33694, 45038, 10, 0, 1, 1),
(33694, 45087, 33, 0, 1, 2),
(33694, 45089, 5, 0, -45089, 1),
-- emblem 100% drop
(33694, 47241, 100, 0, 1, 1);

-- -------- --
-- Kologarn --
-- -------- --
UPDATE `creature_template` SET `mechanic_immune_mask` = 617299803, `ScriptName` = 'boss_kologarn', `unit_flags` = 0 WHERE `entry` = 32930;
UPDATE `creature_template` SET `mechanic_immune_mask` = 652951551, `ScriptName` = 'boss_right_arm' WHERE `entry` = 32934;
UPDATE `creature_template` SET `mechanic_immune_mask` = 652951551, `ScriptName` = 'boss_left_arm' WHERE `entry` = 32933;
UPDATE `creature_template` SET `ScriptName` = 'mob_ulduar_rubble' WHERE `entry` IN (33768, 33809);

DELETE FROM `creature` WHERE id IN (32933, 32934); -- Arms spawn by vehicle
DELETE FROM `creature` WHERE id IN (33632, 33802); -- Triggers spawn by Spell
UPDATE `creature` SET `position_x` = 1797, `position_z` = 449.718 WHERE `id` = 32930; -- Kologarn position
UPDATE `gameobject` SET `position_y` = -35.6824, `position_x` = 1837.59 WHERE `id` = 195047; -- loot box position

DELETE FROM `spell_script_target` WHERE `entry` = 63628;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(63628, 1, 32933), -- Instakill Kologarn Arm - Left Arm
(63628, 1, 32934); -- Instakill Kologarn Arm - Right Arm

UPDATE `creature_model_info` SET `bounding_radius` = 0.31, `combat_reach` = 20 WHERE `modelid` IN (28821, 28822);

UPDATE `creature_template_addon` SET `bytes1` = 7 WHERE `entry` = 34297; -- Dummy death Kologarn
UPDATE `creature` SET `spawnMask` = 3 WHERE `id` = 33661;
UPDATE `spell_script_target` SET `targetentry` = 32930 WHERE `entry` = 63979;


-- Auriaya
UPDATE `creature_template` SET `ScriptName` = 'boss_auriaya', `mechanic_immune_mask` = 583745371, `equipment_id` = 103000 WHERE `entry` = 33515;
UPDATE `creature_template` SET `ScriptName` = 'mob_feral_defender', `mechanic_immune_mask` = 619395071 WHERE `entry` = 34035;
UPDATE `creature_template` SET `ScriptName` = 'mob_seeping_feral_essence', `minlevel` = 80, `maxlevel` = 80, `faction_h` = 14, `faction_a` = 14 WHERE `entry` = 34098;
UPDATE creature_template SET ScriptName = 'mob_sanctum_sentry' WHERE entry = 34014;
UPDATE `creature_template` SET `mechanic_immune_mask` = 619397115 WHERE `entry` IN (33515, 34175);
DELETE FROM creature_equip_template WHERE entry = 103000;
INSERT INTO creature_equip_template values (103000, 45315, 0, 0);
-- 2 more defenders for 25 man
DELETE FROM creature WHERE guid IN (800010, 800011);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(800010, 34014, 603, 2, 65535, 0, 0, 1945.2, 37.2442, 411.356, 3.62107, 7200, 0, 0, 334680, 0, 0, 0),
(800011, 34014, 603, 2, 65535, 0, 0, 1936.11, 49.8233, 411.352, 3.85276, 7200, 0, 0, 334680, 0, 0, 0);
DELETE FROM `creature_movement` WHERE `id`=94378;
INSERT INTO `creature_movement` (`id`,`point`,`position_x`,`position_y`,`position_z`,`waittime`,`textid1`,`textid2`,`textid3`,`textid4`,`textid5`,`emote`,`spell`,`wpguid`,`orientation`,`model1`,`model2`) VALUES
-- UPDATED CREATURE MOVEMENT FOR AURIAYA, SHOULD MOVE AROUND THE CENTER SPIRE
#(94378, 4, 1916.56, -69.9669, 417.718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.2268, 0, 0),	-- after hodir up
#(94378, 3, 1900.26, -24.0211, 417.722, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1.15909, 0, 0),	-- center kolgoran
#(94378, 2, 1916.97, 21.1583, 417.748, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.86988, 0, 0),	-- before yogg up

(94378, 1, 1925.012, 30.0067, 411.356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.69685, 0, 0),	-- before yogg down
(94378, 2, 1957.04, 49.3067, 411.355, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.37071, 0, 0),	-- after yogg down
(94378, 3, 1967.38, 51.4931, 417.561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.09545, 0, 0),	-- after yogg up
(94378, 4, 2013.07, 44.3788, 417.715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.71365, 0, 0), 	-- before mimiron up
(94378, 5, 2021.35, 37.9771, 411.387, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.25205, 0, 0), 	-- before mimiron down
(94378, 6, 2046.36, 8.56725, 411.524, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.203, 0, 0),		-- after mimiron down 
(94378, 7, 2053.32, -7.1366, 421.78, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.85107, 0, 0),		-- before freya up
(94378, 8, 2052.87, -40.8556, 421.706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.4223, 0, 0), 	-- after freya up
(94378, 9, 2045.00, -56.79369, 411.359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.20538, 0, 0),	-- before thorim down
(94378, 10, 2022.18, -86.5468, 411.355, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.60096, 0, 0),	-- after thorim down
(94378, 11, 2012.94, -92.7106, 417.717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.28968, 0, 0),	-- after thorim up
(94378, 12, 1968.83, -101.0946, 417.722, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.662873, 0, 0),-- before hodir up
(94378, 13, 1958.08, -96.7855, 411.864, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.763719, 0, 0),	-- before hodir down
(94378, 14, 1924.12, -78.5404, 411.488, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.210024, 0, 0),	-- after hodir down

(94378, 15, 1958.08, -96.7855, 411.864, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.763719, 0, 0),	-- before hodir down
(94378, 16, 1968.83, -101.0946, 417.722, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2.662873, 0, 0),-- before hodir up
(94378, 17, 2012.94, -92.7106, 417.717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.28968, 0, 0),	-- after thorim up
(94378, 18, 2022.18, -86.5468, 411.355, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3.60096, 0, 0),	-- after thorim down
(94378, 19, 2045.00, -56.79369, 411.359, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.20538, 0, 0),	-- before thorim down
(94378, 20, 2052.87, -40.8556, 421.706, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.4223, 0, 0), 	-- after freya up
(94378, 21, 2053.32, -7.1366, 421.78, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.85107, 0, 0),	-- before freya up
(94378, 22, 2046.36, 8.56725, 411.524, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.203, 0, 0),		-- after mimiron down
(94378, 23, 2021.35, 37.9771, 411.387, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.25205, 0, 0), 	-- before mimiron down
(94378, 24, 2013.07, 44.3788, 417.715, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5.71365, 0, 0), 	-- before mimiron up
(94378, 25, 1967.38, 51.4931, 417.561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.09545, 0, 0),	-- after yogg up
(94378, 26, 1957.04, 49.3067, 411.355, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.37071, 0, 0);	-- after yogg down

-- Freya
UPDATE creature_template SET ScriptName = 'boss_freya' WHERE entry = 32906;
UPDATE creature_template SET ScriptName = 'boss_elder_brightleaf' WHERE entry = 32915;
UPDATE creature_template SET ScriptName = 'boss_elder_ironbranch' WHERE entry = 32913;
UPDATE creature_template SET ScriptName = 'boss_elder_stonebark' WHERE entry = 32914;
UPDATE creature_template SET ScriptName = 'mob_iron_roots' WHERE entry IN (33088, 33168);
UPDATE creature_template SET ScriptName = 'mob_freya_ground' WHERE entry IN (33215, 33228, 33170, 33050, 34129);
UPDATE creature_template SET ScriptName = 'mob_freya_spawned' WHERE entry IN (32916, 32919, 33202, 33203, 32918);
-- some aura fixes, this may be wrong
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(62525, 1, 32906),
(62524, 1, 32906),
(62521, 1, 32906),
(62385, 1, 32906),
(62387, 1, 32906),
(62386, 1, 32906);

-- Added hack for Freya's gift
DELETE FROM `gameobject` WHERE `id` IN (194324, 194325,194326,194327,194328,194329,194330,194331);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(733324, 194324, 603, 1, 65535, 2374.876221, -78.512665, 425.073608, 3.260976, 0, 0, 0.706026, 0.708186, -604800, 100, 1),
(733325, 194325, 603, 1, 65535, 2374.876221, -78.512665, 425.073608, 3.260976, 0, 0, 0.706026, 0.708186, -604800, 100, 1),
(733326, 194326, 603, 1, 65535, 2374.876221, -78.512665, 425.073608, 3.260976, 0, 0, 0.706026, 0.708186, -604800, 100, 1),
(733327, 194327, 603, 1, 65535, 2374.876221, -78.512665, 425.073608, 3.260976, 0, 0, 0.706026, 0.708186, -604800, 100, 1),
(733328, 194328, 603, 2, 65535, 2374.876221, -78.512665, 425.073608, 3.260976, 0, 0, 0.706026, 0.708186, -604800, 100, 1),
(733329, 194329, 603, 2, 65535, 2374.876221, -78.512665, 425.073608, 3.260976, 0, 0, 0.706026, 0.708186, -604800, 100, 1),
(733330, 194330, 603, 2, 65535, 2374.876221, -78.512665, 425.073608, 3.260976, 0, 0, 0.706026, 0.708186, -604800, 100, 1),
(733331, 194331, 603, 2, 65535, 2374.876221, -78.512665, 425.073608, 3.260976, 0, 0, 0.706026, 0.708186, -604800, 100, 1);
-- Delete bugged spell from mobs
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (33430,33732) AND `action1_param1` = 63007;

-- Hodir
UPDATE creature_template SET ScriptName = 'boss_hodir' WHERE entry = 32845;
UPDATE creature_template SET ScriptName = 'mob_toasty_fire' WHERE entry = 33342;
UPDATE creature_template SET ScriptName = 'mob_flashFreeze' WHERE entry IN (32926);
UPDATE `creature_template` SET `modelid_1` = 15880 WHERE `entry` = 33174;
UPDATE `creature_template` SET `modelid_2` = 28470, ScriptName = 'mob_icicle' WHERE `entry` = 33169;
-- flash freeze that will lock the npcs IN iceblock
UPDATE creature_template SET `modelid_1` = 25865, ScriptName = 'mob_npc_flashFreeze' WHERE entry IN (32938);
UPDATE creature SET spawnMask = 3 WHERE id = 32938;
UPDATE creature SET spawnMask = 2 WHERE id IN (32901, 32900, 32950, 32946,33333, 33330, 33326);
UPDATE creature_template SET ScriptName = 'npc_hodir_helper' WHERE entry IN (32897, 33326, 32948, 33330);
UPDATE creature_template SET ScriptName = 'npc_hodir_helper' WHERE entry IN (33325, 32901, 32941, 33333);
UPDATE creature_template SET ScriptName = 'npc_hodir_helper' WHERE entry IN (33328, 32900, 33332, 32950);
UPDATE creature_template SET ScriptName = 'npc_hodir_helper' WHERE entry IN (32893, 33327, 33331, 32946);

-- FIXED SOME POSITIONING FOR THE FRIENDLY NPCS, Besides this the freeze aura should also be fixed.
-- fixed npc positioning and added 4 extra flashfreeze for them.
-- 10 man: 
-- mage
UPDATE creature SET position_x = 2000.9, position_y = -231.232 WHERE guid = 131930;
-- priest
UPDATE creature SET position_x = 2009.06, position_y = -244.058 WHERE guid = 131933;
DELETE FROM creature WHERE guid IN (800005);
INSERT INTO creature VALUES
(800005, 32897, 603, 3, 128,0,0, 2009.06, -244.058, 432.687, 1.68485, 7200,0,0, 5647, 0, 0, 0);		-- aly priest 
-- shaman
UPDATE creature SET position_x = 1983.75, position_y = -243.358 WHERE id = 33328;
UPDATE creature SET position_x = 1983.75, position_y = -243.358 WHERE id = 33332;
-- druid
UPDATE creature SET position_x = 2021.12, position_y = -236.648 WHERE id = 32941;
UPDATE creature SET position_x = 2021.12, position_y = -236.648 WHERE id = 33325;
-- 25 man:
-- druid
UPDATE creature SET position_x = 2013.5, position_y = -240.338 WHERE id = 32901;
DELETE FROM creature WHERE guid IN (800006);
INSERT INTO creature VALUES
(800006, 32938, 603, 2, 1,0,0, 2013.5, -240.338, 432.687, 1.68485, 7200,0,0, 5647, 0, 0, 0);
-- shaman:
UPDATE creature SET position_x = 2011.48, position_y = -232.79 WHERE id = 32900;
UPDATE creature SET position_x = 2011.48, position_y = -232.79 WHERE id = 32950;
DELETE FROM creature WHERE guid IN (800007);
INSERT INTO creature VALUES
(800007, 32938, 603, 2, 1,0,0, 2011.48, -232.79, 432.687, 1.68485, 7200,0,0, 5647, 0, 0, 0);
-- mage:
DELETE FROM creature WHERE guid IN (800008, 800010);
INSERT INTO creature VALUES
(800008, 33327, 603, 2, 128,0,0, 1978.49, -241.476, 432.687, 1.68485, 7200,0,0, 5647, 0, 0, 0), -- aly mage
(800010, 32938, 603, 2, 1,0,0, 1978.49, -241.476, 432.687, 1.68485, 7200,0,0, 5647, 0, 0, 0);
-- priest
UPDATE creature SET position_x = 1997.88, position_y = -239.394 WHERE id = 33330;
DELETE FROM creature WHERE guid IN (800009);
INSERT INTO creature VALUES
(800009, 32938, 603, 2, 1,0,0, 1997.88, -239.394, 432.687, 1.68485, 7200,0,0, 5647, 0, 0, 0);

-- Mimiron
UPDATE `gameobject_template` SET `data0` = '60000' WHERE `entry` =194675;
UPDATE creature_template SET ScriptName = 'boss_mimiron' WHERE entry = 33350;
UPDATE creature_template SET `RegenHealth`= 0, ScriptName = 'boss_leviathan_mk' WHERE entry = 33432;
UPDATE creature_template SET ScriptName = 'leviathan_turret' WHERE entry = 34071;
UPDATE creature_template SET ScriptName = 'mob_mimiron_flames' WHERE entry IN (34363, 34121);
UPDATE creature_template SET `RegenHealth`= 0, ScriptName = 'boss_vx001' WHERE entry = 33651;
UPDATE creature_template SET `RegenHealth`= 0, ScriptName = 'boss_aerial_command_unit' WHERE entry = 33670;
UPDATE creature SET position_x = 2784.35, position_y = 2578.03, orientation = 3.2 WHERE id = 33350;
UPDATE creature SET position_x = 2794.86, position_y = 2597.83, orientation = 3.57, spawnMask = 3 WHERE id = 33432;
UPDATE gameobject_template SET flags = 6553632, data2 = 2000, ScriptName='go_red_button' WHERE entry = 194739;
UPDATE creature_template SET ScriptName = 'mob_proximity_mine' WHERE entry = 34362;
UPDATE creature_template SET ScriptName = 'mob_bomb_bot' WHERE entry IN (33836, 34192);
UPDATE creature_template SET `faction_A` = 14, `faction_H` = 14, `minlevel` = 80, `maxlevel` = 80, ScriptName = 'mob_emergency_bot' WHERE entry = 34147;
UPDATE creature_template SET ScriptName = 'mob_frost_bomb_ulduar' WHERE entry = 34149;
UPDATE creature_template SET ScriptName = 'mob_mimiron_inferno' WHERE entry = 33370;
UPDATE creature_template SET ScriptName = 'mob_assault_bot' WHERE entry = 34057; -- Script or EventAI ??
UPDATE creature_template SET ScriptName = 'mob_magnetic_core' WHERE entry = 34068;
UPDATE `gameobject` SET `position_x` = 2734.73 WHERE `id` IN (194789, 194956);
-- spells, may not be correct
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(64444, 1, 33670),
(63414, 1, 33651),
(65101, 1, 33350);

-- SOME MIMIRON LOOT BOXES ARE MISSING IN YTDB, THIS IS THE FIX FOR IT!
-- mimiron loot fix:
-- INSERT two new boxes
DELETE FROM `gameobject` WHERE `id` IN (194957, 194958);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(110004, 194957, 603, 1, 65535, 2734.73, 2568.98, 364.314, 0.0139475, 0, 0, 0.00697369, 0.999976, -604800, 100, 1);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(110005, 194958, 603, 2, 65535, 2734.73, 2568.98, 364.314, 0.0139475, 0, 0, 0.00697369, 0.999976, -604800, 100, 1);
-- 10 man hard:
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194957);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(194957, 45089, 5, 0, -45089, 1),
(194957, 45095, 2.0408, 0, 1, 1),
(194957, 45649, 100, 0, -45649, 1),
(194957, 45663, 0.4028, 0, 1, 1),
(194957, 45787, -100, 0, 1, 1),
(194957, 47241, 100, 0, 1, 1),
(194957, 45972, 0, 1, 1, 1),
(194957, 45973, 0, 1, 1, 1),
(194957, 45974, 0, 1, 1, 1),
(194957, 45975, 0, 1, 1, 1),
(194957, 45976, 0, 1, 1, 1),
(194957, 45982, 0, 2, 1, 1),
(194957, 45988, 0, 2, 1, 1),
(194957, 45989, 0, 2, 1, 1),
(194957, 45990, 0, 2, 1, 1),
(194957, 45993, 0, 2, 1, 1);
-- 25 man hard:
DELETE FROM `gameobject_loot_template` WHERE (`entry`=194958);
INSERT INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES 
(194958, 45038, 10, 0, 1, 1),
(194958, 45087, 33, 0, 1, 1),
(194958, 45089, 5, 0, -45089, 1),
(194958, 45643, 100, 0, -45643, 1),
(194958, 45816, -100, 0, 1, 1),
(194958, 47241, 100, 0, 1, 1),
(194958, 45489, 0, 1, 1, 1),
(194958, 45490, 0, 1, 1, 1),
(194958, 45491, 0, 1, 1, 1),
(194958, 45492, 0, 1, 1, 1),
(194958, 45493, 0, 1, 1, 1),
(194958, 45494, 0, 2, 1, 1),
(194958, 45495, 0, 2, 1, 1),
(194958, 45496, 0, 2, 1, 1),
(194958, 45497, 0, 2, 1, 1),
(194958, 45663, 0, 2, 1, 1);

-- Thorim
UPDATE creature_template SET ScriptName = 'boss_thorim' WHERE entry = 32865;
UPDATE creature_template SET ScriptName = 'boss_runic_colossus' WHERE entry = 32872;
UPDATE creature_template SET ScriptName = 'boss_ancient_rune_giant' WHERE entry = 32873;
UPDATE creature_template SET ScriptName = 'npc_lightning_orb' WHERE entry = 33138;
UPDATE creature_template SET ScriptName = 'mob_thorim_trap_bunny' WHERE entry IN (33725, 33054);
UPDATE creature_template SET ScriptName = 'mob_thorim_preadds' WHERE entry IN (32885, 32883, 32907, 32908, 32882);
UPDATE creature SET spawnMask = 3 WHERE id = 32873;
UPDATE creature_template SET ScriptName = 'npc_sif' WHERE entry = 33196;
UPDATE `gameobject` SET `position_y` = -286.67, `position_z` = 419.50 WHERE `id` IN (194312, 194313, 194314, 194315);
UPDATE gameobject_template SET flags = 6553632, ScriptName='go_thorim_lever' WHERE entry = 194264;
-- adds
UPDATE creature_template SET ScriptName = 'mob_dark_rune_acolyte' WHERE entry = 33110;
UPDATE creature_template SET ScriptName = 'mob_dark_rune_champion' WHERE entry = 32876;
UPDATE creature_template SET ScriptName = 'mob_dark_rune_commoner' WHERE entry = 32904;
UPDATE creature_template SET ScriptName = 'mob_dark_rune_warbringer' WHERE entry = 32877;
UPDATE creature_template SET ScriptName = 'mob_dark_rune_ring_guard' WHERE entry = 32874;
UPDATE creature_template SET ScriptName = 'mob_dark_rune_honor_guard' WHERE entry = 33125;

#DELETE FROM gameobject WHERE id = 194264; 
#INSERT INTO gameobject VALUES (110010,194264,603,3,65535,2173.276, -252.805, 420.146, 3.027,0,0,0,0,604800,0,1);
UPDATE `creature` SET `phaseMask` = 128 WHERE `id` IN (32907, 32883); 	-- horde soldiers: phase 128 for aly: 65535
UPDATE `creature` SET `phaseMask` = 64 WHERE `id` IN (32885, 32908);	-- alliance soldiers: phase 64 for horde
-- reset pos to some creatures 
-- SOME POSITION ADJUSTMENTS, CHECK YOUR DB FOR THIS
/*
UPDATE creature SET spawnMask = 0 WHERE guid IN (129413, 129412, 129856, 129857);
UPDATE `creature` SET `position_x` = 2222.69 WHERE `guid` = 129413;
UPDATE `creature` SET `position_x` = 2222.69 WHERE `guid` = 129412;
UPDATE `creature` SET `position_x` = 2227.34 WHERE `guid` = 129856;
UPDATE `creature` SET `position_x` = 2227.34 WHERE `guid` = 129857;

UPDATE `creature` SET `position_y` = -437.73 WHERE `guid` = 129860;
UPDATE `creature` SET `position_y` = -437.73 WHERE `guid` = 129861;
UPDATE `creature` SET `position_y` = -434.64 WHERE `guid` = 129862;
UPDATE `creature` SET `position_y` = -434.64 WHERE `guid` = 129863;
UPDATE `creature` SET `position_y` = -434.64 WHERE `guid` = 129391;
*/
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('62565', '1', '32865');

-- Vezax
UPDATE creature_template SET unit_flags = 0, ScriptName = 'boss_general_vezax' WHERE entry = 33271;
UPDATE creature_template SET MinHealth = 23009250, MaxHealth = 23009250 WHERE entry = 33449;
UPDATE `creature_template` SET `mechanic_immune_mask` = 619397115 WHERE `entry` IN (33271, 33449);
UPDATE creature_template SET ScriptName = 'mob_saronite_animus' WHERE entry = 33524;
UPDATE creature_template SET ScriptName = 'event_spell_saronite_barrier', movementType = 1  WHERE entry = 33488;

-- Yogg
UPDATE creature_template SET ScriptName = 'boss_yogg_saron' WHERE entry = 33288;
UPDATE creature_template SET `RegenHealth`= 0, `flags_extra` = 1,`type_flags` = 108, ScriptName = 'boss_sara' WHERE entry = 33134;
UPDATE creature SET spawnMask = 3, MovementType = 0 WHERE id = 33134;
UPDATE creature_template SET `RegenHealth`= 0, ScriptName = 'boss_brain_of_yogg_saron' WHERE entry = 33890;
UPDATE creature SET `spawntimesecs` = 604800 WHERE `id` = 33134;
UPDATE creature_template SET ScriptName = 'mob_corruptor_tentacle' WHERE entry = 33985;
UPDATE creature_template SET ScriptName = 'mob_constrictor_tentacle' WHERE entry = 33983;
UPDATE creature_template SET MinHealth = 40000, MaxHealth = 40000, minLevel = 80, maxLevel = 80, ScriptName = 'mob_vision_tentacle' WHERE entry = 33943;
UPDATE creature_template SET MinHealth = 400000, MaxHealth = 400000, ScriptName = 'mob_crusher_tentacle' WHERE entry = 33966;
UPDATE creature_template SET MinHealth = 220000, MaxHealth = 220000, ScriptName = 'mob_guardian_of_yogg_saron' WHERE entry = 33136;
UPDATE creature_template SET ScriptName = 'mob_immortal_guardian' WHERE entry = 33988;
UPDATE creature_template SET `faction_A` = 14, `faction_H` = 14, ScriptName = 'mob_death_orb' WHERE entry = 33882;
UPDATE creature_template SET ScriptName = 'mob_sanity_well' WHERE entry = 33991;
UPDATE creature_template SET scriptname='mob_madness_portal' WHERE `entry`=34072;
UPDATE creature_template SET scriptname='mob_laughing_skull' WHERE `entry`=33990;
UPDATE creature_template SET scriptname='mob_ominous_cloud' WHERE `entry`=33292;
UPDATE creature SET spawnMask = 3 WHERE id = 33292;
-- spells
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('63886', '1', '33882');
-- Keepers
UPDATE creature_template SET ScriptName = 'keeper_hodir' WHERE entry = 33213;
UPDATE creature_template SET ScriptName = 'keeper_freya' WHERE entry = 33241;
UPDATE creature_template SET ScriptName = 'keeper_thorim' WHERE entry = 33242;
UPDATE creature_template SET ScriptName = 'keeper_mimiron' WHERE entry = 33244;
-- INSERT doors & yoggs brain INTO the brain room
DELETE FROM gameobject WHERE id IN (194635);
INSERT INTO gameobject VALUES (110000,194635,603,3,65535,2022.490,-25.389,261.961,0,0,0,0,0,604800,0,1);
DELETE FROM gameobject WHERE guid = 110001;
INSERT INTO gameobject VALUES (110001,194462,603,3,65535,2104.555, -25.635,242.646,0,0,0,0,0,604800,100,1);
DELETE FROM creature WHERE id IN (33890);
INSERT INTO creature VALUES (800000,33890,603,3,65535,0,0,1981.422,-22.442,255.011,0,604800,0,0,1371428,0,0,0);

-- Algalon
UPDATE creature_template SET ScriptName = 'boss_algalon' WHERE entry = 32871;
UPDATE creature_template SET ScriptName = 'mob_collapsing_star' WHERE entry = 32955;
UPDATE creature_template SET ScriptName = 'mob_living_constellation' WHERE entry = 33052;
UPDATE creature_template SET ScriptName = 'mob_black_hole' WHERE entry = 32953;
UPDATE creature_template SET ScriptName = 'mob_cosmic_smash_target' WHERE entry IN (33105, 33104);
UPDATE creature_template SET minhealth = 39099, maxhealth = 39099 WHERE entry = 33089;
UPDATE gameobject_template SET flags= 6553632, ScriptName='go_celestial_acces' WHERE entry IN (194628, 194752);

-- Teleporter
UPDATE `gameobject_template` SET `flags` = 0, `ScriptName` = 'go_ulduar_teleporter' WHERE `entry`  IN (194569);

-- Keepers
-- Keepers images
UPDATE creature_template SET `npcflag` = 1, `unit_flags` = 2, ScriptName = 'hodir_image' WHERE entry = 33411;
UPDATE creature_template SET `npcflag` = 1, `unit_flags` = 2, ScriptName = 'freya_image' WHERE entry = 33410;
UPDATE creature_template SET `npcflag` = 1, `unit_flags` = 2, ScriptName = 'thorim_image' WHERE entry = 33413;
UPDATE creature_template SET `npcflag` = 1, `unit_flags` = 2, ScriptName = 'mimiron_image' WHERE entry = 33412;
-- INSERT keepers imagees INTO the db
DELETE FROM creature WHERE guid IN (800001, 800002, 800003, 800004);
INSERT INTO creature VALUES
(800001, 33410, 603, 3, 65535,0,0, 2036.892, 25.621, 411.358, 3.83, 604800,0,0, 5647, 0, 0, 0),		-- Freya 
(800002, 33412, 603, 3, 65535,0,0, 1939.215, 42.677, 411.355, 5.31, 604800,0,0, 5647, 0, 0, 0),		-- Mimiron
(800003, 33411, 603, 3, 65535,0,0, 1939.195, -90.662, 411.357, 1.06, 604800,0,0, 5647, 0, 0, 0), 	-- Hodir
(800004, 33413, 603, 3, 65535,0,0, 2036.674, -73.814, 411.355, 2.51, 604800,0,0, 5647, 0, 0, 0); 	-- Thorim

-- Doors 
UPDATE gameobject_template SET faction = 114 WHERE entry IN (194553, 194554, 194556, 194148, 194634, 194635, 194905, 194441,
194442, 194416, 194774, 194775, 194776, 194560, 194557, 194558, 194750, 194910, 194559, 194635, 194636, 194637, 194631, 194255, 194630, 194767);
UPDATE gameobject_template SET faction = 114, `flags` = 4 WHERE entry IN (192075, 194173); -- snowdrifts
-- consoles
UPDATE gameobject_template SET faction = 0 WHERE entry IN (194555, 194628);

-- loot chests
UPDATE gameobject_template SET faction = 0, data15 = 1 WHERE entry IN (195046, 195047, 194307, 194308, 194200, 194201, 194312, 194313, 194314, 194315, 194821,
194822, 194823, 194324, 194325, 194326, 194327, 194328, 194329, 194330, 194331, 194789, 194956, 194957, 194958);
UPDATE gameobject SET spawntimesecs = -604800 WHERE id IN (195046, 195047, 194307, 194308, 194200, 194201, 194312, 194313, 194314, 194315, 194821,
194822, 194823, 194324, 194325, 194326, 194327, 194328, 194329, 194330, 194331, 194789, 194956);

-- NOT SURE IF THE TRASH MOBS ARE SCRIPTED BY EVENTAI
-- Mobs
UPDATE `creature_template` SET `ScriptName` = 'generic_creature' WHERE `entry` IN (34086, 34085, 34069, 33237, 34234, 33236, 33264, 34164, 34196, 34199, 34198, 
34190, 34197, 33699, 34134, 34135, 34133, 33430, 33528, 33431, 33527, 33526, 33525, 33355, 33354, 34193, 34183, 33110, 
32878, 33822, 33818, 33824, 33823, 33772, 33838, 33819, 33820, 32875, 33346, 34057) AND `ScriptName` = '' AND `AIName` = '';

-- some fixes (thx to mns and Reamer)
UPDATE `creature_template` SET `ScriptName` = 'mob_eyebeam_trigger' where `entry` in (33802,33632);
UPDATE `creature_template` SET `ScriptName` = 'mob_kologarn_pit_kill_bunny' where `entry` in (33742);
