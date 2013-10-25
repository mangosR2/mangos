SET @ConditionEntry := 1807;

/*
For use conditions system for limiting loot by SD2 always use:
@ConditionEntry     for INSTANCE_CONDITION_ID_NORMAL_MODE
@ConditionEntry + 1 for INSTANCE_CONDITION_ID_HARD_MODE
@ConditionEntry + 2 for INSTANCE_CONDITION_ID_HARD_MODE_2
@ConditionEntry + 3 for INSTANCE_CONDITION_ID_HARD_MODE_3
@ConditionEntry + 4 for INSTANCE_CONDITION_ID_HARD_MODE_4
*/
-- --------------- --
-- Flame Leviathan --
-- --------------- --
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `condition_id`) VALUES
(33113, 45294, 0, 3, 1, 1, 0), -- 10 Player hard 4
(33113, 45087, 100, 0, 1, 1, 0), -- 10 Player hard 2, 3, 4
(34003, 45087, 100, 0, 2, 2, 0); -- 25 Player hard 2, 3, 4
UPDATE `creature_loot_template` SET `groupid` = 3, `ChanceOrQuestChance` = 0 WHERE `item` IN (45293, 45295, 45296, 45297, 45300, 45294); -- 10 Player hard 4
UPDATE `creature_loot_template` SET `groupid` = 1 WHERE `item` IN (45086, 45106, 45107, 45108, 45109, 45110, 45111, 45112); -- 25 Player normal or hard 1,2,3,4
UPDATE `creature_loot_template` SET `groupid` = 2 WHERE `item` IN (45113, 45114, 45115, 45116, 45117, 45118, 45119); -- 25 Player normal or hard 1,2,3,4
UPDATE `creature_loot_template` SET `entry` = 34003, `ChanceOrQuestChance` = 0, `groupid` = 3 WHERE `item` IN (45132, 45133, 45134, 45135, 45136); -- 25 Player hard 4
-- 10 Player
UPDATE `creature_loot_template` SET `condition_id` = @ConditionEntry + 4 WHERE `entry` = 33113 AND `groupid` IN (3); -- Hard mode 4
UPDATE `creature_loot_template` SET `condition_id` = @ConditionEntry + 2 WHERE `entry` = 33113 AND `item` = 45087; -- Hard mode 2,3,4
-- 25 Player
UPDATE `creature_loot_template` SET `condition_id` = @ConditionEntry + 4 WHERE `entry` = 34003 AND `groupid` IN (3); -- Hard mode 4
UPDATE `creature_loot_template` SET `condition_id` = @ConditionEntry + 2 WHERE `entry` = 34003 AND `item` = 45087; -- Hard mode 2,3,4

-- -------------------- --
-- XT-002 Deconstructor --
-- -------------------- --
-- 10 Player
UPDATE `creature_loot_template` SET `condition_id` = @ConditionEntry     WHERE `entry` = 33293 AND `groupid` IN (1, 2); -- normal mode
UPDATE `creature_loot_template` SET `condition_id` = @ConditionEntry + 1 WHERE `entry` = 33293 AND `groupid` IN (3); -- hard mode
-- 25 Player
UPDATE `creature_loot_template` SET `condition_id` = @ConditionEntry     WHERE `entry` = 33885 AND `groupid` IN (1, 2, 3); -- normal mode
-- Missed loot
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
(33885, 45445, 0, 4, 1, 1),
(33885, 45443, 0, 4, 1, 1),
(33885, 45444, 0, 4, 1, 1),
(33885, 45446, 0, 4, 1, 1),
(33885, 45442, 0, 4, 1, 1);
UPDATE `creature_loot_template` SET `condition_id` = @ConditionEntry + 1 WHERE `entry` = 33885 AND `groupid` IN (4); -- hard mode

-- ---------- --
-- Sartharion --
-- ---------- --
-- 10 Player
DELETE FROM `creature_loot_template` WHERE `entry` = 28860 AND `item` = 47241;
UPDATE `creature_loot_template` SET `groupid` = 3, `ChanceOrQuestChance` = 0, `mincountOrRef` = 1, `maxcount` = 1 WHERE `entry` = 28860 AND `item` IN (43345, 43347);
UPDATE `creature_loot_template` SET `condition_id` = @ConditionEntry + 1 WHERE `entry` = 28860 AND `groupid` IN (2); -- at least 1 drake
-- Missed loot
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES
-- at least 2 drakes (Loot from Schmoozerd)
(28860, 43995, 0, 6, 1, 1),
(28860, 43998, 0, 6, 1, 1),
(28860, 43994, 0, 6, 1, 1),
(28860, 43996, 0, 6, 1, 1),
(28860, 43993, 0, 6, 1, 1),
-- 3 drakes
(28860, 43986, 0, 7, 1, 1);
UPDATE `creature_loot_template` SET `condition_id` = @ConditionEntry + 2 WHERE `entry` = 28860 AND `groupid` IN (6); -- at least 2 drake
UPDATE `creature_loot_template` SET `condition_id` = @ConditionEntry + 3 WHERE `entry` = 28860 AND `groupid` IN (7); -- at least 3 drake
-- 25 Player
UPDATE `creature_loot_template` SET `groupid` = 2, `ChanceOrQuestChance` = 0, `mincountOrRef` = 1, `maxcount` = 1 WHERE `entry` = 31311 AND `item` IN (40433, 40630, 43345, 43346);
DELETE FROM `creature_loot_template` WHERE `entry` = 31311 AND `item` = 47241;
UPDATE `creature_loot_template` SET `condition_id` = @ConditionEntry + 1 WHERE `entry` = 31311 AND `groupid` IN (4); -- at least 1 drake
UPDATE `creature_loot_template` SET `condition_id` = @ConditionEntry + 2 WHERE `entry` = 31311 AND `groupid` IN (1); -- at least 2 drake
UPDATE `creature_loot_template` SET `groupid` = 7, `ChanceOrQuestChance` = 0 WHERE `entry` = 31311 AND `item` = 43954;
UPDATE `creature_loot_template` SET `condition_id` = @ConditionEntry + 3 WHERE `entry` = 31311 AND `groupid` IN (7); -- at least 3 drake
