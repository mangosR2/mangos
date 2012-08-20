-- Additions for spell_script_target
/* NOTICE: Targets, which need often a spell_script_target entry are:
    Target_Script - 38
    Target_AreaEffect_Instant
    maybe some more, but i think not
*/

-- Molten Fury - Sartharion encounter - target Lava Blazes only
DELETE FROM spell_script_target WHERE spell_script_target.entry = 60430;
INSERT INTO spell_script_target VALUES
(60430, 1, 30643);

-- Berserk - Sartharion encounter - target dragon bosses only
DELETE FROM spell_script_target WHERE spell_script_target.entry = 61632;
INSERT INTO spell_script_target VALUES
(61632, 1, 28860),
(61632, 1, 30452),
(61632, 1, 30451),
(61632, 1, 30449);

-- Devour humanoid ---- Quest and to all things (DK Area)
DELETE FROM spell_script_target WHERE spell_script_target.entry = 53110;
INSERT INTO spell_script_target VALUES
(53110, 1, 29102),
(53110, 1, 29103);

DELETE FROM spell_script_target WHERE spell_script_target.entry = 61920;
INSERT INTO spell_script_target VALUES 
(61920 ,1,32857),
(61920 ,1,32927),
(61920 ,1,32867);

-- Flaming Arrow ---- Quest Going Bearback (12851)
DELETE FROM spell_script_target WHERE spell_script_target.entry = 54897;
INSERT INTO spell_script_target VALUES
(54897, 1, 29351),
(54897, 1, 29358);

-- Wintergrasp spell building targets
DELETE FROM `spell_script_target` WHERE `entry` IN (56575,56661,56663,56665,56667,56669,61408);
INSERT INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
(56575, 1, 27852),
(56661, 1, 27852),
(56663, 1, 27852),
(56665, 1, 27852),
(56667, 1, 27852),
(56669, 1, 27852),
(61408, 1, 27852);
