-- Implement WorldState templates table
DROP TABLE IF EXISTS `worldstate_template`;
CREATE TABLE IF NOT EXISTS `worldstate_template` (
    `state_id`         int(10) unsigned NOT NULL COMMENT 'WorldState ID',
    `type`             int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'WorldState type',
    `condition`        int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Default condition (dependent from type)',
    `flags`            int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Default flags of WorldState',
    `default`          int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Default value of WorldState',
    `linked_id`        int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID of linked WorldState',
    `ScriptName`       char(64) NOT NULL default '' COMMENT 'Script name for WorldState (FFU)',
    `comment`          varchar(255) NOT NULL DEFAULT '',
    PRIMARY KEY (`state_id`,`type`,`condition`)
) DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='WorldState templates storage';
