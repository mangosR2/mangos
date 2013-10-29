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

-- Dumping structure for table mangos.transports
DROP TABLE IF EXISTS `transports`;
CREATE TABLE IF NOT EXISTS `transports` (
  `entry` mediumint(8) unsigned NOT NULL default '0',
  `name` text,
  `period` mediumint(8) unsigned NOT NULL default '0',
  PRIMARY KEY  (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Transports';

-- Dumping data for table mangos.transports: 29 rows
DELETE FROM `transports`;
/*!40000 ALTER TABLE `transports` DISABLE KEYS */;
INSERT INTO `transports` (`entry`, `name`, `period`) VALUES
	(176495, 'Grom\'Gol Base Camp and Undercity', 315032),
	(176310, 'Menethil Harbor and Auberdine', 241778),
	(176244, 'Teldrassil and Auberdine', 309295),
	(176231, 'Menethil Harbor and Theramore Isle', 230162),
	(175080, 'Grom\'Gol Base Camp and Orgrimmar', 248990),
	(164871, 'Orgrimmar and Undercity', 239334),
	(20808, 'Ratchet and Booty Bay', 231236),
	(177233, 'Forgotton Coast and Feathermoon Stronghold', 317040),
	(181646, 'Azuremyst and Auberdine', 238707),
	(190536, 'Stormwind Harbor and Valiance Keep, Borean Tundra ("The Kraken")', 271979),
	(181688, 'Valgarde and Menethil', 445534),
	(181689, 'Undercity and Vengeance Landing', 214579),
	(186238, 'Orgrimmar and Warsong Hold', 302705),
	(186371, 'Stolen Zeppelin', 484212),
	(187568, 'Moa\'ki Harbor Turtle Boat', 445220),
	(187038, 'Pirate boat', 307953),
	(188511, 'Unu\'pe Turtle Boat', 502354),
	(192241, 'Horde gunship patrolling above Icecrown ("Orgrim\'s Hammer")', 1431158),
	(192242, 'Alliance gunship patrolling above Icecrown ("The Skybreaker")', 1051388),
	(190549, 'Orgrimmar and Thunder Bluff', 566000),
	(201812, 'Icecrown_Citadel_Horde_10', 74000),
	(201599, 'Orgrim\'s Hammer', 15000),
	(201581, 'ICC Raid, Orgrim\'s Hammer', 51584),
	(201598, 'The Skybreaker', 23970),
	(201580, 'ICC Raid, The Skybreaker', 77527),
	(201811, 'Icecrown_Citadel_Alliance_10', 74000),
	(195276, 'IOC - Horde Gunship', 115661),
	(195121, 'IOC - Alliance Gunship', 118797),
	(201834, 'Zeppelin, Horde (The Mighty Wind) (Icecrown Raid)', 154573);
/*!40000 ALTER TABLE `transports` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
