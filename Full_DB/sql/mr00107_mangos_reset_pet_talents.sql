-- missing trainer_class for enable gossip menu
UPDATE `creature_template` SET `trainer_type` = 3, `trainer_class` = 3 WHERE `subname` = 'Pet Trainer';