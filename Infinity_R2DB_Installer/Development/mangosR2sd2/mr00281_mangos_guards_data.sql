-- --------------------------
-- Guards around the worlds -
-- --------------------------

-- NEEDS MORE RESEARCH

-- Cenarion hold infantry
  -- adding attack spells to creature template
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` = 15184;
REPLACE INTO `creature_template_spells` SET `entry` = 15184, `spell1` = 18328, `spell2` = 19643, `spell3` = 15618;

-- Bluff watcher ( thunderbluff )
-- correcting guard spells
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` = 3084;
UPDATE `creature_template_spells` SET `spell1` = 40505, `spell2` = 12024, `spell3` = 23337 WHERE `entry` = 3084;

-- orc guards
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` = 3296;
UPDATE `creature_template_spells` SET `spell2` = 40505 WHERE `entry` = 3296;

-- Darn Guards
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` = 4262;
REPLACE INTO `creature_template_spells` SET `entry` = 4262, `spell1` = 40505, `spell2` = 8599;

-- stormwind guards Guards
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` = 68;
REPLACE INTO `creature_template_spells` SET `entry` = 68, `spell1` = 40505, `spell2` = 8599;

-- Undercity Guards
UPDATE `creature_template` SET `flags_extra` = 0 WHERE `entry` = 5624;
UPDATE `creature_template_spells` SET `spell1` = 59395, `spell2` = 7160 WHERE `entry` = 5624;
