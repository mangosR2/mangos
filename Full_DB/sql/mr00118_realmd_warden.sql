-- Warden data table structure from TOM_RUS
DROP TABLE IF EXISTS `warden_data_result`;
CREATE TABLE `warden_data_result` (
  `id` int(4) NOT NULL auto_increment,
  `check` int(3) default NULL,
  `data` tinytext,
  `str` tinytext,
  `address` int(8) default NULL,
  `length` int(2) default NULL,
  `result` tinytext,
  `comment` text,
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8;
