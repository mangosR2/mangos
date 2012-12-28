-- ------------------------------------- --
-- ------- I am a temporary file ------- --
-- After a month my data will be deleted --
-- ------------------------------------- --
-- ===================================== --

-- ---------- --
-- 2012-12-12 --
-- ---------- --
-- mr2519
UPDATE `guild_eventlog` SET `PlayerGuid2` = 0 WHERE `PlayerGuid2` NOT IN (SELECT `guid` FROM `characters`);
