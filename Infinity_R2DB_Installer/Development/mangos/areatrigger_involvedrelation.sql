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

-- Dumping structure for table mangos.areatrigger_involvedrelation
DROP TABLE IF EXISTS `areatrigger_involvedrelation`;
CREATE TABLE IF NOT EXISTS `areatrigger_involvedrelation` (
  `id` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Identifier',
  `quest` mediumint(8) unsigned NOT NULL default '0' COMMENT 'Quest Identifier',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Trigger System';

-- Dumping data for table mangos.areatrigger_involvedrelation: 60 rows
DELETE FROM `areatrigger_involvedrelation`;
/*!40000 ALTER TABLE `areatrigger_involvedrelation` DISABLE KEYS */;
INSERT INTO `areatrigger_involvedrelation` (`id`, `quest`) VALUES
	(342, 76),
	(231, 984),
	(230, 954),
	(216, 870),
	(197, 62),
	(196, 578),
	(98, 201),
	(88, 62),
	(87, 76),
	(362, 1448),
	(1205, 2989),
	(2327, 4842),
	(3366, 6025),
	(2486, 4811),
	(482, 1699),
	(3986, 8286),
	(225, 944),
	(2946, 6421),
	(78, 155),
	(822, 2240),
	(302, 1265),
	(4071, 9193),
	(4064, 9160),
	(4291, 9701),
	(4301, 9786),
	(4170, 9400),
	(4293, 9716),
	(4201, 9608),
	(4200, 9607),
	(175, 455),
	(1388, 3505),
	(168, 287),
	(178, 503),
	(4298, 9731),
	(4300, 9752),
	(246, 1149),
	(4473, 10269),
	(4475, 10275),
	(2926, 25),
	(2206, 5156),
	(4280, 9700),
	(522, 1719),
	(171, 273),
	(173, 437),
	(2207, 5156),
	(2726, 6185),
	(4581, 10750),
	(4588, 10772),
	(4963, 11652),
	(4899, 11890),
	(4950, 12036),
	(4986, 12263),
	(5003, 12506),
	(4345, 9958),
	(5400, 13816),
	(5401, 13607),
	(4894, 11878),
	(5500, 14016),
	(3991, 1658),
	(5030, 12575);
/*!40000 ALTER TABLE `areatrigger_involvedrelation` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
