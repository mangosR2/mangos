-- Snakes trap
UPDATE `creature_template` SET `ScriptName`='npc_snake_trap_serpents' WHERE `entry` IN (19921, 19833);
-- Rune blade
UPDATE `creature_template` SET  `modelid_1` = 11686, `modelid_3` = 11686,`AIName` = '', `ScriptName`='npc_runeblade' WHERE `entry` = 27893;
-- Explosive decoy
UPDATE `creature_template` SET `ScriptName` = 'npc_explosive_decoy' WHERE `entry` = '29134';
-- Eye of Kilrogg
UPDATE `creature_template` SET `ScriptName` = 'npc_eye_of_kilrogg' WHERE `entry` = '4277';
-- Greater fire elemental
UPDATE `creature_template` SET `ScriptName` = 'pet_greater_fire_elemental' WHERE `entry` = '15438';
-- Greater earth elemental
UPDATE `creature_template` SET `ScriptName` = 'pet_greater_earth_elemental' WHERE `entry` = '15352';
-- Behsten & Slahtz
UPDATE `creature_template` SET `ScriptName` = 'npc_experience', `gossip_menu_id` = 0 WHERE `entry` IN (35364, 35365);
