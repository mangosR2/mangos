-- spell_dbc additional fields
ALTER TABLE `spell_dbc`
    ADD COLUMN `RequiresSpellFocus` int(10) unsigned NOT NULL default '0' AFTER `Targets`,
    ADD COLUMN `EffectItemType1` INT(11) NOT NULL DEFAULT '0' AFTER `EffectMultipleValue3`,
    ADD COLUMN `EffectItemType2` int(11) unsigned NOT NULL DEFAULT '0' AFTER `EffectItemType1`;
