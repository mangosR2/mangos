-- query for finish table masquerading (must rollback all changes from custom_mangos_masquerade_begin.sql)
--
DROP VIEW IF EXISTS `vehicle_accessory`;
RENAME TABLE `r2_vehicle_accessory` TO `vehicle_accessory`;
