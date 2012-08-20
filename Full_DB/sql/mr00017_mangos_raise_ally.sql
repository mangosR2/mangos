-- Raise Ally
-- Commit 8f022d171f3e383e2e77
UPDATE `creature_template` SET `PowerType`='3', `ScriptName`='npc_risen_ally' WHERE `entry`='30230';
DELETE FROM `creature_spell` WHERE `guid` IN (30230);
INSERT INTO `creature_spell` (`guid`, `spell`, `index`, `active`, `disabled`, `flags`) VALUES
(30230, 62225, 0, 0, 0, 0),
(30230, 47480, 1, 0, 0, 0),
(30230, 47481, 2, 0, 0, 0),
(30230, 47482, 3, 0, 0, 0),
(30230, 47484, 4, 0, 0, 0),
(30230, 67886, 5, 0, 0, 0);

