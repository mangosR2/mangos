-- query for begin table masquerading (ALL changest must be rollbacked in  custom_mangos_masquerade_end.sql !)
--

RENAME TABLE `vehicle_accessory` TO `r2_vehicle_accessory`;

CREATE VIEW `vehicle_accessory` (`vehicle_entry`, `seat`, `accessory_entry`, `comment`)
    AS SELECT `vehicle_entry`, `seat`, `accessory_entry`, `comment`
    FROM `r2_vehicle_accessory`;

