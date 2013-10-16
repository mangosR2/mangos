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

-- Dumping structure for table mangos.dbscripts_on_creature_death
DROP TABLE IF EXISTS `dbscripts_on_creature_death`;
CREATE TABLE IF NOT EXISTS `dbscripts_on_creature_death` (
  `id` mediumint(8) unsigned NOT NULL default '0',
  `delay` int(10) unsigned NOT NULL default '0',
  `command` mediumint(8) unsigned NOT NULL default '0',
  `datalong` mediumint(8) unsigned NOT NULL default '0',
  `datalong2` int(10) unsigned NOT NULL default '0',
  `buddy_entry` int(10) unsigned NOT NULL default '0',
  `search_radius` int(10) unsigned NOT NULL default '0',
  `data_flags` tinyint(3) unsigned NOT NULL default '0',
  `dataint` int(11) NOT NULL default '0',
  `dataint2` int(11) NOT NULL default '0',
  `dataint3` int(11) NOT NULL default '0',
  `dataint4` int(11) NOT NULL default '0',
  `x` float NOT NULL default '0',
  `y` float NOT NULL default '0',
  `z` float NOT NULL default '0',
  `o` float NOT NULL default '0',
  `comments` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mangos.dbscripts_on_creature_death: 32 rows
DELETE FROM `dbscripts_on_creature_death`;
/*!40000 ALTER TABLE `dbscripts_on_creature_death` DISABLE KEYS */;
INSERT INTO `dbscripts_on_creature_death` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
	(27654, 9, 1, 1, 0, 27658, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Belgaristrasz - emote greet'),
	(27654, 9, 0, 0, 0, 27658, 75, 0, 2000000876, 0, 0, 0, 0, 0, 0, 0, 'Belgaristrasz - say greet'),
	(27654, 6, 3, 0, 0, 27659, 75, 0, 0, 0, 0, 0, 941.93, 1060.08, 359.96, 0, 'Eternos - move out of the cage'),
	(27654, 6, 3, 0, 0, 27657, 75, 0, 0, 0, 0, 0, 948.57, 1032.11, 359.96, 0, 'Verdisa - move out of the cage'),
	(27654, 6, 3, 0, 0, 27658, 75, 0, 0, 0, 0, 0, 939.73, 1044.25, 359.96, 0, 'Belgaristrasz - move out of the cage'),
	(27656, 0, 10, 28012, 180000, 0, 0, 0, 0, 0, 0, 0, 1022.39, 1051.51, 605.62, 0.07, 'Summon Image of Belgaristrasz'),
	(27447, 5, 1, 1, 0, 28012, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Image of Belgaristrasz - emote after Varos'),
	(27447, 5, 0, 0, 0, 28012, 75, 0, 2000000878, 0, 0, 0, 0, 0, 0, 0, 'Image of Belgaristrasz - say after Varos'),
	(27447, 1, 15, 12980, 0, 28012, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Image of Belgaristrasz - cast teleport visual'),
	(27655, 5, 1, 1, 0, 28012, 75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Image of Belgaristrasz - emote after Urom'),
	(27655, 5, 0, 0, 0, 28012, 75, 0, 2000000879, 0, 0, 0, 0, 0, 0, 0, 'Image of Belgaristrasz - say after Urom'),
	(27655, 1, 15, 12980, 0, 28012, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Image of Belgaristrasz - cast teleport visual'),
	(27654, 17, 0, 6, 0, 27447, 360, 0, 2000000877, 0, 0, 0, 0, 0, 0, 0, 'Varos - yell intro, map wide'),
	(27654, 17, 16, 13648, 8, 27447, 360, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Varos - yell intro sound, map wide'),
	(27656, 1, 15, 12980, 0, 28012, 360, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Image of Belgaristrasz - cast teleport visual'),
	(20427, 0, 0, 0, 0, 21332, 100, 32, 2000000965, 0, 0, 0, 0, 0, 0, 0, 'say veneratus epilogue 1'),
	(20427, 3, 0, 0, 0, 21332, 100, 32, 2000000966, 0, 0, 0, 0, 0, 0, 0, 'say veneratus epilogue 2'),
	(20427, 5, 15, 36781, 0, 21332, 100, 32, 0, 0, 0, 0, 0, 0, 0, 0, 'cast Despawn Spirit Hunter'),
	(20427, 6, 14, 36620, 0, 0, 0, 6, 0, 0, 0, 0, 0, 0, 0, 0, 'remove Spirit Hunter aura'),
	(20427, 6, 18, 0, 0, 21332, 100, 32, 0, 0, 0, 0, 0, 0, 0, 0, 'despawn spirit hunter'),
	(33113, 0, 10, 34145, 0, 0, 0, 0, 0, 0, 0, 0, 162.208, -43.5786, 409.887, 6.254, 'spawn Expedition Engineer'),
	(33113, 0, 10, 34145, 0, 0, 0, 0, 0, 0, 0, 0, 166.747, -43.444, 409.887, 6.213, 'spawn Expedition Engineer'),
	(33113, 0, 10, 34145, 0, 0, 0, 0, 0, 0, 0, 0, 172.051, -43.6818, 410.154, 6.196, 'spawn Expedition Engineer'),
	(33113, 0, 10, 34145, 0, 0, 0, 0, 0, 0, 0, 0, 162.818, -28.7818, 409.887, 0.079, 'spawn Expedition Engineer'),
	(33113, 0, 10, 34145, 0, 0, 0, 0, 0, 0, 0, 0, 167.357, -28.6481, 409.887, 0.069, 'spawn Expedition Engineer'),
	(33113, 0, 10, 34145, 0, 0, 0, 0, 0, 0, 0, 0, 172.661, -28.886, 409.887, 0.147, 'spawn Expedition Engineer'),
	(33113, 0, 10, 34144, 0, 0, 0, 0, 0, 0, 0, 0, 162.703, -49.8037, 409.887, 6.263, 'spawn Expedition Mercenary'),
	(33113, 0, 10, 34144, 0, 0, 0, 0, 0, 0, 0, 0, 166.494, -49.8494, 409.887, 6.268, 'spawn Expedition Mercenary'),
	(33113, 0, 10, 34144, 0, 0, 0, 0, 0, 0, 0, 0, 171.773, -50.0509, 409.887, 0, 'spawn Expedition Mercenary'),
	(33113, 0, 10, 34144, 0, 0, 0, 0, 0, 0, 0, 0, 163.422, -36.5537, 409.887, 0.174, 'spawn Expedition Mercenary'),
	(33113, 0, 10, 34144, 0, 0, 0, 0, 0, 0, 0, 0, 167.213, -36.5988, 409.887, 0.174, 'spawn Expedition Mercenary'),
	(33113, 0, 10, 34144, 0, 0, 0, 0, 0, 0, 0, 0, 172.491, -36.8002, 409.887, 0.225, 'spawn Expedition Mercenary');
/*!40000 ALTER TABLE `dbscripts_on_creature_death` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
