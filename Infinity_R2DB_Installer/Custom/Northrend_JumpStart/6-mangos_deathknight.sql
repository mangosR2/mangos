-- Delete Original Starting Location
DELETE FROM `playercreateinfo` WHERE (`class`='6');

-- Add New Starting Location
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('1', '6', '0', '4281', '2350.88', '-5667.98', '426.02');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('2', '6', '0', '4281', '2350.88', '-5667.98', '426.02');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('3', '6', '0', '4281', '2350.88', '-5667.98', '426.02');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('4', '6', '0', '4281', '2350.88', '-5667.98', '426.02');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('5', '6', '0', '4281', '2350.88', '-5667.98', '426.02');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('6', '6', '0', '4281', '2350.88', '-5667.98', '426.02');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('7', '6', '0', '4281', '2350.88', '-5667.98', '426.02');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('8', '6', '0', '4281', '2350.88', '-5667.98', '426.02');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('10', '6', '0', '4281', '2350.88', '-5667.98', '426.02');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('11', '6', '0', '4281', '2350.88', '-5667.98', '426.02');

-- Remove Original Bags
DELETE FROM `item_template` WHERE (`entry`='38145');

-- Remove Original Starting Gear
DELETE FROM `item_template` WHERE (`entry`='34652');
DELETE FROM `item_template` WHERE (`entry`='34657');
DELETE FROM `item_template` WHERE (`entry`='34655');
DELETE FROM `item_template` WHERE (`entry`='34659');
DELETE FROM `item_template` WHERE (`entry`='34650');
DELETE FROM `item_template` WHERE (`entry`='34653');
DELETE FROM `item_template` WHERE (`entry`='34649');
DELETE FROM `item_template` WHERE (`entry`='34651');
DELETE FROM `item_template` WHERE (`entry`='34656');
DELETE FROM `item_template` WHERE (`entry`='34648');
DELETE FROM `item_template` WHERE (`entry`='34658');
DELETE FROM `item_template` WHERE (`entry`='38147');

-- Add DK Quest Gear
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '38661', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '38663', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '38665', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '38666', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '38667', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '38668', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '38669', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '38670', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '38662', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '39322', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '38672', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '38671', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '38674', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '38675', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '38632', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '39208', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '38661', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '38663', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '38665', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '38666', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '38667', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '38668', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '38669', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '38670', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '38662', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '39322', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '38672', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '38671', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '38674', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '38675', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '38632', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '39208', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '38661', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '38663', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '38665', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '38666', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '38667', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '38668', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '38669', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '38670', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '38662', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '39322', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '38672', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '38671', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '38674', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '38675', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '38632', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '39208', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '38661', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '38663', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '38665', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '38666', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '38667', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '38668', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '38669', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '38670', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '38662', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '39322', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '38672', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '38671', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '38674', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '38675', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '38632', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '39208', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '38661', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '38663', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '38665', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '38666', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '38667', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '38668', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '38669', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '38670', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '38662', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '39322', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '38672', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '38671', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '38674', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '38675', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '38632', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '39208', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '38661', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '38663', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '38665', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '38666', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '38667', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '38668', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '38669', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '38670', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '38662', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '39322', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '38672', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '38671', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '38674', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '38675', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '38632', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '39208', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '38661', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '38663', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '38665', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '38666', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '38667', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '38668', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '38669', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '38670', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '38662', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '39322', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '38672', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '38671', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '38674', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '38675', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '38632', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '39208', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '38661', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '38663', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '38665', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '38666', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '38667', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '38668', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '38669', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '38670', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '38662', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '39322', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '38672', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '38671', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '38674', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '38675', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '38632', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '39208', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '38661', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '38663', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '38665', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '38666', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '38667', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '38668', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '38669', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '38670', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '38662', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '39322', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '38672', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '38671', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '38674', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '38675', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '38632', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '39208', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '38661', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '38663', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '38665', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '38666', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '38667', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '38668', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '38669', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '38670', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '38662', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '39322', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '38672', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '38671', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '38674', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '38675', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '38632', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '39208', '1');


-- Give DK Starting Spells
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('1', '6', '53428');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('1', '6', '50977');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('1', '6', '48778');

INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('2', '6', '53428');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('2', '6', '50977');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('2', '6', '48778');

INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('3', '6', '53428');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('3', '6', '50977');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('3', '6', '48778');

INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('4', '6', '53428');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('4', '6', '50977');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('4', '6', '48778');

INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('5', '6', '53428');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('5', '6', '50977');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('5', '6', '48778');

INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('6', '6', '53428');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('6', '6', '50977');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('6', '6', '48778');

INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('7', '6', '53428');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('7', '6', '50977');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('7', '6', '48778');

INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('8', '6', '53428');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('8', '6', '50977');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('8', '6', '48778');

INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('10', '6', '53428');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('10', '6', '50977');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('10', '6', '48778');

INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('11', '6', '53428');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('11', '6', '50977');
INSERT INTO `playercreateinfo_spell` (`race`, `class`, `Spell`) VALUES ('11', '6', '48778');

-- Adds DK Talent Quest
DELETE FROM `creature_questrelation` WHERE `quest` = 1042086;
DELETE FROM `gameobject_questrelation` WHERE `quest` = 1042086;
UPDATE `item_template` SET `StartQuest`=0 WHERE `StartQuest` = 1042086;
INSERT INTO `creature_questrelation` (`id`, `quest`) VALUES (29246, 1042086);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` = 29246;
DELETE FROM `creature_involvedrelation` WHERE `quest` = 1042086;
DELETE FROM `gameobject_involvedrelation` WHERE `quest` = 1042086;
INSERT INTO `creature_involvedrelation` (`id`, `quest`) VALUES (29246, 1042086);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry`=29246;
REPLACE INTO `quest_template` (`entry`, `Method`, `ZoneOrSort`, `MinLevel`, `QuestLevel`, `Type`, `RequiredRaces`, `RequiredSkillValue`, `RepObjectiveFaction`, `RepObjectiveValue`, `RequiredMinRepFaction`, `RequiredMinRepValue`, `RequiredMaxRepFaction`, `RequiredMaxRepValue`, `SuggestedPlayers`, `LimitTime`, `QuestFlags`, `SpecialFlags`, `CharTitleId`, `PlayersSlain`, `BonusTalents`, `PrevQuestId`, `NextQuestId`, `ExclusiveGroup`, `NextQuestInChain`, `SrcItemId`, `SrcItemCount`, `SrcSpell`, `Title`, `Details`, `Objectives`, `OfferRewardText`, `RequestItemsText`, `EndText`, `ObjectiveText1`, `ObjectiveText2`, `ObjectiveText3`, `ObjectiveText4`, `ReqItemId1`, `ReqItemId2`, `ReqItemId3`, `ReqItemId4`, `ReqItemCount1`, `ReqItemCount2`, `ReqItemCount3`, `ReqItemCount4`, `ReqSourceId1`, `ReqSourceId2`, `ReqSourceId3`, `ReqSourceId4`, `ReqSourceCount1`, `ReqSourceCount2`, `ReqSourceCount3`, `ReqSourceCount4`, `ReqCreatureOrGOId1`, `ReqCreatureOrGOId2`, `ReqCreatureOrGOId3`, `ReqCreatureOrGOId4`, `ReqCreatureOrGOCount1`, `ReqCreatureOrGOCount2`, `ReqCreatureOrGOCount3`, `ReqCreatureOrGOCount4`, `ReqSpellCast1`, `ReqSpellCast2`, `ReqSpellCast3`, `ReqSpellCast4`, `RewChoiceItemId1`, `RewChoiceItemId2`, `RewChoiceItemId3`, `RewChoiceItemId4`, `RewChoiceItemId5`, `RewChoiceItemId6`, `RewChoiceItemCount1`, `RewChoiceItemCount2`, `RewChoiceItemCount3`, `RewChoiceItemCount4`, `RewChoiceItemCount5`, `RewChoiceItemCount6`, `RewItemId1`, `RewItemId2`, `RewItemId3`, `RewItemId4`, `RewItemCount1`, `RewItemCount2`, `RewItemCount3`, `RewItemCount4`, `RewRepFaction1`, `RewRepFaction2`, `RewRepFaction3`, `RewRepFaction4`, `RewRepFaction5`, `RewRepValue1`, `RewRepValue2`, `RewRepValue3`, `RewRepValue4`, `RewRepValue5`, `RewOrReqMoney`, `RewMoneyMaxLevel`, `RewSpell`, `RewSpellCast`, `RewMailTemplateId`, `RewMailDelaySecs`, `PointMapId`, `PointX`, `PointY`, `PointOpt`, `DetailsEmote1`, `DetailsEmote2`, `DetailsEmote3`, `DetailsEmote4`, `DetailsEmoteDelay1`, `DetailsEmoteDelay2`, `DetailsEmoteDelay3`, `DetailsEmoteDelay4`, `IncompleteEmote`, `CompleteEmote`, `OfferRewardEmote1`, `OfferRewardEmote2`, `OfferRewardEmote3`, `OfferRewardEmote4`, `OfferRewardEmoteDelay1`, `OfferRewardEmoteDelay2`, `OfferRewardEmoteDelay3`, `OfferRewardEmoteDelay4`, `StartScript`, `CompleteScript`) VALUES (1042086, 2, 0, 55, 55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 46, 0, 0, 0, 0, 0, 0, 0, 'Power to the Death Knight', '$N, You have done a great service to the Ebon Blade. With Arthas returned to Northrend it is up to you to travel the world and seek your redemption. Before you head out, allow me to bestow upon you great power to use in whatever way you see fit.', 'Highlord Darion Mograine wants you to speak to him when you are ready to receive your powers to spend in Blood, Frost or Unholy.', '', '', '', 'Speak to Highlord Darion Mograine', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 47, 54, 69, 930, 9000, 9000, 9000, 9000, 9000, 0, 0, 51721, 51721, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

UPDATE `quest_template` SET `ZoneOrSort` = -372 WHERE `entry` = 1042086;

-- Updated Death Knight Gear to Level 70 Stats

-- Helm
UPDATE `item_template` SET `AllowableClass` = 32, `RequiredLevel` = 70, `stat_value1` = 20, `stat_value2` = 34, `stat_value3` = 24, `stat_type4` = 35, `stat_value4` = 26, `armor` = 946, `socketColor_1` = 1, `socketColor_2` = 4, `socketBonus` = 2856 WHERE `entry` = 38661;

-- Neck
UPDATE `item_template` SET `AllowableClass` = 32, `RequiredLevel` = 70, `stat_value1` = 19, `stat_value2` = 22, `stat_value3` = 17, `socketColor_1` = 8, `socketBonus` = 2754 WHERE `entry` = 38662;

-- Shoulders
UPDATE `item_template` SET `AllowableClass` = 32, `RequiredLevel` = 70, `stat_value2` = 36, `stat_type4` = 32, `stat_value4` = 17, `stat_type5` = 35, `stat_value5` = 20, `armor` = 873, `socketColor_1` = 2, `socketColor_2` = 4, `socketBonus` = 2859 WHERE `entry` = 38663;

-- Cape
UPDATE `item_template` SET `AllowableClass` = 32, `RequiredLevel` = 70, `stat_value1` = 20, `stat_value2` = 18, `stat_value3` = 19, `stat_type4` = 13, `stat_value4` = 14, `armor` = 149, `frost_res` = 15, `shadow_res` = 5 WHERE `entry` = 39322;

-- Chest
UPDATE `item_template` SET `AllowableClass` = 32, `RequiredLevel` = 70, `stat_value2` = 46, `stat_type4` = 32, `stat_value4` = 24, `stat_type5` = 35, `stat_value5` = 26, `armor` = 1164, `socketColor_1` = 2, `socketColor_2` = 2, `socketColor_3` = 4, `socketBonus` = 2864 WHERE `entry` = 38665;

-- Bracers
UPDATE `item_template` SET `AllowableClass` = 32, `RequiredLevel` = 70, `stat_value1` = 16, `stat_value2` = 22, `stat_value3` = 16, `stat_type4` = 12, `stat_value4` = 8, `armor` = 509 WHERE `entry` = 38666;

-- Gloves
UPDATE `item_template` SET `AllowableClass` = 32, `RequiredLevel` = 70, `stat_value1` = 22, `stat_value3` = 30, `stat_type4` = 32, `stat_value4` = 21, `stat_type5` = 35, `stat_value5` = 24, `armor` = 728, `spellid_1` = 58718, `spelltrigger_1` = 1 WHERE `entry` = 38667;

-- Belt
UPDATE `item_template` SET `AllowableClass` = 32, `RequiredLevel` = 70, `stat_value1` = 29, `stat_value2` = 24, `stat_value3` = 15, `armor` = 655, `socketColor_1` = 4, `socketBonus` = 2849 WHERE `entry` = 38668;

-- Legs
UPDATE `item_template` SET `AllowableClass` = 32, `RequiredLevel` = 70, `stat_value3` = 46, `stat_type4` = 32, `stat_value4` = 28, `stat_type5` = 35, `stat_value5` = 30, `armor` = 1019 WHERE `entry` = 38669;

-- Boots
UPDATE `item_template` SET `AllowableClass` = 32, `RequiredLevel` = 70, `stat_value1` = 25, `stat_value2` = 21, `stat_value3` = 20, `stat_type4` = 13, `stat_value4` = 13, `armor` = 800, `socketColor_1` = 2, `socketBonus` = 38 WHERE `entry` = 38670;

-- Ring 1
UPDATE `item_template` SET `AllowableClass` = 32, `RequiredLevel` = 70, `stat_value1` = 24, `stat_value2` = 21, `stat_value3` = 12, `stat_type4` = 14, `stat_value4` = 6, `armor` = 218, `frost_res` = 10 WHERE `entry` = 38672;

-- Ring 2
UPDATE `item_template` SET `AllowableClass` = 32, `RequiredLevel` = 70, `stat_value1` = 17, `stat_value2` = 23, `stat_value3` = 16, `stat_type4` = 13, `stat_value4` = 8, `armor` = 196, `shadow_res` = 5 WHERE `entry` = 38671;

-- Trinket 1
UPDATE `item_template` SET `AllowableClass` = 32, `RequiredLevel` = 70, `stat_type2` = 7, `stat_value2` = 24 WHERE `entry` = 38674;

-- Trinket 2
UPDATE `item_template` SET `AllowableClass` = 32, `RequiredLevel` = 70, `stat_type2` = 7, `stat_value2` = 18 WHERE `entry` = 38675;

-- Sword
UPDATE `item_template` SET `AllowableClass` = 32, `RequiredLevel` = 70, `stat_value2` = 32, `stat_value3` = 26, `stat_type4` = 32, `stat_value4` = 35, `dmg_min1` = 253, `dmg_max1` = 381, `dmg_min2` = 18, `dmg_max2` = 24, `dmg_type2` = 4, `spelltrigger_1` = 0, `socketColor_1` = 2, `socketColor_2` = 8, `socketColor_3` = 8, `socketBonus` = 1899 WHERE `entry` = 38632;

-- Adds Bags and Hearthstone to All DK's
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '6948', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('1', '6', '4500', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '6948', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('2', '6', '4500', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '6948', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('3', '6', '4500', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '6948', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('4', '6', '4500', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '6948', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('5', '6', '4500', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '6948', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('6', '6', '4500', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '6948', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('7', '6', '4500', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '6948', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('8', '6', '4500', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '6948', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('10', '6', '4500', '1');

INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '6948', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '4500', '1');
INSERT INTO `playercreateinfo_item` (`race`, `class`, `itemid`, `amount`) VALUES ('11', '6', '4500', '1');