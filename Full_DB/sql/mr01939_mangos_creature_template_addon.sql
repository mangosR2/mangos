-- Fix speed of oculus drakes
UPDATE `creature_template_addon` SET `auras`='50325' WHERE `entry` IN (27755,27692,27756);
-- fix shadowfiend
DELETE FROM `creature_template_addon` WHERE `entry` = 19668;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES
(19668, 0, 0, 1, 40, 0, 0, '34429');

