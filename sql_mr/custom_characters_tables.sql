-- Random Battleground
--

DROP TABLE IF EXISTS `character_battleground_random`;
CREATE TABLE `character_battleground_random` (
    `guid` int(11) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Anticheat tables from /dev/rsa

DROP TABLE IF EXISTS `anticheat_config`;
CREATE TABLE `anticheat_config` (
    `checktype` mediumint(8) unsigned NOT NULL COMMENT 'Type of check',
    `description` varchar(255),
    `check_period` int(11) unsigned NOT NULL default '0' COMMENT 'Time period of check, in ms, 0 - always',
    `alarmscount` int(11) unsigned NOT NULL default '1'COMMENT 'Count of alarms before action',
    `disableoperation` tinyint(3) unsigned NOT NULL default '0'COMMENT 'Anticheat disable operations in main core code after check fail',
    `messagenum` int(11) NOT NULL default '0' COMMENT 'Number of system message',
    `intparam1` mediumint(8) NOT NULL default '0' COMMENT 'Int parameter 1',
    `intparam2` mediumint(8) NOT NULL default '0' COMMENT 'Int parameter 2',
    `floatparam1` float NOT NULL default '0' COMMENT 'Float parameter 1',
    `floatparam2` float NOT NULL default '0' COMMENT 'Float parameter 2',
    `action1` mediumint(8) NOT NULL default '0' COMMENT 'Action 1',
    `actionparam1` mediumint(8) NOT NULL default '0' COMMENT 'Action parameter 1',
    `action2` mediumint(8) NOT NULL default '0' COMMENT 'Action 1',
    `actionparam2` mediumint(8) NOT NULL default '0' COMMENT 'Action parameter 1',
    `disabledzones` varchar(255) NOT NULL DEFAULT '' COMMENT 'List of zones, in which check disabled.',
    PRIMARY KEY (`checktype`)
) DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Anticheat configuration';

  -- better not drop table here, because of custom data
CREATE TABLE IF NOT EXISTS `anticheat_log` (
    `playername` varchar(32) NOT NULL,
    `checktype` mediumint(8) unsigned NOT NULL,
    `alarm_time` datetime NOT NULL,
    `reason` varchar(255) NOT NULL DEFAULT 'Unknown',
    `guid` int(11) unsigned NOT NULL,
    `action1` mediumint(8) NOT NULL default '0',
    `action2` mediumint(8) NOT NULL default '0',
    PRIMARY KEY (`checktype`, `alarm_time`, `guid`),
    KEY idx_Player (`guid`)
) DEFAULT CHARSET=utf8 COMMENT='Anticheat log table';

-- Anticheat
-- Config

-- Main checks
REPLACE INTO `anticheat_config`
    (`checktype`, `description`, `check_period`, `alarmscount`, `disableoperation`, `messagenum`, `intparam1`, `intparam2`, `floatparam1`, `floatparam2`, `action1`, `actionparam1`, `action2`, `actionparam2`)
VALUES
    -- Main checks
    (0, "Null check",         0, 1, 0, 11000, 0, 0,    0, 0, 1, 0, 0, 0),
    (1, "Movement cheat",     0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0),
    (2, "Spell cheat",        0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0),
    (3, "Quest cheat",        0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0),
    (4, "Transport cheat",    0, 3, 0, 11000, 0, 0,  300,50, 2, 1, 0, 0),
    (5, "Damage cheat",       0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0),
    (6, "Item cheat",         0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0),
    (7, "Warden check",       0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0);

-- Subchecks
REPLACE INTO `anticheat_config`
    (`checktype`, `description`, `check_period`, `alarmscount`, `disableoperation`, `messagenum`, `intparam1`, `intparam2`, `floatparam1`, `floatparam2`, `action1`, `actionparam1`, `action2`, `actionparam2`)
VALUES
    (101, "Speed hack",              500, 5, 0, 11000,    10000, 0, 0.0012,    0, 2, 1, 6, 20000),
    (102, "Fly hack",                500, 5, 0, 11000,    20000, 0,   10.0,    0, 2, 1, 0, 0),
    (103, "Wall climb hack",         500, 2, 0, 11000,    10000, 0, 0.0015, 2.37, 2, 1, 0, 0),
    (104, "Waterwalking hack",      1000, 3, 0, 11000,    20000, 0,      0,    0, 2, 1, 0, 0),
    (105, "Teleport to plane hack",  500, 1, 0, 11000,        0, 0, 0.0001,  0.1, 2, 1, 0, 0),
    (106, "AirJump hack" ,           500, 3, 0, 11000,    30000, 0,   10.0, 25.0, 2, 1, 0, 0),
    (107, "Teleport hack" ,            0, 1, 0, 11000,        0, 0,   50.0,    0, 2, 1, 0, 0),
    (108, "Fall hack" ,                0, 3, 0, 11000,    10000, 0,      0,    0, 2, 1, 0, 0),
    (109, "Z Axis hack" ,              0, 1, 0, 11000,        0, 0,0.00001, 10.0, 2, 1, 0, 0),
    (201, "Spell invalid",             0, 1, 0, 11000,        0, 0,      0,    0, 2, 1, 0, 0),
    (202, "Spellcast in dead state",   0, 1, 0, 11000,        0, 0,      0,    0, 2, 1, 0, 0),
    (203, "Spell not valid for player",0, 1, 0, 11000,        0, 0,      0,    0, 2, 1, 0, 0),
    (204, "Spell not in player book",  0, 1, 0, 11000,        0, 0,      0,    0, 2, 1, 0, 0),
    (501, "Spell damage hack",         0, 1, 0, 11000,        0, 50000,  0,    0, 2, 1, 0, 0),
    (502, "Melee damage hack",         0, 1, 0, 11000,        0, 50000,  0,    0, 2, 1, 0, 0),
    (601, "Item dupe hack",            0, 1, 0, 11000,        0,     0,  0,    0, 2, 1, 0, 0),
    (701, "Warden memory check",       0, 1, 0, 11000,        0,     0,  0,    0, 2, 1, 0, 0),
    (702, "Warden key check",          0, 1, 0, 11000,        0,     0,  0,    0, 2, 1, 0, 0),
    (703, "Warden checksum check",     0, 1, 0, 11000,        0,     0,  0,    0, 2, 1, 0, 0),
    (704, "Warden timeout check",      0, 1, 0, 11000,        0,     0,  0,    0, 2, 1, 0, 0);

-- Autobroadcast
-- Commit 72d1f7a22d13399135d0

  -- better not drop table here, because of custom data
CREATE TABLE IF NOT EXISTS `autobroadcast` (
  `id` int(11) NOT NULL auto_increment,
  `text` longtext NOT NULL,
  `next` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- BOP item trade

  -- better not drop table here, because of custom data
CREATE TABLE IF NOT EXISTS `item_soulbound_trade_data` (
    `itemGuid` int(16) unsigned NOT NULL DEFAULT '0',
    `allowedPlayers` varchar(255) NOT NULL DEFAULT '',
    PRIMARY KEY (`itemGuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='BOP item trade cache';

-- Group flags and roles support
-- Commit a5e57729fc5211bb6a2f

ALTER TABLE `group_member`
    ADD COLUMN  `roles` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Member roles bit mask' AFTER `subgroup`;

ALTER TABLE `group_member`
    CHANGE `assistant` `memberFlags` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Member flags bit mask';

ALTER TABLE `groups`
    DROP `mainTank`,
    DROP `mainAssistant`;

-- Instance Extend LFG
-- Commit 020d4e346d38b961bf62

ALTER TABLE `character_instance`
    ADD COLUMN `extend` TINYINT(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Instance extend (bool)' AFTER `permanent`;

-- Refer a friend

ALTER TABLE `characters`
    ADD COLUMN `grantableLevels` tinyint(3) unsigned NOT NULL default '0' AFTER `actionBars`;

-- Refer new WorldStateMgr by rsa
-- Commit adf97bc1d3d55c4c0fecc72020a61e3e39257f9a

ALTER TABLE `characters`
    CHANGE `dungeon_difficulty` `dungeon_difficulty` INT(10) UNSIGNED NOT NULL DEFAULT '0';

-- Saved Variables
-- Commit 0525ca144e282cec2478

ALTER TABLE `saved_variables`
    ADD COLUMN `NextRandomBGResetTime` bigint(40) unsigned NOT NULL default 0 AFTER `NextWeeklyQuestResetTime`;

-- Pet dualspec for hunter pets (mangosR2 repo)

ALTER TABLE `pet_spell`
    ADD COLUMN `spec` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `active`,
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`guid`, `spell`, `spec`);

-- Pet table cleanup
ALTER TABLE `character_pet`
  DROP `resettalents_cost`,
  DROP `resettalents_time`,
  CHANGE `Reactstate` `Reactstate` INT(10) UNSIGNED NOT NULL DEFAULT '0';

DROP TABLE IF EXISTS hidden_rating;
CREATE TABLE IF NOT EXISTS hidden_rating (
    guid INT(11) UNSIGNED NOT NULL,
    rating2 INT(10) UNSIGNED NOT NULL,
    rating3 INT(10) UNSIGNED NOT NULL,
    rating5 INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY  (guid)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- ADVANCE CHARACTERS TABLE

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `character_stats`
-- ----------------------------
DROP TABLE IF EXISTS `character_stats`;
CREATE TABLE `character_stats` (
  `guid` int(11) unsigned NOT NULL default '0' COMMENT 'Global Unique Identifier, Low part',
  `maxhealth` int(10) unsigned NOT NULL default '0',
  `maxpower1` int(10) unsigned NOT NULL default '0',
  `maxpower2` int(10) unsigned NOT NULL default '0',
  `maxpower3` int(10) unsigned NOT NULL default '0',
  `maxpower4` int(10) unsigned NOT NULL default '0',
  `maxpower5` int(10) unsigned NOT NULL default '0',
  `maxpower6` int(10) unsigned NOT NULL default '0',
  `maxpower7` int(10) unsigned NOT NULL default '0',
  `strength` int(10) unsigned NOT NULL default '0',
  `agility` int(10) unsigned NOT NULL default '0',
  `stamina` int(10) unsigned NOT NULL default '0',
  `intellect` int(10) unsigned NOT NULL default '0',
  `spirit` int(10) unsigned NOT NULL default '0',
  `armor` int(10) unsigned NOT NULL default '0',
  `resHoly` int(10) unsigned NOT NULL default '0',
  `resFire` int(10) unsigned NOT NULL default '0',
  `resNature` int(10) unsigned NOT NULL default '0',
  `resFrost` int(10) unsigned NOT NULL default '0',
  `resShadow` int(10) unsigned NOT NULL default '0',
  `resArcane` int(10) unsigned NOT NULL default '0',
  `blockPct` float unsigned NOT NULL default '0',
  `dodgePct` float unsigned NOT NULL default '0',
  `parryPct` float unsigned NOT NULL default '0',
  `critPct` float unsigned NOT NULL default '0',
  `rangedCritPct` float unsigned NOT NULL default '0',
  `spellCritPct` float unsigned NOT NULL default '0',
  `attackPower` int(10) unsigned NOT NULL default '0',
  `rangedAttackPower` int(10) unsigned NOT NULL default '0',
  `spellPower` int(10) unsigned NOT NULL default '0',
  `apmelee` int(11) NOT NULL,
  `ranged` int(11) NOT NULL,
  `blockrating` int(11) NOT NULL,
  `defrating` int(11) NOT NULL,
  `dodgerating` int(11) NOT NULL,
  `parryrating` int(11) NOT NULL,
  `resilience` int(11) NOT NULL,
  `manaregen` float NOT NULL,
  `melee_hitrating` int(11) NOT NULL,
  `melee_critrating` int(11) NOT NULL,
  `melee_hasterating` int(11) NOT NULL,
  `melee_mainmindmg` float NOT NULL,
  `melee_mainmaxdmg` float NOT NULL,
  `melee_offmindmg` float NOT NULL,
  `melee_offmaxdmg` float NOT NULL,
  `melee_maintime` float NOT NULL,
  `melee_offtime` float NOT NULL,
  `ranged_critrating` int(11) NOT NULL,
  `ranged_hasterating` int(11) NOT NULL,
  `ranged_hitrating` int(11) NOT NULL,
  `ranged_mindmg` float NOT NULL,
  `ranged_maxdmg` float NOT NULL,
  `ranged_attacktime` float NOT NULL,
  `spell_hitrating` int(11) NOT NULL,
  `spell_critrating` int(11) NOT NULL,
  `spell_hasterating` int(11) NOT NULL,
  `spell_bonusdmg` int(11) NOT NULL,
  `spell_bonusheal` int(11) NOT NULL,
  `spell_critproc` float NOT NULL,
  `account` int(11) unsigned NOT NULL default '0',
  `name` varchar(12) NOT NULL default '',
  `race` tinyint(3) unsigned NOT NULL default '0',
  `class` tinyint(3) unsigned NOT NULL default '0',
  `gender` tinyint(3) unsigned NOT NULL default '0',
  `level` tinyint(3) unsigned NOT NULL default '0',
  `map` int(11) unsigned NOT NULL default '0',
  `money` int(10) unsigned NOT NULL default '0',
  `totaltime` int(11) unsigned NOT NULL default '0',
  `online` int(10) unsigned NOT NULL default '0',
  `arenaPoints` int(10) unsigned NOT NULL default '0',
  `totalHonorPoints` int(10) unsigned NOT NULL default '0',
  `totalKills` int(10) unsigned NOT NULL default '0',
  `equipmentCache` longtext NOT NULL,
  `specCount` tinyint(3) unsigned NOT NULL default '1',
  `activeSpec` tinyint(3) unsigned NOT NULL default '0',
  `data` longtext NOT NULL,
  PRIMARY KEY  (`guid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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

DROP TABLE IF EXISTS `item_refund_instance`;
CREATE TABLE `item_refund_instance` (
  `itemGuid` int(11) unsigned NOT NULL COMMENT 'Item Guid',
  `playerGuid` int(11) unsigned NOT NULL COMMENT 'Player Guid',
  `paidMoney` int(11) unsigned NOT NULL DEFAULT '0',
  `paidExtendedCost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemGuid`,`playerGuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item Refund System';

DROP TABLE IF EXISTS `calendar_events`;
CREATE TABLE `calendar_events` (
  `eventId`          int(11) unsigned NOT NULL DEFAULT '0',
  `creatorGuid`      int(11) unsigned NOT NULL DEFAULT '0',
  `guildId`          int(11) unsigned NOT NULL DEFAULT '0',
  `type`             tinyint(3) unsigned NOT NULL DEFAULT '4',
  `flags`            int(11) unsigned NOT NULL DEFAULT '0',
  `dungeonId`        int(11) NOT NULL DEFAULT '-1',
  `eventTime`        int(11) unsigned NOT NULL DEFAULT '0',
  `title`            varchar(256) NOT NULL DEFAULT '',
  `description`      varchar(1024) NOT NULL DEFAULT '',
  PRIMARY KEY  (`eventId`)
) DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `calendar_invites`;
CREATE TABLE `calendar_invites` (
  `inviteId`         int(11) unsigned NOT NULL DEFAULT '0',
  `eventId`          int(11) unsigned NOT NULL DEFAULT '0',
  `inviteeGuid`      int(11) unsigned NOT NULL DEFAULT '0',
  `senderGuid`       int(11) unsigned NOT NULL DEFAULT '0',
  `status`           tinyint(3) unsigned NOT NULL DEFAULT '0',
  `lastUpdateTime`   int(11) unsigned NOT NULL DEFAULT '0',
  `rank`             tinyint(3) unsigned NOT NULL DEFAULT '0',
  `description`      varchar(256) NOT NULL DEFAULT '',
  PRIMARY KEY  (`inviteId`)
) DEFAULT CHARSET=utf8;
