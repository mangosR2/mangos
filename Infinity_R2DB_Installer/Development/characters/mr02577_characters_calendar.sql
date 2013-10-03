-- Calendar tables structure

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
