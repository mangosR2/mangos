/*
* Ebon Hold (DK Starting Area) - 2013 - 
*/

-- --------------------------------------------------------------------
-- Quest Fix Noth Special Brew  (dk starting area quest fix 12716/12717
-- --------------------------------------------------------------------
UPDATE `quest_template` SET `ExclusiveGroup` = 12716 WHERE `entry` = 12716;

-- ----------------------------------------
-- Quest Death comes From a High Q: 12641 -
-- ----------------------------------------

-- some updates to the eye of archerus
UPDATE `creature_template` SET `minlevel` = 55, `maxlevel` = 55, `unit_flags` = 0, `InhabitType` = 4 WHERE `entry` = 28511;


-- --------------------------------------------------------
-- ACID scripts & Template Fixes for Scarlet Enclave mobs -
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