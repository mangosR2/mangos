-- Pet table cleanup
ALTER TABLE `character_pet`
  CHANGE `Reactstate` `Reactstate` INT(10) UNSIGNED NOT NULL DEFAULT '0';
