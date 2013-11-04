-- add ai text for riggle
DELETE FROM `script_texts` WHERE `entry` IN (-1510356,-1510357,-1510358);
INSERT INTO `script_texts` (`entry`,`content_default`,`sound`,`type`,`language`,`emote`,`comment`) VALUES
(-1510356, 'Let the Fishing Tournament BEGIN!', 0, 6, 0, 0, 'riggle SAY_START'),
(-1510357, 'We have a winner! $N is the Master Angler!', 0, 6, 0, 0, 'riggle SAY_WINNER'),
(-1510358, 'And the Tastyfish have gone for the week! I will remain for another hour to allow you to turn in your fish!', 0, 6, 0, 0, 'riggle SAY_END');
