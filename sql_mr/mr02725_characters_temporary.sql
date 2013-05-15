-- ------------------------------------- --
-- ------- I am a temporary file ------- --
-- After a month my data will be deleted --
-- ------------------------------------- --
-- ===================================== --

-- ---------- --
-- 2012-03-08 --
-- ---------- --
-- mr2725
-- DROP TABLE IF EXISTS `chat_log_bg`;
CREATE TABLE `chat_log_bg` (
            `guid` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
            `date_time` DATETIME NOT NULL,
            `type` TINYINT(2) NOT NULL,
            `pname` VARCHAR(12) NOT NULL DEFAULT '',
            `members` TEXT,
            `msg` TEXT,
            `level` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
            `account_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
            `status` SET('hidden', 'marked', 'banned') NOT NULL DEFAULT '',
            PRIMARY KEY (`guid`)
) DEFAULT CHARSET=utf8;

-- DROP TABLE IF EXISTS `chat_log_channel`;
CREATE TABLE `chat_log_channel` (
            `guid` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
            `date_time` DATETIME NOT NULL,
            `pname` VARCHAR(12) NOT NULL DEFAULT '',
            `channel` VARCHAR(255) NOT NULL DEFAULT '',
            `msg` TEXT,
            `level` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
            `account_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
            `status` SET('hidden', 'marked', 'banned') NOT NULL DEFAULT '',
            PRIMARY KEY (`guid`)
) DEFAULT CHARSET=utf8;

-- DROP TABLE IF EXISTS `chat_log_chat`;
CREATE TABLE `chat_log_chat` (
            `guid` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
            `date_time` DATETIME NOT NULL,
            `type` TINYINT(2) NOT NULL,
            `pname` VARCHAR(12) NOT NULL DEFAULT '',
            `msg` TEXT,
            `level` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
            `account_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
            `status` SET('hidden', 'marked', 'banned') NOT NULL DEFAULT '',
            PRIMARY KEY (`guid`)
) DEFAULT CHARSET=utf8;

-- DROP TABLE IF EXISTS `chat_log_guild`;
CREATE TABLE `chat_log_guild` (
            `guid` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
            `date_time` DATETIME NOT NULL,
            `type` TINYINT(2) NOT NULL DEFAULT 4,
            `pname` VARCHAR(12) NOT NULL DEFAULT '',
            `guild` VARCHAR(255) NOT NULL DEFAULT '',
            `msg` TEXT,
            `level` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
            `account_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
            `status` SET('hidden', 'marked', 'banned') NOT NULL DEFAULT '',
            PRIMARY KEY (`guid`)
) DEFAULT CHARSET=utf8;

-- DROP TABLE IF EXISTS `chat_log_party`;
CREATE TABLE `chat_log_party` (
            `guid` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
            `date_time` DATETIME NOT NULL,
            `pname` VARCHAR(12) NOT NULL DEFAULT '',
            `members` TEXT,
            `msg` TEXT,
            `level` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
            `account_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
            `status` SET('hidden', 'marked', 'banned') NOT NULL DEFAULT '',
            PRIMARY KEY (`guid`)
) DEFAULT CHARSET=utf8;

-- DROP TABLE IF EXISTS `chat_log_raid`;
CREATE TABLE `chat_log_raid` (
            `guid` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
            `date_time` DATETIME NOT NULL,
            `type` TINYINT(2) NOT NULL,
            `pname` VARCHAR(12) NOT NULL DEFAULT '',
            `members` TEXT,
            `msg` TEXT,
            `level` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
            `account_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
            `status` SET('hidden', 'marked', 'banned') NOT NULL DEFAULT '',
            PRIMARY KEY (`guid`)
) DEFAULT CHARSET=utf8;

-- DROP TABLE IF EXISTS `chat_log_whisper`;
CREATE TABLE `chat_log_whisper` (
            `guid` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT,
            `date_time` DATETIME NOT NULL,
            `pname` VARCHAR(12) NOT NULL DEFAULT '',
            `to` VARCHAR(12) NOT NULL DEFAULT '',
            `msg` TEXT,
            `level` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0',
            `account_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
            `status` SET('hidden', 'marked', 'banned') NOT NULL DEFAULT '',
            PRIMARY KEY (`guid`)
) DEFAULT CHARSET=utf8;
