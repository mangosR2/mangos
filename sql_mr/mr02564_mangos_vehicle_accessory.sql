-- Hardcoded item Id's. Hide vehicle accessory.

UPDATE vehicle_accessory SET flags = flags | 2 WHERE accessory_entry IN (33114, 33167);
