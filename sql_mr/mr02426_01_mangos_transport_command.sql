-- Transport rewrite

DELETE FROM `command` WHERE `name` IN ('transport','transport go','transport list','transport current', 'transport path');

INSERT INTO `command`
    (`name`, `security`, `help`)
VALUES
    ('transport',3,'Syntax: .transport #transportEntry\r\nGive info by transport  entry.'),
    ('transport go',3,'Syntax: .transport #transportEntry\r\nTeleport to transport position.'),
    ('transport list',3,'Syntax: .transport list [#mapId]\r\nList transports on map mapId (or on current map).'),
    ('transport current',3,'Syntax: .transport current\r\nCurrent transport parameters.'),
    ('transport start',3,'Syntax: .transport start #transportEntry\r\nStart transport movement.'),
    ('transport stop',3,'Syntax: .transport stop #transportEntry\r\nStop transport movement'),
    ('transport path',3,'Syntax: .transport path [#transportEntry]\r\nList  Transport path for given entry (or current).');

