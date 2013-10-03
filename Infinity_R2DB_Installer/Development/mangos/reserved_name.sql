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

-- Dumping structure for table mangos.reserved_name
DROP TABLE IF EXISTS `reserved_name`;
CREATE TABLE IF NOT EXISTS `reserved_name` (
  `name` varchar(12) NOT NULL default '',
  PRIMARY KEY  (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Player Reserved Names';

-- Dumping data for table mangos.reserved_name: 35 rows
DELETE FROM `reserved_name`;
/*!40000 ALTER TABLE `reserved_name` DISABLE KEYS */;
INSERT INTO `reserved_name` (`name`) VALUES
	('Bla'),
	('Bly'),
	('Blya'),
	('Cuka'),
	('Cuko'),
	('Cvolach'),
	('Cvoloch'),
	('Cyka'),
	('Cyko'),
	('Debil'),
	('Durak'),
	('Eblan'),
	('Ebuch'),
	('Ebun'),
	('Huy'),
	('Hyu'),
	('Idiot'),
	('Loh'),
	('Lox'),
	('Mudagg'),
	('Pezda'),
	('Pezdec'),
	('Pizda'),
	('Pizdec'),
	('Pizdun'),
	('Stsuko'),
	('Suka'),
	('Suko'),
	('Svolach'),
	('Svoloch'),
	('Syka'),
	('Syko'),
	('Xujwam'),
	('Xuy'),
	('Xyu');
/*!40000 ALTER TABLE `reserved_name` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
