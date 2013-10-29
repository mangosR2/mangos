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

-- Dumping structure for table mangos.exploration_basexp
DROP TABLE IF EXISTS `exploration_basexp`;
CREATE TABLE IF NOT EXISTS `exploration_basexp` (
  `level` tinyint(4) NOT NULL default '0',
  `basexp` mediumint(9) NOT NULL default '0',
  PRIMARY KEY  (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Exploration System';

-- Dumping data for table mangos.exploration_basexp: 80 rows
DELETE FROM `exploration_basexp`;
/*!40000 ALTER TABLE `exploration_basexp` DISABLE KEYS */;
INSERT INTO `exploration_basexp` (`level`, `basexp`) VALUES
	(0, 0),
	(1, 5),
	(10, 85),
	(11, 90),
	(12, 90),
	(13, 90),
	(14, 100),
	(15, 105),
	(16, 115),
	(17, 125),
	(18, 135),
	(19, 145),
	(2, 15),
	(20, 155),
	(21, 165),
	(22, 175),
	(23, 185),
	(24, 195),
	(25, 200),
	(26, 210),
	(27, 220),
	(28, 230),
	(29, 240),
	(3, 25),
	(30, 245),
	(31, 250),
	(32, 255),
	(33, 265),
	(34, 270),
	(35, 275),
	(36, 280),
	(37, 285),
	(38, 285),
	(39, 300),
	(4, 35),
	(40, 315),
	(41, 330),
	(42, 345),
	(43, 360),
	(44, 375),
	(45, 390),
	(46, 405),
	(47, 420),
	(48, 440),
	(49, 455),
	(5, 45),
	(50, 470),
	(51, 490),
	(52, 510),
	(53, 530),
	(54, 540),
	(55, 560),
	(56, 580),
	(57, 600),
	(58, 620),
	(59, 640),
	(6, 55),
	(60, 660),
	(61, 970),
	(62, 1000),
	(63, 1050),
	(64, 1080),
	(65, 1100),
	(66, 1130),
	(67, 1160),
	(68, 1200),
	(69, 1230),
	(7, 65),
	(70, 1250),
	(8, 70),
	(9, 80),
	(71, 1330),
	(72, 1370),
	(73, 1410),
	(74, 1440),
	(75, 1470),
	(76, 1510),
	(77, 1530),
	(78, 1600),
	(79, 1630);
/*!40000 ALTER TABLE `exploration_basexp` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
