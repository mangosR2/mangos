ALTER TABLE spell_script_target ADD COLUMN `invertEffectMask` mediumint(8) unsigned NOT NULL DEFAULT '0' AFTER `targetEntry`;
