-- Pit of saron
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1658099 AND -1658000;

INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(-1658001,'Intruders have entered the masters domain. Signal the alarms!',16747,1,0,0,'tyrannus SAY_TYRANNUS_INTRO_1'),
(-1658004,'Hrmph, fodder. Not even fit to labor in the quarry. Relish these final moments for soon you will be nothing more than mindless undead.',16748,1,0,0,'tyrannus SAY_TYRANNUS_INTRO_2'),
(-1658005,'Your last waking memory will be of agonizing pain.',16749,1,0,0,'tyrannus SAY_TYRANNUS_INTRO_3'),
(-1658008,'Minions, destroy these interlopers!',16751,1,0,0,'tyrannus SAY_TYRANNUS_INTRO_4'),
-- Garfrost
(-1658022,'%s hurls a massive saronite boulder at you!',0,5,0,0,'garfrost EMOTE_THROW_SARONITE'), -- TODO emote only displayed to target
(-1658023,'%s casts Deep Freeze at $N.',0,3,0,0,'garfrost EMOTE_DEEP_FREEZE'),
-- Krick
(-1658032,'%s begins rapidly conjuring explosive mines!',0,3,0,0,'krick EMOTE_KRICK_MINES'),
(-1658033,'%s begins to unleash a toxic poison cloud!',0,3,0,0,'ick EMOTE_ICK_POISON'),
(-1658034,'%s is chasing you!',0,5,0,0,'ick EMOTE_ICK_CHASING'), -- TODO emote type?
-- Tyrannus
(-1658057,'Rimefang, destroy this fool!',16764,1,0,0,'tyrannus SAY_MARK'),
(-1658058,'Power... overwhelming!',16765,1,0,0,'tyrannus SAY_SMASH'),
(-1658059,'The frostwyrm %s gazes at $N and readies an icy attack!',0,3,0,0,'rimefang EMOTE_RIMEFANG_ICEBOLT'),
(-1658060,'%s roars and swells with dark might!',0,3,0,0,'tyrannus EMOTE_SMASH');


INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES

-- Intro
(-1658002, 'Heroes of the Alliance, attack!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16626, 1, 0, 0, 'jaina_intro1'),
(-1658006, 'No! You monster!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16627, 1, 0, 0, 'jaina_intro2'),
(-1658009, 'I do what I must. Please forgive me noble soldiers!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16628, 1, 0, 0, 'jaina_intro3'),
(-1658010, 'You will have to make your way across this quary on your own!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16629, 1, 0, 0, 'jaina_intro4'),
(-1658012, 'Free any alliance slaves that you come across! We will certianly need their assistance in battling Tyrannus. I will gather reinforcements and join you on the other side of the quary.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16630, 1, 0, 0, 'jaina_intro5'),
(-1658003, 'Soldiers of the Horde, attack!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17045, 1, 0, 0, 'sylvanas_intro1'),
(-1658007, 'Pathetic weaklings!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17046, 1, 0, 0, 'sylvanas_intro2'),
(-1658011, 'You will have to battle you way through this seespate on your own.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17047, 1, 0, 0, 'sylvanas_intro3'),
(-1658013, 'Free any horde slaves that you come across. We will certianly need their assistance in battling Tyrannus. I will gather reinforcements and join you on the other side of the quary.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17048, 1, 0, 0, 'sylvanas_intro4'),

-- Garfrost
(-1658014, 'Tiny creatures under feet, you bring Garfrost something good to eat!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Маленьких букашек тыща принести Гархладу пища... Ха-ха-ха-ха', 16912, 1, 0, 0, 'aggro'),
(-1658015, 'Will save for snack. For later.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Оставить на потом. Сейчас не хочу...', 16913, 1, 0, 0, 'slay'),
(-1658019, 'That one maybe not so good to eat now. Stupid Garfrost! BAD! BAD!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Этот кусок сейчас лучше не есть, глупый Гархлад. Плохой! Плохой!', 16914, 1, 0, 0, 'slay2'),
(-1658018, 'Axe too weak. Garfrost make better and CRUSH YOU!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Топор слабый. Гархлад, сделает другую штуку и раздавит вас', 16916, 1, 0, 0, '66%'),
(-1658017, 'Garfrost hope giant underpants clean. Save boss great shame. For later.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Гархлад надеется, большие штаны чистые. Спасет от большого позора. Пока.', 16915, 1, 0, 0, 'death'),
(-1658020, 'Another shall take his place. You waste your time.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Его место займет другой. Вы попусту тратите время', 16752, 1, 0, 0, 'tyranus_outro'),
(-1658021, 'The forgemaster is dead! Get geared up men, we have a Scourgelord to kill.', NULL, NULL, NULL, NULL, NULL, '¡Héroes! ¡Retendremos a los no-muertos cuanto podamos, hasta nuestro aliento final! ¡Ocupaos del Señor de la Plaga!', NULL, NULL, 17148, 1, 0, 0, 'outro2'),

-- Krick
(-1658024, 'Our work must not be interrupted! Ick! Take care of them!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Нельзя мешать нашей работе! Ик! Займемся ими!', 16926, 1, 0, 0, 'aggro'),
(-1658028, 'Quickly! Poison them all while they\'re still close!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Скорей! Отрави их, пока они близко!', 16930, 1, 0, 0, 'poison_nova'),
(-1658027, 'Enough moving around! Hold still while I blow them all up!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Хватит суетиться! Замри, пока я буду их взрывать!', 16929, 1, 0, 0, 'explosive_barrage'),
(-1658029, 'No! That one! That one! Get that one!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Нет же! Целься в этого! Да вот в этого!', 16932, 1, 0, 0, 'pursue2'),
(-1658030, 'I\'ve changed my mind...go get that one instead!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Я... передумал... лучше в этого!', 16931, 1, 0, 0, 'pursue1'),
(-1658031, 'What are you attacking him for? The dangerous one is over there,fool!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Да что ты к тому привязался? Этот опаснее, тупица!', 16933, 1, 0, 0, 'pursue3'),
(-1658025, 'Ooh...We could probably use these parts!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'О-хо-хо... Твои культяпки нам пригодятся!', 16927, 1, 0, 0, 'slay1'),
(-1658026, 'Arms and legs are in short supply...Thanks for your contribution!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'У нас как раз кончались руки и ноги... Благодарю за вклад!', 16928, 1, 0, 0, 'slay2'),
(-1658035, 'Wait! Stop! Don\'t kill me, please! I\'ll tell you everything!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Подождите! Не убивайте меня, умоляю! Я вам все расскажу!', 16934, 1, 0, 0, 'krick_stop'),
(-1658036, 'I\'m not so naive as to believe your appeal for clemency, but I will listen.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Я не так наивна, чтобы верить твоим причитаниям. Но я выслушаю тебя.', 16611, 1, 0, 0, 'outro1_aly'),
(-1658037, 'Why should the Banshee Queen spare your miserable life?', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Почему королева Банши должна выслушивать твое нытьё?', 17033, 1, 0, 0, 'outro1_horde'),
(-1658038, 'What you seek is in the master\'s lair, but you must destroy Tyrannus to gain entry. Within the Halls of Reflection you will find Frostmourne. It... it holds the truth.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'То, что вы ищете, находится в покоях господина, но чтобы попасть туда, вам надо убить Тирания. В Залах Отражений хранится Ледяная Скорбь. В клинке... сокрыта Истина!', 16935, 1, 0, 0, 'outro2_krick'),
(-1658039, 'Frostmourne lies unguarded? Impossible!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Меч никто не охраняет? Не может быть.', 16612, 1, 0, 0, 'outro3_aly'),
(-1658040, 'Frostmourne? The Lich King is never without his blade! If you are lying to me...', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Король Лич никогда не расстается со своим мечом, если ты мне лжешь...', 17034, 1, 0, 0, 'outro3_horde'),
(-1658041, 'I swear it is true! Please, don\'t kill me!!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Клянусь это правда! Прошу, не убивайте меня!!', 16936, 1, 0, 0, 'outro4_krick'),
(-1658042, 'Worthless gnat! Death is all that awaits you!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Жалкая букашка! Тебя ждет лишь смерть!', 16753, 1, 0, 0, 'outro5_tyrannus'),
(-1658043, 'Urg... no!!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Неет!...', 16937, 1, 0, 0, 'outro6_krick'),
(-1658044, 'Do not think that I shall permit you entry into my master\'s sanctum so easily. Pursue me if you dare.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Не думайте, что я так легко позволю вам пройти в покои господина. Сразитесь со мной, если посмеете.', 16754, 1, 0, 0, 'outro7_tyrannus'),
(-1658045, 'What a cruel end. Come, heroes. We must see if the gnome\'s story is true. If we can separate Arthas from Frostmourne, we might have a chance at stopping him', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16613, 1, 0, 0, 'outro8_aly'),
(-1658046, 'A fitting end for a traitor. Come, we must free the slaves and see what is within the Lich King\'s chamber for ourselves.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Смерть, достойная предателя. Идемте, освободим рабов и увидим своими глазами, что хранится в покоях Короля Лича', 17035, 1, 0, 0, 'outro8_horde'),

-- Tyrannus
(-1658047, 'Your pursuit shall be in vain, adventurers, for the Lich King has placed an army of undead at my command! Behold!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Все ваши усилия напрасны, чужаки, ибо Король Лич поставил меня во главе целой армии нежити! Берегитесь!', 16755, 1, 0, 0, 'ambush1_tyrannus'),
(-1658048, 'Persistent whelps! You will not reach the entrance of my lord\'s lair! Soldiers, destroy them!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Настырные щенки! Вам не пройти в покои моего господина. Солдаты, уничтожить их!', 16756, 1, 0, 0, 'ambush2_tyrannus'),
(-1658049, 'Rimefang! Trap them within the tunnel! Bury them alive!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Иней, останови их! Похорони их заживо!', 16757, 1, 0, 0, 'gauntlet'),
(-1658050, 'Alas, brave, brave adventurers, your meddling has reached its end. Do you hear the clatter of bone and steel coming up the tunnel behind you? That is the sound of your impending demise.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Увы, бесстрашные герои, ваша навязчивость ускорила развязку. Вы слышите громыхание костей и скрежет стали за вашими спинами? Это предвестники скорой погибели!', 16758, 1, 0, 0, 'intro1'),
(-1658051, 'Heroes! We will hold off the undead as long as we can, even to our dying breath. Deal with the Scourgelord!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 'intro2'),
(-1658052, 'Ha, such an amusing gesture from the rabble. When I have finished with you, my master\'s blade will feast upon your souls. Die!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ха-ха-ха-ха.. кто бы мог ожидать такого от черни. Когда я с вами покончу, клинок господина насытится вашими душами. Умрите!', 16759, 1, 0, 0, 'intro3'),
(-1658053, 'I shall not fail The Lich King! Come and meet your end!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Я не подведу Короля Лича! Идите ко мне, и встретьте свою смерть!', 16760, 1, 0, 0, 'aggro'),
(-1658054, 'Such a shameful display... You are better off dead!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Какое жалкое кривляние... Умри и не позорься!', 16761, 1, 0, 0, 'slay1'),
(-1658055, 'Perhaps you should have stayed in the mountains!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Тебе надо было остаться в горах!', 16762, 1, 0, 0, 'slay2'),
(-1658056, 'Impossible! Rimefang...Warn...-', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16763, 1, 0, 0, 'death'),
(-1658061, 'Brave champions, we owe you our lives, our freedom... Though it be a tiny gesture in the face of this enormous debt, I pledge that from this day forth, all will know of your deeds, and the blazing path of light you cut through the shadow of this dark citadel.', NULL, NULL, NULL, NULL, NULL, 'Valientes campeones. Os debemos la vida, nuestra libertad... aunque sea un pequeño gesto, ante nuestra gran deuda. Prometo que, de hoy en adelante, todos conocerán vuestras hazañas, y el llameante camino de luz que lográsteis que atravesara esta oscura ciudadela.', NULL, NULL, 17149, 1, 0, 0, 'outro1'),
(-1658062, 'This day will stand as a testament not only to your valor, but to the fact that no foe, not even the Lich King himself, can stand when Alliance and Horde set aside their differences and ---', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 'outro2'),
(-1658064, 'Take cover behind me! Quickly!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Укройтесь за мной! Скорее!', 17037, 1, 0, 0, 'outro4_horde'),
(-1658063, 'Heroes, to me!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ко мне, герои!', 16614, 1, 0, 0, 'outro4_aly'),
(-1658067, 'I thought he\'d never shut up. At last, Sindragosa silenced that long-winded fool. To the Halls of Reflection, champions! Our objective is near... I can sense it.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Я думала, он никогда не заткнется. Но Синдрагоса заставила этого болтливого дурня умолкнуть. В Залы Отражений, герои!', 17036, 1, 0, 0, 'outro5_horde'),
(-1658065, 'The Frost Queen is gone. We must keep moving - our objective is near.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Королева льда улетела. Надо продолжать путь - цель уже близка.', 16615, 1, 0, 0, 'outro5_aly'),
(-1658066, 'I... I could not save them... Damn you, Arthas! DAMN YOU!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Я... Я не смогла их спасти... Будь ты Проклят, Артас! Будь ты Проклят!', 16616, 1, 0, 0, 'outro6_aly'),
--
(-1658071, 'Garfrost tired of puny mortals. Now your bones will freeze!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Гархлад устал от жалких смертных. Сейчас ваши кости - леденец.', 16917, 1, 0, 0, '33%'),
(-1658072, 'Tyrannus transforms the champions into undead.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16750, 2, 0, 0, 'tyrannus_intro4');
--

-- Forge of souls
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1632055 AND -1632000;
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc1`,`content_loc2`,`content_loc3`,`content_loc4`,`content_loc5`,`content_loc6`,`content_loc7`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
-- Bronjham

(-1632000,'More souls to power the engine!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,1,0,0,'boss_bronjahm SAY_AGGRO_1'),
(-1632001,'Finally...a captive audience!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Наконец то! Гости пожаловали!',16595,1,0,0,'Bronjham SAY_AGGRO'),
(-1632002,'Fodder for the engine!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Скормлю тебя машине!',16596,1,0,0,'Bronjham SAY_SLAY_1'),
(-1632003,'Another soul to strengthen the host!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Еще одна душа обогатит вместилище!',16597,1,0,0,'Bronjham SAY_SLAY_2'),
(-1632004,'My soul for you, master.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Аааааааааааа...',16598,1,0,0,'boss_bronjahm SAY_DEATH'),
(-1632005,'The vortex of the harvested calls to you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вихрь погубленных душ, взываю к вам!',16599,1,0,0,'Bronjham SAY_SOUL_STORM'),
(-1632006,'I will sever the soul from your body!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Я вырву душу из твоего тела!',16600,1,0,0,'Bronjham SAY_CORRUPT_SOUL'),

-- Devourer of Souls
(-1632007,'You dare look upon the host of souls? I SHALL DEVOUR YOU WHOLE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы осмелились взглянуть на вместилище душ! Я сожру вас заживо!',16884,1,0,0,'Devoureur SAY_FACE_ANGER_AGGRO'),
(-1632008,'You dare look upon the host of souls? I SHALL DEVOUR YOU WHOLE!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16890,1,0,0,'Devoureur SAY_FACE_DESIRE_AGGRO'),
(-1632009,'Damnation!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Проклинаю тебя!',16885,1,0,0,'Devoureur SAY_FACE_ANGER_SLAY_1'),
(-1632010,'Damnation!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16896,1,0,0,'Devoureur SAY_FACE_SORROW_SLAY_1'),
(-1632011,'Damnation!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16891,1,0,0,'Devoureur SAY_FACE_DESIRE_SLAY_1'),
(-1632012,'Doomed for eternity!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Обрекаю тебя на вечные муки!',16886,1,0,0,'Devoureur SAY_FACE_ANGER_SLAY_2'),
(-1632014,'Doomed for eternity!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16897,1,0,0,'Devoureur SAY_FACE_SORROW_SLAY_2'),
(-1632013,'Doomed for eternity!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16892,1,0,0,'Devoureur SAY_FACE_DESIRE_SLAY_2'),
(-1632015,'The swell of souls will not be abated! You only delay the inevitable!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вместилише душ не ослабнет! Вы лишь пытаетесь отсрочить неизбежное.',16887,1,0,0,'Devoureur SAY_FACE_ANGER_DEATH'),
(-1632017,'The swell of souls will not be abated! You only delay the inevitable!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16898,1,0,0,'Devoureur SAY_FACE_SORROW_DEATH'),
(-1632016,'The swell of souls will not be abated! You only delay the inevitable!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16893,1,0,0,'Devoureur SAY_FACE_DESIRE_DEATH'),
(-1632018,'SUFFERING! ANGUISH! CHAOS! RISE AND FEED!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Страдание, мучение, хаос! Восстаньте и пируйте!',16888,1,0,0,'Devoureur SAY_FACE_ANGER_UNLEASH_SOUL'),
(-1632020,'SUFFERING! ANGUISH! CHAOS! RISE AND FEED!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16899,1,0,0,'Devoureur SAY_FACE_SORROW_UNLEASH_SOUL'),
(-1632019,'SUFFERING! ANGUISH! CHAOS! RISE AND FEED!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16894,1,0,0,'Devoureur SAY_FACE_DESIRE_UNLEASH_SOUL'),
(-1632021,'Stare into the abyss, and see your end!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вглядитесь в бездну, и узрите свою смерть!',16889,1,0,0,'Devoureur SAY_FACE_ANGER_WAILING_SOUL'),
(-1632022,'Stare into the abyss, and see your end!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16895,1,0,0,'Devoureur SAY_FACE_DESIRE_WAILING_SOUL'),
(-1632023,'%s begins to cast Mirrored Soul!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'boss_devourer EMOTE_MIRRORED_SOUL'),
(-1632024,'%s begins to Unleash Souls!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'boss_devourer EMOTE_UNLEASH_SOULS'),
(-1632025,'%s begins to cast Wailing Souls!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,3,0,0,'boss_devourer EMOTE_WAILING_SOULS'),

(-1632029,'Excellent work, champions! We shall set up our base camp in these chambers. My mages will get the Scourge transport device working shortly. Step inside it when you''re ready for your next mission. I will meet you on the other side.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вы справились. Мы разобьем лагерь в этих покоях. Вскоре мои маги заставят портал плети работать! Войдите в него, когда будете готовы к следующему заданию. Я присоединюсь к вам чуть позже.',16625,1,0,0,'Jaina SAY_JAINA_OUTRO'),
(-1632030,'Excellent work, champions! We shall set up our base camp in these chambers. My mages will get the Scourge transport device working shortly. Step inside when you are ready for your next mission. I will meet you on the other side.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Превосходно! Мы разобьем лагерь в этих покоях! Вскоре мои маги заставят портал плети работать, войдите в него когда будете готовы к следующему заданию! Я присоединюсь к вам позже.',17044,1,0,0,'Sylvanas SAY_SYLVANAS_OUTRO'),

-- Jaina
(-1632040,'Thank the light for seeing you here safely. We have much work to do if we are to defeat the Lich King and put an end to the Scourge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Слава свету! Вы целы и невредимы нам предстоит многое сделать, если мы хотим покончить с королем личем и плетью.',16617,0,0,0,'Jaina SAY_INTRO_1'),
(-1632041,'Our allies within the Argent Crusade and the Knights of the Ebon Blade have broken through the front gate of Icecrown and are attempting to establish a foothold within the Citadel.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Серебряный Авангард и рыцари черного клинка прорвались через главные ворота и пытаются укрепить свои позиции в цитадели!',16618,0,0,0,'Jaina SAY_INTRO_2'),
(-1632042,'Their success hinges upon what we discover in these cursed halls. Although our mission is a wrought with peril, we must persevere!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Их успех зависит от того что мы найдем этих ужасных залах. Пусть наша миссия опасна, но мы должны выстоять.',16619,0,0,0,'Jaina SAY_INTRO_3'),
(-1632043,'With the attention of the Lich King drawn toward the front gate, we will be working our way through the side in search of information that will enable us to defeat the Scourge - once and for all.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пока король лич отвлекся на главные ворота, мы проникнем внутрь другим путем и постараемся узнать как можно покончить с плетью раз и навсегда.',16620,0,0,0,'Jaina SAY_INTRO_4'),
(-1632044,'King Varian''s SI7 agents have gathered information about a private sanctum of the Lich King''s deep within a place called the Halls of Reflection.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Разведчики SI7 отправленные Варианом сообщают что покои короля находятся в глубине дворца! Это место называется Залами отражений.',16621,0,0,0,'Jaina SAY_INTRO_5'),
(-1632045,'We will carve a path through this wretched place and find a way to enter the Halls of Reflection. I sense powerful magic hidden away within those walls... Magic that could be the key to destroy the Scourge.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мы проложим себе путь сквозь это проклятое место и найдем вход в залы отражений. Я чувствую что в них сокрыта могушественная магия, которая поможет нам сокрушить плеть!',16622,0,0,0,'Jaina SAY_INTRO_6'),
(-1632046,'Your first mission is to destroy the machines of death within this malevolent engine of souls, and clear a path for our soldiers.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Ваша первая задача разрушить машины смерти в этом механизме душ, это откроет путь нашим солдатам.',16623,0,0,0,'Jaina SAY_INTRO_7'),
(-1632047,'Make haste, champions! I will prepare the troops to fall in behind you.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Спешите герои, я прикажу солдатам следовать за вами!',16624,0,0,0,'Jaina SAY_INTRO_8'),

-- Sylvanas
(-1632050,'The Argent Crusade and the Knights of the Ebon Blade have assaulted the gates of Icecrown Citadel and are preparing for a massive attack upon the Scourge. Our missition is a bit more subtle, but equally as important.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Серебряный Авангард и рыцари черного клинка штурмуют ворота цитадели ледяной короны! И готовятся нанести решаюший удар! Мы будем действовать незаметно, но не менее эффективно.',17038,0,0,0,'Sylvanas SAY_INTRO_1'),
(-1632051,'With the attention of the Lich King turned towards the front gate, we''ll be working our way through the side in search of information that will enable us to defeat the Lich King - once and for all.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Пока Король-Лич отвлекся мы проникнем внутрь другим путем и постараемся понять как можно покончить с ним раз и навсегда.',17039,0,0,0,'Sylvanas SAY_INTRO_2'),
(-1632052,'Our scouts have reported that the Lich King has a private chamber, outside of the Frozen Throne, deep within a place called the Halls of Reflection. That is our target, champions.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Наши разведчики сообщили что покои короля лича находятся в глубине дворца, недалеко от ледяного трона. Это место называется залами отражений, туда и лежит наш путь.',17040,0,0,0,'Sylvanas SAY_INTRO_3'),
(-1632053,'We will cut a swath of destruction through this cursed place and find a way to enter the Halls of Reflection. If there is anything of value to be found here, it will be found in the Halls.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Мы проложим себе путь сквозь это проклетое место и найдем и найдем вход в залы отражений! Если в цитадели и есть что то достойное внимания оно ждет нас именно там.',17041,0,0,0,'Sylvanas SAY_INTRO_4'),
(-1632054,'Your first mission is to destroy the machines of death within this wretched engine of souls, and clear a path for our soldiers.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Вашей первой задачей будет  разрушение машин смерти в этом гнусном механизме душ, это откроет путь к нашим солдатам',17042,0,0,0,'Sylvanas SAY_INTRO_5'),
(-1632055,'The Dark Lady watches over you. Make haste!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Темная госпожа будет наблюдать за вами, спешите!',17043,0,0,0,'Sylvanas SAY_INTRO_6');

-- Halls of reflection (from MaxXx2021 aka Mioka)
DELETE FROM `script_texts` WHERE `entry` BETWEEN -1668523 AND -1668433;
INSERT INTO `script_texts` (`entry`,`content_default`,`content_loc8`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
-- SCENE - Hall Of Reflection (Intro) - PreUther
(-1668433, 'The chill of this place freezes the marrow of my bones!', 'Как же тут холодно... Кровь стынет в жилах.', 16631,0,0,1, '67234'),
(-1668434, 'I... I don\'t believe it! Frostmourne stands before us, unguarded! Just as the Gnome claimed. Come, heroes!', 'Я... Я не верю своим глазам. Ледяная скорбь перед нами без всякой охраны! Как и говорил гном. Вперед герои!', 17049,0,0,1, '67234'),
(-1668435, 'What is that? Up ahead! Could it be ... ? Heroes at my side!', 'Что это там впереди? Неужели? Скорее герои!', 16632,1,0,1, '67234'),
(-1668436, 'Frostmourne ... The blade that destroyed our kingdom ...', 'Ледяная Скорбь, клинок, разрушивший наше королевство...', 16633,1,0,1, '67234'),
(-1668437, 'Standing this close to the blade that ended my life... The pain... It is renewed.', 'Боль снова захлестывает меня, когда я так близко вижу меч, отнявший у меня жизнь.', 17050,0,0,1, '67234'),
(-1668438, 'Stand back! Touch that blade and your soul will be scarred for all eternity! I must attempt to commune with the spirits locked away within Frostmourne. Give me space, back up please!', 'Отойдите. Тот кто коснется этого клинка обречет себя на вечные муки. Я попытаюсь заговорить с душами заключенными в Ледяной скорби. Расступитесь... Чуть назад! Прошу.', 16634,1,0,1, '67234'),
(-1668439, 'I dare not touch it. Stand back! Stand back! As I attempt to commune with the blade. Perhaps our salvation lies within.', 'Я не смею его коснуться. Назад! Отступите! Я попробую установить связь с мечом. Возможно, спасение находится внутри!', 17051,1,0,1, '67234'),
-- SCENE - Hall Of Reflection (Intro) - UtherDialog
(-1668440, 'Jaina! Could it truly be you?', 'Джайна? Неужели это ты?', 16666,0,0,1, '67234'),
(-1668441, 'Careful, girl. I\'ve heard talk of that cursed blade saving us before. Look around you and see what has been born of Frostmourne.', 'Осторожней девочка! Однажды мне уже говорили, что этот проклятый меч может нас спасти. Посмотри вокруг, и ты увидишь, что из этого вышло.', 16659,0,0,1, '67234'),
(-1668442, 'Uther! Dear Uther! I... I\'m so sorry.', 'Утер? Милый Утер! Мне... Мне так жаль.', 16635,0,0,1, '67234'),
(-1668443, 'Uther...Uther the Lightbringer. How...', 'Утер? Утер Светоносный? Как...', 17052,0,0,1, '67234'),
(-1668444, 'Jaina, you haven\'t much time. The Lich King sees what the sword sees. He will be here shortly.', 'Джайна, у вас мало времени. Король - Лич видит все что видит Ледяная Скорбь. Вскоре он будет здесь.', 16667,0,0,1, '67234'),
(-1668445, 'You haven\'t much time. The Lich King sees what the sword sees. He will be here shortly.', 'У вас мало времени. Король - Лич видит все что видит Ледяная Скорбь. Вскоре он будет здесь.', 16660,0,0,1, '67234'),
(-1668446, 'Arthas is here? Maybe I...', 'Артас здесь? Может я...', 16636,0,0,1, '67234'),
(-1668447, 'The Lich King is here? Then my destiny shall be fulfilled today!', 'Король - Лич здесь? Значит моя судьба решится сегодня!', 17053,1,0,1, '67234'),
(-1668448, 'No, girl. Arthas is not here. Arthas is merely a presence within the Lich King\'s mind. A dwindling presence...', 'Нет девочка. Артаса здесь нет. Артас лишь тень, мелькающая в сознании Короля - Лича. Смутная тень.', 16668,0,0,1, '67234'),
(-1668449, 'You cannot defeat the Lich King. Not here. You would be a fool to try. He will kill those who follow you and raise them as powerful servants of the Scourge. But for you, Sylvanas, his reward for you would be worse than the last.', 'Вам не победить Короля - Лича. Покрайней мере не здесь. Глупо и пытаться. Он убьет твоих соратников и воскресит их как воинов плети. Но что до тебя Сильвана, он готовит тебе участь еще страшнее, чем в прошлый раз.', 16661,0,0,1, '67234'),
(-1668450, 'But Uther, if there\'s any hope of reaching Arthas. I... I must try.', 'Но если есть малейшая надежда вернуть Артаса... Я должна попытаться!', 16637,0,0,1, '67234'),
(-1668451, 'There must be a way...', 'Должен быть способ!', 17054,0,0,1, '67234'),
(-1668452, 'Jaina, listen to me. You must destroy the Lich King. You cannot reason with him. He will kill you and your allies and raise you all as powerful soldiers of the Scourge.', 'Джайна послушай меня. Вам нужно уничтожить Короля - Лича. С ним нельзя договориться. Он убьет вас всех и превратит в могущественных воинов Плети.', 16669,0,0,1, '67234'),
(-1668453, 'Perhaps, but know this: there must always be a Lich King. Even if you were to strike down Arthas, another would have to take his place, for without the control of the Lich King, the Scourge would wash over this world like locusts, destroying all that they touched.', 'Возможно... Но знай! Король - Лич должен быть всегда. Даже если вы убьете Артаса кто то обязан будет занять его место. Лишившись правителя Плеть налетит на мир как стая саранчи и уничтожит все на своем пути.', 16662,0,0,1, '67234'),
(-1668454, 'Tell me how, Uther? How do I destroy my prince? My...', 'Но как Утер? Как мне убить моего принца, моего...', 16638,0,0,1, '67234'),
(-1668455, 'Who could bear such a burden?', 'Кому по силам такое бремя?', 17055,0,0,1, '67234'),
(-1668456, 'Snap out of it, girl. You must destroy the Lich King at the place where he merged with Ner\'zhul - atop the spire, at the Frozen Throne. It is the only way.', 'Забудь об этом девочка. Короля - Лича нужно уничтожить на том месте, где он слился с Нерзулом. На самой вершине, у Ледяного Трона!', 16670,0,0,1, '67234'),
(-1668457, 'I do not know, Banshee Queen. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.', 'Не знаю, Королева Баньши... Если бы не Артас, который все еще является частью Короля - Лича, Плеть давно бы уже уничтожила Азерот.', 16663,0,0,1, '67234'),
(-1668458, 'You\'re right, Uther. Forgive me. I... I don\'t know what got a hold of me. We will deliver this information to the King and the knights that battle the Scourge within Icecrown Citadel.', 'Ты прав Утер, прости меня... Я не знаю что на меня нашло. Мы передадим твои слова Королю и рыцарям, которые сражаются с Плетью в Цитадели Ледяной Короны.', 16639,0,0,1, '67234'),
(-1668459, 'There is... something else that you should know about the Lich King. Control over the Scourge must never be lost. Even if you were to strike down the Lich King, another would have to take his place. For without the control of its master, the Scourge would run rampant across the world - destroying all living things.', 'Тебе нужно знать еще кое что о Короле - Личе. Плеть не должна выйти из под контроля. Даже если вы убьете Короля - Лича, кто-то должен будет занять его место. Без Короля Плеть налетит на мир как стая саранчи и уничтожит все живое.', 16671,0,0,1, '67234'),
(-1668460, 'Alas, the only way to defeat the Lich King is to destroy him at the place he was created.', 'Увы единственый способ одолеть Короля - Лича - это убить его там где он был порожден.', 16664,0,0,1, '67234'),
(-1668461, 'Who could bear such a burden?', 'Кому по силам такое бремя?', 16640,0,0,1, '67234'),
(-1668462, 'The Frozen Throne...', 'Ледяной Трон!', 17056,0,0,1, '67234'),
(-1668463, 'A grand sacrifice by a noble soul...', 'Великая жертва, благородной души.', 16672,0,0,1, '67234'),
(-1668464, 'I do not know, Jaina. I suspect that the piece of Arthas that might be left inside the Lich King is all that holds the Scourge from annihilating Azeroth.', 'Не знаю Джайна... мне кажется если бы не Артас, который все еще является частью Короля - Лича, Плеть давно бы уже уничтожила Азерот.', 16673,0,0,1, '67234'),
(-1668465, 'Then maybe there is still hope...', 'Но может еще есть надежда?', 16641,0,0,1, '67234'),
(-1668466, 'No, Jaina! ARRRRRRGHHHH... He... He is coming. You... You must...', 'Нет Джайна... Эээээ... Он... Он приближается... Вы... Вы должны...', 16674,1,0,1, '67234'),
(-1668467, 'Aye. ARRRRRRGHHHH... He... He is coming. You... You must...', 'Да... Эээээ... Он... Он приближается... Вы... Вы должны...', 16665,1,0,1, '67234'),
(-1668468, 'SILENCE, PALADIN!', 'Замолчи, паладин.', 17225,1,0,0, '67234'),
(-1668469, 'So you wish to commune with the dead? You shall have your wish.', 'Так ты хочешь поговорить с мертвыми? Нет ничего проще!', 17226,1,0,0, '67234'),
(-1668470, 'Falric. Marwyn. Bring their corpses to my chamber when you are through.', 'Фалрик, Марвин, когда закончите, принесите их тела в мои покои.', 17227,0,0,0, '67234'),
(-1668471, 'You won\'t deny me this, Arthas! I must know... I must find out...', 'Ты от меня не отмахнешься Артас. Я должна понять, я должна знать.', 16642,1,0,1, '67234'),
(-1668472, 'You will not escape me that easily, Arthas! I will have my vengeance!', 'Ты так просто от меня не уйдешь Артас. Я отомщу тебе!', 17057,1,0,1, '67234'),
(-1668473, '<need translate>', 'Глупая девчонка! Тот кого ты ищещь давно убит! Теперь он лишь призрак, слабый отзвук в моем сознании!', 17229,1,0,0, '67234'),
(-1668474, '<need translate>', 'Я не повторю прежней ошибки, Сильвана. На этот раз тебе не спастись. Ты не оправдала моего доверия и теперь тебя ждет только забвение!', 17228,1,0,0, '67234'),
(-1668475, 'As you wish, my lord.', 'Как пожелаете, мой господин!', 16717,1,0,0, '67234'),
(-1668476, 'As you wish, my lord.', 'Как пожелаете, мой господин!', 16741,1,0,0, '67234'),
-- SCENE - Hall Of Reflection (Extro) - PreEscape
(-1668477, 'Your allies have arrived, Jaina, just as you promised. You will all become powerful agents of the Scourge.', 'Твои союзники прибыли, Джайна! Как ты и обещала... Ха-ха-ха-ха... Все вы станете могучими солдатами Плети...', 17212,1,0,0, '67234'),
(-1668478, 'I will not make the same mistake again, Sylvanas. This time there will be no escape. You will all serve me in death!', 'Я не повторю прежней ошибки, Сильвана! На этот раз тебе не спастись. Вы все будите служить мне после смерти...', 17213,1,0,0, '67234'),
(-1668479, 'He is too powerful, we must leave this place at once! My magic will hold him in place for only a short time! Come quickly, heroes!', 'Он слишком силен. Мы должны выбраться от сюда как можно скорее. Моя магия задержит его ненадолго, быстрее герои...', 16644,0,0,1, '67234'),
(-1668480, 'He\'s too powerful! Heroes, quickly, come to me! We must leave this place immediately! I will do what I can do hold him in place while we flee.', 'Он слишком силен. Герои скорее, за мной. Мы должны выбраться отсюда немедленно. Я постараюсь его задержать, пока мы будем убегать.', 17058,0,0,1, '67234'),
-- SCENE - Hall Of Reflection (Extro) - Escape
(-1668481, 'Death\'s cold embrace awaits.', 'Смерть распростерла ледяные обьятия!', 17221,1,0,0, '67234'),
(-1668482, 'Rise minions, do not left them us!', 'Восстаньте прислужники, не дайте им сбежать!', 17216,1,0,0, '67234'),
(-1668483, 'Minions sees them. Bring their corpses back to me!', 'Схватите их! Принесите мне их тела!', 17222,1,0,0, '67234'),
(-1668484, 'No...', 'Надежды нет!', 17214,1,0,0, '67234'),
(-1668485, 'All is lost!', 'Смирись с судьбой.', 17215,1,0,0, '67234'),
(-1668486, 'There is no escape!', 'Бежать некуда!', 17217,1,0,0, '67234'),
(-1668487, 'I will destroy this barrier. You must hold the undead back!', 'Я разрушу эту преграду, а вы удерживайте нежить на расстоянии!', 16607,1,0,0, '67234'),
(-1668488, 'No wall can hold the Banshee Queen! Keep the undead at bay, heroes! I will tear this barrier down!', 'Никакие стены не удержат Королеву Баньши. Держите нежить на расстоянии, я сокрушу эту преграду.', 17029,1,0,0, '67234'),
(-1668489, 'Another ice wall! Keep the undead from interrupting my incantation so that I may bring this wall down!', 'Опять ледяная стена... Я разобью ее, только не дайте нежити прервать мои заклинания...', 16608,1,0,0, '67234'),
(-1668490, 'Another barrier? Stand strong, champions! I will bring the wall down!', 'Еще одна преграда. Держитесь герои! Я разрушу эту стену!', 17030,1,0,0, '67234'),
(-1668491, 'Succumb to the chill of the grave.', 'Покоритесь Леденящей смерти!', 17218,1,0,0, '67234'),
(-1668492, 'Another dead end.', 'Вы в ловушке!', 17219,1,0,0, '67234'),
(-1668493, 'How long can you fight it?', 'Как долго вы сможете сопротивляться?', 17220,1,0,0, '67234'),
(-1668494, '<need translate>', 'Он с нами играет. Я  покажу ему что бывает когда лед встречается со огнем!', 16609,0,0,0, '67234'),
(-1668495, 'Your barriers can\'t hold us back much longer, monster. I will shatter them all!', 'Твои преграды больше не задержат нас, чудовище. Я смету их с пути!', 16610,1,0,0, '67234'),
(-1668496, 'I grow tired of these games, Arthas! Your walls can\'t stop me!', 'Я устала от этих игр Артас. Твои стены не остановят меня!', 17031,1,0,0, '67234'),
(-1668497, 'You won\'t impede our escape, fiend. Keep the undead off me while I bring this barrier down!', 'Ты не помешаешь нам уйти, монстр. Сдерживайте нежить, а я уничтожу эту преграду.', 17032,1,0,0, '67234'),
(-1668498, 'There\'s an opening up ahead. GO NOW!', 'Я вижу выход, скорее!', 16645,1,0,0, '67234'),
(-1668499, 'We\'re almost there... Don\'t give up!', 'Мы почти выбрались, не сдавайтесь!', 16646,1,0,0, '67234'),
(-1668500, 'There\'s an opening up ahead. GO NOW!', 'Я вижу выход, скорее!', 17059,1,0,0, '67234'),
(-1668501, 'We\'re almost there! Don\'t give up!', 'Мы почти выбрались, не сдавайтесь!', 17060,1,0,0, '67234'),
(-1668502, 'It... It\'s a dead end. We have no choice but to fight. Steel yourself heroes, for this is our last stand!', 'Больше некуда бежать. Теперь нам придется сражаться. Это наша последняя битва!', 16647,1,0,0, '67234'),
(-1668503, 'BLASTED DEAD END! So this is how it ends. Prepare yourselves, heroes, for today we make our final stand!', 'Проклятый тупик, значит все закончится здесь. Готовьтесь герои, это наша последняя битва.', 17061,1,0,0, '67234'),
(-1668504, 'Nowhere to run! You\'re mine now...', 'Ха-ха-ха... Бежать некуда. Теперь вы мои!', 17223,1,0,0, '67234'),
(-1668505, 'Soldiers of Lordaeron, rise to meet your master\'s call!', 'Солдаты Лордерона, восстаньте по зову Господина!', 16714,1,0,0, '67234'),
(-1668506, 'The master surveyed his kingdom and found it... lacking. His judgement was swift and without mercy. Death to all!', 'Господин осмотрел свое королевство и признал его негодным! Его суд был быстрым и суровым - предать всех смерти!', 16738,1,0,0, '67234'),

-- Falric
(-1668507, 'Men, women and children... None were spared the master\'s wrath. Your death will be no different.', 'Мужчины, Женщины и дети... Никто не избежал гнева господина. Вы разделите их участь!', 16710,1,0,0, '67234'),
(-1668508, 'Marwyn, finish them...', 'Марвин... Добей их...', 16713,1,0,0, '67234'),
(-1668509, 'Sniveling maggot!', 'Сопливый червяк!', 16711,1,0,0, '67234'),
(-1668510, 'The children of Stratholme fought with more ferocity!', 'Стратхольмские детишки - и те сражались отчаяннее!', 16712,1,0,0, '67234'),
(-1668511, 'Despair... so delicious...', 'Как сладостно отчаянье!', 16715,1,0,0, '67234'),
(-1668512, 'Fear... so exhilarating...', 'Как приятен страх!', 16716,1,0,0, '67234'),

-- Marwyn
(-1668513, 'Death is all that you will find here!', 'Вы найдете здесь лишь смерть!', 16734,1,0,0, '67234'),
(-1668514, 'Yes... Run... Run to meet your destiny... Its bitter, cold embrace, awaits you.', 'Эээээ... Да... Бегите навстречу судьбе. Ее жестокие и холодные обьятия ждут вас...', 16737,1,0,0, '67234'),
(-1668515, 'I saw the same look in his eyes when he died. Terenas could hardly believe it. Hahahaha!', 'У Теренаса был такой же взгляд в миг смерти, он никак не мог поверить... Ха-ха-ха-ха-ха...', 16735,1,0,0, '67234'),
(-1668516, 'Choke on your suffering!', 'Захлебнись страданием!', 16736,1,0,0, '67234'),
(-1668517, 'Your flesh shall decay before your very eyes!', 'Вы увидите как разлагается ваша плоть!', 16739,1,0,0, '67234'),
(-1668518, 'Waste away into nothingness!', 'Сгиньте без следа!', 16740,1,0,0, '67234'),

-- FrostWorn General
(-1668519, 'You are not worthy to face the Lich King!', 'Вы недостойны предстать перед Королем - Личом!', 16921,1,0,0, '67234'),
(-1668520, 'Master, I have failed...', 'Господин... Я подвел вас...', 16922,1,0,0, '67234'),

-- add
(-1668521, 'Well, now it\'s time to just a dump', 'Ну теперь-то точно пора сваливать.', 0,0,0,0, '67234'),
(-1668522, 'Here\'s a chest behind the work', 'Вот вам сундук за работу.', 0,0,0,0, '67234'),
(-1668523, 'And since the ship with Offa will not, here\'s a portal to Dalaran', 'И, поскольку корабля с оффа не будет, вот вам портал в Даларан.', 0,0,0,0, '67234');

-- Gossips
DELETE FROM gossip_texts WHERE entry BETWEEN -3594540 AND -3594536;
REPLACE INTO gossip_texts (entry, content_default, content_loc8, comment) VALUES
(-3594536, 'Lady Jaina, we are ready for next mission!', 'Джайна, мы готовы!',''),
(-3594537, 'Lady Jaina, Let\'s go!', 'Давай быстрее!', ''),
(-3594538, 'Lady Sylvanas, we are ready for next mission!', 'Сильвана, мы готовы!', ''),
(-3594539, 'Lady Sylvanas, Let\'s go!', 'Поехали!', ''),
(-3594540, 'Let\'s go!', 'Побежали!', '');

-- Waypoints to escort event on Halls of reflection

DELETE FROM script_waypoint WHERE entry=36955;
DELETE FROM script_waypoint WHERE entry=37226;
DELETE FROM script_waypoint WHERE entry=37554;

INSERT INTO script_waypoint VALUES
-- Jaina

   (36955, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (36955, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (36955, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (36955, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'), 
   (36955, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (36955, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (36955, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (36955, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (36955, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (36955, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (36955, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (36955, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (36955, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (36955, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (36955, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (36955, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (36955, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (36955, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (36955, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (36955, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (36955, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (36955, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Sylvana

   (37554, 0, 5587.682,2228.586,733.011, 0, 'WP1'),
   (37554, 1, 5600.715,2209.058,731.618, 0, 'WP2'),
   (37554, 2, 5606.417,2193.029,731.129, 0, 'WP3'),
   (37554, 3, 5598.562,2167.806,730.918, 0, 'WP4 - Summon IceWall 01'), 
   (37554, 4, 5556.436,2099.827,731.827, 0, 'WP5 - Spell Channel'),
   (37554, 5, 5543.498,2071.234,731.702, 0, 'WP6'),
   (37554, 6, 5528.969,2036.121,731.407, 0, 'WP7'),
   (37554, 7, 5512.045,1996.702,735.122, 0, 'WP8'),
   (37554, 8, 5504.490,1988.789,735.886, 0, 'WP9 - Spell Channel'),
   (37554, 9, 5489.645,1966.389,737.653, 0, 'WP10'),
   (37554, 10, 5475.517,1943.176,741.146, 0, 'WP11'),
   (37554, 11, 5466.930,1926.049,743.536, 0, 'WP12'),
   (37554, 12, 5445.157,1894.955,748.757, 0, 'WP13 - Spell Channel'),
   (37554, 13, 5425.907,1869.708,753.237, 0, 'WP14'),
   (37554, 14, 5405.118,1833.937,757.486, 0, 'WP15'),
   (37554, 15, 5370.324,1799.375,761.007, 0, 'WP16'),
   (37554, 16, 5335.422,1766.951,767.635, 0, 'WP17 - Spell Channel'),
   (37554, 17, 5311.438,1739.390,774.165, 0, 'WP18'),
   (37554, 18, 5283.589,1703.755,784.176, 0, 'WP19'),
   (37554, 19, 5260.400,1677.775,784.301, 3000, 'WP20'),
   (37554, 20, 5262.439,1680.410,784.294, 0, 'WP21'),
   (37554, 21, 5260.400,1677.775,784.301, 0, 'WP22'),

-- Lich King

   (37226, 0, 5577.187,2236.003,733.012, 0, 'WP1'),
   (37226, 1, 5587.682,2228.586,733.011, 0, 'WP2'),
   (37226, 2, 5600.715,2209.058,731.618, 0, 'WP3'),
   (37226, 3, 5606.417,2193.029,731.129, 0, 'WP4'),
   (37226, 4, 5598.562,2167.806,730.918, 0, 'WP5'), 
   (37226, 5, 5559.218,2106.802,731.229, 0, 'WP6'),
   (37226, 6, 5543.498,2071.234,731.702, 0, 'WP7'),
   (37226, 7, 5528.969,2036.121,731.407, 0, 'WP8'),
   (37226, 8, 5512.045,1996.702,735.122, 0, 'WP9'),
   (37226, 9, 5504.490,1988.789,735.886, 0, 'WP10'),

   (37226, 10, 5489.645,1966.389,737.653, 0, 'WP10'),
   (37226, 11, 5475.517,1943.176,741.146, 0, 'WP11'),
   (37226, 12, 5466.930,1926.049,743.536, 0, 'WP12'),
   (37226, 13, 5445.157,1894.955,748.757, 0, 'WP13'),
   (37226, 14, 5425.907,1869.708,753.237, 0, 'WP14'),
   (37226, 15, 5405.118,1833.937,757.486, 0, 'WP15'),
   (37226, 16, 5370.324,1799.375,761.007, 0, 'WP16'),
   (37226, 17, 5335.422,1766.951,767.635, 0, 'WP17'),
   (37226, 18, 5311.438,1739.390,774.165, 0, 'WP18'),
   (37226, 19, 5283.589,1703.755,784.176, 0, 'WP19'),
   (37226, 20, 5278.694,1697.912,785.692, 0, 'WP20'),
   (37226, 21, 5283.589,1703.755,784.176, 0, 'WP19');

-- BSW

-- Icecrown down spelltable

-- Boss Bronjahm
DELETE FROM `boss_spell_table` WHERE `entry` = 36497;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `timerMin_N10`, `timerMin_N25`, `timerMax_N10`, `timerMax_N25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(36497, 68793, 0, 3000, 0, 8000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(36497, 36535, 0, 30000, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 0, 0, NULL),
(36497, 68839, 0, 15000, 0, 25000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, NULL),
(36497, 68858, 0, 1000, 0, 3000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(36497, 68988, 0, 1000, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(36497, 68950, 0, 8000, 0, 12000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(36497, 68872, 0, 1000, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(36497, 68921, 0, 360001, 0, 360001, 0, 0, 0, 0, 0, 10, 0, 0, 0, 0, 0, 12, 0, 0, 0, NULL),
(36497, 70043, 0, 2000, 0, 6000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL);

-- Spiritual reflection
DELETE FROM `boss_spell_table` WHERE `entry` = 37068;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `timerMin_N10`, `timerMin_N25`, `timerMax_N10`, `timerMax_N25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(37068, 69933, 0, 4000, 0, 8000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL),
(37068, 69900, 0, 6000, 0, 15000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL);

-- HOR undead warriors
DELETE FROM `boss_spell_table` WHERE `entry` = 36941;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `timerMin_N10`, `timerMin_N25`, `timerMax_N10`, `timerMax_N25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(36941, 70144, 0, 15000, 0, 25000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(36941, 70080, 0, 4000, 0,  8000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL),
(36941, 70145, 0, 10000, 0, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL);

DELETE FROM `boss_spell_table` WHERE `entry` = 37069;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `timerMin_N10`, `timerMin_N25`, `timerMax_N10`, `timerMax_N25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(37069, 40505, 0, 5000, 0, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL);

DELETE FROM `boss_spell_table` WHERE `entry` = 36940;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `timerMin_N10`, `timerMin_N25`, `timerMax_N10`, `timerMax_N25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(36940, 70150, 0, 5000, 0, 10000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL);

-- Boss Falric
DELETE FROM `boss_spell_table` WHERE `entry` = 38112;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `timerMin_N10`, `timerMin_N25`, `timerMax_N10`, `timerMax_N25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(38112, 72395, 0, 1000, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL),
(38112, 72426, 0, 15000, 0, 25000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, -1594511, NULL),
(38112, 72435, 0, 25000, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1594512, NULL),
(38112, 72422, 0, 7000, 0, 14000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL),
(38112, 47008, 0, 180000, 0, 180000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL);

-- Boss Marwin
DELETE FROM `boss_spell_table` WHERE `entry` = 38113;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `timerMin_N10`, `timerMin_N25`, `timerMax_N10`, `timerMax_N25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `varData`, `StageMask_N`, `StageMask_H`, `CastType`, `isVisualEffect`, `isBugged`, `textEntry`, `comment`) VALUES
(38113, 72360, 0, 8000, 0, 12000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, NULL),
(38113, 72368, 0, 15000, 0, 20000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, NULL),
(38113, 72362, 0, 25000, 0, 30000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, -1594518, NULL),
(38113, 72436, 0, 10000, 0, 16000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, -1594518, NULL),
(38113, 47008, 0, 180000, 0, 180000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL);

