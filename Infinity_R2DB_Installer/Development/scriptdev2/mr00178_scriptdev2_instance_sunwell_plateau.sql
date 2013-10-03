-- Kil'jaeden
DELETE FROM script_texts WHERE entry BETWEEN -1580080 AND -1580064;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
   (-1580064, 'All my plans have led to this!',12495,1,0,0,'Kil\'jaeden SAY_KJ_OFFCOMBAT1'),
   (-1580065, 'Stay on task! Do not waste time!',12496,1,0,0,'Kil\'jaeden SAY_KJ_OFFCOMBAT2'),
   (-1580066, 'I have waited long enough!',12497,1,0,0,'Kil\'jaeden SAY_KJ_OFFCOMBAT3'),
   (-1580067, 'Fail me and suffer for eternity!',12498,1,0,0,'Kil\'jaeden SAY_KJ_OFFCOMBAT4'),
   (-1580068, 'Drain the girl! Drain her power until there is nothing but a vacant shell!',12499,1,0,0,'Kil\'jaeden SAY_KJ_OFFCOMBAT5'),
   (-1580069, 'The expendible have perished... So be it! Now I shall succeed where Sargeras could not! I will bleed this wretched world and secure my place as the true master of the Burning Legion. The end has come! Let the unraveling of this world commence!',12500,1,0,0,'Kil\'jaeden SAY_KJ_EMERGE'),
   (-1580070, 'Another step towards destruction!',12501,1,0,0,'Kil\'jaeden SAY_KJ_SLAY1'),
   (-1580071, 'Anak-ky\'ri!',12502,1,0,0,'Kil\'jaeden SAY_KJ_SLAY2'),
   (-1580072, 'Who can you trust?',12503,1,0,0,'Kil\'jaeden SAY_KJ_REFLECTION1'),
   (-1580073, 'The enemy is upon you!',12504,1,0,0,'Kil\'jaeden SAY_KJ_REFLECTION2'),
   (-1580074, 'Chaos!',12505,1,0,0,'Kil\'jaeden SAY_KJ_DARKNESS1'),
   (-1580075, 'Destruction!',12506,1,0,0,'Kil\'jaeden SAY_KJ_DARKNESS2'),
   (-1580076, 'Oblivion!',12507,1,0,0,'Kil\'jaeden SAY_KJ_DARKNESS3'),
   (-1580077, 'I will not be denied! This world shall fall!',12508,1,0,0,'Kil\'jaeden SAY_KJ_DENINE'),
   (-1580078, 'Do not harbor false hope. You cannot win!',12509,1,0,0,'Kil\'jaeden SAY_KJ_CANNOT_WIN'),
   (-1580079, 'Aggghh! The powers of the Sunwell... turned... against me! What have you done? WHAT HAVE YOU DONE?',12510,1,0,0,'Kil\'jaeden SAY_KJ_LOST_POWER'),
   (-1580080, 'You are not alone. The Blue Dragonflight shall help you vanquish the Deceiver. ',12438,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_INTRO');
DELETE FROM script_texts WHERE entry BETWEEN -1580089 AND -1580081;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
   (-1580081, 'Anveena, you must awaken, this world needs you!',12445,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_AWAKEN'),
   (-1580082, 'I serve only the Master now.',12511,1,0,0,'Kil\'jaeden(Kalecgos) SAY_ANVEENA_IMPRISONED'),
   (-1580083, 'You must let go! You must become what you were always meant to be! The time is now, Anveena!',12446,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_LETGO'),
   (-1580084, 'But I\'m... lost... I cannot find my way back!',12512,1,0,0,'Kil\'jaeden(Kalecgos) SAY_ANVEENA_LOST'),
   (-1580085, 'Anveena, I love you! Focus on my voice, come back for me now! Only you can cleanse the Sunwell!',12447,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_FOCUS'),
   (-1580086, 'Kalec... Kalec?',12513,1,0,0,'Kil\'jaeden(Kalecgos) SAY_ANVEENA_KALEC'),
   (-1580087, 'Yes, Anveena! Let fate embrace you now!',12448,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_FATE'),
   (-1580088, 'The nightmare is over, the spell is broken! Goodbye, Kalec, my love!',12514,1,0,0,'Kil\'jaeden(Kalecgos) SAY_ANVEENA_GOODBYE'),
   (-1580089, 'Goodbye, Anveena, my love. Few will remember your name, yet this day you change the course of destiny. What was once corrupt is now pure. Heroes, do not let her sacrifice be in vain.',12450,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_GOODBYE');
DELETE FROM script_texts WHERE entry BETWEEN -1580097 AND -1580090;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
   (-1580090, 'Strike now, heroes, while he is weakened! Vanquish the Deceiver!',12449,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_ENCOURAGE'),
   (-1580091, 'I will channel my power into the orbs, be ready!',12440,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_ORB1'),
   (-1580092, 'I have empowered another orb! Use it quickly!',12441,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_ORB2'),
   (-1580093, 'Another orb is ready! Make haste!',12442,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_ORB3'),
   (-1580094, 'I have channeled all I can! The power is in your hands!',12443,1,0,0,'Kil\'jaeden(Kalecgos) SAY_KALECGOS_ORB4'),
-- Kiljaeden ending
   (-1580095,'Mortal heroes - your victory here today was foretold long ago. My brother\'s anguished cry of defeat will echo across the universe - bringing renewed hope to all those who still stand against the Burning Crusade.',12515,1,0,0,'velen_outro1'),
   (-1580096,'As the Legion\'s final defeat draws ever-nearer, stand proud in the knowledge that you have saved worlds without number from the flame.',12516,1,0,0,'velen_outro2'),
   (-1580097,'Just as this day marks an ending, so too does it herald a new beginning...',12517,1,0,0,'velen_outro3');
-- (-1580098) ???????
DELETE FROM script_texts WHERE entry BETWEEN -1580103 AND -1580099;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
   (-1580099,'The creature Entropius, whom you were forced to destroy, was once the noble naaru, M\'uru. In life, M\'uru channeled vast energies of LIGHT and HOPE. For a time, a misguided few sought to steal those energies...',12518,1,0,0,'velen_outro4'),
   (-1580100,'Our arrogance was unpardonable. We damned one of the most noble beings of all. We may never atone for this sin.',12524,1,0,0,'liadrin_outro5'),
   (-1580101,'Than fortunate it is, that I have reclaimed the noble naaru\'s spark from where it fell! Where faith dwells, hope is never lost, young blood elf.',12519,1,0,0,'velen_outro6'),
   (-1580102,'Can it be ?',12525,1,0,0,'liadrin_outro8'),
   (-1580103,'Gaz now, mortals - upon the HEART OF M\'URU! Umblemished. Bathed by the light of Creation - just as it was at the Dawn.',12520,1,0,0,'velen_outro9');
DELETE FROM script_texts WHERE entry BETWEEN -1580107 AND -1580104;
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
   (-1580104,'In time, the light and hope held within - will rebirth more than this mere fount of power... Mayhap, they will rebirth the soul of a nation.',12521,1,0,0,'velen_outro10'),
   (-1580105,'Blessed ancestors! I feel it... so much love... so much grace... there are... no words... impossible to describe...',12526,1,0,0,'liadrin_outro11'),
   (-1580106,'Salvation, young one. It waits for us all.',12522,1,0,0,'velen_outro12'),
   (-1580107,'Farewell...!',12523,1,0,0,'velen_outro13');
