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

-- Dumping structure for table mangos.scripted_areatrigger
DROP TABLE IF EXISTS `scripted_areatrigger`;
CREATE TABLE IF NOT EXISTS `scripted_areatrigger` (
  `entry` mediumint(8) NOT NULL,
  `ScriptName` char(64) NOT NULL,
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mangos.scripted_areatrigger: 66 rows
DELETE FROM `scripted_areatrigger`;
/*!40000 ALTER TABLE `scripted_areatrigger` DISABLE KEYS */;
INSERT INTO `scripted_areatrigger` (`entry`, `ScriptName`) VALUES
	(522, 'at_twiggy_flathead'),
	(4560, 'at_legion_teleporter'),
	(4497, 'at_commander_dawnforge'),
	(1526, 'at_ring_of_law'),
	(4853, 'at_madrigosa'),
	(3066, 'at_ravenholdt'),
	(4873, 'at_warsong_farms'),
	(4872, 'at_warsong_farms'),
	(4871, 'at_warsong_farms'),
	(5140, 'at_svala_intro'),
	(4591, 'at_coilfang_waterfall'),
	(4016, 'at_shade_of_eranikus'),
	(4991, 'at_skadi'),
	(5287, 'at_aldurthar_gate'),
	(5286, 'at_aldurthar_gate'),
	(5285, 'at_aldurthar_gate'),
	(5284, 'at_aldurthar_gate'),
	(4112, 'at_naxxramas'),
	(5108, 'at_stormwright_shelf'),
	(3552, 'at_childrens_week_spot'),
	(3550, 'at_childrens_week_spot'),
	(3549, 'at_childrens_week_spot'),
	(3548, 'at_childrens_week_spot'),
	(3547, 'at_childrens_week_spot'),
	(3546, 'at_childrens_week_spot'),
	(2026, 'at_blackrock_spire'),
	(2046, 'at_blackrock_spire'),
	(5046, 'at_waygate'),
	(5047, 'at_waygate'),
	(4752, 'at_nats_landing'),
	(5030, 'at_spearborn_encampment'),
	(1447, 'at_zulfarrak'),
	(4778, 'at_ancient_male_vrykul'),
	(3958, 'at_zulgurub'),
	(3960, 'at_zulgurub'),
	(4113, 'at_naxxramas'),
	(3626, 'at_vaelastrasz'),
	(4937, 'at_sunwell_plateau'),
	(4524, 'at_shattered_halls'),
	(1726, 'at_scent_larkorwi'),
	(1727, 'at_scent_larkorwi'),
	(1728, 'at_scent_larkorwi'),
	(1729, 'at_scent_larkorwi'),
	(1730, 'at_scent_larkorwi'),
	(1731, 'at_scent_larkorwi'),
	(1732, 'at_scent_larkorwi'),
	(1733, 'at_scent_larkorwi'),
	(1734, 'at_scent_larkorwi'),
	(1735, 'at_scent_larkorwi'),
	(1736, 'at_scent_larkorwi'),
	(1737, 'at_scent_larkorwi'),
	(1738, 'at_scent_larkorwi'),
	(1739, 'at_scent_larkorwi'),
	(1740, 'at_scent_larkorwi'),
	(5732, 'at_icecrown_citadel'),
	(5709, 'at_icecrown_citadel'),
	(4288, 'at_dark_portal'),
	(4485, 'at_dark_portal'),
	(1966, 'at_murkdeep'),
	(4047, 'at_temple_ahnqiraj'),
	(4033, 'at_stomach_cthun'),
	(4034, 'at_stomach_cthun'),
	(5604, 'at_icecrown_citadel'),
	(5578, 'at_pit_of_saron'),
	(5581, 'at_pit_of_saron'),
	(4779, 'at_nifflevar');
/*!40000 ALTER TABLE `scripted_areatrigger` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
