-- Implement spell linked definitions storage
CREATE TABLE IF NOT EXISTS `spell_linked` (
    `entry`            int(10) unsigned NOT NULL COMMENT 'Spell entry',
    `linked_entry`     int(10) unsigned NOT NULL COMMENT 'Linked spell entry',
    `type`             int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Type of link',
    `effect_mask`      int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'mask of effect (NY)',
    `comment`          varchar(255) NOT NULL DEFAULT '',
     PRIMARY KEY (`entry`,`linked_entry`,`type`)
) DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Linked spells storage';

DELETE FROM `spell_linked` WHERE `entry` = 25780;
INSERT INTO `spell_linked` (`entry`, `linked_entry`, `type`, `effect_mask`, `comment`) VALUES
(25780, 57339, 1, 0, 'Paladin - threat addon after 3.0');

DELETE FROM `spell_linked` WHERE `entry` = 21178;
INSERT INTO `spell_linked` (`entry`, `linked_entry`, `type`, `effect_mask`, `comment`) VALUES
(21178, 57339, 1, 0, 'Druid Bear form - threat addon after 3.0');

DELETE FROM `spell_linked` WHERE `entry` = 7376;
INSERT INTO `spell_linked` (`entry`, `linked_entry`, `type`, `effect_mask`, `comment`) VALUES
(7376, 57339, 1, 0, 'Warrior Defensive Stance Passive - threat addon after 3.0');
