DELETE FROM script_texts WHERE entry in (-1001007, -1001008);
DELETE FROM `gossip_texts` WHERE `entry` BETWEEN -3000773 AND -3000770;
DROP TABLE IF EXISTS `guildhalls`;
DROP TABLE IF EXISTS `teleportmaster_categories`;
DROP TABLE IF EXISTS `teleportmaster_locations`;

