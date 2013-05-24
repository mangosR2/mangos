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

DELETE FROM `spell_linked` WHERE `entry` = 64382;
INSERT INTO `spell_linked` (`entry`, `linked_entry`, `type`, `effect_mask`, `comment`) VALUES
(64382, 64380, 4, 0, 'Shattering Throw - Immunity dispell');

DELETE FROM `spell_linked` WHERE `entry` = 32375;
INSERT INTO `spell_linked` (`entry`, `linked_entry`, `type`, `effect_mask`, `comment`) VALUES
(32375, 43241, 4, 0, 'Mass Dispel - Cosmetic');

-- Gift of the Naaru Visual
DELETE FROM `spell_linked` WHERE `linked_entry` = 57901;
INSERT INTO `spell_linked` (`entry`, `linked_entry`, `type`, `effect_mask`, `comment`) VALUES
(28880, 57901, 1, 0, 'Gift of the Naaru Visual'),
(59542, 57901, 1, 0, 'Gift of the Naaru Visual'),
(59543, 57901, 1, 0, 'Gift of the Naaru Visual'),
(59544, 57901, 1, 0, 'Gift of the Naaru Visual'),
(59545, 57901, 1, 0, 'Gift of the Naaru Visual'),
(59547, 57901, 1, 0, 'Gift of the Naaru Visual'),
(59548, 57901, 1, 0, 'Gift of the Naaru Visual');

DELETE FROM `spell_linked` WHERE `linked_entry` = 61719;
INSERT INTO `spell_linked` (`entry`, `linked_entry`, `type`, `comment`) VALUE
(61716, 61719, 1, 'Rabbit Costume - Easter Lay Noblegarden Egg Aura');
