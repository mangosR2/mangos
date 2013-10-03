-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.0.45-community-nt - MySQL Community Edition (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table mangos.battleground_template
DROP TABLE IF EXISTS `battleground_template`;
CREATE TABLE IF NOT EXISTS `battleground_template` (
  `id` mediumint(8) unsigned NOT NULL,
  `MinPlayersPerTeam` smallint(5) unsigned NOT NULL default '0',
  `MaxPlayersPerTeam` smallint(5) unsigned NOT NULL default '0',
  `AllianceStartLoc` mediumint(8) unsigned NOT NULL,
  `AllianceStartO` float NOT NULL,
  `HordeStartLoc` mediumint(8) unsigned NOT NULL,
  `HordeStartO` float NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mangos.battleground_template: 13 rows
DELETE FROM `battleground_template`;
/*!40000 ALTER TABLE `battleground_template` DISABLE KEYS */;
INSERT INTO `battleground_template` (`id`, `MinPlayersPerTeam`, `MaxPlayersPerTeam`, `AllianceStartLoc`, `AllianceStartO`, `HordeStartLoc`, `HordeStartO`) VALUES
	(1, 40, 40, 611, 2.72532, 610, 2.27452),
	(2, 10, 10, 769, 3.14159, 770, 0.00391),
	(3, 15, 15, 890, 3.91992, 889, 0.88828),
	(4, 5, 5, 929, 0, 936, 3.14159),
	(5, 5, 5, 939, 0, 940, 3.14159),
	(6, 5, 5, 0, 0, 0, 0),
	(7, 15, 15, 1103, 3.22092, 1104, 0.01649),
	(8, 5, 5, 1258, 0, 1259, 3.14159),
	(9, 15, 15, 1367, 0, 1368, 0),
	(10, 5, 5, 1362, 0, 1363, 0),
	(11, 5, 5, 1364, 0, 1365, 0),
	(30, 40, 40, 1485, 0, 1486, 0),
	(32, 5, 40, 0, 0, 0, 0);
/*!40000 ALTER TABLE `battleground_template` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
