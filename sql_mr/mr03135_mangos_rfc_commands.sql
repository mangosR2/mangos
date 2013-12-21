-- RFC commands

DELETE FROM `command` WHERE `name` IN ('character changefaction', 'character changerace');

INSERT INTO `command` (`name`, `security`, `help`) VALUES
('character changerace', 3,'Syntax: .character changerace [$name]\r\nMark selected in game or by $name in command character for change race at next login.'),
('character changefaction', 3,'Syntax: .character changefaction [$name]\r\nMark selected in game or by $name in command character for change faction at next login.');
