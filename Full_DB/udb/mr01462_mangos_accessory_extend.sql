-- accessory offset
ALTER TABLE `vehicle_accessory`
    ADD COLUMN `offset_x` FLOAT NOT NULL DEFAULT '0' AFTER `minion`,
    ADD COLUMN `offset_y` FLOAT NOT NULL DEFAULT '0' AFTER `offset_x`,
    ADD COLUMN `offset_z` FLOAT NOT NULL DEFAULT '0' AFTER `offset_y`,
    ADD COLUMN `offset_o` FLOAT NOT NULL DEFAULT '0' AFTER `offset_z`;
