ALTER TABLE realmd_db_version CHANGE COLUMN required_10008_01_realmd_realmd_db_version required_12112_01_realmd_account_access bit;

DROP TABLE IF EXISTS `account_access`;

CREATE TABLE `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Account Access System';

INSERT IGNORE INTO `account_access` (`id`,`gmlevel`,`RealmID`) 
    SELECT `id`, `gmlevel`, -1 FROM `account` 
    WHERE `account`.`gmlevel` > 0;

ALTER TABLE `account` DROP `gmlevel`;

-- This expression may give error - if table `account_forcepermission` not created, this normal.

INSERT IGNORE INTO `account_access` (`id`,`gmlevel`,`RealmID`) 
    SELECT `AccountID`,`Security`, `realmID` FROM `account_forcepermission`
WHERE `account_forcepermission`.`AccountID` > 4;

DROP TABLE IF EXISTS `account_forcepermission`;

