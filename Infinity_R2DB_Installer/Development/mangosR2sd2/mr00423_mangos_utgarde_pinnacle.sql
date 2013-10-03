-- svala
DELETE FROM spell_script_target WHERE entry = 59930;
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(59930, 1, 26555);

UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35, `ScriptName` = 'npc_ritual_target' WHERE `entry` = 27327;
UPDATE `creature_template` SET `faction_A` = 35, `faction_H` = 35 WHERE `entry` = 30805;
UPDATE `creature_template` SET `InhabitType` = 7, `faction_A` = 14, `faction_H` = 14  WHERE `entry` = 27273;
UPDATE `creature_template` SET `InhabitType` = 7, `faction_A` = 14, `faction_H` = 14  WHERE `entry` = 30771;
UPDATE `creature_template` SET `ScriptName` = 'npc_paralyzer' WHERE `entry` = 27281;

-- skadi
UPDATE `creature_template` SET `ScriptName` = 'npc_skadi_grauf', `AIName` = '', `InhabitType` = 7 WHERE `entry` = 26893;
UPDATE `creature_template` SET `InhabitType` = 7 WHERE `entry` = 30775;
UPDATE `gameobject_template` SET `ScriptName` = 'harpoon_Skadi' WHERE `entry` IN (192175, 192176, 192177);
-- harpoon loot for one summon mob
UPDATE `creature_template` SET `lootid` = 26692 WHERE `entry` = 26692;
UPDATE `creature_template` SET `lootid` = 26692 WHERE `entry` = 30819;
DELETE FROM `creature_loot_template` WHERE `entry` = 26692;
INSERT INTO creature_loot_template  (entry, item, ChanceOrQuestChance, groupid, mincountOrRef, maxcount) VALUES
(26692, 37372, 100, 0, 1, 1);

-- Yimiron
UPDATE `creature_template` SET `ScriptName` = 'npc_spirit_fount', `AIName` = '' WHERE `entry` = 27339;

-- general

DELETE FROM scripted_event_id WHERE id IN (17841,17728);
INSERT INTO scripted_event_id VALUES
(17728, "event_start_gortok"),
(17841, "event_call_flames");
