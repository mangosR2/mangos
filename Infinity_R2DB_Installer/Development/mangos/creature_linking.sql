-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.0.88-community - MySQL Community Edition (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table mangos.creature_linking
DROP TABLE IF EXISTS `creature_linking`;
CREATE TABLE IF NOT EXISTS `creature_linking` (
  `guid` int(10) unsigned NOT NULL COMMENT 'creature.guid of the slave mob that is linked',
  `master_guid` int(10) unsigned NOT NULL COMMENT 'master to trigger events',
  `flag` mediumint(8) unsigned NOT NULL COMMENT 'flag - describing what should happen when',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature Linking System';

-- Dumping data for table mangos.creature_linking: 5 rows
DELETE FROM `creature_linking`;
/*!40000 ALTER TABLE `creature_linking` DISABLE KEYS */;
INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) VALUES
	(92752, 5402, 515),
	(65782, 92752, 515),
	(59456, 65782, 515),
	(59457, 58910, 515),
	(59504, 58355, 515);
/*!40000 ALTER TABLE `creature_linking` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
