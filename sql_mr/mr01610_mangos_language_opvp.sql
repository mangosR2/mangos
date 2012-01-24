DELETE FROM `mangos_string` WHERE `entry` BETWEEN 10001 AND 10055;
INSERT INTO `mangos_string` (`entry`, `content_default`) VALUES

-- all messages are sent in yellow text in SMSG_DEFENSE_MESSAGE (LocalDefense channel)
-- losing control of a capture point doesnt send a text (not yet confirmed for all)
-- TODO: Switch alliance and horde position (alliance before horde)

-- silithus
(10001,'The Horde has collected 200 silithyst!'),
(10002,'The Alliance has collected 200 silithyst!'),

-- eastern plaguelands
(10003,'The Horde has taken the Northpass Tower!'),
(10004,'The Alliance has taken the Northpass Tower!'),
(10005,'The Horde has taken the Eastwall Tower!'),
(10006,'The Alliance has taken the Eastwall Tower!'),
(10007,'The Horde has taken the Crown Guard Tower!'),
(10008,'The Alliance has taken the Crown Guard Tower!'),
(10009,'The Horde has taken the Plaguewood Tower!'),
(10010,'The Alliance has taken the Plaguewood Tower!'),
(10011,'The Horde lost the Northpass Tower!'),
(10012,'The Alliance lost the Northpass Tower!'),
(10013,'The Horde lost the Eastwall Tower!'),
(10014,'The Alliance lost the Eastwall Tower!'),
(10015,'The Horde lost the Crown Guard Tower!'),
(10016,'The Alliance lost the Crown Guard Tower!'),
(10017,'The Horde lost the Plaguewood Tower!'),
(10018,'The Alliance lost the Plaguewood Tower!'),

-- hellfire peninsula
(10019,'|cffffff00The Overlook has been taken by the Horde!|r'),
(10020,'|cffffff00The Overlook has been taken by the Alliance!|r'),
(10021,'|cffffff00The Stadium has been taken by the Horde!|r'),
(10022,'|cffffff00The Stadium has been taken by the Alliance!|r'),
(10023,'|cffffff00Broken Hill has been taken by the Horde!|r'),
(10024,'|cffffff00Broken Hill has been taken by the Alliance!|r'),

 -- following does not exist on retail (confirmed!)
(10025,'The Horde lost The Overlook!'),
(10026,'The Alliance lost The Overlook!'),
(10027,'The Horde lost The Stadium!'),
(10028,'The Alliance lost The Stadium!'),
(10029,'The Horde lost Broken Hill!'),
(10030,'The Alliance lost Broken Hill!'),

-- zangarmarsh
(10031,'|cffffff00The Horde has taken control of the West Beacon!|r'),
(10032,'|cffffff00The Alliance has taken control of the West Beacon!|r'),
(10033,'|cffffff00The Horde has taken control of the East Beacon!|r'),
(10034,'|cffffff00The Alliance has taken control of the East Beacon!|r'),
-- '|cffffff00The Horde has taken control of both beacons!|r'
-- '|cffffff00The Alliance has taken control of both beacons!|r'
-- '|cffffff00The Horde Field Scout is now issuing battle standards.|r'
-- '|cffffff00The Alliance Field Scout is now issuing battle standards.|r'
(10035,'|cffffff00The Horde has taken control of Twin Spire Ruins!|r'),
(10036,'|cffffff00The Alliance has taken control of Twin Spire Ruins!|r'), -- SMSG_PLAY_SOUND id 8173, from npc 15384 (npc id may be a parsing error, but unlikely)
(10037,'The Horde lost the West Beacon!'),
(10038,'The Alliance lost the West Beacon!'),
(10039,'The Horde lost the East Beacon!'),
(10040,'The Alliance lost the East Beacon!'),
(10041,'The Horde lost the Twin Spire Graveyard!'),
(10042,'The Alliance lost the Twin Spire Graveyard!'),

-- nagrand
(10043,'The Horde has captured Halaa!'),
(10044,'The Alliance has captured Halaa!'),
(10045,'The Horde lost Halaa!'),
(10046,'The Alliance lost Halaa!'),

-- terokkar forest
(10047,'The Horde has taken a Spirit Tower!'),
(10048,'The Alliance has taken a Spirit Tower!'),
(10049,'The Horde lost a Spirit Tower!'),
(10050,'The Alliance lost a Spirit Tower!');
