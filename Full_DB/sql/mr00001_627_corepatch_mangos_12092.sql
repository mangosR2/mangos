ALTER TABLE db_version CHANGE COLUMN required_12012_01_mangos_spell_template required_12087_01_mangos_mangos_string bit;

UPDATE mangos_string SET content_default='This item(s) has problems with equipping/storing to inventory.' WHERE entry=706;
UPDATE mangos_string SET content_default='Arenas are set to 1v1 for debugging. You cannot join as a group.' WHERE entry=737;
UPDATE mangos_string SET content_default='Account name cannot be longer than 16 characters (client limit), account not created!' WHERE entry=1005;
UPDATE mangos_string SET content_default='Can only quit from a Remote Admin console or the quit command was not entered in full (quit).' WHERE entry=1015;
UPDATE mangos_string SET content_default='ERROR: You can only assign a new name for a single selected character!' WHERE entry=1022;
UPDATE mangos_string SET content_default='Character \'%s\' (GUID: %u Account %u) can\'t be restored: account doesn\'t exist!' WHERE entry=1023;
UPDATE mangos_string SET content_default='Character \'%s\' (GUID: %u Account %u) can\'t be restored: name already in use!' WHERE entry=1025;
UPDATE mangos_string SET content_default='Command can only be called from a Remote Admin console.' WHERE entry=1029;
UPDATE mangos_string SET content_default='Account %s (Id: %u) has been granted %u expansion rights.' WHERE entry=1100;
UPDATE mangos_string SET content_default='Cannot add spawn because no free guids for static spawn in reserved guids range. Server restart is required before command can be used. Also look GuidReserveSize.* config options.' WHERE entry=1503;

ALTER TABLE db_version CHANGE COLUMN required_12087_01_mangos_mangos_string required_12087_02_mangos_command bit;

UPDATE command SET help='Syntax: .honor addkill\r\n\r\nAdd the targeted unit as one of your pvp kills today (you only get honor if it\'s a racial leader or a player)' WHERE name LIKE 'honor addkill';

ALTER TABLE db_version CHANGE COLUMN required_12087_02_mangos_command required_12091_01_mangos_spell_template bit;

DELETE FROM spell_template WHERE id IN (26133);
INSERT INTO spell_template VALUES
(26133, 0x00000000, 101,  21,  76,  18,   0,   0, 180795, 0,     'Summon Sandworm Base');


# SD2_2667
UPDATE creature_template SET ScriptName='boss_attumen' WHERE entry IN (16152);
UPDATE gameobject_template SET ScriptName='' WHERE entry=13873;
UPDATE gameobject_template SET ScriptName='' WHERE entry=181956;
UPDATE gameobject_template SET ScriptName='' WHERE entry=178145;
UPDATE gameobject_template SET ScriptName='' WHERE entry=175944;
UPDATE gameobject_template SET ScriptName='' WHERE entry=182024;
UPDATE gameobject_template SET ScriptName='' WHERE entry=176581;
UPDATE creature_template SET ScriptName='npc_grark_lorkrub' WHERE entry=9520;
UPDATE creature_template SET ScriptName ='npc_marshal_windsor' WHERE entry=9023;
UPDATE creature_template SET ScriptName ='npc_dughal_stormwing' WHERE entry=9022;
UPDATE creature_template SET ScriptName ='npc_tobias_seecher' WHERE entry=9679;
UPDATE creature_template SET ScriptName='' WHERE entry=11956;
UPDATE creature_template SET ScriptName='' WHERE entry=11798;
UPDATE creature_template SET ScriptName='' WHERE entry=11800;
UPDATE creature_template SET ScriptName='' WHERE entry=4489;
UPDATE creature_template SET ScriptName='' WHERE entry IN (9528,9529);
UPDATE creature_template SET ScriptName='' WHERE entry=12944;
UPDATE creature_template SET ScriptName='' WHERE entry=11872;
UPDATE creature_template SET ScriptName='npc_ouro_spawner' WHERE entry=15957;
DELETE FROM scripted_areatrigger WHERE entry IN (4033,4034);
INSERT INTO scripted_areatrigger VALUES
(4033,'at_stomach_cthun'),
(4034,'at_stomach_cthun');
UPDATE creature_template SET ScriptName='' WHERE entry=9037;
UPDATE creature_template SET ScriptName='boss_dalliah' WHERE entry=20885;
UPDATE creature_template SET ScriptName='boss_soccothrates' WHERE entry=20886;
