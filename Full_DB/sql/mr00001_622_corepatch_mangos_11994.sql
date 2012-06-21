ALTER TABLE db_version CHANGE COLUMN required_11985_01_mangos_gameobject_template_scripts required_11994_01_mangos_creature_linking bit;

--
-- Table structure for table `creature_linking`
--

DROP TABLE IF EXISTS creature_linking;
CREATE TABLE `creature_linking` (
  `guid` int(10) UNSIGNED NOT NULL COMMENT 'creature.guid of the slave mob that is linked',
  `master_guid` int(10) UNSIGNED NOT NULL COMMENT 'master to trigger events',
  `flag` mediumint(8) UNSIGNED NOT NULL COMMENT 'flag - describing what should happen when',
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Creature Linking System';


# SD2_2567
UPDATE creature_template SET ScriptName='' WHERE entry=18725;
UPDATE creature_template SET ScriptName='' WHERE entry=26443;
UPDATE creature_template SET ScriptName='' WHERE entry=26949;
UPDATE creature_template SET ScriptName='' WHERE entry=27575;
UPDATE creature_template SET ScriptName='' WHERE entry=20903;
UPDATE creature_template SET ScriptName='' WHERE entry=22112;
UPDATE instance_template SET ScriptName='instance_ruby_sanctum' WHERE map=724;
UPDATE creature_template SET ScriptName='boss_baltharus' WHERE entry=39751;
UPDATE creature_template SET ScriptName='boss_saviana' WHERE entry=39747;
UPDATE creature_template SET ScriptName='boss_zarithrian' WHERE entry=39746;
UPDATE creature_template SET ScriptName='' WHERE entry=23998;
UPDATE creature_template SET ScriptName='' WHERE entry=23778;
UPDATE creature_template SET ScriptName='' WHERE entry=23859;
UPDATE creature_template SET ScriptName='boss_viscidus' WHERE entry=15299;
DELETE FROM scripted_areatrigger WHERE entry in (4288,4485);
INSERT INTO scripted_areatrigger VALUES
(4288,'at_dark_portal'),
(4485,'at_dark_portal');
UPDATE creature_template SET ScriptName='npc_medivh_black_morass' WHERE entry=15608;
UPDATE creature_template SET ScriptName='npc_time_rift_channeler' WHERE entry IN (21104,17839,21697,21698);
UPDATE creature_template SET ScriptName='' WHERE entry IN (24848);
DELETE FROM scripted_event_id WHERE id=16547;
INSERT INTO scripted_event_id VALUES
(16547,'event_go_scrying_orb');
UPDATE creature_template SET ScriptName='' WHERE entry IN (21466,21467);
UPDATE creature_template SET ScriptName='' WHERE entry=23489;
UPDATE creature_template SET ScriptName='' WHERE entry IN (23483,23484);
UPDATE creature_template SET ScriptName='' WHERE entry IN (17900,17901);
UPDATE creature_template SET ScriptName='' WHERE entry=34885;
