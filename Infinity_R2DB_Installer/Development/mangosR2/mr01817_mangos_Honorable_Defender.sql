DELETE FROM creature_template_addon WHERE entry IN (
35379, -- eye of storm alliance
35380, -- eye of storm horde
36349, -- arathi basin alliance
36350); -- arathi basin horde
INSERT INTO creature_template_addon (entry, auras)
VALUES
(35379, 66157 ),
(35380, 66157 ),
(36349, 68652 ),
(36350, 68652 );

UPDATE creature_template SET faction_A = 534, faction_H = 534, unit_flags = 0x2000202 WHERE entry IN (35379, 36349); -- ally
UPDATE creature_template SET faction_A = 714, faction_H = 714, unit_flags = 0x2000202 WHERE entry IN (35380, 36350); -- horde

DELETE FROM creature WHERE id IN (35379, 35380, 36349, 36350);
-- new positions in arathi basin
INSERT INTO creature (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, spawntimesecs, spawndist)
VALUES
(152000, 36349, 529, 1, 1, 1166.79, 1200.13, -56.7086, 10, 0 ),-- stable
(152001, 36349, 529, 1, 1, 977.016, 1046.62, -44.8092, 10, 0 ),-- forge
(152002, 36349, 529, 1, 1, 806.182, 874.272, -55.9937, 10, 0 ),-- farm
(152003, 36349, 529, 1, 1, 856.142, 1148.9, 11.1847, 10, 0 ),-- lumber mill
(152004, 36349, 529, 1, 1, 1146.92, 848.178, -110.917, 10, 0 ),-- mine

(152005, 36350, 529, 1, 1, 1166.79, 1200.13, -56.7086, 10, 0 ),-- stable
(152006, 36350, 529, 1, 1, 977.016, 1046.62, -44.8092, 10, 0 ),-- forge
(152007, 36350, 529, 1, 1, 806.182, 874.272, -55.9937, 10, 0 ),-- farm
(152008, 36350, 529, 1, 1, 856.142, 1148.9, 11.1847, 10, 0 ),-- lumber mill
(152009, 36350, 529, 1, 1, 1146.92, 848.178, -110.917, 10, 0 );-- mine

INSERT INTO creature (guid, id, map, spawnMask, phaseMask, position_x, position_y, position_z, spawntimesecs, spawndist)
VALUES
(152010, 35379, 566, 1, 1, 2286.382568, 1402.460205,1197.108521 , 10, 0 ), -- draenei ruins
(152011, 35379, 566, 1, 1, 2284.859619, 1731.055786,1189.883057 , 10, 0 ), -- mage tower
(152012, 35379, 566, 1, 1, 2043.890747, 1729.769897,1189.863037 , 10, 0 ), -- fel reaver ruins
(152013, 35379, 566, 1, 1, 2048.877930, 1393.445435,1194.356934 , 10, 0 ), -- blood elf tower

(152014, 35380, 566, 1, 1, 2286.382568, 1402.460205,1197.108521 , 10, 0 ), -- draenei ruins
(152015, 35380, 566, 1, 1, 2284.859619, 1731.055786,1189.883057 , 10, 0 ), -- mage tower
(152016, 35380, 566, 1, 1, 2043.890747, 1729.769897,1189.863037 , 10, 0 ), -- fel reaver ruins
(152017, 35380, 566, 1, 1, 2048.877930, 1393.445435,1194.356934 , 10, 0 ); -- blood elf tower

DELETE FROM creature_battleground WHERE guid BETWEEN 152000 AND 152017;

INSERT INTO creature_battleground (guid, event1, event2)
VALUES
-- arathi basin
(152000, 0, 3 ),
(152001, 1, 3 ),
(152002, 2, 3  ),
(152003, 3, 3 ),
(152004, 4, 3 ),
(152005, 0, 4 ),
(152006, 1, 4 ),
(152007, 2, 4 ),
(152008, 3, 4 ),
(152009, 4, 4 ),
-- eye of storm
(152010, 2, 0 ),
(152011, 3, 0 ),
(152012, 0, 0 ),
(152013, 1, 0 ),
(152014, 2, 1 ),
(152015, 3, 1 ),
(152016, 0, 1 ),
(152017, 1, 1 );
