-- Creature id: 55294
UPDATE creature_template SET AIName='EventAI' WHERE entry=55294;
DELETE FROM creature_ai_scripts WHERE creature_id=55294;
INSERT INTO creature_ai_scripts VALUES 
('5529401','55294','11','0','100','30','0','0','0','0','1','-552944','0','0','18','130','0','0','0','0','0','0','Yell Intro 1 and Set Unit Flag.'),
('5529402','55294','1','0','100','30','13000','13000','69200000','69200000','1','-552945','0','0','0','0','0','0','0','0','0','0','Yell Intro 2.'),
('5529403','55294','1','0','100','31','11000','11000','69200000','69200000','19','130','0','0','18','32836','0','0','0','0','0','0','Remove Unit Flag and Set Unit Flag.'),
('5529404','55294','7','0','100','30','0','0','0','0','41','8000','0','0','11','106388','0','0','1','-552942','0','0','Despawn at Evade.'),
('5529405','55294','0','0','100','31','35000','36000','45500','45500','11','106371','1','1','1','-552949','0','0','0','0','0','0','Cast Hour of Twilight and Yell.'),
('5529406','55294','4','0','100','30','0','0','0','0','11','106372','0','0','1','-552941','0','0','21','0','1','0','Cast Unstable Monstrosity and Yell and Set Combat Movement False.'),
('5529407','55294','0','0','100','31','60000','60000','60000','60000','1','-552939','0','0','11','106372','0','4','0','0','0','0','Cast Unstable Monstrosity on self and Yell.'),
('5529408','55294','6','0','100','30','0','0','0','0','1','-552943','0','0','0','0','0','0','0','0','0','0','Yell at death.'),
('5529409','55294','0','0','100','30','360000','360000','23000','23000','1','-552942','0','0','11','106388','1','1','41','8000','0','0','Cast Twilight Eruption and Yell and Force Despawn(Hard Enrage)'),
('5529410','55294','5','0','100','31','1200','1200','0','0','1','-552946','-552947','-552948','0','0','0','0','0','0','0','0','Yell at Kill.'),
('5529411','55294','0','0','100','31','117000','130000','117000','130000','1','-552946','-552947','-552948','0','0','0','0','0','0','0','0','Random Yell in Timer Combat. Custom.'),
('5529412','55294','23','0','100','31','106372','1','6000','6000','11','109182','8','10','0','0','0','0','0','0','0','0','Cast Unstable Twilight has aura 106372. Temp Hack. Need core support.'),
('5529413','55294','9','0','100','31','60','100','3000','3000','11','106415','1','0','0','0','0','0','0','0','0','0','Cast Twilight Blast at Melee Range Ultraxion.');


-- Text id: -552939
DELETE FROM creature_ai_texts WHERE entry=-552939;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-552939','Through the pain and fire my hatred burns!','26325','6','0','','0');

-- Text id: -552941
DELETE FROM creature_ai_texts WHERE entry=-552941;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-552941','Now is the hour of twilight!','26314','6','0','','0');

-- Text id: -552942
DELETE FROM creature_ai_texts WHERE entry=-552942;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-552942','I WILL DRAG YOU WITH ME INTO FLAME AND DARKNESS!','26315','6','0','','0');

-- Text id: -552943
DELETE FROM creature_ai_texts WHERE entry=-552943;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-552943','But...but...I am...Ul...trax...ionnnnnn...','26316','6','0','','0');

-- Text id: -552944
DELETE FROM creature_ai_texts WHERE entry=-552944;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-552944','I am the beginning of the end...the shadow which blots out the sun...the bell which tolls your doom...','26317','6','0','','0');

-- Text id: -552945
DELETE FROM creature_ai_texts WHERE entry=-552945;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-552945','For this moment ALONE was I made. Look upon your death, mortals, and despair!','26318','6','0','','0');

-- Text id: -552946
DELETE FROM creature_ai_texts WHERE entry=-552946;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-552946','Fall before Ultraxion!','26319','6','0','','0');

-- Text id: -552947
DELETE FROM creature_ai_texts WHERE entry=-552947;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-552947','Hahahahaha!','26321','6','0','','0');

-- Text id: -552948
DELETE FROM creature_ai_texts WHERE entry=-552948;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-552948','You have no hope!','26320','6','0','','0');

-- Text id: -552949
DELETE FROM creature_ai_texts WHERE entry=-552949;
INSERT INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES 
('-552949','The final shred of light fades, and with it, your pitiful mortal existence!','26323','6','0','','0');

DELETE FROM db_script_string WHERE entry IN (2000009995);
INSERT INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`) values('2000009995','I sense a great disturbance in the balance approaching. The chaos of it burns my mind!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я чувствую приближение Хаоса. Мой разум не в силах этого выдержать.','26148','0','0','0',NULL);
DELETE FROM `npc_text` WHERE (`ID`=56667);
INSERT INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) values('56667','Help combat Ultraxion.',NULL,'0','0','0','0','0','0','0','0',NULL,NULL,'0','0','0','0','0','0','0','0',NULL,NULL,'0','0','0','0','0','0','0','0',NULL,NULL,'0','0','0','0','0','0','0','0',NULL,NULL,'0','0','0','0','0','0','0','0',NULL,NULL,'0','0','0','0','0','0','0','0',NULL,NULL,'0','0','0','0','0','0','0','0',NULL,NULL,'0','0','0','0','0','0','0','0');
DELETE FROM `gossip_menu` WHERE (`entry`=13222);
INSERT INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `condition_id`) values('13322','56667','0','0');
DELETE FROM `gossip_menu_option` WHERE (`menu_id`=13222);
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `condition_id`) values('13322','0','0','I ready.','1','1','-1','0','13322','0','0',NULL,'0');
DELETE FROM `dbscripts_on_gossip` WHERE id=13322;
INSERT INTO `dbscripts_on_gossip` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) values('13322','6','10','55294','692000000','0','0','0','0','0','0','0','-1699.75','-2384.89','345.579','3.27604','Summon Ultraxion.');
INSERT INTO `dbscripts_on_gossip` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) values('13322','0','0','1','0','56665','50','4','2000009995','0','0','0','0','0','0','0','Say Ysera.');
INSERT INTO `dbscripts_on_gossip` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) values('13322','10','3','0','0','55294','50000','8','0','0','0','0','-1699.75','-2384.89','345.579','3.27604','Move point Ultraxion.');