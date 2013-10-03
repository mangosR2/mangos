-- -------------------
-- Eye of Acherus text
-- -------------------
DELETE FROM script_texts WHERE entry BETWEEN -1666452 AND -1666451;
INSERT INTO script_texts (entry, content_default, content_loc8, sound, type, language, emote, comment) VALUES
('-1666451','The Eye of Acherus launches towards its destination','Око Акеруса вылетело в пункт назначения','0','3','0','0','EOA_LAUNCH'),
('-1666452','The Eye of Acherus is in your control','Око Акеруса под вашим контролем','0','3','0','0','EOA_CONTROL');

-- ------------------------------
-- Quest:: ambush at the overlook
-- ------------------------------
DELETE FROM `script_texts` WHERE `entry` IN ('-1609531','-1609532');
INSERT INTO `script_texts`
    (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES
    (-1609531, 'Hrm, what a strange tree. I must investigate.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'Scarlet Courier SAY_TREE1'),
    (-1609532, 'What\'s this!? This isn\'t a tree at all! Guards! Guards!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 'Scarlet Courier SAY_TREE2');

-- -----------------------
-- Quest The Light of Dawn
-- -----------------------

DELETE FROM `script_texts` WHERE entry BETWEEN -1609286 AND -1609201;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
-- The Light of Dawn
-- pre text
   (-1609201, 'Soldiers of the Scourge, stand ready! You will soon be able to unleash your fury upon the Argent Dawn!',14677,1,0,0,'Highlord Darion Mograine'),
   (-1609202, 'The sky weeps at the devastation of sister earth! Soon, tears of blood will rain down upon us!',14678,1,0,0,'Highlord Darion Mograine'),
   (-1609203, 'Death knights of Acherus, the death march begins!',14681,1,0,0,'Highlord Darion Mograine'),
-- intro
   (-1609204, 'Soldiers of the Scourge, death knights of Acherus, minions of the darkness: hear the call of the Highlord!',14679,1,0,22,'Highlord Darion Mograine'),
   (-1609205, 'RISE!',14680,1,0,15,'Highlord Darion Mograine'),
   (-1609206, 'The skies turn red with the blood of the fallen! The Lich King watches over us, minions! Onward! Leave only ashes and misery in your destructive wake!',14682,1,0,25,'Highlord Darion Mograine'),
-- During the fight
   (-1609207, 'Scourge armies approach!',0,1,0,0,'Korfax, Champion of the Light'),
   (-1609208, 'Stand fast, brothers and sisters! The Light will prevail!',14487,1,0,0,'Lord Maxwell Tyrosus'),
   (-1609209, 'Kneel before the Highlord!',14683,0,0,0,'Highlord Darion Mograine'),
   (-1609210, 'You stand no chance!',14684,0,0,0,'Highlord Darion Mograine'),
   (-1609211, 'The Scourge will destroy this place!',14685,0,0,0,'Highlord Darion Mograine'),
   (-1609212, 'Your life is forfeit.',14686,0,0,0,'Highlord Darion Mograine'),
   (-1609213, 'Life is meaningless without suffering.',14687,0,0,0,'Highlord Darion Mograine'),
   (-1609214, 'How much longer will your forces hold out?',14688,0,0,0,'Highlord Darion Mograine'),
   (-1609215, 'The Argent Dawn is finished!"',14689,0,0,0,'Highlord Darion Mograine'),
   (-1609216, 'Spare no one!',14690,0,0,0,'Highlord Darion Mograine'),
   (-1609217, 'What is this?! My... I cannot strike...',14691,0,0,0,'Highlord Darion Mograine'),
   (-1609218, 'Obey me, blade!',14692,1,0,0,'Highlord Darion Mograine'),
   (-1609219, 'You will do as I command! I am in control here!',14693,0,0,0,'Highlord Darion Mograine'),
   (-1609220, 'I can not... the blade fights me.',14694,0,0,0,'Highlord Darion Mograine'),
   (-1609221, 'What is happening to me?',14695,0,0,0,'Highlord Darion Mograine'),
   (-1609222, 'Power...wanes...',14696,0,0,0,'Highlord Darion Mograine'),
   (-1609223, 'Ashbringer defies me...',14697,0,0,0,'Highlord Darion Mograine'),
   (-1609224, 'Minions, come to my aid!',14698,0,0,0,'Highlord Darion Mograine'),
-- After the fight
   (-1609225, 'You cannot win, Darion!',14584,1,0,0,'Highlord Tirion Fordring'),
   (-1609226, 'Bring them before the chapel!',14585,1,0,0,'Highlord Tirion Fordring'),
   (-1609227, 'Stand down, death knights. We have lost... The Light... This place... No hope...',14699,0,0,68,'Highlord Darion Mograine'),
   (-1609228, 'Have you learned nothing, boy? You have become all that your father fought against! Like that coward, Arthas, you allowed yourself to be consumed by the darkness...the hate... Feeding upon the misery of those you tortured and killed!',14586,0,0,378,'Highlord Tirion Fordring'),
   (-1609229, 'Your master knows what lies beneath the chapel. It is why he dares not show his face! He\'s sent you and your death knights to meet their doom, Darion.',14587,0,0,25,'Highlord Tirion Fordring'),
   (-1609230, 'What you are feeling right now is the anguish of a thousand lost souls! Souls that you and your master brought here! The Light will tear you apart, Darion!',14588,0,0,1,'Highlord Tirion Fordring'),
   (-1609231, 'Save your breath, old man. It might be the last you ever draw.',14700,0,0,25,'Highlord Darion Mograine'),
   (-1609232, 'My son! My dear, beautiful boy!',14493,0,0,0,'Highlord Alexandros Mograine'),
   (-1609233, 'Father!',14701,0,0,5,'Highlord Darion Mograine'),
   (-1609234, 'Argh...what...is...',14702,0,0,68,'Highlord Darion Mograine'),
   (-1609235, 'Father, you have returned!',14703,0,0,0,'Darion Mograine'),
   (-1609236, 'You have been gone a long time, father. I thought...',14704,0,0,0,'Darion Mograine'),
   (-1609237, 'Nothing could have kept me away from here, Darion. Not from my home and family.',14494,0,0,1,'Highlord Alexandros Mograine'),
   (-1609238, 'Father, I wish to join you in the war against the undead. I want to fight! I can sit idle no longer!',14705,0,0,6,'Darion Mograine'),
   (-1609239, 'Darion Mograine, you are barely of age to hold a sword, let alone battle the undead hordes of Lordaeron! I couldn\'t bear losing you. Even the thought...',14495,0,0,1,'Highlord Alexandros Mograine'),
   (-1609240, 'If I die, father, I would rather it be on my feet, standing in defiance against the undead legions! If I die, father, I die with you!',14706,0,0,6,'Darion Mograine'),
   (-1609241, 'My son, there will come a day when you will command the Ashbringer and, with it, mete justice across this land. I have no doubt that when that day finally comes, you will bring pride to our people and that Lordaeron will be a better place because of you. But, my son, that day is not today.',14496,0,0,1,'Highlord Alexandros Mograine'),
   (-1609242, 'Do not forget...',14497,0,0,6,'Highlord Alexandros Mograine'),
   (-1609243, 'Touching...',14803,1,0,0,'The Lich King'),
   (-1609244, 'You have\'ve betrayed me! You betrayed us all you monster! Face the might of Mograine!',14707,1,0,0,'Highlord Darion Mograine'),
   (-1609245, 'He\'s mine now...',14805,0,0,0,'The Lich King'),
   (-1609246, 'Pathetic...',14804,0,0,0,'The Lich King'),
   (-1609247, 'You\'re a damned monster, Arthas!',14589,0,0,25,'Highlord Tirion Fordring'),
   (-1609248, 'You were right, Fordring. I did send them in to die. Their lives are meaningless, but yours...',14806,0,0,1,'The Lich King'),
   (-1609249, 'How simple it was to draw the great Tirion Fordring out of hiding. You\'ve left yourself exposed, paladin. Nothing will save you...',14807,0,0,1,'The Lich King'),
   (-1609250, 'ATTACK!!!',14488,1,0,0,'Lord Maxwell Tyrosus'),
   (-1609251, 'APOCALYPSE!',14808,1,0,0,'The Lich King'),
   (-1609252, 'That day is not today...',14708,0,0,0,'Highlord Darion Mograine'),
   (-1609253, 'Tirion!',14709,1,0,0,'Highlord Darion Mograine'),
   (-1609254, 'ARTHAS!!!!',14591,1,0,0,'Highlord Tirion Fordring'),
   (-1609255, 'What is this?',14809,1,0,0,'The Lich King'),
   (-1609256, 'Your end.',14592,1,0,0,'Highlord Tirion Fordring'),
   (-1609257, 'Impossible...',14810,1,0,0,'The Lich King'),
   (-1609258, 'This... isn\'t... over...',14811,1,0,25,'The Lich King'),
   (-1609259, 'When next we meet it won\'t be on holy ground, paladin.',14812,1,0,1,'The Lich King'),
   (-1609260, 'Rise, Darion, and listen...',14593,0,0,0,'Highlord Tirion Fordring'),
   (-1609261, 'We have all been witness to a terrible tragedy. The blood of good men has been shed upon this soil! Honorable knights, slain defending their lives - our lives!',14594,0,0,0,'Highlord Tirion Fordring'),
   (-1609262, 'And while such things can never be forgotten, we must remain vigilant in our cause!',14595,0,0,0,'Highlord Tirion Fordring'),
   (-1609263, 'The Lich King must answer for what he has done and must not be allowed to cause further destruction to our world.',14596,0,0,0,'Highlord Tirion Fordring'),
   (-1609264, 'I make a promise to you now, brothers and sisters: The Lich King will be defeated! On this day, I call for a union.',14597,0,0,0,'Highlord Tirion Fordring'),
   (-1609265, 'The Argent Dawn and the Order of the Silver Hand will come together as one! We will succeed where so many before us have failed!',14598,0,0,0,'Highlord Tirion Fordring'),
   (-1609266, 'We will take the fight to Arthas and tear down the walls of Icecrown!',14599,0,0,15,'Highlord Tirion Fordring'),
   (-1609267, 'The Argent Crusade comes for you, Arthas!',14600,1,0,15,'Highlord Tirion Fordring'),
   (-1609268, 'So too do the Knights of the Ebon Blade... While our kind has no place in your world, we will fight to bring an end to the Lich King. This I vow!',14710,0,0,1,'Highlord Darion Mograine'),
-- Emotes
   (-1609269, 'Thousands of Scourge rise up at the Highlord\'s command.',0,2,0,0,''),
   (-1609270, 'The army marches towards Light\'s Hope Chapel.',0,2,0,0,''),
   (-1609271, 'After over a hundred Defenders of the Light fall, Highlord Tirion Fordring arrives.',0,2,0,0,''),
   (-1609272, '%s flee',0,2,0,0,'Orbaz'),
   (-1609273, '%s kneels in defeat before Tirion Fordring.',0,2,0,0,'Highlord Darion Mograine'),
   (-1609274, '%s arrives.',0,2,0,0,'Highlord Alexandros Mograine'),
   (-1609275, '%s becomes a shade of his past, and walks up to his father.',0,2,0,0,'Highlord Darion Mograine'),
   (-1609276, '%s hugs his father.',0,2,0,0,'Darion Mograine'),
   (-1609277, '%s disappears, and the Lich King appears.',0,2,0,0,'Alexandros'),
   (-1609278, '%s becomes himself again...and is now angry.',0,2,0,0,'Highlord Darion Mograine'),
   (-1609279, '%s casts a spell on Tirion.',0,2,0,0,'The Lich King'),
   (-1609280, '%s gasps for air.',0,2,0,0,'Highlord Tirion Fordring'),
   (-1609281, '%s casts a powerful spell, killing the Defenders and knocking back the others.',0,2,0,0,'The Lich King'),
   (-1609282, '%s throws the Corrupted Ashbringer to Tirion, who catches it. Tirion becomes awash with Light, and the Ashbringer is cleansed.',0,2,0,0,'Highlord Darion Mograine'),
   (-1609283, '%s collapses.',0,2,0,0,'Highlord Darion Mograine'),
   (-1609284, '%s charges towards the Lich King, Ashbringer in hand and strikes the Lich King.',0,2,0,0,'Highlord Tirion Fordring'),
   (-1609285, '%s disappears. Tirion walks over to where Darion lay',0,2,0,0,'The Lich King'),
   (-1609286, 'Light washes over the chapel �X the Light of Dawn is uncovered.',0,2,0,0,'');

DELETE FROM `script_texts` WHERE entry BETWEEN -1609293 AND -1609289;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
-- Emotes
   (-1609289, "Orbaz flees.",0,2,0,0,"Orbaz"),
   (-1609290, "Highlord Darion Mograine kneels in defeat before Tirion Fordring.",0,3,0,0,"Highlord Darion Mograine"),
   (-1609291, "Darion Mograine hugs his father.",0,2,0,0,"Darion Mograine"),
   (-1609292, "Highlord Tirion Fordring gasps for air.",0,2,0,0,"Highlord Tirion Fordring"),
   (-1609293, "Highlord Darion Mograine collapses.",0,2,0,0,"Highlord Darion Mograine");

-- ----------------------------------------------
-- Quest how to win friends and influence enemies
-- ----------------------------------------------
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1609119 AND -1609101;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
   (-1609101, 'I\'ll tear the secrets from your soul! Tell me about the "Crimson Dawn" and your life may be spared!',0,0,0,0,'player SAY_PERSUADE1'),
   (-1609102, 'Tell me what you know about "Crimson Dawn" or the beatings will continue!',0,0,0,0,'player SAY_PERSUADE2'),
   (-1609103, 'I\'m through being courteous with your kind, human! What is the "Crimson Dawn?"',0,0,0,0,'player SAY_PERSUADE3'),
   (-1609104, 'Is your life worth so little? Just tell me what I need to know about "Crimson Dawn" and I\'ll end your suffering quickly.',0,0,0,0,'player SAY_PERSUADE4'),
   (-1609105, 'I can keep this up for a very long time, Scarlet dog! Tell me about the "Crimson Dawn!"',0,0,0,0,'player SAY_PERSUADE5'),
   (-1609106, 'What is the "Crimson Dawn?"',0,0,0,0,'player SAY_PERSUADE6'),
   (-1609107, '"Crimson Dawn!" What is it! Speak!',0,0,0,0,'player SAY_PERSUADE7'),
   (-1609108, 'You\'ll be hanging in the gallows shortly, Scourge fiend!',0,0,0,0,'crusader SAY_CRUSADER1'),
   (-1609109, 'You\'ll have to kill me, monster! I will tell you NOTHING!',0,0,0,0,'crusader SAY_CRUSADER2'),
   (-1609110, 'You hit like a girl. Honestly. Is that the best you can do?',0,0,0,0,'crusader SAY_CRUSADER3'),
   (-1609111, 'ARGH! You burned my last good tabard!',0,0,0,0,'crusader SAY_CRUSADER4'),
   (-1609112, 'Argh... The pain... The pain is almost as unbearable as the lashings I received in grammar school when I was but a child.',0,0,0,0,'crusader SAY_CRUSADER5'),
   (-1609113, 'I used to work for Grand Inquisitor Isillien! Your idea of pain is a normal mid-afternoon for me!',0,0,0,0,'crusader SAY_CRUSADER6'),
   (-1609114, 'I\'ll tell you everything! STOP! PLEASE!',0,0,0,20,'break crusader SAY_PERSUADED1'),
   (-1609115, 'We... We have only been told that the "Crimson Dawn" is an awakening. You see, the Light speaks to the High General. It is the Light...',0,0,0,20,'break crusader SAY_PERSUADED2'),
   (-1609116, 'The Light that guides us. The movement was set in motion before you came... We... We do as we are told. It is what must be done.',0,0,0,20,'break crusader SAY_PERSUADED3'),
   (-1609117, 'I know very little else... The High General chooses who may go and who must stay behind. There\'s nothing else... You must believe me!',0,0,0,20,'break crusader SAY_PERSUADED4'),
   (-1609118, 'LIES! The pain you are about to endure will be talked about for years to come!',0,0,0,0,'break crusader SAY_PERSUADED5'),
   (-1609119, 'NO! PLEASE! There is one more thing that I forgot to mention... A courier comes soon... From Hearthglen. It...',0,0,0,20,'break crusader SAY_PERSUADED6');

-- ---------------------------------------
-- Waypoints for Massacre at Light's Point
-- ---------------------------------------

DELETE FROM `script_waypoint` WHERE `entry`='28864';
INSERT INTO `script_waypoint` 
    (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`) 
VALUES
    ('28864', '0', '2199.4602', '-6125.4033', '35.6491', '1000'),
    ('28864', '1', '2237.8930', '-6007.2319', '73.6170', '0'),
    ('28864', '2', '2292.5766', '-5931.1767', '109.880', '0'),
    ('28864', '3', '2337.958496', '-5776.514648', '171.126999', '0'),
    ('28864', '4', '2363.8535', '-5715.2338', '153.921', '0');

DELETE FROM `script_waypoint` WHERE `entry` = 28841;
INSERT INTO `script_waypoint` 
    (`entry`, `pointid`, `location_x`, `location_y`, `location_z`, `waittime`) 
VALUES
    ('28841', '0', '2389.030000', '-5902.740000', '109.014000', '5000'),
    ('28841', '1', '2341.812012', '-5900.484863', '102.619743', '0'),
    ('28841', '2', '2306.561279', '-5901.738210', '91.7924190', '0'),
    ('28841', '3', '2300.098389', '-5912.618652', '86.0148850', '0'),
    ('28841', '4', '2294.142090', '-5927.274414', '75.3168490', '0'),
    ('28841', '5', '2286.984375', '-5944.955566', '63.7149660', '0'),
    ('28841', '6', '2280.001709', '-5961.186035', '54.2282830', '0'),
    ('28841', '7', '2259.389648', '-5974.197754', '42.3593480', '0'),
    ('28841', '8', '2242.882812', '-5984.642578', '32.8278500', '0'),
    ('28841', '9', '2222.845625', '-6017.849473',  '10.153750', '0'),
    ('28841', '10', '2202.595947', '-6061.325684', '5.8820180', '0'),
    ('28841', '11', '2188.974609', '-6080.866699', '3.3700270', '0'),
    ('28841', '12', '2176.483887', '-6110.407227', '1.8551810', '0'),
    ('28841', '13', '2172.516602', '-6146.752441', '1.0742350', '0'),
    ('28841', '14', '2138.918457', '-6158.920898', '1.3429260', '0'),
    ('28841', '15', '2129.866699', '-6174.107910', '4.3807790', '0'),
    ('28841', '16', '2122.426270', '-6185.311035', '14.052804', '0'),
    ('28841', '17', '2117.739014', '-6193.830079', '13.354200', '10000');

-- --------------------
-- WP for light of dawn
-- --------------------

-- Mograine waypoints
DELETE FROM `script_waypoint` WHERE entry=29173;
INSERT INTO `script_waypoint` VALUES
(29173, 0, 2431.639, -5137.05, 83.843, 0, 'intro'),
(29173, 1, 2409.283, -5160.33, 81.305, 0, "charge waypoint1"),
(29173, 2, 2386.975, -5183.85, 74.165, 0, "charge waypoint2"),
(29173, 3, 2361.106, -5211.12, 80.078, 0, "charge waypoint3"),
(29173, 4, 2338.719, -5238.97, 84.738, 0, "charge waypoint4"),
(29173, 5, 2319.242, -5266.486, 82.825, 0, 'summon & on hold'),
(29173, 6, 2318.775, -5266.832, 82.783, 0, 'cast light of dawn'),
(29173, 7, 2280.812, -5284.091, 82.608, 0, 'move to here and start'),
(29173, 8, 2280.727, -5286.839, 82.930, 0, 'move forward to talk'),
(29173, 9, 2280.812, -5284.091, 82.608, 0, 'when baba pop'),
(29173, 10, 2281.461, -5263.014, 81.164, 0, 'charge to lich king'),
(29173, 11, 2257.479, -5296.702, 82.165, 0, 'being kicked by Lich King'),
(29173, 12, 2261.237, -5294.983, 82.167, 0, 'throw'),
(29173, 13, 2259.34, -5294.379, 82.167, 0, 'event end');
