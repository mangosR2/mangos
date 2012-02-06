ALTER TABLE db_version CHANGE COLUMN required_11831_02_mangos_command required_11851_01_mangos_string bit;

DELETE FROM mangos_string WHERE entry=816;
INSERT INTO mangos_string VALUES
(816,'Your body is too exhausted to travel to the Spectral Realm.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

ALTER TABLE db_version CHANGE COLUMN required_11851_01_mangos_string required_11852_01_mangos_gossip_menu bit;

-- Add collumn `script_id` to table `gossip_menu`
ALTER TABLE gossip_menu ADD COLUMN script_id
 mediumint(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'script in `gossip_scripts` - will be executed on GossipHello'
 AFTER text_id;

ALTER TABLE gossip_menu
 DROP PRIMARY KEY,
 ADD PRIMARY KEY (entry, text_id, script_id);


# SD2_2358
UPDATE creature_template SET ScriptName='' WHERE entry IN (7885,7886,12204,12205);
UPDATE creature_template SET ScriptName='boss_kiljaeden' WHERE entry=25315;
UPDATE gameobject_template SET ScriptName='' WHERE entry=187055;
UPDATE creature_template SET ScriptName='boss_ossirian' WHERE entry=15339;
UPDATE gameobject_template SET ScriptName='go_ossirian_crystal' WHERE entry=180619;
