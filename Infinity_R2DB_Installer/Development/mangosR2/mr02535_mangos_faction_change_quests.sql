-- Race Faction Change - Quests

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `player_factionchange_quests`
-- ----------------------------
DROP TABLE IF EXISTS `player_factionchange_quests`;

CREATE TABLE `player_factionchange_quests` (
    `alliance_id` int(8) NOT NULL,
    `commentA` varchar(255) DEFAULT NULL,
    `horde_id` int(8) NOT NULL,
    `commentH` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`alliance_id`, `horde_id`)
) DEFAULT CHARSET=UTF8;

-- ----------------------------
-- Records of player_factionchange_quests
-- ----------------------------
INSERT INTO player_factionchange_quests VALUES (12742, 'A Special Surprise(A)', 12739, 'A Special Surprise(H)');
INSERT INTO player_factionchange_quests VALUES (12743, 'A Special Surprise(A)', 12747, 'A Special Surprise(H)');
INSERT INTO player_factionchange_quests VALUES (12744, 'A Special Surprise(A)', 12748, 'A Special Surprise(H)');
INSERT INTO player_factionchange_quests VALUES (12745, 'A Special Surprise(A)', 12749, 'A Special Surprise(H)');
INSERT INTO player_factionchange_quests VALUES (12746, 'A Special Surprise(A)', 12750, 'A Special Surprise(H)');
-- INSERT INTO player_factionchange_quests VALUES (28649, 'A Special Surprise(A)', 28650, 'A Special Surprise(H)'); Uncomment on Cataclysm
INSERT INTO player_factionchange_quests VALUES (13188, 'Where Kings Walk', 13189, 'Warchief''s Blessing');
