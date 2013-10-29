-- ------------------------------------
-- Quest :: 12644, Quest :: 12645 texts
-- ------------------------------------

DELETE FROM script_texts WHERE entry BETWEEN -1999791 AND -1999783;
INSERT INTO script_texts VALUES
('-1999791','Aye, I\'ll try it.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','Hemet Nesingwary - Taste Test (1)'),
('-1999790','That\'s exactly what I needed!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','Hemet Nesingwary - Taste Test (2)'),
('-1999789','It\'s got my vote! That\'ll put hair on your chest like nothing else will.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','Hemet Nesingwary - Taste Test (3)'),
('-1999788','I\'m always up for something of Grimbooze\'s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','Hadrius Harlowe - Taste Test (1)'),
('-1999787','Well, so far, it tastes like something my wife would drink...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','Hadrius Harlowe - Taste Test (2)'),
('-1999786','Now, there\'s the kick I\'ve come to expect from Grimbooze\'s drinks! I like it!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','Hadrius Harlowe - Taste Test (3)'),
('-1999785','Sure!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','Tamara Wobblesprocket - Taste Test (1)'),
('-1999784','Oh my...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','Tamara Wobblesprocket - Taste Test (2)'),
('-1999783','Tastes like I\'m drinking... engine degreaser!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','0','0','0','Tamara Wobblesprocket - Taste Test (3)');

DELETE FROM script_texts WHERE entry BETWEEN -1999803 AND -1999792;
INSERT into script_texts (entry,content_default,type,comment) VALUES
(-1999792,'Beginning the destillation in 5 seconds',0,'SAY_EVENT_STARTED'),
(-1999793,'Add bannanas',0,'SAY_ADD_BANNANAS'),
(-1999794,'Put a papaya in the still',0,'SAY_ADD_PAPAYA'),
(-1999795,'Good job! Keep your eyes open now',0,'SAY_GOOD_JOB_1'),
(-1999796,'The still needs heat! Light the brazier!',0,'SAY_BRAZIER'),
(-1999797,'Well done, be ready for anything!',0,'SAY_GOOD_JOB_2'),
(-1999798,'Pressuer\'s too high! Open the pressure valve!',0,'SAY_OPEN_VALVE'),
(-1999799,'That\'ll do. Never know what it\'ll need next ...',0,'SAY_GOOD_JOB_3'),
(-1999800,'Nicely handled! Stay on your toes',0,'SAY_GOOD_JOB_4'),
(-1999801,'We\'ve done it! Come get the cask',0,'SAY_EVENT_END'),
(-1999802,'Add orange, quickly !',0,'SAY_ADD_ORANGE'),
(-1999803,'You failed! You will have to begin new destillation process if you still want cask',0,'SAY_FAIL');

-- -----------
-- Quest 11466
-- -----------

DELETE FROM script_texts WHERE entry BETWEEN -1999818 AND -1999812;
INSERT INTO script_texts (`entry`,`content_default`,`type`,`comment`) VALUES
(-1999818,'Keep quiet, will you? If anyone catches on, we\'re both dead.',4,'Olga (0)'),
(-1999817,'All right, fellas! Who ordered the spiced rum? Was it you, Jackie boy?',0,'Olga (1)'),
(-1999816,'Sure thing, love. Put it on Harry\'s tab, will you? He owes me a drink!',0,'Jack Adams (2)'),
(-1999815,'It\'s ok sweetheart. This one is on the house',0,'Olga (3)'),
(-1999814,'Free rum? Why... that\'s me favourite kind!',0,'Jack Adams (4)'),
(-1999813,'Sweet Neptulon! That was... one drink... too many!',0,'Jack Adams (5)'),
(-1999812,'What are you lot looking at? Pour me another drink!',0,'Jack Adams (6)');

-- -----------------
-- Quest texts 14107
-- -----------------

DELETE FROM script_texts WHERE entry BETWEEN -1999823 AND -1999819;
INSERT INTO script_texts (entry,content_default,sound,type,language,emote,comment) VALUES
(-1999819,'At last... now I can rest.',0,0,0,0,'hero spirit SAY_BLESS_1'),
(-1999820,'I\'m so tired. Just let me rest for a moment.',0,0,0,0,'hero spirit SAY_BLESS_2'),
(-1999821,'I can\'t hear the screams anymore. Is this the end?',0,0,0,0,'hero spirit SAY_BLESS_3'),
(-1999822,'My nightmare, is it finally over?',0,0,0,0,'hero spirit SAY_BLESS_4'),
(-1999823,'It was awful... I dreamt I was fighting against my friends.',0,0,0,0,'hero spirit SAY_BLESS_5');

-- -------
-- Quests 13665, 13745, 13750, 13756, 13761, 13767, 13772, 13777, 13782, 13787
-- ------
DELETE FROM script_texts WHERE entry = -1999824;
INSERT INTO script_texts (`entry`,`content_default`,`comment`) values 
(-1999824,'I have been defeated. Good fight!','');


-- ---------
-- Quest 13663
-- ---------

DELETE FROM `script_waypoint` WHERE `entry` = 33519;
INSERT INTO `script_waypoint` (`entry`,`pointid`,`location_x`,
`location_y`,`location_z`,`waittime`,`point_comment`) values
(33519, 0, 8524.63, 578.345, 552.524, 0, ''),
(33519, 1, 8455.89, 694.577, 547.292, 0, ''),
(33519, 2, 8397.99, 748.036, 547.293, 0, ''),
(33519, 3, 8373.84, 797.464, 547.91, 0, ''),
(33519, 4, 8375.42, 858.007, 547.996, 0, ''),
(33519, 5, 8391.85, 867.635, 547.556, 0, ''),
(33519, 6, 8461.66, 871.668, 547.293, 0, ''),
(33519, 7, 8472.43, 881.281, 547.294, 0, ''),
(33519, 8, 8478.89, 1017.11, 547.293, 0, ''),
(33519, 9, 8525.79, 1032.95, 547.293, 0, ''),
(33519, 10, 8537.57, 1076.91, 554.394, 0, ''),
(33519, 11, 8544.016, 1093.445, 562.226, 0, ''),
(33519, 12, 8576.88, 1211.09, 562.226, 0, ''),
(33519, 13, 9094.39, 2031.69, 97.599, 0, ''),
(33519, 14, 9086.074, 2058.25, 82.827, 0, ''),
(33519, 15, 9066.61, 2114.63, 67.966, 0, ''),
(33519, 16, 9052.65, 2115.8, 57.863, 3000, '');

-- -------------
-- Quest 11560 -
-- -------------

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1999831 AND -1999825;
INSERT INTO `script_texts` (`entry`,`content_default`,`comment`) VALUES
(-1999825, "Eww.. $r!", "tadpole SAY_RACE"),
(-1999826, "No go with stranger!", "tadpole SAY_2"),
(-1999827, "Close!", "tadpole SAY_3"),
(-1999828, "Me go home?", "tadpole SAY_4"),
(-1999829, "Play!", "tadpole SAY_5"),
(-1999830, "Alurglgl!", "tadpole SAY_6"),
(-1999831, "da-da?", "tadpole SAY_7");
