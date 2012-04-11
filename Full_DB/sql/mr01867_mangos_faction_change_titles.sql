-- Race Faction Change - Titles

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `player_factionchange_titles`
-- ----------------------------

DROP TABLE IF EXISTS `player_factionchange_titles`;
CREATE TABLE `player_factionchange_titles` (
  `alliance_id` int(8) NOT NULL,
  `alliance_comment` varchar(255) NOT NULL,
  `horde_id` int(8) NOT NULL,
  `horde_comment` varchar(255) NOT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of player_factionchange_titles
-- ----------------------------
INSERT INTO `player_factionchange_titles` VALUES ('1','Private <Name>','15','Scout <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('2','Corporal <Name>','16','Grunt <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('3','Sergeant <Name>','17','Sergeant <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('4','Master Sergeant <Name>','18','Senior Sergeant <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('5','Sergeant Major <Name>','19','First Sergeant <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('6','Knight <Name>','20','Stone Guard <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('7','Knight-Lieutenant <Name>','21','Blood Guard <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('8','Knight-Captain <Name>','22','Legionnaire <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('9','Knight-Champion <Name>','23','Centurion <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('10','Lieutenant Commander <Name>','24','Champion <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('11','Commander <Name>','25','Lieutenant General <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('12','Marshal <Name>','26','General <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('13','Field Marshal <Name>','27','Warlord <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('14','Grand Marshal <Name>','28','High Warlord <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('48','Justicar <Name>','47','Conqueror <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('75','Flame Warden <Name>','76','Flame Keeper <Name>');
INSERT INTO `player_factionchange_titles` VALUES ('113','<Name> of Gnomeregan','153','<Name> of Thunder Bluff');
INSERT INTO `player_factionchange_titles` VALUES ('126','<Name> of the Alliance','127','<Name> of the Horde');
INSERT INTO `player_factionchange_titles` VALUES ('146','<Name> of the Exodar','152','<Name> of Silvermoon');
INSERT INTO `player_factionchange_titles` VALUES ('147','<Name> of Darnassus','154','<Name> of the Undercity');
INSERT INTO `player_factionchange_titles` VALUES ('148','<Name> of Ironforge','151','<Name> of Sen\'jin');
INSERT INTO `player_factionchange_titles` VALUES ('149','<Name> of Stormwind','150','<Name> of Orgrimmar');
