-- Fix speed of oculus drakes
UPDATE `creature_template_addon` SET `auras`='50325' WHERE `entry` IN (27755,27692,27756);
-- fix shadowfiend
UPDATE `creature_template_addon` SET `b2_1_pvp_state` = 40, `auras` = '34429' WHERE `entry` = 19668;

-- Scarlet Gryphon
DELETE FROM `creature_template_addon` WHERE `entry` IN (28614,28616);

-- Fixup DB
DELETE FROM `creature_template_addon` WHERE `entry` IN (27241,27268,27661,27662, 27241, 31884, 24751, 28816, 29836, 38248, 30268, 32222, 38308, 38309, 29838, 29982, 30935, 30934);
DELETE FROM `creature_addon` WHERE `guid` IN (93924);

UPDATE `creature_template_addon` SET `auras` = '50494' WHERE `entry` =28006;
UPDATE `creature_template_addon` SET `auras` = '18950' WHERE `entry` IN (36938, 36658);
UPDATE `creature_template_addon` SET `auras` = '69012 69413' WHERE `entry` IN (36477, 37629);

DELETE FROM `creature` WHERE `id` IN (SELECT `accessory_entry` FROM `vehicle_accessory`);
