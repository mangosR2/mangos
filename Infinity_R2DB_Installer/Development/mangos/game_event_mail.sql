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

-- Dumping structure for table mangos.game_event_mail
DROP TABLE IF EXISTS `game_event_mail`;
CREATE TABLE IF NOT EXISTS `game_event_mail` (
  `event` smallint(6) NOT NULL default '0' COMMENT 'Negatives value to send at event stop, positive value for send at event start.',
  `raceMask` mediumint(8) unsigned NOT NULL default '0',
  `quest` mediumint(8) unsigned NOT NULL default '0',
  `mailTemplateId` mediumint(8) unsigned NOT NULL default '0',
  `senderEntry` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`event`,`raceMask`,`quest`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Game event system';

-- Dumping data for table mangos.game_event_mail: 49 rows
DELETE FROM `game_event_mail`;
/*!40000 ALTER TABLE `game_event_mail` DISABLE KEYS */;
INSERT INTO `game_event_mail` (`event`, `raceMask`, `quest`, `mailTemplateId`, `senderEntry`) VALUES
	(46, 1101, 0, 288, 7937),
	(47, 690, 0, 289, 40184),
	(50, 1101, 12420, 197, 27487),
	(51, 1101, 12420, 198, 27487),
	(52, 1101, 12420, 199, 27487),
	(53, 1101, 12420, 200, 27487),
	(54, 1101, 12420, 201, 27487),
	(55, 1101, 12420, 202, 27487),
	(56, 1101, 12420, 218, 27487),
	(57, 1101, 12420, 204, 27487),
	(58, 1101, 12420, 220, 27487),
	(59, 1101, 12420, 206, 27487),
	(60, 1101, 12420, 207, 27487),
	(61, 1101, 12420, 208, 27487),
	(50, 690, 12421, 212, 27487),
	(51, 690, 12421, 213, 27487),
	(52, 690, 12421, 214, 27487),
	(53, 690, 12421, 215, 27487),
	(54, 690, 12421, 216, 27487),
	(55, 690, 12421, 217, 27487),
	(56, 690, 12421, 203, 27487),
	(57, 690, 12421, 219, 27487),
	(58, 690, 12421, 205, 27487),
	(59, 690, 12421, 221, 27487),
	(60, 690, 12421, 222, 27487),
	(61, 690, 12421, 223, 27487),
	(10, 1791, 0, 268, 34365),
	(50, 690, 12420, 197, 27487),
	(51, 690, 12420, 198, 27487),
	(52, 690, 12420, 199, 27487),
	(53, 690, 12420, 200, 27487),
	(54, 690, 12420, 201, 27487),
	(55, 690, 12420, 202, 27487),
	(57, 690, 12420, 204, 27487),
	(59, 690, 12420, 205, 27487),
	(58, 690, 12420, 206, 27487),
	(60, 690, 12420, 207, 27487),
	(61, 690, 12420, 208, 27487),
	(50, 1101, 12421, 212, 27487),
	(51, 1101, 12421, 213, 27487),
	(52, 1101, 12421, 214, 27487),
	(53, 1101, 12421, 215, 27487),
	(54, 1101, 12421, 216, 27487),
	(55, 1101, 12421, 217, 27487),
	(57, 1101, 12421, 219, 27487),
	(58, 1101, 12421, 220, 27487),
	(59, 1101, 12421, 221, 27487),
	(60, 1101, 12421, 222, 27487),
	(61, 1101, 12421, 223, 27487);
/*!40000 ALTER TABLE `game_event_mail` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
