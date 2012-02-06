-- spell_dbc additional fields
ALTER TABLE `spell_dbc`
    ADD COLUMN `RecoveryTime` int(10) unsigned NOT NULL default '0' AFTER `CastingTimeIndex`,
    ADD COLUMN `CategoryRecoveryTime` int(10) unsigned NOT NULL DEFAULT '0' AFTER `RecoveryTime`,
    ADD COLUMN `InterruptFlags` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CategoryRecoveryTime`;
