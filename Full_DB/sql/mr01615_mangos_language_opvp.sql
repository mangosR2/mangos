DELETE FROM `mangos_string` WHERE `entry` BETWEEN 10001 AND 10055;

/* need refill text ID's by commit 12097
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
 
-- all messages are sent in yellow text in SMSG_DEFENSE_MESSAGE (LocalDefense channel)
-- losing control of a capture point doesnt send a text (not yet confirmed for all)
-- TODO: Switch alliance and horde position (alliance before horde)
 
-- silithus
(10001,'The Horde has collected 200 silithyst!', '¡La Horda ha recolectado 200 silitistas!', '¡La Horda ha recolectado 200 silitistas!', 'Орда собрала 200 силитиста!'),
(10002,'The Alliance has collected 200 silithyst!', '¡La Horda ha recolectado 200 silitistas!', '¡La Horda ha recolectado 200 silitistas!', 'Альянс собрал 200 силитиста!'),
 
-- eastern plaguelands
(10003,'The Horde has taken the Northpass Tower!', '¡La Horda ha tomado la Torre del paso del norte!', '¡La Horda ha tomado la Torre del paso del norte!', 'Орда захватила башню Северного перевала!'),
(10004,'The Alliance has taken the Northpass Tower!', '¡La Alianza ha tomado la Torre del paso del norte!', '¡La Alianza ha tomado la Torre del paso del norte!', 'Альянс захватил башню Северного перевала!'),
(10005,'The Horde has taken the Eastwall Tower!', '¡La Horda ha tomado la Torre de la Muralla del Este!', '¡La Horda ha tomado la Torre de la Muralla del Este!', 'Орда захватила Восточную башню!'),
(10006,'The Alliance has taken the Eastwall Tower!', '¡La Alianza ha tomado la Torre de la Muralla del Este!', '¡La Alianza ha tomado la Torre de la Muralla del Este!', 'Альянс захватил Восточную башню!'),
(10007,'The Horde has taken the Crown Guard Tower!', '¡La Horda ha tomado la Torre de la Corona!', '¡La Horda ha tomado la Torre de la Corona!', 'Орда захватила башню Королевской Стражи!'),
(10008,'The Alliance has taken the Crown Guard Tower!', '¡La Alianza ha tomado la Torre de la Corona!', '¡La Alianza ha tomado la Torre de la Corona!', 'Альянс захватил башню Королевской Стражи!'),
(10009,'The Horde has taken the Plaguewood Tower!', '¡La Horda ha tomado la Torre del bosque de la peste!', '¡La Horda ha tomado la Torre del bosque de la peste!', 'Орда захватила башню Чумного леса!'),
(10010,'The Alliance has taken the Plaguewood Tower!', '¡La Alianza ha tomado la Torre del bosque de la peste!', '¡La Alianza ha tomado la Torre del bosque de la peste!', 'Альянс захватил башню Чумного леса!'),
(10011,'The Horde lost the Northpass Tower!', '¡La Horda ha perdido la Torre del paso del norte!', '¡La Horda ha perdido la Torre del paso del norte!', 'Орда потеряла башню Северного перевала!'),
(10012,'The Alliance lost the Northpass Tower!', '¡La Alianza ha perdido la Torre del paso del norte!', '¡La Alianza ha perdido la Torre del paso del norte!', 'Альянс потерял башню Северного перевала!'),
(10013,'The Horde lost the Eastwall Tower!', '¡La Horda ha perdido la Torre de la Muralla del Este!', '¡La Horda ha perdido la Torre de la Muralla del Este!', 'Орда потеряла Восточную башню!'),
(10014,'The Alliance lost the Eastwall Tower!', '¡La Alianza ha perdido la Torre de la Muralla del Este!', '¡La Alianza ha perdido la Torre de la Muralla del Este!', 'Альянс потерял Восточную башню!'),
(10015,'The Horde lost the Crown Guard Tower!', '¡La Horda ha perdido la Torre de la Corona!', '¡La Horda ha perdido la Torre de la Corona!', 'Орда потеряла башню Королевской Стражи!'),
(10016,'The Alliance lost the Crown Guard Tower!', '¡La Alianza ha perdido la Torre de la Corona!', '¡La Alianza ha perdido la Torre de la Corona!', 'Альянс потерял башню Королевской Стражи!'),
(10017,'The Horde lost the Plaguewood Tower!', '¡La Horda ha perdido la Torre del bosque de la peste!', '¡La Horda ha perdido la Torre del bosque de la peste!', 'Орда потеряла башню Чумного леса!'),
(10018,'The Alliance lost the Plaguewood Tower!', '¡La Alianza ha perdido la Torre del bosque de la peste!', '¡La Alianza ha p la Torre del bosque de la peste!', 'Альянс потерял башню Чумного леса!'),
 
-- hellfire peninsula
(10019,'|cffffff00The Overlook has been taken by the Horde!|r', '|cffffff00La Dominancia ha sido tomada por la Horda!|r', '|cffffff00La Dominancia ha sido tomada por la Horda!|r', '|cffffff00Орда захватила Дозорное укрепление!|r'),
(10020,'|cffffff00The Overlook has been taken by the Alliance!|r', '|cffffff00La Dominancia ha sido tomada por la Alianza!|r', '|cffffff00La Dominancia ha sido tomada por la Alianza!|r', '|cffffff00Альянс захватил Дозорное укрепление!|r'),
(10021,'|cffffff00The Stadium has been taken by the Horde!|r', '|cffffff00El Estadium ha sido tomado por la Horda!|r', '|cffffff00El Estadium ha sido tomado por la Horda!|r', '|cffffff00Орда захватила Ристалище!|r'),
(10022,'|cffffff00The Stadium has been taken by the Alliance!|r', '|cffffff00El Estadium ha sido tomado por la Alianza!|r', '|cffffff00El Estadium ha sido tomado por la Alianza!|r', '|cffffff00Альянс захватил Ристалище!|r'),
(10023,'|cffffff00Broken Hill has been taken by the Horde!|r', '|cffffff00Cerro Tábido ha sido tomado por la Horda!|r', '|cffffff00Cerro Tábido ha sido tomado por la Horda!|r', '|cffffff00Орда захватила Изрезанный холм!|r'),
(10024,'|cffffff00Broken Hill has been taken by the Alliance!|r', '|cffffff00Cerro Tábido ha sido tomado por la Alianza!|r', '|cffffff00Cerro Tábido ha sido tomado por la Alianza!|r', '|cffffff00Альянс захватил Изрезанный холм!|r'),
 
 -- following does not exist on retail (confirmed!)
(10025,'The Horde lost The Overlook!', '', '', ''),
(10026,'The Alliance lost The Overlook!', '', '', ''),
(10027,'The Horde lost The Stadium!', '', '', ''),
(10028,'The Alliance lost The Stadium!', '', '', ''),
(10029,'The Horde lost Broken Hill!', '', '', ''),
(10030,'The Alliance lost Broken Hill!', '', '', ''),
 
-- zangarmarsh
(10031,'|cffffff00The Horde has taken control of the West Beacon!|r', '|cffffff00¡La Horda ha tomado el control de la Baliza del Oeste!|r', '|cffffff00¡La Horda ha tomado el control de la Baliza del Oeste!|r', '|cffffff00Орда захватила Западный Маяк!|r'),
(10032,'|cffffff00The Alliance has taken control of the West Beacon!|r', '|cffffff00¡La Alianza ha tomado el control de la Baliza del Oeste!|r', '|cffffff00¡La Alianza ha tomado el control de la Baliza del Oeste!|r', '|cffffff00Орда захватила Западный Маяк!|r'),
(10033,'|cffffff00The Horde has taken control of the East Beacon!|r', '|cffffff00¡La Horda ha tomado el control de la Baliza del Este!|r', '|cffffff00¡La Horda ha tomado el control de la Baliza del Este!|r', '|cffffff00Орда захватила Восточный Маяк!|r'),
(10034,'|cffffff00The Alliance has control of taken the East Beacon!|r', '|cffffff00¡La Alianza ha tomado el control de la Baliza del Este!|r', '|cffffff00¡La Alianza ha tomado el control de la Baliza del Este!|r', '|cffffff00Альянс захватил Восточный Маяк!|r'),
-- '|cffffff00The Horde has taken control of both beacons!|r'
-- '|cffffff00The Alliance has taken control of both beacons!|r'
-- '|cffffff00The Horde Field Scout is now issuing battle standards.|r'
-- '|cffffff00The Alliance Field Scout is now issuing battle standards.|r'
(10035,'|cffffff00The Horde has taken control of Twin Spire Ruins!|r', '|cffffff00¡La Horda ha tomado el control del Cementerio de las Agujas Gemelas!|r', '|cffffff00¡La Horda ha tomado el control del Cementerio de las Agujas Gemelas!|r', '|cffffff00Орда захватила кладбище Двух Шпилей!|r'),
(10036,'|cffffff00The Alliance has taken control of Twin Spire Ruins!|r', '|cffffff00¡La Alianza ha tomado el control del Cementerio de las Agujas Gemelas!|r', '|cffffff00¡La Alianza ha tomado el control del Cementerio de las Agujas Gemelas!|r', '|cffffff00Альянс захватил кладбище Двух Шпилей!|r'), -- SMSG_PLAY_SOUND id 8173, from npc 15384 (npc id may be a parsing error, but unlikely)
(10037,'The Horde lost the West Beacon!', '¡La Horda ha perdido la Baliza del Oeste!', '¡La Horda ha perdido la Baliza del Oeste!', 'Орда потеряла Западный Маяк!'),
(10038,'The Alliance lost the West Beacon!', '¡La Alianza ha perdido la Baliza del Oeste!', '¡La Alianza ha perdido la Baliza del Oeste!', 'Альянс потерял Западный Маяк!'),
(10039,'The Horde lost the East Beacon!', '¡La Horda ha perdido la Baliza del Este!', '¡La Horda ha perdido la Baliza del Este!', 'Орда потеряла Восточный Маяк!'),
(10040,'The Alliance lost the East Beacon!', '¡La Alianza ha perdido la Baliza del Este!', '¡La Alianza ha perdido la Baliza del Este!', 'Альянс потерял Восточный Маяк!'),
(10041,'The Horde lost the Twin Spire Graveyard!', '¡La Horda ha perdido el Cementerio de las Agujas Gemelas!', '¡La Horda ha perdido el Cementerio de las Agujas Gemelas!', 'Орда потеряла кладбище Двух Шпилей!'),
(10042,'The Alliance lost the Twin Spire Graveyard!', '¡La Alianza ha perdido el Cementerio de las Agujas Gemelas!', '¡La Alianza ha perdido el Cementerio de las Agujas Gemelas!', 'Альянс потерял кладбище Двух Шпилей!'),
 
-- nagrand
(10043,'The Horde has captured Halaa!', '¡La Alianza ha capturado Halaa!', '¡La Alianza ha capturado Halaa!', 'Орда захватила Халаа!'),
(10044,'The Alliance has captured Halaa!', '¡La Horda ha capturado Halaa!', '¡La Horda ha capturado Halaa!', 'Альянс захватил Халаа!'),
(10045,'The Horde lost Halaa!', '¡La Horda ha perdido el control de Halaa!', '¡La Horda ha perdido el control de Halaa!', 'Орда потеряла Халаа!'),
(10046,'The Alliance lost Halaa!', '¡La Alianza ha perdido el control de Halaa!', '¡La Alianza ha perdido el control de Halaa!', 'Альянс потерял Халаа!'),
 
-- terokkar forest
(10047,'The Horde has taken a Spirit Tower!', '¡La Horda ha tomado una Torre del Espíritu!', '¡La Horda ha tomado una Torre del Espíritu!', 'Орда захватила башню Духов!'),
(10048,'The Alliance has taken a Spirit Tower!', '¡La Alianza ha tomado una Torre del Espíritu!', '¡La Alianza ha tomado una Torre del Espíritu!', 'Альянс захватил башню Духов!'),
(10049,'The Horde lost a Spirit Tower!', '¡La Horda ha perdido una Torre del Espíritu!', '¡La Horda ha perdido una Torre del Espíritu!', 'Орда потеряла башню Духов!'),
(10050,'The Alliance lost a Spirit Tower!', '¡La Alianza ha perdido una Torre del Espíritu!', '¡La Alianza ha perdido una Torre del Espíritu!', 'Альянс потерял башню Духов!');
*/