-- The Conquest Pit - Quests from Venom
REPLACE INTO `creature_ai_scripts` VALUES ('2771556', '27715', '6', '0', '100', '0', '0', '0', '0', '0', '26', '12427', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest Complete 12427');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '27715';

REPLACE INTO `creature_ai_scripts` VALUES ('2771656', '27716', '6', '0', '100', '0', '0', '0', '0', '0', '26', '12428', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest Complete 12428');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '27716';

REPLACE INTO `creature_ai_scripts` VALUES ('2771756', '27717', '6', '0', '100', '0', '0', '0', '0', '0', '26', '12429', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest Complete 12429');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '27717';

REPLACE INTO `creature_ai_scripts` VALUES ('2771856', '27718', '6', '0', '100', '0', '0', '0', '0', '0', '26', '12430', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest Complete 12430');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '27718';

REPLACE INTO `creature_ai_scripts` VALUES ('2772756', '27727', '6', '0', '100', '0', '0', '0', '0', '0', '26', '12431', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Quest Complete 12431');
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '27727';

UPDATE `creature_template` SET `faction_A`=14 WHERE `entry`=27727;
UPDATE `creature_template` SET `faction_H`=14 WHERE `entry`=27727;