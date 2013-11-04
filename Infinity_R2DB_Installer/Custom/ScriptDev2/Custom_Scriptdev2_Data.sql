-- npc arena-honor exchange

DELETE FROM script_texts WHERE entry in (-1001007, -1001008);
INSERT INTO script_texts (entry,content_loc8, content_default, sound, type, language, emote, comment) VALUES
('-1001007','Недостаточно ХонорПойнтов!','You do not have enough HonorPoints!','0','0','0','0','Unsuccesfull - honorpoint.'),
('-1001008','Недостаточно АренаПойнтов!','You do not have enough ArenaPoints!','0','0','0','0','Unsuccesfull - arenapoint.');

-- Gossips
DELETE FROM `gossip_texts` WHERE `entry` BETWEEN -3000773 AND -3000770;
INSERT INTO `gossip_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `comment`) VALUES
('-3000770', "Exchange 100 ArenaPoints to 2000 HonorPoints", NULL, NULL, NULL, NULL, NULL, NULL, NULL, "Обменять 100 АренаПойнтов на 2000 ХонорПойнтов", "npc_arena_honor gossip 1"),
('-3000771', "Exchange 1000 ArenaPoints to 20000 HonorPoints", NULL, NULL, NULL, NULL, NULL, NULL, NULL, "Обменять 1000 АренаПойнтов на 20000 ХонорПойнтов", "npc_arena_honor gossip 2"),
('-3000772', "Exchange 1000 HonorPoints to 50 ArenaPoints", NULL, NULL, NULL, NULL, NULL, NULL, NULL, "Обменять 1000 ХонорПойнтов на 50 АренаПойнтов", "npc_arena_honor gossip 3"),
('-3000773', "Exchange 10000 HonorPoints to 500 ArenaPoints", NULL, NULL, NULL, NULL, NULL, NULL, NULL, "Обменять 10000 ХонорПойнтов на 500 АренаПойнтов", "npc_arena_honor gossip 4");

DROP TABLE IF EXISTS `guildhalls`;
CREATE TABLE `guildhalls` (
  `id` int(8) unsigned NOT NULL auto_increment,
  `guildId` bigint(20) NOT NULL default '0',
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `map` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=22 ;

INSERT INTO `guildhalls` VALUES
(1, 0, 16222, 16266, 14.2, 1, 'GM Island'),
(2, 0, -10711, 2483, 8, 1, 'Tauren village at Veiled Sea (Silithus)'),
(3, 0, -8323, -343, 146, 0, 'Fishing outside an Northshire Abbey (Elwynn Forest'),
(4, 0, 7368, -1560, 163, 1, 'Troll Village in mountains (Darkshore)'),
(5, 0, -4151, -1400, 198, 0, 'Dwarven village outside Ironforge (Wetlands)'),
(6, 0, -1840, -4233, 2.14, 0, 'Dwarven village (Arathi Highlands, Forbidding Sea)'),
(7, 0, -4151, -1400, 198, 0, 'Crashed zeppelin (Wetlands, Dun Modr)'),
(8, 0, -723, -1076, 179, 1, 'Tauren camp (Mulgore, Red Rock)'),
(9, 0, -206, 1666, 80, 0, 'Shadowfang Keep an outside instance (Silverpine Forest)'),
(10, 0, -6374, 1262, 7, 0, 'Harbor house outside Stormwind (Elwynn Forest)'),
(11, 0, -8640, 580, 96, 0, 'Empty jail between canals (Stormwind)'),
(12, 0, -4844, -1066, 502, 0, 'Old Ironforge'),
(13, 0, -4863, -1658, 503.5, 0, 'Ironforge Airport'),
(14, 0, 1146, -165, 313, 37, 'Azshara Crater instance (Alliance entrance)'),
(15, 0, -123, 858, 298, 37, 'Azshara Crater instance (Horde entrance)'),
(16, 0, 4303, -2760, 16.8, 0, 'Quel\Thalas Tower'),
(17, 0, -6161, -790, 423, 0, 'Crashed gnome airplane (between Dun Morogh and Searing Gorge)'),
(18, 0, -11790, -1640, 54.7, 0, 'Zul\'Gurub an outside instance (Stranglethorn Vale)'),
(19, 0, -11805, -4754, 6, 1, 'Goblin village (Tanaris, South Seas)'),
(20, 0, -9296, 670, 132, 0, 'Villains camp outside an Stormwind (Elwynn Forest)'),
(21, 0, 3414, -3380, 142.2, 0, 'Stratholm an outside instance');

DROP TABLE IF EXISTS `teleportmaster_categories`;
CREATE TABLE `teleportmaster_categories` (
  `CategoryID` int(11) unsigned NOT NULL COMMENT 'ID Number for this Teleport Location Category. 0 = This is a sub-category.',
  `CategoryName` varchar(100) DEFAULT '' COMMENT 'Name of this category as it appears in the Teleport Master menu.',
  `SubCatName` varchar(100) DEFAULT '' COMMENT 'Name of this subCategory if indeed this is a subcategory',
  `SubCatGroupID` int(11) DEFAULT '0' COMMENT 'Which group of SubCats does this belong to?',
  PRIMARY KEY (`CategoryID`)
);

insert  into `teleportmaster_categories`(`CategoryID`,`CategoryName`,`SubCatName`,`SubCatGroupID`) values (1,'Cities','',0),(2,'Dungeons','',1),(3,'Guilds','',0),(101,'Dungeons','Kalimdor',1),(102,'Dungeons','Eastern Kingdoms',1),(103,'Dungeons','Outland',1),(104,'Dungeons','Northrend',1);

DROP TABLE IF EXISTS `teleportmaster_locations`;
CREATE TABLE `teleportmaster_locations` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID Number for the entry',
  `MapID` int(11) NOT NULL DEFAULT '0' COMMENT 'Map ID number - See MaNGOS DB',
  `CategoryID` int(11) NOT NULL DEFAULT '0' COMMENT 'ID Number of the Category for this teleport location. See the teleportmaster_categories table in the ScriptDev2 DB',
  `Name` varchar(100) NOT NULL DEFAULT '' COMMENT 'Name of Tele Location',
  `Xpos` float NOT NULL DEFAULT '0' COMMENT 'X Position',
  `Ypos` float NOT NULL DEFAULT '0' COMMENT 'Y Position',
  `Zpos` float NOT NULL DEFAULT '0' COMMENT 'Z Position',
  `Rpos` float NOT NULL DEFAULT '0' COMMENT 'Rotation',
  `Cost` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Cost (in COPPER) to teleport here from ANY given location',
  `ReqLevel` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Required level in order to display this location as an option',
  `Faction` int(1) NOT NULL DEFAULT '0' COMMENT 'Required faction in order to display this location as an option. 0=Neutral, 1=Alliance, 2=Horde',
  `GuildID` int(11) NOT NULL DEFAULT '0' COMMENT 'ID Number of the guild to use this teleport location',
  PRIMARY KEY (`ID`)
);

insert  into `teleportmaster_locations`(`ID`,`MapID`,`CategoryID`,`Name`,`Xpos`,`Ypos`,`Zpos`,`Rpos`,`Cost`,`ReqLevel`,`Faction`,`GuildID`) values (1001,1,1,'Darnassus',9952.01,2272.98,1341.4,1.62,10000,0,1,0),(1002,530,1,'The Exodar',-3990.47,-11851.8,0.37,1.15,10000,0,1,0),(1003,0,1,'Ironforge',-4905.64,-879.78,501.66,5.05,10000,0,1,0),(1004,0,1,'Stormwind',-8967.16,510.7,96.35,0.67,10000,0,1,0),(1005,1,1,'Orgrimmar',1478.67,-4413.9,25.59,6.28,10000,0,2,0),(1006,530,1,'Silvermoon City',9462.82,-7277.27,14.17,6.2,10000,0,2,0),(1007,1,1,'Thunder Bluff',-1296.38,146.48,130,5.48,10000,0,2,0),(1008,0,1,'Undercity',1847.98,237.76,62.28,3.14,10000,0,2,0),(1009,530,1,'Shattrath City',-1948.2,5178.62,17.06,1.27,55000,55,0,0),(1010,0,1,'Booty Bay',-14290.9,431.69,32.72,2.73,40000,40,0,0),(1011,1,1,'Gadgetzan',-7093.16,-3798.6,8.4,2.86,40000,40,0,0),(1012,1,1,'Everlook',6725.25,-4615.66,721.47,4.75,50000,50,0,0),(1013,1,1,'Mudsprocket',-4566.82,-3172.71,33.98,3.19,45000,45,0,0),(1014,571,1,'Dalaran',5804.77,616.79,650.83,1.62,65000,65,0,0),(1015,1,101,'Blackfathom Deeps',4249.99,739.21,-25.81,1.55,13000,13,0,0),(1016,1,101,'Caverns of Time',-8186.48,-4697.14,17.34,4.96,69000,69,0,0),(1017,1,101,'Dire Maul',-3971.58,1126.19,161.03,6.27,48000,48,0,0),(1018,1,101,'Maraudon',-1421.92,2911.93,137.07,1.68,38000,38,0,0),(1019,1,101,'Onyxia\'s Lair',-4707.89,-3727.79,54.59,3.74,53000,53,0,0),(1020,1,101,'Ragefire Chasm',1813.51,-4413.83,-18.02,5.18,11000,11,0,0),(1021,1,101,'Razorfen Downs',-4657.19,-2522.81,81.22,4.21,28000,28,0,0),(1022,1,101,'Rzaorfen Kraul',-4467.48,-1669.83,81.89,0.91,18000,18,0,0),(1023,1,101,'Ruins of Ahn\'Qiraj',-8411.11,1499.72,28.37,2.57,63000,63,0,0),(1024,1,101,'Temple of Ahn\'Qiraj',-8239.92,1990.75,129.08,0.97,63000,63,0,0),(1025,1,101,'Wailing Caverns',-735.41,-2217.29,16.99,2.83,13000,13,0,0),(1026,1,101,'Zul\'Farrak',-6797.28,-2890.91,8.88,0.06,38000,38,0,0),(1027,0,102,'Blackrock Depths',-7179.03,-922.93,166.27,4.88,43000,43,0,0),(1028,0,102,'Blackrock Spire',-7525.72,-1227.68,285.73,5.24,48000,48,0,0),(1029,229,102,'Blackwing Lair',173.98,-474.59,117.84,0.03,62000,62,0,0),(1030,0,102,'Deadmines',-11208.1,1676.37,24.57,1.56,13000,13,0,0),(1031,0,102,'Gnomeregan',-5163.54,925.42,257.18,1.57,18000,18,0,0),(1032,530,102,'Isle of Quel\'Danas',12991.9,-6899.54,8.08,3.05,68000,68,0,0),(1033,0,102,'Karazhan',-11115.4,-2007.85,48.56,0.66,71000,71,0,0),(1034,230,102,'Molten Core',1127.57,-459.66,-102.58,3.39,53000,53,0,0),(1035,0,102,'Scarlet Monastery',2870.85,-758.87,160.33,5.07,23000,23,0,0),(1036,0,102,'Scholomance',1273.3,-2554.14,91.21,0.52,48000,48,0,0),(1037,0,102,'Shadowfang Keep',-234.24,1564.18,76.99,1.21,13000,13,0,0),(1038,0,102,'Stratholme',3354.44,-3379.07,144.78,6.26,48000,48,0,0),(1039,0,102,'Sunken Temple',-10177.2,-3994.64,-111.56,6.03,38000,38,0,0),(1040,0,102,'The Stockade',-8766.08,845.33,88.03,0.72,18000,18,0,0),(1041,0,102,'Uldaman',-6071.37,-2955.16,209.85,0.01,33000,33,0,0),(1042,530,102,'Zul\'Aman',6852.16,-7979.12,183.23,4.7,71000,71,0,0),(1043,0,102,'Zul\'Gurub',-11916,-1217.09,92.29,4.68,53000,53,0,0),(1044,530,103,'Auchinhoun',-3323.51,4930.57,-100.54,1.91,58000,58,0,0),(1045,530,103,'Black Temple',-3559.99,648.61,1.88,4.78,73000,73,0,0),(1046,530,103,'Coilfang Reservoir',719.78,6845.03,-68.99,0.01,58000,58,0,0),(1047,530,103,'Gruul\'s Lair',3540.32,5096.26,4.24,5.64,68000,68,0,0),(1048,530,103,'Hellfire Citadel',-272.25,3115.93,31.31,2.16,58000,58,0,0),(1049,530,103,'Tempest Keep',3100.46,1536.88,190.31,4.65,71000,71,0,0),(1050,571,104,'Ahn\'Kahet',3643.21,2036.78,1.79,4.39,71000,71,0,0),(1051,571,104,'Azjol-Nerub',3694.09,2147.85,34.89,2.34,70000,70,0,0),(1052,571,104,'Drak\'Tharon Keep',4774.22,-2026.64,229.37,1.54,72000,72,0,0),(1053,571,104,'Gun\'Drak',6784.42,-4466.53,440.86,5.39,74000,74,0,0),(1054,571,104,'Icecrown Citadel',5918.44,2130.66,636.04,3.59,80000,80,0,0),(1055,571,104,'Naxxramas',3664.79,-1269.44,243.52,0.67,80000,80,0,0),(1056,571,104,'The Nexus',3881.92,6984.98,73.76,0.05,69000,69,0,0),(1057,571,104,'The Obsidian Sanctum',3540.02,272.85,45.61,0.06,80000,80,0,0),(1058,571,104,'Ulduar',9014.24,-1110.06,1165.28,6.28,68000,68,0,0),(1059,571,104,'Utgarde Keep',1222.02,-4864.44,41.25,0.35,78000,78,0,0),(1060,571,104,'Utgarde Pinnacle',1243.13,-4857.67,217.65,3.43,80000,80,0,0),(1061,571,104,'Violet Hold',5732.18,548.03,652.68,3.96,70000,70,0,0);
