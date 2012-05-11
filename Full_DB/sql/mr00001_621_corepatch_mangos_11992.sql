ALTER TABLE db_version CHANGE COLUMN required_11968_01_mangos_creature_linking_template required_11985_01_mangos_gameobject_template_scripts bit;

DROP TABLE IF EXISTS `gameobject_template_scripts`;
CREATE TABLE `gameobject_template_scripts` (
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


# SD2_2546
UPDATE instance_template SET ScriptName='instance_icecrown_citadel' WHERE map=631;
DELETE FROM scripted_event_id WHERE id IN (23426,23438);
INSERT INTO scripted_event_id VALUES
(23426,'event_gameobject_citadel_valve'),
(23438,'event_gameobject_citadel_valve');
UPDATE creature_template SET ScriptName='boss_lord_marrowgar' WHERE entry=36612;
UPDATE creature_template SET ScriptName='boss_lady_deathwhisper' WHERE entry=36855;
UPDATE creature_template SET ScriptName='boss_deathbringer_saurfang' WHERE entry=37813;
UPDATE creature_template SET ScriptName='' WHERE entry=14965;
UPDATE creature_template SET ScriptName='npc_gurubashi_bat_rider' WHERE entry=14750;
DELETE FROM scripted_areatrigger WHERE entry IN (5732);
INSERT INTO scripted_areatrigger VALUES
(5732,'at_icecrown_citadel');
DELETE FROM scripted_areatrigger WHERE entry IN (5709);
INSERT INTO scripted_areatrigger VALUES
(5709,'at_icecrown_citadel');
UPDATE creature_template SET ScriptName='' WHERE entry=15041;
