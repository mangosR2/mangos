-- spell_dbc additional fields
ALTER TABLE `spell_dbc`
    ADD COLUMN `Category` int(10) unsigned NOT NULL default '0' AFTER `Id`,
    ADD COLUMN `AttributesEx6` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AttributesEx5`,
    ADD COLUMN `AttributesEx7` int(10) unsigned NOT NULL DEFAULT '0' AFTER `AttributesEx6`,
    ADD COLUMN `CasterAuraSpell` int(10) unsigned NOT NULL DEFAULT '0' AFTER `Targets`,
    ADD COLUMN `TargetAuraSpell` int(10) unsigned NOT NULL DEFAULT '0' AFTER `CasterAuraSpell`,
    ADD COLUMN `ExcludeCasterAuraSpell` int(10) unsigned NOT NULL DEFAULT '0' AFTER `TargetAuraSpell`,
    ADD COLUMN `ExcludeTargetAuraSpell` int(10) unsigned NOT NULL DEFAULT '0' AFTER `ExcludeCasterAuraSpell`,
    ADD COLUMN `SpellIconID` int(10) unsigned NOT NULL DEFAULT '0' AFTER `EffectSpellClassMaskC3`;
