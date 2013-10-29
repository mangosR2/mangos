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

-- Dumping structure for table mangos.spell_learn_spell
DROP TABLE IF EXISTS `spell_learn_spell`;
CREATE TABLE IF NOT EXISTS `spell_learn_spell` (
  `entry` smallint(5) unsigned NOT NULL default '0',
  `SpellID` smallint(5) unsigned NOT NULL default '0',
  `Active` tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (`entry`,`SpellID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Item System';

-- Dumping data for table mangos.spell_learn_spell: 22 rows
DELETE FROM `spell_learn_spell`;
/*!40000 ALTER TABLE `spell_learn_spell` DISABLE KEYS */;
INSERT INTO `spell_learn_spell` (`entry`, `SpellID`, `Active`) VALUES
	(264, 3018, 1),
	(265, 3018, 1),
	(266, 3018, 1),
	(33943, 34090, 1),
	(33873, 47180, 0),
	(5011, 3018, 1),
	(33872, 47179, 0),
	(24866, 24864, 0),
	(5784, 33388, 1),
	(17002, 24867, 0),
	(13819, 33388, 1),
	(23161, 33391, 1),
	(23214, 33391, 1),
	(34767, 33391, 1),
	(34769, 33388, 1),
	(53428, 53341, 1),
	(53428, 53343, 1),
	(56815, 56816, 0),
	(58984, 21009, 1),
	(20271, 21084, 1),
	(53407, 21084, 1),
	(53408, 21084, 1);
/*!40000 ALTER TABLE `spell_learn_spell` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
