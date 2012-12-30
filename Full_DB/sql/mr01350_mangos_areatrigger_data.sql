-- Areatrigger additional data
UPDATE `areatrigger_teleport` SET `achiev_id_0` = 4530, `achiev_id_1` = 4597 WHERE `target_map` = 631;

-- UPDATE `areatrigger_teleport` SET `combat_mode` = 1 WHERE `target_map` = 631;

UPDATE `areatrigger_teleport` SET `minGS` = 192 WHERE `target_map` > 600;
