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