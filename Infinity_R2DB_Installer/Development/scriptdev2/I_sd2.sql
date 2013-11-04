/*========== EBON HOLD(DK STARTING AREA)======================*/

-- --------------------------------------------------
-- Quest The Gift That Keeps On Giving - script texts
-- --------------------------------------------------

DELETE FROM `script_texts` WHERE `entry` BETWEEN -1609101 AND -1609091;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(-1609091, "Smell flesh... close...",0,0,0,434,"SAY_SCARLET_GHOUL_SPAWN1"),
(-1609092, "The grave calls to us all!",0,0,0,434,"SAY_SCARLET_GHOUL_SPAWN2"),
(-1609093, "GIVE ME BRAINS!",0,0,0,434,"SAY_SCARLET_GHOUL_SPAWN3"),
(-1609094, "Poppy!",0,0,0,434,"SAY_SCARLET_GHOUL_SPAWN4"),
(-1609095, "Mommy?",0,0,0,434,"SAY_SCARLET_GHOUL_SPAWN5"),
(-1609096, "So hungry...",0,0,0,434,"SAY_SCARLET_GHOUL_SPAWN6"),
(-1609097, "The pit calls, minion. Go to it, NOW!",0,0,0,25,"SAY_SCARLET_GOTHIK1"),
(-1609098, "GHOUL! PIT! NOW!",0,0,0,25,"SAY_SCARLET_GOTHIK2"),
(-1609099, "Back you mindless wretch! Back to the pit!",0,0,0,25,"SAY_SCARLET_GOTHIK3"),
(-1609100, "It puts the ghoul in the pit or else it gets the lash!",0,0,0,25,"SAY_SCARLET_GOTHIK4"),
(-1609101, "Get in the pit you worthless pile of garbage!",0,0,0,25,"SAY_SCARLET_GOTHIK5");

-- ----------------------------------------------
-- Quest how to win friends and influence enemies
-- ----------------------------------------------
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1609120 AND -1609102;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
   (-1609102, 'I\'ll tear the secrets from your soul! Tell me about the "Crimson Dawn" and your life may be spared!',0,0,0,0,'player SAY_PERSUADE1'),
   (-1609103, 'Tell me what you know about "Crimson Dawn" or the beatings will continue!',0,0,0,0,'player SAY_PERSUADE2'),
   (-1609104, 'I\'m through being courteous with your kind, human! What is the "Crimson Dawn?"',0,0,0,0,'player SAY_PERSUADE3'),
   (-1609105, 'Is your life worth so little? Just tell me what I need to know about "Crimson Dawn" and I\'ll end your suffering quickly.',0,0,0,0,'player SAY_PERSUADE4'),
   (-1609106, 'I can keep this up for a very long time, Scarlet dog! Tell me about the "Crimson Dawn!"',0,0,0,0,'player SAY_PERSUADE5'),
   (-1609107, 'What is the "Crimson Dawn?"',0,0,0,0,'player SAY_PERSUADE6'),
   (-1609108, '"Crimson Dawn!" What is it! Speak!',0,0,0,0,'player SAY_PERSUADE7'),
   (-1609109, 'You\'ll be hanging in the gallows shortly, Scourge fiend!',0,0,0,0,'crusader SAY_CRUSADER1'),
   (-1609110, 'You\'ll have to kill me, monster! I will tell you NOTHING!',0,0,0,0,'crusader SAY_CRUSADER2'),
   (-1609111, 'You hit like a girl. Honestly. Is that the best you can do?',0,0,0,0,'crusader SAY_CRUSADER3'),
   (-1609112, 'ARGH! You burned my last good tabard!',0,0,0,0,'crusader SAY_CRUSADER4'),
   (-1609113, 'Argh... The pain... The pain is almost as unbearable as the lashings I received in grammar school when I was but a child.',0,0,0,0,'crusader SAY_CRUSADER5'),
   (-1609114, 'I used to work for Grand Inquisitor Isillien! Your idea of pain is a normal mid-afternoon for me!',0,0,0,0,'crusader SAY_CRUSADER6'),
   (-1609115, 'I\'ll tell you everything! STOP! PLEASE!',0,0,0,20,'break crusader SAY_PERSUADED1'),
   (-1609116, 'We... We have only been told that the "Crimson Dawn" is an awakening. You see, the Light speaks to the High General. It is the Light...',0,0,0,20,'break crusader SAY_PERSUADED2'),
   (-1609117, 'The Light that guides us. The movement was set in motion before you came... We... We do as we are told. It is what must be done.',0,0,0,20,'break crusader SAY_PERSUADED3'),
   (-1609118, 'I know very little else... The High General chooses who may go and who must stay behind. There\'s nothing else... You must believe me!',0,0,0,20,'break crusader SAY_PERSUADED4'),
   (-1609119, 'LIES! The pain you are about to endure will be talked about for years to come!',0,0,0,0,'break crusader SAY_PERSUADED5'),
   (-1609120, 'NO! PLEASE! There is one more thing that I forgot to mention... A courier comes soon... From Hearthglen. It...',0,0,0,20,'break crusader SAY_PERSUADED6');


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
