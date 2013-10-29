-- Creature id: 53494 Boss Baleroc in Firelands.
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '53494';
DELETE FROM creature_ai_scripts WHERE creature_id=53494;
INSERT INTO creature_ai_scripts VALUES 
('5349401','53494','0','0','100','31','360000','360000','360000','360000','1','-534944','0','0','11','82395','0','2','0','0','0','0','Yell just Berserk and Cast Berserk.'),
('5349402','53494','21','0','100','30','0','0','0','0','41','6000','0','0','18','262790','0','0','11','8677','0','3','Force despawn and Set Unit Flag and cast Send Event(Resummon)'),
('5349403','53494','6','0','100','30','0','0','0','0','1','-534942','0','0','0','0','0','0','0','0','0','0','Yell jist death.'),
('5349404','53494','0','0','100','24','8000','8000','45000','45000','11','99516','5','38','11','99516','3','38','0','0','0','0','Cast Countdown(Only Heroic). Need Core support and script support target.'),
('5349405','53494','23','0','100','31','99352','1','4000','4000','11','99353','1','2','0','0','0','0','0','0','0','0','Cast Decimation Strike just has aura Decimation Blade. Need core support. Temp hack.'),
('5349406','53494','23','0','100','31','99350','1','4000','4000','11','99351','1','2','0','0','0','0','0','0','0','0','Cast Inferno Strike just has aura Inferno Blade. Need core support. Temp hack.'),
('5349407','53494','0','0','100','63','30000','30000','30000','32000','11','99350','0','1','11','99352','0','1','0','0','0','0','Cast Random Blades.'),
('5349408','53494','0','0','100','63','30000','30000','30000','32000','1','-534945','0','0','1','-534946','0','0','0','0','0','0','Random Yell just cast Blades.'),
('5349409','53494','0','0','100','31','10000','10000','34000','35000','1','-534943','0','0','11','99259','0','0','0','0','0','0','Cast Torment shard and Yell.'),
('5349410','53494','4','0','100','30','0','0','0','0','1','-534947','0','0','0','0','0','0','0','0','0','0','Yell Aggro'),
('5349411','53494','0','0','100','31','5000','5000','15000','15000','11','99252','1','2','11','99369','0','2','0','0','0','0','Cast Vital Flame on Hostile and Searing Soul on self.');


-- Text id: -534941
DELETE FROM creature_ai_texts WHERE entry=-534947;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-534947','You are forbidden from my master\'s domain, mortals.','24441','6','0','','0');
-- Text id: -534942
DELETE FROM creature_ai_texts WHERE entry=-534942;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-534942','Mortal filth... the master\\\'s keep is forbidden...','24444','6','0','','0');

-- Text id: -534943
DELETE FROM creature_ai_texts WHERE entry=-534943;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-534943','Fool mortals. Hurl yourselves into your own demise!','24446','6','0','','0');

-- Text id: -534944
DELETE FROM creature_ai_texts WHERE entry=-534944;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-534944','None shall pass!','24452','6','0','','0');

-- Text id: -534945
DELETE FROM creature_ai_texts WHERE entry=-534945;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-534945','By the Firelord\'s command, you, too, shall perish!','24447','6','0','','0');

-- Text id: -534946
DELETE FROM creature_ai_texts WHERE entry=-534946;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-534946','Burn beneath my molten fury!','24459','6','0','','0');

-- Script id: 1428
DELETE FROM dbscripts_on_event WHERE id=1428;
INSERT INTO dbscripts_on_event VALUES 
(1428,0,10,53494,692000000,0,0,0,0,0,0,0,95.1545,-63.2031,54.9362,3.14159,'Summon Baleroc'),
(1428,5,10,7273,600000,0,0,0,0,0,0,0,1698.13,1222.45,8.88,3.97,'YTDB.'),
(1428,0,10,10506,600000,0,0,0,0,0,0,0,323.17,93.81,101.64,3.18,'YTDB.');



-- Script id: 99259
DELETE FROM dbscripts_on_spell WHERE id=99259;
INSERT INTO dbscripts_on_spell VALUES 
(99259,0,10,53495,30000,0,0,0,0,0,0,0,64.7848,-54.0725,54.3531,6.07324,'Summon Torment Shards.'),
(99259,0,10,53495,30000,0,0,0,0,0,0,0,77.788,-56.5305,54.8829,0.011738,'Summon Torment Shards.');



