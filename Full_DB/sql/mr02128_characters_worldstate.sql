-- Implement WorldState data storage table
DROP TABLE IF EXISTS `worldstate_data`;
CREATE TABLE IF NOT EXISTS `worldstate_data` (
    `state_id`         int(10) unsigned NOT NULL COMMENT 'WorldState ID (may be 0)',
    `instance`         int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'WorldState instance',
    `type`             int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'WorldState type',
    `condition`        int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Condition (dependent from type)',
    `flags`            int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Current flags of WorldState',
    `value`            int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Current value of WorldState',
    `renewtime`        bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Time of last renew of WorldState',
    PRIMARY KEY (`state_id`,`instance`, `type`, `condition`)
) DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='WorldState data storage';
