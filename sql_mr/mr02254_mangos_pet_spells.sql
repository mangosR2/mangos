-- Pet (same pet and pet summon) spells correct (only for use with pet scaling system!)

-- Need correct spellcasting for this!
-- UPDATE creature_template SET spell1 = 12470, spell2 = 57984 WHERE entry = 15438;
-- UPDATE creature_template SET spell1 = 36213 WHERE entry = 15352;
UPDATE `creature_template` SET `spell1`='0', `spell2`='0' WHERE `entry`='15438';
UPDATE `creature_template` SET `spell1`= '0', `spell2`='0' WHERE `entry`='15352';
UPDATE `creature_template` SET `spell1`='40133' WHERE `entry`='15439';
UPDATE `creature_template` SET `spell1`='40132' WHERE `entry`='15430';

DELETE FROM `creature_template_addon` WHERE `entry`='89';
INSERT INTO `creature_template_addon`
    (`entry`, `auras`)
VALUES
    (89, 39007);

DELETE FROM `event_scripts` WHERE `id` IN (14859,14858);
INSERT INTO `event_scripts`
    (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`)
VALUES
    (14858, 1, 15, 33663, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 'Summon greater Earth elemental'),
    (14859, 1, 15, 32982, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 'Summon greater Fire  elemental');

DELETE FROM `creature_template_addon` WHERE `entry` IN ('15438','15352');
INSERT INTO `creature_template_addon`(`entry`, `auras`)
    VALUES (15438, 7942),(15352, 7941);

-- Valkyr guardian
UPDATE `creature_template` SET `minmana` = '6500', `maxmana` = '6500', `spell1` = '71841' WHERE `entry` =38391;
REPLACE INTO `creature_spell` (`guid`,`spell`,`index`) VALUES (38391, 71841, 0);
