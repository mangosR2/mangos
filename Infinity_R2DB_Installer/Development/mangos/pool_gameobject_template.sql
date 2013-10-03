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

-- Dumping structure for table mangos.pool_gameobject_template
DROP TABLE IF EXISTS `pool_gameobject_template`;
CREATE TABLE IF NOT EXISTS `pool_gameobject_template` (
  `id` int(10) unsigned NOT NULL default '0',
  `pool_entry` mediumint(8) unsigned NOT NULL default '0',
  `chance` float unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `pool_idx` (`pool_entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Dumping data for table mangos.pool_gameobject_template: 106 rows
DELETE FROM `pool_gameobject_template`;
/*!40000 ALTER TABLE `pool_gameobject_template` DISABLE KEYS */;
INSERT INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES
	(186684, 1132, 0, 'Iron Rune Carving Tools'),
	(187264, 1129, 0, 'Darkspine Ore Chest'),
	(187333, 1130, 0, 'Bloodberry Bush'),
	(171938, 1131, 0, 'Cactus Apple'),
	(185939, 1133, 0, 'Nethermine Cargo'),
	(182139, 1227, 0, 'Feralfen Idol'),
	(164, 1228, 0, 'Scaber Stalk'),
	(333, 1229, 0, 'Ancient Relic'),
	(334, 1230, 0, 'Ancient Relic'),
	(35252, 1231, 0, 'Ancient Relic'),
	(337, 1232, 0, 'Water Pitcher'),
	(1673, 1233, 0, 'Fel Cone'),
	(2724, 1234, 0, 'Sack of Oats'),
	(2912, 1235, 0, 'Ambercor'),
	(2910, 1236, 0, 'Well Stone'),
	(140971, 1241, 0, 'Gahz\'ridian'),
	(183945, 1237, 0, 'Energy Isolation Cube'),
	(186938, 2686, 0, 'Loose Rock'),
	(182265, 13671, 0, 'Bleeding Hollow Supply Crate'),
	(192818, 13672, 0, 'Infused Mushroom'),
	(193610, 13673, 0, 'Underbelly Elixir'),
	(184793, 14135, 0, 'Primitive Chest'),
	(181250, 14136, 0, 'Raw Meat Rack'),
	(181251, 14137, 0, 'Smoked Meat Rack'),
	(181252, 14138, 0, 'Fresh Fish Rack'),
	(182355, 14139, 0, 'Kil\'sorrow Armaments'),
	(191568, 14140, 0, 'K3 Equipment'),
	(157936, 1102, 0, 'Un\'Goro Dirt Pile'),
	(202080, 1104, 0, 'Dart\'s Nest'),
	(202081, 14141, 0, 'Takk\'s Nest'),
	(202083, 14142, 0, 'Razormaw Matriarch\'s Nest'),
	(202082, 14143, 0, 'Ravasaur Matriarch\'s Nest'),
	(181107, 14144, 0, 'Weapon Container'),
	(182069, 14145, 0, 'Mature Spore Sac'),
	(182053, 14146, 0, 'Glowcap'),
	(2712, 14148, 0, 'Calcified Elven Gem'),
	(182941, 14149, 0, 'Grishnath Orb'),
	(187039, 14150, 0, 'Smuggled Mana Cell'),
	(180654, 14151, 0, 'Hardpacked Snowdrift'),
	(187367, 14152, 0, 'Winterfin Clam'),
	(181098, 14153, 0, 'Volcanic Ash'),
	(161527, 14154, 0, 'Dinosaur Bone'),
	(175324, 14174, 0, 'Frostmaul Shards'),
	(194213, 14175, 0, 'Winter Hyacinth'),
	(1610, 14177, 0, 'Incendicite Mineral Vein 1'),
	(2653, 14179, 0, 'Lesser Bloodstone Ore'),
	(1667, 14178, 0, 'Incendicite Mineral Vein 2'),
	(186301, 14344, 0, 'Blackhoof Armaments'),
	(189992, 14345, 0, 'Ruby Acorn'),
	(2846, 14346, 0, 'Tattered Chest'),
	(192676, 14347, 0, 'Emerald Acorn'),
	(182799, 14354, 0, 'Salvageable Wood (A)'),
	(182936, 14355, 0, 'Salvageable Wood (H)'),
	(176213, 14356, 0, 'Blood of Heroes'),
	(185182, 14359, 0, 'Nethervine Crystal'),
	(185915, 14360, 0, 'Netherwing Egg'),
	(185877, 14363, 0, 'Nethercite Deposit'),
	(188164, 14364, 0, 'Kaskala Supplies'),
	(185911, 14365, 0, 'Apexis Shard Formation'),
	(2560, 14366, 0, 'Half-Buried Bottle'),
	(176224, 14367, 0, 'Supply Crate'),
	(153123, 14368, 0, 'Kim\'jael\'s Equipment'),
	(153556, 14369, 0, 'Thaurissan Relic'),
	(184948, 14370, 0, 'Ever-burning Ash'),
	(186591, 14384, 0, 'Spotted Hippogryph Down'),
	(182050, 14407, 0, 'Box of Mushrooms'),
	(182031, 14408, 0, 'Discarded Nutriment'),
	(182256, 14409, 0, 'Discarded Nutriment'),
	(181981, 14410, 0, 'Dragon Bone'),
	(188442, 14412, 0, 'Composite Ore'),
	(188441, 14411, 0, 'Splintered Bone Chunk'),
	(182116, 14413, 0, 'Fulgor Spore'),
	(142189, 14414, 0, 'Inconspicuous Landmark'),
	(17783, 14427, 0, 'Ancient Statuette'),
	(154357, 14452, 0, 'Glinting Mud'),
	(179494, 14453, 0, 'Dented Footlocker'),
	(181283, 14454, 0, 'Emitter Spare Part'),
	(19868, 14455, 0, 'Rocket Car Rubble'),
	(19869, 14456, 0, 'Rocket Car Rubble'),
	(19870, 14457, 0, 'Rocket Car Rubble'),
	(19871, 14458, 0, 'Rocket Car Rubble'),
	(19872, 14459, 0, 'Rocket Car Rubble'),
	(19873, 14460, 0, 'Rocket Car Rubble'),
	(164958, 14461, 0, 'Bloodpetal Sprout'),
	(181665, 14462, 0, 'Burial Chest'),
	(184867, 14468, 0, 'Nether Drake Egg'),
	(195022, 14472, 0, 'Venomhide Egg'),
	(182127, 14482, 0, 'Corrupted Flower'),
	(181696, 14483, 0, 'Hollowed Out Tree'),
	(181697, 14484, 0, 'Pile of Leaves'),
	(3685, 14485, 0, 'Silithid Mound'),
	(180248, 1095, 0, 'School of Tastyfish'),
	(191843, 14498, 0, 'Dried Gnoll Rations'),
	(89635, 14500, 0, 'Sunscorched Shell'),
	(190500, 14501, 0, 'Skyreach Crystal Formation'),
	(190702, 14502, 0, 'Lifeblood Shard'),
	(184906, 14504, 0, 'Power Converter'),
	(184716, 14539, 0, 'Coilskar Chest'),
	(186912, 14587, 0, 'Valgarde Supply Crate'),
	(186729, 14588, 0, 'Mana Berry Bush'),
	(192827, 14589, 0, 'Wild Mustard'),
	(192823, 14590, 0, 'Full Jug of Wine'),
	(192825, 14591, 0, 'Aged Dalaran Limburger'),
	(192824, 14592, 0, 'Half Full Glass of Wine'),
	(192828, 14593, 0, 'Crystalsong Carrot'),
	(191543, 14594, 0, 'Scarlet Onslaught Trunk');
/*!40000 ALTER TABLE `pool_gameobject_template` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
