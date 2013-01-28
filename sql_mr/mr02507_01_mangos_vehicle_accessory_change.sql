-- change structure
ALTER TABLE `vehicle_accessory`
    CHANGE `entry` `vehicle_entry` INT(10) UNSIGNED NOT NULL COMMENT 'entry of the npc who has some accessory as vehicle',
    CHANGE `seat_id` `seat` MEDIUMINT(8) UNSIGNED NOT NULL COMMENT 'onto which seat shall the passenger be boarded',
    CHANGE `description` `comment` VARCHAR(255);