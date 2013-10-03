-- -----------------------------------
-- Boss fight HeadlessHorseman Texts -
-- -----------------------------------

DELETE FROM script_texts WHERE entry BETWEEN -1189034 AND -1189022;
INSERT INTO script_texts (entry,content_default,sound,type,language,emote,comment) VALUES
(-1189022,'It is over, your search is done! Let fate choose now, the righteous one.',11961,1,0,0,'horseman SAY_ENTRANCE'),
(-1189023,'Here\'s my body, fit and pure! Now, your blackened souls I\'ll cure!',12567,1,0,0,'horseman SAY_REJOINED'),
(-1189024,'So eager you are for my blood to spill, yet to vanquish me this my head you must kill!',11969,1,0,0,'horseman SAY_BODY_DEFEAT'),
(-1189025,'Get Over here, you idiot!',12569,1,0,0,'horseman SAY_LOST_HEAD'),
(-1189026,'Harken, cur! Tis you I spurn! Now, $N, feel the burn!',12573,1,0,0,'horseman SAY_CONFLAGRATION'),
(-1189027,'Soldiers arise, stand and fight! Bring victory at last to this fallen knight!',11963,1,0,0,'horseman SAY_SPROUTING_PUMPKINS'),
(-1189028,'Your body lies beaten, battered and broken. Let my curse be your own, fate has spoken.',11962,1,0,0,'horseman SAY_SLAY'),
(-1189029,'This end have I reached before. What new adventure lies in store?',11964,1,0,0,'horseman SAY_DEATH'),
(-1189030,'%s laughs.',0,2,0,0,'horseman EMOTE_LAUGH'),
(-1189031,'Horseman rise...',0,0,0,0,'horseman SAY_PLAYER1'),
(-1189032,'Your time is night...',0,0,0,0,'horseman SAY_PLAYER2'),
(-1189033,'You felt death once...',0,0,0,0,'horseman SAY_PLAYER3'),
(-1189034,'Now, know demise!',0,0,0,0,'horseman SAY_PLAYER4');

-- -------------------------------
-- headless horseman event texts -
-- -------------------------------

DELETE FROM script_texts WHERE entry BETWEEN -1110006 AND -1110001;
INSERT INTO script_texts (entry, content_default, TYPE, sound) VALUES
(-1110001, "Prepare yourselves, the bells have tolled! Shelter your weak, your young and your old! Each of you shall pay the final sum. Cry for mercy, the reckoning has come!",1,11966),
(-1110002, "The sky is dark. The fire burns. You strive in vain as Fate's wheel turns.",1,12570),
(-1110003, "The town still burns, a cleansing fire! Time is short, I'll soon retire!",1,12571),

(-1110004, "Fire consumes! You've tried and failed. Let there be no doubt, justice prevailed!",1,11967),
(-1110005, "My flames have died, left not a spark. I shall send you myself, to the lifeless dark.",1,11968),
(-1110006, "Harken, cur! Tis you I spurn! Now feel... the burn!",1,12573);

-- ------------------------------
-- Pilgrim's bounty event texts -
-- ------------------------------

DELETE FROM `script_texts` WHERE `entry` in (-1730001, -1730002, -1730003, -1730004);
INSERT INTO `script_texts` (`entry`, `content_default`, `content_loc8`, `type`, `comment`) VALUES
(-1730001, 'Turkey Hunter!', 'Охотник на индеек!', 3, 'Pilgrim\'s Bounty - 10 Wild Turkeys killed'),
(-1730002, 'Turkey Domination!', 'Повелитель индеек!', 3, 'Pilgrim\'s Bounty - 20 Wild Turkeys killed'),
(-1730003, 'Turkey Slaughter!', 'Истребитель индеек!', 3, 'Pilgrim\'s Bounty - 30 Wild Turkeys killed'),
(-1730004, 'TURKEY TRIUMPH!', 'ТРИУМФ НАД ИНДЕЙКАМИ!', 3, 'Pilgrim\'s Bounty - 40 Wild Turkeys killed');
