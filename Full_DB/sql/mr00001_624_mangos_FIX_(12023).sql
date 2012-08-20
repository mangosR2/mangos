# Y2kCat
ALTER TABLE db_version_ytdb CHANGE COLUMN 623_FIX_12005 624_FIX_12023 bit;
REPLACE INTO `db_version_ytdb` (`version`) VALUES ('624_FIX_12023');

# FIX_Spawn_Sniff_ICC
# UPDATE `gameobject` SET `position_z` = `position_z` - 200 WHERE `guid` IN (8790, 8322, 8344, 8377, 8482, 9007, 8310, 8364, 8304, 8967);
# UPDATE `creature` SET `position_z` = `position_z` - 200 WHERE `guid` IN (115781, 115782);
UPDATE `creature` SET `position_z` = 864.959 WHERE `id` = 36597;
UPDATE `creature` SET `position_z` = 840.94 WHERE `id` = 38995;
REPLACE INTO gameobject VALUES
(8344, 202078, 631, 15, 1, 503.62, -2124.65, 836.607, 3.14159, 0, 0, 0, 1, 604800, 255, 1),
(8364, 202141, 631, 15, 1, 473.748, -2096.48, 840.857, 3.14159, 0, 0, 1, 0, 604800, 255, 1),
(8304, 202142, 631, 15, 1, 473.748, -2152.83, 840.857, -1.5708, 0, 0, 1, 0, 604800, 255, 1),
(8310, 202143, 631, 15, 1, 533.56, -2152.83, 840.857, 0, 0, 0, 1, 0, 604800, 255, 1),
(9007, 202144, 631, 15, 1, 533.56, -2096.48, 840.857, 1.5708, 0, 0, 1, 0, 604800, 255, 1),
(8322, 202161, 631, 15, 1, 503.62, -2124.66, 836.607, 3.14159, 0, 0, 0, 1, 604800, 255, 1),
(8790, 202190, 631, 15, 1, 503.62, -2124.65, 840.522, 3.14159, 0, 0, 1, 0, 604800, 255, 1),
(2625, 202436, 631, 15, 1, 426.561, -2123.86, 864.889, -3.12412, 0, 0, 0, 1, -604800, 255, 1),
(8967, 202437, 631, 15, 1, 425.089, -2123.31, 858.675, 0, 0, 0, 0, 1, 604800, 255, 1),
(8482, 202189, 631, 15, 1, 503.62, -2124.66, 836.607, 3.14159, 0, 0, 0, 1, 6000, 255, 1),
(8377, 202188, 631, 15, 1, 503.62, -2124.66, 836.607, 3.14159, 0, 0, 0, 1, 6000, 255, 0),
(12000, 202438, 631, 15, 1, 425.089, -2123.31, 858.675, 0, 0, 0, 0, 1, -604800, 255, 1);

# NeatElves
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1588', '9', '9454', '0');
UPDATE `gossip_menu_option` SET `cond_1_val_1`='9454', `condition_id`='1588' WHERE `menu_id`=7368 AND `id`=3;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1589', '8', '3781', '0');
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(1403, 3, 1, 'I''d like to purchase more Tharlendris seeds.', 3, 128, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1589);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1588', '9', '9454', '0');
UPDATE `gossip_menu_option` SET `cond_1_val_1`='9454', `condition_id`='1588' WHERE `menu_id`=7368 AND `id`=3;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1589', '8', '3781', '0');
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(1403, 3, 1, 'I''d like to purchase more Tharlendris seeds.', 3, 128, 0, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1589);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(126117, 10445, 0, 1, 1, 0, 0, -9541.73, 87.4378, 59.3029, 6.23082, 180, 0, 0, 955, 0, 0),
(4950, 14822, 0, 1, 1, 0, 0, -9536.62, 73.2432, 58.9648, 1.90241, 180, 0, 0, 2091, 2117, 0),
(4972, 14827, 0, 1, 1, 0, 0, -9558.14, 78.5432, 59.0065, 0.488762, 180, 0, 0, 3052, 0, 0),
(4947, 14829, 0, 1, 1, 0, 0, -9548.9, 141.163, 58.9648, 4.83456, 180, 0, 0, 2614, 0, 0),
(4899, 14832, 0, 1, 1, 0, 0, -9558.18, 130.175, 58.9648, 5.70723, 180, 0, 0, 2614, 0, 0),
(4871, 14841, 0, 1, 1, 0, 0, -9576.4, 87.7237, 58.9648, 6.23082, 180, 0, 0, 2614, 0, 0),
(4893, 14844, 0, 1, 1, 0, 0, -9561.12, 69.9691, 59.2053, 1.01229, 180, 0, 0, 1220, 0, 0),
(4891, 14845, 0, 1, 1, 0, 0, -9564.5, 72.2799, 59.1869, 0.663225, 180, 0, 0, 1220, 0, 0),
(4890, 14846, 0, 1, 1, 0, 0, -9557.49, 105.464, 58.9648, 4.64258, 180, 0, 0, 1220, 0, 0),
(4895, 14847, 0, 1, 1, 0, 0, -9560.98, 103.642, 58.9648, 5.5676, 180, 0, 0, 1220, 0, 0),
(4999, 14849, 0, 1, 1, 0, 0, -9544.69, 73.6216, 59.0065, 0.573501, 180, 0, 0, 699, 0, 0),
(4998, 14849, 0, 1, 1, 0, 0, -9571.82, 90.374, 59.0065, 0.978225, 180, 0, 0, 699, 0, 0),
(126119, 14860, 0, 1, 1, 0, 0, -9515.7, 85.8905, 59.3007, 2.40195, 180, 0, 0, 86, 0, 2),
(4967, 14864, 0, 1, 1, 0, 0, -9542.36, 114.763, 59.1315, 3.3116, 180, 5, 0, 102, 0, 1),
(4949, 14864, 0, 1, 1, 0, 0, -9545.21, 130.871, 59.0065, 4.36626, 180, 5, 0, 102, 0, 1),
(36222, 14865, 0, 1, 1, 0, 0, -9555.53, 115.845, 58.9683, 5.74213, 180, 0, 0, 594, 0, 0),
(126118, 14866, 0, 1, 1, 0, 0, -9505.33, 90.1907, 59.3085, 4.70132, 180, 0, 0, 102, 0, 2),
(49037, 14868, 0, 1, 1, 0, 0, -9538.58, 133.231, 58.9648, 4.03171, 180, 0, 0, 156, 0, 0),
(4931, 14869, 0, 1, 1, 0, 0, -9547.29, 137.246, 58.9143, 5.09003, 180, 5, 0, 42, 0, 1),
(4930, 14869, 0, 1, 1, 0, 0, -9549.82, 112.997, 59.0065, 3.32908, 180, 5, 0, 42, 0, 1),
(4922, 14869, 0, 1, 1, 0, 0, -9554.05, 125.139, 59.0065, 1.47803, 180, 5, 0, 42, 0, 1),
(4912, 14869, 0, 1, 1, 0, 0, -9540.22, 123.264, 59.0065, 5.01385, 180, 5, 0, 42, 0, 1),
(125584, 14871, 0, 1, 1, 0, 0, -9566.38, 31.1655, 61.4444, 1.58992, 180, 0, 0, 247, 0, 0),
(35371, 15303, 0, 1, 1, 0, 0, -9570.41, -10.6037, 63.4679, 1.47533, 180, 0, 0, 1220, 0, 0);
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(16084, 180006, 0, 1, 1, -9559.52, 53.4495, 60.136, 1.36136, 0, 0, 0.629322, 0.777145, 180, 100, 1),
(10611, 180006, 0, 1, 1, -9555.57, 54.1968, 60.1749, 2.11185, 0, 0, 0.870356, 0.492423, 180, 100, 1),
(11390, 180029, 0, 1, 1, -9515.35, 86.6149, 59.0797, 2.96706, 0, 0, 0.996195, 0.0871556, 180, 100, 1),
(8194, 180036, 0, 1, 1, -9603.53, 52.1962, 63.1735, 2.55118, 0, 0, 0.956742, 0.290937, 25, 0, 1),
(5324, 180036, 0, 1, 1, -9600.74, 21.1644, 63.1988, 5.11239, 0, 0, 0.552531, -0.833492, 25, 0, 1),
(8174, 180036, 0, 1, 1, -9551.95, 41.1687, 61.8756, -0.418879, 0, 0, -0.207912, 0.978148, 180, 100, 1),
(14807, 180036, 0, 1, 1, -9558.04, 15.1922, 63.009, 0.715585, 0, 0, 0.350207, 0.936672, 180, 100, 1),
(5076, 180030, 0, 1, 1, -9534.2, 68.6959, 59.3954, -1.69297, 0, 0, -0.748956, 0.66262, 180, 100, 1),
(13520, 180031, 0, 1, 1, -9563.75, 66.4712, 60.5913, -1.93731, 0, 0, -0.824125, 0.566409, 180, 100, 1),
(3076, 180032, 0, 1, 1, -9560.39, 106.003, 60.5481, 3.00197, 0, 0, 0.997564, 0.0697546, 180, 100, 1),
(14238, 180034, 0, 1, 1, -9530, 99.0359, 59.3857, -0.994838, 0, 0, -0.477159, 0.878817, 180, 100, 1),
(16483, 180037, 0, 1, 1, -9542, 136.385, 59.2148, -1.13446, 0, 0, -0.537298, 0.843393, 180, 100, 1),
(16488, 180037, 0, 1, 1, -9553.33, 110.428, 59.1801, -1.25664, 0, 0, -0.587786, 0.809016, 180, 100, 1),
(16489, 180038, 0, 1, 1, -9560.48, 123.28, 59.2266, 0.20944, 0, 0, 0.104529, 0.994522, 180, 100, 1),
(16498, 180038, 0, 1, 1, -9532.87, 120.536, 59.2362, -2.96706, 0, 0, -0.996195, 0.0871556, 180, 100, 1),
(14742, 180038, 0, 1, 1, -9554.68, 138.057, 59.187, -1.01229, 0, 0, -0.484809, 0.87462, 180, 100, 1),
(15959, 180045, 0, 1, 1, -9568.85, 26.1816, 61.2764, 0.767945, 0, 0, 0.374607, 0.927184, 180, 100, 1),
(10489, 180045, 0, 1, 1, -9580.79, 28.3274, 60.6627, -1.309, 0, 0, -0.608763, 0.793352, 180, 100, 1),
(14741, 180045, 0, 1, 1, -9573.3, 37.0724, 60.4675, 3.00197, 0, 0, 0.997564, 0.0697546, 180, 100, 1),
(3572, 180046, 0, 1, 1, -9572.6, 33.3993, 61.2556, -2.04204, 0, 0, -0.852641, 0.522496, 180, 100, 1),
(10819, 180046, 0, 1, 1, -9574.43, 33.592, 61.162, -1.29154, 0, 0, -0.601814, 0.798637, 180, 100, 1),
(13201, 180046, 0, 1, 1, -9577.11, 28.9335, 61.0503, 0.767945, 0, 0, 0.374607, 0.927184, 180, 100, 1),
(10862, 180046, 0, 1, 1, -9571.2, 28.7882, 61.4907, 2.54818, 0, 0, 0.956305, 0.292372, 180, 100, 1),
(10856, 180047, 0, 1, 1, -9573.48, 33.6922, 61.2497, -1.71042, 0, 0, -0.754709, 0.65606, 180, 100, 1),
(10853, 180047, 0, 1, 1, -9571.72, 27.8073, 61.4719, -1.06465, 0, 0, -0.507538, 0.861629, 180, 100, 1),
(10852, 180047, 0, 1, 1, -9577.95, 29.7229, 61.0439, -2.72271, 0, 0, -0.978147, 0.207914, 180, 100, 1),
(10851, 180049, 0, 1, 1, -9571.81, 28.07, 61.9897, 2.79253, 0, 0, 0.984808, 0.173647, 180, 100, 1),
(10850, 180049, 0, 1, 1, -9573.65, 33.65, 61.7434, -1.36136, 0, 0, -0.629322, 0.777145, 180, 100, 1),
(16048, 180039, 0, 1, 1, -9550.79, 144.551, 59.3467, 2.54818, 0, 0, 0.956305, 0.292372, 180, 100, 1),
(14612, 180041, 0, 1, 1, -9556.3, 116.333, 58.8582, -1.98968, 0, 0, -0.83867, 0.54464, 180, 100, 1),
(1703, 180042, 0, 1, 1, -9576.61, 89.6703, 58.8815, 0.575959, 0, 0, 0.284016, 0.95882, 180, 100, 1),
(2062, 180040, 0, 1, 1, -9558.64, 119.835, 58.854, -1.20428, 0, 0, -0.566406, 0.824126, 180, 100, 1),
(12673, 180040, 0, 1, 1, -9538.27, 133.446, 58.8815, 2.47837, 0, 0, 0.945519, 0.325567, 180, 100, 1),
(12703, 180044, 0, 1, 1, -9547.15, 84.5487, 58.1561, -0.907571, 0, 0, -0.438371, 0.898794, 180, 100, 1),
(70247, 181029, 0, 1, 1, -9574.1, 30.2205, 61.2259, 1.22173, 0, 0, 0.573576, 0.819152, 180, 100, 1),
(70246, 180053, 0, 1, 1, -9574.1, 30.2205, 61.2259, 1.22173, 0, 0, 0.573576, 0.819152, 180, 100, 1),
(16927, 180040, 0, 1, 1, -9557.69, 134.367, 58.8329, -2.26893, 0, 0, -0.906307, 0.422619, 180, 100, 1),
(16926, 180043, 0, 1, 1, -9556.71, 69.5335, 58.9567, -0.820305, 0, 0, -0.398749, 0.91706, 180, 100, 1),
(8516, 180043, 0, 1, 1, -9539.89, 72.8221, 58.8815, 2.72271, 0, 0, 0.978147, 0.207914, 180, 100, 1),
(8517, 180043, 0, 1, 1, -9541.98, 80.8587, 59.1252, -0.087267, 0, 0, -0.0436197, 0.999048, 180, 100, 1),
(9661, 180043, 0, 1, 1, -9533.74, 74.5172, 58.8815, -1.27409, 0, 0, -0.594823, 0.803857, 180, 100, 1),
(10392, 180043, 0, 1, 1, -9573.83, 82.3919, 58.8815, 2.56563, 0, 0, 0.958819, 0.284017, 180, 100, 1),
(14475, 180043, 0, 1, 1, -9566.04, 76.5801, 58.8981, 0.855211, 0, 0, 0.414693, 0.909961, 180, 100, 1),
(15865, 180043, 0, 1, 1, -9553.62, 104.592, 58.8828, -1.98968, 0, 0, -0.838672, 0.544637, 180, 100, 1),
(8515, 180043, 0, 1, 1, -9557.68, 54.6593, 60.3315, 1.71042, 0, 0, 0.754709, 0.65606, 180, 100, 1),
(21, 180043, 0, 1, 1, -9531.2, 117.723, 59.1229, 2.05949, 0, 0, 0.857168, 0.515037, 180, 100, 1),
(5375, 180043, 0, 1, 1, -9563.43, 99.4973, 58.8815, -1.64061, 0, 0, -0.731354, 0.681998, 180, 100, 1),
(4041, 180043, 0, 1, 1, -9546.52, 140.876, 58.8815, -1.18682, 0, 0, -0.559191, 0.829039, 180, 100, 1),
(16025, 180043, 0, 1, 1, -9530.79, 92.2459, 58.8815, -3.12414, 0, 0, -0.999962, 0.0087262, 180, 100, 1),
(16940, 180043, 0, 1, 1, -9537.02, 98.595, 58.8815, -2.9147, 0, 0, -0.993572, 0.113203, 180, 100, 1),
(16939, 180048, 0, 1, 1, -9577.74, 29.818, 61.5466, 0.663225, 0, 0, 0.325568, 0.945519, 180, 100, 1),
(16938, 180048, 0, 1, 1, -9573.39, 33.7, 61.7433, 0.977384, 0, 0, 0.469471, 0.882948, 180, 100, 1),
(7270, 180515, 0, 1, 1, -9571.3, -18.8353, 62.7875, 4.90124, 0, 0, 0.637287, -0.770626, 180, 0, 1);
REPLACE INTO `game_event_gameobject` (`guid`, `event`) VALUES ('10862', '4'), ('10856', '4');
REPLACE INTO `game_event_gameobject` (`guid`, `event`) VALUES ('10853', '4'), ('10852', '4');
REPLACE INTO `game_event_gameobject` (`guid`, `event`) VALUES ('10851', '4'), ('10850', '4');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1590', '30', '942', '4'),('1591', '30', '942', '5'),('1592', '30', '942', '6'),('1594', '-1', '818', '1590'),('1595', '-1', '819', '1591'),('1596', '-1', '820', '1592');
UPDATE `gossip_menu_option` SET `condition_id`='1594' WHERE `menu_id` in (7559,7560) AND `id`=0;
UPDATE `gossip_menu_option` SET `condition_id`='1595' WHERE `menu_id` in (7559,7560) AND `id`=1;
UPDATE `gossip_menu_option` SET `condition_id`='1596' WHERE `menu_id` in (7559,7560) AND `id`=2;
UPDATE `gossip_menu_option` SET `condition_id`='491' WHERE `menu_id` in (7559,7560) AND `id`=3;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1598', '30', '349', '3'),('1599', '30', '349', '4'),('1600', '30', '349', '5'),('1601', '-1', '392', '1598'),('1602', '-1', '329', '1599');
UPDATE `gossip_menu` SET `condition_id`='1601' WHERE `entry`=4861 AND `text_id`=5933;
UPDATE `gossip_menu` SET `condition_id`='1601' WHERE `entry`=4862 AND `text_id`=5938;
UPDATE `gossip_menu` SET `condition_id`='1602' WHERE `entry`=4861 AND `text_id`=5934;
UPDATE `gossip_menu` SET `condition_id`='1602' WHERE `entry`=4862 AND `text_id`=5939;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES ('4861', '5935', '0', '0', '0', '0', '0', '0', '0', '1531');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1603', '8', '3782', '0');
UPDATE `gossip_menu_option` SET `condition_id`='1603' WHERE `menu_id`=1701 AND `id`=0;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
('1593', '30', '1038', '3'),('1597', '30', '1038', '4'),('1604', '30', '1038', '5'),('1605', '30', '1038', '6'),
('1606', '-1', '1550', '1593'),('1607', '-1', '1551', '1597'),('1608', '-1', '1552', '1604'),('1609', '-1', '1553', '1605'),
('1610', '-1', '1550', '1597'),('1611', '-1', '1550', '1604');
UPDATE `gossip_menu` SET `condition_id`='1550' WHERE `entry`=8716 AND `text_id`=10967;
UPDATE `gossip_menu` SET `condition_id`='1550' WHERE `entry`=8726 AND `text_id`=11029;
UPDATE `gossip_menu` SET `condition_id`='1607' WHERE `condition_id`='1551' AND `entry` IN ( 8716, 8717, 8721, 8722, 8723, 8724, 8726);
UPDATE `gossip_menu` SET `condition_id`='1608' WHERE `condition_id`='1552' AND `entry` IN ( 8716, 8717, 8721, 8722, 8723, 8724, 8726, 8681, 8678);
UPDATE `gossip_menu` SET `condition_id`='1609' WHERE `condition_id`='1553' AND `entry` IN ( 8716, 8717, 8721, 8722, 8723, 8724, 8726, 8678, 8679, 8680, 8681);
UPDATE `gossip_menu` SET `condition_id`='1606' WHERE `condition_id`='1550' AND `entry` IN ( 8716, 8717, 8721, 8722, 8723, 8724, 8726);
UPDATE `gossip_menu` SET `condition_id`='1610' WHERE `entry`=8681 AND `text_id`=10926;
UPDATE `gossip_menu` SET `condition_id`='1611' WHERE `entry`=8680 AND `text_id`=10923;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
('1612', '30', '1031', '5'),('1613', '30', '1031', '6'),('1614', '-1', '441', '1612'),('1615', '-1', '1545', '1613');
UPDATE `gossip_menu` SET `condition_id`='1614' WHERE `entry`=8642 AND `text_id`=10992;
UPDATE `gossip_menu` SET `condition_id`='1614' WHERE `entry`=8669 AND `text_id`=10989;
UPDATE `gossip_menu` SET `condition_id`='1614' WHERE `entry`=8670 AND `text_id`=11001;
UPDATE `gossip_menu` SET `condition_id`='1614' WHERE `entry`=8737 AND `text_id`=11063;
UPDATE `gossip_menu` SET `condition_id`='1615' WHERE `entry`=8642 AND `text_id`=10994;
UPDATE `gossip_menu` SET `condition_id`='1615' WHERE `entry`=8669 AND `text_id`=10990;
UPDATE `gossip_menu` SET `condition_id`='1615' WHERE `entry`=8670 AND `text_id`=11002;
UPDATE `gossip_menu` SET `condition_id`='1615' WHERE `entry`=8737 AND `text_id`=11061;
DELETE FROM `quest_end_scripts` WHERE `id` = 8193;
REPLACE INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(8193, 0, 29, 2, 2, 15077, 10, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(8193, 0, 0, 6, 0, 15077, 10, 0, 2000000302, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE `game_event_creature` SET `event`='5' WHERE `guid`=125893;
UPDATE `game_event_creature` SET `event`='5' WHERE `guid`=49648;
UPDATE `game_event_creature` SET `event`='5' WHERE `guid`=125583;
DELETE FROM `game_event_creature` WHERE `guid` = 4898;

# Fix
# INSERT IGNORE INTO `spell_target_position` VALUES ('70781', '631', '-17.0711', '2211.47', '30.0546', '3.14159');
# INSERT IGNORE INTO `spell_target_position` VALUES ('70856', '631', '-503.62', '2211.47', '62.8235', '3.13');
# INSERT IGNORE INTO `spell_target_position` VALUES ('70857', '631', '-615.145', '2211.47', '199.972', '6.2755');
# INSERT IGNORE INTO `spell_target_position` VALUES ('70858', '631', '-549.131', '2211.29', '539.291', '6.26765');
# INSERT IGNORE INTO `spell_target_position` VALUES ('70859', '631', '4199.48', '2769.32', '351.372', '3.12414');
# INSERT IGNORE INTO `spell_target_position` VALUES ('70861', '631', '4356.58', '2565.75', '220.402', '4.71238');
# INSERT IGNORE INTO `spell_target_position` VALUES ('70860', '631', '529.302', '-2124.49', '840.857', '3.1765');
INSERT IGNORE INTO `spell_target_position` VALUES ('71712', '0', '-8922.7', '620.628', '100.225', '0');
INSERT IGNORE INTO `spell_target_position` VALUES ('71744', '0', '-8815.04', '662.193', '95.4238', '0');
INSERT IGNORE INTO `spell_target_position` VALUES ('71751', '0', '-8745.29', '656.266', '105.091', '0');
INSERT IGNORE INTO `spell_target_position` VALUES ('71762', '1', '1624.64', '-4375.87', '12.0282', '0');
INSERT IGNORE INTO `spell_target_position` VALUES ('71763', '1', '1678.29', '-4451.26', '19.2568', '0');
INSERT IGNORE INTO `spell_target_position` VALUES ('71765', '1', '1764.49', '-4345.93', '-7.798', '0');
UPDATE `gameobject` SET `spawntimesecs` = 300 WHERE `id` = 175762;
UPDATE `gameobject` SET `spawntimesecs` = 300 WHERE `id` = 175747;
DELETE FROM `gameobject` WHERE `id`=195140;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(5899, 195140, 530, 1, 1, -161.318, 965.41, 54.2904, 0, 0, 0, 0, 0, 300, 0, 1);
DELETE FROM `gameobject` WHERE `id`=195139;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(5900, 195139, 530, 1, 1, -337.492, 962.619, 54.2885, 0, 0, 0, 0, 0, 300, 0, 1);

# SignFinder
UPDATE `creature_template` SET `mechanic_immune_mask`=0, `flags_extra`=0 WHERE  `entry` =38995;

# NeatElves
delete from creature_linking_template where entry in (16063,16064,16065,16573,16360);
insert into creature_linking_template values
(16063,533,30549,143,0),
(16064,533,30549,143,0),
(16065,533,30549,143,0),
(16573,533,15956,1031,0),
(16360,533,15932,4112,0);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-35' WHERE `item`=24240;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(38435, 182050, 530, 1, 1, 1598.61, 8617.62, -33.2262, -0.610865, 0, 0, -0.300706, 0.953717, 180, 100, 1),
(25969, 182050, 530, 1, 1, 1661.94, 8620.6, -31.6114, -2.18166, 0, 0, -0.88701, 0.461749, 180, 100, 1),
(25970, 182050, 530, 1, 1, 1671.39, 8546.51, -48.753, -2.09439, 0, 0, -0.866024, 0.500002, 180, 100, 1),
(25971, 182050, 530, 1, 1, 1707.28, 8458.39, -6.66902, 2.49582, 0, 0, 0.948324, 0.317305, 180, 100, 1),
(25972, 182050, 530, 1, 1, 1663.53, 8572.54, -45.449, -1.69297, 0, 0, -0.748956, 0.66262, 180, 100, 1),
(25973, 182050, 530, 1, 1, 1640.89, 8454.59, -56.4805, -2.98451, 0, 0, -0.996917, 0.0784606, 180, 100, 1),
(25974, 182050, 530, 1, 1, 1717.89, 8489.96, -57.6316, 1.13446, 0, 0, 0.537298, 0.843393, 180, 100, 1),
(7902, 182050, 530, 1, 1, 1722.34, 8484.62, -4.16526, -1.91986, 0, 0, -0.819151, 0.573577, 180, 100, 1),
(7903, 182050, 530, 1, 1, 1726.9, 8458.46, -57.2022, -2.89725, 0, 0, -0.992546, 0.121868, 180, 100, 1),
(7904, 182050, 530, 1, 1, 1643.99, 8500.7, -53.412, 1.0821, 0, 0, 0.515036, 0.857168, 180, 100, 1),
(7911, 182050, 530, 1, 1, 1688.54, 8554.73, 4.35539, -2.93215, 0, 0, -0.994522, 0.10453, 180, 100, 1),
(7915, 182050, 530, 1, 1, 1691.86, 8556.19, -47.5297, -3.03687, 0, 0, -0.998629, 0.0523374, 180, 100, 1),
(7917, 182050, 530, 1, 1, 1627.71, 8604.54, -25.4862, -2.94959, 0, 0, -0.995395, 0.0958539, 180, 100, 1),
(7919, 182050, 530, 1, 1, 1722.83, 8473.81, -4.44422, -1.91986, 0, 0, -0.819151, 0.573577, 180, 100, 1);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14407', '8', 'Box of Mushrooms');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('182050', '14407', '0', 'Box of Mushrooms');
UPDATE `creature_template_addon` SET `auras`='35230' WHERE `entry`=18912;
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14408', '10', 'Discarded Nutriment');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('182031', '14408', '0', 'Discarded Nutriment');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14409', '6', 'Discarded Nutriment');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('182256', '14409', '0', 'Discarded Nutriment');
UPDATE creature_template SET gossip_menu_id =7703 WHERE entry = 18480;
REPLACE INTO gossip_menu (entry, text_id) VALUES (7703, 9401);
REPLACE INTO gossip_menu (entry, text_id) VALUES (6421, 7614);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 182256;
UPDATE `gameobject_template` SET `data1`='182031' WHERE `entry`=182256;
UPDATE `creature_template_addon` SET `auras`='45814' WHERE `entry`=25652;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10040;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(10040, 0, 0, 'Hold out a little more, my friend. I must know what happened.', 1, 1, 10041, 0, 10041, 0, 0, NULL, 9, 13231, 0, 0, 0, 0, 0, 0, 0, 592),
(10040, 1, 0, 'Let the earth you would be down, the hero of the Alliance!', 1, 1, -1, 0, 10040, 0, 0, NULL, 9, 13232, 0, 0, 0, 0, 0, 0, 0, 315),
(10040, 3, 0, 'How can I help you, brother?', 1, 1, -1, 0, 10041, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1618);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1616', '22', '13231', '0'), ('1617', '9', '13232', '2'), ('1618', '-1', '1616', '1617');
UPDATE `gossip_menu` SET `condition_id`='1618' WHERE `entry`=10040 AND `text_id`=13948;
DELETE FROM `gossip_scripts` WHERE `id` in (31304,31305,10040,10036,10041);
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(10040, 0, 15, 58955, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alliance Quest Aura'),
(10040, 0, 15, 59226, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 'Finish It'),
(10041, 0, 15, 58955, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Alliance Quest Aura'),
(10036, 0, 15, 58922, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Horde Quest Aura');
DELETE FROM `spell_scripts` WHERE `id` in (59226);
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES('59226', '0', '15', '3240', '0', '0', '0', '2', '0', '0', '0', '0', '0', '0', '0', '0', 'Bloody Explosion');
UPDATE `creature_template` SET `gossip_menu_id`=8836 WHERE `entry`=23950;
DELETE FROM `gossip_menu` WHERE `entry` = 50408;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES
(8836,11428),
(1188,1820);
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 1186;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(1186, 0, 0, 'The Burning Inn.', 1, 1, 1187, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1186, 1, 0, 'Paval Reethe.', 1, 1, 1188, 0, 0, 0, 0, NULL, 8, 1269, 0, 0, 0, 0, 0, 0, 0, 795);
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 1186;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES
(8761, 11126, 0, 0, 0, 0, 0, 0, 0, 340),
(8761, 11128, 0, 0, 0, 0, 0, 0, 0, 273);
DELETE FROM `npc_text` WHERE `ID`=11428;
INSERT INTO `npc_text` (`ID`,`text0_0`,`text0_1`,`lang0`,`prob0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`text1_0`,`text1_1`,`lang1`,`prob1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`text2_0`,`text2_1`,`lang2`,`prob2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`text3_0`,`text3_1`,`lang3`,`prob3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`text4_0`,`text4_1`,`lang4`,`prob4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`text5_0`,`text5_1`,`lang5`,`prob5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`text6_0`,`text6_1`,`lang6`,`prob6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`text7_0`,`text7_1`,`lang7`,`prob7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`) VALUES
(11428,'Are you here to relieve me? I''m certain it''s almost time. Well, if you want to relieve me anyway, let me know. I could use a drink or three.','',0,1,0,0,0,0,0,0,'','',0,1,0,0,0,0,0,0,'','',0,1,0,0,0,0,0,0,'','',0,1,0,0,0,0,0,0,'','',0,1,0,0,0,0,0,0,'','',0,1,0,0,0,0,0,0,'','',0,1,0,0,0,0,0,0,'','',0,1,0,0,0,0,0,0);
DELETE FROM `npc_text` WHERE `ID` IN (10059,10061);
INSERT INTO `npc_text` (`ID`,`text0_0`,`text0_1`,`lang0`,`prob0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`text1_0`,`text1_1`,`lang1`,`prob1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`text2_0`,`text2_1`,`lang2`,`prob2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`text3_0`,`text3_1`,`lang3`,`prob3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`text4_0`,`text4_1`,`lang4`,`prob4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`text5_0`,`text5_1`,`lang5`,`prob5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`text6_0`,`text6_1`,`lang6`,`prob6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`text7_0`,`text7_1`,`lang7`,`prob7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`) VALUES(10059,'The Ethereum were the ruling class of ethereal on my homeworld of K''aresh. Tragically, we were forced to evacuate K''aresh shortly before the void lord, Dimensius, unleashed his void armies upon the world and utterly decimated all that stood in his way. For this act, the Ethereum vowed vengeance. They have been tracking Dimensius ever since...$B$BThe Protectorate, however, were not a reaction to Dimensius. We were a reaction to Ethereum.','',0,1,0,1,0,1,0,1,'','',0,1,0,0,0,0,0,0,'','',0,1,0,0,0,0,0,0,'','',0,1,0,0,0,0,0,0,'','',0,1,0,0,0,0,0,0,'','',0,1,0,0,0,0,0,0,'','',0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0),(10061,'We feel that the Ethereum are as great a threat to our existence as Dimensius. Both must be stopped...','',0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `item`=35490;
UPDATE `gossip_menu_option` SET `option_text`='Boots, what do you have back there that goes down smooth?' WHERE `menu_id`=8001 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Dealer Dunar, I wish to browse your wares.' WHERE `menu_id`=8084 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='I wish to browse your wares.' WHERE `menu_id`=8126 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Let me browse your goods.' WHERE `menu_id`=8710 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='I think I understand now. Can I help with any of this? The Ethereum and void creatures are a threat to our survival as well.' WHERE `menu_id`=8121 AND `id`=0;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1619', '9', '10173', '0');
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES (7981, 9828, 0, 0, 0, 0, 0, 0, 0, 1619);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14410', '12', 'Dragon Bone');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('181981', '14410', '0', 'Dragon Bone');
REPLACE INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(114006,26276,571,1,1,0,0,3560.472,1769.351,171.9977,1.91463,180,0,0,57660,0,2);
UPDATE `creature_template_addon` SET `b2_1_pvp_state`='0' WHERE `entry`=26276;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(114006,1,3560.472,1769.351,171.9977),
(114006,2,3567.688,1720.065,171.9977),
(114006,3,3575.305,1671.264,171.9977),
(114006,4,3614.985,1641.572,171.9977),
(114006,5,3661.11,1627.888,179.4142),
(114006,6,3710.721,1625.472,184.0807),
(114006,7,3758.05,1626.899,186.8029),
(114006,8,3806.817,1636.863,186.8029),
(114006,9,3855.013,1638.274,186.8029),
(114006,10,3893.953,1607.221,186.8029),
(114006,11,3908.07,1563.533,186.8029),
(114006,12,3892.732,1516.304,186.8029),
(114006,13,3853.05,1486.712,186.8029),
(114006,14,3804.016,1484.734,186.8029),
(114006,15,3768.95,1518.886,186.8029),
(114006,16,3741.332,1558.961,193.6083),
(114006,17,3735.918,1607.949,197.9415),
(114006,18,3726.846,1656.945,201.9971),
(114006,19,3706.031,1701.895,208.3303),
(114006,20,3693.807,1748.982,208.3303),
(114006,21,3686.946,1791.952,208.3303),
(114006,22,3684.135,1840.943,208.3303),
(114006,23,3693.31,1889.799,208.3303),
(114006,24,3710.331,1936.957,208.3303),
(114006,25,3708.896,1985.871,203.9415),
(114006,26,3711.546,2034.778,199.0248),
(114006,27,3700.25,2079.795,185.8581),
(114006,28,3671.014,2118.18,175.6918),
(114006,29,3627.495,2141.961,170.8588),
(114006,30,3582.266,2162.844,165.0257),
(114006,31,3536.079,2181.72,161.0814),
(114006,32,3492.185,2203.827,153.3039),
(114006,33,3449.847,2227.899,147.0816),
(114006,34,3411.07,2258.388,138.6929),
(114006,35,3372.244,2288.043,130.0542),
(114006,36,3334.966,2320.363,127.8878),
(114006,37,3302.867,2358.885,123.2211),
(114006,38,3272.494,2397.996,120.9432),
(114006,39,3239.637,2434.888,118.8322),
(114006,40,3212.678,2476.519,116.0821),
(114006,41,3211.545,2525.56,108.0818),
(114006,42,3250.958,2578.278,107.5538),
(114006,43,3293.958,2602.603,107.5538),
(114006,44,3342.687,2610.276,112.9983),
(114006,45,3386.911,2594.68,123.2483),
(114006,46,3415.89,2554.956,128.7483),
(114006,47,3424.978,2506.423,128.7483),
(114006,48,3417.17,2457.855,128.7483),
(114006,49,3403.204,2427.43,128.7483),
(114006,50,3373.681,2392.189,128.7483),
(114006,51,3355.053,2347.842,128.7483),
(114006,52,3358.651,2298.717,128.7483),
(114006,53,3365.574,2249.818,135.9983),
(114006,54,3382.769,2202.925,136.9983),
(114006,55,3406.081,2159.531,144.9981),
(114006,56,3435.854,2119.649,151.8868),
(114006,57,3465.756,2080.089,151.8868),
(114006,58,3482.463,2041.774,142.5257),
(114006,59,3503.596,1996.099,137.0257),
(114006,60,3521.709,1951.099,137.0257),
(114006,61,3531.027,1914.229,150.5535),
(114006,62,3542.625,1866.008,158.9424),
(114006,63,3550.662,1817.174,163.9979);
DELETE FROM `gossip_scripts` WHERE `id` = 2211;
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(2211, 1, 10, 9136, 60000, 0, 0, 0, 0, 0, 0, 0, -7917.38, -2610.53, 221.123, 5.04026, ''),
(2211, 0, 27, 4, 0, 160445, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2211, 61, 27, 8, 0, 160445, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
DELETE FROM gameobject_template_scripts WHERE id=179804;
INSERT INTO gameobject_template_scripts VALUES 
(179804,1,10,14605,60000,0,0,2,0,0,0,0,0,0,0,0,'Drakonid Bones - Summon Bone Construct');
DELETE FROM `creature` WHERE `guid` = 18987;
INSERT INTO creature (guid,id,map,spawnMask,phaseMask,modelid,equipment_id,position_x,position_y,position_z,orientation,spawntimesecs,spawndist,currentwaypoint,curhealth,curmana,DeathState,MovementType) VALUES
(18987,14494, 0, 1, 1, 0, 0, 3325.018, -2996.802, 164.449, 0.01, 600, 0, 0, 3052, 0, 0, 0);
UPDATE creature_template SET RegenHealth = 0 WHERE entry IN (14484,14485);
UPDATE `quest_template` SET `SpecialFlags`='2' WHERE `entry` in (309,434,452,590,665,667,836,1090,1144,1173,1440,1651,1950,2742,2744,2767,2784,2801,2845,2904,2954,3141,3367,3382,3525,3982,4001,4121,4185,4224,4261,4265,4321,4322,4342,4966,5056,5203,5713,5944,6403,6544,6566,6627,7046,8447,8945,9212,9260,9261,9262,9263,9264,9265,9375,9545,9729,9836,9879,9991,10004,10044,10051,10052,10172,10191,10198,10218,10248,10256,10297,10310,10425,10525,10594,10898,10923,10945,10950,10951,10952,10953,10954,10956,10960,10962,10963,10968,11189,11241,11592,11664,11673,12027,12082,12321,12473,12816,12817,13221,13229,13417,13481,13482,7622);
UPDATE `quest_template` SET `SpecialFlags`='3' WHERE `entry` in (3366,11101,13538,7027,6847,6848,7001,7871,7872);
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='50', `groupid`='0' WHERE `entry`=179703 AND `item`=18646;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance`='50', `groupid`='0' WHERE `entry`=179703 AND `item`=18703;
UPDATE `gameobject_loot_template` SET `groupid`='1' WHERE `entry`=179703 AND `item` in (19140,18810,18808,18806,18803);
DELETE FROM `spell_scripts` WHERE `id` = 29126;
DELETE FROM `spell_scripts` WHERE `id` = 29135;
DELETE FROM `spell_scripts` WHERE `id` = 29136;
DELETE FROM `spell_scripts` WHERE `id` = 29137;
DELETE FROM `spell_scripts` WHERE `id` = 29138;
DELETE FROM `spell_scripts` WHERE `id` = 29139;
DELETE FROM `spell_scripts` WHERE `id` = 46671;
DELETE FROM `spell_scripts` WHERE `id` = 46672;
UPDATE `gameobject_template` SET `faction`='1735' WHERE `entry`=181333;
UPDATE `gameobject_template` SET `faction`='1735' WHERE `entry`=181334;
UPDATE `gameobject_template` SET `faction`='1735' WHERE `entry`=181332;
UPDATE `gameobject_template` SET `faction`='1732' WHERE `entry`=181335;
UPDATE `gameobject_template` SET `faction`='1732' WHERE `entry`=181336;
UPDATE `gameobject_template` SET `faction`='1732' WHERE `entry`=181337;
DELETE FROM `spell_area` WHERE `spell` = 29126;
DELETE FROM `spell_area` WHERE `spell` = 29135;
DELETE FROM `spell_area` WHERE `spell` = 29136;
DELETE FROM `spell_area` WHERE `spell` = 29137;
DELETE FROM `spell_area` WHERE `spell` = 29138;
DELETE FROM `spell_area` WHERE `spell` = 29139;
DELETE FROM `spell_area` WHERE `spell` = 46671;
DELETE FROM `spell_area` WHERE `spell` = 46672;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-30' WHERE `entry`=26316 AND `item`=36728;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `item`=36729;
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`, `condition_id`) VALUES ('26467', '36729', '-100', '0', '1', '1', '0', '0', '0', '0');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14412', '18', 'Composite Ore');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('188442', '14412', '0', 'Composite Ore');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(44885, 188442, 571, 1, 1, 4581.08, 475.223, 65.9586, 1.95477, 0, 0, 0.829038, 0.559192, 120, 100, 1),
(44886, 188442, 571, 1, 1, 4355.79, 306.847, 46.681, -0.645772, 0, 0, -0.317305, 0.948324, 120, 100, 1),
(44887, 188442, 571, 1, 1, 4540.33, 449.891, 65.9547, 0.855211, 0, 0, 0.414693, 0.909961, 120, 100, 1),
(44888, 188442, 571, 1, 1, 4558.8, 457.194, 66.3137, -2.77507, 0, 0, -0.983255, 0.182237, 120, 100, 1),
(44889, 188442, 571, 1, 1, 4525.29, 476.182, 66.5023, 0.331611, 0, 0, 0.165047, 0.986286, 120, 100, 1),
(44890, 188442, 571, 1, 1, 4376.52, 754.487, 58.6941, -3.05433, 0, 0, -0.999048, 0.0436174, 120, 100, 1),
(44891, 188442, 571, 1, 1, 4412.05, 330.669, 44.9223, 0.785397, 0, 0, 0.382683, 0.92388, 120, 100, 1),
(44892, 188442, 571, 1, 1, 4412.51, 702.771, 54.0801, -0.855211, 0, 0, -0.414693, 0.909961, 120, 100, 1),
(44893, 188442, 571, 1, 1, 4434.24, 705.65, 53.941, 1.78023, 0, 0, 0.777145, 0.629321, 120, 100, 1),
(44894, 188442, 571, 1, 1, 4388.48, 732.4, 54.1747, 1.58825, 0, 0, 0.713251, 0.700909, 120, 100, 1),
(10849, 188442, 571, 1, 1, 4393.88, 753.41, 54.1678, -0.174532, 0, 0, -0.0871553, 0.996195, 120, 100, 1),
(10848, 188442, 571, 1, 1, 4415.67, 722.605, 53.8887, -0.785397, 0, 0, -0.382683, 0.92388, 120, 100, 1),
(10843, 188442, 571, 1, 1, 4378.79, 297.967, 45.7164, 2.89724, 0, 0, 0.992546, 0.121873, 120, 100, 1),
(10842, 188442, 571, 1, 1, 4436.78, 689.474, 59.0446, -0.942477, 0, 0, -0.45399, 0.891007, 120, 100, 1),
(10841, 188442, 571, 1, 1, 4172.6, 739.74, 43.4212, 2.16421, 0, 0, 0.882948, 0.469471, 120, 100, 1),
(10840, 188442, 571, 1, 1, 4153.04, 689.897, 43.54, -2.46091, 0, 0, -0.942641, 0.333809, 120, 100, 1),
(10837, 188442, 571, 1, 1, 4130.77, 665.688, 45.2563, 1.20428, 0, 0, 0.566407, 0.824125, 120, 100, 1),
(10835, 188442, 571, 1, 1, 4109.31, 671.335, 45.0958, 1.79769, 0, 0, 0.782608, 0.622514, 120, 100, 1),
(10831, 188442, 571, 1, 1, 4171.53, 713.072, 41.5848, -2.05949, 0, 0, -0.857168, 0.515037, 120, 100, 1),
(10825, 188442, 571, 1, 1, 4124.53, 723.4, 41.7324, 1.11701, 0, 0, 0.529919, 0.848048, 120, 100, 1),
(10824, 188442, 571, 1, 1, 4363.59, 318.407, 47.0072, 2.60053, 0, 0, 0.963629, 0.267244, 120, 100, 1),
(10823, 188442, 571, 1, 1, 4401.4, 321.737, 44.518, -2.65289, 0, 0, -0.970295, 0.241925, 120, 100, 1),
(10820, 188442, 571, 1, 1, 4418.16, 308.02, 45.3795, 0, 0, 0, 0, 1, 120, 100, 1),
(10817, 188442, 571, 1, 1, 4419.73, 341.367, 46.1146, -1.72787, 0, 0, -0.760406, 0.649449, 120, 100, 1);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14411', '22', 'Splintered Bone Chunk');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('188441', '14411', '0', 'Splintered Bone Chunk');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(44895, 188441, 571, 1, 1, 4572.98, 645.44, 94.59, -1.16937, 0, 0, -0.551937, 0.833886, 120, 100, 1),
(44896, 188441, 571, 1, 1, 4607.06, 650.238, 99.3323, 0.314158, 0, 0, 0.156434, 0.987688, 120, 100, 1),
(44897, 188441, 571, 1, 1, 4751.07, 453.679, 126.705, 0.680677, 0, 0, 0.333806, 0.942642, 120, 100, 1),
(44898, 188441, 571, 1, 1, 4458.16, 127.856, 89.4529, -0.401425, 0, 0, -0.199368, 0.979925, 120, 100, 1),
(44899, 188441, 571, 1, 1, 4673.73, 424.577, 112.654, -1.71042, 0, 0, -0.754709, 0.656059, 120, 100, 1),
(44900, 188441, 571, 1, 1, 4682.3, 401.202, 113.09, 0.90757, 0, 0, 0.438371, 0.898794, 120, 100, 1),
(44901, 188441, 571, 1, 1, 4481.18, 127.805, 88.9875, -1.23918, 0, 0, -0.580703, 0.814116, 120, 100, 1),
(44902, 188441, 571, 1, 1, 4633.89, 639.71, 104.126, -0.575957, 0, 0, -0.284015, 0.95882, 120, 100, 1),
(44903, 188441, 571, 1, 1, 4599.75, 664.471, 97.9773, -2.02458, 0, 0, -0.848048, 0.52992, 120, 100, 1),
(44904, 188441, 571, 1, 1, 4599.19, 760.068, 93.8752, -0.628317, 0, 0, -0.309016, 0.951057, 120, 100, 1),
(44905, 188441, 571, 1, 1, 4603.35, 646.605, 99.3937, -3.00195, 0, 0, -0.997563, 0.0697646, 120, 100, 1),
(44906, 188441, 571, 1, 1, 4574.53, 739.394, 93.1377, 0.052359, 0, 0, 0.0261765, 0.999657, 120, 100, 1),
(44907, 188441, 571, 1, 1, 4626.84, 662.613, 101.606, 1.43117, 0, 0, 0.656059, 0.75471, 120, 100, 1),
(44908, 188441, 571, 1, 1, 4617.78, 647.229, 100.198, -0.122173, 0, 0, -0.0610485, 0.998135, 120, 100, 1),
(44909, 188441, 571, 1, 1, 4593.35, 741.484, 95.7995, -2.54818, 0, 0, -0.956305, 0.292372, 120, 100, 1),
(44910, 188441, 571, 1, 1, 4583.76, 661.299, 95.5069, 2.00713, 0, 0, 0.843392, 0.537299, 120, 100, 1),
(44911, 188441, 571, 1, 1, 4505.15, 59.0905, 86.1317, -1.20428, 0, 0, -0.566406, 0.824126, 120, 100, 1),
(10815, 188441, 571, 1, 1, 4540.81, 232.438, 93.5296, 2.70526, 0, 0, 0.976296, 0.21644, 120, 100, 1),
(10811, 188441, 571, 1, 1, 4518.54, 226.87, 90.0436, -1.309, 0, 0, -0.608761, 0.793354, 120, 100, 1),
(10809, 188441, 571, 1, 1, 4516.65, 214.938, 90.1737, -1.51844, 0, 0, -0.688354, 0.725374, 120, 100, 1),
(10805, 188441, 571, 1, 1, 4601.03, 262.573, 94.5993, -2.68781, 0, 0, -0.97437, 0.224951, 120, 100, 1),
(10804, 188441, 571, 1, 1, 4556.1, 231.293, 96.7789, 0.453785, 0, 0, 0.224951, 0.97437, 120, 100, 1),
(10802, 188441, 571, 1, 1, 4476.38, 92.4865, 88.9638, 2.32129, 0, 0, 0.91706, 0.39875, 120, 100, 1),
(10801, 188441, 571, 1, 1, 4499.45, 108.052, 89.835, -2.28638, 0, 0, -0.909961, 0.414694, 120, 100, 1),
(10800, 188441, 571, 1, 1, 4532.68, 221.227, 92.8656, -0.942477, 0, 0, -0.45399, 0.891007, 120, 100, 1),
(10796, 188441, 571, 1, 1, 4510.57, 76.8185, 88.445, -2.426, 0, 0, -0.936671, 0.35021, 120, 100, 1),
(10790, 188441, 571, 1, 1, 4570.08, 246.232, 90.9689, -1.41372, 0, 0, -0.649447, 0.760406, 120, 100, 1),
(10787, 188441, 571, 1, 1, 4578.88, 274.382, 94.5774, 1.25664, 0, 0, 0.587785, 0.809017, 120, 100, 1),
(10786, 188441, 571, 1, 1, 4599.04, 285.083, 95.2379, 0.418879, 0, 0, 0.207912, 0.978148, 120, 100, 1),
(10785, 188441, 571, 1, 1, 4553.6, 249.401, 91.1224, -2.426, 0, 0, -0.936671, 0.350211, 120, 100, 1),
(10783, 188441, 571, 1, 1, 4583.66, 232.163, 95.9295, -1.55334, 0, 0, -0.700909, 0.713251, 120, 100, 1);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-30' WHERE `entry`=26316 AND `item`=36728;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-100' WHERE `item`=36729;
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`, `condition_id`) VALUES ('26467', '36729', '-100', '0', '1', '1', '0', '0', '0', '0');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14412', '18', 'Composite Ore');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('188442', '14412', '0', 'Composite Ore');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(44885, 188442, 571, 1, 1, 4581.08, 475.223, 65.9586, 1.95477, 0, 0, 0.829038, 0.559192, 120, 100, 1),
(44886, 188442, 571, 1, 1, 4355.79, 306.847, 46.681, -0.645772, 0, 0, -0.317305, 0.948324, 120, 100, 1),
(44887, 188442, 571, 1, 1, 4540.33, 449.891, 65.9547, 0.855211, 0, 0, 0.414693, 0.909961, 120, 100, 1),
(44888, 188442, 571, 1, 1, 4558.8, 457.194, 66.3137, -2.77507, 0, 0, -0.983255, 0.182237, 120, 100, 1),
(44889, 188442, 571, 1, 1, 4525.29, 476.182, 66.5023, 0.331611, 0, 0, 0.165047, 0.986286, 120, 100, 1),
(44890, 188442, 571, 1, 1, 4376.52, 754.487, 58.6941, -3.05433, 0, 0, -0.999048, 0.0436174, 120, 100, 1),
(44891, 188442, 571, 1, 1, 4412.05, 330.669, 44.9223, 0.785397, 0, 0, 0.382683, 0.92388, 120, 100, 1),
(44892, 188442, 571, 1, 1, 4412.51, 702.771, 54.0801, -0.855211, 0, 0, -0.414693, 0.909961, 120, 100, 1),
(44893, 188442, 571, 1, 1, 4434.24, 705.65, 53.941, 1.78023, 0, 0, 0.777145, 0.629321, 120, 100, 1),
(44894, 188442, 571, 1, 1, 4388.48, 732.4, 54.1747, 1.58825, 0, 0, 0.713251, 0.700909, 120, 100, 1),
(10849, 188442, 571, 1, 1, 4393.88, 753.41, 54.1678, -0.174532, 0, 0, -0.0871553, 0.996195, 120, 100, 1),
(10848, 188442, 571, 1, 1, 4415.67, 722.605, 53.8887, -0.785397, 0, 0, -0.382683, 0.92388, 120, 100, 1),
(10843, 188442, 571, 1, 1, 4378.79, 297.967, 45.7164, 2.89724, 0, 0, 0.992546, 0.121873, 120, 100, 1),
(10842, 188442, 571, 1, 1, 4436.78, 689.474, 59.0446, -0.942477, 0, 0, -0.45399, 0.891007, 120, 100, 1),
(10841, 188442, 571, 1, 1, 4172.6, 739.74, 43.4212, 2.16421, 0, 0, 0.882948, 0.469471, 120, 100, 1),
(10840, 188442, 571, 1, 1, 4153.04, 689.897, 43.54, -2.46091, 0, 0, -0.942641, 0.333809, 120, 100, 1),
(10837, 188442, 571, 1, 1, 4130.77, 665.688, 45.2563, 1.20428, 0, 0, 0.566407, 0.824125, 120, 100, 1),
(10835, 188442, 571, 1, 1, 4109.31, 671.335, 45.0958, 1.79769, 0, 0, 0.782608, 0.622514, 120, 100, 1),
(10831, 188442, 571, 1, 1, 4171.53, 713.072, 41.5848, -2.05949, 0, 0, -0.857168, 0.515037, 120, 100, 1),
(10825, 188442, 571, 1, 1, 4124.53, 723.4, 41.7324, 1.11701, 0, 0, 0.529919, 0.848048, 120, 100, 1),
(10824, 188442, 571, 1, 1, 4363.59, 318.407, 47.0072, 2.60053, 0, 0, 0.963629, 0.267244, 120, 100, 1),
(10823, 188442, 571, 1, 1, 4401.4, 321.737, 44.518, -2.65289, 0, 0, -0.970295, 0.241925, 120, 100, 1),
(10820, 188442, 571, 1, 1, 4418.16, 308.02, 45.3795, 0, 0, 0, 0, 1, 120, 100, 1),
(10817, 188442, 571, 1, 1, 4419.73, 341.367, 46.1146, -1.72787, 0, 0, -0.760406, 0.649449, 120, 100, 1);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14411', '22', 'Splintered Bone Chunk');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('188441', '14411', '0', 'Splintered Bone Chunk');
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(44895, 188441, 571, 1, 1, 4572.98, 645.44, 94.59, -1.16937, 0, 0, -0.551937, 0.833886, 120, 100, 1),
(44896, 188441, 571, 1, 1, 4607.06, 650.238, 99.3323, 0.314158, 0, 0, 0.156434, 0.987688, 120, 100, 1),
(44897, 188441, 571, 1, 1, 4751.07, 453.679, 126.705, 0.680677, 0, 0, 0.333806, 0.942642, 120, 100, 1),
(44898, 188441, 571, 1, 1, 4458.16, 127.856, 89.4529, -0.401425, 0, 0, -0.199368, 0.979925, 120, 100, 1),
(44899, 188441, 571, 1, 1, 4673.73, 424.577, 112.654, -1.71042, 0, 0, -0.754709, 0.656059, 120, 100, 1),
(44900, 188441, 571, 1, 1, 4682.3, 401.202, 113.09, 0.90757, 0, 0, 0.438371, 0.898794, 120, 100, 1),
(44901, 188441, 571, 1, 1, 4481.18, 127.805, 88.9875, -1.23918, 0, 0, -0.580703, 0.814116, 120, 100, 1),
(44902, 188441, 571, 1, 1, 4633.89, 639.71, 104.126, -0.575957, 0, 0, -0.284015, 0.95882, 120, 100, 1),
(44903, 188441, 571, 1, 1, 4599.75, 664.471, 97.9773, -2.02458, 0, 0, -0.848048, 0.52992, 120, 100, 1),
(44904, 188441, 571, 1, 1, 4599.19, 760.068, 93.8752, -0.628317, 0, 0, -0.309016, 0.951057, 120, 100, 1),
(44905, 188441, 571, 1, 1, 4603.35, 646.605, 99.3937, -3.00195, 0, 0, -0.997563, 0.0697646, 120, 100, 1),
(44906, 188441, 571, 1, 1, 4574.53, 739.394, 93.1377, 0.052359, 0, 0, 0.0261765, 0.999657, 120, 100, 1),
(44907, 188441, 571, 1, 1, 4626.84, 662.613, 101.606, 1.43117, 0, 0, 0.656059, 0.75471, 120, 100, 1),
(44908, 188441, 571, 1, 1, 4617.78, 647.229, 100.198, -0.122173, 0, 0, -0.0610485, 0.998135, 120, 100, 1),
(44909, 188441, 571, 1, 1, 4593.35, 741.484, 95.7995, -2.54818, 0, 0, -0.956305, 0.292372, 120, 100, 1),
(44910, 188441, 571, 1, 1, 4583.76, 661.299, 95.5069, 2.00713, 0, 0, 0.843392, 0.537299, 120, 100, 1),
(44911, 188441, 571, 1, 1, 4505.15, 59.0905, 86.1317, -1.20428, 0, 0, -0.566406, 0.824126, 120, 100, 1),
(10815, 188441, 571, 1, 1, 4540.81, 232.438, 93.5296, 2.70526, 0, 0, 0.976296, 0.21644, 120, 100, 1),
(10811, 188441, 571, 1, 1, 4518.54, 226.87, 90.0436, -1.309, 0, 0, -0.608761, 0.793354, 120, 100, 1),
(10809, 188441, 571, 1, 1, 4516.65, 214.938, 90.1737, -1.51844, 0, 0, -0.688354, 0.725374, 120, 100, 1),
(10805, 188441, 571, 1, 1, 4601.03, 262.573, 94.5993, -2.68781, 0, 0, -0.97437, 0.224951, 120, 100, 1),
(10804, 188441, 571, 1, 1, 4556.1, 231.293, 96.7789, 0.453785, 0, 0, 0.224951, 0.97437, 120, 100, 1),
(10802, 188441, 571, 1, 1, 4476.38, 92.4865, 88.9638, 2.32129, 0, 0, 0.91706, 0.39875, 120, 100, 1),
(10801, 188441, 571, 1, 1, 4499.45, 108.052, 89.835, -2.28638, 0, 0, -0.909961, 0.414694, 120, 100, 1),
(10800, 188441, 571, 1, 1, 4532.68, 221.227, 92.8656, -0.942477, 0, 0, -0.45399, 0.891007, 120, 100, 1),
(10796, 188441, 571, 1, 1, 4510.57, 76.8185, 88.445, -2.426, 0, 0, -0.936671, 0.35021, 120, 100, 1),
(10790, 188441, 571, 1, 1, 4570.08, 246.232, 90.9689, -1.41372, 0, 0, -0.649447, 0.760406, 120, 100, 1),
(10787, 188441, 571, 1, 1, 4578.88, 274.382, 94.5774, 1.25664, 0, 0, 0.587785, 0.809017, 120, 100, 1),
(10786, 188441, 571, 1, 1, 4599.04, 285.083, 95.2379, 0.418879, 0, 0, 0.207912, 0.978148, 120, 100, 1),
(10785, 188441, 571, 1, 1, 4553.6, 249.401, 91.1224, -2.426, 0, 0, -0.936671, 0.350211, 120, 100, 1),
(10783, 188441, 571, 1, 1, 4583.66, 232.163, 95.9295, -1.55334, 0, 0, -0.700909, 0.713251, 120, 100, 1);
UPDATE `gossip_menu` SET `text_id`='12524' WHERE `entry`=9213 AND `text_id`=68;
UPDATE `gossip_menu` SET `text_id`='12524' WHERE `entry`=9256 AND `text_id`=68;
UPDATE `gossip_menu` SET `text_id`='12524' WHERE `entry`=9257 AND `text_id`=68;
UPDATE `gameobject_template` SET `flags` = 0 WHERE `entry` = 186672;
DELETE FROM `creature_movement` WHERE `id` = 54810;
DELETE FROM `creature_movement_template` WHERE `entry` = 18731;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(54810, 1, -157.366, 2.177, 8.073, 1000, 332, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54810, 2, -172.266, -18.28, 8.073, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54810, 3, -171.051, -38.748, 8.073, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54810, 4, -170.718, -59.436, 8.073, 1000, 333, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54810, 5, -156.659, -72.118, 8.073, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54810, 6, -142.292, -59.423, 8.073, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54810, 7, -141.779, -38.972, 8.073, 1000, 334, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54810, 8, -142.922, -18.95, 8.073, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54810, 9, -157.366, 2.177, 8.073, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
update creature_template set npcflag=npcflag&~2 where entry=12580;
DELETE FROM creature_template_addon WHERE (entry=12580);
INSERT INTO creature_template_addon (entry, mount, bytes1, b2_0_sheath, b2_1_pvp_state, emote, moveflags, auras) VALUES (12580, 2410, 0, 0, 0, 0, 0, NULL);
UPDATE creature_template SET faction_A = 12, faction_H = 12 WHERE entry = 12581;
DELETE FROM `creature_involvedrelation` WHERE `id` = 12580 AND `quest` = 6402;
DELETE FROM `creature_involvedrelation` WHERE `id` = 344 AND `quest` = 4183;
DELETE FROM `creature_involvedrelation` WHERE `id` = 9023 AND `quest` = 4241;
DELETE FROM `creature_involvedrelation` WHERE `id` = 9023 AND `quest` = 4264;
DELETE FROM `creature_involvedrelation` WHERE `id` = 9023 AND `quest` = 4282;
DELETE FROM `creature_involvedrelation` WHERE `id` = 9560 AND `quest` = 4242;
DELETE FROM `creature_involvedrelation` WHERE `id` = 9560 AND `quest` = 4322;
DELETE FROM `creature_involvedrelation` WHERE `id` = 9562 AND `quest` = 4182;
DELETE FROM `creature_involvedrelation` WHERE `id` = 12867 AND `quest` = 6403;
DELETE FROM `creature_questrelation` WHERE `id` = 9560 AND `quest` = 4241;
UPDATE `gossip_menu` SET `text_id`='12524' WHERE `entry`=9251 AND `text_id`=68;
UPDATE `gossip_menu` SET `text_id`='12524' WHERE `entry`=9254 AND `text_id`=68;
UPDATE `gossip_menu` SET `text_id`='12524' WHERE `entry`=9255 AND `text_id`=68;
UPDATE `gossip_menu` SET `text_id`='12524' WHERE `entry`=9271 AND `text_id`=68;
UPDATE `gossip_menu` SET `text_id`='12524' WHERE `entry`=9258 AND `text_id`=68;
UPDATE `gossip_menu` SET `text_id`='12524' WHERE `entry`=9264 AND `text_id`=68;
UPDATE `gossip_menu` SET `text_id`='12524' WHERE `entry`=9265 AND `text_id`=68;
UPDATE `gossip_menu` SET `text_id`='12524' WHERE `entry`=9266 AND `text_id`=68;
UPDATE `gossip_menu` SET `text_id`='12524' WHERE `entry`=9267 AND `text_id`=68;
UPDATE `gossip_menu` SET `text_id`='12524' WHERE `entry`=9268 AND `text_id`=68;
UPDATE `gossip_menu` SET `text_id`='12524' WHERE `entry`=9269 AND `text_id`=68;
UPDATE `gossip_menu` SET `text_id`='12524' WHERE `entry`=9272 AND `text_id`=68;
UPDATE `creature_template` SET `flags_extra`='2' WHERE `entry` in (15723,16592,17038,17041,17048,17049,17050,17051,25754,25883,25884,25887,25888,25889,25890,25891,25892,25893,25894,25895,25896,25897,25898,25899,25900,25901,25902,25903,25904,25905,25906,25907,25908,25909,25910,25911,25912,25913,25914,25915,25916,25917,25918,25919,25920,25921,25922,25923,25925,25926,25927,25928,25929,25930,25931,25932,25933,25934,25935,25936,25937,25938,25939,25940,25941,25942,25943,25944,25945,25946,25947,26124,26401,26520,32801,32802,32803,32804,32805,32806,32807,32808,32809,32810,32811,32812,32813,32814,32815,32816,40436,40443);
UPDATE `creature_template` SET `gossip_menu_id`=11417 WHERE `entry`=25697;
UPDATE `creature_template` SET `gossip_menu_id`=9260 WHERE `entry`=25754;
DELETE FROM `gossip_menu` WHERE `entry`=11417 AND `text_id`=12390;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (11417,12390);
DELETE FROM `gossip_menu` WHERE `entry`=9260 AND `text_id`=12571;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9260,12571);
DELETE FROM `gossip_menu` WHERE `entry`=9260 AND `text_id`=12572;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (9260,12572);
UPDATE `gossip_menu` SET `cond_1`='0', `cond_1_val_1`='0', `condition_id`='0' WHERE `text_id`=12374;
UPDATE `gossip_menu` SET `cond_1`='0', `cond_1_val_1`='0', `condition_id`='0' WHERE `text_id`=12377;
#
DELETE FROM `gossip_scripts` WHERE `id` in (9352);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('9352', '0', '15', '45437', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', 'Holiday - Midsummer, Stamp Out Bonfire, Quest Complete');
#
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9370,9353,9355,9379,9380,9381,9382,9383,9356,9357,9358,9359,9360,9361,9362,9363,9364,9365,9366,9367,9368,9369,9371,9372,9373,9374,9375,9376,9377,9378,10228,10231,10232,10235,10236,10239,10241,10242) AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_script_id`,`condition_id`) VALUES
(9370,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1619),
(9353,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1620),
(9355,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1621),
(9379,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1644),
(9380,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1645),
(9381,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1646),
(9382,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1647),
(9383,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1648),
(9356,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1622),
(9357,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1623),
(9358,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1624),
(9359,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1625),
(9360,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1626),
(9361,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1627),
(9362,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1628),
(9363,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1629),
(9364,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1630),
(9365,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1631),
(9366,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1632),
(9367,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1633),
(9368,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1634),
(9369,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1635),
(9371,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1636),
(9372,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1637),
(9373,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1638),
(9374,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1639),
(9375,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1640),
(9376,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1641),
(9377,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1642),
(9378,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1643),
(10228,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1649),
(10231,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1650),
(10232,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1651),
(10235,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1652),
(10236,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1653),
(10239,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1654),
(10241,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1655),
(10242,0,0, 'Stamp out the Horde bonfire!',1,1,-1,9352,1656);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES
(1619,8,11580),
(1620,8,11764),
(1621,8,11765),
(1622,8,11766),
(1623,8,11767),
(1624,8,11768),
(1625,8,11769),
(1626,8,11770),
(1627,8,11771),
(1628,8,11772),
(1629,8,11773),
(1630,8,11774),
(1631,8,11775),
(1632,8,11776),
(1633,8,11777),
(1634,8,11778),
(1635,8,11779),
(1636,8,11780),
(1637,8,11781),
(1638,8,11782),
(1639,8,11783),
(1640,8,11784),
(1641,8,11785),
(1642,8,11786),
(1643,8,11787),
(1644,8,11799),
(1645,8,11800),
(1646,8,11801),
(1647,8,11802),
(1648,8,11803),
(1649,8,13441),
(1650,8,13450),
(1651,8,13451),
(1652,8,13453),
(1653,8,13454),
(1654,8,13455),
(1655,8,13457),
(1656,8,13458);
#
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (9406,9352,9354,9384,9385,9386,9387,9388,9389,9390,9391,9392,9393,9394,9395,9396,9397,9398,9399,9400,9401,9402,9403,9404,9405,9407,9408,9409,9410,9411,9412,9413,10227,10230,10233,10234,10237,10238,10240,10243) AND `id`=0;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_script_id`,`condition_id`) VALUES
(9406,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1657),
(9352,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1658),
(9354,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1659),
(9384,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1660),
(9385,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1661),
(9386,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1662),
(9387,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1663),
(9388,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1664),
(9389,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1665),
(9390,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1666),
(9391,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1667),
(9392,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1668),
(9393,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1669),
(9394,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1670),
(9395,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1671),
(9396,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1672),
(9397,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1673),
(9398,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1674),
(9399,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1675),
(9400,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1676),
(9401,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1677),
(9402,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1678),
(9403,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1679),
(9404,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1680),
(9405,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1681),
(9407,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1682),
(9408,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1683),
(9409,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1684),
(9410,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1685),
(9411,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1686),
(9412,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1687),
(9413,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1688),
(10227,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1689),
(10230,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1690),
(10233,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1691),
(10234,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1692),
(10237,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1693),
(10238,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1694),
(10240,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1695),
(10243,0,0, 'Stamp out the Alliance bonfire!',1,1,-1,9352,1696);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`) VALUES
(1657,8,11581),
(1658,8,11732),
(1659,8,11734),
(1660,8,11735),
(1661,8,11736),
(1662,8,11737),
(1663,8,11738),
(1664,8,11739),
(1665,8,11740),
(1666,8,11741),
(1667,8,11742),
(1668,8,11743),
(1669,8,11744),
(1670,8,11745),
(1671,8,11746),
(1672,8,11747),
(1673,8,11748),
(1674,8,11749),
(1675,8,11750),
(1676,8,11751),
(1677,8,11752),
(1678,8,11753),
(1679,8,11754),
(1680,8,11755),
(1681,8,11756),
(1682,8,11757),
(1683,8,11758),
(1684,8,11759),
(1685,8,11760),
(1686,8,11761),
(1687,8,11762),
(1688,8,11763),
(1689,8,13440),
(1690,8,13442),
(1691,8,13443),
(1692,8,13444),
(1693,8,13445),
(1694,8,13446),
(1695,8,13447),
(1696,8,13449);

# FIX
UPDATE `creature_template_addon` SET `auras`='45814' WHERE `entry`=25652;
SET @CGUID := 142876;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+00 AND @CGUID+22;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`MovementType`) VALUES
(@CGUID+00,39190,631,12,1,505.1563,-2536.863,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+01,39190,631,12,1,502.6493,-2531.328,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+02,39190,631,12,1,503.8246,-2508.141,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+03,39190,631,12,1,495.3629,-2538.215,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+04,39190,631,12,1,506.8715,-2515.552,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+05,39190,631,12,1,481.3021,-2509.222,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+06,39190,631,12,1,481.5382,-2527.332,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+07,39190,631,12,1,500.0807,-2523.289,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+08,39190,631,12,1,486.6632,-2517.747,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+09,39190,631,12,1,513.8802,-2511.795,1069.596,0,10,10,1), -- Wicked Spirit
(@CGUID+10,39190,631,12,1,499.6406,-2500.783,1069.656,0,10,10,1), -- Wicked Spirit
(@CGUID+11,39190,631,12,1,513.7101,-2530.931,1069.596,0,10,10,1), -- Wicked Spirit
(@CGUID+12,39190,631,12,1,502.6811,-2522.542,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+13,39190,631,12,1,518.7483,-2521.240,1069.596,0,10,10,1), -- Wicked Spirit
(@CGUID+14,39190,631,12,1,478.9774,-2517.446,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+15,39190,631,12,1,489.0104,-2538.535,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+16,39190,631,12,1,511.6320,-2522.373,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+17,39190,631,12,1,500.8976,-2527.198,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+18,39190,631,12,1,484.7934,-2533.592,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+19,39190,631,12,1,490.4132,-2504.323,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+20,39190,631,12,1,485.0298,-2527.724,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+21,39190,631,12,1,494.2899,-2511.384,1069.598,0,10,10,1), -- Wicked Spirit
(@CGUID+22,39190,631,12,1,491.7170,-2532.490,1069.598,0,10,10,1); -- Wicked Spirit
INSERT IGNORE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES
(5935, 'Need TXT YTDB', '', 0, 100, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);


# Gossip_FIX
UPDATE `gossip_menu_option` SET `action_menu_id` = '-1' WHERE `action_menu_id` =0 AND `action_script_id` >0;

# NPC_ADDON_FIX
INSERT IGNORE INTO `creature_template_addon`
SELECT
`creature_template`.`difficulty_entry_1`,
`creature_template_addon`.`mount`,
`creature_template_addon`.`bytes1`,
`creature_template_addon`.`b2_0_sheath`,
`creature_template_addon`.`b2_1_pvp_state`,
`creature_template_addon`.`emote`,
`creature_template_addon`.`moveflags`,
`creature_template_addon`.`auras`
FROM
`creature_template`, `creature_template_addon`
WHERE
`creature_template_addon`.`entry`=`creature_template`.`entry`
AND `creature_template`.`difficulty_entry_1`>0;
INSERT IGNORE INTO `creature_template_addon`
SELECT
`creature_template`.`difficulty_entry_2`,
`creature_template_addon`.`mount`,
`creature_template_addon`.`bytes1`,
`creature_template_addon`.`b2_0_sheath`,
`creature_template_addon`.`b2_1_pvp_state`,
`creature_template_addon`.`emote`,
`creature_template_addon`.`moveflags`,
`creature_template_addon`.`auras`
FROM
`creature_template`, `creature_template_addon`
WHERE
`creature_template_addon`.`entry`=`creature_template`.`entry`
AND `creature_template`.`difficulty_entry_2`>0;
INSERT IGNORE INTO `creature_template_addon`
SELECT
`creature_template`.`difficulty_entry_3`,
`creature_template_addon`.`mount`,
`creature_template_addon`.`bytes1`,
`creature_template_addon`.`b2_0_sheath`,
`creature_template_addon`.`b2_1_pvp_state`,
`creature_template_addon`.`emote`,
`creature_template_addon`.`moveflags`,
`creature_template_addon`.`auras`
FROM
`creature_template`, `creature_template_addon`
WHERE
`creature_template_addon`.`entry`=`creature_template`.`entry`
AND `creature_template`.`difficulty_entry_3`>0;

# NPC_FIX
UPDATE
`creature_template`, `creature_template` AS `copy`
SET
`copy`.`RegenHealth`=`creature_template`.`RegenHealth`,
`copy`.`unit_class`=`creature_template`.`unit_class`,
`copy`.`unit_flags`=`creature_template`.`unit_flags`,
`copy`.`npcflag`=`creature_template`.`npcflag`,
`copy`.`dynamicflags`=`creature_template`.`dynamicflags`,
`copy`.`equipment_id`=`creature_template`.`equipment_id`,
`copy`.`faction_A`=`creature_template`.`faction_A`,
`copy`.`faction_H`=`creature_template`.`faction_H`,
`copy`.`speed_run`=`creature_template`.`speed_run`,
`copy`.`speed_walk`=`creature_template`.`speed_walk`,
`copy`.`scale`=`creature_template`.`scale`,
`copy`.`dmgschool`=`creature_template`.`dmgschool`,
`copy`.`mingold`=`creature_template`.`mingold`,
`copy`.`maxgold`=`creature_template`.`maxgold`,
`copy`.`Vehicle_Id`=`creature_template`.`Vehicle_Id`,
`copy`.`mechanic_immune_mask`=`creature_template`.`mechanic_immune_mask`
WHERE
`copy`.`entry`=`creature_template`.`difficulty_entry_1`;
UPDATE
`creature_template`, `creature_template` AS `copy`
SET
`copy`.`RegenHealth`=`creature_template`.`RegenHealth`,
`copy`.`unit_class`=`creature_template`.`unit_class`,
`copy`.`unit_flags`=`creature_template`.`unit_flags`,
`copy`.`npcflag`=`creature_template`.`npcflag`,
`copy`.`dynamicflags`=`creature_template`.`dynamicflags`,
`copy`.`equipment_id`=`creature_template`.`equipment_id`,
`copy`.`faction_A`=`creature_template`.`faction_A`,
`copy`.`faction_H`=`creature_template`.`faction_H`,
`copy`.`speed_run`=`creature_template`.`speed_run`,
`copy`.`speed_walk`=`creature_template`.`speed_walk`,
`copy`.`scale`=`creature_template`.`scale`,
`copy`.`dmgschool`=`creature_template`.`dmgschool`,
`copy`.`mingold`=`creature_template`.`mingold`,
`copy`.`maxgold`=`creature_template`.`maxgold`,
`copy`.`Vehicle_Id`=`creature_template`.`Vehicle_Id`,
`copy`.`mechanic_immune_mask`=`creature_template`.`mechanic_immune_mask`
WHERE
`copy`.`entry`=`creature_template`.`difficulty_entry_2`;
UPDATE
`creature_template`, `creature_template` AS `copy`
SET
`copy`.`RegenHealth`=`creature_template`.`RegenHealth`,
`copy`.`unit_class`=`creature_template`.`unit_class`,
`copy`.`unit_flags`=`creature_template`.`unit_flags`,
`copy`.`npcflag`=`creature_template`.`npcflag`,
`copy`.`dynamicflags`=`creature_template`.`dynamicflags`,
`copy`.`equipment_id`=`creature_template`.`equipment_id`,
`copy`.`faction_A`=`creature_template`.`faction_A`,
`copy`.`faction_H`=`creature_template`.`faction_H`,
`copy`.`speed_run`=`creature_template`.`speed_run`,
`copy`.`speed_walk`=`creature_template`.`speed_walk`,
`copy`.`scale`=`creature_template`.`scale`,
`copy`.`dmgschool`=`creature_template`.`dmgschool`,
`copy`.`mingold`=`creature_template`.`mingold`,
`copy`.`maxgold`=`creature_template`.`maxgold`,
`copy`.`Vehicle_Id`=`creature_template`.`Vehicle_Id`,
`copy`.`mechanic_immune_mask`=`creature_template`.`mechanic_immune_mask`
WHERE
`copy`.`entry`=`creature_template`.`difficulty_entry_3`;

# Final_FIX
UPDATE quest_template SET SpecialFlags=SpecialFlags|1 WHERE QuestFlags=QuestFlags|4096;
UPDATE quest_template SET SpecialFlags=SpecialFlags|1 WHERE QuestFlags=QuestFlags|32768;
DELETE FROM `creature_addon` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);
# DELETE FROM `creature_movement` WHERE `id` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `npc_gossip` WHERE `npc_guid` NOT IN (SELECT `guid` FROM `creature`);
# DELETE FROM `game_event_gameobject` WHERE `guid` NOT IN (SELECT `guid` FROM `gameobject`);
# DELETE FROM `game_event_creature` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);
# UPDATE creature_template SET unit_flags=unit_flags&~2048 WHERE unit_flags&2048=2048;
# UPDATE creature_template SET unit_flags=unit_flags&~524288 WHERE unit_flags&524288=524288;
# UPDATE creature_template SET unit_flags=unit_flags&~67108864 WHERE unit_flags&67108864=67108864;
# UPDATE creature_template SET unit_flags=unit_flags&~8388608 WHERE unit_flags&8388608=8388608;
UPDATE `creature`, `creature_template` SET `creature`.`curhealth`=`creature_template`.`minhealth`,`creature`.`curmana`=`creature_template`.`minmana` WHERE `creature`.`id`=`creature_template`.`entry` and `creature_template`.`RegenHealth` = '1';
UPDATE `creature` SET `spawndist` = 5 WHERE `spawndist` = 0 AND `MovementType`=1;
UPDATE `creature` SET `spawndist`=0 WHERE `MovementType`=0;
UPDATE `creature` SET `spawntimesecs` = 300 WHERE `spawntimesecs` = 25;
UPDATE `gameobject` SET `spawntimesecs` = 300 WHERE `spawntimesecs` = 25;
UPDATE `creature_template` SET `scale` = 1 WHERE `scale` = 0;
UPDATE `creature` SET `spawndist` = 0, `MovementType` = 2 WHERE guid in (select distinct(id) from creature_movement);
# UPDATE `creature` SET `spawndist` = 0, `MovementType` = 2 WHERE id in (select distinct(entry) from creature_movement_template);
# UPDATE `creature` LEFT JOIN (`creature_movement`) ON (`creature_movement`.`id`=`creature`.`guid`) LEFT JOIN (`creature_movement_template`) ON (`creature_movement_template`.`entry`=`creature`.`id`) SET `creature`.`spawndist`=5, `creature`.`MovementType`=1 WHERE `creature`.`MovementType`=2 AND (`creature_movement`.`id` IS NULL AND `creature_movement_template`.`entry` IS NULL);
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 0;
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 3;
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 10;
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 25;
UPDATE `gameobject` SET `state`=1 WHERE `state`=0 AND `id` IN (SELECT entry FROM `gameobject_template` WHERE `type`=3);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (SELECT `id` FROM `creature_questrelation`);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (SELECT `id` FROM `creature_involvedrelation`);
UPDATE `gameobject` SET `state` = 0 WHERE `id` IN (SELECT `entry` FROM `gameobject_template` WHERE `type` = 0 AND `data0` = 1);
# UPDATE `gameobject_template` SET `flags`=`flags`&~4 WHERE `type` IN (2,19,17);
# DELETE FROM `gameobject_scripts` WHERE `id` NOT IN (SELECT `guid` FROM `gameobject`);
# DELETE FROM `gameobject_scripts` WHERE `command` in (11, 12) and `datalong` NOT IN (SELECT `guid` FROM `gameobject`);
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` NOT IN (SELECT `entry` FROM `creature_template`);
# UPDATE creature_addon SET moveflags=moveflags &~ 0x00000100;
# UPDATE creature_addon SET moveflags=moveflags &~ 0x00000800;
# UPDATE creature_addon SET moveflags=moveflags &~ 0x00200000;
# UPDATE creature_addon SET moveflags=moveflags &~ 0x08000000;
# UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00000100;
# UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00000800;
# UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00200000;
# UPDATE creature_template_addon SET moveflags=moveflags &~ 0x08000000;
UPDATE `item_template` SET `spelltrigger_2` = 0 WHERE `spellid_2` = 0 AND `spelltrigger_2` = 6;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `AIName` = 'EventAI' AND `ScriptName` = 'generic_creature';
UPDATE `creature_template` SET npcflag = npcflag|1 WHERE `gossip_menu_id` > 0;
UPDATE quest_template SET SpecialFlags=SpecialFlags|1 WHERE SpecialFlags=4;

UPDATE db_version SET `cache_id`= '624';
UPDATE db_version SET `version`= 'YTDB_0.14.5_R624_MaNGOS_R12023_SD2_R2601_ACID_R309c_RuDB_R51';
