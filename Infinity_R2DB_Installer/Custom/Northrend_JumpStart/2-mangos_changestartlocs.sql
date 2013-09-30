-- Delete Original Starting Locations
DELETE FROM `playercreateinfo` WHERE (`class`='1');
DELETE FROM `playercreateinfo` WHERE (`class`='2');
DELETE FROM `playercreateinfo` WHERE (`class`='3');
DELETE FROM `playercreateinfo` WHERE (`class`='4');
DELETE FROM `playercreateinfo` WHERE (`class`='5');
DELETE FROM `playercreateinfo` WHERE (`class`='7');
DELETE FROM `playercreateinfo` WHERE (`class`='8');
DELETE FROM `playercreateinfo` WHERE (`class`='9');
DELETE FROM `playercreateinfo` WHERE (`class`='11');

-- Add New Starting Locations
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('1', '1', '0', '1519', '-8704.89', '327.02', '111.88');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('1', '2', '0', '1519', '-8581.50', '878.01', '106.51');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('1', '4', '0', '1519', '-8799.56', '328.40', '103.08');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('1', '8', '0', '1519', '-9015.30', '871.81', '29.62');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('1', '5', '0', '1519', '-8522.06', '858.31', '108.52');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('1', '9', '0', '1519', '-8988.58', '1036.63', '101.40');

INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('3', '1', '0', '1537', '-5048.94', '-1267.63', '510.32');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('3', '2', '0', '1537', '-4606.70', '-902.55', '502.76');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('3', '3', '0', '1537', '-5014.76', '-1268.57', '507.75');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('3', '4', '0', '1537', '-4647.38', '-1122.52', '502.25');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('3', '5', '0', '1537', '-4619.70', '-901.51', '524.69');

INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('7', '1', '0', '1537', '-5048.94', '-1267.63', '510.32');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('7', '4', '0', '1537', '-4647.38', '-1122.52', '502.25');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('7', '8', '0', '1537', '-4613.75', '-918.64', '501.06');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('7', '9', '0', '1537', '-4603.45', '-1110.25', '504.93');

INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('4', '1', '1', '1657', '9986.57', '2319.22', '1330.78');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('4', '3', '1', '1657', '10195.05', '2518.68', '1368.33');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('4', '4', '1', '1657', '10055.54', '2575.38', '1282.76');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('4', '11', '1', '1657', '10174.65', '2566.48', '1340.13');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('4', '5', '1', '1657', '9660.99', '2522.35', '1360.00');

INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('11', '1', '530', '3557', '-4199.29', '-11655.22', '-99.78');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('11', '2', '530', '3557', '-4199.62', '-11477.93', '-132.27');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('11', '7', '530', '3557', '-3813.26', '-11394.91', '-104.34');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('11', '3', '530', '3557', '-4240.85', '-11561.37', '-126.22');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('11', '8', '530', '3557', '-4052.27', '-11556.72', '-138.49');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('11', '5', '530', '3557', '-3969.09', '-11476.19', '-135.21');

INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('2', '1', '1', '1637', '1976.11', '-4793.69', '55.79');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('2', '7', '1', '1637', '1925.23', '-4218.17', '40.94');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('2', '3', '1', '1637', '2091.26', '-4612.95', '58.36');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('2', '4', '1', '1637', '1767.07', '-4308.14', '7.14');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('2', '9', '1', '1637', '1830.34', '-4356.65', '-14.52');

INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('8', '1', '1', '1637', '1976.11', '-4793.69', '55.79');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('8', '7', '1', '1637', '1925.23', '-4218.17', '40.94');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('8', '3', '1', '1637', '2091.26', '-4612.95', '58.36');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('8', '4', '1', '1637', '1767.07', '-4308.14', '7.14');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('8', '8', '1', '1637', '1463.77', '-4223.12', '42.95');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('8', '5', '1', '1637', '1451.87', '-4181.56', '61.33');

INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('6', '1', '1', '1638', '-1468.56', '-82.05', '161.10');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('6', '7', '1', '1638', '-989.04', '282.14', '137.59');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('6', '3', '1', '1638', '-1476.84', '-86.63', '161.10');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('6', '11', '1', '1638', '-1063.34', '-283.01', '159.03');

INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('5', '1', '0', '1497', '1775.64', '418.45', '-58.03');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('5', '4', '0', '1497', '1403.50', '62.99', '-62.28');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('5', '8', '0', '1497', '1783.52', '54.36', '-61.49');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('5', '9', '0', '1497', '1776.85', '48.85', '-61.49');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('5', '5', '0', '1497', '1762.85', '397.40', '-57.21');

INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('10', '2', '530', '3487', '9843.59', '-7515.19', '19.68');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('10', '3', '530', '3487', '9932.38', '-7418.87', '12.35');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('10', '4', '530', '3487', '9735.12', '-7362.15', '24.33');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('10', '8', '530', '3487', '9990.85', '-7112.41', '47.70');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('10', '9', '530', '3487', '9782.40', '-7287.72', '13.38');
INSERT INTO `playercreateinfo` (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`) VALUES ('10', '5', '530', '3487', '9932.29', '-7048.43', '47.71');