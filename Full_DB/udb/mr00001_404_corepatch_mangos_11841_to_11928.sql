-- 11851
ALTER TABLE db_version CHANGE COLUMN required_11831_02_mangos_command required_11851_01_mangos_string bit;

DELETE FROM mangos_string WHERE entry=816;
INSERT INTO mangos_string VALUES
(816,'Your body is too exhausted to travel to the Spectral Realm.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

-- 11852
ALTER TABLE db_version CHANGE COLUMN required_11851_01_mangos_string required_11852_01_mangos_gossip_menu bit;

-- Add collumn `script_id` to table `gossip_menu`
ALTER TABLE gossip_menu ADD COLUMN script_id
 mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'script in `gossip_scripts` - will be executed on GossipHello'
 AFTER text_id;

ALTER TABLE gossip_menu
 DROP PRIMARY KEY,
 ADD PRIMARY KEY (entry, text_id, script_id);

 -- 11876
 ALTER TABLE db_version CHANGE COLUMN required_11852_01_mangos_gossip_menu required_11876_01_mangos_creature_linking_template bit;

ALTER TABLE creature_linking_template CHANGE COLUMN entry entry mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'creature_template.entry of the slave mob that is linked';
ALTER TABLE creature_linking_template CHANGE COLUMN map map SMALLINT(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Id of map of the mobs';
ALTER TABLE creature_linking_template CHANGE COLUMN master_entry master_entry mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'master to trigger events';
ALTER TABLE creature_linking_template CHANGE COLUMN flag flag mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'flag - describing what should happen when';

-- 11885
ALTER TABLE db_version CHANGE COLUMN required_11876_01_mangos_creature_linking_template required_11885_01_mangos_spell_proc_event bit;

DELETE FROM spell_proc_event WHERE entry=72413;
INSERT INTO spell_proc_event VALUES (72413, 0x00,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 20.000000, 60);

-- 11926
ALTER TABLE db_version CHANGE COLUMN required_11885_01_mangos_spell_proc_event required_11926_01_mangos_creature_template bit;

UPDATE creature_template SET InhabitType=7 WHERE entry=1;