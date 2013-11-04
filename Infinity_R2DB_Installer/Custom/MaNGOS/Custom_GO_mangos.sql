-- --------------------------------------------------------------------------- --
-- ----------------------------  Custom GO Data   ---------------------------- --
-- ---------------------------- ----------------- ---------------------------- --

-- --------------------------------------------------------------------------------------------------------------- --
-- Scripted Custom GO

-- Chest Bank 500000
REPLACE into `gameobject_template` VALUES ('500000','3','259','Chest','','','','0','0','1','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','custom_gameobject_chestbank');

-- Deception Device 500001
REPLACE into `gameobject_template` VALUES ('500001','3','7179','Deception Device','','','','0','0','1','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','custom_gameobject_deception_orb');

-- Morphing Device 500002
REPLACE into `gameobject_template` VALUES ('500002','3','7179','Morphing Device','','','','0','0','1','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','custom_gameobject_morph');

-- Spell Device 500003
REPLACE into `gameobject_template` VALUES ('500003','3','7179','Spell Device','','','','0','0','1','0','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','1','0','0','0','0','0','0','0','0','0','0','0','0','0','custom_gameobject_spellmachine');


-- --------------------------------------------------------------------------------------------------------- --
-- Reg Custom GO

-- new portal sql ( orc city, undercity, bootybay , and felwood)

DELETE FROM `gameobject_template` WHERE (`entry`=500004);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `ScriptName`) VALUES (500004, 22, 4396, 'Portal to Orgrimmar', '', '', '', 474, 0, 1, 0, 0, 0, 0, 0, 0, 4996, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `gameobject_template` WHERE (`entry`=500005);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `ScriptName`) VALUES (500005, 22, 4396, 'Portal to Undercity', '', '', '', 474, 0, 1, 0, 0, 0, 0, 0, 0, 5000, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `gameobject_template` WHERE (`entry`=500006);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `ScriptName`) VALUES (500006, 22, 4396, 'Portal to Booty Bay', '', '', '', 474, 0, 1, 0, 0, 0, 0, 0, 0, 4997, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

DELETE FROM `gameobject_template` WHERE (`entry`=500008);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `ScriptName`) VALUES (500008, 22, 4396, 'Portal to Felwood', '', '', '', 474, 0, 1, 0, 0, 0, 0, 0, 0, 6483, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- GMIsle ship

DELETE FROM `gameobject_template` WHERE (`entry`=500007);
INSERT INTO `gameobject_template` (`entry`, `type`, `displayId`, `name`, `IconName`, `castBarCaption`, `unk1`, `faction`, `flags`, `size`, `questItem1`, `questItem2`, `questItem3`, `questItem4`, `questItem5`, `questItem6`, `data0`, `data1`, `data2`, `data3`, `data4`, `data5`, `data6`, `data7`, `data8`, `data9`, `data10`, `data11`, `data12`, `data13`, `data14`, `data15`, `data16`, `data17`, `data18`, `data19`, `data20`, `data21`, `data22`, `data23`, `mingold`, `maxgold`, `ScriptName`) VALUES (500007, 14, 3015, 'Ship (GM Island)', '', '', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
