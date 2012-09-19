ALTER TABLE db_version CHANGE COLUMN required_12091_01_mangos_spell_template required_12093_01_mangos_spell_template bit;

DELETE FROM spell_template WHERE id IN (44920, 44924, 44928, 44932, 45158, 45162, 45166, 45170);
INSERT INTO spell_template VALUES
(44920, 0x00000000, 101,  21,   6,   1,   0,  56, 24941,  0,     'Model - Shattered Sun Marksman - BE Male Tier 4'),
(44924, 0x00000000, 101,  21,   6,   1,   0,  56, 24945,  0,     'Model - Shattered Sun Marksman - BE Female Tier 4'),
(44928, 0x00000000, 101,  21,   6,   1,   0,  56, 24949,  0,     'Model - Shattered Sun Marksman - Draenei Male Tier 4'),
(44932, 0x00000000, 101,  21,   6,   1,   0,  56, 24953,  0,     'Model - Shattered Sun Marksman - Draenei Female Tier 4'),
(45158, 0x00000000, 101,  21,   6,   1,   0,  56, 25119,  0,     'Model - Shattered Sun Warrior - BE Female Tier 4'),
(45162, 0x00000000, 101,  21,   6,   1,   0,  56, 25123,  0,     'Model - Shattered Sun Warrior - BE Male Tier 4'),
(45166, 0x00000000, 101,  21,   6,   1,   0,  56, 25127,  0,     'Model - Shattered Sun Warrior - Draenei Female Tier 4'),
(45170, 0x00000000, 101,  21,   6,   1,   0,  56, 25131,  0,     'Model - Shattered Sun Warrior - Draenei Male Tier 4');

ALTER TABLE db_version CHANGE COLUMN required_12093_01_mangos_spell_template required_12094_01_mangos_creature_template bit;

UPDATE creature_template SET flags_extra=flags_extra|0x800;

ALTER TABLE db_version CHANGE COLUMN required_12094_01_mangos_creature_template required_12097_01_mangos_mangos_string bit;

DELETE FROM mangos_string WHERE entry BETWEEN 1600 AND 1636;

INSERT INTO mangos_string VALUES
(1600,'|cffffff00Northpass Tower has been taken by the Horde!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1601,'|cffffff00Northpass Tower has been taken by the Alliance!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1602,'|cffffff00Crown Guard Tower has been taken by the Horde!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1603,'|cffffff00Crown Guard Tower has been taken by the Alliance!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1604,'|cffffff00Eastwall Tower has been taken by the Horde!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1605,'|cffffff00Eastwall Tower has been taken by the Alliance!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1606,'|cffffff00The Plaguewood Tower has been taken by the Horde!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1607,'|cffffff00The Plaguewood Tower has been taken by the Alliance!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1608,'|cffffff00The Overlook has been taken by the Horde!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1609,'|cffffff00The Overlook has been taken by the Alliance!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1610,'|cffffff00The Stadium has been taken by the Horde!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1611,'|cffffff00The Stadium has been taken by the Alliance!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1612,'|cffffff00Broken Hill has been taken by the Horde!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1613,'|cffffff00Broken Hill has been taken by the Alliance!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1614,'|cffffff00The Horde has taken control of the East Beacon!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1615,'|cffffff00The Alliance has taken control of the East Beacon!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1616,'|cffffff00The Horde has taken control of the West Beacon!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1617,'|cffffff00The Alliance has taken control of the West Beacon!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1618,'|cffffff00The Horde has taken control of both beacons!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1619,'|cffffff00The Alliance has taken control of both beacons!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1620,'|cffffff00The Horde Field Scout is now issuing battle standards.|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1621,'|cffffff00The Alliance Field Scout is now issuing battle standards.|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1622,'|cffffff00The Horde has taken control of Twin Spire Ruins!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1623,'|cffffff00The Alliance has taken control of Twin Spire Ruins!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1624,'|cffffff00The Horde has taken control of a Spirit Tower!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1625,'|cffffff00The Alliance has taken control of a Spirit Tower!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1626,'|cffffff00The Horde has lost control of a Spirit Tower!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1627,'|cffffff00The Alliance has lost control of a Spirit Tower!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1628,'|cffffff00The Horde has taken control of The Bone Wastes!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1629,'|cffffff00The Alliance has taken control of The Bone Wastes!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1630,'|cffffff00The Horde is gaining control of Halaa!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1631,'|cffffff00The Alliance is gaining control of Halaa!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1632,'|cffffff00The Horde has taken control of Halaa!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1633,'|cffffff00The Alliance has taken control of Halaa!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1634,'|cffffff00Halaa is defenseless!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1635,'|cffffff00The Horde has collected 200 silithyst!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1636,'|cffffff00The Alliance has collected 200 silithyst!|r',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

ALTER TABLE db_version CHANGE COLUMN required_12097_01_mangos_mangos_string required_12112_01_mangos_spell_template bit;

ALTER TABLE spell_template ADD COLUMN effect0_misc_value_b int(11) unsigned NOT NULL DEFAULT '0' AFTER effect0_misc_value;

ALTER TABLE db_version CHANGE COLUMN required_12112_01_mangos_spell_template required_12113_01_mangos_spell_template bit;

DELETE FROM spell_template WHERE id IN (34810, 34817, 34818, 34819, 35153, 35904, 35905, 35906);
INSERT INTO spell_template VALUES
(34810, 0x00000000, 101,  21,  28,  42,   8,   0, 20083,  64,    0,     'Summon Summoned Bloodwarder Mender behind of the caster'),
(34817, 0x00000000, 101,  21,  28,  44,   8,   0, 20078,  64,    0,     'Summon Summoned Bloodwarder Reservist right of the caster'),
(34818, 0x00000000, 101,  21,  28,  43,   8,   0, 20078,  64,    0,     'Summon Summoned Bloodwarder Reservist left of the caster'),
(34819, 0x00000000, 101,  21,  28,  41,   8,   0, 20078,  64,    0,     'Summon Summoned Bloodwarder Reservist front of the caster'),
(35153, 0x00000000, 101,  21,  28,  42,   8,   0, 20405,  64,    0,     'Summon Nether Charge behind of the caster'),
(35904, 0x00000000, 101,  21,  28,  44,   8,   0, 20405,  64,    0,     'Summon Nether Charge right of the caster'),
(35905, 0x00000000, 101,  21,  28,  43,   8,   0, 20405,  64,    0,     'Summon Nether Charge left of the caster'),
(35906, 0x00000000, 101,  21,  28,  41,   8,   0, 20405,  64,    0,     'Summon Nether Charge front of the caster');


# SD2_2700
DELETE FROM `scripted_areatrigger` WHERE `entry` = 5604;
INSERT INTO `scripted_areatrigger` VALUES (5604, 'at_icecrown_citadel');
UPDATE creature_template SET ScriptName='' WHERE entry=18417;
UPDATE creature_template SET ScriptName='' WHERE entry=18141;
UPDATE creature_template SET ScriptName='mob_frost_bomb' WHERE entry=37186;
UPDATE creature_template SET ScriptName='' WHERE entry=18478;
UPDATE creature_template SET ScriptName='' WHERE entry=18431;
UPDATE creature_template SET ScriptName='' WHERE entry=19203;
UPDATE creature_template SET ScriptName='' WHERE entry=19205;
UPDATE creature_template SET ScriptName='' WHERE entry=19204;
UPDATE creature_template SET ScriptName='' WHERE entry=19206;
UPDATE creature_template SET ScriptName='' WHERE entry=17917;
UPDATE creature_template SET ScriptName='' WHERE entry=21101;
UPDATE creature_template SET ScriptName='' WHERE entry=20040;
UPDATE creature_template SET ScriptName='' WHERE entry=19710;
UPDATE creature_template SET ScriptName='' WHERE entry=20481;
UPDATE creature_template SET ScriptName='' WHERE entry=22140;
UPDATE creature_template SET ScriptName='' WHERE entry=21875;
UPDATE creature_template SET ScriptName='' WHERE entry=23469;
UPDATE creature_template SET ScriptName='' WHERE entry=23123;
UPDATE creature_template SET ScriptName='' WHERE entry=18588;
UPDATE creature_template SET ScriptName='' WHERE entry=22095;
UPDATE creature_template SET ScriptName='' WHERE entry=22307;
UPDATE creature_template SET ScriptName='' WHERE entry=12225;
UPDATE creature_template SET ScriptName='' WHERE entry=12203;
UPDATE creature_template SET ScriptName='' WHERE entry=12201;
UPDATE creature_template SET ScriptName='' WHERE entry=7358;
UPDATE creature_template SET ScriptName='' WHERE entry=15802;
UPDATE creature_template SET ScriptName='' WHERE entry=15334;
UPDATE creature_template SET ScriptName='' WHERE entry=15725;
UPDATE creature_template SET ScriptName='' WHERE entry=15726;
UPDATE creature_template SET ScriptName='' WHERE entry=17946;
UPDATE creature_template SET ScriptName='' WHERE entry=3057;
UPDATE creature_template SET ScriptName='' WHERE entry=17848;
UPDATE creature_template SET ScriptName='' WHERE entry=18096;
UPDATE creature_template SET ScriptName='' WHERE entry=17862;
UPDATE creature_template SET ScriptName='' WHERE entry=18338;
UPDATE creature_template SET ScriptName='' WHERE entry IN (8530,8531,8532);
UPDATE creature_template SET ScriptName='' WHERE entry=15085;
UPDATE creature_template SET ScriptName='' WHERE entry=15082;
UPDATE creature_template SET ScriptName='' WHERE entry=15114;
UPDATE creature_template SET ScriptName='' WHERE entry=14986;
UPDATE creature_template SET ScriptName='' WHERE entry=10440;
UPDATE creature_template SET ScriptName='' WHERE entry=10435;
UPDATE creature_template SET ScriptName='' WHERE entry=10437;
UPDATE creature_template SET ScriptName='' WHERE entry=11143;
UPDATE creature_template SET ScriptName='' WHERE entry=11136;
UPDATE creature_template SET ScriptName='' WHERE entry=10439;
UPDATE creature_template SET ScriptName='' WHERE entry=10808;
UPDATE creature_template SET ScriptName='' WHERE entry=11439;
UPDATE creature_template SET ScriptName='' WHERE entry=16118;
UPDATE creature_template SET ScriptName='' WHERE entry=14516;
UPDATE creature_template SET ScriptName='' WHERE entry=14693;
UPDATE creature_template SET ScriptName='' WHERE entry=3974;
UPDATE creature_template SET ScriptName='' WHERE entry=3983;
UPDATE creature_template SET ScriptName='' WHERE entry=4543;
UPDATE creature_template SET ScriptName='' WHERE entry=6490;
UPDATE creature_template SET ScriptName='' WHERE entry=4542;
UPDATE creature_template SET ScriptName='' WHERE entry=17167;
UPDATE creature_template SET ScriptName='' WHERE entry=19875;
UPDATE creature_template SET ScriptName='' WHERE entry=19874;
UPDATE creature_template SET ScriptName='' WHERE entry=19872;
UPDATE creature_template SET ScriptName='' WHERE entry=17007;
UPDATE creature_template SET ScriptName='' WHERE entry=19876;
UPDATE creature_template SET ScriptName='' WHERE entry=19873;
UPDATE creature_template SET ScriptName='' WHERE entry=24240;
UPDATE creature_template SET ScriptName='' WHERE entry=24241;
UPDATE creature_template SET ScriptName='' WHERE entry=24242;
UPDATE creature_template SET ScriptName='' WHERE entry=24243;
UPDATE creature_template SET ScriptName='' WHERE entry=24244;
UPDATE creature_template SET ScriptName='' WHERE entry=24245;
UPDATE creature_template SET ScriptName='' WHERE entry=24246;
UPDATE creature_template SET ScriptName='' WHERE entry=24247;
UPDATE creature_template SET ScriptName='' WHERE entry=10363;
UPDATE creature_template SET ScriptName='' WHERE entry=10220;
UPDATE creature_template SET ScriptName='' WHERE entry=9196;
UPDATE creature_template SET ScriptName='' WHERE entry=10596;
UPDATE creature_template SET ScriptName='' WHERE entry=9736;
UPDATE creature_template SET ScriptName='' WHERE entry=10429;
UPDATE creature_template SET ScriptName='' WHERE entry=9236;
UPDATE creature_template SET ScriptName='' WHERE entry=10430;
UPDATE creature_template SET ScriptName='' WHERE entry=9237;
UPDATE creature_template SET ScriptName='' WHERE entry=9031;
UPDATE creature_template SET ScriptName='' WHERE entry=9502;
UPDATE creature_template SET ScriptName='' WHERE entry=9027;
UPDATE creature_template SET ScriptName='' WHERE entry=9028;
UPDATE creature_template SET ScriptName='' WHERE entry=9938;
UPDATE creature_template SET ScriptName='' WHERE entry=14347;
UPDATE creature_template SET ScriptName='boss_rotface' WHERE entry=36627;
UPDATE creature_template SET ScriptName='mob_little_ooze' WHERE entry=36897;
UPDATE creature_template SET ScriptName='mob_big_ooze' WHERE entry=36899;
UPDATE creature_template SET ScriptName='boss_valithria_dreamwalker' WHERE entry=36789;
UPDATE creature_template SET ScriptName='mob_gluttonous_abomination' WHERE entry=37886;
UPDATE creature_template SET ScriptName='mob_blistering_zombie' WHERE entry=37934;
UPDATE creature_template SET ScriptName='mob_risen_archmage' WHERE entry=37868;
UPDATE creature_template SET ScriptName='mob_blazing_skeleton' WHERE entry=36791;
UPDATE creature_template SET ScriptName='mob_suppresser' WHERE entry=37863;
UPDATE creature_template SET ScriptName='' WHERE entry IN (15170,15171);
UPDATE creature_template SET ScriptName='' WHERE entry=11064;
UPDATE creature_template SET ScriptName='' WHERE entry=3442;
UPDATE creature_template SET ScriptName='' WHERE entry=7564;
UPDATE creature_template SET ScriptName='boss_professor_putricide' WHERE entry=36678;
UPDATE creature_template SET ScriptName='' WHERE entry=37886;
UPDATE creature_template SET ScriptName='' WHERE entry=37934;
UPDATE creature_template SET ScriptName='' WHERE entry=37868;
UPDATE creature_template SET ScriptName='' WHERE entry=36791;
UPDATE creature_template SET ScriptName='' WHERE entry=37863;
UPDATE creature_template SET ScriptName='boss_the_lich_king_icc' WHERE entry=36597;
DELETE FROM scripted_event_id WHERE id=11111;
INSERT INTO scripted_event_id VALUES
(11111,'event_go_barrel_old_hillsbrad');
UPDATE gameobject_template SET ScriptName='' WHERE entry=182589;
UPDATE creature_template SET ScriptName='' WHERE entry=10432;
