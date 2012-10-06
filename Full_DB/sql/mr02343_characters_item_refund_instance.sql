-- Implement item refund data storage table

DROP TABLE IF EXISTS `item_refund_instance`;
CREATE TABLE `item_refund_instance` (
  `itemGuid` int(11) unsigned NOT NULL COMMENT 'Item Guid',
  `playerGuid` int(11) unsigned NOT NULL COMMENT 'Player Guid',
  `paidMoney` int(11) unsigned NOT NULL DEFAULT '0',
  `paidExtendedCost` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`itemGuid`,`playerGuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Item Refund System';
