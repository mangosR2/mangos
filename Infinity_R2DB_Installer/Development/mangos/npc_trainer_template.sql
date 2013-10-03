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

-- Dumping structure for table mangos.npc_trainer_template
DROP TABLE IF EXISTS `npc_trainer_template`;
CREATE TABLE IF NOT EXISTS `npc_trainer_template` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `spell` mediumint(8) unsigned NOT NULL default '0',
  `spellcost` int(10) unsigned NOT NULL default '0',
  `reqskill` smallint(5) unsigned NOT NULL default '0',
  `reqskillvalue` smallint(5) unsigned NOT NULL default '0',
  `reqlevel` tinyint(3) unsigned NOT NULL default '0',
  UNIQUE KEY `entry_spell` (`entry`,`spell`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mangos.npc_trainer_template: 0 rows
DELETE FROM `npc_trainer_template`;
/*!40000 ALTER TABLE `npc_trainer_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `npc_trainer_template` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
