-- ------------------------------
-- Instance Razorfen Downs      -
-- ------------------------------

-- --------------------------
-- tuten Gong Event Support -
-- --------------------------

-- tuten'kash
  -- acid Cleanup
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=7355);
  -- creature template
UPDATE `creature_template` SET `minhealth` = 46200, `modelid_2` = 7845, `maxhealth` = 46200, `AIName` = '' WHERE `entry` = 7355;
UPDATE `creature_template` SET `minlevel` = 45, `maxlevel` = 45, `rank` = 3 WHERE `entry` = 7355;
  -- missing itm from loot table
DELETE FROM `creature_loot_template` WHERE (`entry`=7355) AND (`item`=4637);
INSERT INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`) VALUES (7355, 4637, 0.1647, 0, 1, 1);
  -- delete static spawn he is spawned on third gong  ring
DELETE FROM `creature` WHERE `id`=7355;
       -- OLD YTDB DATA
    -- DELETE FROM `creature` WHERE `id`=7355;
    -- INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`DeathState`,`MovementType`) VALUES
    -- (49670, 7355, 129, 1, 1, 0, 0, 2485.29, 816.253, 43.2455, 1.78733, 43200, 5, 0, 10688, 0, 0, 1);
  -- Increase dmg ( might need more im being generous )
UPDATE `creature_template` SET `mindmg` = 58, `maxdmg` = 82 WHERE `entry` = 7355;
  -- assigned script name
UPDATE `creature_template` SET `AIName` = '', `ScriptName` = 'boss_tuten_kash' WHERE `entry` = 7355;

-- -> end of tuten'kask

DELETE FROM `creature` WHERE `id`=7351;
DELETE FROM `creature` WHERE `id`=7349;
DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=7349);

DELETE FROM `creature_ai_scripts` WHERE (`creature_id`=7351);
UPDATE `creature_template` SET `minlevel` = 44, `maxlevel` = 44, `maxhealth` = 7831, `mindmg` = 52, `maxdmg` = 72, `AIName` = '', `ScriptName` = 'npc_tomb_reaver' WHERE `entry` = 7351;

UPDATE `creature_template` SET `minhealth` = 3342, `maxhealth` = 3342, `AIName` = '', `ScriptName` = 'npc_tomb_fiend' WHERE `entry` = 7349;

UPDATE `gameobject_template` SET `ScriptName` = 'go_gong_razor' WHERE `entry` = 148917;
UPDATE `gameobject_template` SET `flags` = 32 WHERE `entry` = 148917;
