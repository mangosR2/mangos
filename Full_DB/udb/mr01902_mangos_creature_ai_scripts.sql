-- Friend of Fowl achieve
DELETE FROM creature_ai_scripts WHERE creature_id IN(23801,24746);
INSERT INTO `creature_ai_scripts` VALUES
('2380101', '23801', '6', '0', '100', '0', '0', '0', '0', '0', '11', '25281', '6', '3', '0', '0', '0', '0', '0', '0', '0', '0', 'ytdb');
INSERT INTO `creature_ai_scripts` VALUES
('2474601', '24746', '6', '0', '100', '0', '0', '0', '0', '0', '11', '25281', '6', '3', '0', '0', '0', '0', '0', '0', '0', '0', 'ytdb');

UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '23801';
UPDATE `creature_template` SET `AIName` = 'EventAI' WHERE `entry` = '24746';
UPDATE creature_template SET type=1 WHERE entry in(23801,24746);
