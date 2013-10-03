-- Instance The Shattered Halls
-- ------------------------

-- ------------
-- Shattered Hand Executioner
-- ------------
UPDATE `creature_template` SET `unit_flags` = 3 WHERE `entry` = 20585; -- adding not attackable flag, removed by script on boss death

-- ------------
-- Prisoner Officers
-- ------------
UPDATE `creature_template` SET `npcflag` = 2 WHERE `entry` = 17296; -- gossip flag added after death of Shattered Hand Executioner
UPDATE `creature_template` SET `npcflag` = 2 WHERE `entry` = 17290;
