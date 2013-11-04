DELETE FROM `script_texts` WHERE `entry` BETWEEN -1631594 AND -1631000;
INSERT INTO `script_texts` (`entry`,`content_loc6`, `content_loc7`, `content_loc8`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`) VALUES

-- Lord Marrowgar
('-1631001','Este es el principio y el final, mortales. Nadie puede entrar en el sagrario del maestro.','Este es el principio y el final, mortales. Nadie puede entrar en el sagrario del maestro.','Это начало и конец, смертные. Никто не может войти в Храм!','This is the beginning AND the end, mortals. None may enter the master\'s sanctum!','16950','1','0','0','marrowgar SAY_INTRO'),
('-1631002','La plaga arrasará este mundo como un enjambre de muerte y destrucción.','La plaga arrasará este mundo como un enjambre de muerte y destrucción.','Проклятые несут миру смерть и разрушение!','The Scourge will wash over this world as a swarm of death and destruction!','16941','1','0','0','marrowgar SAY_AGGRO'),
('-1631003','¡TORMENTA DE HUESOS!','¡TORMENTA DE HUESOS!','Шторм костей!','BONE STORM!','16946','1','0','0','marrowgar SAY_BONESTORM'),
('-1631004','¡Unidos por los huesos!','¡Unidos por los huesos!','Проткнут костью!','Bound by bone!','16947','1','0','0','marrowgar SAY_BONESPIKE1'),
('-1631005','¡Quedaos cerca!','¡Quedaos cerca!','Кости вокруг!','Stick Around!','16948','1','0','0','marrowgar SAY_BONESPIKE2'),
('-1631006','¡La única salida es la muerte!','¡La única salida es la muerte!','Выход - только смерть!','The only escape is death!','16949','1','0','0','marrowgar SAY_BONESPIKE3'),
('-1631007','¡Más huesos para la ofrenda!','¡Más huesos para la ofrenda!','Больше костей!','More bones for the offering!','16942','1','0','0','marrowgar SAY_KILL1'),
('-1631008','¡Púdrete en tu condena!','¡Púdrete en tu condena!','Будьте прокляты!','Languish in damnation!','16943','1','0','0','marrowgar SAY_KILL2'),
('-1631009','¡LA RABIA DEL MAESTRO FLUYE DENTRO DE MI!','¡LA RABIA DEL MAESTRO FLUYE DENTRO DE MI!','Я вижу... Только тьму...','I see... only darkness...','16944','1','0','0','marrowgar SAY_DEATH'),
('-1631010','Solo veo oscuridad...','Solo veo oscuridad...','ЯРОСТЬ МАСТЕРА ТЕЧЕТ ЧЕРЕЗ МЕНЯ!','THE MASTER\'S RAGE COURSES THROUGH ME!','16945','3','0','0','marrowgar SAY_ENRAGE'),

-- Lady Deathwhisper
('-1631011','','','Вы нашли свой путь здесь, потому что вы принадлежите к числу немногих одаренных истинным видением мира, проклятого слепотой! Вы можете видеть сквозь туман, что висит над этим миром, как саван, и понять, где истинная сила лжи!','You have found your way here, because you are among the few gifted with true vision in a world cursed with blindness! You can see through the fog that hangs over this world like a shroud and grasp where true power lies!','16880','1','0','0','deathwhisper SAY_INTRO3'),
('-1631013','¡Pegad los ojos sobre vuestras burdas manos! ¡Los tendones, la tierna carne, la oscura sangre que las recorre!','¡Pegad los ojos sobre vuestras burdas manos! ¡Los tendones, la tierna carne, la oscura sangre que las recorre!','Взгляните на ваши мягкие руки! Сухожилия, мясо, кровь! Это слабость! Серьезная ошибка! Шутка создателя со своими творениями! Чем раньше вы поймете что жизнь - это дефект, тем раньше вы сможете преодолеть вашу слабость!','Fix your eyes upon your crude hands! The sinew, the soft meat, the dark blood coursing within! It is a weakness! A crippling flaw! A joke played by the creators upon their own creations! The sooner you come to accept your condition as a defect, the sooner you will find yourselves in a position to transcend it!','16878','1','0','0','deathwhisper SAY_INTRO1'),

('-1631014','¡Es una debilidad! ¡Un defecto atroz! ¡Una broma de los creadores hacia su creación!','¡Es una debilidad! ¡Un defecto atroz! ¡Una broma de los creadores hacia su creación!','','It is a weakness; a crippling flaw.... A joke played by the Creators upon their own creations.',17268,1,0,0,'deathwhisper SAY_SPEECH_4'),
('-1631015','¡Cuanto antes aceptéis vuestra condición como un defecto, antes os encontraréis en posición de superarlo!','¡Cuanto antes aceptéis vuestra condición como un defecto, antes os encontraréis en posición de superarlo!','','The sooner you come to accept your condition as a defect, the sooner you will find yourselves in a position to transcend it.',17269,1,0,0,'deathwhisper SAY_SPEECH_5'),
('-1631016','','','Через нашего Мастера все возможно! Его сила не имеет предела, и его воля непреклонна! Те, кто против него будут истреблены! А те, кто служат, которые подчиняются полностью, беспрекословно, с беззаветной преданностью ума и души? Возвышены!','Through our master all things are possible! His power is without limit, and his will unbending! Those who oppose him will be destroyed utterly! And those who serve, who serve wholly, unquestioningly, with utter devotion of mind and soul? Elevated! To heights beyond your ken!','16879','1','0','0','deathwhisper SAY_INTRO2'),
('-1631017','¡Los que se oponen a él serán destruidos! ¡Y los que lo sirven! ¡Los que lo sirven en cuerpo y alma con total y completa devoción sin cuestionarle, serán elevados más allá de su conocimiento!','¡Los que se oponen a él serán destruidos! ¡Y los que lo sirven! ¡Los que lo sirven en cuerpo y alma con total y completa devoción sin cuestionarle, serán elevados más allá de su conocimiento!','','Those who oppose him will be destroyed utterly, and those who serve -- who serve wholly, unquestioningly, with utter devotion of mind and soul -- elevated to heights beyond your ken.',17271,1,0,0,'deathwhisper SAY_SPEECH_7'),
('-1631018','¿Qué es este alboroto? ¿Osais entrar en suelo sagrado? Este será vuestro lugar de reposo final.','¿Qué es este alboroto? ¿Osais entrar en suelo sagrado? Este será vuestro lugar de reposo final.','Что это за беспорядок?! Вы смеете гадить на этой священной земле? Вот вам и место последнего упокоения!','What is this disturbance?! You dare trespass upon this hallowed ground? This shall be your final resting place.','16868','1','0','0','deathwhisper SAY_AGGRO'),
('-1631019','¡Basta! ¡Veo que tengo que hacer esto yo misma!','¡Basta! ¡Veo que tengo que hacer esto yo misma!','Однако! Я вижу что пора взять дело в свои руки.','Enough! I see I must take matters into my own hands!','16877','1','0','0','deathwhisper SAY_PHASE2'),
('-1631020','Toma mi bendición y muestrales a estos intrusos el poder del maestro.','Toma mi bendición y muestrales a estos intrusos el poder del maestro.','Возьмите это благословение и покажите этим злоумышленникам где раки зимуют!','Take this blessing and show these intruders a taste of our master\'s power.','16873','1','0','0','deathwhisper SAY_DARKEMPOWERMENT'),
('-1631021','¡Te libero de la maldición de la carne!','¡Te libero de la maldición de la carne!','Мои слуги! Я освобождаю вас от проклятия плоти!','Loyal adherent! I release you from the curse of flesh!','16874','1','0','0','deathwhisper SAY_DARKTRANSFORMATION'),
('-1631022','¡Alzate y goza de tu verdadera forma!','¡Alzate y goza de tu verdadera forma!','Встань и предстань в истинном виде!','Arise and exalt in your pure form!','16875','1','0','0','deathwhisper SAY_ANIMATEDEAD'),
('-1631023','¡Eres frágil y débil para resistirte a mi voluntad!','¡Eres frágil y débil para resistirte a mi voluntad!','Вы слабы и бессильны против меня!','You are weak, powerless to resist my will!','16876','1','0','0','deathwhisper SAY_DOMINATEMIND'),
('-1631024','Esta farsa ya ha durado bastante.','Esta farsa ya ha durado bastante.','Это игра продолжается слишком долго!','This charade has gone on long enough.','16872','3','0','0','deathwhisper SAY_BERSERK'),
('-1631025','¡Todo es parte del plan del maestro! ¡Tu final es inevitable!','¡Todo es parte del plan del maestro! ¡Tu final es inevitable!','Все - части плана Мастера! Ваш конец неизбежен...','All part of the masters plan! Your end is... inevitable!','16871','1','0','0','deathwhisper SAY_DEATH'),
('-1631026','¿Entiendes ya la insignificancia de tus acciones?','¿Entiendes ya la insignificancia de tus acciones?','Вы еще не осознали бесполезность своих действий?','Do you yet grasp of the futility of your actions?','16869','1','0','0','deathwhisper SAY_KILL1'),
('-1631027','Abrazate a la oscuridad... ¡Oscuridad Eterna!','Abrazate a la oscuridad... ¡Oscuridad Eterna!','Прими Тьму! Тьма вечна...','Embrace the darkness... Darkness eternal!','16870','1','0','0','deathwhisper SAY_KILL2'),

-- Saurfang
('-1631028','¡POR EL PODER DEL REY EXÁNIME!','¡POR EL PODER DEL REY EXÁNIME!','Во имя Короля-Лича!','BY THE MIGHT OF THE LICH KING!','16694','1','0','0','saurfang SAY_AGGRO'),
('-1631029','¡El suelo se vuelve rojo con tu sangre!','¡El suelo se vuelve rojo con tu sangre!','Земля обагрится вашей кровью!','The ground runs red with your blood!','16699','1','0','0','saurfang SAY_FALLENCHAMPION'),
('-1631030','¡Comed esbirros mios!','¡Comed esbirros mios!','Веселитесь, слуги мои!','Feast, my minions!','16700','3','0','0','saurfang SAY_BLOODBEASTS'),
('-1631031','¡No eres nada!','¡No eres nada!','Ты никто!','You are nothing!','16695','1','0','0','saurfang SAY_KILL1'),
('-1631032','¡Tu alma no encontrará redención!','¡Tu alma no encontrará redención!','Ваши души не найдут здесь избавления!','Your soul will find no redemption here!','16696','1','0','0','saurfang SAY_KILL2'),
('-1631033','¡Yo soy la muerte!','¡Yo soy la muerte!','Я вижу приближение смерти!','I have become... death!','16698','3','0','0','saurfang SAY_BERSERK'),
('-1631034','Me... he... liberado.','Me... he... liberado.','Я... Освободился...','I... Am... Released.','16697','1','0','0','saurfang SAY_DEATH'),
('-1631035','Entonces ¡Vámonos! Sali...','Entonces ¡Vámonos! Sali...','','Let\'s get a move on then! Move ou...',16974,1,0,0,'bronzebeard SAY_INTRO_ALLY_0'),
('-1631036','Por cada soldado de la Horda que matásteis, por cada perro de la Alianza que cayó, el ejercito del Rey Exánime creció. Ahora hasta las Valkyr alzan a los caídos para la plaga.','Por cada soldado de la Horda que matásteis, por cada perro de la Alianza que cayó, el ejercito del Rey Exánime creció. Ahora hasta las Valkyr alzan a los caídos para la plaga.','Все павшие воины орды, все дохлые псы альянса - все пополнят армию Короля-Лича! Даже сейчас валькиры воскрешают ваших покойников, чтобы они стали частью Плети!','For every Horde soldier that you killed, for every Alliance dog that fell, the Lich King\'s armies grew. Even now the Val\'kyr work to raise your fallen... As Scourge.','16701','1','0','0','saurfang SAY_INTRO'),
('-1631037','Las cosas se van a poner mucho peor. ¡Venid!, ¡probad el poder que el Rey Exánime me ha concedido!','Las cosas se van a poner mucho peor. ¡Venid!, ¡probad el poder que el Rey Exánime me ha concedido!','Сейчас все будет еще хуже. Идите сюда, я покажу вам, какой силой меня наделил Король-Лич!','Things are about to get much worse. Come, taste the power that the Lich King has bestowed upon me!','16702','1','0','0','saurfang SAY_BERSERK'),
('-1631038','¿Un solo orco, contra el poder de la Alianza?','¿Un solo orco, contra el poder de la Alianza?','','A lone orc, against the might of the Alliance?',16970,1,0,0,'bronzebeard SAY_INTRO_ALLY_3'),
('-1631039','¡Cargad!','¡Cargad!','','Charge!',16971,1,0,0,'bronzebeard SAY_INTRO_ALLY_4'),
('-1631040','¡Jajajaja! Enanos.','¡Jajajaja! Enanos.','Ха-ха-ха. Дворфы!','Hahahaha! Dwarves.','16703','1','0','0','saurfang SAY'),
('-1631041','¡Kor\'kron, vámonos! ¡Campeones, vigilad vuestra retaguardia! La plaga ha sido..','¡Kor\'kron, vámonos! ¡Campeones, vigilad vuestra retaguardia! La plaga ha sido..','','Kor\'kron, move out! Champions, watch your backs. The Scourge have been..',17103,1,0,0,'overlord SAY_INTRO_HORDE_1'),
('-1631042','¡Únete a mi padre! Únete a mí y juntos aplastaremos el mundo en nombre de la plaga. ¡Por la gloria del Rey Exánime!','¡Únete a mi padre! Únete a mí y juntos aplastaremos el mundo en nombre de la plaga. ¡Por la gloria del Rey Exánime!','','Join me, father. Join me and we will crush this world in the name of the Scourge -- for the glory of the Lich King!',16704,1,0,0,'saurfang SAY_INTRO_HORDE_2'),
('-1631043','Mi hijo murió en la puerta de cólera. Solo he venido a recoger su cuerpo.','Mi hijo murió en la puerta de cólera. Solo he venido a recoger su cuerpo.','','My boy died at the Wrath Gate. I am here only to collect his body.',17097,0,0,0,'overlord SAY_INTRO_HORDE_3'),
('-1631044','¡Viejo y testarudo! ¿Que posibilidades tiene? Soy más fuerte y poderoso de lo que tu nunca serás.','¡Viejo y testarudo! ¿Que posibilidades tiene? Soy más fuerte y poderoso de lo que tu nunca serás.','','Stubborn and old. What chance do you have? I am stronger, and more powerful than you ever were.',16705,1,0,0,'saurfang SAY_INTRO_HORDE_4'),
('-1631045','Lo llamamos Dranosh. Quiere decir "Corazón de Draenor" en orco. No deje que los brujos se lo llevarán. Mi hijo estaba a salvo, los ancianos de Garadar lo escondian.','Lo llamamos Dranosh. Quiere decir "Corazón de Draenor" en orco. No deje que los brujos se lo llevarán. Mi hijo estaba a salvo, los ancianos de Garadar lo escondian.','','We named him Dranosh. It means "Heart of Draenor" in orcish. I would not let the warlocks take him. My boy would be safe, hidden away by the elders of Garadar.',17098,0,0,0,'overlord SAY_INTRO_HORDE_5'),
('-1631046','Antes de morir su madre, le prometí que cruzaría el portal oscuro yo solo. Viviera o muriera, mi hijo estaría a salvo, limpio.','Antes de morir su madre, le prometí que cruzaría el portal oscuro yo solo. Viviera o muriera, mi hijo estaría a salvo, limpio.','','I made a promise to his mother before she died; that I would cross the Dark Portal alone - whether I lived or died, my son would be safe. Untainted...',17099,0,0,0,'overlord SAY_INTRO_HORDE_6'),
('-1631047','Hoy, cumplo mi promesa.','Hoy, cumplo mi promesa.','','Today, I fulfill that promise.',17100,0,0,0,'overlord SAY_INTRO_HORDE_7'),
('-1631048','¡Alto señor Libramorte Colmillosauro carga!','¡Alto señor Libramorte Colmillosauro carga!','','High Overlord Saurfang charges!',17104,2,0,0,'overlord SAY_INTRO_HORDE_8'),
('-1631049','¡Viejo orco patético! Venid pues héroes, venid y enfrentaros al poder de la plaga.','¡Viejo orco patético! Venid pues héroes, venid y enfrentaros al poder de la plaga.','','Pathetic old orc. Come then heroes. Come and face the might of the Scourge!',16706,1,0,0,'saurfang SAY_INTRO_HORDE_9'),
('-1631050','%s jadea por aire','%s jadea por aire','','%s gasps for air',16975,2,0,0,'bronzebeard SAY_OUTRO_ALLY_1'),
('-1631051','Ese era el hijo de Colmillosauro, el comandante de la horda en la puerta de cólera. Un trágico final...','Ese era el hijo de Colmillosauro, el comandante de la horda en la puerta de cólera. Un trágico final...','','That was Saurfang\'s boy - the Horde commander at the Wrath Gate. Such a tragic end...',16976,0,0,0,'bronzebeard SAY_OUTRO_ALLY_2'),
('-1631052','¡Que demonios! ¡Allí a lo lejos!','¡Que demonios! ¡Allí a lo lejos!','','What in the... There, in the distance!',16977,0,0,0,'bronzebeard SAY_OUTRO_ALLY_3'),
('-1631053','¡Soldados, en formación! ¡Parece que la Horda viene de nuevo!','¡Soldados, en formación! ¡Parece que la Horda viene de nuevo!','','Soldiers, fall in! Looks like the Horde are comin\' in to take another shot!',16978,1,0,0,'bronzebeard SAY_OUTRO_ALLY_4'),
('-1631054','No me obligues, orco. No podemos dejarte pasar.','No me obligues, orco. No podemos dejarte pasar.','','Don\'t force my hand, orc. We can\'t let you pass.',16972,0,0,0,'bronzebeard SAY_OUTRO_ALLY_5'),
('-1631055','Detrás de ti esta el cuerpo de mi único hijo. Nada me alejará de él.','Detrás de ti esta el cuerpo de mi único hijo. Nada me alejará de él.','','Behind you lies the body of my only son. Nothing will keep me from him.',17094,0,0,0,'overlord SAY_OUTRO_ALLY_6'),
('-1631056','No... No puedo hacerlo. Vuelve a tu nave y te perdonaré la vida.','No... No puedo hacerlo. Vuelve a tu nave y te perdonaré la vida.','','He... I can\'t do it. Get back on your ship and we\'ll spare your life.',16973,0,0,0,'bronzebeard SAY_OUTRO_ALLY_7'),
('-1631057','¡Apartate, Muradin! Abre paso a un padre afligido.','¡Apartate, Muradin! Abre paso a un padre afligido.','','Stand down, Muradin. Let a grieving father pass.',16690,0,0,0,'varian SAY_OUTRO_ALLY_8'),
('-1631058','No\'ku kil zil\'nok ha tar.','No\'ku kil zil\'nok ha tar.','','No\'ku kil zil\'nok ha tar.',17096,0,1,0,'overlord SAY_OUTRO_ALLY_9'),
('-1631059','No olvidaré esta amabilidad. Te doy las gracias, alteza.','No olvidaré esta amabilidad. Te doy las gracias, alteza.','','I will not forget this kindess. I thank you, highness.',17095,0,0,0,'overlord SAY_OUTRO_ALLY_10'),
('-1631060','Yo... yo no estuve en la puerta de cólera. Pero los soldados supervivientes me contaron lo que ocurrió. Tu hijo luchó con honor, murió como un héroe. Se merece un entierro de héroe.','Yo... yo no estuve en la puerta de cólera. Pero los soldados supervivientes me contaron lo que ocurrió. Tu hijo luchó con honor, murió como un héroe. Se merece un entierro de héroe.','','I... I was not at the Wrathgate. But the soldiers who survived told me much of what happened. Your son fought with honor. He died a hero\'s death. He deserves a hero\'s burial.',16691,0,0,0,'varian SAY_OUTRO_ALLY_11'),
('-1631061','%s llora.','%s llora.','','%s cries.',16651,2,0,0,'proudmore SAY_OUTRO_ALLY_12'),
('-1631062','Jaina, ¿Por qué lloras?','Jaina, ¿Por qué lloras?','','Jaina, why are you crying?',16692,0,0,0,'varian SAY_OUTRO_ALLY_13'),
('-1631063','No es nada majestad. Solo... estoy orgullosa de mi Rey.','No es nada majestad. Solo... estoy orgullosa de mi Rey.','','It was nothing, your majesty. Just... I\'m proud of my king.',16652,0,0,0,'proudmore SAY_OUTRO_ALLY_14'),
('-1631064','Bah! Muradin, asegura la cubierta y prepara los soldados para el asalto de la parte superior de la Ciudadela. Enviaré otro regimiento desde Ventormenta.','Bah! Muradin, asegura la cubierta y prepara los soldados para el asalto de la parte superior de la Ciudadela. Enviaré otro regimiento desde Ventormenta.','','Bah! Muradin, secure the deck and prepare our soldiers for an assault on the upper citadel. I\'ll send out another regiment from Stormwind.',16693,0,0,0,'varian SAY_OUTRO_ALLY_15'),
('-1631065','¡Enseguida, majestad!','¡Enseguida, majestad!','','Right away, yer majesty!',16979,0,0,0,'bronzebeard SAY_OUTRO_ALLY_16'),
('-1631066','%s tose.','%s tose.','','%s coughs.',17105,2,0,0,'overlord SAY_OUTRO_HORDE_1'),
('-1631067','%s llora sobre el cuerpo de su hijo.','%s llora sobre el cuerpo de su hijo.','','%s weeps over the corpse of his son.',17106,2,0,0,'overlord SAY_OUTRO_HORDE_2'),
('-1631068','Tendrás una ceremonia digna en Nagrand, junto a las piras de tu madre y tus ancestros.','Tendrás una ceremonia digna en Nagrand, junto a las piras de tu madre y tus ancestros.','','You will have a proper ceremony in Nagrand next to the pyres of your mother and ancestors.',17101,0,0,0,'overlord SAY_OUTRO_HORDE_3'),
('-1631069','El Honor héroes... no importa lo atroz de la batalla... ¡Nunca renunciéis a él!','','','Honor, young heroes... no matter how dire the battle... Never forsake it!',17102,0,0,0,'overlord SAY_OUTRO_HORDE_4'),

-- Rotface
('-1631070','¿Qué? ¿Precioso? ¡¡¡Noooooooooo!!!','¿Qué? ¿Precioso? ¡¡¡Noooooooooo!!!','Что? Прелесть? Не-е-е-т!','What? Precious? Noooooooooo!!!','16993','6','0','0','Rotface Precious played when precious dies'),
('-1631071','¡Weeeeee! ¡Ja-ha-ha-ha!','¡Weeeeee! ¡Ja-ha-ha-ha!','Й-й-йя-хахаха!','WEEEEEE!','16986','1','0','0','Rotface Aggro'),
('-1631073','Creo que poo-poo enfadado. ¡Va a hacer booom!','Creo que poo-poo enfadado. ¡Va a hacer booom!','Я сделал очень злую каку! Сейчас взорвется!','I think I made an angry poo-poo. It gonna blow!','16992','1','0','0','Rotface Unstable Ooze'),
('-1631074','¡Grandes noticias amigos! ¡Las babosas vuelven a fluir!','¡Grandes noticias amigos! ¡Las babosas vuelven a fluir!','Отличные новости народ! Слизь снова потекла!','Great news, everyone! The slime is flowing again!','17126','1','0','0','putricide SAY_SLIME_FLOW_1'),
('-1631075','¡Buenas noticias amigos! He arreglado las tuberías de babosas venenosas.','¡Buenas noticias amigos! He arreglado las tuberías de babosas venenosas.','Отличные новости народ! Я починил трубы для подачи ядовитой смеси!','Good news, everyone! I\'ve fixed the poison slime pipes!','17123','1','0','0','putricide SAY_SLIME_FLOW_2'),
('-1631076','¡Papi hará juguetes contigo!','¡Papi hará juguetes contigo!','Папочка сделает новые игрушки из тебя!','Daddy make toys out of you!','16988','1','0','0','Rotface Slay 02'),
('-1631077','¡Lo he rooooto!','¡Lo he rooooto!','Я ЭТО заломал!','I brokes-ded it...','16987','1','0','0','Rotface Slay 01'),
('-1631078','¡Hora de dormir!','¡Hora de dormir!','Тихий час!','Sleepy Time!','16990','1','0','0','Rotface Berserk'),
('-1631079','¡Malas noticias papá!','¡Malas noticias papá!','Папочка, не огорчайся...','Bad news daddy.','16989','1','0','0','Rotface Death'),
('-1631080','','','','Terrible news, everyone, Rotface is dead! But great news everyone, he left behind plenty of ooze for me to use! Whaa...? I\'m a poet, and I didn\'t know it? Astounding!',17146,6,0,0,'putricide SAY_ROTFACE_DEATH'),
-- 
('-1631226','Moco megajoso.','Moco megajoso.','Липучка-вонючка!','Icky sticky.','16991','1','0','0','Rotface Infection'),
('-1631229','Ja-a-a-a-a','Ja-a-a-a-a','Й-а-а-а!','...','16994','1','0','0','Rotface say'),
('-1631230','¡Ñaaa!','¡Ñaaa!','Ах!','...','16995','1','0','0','Rotface say'),
('-1631231','А-а-у!','А-а-у!','А-а-у!','...','16996','1','0','0','Rotface say'),

-- Festergut
('-1631081','¡NOOOOOOO! ¡Has matado a apestoso! ¡Paga!','¡NOOOOOOO! ¡Has matado a apestoso! ¡Paga!','Нет! Вы убили Вонючку! Сейчас получите!','NOOOO! You kill Stinky! You pay!','16907','6','0','0','Festergut Stinky Death '),
('-1631082','¡A divertirse!','¡A divertirse!','Повеселимся!','Fun time!','16901','1','0','0','Festergut Aggro'),
('-1631083','Una nube de gas ordinaria. Pero cuidado porque no es una nube de gas ordinaria.','Una nube de gas ordinaria. Pero cuidado porque no es una nube de gas ordinaria.','Это обычное облако газа. Но будьте осторожны, не такое уж оно и обычное...','Just an ordinary gas cloud. But watch out, because that\'s no ordinary gas cloud!','17119','1','0','0','Putricide Gas Explosion'),
('-1631084','%s se tira un pedo.','%s se tira un pedo.','%s пукнул.','%s farts.','16911','2','0','0','Festergut brrr '),
('-1631085','No me encuentro bien...','No me encuentro bien...','Что-то мне нехорошо...','Gyah! Uhhh, I not feel so good...','16906','1','0','0','Festergut Explunge Blight'),
('-1631086','%s vomita.','%s vomita.','','%s vomits',0,2,0,0,'festergut SAY_PUNGUENT_BLIGHT_EMOTE'),
('-1631087','Papi, ¡lo hice!','Papi, ¡lo hice!','Папочка! У меня получилось!','Daddy, I did it!','16902','1','0','0','Festergut Slay 01'),
('-1631088','¡Muerto, muerto, muerto!','¡Muerto, muerto, muerto!','Мертвец! Мертвец! Мертвец!','Dead, dead, dead!','16903','1','0','0','Festergut Slay 02'),
('-1631089','¡No más diversión!','¡No más diversión!','Веселью конец!','Fun time over!','16905','1','0','0','Festergut Berserk'),
('-1631090','A-a-a-a-a... Pa ... Pi...','A-a-a-a-a... Pa ... Pi...','А-а-а-а-а...','Da ... Ddy...','16904','1','0','0','Festergut Death'),
('-1631091','Oh, Panzachancro. Eras mi preferido junto a Carapútrea. La buena noticia es que has dejado tanto gas que casi puedo saborearlo.','Oh, Panzachancro. Eras mi preferido junto a Carapútrea. La buena noticia es que has dejado tanto gas que casi puedo saborearlo.','Тухлопуз! Ты всегда был моим любимчиком, как и Гниломорд... Молодец, что оставил столько газа. Я его даже чувствую.','Oh, Festergut. You were always my favorite. Next to Rotface. The good news is you left behind so much gas, I can practically taste it!','17124','6','0','0','Putricide Festergut Dead'),
--
('-1631210','...','...','Их-ха!','...','16908','1','0','0','Festergut say '),
('-1631211','...','...','Ы-ы-ы!','...','16909','1','0','0','Festergut say '),
('-1631212','...','...','(Непереводимо)','...','16910','1','0','0','Festergut say '),

-- Professor Putricide
('-1631092','¡Buenas noticias amigos! Creo que he perfeccionado una plaga que destruirá toda la vida en Azeroth.','¡Buenas noticias amigos! Creo que he perfeccionado una plaga que destruirá toda la vida en Azeroth.','Отличные новости народ! Я усовершенствовал штамм чумы, которая уничтожит весь Азерот!','Good news, everyone! I think I perfected a plague that will destroy all life on Azeroth!','17114','1','0','0','Putricide Aggro'),
('-1631093','¡No podéis entrar así de sucios aquí! Hay que quitaros esa asquerosa piel primero.','¡No podéis entrar así de sucios aquí! Hay que quitaros esa asquerosa piel primero.','Вы слишком грязные чтобы тут расхаживать! Надо сперва соскрести эту мерзкую плоть.','You can\'t come in here all dirty like that! You need that nasty flesh scrubbed off first!','17125','1','0','0','Putricide Airlock01 Before fight'),
('-1631094','¡Dos mocos, una sala! Tantas posibilidades estupendas...','¡Dos mocos, una sala! Tantas posibilidades estupendas...','Два слизнюка в одной комнате? Может получиться что-то любопытное...','Two oozes, one room! So many delightful possibilities...','17122','1','0','0','Putricide Summon Ooze'),
('-1631095','Hmmmm. No siento nada. ¿Queeee? ¿De dónde salió eso?','Hmmmm. No siento nada. ¿Queeee? ¿De dónde salió eso?','Что-то я ничего не чувствую. Что? Это еще откуда?','Hmm. I don\'t feel a thing. Whaa...? Where\'d those come from?','17120','1','0','0','Putricide Transform 01'),
('-1631096','Sabe a... ¡FRESA! ¡Ohhh! ¡Perdón!','Sabe a... ¡FRESA! ¡Ohhh! ¡Perdón!','На вкус как вишенка. Ой, извините...','Tastes like... Cherry! Oh! Excuse me!','17121','1','0','0','Putricide Transform 02'),
('-1631097','M-m-m... Interesante...','M-m-m... Interesante...','М-м-м. Интересно.','Hmm... Interesting...','17115','1','0','0','Putricide Slay 01'),
('-1631098','¡Qué inesperado!','¡Qué inesperado!','О, как неожиданно!','That was unexpected!','17116','1','0','0','Putricide Slay 02'),
('-1631099','¡Excelentes noticias amigos!','¡Excelentes noticias amigos!','Прекрасные новости, народ!','Great news, everyone!','17118','1','0','0','Putricide Berserk'),
('-1631100','¡Malas noticias amigos! No creo que sobreviva.','¡Malas noticias amigos! No creo que sobreviva.','Плохие новости, народ... Похоже, у меня ничего не выйдет.','Bad news, everyone! I don\'t think I\'m going to make it.','17117','1','0','0','Putricide Death'),

-- Blood Prince Council
('-1631101','¡Estúpidos! ¿Pensásteis que nos derrotaríais tan facilmente? ¡Los San\'layn son los soldados inmortales del Rey Exánime! ¡Ahora os enfrentaréis a todos juntos!','¡Estúpidos! ¿Pensásteis que nos derrotaríais tan facilmente? ¡Los San\'layn son los soldados inmortales del Rey Exánime! ¡Ahora os enfrentaréis a todos juntos!','Глупые смертные! Думали, что одолели нас? Санлейн, непобедимые воины Короля-Лича! Теперь наши силы едины!','Foolish mortals. You thought us defeated so easily? The San\'layn are the Lich King\'s immortal soldiers! Now you shall face their might combined!','16795','6','0','0','Lanathel Intro Princes'),
('-1631102','¡Alzaos hermanos y destruid al enemigo!','¡Alzaos hermanos y destruid al enemigo!','Восстаньте, братья, и уничтожьте наших врагов!','Arise, brothers, and destroy our enemies!','16796','1','0','0','Lanathel resurrect Princes'),

-- Keleseth
('-1631103','','','','Such wondrous power! The Darkfallen Orb has made me INVINCIBLE!',16727,1,0,0,'keleseth SAY_KELESETH_INVOCATION'),
('-1631104','','','','Blood will flow!',16728,1,0,0,'keleseth SAY_KELESETH_SPECIAL'),
('-1631105','','','','Were you ever a threat?',16723,1,0,0,'keleseth SAY_KELESETH_SLAY_1'),
('-1631106','','','','Truth is found in death.',16724,1,0,0,'keleseth SAY_SKELESETH_SLAY_2'),
('-1631107','','','','%s cackles maniacally!',16726,2,0,0,'keleseth SAY_KELESETH_BERSERK'),
('-1631108','','','','My queen... they come...',16725,1,0,0,'keleseth SAY_KELESETH_DEATH'),

-- Taldaram
('-1631109','','','','Tremble before Taldaram, mortals, for the power of the orb flows through me!',16857,1,0,0,'taldaram SAY_TALDARAM_INVOCATION'),
('-1631110','','','','Delight in the pain!',16858,1,0,0,'taldaram SAY_TALDARAM_SPECIAL'),
('-1631111','','','','Worm food.',16853,1,0,0,'taldaram SAY_TALDARAM_SLAY_1'),
('-1631112','','','','Beg for mercy!',16854,1,0,0,'taldaram SAY_TALDARAM_SLAY_2'),
('-1631113','','','','%s laughs.',16856,2,0,0,'taldaram SAY_TALDARAM_BERSERK'),
('-1631114','','','','%s gurgles and dies.',16855,2,0,0,'taldaram SAY_TALDARAM_DEATH'),

-- Valanar
('-1631115','','','Наксанар был досадным недоразумением! Силы сферы позволят Валанару свершить отмщение!','Naxxanar was merely a setback! With the power of the orb, Valanar will have his vengeance!','16685','1','0','0','Valanar Empower'),
('-1631117','La cena... está servida.','La cena... está servida.','Кушать подано!','Dinner... is served.','16681','1','0','0','Valanar Slay 01'),
('-1631118','','','Теперь вы видите, насколько мы сильны?','Do you see NOW the power of the Darkfallen?','16682','1','0','0','Valanar Slay 02'),
('-1631119','','','Хорош тянуть время перед Санлейн!','BOW DOWN BEFORE THE SAN\'LAYN!','16684','1','0','0','Valanar Berserk'),
('-1631120','','','Охохо...','...why...?','16683','1','0','0','Valanar Death'),

-- Council says
('-1631307','','','Моя чаша полна','My cup runneth over.','16686','1','0','0','Princes Special (attack)'),
('-1631308','...','...','Йих!','...','16687','1','0','0','Princes say'),
('-1631309','...','...','Э-эх!','...','16688','1','0','0','Princes say'),
('-1631310','...','...','До-хо!','...','16689','1','0','0','Princes say'),

-- Blood Queen Lana'thel
('-1631121','Habéis tomado una decisión incorrecta...','Habéis tomado una decisión incorrecta...','Это было неразумное решение!','You have made an... unwise... decision.','16782','1','0','0','Lanathel Aggro'),
('-1631122','Solo probar...','Solo probar...','Я только попробую на вкус...','Just a taste...','16783','1','0','0','Lanathel Bite 01'),
('-1631123','¡Conoced mi hambre!','¡Conoced mi hambre!','Я голодна!','Know my hunger!','16784','1','0','0','Lanathel Bite 02'),
('-1631124','¡SUFRID!','¡SUFRID!','Страдайте же!','SUFFER!','16786','1','0','0','Lanathel Special 01'),
('-1631125','¿Podéis aguantar esto?','¿Podéis aguantar esto?','Как вам такое?','Can you handle this?','16787','1','0','0','Lanathel Special 02'),
('-1631126','Sí... come vida mía. ¡Ahora me perteneces!','Sí... come vida mía. ¡Ahora me perteneces!','Нет. Моя прелесть, приятного аппетита!','Yes... feed my precious one! You\'re mine now!','16790','1','0','0','Lanathel Mind Control'),
('-1631127','¡Aquí viene! Mmmmm ja-ja-ja-ja.','¡Aquí viene! Mmmmm ja-ja-ja-ja.','Начинаем представление!','Here it comes.','16788','1','0','0','Lanathel Special 03'),
('-1631128','¡Esto acaba AHORA!','¡Esto acaba AHORA!','Сейчас все кончится!','THIS! ENDS! NOW!','16793','1','0','0','Lanathel Berserk'),
('-1631129','Pero... si nos caíamos tan... bien.','Pero... si nos caíamos tan... bien.','Но... Мы ведь так хорошо ладили...','But... we were getting along... so well...','16794','1','0','0','Lanathel Death'),
--
('-1631324','¡La muerte no es salida!','¡La muerte no es salida!','Смерть вас не спасет!','Death is no escape!','16785','1','0','0','Lanathel Add'),
('-1631328','Qué... desafortunado... hahahahaha','Qué... desafortunado... hahahahaha','Не повезло...','How... Unfortunate...','16789','1','0','0','Lanathel Reset'),
('-1631330','¿En serio? ¿Eso es todo?','¿En serio? ¿Eso es todo?','Вот как... У тебя не получилось?','Really...? Is that all you\'ve got?','16791','1','0','0','Lanathel Slay 01'),
('-1631331','¡Qué pena!','¡Qué pena!','Какая жалость...','Such a pity!','16792','1','0','0','Lanathel Slay 02'),

-- Svalna event
('-1631130','','','','Ready your arms, my Argent Brothers. The Vrykul will protect the Frost Queen with their lives.',16819,1,0,0,'scourgebane SAY_SVALNA_EVENT_1'),
('-1631131','','','','Even dying here beats spending another day collecting reagents for that madman, Finklestein.',16585,1,0,0,'arnath SAY_SVALNA_EVENT_2'),
('-1631132','','','','Enough idle banter! Our champions have arrived - support them as we push our way through the hall!',16820,1,0,0,'scourgebane SAY_SVALNA_EVENT_3'),
('-1631133','','','','You may have once fought beside me, Crok, but now you are nothing more than a traitor. Come, your second death approaches!',17017,1,0,0,'svalna SAY_SVALNA_EVENT_4'),
('-1631134','','','','Miserable creatures, Die!',17018,1,0,0,'svalna SAY_KILLING_CRUSADERS'),
('-1631135','','','','Foolish Crok, you brought my reinforcements with you! Arise Argent Champions and serve the Lich King in death!',17019,1,0,0,'svalna SAY_RESSURECT'),
('-1631136','','','','Come Scourgebane, I\'ll show the Lich King which one of us is truly worthy of the title, champion!',17020,1,0,0,'svalna SAY_SVALNA_AGGRO'),
('-1631137','','','','What? They died so easily? No matter.',17022,1,0,0,'svalna SAY_KILL_CAPTAIN'),
('-1631138','','','','What a pitiful choice of an ally Crok.',17021,1,0,0,'svalna SAY_KILL_PLAYER'),
('-1631139','','','','Perhaps... you were right... Crok, you must not approach the Frost Queen, quickly, stop them!',17023,1,0,0,'svalna SAY_DEATH'),

-- Valithria Dreamwalker
('-1631140','¡Héroes, ayudadme! No... ¡No puedo retenerlos mucho más tiempo! ¡Debéis sanar mis heridas!','¡Héroes, ayudadme! No... ¡No puedo retenerlos mucho más tiempo! ¡Debéis sanar mis heridas!','Герои! Вы должны мне помочь! Мои силы на исходе... Залечите мои раны...','Heroes, lend me your aid! I... I cannot hold them off much longer! You must heal my wounds!','17064','1','0','0','Valithria Aggro'),
('-1631141','He abierto un portal hacia el sueño. Vuestra salvación está dentro, héroes.','He abierto un portal hacia el sueño. Vuestra salvación está dentro, héroes.','Я открыла портал в изумрудный сон. Там вы найдете спасение, герои!','I have opened a portal into the Dream. Your salvation lies within, heroes.','17068','1','0','0','Valithria Dream World Open'),
('-1631142','¡Mi fuerza vuelve! ¡Continuad héroes!','¡Mi fuerza vuelve! ¡Continuad héroes!','Силы возвращаются ко мне! Герои, еще немного!','My strength is returning! Press on, heroes!','17070','1','0','0','Valithria Health High'),
('-1631143','¡No aguantaré mucho más!','¡No aguantaré mucho más!','Я долго не продержусь!','I will not last much longer!','17069','1','0','0','Valithria Health Low'),
('-1631144','¡Perdonadme por mis actos! No... puedo... ¡SOLO QUEDAN PESADILLAS!','¡Perdonadme por mis actos! No... puedo... ¡SOLO QUEDAN PESADILLAS!','Простите меня, я не могу остано... ВСЕ ВО ВЛАСТИ КОШМАРА!','Forgive me for what I do! I... cannot... stop... ONLY NIGHTMARES REMAIN!','17072','1','0','0','Valithria Lose'),
('-1631145','Una trágica pérdida...','Una trágica pérdida...','Прискобная потеря.','A tragic loss...','17066','1','0','0','Valithria Slay Good - Player'),
('-1631146','¡FRACASADOS!','¡FRACASADOS!','Неудачники!','FAILURES!','17067','1','0','0','Valithria Berserk'),
('-1631147','¡Estoy renovada! ¡Ysera!, haz que estas asquerosas criaturas descansen.','¡Estoy renovada! ¡Ysera!, haz que estas asquerosas criaturas descansen.','Я излечилась! Изера, даруй мне силу покончить с этими нечестивыми тварями!','I am renewed! Ysera grants me the favor to lay these foul creatures to rest!','17071','1','0','0','Valithria Win'),
--
('-1631402','Los crueles no merecen descanso...','Los crueles no merecen descanso...','Одержимые не знают отдыха...','No rest for the wicked...','17065','1','0','0','Valithria Slay Bad Hostile NPC'),

-- Spider event (absent)

-- Sindragosa
('-1631148','¡Estáis locos por haber venido aquí! ¡Los vientos helados de Rasganorte consumirán vuestras almas!','¡Estáis locos por haber venido aquí! ¡Los vientos helados de Rasganorte consumirán vuestras almas!','Глупцы! Зачем вы сюда явились? Ледяные ветра Нордскола унесут ваши души!','You are fools who have come to this place! The icy winds of Northrend will consume your souls!','17007','1','0','0','Sindragosa Aggro'),
('-1631149','¡Sufrid mortales al ver que vuestra patética mágia os traiciona!','¡Sufrid mortales al ver que vuestra patética mágia os traiciona!','Трепещите, смертные! Ибо ваша жалкая магия теперь бессильна!','Suffer, mortals, as your pathetic magic betrays you!','17014','1','0','0','Sindragosa Arcane'),
('-1631150','¿Podéis sentir el toque helado de la muerte en el corazón?','¿Podéis sentir el toque helado de la muerte en el corazón?','Вы чувствуете, как ледяная ладонь смерти сжимает сердце?','Can you feel the cold hand of death upon your heart?','17013','1','0','0','Sindragosa Freeze'),
('-1631151','¡A-a-a-a-aaa! ¡Quema! ¿Qué brujería es esta?','¡A-a-a-a-aaa! ¡Quema! ¿Qué brujería es esta?','А-а-а! ЖжОт! Что это за колдовство?','Suffer, mortals, as your pathetic magic betrays you!','17015','1','0','0','Sindragosa Special'),
('-1631152','¡Aquí termina vuestra incursión! ¡Nadie sobrevivirá!','¡Aquí termina vuestra incursión! ¡Nadie sobrevivirá!','Здесь ваше вторжение и окончится! Никто не уцелеет!','Your incursion ends here! None shall survive!','17012','1','0','0','Sindragosa Take Off - fly'),
('-1631153','¡Ahora sentid el poder sin fín de mi maestro y desesperad!','¡Ahora sentid el poder sin fín de mi maestro y desesperad!','А теперь почувствуйте всю мощь Господина и погрузитесь в отчаяние!','Now feel my master\'s limitless power and despair!','17016','1','0','0','Sindragosa Low HP'),
('-1631154','¡Morid!','¡Morid!','Погибни!','Perish!','17008','1','0','0','Sindragosa Slay 01'),
('-1631155','Defecto de mortalidad...','Defecto de mortalidad...','Удел смертных!','A flaw of mortality...','17009','1','0','0','Sindragosa Slay 02'),
('-1631156','¡Basta! ¡Estos juegos me cansan!','¡Basta! ¡Estos juegos me cansan!','Хватит! Эти игры меня утомляют!','Enough! I tire of these games!','17011','1','0','0','Sindragosa Berserk'),
('-1631157','¡Libre! Al fin...','¡Libre! Al fin...','Наконец-то! Свободна!','Free...at last...','17010','1','0','0','Sindragosa Death'),

-- Lich king
('-1631158','Así que por fin ha llegado la gran justicia de la luz.','Así que por fin ha llegado la gran justicia de la luz.','Неужели прибыли, наконец, хваленые силы света? Мне бросить Ледяную скорбь и сдаться на твою милость, Фордринг?','So...the Light\'s vaunted justice has finally arrived. Shall I lay down Frostmourne and throw myself at your mercy, Fordring?','17349','1','0','0','Lich King SAY_INTRO1'),
('-1631160','','','Ты пройдешь через эти мучения сам.','You will learn of that first hand. When my work is complete, you will beg for mercy -- and I will deny you. Your anguished cries will be testament to my unbridled power.','17350','1','0','0','Lich King SAY_INTRO3'),
('-1631162','Te mantendré vivo para presenciar el final, Vadín. No me gustaría que el mejor campeón de la luz se perdiera en este mismo mundo rehecho a mi imagen.','Te mantendré vivo para presenciar el final, Vadín. No me gustaría que el mejor campeón de la luz se perdiera en este mismo mundo rehecho a mi imagen.','Я оставлю тебя в живых, чтобы ты увидел финал! Не могу допустить чтобы величайший служитель света пропустил рождение МОЕГО мира!','I\'ll keep you alive to witness the end, Fordring. I would not want the Light\'s greatest champion to miss seeing this wretched world remade in my image.','17351','1','0','0','Lich King SAY_AGGRO'),
('-1631163','¡Venid campeones, alimentadme con vuestra ira!','¡Venid campeones, alimentadme con vuestra ira!','Ну же, герои! В вашей ярости - МОЯ сила!','Come then champions, feed me your rage!','17352','1','0','0','Lich King SAY'),
('-1631164','¡Os congelaré las entrañas hasta convertiros en un caparazón de hielo!','¡Os congelaré las entrañas hasta convertiros en un caparazón de hielo!','Я проморожу вас насквозь и вы разлетитесь на ледяные осколки!','I will freeze you from within until all that remains is an icy husk!','17369','1','0','0','Lich King SAY'),
('-1631165','¡Contemplad el colapso de vuestro mundo!','¡Contemplad el colapso de vuestro mundo!','Смотрите, как мир рушится вокруг вас!','Watch as the world around you collapses!','17370','1','0','0','Lich King SAY_WIN'),
('-1631166','Val\'kyr, ¡Vuestro maestro os llama!','Val\'kyr, ¡Vuestro maestro os llama!','Валькирия! Твой господин зовет!','Val\'kyr, your master calls!','17373','1','0','0','Lich King SAY_SUMMON'),
('-1631167','La Agonía de Escarcha está hambrienta...','La Agonía de Escarcha está hambrienta...','Ледяная скорбь жаждет крови!','Frostmourne hungers...','17366','1','0','0','Lich King SAY'),
('-1631171','Argh... Agonía de Escarcha, ¡Obedéceme!','Argh... Agonía de Escarcha, ¡Obedéceme!','Ледяная скорбь, повинуйся мне!','Argh... Frostmourne, obey me!','17367','1','0','0','Lich King SAY'),
('-1631172','¡La Agonía de Escarcha se alimentará del alma de vuestro aliado!','¡La Agonía de Escarcha se alimentará del alma de vuestro aliado!','Ледяная скорбь поглотит душу вашего товарища!','Frostmourne feeds on the soul of your fallen ally!','17368','1','0','0','Lich King SAY_KILL'),
('-1631173','','','Конец света!','Apocalypse!','17371','1','0','0','Lich King SAY'),
('-1631174','','','Склонись перед своим господином и повелителем!','Bow down before your lord and master!','17372','1','0','0','Lich King SAY'),
('-1631175','','','Да! Вы меня и правда ранили. Я слишком долго с вами играл. Испытайте на себе возмездие Смерти!','You gnats actually hurt me! Perhaps I\'ve toyed with you long enough, now taste the vengeance of the grave!','17359','1','0','0','Lich King SAY'),
('-1631176','¡Adiós esperanza!','¡Adiós esperanza!','Надежда тает!','Hope wanes!','17363','1','0','0','Lich King SAY'),
('-1631177','¡El Fin ha llegado!','¡El Fin ha llegado!','Пришел конец!','The end has come!','17364','1','0','0','Lich King SAY'),
('-1631178','¡Enfrentaos a vuestro trágico final!','¡Enfrentaos a vuestro trágico final!','Встречайте трагический финал!','Face now your tragic end!','17365','1','0','0','Lich King SAY_KILL'),
('-1631179','','','Сомнений нет - вы сильнейшие герои Азерота! Вы преодолели все препятствия, которые я воздвиг перед вами! Сильнейшие из моих слуг пали под вашим натиском, сгорели в пламени вашей ярости!','No question remains unanswered. No doubts linger. You are Azeroth\'s greatest champions! You overcame every challenge I laid before you. My mightiest servants have fallen before your relentless onslaught, your unbridled fury..','17353','1','0','0','Lich King SAY'),
('-1631180','','','Что движет вами? Праведность? Не знаю...','Is it truly righteousness that drives you? I wonder.','17354','1','0','0','Lich King SAY'),
('-1631181','','','Ты отлично их обучил, Фордринг! Ты привел сюда лучших воинов, которых знал мир! И отдал их в мои руки. Как я и рассчитывал.','You trained them well, Fordring. You delivered the greatest fighting force this world has ever known... right into my hands -- exactly as I intended. You shall be rewarded for your unwitting sacrifice.','17355','1','0','0','Lich King SAY'),
('-1631182','','','Смотри как я буду воскрешать их и превращать в воинов Плети! Они повергнут этот мир в пучину хаоса. Азерот падет от их рук. И ты станешь первой жертвой. ','Watch now as I raise them from the dead to become masters of the Scourge. They will shroud this world in chaos and destruction. Azeroth\'s fall will come at their hands -- and you will be the first to die.','17356','1','0','0','Lich King SAY'),
('-1631183','Ja-ja-ja-ja... ¡No capta esta ironía!','Ja-ja-ja-ja... ¡No capta esta ironía!','Мне по душе эта ирония!','I delight in the irony.','17357','1','0','0','Lich King SAY'),
('-1631185','Imposible...','Imposible...','Невозможно!','Impossible...','17358','1','0','0','Lich King SAY'),
('-1631190','Aquí me hayo, como el lobo entre los corderos... y no me temen.','Aquí me hayo, como el lobo entre los corderos... y no me temen.','И вот я стою как лев пред агнцами. И не дрожат они.','Now I stand, the lion before the lambs... and they do not fear.','17361','1','0','0','Lich King SAY'),
('-1631191','No sienten miedo.','No sienten miedo.','Им неведом страх!','They cannot fear.','17362','1','0','0','Lich King SAY'),
('-1631528','','','%s убит','%s dies.','17374','1','0','0','Lich King SAY_DEATH'),
--
('-1631514','А-а-х!','А-а-х!','А-а-х!','...','17360','1','0','0','Lich King SAY'),
('-1631531','¡Profanado!','¡Profanado!','Оскверняю!','Defile!','0','3','0','0','Lich King SAY'),

-- Tirion
('-1631159','¡Te daremos una muerte rápida Arthas! ¡Más de lo que tuvieron aquellos a los que torturaste y asesinaste!','¡Te daremos una muerte rápida Arthas! ¡Más de lo que tuvieron aquellos a los que torturaste y asesinaste!','Мы даруем тебе быструю смерть, Артас! Более быструю чем ты заслуживаешь за то что замучил и погубил десятки тысяч жизней!','We will grant you a swift death, Arthas. More than can be said for the thousands you\'ve tortured and slain.','17390','1','0','0','Tirion SAY_INTRO2'),
('-1631161','Qué así sea. Campeones, ¡Atacar!','Qué así sea. Campeones, ¡Atacar!','Да будет так! Герои, в атаку','So be it. Champions, attack!','17391','1','0','0','Tirion SAY_INTRO4'),
('-1631184','Qué la luz... me vendiga por última vez. Dame fuerzas... para romper estas ataduras.','Qué la luz... me vendiga por última vez. Dame fuerzas... para romper estas ataduras.','Свет! Даруй мне последнее благословение! Дай мне разбить эти оковы!','LIGHT, GRANT ME ONE FINAL BLESSING. GIVE ME THE STRENGTH... TO SHATTER THESE BONDS!','17392','1','0','0','Tirion SAY'),
('-1631186','¡Basta Arthas! ¡Tu odio no consumirá más vidas!','¡Basta Arthas! ¡Tu odio no consumirá más vidas!','Хватит, Артас! Твоя ненависть не заберет больше ни одной жизни!','No more, Arthas! No more lives will be consumed by your hatred!','17393','1','0','0','Tirion SAY'),

-- Menethil
('-1631168','¿Habéis venido para ajusticiar a Arthas? ¿Para ver la destrucción del Rey Exánime?','¿Habéis venido para ajusticiar a Arthas? ¿Para ver la destrucción del Rey Exánime?','Вы пришли чтобы вершить суд над Артасом? Чтобы уничтожить короля-лича?','You have come to bring Arthas to justice? To see the Lich King destroyed?','17394','1','0','0','Terenas Menethil II SAY'),
('-1631169','Primero, escapad del abrazo de la Agonía de Escarcha o estaréis condenado como yo, atrapado en esta maldita espada toda la eternidad.','Primero, escapad del abrazo de la Agonía de Escarcha o estaréis condenado como yo, atrapado en esta maldita espada toda la eternidad.','Вы не должны оказаться во власти Ледяной скорби. Иначе, как и я, будете навеки порабощены этим проклятым клинком.','First, you must escape Frostmourne\'s hold, or be damned as I am; trapped within this cursed blade for all eternity.','17395','1','0','0','Terenas Menethil II SAY'),
('-1631170','¡Ayudadme a destruir estas almas torturadas! ¡Juntos debilitaremos el poder de la Agonía de Escarcha y al Rey Exánime desde dentro!','¡Ayudadme a destruir estas almas torturadas! ¡Juntos debilitaremos el poder de la Agonía de Escarcha y al Rey Exánime desde dentro!','Помогите мне уничтожить эти истерзанные души. Вместе мы вытянем силу из ледяной скорби и ослабим короля-лича.','Aid me in destroying these tortured souls! Together we will loosen Frostmourne\'s hold and weaken the Lich King from within!','17396','1','0','0','Terenas Menethil II SAY'),
('-1631187','¡Libre al fin! Se acabó hijo mío. Es la hora del juicio final.','¡Libre al fin! Se acabó hijo mío. Es la hora del juicio final.','Наконец я свободен. Все кончено, сын мой. Настал час расплаты.','Free at last! It is over, my son. This is the moment of reckoning.','17397','1','0','0','Terenas Menethil II SAY'),
('-1631188','¡Alzaos, campeones de la luz!','¡Alzaos, campeones de la luz!','Поднимитесь, воины света!','Rise up, champions of the Light!','17398','1','0','0',' SAY'),

-- Adds
('-1631590','','','Р-р-р-рота, подъем!','P-rr-company, the rise of','0','1','0','0','custom message'),
('-1631591','','','Хилы, не спать!','Heals, do not sleep','0','1','0','0','custom message'),
('-1631592','','','ДД поднажали!','DD put pressure','0','1','0','0','custom message'),
('-1631593','','','Лидер, гони лентяев из рейда! А то еще час возиться будете!','Leader, get lazy from a raid! And then another hour to tinker will','0','1','0','0','custom message'),
('-1631594','','','Ну вот вы и прикончили Артаса. Теперь будем ждать Катаклизм.','Well, you finished off Arthas. Now we wait for the cataclysm','0','1','0','0','custom message');

-- Gossips
DELETE FROM `gossip_texts` WHERE `entry` BETWEEN -3631608 AND -3631600;
INSERT INTO `gossip_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `comment`) VALUES
('-3631600', "Light\'s Hammer", NULL, NULL, NULL, NULL, NULL, "Martillo de la Luz", "Martillo de la Luz", "Молот света", "IceCrown citadel teleporter text 1"),
('-3631601', "Oratory of the Damned", NULL, NULL, NULL, NULL, NULL, "Oratorio de los Malditos", "Oratorio de los Malditos", "Молельня проклятых", "IceCrown citadel teleporter text 2"),
('-3631602', "Rampart of Skulls", NULL, NULL, NULL, NULL, NULL, "La Muralla de las Calaveras", "La Muralla de las Calaveras", "Черепной вал", "IceCrown citadel teleporter text 3"),
('-3631603', "Deathbringer\'s Rise", NULL, NULL, NULL, NULL, NULL, "Alto del Libramorte", "Alto del Libramorte", "Подъем Смертоносного", "IceCrown citadel teleporter text 4"),
('-3631604', "Icecrown Citadel", NULL, NULL, NULL, NULL, NULL, "Ciudadela de la Corona de Hielo", "Ciudadela de la Corona de Hielo", "Цитадель Ледяной Короны", "IceCrown citadel teleporter text 5"),
('-3631605', "The Sanctum of Blood", NULL, NULL, NULL, NULL, NULL, "El Sagrario de Sangre", "El Sagrario de Sangre", "Святилище крови", "IceCrown citadel teleporter text 6"),
('-3631606', "Frost Queen\'s Lair", NULL, NULL, NULL, NULL, NULL, "La Guarida de la Reina de Escarcha", "La Guarida de la Reina de Escarcha", "Логово Королевы льда", "IceCrown citadel teleporter text 7"),
('-3631607', "Frozen Throne", NULL, NULL, NULL, NULL, NULL, "El Trono Helado", "El Trono Helado", "Ледяной трон", "IceCrown citadel teleporter text 8"),
('-3631608', "We are ready, Tirion!", NULL, NULL, NULL, NULL, NULL, "¡Estamos preparados, Tirion!", "¡Estamos preparados, Tirion!", "Всегда готовы, дедуля!", "IceCrown citadel Tirion gossip");

-- Icecrown citadel spelltable

-- Lord Marrowgar
DELETE FROM `boss_spell_table` WHERE `entry` = 36612;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36612, 69055, 70814, 69055, 70814, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0), -- handled by dynamic timer in script
(36612, 69138, 0, 0, 0, 6000, 0, 0, 0, 12000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36612, 71580, 0, 0, 0, 6000, 0, 0, 0, 12000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36612, 69146, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36612, 69057, 0, 0, 0, 17000, 0, 0, 0, 27000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(36612, 69076, 0, 0, 0, 45000, 0, 0, 0, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36612, 69075, 0, 0, 0, 2000, 0, 0, 0, 2000, 0, 0, 0, 5, 0, 0, 12, 0, 0),
(36612, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 1, 0, 0);
-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36612, 38711, 20000, 40000, 1, 1, 2, 2, 1, 5, 0, 9),
(36612, 36672, 45000, 45000, 1, 1, 2, 2, 75, 100, 0, 9);
-- Cold flame
DELETE FROM `boss_spell_table` WHERE `entry` = 36672;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36672, 69145, 0, 0, 0, 3000, 3000, 8000, 8000, 3000, 3000, 8000, 8000, 15, 15, 15, 15, 0, 0, 0, 1, 0, 0),
(36672, 69147, 0, 0, 0, 700, 0, 0, 0, 700, 0, 0, 0, 15000, 15000, 30000, 30000, 0, 0, 0, 1, 0, 0),
(36672, 69146, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36672, 36672, 30000, 30000, 1, 1, 1, 1, 0, 0, 0, 11);
-- Bone spike
DELETE FROM `boss_spell_table` WHERE `entry` = 38711;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(38711, 46598, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 18, 0, 0),
(38711, 69065, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 6, 0, 0);

-- Lady Deathwhisper
DELETE FROM `boss_spell_table` WHERE `entry` = 36855;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36855, 70842, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 1, 0, 0),
(36855, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 1, 0, 0),
(36855, 71254, 72008, 72008, 72504, 5000, 0, 0, 0, 8000, 0, 0, 0, 4, 0, 0),
(36855, 71420, 72501, 72007, 72502, 15000, 0, 0, 0, 25000, 0, 0, 0, 4, 0, 0),
(36855, 71001, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 4, 0, 0),
(36855, 71204, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(36855, 70901, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 6, 0, 0),
(36855, 71289, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 4, 0, 0),
(36855, 71494, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 1, 0, 0);
-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36855, 37890, 45000, 75000, 1, 1, 2, 2, 75, 100, 0, 11),
(36855, 37949, 45000, 75000, 1, 1, 2, 2, 75, 100, 0, 11),
(36855, 38010, 45000, 45000, 1, 1, 2, 2, 75, 100, 0, 9),
(36855, 38222, 8000,  15000, 1, 1, 1, 1, 75, 100, 0, 9),
(36855, 38009, 45000, 45000, 1, 1, 2, 2, 75, 100, 0, 9);
-- Vengeful shade
DELETE FROM `boss_spell_table` WHERE `entry` = 38222;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(38222, 71494, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 1, 0, 0),
(38222, 71544, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 3, 0, 0);
-- Adherent
DELETE FROM `boss_spell_table` WHERE `entry` = 37949;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37949, 71129, 0, 0, 0, 15000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(37949, 70594, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 4, 0, 0),
(37949, 71254, 0, 0, 0, 5000, 0, 0, 0, 15000, 0, 0, 0, 4, 0, 0),
(37949, 70906, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 4, 0, 0),
(37949, 70903, 0, 0, 0, 1000, 0, 0, 0, 2000, 0, 0, 0, 1, 0, 0),
(37949, 71237, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(37949, 70768, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 4, 0, 0),
(37949, 41236, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 1, 0, 0),
(37949, 71234, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 4, 0, 0);
-- Fanatic
DELETE FROM `boss_spell_table` WHERE `entry` = 37890;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37890, 70659, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 3, 0, 0),
(37890, 70670, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 3, 0, 0),
(37890, 70674, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 1, 0, 0);

-- Gunship battle
-- Frost wyrm
DELETE FROM `boss_spell_table` WHERE `entry` = 37230;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37230, 70116, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 4, 0, 0),
(37230, 70362, 0, 0, 0, 20000, 0, 0, 0, 25000, 0, 0, 0, 4, 0, 0),
(37230, 70361, 0, 0, 0, 3000, 0, 0, 0, 5000, 0, 0, 0, 3, 0, 0),
(37230, 47008, 0, 0, 0, 180000, 0, 0, 0, 180000, 0, 0, 0, 1, 0, 0);

-- Rotted frost giant
DELETE FROM `boss_spell_table` WHERE `entry` IN (38490, 38494);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(38490, 64652, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 4, 0, 0),
(38490, 72865, 0, 0, 0, 30000, 0, 0, 0, 45000, 0, 0, 0, 4, 0, 0),
(38490, 47008, 0, 0, 0, 300000, 0, 0, 0, 300000, 0, 0, 0, 1, 0, 0);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(38494, 64652, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 4, 0, 0),
(38494, 72865, 0, 0, 0, 25000, 0, 0, 0, 40000, 0, 0, 0, 4, 0, 0),
(38494, 47008, 0, 0, 0, 300000, 0, 0, 0, 300000, 0, 0, 0, 1, 0, 0);

-- Deathbringer Saurfang
DELETE FROM `boss_spell_table` WHERE `entry` = 37813;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`,`data1`, `data2`, `data3`, `data4`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37813, 72178, 0, 0, 0, 20000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37813, 72371, 0, 0, 0, 3000, 0, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37813, 72256, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37813, 72293, 0, 0, 0, 35000, 0, 0, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(37813, 72737, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37813, 72385, 0, 0, 0, 20000, 0, 0, 0, 40000, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37813, 72380, 0, 0, 0, 25000, 0, 0, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37813, 72408, 0, 0, 0, 20000, 0, 0, 0, 40000, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37813, 72172, 0, 0, 0, 45000, 0, 0, 0, 45000, 0, 0, 0, 2, 5, 2, 5, 1, 0, 0),
(37813, 72173, 0, 0, 0, 45000, 0, 0, 0, 45000, 0, 0, 0, 2, 5, 2, 5, 1, 0, 0),
(37813, 72356, 0, 0, 0, 45000, 0, 0, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37813, 72357, 0, 0, 0, 45000, 0, 0, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37813, 72358, 0, 0, 0, 45000, 0, 0, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37813, 72769, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37813, 72723, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37813, 72242, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37813, 47008, 0, 0, 0, 480000, 0, 0, 0, 480000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0);
-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(37813, 38508, 45000, 45000, 1, 1, 2, 2, 15, 25, 0, 9);
-- Blood beast
DELETE FROM `boss_spell_table` WHERE `entry` = 38508;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(38508, 72176, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 1, 0, 0),
(38508, 72723, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 1, 0, 0),
(38508, 72769, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 1, 0, 0),
(38508, 21150, 0, 0, 0, 15000, 0, 0, 0, 27000, 0, 0, 0, 1, 0, 0);


-- Festergut
DELETE FROM `boss_spell_table` WHERE `entry` = 36626;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
( 36626, 69157, 0, 0, 0, 20000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 69162, 0, 0, 0, 20000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 69164, 0, 0, 0, 20000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 69126, 0, 0, 0, 20000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
( 36626, 69152, 0, 0, 0, 20000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
( 36626, 69154, 0, 0, 0, 20000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
( 36626, 69165, 0, 0, 0, 10000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 69195, 0, 0, 0, 20000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 69278, 0, 0, 0, 20000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 69279, 0, 0, 0, 20000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 69290, 0, 0, 0, 20000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 69291, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 6, 0, 1),
( 36626, 72219, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 3, 0, 0),
( 36626, 72227, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 6, 0, 1),
( 36626, 72272, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
( 36626, 69244, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
( 36626, 69248, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
( 36626, 72287, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
( 36626, 71379, 0, 0, 0, 20000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 6, 0, 1),
( 36626, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 1, 0, 0);
-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36626, 38548, 12000, 12000, 1, 1, 1, 1, 10, 20, 0, 11);

-- Rotface
DELETE FROM `boss_spell_table` WHERE `entry` = 36627;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`,`data1`, `data2`, `data3`, `data4`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36627, 69508, 0, 0, 0, 15000, 0, 0, 0, 20000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36627, 69674, 0, 0, 0, 1000, 0, 0, 0,  1000, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(36627, 70003, 0, 0, 0, 15000, 0, 0, 0, 15000, 0, 0, 0, 1, 2, 1, 3, 6, 0, 0),
(36627, 69788, 0, 0, 0, 20000, 0, 0, 0, 40000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36627, 69783, 0, 0, 0, 30000, 0, 0, 0, 45000, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0),
(36627, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36627, 69789, 0, 0, 0, 20000, 0, 0, 0, 40000, 0, 0, 0, 0, 0, 0, 0, 6, 0, 1);
-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36627, 36897, 12000, 12000, 1, 1, 1, 1, 1, 5, 0, 9),
(36627, 37986, 15000, 15000, 1, 1, 1, 1, 10, 20, 0, 11),
(36627, 37013, 15000, 15000, 1, 1, 1, 1, 0, 0, 0, 11);
-- Small ooze
DELETE FROM `boss_spell_table` WHERE `entry` = 36897;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36897,69774, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 4, 0, 0),
(36897,69750, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 1, 0, 0),
(36897,69644, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 6, 0, 0),
(36897,69889, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 6, 0, 0);
-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36897, 36899, 12000, 12000, 1, 1, 1, 1, 1, 5, 0, 9);
-- Big ooze
DELETE FROM `boss_spell_table` WHERE `entry` = 36899;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36899,69774, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 4, 0, 0),
(36899,69839, 0, 0, 0, 6000, 0, 0, 0, 6000, 0, 0, 0, 1, 0, 0),
(36899,69760, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 1, 0, 0),
(36899,69644, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 1, 0, 0),
(36899,69558, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 1, 0, 0),
(36899,69889, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 6, 0, 0);
-- Ooze explode stalker
DELETE FROM `boss_spell_table` WHERE `entry` = 38107;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(38107,69840, 0, 0, 0, 2000, 0, 0, 0, 2000, 0, 0, 0, 1, 0, 0);

-- Professor Putricide
DELETE FROM `boss_spell_table` WHERE `entry` = 36678;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36678,70351, 0, 0, 0, 40000, 0, 0, 0, 60000, 0, 0, 0, 0, 1, 0, 0),
(36678,71617, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 0, 3, 0, 0),
(36678,71615, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 100, 12, 0, 0),
(36678,71618, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 100, 12, 0, 0),
(36678,71621, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 0, 3, 0, 0),
(36678,71278, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 0, 3, 0, 0),
(36678,71279, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 0, 3, 0, 0),
(36678,71893, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 0, 3, 0, 0),
(36678,71273, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 1, 0, 0),
(36678,71275, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 1, 0, 0),
(36678,71276, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 1, 0, 0),
(36678,71702, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 0, 1, 0, 0),
(36678,71703, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 0, 1, 0, 0),
(36678,71603, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 0, 3, 0, 0),
(36678,70311, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 0, 1, 0, 0),
(36678,47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 1, 0, 0),
(36678,71518, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 0, 6, 0, 1),
(36678,72672, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 3, 0, 0);
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36678,70342, 0, 0, 0, 30000, 0, 0, 0, 60000, 0, 0, 0, 10, 40, 0, 15, 0, 0),
(36678,70852, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 10, 30, 0, 15, 0, 0);

-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36678, 37562, 20000, 40000, 1, 1, 1, 1, 5, 10, 0, 9),
(36678, 38159, 8000,  20000, 1, 1, 1, 1, 20, 40, 0, 9),
(36678, 37690, 40000, 60000, 1, 1, 1, 1, 10, 40, 0, 9),
(36678, 37697, 20000, 40000, 1, 1, 1, 1, 5, 10, 0, 9);
-- Gas cloud
DELETE FROM `boss_spell_table` WHERE `entry` = 37562;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37562,70672, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 6, 0, 0),
(37562,70215, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 6, 0, 0),
(37562,71770, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 6, 0, 1),
(37562,70812, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 6, 0, 1),
(37562,70701, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 6, 0, 0);
-- Volatile ooze
DELETE FROM `boss_spell_table` WHERE `entry` = 37697;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37697,70492, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 1, 0, 0),
(37697,70530, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 6, 0, 1),
(37697,71770, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 6, 0, 1),
(37697,70447, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 6, 0, 0);
-- Mutated abomination (pet?)
DELETE FROM `boss_spell_table` WHERE `entry` = 37672;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37672,70311, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 1, 0, 0),
(37672,72527, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(37672,72539, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(37672,70542, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 3, 0, 0),
(37672,70405, 0, 0, 0, 10000, 0, 0, 0, 20000, 0, 0, 0, 1, 0, 0);

-- Taldaram
DELETE FROM `boss_spell_table` WHERE `entry` = 37973;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37973, 71807, 0, 0, 0, 50000, 0, 0, 0, 10000, 0, 0, 0, 0, 0, 0, 3, 0, 0),
(37973, 71718, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37973, 71719, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 15, 0, 0),
(37973, 72040, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37973, 72041, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 15, 0, 0),
(37973, 70952, 0, 0, 0, 30000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37973, 70981, 0, 0, 0, 30000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37973, 70982, 0, 0, 0, 30000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37973, 70983, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37973, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 1, 0, 0);

-- Valanar
DELETE FROM `boss_spell_table` WHERE `entry` = 37970;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37970, 72053, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37970, 38459, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 11, 0, 0),
(37970, 72037, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37970, 38422, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 11, 0, 0),
(37970, 71945, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(37970, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37970, 70983, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37970, 70981, 0, 0, 0, 30000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37970, 70982, 0, 0, 0, 30000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37970, 70952, 0, 0, 0, 30000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37970, 72039, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0);

-- Keleseth
DELETE FROM `boss_spell_table` WHERE `entry` = 37972;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37972, 71405, 0, 0, 0, 5000, 0, 0, 0, 8000, 0, 0, 0, 0, 0, 0, 3, 0, 0),
(37972, 71815, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 3, 0, 0),
(37972, 71943, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37972, 71822, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37972, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37972, 70952, 0, 0, 0, 30000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37972, 70981, 0, 0, 0, 30000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37972, 70982, 0, 0, 0, 30000, 0, 0, 0, 30000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37972, 70983, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 1, 0, 0);

-- Lanathel
DELETE FROM `boss_spell_table` WHERE `entry` = 37955;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37955, 72981, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37955, 71623, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(37955, 70451, 70451, 71510, 71510, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 6, 0, 1),
(37955, 70445, 70445, 70821, 70821, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(37955, 71726, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37955, 70867, 71473, 71532, 71533, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37955, 70871, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37955, 70923, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37955, 71340, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37955, 71264, 0, 0, 0, 20000, 0, 0, 0, 35000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37955, 71446, 0, 0, 0, 7000, 0, 0, 0, 12000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37955, 71772, 0, 0, 0, 40000, 0, 0, 0, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37955, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37955, 72934, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 6, 0, 1),
(37955, 71952, 0, 0, 0, 5000, 0, 0, 0, 8000, 0, 0, 0, 0, 0, 0, 1, 0, 0);

-- Valithria
DELETE FROM `boss_spell_table` WHERE `entry` = 36789;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36789, 71977, 0, 0, 0, 30000, 0, 0, 0, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36789, 71987, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(36789, 72481, 0, 0, 0, 10000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36789, 70873, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36789, 71189, 0, 0, 0, 3000, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36789, 72724, 0, 0, 0, 3000, 0, 0, 0, 3000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36789, 70904, 0, 0, 0, 5000, 0, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 1, 0, 1),
(36789, 71196, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36789, 70702, 0, 0, 0, 15000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 16, 0, 1);
-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36789, 38429, 30000, 40000, 1, 1, 1, 1, 5, 70, 0, 9),
(36789, 37868, 30000, 45000, 1, 1, 1, 1, 1, 3, 0, 11),
(36789, 37863, 30000, 45000, 1, 1, 1, 1, 1, 3, 0, 11),
(36789, 36791, 30000, 45000, 1, 1, 1, 1, 1, 3, 0, 11),
(36789, 37934, 30000, 45000, 1, 1, 1, 1, 1, 3, 0, 11),
(36789, 37886, 30000, 45000, 1, 1, 1, 1, 1, 3, 0, 11);
-- Nightmare portal
DELETE FROM `boss_spell_table` WHERE `entry` = 38429;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(38429, 70873, 0, 0, 0, 2000, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 1, 0, 1);

-- Sindragosa
DELETE FROM `boss_spell_table` WHERE `entry` = 36853;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36853, 70084, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36853, 57764, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 1, 0),
(36853, 19983, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 3, 0, 0),
(36853, 71077, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36853, 69649, 0, 0, 0, 20000, 0, 0, 0, 35000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36853, 70107, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36853, 69762, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36853, 69766, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(36853, 69846, 0, 0, 0, 15000, 0, 0, 0, 20000, 0, 0, 0, 50.0, 100.0, 0, 15, 0, 0),
(36853, 70117, 0, 0, 0, 30000, 0, 0, 0, 40000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36853, 70123, 0, 0, 0, 20000, 0, 0, 0, 35000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36853, 70126, 0, 0, 0, 90000, 0, 0, 0, 90000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36853, 70157, 0, 0, 0, 6000, 0, 0, 0, 6000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(36853, 71665, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(36853, 69845, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36853, 36980, 0, 0, 0, 90000, 0, 0, 0, 90000, 0, 0, 0, 0, 0, 0, 9, 0, 0),
(36853, 47008, 0, 0, 0, 600000, 0, 0, 0, 600000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36853, 72289, 0, 0, 0, 1000, 0, 0, 0, 1000, 0, 0, 0, 0, 0, 0, 12, 0, 1),
(36853, 70128, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 30.0, 0, 0, 12, 0, 0);

UPDATE`boss_spell_table` SET  `data1` = 2, `data2` = 5, `data3` = 2, `data4` =5 WHERE `entry` = 36853 AND `spellID_N10` = 70126;
UPDATE`boss_spell_table` SET  `data1` = 4, `data2` = 4, `data3` = 4, `data4` =4 WHERE `entry` = 36853 AND `spellID_N10` = 69845;

-- Rimefang
DELETE FROM `boss_spell_table` WHERE `entry` = 37533;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37533, 71387, 0, 0, 0, 0, 0, 0, 0, 3600000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37533, 71386, 0, 0, 0, 5000, 0, 0, 0, 8000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(37533, 71376, 0, 0, 0, 4000, 0, 0, 0, 8000, 0, 0, 0, 0, 0, 0, 4, 0, 0);
-- Spinestalker
DELETE FROM `boss_spell_table` WHERE `entry` = 37534;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37534, 36922, 0, 0, 0, 8000, 0, 0, 0, 24000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(37534, 40505, 0, 0, 0, 5000, 0, 0, 0, 8000, 0, 0, 0, 0, 0, 0, 3, 0, 0),
(37534, 71369, 0, 0, 0, 4000, 0, 0, 0, 8000, 0, 0, 0, 0, 0, 0, 4, 0, 0);
-- Ice tomb
DELETE FROM `boss_spell_table` WHERE `entry` = 36980;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36980, 70157, 0, 0, 0, 2000, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 6, 0, 0);

-- Lich king
DELETE FROM `boss_spell_table` WHERE `entry` = 36597;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36597, 70541, 0, 0, 0, 6000, 0, 0, 0, 12000, 0, 0, 0, 60, 0, 0, 12, 0, 0),
(36597, 70337, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36597, 74074, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36597, 69409, 0, 0, 0, 10000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 3, 0, 0),
(36597, 72762, 0, 0, 0, 20000, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36597, 68980, 0, 0, 0, 1500, 0, 0, 0, 25000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36597, 68981, 0, 0, 0, 60000, 0, 0, 0, 60000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 72133, 0, 0, 0, 5000, 0, 0, 0, 10000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 72262, 0, 0, 0, 5000, 0, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 69201, 0, 0, 0, 5000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 1),
(36597, 69200, 0, 0, 0, 5000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 4, 0, 0),
(36597, 69242, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 69103, 0, 0, 0, 3000, 0, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 69099, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 69108, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 70358, 0, 0, 0, 40000, 0, 0, 0, 70000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 70372, 0, 0, 0, 40000, 0, 0, 0, 70000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 72149, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 72143, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 70503, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 69037, 0, 0, 0, 20000, 0, 0, 0, 40000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 36609, 0, 0, 0, 20000, 0, 0, 0, 40000, 0, 0, 0, 0, 0, 0, 9, 0, 0),
(36597, 71769, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 70063, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 1),
(36597, 47008, 0, 0, 0, 900000, 0, 0, 0, 900000, 0, 0, 0, 0, 0, 0, 1, 0, 0),
(36597, 74352, 0, 0, 0, 8000, 0, 0, 0, 15000, 0, 0, 0, 0, 0, 0, 1, 0, 0);
-- summons
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `timerMin_N10`, `timerMax_N10`,  `data1`, `data2`, `data3`, `data4`, `locData_x`, `locData_y`, `locData_z`, `CastType` ) VALUES
(36597, 37799, 60000, 60000, 8, 10, 10, 10, 15, 25, 0, 11),
(36597, 70498, 3600001, 3600001, 12, 12, 15, 15, 15, 25, 0, 1);
-- ice sphere
DELETE FROM `boss_spell_table` WHERE `entry` = 36633;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36633, 69099, 0, 0, 0, 2000, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 6, 0, 0),
(36633, 69108, 0, 0, 0, 2000, 0, 0, 0, 2000, 0, 0, 0, 0, 0, 0, 3, 0, 0),
(36633, 69090, 0, 0, 0, 8000, 0, 0, 0, 24000, 0, 0, 0, 0, 0, 0, 1, 0, 0);
-- vile spirit
DELETE FROM `boss_spell_table` WHERE `entry` = 37799;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(37799, 70503, 0, 0, 0, 10000, 0, 0, 0, 10000, 0, 0, 0, 0, 0, 0, 1, 0, 0);
-- raging spirit
DELETE FROM `boss_spell_table` WHERE `entry` = 36701;
INSERT INTO `boss_spell_table` (`entry`, `spellID_N10`, `spellID_N25`, `spellID_H10`, `spellID_H25`, `timerMin_N10`, `timerMin_N25`, `timerMin_H10`, `timerMin_H25`, `timerMax_N10`, `timerMax_N25`, `timerMax_H10`, `timerMax_H25`, `locData_x`, `locData_y`, `locData_z`, `CastType`, `isVisualEffect`, `isBugged`) VALUES
(36701, 69242, 0, 0, 0, 2000, 0, 0, 0, 5000, 0, 0, 0, 0, 0, 0, 3, 0, 0);

