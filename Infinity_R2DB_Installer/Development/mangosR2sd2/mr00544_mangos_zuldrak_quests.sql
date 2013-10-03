-- Zul'Drak Arena (by koksneo)
-- Gurgthock (30007)
UPDATE `creature_template` SET `ScriptName`="npc_gurgthock" WHERE `entry`=30007;
UPDATE `quest_template` SET `StartScript`=12932 WHERE `entry`=12932;
UPDATE `quest_template` SET `StartScript`=12954 WHERE `entry`=12954;
UPDATE `quest_template` SET `StartScript`=12933 WHERE `entry`=12933;
UPDATE `quest_template` SET `StartScript`=12935 WHERE `entry`=12935;
UPDATE `quest_template` SET `StartScript`=12936 WHERE `entry`=12936;
UPDATE `quest_template` SET `StartScript`=12948 WHERE `entry`=12948;

-- support for quest chain The Amphitheater of Anguish(12932,12954,12933,12935,12936,12948)

-- NPC YGGDRAS (30014)
UPDATE `creature_template` SET
-- immune for movement imparing effects, silences etc.
`mechanic_immune_mask` = `mechanic_immune_mask`|1 |4 |16 |64 |256 |512 |1024 |2048 |65536 |131072 |33554432 ,
AIName='EventAI' WHERE `entry`=30014;

DELETE from creature_ai_scripts WHERE creature_id=30014;
INSERT into creature_ai_scripts VALUES
(3001400,30014,0,0,100,1,1000,1000,4000,4000,11,40504,1,0,0,0,0,0,0,0,0,0,'Yggdras- Cast cleave'),
(3001401,30014,0,0,100,1,2500,2500,6000,6000,11,57076,4,1,0,0,0,0,0,0,0,0,'Yggdras- Cast Corrode Flesh'),
(3001402,30014,6,0,100,0,0,0,0,0,11,55859,0,3,0,0,0,0,0,0,0,0,'Yggdras- Jormungar Spawn upon death'),
(3001403,30014,6,0,100,0,0,0,0,0,26,12932,0,0,0,0,0,0,0,0,0,0,'Yggdras- Complete Quest upon death');

-- NPC STINKBEARD (30017)
UPDATE `creature_template` SET
-- immune for movement imparing effects, silences etc.
`mechanic_immune_mask` = `mechanic_immune_mask`|1 |4 |16 |64 |256 |512 |1024 |2048 |65536 |131072 |33554432 ,
AIName='EventAI' WHERE `entry`=30017;

DELETE from creature_ai_scripts WHERE creature_id=30017;
INSERT into creature_ai_scripts VALUES
(3001700,30017,0,0,100,0,100,100,0,0,11,55866,0,1,0,0,0,0,0,0,0,0,'Stinkbeard- Cast Thunderblade'),
(3001701,30017,0,0,100,1,1000,1000,4000,4000,11,15588,1,1,0,0,0,0,0,0,0,0,'Stinkbeard- Cast Thunderclap'),
(3001702,30017,0,0,100,1,3000,3000,4000,4000,11,55867,1,1,0,0,0,0,0,0,0,0,'Stinkbeard- Cast Stinkbeard'),
(3001703,30017,0,0,100,1,2000,2000,4000,4000,11,31389,1,1,0,0,0,0,0,0,0,0,'Stinkbeard- Cast Knock Back'),
(3001704,30017,2,0,100,0,30,0,0,0,11,50420,0,1,0,0,0,0,0,0,0,0,'Stinkbeard- Cast Enrage at 30% HP'),
(3001705,30017,6,0,100,0,0,0,0,0,26,12933,0,0,0,0,0,0,0,0,0,0,'Stinkbeard- Complete Quest upon death');

-- NPC AZ BARIN (30026)
UPDATE `creature_template` SET
-- immune for movement imparing effects, silences etc.
`mechanic_immune_mask` = `mechanic_immune_mask`|1 |4 |16 |64 |256 |512 |1024 |2048 |65536 |131072 |33554432 ,
AIName='EventAI' WHERE entry=30026;

DELETE from creature_ai_scripts WHERE creature_id=30026;
INSERT into creature_ai_scripts VALUES
(3002600,30026,0,0,100,1,1000,1000,4000,4000,11,55912,0,3,0,0,0,0,0,0,0,0,'Az\'Barin-Cast Blast of Air'),
(3002601,30026,0,0,100,1,2000,2000,10000,10000,12,30045,1,0,0,0,0,0,0,0,0,0,'Az\'Barin-Summon Fiend of Air'),
(3002602,30026,6,0,100,0,0,0,0,0,26,12934,0,0,0,0,0,0,0,0,0,0,'Az\'Barin- Complete Quest upon death');

-- Fiend of air (30045)
UPDATE `creature_template` SET AIName='EventAI' WHERE entry=30045;

DELETE from creature_ai_scripts WHERE creature_id=30045;
INSERT into creature_ai_scripts VALUES
(3004500,30045,0,0,100,1,1000,1000,5000,5000,11,55882,1,1,0,0,0,0,0,0,0,0,'Fiend of Air-Cast Orb of Storms'),
(3004501,30045,0,0,100,1,3000,3000,5000,5000,11,55881,1,1,0,0,0,0,0,0,0,0,'Fiend of Air-Cast Hurricane');

-- NPC DUKE SINGEN (30019)
UPDATE `creature_template` SET
-- immune for movement imparing effects, silences etc.
`mechanic_immune_mask` = mechanic_immune_mask|1 |4 |16 |64 |256 |512 |1024 |2048 |65536 |131072 |33554432 ,
`AIName`='EventAI' WHERE entry=30019;

DELETE from creature_ai_scripts WHERE creature_id=30019;
INSERT into creature_ai_scripts VALUES
(3001900,30019,0,0,100,1,1000,1000,4000,4000,11,55916,1,1,0,0,0,0,0,0,0,0,'Duke Singen-Cast Magma Wave'),
(3001901,30019,0,0,100,1,2000,2000,10000,10000,12,30042,1,0,0,0,0,0,0,0,0,0,'Duke Singen -Summon Fiend of Fire'),
(3001902,30019,6,0,100,0,0,0,0,0,26,12934,0,0,0,0,0,0,0,0,0,0,'Duke Singen- Complete Quest upon death');

-- Fiend of Fire (30042)
UPDATE `creature_template` SET AIName='EventAI' WHERE entry=30042;

DELETE from creature_ai_scripts WHERE creature_id=30042;
INSERT into creature_ai_scripts VALUES
(3004200,30042,0,0,100,1,1000,1000,5000,5000,11,55872,1,1,0,0,0,0,0,0,0,0,'Fiend of Fire-Cast Orb of Flame');

-- NPC ERATHIUS (30025)
UPDATE `creature_template` SET
-- immune for movement imparing effects, silences etc.
`mechanic_immune_mask` = `mechanic_immune_mask`|1 |4 |16 |64 |256 |512 |1024 |2048 |65536 |131072 |33554432 ,
AIName='EventAI' WHERE `entry`=30025;

DELETE from creature_ai_scripts WHERE creature_id=30025;
INSERT into creature_ai_scripts VALUES
(3002500,30025,0,0,100,1,1000,1000,20000,20000,11,55918,1,7,0,0,0,0,0,0,0,0,'Erathius-Cast Shockwave'),
(3002501,30025,0,0,100,1,2000,2000,10000,10000,12,30043,1,0,0,0,0,0,0,0,0,0,'Erathius -Summon Fiend of Earth'),
(3002502,30025,6,0,100,0,0,0,0,0,26,12934,0,0,0,0,0,0,0,0,0,0,'Erathius- Complete Quest upon death');

-- Fiend of Earth (30043)
UPDATE `creature_template` SET `AIName`='EventAI' WHERE `entry`=30043;

DELETE from creature_ai_scripts WHERE creature_id=30043;
INSERT into creature_ai_scripts VALUES
(3004300,30043,0,0,100,1,1000,1000,5000,5000,11,55887,1,1,0,0,0,0,0,0,0,0,'Fiend of Earth-Cast Boulder');

-- NPC GARGORAL (30024)
UPDATE `creature_template` SET
-- immune for movement imparing effects, silences etc.
`mechanic_immune_mask` = mechanic_immune_mask|1 |4 |16 |64 |256 |512 |1024 |2048 |65536 |131072 |33554432 ,
`AIName`='EventAI' WHERE entry=30024;

DELETE from creature_ai_scripts WHERE creature_id=30024;
INSERT into creature_ai_scripts VALUES
(3002400,30024,0,0,100,1,1000,1000,5000,5000,11,55909,1,1,0,0,0,0,0,0,0,0,'Gargoral-Cast Crashing Wave'),
(3002401,30024,0,0,100,1,2000,2000,10000,10000,12,30044,1,0,0,0,0,0,0,0,0,0,'Gargoral -Summon Fiend of Water'),
(3002402,30024,6,0,100,0,0,0,0,0,26,12934,0,0,0,0,0,0,0,0,0,0,'Gargoral- Complete Quest upon death');

-- Fiend of Earth (30044)
UPDATE `creature_template` SET AIName='EventAI' WHERE `entry`=30044;

DELETE from creature_ai_scripts WHERE creature_id=30044;
INSERT into creature_ai_scripts VALUES
(3004400,30044,0,0,100,1,1000,1000,5000,5000,11,55888,1,1,0,0,0,0,0,0,0,0,'Fiend of Water-Cast Orb of Water');

-- NPC ORINOKO (30020)
UPDATE `creature_template` SET
-- immune for movement imparing effects, silences etc.
`mechanic_immune_mask` = mechanic_immune_mask|1 |4 |16 |64 |256 |512 |1024 |2048 |65536 |131072 |33554432 ,
AIName='EventAI' WHERE entry=30020;

DELETE from creature_ai_scripts WHERE creature_id=30020;
INSERT into creature_ai_scripts VALUES
(3002000,30020,0,0,100,1,1000,1000,40000,40000,11,26099,0,1,0,0,0,0,0,0,0,0,'Orinoko-Cast Battle shout'),
(3002001,30020,0,0,100,1,2000,2000,20000,20000,11,30044,1,7,0,0,0,0,0,0,0,0,'Orinoko-Cast Fishy Scent'),
(3002002,30020,0,0,100,1,22000,22000,20000,20000,12,30110,1,0,12,30110,1,0,12,30110,1,0,'Orinoko-Summon Hungry Penguins'),
(3002003,30020,0,0,100,1,22000,22000,20000,20000,12,30110,1,0,12,30110,1,0,12,30110,1,0,'Orinoko-Summon Hungry Penguins'),
(3002004,30020,2,0,100,0,50,0,0,0,12,30113,1,0,0,0,0,0,0,0,0,0,'Orinoko-Summon Whisker at 30% HP'),
(3002005,30020,6,0,100,0,0,0,0,0,26,12935,0,0,0,0,0,0,0,0,0,0,'Orinoko- Complete Quest upon death');

-- WHISKER (30113)
UPDATE `creature_template` SET
-- immune for movement imparing effects, silences etc.
`mechanic_immune_mask` = mechanic_immune_mask|1 |4 |16 |64 |256 |512 |1024 |2048 |65536 |131072 |33554432 ,
`AIName`='EventAI' WHERE `entry`=30113;

DELETE from creature_ai_scripts WHERE creature_id=30113;
INSERT into creature_ai_scripts VALUES
(3011300,30113,0,0,100,1,1000,1000,4000,4000,11,50169,1,1,0,0,0,0,0,0,0,0,'Whisker-Cast Flipper Thwack');

-- Hungry PENGUIN (30110)
-- UPDATE `creature_template` SET faction_A=16, faction_H=16, minLevel=74, maxLevel=74, minhealth=1028, maxhealth= 1028, armor=4681, mindmg=440, maxdmg=560, attackpower=512, dmg_multiplier=4 WHERE entry=30110;

-- NPC KORRAK (30023)
UPDATE `creature_template` SET
-- immune for movement imparing effects, silences etc.
`mechanic_immune_mask` = mechanic_immune_mask|1 |4 |16 |64 |256 |512 |1024 |2048 |65536 |131072 |33554432 ,
`AIName`='EventAI' WHERE `entry`=30023;

DELETE from creature_ai_scripts WHERE creature_id=30023;
INSERT into creature_ai_scripts VALUES
(3002300,30023,0,0,100,1,1000,1000,4000,4000,11,24193,4,6,0,0,0,0,0,0,0,0,'Korrak- Cast Charge'),
(3002301,30023,0,0,100,1,2500,2500,5000,5000,11,30471,1,0,0,0,0,0,0,0,0,0,'Korrak- Cast Uppercut'),
(3002302,30023,0,0,100,1,4000,4000,20000,20000,11,42745,0,1,0,0,0,0,0,0,0,0,'Korrak- Cast Enrage'),
(3002303,30023,0,0,100,1,10000,10000,10000,10000,11,55948,0,1,0,0,0,0,0,0,0,0,'Korrak- Cast Grow'),
(3002304,30023,6,0,100,0,0,0,0,0,26,12936,0,0,0,0,0,0,0,0,0,0,'Korrak- Complete Quest upon death');


-- NPC VLADOF THE BUTCHER (30022)
UPDATE `creature_template` SET
-- immune for movement imparing effects, silences etc.
`mechanic_immune_mask` = mechanic_immune_mask|1 |4 |16 |64 |256 |512 |1024 |2048 |65536 |131072 |33554432 ,
AIName='EventAI' WHERE `entry`=30022;

DELETE from creature_ai_scripts WHERE creature_id=30022;
INSERT into creature_ai_scripts VALUES
(3002200,30022,0,0,100,1,1000,1000,4000,4000,11,55973,4,6,0,0,0,0,0,0,0,0,'Vladof- Cast Blood Plauge'),
(3002201,30022,0,0,100,1,2500,2500,15000,15000,11,55974,1,1,0,0,0,0,0,0,0,0,'Vladof- Cast Blood boil'),
(3002202,30022,0,0,100,1,4000,4000,40000,40000,11,55975,0,1,0,0,0,0,0,0,0,0,'Vladof- Cast Hysteria'),
(3002203,30022,0,0,100,1,7000,7000,20000,20000,11,55976,4,6,0,0,0,0,0,0,0,0,'Vladof- Spell Deflection'),
(3002204,30022,0,0,100,1,14000,14000,20000,20000,11,55977,4,6,0,0,0,0,0,0,0,0,'Vladof- Cast Whirlwind'),
(3002305,30022,6,0,100,0,0,0,0,0,26,12948,0,0,0,0,0,0,0,0,0,0,'Vladof- Complete Quest upon death'),
(3002306,30022,0,0,100,0,100,100,0,0,11,50689,0,1,0,0,0,0,0,0,0,0,'Vladof- Cast Blood Presence');

INSERT IGNORE INTO creature_ai_scripts VALUES (3002403,30024,4,0,100,0,0,0,0,0,1,-1052,0,0,0,0,0,0,0,0,0,0,'Gargoral the Water Lord - Yell on Aggro');
INSERT IGNORE INTO creature_ai_scripts VALUES (3002503,30025,4,0,100,0,0,0,0,0,1,-1053,0,0,0,0,0,0,0,0,0,0,'Erathius, King of Dirt - Yell on Aggro');
