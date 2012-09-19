# Y2kCat
ALTER TABLE db_version_ytdb CHANGE COLUMN 627_FIX_12092 628_FIX_12126 bit;
REPLACE INTO `db_version_ytdb` (`version`) VALUES ('628_FIX_12126');

# NeatElves
UPDATE `creature_template_addon` SET `auras`='51589 52215' WHERE `entry`=28114;
UPDATE `quest_template` SET `NextQuestId`='3764' WHERE `entry`=3763;
UPDATE `gossip_menu_option` SET `action_menu_id`='7974' WHERE `menu_id`=7768 AND `id`=1;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES
('7974', '9821', '0', '0', '0', '0', '0', '0', '0', '0'),
('7979', '9822', '0', '0', '0', '0', '0', '0', '0', '0'),
('7978', '9823', '0', '0', '0', '0', '0', '0', '0', '0'),
('7977', '9824', '0', '0', '0', '0', '0', '0', '0', '0'),
('7976', '9825', '0', '0', '0', '0', '0', '0', '0', '0');
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(7974, 0, 0, 'I have done all that I could, Greatmother. I thank you for your kind words.', 1, 1, 7979, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7979, 0, 0, 'Greatmother, you are the mother of Durotan?', 1, 1, 7978, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7978, 0, 0, 'Greatmother, I never had the honor. Durotan died long before my time, but his heroics are known to all on my world. The orcs of Azeroth reside in a place known as Durotar, named after your son. And... (You take a moment to breathe and think through what you are about to tell the Greatmother.)', 1, 1, 7977, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7977, 0, 0, 'It is my Warchief, Greatmother. The leader of my people. From my world. He... He is the son of Durotan. He is your grandchild.', 1, 1, 7976, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7976, 0, 0, 'I will return to Azeroth at once, Greatmother.', 1, 1, -1, 0, 7976, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM gossip_scripts WHERE id = 7976;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
('7976', '0', '7', '10172', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'quest complete 10172');
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 7675 AND `id` = 1;
UPDATE `gossip_menu_option` SET `cond_1`='0', `cond_1_val_1`='0', `condition_id`='1178' WHERE `menu_id`=7675 AND `id`=0;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1745', '8', '10107', '0'), ('1746', '8', '10108', '0'), ('1747', '-2', '1745', '1746');
UPDATE `gossip_menu` SET `cond_1`='0', `cond_1_val_1`='0', `cond_2`='0', `cond_2_val_1`='0', `condition_id`='1747' WHERE `entry`=7675 AND `text_id`=9369 AND `script_id`=0;
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `guid`=69710;
DELETE FROM `quest_start_scripts` WHERE `id` = 9991;
REPLACE INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(9991, 5, 30, 532, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'taxi patch'),
(9991, 111, 7, 9991, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'quest complete 9991');
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES
(7719, 9427, 0, 0, 0, 0, 0, 0, 0, 407);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(884, -3, 407, 0);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(7719, 0, 0, 'I see twisted steel and smell sundered earth.', 1, 1, 7718, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 884);
UPDATE `gossip_menu_option` SET `action_script_id`='7715' WHERE `menu_id`=7715 AND `id`=0;
DELETE FROM `gossip_scripts` WHERE `id` = 7715;
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(7715, 5, 30, 532, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'taxi patch');
UPDATE `creature_template` SET `gossip_menu_id`='8047' WHERE `entry`=19879;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES
(8047, 9936, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(8047, 0, 1, 'Initiative, please do my stuff.', 3, 128, 0, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `gossip_menu_option` SET `action_menu_id`='-1', `action_script_id`='7379' WHERE `menu_id`=7379 AND `id`=0;
UPDATE `gossip_menu_option` SET `action_menu_id`='-1', `action_script_id`='41' WHERE `menu_id`=7379 AND `id`=1;
UPDATE `gossip_menu_option` SET `action_menu_id`='-1', `action_script_id`='42' WHERE `menu_id`=7379 AND `id`=2;
DELETE FROM `gossip_scripts` WHERE `id` in (7379,41,42);
INSERT INTO gossip_scripts (id,command,datalong,comments) VALUES
(7379,30,494,'William Kielar - Send Northpass Tower taxi'),
(41,30,495,'William Kielar - Send Eastwall Tower taxi'),
(42,30,496,'William Kielar - Send Crown Guard Tower taxi');

# ACID 309d -> 309e
UPDATE db_version SET `creature_ai_version` = 'ACID 3.0.9e \'Streamlined Perfection\' - Full Release for MaNGOS (3.3.5a Client)';
DELETE FROM `creature_ai_texts` WHERE `entry` in (-23,-24,-25,-26,-27,-142,-139,-640,-641,-642,-643,-644,-645,-646,-647);
UPDATE `creature_ai_texts` SET `type`='1' WHERE `entry` = -82;
UPDATE `creature_ai_texts` SET `type`='0' WHERE `entry` in (-898,-899,-900,-901);
REPLACE INTO `creature_ai_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`comment`,`emote`) VALUES
('-143','Any intruders must be eliminated!','0','1','0','Tempest Keep','0'),
('-144','Protect the Botanica at all costs!','0','1','0','17976','0'),
('-145','Protect the Mechanar at all costs!','0','1','0','19166','0'),
('-146','You hear a faint unlocking sound...','0','2','0','Mechanar','0'),
('-147','The end is come!','0','0','0','18796','0'),
('-343','%s calls for reinforcements!','0','2','0','17976','0'),
('-344','We must not fail our leader!  Kael\'thas will redeem us!','0','1','0','17976','0'),
('-345','The only justice is death!','0','0','0','18796','0'),
('-664','The end comes for you!','0','0','0','Shadow Labyrinth','0'),
('-665','I shall be rewarded!','0','0','0','Shadow Labyrinth','0'),
('-666','I do as I must!','0','0','0','Shadow Labyrinth','0'),
('-667','Ruin finds us all!','0','0','0','Shadow Labyrinth','0'),
('-668','In Sargeras\' name!','0','0','0','Shadow Labyrinth','0'),
('-669','The Legion reigns!','0','0','0','Shadow Labyrinth','0'),
('-670','Pathetic worm!','0','0','0','18848','0'),
('-810','Shur\'nab... shur\'nab... Yogg-Saron!','0','0','0','26646','0'),
('-1304','The people of Kaskala are in your debt, $c.','0','0','0','25322','0'),
('-1303', 'You have my gratitude, $c. I thought I\'d never be free.', '0', '0', '0', '25321', '0'),
('-1305','The light condemns all who harbor evil.  Now you will die!','0','0','0','Scarlet Monastery','0'),
('-1306','You carry the taint of the scourge.  Prepare to enter the twisting nether.','0','0','0','Scarlet Monastery','0'),
('-1307','There is no escape for you.  The Crusade shall destroy all who carry the scourge\'s taint.','0','0','0','Scarlet Monastery','0'),
('-1308','The Scarlet Crusade shall smite the wicked and drive evil from these lands!','0','0','0','Scarlet Monastery','0'),
('-1309','Do as I say, Fly!','0','0','0','17994','0');
#
DELETE FROM creature_ai_scripts WHERE creature_id in (9520,4291,4294,4303,10556,11319,11322,11323,11324,29184,20885,20886,17993,19633,18420,18421,19505,19508,19509,19511,19512,19633,19865,20083,19168,19710,20481);
REPLACE INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
('2378902','23789','1','0','100','0','4000','4000','0','0','19','768','0','0','0','0','0','0','0','0','0','0','Smolderwing - Become Hostile after Smolderwing Fire Breath Spell Cast'),
('1822501','18225','11','0','100','0','0','0','0','0','11','31961','0','0','0','0','0','0','0','0','0','0','Fire Bomb Target - Cast Fire Bomb on Spawn'),
('2346701','23467','11','0','100','0','0','0','0', '0','11','24240','0','1','0','0','0','0','0','0',' 0','0','Lord Illidan - Cast Spawn - Cast Red Lightning on Spawn'),
('2532101','25321','8','0','100','0','45504','-1','0','0','33','25321','6','0','1','-898','-899','-1303','41','3000','0','0','Kaskala Craftsman - Quest Credit and Yell and Delayed Despawn on Free Kaskala Spirit Spellhit (Quest: 11607)'),
('2532201','25322','8','0','100','0','45504','-1','0','0','33','25322','6','0','1','-900','-901','-1304','41','3000','0','0','Kaskala Shaman - Quest Credit and Yell and Delayed Despawn on Free Kaskala Spirit Spellhit (Quest: 11607)'),
('2806601','28066','11','0','100','1','0','0','0','0','20','0','0','0','21','1','0','0','0','0','0','0','Frozen Sphere - Prevent Auto Attack and Prevent Combat Movement on Spawn'),
('2806602','28066','0','0','100','1','0','0','1200','3700','11','50578','1','0','0','0','0','0','0','0','0','0','Frozen Sphere - Cast Ice Shard'),
('3349801','33498','8','0','100','0','63124','-1','5000','5000','11','63126','6','6','11','34510','0','22','0','0','0','0','Maloric - Cast Search Maloric and Cast Stun on Incapacitate Maloric Spellhit (Quest: 13654)'),
('2664601','26646','4','0','100','0','0','0','0','0','1','-810','0','0','0','0','0','0','0','0','0','0','Saronite Horror - Yell on Aggro'),
('2664602','26646','0','0','100','1','1000','3000','130000','140000','11','52342','0','0','0','0','0','0','0','0','0','0','Saronite Horror - Cast Seething Evil'),
('1863201','18632','4','0','10','38','0','0','0','0','1','-664','-665','-666','1','-667','-668','-669','1','-665','-666','-669','Cabal Executioner - Random Say on Aggro'),
('1863301','18633','4','0','10','38','0','0','0','0','1','-664','-665','-666','1','-667','-668','-669','1','-665','-666','-669','Cabal Acolyte - Random Say on Aggro'),
('1863402','18634','4','0','10','38','0','0','0','0','1','-664','-665','-666','1','-667','-668','-669','1','-665','-666','-669','Cabal Summoner - Random Say on Aggro'),
('1863501','18635','4','0','10','38','0','0','0','0','1','-664','-665','-666','1','-667','-668','-669','1','-665','-666','-669','Cabal Deathsworn - Random Say on Aggro'),
('1863702','18637','4','0','10','38','0','0','0','0','1','-664','-665','-666','1','-667','-668','-669','1','-665','-666','-669','Cabal Shadow Priest - Random Say on Aggro'),
('1863802','18638','4','0','10','38','0','0','0','0','1','-664','-665','-666','1','-667','-668','-669','1','-665','-666','-669','Cabal Zealot - Random Say on Aggro'),
('1863903','18639','4','0','10','38','0','0','0','0','1','-664','-665','-666','1','-667','-668','-669','1','-665','-666','-669','Cabal Spellbinder - Random Say on Aggro'),
('1864003','18640','4','0','10','38','0','0','0','0','1','-664','-665','-666','1','-667','-668','-669','1','-665','-666','-669','Cabal Warlock - Random Say on Aggro'),
('1879402','18794','4','0','10','38','0','0','0','0','1','-664','-665','-666','1','-667','-668','-669','1','-665','-666','-669','Cabal Ritualist - Random Say on Aggro'),
('1879601','18796','4','0','10','6','0','0','0','0','1','-147','-345','0','0','0','0','0','1','0','0','0','Fel Overseer - Random Say on Aggro'),
('1883001','18830','4','0','10','38','0','0','0','0','1','-664','-665','-666','1','-667','-668','-669','1','-665','-666','-669','Cabal Fanatic - Random Say on Aggro'),
('1884801','18848','4','0','10','6','0','0','0','0','1','-670','0','0','0','0','0','0','1','0','0','0','Malicious Instructor - Say on Aggro'),
('2918401','29184','11','0','100','6','0','0','0','0','20','0','0','0','21','0','0','0','0','0','0','0','Anub\'arak Impale Target - Prevent Autoattack and Movement on Spawn'),
('2918402','29184','0','0','100','6','100','100','0','0','11','53455','0','7','0','0','0','0','0','0','0','0','Anub\'arak Impale Target - Cast Ground Erupt Animation'),
('2918403','29184','0','0','100','2','3000','3000','0','0','11','53454','0','7','0','0','0','0','28','0','53455','0','Anub\'arak Impale Target (Normal) - Cast Impale'),
('2918404','29184','0','0','100','4','3000','3000','0','0','11','59446','0','7','0','0','0','0','28','0','53455','0','Anub\'arak Impale Target (Heroic) - Cast Impale'),
('2918405','29184','0','0','100','6','4000','5000','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Anub\'arak Impale Target - Despawn'),
('903901','9039','4','0','100','2','0','0','0','0','11','15092','0','2','11','13787','0','34','0','0','0','0','Doom\'rel - Cast Summon Voidwalkers and Demon Armor on Aggro'),
('903902','9039','0','0','100','3','10000','12000','10000','12000','11','15245','0','0','0','0','0','0','0','0','0','0','Doom\'rel - Cast Shadow Bolt Volley'),
('903903','9039','0','0','100','3','18000','20000','25000','25000','11','12742','4','0','0','0','0','0','0','0','0','0','Doom\'rel - Cast Immolate'),
('903904','9039','0','0','100','3','5000','8000','40000','45000','11','12493','4','0','0','0','0','0','0','0','0','0','Doom\'rel - Cast Curse of Weakness'),
('2110101','21101','11','0','100','2','0','0','0','0','11','36120','0','0','0','0','0','0','0','0','0','0','Unbound Void Zone (Normal) - Cast Consumption on Spawn'),
('2110102','21101','11','0','100','4','0','0','0','0','11','39003','0','0','0','0','0','0','0','0','0','0','Unbound Void Zone (Heroic) - Cast Consumption on Spawn'),
('1797601','17976','1','0','100','7','30000','60000','160000','190000','1','-344','0','0','0','0','0','0','0','0','0','0','Commander Sarannis - Yell OOC'),
('1797602','17976','4','0','100','6','0','0','0','0','1','-34','0','0','0','0','0','0','0','0','0','0','Commander Sarannis - Yell on Aggro'),
('1797603','17976','9','0','100','3','0','10','3800','15300','11','34794','1','0','1','-37','0','0','0','0','0','0','Commander Sarannis (Normal) - Cast Arcane Resonance and Yell'),
('1797604','17976','9','0','100','5','0','10','2800','12900','11','34794','1','0','1','-37','0','0','0','0','0','0','Commander Sarannis (Heroic) - Cast Arcane Resonance and Yell'),
('1797605','17976','0','0','100','7','20400','20400','13300','37400','11','34799','1','1','1','-38','0','0','0','0','0','0','Commander Sarannis - Cast Arcane Devastation on 3 Arcane Resonance Stack and Yell'),
('1797606','17976','2','0','100','2','55','0','0','0','1','-343','0','0','12','20078','4','1800000','12','19633','4','1800000','Commander Sarannis (Normal) - Emote and Summon Bloodwarder Reservist and Bloodwarder Mender at 55% HP'),
('1797607','17976','2','0','100','2','55','0','0','0','12','20078','4','1800000','12','20078','4','1800000','1','-39','0','0','Commander Sarannis (Normal) - Summon 2 Bloodwarder Reservists and Yell at 55% HP'),
('1797608','17976','0','0','100','5','30000','30000','60000','60000','1','-343','0','0','12','20078','4','1800000','12','19633','4','1800000','Commander Sarannis (Heroic) - Emote and Summon Bloodwarder Reservist and Bloodwarder Mender'),
('1797609','17976','0','0','100','5','30000','30000','60000','60000','12','20078','4','1800000','12','20078','4','1800000','1','-39','0','0','Commander Sarannis (Heroic) - Summon 2 Bloodwarder Reservists and Yell'),
('1797610','17976','5','0','100','7','5000','5000','0','0','1','-21','-35','0','0','0','0','0','0','0','0','0','Commander Sarannis - Yell on Player Kill'),
('1797611','17976','6','0','100','6','0','0','0','0','1','-36','0','0','0','0','0','0','0','0','0','0','Commander Sarannis - Yell on Death'),
('1797801','17978','4','0','100','6','0','0','0','0','1','-9','0','0','23','1','0','0','0','0','0','0','Thorngrin the Tender - Yell and Set Phase 1 on Aggro'),
('1797802','17978','0','5','100','3','4800','12100','16900','25300','11','34659','0','1','1','-10','-11','0','0','0','0','0','Thorngrin the Tender (Normal) - Cast Hellfire and Random Yell (Phase 1)'),
('1797803','17978','0','5','100','5','4800','12100','16900','22900','11','39131','0','1','1','-10','-11','0','0','0','0','0','Thorngrin the Tender (Heroic) - Cast Hellfire and Random Yell (Phase 1)'),
('1797804','17978','0','5','100','7','12000','12000','26000','26000','11','34661','5','0','1','-14','0','0','0','0','0','0','Thorngrin the Tender - Cast Sacrifice and Yell and Set Phase 2 (Phase 1)'),
('1797805','17978','24','3','100','7','34661','1','2000','2000','11','34670','0','0','1','-46','0','0','0','23','-1','0','Thorngrin the Tender - Cast Enrage and Yell and Set Phase 1 (Phase 2)'),
('1797806','17978','2','0','100','6','50','0','0','0','1','-12','0','0','0','0','0','0','0','0','0','0','Thorngrin the Tender - Yell at 50% HP'),
('1797807','17978','2','0','100','6','20','0','0','0','1','-13','0','0','0','0','0','0','0','0','0','0','Thorngrin the Tender - Yell at 20% HP'),
('1797808','17978','5','0','100','7','5000','5000','0','0','1','-15','0','0','0','0','0','0','0','0','0','0','Thorngrin the Tender - Yell on Player Kill'),
('1797809','17978','6','0','100','6','0','0','0','0','1','-16','0','0','22','0','0','0','0','0','0','0','Thorngrin the Tender - Yell and Set Phase 0 on Death'),
('1797810','17978','7','0','100','6','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Thorngrin the Tender - Set Phase 0 on Evade'),
('1799301','17993','9','0','100','6','8','25','0','0','11','34784','1','0','0','0','0','0','0','0','0','0','Bloodwarder Protector - Cast Intervene on Aggro'),
('1799302','17993','0','0','100','7','6600','14100','8200','16100','11','29765','1','0','0','0','0','0','0','0','0','0','Bloodwarder Protector - Cast Crystal Strike'),
('1799303','17993','2','0','100','6','20','0','0','0','11','35399','0','1','0','0','0','0','0','0','0','0','Bloodwarder Protector - Cast Spell Reflection at 20% HP'),
('1799401','17994','4','0','80','6','0','0','0','0','1','-1309','0','0','0','0','0','0','0','0','0','0','Bloodwarder Falconer - Say on Aggro'),
('1799402','17994','0','0','100','7','2400','12100','10800','22300','11','34852','4','0','0','0','0','0','0','0','0','0','Bloodwarder Falconer - Cast Call of the Falcon'),
('1799403','17994','0','0','100','7','4800','18100','15700','27700','11','32908','1','0','0','0','0','0','0','0','0','0','Bloodwarder Falconer - Cast Wing Clip'),
('1799404','17994','2','0','100','6','20','0','0','0','11','31567','0','1','0','0','0','0','0','0','0','0','Bloodwarder Falconer - Cast Deterrence at 20% HP'),
('1815501','18155','9','0','100','7','8','25','10000','10000','11','32323','1','0','0','0','0','0','0','0','0','0','Bloodfalcon - Cast Charge'),
('1815502','18155','0','0','100','7','6200','13300','10800','19300','11','34856','1','0','0','0','0','0','0','0','0','0','Bloodfalcon - Cast Bloodburn'),
('1815503','18155','0','0','100','7','12500','25300','25300','44200','11','18144','1','0','0','0','0','0','0','0','0','0','Bloodfalcon - Cast Swoop'),
('1840401','18404','0','0','100','7','11100','21500','16800','28900','11','34821','0','0','0','0','0','0','0','0','0','0','Bloodwarder Steward - Cast Arcane Flurry'),
('1840501','18405','1','0','75','7','30000','120000','120000','240000','1','-143','-144','0','0','0','0','0','0','0','0','0','Tempest Forge Peacekeeper - Random Say OOC'),
('1840502','18405','0','0','100','7','9200','21700','12100','24100','11','34785','1','0','0','0','0','0','0','0','0','0','Tempest Forge Peacekeeper - Cast Arcane Volley'),
('1840503','18405','0','0','100','7','8400','19300','7200','18100','11','34791','0','0','0','0','0','0','0','0','0','0','Tempest Forge Peacekeeper - Cast Arcane Explosion'),
('1840504','18405','0','0','100','7','7600','16400','15700','25300','11','34793','1','0','0','0','0','0','0','0','0','0','Tempest Forge Peacekeeper - Cast Arcane Blast'),
('1841901','18419','0','0','100','3','4800','14500','6100','18200','11','34798','1','0','0','0','0','0','0','0','0','0','Bloodwarder Greenkeeper (Normal) - Cast Greenkeeper\'s Fury'),
('1841902','18419','0','0','100','5','3100','8400','3600','7300','11','39121','1','0','0','0','0','0','0','0','0','0','Bloodwarder Greenkeeper (Heroic) - Cast Greenkeeper\'s Fury'),
('1841903','18419','0','0','100','3','9600','16900','7200','20500','11','34797','1','1','0','0','0','0','0','0','0','0','Bloodwarder Greenkeeper (Normal) - Cast Nature Shock'),
('1841904','18419','0','0','100','5','9600','16900','7200','16900','11','39120','1','1','0','0','0','0','0','0','0','0','Bloodwarder Greenkeeper (Heroic) - Cast Nature Shock'),
('1841905','18419','0','0','100','7','12000','18000','17000','21000','11','34800','5','1','0','0','0','0','0','0','0','0','Bloodwarder Greenkeeper - Cast Impending Coma'),
-- ('1842002','18420','1','0','100','7','20000','20000','20000','20000','11','34167','0','0','0','0','0','0','0','0','0','0','Sunseeker Geomancer - Cast Blizzard Visual OOC'),
-- ('1842001','18420','1','0','100','7','20000','20000','20000','20000','11','34169','0','0','0','0','0','0','0','0','0','0','Sunseeker Geomancer - Cast Rain of Fire Visual OOC'),
-- ('1842003','18420','1','0','100','7','20000','20000','20000','20000','11','34170','0','0','0','0','0','0','0','0','0','0','Sunseeker Geomancer - Cast Arcane Explosion Visual OOC'),
('1842004','18420','9','0','100','7','0','8','3600','8400','11','35124','0','0','0','0','0','0','0','0','0','0','Sunseeker Geomancer - Cast Arcane Explosion'),
('1842101','18421','1','0','100','7','1000','1000','2000','5000','11','34355','0','33','0','0','0','0','0','0','0','0','Sunseeker Researcher - Cast Poison Shield OOC'),
('1842102','18421','16','0','100','7','34355','1','2000','5000','11','34355','6','1','0','0','0','0','0','0','0','0','Sunseeker Researcher - Cast Poison Shield on Missing Buff'),
('1842103','18421','0','0','100','7','7200','16900','7200','21700','11','34352','1','32','0','0','0','0','0','0','0','0','Sunseeker Researcher - Cast Mind Shock'),
('1842104','18421','0','0','100','7','5500','21700','12100','24100','11','34354','1','32','0','0','0','0','0','0','0','0','Sunseeker Researcher - Cast Flame Shock'),
('1842105','18421','0','0','100','7','25300','33100','12100','19300','11','34353','1','32','0','0','0','0','0','0','0','0','Sunseeker Researcher - Cast Frost Shock'),
('1842201','18422','16','0','100','7','34350','15','16900','27700','11','34350','6','0','0','0','0','0','0','0','0','0','Sunseeker Botanist - Cast Nature\'s Rage on Friendlies on Missing Buff'),
('1842202','18422','0','0','100','3','19300','19300','38600','38600','11','34254','6','0','0','0','0','0','0','0','0','0','Sunseeker Botanist (Normal) - Cast Rejuvenate Plant'),
('1842203','18422','0','0','100','5','19300','19300','38600','38600','11','39126','6','0','0','0','0','0','0','0','0','0','Sunseeker Botanist (Heroic) - Cast Rejuvenate Plant'),
('1842204','18422','14','0','100','3','4000','15','13300','35100','11','27637','6','1','0','0','0','0','0','0','0','0','Sunseeker Botanist (Normal) - Cast Regrowth on Friendlies'),
('1842205','18422','14','0','100','5','5600','15','13300','35100','11','39125','6','1','0','0','0','0','0','0','0','0','Sunseeker Botanist (Heroic) - Cast Regrowth on Friendlies'),
('1858701','18587','8','0','100','7','34167','-1','1000','1000','11','34202','0','33','0','0','0','0','0','0','0','0','Frayer - Cast Frost Form on Blizzard SpellHit'),
('1858702','18587','8','0','100','7','34169','-1','1000','1000','11','34203','0','33','0','0','0','0','0','0','0','0','Frayer - Cast Fire Form on Rain of Fire SpellHit'),
('1858703','18587','8','0','100','7','34170','-1','1000','1000','11','34204','0','33','0','0','0','0','0','0','0','0','Frayer - Cast Arcane Form on Arcane Explosion SpellHit'),
('1948601','19486','0','0','100','3','4300','21500','18100','36200','11','34358','1','0','0','0','0','0','0','0','0','0','Sunseeker Chemist (Normal) - Cast Vial of Poison'),
('1948602','19486','0','0','100','5','4300','18200','18100','36200','11','39127','1','0','0','0','0','0','0','0','0','0','Sunseeker Chemist (Heroic) - Cast Vial of Poison'),
('1948603','19486','0','0','100','3','14400','22900','14500','24100','11','34359','0','0','0','0','0','0','0','0','0','0','Sunseeker Chemist (Normal) - Cast Fire Breath Potion'),
('1948604','19486','0','0','100','5','12200','19600','14500','24100','11','39128','0','0','0','0','0','0','0','0','0','0','Sunseeker Chemist (Heroic) - Cast Fire Breath Potion'),
('1950501','19505','0','0','100','7','8100','14200','12100','27700','11','34637','1','0','0','0','0','0','0','0','0','0','Sunseeker Channeler - Cast Soul Channel'),
('1950701','19507','0','0','100','3','4800','15300','18100','25300','11','34642','1','0','0','0','0','0','0','0','0','0','Sunseeker Gene-Splicer (Normal) - Cast Death and Decay'),
('1950702','19507','0','0','100','3','4800','15300','18100','25300','11','39347','1','0','0','0','0','0','0','0','0','0','Sunseeker Gene-Splicer (Heroic) - Cast Death and Decay'),
('1950703','19507','0','0','100','7','22100','29400','34800','37700','11','34247','1','1','0','0','0','0','0','0','0','0','Sunseeker Gene-Splicer - Summon Lasher Beast'),
('1950801','19508','0','0','100','7','6100','9600','12100','20500','11','22127','4','1','0','0','0','0','0','0','0','0','Sunseeker Herbalist - Cast Entangling Roots'),
('1950901','19509','0','0','100','7','3100','9700','8400','15700','11','34640','1','0','0','0','0','0','0','0','0','0','Sunseeker Harvester - Cast Wilting Touch'),
('1950902','19509','0','0','100','7','9000','15000','12000','18000','11','34639','5','1','0','0','0','0','0','0','0','0','Sunseeker Harvester - Cast Polymorph'),
('1951101','19511','0','0','100','7','4300','9700','21700','38600','11','34615','1','0','0','0','0','0','0','0','0','0','Nethervine Inciter - Cast Mind Numbing Poison'),
('1951102','19511','0','0','100','7','8500','18700','120000','120000','11','34616','1','0','0','0','0','0','0','0','0','0','Nethervine Inciter - Cast Deadly Poison'),
('1951103','19511','0','0','100','7','12100','24800','20500','30200','11','30621','1','0','0','0','0','0','0','0','0','0','Nethervine Inciter - Cast Kidney Shot'),
('1951201','19512','0','0','100','7','4300','16100','8100','12200','11','15284','1','0','0','0','0','0','0','0','0','0','Nethervine Reaper - Cast Cleave'),
('1951202','19512','0','0','100','5','17200','22600','21200','26400','11','34626','1','1','0','0','0','0','0','0','0','0','Nethervine Reaper (Heroic) - Cast Pale Death'),
('1951301','19513','0','0','100','7','8000','15000','18000','28000','11','30584','0','0','0','0','0','0','0','0','0','0','Mutate Fear-Shrieker - Cast Fear'),
('1955701','19557','0','0','100','3','2300','8300','5100','12100','11','34644','1','0','0','0','0','0','0','0','0','0','Greater Frayer (Normal) - Cast Lash'),
('1955702','19557','0','0','100','5','2300','8300','5100','12100','11','39122','1','0','0','0','0','0','0','0','0','0','Greater Frayer (Heroic) - Cast Lash'),
('1959801','19598','0','0','100','7','7800','12100','6200','12100','11','34351','1','0','0','0','0','0','0','0','0','0','Mutate Fleshlasher - Cast Vicious Bite'),
('1960801','19608','0','0','100','3','4200','8100','4100','10200','11','34644','1','0','0','0','0','0','0','0','0','0','Frayer Wildling (Normal) - Cast Lash'),
('1960802','19608','0','0','100','5','4200','8100','4100','8300','11','39122','1','0','0','0','0','0','0','0','0','0','Frayer Wildling (Heroic) - Cast Lash'),
('1963301','19633','1','0','100','7','1000','1000','1800000','1800000','11','34809','0','0','0','0','0','0','0','0','0','0','Bloodwarder Mender - Cast Holy Fury on Spawn'),
('1963302','19633','0','0','100','3','6400','10800','10800','19300','11','17194','1','0','0','0','0','0','0','0','0','0','Bloodwarder Mender (Normal) - Cast Mind Blast'),
('1963303','19633','0','0','100','5','6400','10800','10800','19300','11','17287','1','0','0','0','0','0','0','0','0','0','Bloodwarder Mender (Heroic) - Cast Mind Blast'),
('1963304','19633','14','0','100','3','3600','15','15700','26500','11','35096','6','1','0','0','0','0','0','0','0','0','Bloodwarder Mender (Normal) - Cast Greater Heal on Friendlies'),
('1963305','19633','14','0','100','5','5000','15','15700','26500','11','35096','6','1','0','0','0','0','0','0','0','0','Bloodwarder Mender (Heroic) - Cast Greater Heal on Friendlies'),
('1963306','19633','16','0','100','7','34809','15','14500','22900','11','34809','6','1','0','0','0','0','0','0','0','0','Bloodwarder Mender - Cast Holy Fury on Friendlies'),
('1984302','19843','9','0','100','7','0','5','4100','9700','11','34614','1','0','0','0','0','0','0','0','0','0','Nethervine Trickster - Cast Backstab'),
('1991901','19919','9','0','100','7','0','35','5000','10000','11','35071','1','0','0','0','0','0','0','0','0','0','Thorn Lasher - Cast Thorn Missiles'),
('1992001','19920','9','0','100','7','0','35','9600','15700','11','35507','1','0','0','0','0','0','0','0','0','0','Thorn Flayer - Cast Mind Flay'),
('1995801','19958','9','0','100','7','0','5','500','500','11','34752','1','32','0','0','0','0','0','0','0','0','White Seedling - Cast Freezing Touch'),
('1996201','19962','0','0','100','7','3200','3200','4800','5200','11','34782','1','0','0','0','0','0','0','0','0','0','Blue Seedling - Cast Bind Feet'),
('1996401','19964','9','0','100','7','0','20','2400','4800','11','36339','1','0','0','0','0','0','0','0','0','0','Red Seedling - Cast Fire Blast'),
('2007801','20078','0','0','100','7','12400','16400','8100','16200','11','34820','1','0','0','0','0','0','0','0','0','0','Summoned Bloodwarder Reservist - Cast Arcane Strike'),
('2008301','20083','1','0','100','7','1000','1000','1800000','1800000','11','34809','0','0','0','0','0','0','0','0','0','0','Summoned Bloodwarder Mender - Cast Holy Fury on Spawn'),
('2008302','20083','0','0','100','3','6400','10800','10800','19300','11','17194','1','0','0','0','0','0','0','0','0','0','Summoned Bloodwarder Mender (Normal) - Cast Mind Blast'),
('2008303','20083','0','0','100','5','6400','10800','10800','19300','11','17287','1','0','0','0','0','0','0','0','0','0','Summoned Bloodwarder Mender (Heroic) - Cast Mind Blast'),
('2008304','20083','14','0','100','3','3600','15','15700','26500','11','35096','6','1','0','0','0','0','0','0','0','0','Summoned Bloodwarder Mender (Normal) - Cast Greater Heal on Friendlies'),
('2008305','20083','14','0','100','5','5000','15','15700','26500','11','35096','6','1','0','0','0','0','0','0','0','0','Summoned Bloodwarder Mender (Heroic) - Cast Greater Heal on Friendlies'),
('2008306','20083','16','0','100','7','34809','15','14500','22900','11','34809','6','1','0','0','0','0','0','0','0','0','Summoned Bloodwarder Mender - Cast Holy Fury on Friendlies'),
('2535401','25354','0','0','100','7','7800','12100','6200','12100','11','34351','1','0','0','0','0','0','0','0','0','0','Mutate Fleshlasher - Cast Vicious Bite'),
('1916601','19166','1','0','75','7','30000','120000','120000','240000','1','-143','-145','0','0','0','0','0','0','0','0','0','Tempest-Forge Patroller - Random Say OOC'),
('1916602','19166','0','0','100','3','6100','10400','6800','16900','11','35012','1','0','0','0','0','0','0','0','0','0','Tempest-Forge Patroller (Normal) - Cast Charged Arcane Missle'),
('1916603','19166','0','0','100','5','6100','10400','6800','16900','11','38941','1','0','0','0','0','0','0','0','0','0','Tempest-Forge Patroller (Heroic) - Cast Charged Arcane Missle'),
('1916604','19166','0','0','100','7','9700','16400','12500','20500','11','35011','1','0','0','0','0','0','0','0','0','0','Tempest-Forge Patroller - Cast Knockdown'),
('1916605','19166','2','0','100','6','50','0','0','0','1','-551','0','0','39','25','0','0','0','0','0','0','Tempest-Forge Patroller - Emote and Call for Help at 50% HP'),
('1916701','19167','11','0','100','6','0','0','0','0','30','1','2','3','0','0','0','0','0','0','0','0','Bloodwarder Slayer - Random Phase on Spawn'),
('1916702','19167','0','13','100','7','7700','7700','10900','21700','11','15708','1','0','0','0','0','0','0','0','0','0','Bloodwarder Slayer - Cast Cast Mortal Strike (Phase 1)'),
('1916703','19167','4','11','100','6','0','0','0','0','11','35192','0','1','0','0','0','0','0','0','0','0','Bloodwarder Slayer - Cast Melt Armor Proc on Aggro (Phase 2)'),
('1916704','19167','0','11','100','7','7200','10600','12100','22900','11','35189','1','0','0','0','0','0','0','0','0','0','Bloodwarder Slayer - Cast Solar Strike (Phase 2)'),
('1916705','19167','4','7','100','6','0','0','0','0','11','35188','0','1','0','0','0','0','0','0','0','0','Bloodwarder Slayer - Cast Chilling Touch on Aggro (Phase 3)'),
('1916706','19167','0','7','100','7','7200','10600','12100','22900','11','35189','1','0','0','0','0','0','0','0','0','0','Bloodwarder Slayer - Cast Solar Strike (Phase 3)'),
('1916707','19167','0','0','100','7','9800','22900','10900','26500','11','13736','0','0','0','0','0','0','0','0','0','0','Bloodwarder Slayer - Cast Whirlwind'),
('1916801','19168','0','0','100','3','4800','16100','3000','5000','11','35265','0','33','0','0','0','0','0','0','0','0','Sunseeker Astromage (Normal) - Cast Fire Shield'),
('1916802','19168','0','0','100','5','4800','16100','3000','5000','11','38933','0','33','0','0','0','0','0','0','0','0','Sunseeker Astromage (Heroic) - Cast Fire Shield'),
('1916803','19168','0','0','100','3','3100','7600','12100','21700','11','17195','1','0','0','0','0','0','0','0','0','0','Sunseeker Astromage (Normal) - Cast Scorch'),
('1916804','19168','0','0','100','5','3100','7600','12100','21700','11','36807','1','0','0','0','0','0','0','0','0','0','Sunseeker Astromage (Heroic) - Cast Scorch'),
('1916805','19168','0','0','100','3','4800','26700','13200','27700','11','35267','1','1','0','0','0','0','0','0','0','0','Sunseeker Astromage (Normal) - Cast Solar Burn'),
('1916806','19168','0','0','100','5','4800','26700','13200','27700','11','38930','1','1','0','0','0','0','0','0','0','0','Sunseeker Astromage (Heroic) - Cast Solar Burn'),
('1921802','19218','0','0','100','7','10800','16400','27800','45800','11','35311','1','0','0','0','0','0','0','0','0','0','Gatewatcher Gyro-Kill - Cast Stream of Machine Fluid'),
('1921803','19218','0','0','100','3','15700','24900','15600','26900','11','35318','1','0','1','-84','-85','0','0','0','0','0','Gatewatcher Gyro-Kill (Normal) - Cast Saw Blade and Random Yell'),
('1921804','19218','0','0','100','5','15700','24900','15600','26900','11','39192','1','0','1','-84','-85','0','0','0','0','0','Gatewatcher Gyro-Kill (Heroic) - Cast Saw Blade and Random Yell'),
('1921805','19218','0','0','100','3','24100','33100','28900','54200','11','35322','0','0','0','0','0','0','0','0','0','0','Gatewatcher Gyro-Kill (Normal) - Cast Shadow Power'),
('1921806','19218','0','0','100','5','24100','33100','28900','54200','11','39193','0','0','0','0','0','0','0','0','0','0','Gatewatcher Gyro-Kill (Heroic) - Cast Shadow Power'),
('1921808','19218','6','0','100','6','0','0','0','0','1','-83','0','0','0','1','-146','0','0','0','0','0','Gatewatcher Gyro-Kill - Yell and Emote on Death'),
('1921902','19219','0','0','100','7','16100','18600','19700','33200','11','35161','1','0','0','0','0','0','0','0','0','0','Mechano-Lord Capacitus - Cast Head Crack'),
('1921903','19219','0','0','100','3','2000','5000','9000','13000','12','20405','4','0','0','0','0','0','0','0','0','0','Mechano-Lord Capacitus (Normal) - Summon Nether Charge'),
('1921904','19219','0','0','100','5','9000','11000','2500','3500','12','20405','4','0','0','0','0','0','0','0','0','0','Mechano-Lord Capacitus (Heroic) - Summon Nether Charge'),
('1921905','19219','0','0','100','3','15000','15000','40000','40000','11','35159','0','1','1','-90','-91','0','0','0','0','0','Mechano-Lord Capacitus (Normal) - Cast Reflective Damage Shield and Random Yell'),
('1921906','19219','0','0','100','3','35000','35000','40000','40000','11','35158','0','1','1','-90','-91','0','0','0','0','0','Mechano-Lord Capacitus (Normal) - Cast Reflective Magic Shield and Random Yell'),
('1921907','19219','0','0','100','5','24500','29700','27700','33800','11','39096','0','1','1','-90','-91','0','0','0','0','0','Mechano-Lord Capacitus (Heroic) - Cast Polarity Shift and Random Yell'),
('1921908','19219','0','0','100','5','180000','180000','1200','1200','11','26662','0','1','0','0','0','0','0','0','0','0','Mechano-Lord Capacitus (Heroic) - Cast Berserk after 3 Minutes'),
('1921909','19219','5','0','100','7','5000','5000','0','0','1','-88','-92','0','0','0','0','0','0','0','0','0','Mechano-Lord Capacitus - Random Yell on Player Kill'),
('1921910','19219','6','0','100','6','0','0','0','0','1','-89','0','0','0','0','0','0','0','0','0','0','Mechano-Lord Capacitus - Yell on Death'),
('1923101','19231','0','0','100','7','7800','13200','13300','21200','11','35055','1','0','0','0','0','0','0','0','0','0','Mechanar Crusher - Cast The Claw'),
('1923102','19231','0','0','100','3','11100','19300','22900','28900','11','35056','1','0','0','0','0','0','0','0','0','0','Mechanar Crusher (Normal) - Cast Glob of Machine Fluid'),
('1923103','19231','0','0','100','5','11100','19300','22900','28900','11','38923','1','0','0','0','0','0','0','0','0','0','Mechanar Crusher (Heroic) - Cast Glob of Machine Fluid'),
('1951001','19510','11','0','100','38','0','0','0','0','11','35188','0','1','11','35186','0','1','0','0','0','0','Bloodwarder Centurion - Random Cast Chilling Touch or Melt Armor Proc on Spawn'),
('1951002','19510','0','0','100','7','6200','19300','12100','16900','11','35178','1','0','0','0','0','0','0','0','0','0','Bloodwarder Centurion - Cast Shield Bash'),
('1951003','19510','0','0','100','7','11000','17000','19000','24000','11','34439','5','1','0','0','0','0','0','0','0','0','Bloodwarder Centurion - Cast Unstable Affliction'),
('1971002','19710','0','0','100','7','41100','83200','31400','46700','11','35311','1','0','0','0','0','0','0','0','0','0','Gatewatcher Iron-Hand - Cast Stream of Machine Fluid'),
('1971003','19710','0','0','100','7','10800','17400','39800','62700','11','35326','1','0','0','0','0','0','0','0','0','0','Gatewatcher Iron-Hand - Cast Hammer Punch'),
('1971004','19710','0','0','100','3','14400','25700','23300','53500','11','35327','0','1','1','-1214','-1215','0','1','-1219','0','0','Gatewatcher Iron-Hand (Normal) - Cast Jackhammer and Random Yell and Emote'),
('1971005','19710','0','0','100','5','14400','25700','23300','53500','11','39194','0','1','1','-1214','-1215','0','1','-1219','0','0','Gatewatcher Iron-Hand (Heroic) - Cast Jackhammer and Random Yell and Emote'),
('1971006','19710','0','0','100','3','32100','39800','32600','67500','11','35322','0','1','0','0','0','0','0','0','0','0','Gatewatcher Iron-Hand (Normal) - Cast Shadow Power'),
('1971007','19710','0','0','100','5','32100','39800','32600','67500','11','39193','0','1','0','0','0','0','0','0','0','0','Gatewatcher Iron-Hand (Heroic) - Cast Shadow Power'),
('1971008','19710','5','0','100','7','0','0','0','0','1','-1216','-1217','0','0','0','0','0','0','0','0','0','Gatewatcher Iron-Hand - Random Yell on Player Kill'),
('1971009','19710','6','0','100','6','0','0','0','0','1','-1218','0','0','1','-146','0','0','0','0','0','0','Gatewatcher Iron-Hand - Yell and Emote on Death'),
('1971201','19712','0','0','100','7','4700','18100','7200','16900','11','35047','1','0','0','0','0','0','0','0','0','0','Mechanar Driller - Cast Drill Armor'),
('1971202','19712','0','0','100','3','13300','37400','21700','33800','11','35056','1','0','0','0','0','0','0','0','0','0','Mechanar Driller (Normal) - Cast Glob of Machine Fluid'),
('1971203','19712','0','0','100','5','13300','37400','21700','33800','11','38923','1','0','0','0','0','0','0','0','0','0','Mechanar Driller (Heroic) - Cast Glob of Machine Fluid'),
('1971301','19713','0','0','100','7','15700','22500','17300','26500','11','35049','1','0','0','0','0','0','0','0','0','0','Mechanar Wrecker - Cast Pound'),
('1971302','19713','0','0','100','3','15200','27700','21700','36800','11','35056','1','0','0','0','0','0','0','0','0','0','Mechanar Wrecker (Normal) - Cast Glob of Machine Fluid'),
('1971303','19713','0','0','100','5','15200','27700','21700','36800','11','38923','1','0','0','0','0','0','0','0','0','0','Mechanar Wrecker (Heroic) - Cast Glob of Machine Fluid'),
('1971601','19716','1','0','100','6','0','0','0','0','21','0','0','0','20','0','0','0','23','1','0','0','Mechanar Tinkerer - Prevent Combat Movement and Prevent Melee and Set Phase 1 on Spawn'),
('1971602','19716','9','5','100','3','0','25','1200','1200','11','35057','1','0','40','2','0','0','0','0','0','0','Mechanar Tinkerer (Normal) - Cast Netherbomb and Set Ranged Weapon Model (Phase 1)'),
('1971603','19716','9','5','100','5','0','25','1200','1200','11','38925','1','0','40','2','0','0','0','0','0','0','Mechanar Tinkerer (Heroic) - Cast Netherbomb and Set Ranged Weapon Model (Phase 1)'),
('1971604','19716','9','5','100','6','20','80','0','0','21','1','1','0','20','1','0','0','0','0','0','0','Mechanar Tinkerer - Start Combat Movement and Start Melee at 20 Yards (Phase 1)'),
('1971605','19716','9','5','100','6','1','15','0','0','21','0','1','0','20','0','0','0','0','0','0','0','Mechanar Tinkerer - Prevent Combat Movement and Prevent Melee at 15 Yards (Phase 1)'),
('1971606','19716','2','5','100','6','50','0','0','0','21','1','0','0','11','35062','1','1','0','0','0','0','Mechanar Tinkerer - Enable Combat Movement and Cast Maniacal Charge and Set Phase 2 at 50% HP (Phase 1)'),
('1971607','19716','9','3','100','7','0','5','2000','2000','11','35058','0','7','37','0','0','0','0','0','0','0','Mechanar Tinkerer - Cast Nether Explosion and Die (Phase 2)'),
('1971608','19716','7','0','100','6','0','0','0','0','22','1','0','0','40','1','0','0','21','0','0','0','Mechanar Tinkerer - Set Phase to 1 and Set Melee Weapon Model and Prevent Combat Movement on Evade'),
('1973501','19735','0','0','100','7','9700','10800','10900','22900','11','35783','1','0','0','0','0','0','0','0','0','0','Tempest-Forge Destroyer - Cast Knockdown'),
('1973502','19735','0','0','100','7','8400','16900','9600','20500','11','36582','0','0','0','0','0','0','0','0','0','0','Tempest-Forge Destroyer - Cast Charged Fist'),
('2005901','20059','11','0','100','6','0','0','0','0','11','34427','0','1','0','0','0','0','0','0','0','0','Sunseeker Netherbinder - Cast Ethereal Teleport on Spawn'),
('2005902','20059','0','0','100','3','12100','19300','10800','25300','11','35261','0','1','0','0','0','0','0','0','0','0','Sunseeker Netherbinder (Normal) - Cast Arcane Nova'),
('2005903','20059','0','0','100','5','12100','19300','10800','25300','11','38936','0','1','0','0','0','0','0','0','0','0','Sunseeker Netherbinder (Heroic) - Cast Arcane Nova'),
('2005904','20059','0','0','100','3','6100','15600','12100','22500','11','35243','0','1','0','0','0','0','0','0','0','0','Sunseeker Netherbinder (Normal) - Cast Starfire'),
('2005905','20059','0','0','100','5','6100','15600','12100','22500','11','38935','0','1','0','0','0','0','0','0','0','0','Sunseeker Netherbinder (Heroic) - Cast Starfire'),
('2005906','20059','0','0','100','7','6000','12000','12000','17000','11','17201','0','0','0','0','0','0','0','0','0','0','Sunseeker Netherbinder - Cast Dispel Magic'),
('2005907','20059','0','0','100','7','14100','18900','63200','68100','11','35251','0','1','11','35260','0','1','0','0','0','0','Sunseeker Netherbinder - Summon 2 Arcane Servants'),
('2047801','20478','11','0','100','6','0','0','0','0','11','35259','0','1','0','0','0','0','0','0','0','0','Arcane Servant - Cast Spotlight on Spawn'),
('2047802','20478','0','0','100','7','3600','10800','16900','26500','11','35255','1','0','0','0','0','0','0','0','0','0','Arcane Servant - Cast Arcane Volley'),
('2047803','20478','6','0','100','6','0','0','0','0','11','22271','0','7','0','0','0','0','0','0','0','0','Arcane Servant - Cast Arcane Explosion on Death'),
-- ('2048101','20481','11','0','100','6','0','0','0','0','11','35281','0','0','0','0','0','0','0','0','0','0','Raging Flames - Cast Unknown Spell on Spawn (Data From Sniff) - Old SD2 Spell is 35278)'),
('2048102','20481','0','0','100','3','15700','31300','15700','28900','11','35268','0','0','0','0','0','0','0','0','0','0','Raging Flames (Normal) - Cast  Inferno'),
('2048103','20481','0','0','100','5','15700','31300','15700','28900','11','39346','0','0','0','0','0','0','0','0','0','0','Raging Flames (Heroic) - Cast  Inferno'),
('2040501','20405','11','0','100','6','0','0','0','0','11','35150','0','0','11','37670','0','0','41','18000','0','0','Nether Charge - Cast Nether Charge Passive and Cast Nether Charge Timer on Spawn'),
('2040502','20405','0','0','100','6','11000','11000','0','0','21','0','0','0','11','35151','0','1','0','0','0','0','Nether Charge - Prevent Combat Movement and Cast Nether Charge Pulse'),
('2040503','20405','0','0','100','6','13000','13000','0','0','11','35151','0','1','0','0','0','0','0','0','0','0','Nether Charge - Cast Nether Charge Pulse'),
('2040504','20405','0','0','100','6','15000','15000','0','0','11','35151','0','1','0','0','0','0','0','0','0','0','Nether Charge - Cast Nether Charge Pulse'),
('2040505','20405','0','0','100','6','17000','17000','0','0','11','35152','0','1','0','0','0','0','0','0','0','0','Nether Charge - Cast Unknown Spell (From Sniff Data)'),
('2098801','20988','0','0','100','7','1300','9600','21700','30200','11','36341','1','0','0','0','0','0','0','0','0','0','Sunseeker Engineer - Cast Super Shrink Ray'),
('2098802','20988','0','0','100','3','5100','16400','12100','22900','11','36345','1','0','0','0','0','0','0','0','0','0','Sunseeker Engineer (Normal) - Cast Death Ray'),
('2098803','20988','0','0','100','5','5100','16400','12100','22900','11','39196','1','0','0','0','0','0','0','0','0','0','Sunseeker Engineer (Heroic) - Cast Death Ray'),
('2098804','20988','16','0','100','7','36346','15','18100','24100','11','36346','6','0','0','0','0','0','0','0','0','0','Sunseeker Engineer - Cast Growth Ray on Friendlies'),
('2099001','20990','0','0','100','3','8400','19300','7200','19300','11','36340','1','0','0','0','0','0','0','0','0','0','Bloodwarder Physician (Normal) - Cast Holy Shock'),
('2099002','20990','0','0','100','5','8400','19300','7200','19300','11','38921','1','0','0','0','0','0','0','0','0','0','Bloodwarder Physician (Heroic) - Cast Holy Shock'),
('2099003','20990','14','0','100','3','6300','15','10000','16000','11','36348','6','1','0','0','0','0','0','0','0','0','Bloodwarder Physician (Normal) - Cast Bandage on Friendlies'),
('2099004','20990','14','0','100','5','7100','15','10000','16000','11','38919','6','1','0','0','0','0','0','0','0','0','Bloodwarder Physician (Heroic) - Cast Bandage on Friendlies'),
('2099005','20990','0','0','100','7','9000','14000','12000','16000','11','36333','5','1','0','0','0','0','0','0','0','0','Bloodwarder Physician - Cast Anesthetic'),
('1794601','17946','0','0','100','3','1000','2000','2000','3000','11','39349','1','0','0','0','0','0','0','0','0','0','Ancient Wisp - Cast Ancient Spark'),
('2573501','25735','11','0','100','2','0','0','0','0','11','45911','0','0','0','0','0','0','0','0','0','0','Armageddon Target - Cast Armageddon on Spawned'),
('2573502','25735','1','0','100','2','8000','8000','0','0','11','45909','0','0','0','0','0','0','0','0','0','0','Armageddon Target - Cast Armageddon on OOC Timer'),
('1533401','15334','11','0','100','2','0','0','0','0','21','0','0','0','20','0','0','0','11','26478','0','0','Giant Eye Tentacle - Set Combat Movement and Auto Attack false and Cast Ground Rupture on Spawn'),
('1533402','15334','0','0','100','3','0','1000','2000','3000','11','26134','4','0','0','0','0','0','0','0','0','0','Giant Eye Tentacle - Cast Eye Beam'),
('1571201','15712','11','0','100','2','0','0','0','0','20','0','0','0','21','0','0','0','0','0','0','0','Dirt Mound - Set Combat Movement and Auto Attack on false on Spawn'),
('1571202','15712','1','0','100','3','1000','1000','1000','1000','11','26093','0','0','0','0','0','0','0','0','0','0','Dirt Mound - Cast Quake'),
('1571203','15712','1','0','100','2','30000','30000','0','0','11','26060','0','0','41','1000','0','0','0','0','0','0','Dirt Mound - Cast Summon Ouro Scarabs and Forced Despawn'),
('1571801','15718','11','0','100','2','0','0','0','0','38','0','0','0','0','0','0','0','0','0','0','0','Ouro Scarab - Set In combat with Zone on Spawn'),
('1571802','15718','9','0','100','3','60','120','5000','10000','11','20477','6','1','0','0','0','0','0','0','0','0','Ouro Scarab - Cast Summon Player at 60 Yards'),
('1571803','15718','0','0','100','2','45000','45000','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Ouro Scarab - Forced Despawn on timer'),
('1572501','15725','11','0','100','2','0','0','0','0','21','0','0','0','11','26139','0','0','0','0','0','0','Claw Tentacle - Set Combat Movement false and Cast Ground Rupture on Spawn'),
('1572502','15725','0','0','100','3','2000','3000','5000','6000','11','26211','1','0','0','0','0','0','0','0','0','0','Claw Tentacle - Cast Hamstring'),
('1572601','15726','11','0','100','2','0','0','0','0','21','0','0','0','20','0','0','0','11','26139','0','0','Eye Tentacle - Set Combat Movement and Auto Attack false and Cast Ground Rupture on Spawned'),
('1572602','15726','0','0','100','3','0','1000','11000','12000','11','26143','4','0','0','0','0','0','0','0','0','0','Eye Tentacle - Cast Mind Flay'),
('1580201','15802','11','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Flesh Tentacle - Set Combat Movement false on Spawn'),
('397401','3974','4','0','100','2','0','0','0','0','1','-1205','0','0','0','0','0','0','0','0','0','0','Houndmaster Loksey - Yell on Aggro'),
('397402','3974','0','0','100','3','9300','9300','30100','38200','11','6192','0','0','0','0','0','0','0','0','0','0','Houndmaster Loksey - Cast Battle Shout'),
('397403','3974','0','0','100','3','2000','5000','30100','38200','11','6742','0','1','0','0','0','0','0','0','0','0','Houndmaster Loksey - Cast Bloodlust on Self'),
('397404','3974','16','0','100','3','6742','15','10900','18100','11','6742','6','0','0','0','0','0','0','0','0','0','Houndmaster Loksey - Cast Bloodlust on Friendlies'),
('398301','3983','11','0','100','2','0','0','0','0','11','8981','0','1','0','0','0','0','0','0','0','0','Interrogator Vishas - Cast Immolate on Spawn'),
('398302','3983','4','0','100','2','0','0','0','0','1','-1198','0','0','0','0','0','0','0','0','0','0','Interrogator Vishas - Yell on Aggro'),
('398303','3983','0','0','100','3','2400','6700','7200','21100','11','14032','1','0','0','0','0','0','0','0','0','0','Interrogator Vishas - Cast Shadow Word Pain'),
('398304','3983','2','0','100','2','60','0','0','0','1','-1199','0','0','0','0','0','0','0','0','0','0','Interrogator Vishas - Yell at 60% HP'),
('398305','3983','2','0','100','2','30','0','0','0','1','-1200','0','0','0','0','0','0','0','0','0','0','Interrogator Vishas - Yell at 30% HP'),
('398306','3983','5','0','100','3','0','0','0','0','1','-1201','0','0','0','0','0','0','0','0','0','0','Interrogator Vishas - Yell on Player Kill'),
('428601','4286','4','0','10','34','0','0','0','0','1','-1305','-1306','-1307','1','-1306','-1307','-1308','1','-1305','-1306','-1308','Scarlet Soldier - Random Say on Aggro'),
('428602','4286','0','0','100','3','3100','7200','10800','21700','11','3639','0','0','0','0','0','0','0','0','0','0','Scarlet Soldier - Cast Improved Blocking'),
('428603','4286','2','0','100','2','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Scarlet Soldier - Flee at 15% HP'),
('428701','4287','4','0','10','34','0','0','0','0','1','-1305','-1306','-1307','1','-1306','-1307','-1308','1','-1305','-1307','-1308','Scarlet Gallant - Random Say on Aggro'),
('428702','4287','9','0','100','3','0','5','4800','10900','11','14517','1','0','0','0','0','0','0','0','0','0','Scarlet Gallant - Cast Crusader Strike'),
('428703','4287','0','0','100','3','4600','9600','13300','22900','11','5589','1','1','0','0','0','0','0','0','0','0','Scarlet Gallant - Cast Hammer of Justice'),
('428704','4287','2','0','100','2','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Scarlet Gallant - Flee at 15% HP'),
('428802','4288','4','0','10','34','0','0','0','0','1','-1305','-1306','-1307','1','-1306','-1307','-1308','1','-1305','-1306','-1308','Scarlet Beastmaster - Random Say on Aggro'),
('428803','4288','9','5','100','3','5','30','2400','3600','11','6660','1','0','40','2','0','0','0','0','0','0','Scarlet Beastmaster - Cast Shoot and Set Ranged Weapon Model (Phase 1)'),
('428804','4288','0','5','100','3','9200','11600','10900','18100','11','7896','1','1','40','2','0','0','0','0','0','0','Scarlet Beastmaster - Cast Exploding Shot and Set Ranged Weapon Model (Phase 1)'),
('428805','4288','9','5','100','3','30','80','0','0','21','1','1','0','20','1','0','0','0','0','0','0','Scarlet Beastmaster - Start Combat Movement and Start Melee at 30 Yards (Phase 1)'),
('428806','4288','9','5','100','3','0','10','0','0','21','1','0','0','40','1','0','0','20','1','0','0','Scarlet Beastmaster - Start Combat Movement and Set Melee Weapon Model and Start Melee Below 10 Yards (Phase 1)'),
('428807','4288','9','5','100','3','11','25','0','0','21','0','1','0','20','0','0','0','0','0','0','0','Scarlet Beastmaster - Prevent Combat Movement and Prevent Melee at 25 Yards (Phase 1)'),
('428808','4288','2','0','100','2','15','0','0','0','23','1','0','0','0','0','0','0','0','0','0','0','Scarlet Beastmaster - Set Phase 2 at 15% HP'),
('428809','4288','2','3','100','2','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Scarlet Beastmaster - Start Combat Movement and Flee at 15% HP (Phase 2)'),
('428810','4288','7','0','100','2','0','0','0','0','22','1','0','0','40','1','0','0','0','0','0','0','Scarlet Beastmaster - Set Phase 1 and Set Melee Weapon Model on Evade'),
('428901','4289','1','0','100','2','0','0','0','0','21','0','0','0','11','2601','0','1','0','0','0','0','Scarlet Evoker - Prevent Combat Movement and Cast Fire Shield III on Spawn'),
('428902','4289','4','0','10','34','0','0','0','0','1','-1305','-1306','-1307','1','-1306','-1307','-1308','1','-1305','-1307','-1308','Scarlet Evoker - Random Say on Aggro'),
('428903','4289','4','0','100','2','0','0','0','0','11','9053','1','0','23','1','0','0','0','0','0','0','Scarlet Evoker - Cast Fireball and Set Phase 1 on Aggro'),
('428904','4289','9','13','100','3','0','40','3600','4800','11','9053','1','0','0','0','0','0','0','0','0','0','Scarlet Evoker - Cast Fireball (Phase 1)'),
('428905','4289','3','13','100','2','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Scarlet Evoker - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 1)'),
('428906','4289','9','13','100','2','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Scarlet Evoker - Start Combat Movement at 35 Yards (Phase 1)'),
('428907','4289','9','13','100','2','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Scarlet Evoker - Prevent Combat Movement at 15 Yards (Phase 1)'),
('428908','4289','9','13','100','2','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Scarlet Evoker - Start Combat Movement Below 5 Yards'),
('428909','4289','3','11','100','3','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Scarlet Evoker - Set Phase 1 when Mana is above 30% (Phase 2)'),
('428910','4289','0','0','100','3','14400','14400','22900','27700','11','20296','4','1','0','0','0','0','0','0','0','0','Scarlet Evoker - Cast Flamestrike'),
('428911','4289','16','0','100','3','2601','15','15700','19300','11','2601','6','1','0','0','0','0','0','0','0','0','Scarlet Evoker - Cast Fire Shield III on Friendlies'),
('428912','4289','2','0','100','2','15','0','0','0','22','3','0','0','0','0','0','0','0','0','0','0','Scarlet Evoker - Set Phase 3 at 15% HP'),
('428913','4289','2','7','100','2','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Scarlet Evoker - Start Combat Movement and Flee at 15% HP (Phase 3)'),
('428914','4289','7','0','100','2','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Scarlet Evoker - Set Phase to 0 on Evade'),
('429002','4290','0','0','100','3','8400','14100','14200','25200','11','6713','1','0','0','0','0','0','0','0','0','0','Scarlet Guardsman - Cast Disarm'),
('429101','4291','1','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Scarlet Diviner - Prevent Combat Movement on Spawn'),
('429102','4291','4','0','10','34','0','0','0','0','1','-1305','-1306','-1307','1','-1306','-1307','-1308','1','-1305','-1307','-1308','Scarlet Diviner - Random Say on Aggro'),
('429103','4291','4','0','100','2','0','0','0','0','11','9053','1','0','23','1','0','0','0','0','0','0','Scarlet Diviner - Cast Fireball and Set Phase 1 on Aggro'),
('429104','4291','9','13','100','3','0','40','3600','4800','11','9053','1','0','0','0','0','0','0','0','0','0','Scarlet Diviner - Cast Fireball (Phase 1)'),
-- ('429105','4291','0','13','100','3','9600','11600','14500','18100','11','11981','4','0','0','0','0','0','0','0','0','0','Scarlet Diviner - Cast Mana Burn (Phase 1)'),
('429106','4291','3','13','100','2','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Scarlet Diviner - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 1)'),
('429107','4291','9','13','100','2','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Scarlet Diviner - Start Combat Movement at 35 Yards (Phase 1)'),
('429108','4291','9','13','100','2','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Scarlet Diviner - Prevent Combat Movement at 15 Yards (Phase 1)'),
('429109','4291','9','13','100','2','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Scarlet Diviner - Start Combat Movement Below 5 Yards'),
('429110','4291','3','11','100','3','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Scarlet Diviner - Set Phase 1 when Mana is above 30% (Phase 2)'),
('429111','4291','2','0','100','2','15','0','0','0','22','3','0','0','0','0','0','0','0','0','0','0','Scarlet Diviner - Set Phase 3 at 15% HP'),
('429112','4291','2','7','100','2','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Scarlet Diviner - Start Combat Movement and Flee at 15% HP (Phase 3)'),
('429113','4291','7','0','100','2','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Scarlet Diviner - Set Phase to 0 on Evade'),
('429201','4292','4','0','10','34','0','0','0','0','1','-1305','-1306','-1307','1','-1306','-1307','-1308','1','-1305','-1306','-1308','Scarlet Protector - Random Say on Aggro'),
('429202','4292','0','0','100','3','1000','3000','240000','250000','11','8258','0','1','0','0','0','0','0','0','0','0','Scarlet Protector - Cast Devotion Aura on Aggro'),
('429203','4292','14','0','100','3','1600','20','13300','22900','11','31713','6','1','0','0','0','0','0','0','0','0','Scarlet Protector - Cast Holy Light on Friendlies'),
('429204','4292','2','0','100','2','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Scarlet Protector - Flee at 15% HP'),
('429302','4293','1','0','50','2','60000','180000','180000','360000','1','-183','-184','-185','0','0','0','0','0','0','0','0','Scarlet Scryer - Random Say OOC'),
('429303','4293','4','0','100','2','0','0','0','0','11','9613','1','0','23','1','0','0','0','0','0','0','Scarlet Scryer - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('429304','4293','9','13','100','3','0','40','3600','4800','11','9613','1','0','0','0','0','0','0','0','0','0','Scarlet Scryer - Cast Shadow Bolt (Phase 1)'),
('429305','4293','3','13','100','2','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Scarlet Scryer - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 1)'),
('429306','4293','9','13','100','2','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Scarlet Scryer - Start Combat Movement at 35 Yards (Phase 1)'),
('429307','4293','9','13','100','2','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Scarlet Scryer - Prevent Combat Movement at 15 Yards (Phase 1)'),
('429308','4293','9','13','100','2','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Scarlet Scryer - Start Combat Movement Below 5 Yards'),
('429309','4293','3','11','100','3','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Scarlet Scryer - Set Phase 1 when Mana is above 30% (Phase 2)'),
('429310','4293','9','0','100','3','0','30','30000','35000','11','1090','5','33','0','0','0','0','0','0','0','0','Scarlet Scryer - Cast Sleep'),
('429311','4293','2','0','100','2','15','0','0','0','22','3','0','0','0','0','0','0','0','0','0','0','Scarlet Scryer - Set Phase 3 at 15% HP'),
('429312','4293','2','7','100','2','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Scarlet Scryer - Start Combat Movement and Flee at 15% HP (Phase 3)'),
('429313','4293','7','0','100','2','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Scarlet Scryer - Set Phase to 0 on Evade'),
('429401','4294','1','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Scarlet Sorcerer - Prevent Combat Movement on Spawn'),
('429402','4294','4','0','100','2','0','0','0','0','11','9672','1','0','23','1','0','0','0','0','0','0','Scarlet Sorcerer - Cast Frostbolt and Set Phase 1 on Aggro'),
('429403','4294','9','13','100','3','0','40','3600','4800','11','9672','1','0','0','0','0','0','0','0','0','0','Scarlet Sorcerer - Cast Frostbolt (Phase 1)'),
('429404','4294','3','13','100','2','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Scarlet Sorcerer - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 1)'),
('429405','4294','9','13','100','2','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Scarlet Sorcerer - Start Combat Movement at 35 Yards (Phase 1)'),
('429406','4294','9','13','100','2','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Scarlet Sorcerer - Prevent Combat Movement at 15 Yards (Phase 1)'),
('429407','4294','9','13','100','2','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Scarlet Sorcerer - Start Combat Movement Below 5 Yards'),
('429408','4294','3','11','100','3','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Scarlet Sorcerer - Set Phase 1 when Mana is above 30% (Phase 2)'),
('429409','4294','0','0','100','3','18100','36200','16900','49600','11','6146','4','1','0','0','0','0','0','0','0','0','Scarlet Sorcerer - Cast Slow'),
-- ('429410','4294','0','0','100','3','11200','17500','20500','38600','11','8364','4','1','0','0','0','0','0','0','0','0','Scarlet Sorcerer - Cast Blizzard'),
('429411','4294','2','0','100','2','15','0','0','0','22','3','0','0','0','0','0','0','0','0','0','0','Scarlet Sorcerer - Set Phase 3 at 15% HP'),
('429412','4294','2','7','100','2','15','0','0','0','21','1','0','0','25','0','0','0','1','-47','0','0','Scarlet Sorcerer - Start Combat Movement and Flee at 15% HP (Phase 3)'),
('429413','4294','7','0','100','2','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Scarlet Sorcerer - Set Phase to 0 on Evade'),
('429501','4295','4','0','10','34','0','0','0','0','1','-1305','-1306','-1307','1','-1306','-1307','-1308','1','-1305','-1307','-1308','Scarlet Myrmidon - Random Say on Aggro'),
('429502','4295','2','0','100','3','30','0','120000','125000','11','8269','0','1','1','-46','0','0','0','0','0','0','Scarlet Myrmidon - Cast Frenzy at 30% HP'),
('429503','4295','2','0','100','2','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Scarlet Myrmidon - Flee at 15% HP'),
('429603','4296','9','13','100','3','0','40','3600','4800','11','9734','1','0','0','0','0','0','0','0','0','0','Scarlet Adept - Cast Holy Smite (Phase 1)'),
('429609','4296','14','0','100','3','1450','40','14100','21700','11','6063','6','1','0','0','0','0','0','0','0','0','Scarlet Adept - Cast Heal on Friendlies'),
('429704','4297','9','13','100','3','0','40','3600','4800','11','9053','1','0','0','0','0','0','0','0','0','0','Scarlet Conjuror - Cast Fireball (Phase 1)'),
('429801','4298','4','0','10','34','0','0','0','0','1','-1305','-1306','-1307','1','-1306','-1307','-1308','1','-1305','-1307','-1308','Scarlet Defender - Random Say on Aggro'),
('429802','4298','0','0','100','3','2300','6600','180000','186500','11','7164','0','1','0','0','0','0','0','0','0','0','Scarlet Defender - Cast Defensive Stance'),
('429803','4298','0','0','100','3','4200','14800','9600','18200','11','11972','1','0','0','0','0','0','0','0','0','0','Scarlet Defender - Cast Shield Bash'),
('429804','4298','0','0','100','3','8800','13300','8300','19200','11','3639','0','0','0','0','0','0','0','0','0','0','Scarlet Defender - Cast Improved Blocking'),
('429805','4298','2','0','100','2','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Scarlet Defender - Flee at 15% HP'),
('429902','4299','4','0','10','34','0','0','0','0','1','-1305','-1306','-1307','1','-1306','-1307','-1308','1','-1305','-1307','-1308','Scarlet Chaplain - Random Say on Aggro'),
('429903','4299','0','0','100','3','1000','6300','40000','51000','11','6066','0','1','0','0','0','0','0','0','0','0','Scarlet Chaplain - Cast Power Word: Shield'),
('429904','4299','16','0','100','3','6066','15','9700','16900','11','6066','6','1','0','0','0','0','0','0','0','0','Scarlet Chaplain - Cast Power Word: Shield on Friendlies Missing Aura'),
('429905','4299','14','0','100','3','1200','20','22900','28800','11','8362','6','1','0','0','0','0','0','0','0','0','Scarlet Chaplain - Cast Renew on Friendlies'),
('429906','4299','2','0','100','2','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Scarlet Chaplain - Flee at 15% HP'),
('430001','4300','0','0','100','3','1000','5000','16900','27500','11','2601','0','1','0','0','0','0','0','0','0','0','Scarlet Wizard - Cast Fire Shield III'),
('430002','4300','9','0','100','3','0','8','3600','12100','11','8439','0','0','0','0','0','0','0','0','0','0','Scarlet Wizard - Cast Arcane Explosion'),
('430101','4301','4','0','10','34','0','0','0','0','1','-1305','-1306','-1307','1','-1306','-1307','-1308','1','-1305','-1307','-1308','Scarlet Centurion - Random Say on Aggro'),
('430102','4301','0','0','100','3','4800','13400','12100','24600','11','31403','0','0','0','0','0','0','0','0','0','0','Scarlet Centurion - Cast Battle Shout'),
('430103','4301','2','0','100','2','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Scarlet Centurion - Flee at 15% HP'),
('430201','4302','4','0','10','34','0','0','0','0','1','-1305','-1306','-1307','1','-1306','-1307','-1308','1','-1306','-1307','-1308','Scarlet Champion - Random Say on Aggro'),
('430202','4302','0','0','100','3','8700','14200','18100','27300','11','17143','1','0','0','0','0','0','0','0','0','0','Scarlet Champion - Cast Holy Strike'),
('430203','4302','2','0','100','2','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Scarlet Champion - Flee at 15% HP'),
('430301','4303','1','0','100','3','1000','1000','1800000','1800000','11','1006','0','1','0','0','0','0','0','0','0','0','Scarlet Abbot - Cast Inner Fire on Spawn'),
('430302','4303','4','0','10','34','0','0','0','0','1','-1305','-1306','-1307','1','-1306','-1307','-1308','1','-1305','-1307','-1308','Scarlet Abbot - Random Say on Aggro'),
-- ('430303','4303','0','0','100','3','12000','21000','40000','51000','11','6066','0','1','0','0','0','0','0','0','0','0','Scarlet Abbot - Cast Power Word: Shield'),
('430304','4303','14','0','100','3','1800','40','13300','19300','11','6064','6','1','0','0','0','0','0','0','0','0','Scarlet Abbot - Cast Heal on Friendlies'),
('430305','4303','2','0','100','3','50','0','24100','30200','11','8362','0','1','0','0','0','0','0','0','0','0','Scarlet Abbot - Cast Renew at 50% HP'),
('430306','4303','2','0','100','3','30','0','120000','125000','11','8269','0','1','1','-46','0','0','0','0','0','0','Scarlet Abbot - Cast Enrage at 30% HP'),
('430307','4303','2','0','100','2','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Scarlet Abbot - Flee at 15% HP'),
('430601','4306','11','0','100','2','0','0','0','0','11','9276','0','1','0','0','0','0','0','0','0','0','Scarlet Torturer - Cast Immolate on Spawn'),
('430602','4306','1','0','50','2','60000','180000','180000','360000','1','-183','-184','-185','0','0','0','0','0','0','0','0','Scarlet Torturer - Random Say OOC'),
('430603','4306','2','0','100','2','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Scarlet Torturer - Flee at 15% HP'),
('454002','4540','4','0','10','34','0','0','0','0','1','-1305','-1306','-1307','1','-1306','-1307','-1308','1','-1306','-1307','-1308','Scarlet Monk - Random Say on Aggro'),
('454003','4540','9','0','100','3','3600','12100','3600','12800','11','11978','1','0','0','0','0','0','0','0','0','0','Scarlet Monk - Cast Kick'),
('454004','4540','2','0','100','2','15','0','0','0','25','0','0','0','1','-47','0','0','0','0','0','0','Scarlet Monk - Flee at 15% HP'),
('454201','4542','0','0','100','3','2800','11900','6100','20500','11','8282','1','0','0','0','0','0','0','0','0','0','High Inquisitor Fairbanks - Cast Curse of Blood'),
('454202','4542','0','0','100','3','3200','11300','5700','19300','11','15090','4','0','0','0','0','0','0','0','0','0','High Inquisitor Fairbanks - Cast Dispel Magic'),
('454204','4542','0','0','100','3','30000','30000','30000','30000','11','8399','0','0','0','0','0','0','0','0','0','0','High Inquisitor Fairbanks - Cast Sleep'),
('454205','4542','2','0','100','2','30','0','0','0','11','12039','0','1','0','0','0','0','0','0','0','0','High Inquisitor Fairbanks - Cast Heal at 30% HP'),
('454206','4542','2','0','100','2','25','0','0','0','11','11647','0','0','0','0','0','0','0','0','0','0','High Inquisitor Fairbanks - Cast Power Word: Shield at 25% HP'),
('454301','4543','1','0','100','2','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Bloodmage Thalnos - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('454302','4543','4','0','100','2','0','0','0','0','1','-1202','0','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Yell on Aggro'),
('454303','4543','4','0','100','2','0','0','0','0','11','9613','1','0','23','1','0','0','0','0','0','0','Bloodmage Thalnos - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('454304','4543','9','5','100','3','0','40','3600','4800','11','9613','1','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Cast Shadow Bolt (Phase 1)'),
('454305','4543','3','5','100','2','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Bloodmage Thalnos - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('454306','4543','9','5','100','2','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Start Combat Movement at 35 Yards (Phase 1)'),
('454307','4543','9','5','100','2','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Prevent Combat Movement at 15 Yards (Phase 1)'),
('454308','4543','9','5','100','2','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Start Combat Movement Below 5 Yards (Phase 1)'),
('454309','4543','3','3','100','3','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Set Phase 1 when Mana is above 15% (Phase 2)'),
('454310','4543','0','0','100','3','10600','16800','11300','23200','11','12470','0','1','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Cast Fire Nova'),
('454311','4543','0','0','100','3','13100','21400','38200','57700','11','8814','1','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Cast Flame Spike'),
('454312','4543','0','0','100','3','9700','24100','8400','15700','11','8053','0','1','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Cast Flame Shock'),
('454313','4543','5','0','100','3','0','0','0','0','1','-1204','0','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Yell on Player Kill'),
('454314','4543','2','0','100','2','50','0','0','0','1','-1203','0','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Yell at 50% HP'),
('454315','4543','7','0','100','2','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Bloodmage Thalnos - Set Phase to 0 on Evade'),
('642601','6426','0','0','100','3','6100','10900','20500','27700','11','7068','1','32','0','0','0','0','0','0','0','0','Anguished Dead - Cast Veil of Shadow'),
('642701','6427','0','0','100','3','3600','15700','9700','20500','11','8986','0','0','0','0','0','0','0','0','0','0','Haunting Phantasm - Summon Illusionary Phantasm'),
('648901','6489','0','0','100','3','5300','8400','19100','35800','11','21007','0','0','0','0','0','0','0','0','0','0','Ironspine - Cast Curse of Weakness'),
('648902','6489','0','0','100','3','6300','9400','20500','36200','11','3815','0','0','0','0','0','0','0','0','0','0','Ironspine - Cast Poison Cloud'),
('1131801','11318','0','0','100','3','6200','8100','5700','11900','11','11976','1','0','0','0','0','0','0','0','0','0','Ragefire Trogg - Cast Strike'),
('1131901','11319','1','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Ragefire Shaman - Prevent Combat Movement on Spawn'),
('1131902','11319','4','0','100','2','0','0','0','0','11','9532','1','0','23','1','0','0','0','0','0','0','Ragefire Shaman - Cast Lightning Bolt and Set Phase 1 on Aggro'),
('1131903','11319','9','5','100','3','0','40','9200','9800','11','9532','1','0','0','0','0','0','0','0','0','0','Ragefire Shaman - Cast Lightning Bolt (Phase 1)'),
('1131904','11319','3','5','100','2','15','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Ragefire Shaman - Start Combat Movement and Set Phase 2 when Mana is at 15% (Phase 1)'),
('1131905','11319','9','5','100','2','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Ragefire Shaman - Start Combat Movement at 35 Yards (Phase 1)'),
('1131906','11319','9','5','100','2','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Ragefire Shaman - Prevent Combat Movement at 15 Yards (Phase 1)'),
('1131907','11319','9','5','100','2','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Ragefire Shaman - Start Combat Movement Below 5 Yards'),
('1131908','11319','3','3','100','3','100','30','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Ragefire Shaman - Set Phase 1 when Mana is above 30% (Phase 2)'),
('1131909','11319','14','0','100','2','330','40','23800','23800','11','11986','6','1','0','0','0','0','0','0','0','0','Ragefire Shaman - Cast Healing Wave on Friendlies'),
('1131910','11319','7','0','100','2','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Ragefire Shaman - Set Phase to 0 on Evade'),
('1132001','11320','0','0','100','3','2400','15800','5300','14300','11','18070','1','0','0','0','0','0','0','0','0','0','Earthborer - Cast Earthborer Acid'),
('1132101','11321','11','0','100','2','0','0','0','0','11','18968','0','1','0','0','0','0','0','0','0','0','Molten Elemental - Cast Fire Shield on Spawn'),
('1132102','11321','27','0','100','3','18968','1','2000','5000','11','18968','0','1','0','0','0','0','0','0','0','0','Molten Elemental - Cast Fire Shield on Missing Fire Shield Aura'),
('1132201','11322','0','0','100','3','3300','10800','10100','19300','11','18266','1','32','0','0','0','0','0','0','0','0','Searing Blade Cultist - Cast Curse of Agony'),
('1132301','11323','0','0','100','3','6100','15300','7100','15200','11','8242','1','32','0','0','0','0','0','0','0','0','Searing Blade Enforcer - Cast Shield Slam'),
('1132401','11324','11','0','100','2','0','0','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Searing Blade Warlock - Prevent Combat Movement on Spawn'),
('1132402','11324','1','0','100','2','1000','1000','0','0','11','12746','0','0','0','0','0','0','0','0','0','0','Searing Blade Warlock - Summon Voidwalker on Spawn'),
('1132403','11324','4','0','100','2','0','0','0','0','11','20791','1','0','22','6','0','0','0','0','0','0','Searing Blade Warlock - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('1132404','11324','0','5','100','3','0','0','3300','4900','11','20791','1','0','0','0','0','0','0','0','0','0','Searing Blade Warlock - Cast Shadow Bolt (Phase 1)'),
('1132405','11324','3','5','100','2','15','0','0','0','21','1','0','0','22','5','0','0','0','0','0','0','Searing Blade Warlock - Start Combat Movement and Set Phase 2 when Mana is at 15%'),
('1132406','11324','9','5','100','3','25','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Searing Blade Warlock - Start Combat Movement Beyond 25 Yards'),
('1132407','11324','9','5','100','3','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Searing Blade Warlock - Start Combat Movement Below 5 Yards'),
('1132408','11324','9','5','100','3','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Searing Blade Warlock - Prevent Combat Movement at 15 Yards'),
('1132409','11324','3','3','100','3','100','30','100','100','22','6','0','0','0','0','0','0','0','0','0','0','Searing Blade Warlock - Set Phase 1 when Mana is above 30% (Phase 2)'),
('1132410','11324','7','0','100','2','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Searing Blade Warlock - Set Phase to 0 on Evade'),
('1151701','11517','0','0','100','3','8400','15900','5700','12100','11','40505','1','0','0','0','0','0','0','0','0','0','Oggleflint - Cast Cleave'),
('1151801','11518','0','0','100','3','14400','14400','6700','23100','11','20800','4','32','0','0','0','0','0','0','0','0','Jergosh the Invoker - Cast Immolate'),
('1151802','11518','0','0','100','3','5200','5200','7600','16600','11','18267','1','32','0','0','0','0','0','0','0','0','Jergosh the Invoker - Cast Curse of Weakness'),
('1151901','11519','9','0','100','3','0','5','4900','15700','11','14873','1','0','0','0','0','0','0','0','0','0','Bazzalan - Cast Sinister Strike'),
('1152001','11520','0','0','100','3','7200','12100','6700','16900','11','18072','1','0','0','0','0','0','0','0','0','0','Taragaman the Hungerer - Cast Uppercut'),
('1152002','11520','0','0','100','3','9200','14700','10400','18100','11','11970','0','0','0','0','0','0','0','0','0','0','Taragaman the Hungerer - Cast Fire Nova'),
('1971001','19710','4','0','100','6','0','0','0','0','1','-1213','0','0','0','0','0','0','0','0','0','0','Gatewatcher Iron-Hand - Yell on Aggro'),
('2086705','20867','12','0','100','3','30','0','60000','60000','11','36657','6','1','0','0','0','0','0','0','0','0','Death Watcher (Normal) - Cast Death Count When Target Below 30% HP'),
('2086706','20867','12','0','100','5','30','0','60000','60000','11','38818','6','1','0','0','0','0','0','0','0','0','Death Watcher (Heroic) - Cast Death Count When Target Below 30% HP');
#
UPDATE creature_template SET AIName='' WHERE entry IN (9520,10556,20885,20886,19865);
UPDATE creature_template SET AIName='EventAI' WHERE entry IN (18225,33498,9039,21101,18587,19919,17946,25735,15334,15712,15725,15726,15802);

# NeatElves
DELETE FROM creature_movement_template WHERE entry in (17635, 17995);
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z, script_id) VALUES
(17635, 1, 2501.349, -4725.994, 90.974, 0),
(17635, 2, 2491.211, -4693.162, 82.363, 0),
(17635, 3, 2493.059, -4655.492, 75.194, 0),
(17635, 4, 2562.227, -4646.404, 79.003, 0),
(17635, 5, 2699.748, -4567.377, 87.460, 0),
(17635, 6, 2757.274, -4527.591, 89.080, 0),
(17635, 7, 2850.868, -4417.565, 89.421, 0),
(17635, 8, 2888.340, -4328.486, 90.562, 0),
(17635, 9, 2913.271, -4167.140, 93.919, 0),
(17635, 10, 3035.656, -4260.176, 96.141, 0),
(17635, 11, 3088.544, -4250.208, 97.769, 0),
(17635, 12, 3147.302, -4318.796, 130.410, 0),
(17635, 13, 3166.813, -4349.198, 137.569, 1763501),
(17995, 1, 2501.349, -4725.994, 90.974, 0),
(17995, 2, 2491.211, -4693.162, 82.363, 0),
(17995, 3, 2493.059, -4655.492, 75.194, 0),
(17995, 4, 2562.227, -4646.404, 79.003, 0),
(17995, 5, 2699.748, -4567.377, 87.460, 0),
(17995, 6, 2757.274, -4527.591, 89.080, 0),
(17995, 7, 2850.868, -4417.565, 89.421, 0),
(17995, 8, 2888.340, -4328.486, 90.562, 0),
(17995, 9, 2913.271, -4167.140, 93.919, 0),
(17995, 10, 3035.656, -4260.176, 96.141, 0),
(17995, 11, 3088.544, -4250.208, 97.769, 0),
(17995, 12, 3147.302, -4318.796, 130.410, 0),
(17995, 13, 3166.813, -4349.198, 137.569, 1799501);
DELETE FROM creature_movement_scripts WHERE id IN (1763501,1799501);
INSERT INTO creature_movement_scripts (id, command, datalong, comments) VALUES
(1763501,20,0,'Lordaeron Commander - set movement to idle'),
(1799501,20,0,'Lordaeron Veteran - set movement to idle');
UPDATE `creature_template` SET `InhabitType` = 7 WHERE `entry` IN (36853, 38265, 38266, 38267);
DELETE FROM `creature_template_addon` WHERE `entry` = 36853;
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`)
VALUES (36853, 0, 50331648, 1, 0, 0, 1, '');
UPDATE `creature_template` SET `flags_extra`='2' WHERE `entry`=23373;
DELETE FROM `game_graveyard_zone` WHERE `id` = 969 AND `ghost_zone` in (3715,3716,3717,3607);
REPLACE INTO `game_graveyard_zone` (`id`, `ghost_zone`, `faction`) VALUES
(928, 3715, 67),
(928, 3716, 67),
(928, 3717, 67),
(928, 3607, 67),
(970, 3715, 469),
(970, 3716, 469),
(970, 3717, 469),
(970, 3607, 469);
UPDATE `creature` SET `spawndist`='0', `MovementType`='0' WHERE `guid`=64663;
UPDATE creature_template SET unit_flags=unit_flags|33554432, MovementType=0 WHERE entry IN (19523,19524);
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 5675 AND `id` = 1;
UPDATE `gossip_menu_option` SET `cond_1`='0', `cond_1_val_1`='0', `cond_2`='0', `cond_2_val_1`='0', `cond_2_val_2`='0', `cond_3`='0', `cond_3_val_1`='0', `cond_3_val_2`='0' WHERE `menu_id`=5675 AND `id`=0;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 5675 AND `id` = 1;
DELETE FROM `conditions` WHERE `condition_entry` = 1443;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(890, 8, 7785, 0),
(1084, 2, 18563, 1),
(1085, 2, 18564, 1),
(1129, -2, 1084, 1085),
(1130, 24, 19016, 1),
(1374, -3, 890, 0),
(1375, -1, 1374, 1130),
(1442, -1, 1375, 1129);
UPDATE `gossip_menu_option` SET `action_script_id`='5704' WHERE `menu_id`=5704 AND `id`=0;
DELETE FROM gossip_scripts WHERE id = 5704;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('5704 ', '0', '17', '19016', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'create Vessel of Rebirth');
DELETE FROM gossip_scripts WHERE id in (6561,50115,50114,50113,6559,6560);
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(6561, 0, 17, 20456, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(6560, 0, 17, 20455, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(6559, 0, 17, 20454, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
UPDATE `gossip_menu_option` SET `action_script_id`='6561' WHERE `menu_id`=6561 AND `id`=0;
UPDATE `gossip_menu_option` SET `action_script_id`='6560' WHERE `menu_id`=6560 AND `id`=0;
UPDATE `gossip_menu_option` SET `action_script_id`='6559' WHERE `menu_id`=6559 AND `id`=0;
UPDATE creature SET position_x = '-8020.283691', position_y = '1107.984985', position_z = '2.854700', orientation = '0.042761' WHERE guid = '20636';
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES
(6545, 7761, 0, 0, 0, 0, 0, 0, 0, 0),
(6546, 7760, 0, 0, 0, 0, 0, 0, 0, 0),
(6547, 7759, 0, 0, 0, 0, 0, 0, 0, 0),
(6548, 7758, 0, 0, 0, 0, 0, 0, 0, 0),
(6549, 7757, 0, 0, 0, 0, 0, 0, 0, 0),
(6550, 7756, 0, 0, 0, 0, 0, 0, 0, 0),
(6551, 7755, 0, 0, 0, 0, 0, 0, 0, 0),
(6552, 7768, 0, 0, 0, 0, 0, 0, 0, 0),
(6553, 7767, 0, 0, 0, 0, 0, 0, 0, 0),
(6554, 7766, 0, 0, 0, 0, 0, 0, 0, 0),
(6555, 7765, 0, 0, 0, 0, 0, 0, 0, 0),
(6556, 7764, 0, 0, 0, 0, 0, 0, 0, 0),
(6557, 7763, 0, 0, 0, 0, 0, 0, 0, 0),
(6558, 7762, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(1443, 9, 8304, 0);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(6533, 0, 0, 'Hello, Frankal. I\'ve heard that you might have some information as to the whereabouts of Mistress Natalia Mar\'alith.', 1, 1, 6558, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1443),
(6558, 0, 0, 'That\'s what I like to hear.', 1, 1, 6557, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6557, 0, 0, 'That\'s odd.', 1, 1, 6556, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6556, 0, 0, 'You couldn\'t handle a lone night elf priestess?', 1, 1, 6555, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6555, 0, 0, 'I\'ve been meaning to ask out about that monkey.', 1, 1, 6554, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6554, 0, 0, 'Then what?', 1, 1, 6553, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6553, 0, 0, 'What a story! So she went into Hive\'Regal and that was the last you saw of her?', 1, 1, 6552, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6552, 0, 0, 'Thanks for the information, Frankal.', 1, 1, -1, 0, 6552, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6534, 0, 0, 'Hello, Rutgar. The Commander has sent me here to gather some information about his missing wife.', 1, 1, 6551, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1443),
(6551, 0, 0, 'That sounds dangerous.', 1, 1, 6550, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6550, 0, 0, 'What happened to her after that?', 1, 1, 6549, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6549, 0, 0, 'Natalia?', 1, 1, 6548, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6548, 0, 0, 'What demands?', 1, 1, 6547, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6547, 0, 0, 'Lost it? What do you mean?', 1, 1, 6546, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6546, 0, 0, 'Possessed by what?', 1, 1, 6545, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6545, 0, 0, 'I\'ll be back once I straighten this mess out.', 1, 1, -1, 0, 6545, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id` in (6545,6552);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
('6545', '0', '8', '15222', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'killcredit 15222'),
('6552', '0', '8', '15221', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'killcredit 15221');

UPDATE creature_template SET MovementType=0 WHERE entry=385;
DELETE FROM creature WHERE id IN (27758,27759,29252,27760,29250,27748,27708,29253,27730,29251,385,5774) AND position_z < 20 AND map=571;
DELETE FROM event_scripts WHERE id IN (18035,18036);
INSERT INTO event_scripts (id, command, datalong, data_flags, x, y, z, o, comments) VALUES
(18035,10,27758,8,2515.91, -1822.01, 10.9846,  5.48033,'Alliance Venture Bay capture - summon Westfall Brigade Defender'),
(18035,10,27758,8,2494.39, -1933.88, 12.4038,  0.558505,'Alliance Venture Bay capture - summon Westfall Brigade Defender'),
(18035,10,27758,8,2525.61, -1980.78,  8.35749, 5.34071,'Alliance Venture Bay capture - summon Westfall Brigade Defender'),
(18035,10,27758,8,2539.51, -1972.8,   8.3314,  5.3058,'Alliance Venture Bay capture - summon Westfall Brigade Defender'),
(18035,10,27758,8,2462.25, -1849.97,  5.59361, 6.08343,'Alliance Venture Bay capture - summon Westfall Brigade Defender'),
(18035,10,27758,8,2496.55, -1890.7,   8.47805, 1.8787,'Alliance Venture Bay capture - summon Westfall Brigade Defender'),
(18035,10,27758,8,2552.46, -1831.56, 10.5746,  2.25148,'Alliance Venture Bay capture - summon Westfall Brigade Defender'),
(18035,10,27758,8,2574.73, -1795.42, 10.5438,  0.349066,'Alliance Venture Bay capture - summon Westfall Brigade Defender'),
(18035,10,27758,8,2579.39, -1810.58, 10.4847,  0.296706,'Alliance Venture Bay capture - summon Westfall Brigade Defender'),
(18035,10,27758,8,2481.61, -1875.83, 10.8375,  6.23082,'Alliance Venture Bay capture - summon Westfall Brigade Defender'),
(18035,10,27758,8,2481.1,  -1903.97, 10.5534,  6.24828,'Alliance Venture Bay capture - summon Westfall Brigade Defender'),
(18035,10,27758,8,2543.5,  -1915.32,  3.39682, 0.034907,'Alliance Venture Bay capture - summon Westfall Brigade Defender'),
(18035,10,27758,8,2544.33, -1930.5,   3.86072, 0,'Alliance Venture Bay capture - summon Westfall Brigade Defender'),
(18035,10,27759,8,2484.83, -1888.76,  9.76869, 0.05236,'Alliance Venture Bay capture - summon Commander Howser'),
(18035,10,29252,8,2476.89, -1953.83, 10.9665, 1.44862,'Alliance Venture Bay capture - summon Jason Riggins'),
(18035,10,27760,8,2492.09, -1839.39, 11.752,  5.58505,'Alliance Venture Bay capture - summon "Grizzly" D. Adams'),
(18035,10,29250,8,2551.9,  -1836.04, 10.637,  2.11185,'Alliance Venture Bay capture - summon Tim Street'),
(18035,10,385,8,2552.79, -1840.45, 10.6082, 5.34071,'Alliance Venture Bay capture - summon Horse'),
(18035,10,385,8,2560.17, -1834.67, 10.6368, 5.28835,'Alliance Venture Bay capture - summon Horse'),
(18035,10,385,8,2556.78, -1846.09, 10.2806, 2.21657,'Alliance Venture Bay capture - summon Horse'),
(18035,10,385,8,2563.99, -1840.05, 10.6088, 2.16421,'Alliance Venture Bay capture - summon Horse');
INSERT INTO event_scripts (id, command, datalong, data_flags, x, y, z, o, comments) VALUES
(18036,10,27748,8,2538.89, -1922.25,  3.143,   0.123386,'Horde Venture Bay capture - summon Conquest Hold Defender'),
(18036,10,27748,8,2570.12, -1805.95, 10.0925,  0.453786,'Horde Venture Bay capture - summon Conquest Hold Defender'),
(18036,10,27748,8,2553.65, -1832.93, 10.6207,  2.25148,'Horde Venture Bay capture - summon Conquest Hold Defender'),
(18036,10,27748,8,2409.69, -1825.34,  3.72895, 2.67035,'Horde Venture Bay capture - summon Conquest Hold Defender'),
(18036,10,27748,8,2578.04, -1809.41, 10.3817,  0.314159,'Horde Venture Bay capture - summon Conquest Hold Defender'),
(18036,10,27748,8,2574.45, -1797.03, 10.4851,  0.331613,'Horde Venture Bay capture - summon Conquest Hold Defender'),
(18036,10,27748,8,2477.94, -1875.99, 10.5229,  0.034907,'Horde Venture Bay capture - summon Conquest Hold Defender'),
(18036,10,27748,8,2500.57, -1835.32, 10.6343,  5.58505,'Horde Venture Bay capture - summon Conquest Hold Defender'),
(18036,10,27748,8,2478.88, -1904.98, 10.4264,  0.436332,'Horde Venture Bay capture - summon Conquest Hold Defender'),
(18036,10,27748,8,2489.79, -1847.66, 10.6083,  5.65487,'Horde Venture Bay capture - summon Conquest Hold Defender'),
(18036,10,27748,8,2546.33, -1929.54,  3.42336, 0.034907,'Horde Venture Bay capture - summon Conquest Hold Defender'),
(18036,10,27748,8,2546.15, -1914.97,  3.16499, 0, 'Horde Venture Bay capture - summon Conquest Hold Defender'),
(18036,10,27748,8,2525.53, -1979.8,   8.35698, 5.25344, 'Horde Venture Bay capture - summon Conquest Hold Defender'),
(18036,10,27748,8,2538.85, -1972.3,   8.29618, 5.3058, 'Horde Venture Bay capture - summon Conquest Hold Defender'),
(18036,10,27708,8,2487.56, -1888.8,   9.71184, 0.017453, 'Horde Venture Bay capture - summon General Gorlok'),
(18036,10,29253,8,2476.03, -1954, 10.9665, 1.29154,'Horde Venture Bay capture - summon Koloth'),
(18036,10,27730,8,2489.92, -1821.4, 11.7098, 5.51804,'Horde Venture Bay capture - summon Purkom'),
(18036,10,29251,8,2551.26, -1837.19, 10.6369, 2.1293,'Horde Venture Bay capture - summon Kor'),
(18036,10,5774,8,2560.6, -1835.13, 10.6364, 5.32325,'Horde Venture Bay capture - summon Riding Wolf'),
(18036,10,5774,8,2552.92,-1840.63, 10.604,  5.28835,'Horde Venture Bay capture - summon Riding Wolf'),
(18036,10,5774,8,2556.9, -1845.99, 10.2894, 2.23402,'Horde Venture Bay capture - summon Riding Wolf'),
(18036,10,5774,8,2563.97,-1840.5,  10.602,  2.14675,'Horde Venture Bay capture - summon Riding Wolf');
DELETE FROM creature_template_addon WHERE entry IN (18759,18757);
UPDATE gameobject SET spawntimesecs = 0 WHERE id IN (181899, 182096, 182097, 182098, 182173, 182174, 182175, 182522, 182523, 182528, 182529, 183104, 183411, 183412, 183413, 183414, 182210);
UPDATE gameobject SET spawnTimeSecs = -300 WHERE id IN (182528,182527);
DELETE FROM creature_template_addon WHERE entry=17209;
UPDATE creature_template SET InhabitType=InhabitType|4 WHERE entry IN (18757,18759);
DELETE FROM creature WHERE id = 17209;
DELETE FROM event_scripts WHERE id IN (10701,10700);
INSERT INTO event_scripts (id, command, datalong, data_flags, x, y, z, o, comments) VALUES
(10701,10,17209,8,2987.5,-3049.11,120.126,5.75959,'Alliance Plaguewood Tower progress event - summon William Kielar'),
(10700,10,17209,8,2987.5,-3049.11,120.126,5.75959,'Horde Plaguewood Tower progress event - summon William Kielar');
DELETE FROM creature WHERE id IN (17635,17995);
DELETE FROM event_scripts WHERE id IN (10691,10692);
INSERT INTO event_scripts (id, command, datalong, data_flags, x, y, z, o, comments) VALUES
(10691,10,17635,8,2526.220,-4758.520,101.056,2.17,'Alliance Eastwall Tower capture - summon Lordaeron Commander'),
(10691,10,17647,8,2532.452,-4760.138,102.408,2.17,'Alliance Eastwall Tower capture - summon Lordaeron Soldier'),
(10691,10,17647,8,2535.058,-4757.152,102.219,2.17,'Alliance Eastwall Tower capture - summon Lordaeron Soldier'),
(10691,10,17647,8,2526.297,-4764.442,102.360,2.17,'Alliance Eastwall Tower capture - summon Lordaeron Soldier'),
(10691,10,17647,8,2522.425,-4767.049,102.552,2.17,'Alliance Eastwall Tower capture - summon Lordaeron Soldier'),
(10692,10,17995,8,2526.220,-4758.520,101.056,2.17,'Horde Eastwall Tower capture - summon Lordaeron Veteran'),
(10692,10,17996,8,2532.452,-4760.138,102.408,2.17,'Horde Eastwall Tower capture - summon Lordaeron Fighter'),
(10692,10,17996,8,2535.058,-4757.152,102.219,2.17,'Horde Eastwall Tower capture - summon Lordaeron Fighter'),
(10692,10,17996,8,2526.297,-4764.442,102.360,2.17,'Horde Eastwall Tower capture - summon Lordaeron Fighter'),
(10692,10,17996,8,2522.425,-4767.049,102.552,2.17,'Horde Eastwall Tower capture - summon Lordaeron Fighter');
DELETE FROM creature_linking_template WHERE entry IN (17647,17996);
INSERT INTO creature_linking_template VALUES
(17647, 0, 17635, 515, 0),
(17996, 0, 17995, 515, 0);
DELETE FROM creature WHERE id IN (18817,18822,21485,21487,21488,18256,18816,18821,21474,21484,21483,18192);
DELETE FROM event_scripts WHERE id IN (11504,11503);
INSERT INTO event_scripts (id, command, datalong, data_flags, x, y, z, o, comments) VALUES
(11504,10,18817,8, -1591.18, 8020.39, -22.2042, 4.59022,'Alliance Halaa capture - summon Chief Researcher Kartos'),
(11504,10,18822,8, -1588.12, 8019.44, -22.2042, 4.06662,'Alliance Halaa capture - summon Quartermaster Davian Vaclav'),
(11504,10,21485,8, -1521.93, 7927.37, -20.2299, 3.24631,'Alliance Halaa capture - summon Aldraan'),
(11504,10,21487,8, -1540.33, 7971.95, -20.7186, 3.07178,'Alliance Halaa capture - summon Cendrii'),
(11504,10,21488,8, -1570.01, 7993.8, -22.4505, 5.02655,'Alliance Halaa capture - summon Banro'),
(11504,10,18256,8, -1654.06, 8000.46, -26.59, 3.37, 'Alliance Halaa capture - summon Alliance Halaani Guard'),
(11504,10,18256,8, -1487.18, 7899.1, -19.53, 0.954, 'Alliance Halaa capture - summon Alliance Halaani Guard'),
(11504,10,18256,8, -1480.88, 7908.79, -19.19, 4.485, 'Alliance Halaa capture - summon Alliance Halaani Guard'),
(11504,10,18256,8, -1540.56, 7995.44, -20.45, 0.947, 'Alliance Halaa capture - summon Alliance Halaani Guard'),
(11504,10,18256,8, -1546.95, 8000.85, -20.72, 6.035, 'Alliance Halaa capture - summon Alliance Halaani Guard'),
(11504,10,18256,8, -1595.31, 7860.53, -21.51, 3.747, 'Alliance Halaa capture - summon Alliance Halaani Guard'),
(11504,10,18256,8, -1642.31, 7995.59, -25.8, 3.317, 'Alliance Halaa capture - summon Alliance Halaani Guard'),
(11504,10,18256,8, -1545.46, 7995.35, -20.63, 1.094, 'Alliance Halaa capture - summon Alliance Halaani Guard'),
(11504,10,18256,8, -1487.58, 7907.99, -19.27, 5.567, 'Alliance Halaa capture - summon Alliance Halaani Guard'),
(11504,10,18256,8, -1651.54, 7988.56, -26.52, 2.984, 'Alliance Halaa capture - summon Alliance Halaani Guard'),
(11504,10,18256,8, -1602.46, 7866.43, -22.11, 4.747, 'Alliance Halaa capture - summon Alliance Halaani Guard'),
(11504,10,18256,8, -1591.22, 7875.29, -22.35, 4.345, 'Alliance Halaa capture - summon Alliance Halaani Guard'),
(11504,10,18256,8, -1603.75, 8000.36, -24.18, 4.516, 'Alliance Halaa capture - summon Alliance Halaani Guard'),
(11504,10,18256,8, -1585.73, 7994.68, -23.29, 4.439, 'Alliance Halaa capture - summon Alliance Halaani Guard'),
(11504,10,18256,8, -1595.5, 7991.27, -23.53, 4.738, 'Alliance Halaa capture - summon Alliance Halaani Guard');
INSERT INTO event_scripts (id, command, datalong, data_flags, x, y, z, o, comments) VALUES
(11503,10,18816,8, -1523.92, 7951.76, -17.6942, 3.51172, 'Horde Halaa capture - summon Chief Researcher Amereldine'),
(11503,10,18821,8, -1527.75, 7952.46, -17.6948, 3.99317, 'Horde Halaa capture - summon Quartermaster Jaffrey Noreliqe'),
(11503,10,21474,8, -1520.14, 7927.11, -20.2527, 3.39389, 'Horde Halaa capture - summon Coreiel'),
(11503,10,21484,8, -1524.84, 7930.34, -20.182, 3.6405, 'Horde Halaa capture - summon Embelar'),
(11503,10,21483,8, -1570.01, 7993.8, -22.4505, 5.02655, 'Horde Halaa capture - summon Tasaldan'),
(11503,10,18192,8, -1654.06, 8000.46, -26.59, 3.37, 'Horde Halaa capture - summon Horde Halaani Guard'),
(11503,10,18192,8, -1487.18, 7899.1, -19.53, 0.954, 'Horde Halaa capture - summon Horde Halaani Guard'),
(11503,10,18192,8, -1480.88, 7908.79, -19.19, 4.485, 'Horde Halaa capture - summon Horde Halaani Guard'),
(11503,10,18192,8, -1540.56, 7995.44, -20.45, 0.947, 'Horde Halaa capture - summon Horde Halaani Guard'),
(11503,10,18192,8, -1546.95, 8000.85, -20.72, 6.035, 'Horde Halaa capture - summon Horde Halaani Guard'),
(11503,10,18192,8, -1595.31, 7860.53, -21.51, 3.747, 'Horde Halaa capture - summon Horde Halaani Guard'),
(11503,10,18192,8, -1642.31, 7995.59, -25.8, 3.317, 'Horde Halaa capture - summon Horde Halaani Guard'),
(11503,10,18192,8, -1545.46, 7995.35, -20.63, 1.094, 'Horde Halaa capture - summon Horde Halaani Guard'),
(11503,10,18192,8, -1487.58, 7907.99, -19.27, 5.567, 'Horde Halaa capture - summon Horde Halaani Guard'),
(11503,10,18192,8, -1651.54, 7988.56, -26.52, 2.984, 'Horde Halaa capture - summon Horde Halaani Guard'),
(11503,10,18192,8, -1602.46, 7866.43, -22.11, 4.747, 'Horde Halaa capture - summon Horde Halaani Guard'),
(11503,10,18192,8, -1591.22, 7875.29, -22.35, 4.345, 'Horde Halaa capture - summon Horde Halaani Guard'),
(11503,10,18192,8, -1550.6, 7944.45, -21.63, 3.559, 'Horde Halaa capture - summon Horde Halaani Guard'),
(11503,10,18192,8, -1545.57, 7935.83, -21.13, 3.448, 'Horde Halaa capture - summon Horde Halaani Guard'),
(11503,10,18192,8, -1550.86, 7937.56, -21.7, 3.801, 'Horde Halaa capture - summon Horde Halaani Guard');

UPDATE `quest_template` SET `NextQuestId`='4493', `ExclusiveGroup`='-162', `NextQuestInChain`='4493' WHERE `entry`=162;
UPDATE `quest_template` SET `NextQuestId`='4493', `ExclusiveGroup`='-162', `NextQuestInChain`='4493' WHERE `entry`=4267;
UPDATE `quest_template` SET `NextQuestId`='4494', `ExclusiveGroup`='-32', `NextQuestInChain`='4494' WHERE `entry`=32;
UPDATE `quest_template` SET `NextQuestId`='4494', `ExclusiveGroup`='-32', `NextQuestInChain`='4494' WHERE `entry`=7732;
DELETE FROM `gossip_scripts` WHERE `id` = 21;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('21', '0', '7', '6981', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'quest complete 6981');
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=21 AND `id`=1;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 21;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(21, 0, 0, 'Than I can help?', 1, 1, 22, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 1, 0, 'Can you tell me about this shard?', 1, 1, 50023, 0, 21, 0, 0, NULL, 9, 6981, 0, 0, 0, 0, 0, 0, 0, 522);
UPDATE `locales_gossip_menu_option` SET `id`='0' WHERE `menu_id`=922 AND `id`=3;
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (922,1423);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(922, 0, 1, 'Yes! I want more of that fabulous Noggenfogger Elixir!', 3, 128, 0, 0, 0, 0, 0, NULL, 8, 2662, 0, 0, 0, 0, 0, 0, 0, 535),
(922, 1, 0, 'Seen any strange things in the desert lately?', 1, 1, 1423, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES ('3183', '0', '0', 'What our successes in neutralization of cauldrons?', '1', '1', '3241', '0', '0', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES
(3241, 3997, 0, 0, 0, 0, 0, 0, 0, 0),
(3241, 3998, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `gossip_menu_option` SET `id`='1' WHERE `menu_id`=3441 AND `id`=2;
DELETE FROM `gossip_menu_option` WHERE `menu_id` in (3651);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(3651, 0, 0, 'Betina, I need a new Seal of the Dawn.', 1, 1, -1, 0, 3651, 0, 0, NULL, 8, 5213, 0, 24, 13209, 1, 24, 19812, 1, 1465),
(3651, 1, 0, 'Betina, I need a new Rune of the Dawn.', 1, 1, -1, 0, 11035, 0, 0, NULL, 8, 5213, 0, 24, 19812, 1, 24, 13209, 1, 1466);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES
(9904,13759),(9923,14172),(9923,13786);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`) VALUES
(9904,0,0, 'I would like to build a catapult.',1,1,0,0,0,0),
(9904,1,0, 'I would like to build a demolisher.',1,1,0,0,0,0),
(9904,2,0, 'I would like to build a siege engine.',1,1,0,0,0,0);
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES
(10567,14624),(10567,14625);
UPDATE `quest_template` SET `PrevQuestId`='4289' WHERE `entry`=4301;
UPDATE `quest_template` SET `PrevQuestId`='1119', `NextQuestId`='1122', `ExclusiveGroup`='1120', `NextQuestInChain`='1122' WHERE `entry`=1120;
UPDATE `quest_template` SET `NextQuestId`='1122', `ExclusiveGroup`='1120', `NextQuestInChain`='1122' WHERE `entry`=1121;
UPDATE `quest_template` SET `RequiredRaces`='0' WHERE `entry`=1127;
UPDATE `quest_template` SET `PrevQuestId`='1122' WHERE `entry`=1127;
DELETE FROM `creature_loot_template` WHERE `item` = 5798;
UPDATE `quest_template` SET `PrevQuestId`='1111' WHERE `entry`=1111;
UPDATE `gameobject_template` SET `data1`='19868' WHERE `entry`=19869;
UPDATE `gameobject_template` SET `data1`='19868' WHERE `entry`=19870;
UPDATE `gameobject_template` SET `data1`='19868' WHERE `entry`=19871;
UPDATE `gameobject_template` SET `data1`='19868' WHERE `entry`=19872;
UPDATE `gameobject_template` SET `data1`='19868' WHERE `entry`=19873;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 19869;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 19870;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 19871;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 19872;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 19873;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 68865 AND `item` = 5880;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 21530 AND `item` = 5880;
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14455', '8', 'Rocket Car Rubble');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14456', '6', 'Rocket Car Rubble');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14457', '8', 'Rocket Car Rubble');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14458', '6', 'Rocket Car Rubble');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14459', '6', 'Rocket Car Rubble');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14460', '8', 'Rocket Car Rubble');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('19868', '14455', '0', 'Rocket Car Rubble');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('19869', '14456', '0', 'Rocket Car Rubble');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('19870', '14457', '0', 'Rocket Car Rubble');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('19871', '14458', '0', 'Rocket Car Rubble');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('19872', '14459', '0', 'Rocket Car Rubble');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('19873', '14460', '0', 'Rocket Car Rubble');
UPDATE creature_template SET unit_flags=unit_flags|33600 WHERE entry IN (17862,18096,23175,23177,23179,18092,18093,18094);
UPDATE creature_template SET unit_flags=unit_flags|33024 WHERE entry=18764;
UPDATE creature_template SET MovementType=0 WHERE entry IN (19438,17833,17860,17862,18096,18092,18093,18094);
UPDATE creature_template SET unit_flags=unit_flags|512 WHERE entry=17876;
UPDATE gameobject_template SET faction=1375, flags=flags|32 WHERE entry=184393;
UPDATE creature_template SET unit_flags=unit_flags|33554432 WHERE entry=18798;
UPDATE creature_template SET unit_flags=unit_flags|32832 WHERE entry in (18092,18093,18094);
UPDATE creature_template SET npcflag=npcflag&~1 WHERE entry=18887;
UPDATE creature_template SET unit_flags=unit_flags|33600 WHERE entry IN (20521,20531,23182,23184,23186,20545,20547,20546);
UPDATE creature_template SET unit_flags=unit_flags|33024 WHERE entry=20523;
UPDATE creature_template SET MovementType=0 WHERE entry IN (20530,20529,20521,20531,20545,20547,20546);
UPDATE creature_template SET unit_flags=unit_flags|512, minhealth=37956, maxhealth=37956 WHERE entry=20548;
UPDATE creature_template SET unit_flags=unit_flags|33554432 WHERE entry=20544;
UPDATE creature_template SET unit_flags=unit_flags|32832 WHERE entry in (20545,20547,20546);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(93406, 18764, 560, 3, 1, 0, 0, 2185.32, 116.593, 89.4548, 0.981246, 7200, 0, 0, 5914, 0, 0, 0);
DELETE FROM `creature_addon` WHERE `guid` = 93406;
DELETE FROM `creature_addon` WHERE `guid` = 126112;
Update gameobject set spawnmask=3 where map=560;
delete from creature where id IN (18646,18092,18093,18094);
DELETE FROM `creature_template_addon` WHERE (`entry`=20521);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES (20521, 8469, 0, 0, 0, 0, 0, '');
DELETE FROM `creature_template_addon` WHERE (`entry`=17862);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES (17862, 8469, 0, 0, 0, 0, 0, '');
DELETE FROM `creature_template_addon` WHERE (`entry`=18887);
INSERT INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES (18887, 0, 0, 0, 0, 0, 0, 33071);
UPDATE creature_template SET MovementType=2 WHERE entry=17848;
delete from creature_movement_template where entry=17848;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z) values
(17848, 1, 2125.84, 87.2535, 54.8830),
(17848, 2, 2111.01, 93.8022, 52.6356),
(17848, 3, 2106.70, 114.753, 53.1965),
(17848, 4, 2107.76, 138.746, 52.5109),
(17848, 5, 2114.83, 160.142, 52.4738),
(17848, 6, 2125.24, 178.909, 52.7283),
(17848, 7, 2151.02, 208.901, 53.1551),
(17848, 8, 2177.00, 233.069, 52.4409),
(17848, 9, 2190.71, 227.831, 53.2742),
(17848, 10, 2178.14, 214.219, 53.0779),
(17848, 11, 2154.99, 202.795, 52.6446),
(17848, 12, 2132.00, 191.834, 52.5709),
(17848, 13, 2117.59, 166.708, 52.7686),
(17848, 14, 2093.61, 139.441, 52.7616),
(17848, 15, 2086.29, 104.950, 52.9246),
(17848, 16, 2094.23, 81.2788, 52.6946),
(17848, 17, 2108.70, 85.3075, 53.3294),
(17848, 18, 2125.50, 88.9481, 54.7953),
(17848, 19, 2128.20, 70.9763, 64.422);
UPDATE creature_template SET MovementType=2 WHERE entry=20535;
delete from creature_movement_template where entry=20535;
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z) values
(20535, 1, 2125.84, 87.2535, 54.8830),
(20535, 2, 2111.01, 93.8022, 52.6356),
(20535, 3, 2106.70, 114.753, 53.1965),
(20535, 4, 2107.76, 138.746, 52.5109),
(20535, 5, 2114.83, 160.142, 52.4738),
(20535, 6, 2125.24, 178.909, 52.7283),
(20535, 7, 2151.02, 208.901, 53.1551),
(20535, 8, 2177.00, 233.069, 52.4409),
(20535, 9, 2190.71, 227.831, 53.2742),
(20535, 10, 2178.14, 214.219, 53.0779),
(20535, 11, 2154.99, 202.795, 52.6446),
(20535, 12, 2132.00, 191.834, 52.5709),
(20535, 13, 2117.59, 166.708, 52.7686),
(20535, 14, 2093.61, 139.441, 52.7616),
(20535, 15, 2086.29, 104.950, 52.9246),
(20535, 16, 2094.23, 81.2788, 52.6946),
(20535, 17, 2108.70, 85.3075, 53.3294),
(20535, 18, 2125.50, 88.9481, 54.7953),
(20535, 19, 2128.20, 70.9763, 64.422);
DELETE FROM `creature_movement` WHERE `id` in (93387, 93386, 93385,93377,93374,93373,93372,93357,93356,93355);
DELETE FROM `creature_addon` WHERE `guid` in (93347,93348,93349,93350,93352,93353,93354,93355,93356,93357,93360,93370,93371,93372,93373,93374,93377,93385,93386,93387);
UPDATE `creature_template` SET `gossip_menu_id`='2951' WHERE `entry`=10776;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (2951,3659),(2950,3660),(2949,3661),(2948,3662),(2947,3663),(2946,3664),(2945,3665);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(2951, 0, 0, 'How the hell did you get in there to begin with?', 1, 1, 2950, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2950, 0, 0, 'I''m all ears.', 1, 1, 2949, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2949, 0, 0, 'So let me get this straight. You were swimming, nay, doing backstrokes in molten lava with this... this lava suit of yours? Yes? And out of nowhere, this here beast swallowed you whole?', 1, 1, 2948, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2948, 0, 0, 'I must know something: How did you go to the bathroom with that thing on?', 1, 1, 2947, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2947, 0, 0, 'Oh?', 1, 1, 2946, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9610, 0, 0, 'What do you think they''re up to?', 1, 1, 9611, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9611, 0, 0, 'What do you want me to do?', 1, 1, 9612, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9612, 0, 0, 'Excellent, Chromie.', 1, 1, 9613, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2946, 0, 0, 'I''ll consider that the next time I run into one of these things.', 1, 1, 2945, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2945, 0, 0, 'To Malyfous, I assume.', 1, 1, -1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1748', '8', '13149', '0');
UPDATE `gossip_menu` SET `condition_id`='1748' WHERE `entry`=9610 AND `text_id`=13353;
UPDATE `gossip_menu_option` SET `action_menu_id`='7840' WHERE `menu_id`=7831 AND `id`=0;
UPDATE `gossip_menu_option` SET `action_script_id`='7769' WHERE `menu_id`=7769 AND `id`=0;
DELETE FROM `gossip_scripts` WHERE `id` = 7769;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('7769', '0', '17', '25853', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'create Pack of Incendiary Bombs');
DELETE FROM `creature` WHERE `guid` = 6399;
DELETE FROM `creature` WHERE `id` = 8477;
UPDATE `creature_template` SET `lootid`='0', `mingold`='0', `maxgold`='0' WHERE `entry`=8477;
DELETE FROM `creature_loot_template` WHERE `entry` = 8477;
UPDATE `gameobject_loot_template` SET `condition_id`='146' WHERE `item`=11614;
UPDATE `gameobject_loot_template` SET `condition_id`='146' WHERE `item`=11615;
UPDATE `gameobject_loot_template` SET `condition_id`='146' WHERE `item`=12827;
UPDATE `gameobject_loot_template` SET `condition_id`='146' WHERE `item`=12830;

# ACID 3.0.9e => 3.1.0
UPDATE db_version SET `creature_ai_version` = 'ACID 3.1.0 \'Another Wild Adventure\' - Full Release for CMaNGOS (3.3.5a Client)';
#
DELETE FROM creature_ai_scripts WHERE creature_id in (36791,37886,37934,15471,15473,15712);
REPLACE INTO `creature_ai_scripts` (`id`,`creature_id`,`event_type`,`event_inverse_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action1_type`,`action1_param1`,`action1_param2`,`action1_param3`,`action2_type`,`action2_param1`,`action2_param2`,`action2_param3`,`action3_type`,`action3_param1`,`action3_param2`,`action3_param3`,`comment`) VALUES
('853001','8530','6','0','100','0','0','0','0','0','12','11064','0','60000','0','0','0','0','0','0','0','0','Cannibal Ghoul - Summon Darrowshire Spirit on Death'),
('853101','8531','6','0','100','0','0','0','0','0','12','11064','0','60000','0','0','0','0','0','0','0','0','Gibbering Ghoul - Summon Darrowshire Spirit on Death'),
('853201','8532','6','0','100','0','0','0','0','0','12','11064','0','60000','0','0','0','0','0','0','0','0','Diseased Flayer - Summon Darrowshire Spirit on Death'),
('1106401','11064','11','0','100','0','0','0','0','0','11','17321','0','0','0','0','0','0','0','0','0','0','Darrowshire Spirit - Cast Spirit Spawn-in on Spawn'),
('2281601','22816','6','0','100','0','0','0','0','0','11','39477','1','39','0','0','0','0','0','0','0','0','Black Cat - Cast Back Luck on Death'),
('2291101','22911','6','0','100','0','0','0','0','0','11','39862','0','7','0','0','0','0','0','0','0','0','Vim\'gol the Vile - Cast Summon Vim\'gol\'s Vile Grimoire Chest on Death (Quest: 10998)'),
('1867701','18677','0','0','100','1','6000','11000','8000','14000','11','38875','1','0','0','0','0','0','0','0','0','0','Mekthorg the Wild - Cast Pike Vault'),
('1867702','18677','0','0','100','1','12000','15000','9000','13000','11','37704','0','0','0','0','0','0','0','0','0','0','Mekthorg the Wild - Cast Whirlwind'),
('1867703','18677','2','0','100','0','20','0','0','0','11','8599','0','1','0','0','0','0','0','0','0','0','Mekthorg the Wild - Cast Enrage at 20% HP'),
('1867901','18679','9','0','100','1','0','5','5000','9000','11','9080','1','0','0','0','0','0','0','0','0','0','Vorakem Doomspeaker - Cast Hamstring'),
('1867902','18679','2','0','100','0','20','0','0','0','11','8599','0','1','0','0','0','0','0','0','0','0','Vorakem Doomspeaker - Cast Enrage at 20% HP'),
('1714401','17144','9','0','100','1','0','5','7000','11000','11','3604','1','0','0','0','0','0','0','0','0','0','Goretooth - Cast Tendon Rip'),
('1714402','17144','0','0','100','1','11000','15000','15000','21000','11','39215','1','1','0','0','0','0','0','0','0','0','Goretooth - Cast Gushing Wound'),
('1714403','17144','2','0','100','1','50','0','9000','12000','11','38887','1','0','0','0','0','0','0','0','0','0','Goretooth - Cast Blood Leech'),
('1868401','18684','9','0','100','1','0','5','9000','13000','11','38313','1','0','0','0','0','0','0','0','0','0','Bro\'Gaz the Clanless - Cast Pummel'),
('1868402','18684','0','0','100','1','6000','11000','16000','21000','11','12468','4','0','0','0','0','0','0','0','0','0','Bro\'Gaz the Clanless - Cast Flamestrike'),
('1868403','18684','2','0','100','1','50','0','8000','12000','11','15586','0','1','0','0','0','0','0','0','0','0','Bro\'Gaz the Clanless - Cast Heal at 50% HP'),
('1869401','18694','0','0','100','1','5000','9000','12000','16000','11','38932','1','0','0','0','0','0','0','0','0','0','Collidus the Warp-Watcher - Cast Blink'),
('1869402','18694','0','0','100','1','12000','18000','21000','26000','11','36414','4','1','0','0','0','0','0','0','0','0','Collidus the Warp-Watcher - Cast Focused Bursts'),
('1869403','18694','0','0','100','1','14000','18000','14000','21000','11','34322','0','0','0','0','0','0','0','0','0','0','Collidus the Warp-Watcher - Cast Psychic Scream'),
('1869501','18695','0','0','100','1','3000','6000','10000','15000','11','38926','0','0','0','0','0','0','0','0','0','0','Ambassador Jerrikar - Cast Dark Strike'),
('1869502','18695','0','0','100','1','8000','16000','18000','24000','11','38916','0','1','0','0','0','0','0','0','0','0','Ambassador Jerrikar - Cast Diplomatic Immunity'),
('1869503','18695','0','0','100','1','9000','12000','14000','19000','11','38913','4','0','0','0','0','0','0','0','0','0','Ambassador Jerrikar - Cast Silence'),
('1868601','18686','1','0','100','0','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Doomsayer Jurim - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('1868602','18686','4','0','100','0','0','0','0','0','11','12471','1','0','23','1','0','0','0','0','0','0','Doomsayer Jurim - Cast Shadow Bolt and Set Phase 1 on Aggro'),
('1868603','18686','9','5','100','1','0','40','3400','4800','11','12471','1','0','0','0','0','0','0','0','0','0','Doomsayer Jurim - Cast Shadow Bolt (Phase 1)'),
('1868604','18686','3','5','100','0','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Doomsayer Jurim - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('1868605','18686','9','5','100','0','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Doomsayer Jurim - Start Combat Movement at 35 Yards (Phase 1)'),
('1868606','18686','9','5','100','0','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Doomsayer Jurim - Prevent Combat Movement at 15 Yards (Phase 1)'),
('1868607','18686','9','5','100','0','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Doomsayer Jurim - Start Combat Movement Below 5 Yards (Phase 1)'),
('1868608','18686','3','3','100','1','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Doomsayer Jurim - Set Phase 1 when Mana is above 15% (Phase 2)'),
('1868609','18686','0','0','100','1','3000','8000','5000','11000','11','12493','1','32','0','0','0','0','0','0','0','0','Doomsayer Jurim - Cast Curse of Weakness'),
('1868610','18686','0','0','100','1','9000','14000','11000','16000','11','38401','1','0','0','0','0','0','0','0','0','0','Doomsayer Jurim - Cast Incinerate'),
('1868611','18686','0','0','100','1','8000','14000','15000','21000','11','39210','5','1','0','0','0','0','0','0','0','0','Doomsayer Jurim - Cast Fear'),
('1868612','18686','0','0','100','1','14000','19000','19000','25000','11','39212','4','0','0','0','0','0','0','0','0','0','Doomsayer Jurim - Cast Corruption'),
('1868613','18686','7','0','100','0','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Doomsayer Jurim - Set Phase to 0 on Evade'),
('1868901','18689','0','0','100','1','3000','5000','11000','15000','11','39214','1','0','0','0','0','0','0','0','0','0','Crippler - Cast Pierce Armor'),
('1868902','18689','0','0','100','1','8000','12000','13000','18000','11','38621','1','0','0','0','0','0','0','0','0','0','Crippler - Cast Debilitating Strike'),
('1868903','18689','2','0','100','0','50','0','0','0','11','38882','0','1','0','0','0','0','0','0','0','0','Crippler - Cast Bone Armor at 50% HP'),
('2209502','22095','6','0','100','0','0','0','0','0','11','39130','0','7','0','0','0','0','0','0','0','0','Infested Root-Walker - Summon Wood Mites on Death'),
('2230702','22307','6','0','100','0','0','0','0','0','11','39130','0','7','0','0','0','0','0','0','0','0','Rotting Forest-Rager - Summon Wood Mites on Death'),
('1868001','18680','9','0','100','0','10','40','0','0','11','32039','1','1','0','0','0','0','0','0','0','0','Marticar - Cast Magnetic Pull on Aggro'),
('1868002','18680','0','0','100','1','12000','18000','12000','16000','11','32039','4','0','0','0','0','0','0','0','0','0','Marticar - Cast Magnetic Pull'),
('1868003','18680','0','0','100','1','3000','7000','7000','12000','11','35493','1','0','0','0','0','0','0','0','0','0','Marticar - Cast Forked Lightning Tether'),
('1868101','18681','1','0','100','0','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Coilfang Emissary - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('1868102','18681','4','0','100','0','0','0','0','0','11','20297','1','0','23','1','0','0','0','0','0','0','Coilfang Emissary - Cast Frostbolt and Set Phase 1 on Aggro'),
('1868103','18681','9','5','100','1','0','40','3400','4800','11','20297','1','0','0','0','0','0','0','0','0','0','Coilfang Emissary - Cast Frostbolt (Phase 1)'),
('1868104','18681','3','5','100','0','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Coilfang Emissary - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('1868105','18681','9','5','100','0','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Coilfang Emissary - Start Combat Movement at 35 Yards (Phase 1)'),
('1868106','18681','9','5','100','0','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Coilfang Emissary - Prevent Combat Movement at 15 Yards (Phase 1)'),
('1868107','18681','9','5','100','0','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Coilfang Emissary - Start Combat Movement Below 5 Yards (Phase 1)'),
('1868108','18681','3','3','100','1','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Coilfang Emissary - Set Phase 1 when Mana is above 15% (Phase 2)'),
('1868109','18681','0','0','100','1','14000','18000','12000','16000','11','11831','0','0','0','0','0','0','0','0','0','0','Coilfang Emissary - Cast Frost Nova'),
('1868110','18681','0','0','100','1','8000','12000','15000','20000','11','33860','0','1','0','0','0','0','0','0','0','0','Coilfang Emissary - Cast Arcane Explosion'),
('1868111','18681','0','0','100','1','6000','10000','14000','21000','11','39207','4','1','0','0','0','0','0','0','0','0','Coilfang Emissary - Cast Water Spout'),
('1868112','18681','7','0','100','0','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Coilfang Emissary - Set Phase to 0 on Evade'),
('1868201','18682','0','0','100','1','8000','12000','12000','16000','11','35238','0','0','0','0','0','0','0','0','0','0','Bog Lurker - Cast War Stomp'),
('1868202','18682','2','0','100','1','50','0','22000','26000','11','34163','0','1','0','0','0','0','0','0','0','0','Bog Lurker - Cast Fungal Regrowth'),
('2561501','25615','6','0','100','0','0','0','0','0','11','50366','0','7','0','0','0','0','0','0','0','0','Plagued Magnataur - Cast Plague Cloud on Death'),
('2905001','29050','0','5','100','0','0','0','0','0','20','0','0','0','21','0','0','0','1','-955','0','0','Har\'koa - Prevent Melee and Combat Movement and Say on Aggro'),
('2905002','29050','0','5','100','0','6000','6000','0','0','1','-956','0','0','0','0','0','0','0','0','0','0','Har\'koa - Combat Say 2'),
('2905003','29050','0','5','100','0','15000','15000','0','0','1','-957','0','0','11','53004','0','1','0','0','0','0','Har\'koa - Combat Say 3'),
('2905004','29050','0','5','100','0','18000','18000','0','0','20','1','0','0','21','1','0','0','0','0','0','0','Har\'koa - Enable Melee and Combat Movement'),
('2905005','29050','0','5','100','0','20000','20000','0','0','24','0','0','0','0','0','0','0','22','1','0','0','Har\'koa - Evade and Set Phase 1'),
('1043201','10432','0','0','100','3','12000','14000','12000','14000','11','16046','0','0','0','0','0','0','0','0','0','0','Vectus - Cast Blast Wave'),
('1043202','10432','0','0','100','3','2000','4000','20000','25000','11','18399','4','0','0','0','0','0','0','0','0','0','Vectus - Cast Flamestrike'),
('1451605','14516','6','0','100','2','0','0','0','0','11','23261','0','7','0','0','0','0','0','0','0','0','Death Knight Darkreaver - Cast Summon Darkreaver\'s Fallen Charger on Death'),
('2085701','20857','11','0','100','2','0','0','0','0','11','36637','0','1','0','0','0','0','0','0','0','0','Arcatraz Defender (Normal)  - Cast Immolate on Spawn'),
('2085702','20857','11','0','100','4','0','0','0','0','11','38805','0','1','0','0','0','0','0','0','0','0','Arcatraz Defender (Heroic)  - Cast Immolate on Spawn'),
('2085901','20859','11','0','100','6','0','0','0','0','21','0','0','0','20','0','0','0','0','0','0','0','Arcatraz Warder - Prevent Combat Movement and Prevent Melee on Spawn'),
('2085902','20859','9','0','100','3','8','30','2400','3600','11','15620','1','0','40','2','0','0','0','0','0','0','Arcatraz Warder (Normal) - Cast Shoot and Set Ranged Weapon Model'),
('2085903','20859','9','0','100','5','8','30','2400','3600','11','22907','1','0','40','2','0','0','0','0','0','0','Arcatraz Warder (Heroic) - Cast Shoot and Set Ranged Weapon Model'),
('2085904','20859','0','0','100','3','15900','22200','15700','22900','11','36609','1','1','40','2','0','0','0','0','0','0','Arcatraz Warder (Normal) - Cast Arcane Shot and Set Ranged Weapon Model'),
('2085905','20859','0','0','100','5','15900','22200','15700','22900','11','38807','1','1','40','2','0','0','0','0','0','0','Arcatraz Warder (Heroic) - Cast Arcane Shot and Set Ranged Weapon Model'),
('2085906','20859','0','0','100','3','17100','21100','18100','33700','11','36608','1','1','40','2','0','0','0','0','0','0','Arcatraz Warder (Normal) - Cast Charged Arcane Shot and Set Ranged Weapon Model'),
('2085907','20859','0','0','100','5','17100','21100','18100','33700','11','38808','1','1','40','2','0','0','0','0','0','0','Arcatraz Warder (Heroic) - Cast Charged Arcane Shot and Set Ranged Weapon Model'),
('2085908','20859','9','0','100','6','30','80','0','0','21','1','1','0','20','1','0','0','0','0','0','0','Arcatraz Warder - Start Combat Movement and Start Melee at 30 Yards'),
('2085909','20859','9','0','100','6','0','8','0','0','21','1','0','0','40','1','0','0','20','1','0','0','Arcatraz Warder - Start Combat Movement and Set Melee Weapon Model and Start Melee Below 8 Yards'),
('2085910','20859','9','0','100','6','11','25','0','0','21','0','1','0','20','0','0','0','0','0','0','0','Arcatraz Warder - Prevent Combat Movement and Prevent Melee at 25 Yards'),
('2085911','20859','9','0','100','7','0','5','20000','30000','11','35963','1','0','0','0','0','0','0','0','0','0','Arcatraz Warder - Cast Improved Wing Clip'),
('2085912','20859','7','0','100','6','0','0','0','0','21','1','0','0','40','1','0','0','0','0','0','0','Arcatraz Warder - Enable Combat Movement and Set Melee Weapon Model on Evade'),
('2086401','20864','0','0','100','7','15200','21700','10900','22900','11','36622','4','33','0','0','0','0','0','0','0','0','Protean Nightmare  - Cast Incubation'),
('2086402','20864','0','0','100','3','16900','17600','19300','26500','11','36617','1','0','0','0','0','0','0','0','0','0','Protean Nightmare (Normal)  - Cast Gaping Maw'),
('2086403','20864','0','0','100','5','16900','17600','19300','26500','11','38810','1','0','0','0','0','0','0','0','0','0','Protean Nightmare (Heroic)  - Cast Gaping Maw'),
('2086404','20864','0','0','100','3','22900','26300','10800','22900','11','36619','4','1','0','0','0','0','0','0','0','0','Protean Nightmare (Normal)  - Cast Infectious Poison'),
('2086405','20864','0','0','100','5','22900','26300','10800','22900','11','38811','4','1','0','0','0','0','0','0','0','0','Protean Nightmare (Heroic)  - Cast Infectious Poison'),
('2088302','20883','0','0','100','7','9000','15000','18000','28000','11','36866','4','1','0','0','0','0','0','0','0','0','Spiteful Temptress - Cast Domination'),
('727602','7276','6','0','100','2','0','0','0','0','11','10747','1','7','0','0','0','0','0','0','0','0','Zul\'Farrak Dead Hero - Cast Announce Zul\'Farrak Zombie on Death'),
('728601','7286','6','0','100','2','0','0','0','0','11','10747','1','7','0','0','0','0','0','0','0','0','Zul\'Farrak Zombie - Cast Announce Zul\'Farrak Zombie on Death'),
('3679101','36791','1','0','100','30','0','0','0','0','21','0','0','0','22','0','0','0','0','0','0','0','Blazing Skeleton - Prevent Combat Movement and Set Phase to 0 on Spawn'),
('3679102','36791','4','0','100','30','0','0','0','0','11','70754','1','0','23','1','0','0','0','0','0','0','Blazing Skeleton - Cast Fireball and Set Phase 1 on Aggro'),
('3679103','36791','9','5','100','31','0','60','46000','60000','11','70754','1','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Cast Fireball (Phase 1)'),
('3679104','36791','3','5','100','30','7','0','0','0','21','1','0','0','23','1','0','0','0','0','0','0','Blazing Skeleton - Start Combat Movement and Set Phase 2 when Mana is at 7% (Phase 1)'),
('3679105','36791','9','5','100','30','35','80','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Start Combat Movement at 35 Yards (Phase 1)'),
('3679106','36791','9','5','100','30','5','15','0','0','21','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Prevent Combat Movement at 15 Yards (Phase 1)'),
('3679107','36791','9','5','100','30','0','5','0','0','21','1','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Start Combat Movement Below 5 Yards'),
('3679108','36791','3','3','100','31','100','15','100','100','23','-1','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Set Phase 1 when Mana is above 15% (Phase 2)'),
('3679109','36791','0','0','100','11','8000','15000','18000','25000','11','69325','0','1','0','0','0','0','0','0','0','0','Blazing Skeleton (10-Man) - Cast Lay Waste'),
('3679110','36791','0','0','100','21','8000','15000','18000','25000','11','71730','0','1','0','0','0','0','0','0','0','0','Blazing Skeleton (25-Man) - Cast Lay Waste'),
('3679111','36791','7','0','100','30','0','0','0','0','22','0','0','0','0','0','0','0','0','0','0','0','Blazing Skeleton - Set Phase to 0 on Evade'),
('3786801','37868','1','0','100','30','5000','5000','0','0','11','70602','0','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Corruption on OOC Timer'),
('3786802','37868','0','0','100','31','1000','3000','14000','21000','11','70759','4','0','0','0','0','0','0','0','0','0','Risen Archmage - Cast Frostbolt Volley'),
('3786803','37868','0','0','100','11','20000','30000','30000','38000','11','71179','0','1','0','0','0','0','0','0','0','0','Risen Archmage (10-Man) - Cast Mana Void'),
('3786804','37868','0','0','100','21','20000','30000','30000','38000','11','71741','0','1','0','0','0','0','0','0','0','0','Risen Archmage (25-Man) - Cast Mana Void'),
('3786805','37868','0','0','100','11','3000','5000','11000','17000','11','70704','1','0','0','0','0','0','0','0','0','0','Risen Archmage (10-Man) - Cast Column of Frost'),
('3786806','37868','0','0','100','21','3000','5000','11000','17000','11','71747','1','0','0','0','0','0','0','0','0','0','Risen Archmage (25-Man) - Cast Column of Frost'),
('3788601','37886','0','0','100','31','3000','5000','5000','10000','11','70633','1','0','0','0','0','0','0','0','0','0','Gluttonous Abomination (Normal and Heroic) - Cast Gut Spray'),
('3788602','37886','6','0','100','30','0','0','0','0','11','70675','0','7','0','0','0','0','0','0','0','0','Gluttonous Abomination (Normal and Heroic) - Cast Rot Worm Spawner on Death'),
('3790701','37907','11','0','100','30','0','0','0','0','11','72962','0','0','38','0','0','0','0','0','0','0','Rot Worm - Cast Rot Worm and Set In Combat With Zone on Spawn'),
('3791801','37918','11','0','100','30','0','0','0','0','11','70715','0','0','0','0','0','0','0','0','0','0','Column of Frost - Cast Column of Frost on Spawn'),
('3791802','37918','1','0','100','30','3000','3000','0','0','11','70702','0','0','41','5000','0','0','0','0','0','0','Column of Frost - Cast Column of Frost and Forced Despawn OOC'),
('3793401','37934','4','0','100','30','0','0','0','0','11','70749','0','0','0','0','0','0','0','0','0','0','Blistering Zombies (Normal and Heroic) - Cast Corrosion on Aggro'),
('3793402','37934','6','0','100','30','0','0','0','0','11','70744','0','7','0','0','0','0','0','0','0','0','Blistering Zombies (Normal and Heroic) - Cast Acid Burst on Death'),
('1571201','15712','1','0','100','3','1000','1000','1000','1000','11','26093','0','0','0','0','0','0','0','0','0','0','Dirt Mound - Cast Quake'),
('1571202','15712','1','0','100','2','30000','30000','0','0','11','26060','0','0','41','1000','0','0','0','0','0','0','Dirt Mound - Cast Summon Ouro Scarabs and Forced Despawn'),
('3287401','32874','0','0','100','7','4000','6000','10000','20000','11','64151','1','0','0','0','0','0','0','0','0','0','Iron Ring Guard - Cast Whirling Trip'),
('3287402','32874','0','0','100','3','3000','5000','10000','20000','11','62331','1','0','0','0','0','0','0','0','0','0','Iron Ring Guard (Normal) - Cast Impale'),
('3287403','32874','0','0','100','5','3000','5000','10000','20000','11','62418','1','0','0','0','0','0','0','0','0','0','Iron Ring Guard (Heroic) - Cast Impale'),
('3287501','32875','0','0','100','7','2000','4000','10000','15000','11','42724','1','0','0','0','0','0','0','0','0','0','Iron Honor Guard - Cleave'),
('3287502','32875','0','0','100','7','3000','5000','10000','18000','11','48639','1','0','0','0','0','0','0','0','0','0','Iron Honor Guard - Hamstring'),
('3287503','32875','0','0','100','3','4000','6000','12000','20000','11','62332','1','0','0','0','0','0','0','0','0','0','Iron Honor Guard (Normal) - Shield Smash'),
('3287504','32875','0','0','100','5','4000','6000','12000','20000','11','62420','1','0','0','0','0','0','0','0','0','0','Iron Honor Guard (Heroic) - Shield Smash'),
('3287601','32876','9','0','100','7','8','25','10000','20000','11','32323','1','0','0','0','0','0','0','0','0','0','Dark Rune Champion - Cast Charge'),
('3287602','32876','0','0','100','7','3000','5000','10000','20000','11','35054','1','0','0','0','0','0','0','0','0','0','Dark Rune Champion - Cast Mortal Strike'),
('3287603','32876','0','0','100','7','3000','5000','10000','20000','11','33500','1','0','0','0','0','0','0','0','0','0','Dark Rune Champion - Cast Whirlwind'),
('3287701','32877','11','0','100','7','0','0','0','0','11','62320','0','2','0','0','0','0','0','0','0','0','Dark Rune Warbringer - Cast Aura of Celerity'),
('3287702','32877','0','0','100','7','3000','5000','10000','20000','11','62322','1','0','0','0','0','0','0','0','0','0','Dark Rune Warbringer - Cast Runic Strike'),
('3287801','32878','14','0','100','3','5000','40','4000','8000','11','62328','6','0','0','0','0','0','0','0','0','0','Dark Rune Evoker (Normal) - Cast Runic Mending'),
('3287802','32878','14','0','100','5','16000','40','4000','8000','11','62446','6','0','0','0','0','0','0','0','0','0','Dark Rune Evoker (Heroic) - Cast Runic Mending'),
('3287803','32878','0','0','100','3','3000','5000','3000','5000','11','62327','4','0','0','0','0','0','0','0','0','0','Dark Rune Evoker (Normal) - Cast Runic Lightning'),
('3287804','32878','0','0','100','5','3000','5000','3000','5000','11','62445','4','0','0','0','0','0','0','0','0','0','Dark Rune Evoker (Heroic) - Cast Runic Lightning'),
('3287805','32878','0','0','100','3','2000','4000','70000','80000','11','62321','0','0','0','0','0','0','0','0','0','0','Dark Rune Evoker (Normal) - Runic Shield'),
('3287806','32878','0','0','100','5','2000','4000','70000','80000','11','62529','0','0','0','0','0','0','0','0','0','0','Dark Rune Evoker (Heroic) - Runic Shield'),
('3288601','32886','14','0','100','7','20000','100','10000','20000','11','61964','6','0','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Cast Circle of Healing'),
('3288602','32886','14','0','100','7','20000','100','10000','20000','11','61967','6','0','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Cast Renew'),
('3288603','32886','14','0','100','3','20000','40','10000','20000','11','62334','6','0','0','0','0','0','0','0','0','0','Dark Rune Acolyte (Normal) - Cast Greater Heal'),
('3288604','32886','14','0','100','5','20000','40','10000','20000','11','61965','6','0','0','0','0','0','0','0','0','0','Dark Rune Acolyte (Heroic) - Cast Greater Heal'),
('3288605','32886','0','0','100','7','4000','6000','10000','20000','11','62335','4','0','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Cast Holy Smite'),
('3290401','32904','0','0','100','7','3000','5000','10000','20000','11','62326','4','0','0','0','0','0','0','0','0','0','Dark Rune Commoner - Cast Low Blow'),
('3290402','32904','13','0','100','7','10000','20000','0','0','11','38313','1','0','0','0','0','0','0','0','0','0','Dark Rune Commoner - Cast Pummel'),
('3295701','32957','14','0','100','7','20000','100','10000','20000','11','61964','6','0','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Cast Circle of Healing'),
('3295702','32957','14','0','100','7','20000','100','10000','20000','11','61967','6','0','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Cast Renew'),
('3295703','32957','14','0','100','3','20000','40','10000','20000','11','62334','6','0','0','0','0','0','0','0','0','0','Dark Rune Acolyte (Normal) - Cast Greater Heal'),
('3295704','32957','14','0','100','5','20000','40','10000','20000','11','61965','6','0','0','0','0','0','0','0','0','0','Dark Rune Acolyte (Heroic) - Cast Greater Heal'),
('3295705','32957','0','0','100','7','4000','6000','10000','20000','11','62335','4','0','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Cast Holy Smite'),
('3311001','33110','14','0','100','7','20000','100','10000','20000','11','61964','6','0','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Cast Circle of Healing'),
('3311002','33110','14','0','100','7','20000','100','10000','20000','11','61967','6','0','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Cast Renew'),
('3311003','33110','14','0','100','3','20000','40','10000','20000','11','62334','6','0','0','0','0','0','0','0','0','0','Dark Rune Acolyte (Normal) - Cast Greater Heal'),
('3311004','33110','14','0','100','5','20000','40','10000','20000','11','61965','6','0','0','0','0','0','0','0','0','0','Dark Rune Acolyte (Heroic) - Cast Greater Heal'),
('3311005','33110','0','0','100','7','4000','6000','10000','20000','11','62335','4','0','0','0','0','0','0','0','0','0','Dark Rune Acolyte - Cast Holy Smite'),
('3323601','33236','0','0','100','7','3000','6000','7000','12000','11','57780','4','0','0','0','0','0','0','0','0','0','Steelforge Defender - Cast Lighning Bolt'),
('3323602','33236','0','0','100','7','5000','7000','10000','15000','11','50370','1','0','0','0','0','0','0','0','0','0','Steelforge Defender - Cast Sunder Armor'),
('3323603','33236','0','0','100','7','3000','4000','10000','15000','11','62845','1','0','0','0','0','0','0','0','0','0','Steelforge Defender - Cast Hamstring'),
('3323701','33237','0','0','100','7','8000','12000','15000','18000','11','62625','0','0','0','0','0','0','0','0','0','0', 'Ulduar Colossus - Cast Ground Slam'),
('3334401','33344','0','0','100','7','5000','10000','8000','15000','11','10966','1','0','0','0','0','0','0','0','0','0','XM-024 Pummeller - Cast Uppercut'),
('3334402','33344','0','0','100','7','3000','5000','5000','9000','11','5568','1','0','0','0','0','0','0','0','0','0','XM-024 Pummeller - Cast Trample'),
('3334403','33344','0','0','100','7','3000','5000','5000','9000','11','8374','1','0','0','0','0','0','0','0','0','0','XM-024 Pummeller - Cast Arcing Smash'),
('3334601','33346','9','0','100','6','5','10','0','0','11','62834','0','2','0','0','0','0','0','0','0','0','XE-321 Boombot - Cast Boom on Range Check'),
('3334602','33346','6','0','100','6','0','0','0','0','11','62834','0','2','0','0','0','0','0','0','0','0','XE-321 Boombot - Cast Boom on Death'),
('3335401','33354','0','0','100','3','7000','13000','20000','30000','11','63169','1','0','0','0','0','0','0','0','0','0','Corrupted Servitor (Normal) - Cast Petrify Joints'),
('3335402','33354','0','0','100','5','7000','13000','20000','30000','11','63549','1','0','0','0','0','0','0','0','0','0','Corrupted Servitor (Heroic) - Cast Petrify Joints'),
('3335403','33354','0','0','100','7','10000','16000','23000','35000','11','63149','4','0','0','0','0','0','0','0','0','0','Corrupted Servitor - Cast Violent Earth'),
('3335501','33355','0','0','100','3','7000','12000','6000','9000','11','63111','4','0','0','0','0','0','0','0','0','0','Misguided Nymph (Normal) - Cast Frost Spear'),
('3335502','33355','0','0','100','5','7000','12000','6000','9000','11','63562','4','0','0','0','0','0','0','0','0','0','Misguided Nymph (Heroic) - Cast Frost Spear'),
('3335503','33355','2','0','100','2','10','0','0','0','11','63136','0','0','0','0','0','0','0','0','0','0','Misguided Nymph (Normal) - Cast Winters Embrace at 10% Hp'),
('3335504','33355','2','0','100','4','10','0','0','0','11','63564','0','0','0','0','0','0','0','0','0','0','Misguided Nymph (Heroic) - Cast Winters Embrace at 10% Hp'),
('3335505','33355','14','0','100','3','50000','45','15000','25000','11','63082','6','0','0','0','0','0','0','0','0','0','Misguided Nymph (Normal) - Cast Bind Life on Friendlies'),
('3335506','33355','14','0','100','5','50000','45','15000','25000','11','63559','6','0','0','0','0','0','0','0','0','0','Misguided Nymph (Heroic) - Cast Bind Life on Friendlies'),
('3338801','33388','0','0','100','7','4000','7000','6000','9000','11','64757','1','0','0','0','0','0','0','0','0','0','Dark Rune Guardian - Cast Stormstrike'),
('3343001','33430','0','0','100','3','5000','9000','8000','12000','11','63047','1','0','0','0','0','0','0','0','0','0','Guardian Lasher (Normal) - Cast Guardians Lash'),
('3343002','33430','0','0','100','5','5000','9000','8000','12000','11','63550','1','0','0','0','0','0','0','0','0','0','Guardian Lasher (Heroic) - Cast Guardians Lash'),
('3343101','33431','0','0','100','7','5000','10000','15000','20000','11','33431','0','0','0','0','0','0','0','0','0','0','Forest Swarmer - Cast Pollinate'),
('3345301','33453','0','0','100','3','5000','10000','5000','10000','11','64758','4','0','0','0','0','0','0','0','0','0','Darkrune Watcher (Normal) - Cast Chain Lightning'),
('3345302','33453','0','0','100','5','5000','10000','5000','10000','11','64759','4','0','0','0','0','0','0','0','0','0','Darkrune Watcher (Heroic) - Cast Chain Lightning'),
('3345303','33453','0','0','100','3','3000','6000','5000','7000','11','63809','4','0','0','0','0','0','0','0','0','0','Darkrune Watcher (Normal) - Cast Lightning Bolt'),
('3345304','33453','0','0','100','5','3000','6000','5000','7000','11','64696','4','0','0','0','0','0','0','0','0','0','Darkrune Watcher (Heroic) - Cast Lightning Bolt'),
('3352501','33525','0','0','100','7','7000','15000','25000','35000','11','63272','0','0','0','0','0','0','0','0','0','0','Mangrove Ent - Cast Hurricane'),
('3352502','33525','14','0','100','3','50000','40','15000','25000','11','63242','6','0','0','0','0','0','0','0','0','0','Mangrove Ent (Normal) - Cast Nourish'),
('3352503','33525','14','0','100','5','50000','40','15000','25000','11','63556','6','0','0','0','0','0','0','0','0','0','Mangrove Ent (Heroic) - Cast Nourish'),
('3352504','33525','14','0','100','3','50000','40','30000','40000','11','63241','0','0','0','0','0','0','0','0','0','0','Mangrove Ent (Normal) - Cast Tranquility'),
('3352505','33525','14','0','100','5','50000','40','30000','40000','11','63554','0','0','0','0','0','0','0','0','0','0','Mangrove Ent (Heroic) - Cast Tranquility'),
('3352601','33526','0','0','100','3','5000','8000','7000','13000','11','63240','0','0','0','0','0','0','0','0','0','0','Ironroot Lasher (Normal) - Cast Ironroot Thorns'),
('3352602','33526','0','0','100','5','5000','8000','7000','13000','11','63553','0','0','0','0','0','0','0','0','0','0','Ironroot Lasher (Heroic) - Cast Ironroot Thorns'),
('3352701','33527','0','0','100','3','5000','8000','7000','12000','11','63247','0','0','0','0','0','0','0','0','0','0','Natures Blade (Normal) - Cast Living Tsunami'),
('3352702','33527','0','0','100','5','5000','8000','7000','12000','11','63568','0','0','0','0','0','0','0','0','0','0','Natures Blade (Heroic) - Cast Living Tsunami'),
('3352801','33528','0','0','100','3','6000','8000','13000','19000','11','63226','0','0','0','0','0','0','0','0','0','0','Guardian of Life (Normal) - Cast Poison Breath'),
('3352802','33528','0','0','100','5','6000','8000','13000','19000','11','63551','0','0','0','0','0','0','0','0','0','0','Guardian of Life (Heroic) - Cast Poison Breath'),
('3357201','33572','0','0','100','7','5000','7000','10000','15000','11','50370','1','0','0','0','0','0','0','0','0','0','Steelforge Defender - Cast Sunder Armor'),
('3357202','33572','0','0','100','7','3000','4000','10000','15000','11','62845','1','0','0','0','0','0','0','0','0','0','Steelforge Defender - Cast Hamstring'),
('3371501','33715','11','0','100','7','0','0','0','0','11','63528','0','0','0','0','0','0','0','0','0','0','Charged Sphere - Cast Supercharged on Spawn'),
('3376801','33768','0','0','100','3','7000','9000','10000','15000','11','63818','0','0','0','0','0','0','0','0','0','0','Rubble (Normal) - Cast Rumble'),
('3376802','33768','0','0','100','5','7000','9000','10000','15000','11','63978','0','0','0','0','0','0','0','0','0','0','Rubble (Heroic) - Cast Stone Nova'),
('3377201','33772','0','0','100','7','6000','11000','13000','18000','11','64429','4','0','0','0','0','0','0','0','0','0','Faceless Horror - Cast Death Grip'),
('3377202','33772','0','0','100','7','6000','8000','8000','12000','11','63722','4','0','0','0','0','0','0','0','0','0','Faceless Horror - Cast Shadow Crash'),
('3377203','33772','0','0','100','7','15000','18000','25000','36000','11','63703','0','0','0','0','0','0','0','0','0','0','Faceless Horror - Cast Void Wave'),
('3377204','33772','2','0','100','6','10','0','0','0','11','63710','0','0','0','0','0','0','0','0','0','0','Faceless Horror - Cast Void Barrier at 10% HP'),
('3381801','33818','0','0','100','7','10000','15000','25000','35000','11','64663','0','0','0','0','0','0','0','0','0','0','Twilight Adherent - Cast Arcane Burst'),
('3381802','33818','0','0','100','7','8000','13000','10000','18000','11','64662','4','0','0','0','0','0','0','0','0','0','Twilight Adherent - Cast Blink'),
('3381803','33818','0','0','100','7','12000','17000','15000','20000','11','13704','0','0','0','0','0','0','0','0','0','0','Twilight Adherent - Cast Psyhic Scream'),
('3381804','33818','14','0','100','7','100000','40','10000','15000','11','37978','6','0','0','0','0','0','0','0','0','0','Twilight Adherent - Cast Renew on Friendlies'),
('3381805','33818','14','0','100','7','200000','40','20000','25000','11','63760','6','0','0','0','0','0','0','0','0','0','Twilight Adherent - Cast Greater Heal on Friendlies'),
('3381901','33819','0','0','100','7','10000','15000','25000','35000','11','64663','0','0','0','0','0','0','0','0','0','0','Twilight Frost Mage - Cast Arcane Burst'),
('3381902','33819','0','0','100','7','8000','13000','10000','18000','11','64662','4','0','0','0','0','0','0','0','0','0','Twilight Frost Mage - Cast Blink'),
('3381903','33819','0','0','100','7','7000','12000','7000','12000','11','63758','0','0','0','0','0','0','0','0','0','0','Twilight Frost Mage - Cast Frostbolt Volley'),
('3381904','33819','0','0','100','7','5000','9000','9000','14000','11','63912','0','0','0','0','0','0','0','0','0','0','Twilight Frost Mage - Cast Frostnova'),
('3381905','33819','0','0','100','7','3000','6000','4000','7000','11','63913','4','0','0','0','0','0','0','0','0','0','Twilight Frost Mage - Cast Frostbolt'),
('3382001','33820','0','0','100','7','10000','15000','25000','35000','11','64663','0','0','0','0','0','0','0','0','0','0','Twilight Pyromancer - Cast Arcane Burst'),
('3382002','33820','0','0','100','7','8000','13000','10000','18000','11','64662','4','0','0','0','0','0','0','0','0','0','Twilight Pyromancer - Cast Blink'),
('3382003','33820','0','0','100','7','3000','6000','5000','7000','11','63789','4','0','0','0','0','0','0','0','0','0','Twilight Pyromancer - Cast Fireball'),
('3382004','33820','0','0','100','7','6000','9000','12000','18000','11','63775','4','0','0','0','0','0','0','0','0','0','Twilight Pyromancer - Cast Flamestrike'),
('3382005','33820','21','0','100','6','0','0','0','0','11','63774','0','0','0','0','0','0','0','0','0','0','Twilight Pyromancer - Summon Fire Elemental on Reached Home'),
('3382201','33822','0','0','100','7','4000','8000','15000','20000','11','63757','0','0','0','0','0','0','0','0','0','0','Twilight Guardian - Cast Thunderclap'),
('3382202','33822','0','0','100','7','4000','8000','6000','9000','11','62317','1','0','0','0','0','0','0','0','0','0','Twilight Guardian - Cast Devastate'),
('3382203','33822','0','0','100','7','6000','10000','9000','12000','11','52719','4','0','0','0','0','0','0','0','0','0','Twilight Guardian - Cast Concussion Blow'),
('3382301','33823','0','0','100','7','3000','5000','4000','8000','11','35054','1','0','0','0','0','0','0','0','0','0','Twilight Slayer - Cast Mortal Strike'),
('3382302','33823','0','0','100','7','5000','10000','10000','18000','11','63784','0','0','0','0','0','0','0','0','0','0','Twilight Slayer - Cast Bladestorm'),
('3382401','33824','0','0','100','7','5000','8000','6000','11000','11','63754','1','0','0','0','0','0','0','0','0','0','Twilight Shadowblade - Cast Backstab'),
('3382402','33824','0','0','100','7','6000','13000','10000','17000','11','63753','0','0','0','0','0','0','0','0','0','0','Twilight Shadowblade - Cast Fan of Knifes'),
('3383601','33836','9','0','100','7','0','5','0','0','11','63767','0','0','0','0','0','0','0','0','0','0','Bomb Bot - Cast Bomb Bot on Range Check'),
('3383602','33836','6','0','100','6','0','0','0','0','11','63767','0','2','0','0','0','0','0','0','0','0','Bomb Bot - Cast Bomb Bot on Death'),
('3383801','33838','4','0','100','6','0','0','0','0','11','63778','0','0','0','0','0','0','0','0','0','0','Enslaved Fire Elemental - Cast Fire Shield on Aggro'),
('3383802','33838','0','0','100','7','5000','10000','6000','12000','11','38064','0','0','0','0','0','0','0','0','0','0','Enslaved Fire Elemental - Cast Blast Wave'),
('3384601','33846','0','0','100','7','5000','8000','30000','35000','11','64062','0','0','0','0','0','0','0','0','0','0','Darkrune Sentinel - Cast Battle Shout'),
('3384602','33846','0','0','100','7','7000','10000','10000','15000','11','63808','0','0','0','0','0','0','0','0','0','0','Darkrune Sentinel - Cast Whirlwind'),
('3405701','34057','0','0','100','7','5000','8000','9000','12000','11','64668','4','0','0','0','0','0','0','0','0','0','Assault Bot - Cast Magnetic Field'),
('3406901','34069','0','0','100','7','5000','8000','7000','11000','11','64698','4','0','0','0','0','0','0','0','0','0','Molten Colossus - Cast Pyroblast'),
('3406902','34069','0','0','100','7','10000','15000','15000','20000','11','64697','0','0','0','0','0','0','0','0','0','0','Molten Colossus - Cast Earthquake'),
('3408501','34085','0','0','100','7','5000','8000','10000','15000','11','64719','4','0','0','0','0','0','0','0','0','0','Forge Construct - Cast Charge'),
('3408502','34085','0','0','100','3','4000','6000','8000','10000','11','64720','0','0','0','0','0','0','0','0','0','0','Forge Construct (Normal) - Cast Flame Emision'),
('3408503','34085','0','0','100','5','4000','6000','8000','10000','11','64721','0','0','0','0','0','0','0','0','0','0','Forge Construct (Heroic) - Cast Flame Emision'),
('3408601','34086','0','0','100','7','3000','6000','5000','8000','11','64773','4','0','0','0','0','0','0','0','0','0','Magma Rager - Cast Fire Blast'),
('3408602','34086','0','0','100','7','10000','15000','30000','35000','11','64746','0','0','0','0','0','0','0','0','0','0','Magma Rager - Cast Superheated Winds'),
('3410501','34105','0','0','100','7','8000','12000','15000','18000','11','62625','0','0','0','0','0','0','0','0','0','0','Ulduar Colossus - Cast Ground Slam'),
('3413301','34133','0','0','100','3','5000','7000','7000','10000','11','64639','0','0','0','0','0','0','0','0','0','0','Hodir Champion (Normal) - Cast Stomp'),
('3413302','34133','0','0','100','5','5000','7000','7000','10000','11','64652','0','0','0','0','0','0','0','0','0','0','Hodir Champion (Heroic) - Cast Stomp'),
('3413401','34134','0','0','100','3','8000','12000','10000','15000','11','64642','4','0','0','0','0','0','0','0','0','0','Winter Revenant (Normal) - Cast Blizzard'),
('3413402','34134','0','0','100','5','8000','12000','10000','15000','11','64653','4','0','0','0','0','0','0','0','0','0','Winter Revenant (Heroic) - Cast Blizzard'),
('3413403','34134','0','0','100','7','3000','6000','4000','8000','11','64643','0','0','0','0','0','0','0','0','0','0','Winter Revenant - Cast Whirling Strike'),
('3413501','34135','0','0','100','3','5000','10000','13000','18000','11','64645','0','0','0','0','0','0','0','0','0','0','Winter Rumbler (Normal) - Cast Cone of Cold'),
('3413502','34135','0','0','100','5','5000','10000','13000','18000','11','64655','0','0','0','0','0','0','0','0','0','0','Winter Rumbler (Heroic) - Cast Cone of Cold'),
('3413503','34135','0','0','100','3','5000','7000','6000','9000','11','64647','4','0','0','0','0','0','0','0','0','0','Winter Rumbler (Normal) - Cast Snow Blindness'),
('3413504','34135','0','0','100','5','5000','7000','6000','9000','11','64654','4','0','0','0','0','0','0','0','0','0','Winter Rumbler (Heroic) - Cast Snow Blindness'),
('3413701','34137','0','0','100','7','3000','5000','7000','11000','11','64638','1','0','0','0','0','0','0','0','0','0','Winter Jormungar - Cast Acid Bite'),
('3414701','34147','0','0','100','7','5000','12000','9000','18000','11','64619','4','0','0','0','0','0','0','0','0','0', 'Emergency Fire Bot - Cast Water Spray'),
('3416401','34164','0','0','100','7','5000','8000','10000','13000','11','64692','4','0','0','0','0','0','0','0','0','0','Mechagnome Battletank - Cast Flame Canon'),
('3416402','34164','0','0','100','7','10000','15000','15000','17000','11','64953','4','0','0','0','0','0','0','0','0','0','Mechagnome Battletank - Cast Jump Attack'),
('3418301','34183','0','0','100','7','6000','9000','7000','12000','11','64717','0','0','0','0','0','0','0','0','0','0','Arachnopod Destroyer - Cast Flame Spray'),
('3418302','34183','0','0','100','7','3000','7000','5000','9000','11','64776','4','0','0','0','0','0','0','0','0','0','Arachnopod Destroyer - Cast Machine Gun'),
('3419001','34190','0','0','100','7','15000','20000','30000','35000','11','64877','0','0','0','0','0','0','0','0','0','0','Hardened Iron Golem - Cast Harden Fists'),
('3419002','34190','0','0','100','3','10000','15000','20000','25000','11','64874','4','0','0','0','0','0','0','0','0','0','Hardened Iron Golem (Normal) - Cast Rune Punch'),
('3419003','34190','0','0','100','5','10000','15000','20000','25000','11','64967','4','0','0','0','0','0','0','0','0','0','Hardened Iron Golem (Heroic) - Cast Rune Punch'),
('3419201','34192','9','0','100','7','0','5','0','0','11','63767','0','0','0','0','0','0','0','0','0','0','Boomer XP-500 - Cast Bomb Bot on Range Check'),
('3419202','34192','6','0','100','6','0','0','0','0','11','63767','0','2','0','0','0','0','0','0','0','0','Boomer XP-500 - Cast Bomb Bot on Death'),
('3419301','34193','0','0','100','7','5000','9000','10000','15000','11','64740','4','0','0','0','0','0','0','0','0','0','Clockwork Sapper - Cast Energy Sap'),
('3419401','34194','11','0','100','7','0','0','0','0','11','64724','0','0','0','0','0','0','0','0','0','0','Superheated Winds - Cast Superheated Winds on Spawn'),
('3419601','34196','0','0','100','3','10000','13000','20000','25000','11','64847','0','0','0','0','0','0','0','0','0','0','Rune Etched Sentry (10-Man Normal) - Cast Runed Flame Jets'),
('3419602','34196','0','0','100','5','10000','13000','20000','25000','11','64988','0','0','0','0','0','0','0','0','0','0','Rune Etched Sentry (25-Man Normal) - Cast Runed Flame Jets'),
('3419603','34196','0','0','100','3','5000','8000','8000','11000','11','64870','4','0','0','0','0','0','0','0','0','0','Rune Etched Sentry (10-Man Normal) - Cast Lava Burst'),
('3419604','34196','0','0','100','5','5000','8000','8000','11000','11','64991','4','0','0','0','0','0','0','0','0','0','Rune Etched Sentry (10-Man Normal) - Cast Lava Burst'),
('3419605','34196','0','0','100','7','4000','7000','10000','13000','11','64852','4','0','0','0','0','0','0','0','0','0','Rune Etched Sentry - Cast Flaming Rune'),
('3419701','34197','0','0','100','3','5000','8000','12000','16000','11','64820','4','0','0','0','0','0','0','0','0','0','Chamber Overseer (Normal) - Cast Devastating Leap'),
('3419702','34197','0','0','100','5','5000','8000','12000','16000','11','64943','4','0','0','0','0','0','0','0','0','0','Chamber Overseer (Heroic) - Cast Devastating Leap'),
('3419703','34197','0','0','100','3','3000','5000','7000','9000','11','64825','0','0','0','0','0','0','0','0','0','0','Chamber Overseer (Normal) - Cast Stagering Roar'),
('3419704','34197','0','0','100','5','3000','5000','7000','9000','11','64944','0','0','0','0','0','0','0','0','0','0','Chamber Overseer (Heroic) - Cast Stagering Roar'),
('3419705','34197','0','0','100','7','10000','15000','20000','25000','11','64783','0','0','0','0','0','0','0','0','0','0','Chamber Overseer - Cast Displacement Device'),
('3419801','34198','0','0','100','3','5000','8000','8000','12000','11','64918','4','0','0','0','0','0','0','0','0','0','Iron Mender (Normal) - Cast Electro Shock'),
('3419802','34198','0','0','100','5','5000','8000','8000','12000','11','64971','4','0','0','0','0','0','0','0','0','0','Iron Mender (Heroic) - Cast Electro Shock'),
('3419803','34198','0','0','100','3','7000','12000','15000','20000','11','64903','4','0','0','0','0','0','0','0','0','0','Iron Mender (Normal) - Cast Fuse Lightning'),
('3419804','34198','0','0','100','5','7000','12000','15000','20000','11','64970','4','0','0','0','0','0','0','0','0','0','Iron Mender (Heroic) - Cast Fuse Lightning'),
('3419805','34198','0','0','100','3','10000','15000','20000','30000','11','64897','0','0','0','0','0','0','0','0','0','0','Iron Mender (Normal) - Cast Fuse Metal'),
('3419806','34198','0','0','100','5','10000','15000','20000','30000','11','64968','0','0','0','0','0','0','0','0','0','0','Iron Mender (Heroic) - Cast Fuse Metal'),
('3419901','34199','0','0','100','3','8000','12000','60000','65000','11','64889','0','0','0','0','0','0','0','0','0','0','Lightning Charged Iron Dwarf (Normal) - Cast Lightning Charged'),
('3419902','34199','0','0','100','5','8000','12000','30000','35000','11','64975','0','0','0','0','0','0','0','0','0','0','Lightning Charged Iron Dwarf (Heroic) - Cast Lightning Charged'),
('3420301','34203','11','0','100','2','0','0','0','0','11','64793','0','0','20','0','0','0','21','0','0','0','Displacement Device (Normal) - Cast Displacement and Set Auto Attack and Prevent Combat Movement on Spawn'),
('3420302','34203','11','0','100','4','0','0','0','0','11','64941','0','0','20','0','0','0','21','0','0','0','Displacement Device (Heroic) - Cast Displacement and Set Auto Attack and Prevent Combat Movement on Spawn'),
('3423401','34234','0','0','100','3','10000','13000','20000','25000','11','64847','0','0','0','0','0','0','0','0','0','0','Runeforged Sentry (Normal) - Cast Runed Flame Jets'),
('3423402','34234','0','0','100','5','10000','13000','20000','25000','11','64988','0','0','0','0','0','0','0','0','0','0','Runeforged Sentry (Heroic) - Cast Runed Flame Jets'),
('3423403','34234','0','0','100','3','5000','8000','8000','11000','11','64870','4','0','0','0','0','0','0','0','0','0','Runeforged Sentry (Normal) - Cast Lava Burst'),
('3423404','34234','0','0','100','5','5000','8000','8000','11000','11','64991','4','0','0','0','0','0','0','0','0','0','Runeforged Sentry (Heroic) - Cast Lava Burst'),
('3423405','34234','0','0','100','7','4000','7000','10000','13000','11','64852','4','0','0','0','0','0','0','0','0','0','Runeforged Sentry - Cast Flaming Rune'),
('3426701','34267','0','0','100','7','5000','8000','8000','12000','11','65071','1','0','0','0','0','0','0','0','0','0','Parts Recovery Technician - Cast Mechano Kick'),
('3426702','34267','0','0','100','7','3000','6000','15000','25000','11','65070','0','0','0','0','0','0','0','0','0','0','Parts Recovery Technician - Cast Defensive Matrix'),
('3426901','34269','0','0','100','7','8000','12000','17000','25000','11','65099','4','0','0','0','0','0','0','0','0','0','XR-949 Salvagebot - Cast Deploy Salvage Saws'),
('3427101','34271','0','0','100','3','7000','10000','10000','15000','11','65073','4','0','0','0','0','0','0','0','0','0','XD-175 Compactobot (Normal) - Cast Trash Compactor'),
('3427102','34271','0','0','100','5','7000','10000','10000','15000','11','65106','4','0','0','0','0','0','0','0','0','0','XD-175 Compactobot (Heroic) - Cast Trash Compactor'),
('3427301','34273','0','0','100','3','5000','8000','10000','15000','11','65080','4','0','0','0','0','0','0','0','0','0','XB-488 Disposalbot (Normal) - Cast Cut Scrap Metal'),
('3427302','34273','0','0','100','5','5000','8000','10000','15000','11','65104','4','0','0','0','0','0','0','0','0','0','XB-488 Disposalbot (Heroic) - Cast Cut Scrap Metal'),
('3427303','34273','2','0','100','6','10','0','0','0','11','65084','0','0','0','0','0','0','0','0','0','0','XB-488 Disposalbot - Cast Self Destruct at 10% HP'),
('3428801','34288','11','0','100','6','0','0','0','0','11','65087','0','0','20','0','0','0','21','0','0','0','Salvagebot Sawblade - Cast Salvage Saws Visual and Set Auto Attack and Combat Movement to False on Spawn'),
('3045301','30453','0','0','100','3','7000','10000','7000','10000','11','57728','0','0','0','0','0','0','0','0','0','0','Onyx Sanctum Guardian (Normal) - Cast Shockwave'),
('3045302','30453','0','0','100','5','7000','10000','7000','10000','11','58947','0','0','0','0','0','0','0','0','0','0','Onyx Sanctum Guardian (Heroic) - Cast Shockwave'),
('3045303','30453','0','0','100','7','10000','13000','10000','13000','11',' 58948','0','0','0','0','0','0','0','0','0','0','Onyx Sanctum Guardian - Cast Curse of Mending'),
('3045304','30453','2','0','100','6','30','0','0','0','11','53801','0','0','0','0','0','0','0','0','0','0','Onyx Sanctum Guardian - Cast Frenzy at 30% HP'),            
('3068001','30680','4','0','100','2','0','0','0','0','11','57740','0','0','0','0','0','0','0','0','0','0','Onyx Brood General (Normal) - Cast Devotion Aura on Aggro'),
('3068002','30680','4','0','100','4','0','0','0','0','11','58944','0','0','0','0','0','0','0','0','0','0','Onyx Brood General (Heroic) - Cast Devotion Aura on Aggro'),
('3068003','30680','0','0','100','7','5000','8000','6000','8000','11','13737','1','0','0','0','0','0','0','0','0','0','Onyx Brood General - Cast Mortal Strike'),
('3068004','30680','0','0','100','3','15000','20000','30000','40000','11','57733','0','0','0','0','0','0','0','0','0','0','Onyx Brood General (Normal) - Cast Draconic Rage'),
('3068005','30680','0','0','100','5','15000','20000','30000','40000','11','58942','0','0','0','0','0','0','0','0','0','0','Onyx Brood General (Heroic) - Cast Draconic Rage'),
('3068201','30682','0','0','100','7','7000','10000','7000','10000','11','57759','1','0','0','0','0','0','0','0','0','0','Onyx Flight Captain - Cast Hammer Drop'),
('3068202','30682','0','0','100','7','10000','13000','10000','13000','11','58953','1','0','0','0','0','0','0','0','0','0','Onyx Flight Captain - Cast Pummel'),
('3981401','39814','0','0','100','31','10000','15000','10000','15000','11','74392','0','0','0','0','0','0','0','0','0','0','Onyx Flamecaller - Cast Blast Nova'),
('3981402','39814','0','0','100','31','2000','3000','2000','3000','11','74394','1','0','0','0','0','0','0','0','0','0','Onyx Flamecaller - Cast Lava Gout'),
('4041701','40417','0','0','100','31','3000','5000','4000','7000','11','75419','4','0','0','0','0','0','0','0','0','0','Charscale Invoker - Cast Scorch'),
('4041702','40417','0','0','100','31','10000','15000','10000','15000','11','75413','0','0','0','0','0','0','0','0','0','0','Charscale Invoker - Cast Flame Wave'),
('4041901','40419','0','0','100','31','3000','5000','3000','5000','11','15284','1','0','0','0','0','0','0','0','0','0','Charscale Assaulter - Cast cleave'),
('4041902','40419','0','0','100','31','10000','15000','10000','15000','11','75417','0','0','0','0','0','0','0','0','0','0','Charscale Assaulter - Cast Shockwave'),
('4042101','40421','0','0','100','31','3000','5000','3000','5000','11','15621','1','0','0','0','0','0','0','0','0','0', 'Charscale Elite - Cast Skull Crack'),
('4042301','40423','0','0','100','31','5000','8000','5000','8000','11','13737','1','0','0','0','0','0','0','0','0','0','Charscale Commander - Cast Mortal Strike'),
('4042302','40423','0','0','100','31','5000','8000','50000','60000','11','75414','0','0','0','0','0','0','0','0','0','0','Charscale Commander - Cast Rallying Shout');
#
UPDATE `creature_ai_texts` SET `comment`='Common Defias Text' WHERE `entry`=-2;
UPDATE `creature_ai_texts` SET `comment`='Common Defias Text' WHERE `entry`=-3;
UPDATE `creature_ai_texts` SET `comment`='Common Defias Text' WHERE `entry`=-4;
UPDATE `creature_ai_texts` SET `content_default`='Amazing Amulets! Incredible curios! The newfangled jewelcrafters be havin'' nothin'' on the tried and true mystical methods of ol'' Griftah! Improve yerself through these magical talismans for a bargain price!' WHERE `entry`=-254;
UPDATE `creature_ai_texts` SET `content_default`='By the Naaru, may it be so.' WHERE `entry`=-285;
UPDATE `creature_ai_texts` SET `content_default`='He''s so well disciplined!' WHERE `entry`=-309;
UPDATE `creature_ai_texts` SET `content_default`='%s whispers softley in reverent tones under her breath.' WHERE `entry`=-339;
UPDATE `creature_ai_texts` SET `content_default`='Spare some change for a poor blind man?...What do you mean I''m not blind?...I''M NOT BLIND! I CAN SEE! ITS A MIRACLE!' WHERE `entry`=-412;
UPDATE `creature_ai_texts` SET `content_default`='Sir, I think we were close with the Lethargy Root in that last poison recipe.' WHERE `entry`=-419;
UPDATE `creature_ai_texts` SET `content_default`='I wonder what Nesingwary will give me for your hide!' WHERE `entry`=-522;
UPDATE `creature_ai_texts` SET `content_default`='We are Mechagnome...resistance is futile.' WHERE `entry`=-533;
UPDATE `creature_ai_texts` SET `content_default`='As masters of blood, we are masters of life and death itself. Against us, even hope falls drained and lifeless.' WHERE `entry`=-735;
UPDATE `creature_ai_texts` SET `content_default`='%s stares in silence at the graver marker before him.' WHERE `entry`=-923;
UPDATE `creature_ai_texts` SET `content_default`='%s breaks down into huge, wracking sobs.' WHERE `entry`=-922;
UPDATE `creature_ai_texts` SET `content_default`='%s bows his head and sighs, clearly exhausted.' WHERE `entry`=-921;
UPDATE `creature_ai_texts` SET `content_default`='%s weeps softly.' WHERE `entry`=-920;
UPDATE `creature_ai_texts` SET `content_default`='The %s seems overjoyed.' WHERE `entry`=-910;
UPDATE `creature_ai_texts` SET `content_default`='The %s doen''t look like it minds the crystal''s effect.' WHERE `entry`=-909;
UPDATE `creature_ai_texts` SET `content_default`='The %s nods appreciatively.' WHERE `entry`=-908;
UPDATE `creature_ai_texts` SET `content_default`='The %s looks confused.' WHERE `entry`=-907;
UPDATE `creature_ai_texts` SET `content_default`='The %s didn''t like what just happened.' WHERE `entry`=-906;
UPDATE `creature_ai_texts` SET `content_default`='You don''t worry me, boy. Just the opposite - I look forward to killing you and your friends. Nothing will stand between me and Zim''Torga now!' WHERE `entry`=-949;
UPDATE `creature_ai_texts` SET `content_default`='What? HAR''KOA?' WHERE `entry`=-952;
UPDATE `creature_ai_texts` SET `content_default`='By the forehead signet of Velen, I am saved!' WHERE `entry`=-989;
UPDATE `creature_ai_texts` SET `content_default`='Low tech yet quite effective!' WHERE `entry`=-1215;
#
UPDATE creature_template SET AIName='' WHERE entry IN (15471,15473);
UPDATE creature_template SET AIName='EventAI' WHERE entry IN (11064,18677,18679,17144,18684,18694,18695,18689,18686,18681,18682,18680,10432,20857,37907,37918,32874,32875,32876,32877,32878,32886,32904,32957,33110,33236,33237,33344,33346,33354,33355,33388,33430,33431,33453,33525,33526,33527,33528,33572,33715,33768,33772,33818,33819,33820,33822,33823,33824,33836,33838,33846,34057,34069,34085,34086,34105,34133,34134,34135,34137,34147,34164,34183,34190,34192,34193,34194,34196,34197,34198,34199,34203,34234,34267,34269,34271,34273,34288,30453,30680,30682,39814,40417,40419,40421,40423);
UPDATE `creature_template` SET `AIName`='' WHERE `entry`=34105;
DELETE FROM `creature_ai_scripts` WHERE `id` = 3410501;

# NeatElves
UPDATE creature_template SET MovementType=0 WHERE entry in (17535,17546,17547,17543,17603,17534);
DELETE FROM creature_linking_template WHERE entry IN (18412,17546,17547,17543);
INSERT INTO creature_linking_template VALUES
(18412,532,18168,4112,0),
(17546,532,17535,4096,0),
(17547,532,17535,4096,0),
(17543,532,17535,4096,0);
delete from spell_script_target where entry=30951;
insert into spell_script_target values
(30951,1,17533);
UPDATE creature_template SET faction_A=16, faction_H=16 WHERE entry IN (17533,17534);

# Fix
DELETE FROM `gameobject` WHERE `id`=184080;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(1197, 184080, 566, 1, 1, 2050.49, 1372.24, 1194.56, 1.71042, 0, 0, 0.754709, 0.65606, 180, 100, 1);
DELETE FROM `gameobject` WHERE `id`=184081;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(1198, 184081, 566, 1, 1, 2024.6, 1742.82, 1195.16, 2.44346, 0, 0, 0.939692, 0.342021, 180, 100, 1);
DELETE FROM `gameobject` WHERE `id`=184082;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(1135, 184082, 566, 1, 1, 2282.12, 1760.01, 1189.71, 1.91986, 0, 0, 0.819151, 0.573577, 180, 100, 1);
DELETE FROM `gameobject` WHERE `id`=184083;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(1193, 184083, 566, 1, 1, 2301.01, 1386.93, 1197.18, 1.5708, 0, 0, 0.707108, 0.707106, 180, 100, 1);
INSERT IGNORE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES
(14625, 'Need TXT YTDB', '', 0, 100, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);


# Gossip_FIX
UPDATE `gossip_menu_option` SET `action_menu_id` = '-1' WHERE `action_menu_id` =0 AND `action_script_id` >0;

# NPC_ADDON_FIX
INSERT IGNORE INTO `creature_template_addon`
SELECT
`creature_template`.`difficulty_entry_1`,
`creature_template_addon`.`mount`,
`creature_template_addon`.`bytes1`,
`creature_template_addon`.`b2_0_sheath`,
`creature_template_addon`.`b2_1_pvp_state`,
`creature_template_addon`.`emote`,
`creature_template_addon`.`moveflags`,
`creature_template_addon`.`auras`
FROM
`creature_template`, `creature_template_addon`
WHERE
`creature_template_addon`.`entry`=`creature_template`.`entry`
AND `creature_template`.`difficulty_entry_1`>0;
INSERT IGNORE INTO `creature_template_addon`
SELECT
`creature_template`.`difficulty_entry_2`,
`creature_template_addon`.`mount`,
`creature_template_addon`.`bytes1`,
`creature_template_addon`.`b2_0_sheath`,
`creature_template_addon`.`b2_1_pvp_state`,
`creature_template_addon`.`emote`,
`creature_template_addon`.`moveflags`,
`creature_template_addon`.`auras`
FROM
`creature_template`, `creature_template_addon`
WHERE
`creature_template_addon`.`entry`=`creature_template`.`entry`
AND `creature_template`.`difficulty_entry_2`>0;
INSERT IGNORE INTO `creature_template_addon`
SELECT
`creature_template`.`difficulty_entry_3`,
`creature_template_addon`.`mount`,
`creature_template_addon`.`bytes1`,
`creature_template_addon`.`b2_0_sheath`,
`creature_template_addon`.`b2_1_pvp_state`,
`creature_template_addon`.`emote`,
`creature_template_addon`.`moveflags`,
`creature_template_addon`.`auras`
FROM
`creature_template`, `creature_template_addon`
WHERE
`creature_template_addon`.`entry`=`creature_template`.`entry`
AND `creature_template`.`difficulty_entry_3`>0;

# NPC_FIX
UPDATE
`creature_template`, `creature_template` AS `copy`
SET
`copy`.`RegenHealth`=`creature_template`.`RegenHealth`,
`copy`.`unit_class`=`creature_template`.`unit_class`,
`copy`.`unit_flags`=`creature_template`.`unit_flags`,
`copy`.`npcflag`=`creature_template`.`npcflag`,
`copy`.`dynamicflags`=`creature_template`.`dynamicflags`,
`copy`.`equipment_id`=`creature_template`.`equipment_id`,
`copy`.`faction_A`=`creature_template`.`faction_A`,
`copy`.`faction_H`=`creature_template`.`faction_H`,
`copy`.`speed_run`=`creature_template`.`speed_run`,
`copy`.`speed_walk`=`creature_template`.`speed_walk`,
`copy`.`scale`=`creature_template`.`scale`,
`copy`.`dmgschool`=`creature_template`.`dmgschool`,
`copy`.`mingold`=`creature_template`.`mingold`,
`copy`.`maxgold`=`creature_template`.`maxgold`,
`copy`.`Vehicle_Id`=`creature_template`.`Vehicle_Id`,
`copy`.`mechanic_immune_mask`=`creature_template`.`mechanic_immune_mask`
WHERE
`copy`.`entry`=`creature_template`.`difficulty_entry_1`;
UPDATE
`creature_template`, `creature_template` AS `copy`
SET
`copy`.`RegenHealth`=`creature_template`.`RegenHealth`,
`copy`.`unit_class`=`creature_template`.`unit_class`,
`copy`.`unit_flags`=`creature_template`.`unit_flags`,
`copy`.`npcflag`=`creature_template`.`npcflag`,
`copy`.`dynamicflags`=`creature_template`.`dynamicflags`,
`copy`.`equipment_id`=`creature_template`.`equipment_id`,
`copy`.`faction_A`=`creature_template`.`faction_A`,
`copy`.`faction_H`=`creature_template`.`faction_H`,
`copy`.`speed_run`=`creature_template`.`speed_run`,
`copy`.`speed_walk`=`creature_template`.`speed_walk`,
`copy`.`scale`=`creature_template`.`scale`,
`copy`.`dmgschool`=`creature_template`.`dmgschool`,
`copy`.`mingold`=`creature_template`.`mingold`,
`copy`.`maxgold`=`creature_template`.`maxgold`,
`copy`.`Vehicle_Id`=`creature_template`.`Vehicle_Id`,
`copy`.`mechanic_immune_mask`=`creature_template`.`mechanic_immune_mask`
WHERE
`copy`.`entry`=`creature_template`.`difficulty_entry_2`;
UPDATE
`creature_template`, `creature_template` AS `copy`
SET
`copy`.`RegenHealth`=`creature_template`.`RegenHealth`,
`copy`.`unit_class`=`creature_template`.`unit_class`,
`copy`.`unit_flags`=`creature_template`.`unit_flags`,
`copy`.`npcflag`=`creature_template`.`npcflag`,
`copy`.`dynamicflags`=`creature_template`.`dynamicflags`,
`copy`.`equipment_id`=`creature_template`.`equipment_id`,
`copy`.`faction_A`=`creature_template`.`faction_A`,
`copy`.`faction_H`=`creature_template`.`faction_H`,
`copy`.`speed_run`=`creature_template`.`speed_run`,
`copy`.`speed_walk`=`creature_template`.`speed_walk`,
`copy`.`scale`=`creature_template`.`scale`,
`copy`.`dmgschool`=`creature_template`.`dmgschool`,
`copy`.`mingold`=`creature_template`.`mingold`,
`copy`.`maxgold`=`creature_template`.`maxgold`,
`copy`.`Vehicle_Id`=`creature_template`.`Vehicle_Id`,
`copy`.`mechanic_immune_mask`=`creature_template`.`mechanic_immune_mask`
WHERE
`copy`.`entry`=`creature_template`.`difficulty_entry_3`;

# Final_FIX
UPDATE quest_template SET SpecialFlags=SpecialFlags|1 WHERE QuestFlags=QuestFlags|4096;
UPDATE quest_template SET SpecialFlags=SpecialFlags|1 WHERE QuestFlags=QuestFlags|32768;
DELETE FROM `creature_addon` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `creature_movement` WHERE `id` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `npc_gossip` WHERE `npc_guid` NOT IN (SELECT `guid` FROM `creature`);
# DELETE FROM `game_event_gameobject` WHERE `guid` NOT IN (SELECT `guid` FROM `gameobject`);
# DELETE FROM `game_event_creature` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);
# UPDATE creature_template SET unit_flags=unit_flags&~2048 WHERE unit_flags&2048=2048;
# UPDATE creature_template SET unit_flags=unit_flags&~524288 WHERE unit_flags&524288=524288;
# UPDATE creature_template SET unit_flags=unit_flags&~67108864 WHERE unit_flags&67108864=67108864;
# UPDATE creature_template SET unit_flags=unit_flags&~8388608 WHERE unit_flags&8388608=8388608;
UPDATE `creature`, `creature_template` SET `creature`.`curhealth`=`creature_template`.`minhealth`,`creature`.`curmana`=`creature_template`.`minmana` WHERE `creature`.`id`=`creature_template`.`entry` and `creature_template`.`RegenHealth` = '1';
UPDATE `creature` SET `spawndist` = 5 WHERE `spawndist` = 0 AND `MovementType`=1;
UPDATE `creature` SET `spawndist`=0 WHERE `MovementType`=0;
UPDATE `creature` SET `spawntimesecs` = 300 WHERE `spawntimesecs` = 25;
UPDATE `gameobject` SET `spawntimesecs` = 300 WHERE `spawntimesecs` = 25;
UPDATE `creature_template` SET `scale` = 1 WHERE `scale` = 0;
UPDATE `creature` SET `spawndist` = 0, `MovementType` = 2 WHERE guid in (select distinct(id) from creature_movement);
# UPDATE `creature` SET `spawndist` = 0, `MovementType` = 2 WHERE id in (select distinct(entry) from creature_movement_template);
# UPDATE `creature` LEFT JOIN (`creature_movement`) ON (`creature_movement`.`id`=`creature`.`guid`) LEFT JOIN (`creature_movement_template`) ON (`creature_movement_template`.`entry`=`creature`.`id`) SET `creature`.`spawndist`=5, `creature`.`MovementType`=1 WHERE `creature`.`MovementType`=2 AND (`creature_movement`.`id` IS NULL AND `creature_movement_template`.`entry` IS NULL);
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 0;
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 3;
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 10;
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 25;
UPDATE `gameobject` SET `state`=1 WHERE `state`=0 AND `id` IN (SELECT entry FROM `gameobject_template` WHERE `type`=3);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (SELECT `id` FROM `creature_questrelation`);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (SELECT `id` FROM `creature_involvedrelation`);
UPDATE `gameobject` SET `state` = 0 WHERE `id` IN (SELECT `entry` FROM `gameobject_template` WHERE `type` = 0 AND `data0` = 1);
# UPDATE `gameobject_template` SET `flags`=`flags`&~4 WHERE `type` IN (2,19,17);
# DELETE FROM `gameobject_scripts` WHERE `id` NOT IN (SELECT `guid` FROM `gameobject`);
# DELETE FROM `gameobject_scripts` WHERE `command` in (11, 12) and `datalong` NOT IN (SELECT `guid` FROM `gameobject`);
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` NOT IN (SELECT `entry` FROM `creature_template`);
# UPDATE creature_addon SET moveflags=moveflags &~ 0x00000100;
# UPDATE creature_addon SET moveflags=moveflags &~ 0x00000800;
# UPDATE creature_addon SET moveflags=moveflags &~ 0x00200000;
# UPDATE creature_addon SET moveflags=moveflags &~ 0x08000000;
# UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00000100;
# UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00000800;
# UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00200000;
# UPDATE creature_template_addon SET moveflags=moveflags &~ 0x08000000;
UPDATE `item_template` SET `spelltrigger_2` = 0 WHERE `spellid_2` = 0 AND `spelltrigger_2` = 6;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `AIName` = 'EventAI' AND `ScriptName` = 'generic_creature';
UPDATE `creature_template` SET npcflag = npcflag|1 WHERE `gossip_menu_id` > 0;
UPDATE quest_template SET SpecialFlags=SpecialFlags|1 WHERE SpecialFlags=4;

UPDATE db_version SET `cache_id`= '628';
UPDATE db_version SET `version`= 'YTDB_0.14.5_R628_MaNGOS_R12126_SD2_R2700_ACID_R310_RuDB_R54';
