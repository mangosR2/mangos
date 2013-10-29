-- DB fix in Ulduar (by Ulduar)
-- Creature id: 33772
UPDATE creature_template SET AIName='EventAI' WHERE entry=33772;
DELETE FROM creature_ai_scripts WHERE creature_id=33772;
INSERT INTO creature_ai_scripts VALUES 
('3377201','33772','0','0','100','7','6000','11000','13000','18000','11','64429','4','0','0','0','0','0','0','0','0','0','Faceless Horror - Cast Death Grip'),
('3377202','33772','0','0','100','7','6000','8000','8000','12000','11','63722','8','0','0','0','0','0','0','0','0','0','Faceless Horror - Cast Shadow Crash'),
('3377203','33772','0','0','100','7','15000','18000','25000','36000','11','63703','0','0','0','0','0','0','0','0','0','0','Faceless Horror - Cast Void Wave'),
('3377204','33772','2','0','100','6','40','0','0','0','11','63710','0','2','11','63708','0','6','0','0','0','0','Faceless Horror - Cast Void Barrier at 40% HP and summon Void Beast');

-- Script id: 33806
DELETE FROM dbscripts_on_creature_death WHERE id=33806;
INSERT INTO dbscripts_on_creature_death VALUES 
(33806,1,15,63723,0,0,0,0,0,0,0,0,0,0,0,0,''),
(33806,1,14,63710,0,33772,50000,0,0,0,0,0,0,0,0,0,'');

-- Script id: 33136
DELETE FROM dbscripts_on_creature_death WHERE id=33136;
INSERT INTO dbscripts_on_creature_death VALUES 
(33136,0,18,1000,0,0,0,0,0,0,0,0,0,0,0,0,'');

-- Script id: 33988
DELETE FROM dbscripts_on_creature_death WHERE id=33988;
INSERT INTO dbscripts_on_creature_death VALUES 
(33988,0,18,1000,0,0,0,0,0,0,0,0,0,0,0,0,'');

-- Summon Yogg-Saron guardian
REPLACE INTO `spell_script_target` (`entry`, `type`, `targetEntry`) VALUES
('62978', '1', '33292'); 

-- Linked creatures (from Ulduar)
DELETE FROM `creature_linking_template` WHERE `map` = 603 AND `master_entry` = 32845;
INSERT INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES
('32893','603','32845','5140','0'),
('32897','603','32845','5140','0'),
('32900','603','32845','5140','0'),
('32901','603','32845','5140','0'),
('32941','603','32845','5140','0'),
('32946','603','32845','5140','0'),
('32948','603','32845','5140','0'),
('32950','603','32845','5140','0'),
('33325','603','32845','5140','0'),
('33326','603','32845','5140','0'),
('33327','603','32845','5140','0'),
('33328','603','32845','5140','0'),
('33330','603','32845','5140','0'),
('33331','603','32845','5140','0'),
('33332','603','32845','5140','0'),
('33333','603','32845','5140','0');

DELETE FROM `creature_linking_template` WHERE `map` = 603 AND `master_entry` = 33288;
INSERT INTO `creature_linking_template` (`entry`, `map`, `master_entry`, `flag`, `search_range`) VALUES
('33988','603','33288','4112','0');

INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) values('129539','126685','15');
INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) values('129540','126686','15');
INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) values('129541','126687','15');
INSERT INTO `creature_linking` (`guid`, `master_guid`, `flag`) values('129538','126688','15');

-- Script id: 62940
DELETE FROM dbscripts_on_spell WHERE id=62940;
INSERT INTO dbscripts_on_spell VALUES 
(62940,0,18,1000,0,0,0,0,0,0,0,0,0,0,0,0,'Despawn at Teleport');


-- Script id: 33699
DELETE FROM dbscripts_on_creature_death WHERE id=33699;
INSERT INTO dbscripts_on_creature_death VALUES 
(33699,0,15,63630,0,33699,100,0,0,0,0,0,0,0,0,0,'Cast Avenger at death');


-- Creature id: 33699
UPDATE `creature_template` SET `AIName` = 'EventAI', `ScriptName` = '' WHERE `entry` = '33699';
DELETE FROM creature_ai_scripts WHERE creature_id=33699;
INSERT INTO creature_ai_scripts VALUES 
('3369901','33699','0','0','100','31','50000','60000','50000','60000','11','63528','0','34','0','0','0','0','0','0','0','0','Cast Super charge in Combat'),
('3369902','33699','0','0','100','31','12000','13000','17000','20000','11','63541','3','0','0','0','0','0','0','0','0','0','');

-- Creature id: 33755
UPDATE creature_template SET AIName='EventAI' WHERE entry=33755;
DELETE FROM creature_ai_scripts WHERE creature_id=33755;
INSERT INTO creature_ai_scripts VALUES 
('3375501','33755','4','0','100','6','0','0','0','0','11','63616','0','0','0','0','0','0','0','0','0','0','');

-- Creature id: 33754
UPDATE creature_template SET AIName='EventAI' WHERE entry=33754;
DELETE FROM creature_ai_scripts WHERE creature_id=33754;
INSERT INTO creature_ai_scripts VALUES 
('3375401','33754','4','0','100','2','0','0','0','0','11','63610','0','0','0','0','0','0','0','0','0','0',''),
('3375402','33754','4','0','100','4','0','0','0','0','11','63674','0','0','0','0','0','0','0','0','0','0','');
