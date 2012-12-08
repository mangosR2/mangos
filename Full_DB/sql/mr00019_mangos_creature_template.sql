-- Creature template
-- Commit 91fff03866982767a654

UPDATE `creature_template_spells` SET `spell1`='55328' WHERE `entry`='3579';
UPDATE `creature_template_spells` SET `spell1`='55329' WHERE `entry`='3911';
UPDATE `creature_template_spells` SET `spell1`='55330' WHERE `entry`='3912';
UPDATE `creature_template_spells` SET `spell1`='55332' WHERE `entry`='3913';
UPDATE `creature_template_spells` SET `spell1`='55333' WHERE `entry`='7398';
UPDATE `creature_template_spells` SET `spell1`='55335' WHERE `entry`='7399';
UPDATE `creature_template_spells` SET `spell1`='55278' WHERE `entry`='15478';
UPDATE `creature_template_spells` SET `spell1`='58589' WHERE `entry`='31120';
UPDATE `creature_template_spells` SET `spell1`='58590' WHERE `entry`='31121';
UPDATE `creature_template_spells` SET `spell1`='58591' WHERE `entry`='31122';

-- Goregek
UPDATE `creature_template` SET `minlevel` = 76, `maxlevel` = 80, `minhealth` = 4200, `maxhealth` = 4200, `flags_extra` = `flags_extra` | 2048 WHERE `entry` = 28214;

DELETE FROM `creature_spell` WHERE `guid` IN (28214);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`) VALUES
(28214, 52743, 0),
(28214, 52744, 1),
(28214, 54188, 2),
(28214, 54178, 3),
(28214, 52748, 4);
-- (28214, 51959, 5);
