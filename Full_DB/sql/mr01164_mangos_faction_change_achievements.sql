-- Race Faction Change - Achievements

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `player_factionchange_achievements`
-- ----------------------------
DROP TABLE IF EXISTS `player_factionchange_achievements`;

CREATE TABLE `player_factionchange_achievements` (
    `alliance_id` int(8) NOT NULL,
    `horde_id` int(8) NOT NULL,
    `CommentA` varchar(255) NOT NULL,
    `CommentH` varchar(255) NOT NULL,
    PRIMARY KEY (`alliance_id`,`horde_id`)
) DEFAULT CHARSET=UTF8;

-- ----------------------------
-- Records of player_factionchange_achievements
-- ----------------------------
INSERT INTO `player_factionchange_achievements` VALUES ('33', '1358', 'Complete 130 quests in Borean Tundra', 'Complete 150 quests in Borean Tundra');
INSERT INTO `player_factionchange_achievements` VALUES ('34', '1356', 'Complete 130 quests in Howling Fjord', 'Complete 105 quests in Howling Fjord');
INSERT INTO `player_factionchange_achievements` VALUES ('35', '1359', 'Complete 115 quests in Dragonblight', 'Complete 130 quests in Dragonblight');
INSERT INTO `player_factionchange_achievements` VALUES ('37', '1357', 'Complete 85 quests in Grizzly Hills', 'Complete 75 quests in Grizzly Hills');
INSERT INTO `player_factionchange_achievements` VALUES ('41', '1360', 'Complete the Northrend quest achievements listed below.', 'Complete the Northrend quest achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('202', '1502', 'Grab the flag and capture it in under 75 seconds.', 'Grab the flag and capture it in under 75 seconds.');
INSERT INTO `player_factionchange_achievements` VALUES ('203', '1251', 'In a single Warsong Gulch battle, kill 2 flag carriers before they leave the Silverwing Flag Room', 'In a single Warsong Gulch battle, kill 2 flag carriers before they leave the Warsong Flag Room');
INSERT INTO `player_factionchange_achievements` VALUES ('206', '1252', 'Kill 100 flag carriers in Warsong Gulch.', 'Kill 100 flag carriers in Warsong Gulch.');
INSERT INTO `player_factionchange_achievements` VALUES ('220', '873', 'Win Alterac Valley without losing a tower or captain. You must also control all of the Horde\'s towers', 'Win Alterac Valley without losing a tower or captain. You must also control all of the Alliance\'s towers');
INSERT INTO `player_factionchange_achievements` VALUES ('225', '1164', 'Win Alterac Valley while your team controls both mines.', 'Win Alterac Valley while your team controls both mines.');
INSERT INTO `player_factionchange_achievements` VALUES ('230', '1175', 'Complete the battleground achievements listed below.', 'Complete the battleground achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('246', '1005', 'Get an honorable, killing blow on six different races.', 'Get an honorable, killing blow on six different races.');
INSERT INTO `player_factionchange_achievements` VALUES ('388', '1006', 'Kill 50 enemy players in any of your home cities.', 'Kill 50 enemy players in any of your home cities.');
INSERT INTO `player_factionchange_achievements` VALUES ('433', '443', 'Earned the title, Grand Marshal', 'Earned the title, High Warlord');
INSERT INTO `player_factionchange_achievements` VALUES ('434', '445', 'Earned the title, Field Marshal', 'Earned the title, Warlord');
INSERT INTO `player_factionchange_achievements` VALUES ('435', '444', 'Earned the title, Commander', 'Earned the title, Lieutenant General');
INSERT INTO `player_factionchange_achievements` VALUES ('436', '447', 'Earned the title, Lieutenant Commander', 'Earned the title, Champion');
INSERT INTO `player_factionchange_achievements` VALUES ('437', '448', 'Earned the title, Knight-Champion', 'Earned the title, Centurion');
INSERT INTO `player_factionchange_achievements` VALUES ('438', '469', 'Earned the title, Knight-Captain', 'Earned the title, Legionnaire');
INSERT INTO `player_factionchange_achievements` VALUES ('439', '451', 'Earned the title, Knight', 'Earned the title, Stone Guard');
INSERT INTO `player_factionchange_achievements` VALUES ('440', '452', 'Earned the title, Sergeant Major', 'Earned the title, First Sergeant');
INSERT INTO `player_factionchange_achievements` VALUES ('441', '450', 'Earned the title, Master Sergeant', 'Earned the title, Senior Sergeant');
INSERT INTO `player_factionchange_achievements` VALUES ('442', '454', 'Earned the title, Private', 'Earned the title, Scout');
INSERT INTO `player_factionchange_achievements` VALUES ('470', '468', 'Earned the title, Corporal', 'Earned the title, Grunt');
INSERT INTO `player_factionchange_achievements` VALUES ('472', '449', 'Earned the title, Knight-Lieutenant', 'Earned the title, Blood Guard');
INSERT INTO `player_factionchange_achievements` VALUES ('473', '446', 'Earned the title, Marshal', 'Earned the title, General');
INSERT INTO `player_factionchange_achievements` VALUES ('604', '603', 'Kill 5 Horde players in each of the cities listed below', 'Kill 5 Alliance players in each of the cities listed below');
INSERT INTO `player_factionchange_achievements` VALUES ('610', '615', 'Kill Thrall', 'Kill King Varian Wrynn');
INSERT INTO `player_factionchange_achievements` VALUES ('611', '616', 'Kill Cairne Bloodhoof', 'Kill King Magni Bronzebeard');
INSERT INTO `player_factionchange_achievements` VALUES ('612', '617', 'Kill Lady Sylvanas Windrunner', 'Kill High Priestess Tyrande Whisperwind');
INSERT INTO `player_factionchange_achievements` VALUES ('613', '618', 'Kill Lor\'themar Theron', 'Kill Prophet Velen');
INSERT INTO `player_factionchange_achievements` VALUES ('614', '619', 'Slay the leaders of the Horde', 'Slay the leaders of the Alliance');
INSERT INTO `player_factionchange_achievements` VALUES ('701', '700', 'Obtain an Insignia or Medallion of the Alliance', 'Obtain an Insignia or Medallion of the Horde');
INSERT INTO `player_factionchange_achievements` VALUES ('707', '706', 'Obtain a Stormpike Battle Charger', 'Obtain a Frostwolf Howler');
INSERT INTO `player_factionchange_achievements` VALUES ('709', '708', 'Gain exalted reputation with the Stormpike Guard', 'Gain exalted reputation with the Frostwolf Clan');
INSERT INTO `player_factionchange_achievements` VALUES ('711', '710', 'Gain exalted reputation with The League of Arathor', 'Gain exalted reputation with The Forsaken Defilers');
INSERT INTO `player_factionchange_achievements` VALUES ('713', '712', 'Gain exalted reputation with the Silverwing Sentinels', 'Gain exalted reputation with the Warsong Outriders');
INSERT INTO `player_factionchange_achievements` VALUES ('764', '763', 'Raise all of The Burning Crusade dungeon reputations to exalted.', 'Raise all of The Burning Crusade dungeon reputations to exalted.');
INSERT INTO `player_factionchange_achievements` VALUES ('899', '901', 'Earn exalted status with the Kurenai', 'Earn exalted status with The Mag\'har');
INSERT INTO `player_factionchange_achievements` VALUES ('907', '714', 'Raise your reputation values in Warsong Gulch, Arathi Basin and Alterac Valley to Exalted.', 'Raise your reputation values in Warsong Gulch, Arathi Basin and Alterac Valley to Exalted.');
INSERT INTO `player_factionchange_achievements` VALUES ('908', '909', 'Complete 100 battlegrounds at max level.', 'Complete 100 battlegrounds at max level.');
INSERT INTO `player_factionchange_achievements` VALUES ('942', '943', 'Raise your reputation level from unfriendly to exalted with Timbermaw Hold, Sporeggar and the Kurenai', 'Raise your reputation level from unfriendly to exalted with Timbermaw Hold, Sporeggar and The Mag\'har');
INSERT INTO `player_factionchange_achievements` VALUES ('948', '762', 'Earn Exalted reputation with all six Alliance factions.', 'Earn Exalted reputation with all six Horde factions.');
INSERT INTO `player_factionchange_achievements` VALUES ('963', '965', 'Visit the Candy Buckets in Kalimdor.', 'Visit the Candy Buckets in Kalimdor.');
INSERT INTO `player_factionchange_achievements` VALUES ('966', '967', 'Visit the Candy Buckets in Eastern Kingdoms.', 'Visit the Candy Buckets in Eastern Kingdoms.');
INSERT INTO `player_factionchange_achievements` VALUES ('969', '968', 'Visit the Candy Buckets in Outland.', 'Visit the Candy Buckets in Outland.');
INSERT INTO `player_factionchange_achievements` VALUES ('970', '971', 'Complete the Kalimdor, Eastern Kingdoms and Outland Tricks and Treats achievements.', 'Complete the Kalimdor, Eastern Kingdoms and Outland Tricks and Treats achievements.');
INSERT INTO `player_factionchange_achievements` VALUES ('1012', '1011', 'Gain exalted reputation with the Alliance Vanguard', 'Gain exalted reputation with the Horde Expedition');
INSERT INTO `player_factionchange_achievements` VALUES ('1022', '1025', 'Honor the flames of Eastern Kingdoms.', 'Honor the flames of Eastern Kingdoms.');
INSERT INTO `player_factionchange_achievements` VALUES ('1023', '1026', 'Honor the flames of Kalimdor.', 'Honor the flames of Kalimdor.');
INSERT INTO `player_factionchange_achievements` VALUES ('1024', '1027', 'Honor the flames of Outland.', 'Honor the flames of Outland.');
INSERT INTO `player_factionchange_achievements` VALUES ('1028', '1031', 'Desecrate the Horde\'s bonfires in Eastern Kingdoms', 'Desecrate the Alliance\'s bonfires in Eastern Kingdoms');
INSERT INTO `player_factionchange_achievements` VALUES ('1029', '1032', 'Desecrate the Horde\'s bonfires in Kalimdor', 'Desecrate the Alliance\'s bonfires in Kalimdor');
INSERT INTO `player_factionchange_achievements` VALUES ('1030', '1033', 'Desecrate the Horde\'s bonfires in Outland', 'Desecrate the Alliance\'s bonfires in Outland');
INSERT INTO `player_factionchange_achievements` VALUES ('1034', '1036', 'Complete the Flame Warden of Eastern Kingdoms, Kalimdor and Outland achievements', 'Complete the Flame Keeper of Eastern Kingdoms, Kalimdor and Outland achievements');
INSERT INTO `player_factionchange_achievements` VALUES ('1035', '1037', 'Complete the Extinguishing Eastern Kingdoms, Kalimdor and Outland achievements.', 'Complete the Extinguishing Eastern Kingdoms, Kalimdor and Outland achievements.');
INSERT INTO `player_factionchange_achievements` VALUES ('1038', '1039', 'Complete the Midsummer achievements listed below.', 'Complete the Midsummer achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('1040', '1041', 'Ruin Hallow\'s End for the Horde by completing Sergeant Hartman\'s quests which involve crashing the wickerman festival and cleaning up the stinkbombs from Southshore', 'Ruin Hallow\'s End for the Alliance by completing Darkcaller Yanka\'s quests which involve going to Southshore, ruining the kegs with rotten eggs and tossing stinkbombs into the town');
INSERT INTO `player_factionchange_achievements` VALUES ('1151', '224', 'In Alterac Valley, kill 50 enemy players in the Hall of the Stormpike', 'In Alterac Valley, kill 50 enemy players in the Hall of the Frostwolf');
INSERT INTO `player_factionchange_achievements` VALUES ('1167', '1168', 'Complete the Alterac Valley achievements listed below.', 'Complete the Alterac Valley achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('1169', '1170', 'Complete the Arathi Basin achievements listed below.', 'Complete the Arathi Basin achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('1172', '1173', 'Complete the Warsong Gulch achievements listed below.', 'Complete the Warsong Gulch achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('1184', '1203', 'Drink the Brewfest beers listed below.', 'Drink the Brewfest beers listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('1189', '1271', 'Complete 80 quests in Hellfire Peninsula', 'Complete 90 quests in Hellfire Peninsula');
INSERT INTO `player_factionchange_achievements` VALUES ('1191', '1272', 'Complete 63 quests in Terokkar Forest', 'Complete 68 quests in Terokkar Forest');
INSERT INTO `player_factionchange_achievements` VALUES ('1192', '1273', 'Complete 75 quests in Nagrand', 'Complete 87 quests in Nagrand');
INSERT INTO `player_factionchange_achievements` VALUES ('1262', '1274', 'Complete the Outland quest achievements listed below.', 'Complete the Outland quest achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('1255', '259', 'Throw a snowball at King Magni Bronzebeard during the Feast of Winter Veil', 'Throw a snowball at Cairne Bloodhoof during the Feast of Winter Veil');
INSERT INTO `player_factionchange_achievements` VALUES ('1279', '1280', 'Get completely smashed, put on your best perfume, throw a handful of rose petals on Sraaz and then kiss him. You\'ll regret it in the morning', 'Get completely smashed, put on your best perfume, throw a handful of rose petals on Jeremiah Payson and then kiss him. You\'ll regret it in the morning');
INSERT INTO `player_factionchange_achievements` VALUES ('1563', '1784', 'Complete the cooking achievements listed below.', 'Complete the cooking achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('1656', '1657', 'Complete the Hallow\'s End achievements listed below.', 'Complete the Hallow\'s End achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('1676', '1677', 'Complete 700 quests in Eastern Kingdoms', 'Complete 550 quests in Eastern Kingdoms');
INSERT INTO `player_factionchange_achievements` VALUES ('1678', '1680', 'Complete 700 quests in Kalimdor', 'Complete 685 quests in Kalimdor');
INSERT INTO `player_factionchange_achievements` VALUES ('1681', '1682', 'Complete the quest achievements listed below.', 'Complete the quest achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('1684', '1683', 'Complete the Brewfest achievements listed below.', 'Complete the Brewfest achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('1686', '1685', 'Use Mistletoe on the Alliance Brothers during the Feast of Winter Veil', 'Use Mistletoe on the Horde Brothers during the Feast of Winter Veil');
INSERT INTO `player_factionchange_achievements` VALUES ('1692', '1691', 'Complete the Winter Veil achievements listed below.', 'Complete the Winter Veil achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('1697', '1698', 'Complete the Lovely Charm Bracelet daily quest for each Alliance capital.', 'Complete the Lovely Charm Bracelet daily quest for each Horde capital.');
INSERT INTO `player_factionchange_achievements` VALUES ('1707', '1693', 'Complete the Love is in the Air achievements listed below.', 'Complete the Love is in the Air achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('1737', '2476', 'Destroy each of the vehicles listed below.', 'Destroy each of the vehicles listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('1752', '2776', 'Complete the Wintergrasp achievements listed below.', 'Complete the Wintergrasp achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('1757', '2200', 'Defend the beach without losing any walls.', 'Defend the beach without losing any walls.');
INSERT INTO `player_factionchange_achievements` VALUES ('1762', '2192', 'Win a Strand of the Ancients battle without losing any siege vehicles.', 'Win a Strand of the Ancients battle without losing any siege vehicles.');
INSERT INTO `player_factionchange_achievements` VALUES ('1782', '1783', 'Complete each of the cooking daily quests offered by Katherine Lee in Dalaran', 'Complete each of the cooking daily quests offered by Awilo Lon\'gomba in Dalaran');
INSERT INTO `player_factionchange_achievements` VALUES ('2016', '2017', 'Complete the Grizzly Hills PvP daily quests listed below.', 'Complete the Grizzly Hills PvP daily quests listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('2144', '2145', 'Complete the world events achievements listed below.', 'Complete the world events achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('2194', '2195', 'Complete the Strand of the Ancients achievements listed below.', 'Complete the Strand of the Ancients achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('2419', '2497', 'Find your pet Spring Rabbit another one to love in each of the towns listed below.', 'Find your pet Spring Rabbit another one to love in each of the towns listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('2421', '2420', 'Hide a Brightly Colored Egg in Stormwind City', 'Hide a Brightly Colored Egg in Silvermoon City');
INSERT INTO `player_factionchange_achievements` VALUES ('2536', '2537', 'Obtain 100 mounts.', 'Obtain 100 mounts.');
INSERT INTO `player_factionchange_achievements` VALUES ('2760', '2769', 'Earn exalted status with and the right to represent Darnassus in the Argent Tournament.', 'Earn exalted status with and the right to represent the Undercity in the Argent Tournament.');
INSERT INTO `player_factionchange_achievements` VALUES ('2761', '2767', 'Earn exalted status with and the right to represent the Exodar in the Argent Tournament.', 'Earn exalted status with and the right to represent Silvermoon City in the Argent Tournament.');
INSERT INTO `player_factionchange_achievements` VALUES ('2762', '2768', 'Earn exalted status with and the right to represent the Gnomeregan Exiles in the Argent Tournament.', 'Earn exalted status with and the right to represent Thunder Bluff in the Argent Tournament.');
INSERT INTO `player_factionchange_achievements` VALUES ('2763', '2766', 'Earn exalted status with and the right to represent Ironforge in the Argent Tournament.', 'Earn exalted status with and the right to represent Sen\'jin in the Argent Tournament.');
INSERT INTO `player_factionchange_achievements` VALUES ('2764', '2765', 'Earn exalted status with and the right to represent Stormwind in the Argent Tournament.', 'Earn exalted status with and the right to represent Orgrimmar in the Argent Tournament.');
INSERT INTO `player_factionchange_achievements` VALUES ('2770', '2771', 'Earn exalted status with and the right to represent every Alliance race\'s faction in the Argent Tournament.', 'Earn exalted status with and the right to represent every Horde race\'s faction in the Argent Tournament.');
INSERT INTO `player_factionchange_achievements` VALUES ('2777', '2787', 'Earn the right to represent Darnassus in the Argent Tournament.', 'Earn the right to represent the Undercity in the Argent Tournament.');
INSERT INTO `player_factionchange_achievements` VALUES ('2778', '2785', 'Earn the right to represent the Exodar in the Argent Tournament.', 'Earn the right to represent Silvermoon City in the Argent Tournament.');
INSERT INTO `player_factionchange_achievements` VALUES ('2779', '2786', 'Earn the right to represent the Gnomeregan Exiles in the Argent Tournament.', 'Earn the right to represent Thunder Bluff in the Argent Tournament.');
INSERT INTO `player_factionchange_achievements` VALUES ('2780', '2784', 'Earn the right to represent Ironforge in the Argent Tournament.', 'Earn the right to represent Sen\'jin in the Argent Tournament.');
INSERT INTO `player_factionchange_achievements` VALUES ('2781', '2783', 'Earn the right to represent Stormwind in the Argent Tournament.', 'Earn the right to represent Orgrimmar in the Argent Tournament.');
INSERT INTO `player_factionchange_achievements` VALUES ('2782', '2788', 'Earn the right to represent every Alliance race\'s faction in the Argent Tournament.', 'Earn the right to represent every Horde race\'s faction in the Argent Tournament.');
INSERT INTO `player_factionchange_achievements` VALUES ('2797', '2798', 'Complete the Noblegarden achievements listed below.', 'Complete the Noblegarden achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('2817', '2816', 'Earn exalted status with and the right to represent every Alliance race\'s faction in the Argent Tournament.', 'Earn exalted status with and the right to represent every Horde race\'s faction in the Argent Tournament.');
INSERT INTO `player_factionchange_achievements` VALUES ('3478', '3656', 'Complete the Pilgrim\'s Bounty achievements listed below.', 'Complete the Pilgrim\'s Bounty achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('3556', '3557', 'Acquire the Spirit of Sharing from a complete Bountiful Table feast at every Alliance capital', 'Acquire the Spirit of Sharing from a complete Bountiful Table feast at every Horde capital');
INSERT INTO `player_factionchange_achievements` VALUES ('3576', '3577', 'Cook up one of every Pilgrim\'s Bounty dish.', 'Cook up one of every Pilgrim\'s Bounty dish.');
INSERT INTO `player_factionchange_achievements` VALUES ('3580', '3581', 'While wearing either a Pilgrim\'s Dress, Robe, or Attire, take a seat at each enemy capital\'s Bountiful Table.', 'While wearing either a Pilgrim\'s Dress, Robe, or Attire, take a seat at each enemy capital\'s Bountiful Table.');
INSERT INTO `player_factionchange_achievements` VALUES ('3596', '3597', 'Complete each of the Pilgrim\'s Bounty dailies.', 'Complete each of the Pilgrim\'s Bounty dailies.');
INSERT INTO `player_factionchange_achievements` VALUES ('3676', '3677', 'Earn both exalted status with The Silver Covenant and the right to represent a city in the Argent Tournament.', 'Earn both exalted status with The Sunreavers and the right to represent a city in the Argent Tournament.');
INSERT INTO `player_factionchange_achievements` VALUES ('3846', '4176', 'Win Isle of Conquest while your team controls the Quarry and Oil Refinery.', 'Win Isle of Conquest while your team controls the Quarry and Oil Refinery.');
INSERT INTO `player_factionchange_achievements` VALUES ('3851', '4177', 'Win Isle of Conquest while controlling the Quarry, Oil Refinery, Shipyard, Siege Workshop and Hangar.', 'Win Isle of Conquest while controlling the Quarry, Oil Refinery, Shipyard, Siege Workshop and Hangar.');
INSERT INTO `player_factionchange_achievements` VALUES ('3856', '4256', 'Destroy the following vehicles in Isle of Conquest', 'Destroy the following vehicles in Isle of Conquest');
INSERT INTO `player_factionchange_achievements` VALUES ('3857', '3957', 'Complete the Isle of Conquest achievements listed below.', 'Complete the Isle of Conquest achievements listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('4156', '4079', 'In the Trial of the Grand Crusader, reach a Tribute Chest with 50 attempts remaining and without allowing any raid member to die during any of the boss encounters in 25-player mode.', 'In the Trial of the Grand Crusader, reach a Tribute Chest with 50 attempts remaining and without allowing any raid member to die during any of the boss encounters in 25-player mode.');
INSERT INTO `player_factionchange_achievements` VALUES ('4436', '4437', 'Pelt the enemy leaders listed below.', 'Pelt the enemy leaders listed below.');
INSERT INTO `player_factionchange_achievements` VALUES ('4786', '4790', 'You assisted High Tinker Mekkatorque and the Gnomeregan Exiles in the recapture of Gnomeregan\'s surface.', 'You assisted High Tinker Mekkatorque and the Gnomeregan Exiles in the recapture of Gnomeregan\'s surface.');
