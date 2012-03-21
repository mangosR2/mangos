ALTER TABLE db_version CHANGE COLUMN required_11885_01_mangos_spell_proc_event required_11926_01_mangos_creature_template bit;

UPDATE creature_template SET InhabitType=7 WHERE entry=1;


# SD2_2478
UPDATE creature_template SET ScriptName='npc_apothecary_hummel' WHERE entry=36296;
UPDATE creature_template SET ScriptName='npc_valentine_boss_manager' WHERE entry=36643;
UPDATE gameobject_template SET ScriptName='go_stratholme_postbox' WHERE entry IN (176346,176349,176350,176351,176352,176353);
UPDATE creature_template SET ScriptName='npc_volcor' WHERE entry=3692;
UPDATE gameobject_template SET ScriptName='' WHERE entry=169294;
