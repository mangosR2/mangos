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

-- Dumping structure for table mangos.game_weather
DROP TABLE IF EXISTS `game_weather`;
CREATE TABLE IF NOT EXISTS `game_weather` (
  `zone` mediumint(8) unsigned NOT NULL default '0',
  `spring_rain_chance` tinyint(3) unsigned NOT NULL default '25',
  `spring_snow_chance` tinyint(3) unsigned NOT NULL default '25',
  `spring_storm_chance` tinyint(3) unsigned NOT NULL default '25',
  `summer_rain_chance` tinyint(3) unsigned NOT NULL default '25',
  `summer_snow_chance` tinyint(3) unsigned NOT NULL default '25',
  `summer_storm_chance` tinyint(3) unsigned NOT NULL default '25',
  `fall_rain_chance` tinyint(3) unsigned NOT NULL default '25',
  `fall_snow_chance` tinyint(3) unsigned NOT NULL default '25',
  `fall_storm_chance` tinyint(3) unsigned NOT NULL default '25',
  `winter_rain_chance` tinyint(3) unsigned NOT NULL default '25',
  `winter_snow_chance` tinyint(3) unsigned NOT NULL default '25',
  `winter_storm_chance` tinyint(3) unsigned NOT NULL default '25',
  PRIMARY KEY  (`zone`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Weather System';

-- Dumping data for table mangos.game_weather: 41 rows
DELETE FROM `game_weather`;
/*!40000 ALTER TABLE `game_weather` DISABLE KEYS */;
INSERT INTO `game_weather` (`zone`, `spring_rain_chance`, `spring_snow_chance`, `spring_storm_chance`, `summer_rain_chance`, `summer_snow_chance`, `summer_storm_chance`, `fall_rain_chance`, `fall_snow_chance`, `fall_storm_chance`, `winter_rain_chance`, `winter_snow_chance`, `winter_storm_chance`) VALUES
	(1, 0, 45, 2, 0, 30, 1, 0, 53, 0, 0, 90, 0),
	(33, 30, 0, 0, 40, 0, 0, 60, 0, 0, 70, 0, 0),
	(36, 2, 45, 2, 12, 30, 1, 13, 53, 0, 0, 90, 0),
	(8, 30, 0, 0, 30, 0, 0, 50, 0, 2, 4, 0, 0),
	(148, 5, 0, 1, 20, 0, 1, 12, 0, 1, 24, 0, 1),
	(357, 30, 0, 0, 50, 0, 0, 60, 0, 0, 50, 1, 0),
	(1377, 0, 0, 20, 0, 0, 30, 0, 0, 50, 0, 0, 30),
	(490, 40, 0, 0, 40, 0, 0, 50, 0, 0, 50, 0, 0),
	(618, 0, 40, 0, 0, 25, 0, 0, 35, 0, 0, 65, 0),
	(3428, 0, 0, 20, 0, 0, 30, 0, 0, 50, 0, 0, 30),
	(440, 0, 0, 20, 0, 0, 30, 0, 0, 50, 0, 0, 30),
	(14, 0, 0, 20, 0, 0, 30, 0, 0, 50, 0, 0, 30),
	(400, 0, 0, 20, 0, 0, 30, 0, 0, 50, 0, 0, 30),
	(1637, 0, 0, 20, 0, 0, 30, 0, 0, 50, 0, 0, 30),
	(267, 30, 0, 0, 30, 0, 0, 50, 0, 2, 4, 0, 0),
	(85, 50, 0, 0, 67, 0, 0, 71, 0, 0, 50, 30, 0),
	(141, 30, 0, 0, 30, 0, 0, 50, 0, 2, 4, 0, 0),
	(4, 0, 0, 20, 0, 0, 30, 0, 0, 50, 0, 0, 30),
	(15, 30, 0, 0, 30, 0, 0, 50, 0, 2, 4, 0, 0),
	(215, 30, 0, 0, 30, 0, 0, 50, 0, 2, 4, 0, 0),
	(12, 30, 0, 0, 30, 0, 0, 50, 0, 2, 4, 0, 0),
	(3, 0, 0, 20, 0, 0, 20, 0, 0, 20, 0, 0, 15),
	(45, 23, 0, 0, 15, 0, 0, 23, 0, 0, 23, 0, 0),
	(3358, 10, 0, 0, 10, 0, 0, 10, 0, 0, 10, 0, 0),
	(405, 10, 0, 0, 5, 0, 0, 5, 0, 0, 5, 0, 0),
	(41, 15, 0, 0, 5, 0, 0, 15, 0, 0, 15, 0, 0),
	(10, 15, 0, 0, 15, 0, 0, 20, 0, 0, 15, 0, 0),
	(139, 10, 0, 0, 15, 0, 0, 15, 0, 0, 10, 0, 0),
	(28, 10, 0, 0, 15, 0, 0, 15, 0, 0, 10, 0, 0),
	(2017, 5, 0, 0, 5, 0, 0, 5, 0, 0, 5, 0, 0),
	(47, 10, 0, 0, 10, 0, 0, 15, 0, 0, 10, 0, 0),
	(38, 15, 0, 0, 15, 0, 0, 15, 0, 0, 15, 0, 0),
	(44, 15, 0, 0, 15, 0, 0, 15, 0, 0, 15, 0, 0),
	(1977, 15, 0, 0, 5, 0, 0, 15, 0, 0, 15, 0, 0),
	(796, 5, 0, 0, 10, 0, 0, 25, 0, 0, 5, 0, 0),
	(11, 25, 0, 0, 15, 0, 0, 25, 0, 0, 25, 0, 0),
	(2597, 0, 15, 0, 0, 15, 0, 0, 20, 0, 0, 25, 0),
	(3429, 0, 0, 20, 0, 0, 20, 0, 0, 20, 0, 0, 20),
	(3521, 10, 0, 0, 15, 0, 0, 20, 0, 0, 10, 0, 0),
	(4080, 80, 10, 10, 80, 10, 10, 80, 10, 10, 80, 10, 10),
	(4813, 0, 100, 0, 0, 100, 0, 0, 40, 0, 0, 30, 0);
/*!40000 ALTER TABLE `game_weather` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
