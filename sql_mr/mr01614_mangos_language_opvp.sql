DELETE FROM `mangos_string` WHERE `entry` BETWEEN 10001 AND 10055;
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc6`, `content_loc7`) VALUES

-- all messages are sent in yellow text in SMSG_DEFENSE_MESSAGE (LocalDefense channel)
-- losing control of a capture point doesnt send a text (not yet confirmed for all)
-- TODO: Switch alliance and horde position (alliance before horde)

-- silithus
(10001,'The Horde has collected 200 silithyst!', '¡La Horda ha recolectado 200 silitistas!', '¡La Horda ha recolectado 200 silitistas!'),
(10002,'The Alliance has collected 200 silithyst!', '¡La Horda ha recolectado 200 silitistas!', '¡La Horda ha recolectado 200 silitistas!'),

-- eastern plaguelands
(10003,'The Horde has taken the Northpass Tower!', '¡La Horda ha tomado la Torre del paso del norte!', '¡La Horda ha tomado la Torre del paso del norte!'),
(10004,'The Alliance has taken the Northpass Tower!', '¡La Alianza ha tomado la Torre del paso del norte!', '¡La Alianza ha tomado la Torre del paso del norte!'),
(10005,'The Horde has taken the Eastwall Tower!', '¡La Horda ha tomado la Torre de la Muralla del Este!', '¡La Horda ha tomado la Torre de la Muralla del Este!'),
(10006,'The Alliance has taken the Eastwall Tower!', '¡La Alianza ha tomado la Torre de la Muralla del Este!', '¡La Alianza ha tomado la Torre de la Muralla del Este!'),
(10007,'The Horde has taken the Crown Guard Tower!', '¡La Horda ha tomado la Torre de la Corona!', '¡La Horda ha tomado la Torre de la Corona!'),
(10008,'The Alliance has taken the Crown Guard Tower!', '¡La Alianza ha tomado la Torre de la Corona!', '¡La Alianza ha tomado la Torre de la Corona!'),
(10009,'The Horde has taken the Plaguewood Tower!', '¡La Horda ha tomado la Torre del bosque de la peste!', '¡La Horda ha tomado la Torre del bosque de la peste!'),
(10010,'The Alliance has taken the Plaguewood Tower!', '¡La Alianza ha tomado la Torre del bosque de la peste!', '¡La Alianza ha tomado la Torre del bosque de la peste!'),
(10011,'The Horde lost the Northpass Tower!', '¡La Horda ha perdido la Torre del paso del norte!', '¡La Horda ha perdido la Torre del paso del norte!'),
(10012,'The Alliance lost the Northpass Tower!', '¡La Alianza ha perdido la Torre del paso del norte!', '¡La Alianza ha perdido la Torre del paso del norte!'),
(10013,'The Horde lost the Eastwall Tower!', '¡La Horda ha perdido la Torre de la Muralla del Este!', '¡La Horda ha perdido la Torre de la Muralla del Este!'),
(10014,'The Alliance lost the Eastwall Tower!', '¡La Alianza ha perdido la Torre de la Muralla del Este!', '¡La Alianza ha perdido la Torre de la Muralla del Este!'),
(10015,'The Horde lost the Crown Guard Tower!', '¡La Horda ha perdido la Torre de la Corona!', '¡La Horda ha perdido la Torre de la Corona!'),
(10016,'The Alliance lost the Crown Guard Tower!', '¡La Alianza ha perdido la Torre de la Corona!', '¡La Alianza ha perdido la Torre de la Corona!'),
(10017,'The Horde lost the Plaguewood Tower!', '¡La Horda ha perdido la Torre del bosque de la peste!', '¡La Horda ha perdido la Torre del bosque de la peste!'),
(10018,'The Alliance lost the Plaguewood Tower!', '¡La Alianza ha perdido la Torre del bosque de la peste!', '¡La Alianza ha p la Torre del bosque de la peste!'),

-- hellfire peninsula
(10019,'|cffffff00The Overlook has been taken by the Horde!|r', '|cffffff00La Dominancia ha sido tomada por la Horda!|r', '|cffffff00La Dominancia ha sido tomada por la Horda!|r'),
(10020,'|cffffff00The Overlook has been taken by the Alliance!|r', '|cffffff00La Dominancia ha sido tomada por la Alianza!|r', '|cffffff00La Dominancia ha sido tomada por la Alianza!|r'),
(10021,'|cffffff00The Stadium has been taken by the Horde!|r', '|cffffff00El Estadium ha sido tomado por la Horda!|r', '|cffffff00El Estadium ha sido tomado por la Horda!|r'),
(10022,'|cffffff00The Stadium has been taken by the Alliance!|r', '|cffffff00El Estadium ha sido tomado por la Alianza!|r', '|cffffff00El Estadium ha sido tomado por la Alianza!|r'),
(10023,'|cffffff00Broken Hill has been taken by the Horde!|r', '|cffffff00Cerro Tábido ha sido tomado por la Horda!|r', '|cffffff00Cerro Tábido ha sido tomado por la Horda!|r'),
(10024,'|cffffff00Broken Hill has been taken by the Alliance!|r', '|cffffff00Cerro Tábido ha sido tomado por la Alianza!|r', '|cffffff00Cerro Tábido ha sido tomado por la Alianza!|r'),

 -- following does not exist on retail (confirmed!)
(10025,'The Horde lost The Overlook!', '', ''),
(10026,'The Alliance lost The Overlook!', '', ''),
(10027,'The Horde lost The Stadium!', '', ''),
(10028,'The Alliance lost The Stadium!', '', ''),
(10029,'The Horde lost Broken Hill!', '', ''),
(10030,'The Alliance lost Broken Hill!', '', ''),

-- zangarmarsh
(10031,'|cffffff00The Horde has taken control of the West Beacon!|r', '|cffffff00¡La Horda ha tomado el control de la Baliza del Oeste!|r', '|cffffff00¡La Horda ha tomado el control de la Baliza del Oeste!|r'),
(10032,'|cffffff00The Alliance has taken control of the West Beacon!|r', '|cffffff00¡La Alianza ha tomado el control de la Baliza del Oeste!|r', '|cffffff00¡La Alianza ha tomado el control de la Baliza del Oeste!|r'),
(10033,'|cffffff00The Horde has taken control of the East Beacon!|r', '|cffffff00¡La Horda ha tomado el control de la Baliza del Este!|r', '|cffffff00¡La Horda ha tomado el control de la Baliza del Este!|r'),
(10034,'|cffffff00The Alliance has control of taken the East Beacon!|r', '|cffffff00¡La Alianza ha tomado el control de la Baliza del Este!|r', '|cffffff00¡La Alianza ha tomado el control de la Baliza del Este!|r'),
-- '|cffffff00The Horde has taken control of both beacons!|r'
-- '|cffffff00The Alliance has taken control of both beacons!|r'
-- '|cffffff00The Horde Field Scout is now issuing battle standards.|r'
-- '|cffffff00The Alliance Field Scout is now issuing battle standards.|r'
(10035,'|cffffff00The Horde has taken control of Twin Spire Ruins!|r', '|cffffff00¡La Horda ha tomado el control del Cementerio de las Agujas Gemelas!|r', '|cffffff00¡La Horda ha tomado el control del Cementerio de las Agujas Gemelas!|r'),
(10036,'|cffffff00The Alliance has taken control of Twin Spire Ruins!|r', '|cffffff00¡La Alianza ha tomado el control del Cementerio de las Agujas Gemelas!|r', '|cffffff00¡La Alianza ha tomado el control del Cementerio de las Agujas Gemelas!|r'), -- SMSG_PLAY_SOUND id 8173, from npc 15384 (npc id may be a parsing error, but unlikely)
(10037,'The Horde lost the West Beacon!', '¡La Horda ha perdido la Baliza del Oeste!', '¡La Horda ha perdido la Baliza del Oeste!'),
(10038,'The Alliance lost the West Beacon!', '¡La Alianza ha perdido la Baliza del Oeste!', '¡La Alianza ha perdido la Baliza del Oeste!'),
(10039,'The Horde lost the East Beacon!', '¡La Horda ha perdido la Baliza del Este!', '¡La Horda ha perdido la Baliza del Este!'),
(10040,'The Alliance lost the East Beacon!', '¡La Alianza ha perdido la Baliza del Este!', '¡La Alianza ha perdido la Baliza del Este!'),
(10041,'The Horde lost the Twin Spire Graveyard!', '¡La Horda ha perdido el Cementerio de las Agujas Gemelas!', '¡La Horda ha perdido el Cementerio de las Agujas Gemelas!'),
(10042,'The Alliance lost the Twin Spire Graveyard!', '¡La Alianza ha perdido el Cementerio de las Agujas Gemelas!', '¡La Alianza ha perdido el Cementerio de las Agujas Gemelas!'),

-- nagrand
(10043,'The Horde has captured Halaa!', '¡La Alianza ha capturado Halaa!', '¡La Alianza ha capturado Halaa!'),
(10044,'The Alliance has captured Halaa!', '¡La Horda ha capturado Halaa!', '¡La Horda ha capturado Halaa!'),
(10045,'The Horde lost Halaa!', '¡La Horda ha perdido el control de Halaa!', '¡La Horda ha perdido el control de Halaa!'),
(10046,'The Alliance lost Halaa!', '¡La Alianza ha perdido el control de Halaa!', '¡La Alianza ha perdido el control de Halaa!'),

-- terokkar forest
(10047,'The Horde has taken a Spirit Tower!', '¡La Horda ha tomado una Torre del Espíritu!', '¡La Horda ha tomado una Torre del Espíritu!'),
(10048,'The Alliance has taken a Spirit Tower!', '¡La Alianza ha tomado una Torre del Espíritu!', '¡La Alianza ha tomado una Torre del Espíritu!'),
(10049,'The Horde lost a Spirit Tower!', '¡La Horda ha perdido una Torre del Espíritu!', '¡La Horda ha perdido una Torre del Espíritu!'),
(10050,'The Alliance lost a Spirit Tower!', '¡La Alianza ha perdido una Torre del Espíritu!', '¡La Alianza ha perdido una Torre del Espíritu!');
