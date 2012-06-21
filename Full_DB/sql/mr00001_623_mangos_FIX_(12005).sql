# Y2kCat
ALTER TABLE db_version_ytdb CHANGE COLUMN 622_FIX_11994 623_FIX_12005 bit;
REPLACE INTO `db_version_ytdb` (`version`) VALUES ('623_FIX_12005');

# NeatElves
REPLACE INTO `spell_area` (`spell`, `area`, `quest_start`, `quest_start_active`, `quest_end`, `aura_spell`, `racemask`, `gender`, `autocast`) VALUES ('49345', '4228', '0', '0', '0', '0', '0', '2', '0'), ('49461', '4228', '0', '0', '0', '0', '0', '2', '0'), ('49462', '4228', '0', '0', '0', '0', '0', '2', '0');
UPDATE creature_template SET npcflag=npcflag&~2 WHERE entry=15608;
DELETE FROM `npc_text` WHERE `ID` IN (10838,10878,10909,10915,10918,10968,10977,10984,10985,10986,10987,10990,10991,10993,10996,10998,10999,11012,11013,11014,11015,11020,11022,11023,11024,11037,11063);
INSERT INTO `npc_text` (`ID`,`text0_0`,`text0_1`,`lang0`,`prob0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`text1_0`,`text1_1`,`lang1`,`prob1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`text2_0`,`text2_1`,`lang2`,`prob2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`text3_0`,`text3_1`,`lang3`,`prob3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`text4_0`,`text4_1`,`lang4`,`prob4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`text5_0`,`text5_1`,`lang5`,`prob5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`text6_0`,`text6_1`,`lang6`,`prob6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`text7_0`,`text7_1`,`lang7`,`prob7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`) VALUES
(10838,'Yes, $g king : queen;?','',0,1,0,1,0,0,0,0,'You kill gronn!  Now you fight things from sky?','',0,1,0,15,0,0,0,0,'Me life for $N!','',0,1,0,15,0,0,0,0,'Dis drink good!','',0,1,0,1,0,0,0,0,'If $G King : Queen; $N dance, me dance!','',0,1,0,1,0,0,0,0,'$G King : Queen; not angry with me?','',0,1,0,1,0,0,0,0,'Why you look at me like dat?  You not gonna kiss me, right!?','',0,1,0,1,0,0,0,0,'Now all Sons of Gruul dead!  Now new $g king : queen; lead all ogres to Ogri''la!','',0,1,0,15,0,0,0,0 ),
(10878,'Da $g king : queen;!  Chort ready to serve.','',0,1,0,2,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(10909,'Burning eyes within the prism fill your mind with a sense of dread...','',0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(10915,'<As you place your apexis shards within the hollow of the Bash''ir crystalforge and pull the lever, the device literally disintegrates them.  A few moments later your flasks appear at your feet.>','',0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(10918,'The boy''s too stupid still to say it -- not enough crystal exposure yet -- but, he''s thankful for what you did in getting him those flasks.$B$BNow, only nine more sons to go.  Gah!$B$B<Both of Torkus''s heads sigh.>$B$BWant to take one of them off of our hands?  We''ll sell him to you cheap.','',0,1,0,1,0,5,0,6,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(10968,'Mighty one! How can we serve you?','',0,1,1,396,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(10977,'','Hey, comrade.  If you get yourself in good with the Skyguard, I can offer you a direct flight to our base, Blackwind Landing, in the Skethyl Mountains.$B$BDo you like my beautiful nether ray?  It is lovely.',0,1,0,1,0,6,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(10984,'Everyone''s gotta drink. What can we get for you?','',0,1,1,396,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(10985,'Greetings $G brother:sister;, how can we help?','',0,1,1,396,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(10986,'Our drinks should quench even the mightiest of thirsts.','',0,1,1,396,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(10987,'Drink or be gone!','',0,1,1,396,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(10990,'Yer gettin'' ta be something of a revered figure ''round here, $g boy : girl;!  If''n I didn''t know better, I''d say ye were gunnin'' fer me job!!!$B$BAll the same, if ye keep up the way ye have been, ye''ll deserve it!','',0,1,0,5,0,396,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(10991,'What can I say, $N?  Yer the finest o'' the Sha''tari Skyguard!$B$BJust don''t be lettin'' that go ta yer head.  I can still teach ya a thing or two, $g lad : lass;!$B$B<Sky Commander Keller grins at you and winks.>','',0,1,0,2,0,11,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(10993,'How can we be of service, exalted one?','',0,1,1,16,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(10996,'We are happy to provide you with supplies.','',0,1,1,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(10998,'Honored $G brother:sister;, how can we help?','',0,1,1,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(10999,'Friend! It''s been too long.  What can we get for you?','',0,1,1,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(11013,'It''s an honor to have a $r such as yourself aiding us ogres.  You''re keeping our hope of a better future alive.$B$BNow if we could just get rid of these headaches.  Are you sure you don''t want one of our sons?','',0,1,0,1,0,6,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(11012,'There are few things you can trust in life. Steel, you can trust.','',0,1,1,396,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(11014,'What is steel compared to the hand that shapes it?','',0,1,1,396,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(11015,'It''s amazing how much you''ve helped us out.  We dare say that if it weren''t for you, we''d already have been overrun by the demons, or fried to a crisp by the Black Dragonflight!$B$BOn a side note, we did mention that we''d sell you one of our sons, cheap, right?  No, not interested?','',0,1,0,1,0,6,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(11020,'Gahk like little, $r $N.  Yous kill da big demon; make all da little demons scared!$B$B<Gahk''s heads both grin at you.>','',0,1,0,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(11022,'What can we get for you, our exalted $G brother:sister;?','',0,1,1,16,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(11023,'How might we be of assistance?','',0,1,1,1,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(11024,'Honored $G brother:sister;, how may we help?','',0,1,1,396,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(11037,'You''re like something of a revered figure around here, $g man : kitten;.  Seems like everyone''s talking about you.  That''s cool.$B$BLet''s see if there''s something in stock that you''re interested in.  We have a lot of nice stuff.','',0,1,0,25,0,1,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 ),
(11063,'You can never be too prepared.','',0,1,1,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0 );
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8640,10838);
UPDATE `creature_template` SET `gossip_menu_id`=8640, `npcflag`=`npcflag`|1 WHERE `entry`=23052;
UPDATE `creature_template` SET `gossip_menu_id`=8640, `npcflag`=`npcflag`|1 WHERE `entry`=23053;
UPDATE `gossip_menu_option` SET `option_text`='Um, no... no, I don''t want that at all.' WHERE `menu_id`=8437 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Absolutely!' WHERE `menu_id`=8439 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Why are you so far from Toshley''s Station?' WHERE `menu_id`=8306 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Send me back to Ruuan.' WHERE `menu_id`=8455 AND `id`=3;
UPDATE `gossip_menu_option` SET `option_text`='Very well, let me see what you''ve got.' WHERE `menu_id`=8490 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='<Call forth Vakkiz the Windrager.>' WHERE `menu_id`=8660 AND `id`=1;
UPDATE `gossip_menu_option` SET `option_text`='Place 35 Apexis Shards into the prism.' WHERE `menu_id`=8671 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Skwak!' WHERE `menu_id`=8683 AND `id`=0;
UPDATE `gossip_menu_option` SET `option_text`='Show me your assortment of, err... things.' WHERE `menu_id`=8661 AND `id`=0;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (8303,10569),(8304,10537),(8454,10561),(8620,10860),(8642,10992),(8642,10994),(8657,10878),(8683,10953),
(8669,10938),(8669,10988),(8669,10989),(8669,10990),(8669,10991),(8670,10997),(8670,11001),(8670,11002),(8670,11004),(8674,10912),(8675,10915),
(8678,10917),(8678,11013),(8678,11015),(8678,11018),(8679,10920),(8679,11027),(8680,10924),(8680,10925),(8680,11019),(8680,11020),(8681,11007),
(8681,11009),(8681,11010),(8681,11011),(8716,10966),(8716,10968),(8716,10969),(8717,10974),(8717,10973),(8717,10972),(8719,10980),(8721,10983),
(8721,10984),(8721,10985),(8722,10993),(8722,10996),(8722,10998),(8723,11008),(8723,11012),(8723,11014),(8723,11016),(8726,11036),(8726,11037),
(8726,11038),(8724,11022),(8724,11023),(8724,11024),(8737,11060),(8737,11061),(8737,11063),(8757,11095);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `box_coded`, `box_money`, `box_text`) VALUES
(8303, 0, 0, 'I need another waiver!', 1, 1, 0, 0, 0, 0, ''),
(8304, 0, 0, 'I''m ready for my test flight!', 1, 1, 0, 0, 0, 0, ''),
(8304, 1, 0, 'Take me to Singing Ridge.', 1, 1, 8454, 0, 0, 0, ''),
(8304, 2, 0, 'Send me to Razaan''s Landing!', 1, 1, 0, 0, 0, 0, ''),
(8304, 3, 0, 'Take me to Ruuan.', 1, 1, 0, 0, 0, 0, ''),
(8304, 4, 0, 'Send me to Raven''s Wood!', 1, 1, 0, 0, 0, 0, ''),
(8454, 0, 0, 'I have the signed waiver!  Fire me into the Singing Ridge!', 1, 1, 0, 0, 0, 0, ''),
(8455, 4, 0, 'Send me back to Raven''s Wood.', 1, 1, 0, 0, 0, 0, ''),
(8490, 0, 1, 'Very well, let me see what you''ve got.', 3, 128, 0, 0, 0, 0, ''),
(8674, 0, 0, 'Use the fel crystalforge to make another purchase.', 1, 1, 8672, 0, 0, 0, ''),
(8675, 0, 0, 'Use the Bash''ir crystalforge to make another purchase.', 1, 1, 8677, 0, 0, 0, '');
UPDATE `gossip_menu_option` SET `action_menu_id`='8674' WHERE `menu_id`=8672 AND `id`=1;
UPDATE `gossip_menu_option` SET `action_menu_id`='8675' WHERE `menu_id`=8677 AND `id`=1;
UPDATE `gossip_menu_option` SET `condition_id`='739' WHERE `menu_id`=8304 AND `id`=0;
UPDATE `gossip_menu_option` SET `condition_id`='1026' WHERE `menu_id`=8304 AND `id`=1;
UPDATE `gossip_menu_option` SET `condition_id`='1534' WHERE `menu_id`=8304 AND `id`=2;
UPDATE `gossip_menu_option` SET `condition_id`='1535' WHERE `menu_id`=8304 AND `id`=3;
UPDATE `gossip_menu_option` SET `condition_id`='1536' WHERE `menu_id`=8304 AND `id`=4;
UPDATE `gossip_menu_option` SET `condition_id`='1537' WHERE `menu_id`=8304 AND `id`=5;
UPDATE `gossip_menu_option` SET `condition_id`='1538' WHERE `menu_id`=8455 AND `id`=1;
UPDATE `gossip_menu_option` SET `condition_id`='1539' WHERE `menu_id`=8455 AND `id`=2;
UPDATE `gossip_menu_option` SET `condition_id`='1540' WHERE `menu_id`=8455 AND `id`=3;
UPDATE `gossip_menu_option` SET `box_text`=NULL ,`condition_id`='1541' WHERE `menu_id`=8455 AND `id`=4;
UPDATE `gossip_menu_option` SET `condition_id`='1542' WHERE `menu_id`=8454 AND `id`=0;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
('739', '9', '10557', '0'),
('1026', '9', '10710', '0'),
('1534', '9', '10711', '0'),
('1535', '9', '10712', '0'),
('1536', '9', '10716', '0'),
('1537', '8', '10557', '0'),
('1538', '8', '10710', '0'),
('1539', '8', '10711', '0'),
('1540', '8', '10712', '0'),
('1541', '8', '10716', '0'),
('1542', '2', '30539', '1');
UPDATE `gossip_menu` SET `condition_id`='1537' WHERE `entry`=8303 AND `text_id`=10569;
UPDATE `gossip_menu` SET `condition_id`='1543' WHERE `entry`=8304 AND `text_id`=10537;
UPDATE `gossip_menu` SET `condition_id`='1544' WHERE `entry`=8620 AND `text_id`=10860;
UPDATE `gossip_menu` SET `condition_id`='441' WHERE `entry`=8642 AND `text_id`=10992;
UPDATE `gossip_menu` SET `condition_id`='1545' WHERE `entry`=8642 AND `text_id`=10994;
UPDATE `gossip_menu` SET `cond_1`='0', `cond_1_val_1`='0' WHERE `entry`=8642 AND `text_id`=10995;
UPDATE `gossip_menu` SET `condition_id`='920' WHERE `entry`=8683 AND `text_id`=10953;
UPDATE `gossip_menu` SET `condition_id`='441' WHERE `entry`=8669 AND `text_id`=10989;
UPDATE `gossip_menu` SET `condition_id`='441' WHERE `entry`=8670 AND `text_id`=11001;
UPDATE `gossip_menu` SET `condition_id`='441' WHERE `entry`=8737 AND `text_id`=11063;
UPDATE `gossip_menu` SET `condition_id`='1545' WHERE `entry`=8669 AND `text_id`=10990;
UPDATE `gossip_menu` SET `condition_id`='1545' WHERE `entry`=8670 AND `text_id`=11002;
UPDATE `gossip_menu` SET `condition_id`='1545' WHERE `entry`=8737 AND `text_id`=11061;
UPDATE `gossip_menu` SET `condition_id`='412' WHERE `entry`=8669 AND `text_id`=10991;
UPDATE `gossip_menu` SET `condition_id`='412' WHERE `entry`=8670 AND `text_id`=11004;
UPDATE `gossip_menu` SET `condition_id`='412' WHERE `entry`=8737 AND `text_id`=11060;
UPDATE `gossip_menu` SET `condition_id`='1546' WHERE `entry`=8670 AND `text_id`=10997;
UPDATE `gossip_menu` SET `condition_id`='1547' WHERE `entry`=8669 AND `text_id`=10988;
UPDATE `gossip_menu` SET `condition_id`='1549' WHERE `entry`=8669 AND `text_id`=10938;
UPDATE `gossip_menu` SET `condition_id`='1544' WHERE `entry`=8657 AND `text_id`=10878;
UPDATE `gossip_menu` SET `condition_id`='441' WHERE `entry`=8719 AND `text_id`=10979;
UPDATE `gossip_menu` SET `condition_id`='1552' WHERE `entry`=8757 AND `text_id`=11095;
UPDATE `gossip_menu` SET `condition_id` = '413' WHERE `entry` = 8678 AND `text_id` = 11018;
UPDATE `gossip_menu` SET `cond_1` = '0', `cond_1_val_1` = '0', `condition_id` = '413' WHERE `entry` = 8680 AND `text_id` = 11021;
UPDATE `gossip_menu` SET `condition_id` = '413' WHERE `entry` = 8681 AND `text_id` = 11011;
UPDATE `gossip_menu` SET `condition_id` = '413' WHERE `entry` = 8716 AND `text_id` = 10969;
UPDATE `gossip_menu` SET `condition_id` = '413' WHERE `entry` = 8717 AND `text_id` = 10972;
UPDATE `gossip_menu` SET `condition_id` = '413' WHERE `entry` = 8721 AND `text_id` = 10983;
UPDATE `gossip_menu` SET `condition_id`='413' WHERE `entry`=8722 AND `text_id`=10993;
UPDATE `gossip_menu` SET `condition_id`='413' WHERE `entry`=8723 AND `text_id`=11008;
UPDATE `gossip_menu` SET `condition_id`='413' WHERE `entry`=8724 AND `text_id`=11022;
UPDATE `gossip_menu` SET `condition_id`='413' WHERE `entry`=8726 AND `text_id`=11038;
UPDATE `gossip_menu` SET `condition_id`='1553' WHERE `entry`=8678 AND `text_id`=11015;
UPDATE `gossip_menu` SET `condition_id`='1553' WHERE `entry`=8679 AND `text_id`=11027;
UPDATE `gossip_menu` SET `condition_id`='1553' WHERE `entry`=8680 AND `text_id`=11019;
UPDATE `gossip_menu` SET `condition_id`='1553' WHERE `entry`=8681 AND `text_id`=11010;
UPDATE `gossip_menu` SET `condition_id` = '1553' WHERE `entry` = 8716 AND `text_id` = 10968;
UPDATE `gossip_menu` SET `condition_id` = '1553' WHERE `entry` = 8717 AND `text_id` = 10973;
UPDATE `gossip_menu` SET `condition_id` = '1553' WHERE `entry` = 8721 AND `text_id` = 10984;
UPDATE `gossip_menu` SET `condition_id` = '1553' WHERE `entry` = 8722 AND `text_id` = 10996;
UPDATE `gossip_menu` SET `condition_id` = '1553' WHERE `entry` = 8723 AND `text_id` = 11012;
UPDATE `gossip_menu` SET `condition_id` = '1553' WHERE `entry` = 8724 AND `text_id` = 11023;
UPDATE `gossip_menu` SET `condition_id` = '1553' WHERE `entry` = 8726 AND `text_id` = 11037;
UPDATE `gossip_menu` SET `condition_id` = '1552' WHERE `entry` = 8678 AND `text_id` = 11013;
UPDATE `gossip_menu` SET `condition_id` = '1552' WHERE `entry` = 8681 AND `text_id` = 11009;
UPDATE `gossip_menu` SET `condition_id` = '1552' WHERE `entry` = 8716 AND `text_id` = 10966;
UPDATE `gossip_menu` SET `condition_id` = '1552' WHERE `entry` = 8717 AND `text_id` = 10974;
UPDATE `gossip_menu` SET `condition_id` = '1552' WHERE `entry` = 8721 AND `text_id` = 10985;
UPDATE `gossip_menu` SET `condition_id` = '1552' WHERE `entry` = 8722 AND `text_id` = 10998;
UPDATE `gossip_menu` SET `condition_id` = '1552' WHERE `entry` = 8723 AND `text_id` = 11014;
UPDATE `gossip_menu` SET `condition_id` = '1552' WHERE `entry` = 8724 AND `text_id` = 11024;
UPDATE `gossip_menu` SET `condition_id` = '1552' WHERE `entry` = 8726 AND `text_id` = 11036;
UPDATE `gossip_menu` SET `condition_id` = '1551' WHERE `entry` = 8716 AND `text_id` = 10965;
UPDATE `gossip_menu` SET `condition_id` = '1551' WHERE `entry` = 8717 AND `text_id` = 10975;
UPDATE `gossip_menu` SET `condition_id` = '1551' WHERE `entry` = 8721 AND `text_id` = 10986;
UPDATE `gossip_menu` SET `condition_id` = '1551' WHERE `entry` = 8722 AND `text_id` = 10999;
UPDATE `gossip_menu` SET `condition_id` = '1551' WHERE `entry` = 8723 AND `text_id` = 11016;
UPDATE `gossip_menu` SET `condition_id` = '1551' WHERE `entry` = 8724 AND `text_id` = 11025;
UPDATE `gossip_menu` SET `condition_id` = '1551' WHERE `entry` = 8726 AND `text_id` = 11035;
UPDATE `gossip_menu` SET `condition_id` = '1550' WHERE `entry` = 8680 AND `text_id` = 10923;
UPDATE `gossip_menu` SET `condition_id` = '1550' WHERE `entry` = 8681 AND `text_id` = 10926;
UPDATE `gossip_menu` SET `condition_id` = '1550' WHERE `entry` = 8717 AND `text_id` = 10976;
UPDATE `gossip_menu` SET `condition_id` = '1550' WHERE `entry` = 8721 AND `text_id` = 10987;
UPDATE `gossip_menu` SET `condition_id` = '1550' WHERE `entry` = 8722 AND `text_id` = 11000;
UPDATE `gossip_menu` SET `condition_id` = '1550' WHERE `entry` = 8723 AND `text_id` = 11017;
UPDATE `gossip_menu` SET `condition_id` = '1550' WHERE `entry` = 8724 AND `text_id` = 11026;
UPDATE `gossip_menu` SET `condition_id`='414' WHERE `entry`=8680 AND `text_id`=11020;
UPDATE `conditions` SET `value1`='11025' WHERE `condition_entry`=415;
UPDATE `gossip_menu` SET `condition_id`='1554' WHERE `entry`=8681 AND `text_id`=11007;
UPDATE `gossip_menu` SET `condition_id`='1555' WHERE `entry`=8679 AND `text_id`=10920;
UPDATE `gossip_menu` SET `condition_id`='1555' WHERE `entry`=8680 AND `text_id`=10924;
UPDATE `gossip_menu` SET `condition_id`='984' WHERE `entry`=8678 AND `text_id`=10917;
UPDATE `gossip_menu` SET `condition_id`='1556' WHERE `entry`=8680 AND `text_id`=10925;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
('1543', '1', '37108', '0'),
('1544', '8', '11000', '0'),
('412', '5', '1031', '7'),
('1545', '5', '1031', '6'),
('1546', '8', '11065', '0'),
('1547', '8', '11062', '0'),
('1548', '8', '11010', '0'),
('1549', '-1', '1548', '1546'),
('1550', '5', '1038', '3'),
('1551', '5', '1038', '4'),
('1552', '5', '1038', '5'),
('1553', '5', '1038', '6'),
('1554', '8', '11058', '0'),
('1555', '8', '11026', '0'),
('1556', '8', '11060', '0');
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES ('8568', '10742', '0', '8', '10966', '0', '0', '0', '0', '1512'), ('8568', '10743', '0', '8', '10967', '0', '0', '0', '0', '1513');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1512', '8', '10966', '0'), ('1513', '8', '10967', '0');
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 10502 AND `id` = 4;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1514', '-2', '755', '834');
UPDATE `gossip_menu_option` SET `cond_2`='9', `cond_2_val_1`='13927', `condition_id`='1514' WHERE `menu_id`=10502 AND `id`=3;
UPDATE `gossip_menu_option` SET `id`='0' WHERE `menu_id`=10502 AND `id`=3;
UPDATE `creature_model_info` SET `modelid_other_gender` = 0 WHERE `modelid` = 4260;
UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` = 31135;
UPDATE `quest_template` SET `PrevQuestId`=11004 WHERE `entry`=11005;
UPDATE `creature_template_addon` SET `auras`='32566 46967' WHERE `entry`=26333;
UPDATE `quest_template` SET `PrevQuestId`=0 WHERE `entry` in (13157,13139,13141);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='50' WHERE `item` in (23984);
DELETE FROM `gossip_menu` WHERE `entry` IN (7540);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (7540,9144);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1557', '9', '9738', '0');
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (7540);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(7540,0,0,"Naturalist, please grant me your boon.",1,1,0,0,0,0,'');
UPDATE `gossip_menu_option` SET `condition_id`='1557' WHERE `menu_id` in (7520,7540) AND `id`=0;
UPDATE `creature_template` SET `unit_flags`=512,`flags_extra`=2048 WHERE `entry`=17885;
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('17885', '0', '0', '0', '0', '0', '0', '31526');
UPDATE `creature` SET `position_x`=296.6974,`position_y`=-362.373,`position_z`=50.15062,`orientation`=5.5676 WHERE `guid`=80216;
UPDATE `creature` SET `position_x`=288.5823,`position_y`=-121.8309,`position_z`=29.70329,`MovementType`=2 WHERE `guid`=53893;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(53893,1,288.5823,-121.8309,29.70329),
(53893,2,281.5271,-120.3684,29.75141),
(53893,3,274.0677,-122.0538,29.80962),
(53893,4,281.5271,-120.3684,29.75141);
UPDATE `quest_template` SET `RequiredRaces`='0' WHERE `entry`=5944;
UPDATE `quest_template` SET `NextQuestId`='0', `NextQuestInChain`='0' WHERE `entry`=5862;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES
('1561', '2235', '0', '0', '0', '0', '0', '0', '0', '1558'),
('50015', '2236', '0', '0', '0', '0', '0', '0', '0', '0'),
('50016', '2237', '0', '0', '0', '0', '0', '0', '0', '0'),
('50017', '2238', '0', '0', '0', '0', '0', '0', '0', '0'),
('50018', '2239', '0', '0', '0', '0', '0', '0', '0', '0');
UPDATE `quest_template` SET `SpecialFlags`='2' WHERE `entry`=3702;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1558', '9', '3702', '0');
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (1561,50015,50016,50017,50018);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_script_id`) VALUES
(1561,0,0,"I am ready, Historian Archesonus.",1,1,50015,0),
(50015,0,0,"That is tragic. How did this happen?",1,1,50016,0),
(50016,0,0,"Interesting, continue please.",1,1,50017,0),
(50017,0,0,"Unbelievable! How dare they??",1,1,50018,0),
(50018,0,0,"Of course I will help!",1,1,-1,1561);
DELETE FROM `gossip_scripts` WHERE `id` = 1561;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('1561', '0', '7', '3702', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
UPDATE `gossip_menu_option` SET `condition_id`='1558' WHERE `menu_id` =1561 AND `id`=0;
delete from creature_linking_template where entry in (30391,30435);
insert into creature_linking_template values
(30391,619,30258,4112,0),
(30435,619,30258,4112,0);
DELETE FROM `creature` WHERE `guid`=104933;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(104933,29460,571,1,2,0,0,7138.47,-2166.756,798.66,1.91463,300,0,0,12600,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(104933,1,7138.47,-2166.756,798.66),
(104933,2,7137.982,-2206.665,805.7148),
(104933,3,7161.205,-2258.269,804.6854),
(104933,4,7192.208,-2308.688,803.2413),
(104933,5,7234.745,-2344.972,803.0753),
(104933,6,7274.754,-2385.471,791.2989),
(104933,7,7279.244,-2432.098,788.5766),
(104933,8,7287.073,-2487.045,787.2991),
(104933,9,7313.09,-2514.464,787.2991),
(104933,10,7371.793,-2525.992,787.2991),
(104933,11,7408.351,-2485.411,787.2991),
(104933,12,7420.525,-2414.975,787.2991),
(104933,13,7408.521,-2337.311,787.2991),
(104933,14,7349.138,-2289.91,787.2991),
(104933,15,7279.763,-2277.351,787.2991),
(104933,16,7206.917,-2239.987,787.2991),
(104933,17,7179.584,-2203.606,787.2991),
(104933,18,7160.147,-2169.823,787.2991),
(104933,19,7134.891,-2128.46,787.2991),
(104933,20,7122.673,-2069.597,787.2991),
(104933,21,7104.583,-2041.353,787.2991),
(104933,22,7060.176,-2045.798,787.2991),
(104933,23,7021.334,-2089.535,787.2991),
(104933,24,7021.683,-2123.516,787.2991),
(104933,25,7055.512,-2136.21,787.2991),
(104933,26,7096.39,-2139.124,787.2991),
(104933,27,7118.583,-2150.815,787.2991);
DELETE FROM `creature` WHERE `guid`=104931;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(104931,29460,571,1,2,0,0,7368.505,-2205.943,843.7172,1.91463,300,0,0,12600,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(104931,1,7368.505,-2205.943,843.7172),
(104931,2,7368.349,-2206.931,843.7172),
(104931,3,7370.282,-2210.494,847.4096),
(104931,4,7355.707,-2244.806,829.2711),
(104931,5,7331.636,-2263.269,812.4655),
(104931,6,7302.835,-2255.226,790.5214);
DELETE FROM `creature` WHERE `guid`=104928;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(104928,29460,571,1,2,0,0,7139.471,-2158.159,806.128,1.91463,300,0,0,12600,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(104928,1,7139.471,-2158.159,806.128),
(104928,2,7174.096,-2197.912,799.7397),
(104928,3,7207.944,-2233.231,799.7397),
(104928,4,7270.875,-2270.113,799.7397),
(104928,5,7326.976,-2290.712,799.7397),
(104928,6,7398.354,-2307.759,858.0721),
(104928,7,7492.969,-2338.019,913.3103),
(104928,8,7516.403,-2341.424,929.4471),
(104928,9,7533.13,-2350.423,930.8928),
(104928,10,7542.375,-2369.76,924.0596),
(104928,11,7540.795,-2388.042,900.4768),
(104928,12,7520.372,-2426.235,856.811),
(104928,13,7490.571,-2460.841,825.395),
(104928,14,7433.976,-2476.923,806.3961),
(104928,15,7363.505,-2480.186,799.9239),
(104928,16,7322.222,-2455.095,799.9239),
(104928,17,7296.217,-2406.509,799.9239),
(104928,18,7250.124,-2348.116,796.2858),
(104928,19,7199.447,-2308.098,791.8962),
(104928,20,7165.64,-2260.306,794.3141),
(104928,21,7126.358,-2218.408,792.2291),
(104928,22,7101.756,-2200.451,797.7845),
(104928,23,7071.807,-2185.584,808.8121),
(104928,24,7043.711,-2175.546,825.1454),
(104928,25,7016.538,-2153.01,825.1454),
(104928,26,7010.379,-2118.062,825.1454),
(104928,27,7031.11,-2081.328,825.1454),
(104928,28,7067.889,-2058.581,825.1454),
(104928,29,7109.583,-2060.563,825.1454),
(104928,30,7129.145,-2089.288,825.1454),
(104928,31,7133.573,-2119.781,811.7565);
DELETE FROM `creature` WHERE `guid`=104930;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(104930,29460,571,1,2,0,0,7111.189,-2126.364,809.0059,1.91463,300,0,0,12600,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(104930,1,7111.189,-2126.364,809.0059),
(104930,2,7112.182,-2126.484,809.0059),
(104930,3,7148.073,-2168.365,801.1813),
(104930,4,7179.175,-2226.085,785.2094),
(104930,5,7223.947,-2286.013,782.9871),
(104930,6,7299.682,-2304.846,784.2374),
(104930,7,7379.366,-2316.926,796.4037),
(104930,8,7415.913,-2373.976,798.6256),
(104930,9,7412.545,-2436.63,796.9036),
(104930,10,7357.321,-2469.256,801.1813),
(104930,11,7324.498,-2460.21,801.1813),
(104930,12,7299.582,-2416.601,796.1536),
(104930,13,7311.903,-2374.752,787.5981),
(104930,14,7312.228,-2301.718,778.1539),
(104930,15,7277.36,-2261.898,778.1539),
(104930,16,7223.409,-2240.653,778.1539),
(104930,17,7146.638,-2228.195,778.1539),
(104930,18,7063.594,-2217.223,802.7003),
(104930,19,7018.785,-2211.49,814.2276),
(104930,20,6971.935,-2170.058,834.7831),
(104930,21,6970.746,-2108.841,872.616),
(104930,22,6991.211,-2071.003,882.1439),
(104930,23,7035.753,-2048.345,872.0881),
(104930,24,7091.613,-2053.953,852.9218),
(104930,25,7120.529,-2096.423,830.6169),
(104930,26,7139.663,-2146.639,806.1729);
DELETE FROM `creature` WHERE `guid`=104929;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(104929,29460,571,1,2,0,0,7325.084,-2259.102,789.8701,1.91463,300,0,0,12600,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(104929,1,7325.084,-2259.102,789.8701),
(104929,2,7324.438,-2258.339,789.8701),
(104929,3,7303.33,-2256.314,797.6193),
(104929,4,7267.175,-2247.528,794.2031),
(104929,5,7214.491,-2258.535,801.3693),
(104929,6,7172.046,-2253.232,805.3967),
(104929,7,7131.951,-2229.063,811.4247),
(104929,8,7094.743,-2214.779,814.9513),
(104929,9,7037.284,-2220.873,816.9806),
(104929,10,7001.552,-2206.268,815.3693),
(104929,11,6987.444,-2184.004,809.9804),
(104929,12,6978.424,-2132.038,810.9526),
(104929,13,7004.174,-2094.79,805.2302),
(104929,14,7061.313,-2081.083,794.8694),
(104929,15,7106.668,-2099.052,785.4243),
(104929,16,7138.966,-2157.915,783.5634),
(104929,17,7148.676,-2194.204,790.7584),
(104929,18,7161.454,-2233.868,796.2581),
(104929,19,7177.563,-2267.763,796.2305),
(104929,20,7208.712,-2314.157,792.0358),
(104929,21,7273.909,-2345.979,783.6465),
(104929,22,7368.229,-2329.532,782.4529),
(104929,23,7446.557,-2387.249,792.8419),
(104929,24,7464.88,-2459.651,777.7035),
(104929,25,7426.007,-2508.458,777.7035),
(104929,26,7367.409,-2517.811,777.7035),
(104929,27,7315.153,-2476.871,777.7035),
(104929,28,7324.871,-2419.788,787.8976),
(104929,29,7343.577,-2356.954,789.7312),
(104929,30,7355.857,-2295.399,785.1757),
(104929,31,7324.438,-2258.339,789.8701);
DELETE FROM `creature` WHERE `guid`=104932;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(104932,29460,571,1,2,0,0,7303.549,-2258.753,788.369,1.91463,300,0,0,12600,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(104932,1,7303.549,-2258.753,788.369),
(104932,2,7302.752,-2258.148,788.369),
(104932,3,7289.952,-2257.048,791.1975),
(104932,4,7258.658,-2235.294,791.1975),
(104932,5,7210.906,-2223.988,791.1975),
(104932,6,7167.373,-2232.4,791.1975),
(104932,7,7124.27,-2224.081,791.1975),
(104932,8,7086.96,-2192.181,791.1975),
(104932,9,7087.704,-2145.958,791.1975),
(104932,10,7127.069,-2118.094,791.1975),
(104932,11,7164.674,-2135.464,793.8918),
(104932,12,7182.364,-2192.978,791.1975),
(104932,13,7182.774,-2277.733,805.3915),
(104932,14,7229.842,-2333.471,805.3915),
(104932,15,7308.383,-2345.623,805.3915),
(104932,16,7376.758,-2335.746,805.3915),
(104932,17,7427.352,-2382.805,805.3915),
(104932,18,7432.168,-2464.934,805.3915),
(104932,19,7370.238,-2513.568,805.3915),
(104932,20,7321.452,-2503.377,805.3915),
(104932,21,7291.445,-2456.148,800.0583),
(104932,22,7306.158,-2414.508,794.0861),
(104932,23,7331.817,-2357.911,790.9471),
(104932,24,7331.193,-2296.791,790.9471),
(104932,25,7305.381,-2260.717,790.9471);
DELETE FROM `creature` WHERE `guid`=104927;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(104927,29460,571,1,2,0,0,7133.43,-2118.791,811.7565,1.91463,300,0,0,12600,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(104927,1,7133.43,-2118.791,811.7565),
(104927,2,7133.573,-2119.781,811.7565),
(104927,3,7119.039,-2128.233,806.786),
(104927,4,7129.032,-2143.773,806.786),
(104927,5,7131.506,-2163.489,806.786),
(104927,6,7125.905,-2198.75,806.786),
(104927,7,7133.987,-2234.428,806.786),
(104927,8,7170.914,-2282.005,806.786),
(104927,9,7236.963,-2311.655,806.786),
(104927,10,7279.574,-2311.321,806.786),
(104927,11,7320.696,-2339.429,806.786),
(104927,12,7334.366,-2379.159,806.786),
(104927,13,7321.908,-2419.639,819.0636),
(104927,14,7294.696,-2461.332,841.8126),
(104927,15,7277.729,-2494.843,861.1736),
(104927,16,7245.194,-2587.365,911.9794),
(104927,17,7235.221,-2664.447,911.9794),
(104927,18,7267.375,-2723.981,911.9794),
(104927,19,7364.385,-2762.505,956.4234),
(104927,20,7439.538,-2775.097,990.1998),
(104927,21,7538.208,-2706.511,1012.088),
(104927,22,7575.65,-2563.215,985.2554),
(104927,23,7521.32,-2414.249,933.5882),
(104927,24,7438.214,-2348.566,884.2285),
(104927,25,7349.768,-2296.647,830.8118),
(104927,26,7288.613,-2264.192,802.2007),
(104927,27,7231.5,-2246.911,802.2007),
(104927,28,7160.201,-2264.728,829.4783),
(104927,29,7110.628,-2294.354,859.3112),
(104927,30,7061.597,-2313.25,865.6166),
(104927,31,7008.405,-2309.793,865.6166),
(104927,32,6977.473,-2277.743,865.6166),
(104927,33,6976.358,-2204.402,846.9778),
(104927,34,7022.063,-2142,828.7004),
(104927,35,7070.062,-2121.369,822.228),
(104927,36,7112.182,-2126.484,809.0059);
DELETE FROM `creature` WHERE `guid`=104933;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(104933,29460,571,1,2,0,0,7138.47,-2166.756,798.66,1.91463,300,0,0,12600,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(104933,1,7138.47,-2166.756,798.66),
(104933,2,7137.982,-2206.665,805.7148),
(104933,3,7161.205,-2258.269,804.6854),
(104933,4,7192.208,-2308.688,803.2413),
(104933,5,7234.745,-2344.972,803.0753),
(104933,6,7274.754,-2385.471,791.2989),
(104933,7,7279.244,-2432.098,788.5766),
(104933,8,7287.073,-2487.045,787.2991),
(104933,9,7313.09,-2514.464,787.2991),
(104933,10,7371.793,-2525.992,787.2991),
(104933,11,7408.351,-2485.411,787.2991),
(104933,12,7420.525,-2414.975,787.2991),
(104933,13,7408.521,-2337.311,787.2991),
(104933,14,7349.138,-2289.91,787.2991),
(104933,15,7279.763,-2277.351,787.2991),
(104933,16,7206.917,-2239.987,787.2991),
(104933,17,7179.584,-2203.606,787.2991),
(104933,18,7160.147,-2169.823,787.2991),
(104933,19,7134.891,-2128.46,787.2991),
(104933,20,7122.673,-2069.597,787.2991),
(104933,21,7104.583,-2041.353,787.2991),
(104933,22,7060.176,-2045.798,787.2991),
(104933,23,7021.334,-2089.535,787.2991),
(104933,24,7021.683,-2123.516,787.2991),
(104933,25,7055.512,-2136.21,787.2991),
(104933,26,7096.39,-2139.124,787.2991),
(104933,27,7118.583,-2150.815,787.2991);
DELETE FROM `creature` WHERE `guid`=104931;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(104931,29460,571,1,2,0,0,7368.505,-2205.943,843.7172,1.91463,300,0,0,12600,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(104931,1,7368.505,-2205.943,843.7172),
(104931,2,7368.349,-2206.931,843.7172),
(104931,3,7370.282,-2210.494,847.4096),
(104931,4,7355.707,-2244.806,829.2711),
(104931,5,7331.636,-2263.269,812.4655),
(104931,6,7302.835,-2255.226,790.5214);
DELETE FROM `creature` WHERE `guid`=104928;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(104928,29460,571,1,2,0,0,7139.471,-2158.159,806.128,1.91463,300,0,0,12600,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(104928,1,7139.471,-2158.159,806.128),
(104928,2,7174.096,-2197.912,799.7397),
(104928,3,7207.944,-2233.231,799.7397),
(104928,4,7270.875,-2270.113,799.7397),
(104928,5,7326.976,-2290.712,799.7397),
(104928,6,7398.354,-2307.759,858.0721),
(104928,7,7492.969,-2338.019,913.3103),
(104928,8,7516.403,-2341.424,929.4471),
(104928,9,7533.13,-2350.423,930.8928),
(104928,10,7542.375,-2369.76,924.0596),
(104928,11,7540.795,-2388.042,900.4768),
(104928,12,7520.372,-2426.235,856.811),
(104928,13,7490.571,-2460.841,825.395),
(104928,14,7433.976,-2476.923,806.3961),
(104928,15,7363.505,-2480.186,799.9239),
(104928,16,7322.222,-2455.095,799.9239),
(104928,17,7296.217,-2406.509,799.9239),
(104928,18,7250.124,-2348.116,796.2858),
(104928,19,7199.447,-2308.098,791.8962),
(104928,20,7165.64,-2260.306,794.3141),
(104928,21,7126.358,-2218.408,792.2291),
(104928,22,7101.756,-2200.451,797.7845),
(104928,23,7071.807,-2185.584,808.8121),
(104928,24,7043.711,-2175.546,825.1454),
(104928,25,7016.538,-2153.01,825.1454),
(104928,26,7010.379,-2118.062,825.1454),
(104928,27,7031.11,-2081.328,825.1454),
(104928,28,7067.889,-2058.581,825.1454),
(104928,29,7109.583,-2060.563,825.1454),
(104928,30,7129.145,-2089.288,825.1454),
(104928,31,7133.573,-2119.781,811.7565);
DELETE FROM `creature` WHERE `guid`=104930;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(104930,29460,571,1,2,0,0,7111.189,-2126.364,809.0059,1.91463,300,0,0,12600,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(104930,1,7111.189,-2126.364,809.0059),
(104930,2,7112.182,-2126.484,809.0059),
(104930,3,7148.073,-2168.365,801.1813),
(104930,4,7179.175,-2226.085,785.2094),
(104930,5,7223.947,-2286.013,782.9871),
(104930,6,7299.682,-2304.846,784.2374),
(104930,7,7379.366,-2316.926,796.4037),
(104930,8,7415.913,-2373.976,798.6256),
(104930,9,7412.545,-2436.63,796.9036),
(104930,10,7357.321,-2469.256,801.1813),
(104930,11,7324.498,-2460.21,801.1813),
(104930,12,7299.582,-2416.601,796.1536),
(104930,13,7311.903,-2374.752,787.5981),
(104930,14,7312.228,-2301.718,778.1539),
(104930,15,7277.36,-2261.898,778.1539),
(104930,16,7223.409,-2240.653,778.1539),
(104930,17,7146.638,-2228.195,778.1539),
(104930,18,7063.594,-2217.223,802.7003),
(104930,19,7018.785,-2211.49,814.2276),
(104930,20,6971.935,-2170.058,834.7831),
(104930,21,6970.746,-2108.841,872.616),
(104930,22,6991.211,-2071.003,882.1439),
(104930,23,7035.753,-2048.345,872.0881),
(104930,24,7091.613,-2053.953,852.9218),
(104930,25,7120.529,-2096.423,830.6169),
(104930,26,7139.663,-2146.639,806.1729);
DELETE FROM `creature` WHERE `guid`=104929;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(104929,29460,571,1,2,0,0,7325.084,-2259.102,789.8701,1.91463,300,0,0,12600,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(104929,1,7325.084,-2259.102,789.8701),
(104929,2,7324.438,-2258.339,789.8701),
(104929,3,7303.33,-2256.314,797.6193),
(104929,4,7267.175,-2247.528,794.2031),
(104929,5,7214.491,-2258.535,801.3693),
(104929,6,7172.046,-2253.232,805.3967),
(104929,7,7131.951,-2229.063,811.4247),
(104929,8,7094.743,-2214.779,814.9513),
(104929,9,7037.284,-2220.873,816.9806),
(104929,10,7001.552,-2206.268,815.3693),
(104929,11,6987.444,-2184.004,809.9804),
(104929,12,6978.424,-2132.038,810.9526),
(104929,13,7004.174,-2094.79,805.2302),
(104929,14,7061.313,-2081.083,794.8694),
(104929,15,7106.668,-2099.052,785.4243),
(104929,16,7138.966,-2157.915,783.5634),
(104929,17,7148.676,-2194.204,790.7584),
(104929,18,7161.454,-2233.868,796.2581),
(104929,19,7177.563,-2267.763,796.2305),
(104929,20,7208.712,-2314.157,792.0358),
(104929,21,7273.909,-2345.979,783.6465),
(104929,22,7368.229,-2329.532,782.4529),
(104929,23,7446.557,-2387.249,792.8419),
(104929,24,7464.88,-2459.651,777.7035),
(104929,25,7426.007,-2508.458,777.7035),
(104929,26,7367.409,-2517.811,777.7035),
(104929,27,7315.153,-2476.871,777.7035),
(104929,28,7324.871,-2419.788,787.8976),
(104929,29,7343.577,-2356.954,789.7312),
(104929,30,7355.857,-2295.399,785.1757),
(104929,31,7324.438,-2258.339,789.8701);
DELETE FROM `creature` WHERE `guid`=104932;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(104932,29460,571,1,2,0,0,7303.549,-2258.753,788.369,1.91463,300,0,0,12600,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(104932,1,7303.549,-2258.753,788.369),
(104932,2,7302.752,-2258.148,788.369),
(104932,3,7289.952,-2257.048,791.1975),
(104932,4,7258.658,-2235.294,791.1975),
(104932,5,7210.906,-2223.988,791.1975),
(104932,6,7167.373,-2232.4,791.1975),
(104932,7,7124.27,-2224.081,791.1975),
(104932,8,7086.96,-2192.181,791.1975),
(104932,9,7087.704,-2145.958,791.1975),
(104932,10,7127.069,-2118.094,791.1975),
(104932,11,7164.674,-2135.464,793.8918),
(104932,12,7182.364,-2192.978,791.1975),
(104932,13,7182.774,-2277.733,805.3915),
(104932,14,7229.842,-2333.471,805.3915),
(104932,15,7308.383,-2345.623,805.3915),
(104932,16,7376.758,-2335.746,805.3915),
(104932,17,7427.352,-2382.805,805.3915),
(104932,18,7432.168,-2464.934,805.3915),
(104932,19,7370.238,-2513.568,805.3915),
(104932,20,7321.452,-2503.377,805.3915),
(104932,21,7291.445,-2456.148,800.0583),
(104932,22,7306.158,-2414.508,794.0861),
(104932,23,7331.817,-2357.911,790.9471),
(104932,24,7331.193,-2296.791,790.9471),
(104932,25,7305.381,-2260.717,790.9471);
DELETE FROM `creature` WHERE `guid`=104927;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(104927,29460,571,1,2,0,0,7133.43,-2118.791,811.7565,1.91463,300,0,0,12600,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(104927,1,7133.43,-2118.791,811.7565),
(104927,2,7133.573,-2119.781,811.7565),
(104927,3,7119.039,-2128.233,806.786),
(104927,4,7129.032,-2143.773,806.786),
(104927,5,7131.506,-2163.489,806.786),
(104927,6,7125.905,-2198.75,806.786),
(104927,7,7133.987,-2234.428,806.786),
(104927,8,7170.914,-2282.005,806.786),
(104927,9,7236.963,-2311.655,806.786),
(104927,10,7279.574,-2311.321,806.786),
(104927,11,7320.696,-2339.429,806.786),
(104927,12,7334.366,-2379.159,806.786),
(104927,13,7321.908,-2419.639,819.0636),
(104927,14,7294.696,-2461.332,841.8126),
(104927,15,7277.729,-2494.843,861.1736),
(104927,16,7245.194,-2587.365,911.9794),
(104927,17,7235.221,-2664.447,911.9794),
(104927,18,7267.375,-2723.981,911.9794),
(104927,19,7364.385,-2762.505,956.4234),
(104927,20,7439.538,-2775.097,990.1998),
(104927,21,7538.208,-2706.511,1012.088),
(104927,22,7575.65,-2563.215,985.2554),
(104927,23,7521.32,-2414.249,933.5882),
(104927,24,7438.214,-2348.566,884.2285),
(104927,25,7349.768,-2296.647,830.8118),
(104927,26,7288.613,-2264.192,802.2007),
(104927,27,7231.5,-2246.911,802.2007),
(104927,28,7160.201,-2264.728,829.4783),
(104927,29,7110.628,-2294.354,859.3112),
(104927,30,7061.597,-2313.25,865.6166),
(104927,31,7008.405,-2309.793,865.6166),
(104927,32,6977.473,-2277.743,865.6166),
(104927,33,6976.358,-2204.402,846.9778),
(104927,34,7022.063,-2142,828.7004),
(104927,35,7070.062,-2121.369,822.228),
(104927,36,7112.182,-2126.484,809.0059);
DELETE FROM `creature` WHERE `guid`=135335;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135335,27682,571,1,1,24743,0,3433.348,274.121,192.7347,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135335,1,3441.997,218.066,169.347),
(135335,2,3495.446,178.1635,169.347),
(135335,3,3562.124,172.6228,169.347),
(135335,4,3645.859,193.9786,169.347),
(135335,5,3689.068,295.8872,169.347),
(135335,6,3624.446,375.1689,169.347),
(135335,7,3510.095,372.0045,169.347),
(135335,8,3446.488,300.4381,169.347),
(135335,9,3420.008,195.1058,169.347),
(135335,10,3474.376,103.4208,169.347),
(135335,11,3587.787,78.41341,169.347),
(135335,12,3680.552,168.1343,169.347),
(135335,13,3682.222,340.8562,169.347),
(135335,14,3563.545,458.4753,169.347),
(135335,15,3452.104,480.9653,169.347),
(135335,16,3344.437,382.5979,169.347),
(135335,17,3232.114,340.6778,169.347),
(135335,18,3127.326,347.8484,169.347),
(135335,19,3027.017,384.9972,169.347),
(135335,20,2989.474,458.5701,169.347),
(135335,21,3013.37,539.2202,169.347),
(135335,22,3066.603,566.7353,169.347),
(135335,23,3134.078,551.7691,169.347),
(135335,24,3244.26,486.8306,169.347),
(135335,25,3327.64,383.2903,169.347),
(135335,26,3382.149,279.6307,169.347);
DELETE FROM `creature` WHERE `guid`=135334;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135334,27682,571,1,1,24743,0,3434.632,268.5218,212.5722,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135334,1,3449.962,350.2704,185.3083),
(135334,2,3546.571,399.454,185.3083),
(135334,3,3649.095,344.2626,185.3083),
(135334,4,3648.6,203.3825,185.3083),
(135334,5,3557.447,156.6613,185.3083),
(135334,6,3438.763,197.2433,185.3083),
(135334,7,3364.301,251.3537,185.3083),
(135334,8,3245.05,295.2606,185.3083),
(135334,9,3127.677,330.6631,185.3083),
(135334,10,3045.42,426.6257,185.3083),
(135334,11,3033.423,500.1823,185.3083),
(135334,12,3074.555,584.5701,185.3083),
(135334,13,3167.413,579.3245,185.3083),
(135334,14,3254.766,477.3121,185.3083),
(135334,15,3328.997,355.7176,185.3083),
(135334,16,3403.051,340.1719,185.3083),
(135334,17,3446.086,384.896,185.3083),
(135334,18,3503.323,407.0888,185.3083),
(135334,19,3593.65,392.4026,185.3083),
(135334,20,3658.26,283.8229,185.3083),
(135334,21,3604.809,176.3996,185.3083),
(135334,22,3500.686,159.6379,185.3083),
(135334,23,3441.441,249.5543,185.3083);
DELETE FROM `creature` WHERE `guid`=135333;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135333,27682,571,1,1,24743,0,3419.562,219.4669,185.8007,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135333,1,3476.15,177.9767,151.9461),
(135333,2,3545.193,113.4851,151.9461),
(135333,3,3639.261,157.7231,151.9461),
(135333,4,3676.142,330.9362,151.9461),
(135333,5,3568.025,452.4464,151.9461),
(135333,6,3440.924,381.5191,151.9461),
(135333,7,3406.76,247.0661,151.9461),
(135333,8,3489.703,142.3122,151.9461),
(135333,9,3573.337,130.2329,151.9461),
(135333,10,3668.767,202.5275,151.9461),
(135333,11,3660.667,365.0258,151.9461),
(135333,12,3546.228,441.4885,151.9461),
(135333,13,3414.354,479.1683,151.9461),
(135333,14,3298.711,513.6075,151.9461),
(135333,15,3152.929,563.3295,151.9461),
(135333,16,3061.01,598.1893,151.9461),
(135333,17,3028.564,548.2512,151.9461),
(135333,18,3066.851,499.9897,151.9461),
(135333,19,3126.102,457.3964,151.9461),
(135333,20,3209.258,379.5157,151.9461),
(135333,21,3290.067,313.6936,151.9461),
(135333,22,3381.995,245.4414,151.9461);
DELETE FROM `creature` WHERE `guid`=135332;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135332,27682,571,1,1,24743,0,3431.814,203.5959,199.4538,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135332,1,3469.755,211.1012,252.1057),
(135332,2,3543.436,184.6182,282.9112),
(135332,3,3605.144,211.1016,313.2445),
(135332,4,3629.088,281.4026,342.355),
(135332,5,3586.889,335.8259,342.355),
(135332,6,3534.959,340.7828,342.355),
(135332,7,3488.181,299.2897,342.355),
(135332,8,3490.962,242.9244,342.355),
(135332,9,3544.176,216.1916,342.355),
(135332,10,3607.393,238.2059,342.355),
(135332,11,3606.415,315.159,342.355),
(135332,12,3529.92,347.5442,342.355),
(135332,13,3442.581,379.9305,309.9662),
(135332,14,3363.314,409.6005,272.7996),
(135332,15,3271.624,451.7768,231.7996),
(135332,16,3222.875,508.5536,210.5774),
(135332,17,3178.339,552.9731,195.4663),
(135332,18,3119.579,592.5015,182.2996),
(135332,19,3079.527,558.9856,175.383),
(135332,20,3110.969,495.2063,173.9941),
(135332,21,3133.366,466.6834,176.5779),
(135332,22,3236.847,383.9943,176.5779),
(135332,23,3382.743,269.2179,222.0501);
DELETE FROM `creature` WHERE `guid`=135331;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135331,27682,571,1,1,24743,0,3408.915,276.3928,180.561,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135331,1,3451.428,175.6206,154.7629),
(135331,2,3461.289,67.8521,154.7629),
(135331,3,3401.216,31.08062,154.7629),
(135331,4,3348.744,62.37424,154.7629),
(135331,5,3352.888,148.2122,154.7629),
(135331,6,3405.2,335.0623,154.7629),
(135331,7,3399.393,397.5138,154.7629),
(135331,8,3346.986,426.0631,154.7629),
(135331,9,3262.085,383.6502,154.7629),
(135331,10,3156.926,352.7438,154.7629),
(135331,11,3057.544,393.0464,154.7629),
(135331,12,3000.647,466.7132,154.7629),
(135331,13,2989.147,516.5572,154.7629),
(135331,14,3049.945,587.7933,154.7629),
(135331,15,3160.802,556.4007,154.7629),
(135331,16,3268.329,422.1047,154.7629);
DELETE FROM `creature` WHERE `guid`=135329;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135329,27682,571,1,1,24743,0,3748.954,236.7544,178.6408,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135329,1,3712.221,418.183,178.6408),
(135329,2,3540.502,499.2345,178.6408),
(135329,3,3358.373,445.1452,178.6408),
(135329,4,3200.13,472.7363,178.6408),
(135329,5,3101.38,584.3835,178.6408),
(135329,6,3040.255,596.7429,178.6408),
(135329,7,2997.37,550.3453,178.6408),
(135329,8,2999.847,500.0373,178.6408),
(135329,9,3048.254,460.723,178.6408),
(135329,10,3140.818,390.9225,178.6408),
(135329,11,3219.294,333.4928,178.6408),
(135329,12,3318.04,264.8529,178.6408),
(135329,13,3436.765,193.0778,178.6408),
(135329,14,3552.843,154.3912,178.6408),
(135329,15,3668.381,197.8079,178.6408),
(135329,16,3711.96,284.6768,178.6408),
(135329,17,3627.375,410.4442,178.6408),
(135329,18,3466.029,404.0347,178.6408),
(135329,19,3375.764,293.2045,178.6408),
(135329,20,3426.16,142.911,178.6408),
(135329,21,3611.036,90.26421,178.6408),
(135329,22,3748.954,236.7544,178.6408);
DELETE FROM `creature` WHERE `guid`=129934;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(129934,27682,571,1,1,24743,0,3412.463,216.0972,212.123,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(129934,1,3412.65,215.8015,241.2928),
(129934,2,3544.712,83.40093,241.2928),
(129934,3,3729.527,148.4322,241.2928),
(129934,4,3770.91,456.7697,241.2928),
(129934,5,3592.973,601.0773,241.2928),
(129934,6,3431.349,566.7643,241.2928),
(129934,7,3298.04,548.691,241.2928),
(129934,8,3180.431,663.6898,241.2928),
(129934,9,3069.867,677.9128,241.2928),
(129934,10,2984.272,605.6987,241.2928),
(129934,11,3000.096,533.4483,241.2928),
(129934,12,3144.4,405.446,241.2928),
(129934,13,3301.554,308.331,241.2928);
DELETE FROM `creature` WHERE `guid`=129933;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(129933,27682,571,1,1,24743,0,3100.95,567.1441,118.4118,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(129933,1,3100.912,567.1385,122.3331),
(129933,2,3214.064,524.5076,122.3331),
(129933,3,3307.77,498.1685,122.3331),
(129933,4,3399.335,473.5195,122.3331),
(129933,5,3545.675,446.1954,122.3331),
(129933,6,3631.807,357.087,122.3331),
(129933,7,3640.708,229.0423,122.3331),
(129933,8,3616.36,137.7545,122.3331),
(129933,9,3558.458,113.3069,122.3331),
(129933,10,3457.288,142.8311,122.3331),
(129933,11,3387.124,248.1035,122.3331),
(129933,12,3419.464,398.1638,122.3331),
(129933,13,3366.308,507.4259,122.3331),
(129933,14,3243.456,494.2254,122.3331),
(129933,15,3121.018,428.1757,122.3331),
(129933,16,3003.428,487.8239,122.3331),
(129933,17,3001.53,566.4896,122.3331),
(129933,18,3059.883,577.261,122.3331);
DELETE FROM `creature` WHERE `guid` IN (129815,129899);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(129815,27682,571,1,1,24743,0,2954.845,625.8646,146.2928,2.094395,120,0,0,38440,0,0),
(129899,27682,571,1,1,24743,0,3256.357,585.8403,136.8419,0.4363323,120,0,0,38440,0,0);
DELETE FROM `creature` WHERE `guid`=129289;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(129289,27682,571,1,1,24743,0,3017.465,301.0079,204.943,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(129289,1,3014.38,371.552,204.943),
(129289,2,3066.132,433.5229,204.943),
(129289,3,3168.017,532.116,204.943),
(129289,4,3341.228,644.3932,204.943),
(129289,5,3480.533,600.2273,204.943),
(129289,6,3485.514,465.1431,204.943),
(129289,7,3362.191,369.4394,204.943),
(129289,8,3193.452,330.4968,204.943),
(129289,9,3117.152,256.1553,204.943),
(129289,10,3017.465,301.0079,204.943);
DELETE FROM `creature` WHERE `guid`=129288;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(129288,27682,571,1,1,24743,0,3138.133,520.6823,53.44044,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(129288,1,3120.694,487.4651,73.32948),
(129288,2,3094.569,488.8283,89.30162),
(129288,3,3076.394,504.3694,101.9128),
(129288,4,3073.121,536.1434,118.3021),
(129288,5,3100.686,550.8791,135.0522),
(129288,6,3133.567,533.2503,156.4133),
(129288,7,3128.940,498.2000,185.3022),
(129288,8,3104.875,485.1591,211.9410),
(129288,9,3078.965,493.2044,233.2187),
(129288,10,3077.378,529.8601,246.1916),
(129288,11,3104.640,532.739,246.1916),
(129288,12,3124.398,511.3354,246.1916),
(129288,13,3106.461,485.7477,246.1916),
(129288,14,3074.75,501.1113,246.1916),
(129288,15,3080.605,533.5042,222.6366),
(129288,16,3108.456,548.174,194.8869),
(129288,17,3138.865,510.0685,159.4426),
(129288,18,3107.084,484.058,121.3038),
(129288,19,3066.059,511.5332,94.97042),
(129288,20,3084.679,555.8902,74.52598),
(129288,21,3128.865,543.4575,51.55369),
(129288,22,3132.671,497.0408,51.55369),
(129288,23,3083.713,484.3025,51.55369),
(129288,24,3062.465,530.1815,51.55369),
(129288,25,3100.407,561.9063,51.55369),
(129288,26,3138.133,520.6823,53.44044); 
DELETE FROM `creature` WHERE `guid`=129287;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(129287,27682,571,1,1,24743,0,3199.019,490.8836,212.5729,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(129287,1,3131.874,451.6094,212.5729),
(129287,2,3066.175,466.9917,212.5729),
(129287,3,3015.529,515.9183,212.5729),
(129287,4,3032.398,624.4706,212.5729),
(129287,5,3123.448,648.5508,212.5729),
(129287,6,3201.826,572.715,212.5729),
(129287,7,3199.019,490.8836,212.5729);
DELETE FROM `creature` WHERE `guid`=82482;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(82482,27682,571,1,1,24743,0,3214.422,579.9131,196.0033,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(82482,1,3133.856,625.1009,196.0033),
(82482,2,3066.991,599.8026,196.0033),
(82482,3,3045.829,536.076,196.0033),
(82482,4,3064.8,436.205,196.0033),
(82482,5,3149.34,424.2586,196.0033),
(82482,6,3217.921,481.3083,196.0033),
(82482,7,3214.422,579.9131,196.0033);
DELETE FROM `creature` WHERE `guid`=93671;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(93671,27682,571,1,1,24743,0,3639.789,321.911,195.744,1.91463,120,0,0,38440,0,2);
DELETE FROM `creature_movement` WHERE `id` = 93671;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(93671,1,3654.995,228.2284,204.7075),
(93671,2,3750.065,190.3719,204.7075),
(93671,3,3793.781,239.5784,204.7075),
(93671,4,3793.007,322.9862,204.7075),
(93671,5,3712.435,337.7213,204.7075),
(93671,6,3649.212,273.7653,204.7075),
(93671,7,3627.809,181.2728,204.7075),
(93671,8,3575.202,116.1518,204.7075),
(93671,9,3452.9,157.833,204.7075),
(93671,10,3395.156,279.1096,204.7075),
(93671,11,3459.034,403.4866,204.7075),
(93671,12,3610.543,437.9186,204.7075),
(93671,13,3715.638,355.6098,204.7075),
(93671,14,3721.246,203.5534,204.7075),
(93671,15,3583.16,147.8227,204.7075),
(93671,16,3467.958,184.451,204.7075),
(93671,17,3341.041,241.3563,204.7075),
(93671,18,3259.652,326.3573,204.7075),
(93671,19,3325.962,453.1619,204.7075),
(93671,20,3430.271,470.1731,204.7075),
(93671,21,3474.818,389.2108,204.7075),
(93671,22,3422.128,277.9353,204.7075),
(93671,23,3278.513,235.3488,204.7075),
(93671,24,3139.333,309.1593,204.7075),
(93671,25,3124.315,442.8726,204.7075),
(93671,26,3166.636,500.1602,204.7075),
(93671,27,3252.777,537.1607,204.7075),
(93671,28,3365.404,500.6408,204.7075),
(93671,29,3497.347,437.8124,204.7075),
(93671,30,3610.069,345.1742,204.7075);
DELETE FROM `creature` WHERE `guid`=118916;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118916,27682,571,1,1,24743,0,3106.429,348.3322,212.4711,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118916,1,3184.002,431.2766,212.4711),
(118916,2,3166.134,532.8875,212.4711),
(118916,3,3080.641,574.7059,212.4711),
(118916,4,2963.504,564.834,212.4711),
(118916,5,2918.588,502.0504,212.4711),
(118916,6,2949.235,405.6514,212.4711),
(118916,7,3106.429,348.3322,212.4711);
DELETE FROM `creature` WHERE `guid`=118915;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118915,27682,571,1,1,24743,0,3129.027,582.4556,247.3863,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118915,1,3188.686,528.622,247.3863),
(118915,2,3166.479,466.4643,247.3863),
(118915,3,3107.782,429.4197,247.3863),
(118915,4,3030.916,459.3344,247.3863),
(118915,5,3014.312,531.3731,247.3863),
(118915,6,3058.55,581.8262,247.3863),
(118915,7,3129.027,582.4556,247.3863);
DELETE FROM `creature` WHERE `guid`=118914;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118914,27682,571,1,1,24743,0,3691.676,352.0933,342.2254,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118914,1,3662.692,328.2304,338.4197),
(118914,2,3648.806,293.8063,321.0587),
(118914,3,3677.441,213.8859,320.1976),
(118914,4,3615.31,209.5691,324.1698),
(118914,5,3637.643,254.0089,332.7251),
(118914,6,3699.886,260.6509,327.8641),
(118914,7,3720.373,308.941,337.7808),
(118914,8,3691.676,352.0933,342.2254);
DELETE FROM `creature` WHERE `guid`=93678;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(93678,27682,571,1,1,24743,0,3036.494,602.2036,179.671,1.91463,120,0,0,38440,0,2);
DELETE FROM `creature_movement` WHERE `id` = 93678;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(93678,1,3100.145,600.0773,179.671),
(93678,2,3230.972,531.9783,179.671),
(93678,3,3261.28,445.4492,179.671),
(93678,4,3185.334,349.6381,179.671),
(93678,5,3031.361,375.153,179.671),
(93678,6,2951.565,490.5297,179.671),
(93678,7,3006.273,602.823,179.671),
(93678,8,3140.882,604.8052,179.671),
(93678,9,3279.177,536.7864,179.671),
(93678,10,3342.035,451.1805,179.671),
(93678,11,3373.871,409.5802,179.671),
(93678,12,3418.399,323.2935,179.671),
(93678,13,3432.266,253.5685,179.671),
(93678,14,3376.006,177.8496,179.671),
(93678,15,3328.437,226.3789,179.671),
(93678,16,3336.244,307.4113,179.671),
(93678,17,3381.182,333.7066,179.671),
(93678,18,3478.52,398.1222,179.671),
(93678,19,3574.011,383.5956,179.671),
(93678,20,3661.792,400.2125,179.671),
(93678,21,3700.764,494.1714,179.671),
(93678,22,3602.784,552.9866,179.671),
(93678,23,3539.342,521.9033,179.671),
(93678,24,3523.356,456.0128,179.671),
(93678,25,3618.041,362.6289,179.671),
(93678,26,3723.684,327.7586,179.671),
(93678,27,3773.446,249.6754,179.671),
(93678,28,3749.611,152.5128,179.671),
(93678,29,3695.312,141.0493,179.671),
(93678,30,3651.431,217.0924,179.671),
(93678,31,3683.438,319.0038,179.671),
(93678,32,3748.601,338.1269,179.671),
(93678,33,3792.042,245.4839,179.671),
(93678,34,3735.548,180.4323,179.671),
(93678,35,3618.281,171.1228,179.671),
(93678,36,3474.684,137.1242,179.671),
(93678,37,3479.782,49.90799,179.671),
(93678,38,3558.278,30.76975,179.671),
(93678,39,3629.689,60.77876,179.671),
(93678,40,3630.145,127.0798,179.671),
(93678,41,3490.695,175.1472,179.671),
(93678,42,3366.718,224.9415,179.671),
(93678,43,3212.591,294.8876,179.671),
(93678,44,3076.071,364.5977,179.671),
(93678,45,2990.75,457.3708,179.671),
(93678,46,2984.907,530.0489,179.671),
(93678,47,3036.494,602.2036,179.671);
DELETE FROM `creature` WHERE `guid`=118913;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118913,27682,571,1,1,24743,0,3065.57,646.0688,229.7383,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118913,1,3133.651,599.4818,229.7383),
(118913,2,3196.173,510.7455,229.7383),
(118913,3,3310.401,346.2189,229.7383),
(118913,4,3407.27,144.2138,229.7383),
(118913,5,3526.717,72.89225,229.7383),
(118913,6,3672.079,141.219,229.7383),
(118913,7,3713.506,314.0188,229.7383),
(118913,8,3602.6,431.6985,229.7383),
(118913,9,3408.532,364.4567,229.7383),
(118913,10,3217.656,309.1964,229.7383),
(118913,11,3061.193,324.0175,229.7383),
(118913,12,2959.836,412.4154,229.7383),
(118913,13,2945.925,545.2357,229.7383),
(118913,14,3065.57,646.0688,229.7383);
DELETE FROM `creature` WHERE `guid`=93677;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(93677,27682,571,1,1,24743,0,3112.661,560.2861,197.5214,1.91463,120,0,0,38440,0,2);
DELETE FROM `creature_movement` WHERE `id` = 93677;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(93677,1,3166.947,533.783,197.5214),
(93677,2,3204.218,503.2988,197.5214),
(93677,3,3258.251,466.3165,197.5214),
(93677,4,3367.959,364.4092,197.5214),
(93677,5,3407.955,305.4363,197.5214),
(93677,6,3451.267,201.594,197.5214),
(93677,7,3508.874,166.8426,197.5214),
(93677,8,3633.496,151.127,197.5214),
(93677,9,3678.77,73.99848,197.5214),
(93677,10,3653.132,23.86263,197.5214),
(93677,11,3582.038,62.69965,197.5214),
(93677,12,3586.156,134.1242,197.5214),
(93677,13,3645.95,187.412,197.5214),
(93677,14,3699.768,345.5867,197.5214),
(93677,15,3755.733,466.6079,197.5214),
(93677,16,3695.944,599.8013,197.5214),
(93677,17,3631.838,570.2178,197.5214),
(93677,18,3620.732,470.3869,197.5214),
(93677,19,3653.033,441.836,197.5214),
(93677,20,3726.417,408.7439,197.5214),
(93677,21,3768.67,340.4243,197.5214),
(93677,22,3734.631,281.2856,197.5214),
(93677,23,3670.002,288.5108,197.5214),
(93677,24,3637.37,399.2112,197.5214),
(93677,25,3572.382,439.8372,197.5214),
(93677,26,3485.629,383.2211,197.5214),
(93677,27,3408.692,361.6136,197.5214),
(93677,28,3363.01,438.3368,197.5214),
(93677,29,3435.608,478.5367,197.5214),
(93677,30,3498.484,443.0669,197.5214),
(93677,31,3470.396,344.2875,197.5214),
(93677,32,3372.963,191.8817,197.5214),
(93677,33,3290.335,164.9094,197.5214),
(93677,34,3226.219,218.6132,197.5214),
(93677,35,3232.448,290.6222,197.5214),
(93677,36,3304.077,350.0902,197.5214),
(93677,37,3418.385,307.068,197.5214),
(93677,38,3440.642,196.0552,197.5214),
(93677,39,3388.76,137.5194,197.5214),
(93677,40,3299.691,166.3526,197.5214),
(93677,41,3197.989,286.0815,197.5214),
(93677,42,3124.057,342.0608,197.5214),
(93677,43,3029.794,412.821,197.5214),
(93677,44,3027.204,518.2308,197.5214),
(93677,45,3112.661,560.2861,197.5214);
DELETE FROM `creature` WHERE `guid`=118912;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118912,27682,571,1,1,24743,0,3040.376,545.7573,223.7107,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118912,1,3066.4,533.701,223.7107),
(118912,2,3184.873,458.7727,223.7107),
(118912,3,3308.346,361.982,223.7107),
(118912,4,3472.517,346.546,223.7107),
(118912,5,3580.564,383.8688,223.7107),
(118912,6,3656.45,349.4831,223.7107),
(118912,7,3671.57,291.0071,223.7107),
(118912,8,3637.499,197.3902,223.7107),
(118912,9,3527.828,157.279,223.7107),
(118912,10,3449.215,208.4113,223.7107),
(118912,11,3406.054,178.4773,223.7107),
(118912,12,3456.503,129.8825,223.7107),
(118912,13,3570.421,124.2369,223.7107),
(118912,14,3636.482,214.1168,223.7107),
(118912,15,3649.198,312.7206,223.7107),
(118912,16,3584.864,367.9254,223.7107),
(118912,17,3498.865,377.1867,223.7107),
(118912,18,3446.663,323.5181,223.7107),
(118912,19,3418.987,266.998,223.7107),
(118912,20,3325.219,278.7927,223.7107),
(118912,21,3246.293,325.4047,223.7107),
(118912,22,3136.991,394.2709,223.7107),
(118912,23,3057.987,457.7468,223.7107),
(118912,24,3007.479,511.7082,223.7107),
(118912,25,3012.345,538.7167,223.7107),
(118912,26,3040.376,545.7573,223.7107);
DELETE FROM `creature` WHERE `guid`=135349;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135349,27608,571,1,1,24140,0,3177.857,623.9463,234.0692,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135349,1,3062.52,435.5133,234.0692),
(135349,2,3125.572,288.5948,234.0692),
(135349,3,3411.13,158.2311,234.0692),
(135349,4,3681.013,161.0803,234.0692),
(135349,5,3815.275,311.0847,234.0692),
(135349,6,3773.807,472.041,234.0692),
(135349,7,3576.037,531.0521,234.0692),
(135349,8,3435.667,344.3725,234.0692),
(135349,9,3480.011,109.5501,234.0692),
(135349,10,3702.724,-30.66547,234.0692),
(135349,11,3889.816,54.52344,234.0692),
(135349,12,3914.841,319.0804,234.0692),
(135349,13,3695.273,610.4755,234.0692),
(135349,14,3389.431,691.5984,234.0692),
(135349,15,3177.857,623.9463,234.0692);
DELETE FROM `creature` WHERE `guid`=135345;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135345,27608,571,1,1,24140,0,2980.341,629.1049,218.5251,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135345,1,3128.300,641.3470,218.5251),
(135345,2,3231.236,534.2712,218.5251),
(135345,3,3229.198,417.0781,218.5251),
(135345,4,3131.435,332.9997,218.5251),
(135345,5,2990.912,336.3741,206.4763),
(135345,6,2871.583,422.1004,206.4763),
(135345,7,2881.663,578.8079,206.4763),
(135345,8,2980.341,629.1049,218.5251);
DELETE FROM `creature` WHERE `guid`=135342;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135342,27608,571,1,1,24140,0,3488.651,-5.619141,169.4104,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135342,1,3338.837,206.9924,169.4104),
(135342,2,3077.402,282.2865,169.4104),
(135342,3,2799.517,249.9982,169.4104),
(135342,4,2641.98,389.0734,169.4104),
(135342,5,2739.034,565.4708,169.4104),
(135342,6,3044.569,485.4482,169.4104),
(135342,7,3169.199,460.6385,169.4104),
(135342,8,3336.106,465.7545,169.4104),
(135342,9,3630.246,386.4513,169.4104),
(135342,10,3803.202,250.7272,169.4104),
(135342,11,3770.406,24.9643,169.4104),
(135342,12,3488.651,-5.619141,169.4104);
DELETE FROM `creature` WHERE `guid`=135341;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135341,27608,571,1,1,24140,0,3542.247,134.1484,169.6936,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135341,1,3506.288,141.7649,169.6936),
(135341,2,3378.177,251.381,169.6936),
(135341,3,3448.559,417.0887,169.6936),
(135341,4,3659.633,429.129,169.6936),
(135341,5,3726.806,236.8274,169.6936),
(135341,6,3554.261,69.58746,169.6936),
(135341,7,3337.373,175.2911,169.6936),
(135341,8,3292.872,421.84,169.6936),
(135341,9,3355.351,609.4697,169.6936),
(135341,10,3233.689,777.6954,207.249),
(135341,11,3049.014,721.6703,224.4991),
(135341,12,3044.268,566.5984,169.6936),
(135341,13,3142.397,481.2142,169.6936),
(135341,14,3328.336,435.8111,169.6936),
(135341,15,3583.232,539.7742,169.6936),
(135341,16,3799.81,460.638,169.6936),
(135341,17,3717.946,244.38,169.6936),
(135341,18,3542.247,134.1484,169.6936);
DELETE FROM `creature` WHERE `guid`=135340;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135340,27608,571,1,1,24140,0,3590.88,69.88932,149.1064,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135340,1,3349.674,233.3671,149.1064),
(135340,2,3050.534,331.2801,149.1064),
(135340,3,2982.76,530.9803,149.1064),
(135340,4,3091.488,621.5792,149.1064),
(135340,5,3227.927,595.5925,149.1064),
(135340,6,3467.181,481.7014,149.1064),
(135340,7,3708.623,396.748,149.1064),
(135340,8,3763.585,194.9491,149.1064),
(135340,9,3590.88,69.88932,149.1064);
DELETE FROM `creature` WHERE `guid`=135339;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135339,27608,571,1,1,24140,0,3424.549,257.6351,132.4231,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135339,1,3523.625,148.6501,132.4231),
(135339,2,3671.965,176.3331,132.4231),
(135339,3,3721.304,302.0294,132.4231),
(135339,4,3586.378,436.0151,132.4231),
(135339,5,3398.783,363.715,132.4231),
(135339,6,3201.002,184.2853,132.4231),
(135339,7,3033.273,261.4108,132.4231),
(135339,8,3020.73,417.366,132.4231),
(135339,9,3134.54,559.4572,132.4231),
(135339,10,3286.472,590.3685,132.4231),
(135339,11,3370.537,476.4369,132.4231),
(135339,12,3424.549,257.6351,132.4231);
DELETE FROM `creature` WHERE `guid`=135338;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135338,27608,571,1,1,24140,0,3485.543,172.4427,356.9669,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135338,1,3617.296,247.1156,357.3557),
(135338,2,3589.83,487.236,356.9669),
(135338,3,3417.021,598.9542,356.9669),
(135338,4,3230.356,615.1475,346.9949),
(135338,5,3061.912,567.3838,332.8835),
(135338,6,2990.214,429.7983,332.8835),
(135338,7,3203.85,198.3223,332.8835),
(135338,8,3485.543,172.4427,356.9669);
DELETE FROM `creature` WHERE `guid`=135336;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135336,27608,571,1,1,24140,0,3037.007,696.7842,221.9052,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135336,1,3232.783,646.5775,221.9052),
(135336,2,3397.601,486.7037,221.9052),
(135336,3,3619.899,375.7408,221.9052),
(135336,4,3828.234,403.8529,221.9052),
(135336,5,3950.75,272.4162,221.9052),
(135336,6,3930.549,80.84885,221.9052),
(135336,7,3731.407,15.2053,221.9052),
(135336,8,3520.57,124.0501,221.9052),
(135336,9,3319.81,205.5578,221.9052),
(135336,10,3141.857,364.067,221.9052),
(135336,11,3020.412,487.4164,211.0165),
(135336,12,2956.715,583.454,211.0165),
(135336,13,3037.007,696.7842,221.9052);
DELETE FROM `creature` WHERE `guid`=93669;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(93669,27608,571,1,1,24140,0,3723.934,203.8074,149.416,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(93669,1,3679.447,16.12554,149.416),
(93669,2,3507.391,-64.8457,149.416),
(93669,3,3313.535,24.35514,149.416),
(93669,4,3106.862,208.8542,149.416),
(93669,5,2972.297,312.9027,149.416),
(93669,6,2980.743,486.7836,149.416),
(93669,7,3066.302,566.5879,149.416),
(93669,8,3202.917,598.3837,149.416),
(93669,9,3404.993,515.3446,149.416),
(93669,10,3425.663,255.2629,149.416),
(93669,11,3211.951,114.9269,149.416),
(93669,12,3000.342,217.3278,149.416),
(93669,13,2963.022,422.1858,149.416),
(93669,14,3166.04,544.8924,149.416),
(93669,15,3358.634,487.4157,149.416),
(93669,16,3582.295,398.5222,149.416),
(93669,17,3723.934,203.8074,149.416);
DELETE FROM `creature` WHERE `guid`=93670;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(93670,27608,571,1,1,24140,0,3737.246,441.4471,163.1518,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(93670,1,3681.252,275.5609,163.1518),
(93670,2,3715.161,150.0893,163.1518),
(93670,3,3533.266,-10.55339,163.1518),
(93670,4,3173.073,184.9491,151.4297),
(93670,5,2936.554,340.61,144.8464),
(93670,6,2956.506,455.4837,133.5686),
(93670,7,3032.773,515.5552,122.4019),
(93670,8,3178.638,523.1923,126.2074),
(93670,9,3413.29,470.1859,126.2074),
(93670,10,3572.062,487.1479,144.1519),
(93670,11,3523.323,611.9957,144.1519),
(93670,12,3655.581,727.4493,168.9574),
(93670,13,3772.614,626.3416,163.1518),
(93670,14,3737.246,441.4471,163.1518);
DELETE FROM `creature` WHERE `guid`=93673;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(93673,27608,571,1,1,24140,0,3490.259,76.95345,197.2588,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(93673,1,3733.682,129.7717,197.2588),
(93673,2,3864.96,508.5689,197.2588),
(93673,3,3552.458,522.002,197.2588),
(93673,4,3285.309,616.7151,197.2588),
(93673,5,3036.671,572.0858,197.2588),
(93673,6,2932.137,492.1258,197.2588),
(93673,7,2908.21,365.3067,197.2588),
(93673,8,3001.178,249.2961,197.2588),
(93673,9,3292.851,156.1309,197.2588),
(93673,10,3490.259,76.95345,197.2588);
DELETE FROM `creature` WHERE `guid`=118911;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118911,27608,571,1,1,24140,0,3484.9,77.65061,181.4013,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118911,1,3231.553,144.962,181.4013),
(118911,2,3093.218,232.0598,181.4013),
(118911,3,3055.291,416.8134,181.4013),
(118911,4,3167.159,544.8934,181.4013),
(118911,5,3351.382,640.3859,181.4013),
(118911,6,3588.236,561.4211,181.4013),
(118911,7,3702.199,377.5353,181.4013),
(118911,8,3664.586,182.5018,181.4013),
(118911,9,3484.9,77.65061,181.4013);
DELETE FROM `creature` WHERE `guid`=118910;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118910,27608,571,1,1,24140,0,2938.209,403.6825,200.0642,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118910,1,3000.396,533.5293,200.0642),
(118910,2,3148.834,635.804,200.0642),
(118910,3,3307.068,630.108,200.0642),
(118910,4,3393.553,425.3046,200.0642),
(118910,5,3413.431,212.6353,200.0642),
(118910,6,3566.631,98.43479,200.0642),
(118910,7,3729.045,218.3996,200.0642),
(118910,8,3698.444,417.5869,200.0642),
(118910,9,3524.363,494.4065,200.0642),
(118910,10,3335.302,374.7052,200.0642),
(118910,11,3255.138,189.5002,200.0642),
(118910,12,3111.794,148.6386,200.0642),
(118910,13,2979.718,214.2472,200.0642),
(118910,14,2938.209,403.6825,200.0642);
DELETE FROM `creature` WHERE `guid`=118909;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118909,27608,571,1,1,24140,0,3756.611,216.3398,142.0742,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118909,1,3746.663,468.0216,142.0742),
(118909,2,3489.741,512.316,142.0742),
(118909,3,3277.682,558.9236,142.0742),
(118909,4,3152.218,477.8159,142.0742),
(118909,5,3082.888,432.7688,142.0742),
(118909,6,3016.838,481.925,142.0742),
(118909,7,3033.647,560.426,142.0742),
(118909,8,3162.152,562.8186,142.0742),
(118909,9,3240.709,468.0213,142.0742),
(118909,10,3371.026,259.9583,142.0742),
(118909,11,3535.323,122.4076,142.0742),
(118909,12,3756.611,216.3398,142.0742);
DELETE FROM `creature` WHERE `guid`=135335;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135335,27682,571,1,1,24743,0,3433.348,274.121,192.7347,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135335,1,3441.997,218.066,169.347),
(135335,2,3495.446,178.1635,169.347),
(135335,3,3562.124,172.6228,169.347),
(135335,4,3645.859,193.9786,169.347),
(135335,5,3689.068,295.8872,169.347),
(135335,6,3624.446,375.1689,169.347),
(135335,7,3510.095,372.0045,169.347),
(135335,8,3446.488,300.4381,169.347),
(135335,9,3420.008,195.1058,169.347),
(135335,10,3474.376,103.4208,169.347),
(135335,11,3587.787,78.41341,169.347),
(135335,12,3680.552,168.1343,169.347),
(135335,13,3682.222,340.8562,169.347),
(135335,14,3563.545,458.4753,169.347),
(135335,15,3452.104,480.9653,169.347),
(135335,16,3344.437,382.5979,169.347),
(135335,17,3232.114,340.6778,169.347),
(135335,18,3127.326,347.8484,169.347),
(135335,19,3027.017,384.9972,169.347),
(135335,20,2989.474,458.5701,169.347),
(135335,21,3013.37,539.2202,169.347),
(135335,22,3066.603,566.7353,169.347),
(135335,23,3134.078,551.7691,169.347),
(135335,24,3244.26,486.8306,169.347),
(135335,25,3327.64,383.2903,169.347),
(135335,26,3382.149,279.6307,169.347);
DELETE FROM `creature` WHERE `guid`=135334;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135334,27682,571,1,1,24743,0,3434.632,268.5218,212.5722,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135334,1,3449.962,350.2704,185.3083),
(135334,2,3546.571,399.454,185.3083),
(135334,3,3649.095,344.2626,185.3083),
(135334,4,3648.6,203.3825,185.3083),
(135334,5,3557.447,156.6613,185.3083),
(135334,6,3438.763,197.2433,185.3083),
(135334,7,3364.301,251.3537,185.3083),
(135334,8,3245.05,295.2606,185.3083),
(135334,9,3127.677,330.6631,185.3083),
(135334,10,3045.42,426.6257,185.3083),
(135334,11,3033.423,500.1823,185.3083),
(135334,12,3074.555,584.5701,185.3083),
(135334,13,3167.413,579.3245,185.3083),
(135334,14,3254.766,477.3121,185.3083),
(135334,15,3328.997,355.7176,185.3083),
(135334,16,3403.051,340.1719,185.3083),
(135334,17,3446.086,384.896,185.3083),
(135334,18,3503.323,407.0888,185.3083),
(135334,19,3593.65,392.4026,185.3083),
(135334,20,3658.26,283.8229,185.3083),
(135334,21,3604.809,176.3996,185.3083),
(135334,22,3500.686,159.6379,185.3083),
(135334,23,3441.441,249.5543,185.3083);
DELETE FROM `creature` WHERE `guid`=135333;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135333,27682,571,1,1,24743,0,3419.562,219.4669,185.8007,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135333,1,3476.15,177.9767,151.9461),
(135333,2,3545.193,113.4851,151.9461),
(135333,3,3639.261,157.7231,151.9461),
(135333,4,3676.142,330.9362,151.9461),
(135333,5,3568.025,452.4464,151.9461),
(135333,6,3440.924,381.5191,151.9461),
(135333,7,3406.76,247.0661,151.9461),
(135333,8,3489.703,142.3122,151.9461),
(135333,9,3573.337,130.2329,151.9461),
(135333,10,3668.767,202.5275,151.9461),
(135333,11,3660.667,365.0258,151.9461),
(135333,12,3546.228,441.4885,151.9461),
(135333,13,3414.354,479.1683,151.9461),
(135333,14,3298.711,513.6075,151.9461),
(135333,15,3152.929,563.3295,151.9461),
(135333,16,3061.01,598.1893,151.9461),
(135333,17,3028.564,548.2512,151.9461),
(135333,18,3066.851,499.9897,151.9461),
(135333,19,3126.102,457.3964,151.9461),
(135333,20,3209.258,379.5157,151.9461),
(135333,21,3290.067,313.6936,151.9461),
(135333,22,3381.995,245.4414,151.9461);
DELETE FROM `creature` WHERE `guid`=135332;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135332,27682,571,1,1,24743,0,3431.814,203.5959,199.4538,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135332,1,3469.755,211.1012,252.1057),
(135332,2,3543.436,184.6182,282.9112),
(135332,3,3605.144,211.1016,313.2445),
(135332,4,3629.088,281.4026,342.355),
(135332,5,3586.889,335.8259,342.355),
(135332,6,3534.959,340.7828,342.355),
(135332,7,3488.181,299.2897,342.355),
(135332,8,3490.962,242.9244,342.355),
(135332,9,3544.176,216.1916,342.355),
(135332,10,3607.393,238.2059,342.355),
(135332,11,3606.415,315.159,342.355),
(135332,12,3529.92,347.5442,342.355),
(135332,13,3442.581,379.9305,309.9662),
(135332,14,3363.314,409.6005,272.7996),
(135332,15,3271.624,451.7768,231.7996),
(135332,16,3222.875,508.5536,210.5774),
(135332,17,3178.339,552.9731,195.4663),
(135332,18,3119.579,592.5015,182.2996),
(135332,19,3079.527,558.9856,175.383),
(135332,20,3110.969,495.2063,173.9941),
(135332,21,3133.366,466.6834,176.5779),
(135332,22,3236.847,383.9943,176.5779),
(135332,23,3382.743,269.2179,222.0501);
DELETE FROM `creature` WHERE `guid`=135331;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135331,27682,571,1,1,24743,0,3408.915,276.3928,180.561,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135331,1,3451.428,175.6206,154.7629),
(135331,2,3461.289,67.8521,154.7629),
(135331,3,3401.216,31.08062,154.7629),
(135331,4,3348.744,62.37424,154.7629),
(135331,5,3352.888,148.2122,154.7629),
(135331,6,3405.2,335.0623,154.7629),
(135331,7,3399.393,397.5138,154.7629),
(135331,8,3346.986,426.0631,154.7629),
(135331,9,3262.085,383.6502,154.7629),
(135331,10,3156.926,352.7438,154.7629),
(135331,11,3057.544,393.0464,154.7629),
(135331,12,3000.647,466.7132,154.7629),
(135331,13,2989.147,516.5572,154.7629),
(135331,14,3049.945,587.7933,154.7629),
(135331,15,3160.802,556.4007,154.7629),
(135331,16,3268.329,422.1047,154.7629);
DELETE FROM `creature` WHERE `guid`=135329;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135329,27682,571,1,1,24743,0,3748.954,236.7544,178.6408,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135329,1,3712.221,418.183,178.6408),
(135329,2,3540.502,499.2345,178.6408),
(135329,3,3358.373,445.1452,178.6408),
(135329,4,3200.13,472.7363,178.6408),
(135329,5,3101.38,584.3835,178.6408),
(135329,6,3040.255,596.7429,178.6408),
(135329,7,2997.37,550.3453,178.6408),
(135329,8,2999.847,500.0373,178.6408),
(135329,9,3048.254,460.723,178.6408),
(135329,10,3140.818,390.9225,178.6408),
(135329,11,3219.294,333.4928,178.6408),
(135329,12,3318.04,264.8529,178.6408),
(135329,13,3436.765,193.0778,178.6408),
(135329,14,3552.843,154.3912,178.6408),
(135329,15,3668.381,197.8079,178.6408),
(135329,16,3711.96,284.6768,178.6408),
(135329,17,3627.375,410.4442,178.6408),
(135329,18,3466.029,404.0347,178.6408),
(135329,19,3375.764,293.2045,178.6408),
(135329,20,3426.16,142.911,178.6408),
(135329,21,3611.036,90.26421,178.6408),
(135329,22,3748.954,236.7544,178.6408);
DELETE FROM `creature` WHERE `guid`=129934;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(129934,27682,571,1,1,24743,0,3412.463,216.0972,212.123,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(129934,1,3412.65,215.8015,241.2928),
(129934,2,3544.712,83.40093,241.2928),
(129934,3,3729.527,148.4322,241.2928),
(129934,4,3770.91,456.7697,241.2928),
(129934,5,3592.973,601.0773,241.2928),
(129934,6,3431.349,566.7643,241.2928),
(129934,7,3298.04,548.691,241.2928),
(129934,8,3180.431,663.6898,241.2928),
(129934,9,3069.867,677.9128,241.2928),
(129934,10,2984.272,605.6987,241.2928),
(129934,11,3000.096,533.4483,241.2928),
(129934,12,3144.4,405.446,241.2928),
(129934,13,3301.554,308.331,241.2928);
DELETE FROM `creature` WHERE `guid`=129933;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(129933,27682,571,1,1,24743,0,3100.95,567.1441,118.4118,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(129933,1,3100.912,567.1385,122.3331),
(129933,2,3214.064,524.5076,122.3331),
(129933,3,3307.77,498.1685,122.3331),
(129933,4,3399.335,473.5195,122.3331),
(129933,5,3545.675,446.1954,122.3331),
(129933,6,3631.807,357.087,122.3331),
(129933,7,3640.708,229.0423,122.3331),
(129933,8,3616.36,137.7545,122.3331),
(129933,9,3558.458,113.3069,122.3331),
(129933,10,3457.288,142.8311,122.3331),
(129933,11,3387.124,248.1035,122.3331),
(129933,12,3419.464,398.1638,122.3331),
(129933,13,3366.308,507.4259,122.3331),
(129933,14,3243.456,494.2254,122.3331),
(129933,15,3121.018,428.1757,122.3331),
(129933,16,3003.428,487.8239,122.3331),
(129933,17,3001.53,566.4896,122.3331),
(129933,18,3059.883,577.261,122.3331);
DELETE FROM `creature` WHERE `guid` IN (129815,129899);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(129815,27682,571,1,1,24743,0,2954.845,625.8646,146.2928,2.094395,120,0,0,38440,0,0),
(129899,27682,571,1,1,24743,0,3256.357,585.8403,136.8419,0.4363323,120,0,0,38440,0,0);
DELETE FROM `creature` WHERE `guid`=129289;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(129289,27682,571,1,1,24743,0,3017.465,301.0079,204.943,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(129289,1,3014.38,371.552,204.943),
(129289,2,3066.132,433.5229,204.943),
(129289,3,3168.017,532.116,204.943),
(129289,4,3341.228,644.3932,204.943),
(129289,5,3480.533,600.2273,204.943),
(129289,6,3485.514,465.1431,204.943),
(129289,7,3362.191,369.4394,204.943),
(129289,8,3193.452,330.4968,204.943),
(129289,9,3117.152,256.1553,204.943),
(129289,10,3017.465,301.0079,204.943);
DELETE FROM `creature` WHERE `guid`=129288;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(129288,27682,571,1,1,24743,0,3138.133,520.6823,53.44044,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(129288,1,3120.694,487.4651,73.32948),
(129288,2,3094.569,488.8283,89.30162),
(129288,3,3076.394,504.3694,101.9128),
(129288,4,3073.121,536.1434,118.3021),
(129288,5,3100.686,550.8791,135.0522),
(129288,6,3133.567,533.2503,156.4133),
(129288,7,3128.940,498.2000,185.3022),
(129288,8,3104.875,485.1591,211.9410),
(129288,9,3078.965,493.2044,233.2187),
(129288,10,3077.378,529.8601,246.1916),
(129288,11,3104.640,532.739,246.1916),
(129288,12,3124.398,511.3354,246.1916),
(129288,13,3106.461,485.7477,246.1916),
(129288,14,3074.75,501.1113,246.1916),
(129288,15,3080.605,533.5042,222.6366),
(129288,16,3108.456,548.174,194.8869),
(129288,17,3138.865,510.0685,159.4426),
(129288,18,3107.084,484.058,121.3038),
(129288,19,3066.059,511.5332,94.97042),
(129288,20,3084.679,555.8902,74.52598),
(129288,21,3128.865,543.4575,51.55369),
(129288,22,3132.671,497.0408,51.55369),
(129288,23,3083.713,484.3025,51.55369),
(129288,24,3062.465,530.1815,51.55369),
(129288,25,3100.407,561.9063,51.55369),
(129288,26,3138.133,520.6823,53.44044); 
DELETE FROM `creature` WHERE `guid`=129287;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(129287,27682,571,1,1,24743,0,3199.019,490.8836,212.5729,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(129287,1,3131.874,451.6094,212.5729),
(129287,2,3066.175,466.9917,212.5729),
(129287,3,3015.529,515.9183,212.5729),
(129287,4,3032.398,624.4706,212.5729),
(129287,5,3123.448,648.5508,212.5729),
(129287,6,3201.826,572.715,212.5729),
(129287,7,3199.019,490.8836,212.5729);
DELETE FROM `creature` WHERE `guid`=82482;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(82482,27682,571,1,1,24743,0,3214.422,579.9131,196.0033,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(82482,1,3133.856,625.1009,196.0033),
(82482,2,3066.991,599.8026,196.0033),
(82482,3,3045.829,536.076,196.0033),
(82482,4,3064.8,436.205,196.0033),
(82482,5,3149.34,424.2586,196.0033),
(82482,6,3217.921,481.3083,196.0033),
(82482,7,3214.422,579.9131,196.0033);
DELETE FROM `creature` WHERE `guid`=93671;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(93671,27682,571,1,1,24743,0,3639.789,321.911,195.744,1.91463,120,0,0,38440,0,2);
DELETE FROM `creature_movement` WHERE `id` = 93671;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(93671,1,3654.995,228.2284,204.7075),
(93671,2,3750.065,190.3719,204.7075),
(93671,3,3793.781,239.5784,204.7075),
(93671,4,3793.007,322.9862,204.7075),
(93671,5,3712.435,337.7213,204.7075),
(93671,6,3649.212,273.7653,204.7075),
(93671,7,3627.809,181.2728,204.7075),
(93671,8,3575.202,116.1518,204.7075),
(93671,9,3452.9,157.833,204.7075),
(93671,10,3395.156,279.1096,204.7075),
(93671,11,3459.034,403.4866,204.7075),
(93671,12,3610.543,437.9186,204.7075),
(93671,13,3715.638,355.6098,204.7075),
(93671,14,3721.246,203.5534,204.7075),
(93671,15,3583.16,147.8227,204.7075),
(93671,16,3467.958,184.451,204.7075),
(93671,17,3341.041,241.3563,204.7075),
(93671,18,3259.652,326.3573,204.7075),
(93671,19,3325.962,453.1619,204.7075),
(93671,20,3430.271,470.1731,204.7075),
(93671,21,3474.818,389.2108,204.7075),
(93671,22,3422.128,277.9353,204.7075),
(93671,23,3278.513,235.3488,204.7075),
(93671,24,3139.333,309.1593,204.7075),
(93671,25,3124.315,442.8726,204.7075),
(93671,26,3166.636,500.1602,204.7075),
(93671,27,3252.777,537.1607,204.7075),
(93671,28,3365.404,500.6408,204.7075),
(93671,29,3497.347,437.8124,204.7075),
(93671,30,3610.069,345.1742,204.7075);
DELETE FROM `creature` WHERE `guid`=118916;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118916,27682,571,1,1,24743,0,3106.429,348.3322,212.4711,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118916,1,3184.002,431.2766,212.4711),
(118916,2,3166.134,532.8875,212.4711),
(118916,3,3080.641,574.7059,212.4711),
(118916,4,2963.504,564.834,212.4711),
(118916,5,2918.588,502.0504,212.4711),
(118916,6,2949.235,405.6514,212.4711),
(118916,7,3106.429,348.3322,212.4711);
DELETE FROM `creature` WHERE `guid`=118915;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118915,27682,571,1,1,24743,0,3129.027,582.4556,247.3863,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118915,1,3188.686,528.622,247.3863),
(118915,2,3166.479,466.4643,247.3863),
(118915,3,3107.782,429.4197,247.3863),
(118915,4,3030.916,459.3344,247.3863),
(118915,5,3014.312,531.3731,247.3863),
(118915,6,3058.55,581.8262,247.3863),
(118915,7,3129.027,582.4556,247.3863);
DELETE FROM `creature` WHERE `guid`=118914;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118914,27682,571,1,1,24743,0,3691.676,352.0933,342.2254,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118914,1,3662.692,328.2304,338.4197),
(118914,2,3648.806,293.8063,321.0587),
(118914,3,3677.441,213.8859,320.1976),
(118914,4,3615.31,209.5691,324.1698),
(118914,5,3637.643,254.0089,332.7251),
(118914,6,3699.886,260.6509,327.8641),
(118914,7,3720.373,308.941,337.7808),
(118914,8,3691.676,352.0933,342.2254);
DELETE FROM `creature` WHERE `guid`=93678;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(93678,27682,571,1,1,24743,0,3036.494,602.2036,179.671,1.91463,120,0,0,38440,0,2);
DELETE FROM `creature_movement` WHERE `id` = 93678;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(93678,1,3100.145,600.0773,179.671),
(93678,2,3230.972,531.9783,179.671),
(93678,3,3261.28,445.4492,179.671),
(93678,4,3185.334,349.6381,179.671),
(93678,5,3031.361,375.153,179.671),
(93678,6,2951.565,490.5297,179.671),
(93678,7,3006.273,602.823,179.671),
(93678,8,3140.882,604.8052,179.671),
(93678,9,3279.177,536.7864,179.671),
(93678,10,3342.035,451.1805,179.671),
(93678,11,3373.871,409.5802,179.671),
(93678,12,3418.399,323.2935,179.671),
(93678,13,3432.266,253.5685,179.671),
(93678,14,3376.006,177.8496,179.671),
(93678,15,3328.437,226.3789,179.671),
(93678,16,3336.244,307.4113,179.671),
(93678,17,3381.182,333.7066,179.671),
(93678,18,3478.52,398.1222,179.671),
(93678,19,3574.011,383.5956,179.671),
(93678,20,3661.792,400.2125,179.671),
(93678,21,3700.764,494.1714,179.671),
(93678,22,3602.784,552.9866,179.671),
(93678,23,3539.342,521.9033,179.671),
(93678,24,3523.356,456.0128,179.671),
(93678,25,3618.041,362.6289,179.671),
(93678,26,3723.684,327.7586,179.671),
(93678,27,3773.446,249.6754,179.671),
(93678,28,3749.611,152.5128,179.671),
(93678,29,3695.312,141.0493,179.671),
(93678,30,3651.431,217.0924,179.671),
(93678,31,3683.438,319.0038,179.671),
(93678,32,3748.601,338.1269,179.671),
(93678,33,3792.042,245.4839,179.671),
(93678,34,3735.548,180.4323,179.671),
(93678,35,3618.281,171.1228,179.671),
(93678,36,3474.684,137.1242,179.671),
(93678,37,3479.782,49.90799,179.671),
(93678,38,3558.278,30.76975,179.671),
(93678,39,3629.689,60.77876,179.671),
(93678,40,3630.145,127.0798,179.671),
(93678,41,3490.695,175.1472,179.671),
(93678,42,3366.718,224.9415,179.671),
(93678,43,3212.591,294.8876,179.671),
(93678,44,3076.071,364.5977,179.671),
(93678,45,2990.75,457.3708,179.671),
(93678,46,2984.907,530.0489,179.671),
(93678,47,3036.494,602.2036,179.671);
DELETE FROM `creature` WHERE `guid`=118913;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118913,27682,571,1,1,24743,0,3065.57,646.0688,229.7383,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118913,1,3133.651,599.4818,229.7383),
(118913,2,3196.173,510.7455,229.7383),
(118913,3,3310.401,346.2189,229.7383),
(118913,4,3407.27,144.2138,229.7383),
(118913,5,3526.717,72.89225,229.7383),
(118913,6,3672.079,141.219,229.7383),
(118913,7,3713.506,314.0188,229.7383),
(118913,8,3602.6,431.6985,229.7383),
(118913,9,3408.532,364.4567,229.7383),
(118913,10,3217.656,309.1964,229.7383),
(118913,11,3061.193,324.0175,229.7383),
(118913,12,2959.836,412.4154,229.7383),
(118913,13,2945.925,545.2357,229.7383),
(118913,14,3065.57,646.0688,229.7383);
DELETE FROM `creature` WHERE `guid`=93677;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(93677,27682,571,1,1,24743,0,3112.661,560.2861,197.5214,1.91463,120,0,0,38440,0,2);
DELETE FROM `creature_movement` WHERE `id` = 93677;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(93677,1,3166.947,533.783,197.5214),
(93677,2,3204.218,503.2988,197.5214),
(93677,3,3258.251,466.3165,197.5214),
(93677,4,3367.959,364.4092,197.5214),
(93677,5,3407.955,305.4363,197.5214),
(93677,6,3451.267,201.594,197.5214),
(93677,7,3508.874,166.8426,197.5214),
(93677,8,3633.496,151.127,197.5214),
(93677,9,3678.77,73.99848,197.5214),
(93677,10,3653.132,23.86263,197.5214),
(93677,11,3582.038,62.69965,197.5214),
(93677,12,3586.156,134.1242,197.5214),
(93677,13,3645.95,187.412,197.5214),
(93677,14,3699.768,345.5867,197.5214),
(93677,15,3755.733,466.6079,197.5214),
(93677,16,3695.944,599.8013,197.5214),
(93677,17,3631.838,570.2178,197.5214),
(93677,18,3620.732,470.3869,197.5214),
(93677,19,3653.033,441.836,197.5214),
(93677,20,3726.417,408.7439,197.5214),
(93677,21,3768.67,340.4243,197.5214),
(93677,22,3734.631,281.2856,197.5214),
(93677,23,3670.002,288.5108,197.5214),
(93677,24,3637.37,399.2112,197.5214),
(93677,25,3572.382,439.8372,197.5214),
(93677,26,3485.629,383.2211,197.5214),
(93677,27,3408.692,361.6136,197.5214),
(93677,28,3363.01,438.3368,197.5214),
(93677,29,3435.608,478.5367,197.5214),
(93677,30,3498.484,443.0669,197.5214),
(93677,31,3470.396,344.2875,197.5214),
(93677,32,3372.963,191.8817,197.5214),
(93677,33,3290.335,164.9094,197.5214),
(93677,34,3226.219,218.6132,197.5214),
(93677,35,3232.448,290.6222,197.5214),
(93677,36,3304.077,350.0902,197.5214),
(93677,37,3418.385,307.068,197.5214),
(93677,38,3440.642,196.0552,197.5214),
(93677,39,3388.76,137.5194,197.5214),
(93677,40,3299.691,166.3526,197.5214),
(93677,41,3197.989,286.0815,197.5214),
(93677,42,3124.057,342.0608,197.5214),
(93677,43,3029.794,412.821,197.5214),
(93677,44,3027.204,518.2308,197.5214),
(93677,45,3112.661,560.2861,197.5214);
DELETE FROM `creature` WHERE `guid`=118912;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118912,27682,571,1,1,24743,0,3040.376,545.7573,223.7107,1.91463,120,0,0,38440,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118912,1,3066.4,533.701,223.7107),
(118912,2,3184.873,458.7727,223.7107),
(118912,3,3308.346,361.982,223.7107),
(118912,4,3472.517,346.546,223.7107),
(118912,5,3580.564,383.8688,223.7107),
(118912,6,3656.45,349.4831,223.7107),
(118912,7,3671.57,291.0071,223.7107),
(118912,8,3637.499,197.3902,223.7107),
(118912,9,3527.828,157.279,223.7107),
(118912,10,3449.215,208.4113,223.7107),
(118912,11,3406.054,178.4773,223.7107),
(118912,12,3456.503,129.8825,223.7107),
(118912,13,3570.421,124.2369,223.7107),
(118912,14,3636.482,214.1168,223.7107),
(118912,15,3649.198,312.7206,223.7107),
(118912,16,3584.864,367.9254,223.7107),
(118912,17,3498.865,377.1867,223.7107),
(118912,18,3446.663,323.5181,223.7107),
(118912,19,3418.987,266.998,223.7107),
(118912,20,3325.219,278.7927,223.7107),
(118912,21,3246.293,325.4047,223.7107),
(118912,22,3136.991,394.2709,223.7107),
(118912,23,3057.987,457.7468,223.7107),
(118912,24,3007.479,511.7082,223.7107),
(118912,25,3012.345,538.7167,223.7107),
(118912,26,3040.376,545.7573,223.7107);
DELETE FROM `creature` WHERE `guid`=135349;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135349,27608,571,1,1,24140,0,3177.857,623.9463,234.0692,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135349,1,3062.52,435.5133,234.0692),
(135349,2,3125.572,288.5948,234.0692),
(135349,3,3411.13,158.2311,234.0692),
(135349,4,3681.013,161.0803,234.0692),
(135349,5,3815.275,311.0847,234.0692),
(135349,6,3773.807,472.041,234.0692),
(135349,7,3576.037,531.0521,234.0692),
(135349,8,3435.667,344.3725,234.0692),
(135349,9,3480.011,109.5501,234.0692),
(135349,10,3702.724,-30.66547,234.0692),
(135349,11,3889.816,54.52344,234.0692),
(135349,12,3914.841,319.0804,234.0692),
(135349,13,3695.273,610.4755,234.0692),
(135349,14,3389.431,691.5984,234.0692),
(135349,15,3177.857,623.9463,234.0692);
DELETE FROM `creature` WHERE `guid`=135345;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135345,27608,571,1,1,24140,0,2980.341,629.1049,218.5251,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135345,1,3128.300,641.3470,218.5251),
(135345,2,3231.236,534.2712,218.5251),
(135345,3,3229.198,417.0781,218.5251),
(135345,4,3131.435,332.9997,218.5251),
(135345,5,2990.912,336.3741,206.4763),
(135345,6,2871.583,422.1004,206.4763),
(135345,7,2881.663,578.8079,206.4763),
(135345,8,2980.341,629.1049,218.5251);
DELETE FROM `creature` WHERE `guid`=135342;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135342,27608,571,1,1,24140,0,3488.651,-5.619141,169.4104,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135342,1,3338.837,206.9924,169.4104),
(135342,2,3077.402,282.2865,169.4104),
(135342,3,2799.517,249.9982,169.4104),
(135342,4,2641.98,389.0734,169.4104),
(135342,5,2739.034,565.4708,169.4104),
(135342,6,3044.569,485.4482,169.4104),
(135342,7,3169.199,460.6385,169.4104),
(135342,8,3336.106,465.7545,169.4104),
(135342,9,3630.246,386.4513,169.4104),
(135342,10,3803.202,250.7272,169.4104),
(135342,11,3770.406,24.9643,169.4104),
(135342,12,3488.651,-5.619141,169.4104);
DELETE FROM `creature` WHERE `guid`=135341;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135341,27608,571,1,1,24140,0,3542.247,134.1484,169.6936,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135341,1,3506.288,141.7649,169.6936),
(135341,2,3378.177,251.381,169.6936),
(135341,3,3448.559,417.0887,169.6936),
(135341,4,3659.633,429.129,169.6936),
(135341,5,3726.806,236.8274,169.6936),
(135341,6,3554.261,69.58746,169.6936),
(135341,7,3337.373,175.2911,169.6936),
(135341,8,3292.872,421.84,169.6936),
(135341,9,3355.351,609.4697,169.6936),
(135341,10,3233.689,777.6954,207.249),
(135341,11,3049.014,721.6703,224.4991),
(135341,12,3044.268,566.5984,169.6936),
(135341,13,3142.397,481.2142,169.6936),
(135341,14,3328.336,435.8111,169.6936),
(135341,15,3583.232,539.7742,169.6936),
(135341,16,3799.81,460.638,169.6936),
(135341,17,3717.946,244.38,169.6936),
(135341,18,3542.247,134.1484,169.6936);
DELETE FROM `creature` WHERE `guid`=135340;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135340,27608,571,1,1,24140,0,3590.88,69.88932,149.1064,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135340,1,3349.674,233.3671,149.1064),
(135340,2,3050.534,331.2801,149.1064),
(135340,3,2982.76,530.9803,149.1064),
(135340,4,3091.488,621.5792,149.1064),
(135340,5,3227.927,595.5925,149.1064),
(135340,6,3467.181,481.7014,149.1064),
(135340,7,3708.623,396.748,149.1064),
(135340,8,3763.585,194.9491,149.1064),
(135340,9,3590.88,69.88932,149.1064);
DELETE FROM `creature` WHERE `guid`=135339;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135339,27608,571,1,1,24140,0,3424.549,257.6351,132.4231,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135339,1,3523.625,148.6501,132.4231),
(135339,2,3671.965,176.3331,132.4231),
(135339,3,3721.304,302.0294,132.4231),
(135339,4,3586.378,436.0151,132.4231),
(135339,5,3398.783,363.715,132.4231),
(135339,6,3201.002,184.2853,132.4231),
(135339,7,3033.273,261.4108,132.4231),
(135339,8,3020.73,417.366,132.4231),
(135339,9,3134.54,559.4572,132.4231),
(135339,10,3286.472,590.3685,132.4231),
(135339,11,3370.537,476.4369,132.4231),
(135339,12,3424.549,257.6351,132.4231);
DELETE FROM `creature` WHERE `guid`=135338;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135338,27608,571,1,1,24140,0,3485.543,172.4427,356.9669,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135338,1,3617.296,247.1156,357.3557),
(135338,2,3589.83,487.236,356.9669),
(135338,3,3417.021,598.9542,356.9669),
(135338,4,3230.356,615.1475,346.9949),
(135338,5,3061.912,567.3838,332.8835),
(135338,6,2990.214,429.7983,332.8835),
(135338,7,3203.85,198.3223,332.8835),
(135338,8,3485.543,172.4427,356.9669);
DELETE FROM `creature` WHERE `guid`=135336;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135336,27608,571,1,1,24140,0,3037.007,696.7842,221.9052,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135336,1,3232.783,646.5775,221.9052),
(135336,2,3397.601,486.7037,221.9052),
(135336,3,3619.899,375.7408,221.9052),
(135336,4,3828.234,403.8529,221.9052),
(135336,5,3950.75,272.4162,221.9052),
(135336,6,3930.549,80.84885,221.9052),
(135336,7,3731.407,15.2053,221.9052),
(135336,8,3520.57,124.0501,221.9052),
(135336,9,3319.81,205.5578,221.9052),
(135336,10,3141.857,364.067,221.9052),
(135336,11,3020.412,487.4164,211.0165),
(135336,12,2956.715,583.454,211.0165),
(135336,13,3037.007,696.7842,221.9052);
DELETE FROM `creature` WHERE `guid`=93669;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(93669,27608,571,1,1,24140,0,3723.934,203.8074,149.416,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(93669,1,3679.447,16.12554,149.416),
(93669,2,3507.391,-64.8457,149.416),
(93669,3,3313.535,24.35514,149.416),
(93669,4,3106.862,208.8542,149.416),
(93669,5,2972.297,312.9027,149.416),
(93669,6,2980.743,486.7836,149.416),
(93669,7,3066.302,566.5879,149.416),
(93669,8,3202.917,598.3837,149.416),
(93669,9,3404.993,515.3446,149.416),
(93669,10,3425.663,255.2629,149.416),
(93669,11,3211.951,114.9269,149.416),
(93669,12,3000.342,217.3278,149.416),
(93669,13,2963.022,422.1858,149.416),
(93669,14,3166.04,544.8924,149.416),
(93669,15,3358.634,487.4157,149.416),
(93669,16,3582.295,398.5222,149.416),
(93669,17,3723.934,203.8074,149.416);
DELETE FROM `creature` WHERE `guid`=93670;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(93670,27608,571,1,1,24140,0,3737.246,441.4471,163.1518,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(93670,1,3681.252,275.5609,163.1518),
(93670,2,3715.161,150.0893,163.1518),
(93670,3,3533.266,-10.55339,163.1518),
(93670,4,3173.073,184.9491,151.4297),
(93670,5,2936.554,340.61,144.8464),
(93670,6,2956.506,455.4837,133.5686),
(93670,7,3032.773,515.5552,122.4019),
(93670,8,3178.638,523.1923,126.2074),
(93670,9,3413.29,470.1859,126.2074),
(93670,10,3572.062,487.1479,144.1519),
(93670,11,3523.323,611.9957,144.1519),
(93670,12,3655.581,727.4493,168.9574),
(93670,13,3772.614,626.3416,163.1518),
(93670,14,3737.246,441.4471,163.1518);
DELETE FROM `creature` WHERE `guid`=93673;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(93673,27608,571,1,1,24140,0,3490.259,76.95345,197.2588,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(93673,1,3733.682,129.7717,197.2588),
(93673,2,3864.96,508.5689,197.2588),
(93673,3,3552.458,522.002,197.2588),
(93673,4,3285.309,616.7151,197.2588),
(93673,5,3036.671,572.0858,197.2588),
(93673,6,2932.137,492.1258,197.2588),
(93673,7,2908.21,365.3067,197.2588),
(93673,8,3001.178,249.2961,197.2588),
(93673,9,3292.851,156.1309,197.2588),
(93673,10,3490.259,76.95345,197.2588);
DELETE FROM `creature` WHERE `guid`=118911;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118911,27608,571,1,1,24140,0,3484.9,77.65061,181.4013,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118911,1,3231.553,144.962,181.4013),
(118911,2,3093.218,232.0598,181.4013),
(118911,3,3055.291,416.8134,181.4013),
(118911,4,3167.159,544.8934,181.4013),
(118911,5,3351.382,640.3859,181.4013),
(118911,6,3588.236,561.4211,181.4013),
(118911,7,3702.199,377.5353,181.4013),
(118911,8,3664.586,182.5018,181.4013),
(118911,9,3484.9,77.65061,181.4013);
DELETE FROM `creature` WHERE `guid`=118910;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118910,27608,571,1,1,24140,0,2938.209,403.6825,200.0642,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118910,1,3000.396,533.5293,200.0642),
(118910,2,3148.834,635.804,200.0642),
(118910,3,3307.068,630.108,200.0642),
(118910,4,3393.553,425.3046,200.0642),
(118910,5,3413.431,212.6353,200.0642),
(118910,6,3566.631,98.43479,200.0642),
(118910,7,3729.045,218.3996,200.0642),
(118910,8,3698.444,417.5869,200.0642),
(118910,9,3524.363,494.4065,200.0642),
(118910,10,3335.302,374.7052,200.0642),
(118910,11,3255.138,189.5002,200.0642),
(118910,12,3111.794,148.6386,200.0642),
(118910,13,2979.718,214.2472,200.0642),
(118910,14,2938.209,403.6825,200.0642);
DELETE FROM `creature` WHERE `guid`=118909;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(118909,27608,571,1,1,24140,0,3756.611,216.3398,142.0742,1.91463,120,0,0,92538,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(118909,1,3746.663,468.0216,142.0742),
(118909,2,3489.741,512.316,142.0742),
(118909,3,3277.682,558.9236,142.0742),
(118909,4,3152.218,477.8159,142.0742),
(118909,5,3082.888,432.7688,142.0742),
(118909,6,3016.838,481.925,142.0742),
(118909,7,3033.647,560.426,142.0742),
(118909,8,3162.152,562.8186,142.0742),
(118909,9,3240.709,468.0213,142.0742),
(118909,10,3371.026,259.9583,142.0742),
(118909,11,3535.323,122.4076,142.0742),
(118909,12,3756.611,216.3398,142.0742);
DELETE FROM `creature` WHERE `guid`=112986;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(112986,26933,571,1,1,0,0,3791.882,255.4148,152.3366,1.91463,300,0,0,59640,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(112986,1,3791.882,255.4148,152.3366),
(112986,2,3834.405,230.3203,152.3366),
(112986,3,3876.825,233.7821,152.3366),
(112986,4,3900.443,242.9511,152.3366),
(112986,5,3916.114,280.9176,152.3366),
(112986,6,3906.543,328.6796,152.3366),
(112986,7,3897.018,362.4748,152.3366),
(112986,8,3881.718,402.3574,152.3366),
(112986,9,3858.27,431.4729,152.3366),
(112986,10,3816.65,448.8396,152.3366),
(112986,11,3767.092,457.8965,152.3366),
(112986,12,3720.177,443.4765,152.3366),
(112986,13,3699.901,410.0056,152.3366),
(112986,14,3723.531,374.0899,152.3366),
(112986,15,3739.026,327.0149,152.3366),
(112986,16,3762.99,312.7233,152.3366),
(112986,17,3774.031,299.9361,152.3366),
(112986,18,3786.234,277.9988,152.3366);
DELETE FROM `creature` WHERE `guid`=112985;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(112985,26933,571,1,1,0,0,3559.792,412.912,244.8625,1.91463,300,0,0,59640,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(112985,1,3559.792,412.912,244.8625),
(112985,2,3625.949,456.7731,244.8625),
(112985,3,3683.285,437.189,244.8625),
(112985,4,3727.341,385.3615,244.8625),
(112985,5,3786.656,388.9702,244.8625),
(112985,6,3811.097,463.1342,244.8625),
(112985,7,3769.007,516.1342,244.8625),
(112985,8,3685.209,493.7117,244.8625),
(112985,9,3589.482,475.7777,244.8625),
(112985,10,3491.84,496.9259,244.8625),
(112985,11,3406.895,485.8197,244.8625),
(112985,12,3370.333,427.0351,244.8625),
(112985,13,3411.417,366.7467,244.8625),
(112985,14,3479.214,376.5652,244.8625);
DELETE FROM `creature` WHERE `guid`=112984;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(112984,26933,571,1,1,0,0,3424.446,300.7501,194.3189,1.91463,300,0,0,59640,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(112984,1,3424.446,300.7501,194.3189),
(112984,2,3427.025,177.7048,194.3189),
(112984,3,3508.415,97.62153,194.3189),
(112984,4,3635.289,110.5046,194.3189),
(112984,5,3728.01,244.8104,194.3189),
(112984,6,3655.76,402.0861,194.3189),
(112984,7,3513.567,405.2664,194.3189);
DELETE FROM `creature` WHERE `guid`=112983;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(112983,26933,571,1,1,0,0,3457.605,232.8917,280.631,1.91463,300,0,0,59640,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(112983,1,3457.605,232.8917,280.631),
(112983,2,3414.099,307.4206,280.631),
(112983,3,3470.344,415.2286,280.631),
(112983,4,3607.002,418.6074,280.631),
(112983,5,3711.957,340.5557,280.631),
(112983,6,3720.49,226.3188,280.631),
(112983,7,3642.503,140.184,280.631),
(112983,8,3516.544,159.0889,280.631);
DELETE FROM `creature` WHERE `guid`=112982;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(112982,26933,571,1,1,0,0,3559.792,412.912,244.8625,1.91463,300,0,0,59640,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(112982,1,3559.792,412.912,244.8625),
(112982,2,3625.949,456.7731,244.8625),
(112982,3,3683.285,437.189,244.8625),
(112982,4,3727.341,385.3615,244.8625),
(112982,5,3786.656,388.9702,244.8625),
(112982,6,3811.097,463.1342,244.8625),
(112982,7,3769.007,516.1342,244.8625),
(112982,8,3685.209,493.7117,244.8625),
(112982,9,3589.482,475.7777,244.8625),
(112982,10,3491.84,496.9259,244.8625),
(112982,11,3406.895,485.8197,244.8625),
(112982,12,3370.333,427.0351,244.8625),
(112982,13,3411.417,366.7467,244.8625),
(112982,14,3479.214,376.5652,244.8625);
DELETE FROM `creature` WHERE `guid`=112981;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(112981,26933,571,1,1,0,0,3438.608,283.5485,224.3952,1.91463,300,0,0,59640,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(112981,1,3438.608,283.5485,224.3952),
(112981,2,3422.991,341.0565,224.3952),
(112981,3,3372.117,385.6395,224.3952),
(112981,4,3315.855,342.7029,224.3952),
(112981,5,3294.378,270.6668,224.3952),
(112981,6,3321.572,194.6726,224.3952),
(112981,7,3385.174,162.3308,224.3952),
(112981,8,3437.712,218.1042,224.3952);
DELETE FROM `creature` WHERE `guid`=112980;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(112980,26933,571,1,1,0,0,3337.373,175.2911,169.6936,1.91463,300,0,0,59640,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(112980,1,3337.373,175.2911,169.6936),
(112980,2,3292.872,421.84,169.6936),
(112980,3,3355.351,609.4697,169.6936),
(112980,4,3233.689,777.6954,207.249),
(112980,5,3049.014,721.6703,224.4991),
(112980,6,3044.268,566.5984,169.6936),
(112980,7,3142.397,481.2142,169.6936),
(112980,8,3328.336,435.8111,169.6936),
(112980,9,3583.232,539.7742,169.6936),
(112980,10,3799.81,460.638,169.6936),
(112980,11,3717.946,244.38,169.6936),
(112980,12,3542.247,134.1484,169.6936),
(112980,13,3378.177,251.381,169.6936),
(112980,14,3448.559,417.0887,169.6936),
(112980,15,3659.633,429.129,169.6936),
(112980,16,3726.806,236.8274,169.6936),
(112980,17,3554.261,69.58746,169.6936);
DELETE FROM `creature` WHERE `guid`=112979;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(112979,26933,571,1,1,0,0,3738.288,310.6056,206.0655,1.91463,300,0,0,59640,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(112979,1,3738.288,310.6056,206.0655),
(112979,1,3775.943,320.1521,206.0655),
(112979,1,3791.984,364.0035,206.0655),
(112979,1,3821.821,375.4122,206.0655),
(112979,1,3862.769,402.7154,206.0655),
(112979,1,3833.872,426.7561,206.0655),
(112979,1,3796.899,413.8476,206.0655),
(112979,1,3780.125,433.8598,206.0655),
(112979,1,3736.043,443.3744,206.0655),
(112979,1,3713.603,445.3026,206.0655),
(112979,1,3683.613,406.9387,206.0655),
(112979,1,3706.474,364.4982,206.0655),
(112979,1,3712.073,324.8767,206.0655);
DELETE FROM `creature` WHERE `guid`=135352;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135352,26925,571,1,1,0,0,3423.212,279.9993,128.0342,1.91463,300,0,0,28830,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135352,1,3423.212,279.9993,128.0342),
(135352,2,3452.103,334.373,128.0342),
(135352,3,3463.885,390.2345,128.0342),
(135352,4,3459.316,448.6561,128.0342),
(135352,5,3390.542,472.8465,128.0342),
(135352,6,3343.515,429.0621,128.0342),
(135352,7,3319.781,350.6016,128.0342),
(135352,8,3342.761,276.0052,128.0342),
(135352,9,3381.065,257.5826,128.0342);
DELETE FROM `creature` WHERE `guid`=135351;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135351,26925,571,1,1,0,0,3662.692,328.2304,338.4197,1.91463,300,0,0,28830,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135351,1,3662.692,328.2304,338.4197),
(135351,2,3648.806,293.8063,321.0587),
(135351,3,3677.441,213.8859,320.1976),
(135351,4,3615.31,209.5691,324.1698),
(135351,5,3637.643,254.0089,332.7251),
(135351,6,3699.886,260.6509,327.8641),
(135351,7,3720.373,308.941,337.7808),
(135351,8,3691.676,352.0933,342.2254);
DELETE FROM `creature` WHERE `guid`=135350;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(135350,26925,571,1,1,0,0,3657.962,213.0957,169.3146,1.91463,300,0,0,28830,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(135350,1,3657.962,213.0957,169.3146),
(135350,2,3667.34,194.262,169.3146),
(135350,3,3675.021,149.4151,169.3146),
(135350,4,3676.687,103.2968,169.3146),
(135350,5,3657.863,59.17426,169.3146),
(135350,6,3622.093,33.20833,169.3146),
(135350,7,3595.094,36.79308,169.3146),
(135350,8,3578.594,58.34657,169.3146),
(135350,9,3553.642,84.92133,169.3146),
(135350,10,3558.182,112.2144,169.3146),
(135350,11,3570.514,135.5537,169.3146),
(135350,12,3596.293,162.6956,169.3146),
(135350,13,3618.115,186.3872,169.3146),
(135350,14,3648.757,225.0738,169.3146);
DELETE FROM `creature` WHERE `guid`=93672;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(93672,26925,571,1,1,0,0,3606.596,396.9579,205.5612,1.91463,300,0,0,28830,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(93672,1,3606.596,396.9579,205.5612),
(93672,2,3633.08,397.3744,205.5612),
(93672,3,3650.996,425.418,205.5612),
(93672,4,3610.396,457.8707,205.5612),
(93672,5,3510.082,450.9809,205.5612),
(93672,6,3435.127,411.1036,205.5612),
(93672,7,3388.161,429.3571,205.5612),
(93672,8,3406.552,481.8189,205.5612),
(93672,9,3518.298,499.1305,205.5612),
(93672,10,3568.027,418.6763,205.5612);
DELETE FROM `creature` WHERE `guid`=113064;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(113064,26925,571,1,1,0,0,3648.806,293.8063,321.0587,1.91463,300,0,0,28830,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(113064,1,3648.806,293.8063,321.0587),
(113064,2,3677.441,213.8859,320.1976),
(113064,3,3615.31,209.5691,324.1698),
(113064,4,3637.643,254.0089,332.7251),
(113064,5,3699.886,260.6509,327.8641),
(113064,6,3720.373,308.941,337.7808),
(113064,7,3691.676,352.0933,342.2254),
(113064,8,3662.692,328.2304,338.4197);
DELETE FROM `creature` WHERE `guid`=113065;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(113065,26925,571,1,1,0,0,3452.103,334.373,128.0342,1.91463,300,0,0,28830,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(113065,1,3452.103,334.373,128.0342),
(113065,2,3334.853,530.1229,197.2842),
(113065,3,3325.103,359.123,195.7842),
(113065,4,3499.853,334.623,195.0342),
(113065,5,3263.353,527.8729,197.2842),
(113065,6,3706.853,80.87296,195.7842),
(113065,7,3499.853,334.623,195.0342),
(113065,8,3495.603,493.623,197.2842),
(113065,9,3218.353,177.623,195.7842);
DELETE FROM `creature` WHERE `guid`=113066;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(113066,26925,571,1,1,0,0,3648.806,293.8063,321.0587,1.91463,300,0,0,28830,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(113066,1,3648.806,293.8063,321.0587),
(113066,2,3588.806,84.30627,390.3087),
(113066,3,3827.556,468.8063,388.3087),
(113066,4,3731.556,38.55627,388.5587),
(113066,5,3454.556,53.30627,390.3087),
(113066,6,3756.306,434.3063,388.3087),
(113066,7,3503.556,54.30627,388.5587),
(113066,8,3795.056,64.55627,390.3087);
DELETE FROM `creature` WHERE `guid`=113067;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(113067,26925,571,1,1,0,0,3606.596,396.9579,205.5612,1.91463,300,0,0,28830,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(113067,1,3606.596,396.9579,205.5612),
(113067,2,3688.846,165.4579,274.8112),
(113067,3,3601.846,450.2079,273.3112),
(113067,4,3585.346,505.2079,272.8112),
(113067,5,3602.096,174.2079,274.8112),
(113067,6,3446.596,562.4579,273.3112),
(113067,7,3585.346,505.2079,272.8112),
(113067,8,3500.346,153.9579,274.8112),
(113067,9,3571.096,180.2079,273.3112),
(113067,10,3585.346,505.2079,272.8112);
DELETE FROM `creature` WHERE `guid`=113068;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(113068,26925,571,1,1,0,0,3772.475,266.6113,254.1891,1.91463,300,0,0,28830,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(113068,1,3772.475,266.6113,254.1891),
(113068,2,3887.975,92.86133,323.4391),
(113068,3,3532.475,436.8613,321.6891),
(113068,4,3798.725,252.1113,321.4391),
(113068,5,3886.225,81.11133,323.4391),
(113068,6,3636.975,32.11133,321.6891),
(113068,7,3798.725,252.1113,321.4391),
(113068,8,3747.725,77.61133,323.4391),
(113068,9,3772.475,165.6113,321.6891),
(113068,10,3798.725,252.1113,321.4391),
(113068,11,3899.725,81.86133,323.4391),
(113068,12,3936.975,216.1113,321.6891),
(113068,13,3798.725,252.1113,321.4391),
(113068,14,3755.975,93.86133,323.4391),
(113068,15,3785.475,362.1113,321.9391),
(113068,16,3798.725,252.1113,321.4391);
DELETE FROM `creature` WHERE `guid`=113069;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(113069,26925,571,1,1,0,0,3447.796,171.34,125.7842,1.91463,300,0,0,28830,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(113069,1,3447.796,171.34,125.7842),
(113069,2,3456.033,100.7345,125.7842),
(113069,3,3388.28,76.85818,125.7842),
(113069,4,3360.649,126.0434,125.7842),
(113069,5,3368.991,199.87,125.7842),
(113069,6,3432.052,296.2538,125.7842),
(113069,7,3465.493,406.8654,125.7842),
(113069,8,3397.028,457.6761,125.7842),
(113069,9,3354.537,408.359,125.7842),
(113069,10,3384.226,319.0551,125.7842),
(113069,11,3433.646,226.0049,125.7842);
DELETE FROM `creature` WHERE `guid`=113070;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`) VALUES 
(113070,26925,571,1,1,0,0,3750.984,407.8766,254.1891,1.91463,300,0,0,28830,0,2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(113070,1,3750.984,407.8766,254.1891),
(113070,2,3786.711,439.0684,254.1891),
(113070,3,3830.952,442.1341,254.1891),
(113070,4,3862.503,430.8392,254.1891),
(113070,5,3882.549,422.6376,254.1891),
(113070,6,3890.228,394.8426,254.1891),
(113070,7,3871.091,383.1622,254.1891),
(113070,8,3860.575,369.1732,254.1891),
(113070,9,3840.769,340.5143,257.8279),
(113070,10,3832.232,320.8624,264.8557),
(113070,11,3801.307,290.9948,262.5502),
(113070,12,3775.203,268.874,254.1891),
(113070,13,3772.475,266.6113,254.1891),
(113070,14,3748.613,298.5957,254.1891),
(113070,15,3725.111,325.421,254.1891),
(113070,16,3718.476,358.75,254.1891),
(113070,17,3726.624,371.3951,254.1891);
UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE `id`=30988;
UPDATE `creature` SET `position_x`=6805.096,`position_y`=3548.115,`position_z`=785.0337,`spawndist`=0,`MovementType`=2 WHERE `guid`=109614;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(109614,1,6805.096,3548.115,785.0337),
(109614,2,6797.807,3599.297,776.1726),
(109614,3,6840.798,3607.1,769.2557),
(109614,4,6880.369,3577.403,779.5615);
UPDATE `creature` SET `position_x`=6490.46,`position_y`=3498.933,`position_z`=621.7417,`spawndist`=0,`MovementType`=2 WHERE `guid`=109611;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(109611,1,6490.46,3498.933,621.7417),
(109611,2,6645.542,3512.415,678.8528),
(109611,3,6650.367,3555.357,680.6584),
(109611,4,6602.724,3563.045,661.1863),
(109611,5,6549.287,3554.462,642.825);
UPDATE `creature` SET `position_x`=6653.509,`position_y`=3526.14,`position_z`=693.2337,`spawndist`=0,`MovementType`=2 WHERE `guid`=109618;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(109618,1,6653.509,3526.14,693.2337),
(109618,2,6696.053,3579.272,700.4001),
(109618,3,6744.93,3562.146,704.2611),
(109618,4,6738.125,3521.812,692.5392);
UPDATE `creature` SET `position_x`=6653.104,`position_y`=3415.26,`position_z`=672.1595,`spawndist`=0,`MovementType`=2 WHERE `guid`=109621;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(109621,1,6653.104,3415.26,672.1595),
(109621,2,6717.518,3468.886,684.6567),
(109621,3,6771.674,3492.333,692.0456),
(109621,4,6728.592,3518.536,683.6566),
(109621,5,6627.954,3487.869,642.6566),
(109621,6,6571.027,3439.741,634.3512);
UPDATE `creature` SET `position_x`=6641.402,`position_y`=3330.479,`position_z`=724.3008,`spawndist`=0,`MovementType`=2 WHERE `guid`=109629;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(109629,1,6641.402,3330.479,724.3008),
(109629,2,6637.165,3426.095,701.4395),
(109629,3,6701.476,3449.434,708.6896),
(109629,4,6746.966,3410.158,735.9395),
(109629,5,6697.637,3352.607,725.0784);
UPDATE `creature` SET `position_x`=6590.307,`position_y`=3325.47,`position_z`=699.1288,`spawndist`=0,`MovementType`=2 WHERE `guid`=109619;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(109619,1,6590.307,3325.47,699.1288),
(109619,2,6543.557,3237.147,706.6288),
(109619,3,6518.691,3250.313,687.6565),
(109619,4,6512.266,3334.911,685.3231);
UPDATE `creature` SET `position_x`=6459.715,`position_y`=3049.952,`position_z`=701.608,`spawndist`=0,`MovementType`=2 WHERE `guid`=109626;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(109626,1,6459.715,3049.952,701.608),
(109626,2,6485.836,3103.517,681.247),
(109626,3,6445.593,3154.588,677.886),
(109626,4,6392.533,3078.925,694.2471);
UPDATE `creature` SET `position_x`=8487.13,`position_y`=2648.587,`position_z`=661.3248,`spawndist`=0,`MovementType`=2 WHERE `guid`=88231;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(88231,1,8487.13,2648.587,661.3248),
(88231,2,8489.394,2639.188,661.9919),
(88231,3,8498.239,2633.008,661.9919),
(88231,4,8514.016,2626.775,661.9919),
(88231,5,8529.975,2622.438,661.9919),
(88231,6,8556.946,2621.273,661.9919),
(88231,7,8576.765,2620.136,661.9919),
(88231,8,8584.989,2627.947,663.3527),
(88231,9,8590.352,2637.264,664.2969),
(88231,10,8597.313,2651.073,666.0464),
(88231,11,8590.045,2668.078,668.6855),
(88231,12,8577.563,2672.175,668.6855),
(88231,13,8567.869,2653.686,668.6855),
(88231,14,8559.406,2635.763,668.6855),
(88231,15,8550.115,2624.132,664.6028),
(88231,16,8538.325,2625.415,664.6028),
(88231,17,8531.294,2636.344,664.6028),
(88231,18,8536.005,2650.634,664.6028),
(88231,19,8536.659,2661.533,667.5744),
(88231,20,8528.161,2665.466,668.5468),
(88231,21,8521.834,2666.234,668.9914),
(88231,22,8506.145,2657.156,666.1024);
UPDATE `creature` SET `position_x`=8553.722,`position_y`=2732.757,`position_z`=672.1373,`spawndist`=0,`MovementType`=2 WHERE `guid`=88230;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(88230,1,8553.722,2732.757,672.1373),
(88230,2,8545.085,2736.81,677.1306),
(88230,3,8538.377,2724.997,676.7698),
(88230,4,8527.725,2701.114,677.464),
(88230,5,8515.729,2672.526,676.4364),
(88230,6,8501.882,2638.781,674.6306),
(88230,7,8492.601,2619.312,672.9641),
(88230,8,8501.216,2604.361,672.7973),
(88230,9,8509.95,2597.643,672.464),
(88230,10,8516.437,2603.336,670.7147),
(88230,11,8526.045,2624.93,675.242),
(88230,12,8538.438,2654.096,677.4644),
(88230,13,8552.567,2688.411,676.0737),
(88230,14,8561.252,2709.44,676.1867),
(88230,15,8564.74,2718.366,676.9643),
(88230,16,8586.875,2713.758,677.4359),
(88230,17,8588.923,2702.79,676.2701),
(88230,18,8580.09,2682.738,673.3813),
(88230,19,8572.153,2664.409,674.4087),
(88230,20,8559.122,2635.23,674.5473),
(88230,21,8547.672,2610.971,677.3528),
(88230,22,8547.112,2593.927,677.77),
(88230,23,8556.546,2591.858,678.7695),
(88230,24,8566.203,2601.376,677.2705),
(88230,25,8576.512,2615.707,675.7764),
(88230,26,8585.419,2632.535,673.7208),
(88230,27,8596.079,2656.51,673.0544),
(88230,28,8594.222,2669.849,673.4442),
(88230,29,8595.935,2690.9,673.4711),
(88230,30,8592.354,2705.919,675.5258),
(88230,31,8571.288,2721.3,668.0258);
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry`=32472;
DELETE FROM `creature` WHERE `guid` = 99419;
DELETE FROM `creature` WHERE `guid` = 99420;
DELETE FROM `creature` WHERE `guid` = 99421;
UPDATE `creature` SET `spawndist`='5', `MovementType`='1' WHERE `guid` in (99414,99416,99417,99422);
UPDATE `creature` SET `position_x`=5736.421,`position_y`=-1453.626,`position_z`=267.5013,`spawndist`=0,`MovementType`=2 WHERE `guid`=99423;
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(99423,1,5736.421,-1453.626,267.5013),
(99423,2,5700.896,-1467.002,263.9736),
(99423,3,5665.086,-1462.814,266.2513),
(99423,4,5623.596,-1446.303,258.3903),
(99423,5,5612.131,-1390.983,269.9736),
(99423,6,5630.01,-1325.786,252.9459),
(99423,7,5684.276,-1301.843,263.9736),
(99423,8,5717.019,-1325.604,263.9736),
(99423,9,5730.931,-1363.826,254.0014),
(99423,10,5737.854,-1429.533,273.2791);
UPDATE `creature` SET `spawntimesecs`='300' WHERE `id`=29453;
UPDATE `creature_template` SET `speed_walk`=9/2,`speed_run`=17/7,`InhabitType`=4 WHERE `entry`=26838;
UPDATE `creature_template` SET `speed_walk`=7/2,`speed_run`=15/7,`InhabitType`=4 WHERE `entry`=27608;
UPDATE `creature_template` SET `speed_walk`=9/2,`speed_run`=17/7,`InhabitType`=4 WHERE `entry`=26925;
UPDATE `creature_template` SET `speed_walk`=7/2,`speed_run`=15/7,`InhabitType`=4 WHERE `entry`=26933;
DELETE FROM creature WHERE guid=100214;
DELETE FROM creature_addon WHERE guid=100214;
DELETE FROM creature_movement WHERE id=100214;
DELETE FROM game_event_creature WHERE guid=100214;
DELETE FROM game_event_creature_data WHERE guid=100214;
DELETE FROM creature_battleground WHERE guid=100214;
DELETE FROM creature WHERE guid=100213;
DELETE FROM creature_addon WHERE guid=100213;
DELETE FROM creature_movement WHERE id=100213;
DELETE FROM game_event_creature WHERE guid=100213;
DELETE FROM game_event_creature_data WHERE guid=100213;
DELETE FROM creature_battleground WHERE guid=100213;
DELETE FROM `gossip_menu` WHERE `entry` = 50015;
DELETE FROM `gossip_menu` WHERE `entry` = 50016;
DELETE FROM `gossip_menu` WHERE `entry` = 50017;
DELETE FROM `gossip_menu` WHERE `entry` = 50018;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(1562, 2238, 0, 0, 0, 0, 0, 0, 0),
(1563, 2239, 0, 0, 0, 0, 0, 0, 0),
(1564, 2237, 0, 0, 0, 0, 0, 0, 0),
(1565, 2236, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (1561,50015,50016,50017,50018);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`) VALUES
(1561, 0, 0, 'I am ready, Historian Archesonus.', 1, 1, 1565, 0, 0, 0, 0, '', 9, 3702, 0, 0, 0, 0, 0, 0, 0),
(1562, 0, 0, 'Unbelievable! How dare they??', 1, 1, 1563, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1563, 0, 0, 'Of course I will help!', 1, 1, -1, 0, 1563, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1564, 0, 0, 'Interesting, continue please.', 1, 1, 1562, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1565, 0, 0, 'That is tragic. How did this happen?', 1, 1, 1564, 0, 0, 0, 0, '', 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id` in (1561,1563);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('1563', '0', '7', '3702', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
UPDATE `gossip_menu_option` SET `condition_id`='1558' WHERE `menu_id` =1561 AND `id`=0;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(16037, 153556, 0, 1, 1, -7757.94, -2159.73, 133.439, -3.08923, 0, 0, -0.999657, 0.0261783, 180, 100, 1),
(20843, 153556, 0, 1, 1, -7892.84, -2144.82, 120.545, 2.98451, 0, 0, 0.996917, 0.0784606, 180, 100, 1),
(20844, 153556, 0, 1, 1, -7693.64, -2387.06, 147.656, 2.68781, 0, 0, 0.97437, 0.22495, 180, 100, 1),
(20845, 153556, 0, 1, 1, -7804.24, -2103.44, 133.439, -1.91986, 0, 0, -0.819151, 0.573577, 180, 100, 1),
(20846, 153556, 0, 1, 1, -7828.93, -2265.71, 137.186, -1.41372, 0, 0, -0.649449, 0.760405, 180, 100, 1),
(20847, 153556, 0, 1, 1, -7774.49, -2235, 134.134, -1.74533, 0, 0, -0.766045, 0.642787, 180, 100, 1),
(20848, 153556, 0, 1, 1, -7710.73, -2178.15, 131.896, -2.3911, 0, 0, -0.930417, 0.366502, 180, 100, 1),
(20849, 153556, 0, 1, 1, -7741.42, -1948.2, 136.462, -1.22173, 0, 0, -0.573576, 0.819152, 180, 100, 1),
(20850, 153556, 0, 1, 1, -7793.45, -1804.18, 132.184, 1.09956, 0, 0, 0.5225, 0.852639, 180, 100, 1),
(20851, 153556, 0, 1, 1, -7725.99, -2125.54, 133.439, -2.53073, 0, 0, -0.953717, 0.300705, 180, 100, 1),
(20852, 153556, 0, 1, 1, -7775.43, -2313.51, 137.082, -1.81514, 0, 0, -0.78801, 0.615662, 180, 100, 1),
(20853, 153556, 0, 1, 1, -7844.55, -1945.58, 137.301, 2.44346, 0, 0, 0.939692, 0.342021, 180, 100, 1),
(7861, 153556, 0, 1, 1, -7843.89, -1992.06, 139.809, -1.01229, 0, 0, -0.484809, 0.87462, 180, 100, 1),
(7866, 153556, 0, 1, 1, -7748.03, -2078.4, 133.439, -2.63545, 0, 0, -0.968148, 0.250379, 180, 100, 1),
(7868, 153556, 0, 1, 1, -7800.4, -1900.31, 135.089, -2.07694, 0, 0, -0.861629, 0.507539, 180, 100, 1),
(7869, 153556, 0, 1, 1, -7835.78, -2067.96, 136.252, 0.139626, 0, 0, 0.0697563, 0.997564, 180, 100, 1),
(7870, 153556, 0, 1, 1, -7888.89, -2004.36, 135.828, 2.98451, 0, 0, 0.996917, 0.0784606, 180, 100, 1),
(7872, 153556, 0, 1, 1, -7741.91, -2292.93, 136.29, 1.13446, 0, 0, 0.537298, 0.843393, 180, 100, 1),
(7873, 153556, 0, 1, 1, -7779.31, -1855.2, 134.131, 0.069813, 0, 0, 0.0348994, 0.999391, 180, 100, 1),
(7887, 153556, 0, 1, 1, -7891.04, -2188.15, 133.436, 1.37881, 0, 0, 0.636078, 0.771625, 180, 100, 1),
(7888, 153556, 0, 1, 1, -7793.7, -1961.65, 134.118, -0.802851, 0, 0, -0.390731, 0.920505, 180, 100, 1),
(7889, 153556, 0, 1, 1, -7884.96, -2246.48, 136.311, -0.017453, 0, 0, -0.00872639, 0.999962, 180, 100, 1),
(7894, 153556, 0, 1, 1, -7715.64, -1846.73, 135.942, -0.418879, 0, 0, -0.207912, 0.978148, 180, 100, 1),
(7895, 153556, 0, 1, 1, -7820.68, -2203.07, 133.439, 2.47837, 0, 0, 0.945519, 0.325567, 180, 100, 1),
(7896, 153556, 0, 1, 1, -7766.91, -2013.52, 135.337, -0.488692, 0, 0, -0.241922, 0.970296, 180, 100, 1),
(7897, 153556, 0, 1, 1, -7716.94, -2033.14, 133.439, 0.802851, 0, 0, 0.390731, 0.920505, 180, 100, 1);
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14369', '18', 'Thaurissan Relic');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('153556', '14369', '0', 'Thaurissan Relic');
DELETE FROM `creature` WHERE `id` = 8887;
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('2000000788', 'He cannot be defeated.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2000000789', 'The relic burns to nothing. The memories it held are now your own. This city was destroyed by a being not of this world.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2000000790', 'Do not taint these ruins, mortal.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2000000791', 'You are engulfed in a blinding flash of light. A creature composed entirely of flame is the only thing you can remember seeing.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2000000792', 'Leave this place.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2000000793', 'The relic emits a white hot arc of flame. A memory has been gained: A lone Dark Iron dwarf is surrounded by seven corpses, kneeling before a monolith of flame.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2000000794', 'Help us, outsider.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL), 
('2000000795', 'The relic crumbles to dust. A vision of eight Dark Iron dwarves performing some sort of ritual fills your head.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `event_scripts` WHERE `id` in (3361);
REPLACE INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
('3361', '0', '10', '8887', '5000', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', ''),
('3361', '1', '0', '0', '0', '8887', '10', '0', '2000000788', '2000000790', '2000000792', '2000000794', '0', '0', '0', '0', ''),
('3361', '2', '0', '2', '0', '0', '0', '0', '2000000789', '2000000791', '2000000793', '2000000795', '0', '0', '0', '0', '');
DELETE FROM `creature` WHERE `id` = 10698;
UPDATE `gossip_menu` SET `script_id`='3141' WHERE `entry`=3141 AND `text_id`=3873;
DELETE FROM `gossip_scripts` WHERE `id` = 3141;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES 
('3141', '0', '8', '11064', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', ''),
('3141', '2', '29', '1', '2', '11064', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
UPDATE `creature_template` SET `faction_A`='35',`faction_H`='35',`flags_extra`='2048' WHERE `entry`=11064;
DELETE FROM `creature` WHERE `guid` = 16029;
DELETE FROM `creature` WHERE `guid` = 16215;
DELETE FROM `creature` WHERE `guid` = 16556;
DELETE FROM `creature` WHERE `guid` = 16648;
DELETE FROM `creature` WHERE `guid` = 18670;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(15931, 12337, 0, 1, 1, 0, 0, 2814.72, -4466.88, 89.9556, 3.96079, 600, 0, 0, 14000, 4868, 0, 2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(15931, 1, 2806.6, -4475.69, 89.9669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 2, 2801.03, -4481.72, 89.9453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 3, 2789.95, -4493.86, 89.8303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 4, 2780.41, -4504.1, 89.6763, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 5, 2770.79, -4514.28, 89.4751, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 6, 2750.62, -4533.67, 88.8859, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 7, 2737.98, -4543.55, 88.4874, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 8, 2725.94, -4550.69, 88.0814, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 9, 2701.68, -4564.66, 87.4361, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 10, 2677.69, -4579.1, 86.5389, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 11, 2665.6, -4586.15, 85.6021, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 12, 2653.44, -4593.09, 84.9497, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 13, 2641.25, -4599.98, 84.6561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 14, 2629.2, -4607.1, 84.5638, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 15, 2617.23, -4614.37, 84.1513, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 16, 2605.27, -4621.64, 83.0451, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 17, 2581.34, -4636.17, 80.6435, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 18, 2569.34, -4643.39, 79.6035, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 19, 2555.86, -4651.34, 78.5097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 20, 2555.86, -4651.34, 78.5097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 21, 2541.99, -4653.26, 77.6674, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 22, 2528.11, -4655.13, 76.8887, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 23, 2505.79, -4656.55, 75.7666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 24, 2494.38, -4653.2, 75.2749, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 25, 2490.17, -4650.14, 75.2223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 26, 2478.56, -4642.32, 74.92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 27, 2455.83, -4629.1, 73.8051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 28, 2455.83, -4629.1, 73.8051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 29, 2443.22, -4623.03, 73.6193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 30, 2419.33, -4611.98, 73.6116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 31, 2419.33, -4611.98, 73.6116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 32, 2406.41, -4606.58, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 33, 2387.14, -4601.94, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 34, 2373.14, -4601.96, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 35, 2359.15, -4602.4, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 36, 2329.02, -4604.86, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 37, 2329.02, -4604.86, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 38, 2315.49, -4608.48, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 39, 2290.81, -4615.13, 73.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 40, 2290.81, -4615.13, 73.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 41, 2264.2, -4623.86, 73.6226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 42, 2250.99, -4628.48, 73.6226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 43, 2237.84, -4633.28, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 44, 2233.65, -4634.8, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 45, 2219.92, -4636.19, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 46, 2198.31, -4635.8, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 47, 2179.83, -4630.2, 73.6186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 48, 2167.25, -4624.07, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 49, 2154.81, -4617.65, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 50, 2137.87, -4608.21, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 51, 2117.11, -4592.4, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 52, 2107.2, -4582.51, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 53, 2097.31, -4572.6, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 54, 2082.78, -4558.14, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 55, 2072.97, -4548.16, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 56, 2064.02, -4537.4, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 57, 2054.73, -4526.93, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 58, 2039, -4511.27, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 59, 2039, -4511.27, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 60, 2018.56, -4522.04, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 61, 2007.33, -4530.39, 73.6182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 62, 1996.49, -4539.26, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 63, 1978.09, -4555.64, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 64, 1972.04, -4568.26, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 65, 1966.19, -4580.98, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 66, 1961.34, -4594.06, 73.7168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 67, 1955.04, -4614.18, 75.4099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 68, 1955.04, -4614.18, 75.4099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 69, 1947.56, -4631.23, 79.4311, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 70, 1937.66, -4647.88, 84.2933, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 71, 1926.19, -4661.08, 88.0589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 72, 1926.19, -4661.08, 88.0589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 73, 1905.62, -4675.24, 91.8144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 74, 1905.62, -4675.24, 91.8144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 75, 1881.04, -4688.64, 92.3108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 76, 1869, -4695.77, 92.4244, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 77, 1860, -4701.3, 93.179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 78, 1860, -4701.3, 93.179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 79, 1849.8, -4710.89, 93.0538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 80, 1837.28, -4725.44, 91.5627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 81, 1830.15, -4738.08, 89.5755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 82, 1830.15, -4738.08, 89.5755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 83, 1820.18, -4764.23, 89.4855, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 84, 1815.28, -4777.32, 90.0434, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 85, 1810.99, -4790.65, 91.0152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 86, 1807.67, -4804.24, 91.0432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 87, 1803.59, -4821.49, 90.2337, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 88, 1803.59, -4821.49, 90.2337, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 89, 1794.39, -4846.34, 89.3225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 90, 1790.23, -4862.21, 88.9506, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 91, 1787.49, -4875.94, 87.5193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 92, 1784.76, -4889.67, 85.7993, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 93, 1782.02, -4903.4, 84.1647, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 94, 1779.58, -4917.19, 82.4565, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 95, 1775, -4944.8, 81.4627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 96, 1771.96, -4958.47, 81.1755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 97, 1764.57, -4979.36, 81.2285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 98, 1756.67, -4990.91, 80.8094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 99, 1740.73, -5013.93, 79.9026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 100, 1733.39, -5025.82, 80.0289, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 101, 1726.52, -5037.79, 80.8024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 102, 1721.85, -5050.98, 80.5791, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 103, 1717.05, -5064.14, 79.3981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 104, 1707.47, -5090.45, 76.1053, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 105, 1702.67, -5103.6, 74.1361, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 106, 1697.88, -5116.75, 73.6418, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 107, 1689.39, -5143.42, 74.0518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 108, 1688.38, -5155.8, 73.8026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 109, 1688.19, -5178.9, 73.7914, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 110, 1691, -5191.24, 74.2004, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 111, 1692.89, -5206.03, 74.6583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 112, 1692.98, -5219.47, 73.7034, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 113, 1692.8, -5230.67, 73.649, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 114, 1692.53, -5244.65, 73.6146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 115, 1692.25, -5258.64, 73.6153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 116, 1691.76, -5284.04, 73.6112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 117, 1691.76, -5284.04, 73.6112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 118, 1689.02, -5297.77, 73.6112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 119, 1674.76, -5326.32, 73.6109, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 120, 1662.76, -5333.81, 73.6113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 121, 1664.54, -5346, 73.624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 122, 1670.22, -5354.8, 73.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 123, 1675.94, -5362.78, 73.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 124, 1675.94, -5362.78, 73.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 125, 1672.23, -5376.28, 73.6121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 126, 1665.09, -5396.89, 74.1377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 127, 1661.45, -5407.44, 76.5412, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 128, 1661.45, -5407.44, 76.5412, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 129, 1651.98, -5433.79, 85.4015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 130, 1647.13, -5446.92, 90.4724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 131, 1644.19, -5454.79, 93.9639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 132, 1644.19, -5454.79, 93.9639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 133, 1636.28, -5476.14, 100.092, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 134, 1634.69, -5479.97, 100.622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 135, 1626.74, -5497.12, 100.729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 136, 1626.74, -5497.12, 100.729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 137, 1637.62, -5473.45, 99.5326, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 138, 1642.48, -5459.89, 95.3215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 139, 1645, -5453.23, 93.4343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 140, 1648.64, -5443.44, 88.7457, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 141, 1652.9, -5431.88, 84.7826, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 142, 1657.94, -5418.22, 80.3251, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 143, 1662.96, -5403.37, 75.3562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 144, 1662.96, -5403.37, 75.3562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 145, 1667.44, -5390.11, 73.612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 146, 1676.35, -5365.76, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 147, 1681.65, -5360.49, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 148, 1691.69, -5355.51, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 149, 1697.73, -5349, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 150, 1696.66, -5338.61, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 151, 1685.3, -5319.3, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 152, 1685.3, -5319.3, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 153, 1689.16, -5291.58, 73.6121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 154, 1691.67, -5277.81, 73.6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 155, 1692.3, -5264.6, 73.6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 156, 1692.11, -5250.6, 73.6483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 157, 1692.63, -5236.61, 73.6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 158, 1692.82, -5208.33, 74.5818, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 159, 1691.54, -5194.22, 74.3519, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 160, 1689.04, -5179.5, 73.7525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 161, 1688.37, -5167.2, 74.0196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 162, 1689.2, -5148.94, 73.9898, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 163, 1692.9, -5135.44, 73.9792, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 164, 1696.68, -5121.96, 73.635, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 165, 1701.06, -5108.66, 73.8469, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 166, 1705.44, -5095.36, 75.2536, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 167, 1709.99, -5082.13, 77.0799, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 168, 1719.44, -5055.79, 80.2728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 169, 1724.26, -5043.46, 80.971, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 170, 1730.67, -5031.01, 80.5085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 171, 1737.68, -5018.9, 79.8718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 172, 1745.35, -5007.19, 79.9026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 173, 1753.88, -4996.09, 80.5182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 174, 1767.4, -4976.89, 81.2276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 175, 1767.4, -4976.89, 81.2276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 176, 1775.97, -4950.24, 81.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 177, 1776.51, -4947.29, 81.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 178, 1777.52, -4926.07, 81.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 179, 1780.13, -4912.33, 83.3272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 180, 1783.27, -4898.71, 84.598, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 181, 1789.69, -4871.46, 87.9183, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 182, 1792.95, -4857.85, 88.9561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 183, 1796.96, -4844.43, 89.4975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 184, 1805.14, -4817.71, 90.3367, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 185, 1808.62, -4804.17, 91.0512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 186, 1816.93, -4777.44, 89.9966, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 187, 1821.55, -4764.22, 89.432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 188, 1826.01, -4750.95, 88.8843, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 189, 1830.97, -4737.86, 89.5994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 190, 1839.49, -4721.28, 92.0094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 191, 1845.28, -4714.44, 92.8539, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 192, 1860.72, -4701.57, 93.1845, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 193, 1872.65, -4694.25, 92.4181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 194, 1885.11, -4687.87, 92.2616, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 195, 1904.18, -4677.57, 92.1922, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 196, 1912.17, -4672.71, 90.9401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 197, 1924.91, -4662.33, 88.3133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 198, 1931.1, -4654.42, 86.4454, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 199, 1938.72, -4643.36, 83.303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 200, 1946.18, -4630.85, 79.5054, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 201, 1953.08, -4617.63, 76.0027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 202, 1953.08, -4617.63, 76.0027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 203, 1959.1, -4602.76, 73.7886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 204, 1963.22, -4589.38, 73.6763, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 205, 1972.27, -4563.09, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 206, 1979.44, -4554.04, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 207, 1979.44, -4554.04, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 208, 2001.05, -4536.25, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 209, 2011.86, -4527.35, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 210, 2023.68, -4517.96, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 211, 2035.18, -4516.82, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 212, 2046.38, -4516.95, 73.6177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 213, 2056.42, -4528.99, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 214, 2066.79, -4540.75, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 215, 2076.15, -4551.16, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 216, 2085.63, -4561.47, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 217, 2095.37, -4571.51, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 218, 2105.55, -4581.13, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 219, 2116.03, -4590.41, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 220, 2129.99, -4601.9, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 221, 2141.5, -4609.87, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 222, 2152.88, -4617.17, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 223, 2165.29, -4623.63, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 224, 2178.24, -4628.94, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 225, 2203.55, -4635.33, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 226, 2219.18, -4635.86, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 227, 2232.75, -4632.44, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 228, 2246.36, -4629.14, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 229, 2259.78, -4625.16, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 230, 2288.91, -4616.44, 73.623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 231, 2302.42, -4612.78, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 232, 2329.74, -4606.77, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 233, 2343.6, -4604.8, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 234, 2378.01, -4602.57, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 235, 2386.76, -4602.71, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 236, 2418.2, -4611.25, 73.1306, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 237, 2418.2, -4611.25, 73.1306, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 238, 2443.5, -4622.86, 73.6178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 239, 2454.51, -4628.33, 73.6491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 240, 2463.47, -4635, 74.5325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 241, 2474.77, -4643.27, 74.7895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 242, 2494.21, -4656.75, 75.2786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 243, 2502.05, -4656.89, 75.6033, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 244, 2516.04, -4656.43, 76.2191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 245, 2538.2, -4655.03, 77.4241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 246, 2557.73, -4649.54, 78.6479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 247, 2564.91, -4646.93, 79.1957, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 248, 2589.33, -4633.41, 81.3069, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 249, 2601.15, -4625.91, 82.5634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 250, 2624.77, -4610.93, 84.5453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 251, 2646, -4598.04, 84.7882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 252, 2670.25, -4584.03, 85.9516, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 253, 2682.35, -4577, 86.8728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 254, 2706.52, -4562.86, 87.512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 255, 2718.6, -4555.78, 87.8583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 256, 2740.66, -4542.51, 88.5981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 257, 2761.04, -4523.31, 89.1896, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 258, 2771.04, -4513.51, 89.4811, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 259, 2780.72, -4503.4, 89.676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 260, 2800.02, -4483.11, 89.9421, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 261, 2809.57, -4472.88, 89.9774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 262, 2828.65, -4451.18, 89.8812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 263, 2836.19, -4439.39, 89.7144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 264, 2843.55, -4427.48, 89.5383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 265, 2851.53, -4414.44, 89.354, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 266, 2865.76, -4390.36, 89.627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 267, 2876.45, -4370.68, 90.0663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 268, 2876.45, -4370.68, 90.0663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 269, 2884.86, -4343.98, 90.4168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 270, 2887.86, -4330.31, 90.5439, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 271, 2892.56, -4302.71, 90.6607, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 272, 2894.81, -4288.89, 90.8644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 273, 2898.81, -4261.2, 91.3345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 274, 2900.39, -4247.29, 91.4736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 275, 2903.91, -4219.53, 92.0372, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 276, 2905.9, -4205.67, 92.4347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 277, 2910.4, -4178.04, 93.4175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 278, 2912.97, -4164.28, 94.0555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 279, 2919.05, -4136.95, 95.3983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 280, 2921.99, -4123.26, 95.8835, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 281, 2928.13, -4095.94, 96.9042, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 282, 2932.83, -4076.02, 97.7112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 283, 2942.05, -4049.59, 98.866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 284, 2947.23, -4036.58, 99.6264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 285, 2960.56, -4002.02, 102.743, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 286, 2966.85, -3987.62, 103.773, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 287, 2970.86, -3977.23, 105.049, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 288, 2975.85, -3964.15, 106.84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 289, 2982.13, -3948.8, 109.272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 290, 2984.8, -3935.65, 112.249, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 291, 2986.56, -3923.11, 114.193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 292, 2990.03, -3910.13, 115.868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 293, 2993.69, -3896.82, 117.056, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 294, 3002.85, -3870.4, 119.344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 295, 3010.12, -3844.52, 119.307, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 296, 3015.36, -3831.54, 119.114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 297, 3020.52, -3818.53, 118.882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 298, 3028.86, -3797.77, 120.138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 299, 3034.33, -3784.88, 119.719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 300, 3039.39, -3771.83, 119.753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 301, 3044.39, -3758.75, 120.371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 302, 3054.84, -3732.77, 119.624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 303, 3060.01, -3719.77, 119.674, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 304, 3066.23, -3696.89, 121.046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 305, 3061.06, -3682.14, 121.267, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 306, 3054.64, -3669.71, 121.492, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 307, 3048.19, -3657.28, 122.826, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 308, 3039.67, -3639.08, 125.316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 309, 3039.67, -3639.08, 125.316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 310, 3040.52, -3611.1, 123.771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 311, 3040.52, -3611.1, 123.771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 312, 3040.54, -3583.1, 124.342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 313, 3040.79, -3569.11, 124.606, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 314, 3043.87, -3543.57, 128.466, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 315, 3045.52, -3533.85, 129.747, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 316, 3048.93, -3516.29, 131.005, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 317, 3054.52, -3499.33, 131.368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 318, 3060.67, -3486.76, 132.204, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 319, 3066.71, -3475.76, 133.507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 320, 3073.58, -3465.56, 134.225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 321, 3087.14, -3450.16, 136.008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 322, 3096.19, -3439.48, 136.685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 323, 3105.27, -3428.82, 137.747, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 324, 3118.73, -3414.38, 138.717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 325, 3130.82, -3403.98, 139.314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 326, 3130.82, -3403.98, 139.314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 327, 3154.67, -3399.97, 140.236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 328, 3164.9, -3393.8, 141.343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 329, 3174.83, -3390.44, 142.351, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 330, 3188.71, -3388.67, 143.537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 331, 3202.59, -3386.91, 143.977, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 332, 3216.47, -3385.1, 144.308, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 333, 3241.87, -3382.5, 144.041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 334, 3241.87, -3382.5, 144.041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 335, 3265.35, -3381.1, 143.423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 336, 3282.5, -3380.54, 141.646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 337, 3282.5, -3380.54, 141.646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 338, 3308.62, -3380.18, 145.026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 339, 3317.47, -3384.49, 145.191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 340, 3323.5, -3378.4, 144.885, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 341, 3316.82, -3374.45, 145.2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 342, 3308.93, -3379.2, 145.046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 343, 3298.54, -3379.34, 143.999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 344, 3282.1, -3379.46, 141.682, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 345, 3282.1, -3379.46, 141.682, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 346, 3268.19, -3380.16, 143.35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 347, 3240.31, -3382.36, 144.11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 348, 3226.39, -3383.9, 144.231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 349, 3212.47, -3385.4, 144.286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 350, 3198.58, -3387.11, 143.804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 351, 3173.44, -3390.51, 142.236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 352, 3160.48, -3395.77, 140.741, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 353, 3147.82, -3401.76, 139.915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 354, 3147.82, -3401.76, 139.915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 355, 3125.18, -3408.02, 138.783, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 356, 3116.41, -3415.59, 138.744, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 357, 3104.3, -3429.54, 137.707, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 358, 3095.1, -3440.1, 136.525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 359, 3085.9, -3450.64, 136.005, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 360, 3076.85, -3461.33, 134.886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 361, 3061.5, -3480.09, 133.085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 362, 3057, -3490.35, 131.777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 363, 3057, -3490.35, 131.777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 364, 3048, -3517.59, 130.921, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 365, 3045.68, -3531.4, 129.856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 366, 3043.38, -3550.1, 127.313, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 367, 3041.8, -3564.01, 125.215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 368, 3040.59, -3584.29, 124.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 369, 3040.59, -3584.29, 124.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 370, 3040.38, -3612.29, 123.785, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 371, 3040.45, -3633.55, 125.423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 372, 3041.6, -3643.53, 124.637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 373, 3045.88, -3655, 122.907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 374, 3045.88, -3655, 122.907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 375, 3056.15, -3673.64, 121.304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 376, 3061.19, -3684.48, 121.261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 377, 3061.19, -3684.48, 121.261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 378, 3063.56, -3708.12, 120.637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 379, 3059.78, -3719.85, 119.67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 380, 3059.78, -3719.85, 119.67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 381, 3049.65, -3745.96, 120.504, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 382, 3044.65, -3759.04, 120.332, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 383, 3034.49, -3785.13, 119.718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 384, 3029.71, -3797.06, 120.134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 385, 3024.25, -3809.95, 119.169, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 386, 3018.73, -3822.81, 118.88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 387, 3013.26, -3835.7, 119.216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 388, 3008.53, -3848.88, 119.304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 389, 3001.47, -3870.48, 119.263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 390, 2997.35, -3883.86, 118.357, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 391, 2993.23, -3897.24, 117.025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 392, 2989.51, -3910.73, 115.778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 393, 2985.56, -3924.16, 114.025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 394, 2982.06, -3947.47, 109.477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 395, 2978.72, -3956.6, 107.868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 396, 2972.76, -3969.26, 106.065, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 397, 2967.51, -3982.23, 104.16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 398, 2962.49, -3995.3, 103.002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 399, 2952.63, -4021.5, 100.585, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 400, 2947.63, -4034.58, 99.7325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 401, 2942.7, -4047.68, 98.9784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 402, 2932.97, -4073.94, 97.7989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 403, 2925.47, -4096.79, 96.8862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 404, 2922.65, -4110.5, 96.3581, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 405, 2919.92, -4124.23, 95.8468, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 406, 2917.19, -4137.96, 95.2586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 407, 2911.73, -4165.43, 93.9918, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 408, 2906.99, -4193.01, 92.8379, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 409, 2905.16, -4206.89, 92.4011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 410, 2901.43, -4234.64, 91.663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 411, 2897.57, -4262.38, 91.2693, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 412, 2893.59, -4290.09, 90.7786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 413, 2892.09, -4304.01, 90.6426, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 414, 2889.1, -4328.23, 90.6049, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 415, 2881.19, -4355.07, 90.2687, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 416, 2876.07, -4368.09, 90.0269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 417, 2870.4, -4380.9, 89.8314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 418, 2857.33, -4405.65, 89.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 419, 2849.99, -4417.56, 89.3987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 420, 2835.05, -4441.25, 89.7445, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15931, 421, 2823.28, -4458.62, 89.9473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
DELETE FROM `creature` WHERE `guid` = 18674;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(18629, 13118, 0, 1, 1, 0, 0, 2807.56, -4474.55, 89.9657, 4.01185, 600, 0, 0, 8200, 0, 0, 2),
(18512, 13118, 0, 1, 1, 0, 0, 2821.24, -4460.42, 89.9439, 3.94116, 600, 0, 0, 8200, 0, 0, 2),
(18317, 13118, 0, 1, 1, 0, 0, 2818.17, -4463.67, 89.9566, 3.94901, 600, 0, 0, 8200, 0, 0, 2),
(18169, 13118, 0, 1, 1, 0, 0, 2810.57, -4471.33, 89.9647, 3.96079, 600, 0, 0, 8200, 0, 0, 2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(18629, 1, 2806.6, -4475.69, 89.9669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 2, 2801.03, -4481.72, 89.9453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 3, 2789.95, -4493.86, 89.8303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 4, 2780.41, -4504.1, 89.6763, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 5, 2770.79, -4514.28, 89.4751, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 6, 2750.62, -4533.67, 88.8859, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 7, 2737.98, -4543.55, 88.4874, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 8, 2725.94, -4550.69, 88.0814, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 9, 2701.68, -4564.66, 87.4361, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 10, 2677.69, -4579.1, 86.5389, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 11, 2665.6, -4586.15, 85.6021, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 12, 2653.44, -4593.09, 84.9497, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 13, 2641.25, -4599.98, 84.6561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 14, 2629.2, -4607.1, 84.5638, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 15, 2617.23, -4614.37, 84.1513, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 16, 2605.27, -4621.64, 83.0451, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 17, 2581.34, -4636.17, 80.6435, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 18, 2569.34, -4643.39, 79.6035, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 19, 2555.86, -4651.34, 78.5097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 20, 2555.86, -4651.34, 78.5097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 21, 2541.99, -4653.26, 77.6674, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 22, 2528.11, -4655.13, 76.8887, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 23, 2505.79, -4656.55, 75.7666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 24, 2494.38, -4653.2, 75.2749, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 25, 2490.17, -4650.14, 75.2223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 26, 2478.56, -4642.32, 74.92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 27, 2455.83, -4629.1, 73.8051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 28, 2455.83, -4629.1, 73.8051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 29, 2443.22, -4623.03, 73.6193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 30, 2419.33, -4611.98, 73.6116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 31, 2419.33, -4611.98, 73.6116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 32, 2406.41, -4606.58, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 33, 2387.14, -4601.94, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 34, 2373.14, -4601.96, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 35, 2359.15, -4602.4, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 36, 2329.02, -4604.86, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 37, 2329.02, -4604.86, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 38, 2315.49, -4608.48, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 39, 2290.81, -4615.13, 73.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 40, 2290.81, -4615.13, 73.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 41, 2264.2, -4623.86, 73.6226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 42, 2250.99, -4628.48, 73.6226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 43, 2237.84, -4633.28, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 44, 2233.65, -4634.8, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 45, 2219.92, -4636.19, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 46, 2198.31, -4635.8, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 47, 2179.83, -4630.2, 73.6186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 48, 2167.25, -4624.07, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 49, 2154.81, -4617.65, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 50, 2137.87, -4608.21, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 51, 2117.11, -4592.4, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 52, 2107.2, -4582.51, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 53, 2097.31, -4572.6, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 54, 2082.78, -4558.14, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 55, 2072.97, -4548.16, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 56, 2064.02, -4537.4, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 57, 2054.73, -4526.93, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 58, 2039, -4511.27, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 59, 2039, -4511.27, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 60, 2018.56, -4522.04, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 61, 2007.33, -4530.39, 73.6182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 62, 1996.49, -4539.26, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 63, 1978.09, -4555.64, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 64, 1972.04, -4568.26, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 65, 1966.19, -4580.98, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 66, 1961.34, -4594.06, 73.7168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 67, 1955.04, -4614.18, 75.4099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 68, 1955.04, -4614.18, 75.4099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 69, 1947.56, -4631.23, 79.4311, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 70, 1937.66, -4647.88, 84.2933, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 71, 1926.19, -4661.08, 88.0589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 72, 1926.19, -4661.08, 88.0589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 73, 1905.62, -4675.24, 91.8144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 74, 1905.62, -4675.24, 91.8144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 75, 1881.04, -4688.64, 92.3108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 76, 1869, -4695.77, 92.4244, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 77, 1860, -4701.3, 93.179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 78, 1860, -4701.3, 93.179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 79, 1849.8, -4710.89, 93.0538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 80, 1837.28, -4725.44, 91.5627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 81, 1830.15, -4738.08, 89.5755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 82, 1830.15, -4738.08, 89.5755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 83, 1820.18, -4764.23, 89.4855, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 84, 1815.28, -4777.32, 90.0434, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 85, 1810.99, -4790.65, 91.0152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 86, 1807.67, -4804.24, 91.0432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 87, 1803.59, -4821.49, 90.2337, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 88, 1803.59, -4821.49, 90.2337, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 89, 1794.39, -4846.34, 89.3225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 90, 1790.23, -4862.21, 88.9506, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 91, 1787.49, -4875.94, 87.5193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 92, 1784.76, -4889.67, 85.7993, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 93, 1782.02, -4903.4, 84.1647, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 94, 1779.58, -4917.19, 82.4565, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 95, 1775, -4944.8, 81.4627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 96, 1771.96, -4958.47, 81.1755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 97, 1764.57, -4979.36, 81.2285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 98, 1756.67, -4990.91, 80.8094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 99, 1740.73, -5013.93, 79.9026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 100, 1733.39, -5025.82, 80.0289, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 101, 1726.52, -5037.79, 80.8024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 102, 1721.85, -5050.98, 80.5791, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 103, 1717.05, -5064.14, 79.3981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 104, 1707.47, -5090.45, 76.1053, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 105, 1702.67, -5103.6, 74.1361, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 106, 1697.88, -5116.75, 73.6418, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 107, 1689.39, -5143.42, 74.0518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 108, 1688.38, -5155.8, 73.8026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 109, 1688.19, -5178.9, 73.7914, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 110, 1691, -5191.24, 74.2004, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 111, 1692.89, -5206.03, 74.6583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 112, 1692.98, -5219.47, 73.7034, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 113, 1692.8, -5230.67, 73.649, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 114, 1692.53, -5244.65, 73.6146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 115, 1692.25, -5258.64, 73.6153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 116, 1691.76, -5284.04, 73.6112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 117, 1691.76, -5284.04, 73.6112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 118, 1689.02, -5297.77, 73.6112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 119, 1674.76, -5326.32, 73.6109, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 120, 1662.76, -5333.81, 73.6113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 121, 1664.54, -5346, 73.624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 122, 1670.22, -5354.8, 73.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 123, 1675.94, -5362.78, 73.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 124, 1675.94, -5362.78, 73.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 125, 1672.23, -5376.28, 73.6121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 126, 1665.09, -5396.89, 74.1377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 127, 1661.45, -5407.44, 76.5412, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 128, 1661.45, -5407.44, 76.5412, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 129, 1651.98, -5433.79, 85.4015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 130, 1647.13, -5446.92, 90.4724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 131, 1644.19, -5454.79, 93.9639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 132, 1644.19, -5454.79, 93.9639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 133, 1636.28, -5476.14, 100.092, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 134, 1634.69, -5479.97, 100.622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 135, 1626.74, -5497.12, 100.729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 136, 1626.74, -5497.12, 100.729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 137, 1637.62, -5473.45, 99.5326, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 138, 1642.48, -5459.89, 95.3215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 139, 1645, -5453.23, 93.4343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 140, 1648.64, -5443.44, 88.7457, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 141, 1652.9, -5431.88, 84.7826, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 142, 1657.94, -5418.22, 80.3251, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 143, 1662.96, -5403.37, 75.3562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 144, 1662.96, -5403.37, 75.3562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 145, 1667.44, -5390.11, 73.612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 146, 1676.35, -5365.76, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 147, 1681.65, -5360.49, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 148, 1691.69, -5355.51, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 149, 1697.73, -5349, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 150, 1696.66, -5338.61, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 151, 1685.3, -5319.3, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 152, 1685.3, -5319.3, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 153, 1689.16, -5291.58, 73.6121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 154, 1691.67, -5277.81, 73.6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 155, 1692.3, -5264.6, 73.6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 156, 1692.11, -5250.6, 73.6483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 157, 1692.63, -5236.61, 73.6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 158, 1692.82, -5208.33, 74.5818, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 159, 1691.54, -5194.22, 74.3519, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 160, 1689.04, -5179.5, 73.7525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 161, 1688.37, -5167.2, 74.0196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 162, 1689.2, -5148.94, 73.9898, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 163, 1692.9, -5135.44, 73.9792, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 164, 1696.68, -5121.96, 73.635, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 165, 1701.06, -5108.66, 73.8469, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 166, 1705.44, -5095.36, 75.2536, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 167, 1709.99, -5082.13, 77.0799, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 168, 1719.44, -5055.79, 80.2728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 169, 1724.26, -5043.46, 80.971, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 170, 1730.67, -5031.01, 80.5085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 171, 1737.68, -5018.9, 79.8718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 172, 1745.35, -5007.19, 79.9026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 173, 1753.88, -4996.09, 80.5182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 174, 1767.4, -4976.89, 81.2276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 175, 1767.4, -4976.89, 81.2276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 176, 1775.97, -4950.24, 81.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 177, 1776.51, -4947.29, 81.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 178, 1777.52, -4926.07, 81.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 179, 1780.13, -4912.33, 83.3272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 180, 1783.27, -4898.71, 84.598, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 181, 1789.69, -4871.46, 87.9183, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 182, 1792.95, -4857.85, 88.9561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 183, 1796.96, -4844.43, 89.4975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 184, 1805.14, -4817.71, 90.3367, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 185, 1808.62, -4804.17, 91.0512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 186, 1816.93, -4777.44, 89.9966, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 187, 1821.55, -4764.22, 89.432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 188, 1826.01, -4750.95, 88.8843, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 189, 1830.97, -4737.86, 89.5994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 190, 1839.49, -4721.28, 92.0094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 191, 1845.28, -4714.44, 92.8539, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 192, 1860.72, -4701.57, 93.1845, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 193, 1872.65, -4694.25, 92.4181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 194, 1885.11, -4687.87, 92.2616, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 195, 1904.18, -4677.57, 92.1922, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 196, 1912.17, -4672.71, 90.9401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 197, 1924.91, -4662.33, 88.3133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 198, 1931.1, -4654.42, 86.4454, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 199, 1938.72, -4643.36, 83.303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 200, 1946.18, -4630.85, 79.5054, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 201, 1953.08, -4617.63, 76.0027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 202, 1953.08, -4617.63, 76.0027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 203, 1959.1, -4602.76, 73.7886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 204, 1963.22, -4589.38, 73.6763, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 205, 1972.27, -4563.09, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 206, 1979.44, -4554.04, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 207, 1979.44, -4554.04, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 208, 2001.05, -4536.25, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 209, 2011.86, -4527.35, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 210, 2023.68, -4517.96, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 211, 2035.18, -4516.82, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 212, 2046.38, -4516.95, 73.6177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 213, 2056.42, -4528.99, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 214, 2066.79, -4540.75, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 215, 2076.15, -4551.16, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 216, 2085.63, -4561.47, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 217, 2095.37, -4571.51, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 218, 2105.55, -4581.13, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 219, 2116.03, -4590.41, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 220, 2129.99, -4601.9, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 221, 2141.5, -4609.87, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 222, 2152.88, -4617.17, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 223, 2165.29, -4623.63, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 224, 2178.24, -4628.94, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 225, 2203.55, -4635.33, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 226, 2219.18, -4635.86, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 227, 2232.75, -4632.44, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 228, 2246.36, -4629.14, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 229, 2259.78, -4625.16, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 230, 2288.91, -4616.44, 73.623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 231, 2302.42, -4612.78, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 232, 2329.74, -4606.77, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 233, 2343.6, -4604.8, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 234, 2378.01, -4602.57, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 235, 2386.76, -4602.71, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 236, 2418.2, -4611.25, 73.1306, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 237, 2418.2, -4611.25, 73.1306, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 238, 2443.5, -4622.86, 73.6178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 239, 2454.51, -4628.33, 73.6491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 240, 2463.47, -4635, 74.5325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 241, 2474.77, -4643.27, 74.7895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 242, 2494.21, -4656.75, 75.2786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 243, 2502.05, -4656.89, 75.6033, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 244, 2516.04, -4656.43, 76.2191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 245, 2538.2, -4655.03, 77.4241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 246, 2557.73, -4649.54, 78.6479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 247, 2564.91, -4646.93, 79.1957, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 248, 2589.33, -4633.41, 81.3069, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 249, 2601.15, -4625.91, 82.5634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 250, 2624.77, -4610.93, 84.5453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 251, 2646, -4598.04, 84.7882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 252, 2670.25, -4584.03, 85.9516, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 253, 2682.35, -4577, 86.8728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 254, 2706.52, -4562.86, 87.512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 255, 2718.6, -4555.78, 87.8583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 256, 2740.66, -4542.51, 88.5981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 257, 2761.04, -4523.31, 89.1896, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 258, 2771.04, -4513.51, 89.4811, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 259, 2780.72, -4503.4, 89.676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 260, 2800.02, -4483.11, 89.9421, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 261, 2809.57, -4472.88, 89.9774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 262, 2828.65, -4451.18, 89.8812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 263, 2836.19, -4439.39, 89.7144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 264, 2843.55, -4427.48, 89.5383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 265, 2851.53, -4414.44, 89.354, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 266, 2865.76, -4390.36, 89.627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 267, 2876.45, -4370.68, 90.0663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 268, 2876.45, -4370.68, 90.0663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 269, 2884.86, -4343.98, 90.4168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 270, 2887.86, -4330.31, 90.5439, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 271, 2892.56, -4302.71, 90.6607, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 272, 2894.81, -4288.89, 90.8644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 273, 2898.81, -4261.2, 91.3345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 274, 2900.39, -4247.29, 91.4736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 275, 2903.91, -4219.53, 92.0372, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 276, 2905.9, -4205.67, 92.4347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 277, 2910.4, -4178.04, 93.4175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 278, 2912.97, -4164.28, 94.0555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 279, 2919.05, -4136.95, 95.3983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 280, 2921.99, -4123.26, 95.8835, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 281, 2928.13, -4095.94, 96.9042, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 282, 2932.83, -4076.02, 97.7112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 283, 2942.05, -4049.59, 98.866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 284, 2947.23, -4036.58, 99.6264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 285, 2960.56, -4002.02, 102.743, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 286, 2966.85, -3987.62, 103.773, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 287, 2970.86, -3977.23, 105.049, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 288, 2975.85, -3964.15, 106.84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 289, 2982.13, -3948.8, 109.272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 290, 2984.8, -3935.65, 112.249, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 291, 2986.56, -3923.11, 114.193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 292, 2990.03, -3910.13, 115.868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 293, 2993.69, -3896.82, 117.056, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 294, 3002.85, -3870.4, 119.344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 295, 3010.12, -3844.52, 119.307, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 296, 3015.36, -3831.54, 119.114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 297, 3020.52, -3818.53, 118.882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 298, 3028.86, -3797.77, 120.138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 299, 3034.33, -3784.88, 119.719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 300, 3039.39, -3771.83, 119.753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 301, 3044.39, -3758.75, 120.371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 302, 3054.84, -3732.77, 119.624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 303, 3060.01, -3719.77, 119.674, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 304, 3066.23, -3696.89, 121.046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 305, 3061.06, -3682.14, 121.267, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 306, 3054.64, -3669.71, 121.492, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 307, 3048.19, -3657.28, 122.826, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 308, 3039.67, -3639.08, 125.316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 309, 3039.67, -3639.08, 125.316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 310, 3040.52, -3611.1, 123.771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 311, 3040.52, -3611.1, 123.771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 312, 3040.54, -3583.1, 124.342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 313, 3040.79, -3569.11, 124.606, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 314, 3043.87, -3543.57, 128.466, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 315, 3045.52, -3533.85, 129.747, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 316, 3048.93, -3516.29, 131.005, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 317, 3054.52, -3499.33, 131.368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 318, 3060.67, -3486.76, 132.204, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 319, 3066.71, -3475.76, 133.507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 320, 3073.58, -3465.56, 134.225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 321, 3087.14, -3450.16, 136.008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 322, 3096.19, -3439.48, 136.685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 323, 3105.27, -3428.82, 137.747, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 324, 3118.73, -3414.38, 138.717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 325, 3130.82, -3403.98, 139.314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 326, 3130.82, -3403.98, 139.314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 327, 3154.67, -3399.97, 140.236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 328, 3164.9, -3393.8, 141.343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 329, 3174.83, -3390.44, 142.351, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 330, 3188.71, -3388.67, 143.537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 331, 3202.59, -3386.91, 143.977, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 332, 3216.47, -3385.1, 144.308, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 333, 3241.87, -3382.5, 144.041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 334, 3241.87, -3382.5, 144.041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 335, 3265.35, -3381.1, 143.423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 336, 3282.5, -3380.54, 141.646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 337, 3282.5, -3380.54, 141.646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 338, 3308.62, -3380.18, 145.026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 339, 3317.47, -3384.49, 145.191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 340, 3323.5, -3378.4, 144.885, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 341, 3316.82, -3374.45, 145.2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 342, 3308.93, -3379.2, 145.046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 343, 3298.54, -3379.34, 143.999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 344, 3282.1, -3379.46, 141.682, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 345, 3282.1, -3379.46, 141.682, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 346, 3268.19, -3380.16, 143.35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 347, 3240.31, -3382.36, 144.11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 348, 3226.39, -3383.9, 144.231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 349, 3212.47, -3385.4, 144.286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 350, 3198.58, -3387.11, 143.804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 351, 3173.44, -3390.51, 142.236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 352, 3160.48, -3395.77, 140.741, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 353, 3147.82, -3401.76, 139.915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 354, 3147.82, -3401.76, 139.915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 355, 3125.18, -3408.02, 138.783, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 356, 3116.41, -3415.59, 138.744, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 357, 3104.3, -3429.54, 137.707, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 358, 3095.1, -3440.1, 136.525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 359, 3085.9, -3450.64, 136.005, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 360, 3076.85, -3461.33, 134.886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 361, 3061.5, -3480.09, 133.085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 362, 3057, -3490.35, 131.777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 363, 3057, -3490.35, 131.777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 364, 3048, -3517.59, 130.921, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 365, 3045.68, -3531.4, 129.856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 366, 3043.38, -3550.1, 127.313, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 367, 3041.8, -3564.01, 125.215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 368, 3040.59, -3584.29, 124.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 369, 3040.59, -3584.29, 124.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 370, 3040.38, -3612.29, 123.785, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 371, 3040.45, -3633.55, 125.423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 372, 3041.6, -3643.53, 124.637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 373, 3045.88, -3655, 122.907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 374, 3045.88, -3655, 122.907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 375, 3056.15, -3673.64, 121.304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 376, 3061.19, -3684.48, 121.261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 377, 3061.19, -3684.48, 121.261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 378, 3063.56, -3708.12, 120.637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 379, 3059.78, -3719.85, 119.67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 380, 3059.78, -3719.85, 119.67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 381, 3049.65, -3745.96, 120.504, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 382, 3044.65, -3759.04, 120.332, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 383, 3034.49, -3785.13, 119.718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 384, 3029.71, -3797.06, 120.134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 385, 3024.25, -3809.95, 119.169, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 386, 3018.73, -3822.81, 118.88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 387, 3013.26, -3835.7, 119.216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 388, 3008.53, -3848.88, 119.304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 389, 3001.47, -3870.48, 119.263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 390, 2997.35, -3883.86, 118.357, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 391, 2993.23, -3897.24, 117.025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 392, 2989.51, -3910.73, 115.778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 393, 2985.56, -3924.16, 114.025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 394, 2982.06, -3947.47, 109.477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 395, 2978.72, -3956.6, 107.868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 396, 2972.76, -3969.26, 106.065, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 397, 2967.51, -3982.23, 104.16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 398, 2962.49, -3995.3, 103.002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 399, 2952.63, -4021.5, 100.585, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 400, 2947.63, -4034.58, 99.7325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 401, 2942.7, -4047.68, 98.9784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 402, 2932.97, -4073.94, 97.7989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 403, 2925.47, -4096.79, 96.8862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 404, 2922.65, -4110.5, 96.3581, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 405, 2919.92, -4124.23, 95.8468, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 406, 2917.19, -4137.96, 95.2586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 407, 2911.73, -4165.43, 93.9918, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 408, 2906.99, -4193.01, 92.8379, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 409, 2905.16, -4206.89, 92.4011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 410, 2901.43, -4234.64, 91.663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 411, 2897.57, -4262.38, 91.2693, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 412, 2893.59, -4290.09, 90.7786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 413, 2892.09, -4304.01, 90.6426, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 414, 2889.1, -4328.23, 90.6049, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 415, 2881.19, -4355.07, 90.2687, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 416, 2876.07, -4368.09, 90.0269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 417, 2870.4, -4380.9, 89.8314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 418, 2857.33, -4405.65, 89.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 419, 2849.99, -4417.56, 89.3987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 420, 2835.05, -4441.25, 89.7445, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18629, 421, 2823.28, -4458.62, 89.9473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 1, 2806.6, -4475.69, 89.9669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 2, 2801.03, -4481.72, 89.9453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 3, 2789.95, -4493.86, 89.8303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 4, 2780.41, -4504.1, 89.6763, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 5, 2770.79, -4514.28, 89.4751, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 6, 2750.62, -4533.67, 88.8859, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 7, 2737.98, -4543.55, 88.4874, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 8, 2725.94, -4550.69, 88.0814, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 9, 2701.68, -4564.66, 87.4361, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 10, 2677.69, -4579.1, 86.5389, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 11, 2665.6, -4586.15, 85.6021, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 12, 2653.44, -4593.09, 84.9497, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 13, 2641.25, -4599.98, 84.6561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 14, 2629.2, -4607.1, 84.5638, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 15, 2617.23, -4614.37, 84.1513, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 16, 2605.27, -4621.64, 83.0451, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 17, 2581.34, -4636.17, 80.6435, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 18, 2569.34, -4643.39, 79.6035, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 19, 2555.86, -4651.34, 78.5097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 20, 2555.86, -4651.34, 78.5097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 21, 2541.99, -4653.26, 77.6674, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 22, 2528.11, -4655.13, 76.8887, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 23, 2505.79, -4656.55, 75.7666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 24, 2494.38, -4653.2, 75.2749, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 25, 2490.17, -4650.14, 75.2223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 26, 2478.56, -4642.32, 74.92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 27, 2455.83, -4629.1, 73.8051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 28, 2455.83, -4629.1, 73.8051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 29, 2443.22, -4623.03, 73.6193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 30, 2419.33, -4611.98, 73.6116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 31, 2419.33, -4611.98, 73.6116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 32, 2406.41, -4606.58, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 33, 2387.14, -4601.94, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 34, 2373.14, -4601.96, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 35, 2359.15, -4602.4, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 36, 2329.02, -4604.86, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 37, 2329.02, -4604.86, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 38, 2315.49, -4608.48, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 39, 2290.81, -4615.13, 73.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 40, 2290.81, -4615.13, 73.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 41, 2264.2, -4623.86, 73.6226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 42, 2250.99, -4628.48, 73.6226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 43, 2237.84, -4633.28, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 44, 2233.65, -4634.8, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 45, 2219.92, -4636.19, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 46, 2198.31, -4635.8, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 47, 2179.83, -4630.2, 73.6186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 48, 2167.25, -4624.07, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 49, 2154.81, -4617.65, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 50, 2137.87, -4608.21, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 51, 2117.11, -4592.4, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 52, 2107.2, -4582.51, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 53, 2097.31, -4572.6, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 54, 2082.78, -4558.14, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 55, 2072.97, -4548.16, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 56, 2064.02, -4537.4, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 57, 2054.73, -4526.93, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 58, 2039, -4511.27, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 59, 2039, -4511.27, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 60, 2018.56, -4522.04, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 61, 2007.33, -4530.39, 73.6182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 62, 1996.49, -4539.26, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 63, 1978.09, -4555.64, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 64, 1972.04, -4568.26, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 65, 1966.19, -4580.98, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 66, 1961.34, -4594.06, 73.7168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 67, 1955.04, -4614.18, 75.4099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 68, 1955.04, -4614.18, 75.4099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 69, 1947.56, -4631.23, 79.4311, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 70, 1937.66, -4647.88, 84.2933, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 71, 1926.19, -4661.08, 88.0589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 72, 1926.19, -4661.08, 88.0589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 73, 1905.62, -4675.24, 91.8144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 74, 1905.62, -4675.24, 91.8144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 75, 1881.04, -4688.64, 92.3108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 76, 1869, -4695.77, 92.4244, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 77, 1860, -4701.3, 93.179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 78, 1860, -4701.3, 93.179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 79, 1849.8, -4710.89, 93.0538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 80, 1837.28, -4725.44, 91.5627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 81, 1830.15, -4738.08, 89.5755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 82, 1830.15, -4738.08, 89.5755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 83, 1820.18, -4764.23, 89.4855, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 84, 1815.28, -4777.32, 90.0434, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 85, 1810.99, -4790.65, 91.0152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 86, 1807.67, -4804.24, 91.0432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 87, 1803.59, -4821.49, 90.2337, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 88, 1803.59, -4821.49, 90.2337, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 89, 1794.39, -4846.34, 89.3225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 90, 1790.23, -4862.21, 88.9506, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 91, 1787.49, -4875.94, 87.5193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 92, 1784.76, -4889.67, 85.7993, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 93, 1782.02, -4903.4, 84.1647, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 94, 1779.58, -4917.19, 82.4565, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 95, 1775, -4944.8, 81.4627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 96, 1771.96, -4958.47, 81.1755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 97, 1764.57, -4979.36, 81.2285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 98, 1756.67, -4990.91, 80.8094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 99, 1740.73, -5013.93, 79.9026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 100, 1733.39, -5025.82, 80.0289, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 101, 1726.52, -5037.79, 80.8024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 102, 1721.85, -5050.98, 80.5791, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 103, 1717.05, -5064.14, 79.3981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 104, 1707.47, -5090.45, 76.1053, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 105, 1702.67, -5103.6, 74.1361, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 106, 1697.88, -5116.75, 73.6418, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 107, 1689.39, -5143.42, 74.0518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 108, 1688.38, -5155.8, 73.8026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 109, 1688.19, -5178.9, 73.7914, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 110, 1691, -5191.24, 74.2004, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 111, 1692.89, -5206.03, 74.6583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 112, 1692.98, -5219.47, 73.7034, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 113, 1692.8, -5230.67, 73.649, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 114, 1692.53, -5244.65, 73.6146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 115, 1692.25, -5258.64, 73.6153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 116, 1691.76, -5284.04, 73.6112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 117, 1691.76, -5284.04, 73.6112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 118, 1689.02, -5297.77, 73.6112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 119, 1674.76, -5326.32, 73.6109, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 120, 1662.76, -5333.81, 73.6113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 121, 1664.54, -5346, 73.624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 122, 1670.22, -5354.8, 73.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 123, 1675.94, -5362.78, 73.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 124, 1675.94, -5362.78, 73.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 125, 1672.23, -5376.28, 73.6121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 126, 1665.09, -5396.89, 74.1377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 127, 1661.45, -5407.44, 76.5412, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 128, 1661.45, -5407.44, 76.5412, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 129, 1651.98, -5433.79, 85.4015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 130, 1647.13, -5446.92, 90.4724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 131, 1644.19, -5454.79, 93.9639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 132, 1644.19, -5454.79, 93.9639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 133, 1636.28, -5476.14, 100.092, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 134, 1634.69, -5479.97, 100.622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 135, 1626.74, -5497.12, 100.729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 136, 1626.74, -5497.12, 100.729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 137, 1637.62, -5473.45, 99.5326, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 138, 1642.48, -5459.89, 95.3215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 139, 1645, -5453.23, 93.4343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 140, 1648.64, -5443.44, 88.7457, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 141, 1652.9, -5431.88, 84.7826, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 142, 1657.94, -5418.22, 80.3251, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 143, 1662.96, -5403.37, 75.3562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 144, 1662.96, -5403.37, 75.3562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 145, 1667.44, -5390.11, 73.612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 146, 1676.35, -5365.76, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 147, 1681.65, -5360.49, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 148, 1691.69, -5355.51, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 149, 1697.73, -5349, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 150, 1696.66, -5338.61, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 151, 1685.3, -5319.3, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 152, 1685.3, -5319.3, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 153, 1689.16, -5291.58, 73.6121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 154, 1691.67, -5277.81, 73.6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 155, 1692.3, -5264.6, 73.6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 156, 1692.11, -5250.6, 73.6483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 157, 1692.63, -5236.61, 73.6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 158, 1692.82, -5208.33, 74.5818, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 159, 1691.54, -5194.22, 74.3519, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 160, 1689.04, -5179.5, 73.7525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 161, 1688.37, -5167.2, 74.0196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 162, 1689.2, -5148.94, 73.9898, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 163, 1692.9, -5135.44, 73.9792, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 164, 1696.68, -5121.96, 73.635, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 165, 1701.06, -5108.66, 73.8469, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 166, 1705.44, -5095.36, 75.2536, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 167, 1709.99, -5082.13, 77.0799, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 168, 1719.44, -5055.79, 80.2728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 169, 1724.26, -5043.46, 80.971, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 170, 1730.67, -5031.01, 80.5085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 171, 1737.68, -5018.9, 79.8718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 172, 1745.35, -5007.19, 79.9026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 173, 1753.88, -4996.09, 80.5182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 174, 1767.4, -4976.89, 81.2276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 175, 1767.4, -4976.89, 81.2276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 176, 1775.97, -4950.24, 81.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 177, 1776.51, -4947.29, 81.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 178, 1777.52, -4926.07, 81.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 179, 1780.13, -4912.33, 83.3272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 180, 1783.27, -4898.71, 84.598, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 181, 1789.69, -4871.46, 87.9183, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 182, 1792.95, -4857.85, 88.9561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 183, 1796.96, -4844.43, 89.4975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 184, 1805.14, -4817.71, 90.3367, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 185, 1808.62, -4804.17, 91.0512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 186, 1816.93, -4777.44, 89.9966, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 187, 1821.55, -4764.22, 89.432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 188, 1826.01, -4750.95, 88.8843, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 189, 1830.97, -4737.86, 89.5994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 190, 1839.49, -4721.28, 92.0094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 191, 1845.28, -4714.44, 92.8539, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 192, 1860.72, -4701.57, 93.1845, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 193, 1872.65, -4694.25, 92.4181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 194, 1885.11, -4687.87, 92.2616, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 195, 1904.18, -4677.57, 92.1922, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 196, 1912.17, -4672.71, 90.9401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 197, 1924.91, -4662.33, 88.3133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 198, 1931.1, -4654.42, 86.4454, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 199, 1938.72, -4643.36, 83.303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 200, 1946.18, -4630.85, 79.5054, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 201, 1953.08, -4617.63, 76.0027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 202, 1953.08, -4617.63, 76.0027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 203, 1959.1, -4602.76, 73.7886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 204, 1963.22, -4589.38, 73.6763, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 205, 1972.27, -4563.09, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 206, 1979.44, -4554.04, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 207, 1979.44, -4554.04, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 208, 2001.05, -4536.25, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 209, 2011.86, -4527.35, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 210, 2023.68, -4517.96, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 211, 2035.18, -4516.82, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 212, 2046.38, -4516.95, 73.6177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 213, 2056.42, -4528.99, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 214, 2066.79, -4540.75, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 215, 2076.15, -4551.16, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(18512, 216, 2085.63, -4561.47, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 217, 2095.37, -4571.51, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 218, 2105.55, -4581.13, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 219, 2116.03, -4590.41, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 220, 2129.99, -4601.9, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 221, 2141.5, -4609.87, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 222, 2152.88, -4617.17, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 223, 2165.29, -4623.63, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 224, 2178.24, -4628.94, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 225, 2203.55, -4635.33, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 226, 2219.18, -4635.86, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 227, 2232.75, -4632.44, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 228, 2246.36, -4629.14, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 229, 2259.78, -4625.16, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 230, 2288.91, -4616.44, 73.623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 231, 2302.42, -4612.78, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 232, 2329.74, -4606.77, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 233, 2343.6, -4604.8, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 234, 2378.01, -4602.57, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 235, 2386.76, -4602.71, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 236, 2418.2, -4611.25, 73.1306, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 237, 2418.2, -4611.25, 73.1306, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 238, 2443.5, -4622.86, 73.6178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 239, 2454.51, -4628.33, 73.6491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 240, 2463.47, -4635, 74.5325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 241, 2474.77, -4643.27, 74.7895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 242, 2494.21, -4656.75, 75.2786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 243, 2502.05, -4656.89, 75.6033, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 244, 2516.04, -4656.43, 76.2191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 245, 2538.2, -4655.03, 77.4241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 246, 2557.73, -4649.54, 78.6479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 247, 2564.91, -4646.93, 79.1957, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 248, 2589.33, -4633.41, 81.3069, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 249, 2601.15, -4625.91, 82.5634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 250, 2624.77, -4610.93, 84.5453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 251, 2646, -4598.04, 84.7882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 252, 2670.25, -4584.03, 85.9516, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 253, 2682.35, -4577, 86.8728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 254, 2706.52, -4562.86, 87.512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 255, 2718.6, -4555.78, 87.8583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 256, 2740.66, -4542.51, 88.5981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 257, 2761.04, -4523.31, 89.1896, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 258, 2771.04, -4513.51, 89.4811, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 259, 2780.72, -4503.4, 89.676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 260, 2800.02, -4483.11, 89.9421, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 261, 2809.57, -4472.88, 89.9774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 262, 2828.65, -4451.18, 89.8812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 263, 2836.19, -4439.39, 89.7144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 264, 2843.55, -4427.48, 89.5383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 265, 2851.53, -4414.44, 89.354, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 266, 2865.76, -4390.36, 89.627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 267, 2876.45, -4370.68, 90.0663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 268, 2876.45, -4370.68, 90.0663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 269, 2884.86, -4343.98, 90.4168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 270, 2887.86, -4330.31, 90.5439, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 271, 2892.56, -4302.71, 90.6607, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 272, 2894.81, -4288.89, 90.8644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 273, 2898.81, -4261.2, 91.3345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 274, 2900.39, -4247.29, 91.4736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 275, 2903.91, -4219.53, 92.0372, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 276, 2905.9, -4205.67, 92.4347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 277, 2910.4, -4178.04, 93.4175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 278, 2912.97, -4164.28, 94.0555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 279, 2919.05, -4136.95, 95.3983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 280, 2921.99, -4123.26, 95.8835, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 281, 2928.13, -4095.94, 96.9042, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 282, 2932.83, -4076.02, 97.7112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 283, 2942.05, -4049.59, 98.866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 284, 2947.23, -4036.58, 99.6264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 285, 2960.56, -4002.02, 102.743, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 286, 2966.85, -3987.62, 103.773, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 287, 2970.86, -3977.23, 105.049, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 288, 2975.85, -3964.15, 106.84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 289, 2982.13, -3948.8, 109.272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 290, 2984.8, -3935.65, 112.249, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 291, 2986.56, -3923.11, 114.193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 292, 2990.03, -3910.13, 115.868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 293, 2993.69, -3896.82, 117.056, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 294, 3002.85, -3870.4, 119.344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 295, 3010.12, -3844.52, 119.307, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 296, 3015.36, -3831.54, 119.114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 297, 3020.52, -3818.53, 118.882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 298, 3028.86, -3797.77, 120.138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 299, 3034.33, -3784.88, 119.719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 300, 3039.39, -3771.83, 119.753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 301, 3044.39, -3758.75, 120.371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 302, 3054.84, -3732.77, 119.624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 303, 3060.01, -3719.77, 119.674, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 304, 3066.23, -3696.89, 121.046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 305, 3061.06, -3682.14, 121.267, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 306, 3054.64, -3669.71, 121.492, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 307, 3048.19, -3657.28, 122.826, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 308, 3039.67, -3639.08, 125.316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 309, 3039.67, -3639.08, 125.316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 310, 3040.52, -3611.1, 123.771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 311, 3040.52, -3611.1, 123.771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 312, 3040.54, -3583.1, 124.342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 313, 3040.79, -3569.11, 124.606, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 314, 3043.87, -3543.57, 128.466, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 315, 3045.52, -3533.85, 129.747, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 316, 3048.93, -3516.29, 131.005, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 317, 3054.52, -3499.33, 131.368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 318, 3060.67, -3486.76, 132.204, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 319, 3066.71, -3475.76, 133.507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 320, 3073.58, -3465.56, 134.225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 321, 3087.14, -3450.16, 136.008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 322, 3096.19, -3439.48, 136.685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 323, 3105.27, -3428.82, 137.747, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 324, 3118.73, -3414.38, 138.717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 325, 3130.82, -3403.98, 139.314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 326, 3130.82, -3403.98, 139.314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 327, 3154.67, -3399.97, 140.236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 328, 3164.9, -3393.8, 141.343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 329, 3174.83, -3390.44, 142.351, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 330, 3188.71, -3388.67, 143.537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 331, 3202.59, -3386.91, 143.977, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 332, 3216.47, -3385.1, 144.308, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 333, 3241.87, -3382.5, 144.041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 334, 3241.87, -3382.5, 144.041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 335, 3265.35, -3381.1, 143.423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 336, 3282.5, -3380.54, 141.646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 337, 3282.5, -3380.54, 141.646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 338, 3308.62, -3380.18, 145.026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 339, 3317.47, -3384.49, 145.191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 340, 3323.5, -3378.4, 144.885, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 341, 3316.82, -3374.45, 145.2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 342, 3308.93, -3379.2, 145.046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 343, 3298.54, -3379.34, 143.999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 344, 3282.1, -3379.46, 141.682, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 345, 3282.1, -3379.46, 141.682, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 346, 3268.19, -3380.16, 143.35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 347, 3240.31, -3382.36, 144.11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 348, 3226.39, -3383.9, 144.231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 349, 3212.47, -3385.4, 144.286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 350, 3198.58, -3387.11, 143.804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 351, 3173.44, -3390.51, 142.236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 352, 3160.48, -3395.77, 140.741, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 353, 3147.82, -3401.76, 139.915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 354, 3147.82, -3401.76, 139.915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 355, 3125.18, -3408.02, 138.783, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 356, 3116.41, -3415.59, 138.744, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 357, 3104.3, -3429.54, 137.707, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 358, 3095.1, -3440.1, 136.525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 359, 3085.9, -3450.64, 136.005, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 360, 3076.85, -3461.33, 134.886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 361, 3061.5, -3480.09, 133.085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 362, 3057, -3490.35, 131.777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 363, 3057, -3490.35, 131.777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 364, 3048, -3517.59, 130.921, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 365, 3045.68, -3531.4, 129.856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 366, 3043.38, -3550.1, 127.313, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 367, 3041.8, -3564.01, 125.215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 368, 3040.59, -3584.29, 124.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 369, 3040.59, -3584.29, 124.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 370, 3040.38, -3612.29, 123.785, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 371, 3040.45, -3633.55, 125.423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 372, 3041.6, -3643.53, 124.637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 373, 3045.88, -3655, 122.907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 374, 3045.88, -3655, 122.907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 375, 3056.15, -3673.64, 121.304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 376, 3061.19, -3684.48, 121.261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 377, 3061.19, -3684.48, 121.261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 378, 3063.56, -3708.12, 120.637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 379, 3059.78, -3719.85, 119.67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 380, 3059.78, -3719.85, 119.67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 381, 3049.65, -3745.96, 120.504, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 382, 3044.65, -3759.04, 120.332, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 383, 3034.49, -3785.13, 119.718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 384, 3029.71, -3797.06, 120.134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 385, 3024.25, -3809.95, 119.169, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 386, 3018.73, -3822.81, 118.88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 387, 3013.26, -3835.7, 119.216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 388, 3008.53, -3848.88, 119.304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 389, 3001.47, -3870.48, 119.263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 390, 2997.35, -3883.86, 118.357, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 391, 2993.23, -3897.24, 117.025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 392, 2989.51, -3910.73, 115.778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 393, 2985.56, -3924.16, 114.025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 394, 2982.06, -3947.47, 109.477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 395, 2978.72, -3956.6, 107.868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 396, 2972.76, -3969.26, 106.065, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 397, 2967.51, -3982.23, 104.16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 398, 2962.49, -3995.3, 103.002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 399, 2952.63, -4021.5, 100.585, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 400, 2947.63, -4034.58, 99.7325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 401, 2942.7, -4047.68, 98.9784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 402, 2932.97, -4073.94, 97.7989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 403, 2925.47, -4096.79, 96.8862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 404, 2922.65, -4110.5, 96.3581, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 405, 2919.92, -4124.23, 95.8468, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 406, 2917.19, -4137.96, 95.2586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 407, 2911.73, -4165.43, 93.9918, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 408, 2906.99, -4193.01, 92.8379, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 409, 2905.16, -4206.89, 92.4011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 410, 2901.43, -4234.64, 91.663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 411, 2897.57, -4262.38, 91.2693, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 412, 2893.59, -4290.09, 90.7786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 413, 2892.09, -4304.01, 90.6426, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 414, 2889.1, -4328.23, 90.6049, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 415, 2881.19, -4355.07, 90.2687, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 416, 2876.07, -4368.09, 90.0269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 417, 2870.4, -4380.9, 89.8314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 418, 2857.33, -4405.65, 89.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 419, 2849.99, -4417.56, 89.3987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 420, 2835.05, -4441.25, 89.7445, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18512, 421, 2823.28, -4458.62, 89.9473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 1, 2806.6, -4475.69, 89.9669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 2, 2801.03, -4481.72, 89.9453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 3, 2789.95, -4493.86, 89.8303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 4, 2780.41, -4504.1, 89.6763, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 5, 2770.79, -4514.28, 89.4751, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 6, 2750.62, -4533.67, 88.8859, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 7, 2737.98, -4543.55, 88.4874, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 8, 2725.94, -4550.69, 88.0814, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 9, 2701.68, -4564.66, 87.4361, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 10, 2677.69, -4579.1, 86.5389, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 11, 2665.6, -4586.15, 85.6021, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 12, 2653.44, -4593.09, 84.9497, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 13, 2641.25, -4599.98, 84.6561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 14, 2629.2, -4607.1, 84.5638, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 15, 2617.23, -4614.37, 84.1513, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 16, 2605.27, -4621.64, 83.0451, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 17, 2581.34, -4636.17, 80.6435, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 18, 2569.34, -4643.39, 79.6035, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 19, 2555.86, -4651.34, 78.5097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 20, 2555.86, -4651.34, 78.5097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 21, 2541.99, -4653.26, 77.6674, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 22, 2528.11, -4655.13, 76.8887, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 23, 2505.79, -4656.55, 75.7666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 24, 2494.38, -4653.2, 75.2749, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 25, 2490.17, -4650.14, 75.2223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 26, 2478.56, -4642.32, 74.92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 27, 2455.83, -4629.1, 73.8051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 28, 2455.83, -4629.1, 73.8051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 29, 2443.22, -4623.03, 73.6193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 30, 2419.33, -4611.98, 73.6116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 31, 2419.33, -4611.98, 73.6116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 32, 2406.41, -4606.58, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 33, 2387.14, -4601.94, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 34, 2373.14, -4601.96, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 35, 2359.15, -4602.4, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 36, 2329.02, -4604.86, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 37, 2329.02, -4604.86, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 38, 2315.49, -4608.48, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 39, 2290.81, -4615.13, 73.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 40, 2290.81, -4615.13, 73.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 41, 2264.2, -4623.86, 73.6226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 42, 2250.99, -4628.48, 73.6226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 43, 2237.84, -4633.28, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 44, 2233.65, -4634.8, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 45, 2219.92, -4636.19, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 46, 2198.31, -4635.8, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 47, 2179.83, -4630.2, 73.6186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 48, 2167.25, -4624.07, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 49, 2154.81, -4617.65, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 50, 2137.87, -4608.21, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 51, 2117.11, -4592.4, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 52, 2107.2, -4582.51, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 53, 2097.31, -4572.6, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 54, 2082.78, -4558.14, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 55, 2072.97, -4548.16, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 56, 2064.02, -4537.4, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 57, 2054.73, -4526.93, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 58, 2039, -4511.27, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 59, 2039, -4511.27, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 60, 2018.56, -4522.04, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 61, 2007.33, -4530.39, 73.6182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 62, 1996.49, -4539.26, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 63, 1978.09, -4555.64, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 64, 1972.04, -4568.26, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 65, 1966.19, -4580.98, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 66, 1961.34, -4594.06, 73.7168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 67, 1955.04, -4614.18, 75.4099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 68, 1955.04, -4614.18, 75.4099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 69, 1947.56, -4631.23, 79.4311, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 70, 1937.66, -4647.88, 84.2933, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 71, 1926.19, -4661.08, 88.0589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 72, 1926.19, -4661.08, 88.0589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 73, 1905.62, -4675.24, 91.8144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 74, 1905.62, -4675.24, 91.8144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 75, 1881.04, -4688.64, 92.3108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 76, 1869, -4695.77, 92.4244, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 77, 1860, -4701.3, 93.179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 78, 1860, -4701.3, 93.179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 79, 1849.8, -4710.89, 93.0538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 80, 1837.28, -4725.44, 91.5627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 81, 1830.15, -4738.08, 89.5755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 82, 1830.15, -4738.08, 89.5755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 83, 1820.18, -4764.23, 89.4855, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 84, 1815.28, -4777.32, 90.0434, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 85, 1810.99, -4790.65, 91.0152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 86, 1807.67, -4804.24, 91.0432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 87, 1803.59, -4821.49, 90.2337, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 88, 1803.59, -4821.49, 90.2337, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 89, 1794.39, -4846.34, 89.3225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 90, 1790.23, -4862.21, 88.9506, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 91, 1787.49, -4875.94, 87.5193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 92, 1784.76, -4889.67, 85.7993, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 93, 1782.02, -4903.4, 84.1647, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 94, 1779.58, -4917.19, 82.4565, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 95, 1775, -4944.8, 81.4627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 96, 1771.96, -4958.47, 81.1755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 97, 1764.57, -4979.36, 81.2285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 98, 1756.67, -4990.91, 80.8094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 99, 1740.73, -5013.93, 79.9026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 100, 1733.39, -5025.82, 80.0289, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 101, 1726.52, -5037.79, 80.8024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 102, 1721.85, -5050.98, 80.5791, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 103, 1717.05, -5064.14, 79.3981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 104, 1707.47, -5090.45, 76.1053, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 105, 1702.67, -5103.6, 74.1361, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 106, 1697.88, -5116.75, 73.6418, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 107, 1689.39, -5143.42, 74.0518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 108, 1688.38, -5155.8, 73.8026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 109, 1688.19, -5178.9, 73.7914, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 110, 1691, -5191.24, 74.2004, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 111, 1692.89, -5206.03, 74.6583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 112, 1692.98, -5219.47, 73.7034, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 113, 1692.8, -5230.67, 73.649, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 114, 1692.53, -5244.65, 73.6146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 115, 1692.25, -5258.64, 73.6153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 116, 1691.76, -5284.04, 73.6112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 117, 1691.76, -5284.04, 73.6112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 118, 1689.02, -5297.77, 73.6112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 119, 1674.76, -5326.32, 73.6109, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 120, 1662.76, -5333.81, 73.6113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 121, 1664.54, -5346, 73.624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 122, 1670.22, -5354.8, 73.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 123, 1675.94, -5362.78, 73.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 124, 1675.94, -5362.78, 73.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 125, 1672.23, -5376.28, 73.6121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 126, 1665.09, -5396.89, 74.1377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 127, 1661.45, -5407.44, 76.5412, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 128, 1661.45, -5407.44, 76.5412, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 129, 1651.98, -5433.79, 85.4015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 130, 1647.13, -5446.92, 90.4724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 131, 1644.19, -5454.79, 93.9639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 132, 1644.19, -5454.79, 93.9639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 133, 1636.28, -5476.14, 100.092, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 134, 1634.69, -5479.97, 100.622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 135, 1626.74, -5497.12, 100.729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 136, 1626.74, -5497.12, 100.729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 137, 1637.62, -5473.45, 99.5326, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 138, 1642.48, -5459.89, 95.3215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 139, 1645, -5453.23, 93.4343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 140, 1648.64, -5443.44, 88.7457, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 141, 1652.9, -5431.88, 84.7826, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 142, 1657.94, -5418.22, 80.3251, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 143, 1662.96, -5403.37, 75.3562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 144, 1662.96, -5403.37, 75.3562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 145, 1667.44, -5390.11, 73.612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 146, 1676.35, -5365.76, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 147, 1681.65, -5360.49, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 148, 1691.69, -5355.51, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 149, 1697.73, -5349, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 150, 1696.66, -5338.61, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 151, 1685.3, -5319.3, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 152, 1685.3, -5319.3, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 153, 1689.16, -5291.58, 73.6121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 154, 1691.67, -5277.81, 73.6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 155, 1692.3, -5264.6, 73.6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 156, 1692.11, -5250.6, 73.6483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 157, 1692.63, -5236.61, 73.6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 158, 1692.82, -5208.33, 74.5818, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 159, 1691.54, -5194.22, 74.3519, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 160, 1689.04, -5179.5, 73.7525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 161, 1688.37, -5167.2, 74.0196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 162, 1689.2, -5148.94, 73.9898, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 163, 1692.9, -5135.44, 73.9792, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 164, 1696.68, -5121.96, 73.635, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 165, 1701.06, -5108.66, 73.8469, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 166, 1705.44, -5095.36, 75.2536, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 167, 1709.99, -5082.13, 77.0799, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 168, 1719.44, -5055.79, 80.2728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 169, 1724.26, -5043.46, 80.971, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 170, 1730.67, -5031.01, 80.5085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 171, 1737.68, -5018.9, 79.8718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 172, 1745.35, -5007.19, 79.9026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 173, 1753.88, -4996.09, 80.5182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 174, 1767.4, -4976.89, 81.2276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 175, 1767.4, -4976.89, 81.2276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 176, 1775.97, -4950.24, 81.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 177, 1776.51, -4947.29, 81.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 178, 1777.52, -4926.07, 81.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 179, 1780.13, -4912.33, 83.3272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 180, 1783.27, -4898.71, 84.598, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 181, 1789.69, -4871.46, 87.9183, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 182, 1792.95, -4857.85, 88.9561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 183, 1796.96, -4844.43, 89.4975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 184, 1805.14, -4817.71, 90.3367, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 185, 1808.62, -4804.17, 91.0512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 186, 1816.93, -4777.44, 89.9966, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 187, 1821.55, -4764.22, 89.432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 188, 1826.01, -4750.95, 88.8843, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 189, 1830.97, -4737.86, 89.5994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 190, 1839.49, -4721.28, 92.0094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 191, 1845.28, -4714.44, 92.8539, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 192, 1860.72, -4701.57, 93.1845, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 193, 1872.65, -4694.25, 92.4181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 194, 1885.11, -4687.87, 92.2616, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 195, 1904.18, -4677.57, 92.1922, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 196, 1912.17, -4672.71, 90.9401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 197, 1924.91, -4662.33, 88.3133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 198, 1931.1, -4654.42, 86.4454, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 199, 1938.72, -4643.36, 83.303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 200, 1946.18, -4630.85, 79.5054, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 201, 1953.08, -4617.63, 76.0027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 202, 1953.08, -4617.63, 76.0027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 203, 1959.1, -4602.76, 73.7886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 204, 1963.22, -4589.38, 73.6763, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 205, 1972.27, -4563.09, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 206, 1979.44, -4554.04, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 207, 1979.44, -4554.04, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 208, 2001.05, -4536.25, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 209, 2011.86, -4527.35, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 210, 2023.68, -4517.96, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 211, 2035.18, -4516.82, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 212, 2046.38, -4516.95, 73.6177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 213, 2056.42, -4528.99, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 214, 2066.79, -4540.75, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 215, 2076.15, -4551.16, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 216, 2085.63, -4561.47, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 217, 2095.37, -4571.51, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 218, 2105.55, -4581.13, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 219, 2116.03, -4590.41, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 220, 2129.99, -4601.9, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 221, 2141.5, -4609.87, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 222, 2152.88, -4617.17, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 223, 2165.29, -4623.63, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 224, 2178.24, -4628.94, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 225, 2203.55, -4635.33, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 226, 2219.18, -4635.86, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 227, 2232.75, -4632.44, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 228, 2246.36, -4629.14, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 229, 2259.78, -4625.16, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 230, 2288.91, -4616.44, 73.623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 231, 2302.42, -4612.78, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 232, 2329.74, -4606.77, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 233, 2343.6, -4604.8, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 234, 2378.01, -4602.57, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 235, 2386.76, -4602.71, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 236, 2418.2, -4611.25, 73.1306, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 237, 2418.2, -4611.25, 73.1306, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 238, 2443.5, -4622.86, 73.6178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 239, 2454.51, -4628.33, 73.6491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 240, 2463.47, -4635, 74.5325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 241, 2474.77, -4643.27, 74.7895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 242, 2494.21, -4656.75, 75.2786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 243, 2502.05, -4656.89, 75.6033, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 244, 2516.04, -4656.43, 76.2191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 245, 2538.2, -4655.03, 77.4241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 246, 2557.73, -4649.54, 78.6479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 247, 2564.91, -4646.93, 79.1957, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 248, 2589.33, -4633.41, 81.3069, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 249, 2601.15, -4625.91, 82.5634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 250, 2624.77, -4610.93, 84.5453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 251, 2646, -4598.04, 84.7882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 252, 2670.25, -4584.03, 85.9516, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 253, 2682.35, -4577, 86.8728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 254, 2706.52, -4562.86, 87.512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 255, 2718.6, -4555.78, 87.8583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 256, 2740.66, -4542.51, 88.5981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 257, 2761.04, -4523.31, 89.1896, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 258, 2771.04, -4513.51, 89.4811, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 259, 2780.72, -4503.4, 89.676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 260, 2800.02, -4483.11, 89.9421, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 261, 2809.57, -4472.88, 89.9774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 262, 2828.65, -4451.18, 89.8812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 263, 2836.19, -4439.39, 89.7144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 264, 2843.55, -4427.48, 89.5383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 265, 2851.53, -4414.44, 89.354, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 266, 2865.76, -4390.36, 89.627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 267, 2876.45, -4370.68, 90.0663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 268, 2876.45, -4370.68, 90.0663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 269, 2884.86, -4343.98, 90.4168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 270, 2887.86, -4330.31, 90.5439, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 271, 2892.56, -4302.71, 90.6607, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 272, 2894.81, -4288.89, 90.8644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 273, 2898.81, -4261.2, 91.3345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 274, 2900.39, -4247.29, 91.4736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 275, 2903.91, -4219.53, 92.0372, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 276, 2905.9, -4205.67, 92.4347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 277, 2910.4, -4178.04, 93.4175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 278, 2912.97, -4164.28, 94.0555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 279, 2919.05, -4136.95, 95.3983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 280, 2921.99, -4123.26, 95.8835, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 281, 2928.13, -4095.94, 96.9042, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 282, 2932.83, -4076.02, 97.7112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 283, 2942.05, -4049.59, 98.866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 284, 2947.23, -4036.58, 99.6264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 285, 2960.56, -4002.02, 102.743, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 286, 2966.85, -3987.62, 103.773, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 287, 2970.86, -3977.23, 105.049, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 288, 2975.85, -3964.15, 106.84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 289, 2982.13, -3948.8, 109.272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 290, 2984.8, -3935.65, 112.249, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 291, 2986.56, -3923.11, 114.193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 292, 2990.03, -3910.13, 115.868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 293, 2993.69, -3896.82, 117.056, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 294, 3002.85, -3870.4, 119.344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 295, 3010.12, -3844.52, 119.307, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 296, 3015.36, -3831.54, 119.114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 297, 3020.52, -3818.53, 118.882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 298, 3028.86, -3797.77, 120.138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 299, 3034.33, -3784.88, 119.719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 300, 3039.39, -3771.83, 119.753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 301, 3044.39, -3758.75, 120.371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 302, 3054.84, -3732.77, 119.624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 303, 3060.01, -3719.77, 119.674, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 304, 3066.23, -3696.89, 121.046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 305, 3061.06, -3682.14, 121.267, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 306, 3054.64, -3669.71, 121.492, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 307, 3048.19, -3657.28, 122.826, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 308, 3039.67, -3639.08, 125.316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 309, 3039.67, -3639.08, 125.316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 310, 3040.52, -3611.1, 123.771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 311, 3040.52, -3611.1, 123.771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 312, 3040.54, -3583.1, 124.342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 313, 3040.79, -3569.11, 124.606, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 314, 3043.87, -3543.57, 128.466, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 315, 3045.52, -3533.85, 129.747, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 316, 3048.93, -3516.29, 131.005, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 317, 3054.52, -3499.33, 131.368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 318, 3060.67, -3486.76, 132.204, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 319, 3066.71, -3475.76, 133.507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 320, 3073.58, -3465.56, 134.225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 321, 3087.14, -3450.16, 136.008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 322, 3096.19, -3439.48, 136.685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 323, 3105.27, -3428.82, 137.747, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 324, 3118.73, -3414.38, 138.717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 325, 3130.82, -3403.98, 139.314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 326, 3130.82, -3403.98, 139.314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 327, 3154.67, -3399.97, 140.236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 328, 3164.9, -3393.8, 141.343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 329, 3174.83, -3390.44, 142.351, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 330, 3188.71, -3388.67, 143.537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 331, 3202.59, -3386.91, 143.977, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 332, 3216.47, -3385.1, 144.308, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 333, 3241.87, -3382.5, 144.041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 334, 3241.87, -3382.5, 144.041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 335, 3265.35, -3381.1, 143.423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 336, 3282.5, -3380.54, 141.646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 337, 3282.5, -3380.54, 141.646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 338, 3308.62, -3380.18, 145.026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 339, 3317.47, -3384.49, 145.191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 340, 3323.5, -3378.4, 144.885, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 341, 3316.82, -3374.45, 145.2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 342, 3308.93, -3379.2, 145.046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 343, 3298.54, -3379.34, 143.999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 344, 3282.1, -3379.46, 141.682, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 345, 3282.1, -3379.46, 141.682, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 346, 3268.19, -3380.16, 143.35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 347, 3240.31, -3382.36, 144.11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 348, 3226.39, -3383.9, 144.231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 349, 3212.47, -3385.4, 144.286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 350, 3198.58, -3387.11, 143.804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 351, 3173.44, -3390.51, 142.236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 352, 3160.48, -3395.77, 140.741, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 353, 3147.82, -3401.76, 139.915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 354, 3147.82, -3401.76, 139.915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 355, 3125.18, -3408.02, 138.783, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 356, 3116.41, -3415.59, 138.744, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 357, 3104.3, -3429.54, 137.707, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 358, 3095.1, -3440.1, 136.525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 359, 3085.9, -3450.64, 136.005, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 360, 3076.85, -3461.33, 134.886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 361, 3061.5, -3480.09, 133.085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 362, 3057, -3490.35, 131.777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 363, 3057, -3490.35, 131.777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 364, 3048, -3517.59, 130.921, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 365, 3045.68, -3531.4, 129.856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 366, 3043.38, -3550.1, 127.313, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 367, 3041.8, -3564.01, 125.215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 368, 3040.59, -3584.29, 124.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 369, 3040.59, -3584.29, 124.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 370, 3040.38, -3612.29, 123.785, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 371, 3040.45, -3633.55, 125.423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 372, 3041.6, -3643.53, 124.637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 373, 3045.88, -3655, 122.907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 374, 3045.88, -3655, 122.907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 375, 3056.15, -3673.64, 121.304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 376, 3061.19, -3684.48, 121.261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 377, 3061.19, -3684.48, 121.261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 378, 3063.56, -3708.12, 120.637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 379, 3059.78, -3719.85, 119.67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 380, 3059.78, -3719.85, 119.67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 381, 3049.65, -3745.96, 120.504, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 382, 3044.65, -3759.04, 120.332, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 383, 3034.49, -3785.13, 119.718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 384, 3029.71, -3797.06, 120.134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 385, 3024.25, -3809.95, 119.169, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 386, 3018.73, -3822.81, 118.88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 387, 3013.26, -3835.7, 119.216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 388, 3008.53, -3848.88, 119.304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 389, 3001.47, -3870.48, 119.263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 390, 2997.35, -3883.86, 118.357, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 391, 2993.23, -3897.24, 117.025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 392, 2989.51, -3910.73, 115.778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 393, 2985.56, -3924.16, 114.025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 394, 2982.06, -3947.47, 109.477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 395, 2978.72, -3956.6, 107.868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 396, 2972.76, -3969.26, 106.065, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 397, 2967.51, -3982.23, 104.16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 398, 2962.49, -3995.3, 103.002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 399, 2952.63, -4021.5, 100.585, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 400, 2947.63, -4034.58, 99.7325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 401, 2942.7, -4047.68, 98.9784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 402, 2932.97, -4073.94, 97.7989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 403, 2925.47, -4096.79, 96.8862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 404, 2922.65, -4110.5, 96.3581, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 405, 2919.92, -4124.23, 95.8468, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 406, 2917.19, -4137.96, 95.2586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 407, 2911.73, -4165.43, 93.9918, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 408, 2906.99, -4193.01, 92.8379, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 409, 2905.16, -4206.89, 92.4011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 410, 2901.43, -4234.64, 91.663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 411, 2897.57, -4262.38, 91.2693, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 412, 2893.59, -4290.09, 90.7786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 413, 2892.09, -4304.01, 90.6426, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 414, 2889.1, -4328.23, 90.6049, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 415, 2881.19, -4355.07, 90.2687, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 416, 2876.07, -4368.09, 90.0269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 417, 2870.4, -4380.9, 89.8314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 418, 2857.33, -4405.65, 89.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 419, 2849.99, -4417.56, 89.3987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 420, 2835.05, -4441.25, 89.7445, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18317, 421, 2823.28, -4458.62, 89.9473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 1, 2806.6, -4475.69, 89.9669, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 2, 2801.03, -4481.72, 89.9453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 3, 2789.95, -4493.86, 89.8303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 4, 2780.41, -4504.1, 89.6763, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 5, 2770.79, -4514.28, 89.4751, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 6, 2750.62, -4533.67, 88.8859, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 7, 2737.98, -4543.55, 88.4874, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(18169, 8, 2725.94, -4550.69, 88.0814, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 9, 2701.68, -4564.66, 87.4361, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 10, 2677.69, -4579.1, 86.5389, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 11, 2665.6, -4586.15, 85.6021, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 12, 2653.44, -4593.09, 84.9497, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 13, 2641.25, -4599.98, 84.6561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 14, 2629.2, -4607.1, 84.5638, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 15, 2617.23, -4614.37, 84.1513, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 16, 2605.27, -4621.64, 83.0451, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 17, 2581.34, -4636.17, 80.6435, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 18, 2569.34, -4643.39, 79.6035, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 19, 2555.86, -4651.34, 78.5097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 20, 2555.86, -4651.34, 78.5097, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 21, 2541.99, -4653.26, 77.6674, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 22, 2528.11, -4655.13, 76.8887, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 23, 2505.79, -4656.55, 75.7666, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 24, 2494.38, -4653.2, 75.2749, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 25, 2490.17, -4650.14, 75.2223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 26, 2478.56, -4642.32, 74.92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 27, 2455.83, -4629.1, 73.8051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 28, 2455.83, -4629.1, 73.8051, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 29, 2443.22, -4623.03, 73.6193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 30, 2419.33, -4611.98, 73.6116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 31, 2419.33, -4611.98, 73.6116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 32, 2406.41, -4606.58, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 33, 2387.14, -4601.94, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 34, 2373.14, -4601.96, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 35, 2359.15, -4602.4, 73.6236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 36, 2329.02, -4604.86, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 37, 2329.02, -4604.86, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 38, 2315.49, -4608.48, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 39, 2290.81, -4615.13, 73.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 40, 2290.81, -4615.13, 73.64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 41, 2264.2, -4623.86, 73.6226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 42, 2250.99, -4628.48, 73.6226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 43, 2237.84, -4633.28, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 44, 2233.65, -4634.8, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 45, 2219.92, -4636.19, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 46, 2198.31, -4635.8, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 47, 2179.83, -4630.2, 73.6186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 48, 2167.25, -4624.07, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 49, 2154.81, -4617.65, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 50, 2137.87, -4608.21, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 51, 2117.11, -4592.4, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 52, 2107.2, -4582.51, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 53, 2097.31, -4572.6, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 54, 2082.78, -4558.14, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 55, 2072.97, -4548.16, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 56, 2064.02, -4537.4, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 57, 2054.73, -4526.93, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 58, 2039, -4511.27, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 59, 2039, -4511.27, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 60, 2018.56, -4522.04, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 61, 2007.33, -4530.39, 73.6182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 62, 1996.49, -4539.26, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 63, 1978.09, -4555.64, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 64, 1972.04, -4568.26, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 65, 1966.19, -4580.98, 73.6214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 66, 1961.34, -4594.06, 73.7168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 67, 1955.04, -4614.18, 75.4099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 68, 1955.04, -4614.18, 75.4099, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 69, 1947.56, -4631.23, 79.4311, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 70, 1937.66, -4647.88, 84.2933, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 71, 1926.19, -4661.08, 88.0589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 72, 1926.19, -4661.08, 88.0589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 73, 1905.62, -4675.24, 91.8144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 74, 1905.62, -4675.24, 91.8144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 75, 1881.04, -4688.64, 92.3108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 76, 1869, -4695.77, 92.4244, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 77, 1860, -4701.3, 93.179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 78, 1860, -4701.3, 93.179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 79, 1849.8, -4710.89, 93.0538, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 80, 1837.28, -4725.44, 91.5627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 81, 1830.15, -4738.08, 89.5755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 82, 1830.15, -4738.08, 89.5755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 83, 1820.18, -4764.23, 89.4855, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 84, 1815.28, -4777.32, 90.0434, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 85, 1810.99, -4790.65, 91.0152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 86, 1807.67, -4804.24, 91.0432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 87, 1803.59, -4821.49, 90.2337, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 88, 1803.59, -4821.49, 90.2337, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 89, 1794.39, -4846.34, 89.3225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 90, 1790.23, -4862.21, 88.9506, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 91, 1787.49, -4875.94, 87.5193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 92, 1784.76, -4889.67, 85.7993, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 93, 1782.02, -4903.4, 84.1647, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 94, 1779.58, -4917.19, 82.4565, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 95, 1775, -4944.8, 81.4627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 96, 1771.96, -4958.47, 81.1755, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 97, 1764.57, -4979.36, 81.2285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 98, 1756.67, -4990.91, 80.8094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 99, 1740.73, -5013.93, 79.9026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 100, 1733.39, -5025.82, 80.0289, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 101, 1726.52, -5037.79, 80.8024, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 102, 1721.85, -5050.98, 80.5791, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 103, 1717.05, -5064.14, 79.3981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 104, 1707.47, -5090.45, 76.1053, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 105, 1702.67, -5103.6, 74.1361, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 106, 1697.88, -5116.75, 73.6418, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 107, 1689.39, -5143.42, 74.0518, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 108, 1688.38, -5155.8, 73.8026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 109, 1688.19, -5178.9, 73.7914, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 110, 1691, -5191.24, 74.2004, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 111, 1692.89, -5206.03, 74.6583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 112, 1692.98, -5219.47, 73.7034, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 113, 1692.8, -5230.67, 73.649, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 114, 1692.53, -5244.65, 73.6146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 115, 1692.25, -5258.64, 73.6153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 116, 1691.76, -5284.04, 73.6112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 117, 1691.76, -5284.04, 73.6112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 118, 1689.02, -5297.77, 73.6112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 119, 1674.76, -5326.32, 73.6109, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 120, 1662.76, -5333.81, 73.6113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 121, 1664.54, -5346, 73.624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 122, 1670.22, -5354.8, 73.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 123, 1675.94, -5362.78, 73.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 124, 1675.94, -5362.78, 73.6117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 125, 1672.23, -5376.28, 73.6121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 126, 1665.09, -5396.89, 74.1377, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 127, 1661.45, -5407.44, 76.5412, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 128, 1661.45, -5407.44, 76.5412, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 129, 1651.98, -5433.79, 85.4015, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 130, 1647.13, -5446.92, 90.4724, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 131, 1644.19, -5454.79, 93.9639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 132, 1644.19, -5454.79, 93.9639, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 133, 1636.28, -5476.14, 100.092, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 134, 1634.69, -5479.97, 100.622, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 135, 1626.74, -5497.12, 100.729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 136, 1626.74, -5497.12, 100.729, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 137, 1637.62, -5473.45, 99.5326, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 138, 1642.48, -5459.89, 95.3215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 139, 1645, -5453.23, 93.4343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 140, 1648.64, -5443.44, 88.7457, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 141, 1652.9, -5431.88, 84.7826, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 142, 1657.94, -5418.22, 80.3251, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 143, 1662.96, -5403.37, 75.3562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 144, 1662.96, -5403.37, 75.3562, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 145, 1667.44, -5390.11, 73.612, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 146, 1676.35, -5365.76, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 147, 1681.65, -5360.49, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 148, 1691.69, -5355.51, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 149, 1697.73, -5349, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 150, 1696.66, -5338.61, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 151, 1685.3, -5319.3, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 152, 1685.3, -5319.3, 73.6124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 153, 1689.16, -5291.58, 73.6121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 154, 1691.67, -5277.81, 73.6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 155, 1692.3, -5264.6, 73.6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 156, 1692.11, -5250.6, 73.6483, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 157, 1692.63, -5236.61, 73.6115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 158, 1692.82, -5208.33, 74.5818, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 159, 1691.54, -5194.22, 74.3519, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 160, 1689.04, -5179.5, 73.7525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 161, 1688.37, -5167.2, 74.0196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 162, 1689.2, -5148.94, 73.9898, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 163, 1692.9, -5135.44, 73.9792, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 164, 1696.68, -5121.96, 73.635, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 165, 1701.06, -5108.66, 73.8469, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 166, 1705.44, -5095.36, 75.2536, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 167, 1709.99, -5082.13, 77.0799, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 168, 1719.44, -5055.79, 80.2728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 169, 1724.26, -5043.46, 80.971, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 170, 1730.67, -5031.01, 80.5085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 171, 1737.68, -5018.9, 79.8718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 172, 1745.35, -5007.19, 79.9026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 173, 1753.88, -4996.09, 80.5182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 174, 1767.4, -4976.89, 81.2276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 175, 1767.4, -4976.89, 81.2276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 176, 1775.97, -4950.24, 81.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 177, 1776.51, -4947.29, 81.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 178, 1777.52, -4926.07, 81.4632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 179, 1780.13, -4912.33, 83.3272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 180, 1783.27, -4898.71, 84.598, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 181, 1789.69, -4871.46, 87.9183, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 182, 1792.95, -4857.85, 88.9561, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 183, 1796.96, -4844.43, 89.4975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 184, 1805.14, -4817.71, 90.3367, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 185, 1808.62, -4804.17, 91.0512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 186, 1816.93, -4777.44, 89.9966, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 187, 1821.55, -4764.22, 89.432, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 188, 1826.01, -4750.95, 88.8843, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 189, 1830.97, -4737.86, 89.5994, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 190, 1839.49, -4721.28, 92.0094, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 191, 1845.28, -4714.44, 92.8539, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 192, 1860.72, -4701.57, 93.1845, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 193, 1872.65, -4694.25, 92.4181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 194, 1885.11, -4687.87, 92.2616, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 195, 1904.18, -4677.57, 92.1922, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 196, 1912.17, -4672.71, 90.9401, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 197, 1924.91, -4662.33, 88.3133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 198, 1931.1, -4654.42, 86.4454, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 199, 1938.72, -4643.36, 83.303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 200, 1946.18, -4630.85, 79.5054, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 201, 1953.08, -4617.63, 76.0027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 202, 1953.08, -4617.63, 76.0027, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 203, 1959.1, -4602.76, 73.7886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 204, 1963.22, -4589.38, 73.6763, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 205, 1972.27, -4563.09, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 206, 1979.44, -4554.04, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 207, 1979.44, -4554.04, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 208, 2001.05, -4536.25, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 209, 2011.86, -4527.35, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 210, 2023.68, -4517.96, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 211, 2035.18, -4516.82, 73.6228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 212, 2046.38, -4516.95, 73.6177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 213, 2056.42, -4528.99, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 214, 2066.79, -4540.75, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 215, 2076.15, -4551.16, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 216, 2085.63, -4561.47, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 217, 2095.37, -4571.51, 73.6219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 218, 2105.55, -4581.13, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 219, 2116.03, -4590.41, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 220, 2129.99, -4601.9, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 221, 2141.5, -4609.87, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 222, 2152.88, -4617.17, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 223, 2165.29, -4623.63, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 224, 2178.24, -4628.94, 73.6227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 225, 2203.55, -4635.33, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 226, 2219.18, -4635.86, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 227, 2232.75, -4632.44, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 228, 2246.36, -4629.14, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 229, 2259.78, -4625.16, 73.6229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 230, 2288.91, -4616.44, 73.623, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 231, 2302.42, -4612.78, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 232, 2329.74, -4606.77, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 233, 2343.6, -4604.8, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 234, 2378.01, -4602.57, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 235, 2386.76, -4602.71, 73.6233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 236, 2418.2, -4611.25, 73.1306, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 237, 2418.2, -4611.25, 73.1306, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 238, 2443.5, -4622.86, 73.6178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 239, 2454.51, -4628.33, 73.6491, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 240, 2463.47, -4635, 74.5325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 241, 2474.77, -4643.27, 74.7895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 242, 2494.21, -4656.75, 75.2786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 243, 2502.05, -4656.89, 75.6033, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 244, 2516.04, -4656.43, 76.2191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 245, 2538.2, -4655.03, 77.4241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 246, 2557.73, -4649.54, 78.6479, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 247, 2564.91, -4646.93, 79.1957, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 248, 2589.33, -4633.41, 81.3069, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 249, 2601.15, -4625.91, 82.5634, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 250, 2624.77, -4610.93, 84.5453, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 251, 2646, -4598.04, 84.7882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 252, 2670.25, -4584.03, 85.9516, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 253, 2682.35, -4577, 86.8728, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 254, 2706.52, -4562.86, 87.512, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 255, 2718.6, -4555.78, 87.8583, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 256, 2740.66, -4542.51, 88.5981, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 257, 2761.04, -4523.31, 89.1896, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 258, 2771.04, -4513.51, 89.4811, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 259, 2780.72, -4503.4, 89.676, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 260, 2800.02, -4483.11, 89.9421, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 261, 2809.57, -4472.88, 89.9774, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 262, 2828.65, -4451.18, 89.8812, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 263, 2836.19, -4439.39, 89.7144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 264, 2843.55, -4427.48, 89.5383, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 265, 2851.53, -4414.44, 89.354, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 266, 2865.76, -4390.36, 89.627, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 267, 2876.45, -4370.68, 90.0663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 268, 2876.45, -4370.68, 90.0663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 269, 2884.86, -4343.98, 90.4168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 270, 2887.86, -4330.31, 90.5439, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 271, 2892.56, -4302.71, 90.6607, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 272, 2894.81, -4288.89, 90.8644, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 273, 2898.81, -4261.2, 91.3345, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 274, 2900.39, -4247.29, 91.4736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 275, 2903.91, -4219.53, 92.0372, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 276, 2905.9, -4205.67, 92.4347, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 277, 2910.4, -4178.04, 93.4175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 278, 2912.97, -4164.28, 94.0555, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 279, 2919.05, -4136.95, 95.3983, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 280, 2921.99, -4123.26, 95.8835, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 281, 2928.13, -4095.94, 96.9042, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 282, 2932.83, -4076.02, 97.7112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 283, 2942.05, -4049.59, 98.866, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 284, 2947.23, -4036.58, 99.6264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 285, 2960.56, -4002.02, 102.743, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 286, 2966.85, -3987.62, 103.773, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 287, 2970.86, -3977.23, 105.049, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 288, 2975.85, -3964.15, 106.84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 289, 2982.13, -3948.8, 109.272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 290, 2984.8, -3935.65, 112.249, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 291, 2986.56, -3923.11, 114.193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 292, 2990.03, -3910.13, 115.868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 293, 2993.69, -3896.82, 117.056, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 294, 3002.85, -3870.4, 119.344, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 295, 3010.12, -3844.52, 119.307, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 296, 3015.36, -3831.54, 119.114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 297, 3020.52, -3818.53, 118.882, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 298, 3028.86, -3797.77, 120.138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 299, 3034.33, -3784.88, 119.719, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 300, 3039.39, -3771.83, 119.753, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 301, 3044.39, -3758.75, 120.371, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 302, 3054.84, -3732.77, 119.624, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 303, 3060.01, -3719.77, 119.674, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 304, 3066.23, -3696.89, 121.046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 305, 3061.06, -3682.14, 121.267, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 306, 3054.64, -3669.71, 121.492, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 307, 3048.19, -3657.28, 122.826, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 308, 3039.67, -3639.08, 125.316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 309, 3039.67, -3639.08, 125.316, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 310, 3040.52, -3611.1, 123.771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 311, 3040.52, -3611.1, 123.771, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 312, 3040.54, -3583.1, 124.342, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 313, 3040.79, -3569.11, 124.606, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 314, 3043.87, -3543.57, 128.466, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 315, 3045.52, -3533.85, 129.747, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 316, 3048.93, -3516.29, 131.005, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 317, 3054.52, -3499.33, 131.368, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 318, 3060.67, -3486.76, 132.204, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 319, 3066.71, -3475.76, 133.507, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 320, 3073.58, -3465.56, 134.225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 321, 3087.14, -3450.16, 136.008, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 322, 3096.19, -3439.48, 136.685, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 323, 3105.27, -3428.82, 137.747, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 324, 3118.73, -3414.38, 138.717, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 325, 3130.82, -3403.98, 139.314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 326, 3130.82, -3403.98, 139.314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 327, 3154.67, -3399.97, 140.236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 328, 3164.9, -3393.8, 141.343, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 329, 3174.83, -3390.44, 142.351, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 330, 3188.71, -3388.67, 143.537, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 331, 3202.59, -3386.91, 143.977, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 332, 3216.47, -3385.1, 144.308, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 333, 3241.87, -3382.5, 144.041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 334, 3241.87, -3382.5, 144.041, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 335, 3265.35, -3381.1, 143.423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 336, 3282.5, -3380.54, 141.646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 337, 3282.5, -3380.54, 141.646, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 338, 3308.62, -3380.18, 145.026, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 339, 3317.47, -3384.49, 145.191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 340, 3323.5, -3378.4, 144.885, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 341, 3316.82, -3374.45, 145.2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 342, 3308.93, -3379.2, 145.046, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 343, 3298.54, -3379.34, 143.999, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 344, 3282.1, -3379.46, 141.682, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 345, 3282.1, -3379.46, 141.682, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 346, 3268.19, -3380.16, 143.35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 347, 3240.31, -3382.36, 144.11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 348, 3226.39, -3383.9, 144.231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 349, 3212.47, -3385.4, 144.286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 350, 3198.58, -3387.11, 143.804, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 351, 3173.44, -3390.51, 142.236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 352, 3160.48, -3395.77, 140.741, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 353, 3147.82, -3401.76, 139.915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 354, 3147.82, -3401.76, 139.915, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 355, 3125.18, -3408.02, 138.783, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 356, 3116.41, -3415.59, 138.744, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 357, 3104.3, -3429.54, 137.707, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 358, 3095.1, -3440.1, 136.525, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 359, 3085.9, -3450.64, 136.005, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 360, 3076.85, -3461.33, 134.886, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 361, 3061.5, -3480.09, 133.085, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 362, 3057, -3490.35, 131.777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 363, 3057, -3490.35, 131.777, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 364, 3048, -3517.59, 130.921, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 365, 3045.68, -3531.4, 129.856, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 366, 3043.38, -3550.1, 127.313, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 367, 3041.8, -3564.01, 125.215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 368, 3040.59, -3584.29, 124.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 369, 3040.59, -3584.29, 124.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 370, 3040.38, -3612.29, 123.785, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 371, 3040.45, -3633.55, 125.423, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 372, 3041.6, -3643.53, 124.637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 373, 3045.88, -3655, 122.907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 374, 3045.88, -3655, 122.907, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 375, 3056.15, -3673.64, 121.304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 376, 3061.19, -3684.48, 121.261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 377, 3061.19, -3684.48, 121.261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 378, 3063.56, -3708.12, 120.637, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 379, 3059.78, -3719.85, 119.67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 380, 3059.78, -3719.85, 119.67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 381, 3049.65, -3745.96, 120.504, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 382, 3044.65, -3759.04, 120.332, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 383, 3034.49, -3785.13, 119.718, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 384, 3029.71, -3797.06, 120.134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 385, 3024.25, -3809.95, 119.169, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 386, 3018.73, -3822.81, 118.88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 387, 3013.26, -3835.7, 119.216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 388, 3008.53, -3848.88, 119.304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 389, 3001.47, -3870.48, 119.263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 390, 2997.35, -3883.86, 118.357, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 391, 2993.23, -3897.24, 117.025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 392, 2989.51, -3910.73, 115.778, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 393, 2985.56, -3924.16, 114.025, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 394, 2982.06, -3947.47, 109.477, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 395, 2978.72, -3956.6, 107.868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 396, 2972.76, -3969.26, 106.065, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 397, 2967.51, -3982.23, 104.16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 398, 2962.49, -3995.3, 103.002, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 399, 2952.63, -4021.5, 100.585, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 400, 2947.63, -4034.58, 99.7325, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 401, 2942.7, -4047.68, 98.9784, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 402, 2932.97, -4073.94, 97.7989, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 403, 2925.47, -4096.79, 96.8862, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 404, 2922.65, -4110.5, 96.3581, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 405, 2919.92, -4124.23, 95.8468, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 406, 2917.19, -4137.96, 95.2586, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 407, 2911.73, -4165.43, 93.9918, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 408, 2906.99, -4193.01, 92.8379, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 409, 2905.16, -4206.89, 92.4011, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 410, 2901.43, -4234.64, 91.663, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 411, 2897.57, -4262.38, 91.2693, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 412, 2893.59, -4290.09, 90.7786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 413, 2892.09, -4304.01, 90.6426, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 414, 2889.1, -4328.23, 90.6049, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 415, 2881.19, -4355.07, 90.2687, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 416, 2876.07, -4368.09, 90.0269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 417, 2870.4, -4380.9, 89.8314, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 418, 2857.33, -4405.65, 89.352, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 419, 2849.99, -4417.56, 89.3987, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 420, 2835.05, -4441.25, 89.7445, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18169, 421, 2823.28, -4458.62, 89.9473, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
UPDATE `creature_template_addon` SET `auras`='56852' WHERE `entry`=30476;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(57682, 21195, 530, 1, 1, 0, 0, -2706.26, 1538.41, 16.6343, 1.96146, 300, 5, 0, 5914, 0, 1),
(57684, 21195, 530, 1, 1, 0, 0, -2694.88, 1495, 19.2922, 2.33106, 300, 5, 0, 5914, 0, 1),
(57681, 21195, 530, 1, 1, 0, 0, -2691.67, 1525, 21.3857, 0.31557, 300, 5, 0, 5914, 0, 1),
(57678, 21195, 530, 1, 1, 0, 0, -2678.16, 1477.66, 26.9172, 4.8634, 300, 5, 0, 5914, 0, 1),
(57677, 21195, 530, 1, 1, 0, 0, -2646.63, 1379.28, 87.3063, 5.86304, 300, 5, 0, 5914, 0, 1),
(57676, 21195, 530, 1, 1, 0, 0, -2629.76, 1453.61, 47.294, 4.21028, 300, 5, 0, 5914, 0, 1),
(57675, 21195, 530, 1, 1, 0, 0, -2611.15, 1345.5, 84.3271, 2.0734, 300, 5, 0, 5914, 0, 1),
(73263, 21195, 530, 1, 1, 0, 0, -2597.69, 1311.43, 80.7515, 3.24941, 300, 5, 0, 5914, 0, 1),
(73258, 21195, 530, 1, 1, 0, 0, -2585.52, 1448.07, 53.7849, 2.97313, 300, 5, 0, 5914, 0, 1),
(18674, 21195, 530, 1, 1, 0, 0, -2582.19, 1378.53, 82.1254, 6.05418, 300, 5, 0, 5914, 0, 1),
(100214, 21195, 530, 1, 1, 0, 0, -2547.2, 1426.52, 65.5738, 1.4651, 300, 5, 0, 5914, 0, 1),
(100213, 21195, 530, 1, 1, 0, 0, -2545.57, 1278.59, 82.0183, 4.83384, 300, 5, 0, 5914, 0, 1),
(16029, 21195, 530, 1, 1, 0, 0, -2543.23, 1349.13, 80.7872, 5.94909, 300, 5, 0, 5914, 0, 1),
(16215, 21195, 530, 1, 1, 0, 0, -2518.2, 1318.89, 70.4135, 1.8236, 300, 5, 0, 5914, 0, 1),
(16556, 21195, 530, 1, 1, 0, 0, -2513.35, 1387.7, 66.0973, 4.94505, 300, 5, 0, 5914, 0, 1),
(16648, 21195, 530, 1, 1, 0, 0, -2478.13, 1412.92, 25.515, 1.5708, 300, 5, 0, 5914, 0, 1);
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('25460', '0', '0', '0', '0', '0', '0', '61307');
DELETE FROM `spell_target_position` WHERE `id`=45601;
INSERT INTO `spell_target_position` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`) VALUES(45601,571,2753.64,6131.41,210.4463,2.892622);
UPDATE `creature_model_info` SET `bounding_radius`=0.31,`combat_reach`=1,`gender`=2 WHERE `modelid`=28082;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-30' WHERE `item`=32502;
UPDATE `creature` SET `spawntimesecs`=300 WHERE `id`=21878;
UPDATE `creature_template_addon` SET `auras`='33908' WHERE `entry` in (21878,16879);
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('21210', '0', '0', '1', '0', '0', '0', '36393');
UPDATE `creature` SET `position_x`=-3421.365,`position_y`=2289.388,`position_z`=33.63479,`orientation`=3.874631 WHERE `guid`=77857;
UPDATE `creature` SET `spawndist`=5,`MovementType`=1 WHERE `id`=21795;
UPDATE `creature_template_addon` SET `b2_0_sheath`='1', `auras`='37467 37509' WHERE `entry`=21795;
UPDATE `creature_template_addon` SET `b2_0_sheath`='0' WHERE `entry`=19394;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1559', '9', '10643', '0'), ('1560', '-1', '813', '1559'), ('1561', '-2', '1560', '1385');
UPDATE `gossip_menu_option` SET `condition_id`='1561' WHERE `menu_id`=8392 AND `id`=0;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(8392, 0, 0, 'Zorus, I need a pair of goggles.', 1, 1, -1, 0, 21772, 0, 0, NULL, 24, 30719, 1, 9, 10643, 0, 0, 0, 0, 1560),
(8392, 1, 0, 'Zorus, I need a pair of goggles.', 1, 1, -1, 0, 8392, 0, 0, NULL, 24, 30719, 1, 8, 10643, 0, 0, 0, 0, 1385),
(8383, 0, 0, 'Hildagard, I need a pair of goggles.', 1, 1, -1, 0, 21772, 0, 0, NULL, 24, 30719, 1, 9, 10625, 0, 0, 0, 0, 1562),
(8383, 1, 0, 'Hildagard, I need a pair of goggles.', 1, 1, -1, 0, 8392, 0, 0, NULL, 24, 30719, 1, 8, 10625, 0, 0, 0, 0, 1384);
DELETE FROM `gossip_scripts` WHERE `id` in (8392,21772);
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(21772, 0, 15, 37602, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'cast Replace Lost Spectrecles T1'),
(8392, 0, 15, 37700, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'cast Replace Lost Spectrecles T2');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES
(1561, 9, 10625, 0),(1562, -1, 813, 1561);
UPDATE `creature_template_addon` SET `b2_0_sheath`='1',`auras`='37467 37509' WHERE `entry`=21788;
UPDATE `creature_template_addon` SET `auras`='37497 37509' WHERE `entry`=21784;
UPDATE `creature_template_addon` SET `auras`='37497 37509' WHERE `entry`=21815;
UPDATE `creature_template_addon` SET `auras`='37497 37509 37728' WHERE `entry`=21797;
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14370', '50', 'Ever-burning Ash');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('184948', '14370', '0', 'Ever-burning Ash');
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-50' WHERE `item`=30819;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='-10' WHERE `item`=30867;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(74954, 22024, 530, 1, 1, 0, 0, -3477.82, 2277.81, 64.315, 5.38, 1524, 0, 0, 5233, 2991, 2);
REPLACE INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`) VALUES
(74954, 1, -3501.24, 2277.36, 65.8561),
(74954, 2, -3477.82, 2277.81, 64.315),
(74954, 3, -3468.63, 2285.68, 63.5787),
(74954, 4, -3455.3, 2289.51, 63.4889),
(74954, 5, -3387.99, 2289.7, 62.3754),
(74954, 6, -3314.11, 2279.18, 60.8337),
(74954, 7, -3387.99, 2289.7, 62.3754),
(74954, 8, -3455.3, 2289.51, 63.4889),
(74954, 9, -3468.63, 2285.68, 63.5787),
(74954, 10, -3477.82, 2277.81, 64.315);
DELETE FROM `creature` WHERE `id` = 22337;
DELETE FROM `creature` WHERE `id` = 22339;
UPDATE `gameobject_template` SET `faction`='0' WHERE `entry`=185211;
UPDATE `gameobject` SET `id`='185210' WHERE `guid`=69090;
UPDATE `gameobject` SET `spawntimesecs`='180' WHERE `id`=185210;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(69087, 185211, 530, 1, 1, -3692.92, 5728.49, -1.08262, 6.04755, 0, 0, 0.117545, -0.993068, 180, 100, 1),
(69086, 185211, 530, 1, 1, -3687.32, 5732.72, -0.901197, 0.455512, 0, 0, 0.225792, 0.974176, 180, 100, 1),
(69088, 185211, 530, 1, 1, -3678.76, 5733.7, -1.00135, 0.73039, 0, 0, 0.357131, 0.934054, 180, 100, 1),
(69089, 185211, 530, 1, 1, -3674.04, 5709.53, -0.753326, 0.0958021, 0, 0, 0.0478827, 0.998853, 180, 100, 1),
(7898, 185211, 530, 1, 1, -3669.77, 5715.84, -1.06872, 1.11918, 0, 0, 0.530839, 0.847473, 180, 100, 1),
(7899, 185211, 530, 1, 1, -3660.27, 5810.96, 0.0255844, 5.41215, 0, 0, 0.42188, -0.906652, 180, 100, 1),
(10928, 185211, 530, 1, 1, -3639.24, 5831.28, 0.0740742, 0.067508, 0, 0, 0.0337476, 0.99943, 180, 100, 1),
(10927, 185211, 530, 1, 1, -3579.48, 5817.77, -3.262, 2.74573, 0, 0, 0.980475, 0.196642, 180, 100, 1),
(10924, 185211, 530, 1, 1, -3568.88, 5808.19, -3.25185, 3.96701, 0, 0, 0.916038, -0.401092, 180, 100, 1),
(10920, 185211, 530, 1, 1, -3568.11, 5772.55, -3.02607, 3.46437, 0, 0, 0.987005, -0.160689, 180, 100, 1),
(10919, 185211, 530, 1, 1, -3560.05, 5771.58, -3.12615, -0.506145, 0, 0, -0.25038, 0.968148, 180, 100, 1),
(10918, 185211, 530, 1, 1, -3550.77, 5709.02, 0.0407527, 1.12387, 0, 0, 0.532825, 0.846226, 180, 100, 1);
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES 
('69087', '14371', '0', 'Cursed Egg 1'), ('39418', '14371', '0', 'Cursed Egg 2'),
('69086', '14372', '0', 'Cursed Egg 1'), ('39417', '14372', '0', 'Cursed Egg 2'),
('69088', '14373', '0', 'Cursed Egg 1'), ('39416', '14373', '0', 'Cursed Egg 2'),
('69089', '14374', '0', 'Cursed Egg 1'), ('39420', '14374', '0', 'Cursed Egg 2'),
('7898', '14375', '0', 'Cursed Egg 1'), ('39419', '14375', '0', 'Cursed Egg 2'),
('7899', '14376', '0', 'Cursed Egg 1'), ('39415', '14376', '0', 'Cursed Egg 2'),
('10928', '14377', '0', 'Cursed Egg 1'), ('39414', '14377', '0', 'Cursed Egg 2'),
('10927', '14378', '0', 'Cursed Egg 1'), ('39412', '14378', '0', 'Cursed Egg 2'),
('10924', '14379', '0', 'Cursed Egg 1'), ('39413', '14379', '0', 'Cursed Egg 2'),
('10920', '14380', '0', 'Cursed Egg 1'), ('39421', '14380', '0', 'Cursed Egg 2'),
('10919', '14381', '0', 'Cursed Egg 1'), ('69090', '14381', '0', 'Cursed Egg 2'),
('10918', '14382', '0', 'Cursed Egg 1'), ('39422', '14382', '0', 'Cursed Egg 2');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
('14371', '1', 'Cursed Egg 1+2'),
('14372', '1', 'Cursed Egg 1+2'),
('14373', '1', 'Cursed Egg 1+2'),
('14374', '1', 'Cursed Egg 1+2'),
('14375', '1', 'Cursed Egg 1+2'),
('14376', '1', 'Cursed Egg 1+2'),
('14377', '1', 'Cursed Egg 1+2'),
('14378', '1', 'Cursed Egg 1+2'),
('14379', '1', 'Cursed Egg 1+2'),
('14380', '1', 'Cursed Egg 1+2'),
('14381', '1', 'Cursed Egg 1+2'),
('14382', '1', 'Cursed Egg 1+2'),
('14383', '8', 'Master Cursed Egg 1+2');
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`) VALUES
('14371', '14383', '0', 'Cursed Egg 1+2'), ('14372', '14383', '0', 'Cursed Egg 1+2'),
('14373', '14383', '0', 'Cursed Egg 1+2'), ('14374', '14383', '0', 'Cursed Egg 1+2'),
('14375', '14383', '0', 'Cursed Egg 1+2'), ('14376', '14383', '0', 'Cursed Egg 1+2'),
('14377', '14383', '0', 'Cursed Egg 1+2'), ('14377', '14383', '0', 'Cursed Egg 1+2'),
('14379', '14383', '0', 'Cursed Egg 1+2'), ('14380', '14383', '0', 'Cursed Egg 1+2'),
('14381', '14383', '0', 'Cursed Egg 1+2'), ('14382', '14383', '0', 'Cursed Egg 1+2');
DELETE FROM `gameobject_template_scripts` WHERE `id` in (185210,185211);
REPLACE INTO `gameobject_template_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
('185210', '0', '10', '22337', '60000', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', ''),
('185211', '0', '10', '22339', '30000', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', ''),
('185211', '1', '0', '2', '0', '22339', '10', '0', '2000000796', '0', '0', '0', '0', '0', '0', '0', '');
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
('2000000796', '%s flies up over trees, having released from Terokk''s influence.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM `gameobject` WHERE `guid` = 49204;
DELETE FROM `gameobject` WHERE `guid` = 49205;
DELETE FROM `gameobject` WHERE `guid` = 49206;
DELETE FROM `gameobject` WHERE `guid` = 49207;
UPDATE `quest_template` SET `ExclusiveGroup`='10862', `NextQuestInChain`='10847' WHERE `entry`=10862;
UPDATE `quest_template` SET `ExclusiveGroup`='10862' WHERE `entry`=10863;
UPDATE `quest_template` SET `PrevQuestId`='0', `ExclusiveGroup`='10862' WHERE `entry`=10908;
DELETE FROM `gameobject` WHERE `guid` in (3714,38799,71792);
UPDATE `gameobject_template` SET `data1`='0' WHERE `entry`=182505;
UPDATE `gameobject_template` SET `data1`='0' WHERE `entry`=182507;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 182505;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 182507;
UPDATE `quest_template` SET `SpecialFlags`='2' WHERE `entry`=5742;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1563', '9', '5742', '0');
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES ('3502', '4673', '0', '9', '5742', '0', '0', '0', '0', '1563');
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(50015, 4493, 0, 0, 0, 0, 0, 0, 0),
(50016, 4494, 0, 0, 0, 0, 0, 0, 0),
(50017, 4495, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
('3502', '0', '0', 'I am ready to hear your tale, Tirion.', '1', '1', '50015', '0', '0', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '1563'),
('50015', '0', '0', 'Thank you, Tirion. What of your identity?', '1', '1', '50016', '0', '0', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('50016', '0', '0', 'That is terrible.', '1', '1', '50017', '0', '0', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0'),
('50017', '0', '0', 'I will, Tirion.', '1', '1', '-1', '0', '3502', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
DELETE FROM `gossip_scripts` WHERE `id` in (3502);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('3502', '0', '7', '5742', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
UPDATE `creature_template_addon` SET `auras`='56769' WHERE `entry`=30450;
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('30458', '0', '0', '1', '0', '0', '0', '43167');
UPDATE `gossip_menu_option` SET `option_text`='Hey Vi''el, show me your wares!' WHERE `menu_id`=7046 AND `id`=0;
UPDATE `quest_template` SET `OfferRewardText` = 'You have proven yourself as an ally of the Netherwing. My mother is free and my brothers and sisters are saved!$B$BPerhaps someday, we will call for you again. When that day comes, know that you will be welcomed with open arms - a $g brother:sister; to the Netherwing Dragonflight.' WHERE `entry` = 10871;
UPDATE `quest_template` SET `OfferRewardText` = 'I am free! You have saved us, $N!' WHERE `entry` = 10872;
UPDATE `quest_template` SET `OfferRewardText` = 'Desecrate the Horde''s Ghostlands bonfire!' WHERE `entry` = 11774;
UPDATE `quest_template` SET `OfferRewardText` = 'Honor the Stranglethorn Vale flame.' WHERE `entry` = 11832;
UPDATE `quest_template` SET `OfferRewardText` = 'Honor the Tirisfal Glades flame.' WHERE `entry` = 11862;
UPDATE `quest_template` SET `OfferRewardText` = 'It is good to know the people of this land still pay homage to the olden races.  I bid you well, $N, and offer you this token...' WHERE `entry` = 13017;
UPDATE `quest_template` SET `OfferRewardText` = 'It is good to know the people of this land still pay homage to the olden races.  I bid you well, $N, and offer you this token...' WHERE `entry` = 13020;
UPDATE `quest_template` SET `OfferRewardText` = 'Your spirit burns with life, young $c.  I accept the homage you pay, and offer in return this token...' WHERE `entry` = 13029;
UPDATE `quest_template` SET `OfferRewardText` = 'Your spirit burns with life, young $c.  I accept the homage you pay, and offer in return this token...' WHERE `entry` = 13031;
UPDATE `quest_template` SET `OfferRewardText` = 'Your spirit burns with life, young $c.  I accept the homage you pay, and offer in return this token...' WHERE `entry` = 13032;
UPDATE `quest_template` SET `OfferRewardText` = 'We''re here, $N.  My brother''s forces will learn the meaning of defeat today.' WHERE `entry` = 13057;
UPDATE `quest_template` SET `OfferRewardText` = 'The Sons of Hodir accept your tribute, small one.  You continue to prove your worth as an ally in more ways than one.' WHERE `entry` = 13559;
UPDATE `quest_template` SET `OfferRewardText` = 'You are brave to have carried this.  If even one drop were to touch your skin, you''d have died an agonizing death.$b$bAllow me to pay you for it... I can always use venom of exceptional potency.' WHERE `entry` = 13845;
UPDATE `quest_template` SET `OfferRewardText` = 'May you find what you''re looking for, $g brother:sister;.' WHERE `entry` = 24819;
UPDATE `quest_template` SET `OfferRewardText` = 'You continue to prove yourself, $N.  Accept this, not as a gift, but as a tool for the fight against the Scourge.' WHERE `entry` = 24823;
UPDATE `quest_template` SET `OfferRewardText` = 'You continue to prove yourself, $N.  Accept this, not as a gift, but as a tool for the fight against the Scourge.' WHERE `entry` = 24828;
UPDATE `quest_template` SET `OfferRewardText` = 'May you find what you''re looking for, $g brother:sister;.' WHERE `entry` = 24840;
UPDATE `quest_template` SET `OfferRewardText` = 'Thank you again, $C, for rescuing me from Baltharus''s clutches!$B$BThere is still much work to be done, however....' WHERE `entry` = 26013;
UPDATE `quest_template` SET `OfferRewardText` = 'To atone for the sins I committed as one of the Lich King''s Death Knights, I''ve dedicated myself to creating rings of great power for our brothers and sisters to use in the struggle.$b$bYou''ve proven yourself as a valuable ally in the fight against the Scourge, $n. As your dedication continues I can improve on the ring''s original design.$b$bChoose your path carefully. A change of heart will come at a price.' WHERE `entry` = 24815;
UPDATE `quest_template` SET `OfferRewardText` = 'You have shown yourself a capable combatant, $n and you will serve as an example to the rest of the aspirants who clamor to compete on behalf of the Horde.' WHERE `entry` = 13676;
UPDATE `quest_template` SET `OfferRewardText` = 'Well done. Training against the other champions is one of the best ways to prepare yourself for tournament competition. I know you''ll make the Alliance proud, $N.' WHERE `entry` = 13790;
UPDATE `quest_template` SET `OfferRewardText` = 'Oh my goodness, you made it! I was uncertain.$B$BYou flickered in and out of the time stream there for a moment during the fight! I thought for sure that we''d lost you!$B$BBut here you are safe and sound, with your past self rescued, on the other side of the time loop you were in.$B$BYou''re quite the temporal $ghero:heroine;, $N!' WHERE `entry` = 13343;
UPDATE `quest_template` SET `OfferRewardText` = 'Ruined? What d''you mean, the camp''s been ruined?$B$B<Brann clenches his fists in anger.>$B$BThose iron dwarves will pay for this! There''s little we can do now, and we have to focus on finishing the key. But once I get into the halls of Ulduar, the irons and their masters will answer for what they''ve done!' WHERE `entry` = 13273;
UPDATE `quest_template` SET `OfferRewardText` = 'Really, $C?$B$BNothing notable to report?$B$B$<Thassarian notices the abomination remains splattered across your clothes and smiles.>B$BI beg to differ...' WHERE `entry` = 13287;
UPDATE `quest_template` SET `OfferRewardText` = 'Wonderful! Those sleepy Dark Irons will head back to their homes in the Depths to get some rest, greatly slowing down the productivity of the Slag Pit.' WHERE `entry` = 7702;
UPDATE `quest_template` SET `OfferRewardText`='So the great Bhag''thera is dead! Cheers to you, $N. You are a mighty $C indeed!' WHERE `entry`=193;
UPDATE `quest_template` SET `OfferRewardText`='Nicely done, $gold chap:m''lady;!' WHERE `entry`=194;
UPDATE `quest_template` SET `OfferRewardText`='Ho ho!! We have ourselves a true raptor slayer! Nicely done, $gold chap:fair lady;!' WHERE `entry`=196;
UPDATE `quest_template` SET `OfferRewardText`='$gMaster:Mistress; $N, the raptor slayer!$b$bHas a nice ring to it, eh?' WHERE `entry`=197;
UPDATE `quest_template` SET `OfferRewardText`='Witch Doctor Unbagwa like Gorilla Fangs! For you I talk to spirits. Make Mokk the Savage come.$B$BYou protect Witch Doctor Unbagwa from other Gorilla-beast though or no Mokk for you!' WHERE `entry`=349;
UPDATE `quest_template` SET `OfferRewardText`='These Gyromechanic Gears and Restabilization Cogs are in perfect accordance with Ozzie''s schematics for the Recombobulation Device. Once I add some hydrolubricant to the inner combustion pistons, adjust the crank-o-ratchet and increase of the viscosity of the electrogum gel, the gnomish race will be as good as new.' WHERE `entry`=412;
UPDATE `quest_template` SET `OfferRewardText`='Shiver me timbers and timber me shivers! Ye found me beautiful eye! Let''s see if she still fits.$b$b$N ho! Blimey, I can see!!' WHERE `entry`=576;
UPDATE `quest_template` SET `OfferRewardText`='What''s this?  Ah!  It smells like Dark Iron Ale!  Drink has blurred my sight, but I can tell that you, $gsir:my lady;, are a real friend!' WHERE `entry`=4295;
UPDATE `quest_template` SET `OfferRewardText`='Oh, this is great! Nice feel to it too!$b$bWhat? Oh, yeah... geologists. Got ''em good, did ya? I can''t thank ya enough, $N. That''ll give me some time to finish up in here... Thanks again $N.' WHERE `entry`=4449;
UPDATE `quest_template` SET `OfferRewardText`='It worked! You got the essence! Well done, $N! Well done!$b$bThis essence will be invaluable in my research. I hope to one day learn how to capture living dragon whelps, or perhaps capture their eggs. If I could find a way to do that, then I would be the envy of dragon scholars around the world!$b$bMy employer would also be happy, and as I said before, he''s someone you want to keep happy...' WHERE `entry`=4726;
UPDATE `quest_template` SET `OfferRewardText`='Ye''re a good $glad:lass;, ye are. I got ye a lil'' present fer yer troubles.' WHERE `entry`=7723;
UPDATE `quest_template` SET `OfferRewardText`='$N! You are the $gman:woman;!!!$B$BI''m sure that the Cartel will ease up on me now that you''ve dealt with those Southsea scum. Let''s see, what can I give you as a reward? How about a little coin and you choose from one of these for your trouble?' WHERE `entry`=8366;
UPDATE `quest_template` SET `OfferRewardText`='This thing... it is in the shape of a Winterfall Ritual Totem, but it has been twisted by forces I cannot begin to comprehend. Whatever taint that has set the Winterfall against us is surely present in this object.$B$BDivine wisdom has brought both this and you to us, $N. We will study this object intently; perhaps one day, the Winterfall will rage against us no longer.$B$BThank you, friend - please accept these offerings in exchange for your benevolence.' WHERE `entry`=8471;
UPDATE `quest_template` SET `OfferRewardText`='Very well, these will have to do. No, don''t describe them crawling around, I don''t want to know! I''ll work my magic upon these legs and they''ll turn out quite tasty. A little spice here, a pinch of herb there, and then of course some arcane ingredients, and voila, a meal fit for a queen... or in this case, a dame.$B$BYour service has been adequate, $c. Here, take this recipe and some samples.' WHERE `entry`=9171;
UPDATE `quest_template` SET `OfferRewardText`='I know that we Forsaken appear monstrous to your eyes, but I assure you we mean your people no harm. We are here because of a common enemy: Dar''Khan the traitor! He has returned and now commands the Scourge that are invading this land from his steadfast, Deatholme, to the south.$B$BOur leader, Lady Sylvanas Windrunner, originally hails from these lands, and in fact used to be an elf. She has a history with Dar''Khan and wants him dead as much as your people do.$B$BWe will defeat him together, $C!' WHERE `entry`=9327;
UPDATE `quest_template` SET `OfferRewardText`='You are bold to seek my wisdom after what your people have done to these islands, stranger! Still, there is much to be said for your bravery, so I will impart to you some knowledge.$B$BThe earth beneath your feet forms the foundation for all things. The sky, the waters, even great fire - all rest upon its shoulders. While those others often form chaotic tempests, the earth abides. It grants strength and fortitude to the core of your being.$B$BNow you will prove yourself, $C.' WHERE `entry`=9449;
UPDATE `quest_template` SET `OfferRewardText`='Bless yer heart, stranger. This''ll go a long ways in liftin'' the morale o'' the crew.' WHERE `entry`=9512;
UPDATE `quest_template` SET `OfferRewardText`='My pappy would be proud! His boy strikes it big at the first set of night elf ruins he comes across... With your help, of course. Yes, don''t worry, I won''t leave you out of the discovery. Your name is $N, right? They''ll learn all about you in Ironforge.' WHERE `entry`=9523;
UPDATE `quest_template` SET `OfferRewardText`='This is in better condition than I thought it''d be. Sure, it''s going to take some time to work off all the rust, the char, and the like, but I''ll not complain.' WHERE `entry`=10055;
UPDATE `quest_template` SET `OfferRewardText`='Well done, $C, That''s one less forge camp we''ll need to worry about. It''ll take the Legion a while to get that facility back up and running. You''ve just bought us the one thing we''d run out of - time.' WHERE `entry`=10390;
UPDATE `quest_template` SET `OfferRewardText`='Are you certain of your choice, $N? The Aldor will welcome you as an ally, but the Scryers will not easily forgive your decision.' WHERE `entry`=10551;
UPDATE `quest_template` SET `OfferRewardText`='You and Renn have done excellent work in bringing this information to light and reporting it immediately. Now, we must confirm your findings. The implications are too great if we are wrong.' WHERE `entry`=11141;
UPDATE `quest_template` SET `OfferRewardText`='<Lady Jaina listens intently as you report the results of your aerial survey.>$B$BA rune circle, dragonkin? The Defias have allied themselves with HER? The traitor?$B$B<Lady Jaina composes herself and prepares to explain.>' WHERE `entry`=11142;
UPDATE `quest_template` SET `OfferRewardText`='This will make a fine meal for the men.$b$b<The chef leans in closer to whisper in your ear.>$b$bHere, $gboy:deary;, take some for yourself. You look like you could use some more meat on your bones!' WHERE `entry`=11155;
UPDATE `quest_template` SET `OfferRewardText`='The ore gave you a strange feeling? Maybe we won''t use that stuff after all.$B$B<Steelring looks at the stuff and takes a step back, changing the subject.>$B$BThose gems look really nice! I wonder what I can get for them? Of course, there are always repairs, and new stuff to be made.$B$BYou know, I''ve really found working with you to be profitable. Take this... it''s the least that I can do!' WHERE `entry`=11218;
UPDATE `quest_template` SET `OfferRewardText`='Ay, mon. I been expectin'' you.$B$B<To''bor points west.>$B$BTake a peek. Across dat tundra be death, mon... death.' WHERE `entry`=11634;
UPDATE `quest_template` SET `OfferRewardText`='<Gort takes the tome from you and begins reading.>$B$BWHAT! This can''t be right. I''ve known some of these orcs for years!$B$BLeave me, $N. I have much work to do and many traitors to execute.$B$BTake one of these items for your trouble. You''ve done a great service for the Horde this day.' WHERE `entry`=12136;
UPDATE `quest_template` SET `OfferRewardText`='It does not surprise me that the orc chieftain does not have time to hear of our troubles. The ambassador''s efforts will likely be like so much mist blowing in the wind.$B$BBut you are here now. We shall see if he chose well in sending you.' WHERE `entry`=11888;
UPDATE `quest_template` SET `OfferRewardText`='<The deathguard rubs his hands together in anticipation.>$B$BExcellent. Their loss is my... our gain!$B$BYou didn''t have trouble with any of these along the way? Some of them look rather unstable. I may be undead, but I value my existence!' WHERE `entry`=12230;
UPDATE `quest_template` SET `OfferRewardText`='The horns of war will soon echo across this land, waking the dead and calling forth the Scourge war machine. Woe unto those that would stand in our way!$B$BYou and your brethren will lead the charge, $N. When next I look upon the Scarlet lands, my sight will be obscured by the legions of Acherus. The march upon New Avalon begins now.' WHERE `entry`=12657;
UPDATE `quest_template` SET `OfferRewardText`='You''re a good $gman:woman;, $n. We''re fortunate that you happened to stop by.$b$bStick around a while. I''m sure that we have much that a capable $c such as yourself can do.' WHERE `entry`=12740;
UPDATE `quest_template` SET `OfferRewardText`='Thanks for helping out our miner back there, $N! I should be able to put together an antidote no problem.$B$BIf you stumble into Tore again, tell her that she''s a jerk for me, will ya?' WHERE `entry`=12832;
UPDATE `quest_template` SET `OfferRewardText`='Good stuff, $glad:lass;. You''re making fast friends.$B$BIf you stop back by soon, I''m sure we can find one that will let you ride... they should know that you''re trustworthy now.' WHERE `entry`=12867;
UPDATE `quest_template` SET `OfferRewardText`='<Stefan reads the missive, then crumples it up and tosses it into the fire.>$b$bOld news. The Argent Crusade is - once again - late to the party. We''ve been tracking Drakuru since Grizzly Hills. He is slated for eradication.' WHERE `entry`=12884;
UPDATE `quest_template` SET `OfferRewardText`='The val''kyr are nothing but the Lich King''s lapdogs. They will be put down like the scum they are. They''ve made their choice, now they have to live with the consequences.' WHERE `entry`=12942;
UPDATE `quest_template` SET `OfferRewardText`='The jormungar are vile creatures. You did well in destroying them.' WHERE `entry`=12989;
UPDATE `quest_template` SET `OfferRewardText`='So it is done.$B$BWe have heard the screams of Jormuttar as they echoed from across the valley.$B$BYou have done our people a service this day, little $R.' WHERE `entry`=13011;
UPDATE `quest_template` SET `OfferRewardText`='No... it cannot be...$b$bNo one can defeat Thorim in single combat. Not a giant, nor a beast... no one! Especially not that coward of a brother of his.$b$bOn my forefathers'' names, this I swear...$b$bLoken will pay for this!' WHERE `entry`=13047;
UPDATE `quest_template` SET `OfferRewardText`='Hello child.$B$BI understand Tirion''s request and trust in his judgment, we will see what we can do for this Crusader Bridenbrad. What you ask is no simple task - the Scourge are not of this world, and many have failed in attempting to strip their corruption over the years.$B$BIn a being of nobility and light, all is not without hope.' WHERE `entry`=13073;
UPDATE `quest_template` SET `OfferRewardText`='<As you approach Crusader Bridenbrad, you cannot help but notice that his skin has taken on a pale hue and his breaths are shallow. It is clear that he has little time left.>$B$BYou have returned to me, $C. I must admit... it is good to see you again... your face renews my hope that this land will be free of Arthas''s grasp one day soon. I''m proud to have met you...$B$B<Bridenbrad''s words trail off, a dim smile on his face. As life seems to slip from him, a gentle ringing fills your ears.>' WHERE `entry`=13082;
UPDATE `quest_template` SET `OfferRewardText`='Perfect! I just hope the Dalaran Destroyers finally win one!' WHERE `entry`=13107;
UPDATE `quest_template` SET `OfferRewardText`='Perfect! I just hope the Dalaran Destroyers finally win one!' WHERE `entry`=13116;
UPDATE `quest_template` SET `OfferRewardText`='I''ve chained the wretch to the post over there and I''ll look into getting my hands on more of them.$B$BNow let''s make some use of that eye.' WHERE `entry`=13143;
UPDATE `quest_template` SET `OfferRewardText`='Excellent work. It seems more death knights remained loyal to Arthas than I initially thought.$B$BHe certainly is sparing nothing in his attempt to replace Acherus. A pure saronite citadel would be hard to destroy indeed. There''s no need to destroy it though... we can halt production and put down these death knight leaders here and now, before they become a real threat.$B$BMost importantly, we need to disrupt them enough to get those death knights away from from the leaders so that we can make our strike.' WHERE `entry`=13145;
UPDATE `quest_template` SET `OfferRewardText`='Let''s see here... what do we have...$B$B<Keritose buries his head in the papers for a bit, seemingly gleaning little that he did not already know. Suddenly he finds what he is looking for...>$B$BMalykriss! The Vile Hold. It seems Arthas did not take the loss of his death knights so well... I''m not exactly sure what he''s doing with all of that saronite, but I have a feeling he might be overcompensating for something.$B$BThat boy is not used to losing.' WHERE `entry`=13174;
UPDATE `quest_template` SET `OfferRewardText`='Always more questions than answers, eh, $g lad:lass;?' WHERE `entry`=13207;
UPDATE `quest_template` SET `OfferRewardText`='Thank you, this will go far to treat our soldiers'' wounds.' WHERE `entry`=13201;
UPDATE `quest_template` SET `OfferRewardText`='Nice shooting, $n. The Scourge never had a chance.$b$bAre you feeling okay? You look like you''ve seen a ghost. Not that it would be an unusual thing around these parts, now that I think about it.' WHERE `entry`=13396;
UPDATE `quest_template` SET `OfferRewardText`='The prince''s true power wasn''t his ability to make armies out of corpses... that was easy.$B$BBut killing his own men, with whom he''d shared many battles... the prince''s true power was his ability to do what had to be done.' WHERE `entry`=13395;
UPDATE `quest_template` SET `OfferRewardText`='You see? You killed your fair share, but for every one you destroyed, another rose from the dirt to take its place.$b$bYou don''t know what you''re up against, $n. Let me show you.' WHERE `entry`=13394;
UPDATE `quest_template` SET `OfferRewardText`='The demolisher has seen better days, but the structure hasn''t suffered any permanent damage. The parts you obtained should be enough to get it running again, at least temporarily.' WHERE `entry`=13393;
UPDATE `quest_template` SET `OfferRewardText`='It''s good to have someone competent running missions, $n. If only we had an army of paladins like you, we could show the Horde what we''re made of. These captured reports will help us to maintain the upper hand in this fight. We may be down, but we''re far from out.' WHERE `entry`=13314;
UPDATE `quest_template` SET `OfferRewardText`='They''re being driven insane? Voices in their heads?$B$BVoices in your head?!$B$BI want you to clear your mind of the taint that has crept into that place, $gboy:girl;.$B$BWe''ll try to get the remainder of them out of there again tomorrow when you''ve had a chance to rest.' WHERE `entry`=13300;
UPDATE `quest_template` SET `RequestItemsText`='Let''s not waste more of my precious time with jibber jabber, $r. It''s time to focus on replenishing our dwindling fiery flux supply.$B$BWhat I''m gonna need from you is the following:$B$B*Incendosaur scales.$B$B*Heavy Leather.$B$B*Coal.$B$BI''ll take all that you can offer!$B$BAnd you''ll do it fast if you wanna get in good with the Brotherhood.' WHERE `entry`=8242;
UPDATE `quest_template` SET `RequestItemsText`='You are the delivery $gboy:girl;?' WHERE `entry`=12182;
UPDATE `quest_template` SET `RequestItemsText`='Well met, $C. I knew that you would return, despite my warnings, but I''m pleased that you heeded my desire to not risk anyone else.$B$BWhy have you come back to me?' WHERE `entry`=13075;
UPDATE `quest_template` SET `RequestItemsText`='You seek to continue down the path of destruction?' WHERE `entry`=24828;
UPDATE `quest_template` SET `RequestItemsText`='You seek to change the path you walk, $N?' WHERE `entry`=24836;
UPDATE `quest_template` SET `RequestItemsText`='You seek to continue down the path of destruction?' WHERE `entry`=24823;
UPDATE `quest_template` SET `RequestItemsText`='You seek to change the path you walk, $N?' WHERE `entry`=24840;
UPDATE `quest_template` SET `RequestItemsText`='You seek to change the path you walk, $N?' WHERE `entry`=24819;
UPDATE `quest_template` SET `RequestItemsText`='No ordinary tributes were good enough for the great Hodir when he walked among the frost giants.$B$BHe might not be with us anymore, but we''ve kept the tradition of offering tribute to his strength and wisdom.  It would do much for your renown to partake in this tradition, small $c.' WHERE `entry`=13559;
UPDATE `quest_template` SET `RequestItemsText`='Any luck with the bloodtooth?  Don''t forget what I told you about making blood pools.' WHERE `entry`=13833;
UPDATE `quest_template` SET `RequestItemsText`='What is it that you''ve found, $N?' WHERE `entry`=24442;
UPDATE `quest_template` SET `RequestItemsText`='Hi there.  Do you have something for me?' WHERE `entry`=13836;
UPDATE `quest_template` SET `RequestItemsText`='Wine is only as fine as the person drinking it, I always say.' WHERE `entry`=24431;
UPDATE `quest_template` SET `RequestItemsText`='We need to get this information to the Alliance! It may well be the key to Arthas'' defeat.' WHERE `entry`=24500; -- Wrath of the Lich King
UPDATE `quest_template` SET `RequestItemsText`='I see you''re back, $gold bloke:lass;. King Bangalash has caused me to come crawling back to camp many times. Hang in there.' WHERE `entry`=208;
UPDATE `quest_template` SET `RequestItemsText`='Hey! I don''t like the look you''re giving me, $gmister:lady;.' WHERE `entry`=606;
UPDATE `quest_template` SET `RequestItemsText`='Don''t let the crazy goggles fool you, $N. I''m the smart one here.' WHERE `entry`=7702;
UPDATE `quest_template` SET `RequestItemsText`='Bhag''thera can prove to be an elusive beast. How fares the hunt?' WHERE `entry`=193;
UPDATE `quest_template` SET `RequestItemsText`='Hmph! There is all this booze down here, but I have strict orders not to touch it. If only I could get a taste of some of our Thunder Ale...that would sharpen my wits, no lying!' WHERE `entry`=308;
UPDATE `quest_template` SET `RequestItemsText`='Do you have that shimmerweed? I almost have a batch of stout ready to brew, and I want to try throwing the weed in with this mixture.' WHERE `entry`=315;
UPDATE `quest_template` SET `RequestItemsText`='Witch Doctor Unbagwa know what Mokk the Savage like. Yes, yes!$b$bMe speak with spirits and make he come, I do.$b$bBut other Gorilla-beast like spirit talkin'' too. You protect Witch Doctor Unbagwa and I make he come to you.$b$bWitch Doctor Unbagwa want something first. You bring a Gorilla Fang and me start spirit talking!' WHERE `entry`=349;
UPDATE `quest_template` SET `RequestItemsText`='Got the five Wastewander water pouches we need? If you do, then the Gadgetzan Water Company Care Package, Model 103-XB, will be yours!' WHERE `entry`=1707;
UPDATE `quest_template` SET `RequestItemsText`='King Varian has placed great importance on learning, and thus has provided funds for making copies of various tomes and writings available to the public. It''s very simple. You bring me a library scrip, and I can give you a copy of one of the available books.' WHERE `entry`=579;
UPDATE `quest_template` SET `RequestItemsText`='<Hansel is busily rubbing his bunions.>$B$BDon''t just stand there, grab some oil and a luffa and get to scrubbin'' these bunions.$B$BYe don''t have a luffa? Well then! Perhaps it''s time I sent you out to find a luffa?$B$BHey, where are ye goin''?' WHERE `entry`=7727;
UPDATE `quest_template` SET `RequestItemsText`='The power of this chapel gives me the strength to resist the corruption in my heart. If I leave it, I will become a death knight. But there is a medallion, the medallion of faith, that will give me the strength I need to leave.$b$bPlease, $N, retrieve the medallion. It is guarded by Malor the Zealous, a crazed member of the Scarlet Crusade who resides deep in the Scarlet Bastion in western Stratholme.' WHERE `entry`=5122;
UPDATE `quest_template` SET `RequestItemsText`='$C - you approach us in a peaceful manner, but I sense that you are here on matters that are grave and severe... for both furbolg and $R alike. What have you come to tell us?' WHERE `entry`=8471;
UPDATE `quest_template` SET `RequestItemsText`='You''ve worked your way up through the Brotherhood''s corporate hierarchy, $R. We have begun to look favorably upon you. Quite an accomplishment! $B$BIf you''re interested in more work and earning more respect amongst us, listen up.$B$BWe can refine the fiery flux by adding a simple Dark Iron residue to the mix. The Dark Iron residue can be found in Blackrock Depths.$B$BBring me all the Dark Iron residue you find!' WHERE `entry`=7737;
UPDATE `quest_template` SET `RequestItemsText`='We are currently accepting donations for wool cloth.  A donation of sixty pieces of wool cloth will net you full recognition by the Ironforge for your generous actions.  Our stores are such on wool that we would only need sixty pieces from you total; we should be able to acquire enough from others in the realm to support our drive.$B$BIf you have the sixty pieces of wool cloth on you and are ready to donate them, I''m able to take them from you now.' WHERE `entry`=7807;
UPDATE `quest_template` SET `RequestItemsText`='As with most other fabrics, our stocks of silk are at an all-time low.  Our stores are such that we''''d only need sixty pieces of silk from you total; we should be able to reach our goal with the support of others.$B$BA benevolent gift such as silk, might I add, would certainly increase your local standing in the community!  If you have the sixty pieces of silk cloth on you and are ready to donate them, I''m able to take them from you now.' WHERE `entry`=7808;
UPDATE `quest_template` SET `RequestItemsText`='Together, the Broken and the draenei will regain a deeper understanding of the mysteries that the elements hold.$B$BHave you returned with that which is necessary for the creation of your earth totem?' WHERE `entry`=9451;
DELETE FROM `quest_start_scripts` WHERE `id` = 975;
REPLACE INTO `quest_start_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(975, 10, 7, 975, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(975, 0, 29, 3, 2, 10307, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(975, 10, 29, 3, 1, 10307, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(975, 9, 1, 0, 0, 10307, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(975, 0, 1, 69, 0, 10307, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (50000,3382),(50001,3383);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(2703, 0, 0, 'How do I use the Cache of Mau''ari?', 1, 1, 50000, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
(2703, 1, 0, 'What is E''ko?', 1, 1, 50001, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2703, 2, 0, 'I''d like you to make me a new Cache of Mau''ari please', 1, 1, -1, 0, 2703, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1228);
UPDATE `quest_template` SET `SpecialFlags`='2' WHERE `entry`=5126;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1564', '9', '5126', '0');
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (50002,3759),(50003,3760),(50004,3761),(50005,3762),(50007,3763);
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`) VALUES 
(3049,0,0, 'You will have to excuse me, Lorax, I do not speak ''crazy''.',1,1,50002,0),
(50002,0,0, 'My apologies, I did not realize that you could understand what I was saying. What is it you are doing out here?',1,1,50003,0),
(50003,0,0, 'Do you? Perhaps you should tell me what it is that is bothering you.',1,1,50004,0),
(50004,0,0, 'What deal?',1,1,50005,0),
(50005,0,0, 'So how did he break the deal?',1,1,50007,0),
(50007,0,0, 'Perhaps I can be of some assistance. I will make a deal with you, Satyr. I shall recover this unforged breastplate and slay the beast. In exchange for this task, you will teach me how to create the breastplate.',1,1,-1,3049);
UPDATE `gossip_menu_option` SET `condition_id`='1564' WHERE `menu_id`=3049 AND `id`=0;
DELETE FROM `gossip_scripts` WHERE `id` in (3049);
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('3049', '0', '7', '5126', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
DELETE FROM `pool_template` WHERE `entry` = 140;
DELETE FROM `pool_creature` WHERE `guid` = 49075;
DELETE FROM `pool_creature` WHERE `guid` = 49118;
UPDATE `gossip_menu` SET `script_id`=1405 WHERE `entry`=1405 AND `text_id`=2039;
DELETE FROM `gossip_scripts` WHERE `id` = 1405;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES 
('1405', '0', '8', '8612', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', ''),
('1405', '2', '29', '1', '2', '8612', '5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '');
UPDATE `creature_template` SET `flags_extra`=`flags_extra`|2048 WHERE `entry`=8612;
UPDATE `gossip_menu_option` SET `condition_id`='1565' WHERE `menu_id`=24 AND `id`=0;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1565', '22', '770', '0');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1566', '9', '10916', '0');
UPDATE `gossip_menu_option` SET `option_text`='I have marks to redeem!' WHERE `menu_id`=7892 AND `id`=0;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES ('50008', '10689', '0', '0', '0', '0', '0', '0', '0', '0');
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES
(7892, 1, 0, 'I heard that your dog Fei Fei took Klatu''s prayer beads...', 1, 1, 50008, 0, 0, 0, 0, NULL, 9, 10916, 0, 0, 0, 0, 0, 0, 0, 1566),
(50008, 0, 0, '<back>', 1, 1, 7892, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES ('8021', '9895', '0', '0', '0', '0', '0', '0', '0', '0');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1567', '5', '933', '4');
UPDATE `gossip_menu` SET `condition_id`='1567' WHERE `entry`=8021 AND `text_id`=9896;
UPDATE `gossip_menu_option` SET `condition_id`='1567' WHERE `menu_id`=8021 AND `id`=0;
REPLACE INTO `gossip_menu` (`entry`,`text_id`) VALUES (10136,14072),(10138,14074),(10118,14076),(9223,12534);
UPDATE `gossip_menu` SET `condition_id`='1106' WHERE `entry`=10118 AND `text_id`=14076;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1568', '8', '11599', '0');
UPDATE `gossip_menu` SET `condition_id`='1568' WHERE `entry`=9223 AND `text_id`=13481;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_script_id`, `condition_id`) VALUES 
(10118,2,0, 'Tell me about the Wispcloak Recipe.',1,1,10136,0,1569),
(10118,3,0, 'I am ready to learn the Wispcloak Recipe.',1,1,-1,16,1450),
(10118,4,0, 'Tell me about the Deathchill Cloak Recipe.',1,1,10138,0,1570),
(10118,5,0, 'I am ready to learn the Deathchill Cloak Recipe.',1,1,-1,15,1571);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1569', '-1', '1106', '1135');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1570', '-1', '1106', '1136');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1368', '20', '1360', '0');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1451', '-2', '944', '1368');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1571', '-1', '1451', '1570');
delete from spell_script_target where entry=56312;
insert into spell_script_target values
(56312,1,29310);
delete from creature_linking_template where entry in (30114,30385);
insert into creature_linking_template values
(30114,619,29310,1028,0),
(30385,619,29310,4112,0);
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1572', '24', '33340', '1'), ('1573', '-1', '1115', '1572');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1574', '22', '11261', '0'), ('1575', '-1', '1573', '1574');
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES ('8902', '11696', '0', '0', '0', '0', '0', '0', '0', '0');
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES ('8898', '0', '0', 'Chieftain Ashtotem, I lost the emblem...', '1', '1', '8902', '0', '8898', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '1587');
DELETE FROM `gossip_scripts` WHERE `id` = 8898;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('8898', '0', '15', '43123', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'cast Skorn Must Fall!: Create Token');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14384', '20', 'Spotted Hippogryph Down');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('186591', '14384', '0', 'Spotted Hippogryph Down');
UPDATE `quest_template` SET `PrevQuestId`='11256', `NextQuestId`='11261', `ExclusiveGroup`='-11257', `NextQuestInChain`='0' WHERE `entry`=11257;
UPDATE `quest_template` SET `PrevQuestId`='11256', `NextQuestId`='11261', `ExclusiveGroup`='-11257', `NextQuestInChain`='0' WHERE `entry`=11258;
UPDATE `quest_template` SET `NextQuestId`='11261', `ExclusiveGroup`='-11257', `NextQuestInChain`='0' WHERE `entry`=11259;
UPDATE `quest_template` SET `PrevQuestId`='0' WHERE `entry`=11261;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1576', '8', '11248', '0');
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='5', `condition_id`='1576' WHERE `item`=33314;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`='5', `condition_id`='1115' WHERE `item`=33345;
UPDATE `quest_template` SET `PrevQuestId`='11248', `NextQuestInChain`='0' WHERE `entry`=11245;
UPDATE `quest_template` SET `PrevQuestId`='11248', `NextQuestInChain`='0' WHERE `entry`=11246;
UPDATE `quest_template` SET `PrevQuestId`='11248', `NextQuestInChain`='0' WHERE `entry`=11247;
UPDATE `conditions` SET `type`='24' WHERE `condition_entry`=969;
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1577', '-1', '558', '1576');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1578', '24', '33311', '1'), ('1579', '22', '11250', '0');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1580', '-1', '1576', '1578'), ('1581', '-1', '1579', '1580');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1582', '9', '11250', '0'), ('1583', '9', '11261', '0');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1584', '-1', '1578', '1582'), ('1585', '-1', '1572', '1583');
REPLACE INTO `conditions` (`condition_entry`, `type`, `value1`, `value2`) VALUES ('1586', '-2', '1581', '1584'), ('1587', '-2', '1575', '1585');
UPDATE `gossip_menu_option` SET `condition_id`='1577' WHERE `menu_id`=8886 AND `id`=0;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `script_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `condition_id`) VALUES ('8901', '11694', '0', '0', '0', '0', '0', '0', '0', '0');
DELETE FROM `gossip_menu` WHERE `entry` = 50025;
REPLACE INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`, `action_menu_id`, `action_poi_id`, `action_script_id`, `box_coded`, `box_money`, `box_text`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`, `cond_3`, `cond_3_val_1`, `cond_3_val_2`, `condition_id`) VALUES ('8852', '0', '0', 'Captain, I lost the insignia...', '1', '1', '8901', '0', '8852', '0', '0', NULL, '0', '0', '0', '0', '0', '0', '0', '0', '0', '1586');
DELETE FROM `gossip_scripts` WHERE `id` = 8852;
INSERT INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('8852', '0', '15', '43122', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'cast Operation: Skornful Wrath: Create Insignia');
UPDATE `gossip_menu_option` SET `action_menu_id`='8929' WHERE `menu_id`=8886 AND `id`=0;
DELETE FROM `spell_scripts` WHERE `id` in (43036);
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('43036', '1', '15', '43037', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Gruesome, But Necessary: Kill Credit'), ('43036', '0', '15', '43059', '0', '0', '0', '4', '0', '0', '0', '0', '0', '0', '0', '0', 'Gruesome, But Necessary: Vrykul On Dismember');
DELETE FROM `creature_ai_scripts` WHERE `id` = 2366651;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2367051;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2366951;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2366551;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2366851;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2366751;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2366351;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2366151;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2366451;
DELETE FROM `creature_ai_scripts` WHERE `id` = 2366251;
UPDATE `creature_template` SET `AIName`='' WHERE `entry` IN (23666,23670,23669,23665,23668,23667,23663,23661,23664,23662);
UPDATE creature SET position_x = '1951.768188', position_y = '-4108.071289', position_z = '215.702713', orientation = '3.741344' WHERE guid = '122392';
UPDATE creature SET position_x = '1940.046875', position_y = '-4127.756836', position_z = '215.064163', orientation = '1.799054' WHERE guid = '122393';
UPDATE creature SET position_x = '1928.390503', position_y = '-4108.689941', position_z = '215.494644', orientation = '5.809296' WHERE guid = '122394';
UPDATE creature SET position_x = '1967.421753', position_y = '-4040.198486', position_z = '217.859573', orientation = '4.049997' WHERE guid = '122384';
UPDATE creature SET position_x = '1977.911255', position_y = '-4197.535645', position_z = '211.886383', orientation = '3.625104' WHERE guid = '122387';
UPDATE creature SET position_x = '1789.426392', position_y = '-4042.793701', position_z = '236.705414', orientation = '3.758611' WHERE guid = '122386';
UPDATE creature SET position_x = '1707.523682', position_y = '-4108.177734', position_z = '284.575958', orientation = '2.250633' WHERE guid = '127836';
REPLACE INTO `creature_template_addon` (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_pvp_state`, `emote`, `moveflags`, `auras`) VALUES ('24119', '0', '0', '1', '0', '0', '0', NULL);
UPDATE creature SET position_x = '1677.119751', position_y = '-4122.411133', position_z = '276.418518', orientation = '0.138697' WHERE guid = '127835';
UPDATE creature SET position_x = '1673.015137', position_y = '-4108.307129', position_z = '276.418518', orientation = '0.105710' WHERE guid = '127834';
UPDATE `creature_template` SET `unit_flags`=`unit_flags` | 32768, `inhabittype`=`inhabittype` | 5 WHERE `entry` IN (24119,24118);
DELETE FROM `spell_scripts` WHERE `id` in (49625,49634);
INSERT INTO `spell_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `buddy_entry`, `search_radius`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES ('49625', '0', '15', '43106', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', 'Brave''s Flare Effect'), ('49634', '0', '15', '43068', '0', '0', '0', '8', '0', '0', '0', '0', '0', '0', '0', '0', 'Sergeant''s Flare Effect');
UPDATE `spell_script_target` SET `entry`='43106' WHERE `entry`=49625;
DELETE FROM `spell_script_target` WHERE `entry` = 49634;
UPDATE `gameobject_template` SET `flags`='4', `data1`='187670' WHERE `entry`=187671;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 187671;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(44205, 187670, 571, 1, 1, 3496.44, 5676.19, 60.7044, 0.523598, 0, 0, 0.258819, 0.965926, 300, 100, 1),
(44206, 187670, 571, 1, 1, 3491.78, 5641.2, 64.3114, -0.279252, 0, 0, -0.139173, 0.990268, 300, 100, 1),
(44207, 187670, 571, 1, 1, 3544.13, 5481.48, 28.6225, -1.37881, 0, 0, -0.636078, 0.771625, 300, 100, 1),
(44208, 187670, 571, 1, 1, 3527.24, 5482.36, 55.6038, -2.54818, 0, 0, -0.956305, 0.292372, 300, 100, 1),
(44209, 187670, 571, 1, 1, 3541.09, 5549.35, 64.4567, 1.69297, 0, 0, 0.748956, 0.66262, 300, 100, 1),
(44210, 187670, 571, 1, 1, 3587.46, 5490.47, 27.9796, -2.9845, 0, 0, -0.996917, 0.0784656, 300, 100, 1),
(10910, 187670, 571, 1, 1, 3583.03, 5567.06, 26.9376, -0.209439, 0, 0, -0.104528, 0.994522, 300, 100, 1),
(10907, 187670, 571, 1, 1, 3657.13, 5507.59, 33.2869, 2.54818, 0, 0, 0.956305, 0.292372, 300, 100, 1),
(10905, 187670, 571, 1, 1, 3617.46, 5512.38, 32.7346, 0.314158, 0, 0, 0.156434, 0.987688, 300, 100, 1),
(10904, 187670, 571, 1, 1, 3696.36, 5552.01, 36.0668, 0.785397, 0, 0, 0.382683, 0.92388, 300, 100, 1),
(10900, 187670, 571, 1, 1, 3604.29, 5553.5, 27.0831, 2.74016, 0, 0, 0.979924, 0.199371, 300, 100, 1),
(10896, 187670, 571, 1, 1, 3574.5, 5614.42, 31.6249, -1.01229, 0, 0, -0.484809, 0.87462, 300, 100, 1),
(10891, 187670, 571, 1, 1, 3659.36, 5605.39, 34.1367, -0.802851, 0, 0, -0.390731, 0.920505, 300, 100, 1),
(10887, 187670, 571, 1, 1, 3741.54, 5524.67, 39.6977, 1.91986, 0, 0, 0.819151, 0.573577, 300, 100, 1),
(10883, 187670, 571, 1, 1, 3642.52, 5694.04, 66.2527, -1.95477, 0, 0, -0.829038, 0.559192, 300, 100, 1),
(10874, 187670, 571, 1, 1, 3697.22, 5607.52, 34.2504, 0.226892, 0, 0, 0.113203, 0.993572, 300, 100, 1),
(10872, 187670, 571, 1, 1, 3722.36, 5673.47, 32.2665, -1.74533, 0, 0, -0.766045, 0.642787, 300, 100, 1),
(10869, 187670, 571, 1, 1, 3673.29, 5716.44, 65.1916, -1.95477, 0, 0, -0.829038, 0.559192, 300, 100, 1),
(10865, 187670, 571, 1, 1, 3713.95, 5729.07, 62.1727, -2.86234, 0, 0, -0.990268, 0.139173, 300, 100, 1),
(10864, 187670, 571, 1, 1, 3609.48, 5697.26, 68.1235, -2.3911, 0, 0, -0.930417, 0.366502, 300, 100, 1),
(10863, 187670, 571, 1, 1, 3629.17, 5633.74, 30.0397, 0.541051, 0, 0, 0.267238, 0.963631, 300, 100, 1);
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES 
('44205', '14385', '0', 'Tuskarr Ritual Object 1'), ('47013', '14385', '0', 'Tuskarr Ritual Object 2'),
('44206', '14386', '0', 'Tuskarr Ritual Object 1'), ('47014', '14386', '0', 'Tuskarr Ritual Object 2'),
('44207', '14387', '0', 'Tuskarr Ritual Object 1'), ('47134', '14387', '0', 'Tuskarr Ritual Object 2'),
('44208', '14388', '0', 'Tuskarr Ritual Object 1'), ('47135', '14388', '0', 'Tuskarr Ritual Object 2'),
('44209', '14389', '0', 'Tuskarr Ritual Object 1'), ('47137', '14389', '0', 'Tuskarr Ritual Object 2'),
('44210', '14390', '0', 'Tuskarr Ritual Object 1'), ('47138', '14390', '0', 'Tuskarr Ritual Object 2'),
('10910', '14391', '0', 'Tuskarr Ritual Object 1'), ('47139', '14391', '0', 'Tuskarr Ritual Object 2'),
('10907', '14392', '0', 'Tuskarr Ritual Object 1'), ('47140', '14392', '0', 'Tuskarr Ritual Object 2'),
('10905', '14393', '0', 'Tuskarr Ritual Object 1'), ('47141', '14393', '0', 'Tuskarr Ritual Object 2'),
('10904', '14394', '0', 'Tuskarr Ritual Object 1'), ('47142', '14394', '0', 'Tuskarr Ritual Object 2'),
('10900', '14395', '0', 'Tuskarr Ritual Object 1'), ('47143', '14395', '0', 'Tuskarr Ritual Object 2'),
('10896', '14396', '0', 'Tuskarr Ritual Object 1'), ('47144', '14396', '0', 'Tuskarr Ritual Object 2'),
('10891', '14397', '0', 'Tuskarr Ritual Object 1'), ('47145', '14397', '0', 'Tuskarr Ritual Object 2'),
('10887', '14398', '0', 'Tuskarr Ritual Object 1'), ('47149', '14398', '0', 'Tuskarr Ritual Object 2'),
('10883', '14399', '0', 'Tuskarr Ritual Object 1'), ('47150', '14399', '0', 'Tuskarr Ritual Object 2'),
('10874', '14400', '0', 'Tuskarr Ritual Object 1'), ('47151', '14400', '0', 'Tuskarr Ritual Object 2'),
('10872', '14401', '0', 'Tuskarr Ritual Object 1'), ('47152', '14401', '0', 'Tuskarr Ritual Object 2'),
('10869', '14402', '0', 'Tuskarr Ritual Object 1'), ('47154', '14402', '0', 'Tuskarr Ritual Object 2'),
('10865', '14403', '0', 'Tuskarr Ritual Object 1'), ('47155', '14403', '0', 'Tuskarr Ritual Object 2'),
('10864', '14404', '0', 'Tuskarr Ritual Object 1'), ('47156', '14404', '0', 'Tuskarr Ritual Object 2'),
('10863', '14405', '0', 'Tuskarr Ritual Object 1'), ('47157', '14405', '0', 'Tuskarr Ritual Object 2');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES
('14385', '1', 'Tuskarr Ritual Object 1+2'),('14386', '1', 'Tuskarr Ritual Object 1+2'),
('14387', '1', 'Tuskarr Ritual Object 1+2'),('14388', '1', 'Tuskarr Ritual Object 1+2'),
('14389', '1', 'Tuskarr Ritual Object 1+2'),('14390', '1', 'Tuskarr Ritual Object 1+2'),
('14391', '1', 'Tuskarr Ritual Object 1+2'),('14392', '1', 'Tuskarr Ritual Object 1+2'),
('14393', '1', 'Tuskarr Ritual Object 1+2'),('14394', '1', 'Tuskarr Ritual Object 1+2'),
('14395', '1', 'Tuskarr Ritual Object 1+2'),('14396', '1', 'Tuskarr Ritual Object 1+2'),
('14397', '1', 'Tuskarr Ritual Object 1+2'),('14398', '1', 'Tuskarr Ritual Object 1+2'),
('14399', '1', 'Tuskarr Ritual Object 1+2'),('14400', '1', 'Tuskarr Ritual Object 1+2'),
('14401', '1', 'Tuskarr Ritual Object 1+2'),('14402', '1', 'Tuskarr Ritual Object 1+2'),
('14403', '1', 'Tuskarr Ritual Object 1+2'),('14404', '1', 'Tuskarr Ritual Object 1+2'),
('14405', '1', 'Tuskarr Ritual Object 1+2'),('14406', '12', 'Master Tuskarr Ritual Object 1+2');
REPLACE INTO `pool_pool` (`pool_id`, `mother_pool`, `chance`, `description`) VALUES
('14385', '14406', '0', 'Tuskarr Ritual Object 1+2'), ('14386', '14406', '0', 'Tuskarr Ritual Object 1+2'),
('14387', '14406', '0', 'Tuskarr Ritual Object 1+2'), ('14388', '14406', '0', 'Tuskarr Ritual Object 1+2'),
('14389', '14406', '0', 'Tuskarr Ritual Object 1+2'), ('14390', '14406', '0', 'Tuskarr Ritual Object 1+2'),
('14391', '14406', '0', 'Tuskarr Ritual Object 1+2'), ('14392', '14406', '0', 'Tuskarr Ritual Object 1+2'),
('14393', '14406', '0', 'Tuskarr Ritual Object 1+2'), ('14394', '14406', '0', 'Tuskarr Ritual Object 1+2'),
('14395', '14406', '0', 'Tuskarr Ritual Object 1+2'), ('14396', '14406', '0', 'Tuskarr Ritual Object 1+2'),
('14397', '14406', '0', 'Tuskarr Ritual Object 1+2'), ('14398', '14406', '0', 'Tuskarr Ritual Object 1+2'),
('14399', '14406', '0', 'Tuskarr Ritual Object 1+2'), ('14400', '14406', '0', 'Tuskarr Ritual Object 1+2'),
('14401', '14406', '0', 'Tuskarr Ritual Object 1+2'), ('14402', '14406', '0', 'Tuskarr Ritual Object 1+2'),
('14403', '14406', '0', 'Tuskarr Ritual Object 1+2'), ('14404', '14406', '0', 'Tuskarr Ritual Object 1+2'),
('14405', '14406', '0', 'Tuskarr Ritual Object 1+2');
delete from creature_linking_template where entry in (30660,30695,30661,30662,30663,30664,30665,30666,30667,30668,32191,31079,31134);
insert into creature_linking_template values
(30660,608,30658,16,0),
(30695,608,30658,16,0),
(30661,608,30658,16,0),
(30662,608,30658,16,0),
(30663,608,30658,16,0),
(30664,608,30658,16,0),
(30665,608,30658,16,0),
(30666,608,30658,16,0),
(30667,608,30658,16,0),
(30668,608,30658,16,0),
(32191,608,30658,16,0),
(31079,608,30658,16,0),
(31134,608,30658,16,0);
delete from spell_scripts where id = 62138;
insert into spell_scripts values
(62138,0,15,62139,0,0,0,10,0,0,0,0,0,0,0,0,'Teleport inside Violet Hold');
UPDATE `creature_template` SET `InhabitType` = 4 WHERE `entry` = 21657;
UPDATE creature_loot_template SET ChanceOrQuestChance=ABS(ChanceOrQuestChance) WHERE item in (4480);
UPDATE `game_event` SET `start_time` = '2012-09-02 00:01:00', `end_time` = '2020-12-30 19:00:00' WHERE `entry` = 4;

-- Missing Vehicle_Id's from UDB
UPDATE `creature_template` SET `vehicle_id`=22 WHERE `entry`=24806;
UPDATE `creature_template` SET `vehicle_id`=22 WHERE `entry`=24821;
UPDATE `creature_template` SET `vehicle_id`=22 WHERE `entry`=24823;
UPDATE `creature_template` SET `vehicle_id`=22 WHERE `entry`=24825;
UPDATE `creature_template` SET `vehicle_id`=35 WHERE `entry`=26586;
UPDATE `creature_template` SET `vehicle_id`=35 WHERE `entry`=26590;
UPDATE `creature_template` SET `vehicle_id`=42 WHERE `entry`=27061;
UPDATE `creature_template` SET `vehicle_id`=80 WHERE `entry`=27886;
UPDATE `creature_template` SET `vehicle_id`=88 WHERE `entry`=27923;
UPDATE `creature_template` SET `vehicle_id`=90 WHERE `entry`=27932;
UPDATE `creature_template` SET `vehicle_id`=134 WHERE `entry`=28115;
UPDATE `creature_template` SET `vehicle_id`=152 WHERE `entry`=28182;
UPDATE `creature_template` SET `vehicle_id`=118 WHERE `entry`=28399;
UPDATE `creature_template` SET `vehicle_id`=121 WHERE `entry`=28468;
UPDATE `creature_template` SET `vehicle_id`=126 WHERE `entry`=28665;
UPDATE `creature_template` SET `vehicle_id`=138 WHERE `entry`=28817;
UPDATE `creature_template` SET `vehicle_id`=146 WHERE `entry`=28875;
UPDATE `creature_template` SET `vehicle_id`=148 WHERE `entry`=28985;
UPDATE `creature_template` SET `vehicle_id`=148 WHERE `entry`=28999;
UPDATE `creature_template` SET `vehicle_id`=149 WHERE `entry`=29005;
UPDATE `creature_template` SET `vehicle_id`=179 WHERE `entry`=29579;
UPDATE `creature_template` SET `vehicle_id`=186 WHERE `entry`=29677;
UPDATE `creature_template` SET `vehicle_id`=197 WHERE `entry`=29754;
UPDATE `creature_template` SET `vehicle_id`=203 WHERE `entry`=29863;
UPDATE `creature_template` SET `vehicle_id`=216 WHERE `entry`=30108;
UPDATE `creature_template` SET `vehicle_id`=231 WHERE `entry`=30331;
UPDATE `creature_template` SET `vehicle_id`=240 WHERE `entry`=30487;
UPDATE `creature_template` SET `vehicle_id`=257 WHERE `entry`=30895;
UPDATE `creature_template` SET `vehicle_id`=258 WHERE `entry`=31050;
UPDATE `creature_template` SET `vehicle_id`=259 WHERE `entry`=31110;
UPDATE `creature_template` SET `vehicle_id`=262 WHERE `entry`=31125;
UPDATE `creature_template` SET `vehicle_id`=264 WHERE `entry`=31157;
UPDATE `creature_template` SET `vehicle_id`=287 WHERE `entry`=31838;
UPDATE `creature_template` SET `vehicle_id`=315 WHERE `entry`=31857;
UPDATE `creature_template` SET `vehicle_id`=315 WHERE `entry`=31858;
UPDATE `creature_template` SET `vehicle_id`=315 WHERE `entry`=31861;
UPDATE `creature_template` SET `vehicle_id`=315 WHERE `entry`=31862;
UPDATE `creature_template` SET `vehicle_id`=296 WHERE `entry`=32198;
UPDATE `creature_template` SET `vehicle_id`=296 WHERE `entry`=32208;
UPDATE `creature_template` SET `vehicle_id`=302 WHERE `entry`=32348;
UPDATE `creature_template` SET `vehicle_id`=305 WHERE `entry`=32483;
UPDATE `creature_template` SET `vehicle_id`=295 WHERE `entry`=32511;
UPDATE `creature_template` SET `vehicle_id`=287 WHERE `entry`=32513;
UPDATE `creature_template` SET `vehicle_id`=308 WHERE `entry`=32535;
UPDATE `creature_template` SET `vehicle_id`=313 WHERE `entry`=32640;
UPDATE `creature_template` SET `vehicle_id`=90 WHERE `entry`=32682;
UPDATE `creature_template` SET `vehicle_id`=347 WHERE `entry`=33108;
UPDATE `creature_template` SET `vehicle_id`=356 WHERE `entry`=33364;
UPDATE `creature_template` SET `vehicle_id`=357 WHERE `entry`=33366;
UPDATE `creature_template` SET `vehicle_id`=358 WHERE `entry`=33369;
UPDATE `creature_template` SET `vehicle_id`=370 WHERE `entry`=33432;
UPDATE `creature_template` SET `vehicle_id`=371 WHERE `entry`=33651;
UPDATE `creature_template` SET `vehicle_id`=373 WHERE `entry`=33670;
UPDATE `creature_template` SET `vehicle_id`=392 WHERE `entry`=34146;
UPDATE `creature_template` SET `vehicle_id`=395 WHERE `entry`=34150;
UPDATE `creature_template` SET `vehicle_id`=396 WHERE `entry`=34151;
UPDATE `creature_template` SET `vehicle_id`=399 WHERE `entry`=34183;
UPDATE `creature_template` SET `vehicle_id`=435 WHERE `entry`=34776;
UPDATE `creature_template` SET `vehicle_id`=514 WHERE `entry`=35069;
UPDATE `creature_template` SET `vehicle_id`=548 WHERE `entry`=36812;
UPDATE `creature_template` SET `vehicle_id`=615 WHERE `entry`=37980;
UPDATE `creature_template` SET `vehicle_id`=647 WHERE `entry`=38711;
UPDATE `creature_template` SET `vehicle_id`=648 WHERE `entry`=38712;
UPDATE `creature_template` SET `vehicle_id`=700 WHERE `entry`=39682;
UPDATE `creature_template` SET `vehicle_id`=753 WHERE `entry`=39759;
UPDATE `creature_template` SET `vehicle_id`=763 WHERE `entry`=39819;
UPDATE `creature_template` SET `vehicle_id`=711 WHERE `entry`=39860;
UPDATE `creature_template` SET `vehicle_id`=747 WHERE `entry`=40479;
UPDATE `creature_template` SET `vehicle_id`=604 WHERE `entry`=37827;
UPDATE `creature_template` SET `vehicle_id`=610 WHERE `entry`=37952;
-- From PitCrawler
UPDATE `creature_template` SET `vehicle_id`=202 WHERE `entry`=29903; -- Frostbite
UPDATE `creature_template` SET `vehicle_id`=241 WHERE `entry`=30388; -- Stormhoof
UPDATE `creature_template` SET `vehicle_id`=25 WHERE `entry`=25194; -- Kor'kron Riding Wolf
UPDATE `creature_template` SET `vehicle_id`=108 WHERE `entry`=28639; -- Heb'Jin's Bat
UPDATE `creature_template` SET `minlevel`=72,`maxlevel`=72,`unit_flags`=`unit_flags`|520,`speed_run`=1.42857,`Vehicle_Id`=317,`InhabitType`=5 WHERE `entry`=25460;
INSERT IGNORE INTO `npc_text` (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`, `em0_0`, `em0_1`, `em0_2`, `em0_3`, `em0_4`, `em0_5`, `text1_0`, `text1_1`, `lang1`, `prob1`, `em1_0`, `em1_1`, `em1_2`, `em1_3`, `em1_4`, `em1_5`, `text2_0`, `text2_1`, `lang2`, `prob2`, `em2_0`, `em2_1`, `em2_2`, `em2_3`, `em2_4`, `em2_5`, `text3_0`, `text3_1`, `lang3`, `prob3`, `em3_0`, `em3_1`, `em3_2`, `em3_3`, `em3_4`, `em3_5`, `text4_0`, `text4_1`, `lang4`, `prob4`, `em4_0`, `em4_1`, `em4_2`, `em4_3`, `em4_4`, `em4_5`, `text5_0`, `text5_1`, `lang5`, `prob5`, `em5_0`, `em5_1`, `em5_2`, `em5_3`, `em5_4`, `em5_5`, `text6_0`, `text6_1`, `lang6`, `prob6`, `em6_0`, `em6_1`, `em6_2`, `em6_3`, `em6_4`, `em6_5`, `text7_0`, `text7_1`, `lang7`, `prob7`, `em7_0`, `em7_1`, `em7_2`, `em7_3`, `em7_4`, `em7_5`) VALUES
(10743, 'Need TXT YTDB', '', 0, 100, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(11696, 'Need TXT YTDB', '', 0, 100, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0),
(11694, 'Need TXT YTDB', '', 0, 100, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);


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
# DELETE FROM `creature_movement` WHERE `id` NOT IN (SELECT `guid` FROM `creature`);
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

UPDATE db_version SET `cache_id`= '623';
UPDATE db_version SET `version`= 'YTDB_0.14.5_R623_MaNGOS_R12005_SD2_R2586_ACID_R309c_RuDB_R51';
