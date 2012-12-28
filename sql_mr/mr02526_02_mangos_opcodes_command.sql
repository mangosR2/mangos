-- opcodes DB storing

DELETE FROM `command` WHERE `name` IN ('reload opcodes');

INSERT INTO `command`
    (`name`, `security`, `help`)
VALUES
    ('reload opcodes',3,'Syntax: .reload opcodes\r\nReload all opcodes for current client build from DB.');

