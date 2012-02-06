-- Implement creature spells storage
-- DROP TABLE IF EXISTS `creature_spell`;
CREATE TABLE IF NOT EXISTS `creature_spell` (
    `guid`      int(11) unsigned NOT NULL COMMENT 'Unique entry from creature_template',
    `spell`     int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell id from DBC',
    `index`     tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell index',
    `active`    tinyint(3) unsigned NOT NULL DEFAULT '0'COMMENT 'Active state for this spell',
    `disabled`  tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean state for spell',
    `flags`     int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell custom flags',
     PRIMARY KEY (`guid`,`index`,`active`)
) DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Creature spells storage';

ALTER TABLE `creature_spell`
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`guid`,`index`,`active`);