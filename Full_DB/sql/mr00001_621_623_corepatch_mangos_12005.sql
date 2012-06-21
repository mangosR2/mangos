ALTER TABLE db_version CHANGE COLUMN required_11994_01_mangos_creature_linking required_12000_01_mangos_spell_template bit;

DROP TABLE IF EXISTS `spell_template`;
CREATE TABLE `spell_template` (
  `id` int(11) unsigned NOT NULL DEFAULT '0',
  `proc_flags` int(11) unsigned NOT NULL DEFAULT '0',
  `proc_chance` int(11) unsigned NOT NULL DEFAULT '0',
  `duration_index` int(11) unsigned NOT NULL DEFAULT '0',
  `effect0` int(11) unsigned NOT NULL DEFAULT '0',
  `effect0_implicit_target_a` int(11) unsigned NOT NULL DEFAULT '0',
  `effect0_radius_idx` int(11) unsigned NOT NULL DEFAULT '0',
  `effect0_apply_aura_name` int(11) unsigned NOT NULL DEFAULT '0',
  `effect0_misc_value` int(11) unsigned NOT NULL DEFAULT '0',
  `effect0_trigger_spell` int(11) unsigned NOT NULL DEFAULT '0',
  `comments` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='MaNGOS server side spells';

INSERT INTO spell_template VALUES
-- ID   proc_flags chnce dur  ef0 tarA0 rad  aur  misc    trigger
(21387, 0x00000028,  15,  21,   6,   1,   0,  42, 0,      21388, 'Melt-Weapon trigger aura related used by Ragnaros'),
(62388, 0x00000000, 101,  21,   6,   1,   0,   4, 0,      0,     'Aura required for Demonic Circle 48020');


# SD2_2586
DELETE FROM scripted_event_id WHERE id=20651;
INSERT INTO scripted_event_id VALUES
(20651,'event_achiev_kings_bane');
UPDATE creature_template SET ScriptName='npc_gortok_subboss' WHERE entry IN (26683,26684,26685,26686);
DELETE FROM scripted_event_id WHERE id IN (17728);
INSERT INTO scripted_event_id VALUES
(17728,'event_spell_gortok_event');
UPDATE creature_template SET ScriptName='boss_drakkari_colossus' WHERE entry=29307;
UPDATE creature_template SET ScriptName='boss_drakkari_elemental' WHERE entry=29573;
UPDATE creature_template SET ScriptName='npc_living_mojo' WHERE entry=29830;
UPDATE creature_template SET ScriptName='boss_amanitar' WHERE entry=30258;
UPDATE creature_template SET ScriptName='npc_amanitar_mushroom' WHERE entry IN (30391,30435);
UPDATE creature_template SET ScriptName='' WHERE entry=8879;
UPDATE creature_template SET ScriptName='' WHERE entry=1855;
UPDATE creature_template SET ScriptName='npc_twilight_volunteer' WHERE entry=30385;
UPDATE creature_template SET ScriptName='' WHERE entry IN (21104,17839,21697,21698);
UPDATE creature_template SET ScriptName='npc_prison_event_controller' WHERE entry=30883;
UPDATE creature_template SET ScriptName='npc_erekem_guard' WHERE entry=29395;
