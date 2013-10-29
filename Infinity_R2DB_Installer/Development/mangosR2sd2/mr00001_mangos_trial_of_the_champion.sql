-- instance
UPDATE instance_template SET ScriptName='instance_trial_of_the_champion' WHERE map=650;

-- announcers
UPDATE `creature_template` SET `ScriptName` = 'npc_toc5_announcer' WHERE `entry` IN (35004, 35005);

-- grand champions
UPDATE creature_template SET scriptname='mob_toc5_warrior' WHERE entry IN (34705, 35572);
UPDATE creature_template SET scriptname='mob_toc5_mage' WHERE entry IN (34702, 35569);
UPDATE creature_template SET scriptname='mob_toc5_shaman' WHERE entry IN (34701, 35571);
UPDATE creature_template SET scriptname='mob_toc5_hunter' WHERE entry IN (34657, 35570);
UPDATE creature_template SET scriptname='mob_toc5_rogue' WHERE entry IN (34703, 35617);

-- argent challenge
UPDATE creature_template SET scriptname='boss_eadric' WHERE entry=35119;
UPDATE creature_template SET scriptname='boss_paletress' WHERE entry=34928;
UPDATE creature_template SET scriptname='mob_toc5_memory' WHERE entry IN (35052, 35041, 35033, 35046, 35043, 35047, 35044, 35039, 35034, 35049, 35030, 34942, 35050, 35042, 35045, 35037, 35031, 35038, 35029, 35048, 35032, 35028, 35040, 35036, 35051);

-- black knight
UPDATE `creature_template` SET `ScriptName` = 'mob_toc5_risen_ghoul' WHERE `entry` IN (35545, 35564);
UPDATE creature_template SET scriptname='boss_black_knight' WHERE entry=35451;

-- free spells for creatures
DELETE FROM `creature_template_spells` WHERE `entry` IN
(34705,34702,34701,34657,34703,35572,35569,35571,35570,35617,35119,34928,35451,35545,35564,35004,35005,35052,35041,35033,35046,35043,35047,35044,35039,35034,35049,35030,34942,35050,35042,35045,35037,35031,35038,35029,35048,35032,35028,35040,35036,35051);
DELETE FROM `creature_template_spells` WHERE `entry` IN
(12002,12001,12000,12003,12004,12010,12484,12485,12447,12454,12441,12438,12453,12443,12437,12445,12725,12452,12486,12442,12482,12440,12483,12451,12456,12449,12455,12450,12487,12446,12011,12012,12436,12005,12007,12006,12009,12008);
