ALTER TABLE db_version CHANGE COLUMN required_11926_01_mangos_creature_template required_11940_01_mangos_creature_movement_scripts bit;


ALTER TABLE creature_movement_scripts ADD COLUMN temp MEDIUMINT(8) DEFAULT 0 AFTER command;

-- Move datalong4 -> 2, 3 -> 4, 2 -> 3 (right shift)
UPDATE creature_movement_scripts SET temp=datalong4 WHERE command IN (0, 1, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29);
UPDATE creature_movement_scripts SET datalong4=datalong3, datalong3=datalong2, datalong2=temp WHERE command IN (0, 1, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29);

ALTER TABLE creature_movement_scripts CHANGE COLUMN datalong3 buddy_entry MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE creature_movement_scripts CHANGE COLUMN datalong4 search_radius MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';

UPDATE creature_movement_scripts SET temp=0;

/* Chat*/
UPDATE creature_movement_scripts SET temp=temp | 0x04 WHERE command=0 AND (data_flags & 0x02) > 0; -- target self
UPDATE creature_movement_scripts SET temp=temp | 0x01 WHERE command=0 AND (data_flags & 0x04) > 0; -- buddy as target
UPDATE creature_movement_scripts SET temp=temp | 0x10 WHERE command=0 AND (data_flags & 0x01) > 0; -- will produce error
-- Note that old flag 0x01 // flag_target_player_as_source     0x01 could not be converted automatically, need to check every script

/* Emote*/
UPDATE creature_movement_scripts SET temp=temp | 0x02 WHERE command=1 AND (data_flags & 0x01 > 0) AND buddy_entry = 0; -- reverse order if no buddy defined
/*Summon */
UPDATE creature_movement_scripts SET temp=temp | 0x08 WHERE command=10 AND (data_flags & 0x01 > 0); -- Summon as active
/* Remove Aura */
UPDATE creature_movement_scripts SET temp=0x02 WHERE command=14 AND datalong2=1;
UPDATE creature_movement_scripts SET datalong2=0 WHERE command=14;
/* Cast */
UPDATE creature_movement_scripts SET temp=temp | 0x08 WHERE command=15 AND (datalong2 & 0x04 > 0); -- cast triggered
UPDATE creature_movement_scripts SET temp=temp | 0x04 WHERE command=15 AND datalong2=0x01; -- s->t
UPDATE creature_movement_scripts SET temp=temp | 0x06 WHERE command=15 AND datalong2=0x02; -- t->t
UPDATE creature_movement_scripts SET temp=temp | 0x02 WHERE command=15 AND datalong2=0x03; -- t->s
UPDATE creature_movement_scripts SET datalong2=0 WHERE command=15;
/* change faction */
UPDATE creature_movement_scripts SET datalong2=data_flags WHERE command=22;
/* morph/ mount */
UPDATE creature_movement_scripts SET temp=temp | 0x08 WHERE command IN (23, 24) AND (data_flags & 0x01 > 0); -- Summon as active
/* attack start */
UPDATE creature_movement_scripts SET temp=temp | 0x03 WHERE command=26 AND data_flags=0x02; -- b->s
UPDATE creature_movement_scripts SET temp=temp | 0x01 WHERE command=26 AND data_flags=0x04 AND buddy_entry!=0; -- s->b/t
UPDATE creature_movement_scripts SET temp=temp | 0x14 WHERE command=26 AND data_flags=0x06 AND buddy_entry!=0; -- s->s -- Throw error, this would be unreasonable if buddy defined
UPDATE creature_movement_scripts SET temp=temp | 0x04 WHERE command=26 AND data_flags=0x06 AND buddy_entry=0; -- s->s
/* stand state */
UPDATE creature_movement_scripts SET temp=temp | 0x02 WHERE command=28 AND (data_flags & 0x01 > 0) AND buddy_entry=0;
/* change npc flag */
UPDATE creature_movement_scripts SET datalong2=data_flags WHERE command=29;

UPDATE creature_movement_scripts SET data_flags=temp;

ALTER TABLE creature_movement_scripts DROP COLUMN temp;

ALTER TABLE db_version CHANGE COLUMN required_11940_01_mangos_creature_movement_scripts required_11940_02_mangos_event_scripts bit;


ALTER TABLE event_scripts ADD COLUMN temp MEDIUMINT(8) DEFAULT 0 AFTER command;

-- Move datalong4 -> 2, 3 -> 4, 2 -> 3 (right shift)
UPDATE event_scripts SET temp=datalong4 WHERE command IN (0, 1, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29);
UPDATE event_scripts SET datalong4=datalong3, datalong3=datalong2, datalong2=temp WHERE command IN (0, 1, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29);

ALTER TABLE event_scripts CHANGE COLUMN datalong3 buddy_entry MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE event_scripts CHANGE COLUMN datalong4 search_radius MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';

UPDATE event_scripts SET temp=0;

/* Chat*/
UPDATE event_scripts SET temp=temp | 0x04 WHERE command=0 AND (data_flags & 0x02) > 0; -- target self
UPDATE event_scripts SET temp=temp | 0x01 WHERE command=0 AND (data_flags & 0x04) > 0; -- buddy as target
UPDATE event_scripts SET temp=temp | 0x10 WHERE command=0 AND (data_flags & 0x01) > 0; -- will produce error
-- Note that old flag 0x01 // flag_target_player_as_source     0x01 could not be converted automatically, need to check every script

/* Emote*/
UPDATE event_scripts SET temp=temp | 0x02 WHERE command=1 AND (data_flags & 0x01 > 0) AND buddy_entry = 0; -- reverse order if no buddy defined
/*Summon */
UPDATE event_scripts SET temp=temp | 0x08 WHERE command=10 AND (data_flags & 0x01 > 0); -- Summon as active
/* Remove Aura */
UPDATE event_scripts SET temp=0x02 WHERE command=14 AND datalong2=1;
UPDATE event_scripts SET datalong2=0 WHERE command=14;
/* Cast */
UPDATE event_scripts SET temp=temp | 0x08 WHERE command=15 AND (datalong2 & 0x04 > 0); -- cast triggered
UPDATE event_scripts SET temp=temp | 0x04 WHERE command=15 AND datalong2=0x01; -- s->t
UPDATE event_scripts SET temp=temp | 0x06 WHERE command=15 AND datalong2=0x02; -- t->t
UPDATE event_scripts SET temp=temp | 0x02 WHERE command=15 AND datalong2=0x03; -- t->s
UPDATE event_scripts SET datalong2=0 WHERE command=15;
/* change faction */
UPDATE event_scripts SET datalong2=data_flags WHERE command=22;
/* morph/ mount */
UPDATE event_scripts SET temp=temp | 0x08 WHERE command IN (23, 24) AND (data_flags & 0x01 > 0); -- Summon as active
/* attack start */
UPDATE event_scripts SET temp=temp | 0x03 WHERE command=26 AND data_flags=0x02; -- b->s
UPDATE event_scripts SET temp=temp | 0x01 WHERE command=26 AND data_flags=0x04 AND buddy_entry!=0; -- s->b/t
UPDATE event_scripts SET temp=temp | 0x14 WHERE command=26 AND data_flags=0x06 AND buddy_entry!=0; -- s->s -- Throw error, this would be unreasonable if buddy defined
UPDATE event_scripts SET temp=temp | 0x04 WHERE command=26 AND data_flags=0x06 AND buddy_entry=0; -- s->s
/* stand state */
UPDATE event_scripts SET temp=temp | 0x02 WHERE command=28 AND (data_flags & 0x01 > 0) AND buddy_entry=0;
/* change npc flag */
UPDATE event_scripts SET datalong2=data_flags WHERE command=29;

UPDATE event_scripts SET data_flags=temp;

ALTER TABLE event_scripts DROP COLUMN temp;

ALTER TABLE db_version CHANGE COLUMN required_11940_02_mangos_event_scripts required_11940_03_mangos_gameobject_scripts bit;


ALTER TABLE gameobject_scripts ADD COLUMN temp MEDIUMINT(8) DEFAULT 0 AFTER command;

-- Move datalong4 -> 2, 3 -> 4, 2 -> 3 (right shift)
UPDATE gameobject_scripts SET temp=datalong4 WHERE command IN (0, 1, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29);
UPDATE gameobject_scripts SET datalong4=datalong3, datalong3=datalong2, datalong2=temp WHERE command IN (0, 1, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29);

ALTER TABLE gameobject_scripts CHANGE COLUMN datalong3 buddy_entry MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE gameobject_scripts CHANGE COLUMN datalong4 search_radius MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';

UPDATE gameobject_scripts SET temp=0;

/* Chat*/
UPDATE gameobject_scripts SET temp=temp | 0x04 WHERE command=0 AND (data_flags & 0x02) > 0; -- target self
UPDATE gameobject_scripts SET temp=temp | 0x01 WHERE command=0 AND (data_flags & 0x04) > 0; -- buddy as target
UPDATE gameobject_scripts SET temp=temp | 0x10 WHERE command=0 AND (data_flags & 0x01) > 0; -- will produce error
-- Note that old flag 0x01 // flag_target_player_as_source     0x01 could not be converted automatically, need to check every script

/* Emote*/
UPDATE gameobject_scripts SET temp=temp | 0x02 WHERE command=1 AND (data_flags & 0x01 > 0) AND buddy_entry = 0; -- reverse order if no buddy defined
/*Summon */
UPDATE gameobject_scripts SET temp=temp | 0x08 WHERE command=10 AND (data_flags & 0x01 > 0); -- Summon as active
/* Remove Aura */
UPDATE gameobject_scripts SET temp=0x02 WHERE command=14 AND datalong2=1;
UPDATE gameobject_scripts SET datalong2=0 WHERE command=14;
/* Cast */
UPDATE gameobject_scripts SET temp=temp | 0x08 WHERE command=15 AND (datalong2 & 0x04 > 0); -- cast triggered
UPDATE gameobject_scripts SET temp=temp | 0x04 WHERE command=15 AND datalong2=0x01; -- s->t
UPDATE gameobject_scripts SET temp=temp | 0x06 WHERE command=15 AND datalong2=0x02; -- t->t
UPDATE gameobject_scripts SET temp=temp | 0x02 WHERE command=15 AND datalong2=0x03; -- t->s
UPDATE gameobject_scripts SET datalong2=0 WHERE command=15;
/* change faction */
UPDATE gameobject_scripts SET datalong2=data_flags WHERE command=22;
/* morph/ mount */
UPDATE gameobject_scripts SET temp=temp | 0x08 WHERE command IN (23, 24) AND (data_flags & 0x01 > 0); -- Summon as active
/* attack start */
UPDATE gameobject_scripts SET temp=temp | 0x03 WHERE command=26 AND data_flags=0x02; -- b->s
UPDATE gameobject_scripts SET temp=temp | 0x01 WHERE command=26 AND data_flags=0x04 AND buddy_entry!=0; -- s->b/t
UPDATE gameobject_scripts SET temp=temp | 0x14 WHERE command=26 AND data_flags=0x06 AND buddy_entry!=0; -- s->s -- Throw error, this would be unreasonable if buddy defined
UPDATE gameobject_scripts SET temp=temp | 0x04 WHERE command=26 AND data_flags=0x06 AND buddy_entry=0; -- s->s
/* stand state */
UPDATE gameobject_scripts SET temp=temp | 0x02 WHERE command=28 AND (data_flags & 0x01 > 0) AND buddy_entry=0;
/* change npc flag */
UPDATE gameobject_scripts SET datalong2=data_flags WHERE command=29;

UPDATE gameobject_scripts SET data_flags=temp;

ALTER TABLE gameobject_scripts DROP COLUMN temp;

ALTER TABLE db_version CHANGE COLUMN required_11940_03_mangos_gameobject_scripts required_11940_04_mangos_gossip_scripts bit;


ALTER TABLE gossip_scripts ADD COLUMN temp MEDIUMINT(8) DEFAULT 0 AFTER command;

-- Move datalong4 -> 2, 3 -> 4, 2 -> 3 (right shift)
UPDATE gossip_scripts SET temp=datalong4 WHERE command IN (0, 1, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29);
UPDATE gossip_scripts SET datalong4=datalong3, datalong3=datalong2, datalong2=temp WHERE command IN (0, 1, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29);

ALTER TABLE gossip_scripts CHANGE COLUMN datalong3 buddy_entry MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE gossip_scripts CHANGE COLUMN datalong4 search_radius MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';

UPDATE gossip_scripts SET temp=0;

/* Chat*/
UPDATE gossip_scripts SET temp=temp | 0x04 WHERE command=0 AND (data_flags & 0x02) > 0; -- target self
UPDATE gossip_scripts SET temp=temp | 0x01 WHERE command=0 AND (data_flags & 0x04) > 0; -- buddy as target
UPDATE gossip_scripts SET temp=temp | 0x10 WHERE command=0 AND (data_flags & 0x01) > 0; -- will produce error
-- Note that old flag 0x01 // flag_target_player_as_source     0x01 could not be converted automatically, need to check every script

/* Emote*/
UPDATE gossip_scripts SET temp=temp | 0x02 WHERE command=1 AND (data_flags & 0x01 > 0) AND buddy_entry = 0; -- reverse order if no buddy defined
/*Summon */
UPDATE gossip_scripts SET temp=temp | 0x08 WHERE command=10 AND (data_flags & 0x01 > 0); -- Summon as active
/* Remove Aura */
UPDATE gossip_scripts SET temp=0x02 WHERE command=14 AND datalong2=1;
UPDATE gossip_scripts SET datalong2=0 WHERE command=14;
/* Cast */
UPDATE gossip_scripts SET temp=temp | 0x08 WHERE command=15 AND (datalong2 & 0x04 > 0); -- cast triggered
UPDATE gossip_scripts SET temp=temp | 0x04 WHERE command=15 AND datalong2=0x01; -- s->t
UPDATE gossip_scripts SET temp=temp | 0x06 WHERE command=15 AND datalong2=0x02; -- t->t
UPDATE gossip_scripts SET temp=temp | 0x02 WHERE command=15 AND datalong2=0x03; -- t->s
UPDATE gossip_scripts SET datalong2=0 WHERE command=15;
/* change faction */
UPDATE gossip_scripts SET datalong2=data_flags WHERE command=22;
/* morph/ mount */
UPDATE gossip_scripts SET temp=temp | 0x08 WHERE command IN (23, 24) AND (data_flags & 0x01 > 0); -- Summon as active
/* attack start */
UPDATE gossip_scripts SET temp=temp | 0x03 WHERE command=26 AND data_flags=0x02; -- b->s
UPDATE gossip_scripts SET temp=temp | 0x01 WHERE command=26 AND data_flags=0x04 AND buddy_entry!=0; -- s->b/t
UPDATE gossip_scripts SET temp=temp | 0x14 WHERE command=26 AND data_flags=0x06 AND buddy_entry!=0; -- s->s -- Throw error, this would be unreasonable if buddy defined
UPDATE gossip_scripts SET temp=temp | 0x04 WHERE command=26 AND data_flags=0x06 AND buddy_entry=0; -- s->s
/* stand state */
UPDATE gossip_scripts SET temp=temp | 0x02 WHERE command=28 AND (data_flags & 0x01 > 0) AND buddy_entry=0;
/* change npc flag */
UPDATE gossip_scripts SET datalong2=data_flags WHERE command=29;

UPDATE gossip_scripts SET data_flags=temp;

ALTER TABLE gossip_scripts DROP COLUMN temp;

ALTER TABLE db_version CHANGE COLUMN required_11940_04_mangos_gossip_scripts required_11940_05_mangos_quest_end_scripts bit;


ALTER TABLE quest_end_scripts ADD COLUMN temp MEDIUMINT(8) DEFAULT 0 AFTER command;

-- Move datalong4 -> 2, 3 -> 4, 2 -> 3 (right shift)
UPDATE quest_end_scripts SET temp=datalong4 WHERE command IN (0, 1, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29);
UPDATE quest_end_scripts SET datalong4=datalong3, datalong3=datalong2, datalong2=temp WHERE command IN (0, 1, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29);

ALTER TABLE quest_end_scripts CHANGE COLUMN datalong3 buddy_entry MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE quest_end_scripts CHANGE COLUMN datalong4 search_radius MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';

UPDATE quest_end_scripts SET temp=0;

/* Chat*/
UPDATE quest_end_scripts SET temp=temp | 0x04 WHERE command=0 AND (data_flags & 0x02) > 0; -- target self
UPDATE quest_end_scripts SET temp=temp | 0x01 WHERE command=0 AND (data_flags & 0x04) > 0; -- buddy as target
UPDATE quest_end_scripts SET temp=temp | 0x10 WHERE command=0 AND (data_flags & 0x01) > 0; -- will produce error
-- Note that old flag 0x01 // flag_target_player_as_source     0x01 could not be converted automatically, need to check every script

/* Emote*/
UPDATE quest_end_scripts SET temp=temp | 0x02 WHERE command=1 AND (data_flags & 0x01 > 0) AND buddy_entry = 0; -- reverse order if no buddy defined
/*Summon */
UPDATE quest_end_scripts SET temp=temp | 0x08 WHERE command=10 AND (data_flags & 0x01 > 0); -- Summon as active
/* Remove Aura */
UPDATE quest_end_scripts SET temp=0x02 WHERE command=14 AND datalong2=1;
UPDATE quest_end_scripts SET datalong2=0 WHERE command=14;
/* Cast */
UPDATE quest_end_scripts SET temp=temp | 0x08 WHERE command=15 AND (datalong2 & 0x04 > 0); -- cast triggered
UPDATE quest_end_scripts SET temp=temp | 0x04 WHERE command=15 AND datalong2=0x01; -- s->t
UPDATE quest_end_scripts SET temp=temp | 0x06 WHERE command=15 AND datalong2=0x02; -- t->t
UPDATE quest_end_scripts SET temp=temp | 0x02 WHERE command=15 AND datalong2=0x03; -- t->s
UPDATE quest_end_scripts SET datalong2=0 WHERE command=15;
/* change faction */
UPDATE quest_end_scripts SET datalong2=data_flags WHERE command=22;
/* morph/ mount */
UPDATE quest_end_scripts SET temp=temp | 0x08 WHERE command IN (23, 24) AND (data_flags & 0x01 > 0); -- Summon as active
/* attack start */
UPDATE quest_end_scripts SET temp=temp | 0x03 WHERE command=26 AND data_flags=0x02; -- b->s
UPDATE quest_end_scripts SET temp=temp | 0x01 WHERE command=26 AND data_flags=0x04 AND buddy_entry!=0; -- s->b/t
UPDATE quest_end_scripts SET temp=temp | 0x14 WHERE command=26 AND data_flags=0x06 AND buddy_entry!=0; -- s->s -- Throw error, this would be unreasonable if buddy defined
UPDATE quest_end_scripts SET temp=temp | 0x04 WHERE command=26 AND data_flags=0x06 AND buddy_entry=0; -- s->s
/* stand state */
UPDATE quest_end_scripts SET temp=temp | 0x02 WHERE command=28 AND (data_flags & 0x01 > 0) AND buddy_entry=0;
/* change npc flag */
UPDATE quest_end_scripts SET datalong2=data_flags WHERE command=29;

UPDATE quest_end_scripts SET data_flags=temp;

ALTER TABLE quest_end_scripts DROP COLUMN temp;

ALTER TABLE db_version CHANGE COLUMN required_11940_05_mangos_quest_end_scripts required_11940_06_mangos_quest_start_scripts bit;


ALTER TABLE quest_start_scripts ADD COLUMN temp MEDIUMINT(8) DEFAULT 0 AFTER command;

-- Move datalong4 -> 2, 3 -> 4, 2 -> 3 (right shift)
UPDATE quest_start_scripts SET temp=datalong4 WHERE command IN (0, 1, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29);
UPDATE quest_start_scripts SET datalong4=datalong3, datalong3=datalong2, datalong2=temp WHERE command IN (0, 1, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29);

ALTER TABLE quest_start_scripts CHANGE COLUMN datalong3 buddy_entry MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE quest_start_scripts CHANGE COLUMN datalong4 search_radius MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';

UPDATE quest_start_scripts SET temp=0;

/* Chat*/
UPDATE quest_start_scripts SET temp=temp | 0x04 WHERE command=0 AND (data_flags & 0x02) > 0; -- target self
UPDATE quest_start_scripts SET temp=temp | 0x01 WHERE command=0 AND (data_flags & 0x04) > 0; -- buddy as target
UPDATE quest_start_scripts SET temp=temp | 0x10 WHERE command=0 AND (data_flags & 0x01) > 0; -- will produce error
-- Note that old flag 0x01 // flag_target_player_as_source     0x01 could not be converted automatically, need to check every script

/* Emote*/
UPDATE quest_start_scripts SET temp=temp | 0x02 WHERE command=1 AND (data_flags & 0x01 > 0) AND buddy_entry = 0; -- reverse order if no buddy defined
/*Summon */
UPDATE quest_start_scripts SET temp=temp | 0x08 WHERE command=10 AND (data_flags & 0x01 > 0); -- Summon as active
/* Remove Aura */
UPDATE quest_start_scripts SET temp=0x02 WHERE command=14 AND datalong2=1;
UPDATE quest_start_scripts SET datalong2=0 WHERE command=14;
/* Cast */
UPDATE quest_start_scripts SET temp=temp | 0x08 WHERE command=15 AND (datalong2 & 0x04 > 0); -- cast triggered
UPDATE quest_start_scripts SET temp=temp | 0x04 WHERE command=15 AND datalong2=0x01; -- s->t
UPDATE quest_start_scripts SET temp=temp | 0x06 WHERE command=15 AND datalong2=0x02; -- t->t
UPDATE quest_start_scripts SET temp=temp | 0x02 WHERE command=15 AND datalong2=0x03; -- t->s
UPDATE quest_start_scripts SET datalong2=0 WHERE command=15;
/* change faction */
UPDATE quest_start_scripts SET datalong2=data_flags WHERE command=22;
/* morph/ mount */
UPDATE quest_start_scripts SET temp=temp | 0x08 WHERE command IN (23, 24) AND (data_flags & 0x01 > 0); -- Summon as active
/* attack start */
UPDATE quest_start_scripts SET temp=temp | 0x03 WHERE command=26 AND data_flags=0x02; -- b->s
UPDATE quest_start_scripts SET temp=temp | 0x01 WHERE command=26 AND data_flags=0x04 AND buddy_entry!=0; -- s->b/t
UPDATE quest_start_scripts SET temp=temp | 0x14 WHERE command=26 AND data_flags=0x06 AND buddy_entry!=0; -- s->s -- Throw error, this would be unreasonable if buddy defined
UPDATE quest_start_scripts SET temp=temp | 0x04 WHERE command=26 AND data_flags=0x06 AND buddy_entry=0; -- s->s
/* stand state */
UPDATE quest_start_scripts SET temp=temp | 0x02 WHERE command=28 AND (data_flags & 0x01 > 0) AND buddy_entry=0;
/* change npc flag */
UPDATE quest_start_scripts SET datalong2=data_flags WHERE command=29;

UPDATE quest_start_scripts SET data_flags=temp;

ALTER TABLE quest_start_scripts DROP COLUMN temp;

ALTER TABLE db_version CHANGE COLUMN required_11940_06_mangos_quest_start_scripts required_11940_07_mangos_spell_scripts bit;


ALTER TABLE spell_scripts ADD COLUMN temp MEDIUMINT(8) DEFAULT 0 AFTER command;

-- Move datalong4 -> 2, 3 -> 4, 2 -> 3 (right shift)
UPDATE spell_scripts SET temp=datalong4 WHERE command IN (0, 1, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29);
UPDATE spell_scripts SET datalong4=datalong3, datalong3=datalong2, datalong2=temp WHERE command IN (0, 1, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29);

ALTER TABLE spell_scripts CHANGE COLUMN datalong3 buddy_entry MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';
ALTER TABLE spell_scripts CHANGE COLUMN datalong4 search_radius MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0';

UPDATE spell_scripts SET temp=0;

/* Chat*/
UPDATE spell_scripts SET temp=temp | 0x04 WHERE command=0 AND (data_flags & 0x02) > 0; -- target self
UPDATE spell_scripts SET temp=temp | 0x01 WHERE command=0 AND (data_flags & 0x04) > 0; -- buddy as target
UPDATE spell_scripts SET temp=temp | 0x10 WHERE command=0 AND (data_flags & 0x01) > 0; -- will produce error
-- Note that old flag 0x01 // flag_target_player_as_source     0x01 could not be converted automatically, need to check every script

/* Emote*/
UPDATE spell_scripts SET temp=temp | 0x02 WHERE command=1 AND (data_flags & 0x01 > 0) AND buddy_entry = 0; -- reverse order if no buddy defined
/*Summon */
UPDATE spell_scripts SET temp=temp | 0x08 WHERE command=10 AND (data_flags & 0x01 > 0); -- Summon as active
/* Remove Aura */
UPDATE spell_scripts SET temp=0x02 WHERE command=14 AND datalong2=1;
UPDATE spell_scripts SET datalong2=0 WHERE command=14;
/* Cast */
UPDATE spell_scripts SET temp=temp | 0x08 WHERE command=15 AND (datalong2 & 0x04 > 0); -- cast triggered
UPDATE spell_scripts SET temp=temp | 0x04 WHERE command=15 AND datalong2=0x01; -- s->t
UPDATE spell_scripts SET temp=temp | 0x06 WHERE command=15 AND datalong2=0x02; -- t->t
UPDATE spell_scripts SET temp=temp | 0x02 WHERE command=15 AND datalong2=0x03; -- t->s
UPDATE spell_scripts SET datalong2=0 WHERE command=15;
/* change faction */
UPDATE spell_scripts SET datalong2=data_flags WHERE command=22;
/* morph/ mount */
UPDATE spell_scripts SET temp=temp | 0x08 WHERE command IN (23, 24) AND (data_flags & 0x01 > 0); -- Summon as active
/* attack start */
UPDATE spell_scripts SET temp=temp | 0x03 WHERE command=26 AND data_flags=0x02; -- b->s
UPDATE spell_scripts SET temp=temp | 0x01 WHERE command=26 AND data_flags=0x04 AND buddy_entry!=0; -- s->b/t
UPDATE spell_scripts SET temp=temp | 0x14 WHERE command=26 AND data_flags=0x06 AND buddy_entry!=0; -- s->s -- Throw error, this would be unreasonable if buddy defined
UPDATE spell_scripts SET temp=temp | 0x04 WHERE command=26 AND data_flags=0x06 AND buddy_entry=0; -- s->s
/* stand state */
UPDATE spell_scripts SET temp=temp | 0x02 WHERE command=28 AND (data_flags & 0x01 > 0) AND buddy_entry=0;
/* change npc flag */
UPDATE spell_scripts SET datalong2=data_flags WHERE command=29;

UPDATE spell_scripts SET data_flags=temp;

ALTER TABLE spell_scripts DROP COLUMN temp;

ALTER TABLE db_version CHANGE COLUMN required_11940_07_mangos_spell_scripts required_11947_01_mangos_dbscripts bit;

-- Update teleport
UPDATE creature_movement_scripts SET data_flags=data_flags|8 WHERE command=3 AND datalong2=0 AND (x!=0 AND y!=0 AND z!=0);
UPDATE event_scripts SET data_flags=data_flags|8 WHERE command=3 AND datalong2=0 AND (x!=0 AND y!=0 AND z!=0);
UPDATE gameobject_scripts SET data_flags=data_flags|8 WHERE command=3 AND datalong2=0 AND (x!=0 AND y!=0 AND z!=0);
UPDATE gossip_scripts SET data_flags=data_flags|8 WHERE command=3 AND datalong2=0 AND (x!=0 AND y!=0 AND z!=0);
UPDATE quest_end_scripts SET data_flags=data_flags|8 WHERE command=3 AND datalong2=0 AND (x!=0 AND y!=0 AND z!=0);
UPDATE quest_start_scripts SET data_flags=data_flags|8 WHERE command=3 AND datalong2=0 AND (x!=0 AND y!=0 AND z!=0);
UPDATE spell_scripts SET data_flags=data_flags|8 WHERE command=3 AND datalong2=0 AND (x!=0 AND y!=0 AND z!=0);

-- Set all move commands to default creature speed
UPDATE creature_movement_scripts SET datalong2=0 WHERE command=3;
UPDATE event_scripts SET datalong2=0 WHERE command=3;
UPDATE gameobject_scripts SET datalong2=0 WHERE command=3;
UPDATE gossip_scripts SET datalong2=0 WHERE command=3;
UPDATE quest_end_scripts SET datalong2=0 WHERE command=3;
UPDATE quest_start_scripts SET datalong2=0 WHERE command=3;
UPDATE spell_scripts SET datalong2=0 WHERE command=3;


# SD2_2507
UPDATE creature_template SET ScriptName="npc_skywing" WHERE entry=22424;
UPDATE creature_template SET ScriptName='npc_spawned_oronok_tornheart' WHERE entry=21685;
UPDATE creature_template SET ScriptName='' WHERE entry=12919;
UPDATE creature_template SET ScriptName='' WHERE entry=23602;
UPDATE gameobject_template SET ScriptName='' WHERE entry=180368;
UPDATE creature_template SET ScriptName='' WHERE entry=8816;
UPDATE creature_template SET ScriptName='' WHERE entry=12384;
UPDATE creature_template SET ScriptName='' WHERE entry=17832;
UPDATE creature_template SET ScriptName='' WHERE entry=23559;
UPDATE creature_template SET ScriptName='' WHERE entry=8696;
UPDATE creature_template SET ScriptName='' WHERE entry=10618;
UPDATE creature_template SET ScriptName='' WHERE entry=4968;
DELETE FROM scripted_areatrigger WHERE entry BETWEEN 1726 AND 1740;
INSERT INTO scripted_areatrigger VALUES
(1726,'at_scent_larkorwi'),
(1727,'at_scent_larkorwi'),
(1728,'at_scent_larkorwi'),
(1729,'at_scent_larkorwi'),
(1730,'at_scent_larkorwi'),
(1731,'at_scent_larkorwi'),
(1732,'at_scent_larkorwi'),
(1733,'at_scent_larkorwi'),
(1734,'at_scent_larkorwi'),
(1735,'at_scent_larkorwi'),
(1736,'at_scent_larkorwi'),
(1737,'at_scent_larkorwi'),
(1738,'at_scent_larkorwi'),
(1739,'at_scent_larkorwi'),
(1740,'at_scent_larkorwi');
