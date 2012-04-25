-- 11807
ALTER TABLE db_version CHANGE COLUMN required_11785_01_mangos_instance_encounters required_11807_01_mangos_gameobject_addon bit;

DROP TABLE IF EXISTS `gameobject_addon`;
CREATE TABLE `gameobject_addon` (
  `guid` int(10) unsigned NOT NULL default '0',
  `path_rotation0` float NOT NULL default '0',
  `path_rotation1` float NOT NULL default '0',
  `path_rotation2` float NOT NULL default '0',
  `path_rotation3` float NOT NULL default '1',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Gameobject System';

-- 11813
ALTER TABLE db_version CHANGE COLUMN required_11807_01_mangos_gameobject_addon required_11813_01_mangos_mangos_string bit;

DELETE FROM mangos_string WHERE entry IN (707);

INSERT INTO mangos_string VALUES (707,'%s does not wish to be disturbed: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

-- 11827
ALTER TABLE db_version CHANGE COLUMN required_11813_01_mangos_mangos_string required_11827_01_mangos_creature_linking_template bit;
DROP TABLE IF EXISTS creature_linking_template;
CREATE TABLE creature_linking_template (
  entry INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'creature_template.entry of the slave mob that is linked',
  map MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'Id of map of the mobs',
  master_entry INT(10) UNSIGNED NOT NULL COMMENT 'master to trigger events',
  flag MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'flag - describing what should happen when',
  PRIMARY KEY (entry, map)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature Linking System';

-- 11831
ALTER TABLE db_version CHANGE COLUMN required_11827_01_mangos_creature_linking_template required_11831_01_mangos_mangos_string bit;
DELETE FROM mangos_string WHERE entry = 1193;
INSERT INTO mangos_string VALUES (1193,'Gear Score of Player %s is %u.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

ALTER TABLE db_version CHANGE COLUMN required_11831_01_mangos_mangos_string required_11831_02_mangos_command bit;
DELETE FROM command WHERE name = 'gearscore';
INSERT INTO command (name, security, help) VALUES
('gearscore',3,'Syntax: .gearscore [#withBags] [#withBank]\r\n\r\nShow selected player\'s gear score. Check items in bags if #withBags != 0 and check items in Bank if #withBank != 0. Default: 1 for bags and 0 for bank');