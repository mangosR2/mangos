-- Additions for spell_script_target
/* NOTICE: Targets, which need often a spell_script_target entry are:
    Target_Script - 38
    Target_AreaEffect_Instant
    maybe some more, but i think not
*/

-- Berserk - Sartharion encounter - target dragon bosses only
INSERT IGNORE INTO `spell_script_target` VALUES (61632, 1, 28860);

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

-- Ulduar, Mimiron from Reamer
DELETE FROM spell_script_target WHERE entry IN (63820, 64425, 64620);
INSERT INTO spell_script_target VALUES
(63820, 1, 33856),
(64425, 1, 33856),
(64620, 1, 33856);
