-- use this SQL once after fresh build and after every DB update.
-- copy spells from creature_spell_template creature_spell table
REPLACE INTO `creature_spell` (`guid`,`spell`,`index`) (SELECT entry, spell1, 0 FROM `creature_template_spells` WHERE spell1 > 0);
REPLACE INTO `creature_spell` (`guid`,`spell`,`index`) (SELECT entry, spell2, 1 FROM `creature_template_spells` WHERE spell2 > 0);
REPLACE INTO `creature_spell` (`guid`,`spell`,`index`) (SELECT entry, spell3, 2 FROM `creature_template_spells` WHERE spell3 > 0);
REPLACE INTO `creature_spell` (`guid`,`spell`,`index`) (SELECT entry, spell4, 3 FROM `creature_template_spells` WHERE spell4 > 0);
REPLACE INTO `creature_spell` (`guid`,`spell`,`index`) (SELECT entry, spell5, 4 FROM `creature_template_spells` WHERE spell5 > 0);
REPLACE INTO `creature_spell` (`guid`,`spell`,`index`) (SELECT entry, spell6, 5 FROM `creature_template_spells` WHERE spell6 > 0);
REPLACE INTO `creature_spell` (`guid`,`spell`,`index`) (SELECT entry, spell7, 6 FROM `creature_template_spells` WHERE spell7 > 0);
REPLACE INTO `creature_spell` (`guid`,`spell`,`index`) (SELECT entry, spell8, 7 FROM `creature_template_spells` WHERE spell8 > 0);
