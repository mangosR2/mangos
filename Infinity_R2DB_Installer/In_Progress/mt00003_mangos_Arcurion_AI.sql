DELETE FROM `creature_template_addon` WHERE (`entry`=54590);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES (54590, 0, 0, 1, 0, 0, 0, 10255);

-- Text id: -1700
DELETE FROM creature_ai_texts WHERE entry=-1700;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-1700','Nothing! Nothing....','25797','6','0','Arcurion Death','0');

-- Text id: -1701
DELETE FROM creature_ai_texts WHERE entry=-1701;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-1701','None will survive!','25808','6','0','Arcurion Aggro','0');

-- Text id: -1702
DELETE FROM creature_ai_texts WHERE entry=-1702;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-1702','The Hour of Twilight falls - the end of all things - you cannot stop it. You are nothing. NOTHING!','25801','6','0','Arcurion 30%.','0');

-- Text id: -1703
DELETE FROM creature_ai_texts WHERE entry=-1703;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-1703','Mere mortals.','25803','6','0','Arcurion say kill 01','0');

-- Text id: -1704
DELETE FROM creature_ai_texts WHERE entry=-1704;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-1704','The Aspects misplaced their trust.','25806','6','0','Arcurion say kill 02','0');

-- Text id: -1705
DELETE FROM creature_ai_texts WHERE entry=-1705;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-1705','Your Shaman can\'t protect you.','25805','6','0','Arcurion say kill 03','0');



-- Creature id: 54590
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '54590';
DELETE FROM creature_ai_scripts WHERE creature_id=54590;
INSERT INTO creature_ai_scripts VALUES 
('5459001','54590','16','2','100','7','103962','1','2000','2000','41','1000','0','0','0','0','0','0','0','0','0','0','Force Despawn at Missing aura Tide of Cold.'),
('5459002','54590','0','2','100','7','6000','6000','400000','400000','11','103962','0','2','21','0','0','0','0','0','0','0','Cast Timer Buff Tide of Cold and Combat Movement false.'),
('5459003','54590','10','0','100','7','0','20','2000','2000','28','0','10255','0','2','14','0','0','22','1','0','0','Remove Stoned and Set Faction 14 and Set Phase at MoveLineOfSight OOC.'),
('5459004','54590','4','1','100','7','0','0','0','0','1','-1701','0','0','11','102593','1','8','0','0','0','0','Yell Aggro and Cast Frost Hand.'),
('5459005','54590','5','1','100','7','5000','5000','0','0','1','-1703','-1704','-1705','0','0','0','0','0','0','0','0','Yell at Kill.'),
('5459006','54590','0','0','100','7','5000','5000','5000','5000','11','102593','1','8','0','0','0','0','0','0','0','0','Cast Frost Hand.'),
('5459007','54590','0','0','100','7','18000','20000','15000','17000','11','102582','8','2','0','0','0','0','0','0','0','0','Cast Frost Chain.'),
('5459008','54590','7','0','100','6','0','0','0','0','41','3000','0','0','0','0','0','0','0','0','0','0','Evade at Despawn.'),
('5459009','54590','2','1','100','7','37','33','2000','2000','22','2','0','0','21','0','0','0','0','0','0','0','Just HP Set Phase 2 and Combat Movement False.'),
('5459010','54590','0','2','100','7','2000','3000','400000','400000','1','-1702','0','0','11','104050','0','1','20','0','0','0','Phase 2 - cast Tide of Cold and AutoAttack False. Need core support spell.'),
('5459011','54590','6','0','100','6','0','0','0','0','1','-1700','0','0','0','0','0','0','0','0','0','0','Yell just died.');




-- Creature id: 57197
UPDATE creature_template SET AIName='EventAI' WHERE entry=57197;
DELETE FROM creature_ai_scripts WHERE creature_id=57197;
INSERT INTO creature_ai_scripts VALUES 
('5719701','57197','11','0','100','6','0','0','0','0','12','54590','0','864000000','18','33587776','0','0','22','1','0','0','Summon Arcurion at Spawn and Set Unit Flag and Set Phase 1.'),
('5719702','57197','4','0','100','6','0','0','0','0','21','0','0','0','20','0','0','0','0','0','0','0','False Combat Movement and Auto Attack.'),
('5719703','57197','26','1','100','7','54590','2000','2000','0','22','2','0','0','0','0','0','0','0','0','0','0','Set Phase 2 at Despawn Arcurion.'),
('5719704','57197','1','2','100','7','10000','10000','864000000','864000000','12','54590','0','864000000','22','1','0','0','0','0','0','0','Phase 2 - summon Arcurion and Set Phase 1'),
('5719705','57197','25','0','100','7','54590','2000','2000','0','22','4','0','0','0','0','0','0','0','0','0','0','Set Phase 4 at Arcurion death.');




DELETE FROM `creature` WHERE `id`=54590;

