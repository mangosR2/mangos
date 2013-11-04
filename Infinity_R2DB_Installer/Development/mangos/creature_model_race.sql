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

-- Dumping structure for table mangos.creature_model_race
DROP TABLE IF EXISTS `creature_model_race`;
CREATE TABLE IF NOT EXISTS `creature_model_race` (
  `modelid` mediumint(8) unsigned NOT NULL default '0',
  `racemask` mediumint(8) unsigned NOT NULL default '0',
  `creature_entry` mediumint(8) unsigned NOT NULL default '0' COMMENT 'option 1, modelid_N from creature_template',
  `modelid_racial` mediumint(8) unsigned NOT NULL default '0' COMMENT 'option 2, explicit modelid',
  PRIMARY KEY  (`modelid`,`racemask`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Model system';

-- Dumping data for table mangos.creature_model_race: 20 rows
DELETE FROM `creature_model_race`;
/*!40000 ALTER TABLE `creature_model_race` DISABLE KEYS */;
INSERT INTO `creature_model_race` (`modelid`, `racemask`, `creature_entry`, `modelid_racial`) VALUES
	(892, 690, 0, 8571),
	(2281, 690, 0, 2289),
	(21243, 690, 0, 21244),
	(20857, 690, 0, 20872),
	(4587, 1024, 19638, 0),
	(4588, 1024, 19637, 0),
	(4589, 1024, 19636, 0),
	(4590, 1024, 19639, 0),
	(4587, 128, 37773, 0),
	(4588, 128, 37768, 0),
	(4589, 128, 37771, 0),
	(4590, 128, 37769, 0),
	(4587, 2, 37772, 0),
	(4588, 2, 37767, 0),
	(4589, 2, 37770, 0),
	(4590, 2, 37766, 0),
	(4587, 4, 37752, 0),
	(4588, 4, 37750, 0),
	(4589, 4, 37751, 0),
	(4590, 4, 37749, 0);
/*!40000 ALTER TABLE `creature_model_race` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
