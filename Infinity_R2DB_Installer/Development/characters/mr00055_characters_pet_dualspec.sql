-- Pet dualspec for hunter pets (mangosR2 repo)
ALTER TABLE `pet_spell`
    DROP `spec`;

ALTER TABLE `pet_spell` ADD `spec` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `active`;
ALTER TABLE `pet_spell` DROP PRIMARY KEY;
ALTER TABLE `pet_spell` ADD PRIMARY KEY ( `guid` , `spell` , `spec` );
