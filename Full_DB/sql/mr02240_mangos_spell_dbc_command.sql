-- Implement spell_dbc reload command
DELETE FROM `command` WHERE `name` IN ('reload spell_dbc');
INSERT INTO `command`
    (`name`, `security`, `help`)
VALUES
    ('reload spell_dbc',3,'Syntax: .reload spell_dbc\r\n\r\nReload `spell_dbc` table (very UNSAFE operation + small memleak)');

