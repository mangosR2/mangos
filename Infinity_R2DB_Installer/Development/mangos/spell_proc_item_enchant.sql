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

-- Dumping structure for table mangos.spell_proc_item_enchant
DROP TABLE IF EXISTS `spell_proc_item_enchant`;
CREATE TABLE IF NOT EXISTS `spell_proc_item_enchant` (
  `entry` mediumint(8) unsigned NOT NULL,
  `ppmRate` float NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mangos.spell_proc_item_enchant: 8 rows
DELETE FROM `spell_proc_item_enchant`;
/*!40000 ALTER TABLE `spell_proc_item_enchant` DISABLE KEYS */;
INSERT INTO `spell_proc_item_enchant` (`entry`, `ppmRate`) VALUES
	(8034, 9),
	(8680, 8.5714),
	(13218, 21.4286),
	(13897, 6),
	(20004, 6),
	(20005, 1.6),
	(44525, 3.4),
	(44578, 3.4);
/*!40000 ALTER TABLE `spell_proc_item_enchant` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
