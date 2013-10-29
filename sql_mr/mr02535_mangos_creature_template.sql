-- Creature template
-- Commit 91fff03866982767a654

UPDATE `creature_spell` SET `spell`='55328' WHERE `guid`='3579';
UPDATE `creature_spell` SET `spell`='55329' WHERE `guid`='3911';
UPDATE `creature_spell` SET `spell`='55330' WHERE `guid`='3912';
UPDATE `creature_spell` SET `spell`='55332' WHERE `guid`='3913';
UPDATE `creature_spell` SET `spell`='55333' WHERE `guid`='7398';
UPDATE `creature_spell` SET `spell`='55335' WHERE `guid`='7399';
UPDATE `creature_spell` SET `spell`='55278' WHERE `guid`='15478';
UPDATE `creature_spell` SET `spell`='58589' WHERE `guid`='31120';
UPDATE `creature_spell` SET `spell`='58590' WHERE `guid`='31121';
UPDATE `creature_spell` SET `spell`='58591' WHERE `guid`='31122';

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

-- Charged War Golem from Venom
DELETE FROM `creature_spell` WHERE `guid` IN (29005);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`) VALUES
(29005, 61380, 0),
(29005, 47911, 1);
