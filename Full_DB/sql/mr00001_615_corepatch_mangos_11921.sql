ALTER TABLE db_version CHANGE COLUMN required_11876_01_mangos_creature_linking_template required_11885_01_mangos_spell_proc_event bit;

DELETE FROM spell_proc_event WHERE entry=72413;
INSERT INTO spell_proc_event VALUES (72413, 0x00,  0, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0.000000, 20.000000, 60);


# SD2_2448
UPDATE creature_template SET ScriptName='boss_shirrak' WHERE entry=18371;
UPDATE creature_template SET ScriptName='npc_void_traveler' WHERE entry=19226;
UPDATE creature_template SET ScriptName='boss_brundir' WHERE entry=32857;
UPDATE creature_template SET ScriptName='boss_molgeim' WHERE entry=32927;
UPDATE creature_template SET ScriptName='boss_steelbreaker' WHERE entry=32867;
UPDATE creature_template SET ScriptName='npc_hive_zara_larva' WHERE entry=15555;
UPDATE creature_template SET ScriptName='boss_buru' WHERE entry=15370;
UPDATE creature_template SET ScriptName='npc_buru_egg' WHERE entry=15514;
UPDATE creature_template SET ScriptName='npc_melizza_brimbuzzle' WHERE entry=12277;
