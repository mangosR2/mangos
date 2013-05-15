DROP TABLE IF EXISTS `multi_IP_whitelist`;
CREATE TABLE `multi_IP_whitelist` (
  `id` int(32) NOT NULL AUTO_INCREMENT,
  `whitelist` varchar(500) DEFAULT NULL,
  `comment` longtext,
  PRIMARY KEY (`id`)
) DEFAULT CHARSET=utf8;
