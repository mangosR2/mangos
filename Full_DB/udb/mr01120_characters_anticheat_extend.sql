-- anticheat config disabled zones column
ALTER TABLE `anticheat_config`
    ADD COLUMN `disabledzones` varchar(255) NOT NULL DEFAULT '' 
    COMMENT 'List of zones, in which check disabled.'
    AFTER `actionparam2`;
