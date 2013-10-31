/*
* Ebon Hold (DK Starting Area) - 2013 - 
*/

-- -------------------------------
-- Quest Into the Realm of Shadows
-- -------------------------------

-- Remove sd2 name setting from deathcharger
UPDATE `creature_template` SET `ScriptName` = '' WHERE `entry` = 28782;

-- Creature Template Stuff
UPDATE `creature_template` SET `unit_flags` = 0 WHERE `entry` = 28782;
UPDATE `creature_template` SET `faction_A` = 2082, `faction_H` = 2082 WHERE `entry` = 28782;

DELETE FROM `creature_spell` WHERE `guid` IN (28782);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`) VALUES
(28782, 52362, 0);
DELETE FROM `vehicle_accessory` WHERE  `vehicle_entry`=28782 AND `seat`=0;
DELETE FROM `creature_template_addon` WHERE (`entry`=28768);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES (28768, 25445, 0, 0, 0, 0, 0, '');

UPDATE `npc_spellclick_spells` SET `cast_flags`=1 WHERE  `npc_entry`=28782;

-- Dark Rider ACID
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=28768);
INSERT INTO `creature_ai_scripts` VALUES 
( 2876803, 28768, 0, 0, 100, 1, 3000, 7000, 6000, 9000, 11, 50688, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Rider of Acherus - Cast Plague Strike'),
( 2876806, 28768, 6, 0, 100, 0, 0, 0, 0, 0, 11, 52361, 6, 16, 11, 52357, 6, 16, 0, 0, 0, 0, 'Dark Rider of Acherus - Spawn Deathcharger of Acherus and Set Quest Event Complete and Dismount on Death'),
( 2876801, 28768, 4, 0, 100, 0, 0, 0, 0, 0, 1, -780, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Rider of Acherus - Yell on Aggro'),
( 2876804, 28768, 0, 0, 100, 1, 6000, 10000, 6000, 9000, 11, 52374, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Rider of Acherus - Cast Blood Strike'),
( 2876802, 28768, 0, 0, 100, 1, 0, 1500, 6000, 9000, 11, 52372, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Rider of Acherus - Cast Icy Touch'),
(2876805, 28768, 9, 0, 100, 1, 5, 30, 2000, 2000, 11, 52356, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Dark Rider of Acherus - Cast Throw');

-- update quest template a little bit here
UPDATE `quest_template` SET `SrcSpell` = 52359, `ReqCreatureOrGOId1` = 28768, `ReqCreatureOrGOCount1` = 1, `ReqSpellCast1` = 0 WHERE `entry` = 12687;
INSERT IGNORE INTO creature_involvedrelation (id, quest) VALUES (28788, 12687);
UPDATE creature_template SET npcflag = 2 WHERE entry = 28788;


-- Delete Spawns of DeathChargers ( the deathchrgers guids match the new dark rider spawns in clean YTDB so no conflict)
DELETE FROM `creature` WHERE id = 28782;
DELETE FROM `creature_template_addon` WHERE entry = 28782;
-- Spawn Dark Riders of archerus
DELETE FROM `creature` WHERE `id`=28768;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
(89574, 28768, 609, 1, 32, 0, 0, 2327.46, -5860.18, 100.94, 2.53, 300, 30, 0, 7842, 0, 0, 1),
(89575, 28768, 609, 1, 32, 0, 0, 2281.5, -5847.78, 100.93, 2.19, 300, 30, 0, 7842, 0, 0, 1),
(89576, 28768, 609, 1, 32, 0, 0, 2252.86, -5880.67, 101.14, 4.24, 300, 30, 0, 7842, 0, 0, 1),
(89577, 28768, 609, 1, 32, 0, 0, 2206.94, -5919.25, 101.13, 2.83, 300, 30, 0, 7842, 0, 0, 1),
(89578, 28768, 609, 1, 32, 0, 0, 2162.25, -5895.19, 101.3, 2.59, 300, 30, 0, 7842, 0, 0, 1),
(89579, 28768, 609, 1, 32, 0, 0, 2146.42, -5837.14, 101.31, 2.48, 300, 30, 0, 7842, 0, 0, 1),
(89580, 28768, 609, 1, 32, 0, 0, 2161.78, -5793.11, 100.85, 0.74, 300, 30, 0, 7842, 0, 0, 1),
(89581, 28768, 609, 1, 32, 0, 0, 2195.46, -5763.84, 101.51, 5.76, 300, 30, 0, 7842, 0, 0, 1),
(89582, 28768, 609, 1, 32, 0, 0, 2239.68, -5788.27, 101.11, 2.2, 300, 30, 0, 7842, 0, 0, 1),
(89583, 28768, 609, 1, 32, 0, 0, 2117.98, -5754.23, 98.71, 2.72, 300, 30, 0, 7842, 0, 0, 1),
(89584, 28768, 609, 1, 32, 0, 0, 2086.45, -5786.83, 100.97, 4.86, 300, 30, 0, 7842, 0, 0, 1),
(89585, 28768, 609, 1, 32, 0, 0, 2081.43, -5837.9, 103.69, 5.11, 300, 30, 0, 7842, 0, 0, 1),
(89586, 28768, 609, 1, 32, 0, 0, 2276.81, -6109.68, 5.43, 5.43, 300, 30, 0, 7842, 0, 0, 1),
(89587, 28768, 609, 1, 32, 0, 0, 2246.27, -6139.44, 2.67, 3.85, 300, 30, 0, 7842, 0, 0, 1),
(89588, 28768, 609, 1, 32, 0, 0, 2205.61, -6127.75, 5.03, 2.2, 300, 30, 0, 7842, 0, 0, 1),
(89589, 28768, 609, 1, 32, 0, 0, 2213.68, -6079.06, 4.13, 2, 300, 30, 0, 7842, 0, 0, 1),
(89590, 28768, 609, 1, 32, 0, 0, 2163.42, -6072.82, 5.54, 3.79, 300, 30, 0, 7842, 0, 0, 1),
(89591, 28768, 609, 1, 32, 0, 0, 2141.65, -6110.49, 3.8, 3.99, 300, 30, 0, 7842, 0, 0, 1),
(89592, 28768, 609, 1, 32, 0, 0, 2107.47, -6127.09, 6.81, 3.03, 300, 30, 0, 7842, 0, 0, 1),
(89593, 28768, 609, 1, 32, 0, 0, 2113.17, -6067.31, 5.02, 2.32, 300, 30, 0, 7842, 0, 0, 1),
(89594, 28768, 609, 1, 32, 0, 0, 1908.47, -5960.74, 100.98, 2.75, 300, 30, 0, 7842, 0, 0, 1),
(89595, 28768, 609, 1, 32, 0, 0, 1938.95, -5922.41, 102.39, 1.1, 300, 30, 0, 7842, 0, 0, 1),
(89596, 28768, 609, 1, 32, 0, 0, 2000.87, -5908.94, 104.13, 0.05, 300, 30, 0, 7842, 0, 0, 1),
(89597, 28768, 609, 1, 32, 0, 0, 2000.42, -5856.61, 100.74, 2.25, 300, 30, 0, 7842, 0, 0, 1),
(89598, 28768, 609, 1, 32, 0, 0, 2014.37, -5809.11, 100.54, 1.81, 300, 30, 0, 7842, 0, 0, 1),
(89599, 28768, 609, 1, 32, 0, 0, 1959.71, -5810.86, 101.15, 2.63, 300, 30, 0, 7842, 0, 0, 1),
(89600, 28768, 609, 1, 32, 0, 0, 1967.38, -5753.68, 100.91, 2.62, 300, 30, 0, 7842, 0, 0, 1),
(89601, 28768, 609, 1, 32, 0, 0, 1870.54, -5859.3, 103.07, 3.92, 300, 30, 0, 7842, 0, 0, 1),
(89602, 28768, 609, 1, 32, 0, 0, 1868.75, -5913.9, 104.14, 3.33, 300, 30, 0, 7842, 0, 0, 1),
(89603, 28768, 609, 1, 32, 0, 0, 1813.23, -5932.86, 114.77, 3.34, 300, 30, 0, 7842, 0, 0, 1),
(89604, 28768, 609, 1, 32, 0, 0, 1767.03, -5921.69, 116.12, 2.91, 300, 30, 0, 7842, 0, 0, 1),
(89605, 28768, 609, 1, 32, 0, 0, 1716.41, -5927.23, 118.89, 3.57, 300, 30, 0, 7842, 0, 0, 1),
(89606, 28768, 609, 1, 32, 0, 0, 1697.58, -5887.86, 116.15, 1.9, 300, 30, 0, 7842, 0, 0, 1),
(89607, 28768, 609, 1, 32, 0, 0, 1677.37, -5835.38, 116.15, 2.43, 300, 30, 0, 7842, 0, 0, 1),
(89608, 28768, 609, 1, 32, 0, 0, 1683.29, -5783.39, 115.26, 1.59, 300, 30, 0, 7842, 0, 0, 1),
(89609, 28768, 609, 1, 32, 0, 0, 1729.95, -5744.53, 111.44, 0.46, 300, 30, 0, 7842, 0, 0, 1),
(89610, 28768, 609, 1, 32, 0, 0, 1566.04, -5796.96, 119.53, 3.42, 300, 30, 0, 7842, 0, 0, 1),
(89611, 28768, 609, 1, 32, 0, 0, 1619.05, -5881.41, 115.71, 6.11, 300, 30, 0, 7842, 0, 0, 1),
(97735, 28768, 609, 1, 32, 0, 0, 2058.19, -5744.74, 98.55, 0.4, 300, 30, 0, 7842, 0, 0, 1);

-- --------------------------------------------------------------------
-- Quest Fix Noth Special Brew  (dk starting area quest fix 12716/12717
-- --------------------------------------------------------------------
UPDATE `quest_template` SET `ExclusiveGroup` = 12716 WHERE `entry` = 12716;

-- ----------------------------------------
-- Quest Death comes From a High Q: 12641 -
-- ----------------------------------------

-- some updates to the eye of archerus
UPDATE `creature_template` SET `minlevel` = 55, `maxlevel` = 55, `unit_flags` = 0, `InhabitType` = 4 WHERE `entry` = 28511;

-- -----------------------------------
-- Quest The Gift That Keeps On Giving
-- -----------------------------------

DELETE FROM `spell_script_target` WHERE entry = 52479;
INSERT INTO `spell_script_target` (entry, type, targetEntry) VALUES
(52479, 1, 28819),
(52479, 1, 28822),
(52479, 1, 28891);

UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 28846;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'mob_scarlet_miner' WHERE `entry` = 28822;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'mob_scarlet_miner' WHERE `entry` = 28819;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'mob_scarlet_miner' WHERE `entry` = 28891;
UPDATE `item_template` SET `ScriptName` = 'mob_scarlet_miner' WHERE `entry` = 39253;
-- INSERT IGNORE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES ('52514', '1', '28845');

DELETE FROM `world_template` WHERE `map` = 609;
INSERT INTO `world_template` VALUES (609, 'world_map_ebon_hold');

-- fix to take Quest Item Away at end of quest
UPDATE `quest_template` SET `ReqItemId1` = 39253, `ReqItemCount1` = 1 WHERE `entry` = 12698;

UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = 28846;
DELETE FROM `creature_ai_scripts` WHERE `creature_id` = 28846;
INSERT INTO `creature_ai_scripts` VALUES
(2884601, 28846, 11, 0, 100, 0, 0, 0, 0, 0, 1, -286100, -286101, -286102, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Ghost - Random say at spawn");
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-286102, -286101, -286100);
INSERT INTO `creature_ai_texts` VALUES
(-286100, "Die, Scourge filth!", NULL, NULL, NULL, NULL, NULL, NULL, NULL,NULL, 0, 0, 0, 0, "Scarlet Ghost SAY1"),
(-286101, "It won't be that easy, friend!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, "Scarlet Ghost SAY2"),
(-286102, "I'll take you with me!", NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, "Scarlet Ghost SAY3");

/* everything they say
Scarlet Ghost says: Die, Scourge filth!
Scarlet Ghost says: I'll take you with me!
Scarlet Ghost says: It won't be that easy, fiend!
Scarlet Ghost says: The grave calls to us all!
Scarlet Ghost says: Vengeance is mine!
Scarlet Ghost says: YOU KILLED ME!
*/

-- -------------------------------------
-- -- Massacre at Light's point quest 12701
-- -------------------------------------

UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_scarlet_miner' WHERE `entry` = 28841;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_mine_car' WHERE `entry` = 28817;
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_scourge_gryphon' WHERE `entry` = 28864;
UPDATE `gameobject_template` SET `ScriptName` = 'go_inconspicous_mine_car' WHERE `entry` = 190767;
UPDATE `creature_template` SET `mechanic_immune_mask` = 0, `flags_extra` = 0 WHERE `entry` = 28864;

-- fixed dispaly of mine cart
UPDATE `creature_template` SET `modelid_2` = 25703 WHERE `entry` = 28817;

/* Scourge Gryphon */
UPDATE `creature_template` SET `speed_run` = 2 WHERE `entry` = 28864;

DELETE FROM `creature_template_addon` WHERE (`entry`=28864);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES (28864, 0, 0, 0, 0, 0, 0, '61453');

-- UPDATE `creature_template` SET `vehicle_id` = 79 WHERE `entry` IN (28833);
DELETE FROM `creature_spell` WHERE `guid` IN (28833);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(28833, 52435, 0, 0, 0, 0),
(28833, 52576, 1, 0, 0, 0),
(28833, 52588, 4, 0, 0, 0);

DELETE FROM `creature_spell` WHERE `guid` IN (28887);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(28887, 52435, 0, 0, 0, 0),
(28887, 52576, 1, 0, 0, 0),
(28887, 52588, 4, 0, 0, 0);

UPDATE `creature_template` SET `unit_flags` = 4, `mindmg` = 685, `maxdmg` = 715, `armor` = 3232, `attackpower` = 214 WHERE `entry` = 28833;
UPDATE `creature_template` SET `minhealth` = 26140, `maxhealth` = 26140, `minmana` = 0, `maxmana` = 0, `unit_flags` = 4, `minlevel` = 55, `maxlevel` = 55, `mindmg` = 685, `maxdmg` = 715, `armor` = 3232, `attackpower` = 214 WHERE `entry` = 28887;
INSERT IGNORE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(52576, 1, 28834),
(52576, 1, 28886),
(52576, 1, 28850);

-- -----------------------------------------------------
-- Quest how to win friends and how to influence enemies
-- -----------------------------------------------------

-- 28940 scarlet crusader needs to be added W/ its combat abilities
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'npc_crusade_persuaded' WHERE `entry` IN (28939,28610);   
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=28939);
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=28610);

-- EAI Text clean up for quests/sd2
DELETE FROM `creature_ai_texts` WHERE `entry` BETWEEN -565 AND -555;

-- --------------------------------------------------------
-- KEEP ALL OTHER ACTIVE SQL ABOVE THIS LINE

-- Template Fixes for Entire Ebon Hold (DK STARTING AREA) mobs & ECT- 
-- --------------------------------------------------------

-- HP Corrections
-- Scarlet Defenders
UPDATE `creature_template` SET `minhealth` = 26990, `maxhealth` = 26990 WHERE `entry` = 28834;
-- Scarlet Guardian
UPDATE `creature_template` SET `minhealth` = 26140, `maxhealth` = 26140 WHERE `entry` = 28856;
-- Scarlet Commander
UPDATE `creature_template` SET `minhealth` = 5228, `maxhealth` = 5228 WHERE `entry` = 28936;
-- Scarlet Land Cannon
UPDATE `creature_template` SET `minhealth` = 26140, `maxhealth` = 26140 WHERE `entry` = 28850;
-- Scarlet Balista
UPDATE `creature_template` SET `minhealth` = 167040, `maxhealth` = 167040 WHERE `entry` = 29104;
-- Citizens of New Avalon
UPDATE `creature_template` SET `minhealth` = 1910, `maxhealth` = 1910 WHERE `entry` = 28941;
-- Citizens of Havenshire
UPDATE `creature_template` SET `minhealth` = 2326, `maxhealth` = 2326 WHERE `entry` = 28576;
UPDATE `creature_template` SET `minhealth` = 3302, `maxhealth` = 3302 WHERE `entry` = 28577;
-- Scarlet Peasant 
UPDATE `creature_template` SET `minhealth` = 1848, `maxhealth` = 1848 WHERE `entry` = 28557;
UPDATE `creature_template` SET `minhealth` = 1848, `maxhealth` = 1848 WHERE `entry` = 28892;
-- Scarlet Medic
UPDATE `creature_template` SET `minhealth` = 4906, `maxhealth` = 4906 WHERE `entry` = 28608;
-- Scarlet Infantry
UPDATE `creature_template` SET `minhealth` = 5066, `maxhealth` = 5066 WHERE `entry` = 28609;
UPDATE `creature_template` SET `minhealth` = 5066, `maxhealth` = 5066 WHERE `entry` = 28896;
-- Scarlet Captian
UPDATE `creature_template` SET `minhealth` = 5228, `maxhealth` = 5228 WHERE `entry` = 28611;
UPDATE `creature_template` SET `minhealth` = 5228, `maxhealth` = 5228 WHERE `entry` = 28898;
-- Acherus Geist
UPDATE `creature_template` SET `minhealth` = 4906, `maxhealth` = 4906 WHERE `entry` = 28709;
-- Sky Darkener
UPDATE `creature_template` SET `minhealth` = 5398, `maxhealth` = 5398 WHERE `entry` = 28642;
-- Death Knight init (these are the ones around the DK camp)
UPDATE `creature_template` SET `minhealth` = 6535, `maxhealth` = 6535 WHERE `entry` = 28406;
-- Dark Rider
UPDATE `creature_template` SET `minhealth` = 7842, `maxhealth` = 7842 WHERE `entry` = 28768;
-- scarlet miner -28822
UPDATE `creature_template` SET `minhealth` = 1782, `maxhealth` = 1782 WHERE `entry` = 28822;
-- scarlet miner -28819
UPDATE `creature_template` SET `minhealth` = 1919, `maxhealth` = 1919 WHERE `entry` = 28819;
-- Scarlet Ghost
UPDATE `creature_template` SET `minhealth` = 4430, `maxhealth` = 4430 WHERE `entry` = 28846;
-- Scarlet marksmen
UPDATE `creature_template` SET `minhealth` = 5228, `maxhealth` = 5228 WHERE `entry` = 28610;
-- Scarlet Preacher
UPDATE `creature_template` SET `minhealth` = 4906, `maxhealth` = 4906 WHERE `entry` = 28939;
-- Scarlet crusader
UPDATE `creature_template` SET `minhealth` = 5228, `maxhealth` = 5228 WHERE `entry` = 28940;
-- Scarlet crusader #2
UPDATE `creature_template` SET `minhealth` = 4906, `maxhealth` = 4906 WHERE `entry` = 28529;
-- scarlet Ghoul
UPDATE `creature_template` SET `minhealth` = 1848, `maxhealth` = 1848 WHERE `entry` = 28897;
-- scourge gryphon
UPDATE `creature_template` SET `minhealth` = 9812, `maxhealth` = 9812 WHERE `entry` = 29501;
UPDATE `creature_template` SET `minhealth` = 9812, `maxhealth` = 9812 WHERE `entry` = 29488;
UPDATE `creature_template` SET `minhealth` = 10132, `maxhealth` = 10132 WHERE `entry` = 28906;

-- Fix creature Spawn Table for health adjustments
UPDATE `creature` SET `curhealth` = 1848 WHERE `id` = 28892;
UPDATE `creature` SET `curhealth` = 1848 WHERE `id` = 28557;
UPDATE `creature` SET `curhealth` = 26990 WHERE `id` = 28834;
UPDATE `creature` SET `curhealth` = 26140 WHERE `id` = 28856;
UPDATE `creature` SET `curhealth` = 5228 WHERE `id` = 28936;
UPDATE `creature` SET `curhealth` = 26140 WHERE `id` = 28850;
UPDATE `creature` SET `curhealth` = 167040 WHERE `id` = 29104;
UPDATE `creature` SET `curhealth` = 1910 WHERE `id` = 28941;
UPDATE `creature` SET `curhealth` = 2326 WHERE `id` = 28576;
UPDATE `creature` SET `curhealth` = 3302 WHERE `id` = 28577;
UPDATE `creature` SET `curhealth` = 4906 WHERE `id` = 28608;
UPDATE `creature` SET `curhealth` = 5066 WHERE `id` = 28609;
UPDATE `creature` SET `curhealth` = 5066 WHERE `id` = 28896;
UPDATE `creature` SET `curhealth` = 5228 WHERE `id` = 28611;
UPDATE `creature` SET `curhealth` = 5228 WHERE `id` = 28898;
UPDATE `creature` SET `curhealth` = 4906 WHERE `id` = 28709;
UPDATE `creature` SET `curhealth` = 5398 WHERE `id` = 28642;
UPDATE `creature` SET `curhealth` = 6535 WHERE `id` = 28406;
UPDATE `creature` SET `curhealth` = 7842 WHERE `id` = 28768;
UPDATE `creature` SET `curhealth` = 1782 WHERE `id` = 28822;
UPDATE `creature` SET `curhealth` = 1919 WHERE `id` = 28819;
UPDATE `creature` SET `curhealth` = 5228 WHERE `id` = 28610;
UPDATE `creature` SET `curhealth` = 4906 WHERE `id` = 28939;
UPDATE `creature` SET `curhealth` = 5228 WHERE `id` = 28940;
UPDATE `creature` SET `curhealth` = 4906 WHERE `id` = 28529;
UPDATE `creature` SET `curhealth` = 1848 WHERE `id` = 28897;
UPDATE `creature` SET `curhealth` = 9812 WHERE `id` = 29501;
UPDATE `creature` SET `curhealth` = 9812 WHERE `id` = 29488;
UPDATE `creature` SET `curhealth` = 10132 WHERE `id` = 28906;

-- ROUGH DRAFT NOT FINSIHED YET

-- EventAI scripts name set
-- UPDATE `creature_template` SET `AIName` = "EventAI", `scriptname` = "" WHERE entry IN (28834, 28892, 28856, 28850, 29104, 28941, 28942, 28577, 28576, 28557);

/*-- script_texts
DELETE FROM `creature_ai_texts` WHERE `entry` BETWEEN -286099 AND -286092;
INSERT INTO `creature_ai_texts` VALUES
(-286099, "You don't have to do this! Nobody has to die!", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Peasant - Say Fear01"),
(-286098, "Let me live! I'll do whatever you say!", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Peasant - Say Fear02"),
(-286097, "Ugh... I... I think I pooped...", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Peasant - Say Fear03"),
(-286096, "I picked the wrong day to quit drinkin'!", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Peasant - Say Fear04"),
(-286095, "Don't kill me! I only took this job for benefits!", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Peasant - Say Fear05"),
(-286094, "Have mercy, sir!", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Citizen of Heavenshire - Say Aggro1"),
(-286093, "You may take my life, but you won't take my freedom!", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Citizen of Heavenshire - Say Enrage1"),
(-286092, "DIE!", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Citizen of Heavenshire - Say Enrage2");

-- EVENTAI scripts
DELETE FROM `creature_ai_scripts` WHERE `creature_id` IN (28834, 28856, 28936, 28850, 29104, 28941, 28942, 28577, 28576, 28557, 28892);
INSERT INTO `creature_ai_scripts` VALUES

-- Scarlet Defender
(2883401, 28834, 0, 0, 100, 1, 0, 0, 3000, 3000, 11, 52566, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Defender - Cast Shoot"),
-- Scarlet Guardian
(2885601, 28856, 4, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 0, "Scarlet Guardian - Stop moving and set Phase 2 on aggro"),
(2885602, 28856, 9, 1, 100, 0, 10, 150, 0, 0, 21, 0, 0, 0, 22, 2, 0, 0, 0, 0, 0, 0, "Scarlet Guardian - Stop moving and set Phase 2 at 10yd range"),
(2885603, 28856, 0, 1, 100, 1, 3000, 3000, 3000, 3000, 11, 25710, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Guardian - Cast Heroic Strike(Phase 1)"),
(2885604, 28856, 0, 2, 100, 1, 0, 0, 3000, 3000, 11, 52566, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Guardian - Cast Shoot(Phase 2)"),
(2885605, 28856, 9, 2, 100, 0, 0, 10, 0, 0, 21, 1, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, "Scarlet Guardian - Set Phase 1 at less then 10yd (Phase 2)"),
(2885606, 28856, 9, 0, 100, 0, 150, 300, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Guardian - Evade 150yd"),
-- Scarlet Land Cannon
(2885001, 28850, 0, 0, 100, 1, 0, 0, 3000, 3000, 11, 52539, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Cannon - Cast Cannonball"),
(2885002, 28850, 9, 0, 100, 0, 150, 300, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Cannon - Evade 150yd"),
-- Scarlet Balista
(2910401, 29104, 0, 0, 100, 1, 0, 0, 3000, 3000, 11, 53117, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Balista - Cast Ballista assault"),
(2910402, 29104, 9, 0, 100, 0, 150, 300, 0, 0, 24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Balista - Evade 150yd"),
-- Citizens of New Avalon -- needs tweaked
(2894101, 28941, 11, 0, 100, 1, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Citizen of New Avalon - Spawn set Phase 1"),
(2894102, 28941, 0, 0, 80, 1, 0, 0, 10000, 10000, 11, 52716, 1, 1, 22, 2, 0, 0, 1, -286094, -286099, -286095, "Citizen of New Avalon - On Aggro: Escape in fear and set Phase 2"),
(2894103, 28941, 0, 0, 20, 1, 0, 0, 10000, 10000, 11, 52262, 1, 1, 22, 2, 0, 0, 1, -286093, -286092, 0, "Citizens of New Avalon - On Aggro: Enrage and set Phase 2"),
(2894201, 28942, 11, 0, 100, 1, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Citizen of New Avalon - Spawn set Phase 1"),
(2894202, 28942, 0, 0, 80, 1, 0, 0, 10000, 10000, 11, 52716, 1, 1, 22, 2, 0, 0, 1, -286094, -286099, -286096, "Citizen of New Avalon - On Aggro: Escape in fear and set Phase 2"),
(2894203, 28942, 0, 0, 20, 1, 0, 0, 10000, 10000, 11, 52262, 1, 1, 22, 2, 0, 0, 1, -286093, -286092, 0, "Citizens of New Avalon - On Aggro: Enrage and set Phase 2"),
-- Citizens of Havenshire -- needs tweaked
(2857601, 28576, 11, 0, 100, 1, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Citizen of New Havenshire - Spawn set Phase 1"),
(2857602, 28576, 4, 0, 80, 0, 0, 0, 0, 0, 11, 52716, 1, 1, 1, -286094, -286099, -286096, 0, 0, 0, 0, "Citizen of Havenshire - On Aggro: Beg for mercy"),
(2857603, 28576, 0, 0, 100, 1, 0, 0, 1000, 1000, 20, 0, 0, 0, 21, 0, 0, 0, 5, 20, 0, 0, "Citizen of Havenshire - Cower (Phase 3)"),
(2857604, 28576, 4, 0, 20, 0, 0, 0, 0, 0, 11, 52262, 1, 1, 1, -286093, -286092, 0, 0, 0, 0, 0, "Citizens of Havenshire - On Aggro: Enrage"),
(2857605, 28576, 7, 0, 100, 0, 0, 0, 0, 0, 5, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, "Citizens of Havenshire - Reset State"),

(2857701, 28577, 11, 0, 100, 1, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Citizen of Havenshire - Spawn set Phase 1"),
(2857702, 28577, 4, 0, 80, 0, 0, 0, 0, 0, 11, 52716, 1, 1, 1, -286094, -286099, -286095, 22, 3, 0, 0, "Citizen of Havenshire - On Aggro: Beg for mercy"),
(2857703, 28577, 0, 0, 100, 1, 0, 0, 1000, 1000, 20, 0, 0, 0, 5, 431, 0, 0, 21, 0, 0, 0, "Citizen of Havenshire - Cower (Phase 3)"),
(2857704, 28577, 4, 0, 20, 0, 0, 0, 0, 0, 11, 52262, 1, 1, 1, -286093, -286092, 0, 0, 0, 0, 0, "Citizens of Havenshire - On Aggro: Enrage"),
(2857705, 28577, 7, 0, 100, 0, 0, 0, 0, 0, 5, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, "Citizens of Havenshire - Reset State"),
-- Scarlet Peasant -- needs tweaked
(2855701, 28557, 11, 0, 100, 1, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Peasant - Spawn set Phase 1"),
(2855702, 28557, 4, 1, 80, 0, 0, 0, 0, 0, 11, 52716, 1, 1, 1, -286099, -286098, -286097, 22, 2, 0, 0, "Scarlet Peasant - On Aggro: Beg for mercy"),
(2855703, 28557, 0, 0, 100, 1, 0, 0, 1000, 1000, 20, 0, 0, 0, 5, 20, 0, 0, 21, 0, 0, 0, "Scarlet Peasant - Cower (Phase 2)"),
(2855704, 28557, 7, 0, 100, 0, 0, 0, 0, 0, 5, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, "Scarlet Peasant - Reset State"),
(2889201, 28892, 11, 0, 100, 1, 0, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, "Scarlet Peasant - Spawn set Phase 1"),
(2889202, 28892, 4, 1, 80, 0, 0, 0, 0, 0, 11, 52716, 1, 1, 1, -286099, -286098, -286097, 22, 2, 0, 0, "Scarlet Peasant - On Aggro: Beg for mercy"),
(2889203, 28892, 0, 0, 100, 1, 0, 0, 1000, 1000, 20, 0, 0, 0, 5, 20, 0, 0, 21, 0, 0, 0, "Scarlet Peasant - Cower (Phase 2)"),
(2889204, 28892, 7, 0, 100, 0, 0, 0, 0, 0, 5, 0, 0, 0, 22, 1, 0, 0, 0, 0, 0, 0, "Scarlet Peasant - Reset State");

-- end of EventAI
-- -----------------------------------------------------------------------------------------------------------------------------------------------------