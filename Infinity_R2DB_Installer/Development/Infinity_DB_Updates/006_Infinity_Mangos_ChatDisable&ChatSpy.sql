
-- Chat spy
-- --------

DELETE FROM `mangos_string` WHERE `entry` IN (11600, 11601, 11602, 11603, 11604, 11605, 11606, 11607, 11608);
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(11600, 'ChatSpy appended to player |cffff0000%s|r(%u)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChatSpy ??????????? ? ?????? |cffff0000%s|r(%u)'),
(11601, 'ChatSpy for player |cffff0000%s|r(%u) cancelled by massive ChatSpy cancel.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChatSpy ??? ?????? |cffff0000%s|r(%u) ??????? ???????? ??????? ??????? ChatSpy.'),
(11602, 'All ChatSpys reset.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChatSpy ??? ???? ??????? ???????.'),
(11603, 'Player %s(%u) has no ChatSpy.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '? ?????? %s(%u) ?? ?????????? ChatSpy.'),
(11604, 'You were ChatSpying player, cancelled.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ChatSpying ???? ? ??????.'),
(11605, '%s(%u) was ChatSpying player, cancelled.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s(%u) ????????? ChatSpy ?? ??????, ????????.'),
(11606, 'List of ChatSpys appended', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????? ????????????? ChatSpy'),
(11607, 'Total: %u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '?????: %u'),
(11608, '%s(%u) spys |cffff0000%s|r(%u)', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '%s(%u) ?????? ?? |cffff0000%s|r(%u)');

DELETE FROM `command` WHERE `name` IN ('chatspy set', 'chatspy reset', 'chatspy status', 'chatspy cancel');
INSERT INTO `command` VALUES
('chatspy set',    3, 'Syntax: .chatspy set $PlayerName\r\n  Append ChatSpy on $player.'),
('chatspy reset',  3, 'Syntax: .chatspy reset\r\n  Reset all ChatSpys.'),
('chatspy status', 3, 'Syntax: .chatspy status $PlayerName\r\n  Show ChatSpy status for $player.'),
('chatspy cancel', 3, 'Syntax: .chatspy cancel $PlayerName\r\n  Reset ChatSpy for $player.');

-- chat disbale by level
-- ---------------------

DELETE FROM mangos_string WHERE `entry` IN (50000,50001,50002,50003,50004,50005,50006,50007);
INSERT INTO mangos_string
   (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`)
VALUES
   (50000, 'You cannot say until you are level %u.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO mangos_string
   (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`)
VALUES
   (50001, 'You cannot yell until you are level %u.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO mangos_string
   (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`)
VALUES
   (50002, 'You cannot whisper until you are level %u.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO mangos_string
   (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`)
VALUES
   (50003, 'You cannot party chat until you are level %u.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO mangos_string
   (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`)
VALUES
   (50004, 'You cannot guild chat until you are level %u.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO mangos_string
   (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`)
VALUES
   (50005, 'You cannot raid chat until you are level %u.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO mangos_string
   (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`)
VALUES
   (50006, 'You cannot battleground chat until you are level %u.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO mangos_string
   (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`)
VALUES
   (50007, 'You cannot chat in channel until you are level %u.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


