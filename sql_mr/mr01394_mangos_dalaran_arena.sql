-- Dalaran Arena

UPDATE gameobject_template SET faction=114, flags=32, size=1.5 WHERE entry IN (192642, 192643);

DELETE FROM gameobject WHERE map=617;
SET @GAMEOBJECT := 222020;
INSERT INTO gameobject (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, orientation, rotation0, rotation1, rotation2, rotation3, spawntimesecs, animprogress, state) VALUES
    -- buffs
    (@GAMEOBJECT,184663,617,1,1,1291.7,813.424,7.11472,4.64562,0,0,0.730314,-0.683111,-120,100,1),
    (@GAMEOBJECT+1,184664,617,1,1,1291.7,768.911,7.11472,1.55194,0,0,0.700409,0.713742,-120,100,1),
    -- doors
    (@GAMEOBJECT+2,192642,617,1,1,1350.95,817.2,21.4096,3.15,0,0,0.99627,0.0862864,86400,100,1),
    (@GAMEOBJECT+3,192643,617,1,1,1232.65,764.913,21.4729,6.3,0,0,0.0310211,-0.999519,86400,100,1),
    -- waterfall
    (@GAMEOBJECT+4,194395,617,1,1,1291.6,791.05,7.11,3.22012,0,0,0.999229,-0.0392542,-120,100,1),
    (@GAMEOBJECT+5,191877,617,1,1,1291.6,791.05,7.11,3.22012,0,0,0.999229,-0.0392542,-120,100,1);

DELETE FROM gameobject_battleground WHERE guid IN (222020, 222021, 222022, 222023, 222024, 222025);
INSERT INTO gameobject_battleground (guid, event1, event2) VALUES
    -- buffs
    (@GAMEOBJECT,253,0),
    (@GAMEOBJECT+1,253,0),
    -- doors
    (@GAMEOBJECT+2,254,0),
    (@GAMEOBJECT+3,254,0),
    -- waterfall
    (@GAMEOBJECT+4,250,0),
    (@GAMEOBJECT+5,250,0);

DELETE FROM battleground_events WHERE map=617;
INSERT INTO battleground_events (map, event1, event2, description) VALUES
    (617,253,0,'buffs'),
    (617,254,0,'doors'),
    (617,250,0,'waterfall');

-- Fix Rotation for all Objects in Map
UPDATE gameobject SET rotation0=0, rotation1=0, rotation2=SIN(orientation*0.5), rotation3=COS(orientation*0.5) WHERE map =  617;
