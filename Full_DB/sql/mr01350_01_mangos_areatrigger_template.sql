-- Areatrigger table format change

ALTER TABLE `areatrigger_teleport`
    ADD COLUMN `achiev_id_0` int(11) UNSIGNED NOT NULL DEFAULT "0" COMMENT "Required achievement to enter in heroic difficulty",
    ADD COLUMN `achiev_id_1` int(11) UNSIGNED NOT NULL DEFAULT "0" COMMENT "Required achievement to enter in extra difficulty",
    ADD COLUMN `combat_mode` int(11) UNSIGNED NOT NULL DEFAULT "0" COMMENT "Possibility for enter while zone in combat";
