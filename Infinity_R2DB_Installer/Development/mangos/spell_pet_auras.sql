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

-- Dumping structure for table mangos.spell_pet_auras
DROP TABLE IF EXISTS `spell_pet_auras`;
CREATE TABLE IF NOT EXISTS `spell_pet_auras` (
  `spell` mediumint(8) unsigned NOT NULL COMMENT 'dummy spell id',
  `effectId` tinyint(3) unsigned NOT NULL default '0',
  `pet` mediumint(8) unsigned NOT NULL default '0' COMMENT 'pet id; 0 = all',
  `aura` mediumint(8) unsigned NOT NULL COMMENT 'pet aura id',
  PRIMARY KEY  (`spell`,`effectId`,`pet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mangos.spell_pet_auras: 45 rows
DELETE FROM `spell_pet_auras`;
/*!40000 ALTER TABLE `spell_pet_auras` DISABLE KEYS */;
INSERT INTO `spell_pet_auras` (`spell`, `effectId`, `pet`, `aura`) VALUES
	(19028, 0, 0, 25228),
	(19578, 0, 0, 19579),
	(20895, 0, 0, 24529),
	(28757, 0, 0, 28758),
	(35029, 0, 0, 35060),
	(35030, 0, 0, 35061),
	(35691, 0, 0, 35696),
	(35692, 0, 0, 35696),
	(35693, 0, 0, 35696),
	(23785, 0, 416, 23759),
	(23822, 0, 416, 23826),
	(23823, 0, 416, 23827),
	(23824, 0, 416, 23828),
	(23825, 0, 416, 23829),
	(23785, 0, 417, 23762),
	(23822, 0, 417, 23837),
	(23823, 0, 417, 23838),
	(23824, 0, 417, 23839),
	(23825, 0, 417, 23840),
	(23785, 0, 1860, 23760),
	(23822, 0, 1860, 23841),
	(23823, 0, 1860, 23842),
	(23824, 0, 1860, 23843),
	(23825, 0, 1860, 23844),
	(23785, 0, 1863, 23761),
	(23822, 0, 1863, 23833),
	(23823, 0, 1863, 23834),
	(23824, 0, 1863, 23835),
	(23825, 0, 1863, 23836),
	(23785, 0, 17252, 35702),
	(23822, 0, 17252, 35703),
	(23823, 0, 17252, 35704),
	(23824, 0, 17252, 35705),
	(23825, 0, 17252, 35706),
	(56314, 0, 0, 57447),
	(56314, 1, 0, 57485),
	(56315, 0, 0, 57452),
	(56315, 1, 0, 57484),
	(56316, 0, 0, 57453),
	(56316, 1, 0, 57483),
	(56317, 0, 0, 57457),
	(56317, 1, 0, 57482),
	(56318, 0, 0, 57458),
	(56318, 1, 0, 57475),
	(58228, 0, 19668, 57989);
/*!40000 ALTER TABLE `spell_pet_auras` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
