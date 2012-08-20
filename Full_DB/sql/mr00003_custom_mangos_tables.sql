-- Implement DBC encounters

DROP TABLE IF EXISTS `instance_encounters`;
CREATE TABLE `instance_encounters` (
    `entry` int(10) unsigned NOT NULL COMMENT 'Unique entry from DungeonEncounter.dbc',
    `creditType` tinyint(3) unsigned NOT NULL DEFAULT '0',
    `creditEntry` int(10) unsigned NOT NULL DEFAULT '0',
    `lastEncounterDungeon` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'If not 0, LfgDungeon.dbc entry for the instance it is last encounter in',
    `comment` varchar(255) NOT NULL DEFAULT '',
     PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- LFG dungeon reward structure from TC

DROP TABLE IF EXISTS `lfg_dungeon_rewards`;
CREATE TABLE `lfg_dungeon_rewards` (
    `dungeonId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Dungeon entry from dbc',
    `maxLevel` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Max level at which this reward is rewarded',
    `firstQuestId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for first dungeon this day',
    `firstMoneyVar` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Money multiplier for completing the dungeon first time in a day with less players than max',
    `firstXPVar` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Experience multiplier for completing the dungeon first time in a day with less players than max',
    `otherQuestId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quest id with rewards for Nth dungeon this day',
    `otherMoneyVar` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Money multiplier for completing the dungeon Nth time in a day with less players than max',
    `otherXPVar` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Experience multiplier for completing the dungeon Nth time in a day with less players than max',
    PRIMARY KEY (`dungeonId`, `maxLevel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- Pet scaling data table from /dev/rsa

DROP TABLE IF EXISTS `pet_scaling_data`;
CREATE TABLE `pet_scaling_data` (
  `creature_entry` mediumint(8) unsigned NOT NULL,
  `aura` mediumint(8) unsigned NOT NULL default '0',
  `healthbase` mediumint(8) NOT NULL default '0',
  `health` mediumint(8) NOT NULL default '0',
  `powerbase` mediumint(8) NOT NULL default '0',
  `power` mediumint(8) NOT NULL default '0',
  `str` mediumint(8) NOT NULL default '0',
  `agi` mediumint(8) NOT NULL default '0',
  `sta` mediumint(8) NOT NULL default '0',
  `inte` mediumint(8) NOT NULL default '0',
  `spi` mediumint(8) NOT NULL default '0',
  `armor` mediumint(8) NOT NULL default '0',
  `resistance1` mediumint(8) NOT NULL default '0',
  `resistance2` mediumint(8) NOT NULL default '0',
  `resistance3` mediumint(8) NOT NULL default '0',
  `resistance4` mediumint(8) NOT NULL default '0',
  `resistance5` mediumint(8) NOT NULL default '0',
  `resistance6` mediumint(8) NOT NULL default '0',
  `apbase` mediumint(8) NOT NULL default '0',
  `apbasescale` mediumint(8) NOT NULL default '0',
  `attackpower` mediumint(8) NOT NULL default '0',
  `damage` mediumint(8) NOT NULL default '0',
  `spelldamage` mediumint(8) NOT NULL default '0',
  `spellhit` mediumint(8) NOT NULL default '0',
  `hit` mediumint(8) NOT NULL default '0',
  `expertize` mediumint(8) NOT NULL default '0',
  `attackspeed` mediumint(8) NOT NULL default '0',
  `crit` mediumint(8) NOT NULL default '0',
  `regen` mediumint(8) NOT NULL default '0',
  PRIMARY KEY (`creature_entry`, `aura`)
) DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Stores pet scaling data (in percent from owner value).';

-- Spell DBC
DROP TABLE IF EXISTS `spell_dbc`;
CREATE TABLE IF NOT EXISTS `spell_dbc` (
  `Id` int(10) unsigned NOT NULL,
  `Category` int(10) unsigned NOT NULL DEFAULT '0',
  `Dispel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Mechanic` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Attributes` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx2` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx3` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx4` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx5` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx6` int(10) unsigned NOT NULL DEFAULT '0',
  `AttributesEx7` int(10) unsigned NOT NULL DEFAULT '0',
  `Stances` int(10) unsigned NOT NULL DEFAULT '0',
  `StancesNot` int(10) unsigned NOT NULL DEFAULT '0',
  `Targets` int(10) unsigned NOT NULL DEFAULT '0',
  `RequiresSpellFocus` int(10) unsigned NOT NULL DEFAULT '0',
  `CasterAuraState` int(10) unsigned NOT NULL DEFAULT '0',
  `TargetAuraState` int(10) NOT NULL DEFAULT '0',
  `CasterAuraStateNot` int(10) unsigned NOT NULL DEFAULT '0',
  `TargetAuraStateNot` int(10) NOT NULL DEFAULT '0',
  `CasterAuraSpell` int(10) unsigned NOT NULL DEFAULT '0',
  `TargetAuraSpell` int(10) unsigned NOT NULL DEFAULT '0',
  `ExcludeCasterAuraSpell` int(10) unsigned NOT NULL DEFAULT '0',
  `ExcludeTargetAuraSpell` int(10) unsigned NOT NULL DEFAULT '0',
  `CastingTimeIndex` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `RecoveryTime` int(10) unsigned NOT NULL DEFAULT '0',
  `CategoryRecoveryTime` int(10) unsigned NOT NULL DEFAULT '0',
  `InterruptFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `AuraInterruptFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `ProcFlags` int(10) unsigned NOT NULL DEFAULT '0',
  `ProcChance` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ProcCharges` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `MaxLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `BaseLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpellLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DurationIndex` smallint(5) unsigned NOT NULL DEFAULT '0',
  `PowerType` int(10) NOT NULL DEFAULT '0',
  `ManaCost` int(10) NOT NULL DEFAULT '0',
  `ManaCostPerLevel` int(10) NOT NULL DEFAULT '0',
  `ManaPerSecond` int(10) NOT NULL DEFAULT '0',
  `ManaPerSecondPerLevel` int(10) NOT NULL DEFAULT '0',
  `RangeIndex` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Speed` int(10) NOT NULL DEFAULT '0',
  `StackAmount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EquippedItemClass` int(11) NOT NULL DEFAULT '-1',
  `EquippedItemSubClassMask` int(11) NOT NULL DEFAULT '0',
  `EquippedItemInventoryTypeMask` int(11) NOT NULL DEFAULT '0',
  `Effect1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Effect2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `Effect3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectDieSides1` int(11) NOT NULL DEFAULT '0',
  `EffectDieSides2` int(11) NOT NULL DEFAULT '0',
  `EffectDieSides3` int(11) NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel1` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel2` float NOT NULL DEFAULT '0',
  `EffectRealPointsPerLevel3` float NOT NULL DEFAULT '0',
  `EffectBasePoints1` int(11) NOT NULL DEFAULT '0',
  `EffectBasePoints2` int(11) NOT NULL DEFAULT '0',
  `EffectBasePoints3` int(11) NOT NULL DEFAULT '0',
  `EffectMechanic1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectMechanic2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectMechanic3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetA3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectImplicitTargetB3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex1` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex2` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectRadiusIndex3` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName1` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName2` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EffectApplyAuraName3` smallint(5) unsigned NOT NULL DEFAULT '0',
  `EffectAmplitude1` int(11) NOT NULL DEFAULT '0',
  `EffectAmplitude2` int(11) NOT NULL DEFAULT '0',
  `EffectAmplitude3` int(11) NOT NULL DEFAULT '0',
  `EffectMultipleValue1` float NOT NULL DEFAULT '0',
  `EffectMultipleValue2` float NOT NULL DEFAULT '0',
  `EffectMultipleValue3` float NOT NULL DEFAULT '0',
  `EffectItemType1` int(11) NOT NULL DEFAULT '0',
  `EffectItemType2` int(11) unsigned NOT NULL DEFAULT '0',
  `EffectMiscValue1` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValue2` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValue3` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB1` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB2` int(11) NOT NULL DEFAULT '0',
  `EffectMiscValueB3` int(11) NOT NULL DEFAULT '0',
  `EffectTriggerSpell1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectTriggerSpell3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskA3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskB3` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC1` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC2` int(10) unsigned NOT NULL DEFAULT '0',
  `EffectSpellClassMaskC3` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellIconID` int(10) unsigned NOT NULL DEFAULT '0',
  `ManaCostPercentage` int(10) NOT NULL DEFAULT '0',
  `StartRecoveryCategory` int(10) NOT NULL DEFAULT '0',
  `StartRecoveryTime` int(10) NOT NULL DEFAULT '0',
  `MaxTargetLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyName` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags1` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags2` int(10) unsigned NOT NULL DEFAULT '0',
  `SpellFamilyFlags3` int(10) unsigned NOT NULL DEFAULT '0',
  `MaxAffectedTargets` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DmgClass` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `PreventionType` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DmgMultiplier1` float NOT NULL DEFAULT '0',
  `DmgMultiplier2` float NOT NULL DEFAULT '0',
  `DmgMultiplier3` float NOT NULL DEFAULT '0',
  `AreaGroupId` int(11) NOT NULL DEFAULT '0',
  `SchoolMask` int(10) unsigned NOT NULL DEFAULT '0',
  `RuneCostID` int(10) NOT NULL DEFAULT '0',
  `Comment` text NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Custom spell.dbc entries';


-- Spell disabled
-- Commit 70d09c64ce0d3263a7e4

DROP TABLE IF EXISTS `spell_disabled`;
CREATE TABLE `spell_disabled` (
    `entry` int(11) unsigned NOT NULL default 0 COMMENT 'spell entry',
    `ischeat_spell` tinyint(3) unsigned NOT NULL default 0 COMMENT 'mark spell as cheat',
    `active` tinyint(3) unsigned NOT NULL default 1 COMMENT 'enable check of this spell',
    PRIMARY KEY (`entry`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Disabled Spell System';

-- Vehicle accessory
-- Commit e197cf0cba3487dd1a3f

DROP TABLE IF EXISTS `vehicle_accessory`;
CREATE TABLE `vehicle_accessory` (
    `entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
    `accessory_entry` mediumint(8) unsigned NOT NULL DEFAULT '0',
    `seat_id` tinyint(1) NOT NULL DEFAULT '0',
    `minion` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `offset_x` FLOAT NOT NULL DEFAULT '0',
    `offset_y` FLOAT NOT NULL DEFAULT '0',
    `offset_z` FLOAT NOT NULL DEFAULT '0',
    `offset_o` FLOAT NOT NULL DEFAULT '0',
    `description` text NOT NULL,
    PRIMARY KEY (`entry`, `seat_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED COMMENT='Vehicle Accessory System';

-- Vehicle Tables
-- Commit 3be940faa44326abc801

ALTER TABLE `creature_template`
    ADD COLUMN `PowerType` tinyint(3) unsigned NOT NULL default '0' AFTER `MaxHealth`;

-- Areatrigger table format change

ALTER TABLE `areatrigger_teleport`
    CHANGE `required_quest_done` `required_quest_done_A` int(11) UNSIGNED NOT NULL DEFAULT "0" COMMENT "Alliance quest",
    CHANGE `required_quest_done_heroic` `required_quest_done_heroic_A` int(11) UNSIGNED NOT NULL DEFAULT "0" COMMENT "Alliance heroic quest",
    ADD COLUMN `required_quest_done_H` int(11) UNSIGNED NOT NULL DEFAULT "0" COMMENT "Horde quest" AFTER `required_quest_done_A`,
    ADD COLUMN `required_quest_done_heroic_H` int(11) UNSIGNED NOT NULL DEFAULT "0" COMMENT "Horde heroic quest" AFTER `required_quest_done_heroic_A`,
    ADD COLUMN `minGS` int(11) UNSIGNED NOT NULL DEFAULT "0" COMMENT "Min player gear score",
    ADD COLUMN `maxGS` int(11) UNSIGNED NOT NULL DEFAULT "0" COMMENT "Max player gear score",
    ADD COLUMN `achiev_id_0` int(11) UNSIGNED NOT NULL DEFAULT "0" COMMENT "Required achievement to enter in heroic difficulty",
    ADD COLUMN `achiev_id_1` int(11) UNSIGNED NOT NULL DEFAULT "0" COMMENT "Required achievement to enter in extra difficulty",
    ADD COLUMN `combat_mode` int(11) UNSIGNED NOT NULL DEFAULT "0" COMMENT "Possibility for enter while zone in combat";

UPDATE `areatrigger_teleport` SET `required_quest_done_H`=`required_quest_done_A` WHERE `required_quest_done_A` > 0;
UPDATE `areatrigger_teleport` SET `required_quest_done_heroic_H`=`required_quest_done_heroic_A` WHERE `required_quest_done_heroic_A` > 0;

-- Creature on kill Reputation

ALTER TABLE `creature_onkill_reputation`
    ADD COLUMN `ChampioningAura` int(11) unsigned NOT NULL default 0 AFTER `TeamDependent`;

-- Pet levelstats

ALTER TABLE `pet_levelstats`
    ADD `mindmg` MEDIUMINT(11) NOT NULL DEFAULT 0 COMMENT 'Min base damage' AFTER `armor`,
    ADD `maxdmg` MEDIUMINT(11) NOT NULL DEFAULT 0 COMMENT 'Max base damage' AFTER `mindmg`,
    ADD `attackpower` MEDIUMINT(11) NOT NULL DEFAULT 0 COMMENT 'Attack power' AFTER `maxdmg`;

-- Pet spell auras

ALTER TABLE `spell_pet_auras`
    DROP PRIMARY KEY,
    ADD PRIMARY KEY (`spell`, `effectId`, `pet`, `aura`);

CREATE TABLE IF NOT EXISTS `creature_spell` (
    `guid`      int(11) unsigned NOT NULL COMMENT 'Unique entry from creature_template',
    `spell`     int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell id from DBC',
    `index`     tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell index',
    `active`    tinyint(3) unsigned NOT NULL DEFAULT '0'COMMENT 'Active state for this spell',
    `disabled`  tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean state for spell',
    `flags`     int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Spell custom flags',
     PRIMARY KEY (`guid`,`index`,`active`)
) DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Creature spells storage';

-- Player race/faction change tables

CREATE TABLE IF NOT EXISTS `player_factionchange_achievements` (
    `alliance_id` int(8) NOT NULL,
    `horde_id` int(8) NOT NULL,
    `CommentA` varchar(255) NOT NULL,
    `CommentH` varchar(255) NOT NULL,
    PRIMARY KEY (`alliance_id`,`horde_id`)
) DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS `player_factionchange_items` (
    `race_A` int(8) NOT NULL DEFAULT '0',
    `alliance_id` int(8) NOT NULL,
    `commentA` varchar(255) DEFAULT NULL,
    `race_H` int(8) NOT NULL DEFAULT '0',
    `horde_id` int(8) NOT NULL,
    `commentH` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`alliance_id`,`horde_id`)
) DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS `player_factionchange_reputations` (
    `race_A` int(8) NOT NULL DEFAULT '0',
    `alliance_id` int(8) NOT NULL,
    `commentA` varchar(255) DEFAULT NULL,
    `race_H` int(8) NOT NULL DEFAULT '0',
    `horde_id` int(8) NOT NULL,
    `commentH` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`alliance_id`,`horde_id`)
) DEFAULT CHARSET=UTF8;

CREATE TABLE IF NOT EXISTS  `player_factionchange_spells` (
    `race_A` int(8) NOT NULL DEFAULT '0',
    `alliance_id` int(8) NOT NULL,
    `commentA` varchar(255) DEFAULT NULL,
    `race_H` int(8) NOT NULL DEFAULT '0',
    `horde_id` int(8) NOT NULL,
    `commentH` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`race_A`,`alliance_id`,`race_H`,`horde_id`)
) DEFAULT CHARSET=UTF8;

-- Implement spell linked definitions storage
CREATE TABLE IF NOT EXISTS `spell_linked` (
    `entry`            int(10) unsigned NOT NULL COMMENT 'Spell entry',
    `linked_entry`     int(10) unsigned NOT NULL COMMENT 'Linked spell entry',
    `type`             int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Type of link',
    `effect_mask`      int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'mask of effect (NY)',
    `comment`          varchar(255) NOT NULL DEFAULT '',
     PRIMARY KEY (`entry`,`linked_entry`,`type`)
) DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='Linked spells storage';

CREATE TABLE IF NOT EXISTS `worldstate_template` (
    `state_id`         int(10) unsigned NOT NULL COMMENT 'WorldState ID',
    `type`             int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'WorldState type',
    `condition`        int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Default condition (dependent from type)',
    `flags`            int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Default flags of WorldState',
    `default`          int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Default value of WorldState',
    `linked_id`        int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID of linked WorldState',
    `ScriptName`       char(64) NOT NULL default '' COMMENT 'Script name for WorldState (FFU)',
    `comment`          varchar(255) NOT NULL DEFAULT '',
    PRIMARY KEY (`state_id`,`type`,`condition`)
) DEFAULT CHARSET=utf8 PACK_KEYS=0 COMMENT='WorldState templates storage';
