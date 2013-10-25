-- Hardcoded item Id's. Hide vehicle accessory.
--
-- `vehicle_accessory`
--

UPDATE `vehicle_accessory` SET `flags` = 1 WHERE `vehicle_entry` IN (27626, 28312, 32627, 32930, 33109, 33060, 33113, 33114, 36678, 33214, 33778, 33687, 28018, 28614, 35069, 34776);

UPDATE vehicle_accessory SET flags = flags | 2 WHERE accessory_entry IN (33114, 33167);
