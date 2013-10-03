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

-- Dumping structure for table mangos.db_version
DROP TABLE IF EXISTS `db_version`;
CREATE TABLE IF NOT EXISTS `db_version` (
  `version` varchar(120) NOT NULL,
  `creature_ai_version` varchar(120) default NULL,
  `cache_id` int(10) default '0',
  `required_12534_01_mangos_playercreateinfo_spell` bit(1) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Used DB version notes';

-- Dumping data for table mangos.db_version: 1 rows
DELETE FROM `db_version`;
/*!40000 ALTER TABLE `db_version` DISABLE KEYS */;
INSERT INTO `db_version` (`version`, `creature_ai_version`, `cache_id`, `required_12534_01_mangos_playercreateinfo_spell`) VALUES
	('YTDB_0.14.7_R641_cMaNGOS_R12539_SD2_R2913_ACID_R310_RuDB_R63', 'ACID 3.1.0 \'Another Wild Adventure\' - Full Release for CMaNGOS-WOTLK (3.3.5a Client)', 641, b'00000000');
/*!40000 ALTER TABLE `db_version` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
