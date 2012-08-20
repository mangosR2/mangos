ALTER TABLE db_version CHANGE COLUMN required_12000_01_mangos_spell_template required_12012_01_mangos_spell_template bit;

DELETE FROM spell_template WHERE id IN (23363, 25192);
INSERT INTO spell_template VALUES
(23363, 0x00000000, 101,  21,  76,  18,   0,   0, 179804, 0,     'Summon Drakonid Corpse Trigger'),
(25192, 0x00000000, 101,  21,  76,  18,   0,   0, 180619, 0,     'Summon Ossirian Crystal');


# SD2_2601
UPDATE creature_template SET ScriptName='' WHERE entry=10918;
UPDATE creature_template SET ScriptName='' WHERE entry=7775;
UPDATE creature_template SET ScriptName='' WHERE entry=8612;
UPDATE creature_template SET ScriptName='' WHERE entry=3052;
UPDATE creature_template SET ScriptName='' WHERE entry=19679;
UPDATE creature_template SET ScriptName='' WHERE entry=18266;
UPDATE creature_template SET ScriptName='boss_anzu' WHERE entry=23035;
DELETE FROM scripted_event_id WHERE id=14797;
INSERT INTO scripted_event_id VALUES
(14797,'event_spell_summon_raven_god');
UPDATE creature_template SET ScriptName='npc_eris_havenfire' WHERE entry=14494;
UPDATE creature_template SET ScriptName='npc_squire_rowe' WHERE entry=17804;
