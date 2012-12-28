-- table structure fix (for compartibility with changes from 
RENAME TABLE `vehicle_accessory` TO `temp_vehicle_accessory`;

CREATE TABLE `vehicle_accessory` (
    `vehicle_entry` int(10) UNSIGNED NOT NULL COMMENT 'entry of the npc who has some accessory as vehicle',
    `seat` mediumint(8) UNSIGNED NOT NULL COMMENT 'onto which seat shall the passenger be boarded',
    `accessory_entry` int(10) UNSIGNED NOT NULL COMMENT 'entry of the passenger that is to be boarded',
    `flags` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'various flags',
    `offset_x` FLOAT NOT NULL DEFAULT '0' COMMENT 'custom passenger offset X',
    `offset_y` FLOAT NOT NULL DEFAULT '0' COMMENT 'custom passenger offset Y',
    `offset_z` FLOAT NOT NULL DEFAULT '0' COMMENT 'custom passenger offset Z',
    `offset_o` FLOAT NOT NULL DEFAULT '0' COMMENT 'custom passenger offset O',
    `comment` varchar(255) NOT NULL,
     PRIMARY KEY  (`vehicle_entry`, `seat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Vehicle Accessory (passengers that are auto-boarded onto a vehicle)';

INSERT INTO `vehicle_accessory` (`vehicle_entry`, `seat`, `accessory_entry`, `flags`, `offset_x`, `offset_y`, `offset_z`, `offset_o`, `comment`)
    SELECT `vehicle_entry`, `seat`, `accessory_entry`, `flags`, `offset_x`, `offset_y`, `offset_z`, `offset_o`, `comment`
    FROM `temp_vehicle_accessory`;
DROP TABLE `temp_vehicle_accessory`;