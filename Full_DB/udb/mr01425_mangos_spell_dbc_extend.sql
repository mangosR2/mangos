-- spell_dbc additional fields
ALTER TABLE `spell_dbc`
    ADD COLUMN `CasterAuraState` int(10) unsigned NOT NULL default '0' AFTER `RequiresSpellFocus`,
    ADD COLUMN `TargetAuraState` INT(10) NOT NULL DEFAULT '0' AFTER `CasterAuraState`,
    ADD COLUMN `ExcludeCasterAuraState` int(10) unsigned NOT NULL default '0' AFTER `TargetAuraState`,
    ADD COLUMN `ExcludeTargetAuraState` INT(10) NOT NULL DEFAULT '0' AFTER `ExcludeCasterAuraState`,
    ADD COLUMN `PowerType` INT(10) NOT NULL DEFAULT '0' AFTER `DurationIndex`,
    ADD COLUMN `ManaCost` INT(10) NOT NULL DEFAULT '0' AFTER `PowerType`,
    ADD COLUMN `ManaCostPerLevel` INT(10) NOT NULL DEFAULT '0' AFTER `ManaCost`,
    ADD COLUMN `ManaPerSecond` INT(10) NOT NULL DEFAULT '0' AFTER `ManaCostPerLevel`,
    ADD COLUMN `ManaPerSecondPerLevel` INT(10) NOT NULL DEFAULT '0' AFTER `ManaPerSecond`,
    ADD COLUMN `Speed` INT(10) NOT NULL DEFAULT '0' AFTER `RangeIndex`,
    ADD COLUMN `ManaCostPct` INT(10) NOT NULL DEFAULT '0' AFTER `SpellIconID`,
    ADD COLUMN `StartRecoveryCategory` INT(10) NOT NULL DEFAULT '0' AFTER `ManaCostPct`,
    ADD COLUMN `StartRecoveryTime` INT(10) NOT NULL DEFAULT '0' AFTER `StartRecoveryCategory`,
    ADD COLUMN `RuneCostID` INT(10) NOT NULL DEFAULT '0' AFTER `SchoolMask`;

