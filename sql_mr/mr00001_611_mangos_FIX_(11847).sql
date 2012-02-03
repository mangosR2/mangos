# Y2kCat
ALTER TABLE db_version_ytdb CHANGE COLUMN 610_FIX_11863 611_FIX_11847 bit;
REPLACE INTO `db_version_ytdb` (`version`) VALUES ('611_FIX_11847');

# FIX
UPDATE `creature_template` SET `minlevel`=83,`maxlevel`=83 WHERE entry IN (38008, 38641, 38773, 38774);
DELETE FROM `spell_area` WHERE `spell`=74276;
INSERT INTO `spell_area` (`spell`,`area`,`autocast`) VALUES (74276,4910,1);
UPDATE `quest_template` SET `RequiredRaces` = 0 WHERE `entry` = 12013;
UPDATE `quest_template` SET `RequiredRaces` = 0 WHERE `entry` = 12006;

# WDB
INSERT IGNORE INTO `npc_text` SET `ID`=15782,`prob0`=1,`text0_0`='<Blackhorn strains against his bonds, for the first time visibly upset.>$B$BRedemption! You act as if there''s an escape from the Burning Legion. So smug! As though your efforts a decade ago or in Outland have slowed the Legion a single iota! They will come, $r. They will return. And I will be here to welcome them.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=5,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=15933,`prob0`=1,`text0_0`='',`text0_1`='Greetings, $c.  I hope you find your accomodations suitable, even in this time of war.',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16095,`prob0`=1,`text0_0`='Goldrinn''s tenacity is the stuff of legend.$B$BWarriors from all walks visit this shrine in hopes of tapping into that kind of battle prowess. ',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16122,`prob0`=1,`text0_0`='The Earthwatchers won''t allow faction squabbling to jeopardize the Earthen Ring''s work here.
\

\
Those who break the peace will be dealt with... harshly.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=396,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16125,`prob0`=1,`text0_0`='The Wildhammers have always embraced shamanism, aye, but to find ourselves beneath the sea as part of the Earthen Ring?
\

\
It would''ve taken more than a few tankards for me to believe that one, a year ago.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=396,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16303,`prob0`=1,`text0_0`='Dere be nothin'' chaotic about dis attack. Da elementals and giants be organizin'' against us. It be seemin'' dat somehow we''ve earned da ire of Therazane, da Stonemother herself.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16348,`prob0`=1,`text0_0`='Among the Twilight cult are magics that threaten us greatly.$B$BWe have every desire to wipe their existence from our home.$B$BWe are divided, and so we cannot.$B$BAnd so I watch...$B$BAnd wait...',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16365,`prob0`=1,`text0_0`='Deepholm was a slow, quiet place. Always alive. Steadily moving. Never rushed. In this time, I strived to become one with the earth, and to a large degree, I succeeded.$B$BLater, the Earthwarder returned, injured. He did not upset the balance at first. He''d stayed here before, and we knew of him. The shift did not truly begin until the Twilight cult joined him.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16406,`prob0`=1,`text0_0`='',`text0_1`='There''s more to this than we know, $N.  I can guarantee you that much.',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16422,`prob0`=1,`text0_0`='We''ve come to try to help, but it seems that their favor for you does not yet extend to us.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16507,`prob0`=1,`text0_0`='We have to keep those fungal terrors off of the front. They''re too powerful!',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16508,`prob0`=1,`text0_0`='My father is close, I know it! We have to bust through their defenses and rescue him!',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16544,`prob0`=1,`text0_0`='',`text0_1`='We will defeat the Twilight''s Hammer wherever they may hide.  Not even the elemental planes will be a safe haven for their kind.',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16545,`prob0`=1,`text0_0`='When Deathwing destroyed the World Pillar, he broke open a rift between your world and ours. These spores and fungi are one consequence.$B$BLet''s see if we can deal with them together.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16552,`prob0`=1,`text0_0`='The prince has run off. This is bad!',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=5,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16566,`prob0`=1,`text0_0`='You have my undying gratitude and that of my people, $N.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16618,`prob0`=1,`text0_0`='You can always find a handful of hunters just outside Old Town''s east gate.',`text0_1`='You can always find a handful of hunters just outside Old Town''s east gate.',`lang0`=7,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16629,`prob0`=60,`text0_0`='Profession vendors can always be found near their respective trainers. Other sorts of vendors are scattered throughout Stormwind.$B$BWhat were you looking for?',`text0_1`='Profession vendors can always be found near their respective trainers. Other sorts of vendors are scattered throughout Stormwind.$B$BWhat were you looking for?',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16635,`prob0`=1,`text0_0`='You look exhausted. Is something wrong?',`text0_1`='You look exhausted. Is something wrong?',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=1,`text1_0`='Good to see you.',`text1_1`='Good to see you.',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=1,`text2_0`='Yes?',`text2_1`='Yes?',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=1,`text3_0`='Have you recovered the final piece?',`text3_1`='Have you recovered the final piece?',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=1,`text4_0`='Any luck with Therazane?',`text4_1`='Any luck with Therazane?',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=1,`text5_0`='You look intent. Is there something I can help with?',`text5_1`='You look intent. Is there something I can help with?',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=1,`text6_0`='Am I needed?',`text6_1`='Am I needed?',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=1,`text7_0`='And I thought I might get a bit of rest. Silly me.',`text7_1`='And I thought I might get a bit of rest. Silly me.',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16642,`prob0`=1,`text0_0`='<Anduin sizes you up.>$B$B$N, is it? A few of your triumphs have been the talk of the court.$B$BWhat was it like to serve in Northrend? Have you seen the World Tree? Are the stories about Vashj''ir true? I have so many questions!',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=6,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16651,`prob0`=1,`text0_0`='I trust you and my son are getting along? Anduin is anything but shy.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16653,`prob0`=1,`text0_0`='When Stormwind is secure, we will take this fight to the Highlands.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16659,`prob0`=1,`text0_0`='',`text0_1`='Hi. Welcome to my salon.$B$BYou look great! But if you''re in the mood for a change, speak with my barber, Jelinek, or just sit right down in one of the chairs.',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16669,`prob0`=1,`text0_0`='',`text0_1`='We''re trying to find out what''s so important up at the Masters'' Gate.$B$BI just know that those Hammer jerks are up to no good. No fair! We came all this way following a clue and now we can''t even get close.',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16671,`prob0`=1,`text0_0`='',`text0_1`='Call me Twin. That''s what Mowi calls me.$B$BNo, we don'' look alike. Are ye blind? She''s a gnome fer the Light''s sake! We act alike. ''specially when we''re fightin''.$B$BAs fer my name... have ya na heard o'' the storied Wildhammer Brewers? Care fer a pint?',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16672,`prob0`=1,`text0_0`='',`text0_1`='The Twilight''s Hammer has most certainly uncovered something of interest up at the Masters'' Gate.$B$BPerhaps a $g skilled : lovely; $c such as yourself would help me with that?',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16673,`prob0`=1,`text0_0`='As my lovely companion may have already enlightened you, we are in pursuit of something mysterious and powerful. All of our clues point to the Masters'' Gate.$B$BUnfortunately, the nihilistic cultists known as the Twilight''s Hammer have prevented our attempts to research the area. Surely a $c with your reputation can assist the Reliquary in its time of need?',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16682,`prob0`=1,`text0_0`='There you are, $N! I thought you''d forgotten about me.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16720,`prob0`=1,`text0_0`='Back so soon, $N? Did you learn anything from the dockworkers?',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=6,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16728,`prob0`=1,`text0_0`='',`text0_1`='Deathwing''s taint shall be wiped from Deepholm, and his Twilight cultists with it.',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16729,`prob0`=1,`text0_0`='I was in Ironforge during the takeover - it was chaos.$B$BNo wonder father gets so protective when I leave the keep. ',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16730,`prob0`=1,`text0_0`='We''ve got to get out of here!',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16731,`prob0`=1,`text0_0`='What WAS that thing?',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=6,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16766,`prob0`=1,`text0_0`='The fleet was mostly intact as it limped into harbor after our engagement with the Horde. We weighed anchor in the shadow of Highbank here to regroup.$B$BThen the naga came.$B$BScaly, glistening hands clambering up the anchor chains... dragging men, screaming, into the depths...$B$BThese are cursed shores, $N. Cursed. ',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16767,`prob0`=1,`text0_0`='Slaughter them, $c! Destroy as many naga as you can to honor those that fell.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=5,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16775,`prob0`=1,`text0_0`='',`text0_1`='Glad to have a chance to catch my breath. Thanks for the help!',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16830,`prob0`=1,`text0_0`='',`text0_1`='<The Stonemother stares down at you. Through you. As if she''s peering into your soul.>$B$BMy daughter, Theradras, sequestered herself deep within the Crystal Caverns of Terramok to grieve for her lost love, Zaetar. There, heartless, stoneless beings invaded and slaughtered her amidst her mourning.$B$BIf I had any reason to trust a creature afflicted by the curse of flesh, it was stripped from me that day. And yet in your arrogance, you persist.$B$BOne day, you will outlive your usefulness.',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16833,`prob0`=1,`text0_0`='',`text0_1`='How can I help ye, $c?',`lang0`=0,`em0_0`=0,`em0_1`=6,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16835,`prob0`=1,`text0_0`='Little of their camp has been left intact. Still, there might be something we can make use of.$B$BDid you require something of me, $r?',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16867,`prob0`=1,`text0_0`='This here terrain is terrible! Spongy ground, all lumpy-like with stumps and stones. Like angry oatmeal. The mud''ll practically swallow a steam tank whole.$B$BOur gear''s all mired in the muck, getting thumped by the Horde!',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=274,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16872,`prob0`=1,`text0_0`='She''s hung up in the debris and I''ve lost steam pressure. This terrain is murder!$B$BCan you get us out of this?',`text0_1`='She''s hung up in the debris and I''ve lost steam pressure. This terrain is murder!$B$BCan you get us out of this?',`lang0`=0,`em0_0`=0,`em0_1`=5,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16897,`prob0`=1,`text0_0`='My bird! Lightning - they shot her! Those filthy beasts shot her from the sky!',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=5,`em0_2`=0,`em0_3`=15,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16898,`prob0`=1,`text0_0`='Poor Lightning. She''s gonna need some time to recouperate.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=274,`em0_2`=0,`em0_3`=1,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16899,`prob0`=1,`text0_0`='Well then. Ready to fly?',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=6,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16903,`prob0`=1,`text0_0`='',`text0_1`='We have pledged to open an elemental gateway from Stormwind to the Highlands, but interference from the Bastion of Twilight hampers our efforts.$B$BWhat madness are they engaged in over there?',`lang0`=0,`em0_0`=0,`em0_1`=6,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16906,`prob0`=1,`text0_0`='',`text0_1`='The portal has been opened! Thanks to your efforts, we can now quickly travel from Stormwind to Twilight Highlands.',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16914,`prob0`=1,`text0_0`='You will own this peninsula, $c.$B$BYou will be a weapon.$B$BYou will be a minister of death, praying for war.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=5,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=16918,`prob0`=1,`text0_0`='Report!',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=25,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17098,`prob0`=1,`text0_0`='They took us unaware... attacked all of the highlands all at once, burstin'' forth from the ground, swoopin'' from the air. Most of the gryphon wings were scattered, and far too many good dwarves lost their lives.$B$BThere''d be little hope at all if Keegan hadn''t rallied us together. I owe that man my life. At least now we have a chance.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17099,`prob0`=1,`text0_0`='You''re certainly not local. Matters to me little though. I''ll put my life on the line for anyone here as long as they pull their weight.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17103,`prob0`=1,`text0_0`='The gryphon appears to be injured. Perhaps healing or first aid could get it back on its feet.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17104,`prob0`=1,`text0_0`='The gryphon looks at you intently, clearly smelling a familiar scent on your clothing.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17212,`prob0`=1,`text0_0`='Duglas send you over to get roughed up?',`text0_1`='Duglas send you over to get roughed up?',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=1,`text1_0`='Lookin'' to scrap?',`text1_1`='Lookin'' to scrap?',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=1,`text2_0`='You look like you want a piece of me...',`text2_1`='You look like you want a piece of me...',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=1,`text3_0`='Lookin'' for some punishment?',`text3_1`='Lookin'' for some punishment?',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17228,`prob0`=1,`text0_0`='This orc is severely injured.',`text0_1`='This orc is severely injured.',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17397,`prob0`=1,`text0_0`='Curse the Dragonmaw!$B$BThey kill our birds, attack our families, take our land. Even as the world crashes down around us, still they assault our homes.$B$BIf your Alliance wants the help of the Wildhammer, there''s only one way to win us over: Stop. The. Dragonmaw.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17398,`prob0`=1,`text0_0`='<Blundy peers up from his cups.>$B$BAye, that''s right. The High Shaman is out in the field, fighting to retake the Thundermar Wreckage. I''m whatcha call the "Low Shaman."$B$BWhile he''s away, he left me here, to take care of all of Thundermar''s Shamanin''in... nin.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=273,`em0_2`=0,`em0_3`=1,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17399,`prob0`=1,`text0_0`='',`text0_1`='Thundermar is the last holdout of the Wildhammer. My brother''s trying to keep up the fight while our little town fills up with refugees.',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=5,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17401,`prob0`=1,`text0_0`='Greetings, $c! I''m from the Highbank advance scouting unit, trying to win over the Wildhammer here at Thundermar.$B$BTheir gryphon riders are having a tough time bringing down Dragonmaw drake riders. I''ve got a plan for a contraption that will help, but I''m going to need supplies. Lots of supplies.$B$BCan you help?',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=25,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17407,`prob0`=1,`text0_0`='Eh, wot?',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=6,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17408,`prob0`=1,`text0_0`='Pack yer bags, $N! We''re off to the Twilight Highlands. You ready?',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=4,`em0_2`=0,`em0_3`=6,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17409,`prob0`=1,`text0_0`='I''ve been placed in command of Alliance joint operations in the Twilight Highlands.$B$BThe independant Wildhammer clans still dot this countryside. If we can unite them under the Alliance banner, nothing can stop us! But enemies close in on all sides. I hope you''re ready for a fight, $c.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=274,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17416,`prob0`=1,`text0_0`='I am thankful for all you''ve done, $N.  But I am afraid I will be even further in your debt before this ordeal is through.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17441,`prob0`=1,`text0_0`='Heads up, $N! They''re here. Dragonmaw ... everywhere!',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=5,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17443,`prob0`=1,`text0_0`='This is it! They''re making their final assault. There''s no place to run. We hold Thundermar or die with hammer in hand.$B$BFor the Wildhammer!!',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=5,`em0_2`=0,`em0_3`=15,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17446,`prob0`=1,`text0_0`='D''ye hear it, $N? The beating of great leathery wings over the treetops... Narkrall is closing in.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17662,`prob0`=1,`text0_0`='<The SI:7 agent is unconscious.>',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=17989,`prob0`=1,`text0_0`='Da Zandalari be a threat to both our peoples, $r. It will take da stength o'' both our forces to break them.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=18000,`prob0`=1,`text0_0`='',`text0_1`='I be an emissary from da Darkspear trolls.  Da threat we face, also be a threat to da Alliance.  You willin'' to help out da Darkspear, $r?',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=18001,`prob0`=1,`text0_0`='Ya have my tanks, $c. I thought I''d be endin'' up just another sacrifice...',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=18004,`prob0`=1,`text0_0`='',`text0_1`='This place be reekin'' of death and sacrifice.$b$bBest you leave before you become da next prisoner.
\
',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=18005,`prob0`=1,`text0_0`='',`text0_1`='It be good to be outta dat cage. Norkani will have her revenge...',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=18006,`prob0`=1,`text0_0`='',`text0_1`='Where am I? You be here to help?',`lang0`=0,`em0_0`=0,`em0_1`=21,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=18032,`prob0`=1,`text0_0`='Our assault on the Firelands cannot wait. We strike, at Ragnaros and at Fandral, as soon as we can.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=18130,`prob0`=1,`text0_0`='Yes, mortal?',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=18131,`prob0`=1,`text0_0`='Kalecgos has been chosen as the new aspect for the blue dragonflight.$b$bOne among you was instrumental in thwarting Arygos''s betrayal to Deathwing, thereby averting a terrible crisis.$b$bWe are here to partake in the celebration of their heroic deeds.',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=18150,`prob0`=1,`text0_0`='',`text0_1`='Welcome, $N. Have you come to join the invasion of the Firelands?',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=18151,`prob0`=1,`text0_0`='',`text0_1`='While we prepare to invade the Firelands, the Firelord sends his minions to repel our attack. Our position here cannot fall. We are all that stands between them and the World Tree.',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=18152,`prob0`=1,`text0_0`='',`text0_1`='We do not yet have the strength to push forward into the Firelands. First, we must rebuild our forces and supplies. Will you lend yourself to our efforts?',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=18154,`prob0`=1,`text0_0`='',`text0_1`='Are there any teeny tiny animals in need of my aid?$B$B<Mylune''s eyes glisten at the thought.>$B$BI need to hug a bunny right now!',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=18155,`prob0`=1,`text0_0`='',`text0_1`='How are the preparations going?',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=18158,`prob0`=1,`text0_0`='',`text0_1`='Hello, $N. Are you helping with the invasion? A skilled $c such as yourself will be a valuable addition to our force.',`lang0`=0,`em0_0`=0,`em0_1`=0,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO `npc_text` SET `ID`=18224,`prob0`=1,`text0_0`='Welcome to the Shady Lady, home of fine wines and exotic merchandise you won''t find anywhere else!',`text0_1`='',`lang0`=0,`em0_0`=0,`em0_1`=1,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
REPLACE INTO `npc_text` SET `ID`=9984,`prob0`=1,`text0_0`='What are ye doin'' here?! Get yer chatty self ta Alterac Vallery, where ye''re needed!',`text0_1`='',`lang0`=7,`em0_0`=1,`em0_1`=5,`em0_2`=0,`em0_3`=0,`em0_4`=0,`em0_5`=0,`prob1`=0,`text1_0`='',`text1_1`='',`lang1`=0,`em1_0`=0,`em1_1`=0,`em1_2`=0,`em1_3`=0,`em1_4`=0,`em1_5`=0,`prob2`=0,`text2_0`='',`text2_1`='',`lang2`=0,`em2_0`=0,`em2_1`=0,`em2_2`=0,`em2_3`=0,`em2_4`=0,`em2_5`=0,`prob3`=0,`text3_0`='',`text3_1`='',`lang3`=0,`em3_0`=0,`em3_1`=0,`em3_2`=0,`em3_3`=0,`em3_4`=0,`em3_5`=0,`prob4`=0,`text4_0`='',`text4_1`='',`lang4`=0,`em4_0`=0,`em4_1`=0,`em4_2`=0,`em4_3`=0,`em4_4`=0,`em4_5`=0,`prob5`=0,`text5_0`='',`text5_1`='',`lang5`=0,`em5_0`=0,`em5_1`=0,`em5_2`=0,`em5_3`=0,`em5_4`=0,`em5_5`=0,`prob6`=0,`text6_0`='',`text6_1`='',`lang6`=0,`em6_0`=0,`em6_1`=0,`em6_2`=0,`em6_3`=0,`em6_4`=0,`em6_5`=0,`prob7`=0,`text7_0`='',`text7_1`='',`lang7`=0,`em7_0`=0,`em7_1`=0,`em7_2`=0,`em7_3`=0,`em7_4`=0,`em7_5`=0;
INSERT IGNORE INTO page_text (entry, text, next_page) VALUES (3562, 'The tiny gnome peered over the railing into the secluded Dalaran courtyard.$B$B"The view from the balcony is amazing.  You have to come see!"$B$BArmor legplates creaked as Marcus walked over, taking in a deep breath as he absently scratched his scruffy chin.$B$B"The Hero\'s Welcome is no slouch.  And there\'s something in the room that might interest you."$B$BTavi bounded into the room, pausing only a moment before jumping onto the massive bed.  She turned to gaze at Marcus with her huge saucer-like eyes, narrowing them playfully and replacing her glowing smile with a diabolical grin.', 3563);
INSERT IGNORE INTO page_text (entry, text, next_page) VALUES (3563, '"Interested in some more company?" she purred as her hands weaved through a complex summoning ritual, stopping only when she felt the warmth of a new presence behind her.$B$BAll color drained from Marcus\'s face as he struggled to protest.  "I... I don\'t think that\'s appropriate."$B$BConfused, Tavi turned to see what was wrong.  A hideous fel hound stood ready, drooling onto the floor as it stared intently at the half-armored paladin.$B$B"No!  No that\'s not what I meant." she stammered as she dispelled the hungry demon.  "I\'m sorry, that\'s not really my specialization...."', 3564);
INSERT IGNORE INTO page_text (entry, text, next_page) VALUES (3564, 'Marcus took both her hands in one of his as he reassured her, "It\'s fine.  What is your specialization?"$B$BHer head snapped up, eyes burning with renewed life as shadowy energy channeled through her hands into Marcus, dropping him to his knees in agony.$B$B"Affliction, actually."$B', 3565);
INSERT IGNORE INTO page_text (entry, text, next_page) VALUES (3565, 'Gritting his teeth, Marcus gestured as light flashed over him, restoring his strength.$B$BTavi stared anxiously as he rose to his full height, engulfing her in his shadow.  He thrust his hand forward, sending a wave of righteous force through her.  Eyes rolled back as she wavered for several seconds before regaining consciousness.$B$B"I\'ve recently taken the path of... retribution."$B$BThe mischievous smirk returned to her face, "Well then, this is going to be fun."$B$B<The remaining pages have a level 99 requirement to read.>', 0);
INSERT IGNORE INTO page_text (entry, text, next_page) VALUES (3045, 'First Watch, Eight Bells$BWatches changed.  All is well.', 3046);
INSERT IGNORE INTO page_text (entry, text, next_page) VALUES (3046, 'Middle Watch, One Bell$BCedric found attempting to break into Captain\'s wine cabinet.  Disciplined.', 3047);
INSERT IGNORE INTO page_text (entry, text, next_page) VALUES (3047, 'Middle Watch, Two Bells$BCedric climbed rigging, became tangled and fell.  Attended by ship\'s surgeon.  Sent below to sober up.', 3049);
INSERT IGNORE INTO page_text (entry, text, next_page) VALUES (3049, 'Middle Watch, Four Bells$BBottle of rum found in Cedric\'s pants.  Disciplined.', 3050);
INSERT IGNORE INTO page_text (entry, text, next_page) VALUES (3050, 'Middle Watch, Five Bells$BCedric\'s clothes found.  Cedric found separately.  Cedric disciplined.', 3051);
INSERT IGNORE INTO page_text (entry, text, next_page) VALUES (3051, 'Middle Watch, Six Bells$BCedric singing loudly.  Woke Captain.  Cedric disciplined by Captain.', 3052);
INSERT IGNORE INTO page_text (entry, text, next_page) VALUES (3052, 'Middle Watch, Eight Bells$BWatches changed.  All quiet.  Two men sent to locate Cedric.$B', 3053);
INSERT IGNORE INTO page_text (entry, text, next_page) VALUES (3053, 'Morning Watch, One Bell$BFire in Captain\'s quarters.  All hands roused.  Throwing powder overboard. ', 0);
INSERT IGNORE INTO page_text (entry, text, next_page) VALUES (3036, 'The mighty creature\'s maw opened wide, tossing bolts of icy water toward our vessel. Those terrible jaws clamped down upon the bow of our ship, tearing it from the hull. Sailors and cargo were thrown violently into the sea as the remnants of the ship disappeared beneath the waves.$B$BThe last thing I remember was flying from the broken hull, hitting the inky waters, and plunging beneath the waves. The world went dark and I thought for certain I\'d drawn my last breath. When I awoke in Theramore\'s infirmary, I knew someone had to tell our story.', 0);

# NeatElves
DELETE FROM `creature_loot_template` WHERE `entry` = 32447 AND `item` = 37705;
DELETE FROM `creature_loot_template` WHERE `entry` = 32495 AND `item` = 37701;
DELETE FROM `creature_loot_template` WHERE `entry` = 32517 AND `item` = 44687;
DELETE FROM `creature_loot_template` WHERE `entry` = 32398 AND `item` = 37701;
DELETE FROM `creature_loot_template` WHERE `entry` = 32398 AND `item` = 37704;
DELETE FROM `creature_loot_template` WHERE `entry` = 32400 AND `item` = 42104;
DELETE FROM `creature_loot_template` WHERE `entry` = 32422 AND `item` = 37705;
DELETE FROM `creature_loot_template` WHERE `entry` = 32487 AND `item` = 33470;
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(32361, 44128, 1, 1, 1, 1, 0, 0, 0);
DELETE FROM `skinning_loot_template` WHERE `item` = 36902;
DELETE FROM `skinning_loot_template` WHERE `entry` in (26782,27254,30329,23874,25707,25709,26333,26417,26421,26792,28323,29036,30258,30845,30861,31229,33354,33431,34300,33430,32913,32914,32915,33525,32357);
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES 
(26782, 33452, 100, 0, -33452, 1, 0, 0, 0),
(27254, 33452, 100, 0, -33452, 1, 0, 0, 0),
(30329, 33452, 100, 0, -33452, 1, 0, 0, 0),
(23874, 33452, 100, 0, -33452, 1, 0, 0, 0),
(25707, 33452, 100, 0, -33452, 1, 0, 0, 0),
(25709, 33452, 100, 0, -33452, 1, 0, 0, 0),
(26333, 33452, 100, 0, -33452, 1, 0, 0, 0),
(26417, 33452, 100, 0, -33452, 1, 0, 0, 0),
(26421, 33452, 100, 0, -33452, 1, 0, 0, 0),
(26792, 33452, 100, 0, -33452, 1, 0, 0, 0),
(28323, 33452, 100, 0, -33452, 1, 0, 0, 0),
(29036, 33452, 100, 0, -33452, 1, 0, 0, 0),
(30258, 33452, 100, 0, -33452, 1, 0, 0, 0),
(30845, 33452, 100, 0, -33452, 1, 0, 0, 0),
(30861, 33452, 100, 0, -33452, 1, 0, 0, 0),
(31229, 33452, 100, 0, -33452, 1, 0, 0, 0),
(33354, 33452, 100, 0, -33452, 1, 0, 0, 0),
(33431, 33452, 100, 0, -33452, 1, 0, 0, 0),
(34300, 33452, 100, 0, -33452, 1, 0, 0, 0),
(33430, 33452, 100, 0, -33452, 1, 0, 0, 0),
(32913, 33452, 100, 0, -33452, 1, 0, 0, 0),
(32914, 33452, 100, 0, -33452, 1, 0, 0, 0),
(32915, 33452, 100, 0, -33452, 1, 0, 0, 0),
(33525, 33452, 100, 0, -33452, 1, 0, 0, 0),
(32357, 33452, 100, 0, -33452, 1, 0, 0, 0);
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(33452, 33452, 30, 1, 1, 5, 0, 0, 0),
(33452, 36901, 10, 1, 1, 5, 0, 0, 0),
(33452, 36904, 0, 1, 1, 5, 0, 0, 0),
(33452, 36903, 0, 1, 1, 5, 0, 0, 0),
(33452, 36905, 0, 1, 1, 5, 0, 0, 0),
(33452, 36906, 0, 1, 1, 5, 0, 0, 0),
(33452, 36907, 0, 1, 1, 5, 0, 0, 0),
(33452, 37704, 0, 1, 1, 5, 0, 0, 0),
(33452, 39516, 40, 1, 1, 5, 0, 0, 0);
DELETE FROM `creature_loot_template` WHERE `item` = 29453;
UPDATE `creature_template` SET `type_flags` = '256' WHERE `entry` =20983;
DELETE FROM `skinning_loot_template` WHERE `entry` in (17723,17725,17734,17770,17871,17977,18124,18125,18127,19402,19519,19734,20774,21023,21040,21251,21325,21326,21694,22095,22307,23029,20983);
REPLACE INTO `skinning_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES 
(23029, 22575, 100, 0, -22575, 1, 0, 0, 0),
(22307, 22575, 100, 0, -22575, 1, 0, 0, 0),
(20983, 22575, 100, 0, -22575, 1, 0, 0, 0),
(22095, 22575, 100, 0, -22575, 1, 0, 0, 0),
(21694, 22575, 100, 0, -22575, 1, 0, 0, 0),
(21326, 22575, 100, 0, -22575, 1, 0, 0, 0),
(21325, 22575, 100, 0, -22575, 1, 0, 0, 0),
(21251, 22575, 100, 0, -22575, 1, 0, 0, 0),
(21040, 22575, 100, 0, -22575, 1, 0, 0, 0),
(21023, 22575, 100, 0, -22575, 1, 0, 0, 0),
(20774, 22575, 100, 0, -22575, 1, 0, 0, 0),
(19734, 22575, 100, 0, -22575, 1, 0, 0, 0),
(19519, 22575, 100, 0, -22575, 1, 0, 0, 0),
(19402, 22575, 100, 0, -22575, 1, 0, 0, 0),
(18127, 22575, 100, 0, -22575, 1, 0, 0, 0),
(18125, 22575, 100, 0, -22575, 1, 0, 0, 0),
(18124, 22575, 100, 0, -22575, 1, 0, 0, 0),
(17977, 22575, 100, 0, -22575, 1, 0, 0, 0),
(17871, 22575, 100, 0, -22575, 1, 0, 0, 0),
(17770, 22575, 100, 0, -22575, 1, 0, 0, 0),
(17734, 22575, 100, 0, -22575, 1, 0, 0, 0),
(17725, 22575, 100, 0, -22575, 1, 0, 0, 0),
(17723, 22575, 100, 0, -22575, 1, 0, 0, 0);
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(22575, 29453, 20, 1, 1, 5, 0, 0, 0),
(22575, 24401, 25, 1, 1, 1, 0, 0, 0),
(22575, 25813, 15, 1, 1, 5, 0, 0, 0),
(22575, 22785, 0, 1, 1, 5, 0, 0, 0),
(22575, 22787, 0, 1, 1, 5, 0, 0, 0),
(22575, 22786, 0, 1, 1, 5, 0, 0, 0),
(22575, 22575, 10, 1, 1, 5, 0, 0, 0),
(22575, 22789, 0, 1, 1, 5, 0, 0, 0),
(22575, 22790, 0, 1, 1, 5, 0, 0, 0),
(22575, 22794, 1, 1, 1, 5, 0, 0, 0);
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '15',`groupid` = '1' WHERE `entry` =181278 AND `item` =22575;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '0',`groupid` = '1' WHERE `entry` =181278 AND `item` =22790;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '5',`groupid` = '1' WHERE `entry` =181278 AND `item` =22794;
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '5' WHERE `entry` =24402 AND `item` =24407;
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14145', '18', 'Mature Spore Sac');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('182069', '14145', '0', '');
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14146', '50', 'Glowcap');
REPLACE INTO `pool_gameobject_template` (`id`, `pool_entry`, `chance`, `description`) VALUES ('182053', '14146', '0', '');
DELETE FROM `creature_loot_template` WHERE `entry` = 22095 AND `item` = 24401;
DELETE FROM `creature_loot_template` WHERE `entry` = 17725 AND `item` = 24401;
DELETE FROM `creature_loot_template` WHERE `entry` = 17871 AND `item` = 24401;
DELETE FROM `creature_loot_template` WHERE `entry` = 21694 AND `item` = 24401;
DELETE FROM `creature_loot_template` WHERE `entry` = 17723 AND `item` = 24401;
DELETE FROM `creature_loot_template` WHERE `entry` = 21251 AND `item` = 24401;
DELETE FROM `creature_loot_template` WHERE `entry` = 21325 AND `item` = 24401;
DELETE FROM `creature_loot_template` WHERE `entry` = 20774 AND `item` = 24401;
DELETE FROM `creature_loot_template` WHERE `entry` = 21326 AND `item` = 24401;
DELETE FROM `creature_loot_template` WHERE `entry` = 21023 AND `item` = 24401;
DELETE FROM `creature_loot_template` WHERE `entry` = 22307 AND `item` = 24401;
DELETE FROM `creature_loot_template` WHERE `entry` = 18127 AND `item` = 24401;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '25' WHERE `entry` =181275 AND `item` =24401;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '25' WHERE `item` =24401;
DELETE FROM `creature_loot_template` WHERE `item` = 25813;
DELETE FROM `pickpocketing_loot_template` WHERE `item` = 24231;
DELETE FROM `creature_loot_template` WHERE `item` = 24477;
DELETE FROM `creature_loot_template` WHERE `item` = 22575 AND `entry` in (17723,17725,17734,17770,17871,17977,18124,18125,18127,19402,19519,19734,20774,21023,21040,21251,21325,21326,21694,22095,22307,23029,20983);
UPDATE `creature` SET `phaseMask` = '128' WHERE `id` =31434;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =5761;
UPDATE quest_template SET SpecialFlags=2 WHERE entry=5727;
DELETE FROM gossip_menu_option WHERE menu_id=3701 AND id=2;
DELETE FROM gossip_menu_option WHERE menu_id IN (50010, 50011, 50012);
INSERT INTO gossip_menu_option (menu_id, id, option_text, option_id, npc_option_npcflag, action_menu_id, action_script_id, cond_1, cond_1_val_1, cond_1_val_2) VALUES
(3701,  2, 'You may speak frankly, Neeru...', 1, 1, 50010, 0, 9, 5727, 1),
(50010, 1, 'It is good to see the Burning Blade is taking over where the Shadow Council once failed.', 1, 1, 50011, 0, 0, 0, 0),
(50011, 1, 'So the Searing Blade is expendable?', 1, 1, 50012, 0, 0, 0, 0),
(50012, 1, 'Is there anything you would have of me? ', 1, 1, 50013, 27, 0, 0, 0);
DELETE FROM gossip_menu WHERE entry IN (50010,50011,50012,50013);
INSERT INTO gossip_menu (entry, text_id, cond_1, cond_1_val_1, cond_1_val_2, cond_2, cond_2_val_1, cond_2_val_2) VALUES
(50010, 4533, 0, 0, 0, 0, 0, 0),
(50011, 4534, 0, 0, 0, 0, 0, 0),
(50012, 4535, 0, 0, 0, 0, 0, 0),
(50013, 4536, 0, 0, 0, 0, 0, 0);
DELETE FROM gossip_scripts WHERE id=27;
INSERT INTO gossip_scripts (id, delay, command, datalong, datalong2, comments) VALUES
(27, 3, 7, 5727, 10, 'Quest: Hidden Enemies (2)');
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '5',`maxcount` = '1' WHERE `item` =4232;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '50' WHERE `entry` =3674 AND `item` =4232;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '5',`maxcount` = '1' WHERE `item` =6471;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '10',`maxcount` = '1' WHERE `item` =6470;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '40' WHERE `ChanceOrQuestChance` > 0 AND `item` =2318;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '30' WHERE `ChanceOrQuestChance` > 0 AND `item` =2934;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '50',`maxcount` = '2' WHERE `item` =8167;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '5',`maxcount` = '2' WHERE `item` =4235;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '100' WHERE `entry` =4422 AND `item` =4235;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '5' WHERE `item` =8169;
UPDATE creature_loot_template SET ChanceOrQuestChance=1 WHERE item=18335;
UPDATE gameobject_loot_template SET ChanceOrQuestChance=1 WHERE item=18335;
UPDATE `gameobject_questrelation` SET `quest` = '13436' WHERE `id` =194059;
UPDATE `gameobject_involvedrelation` SET `quest` = '13436' WHERE `id` =194059;
UPDATE `quest_template` SET `RequiredRaces` = '1101' WHERE `entry` =13436;
UPDATE `gameobject_questrelation` SET `quest` = '13438' WHERE `id` =194061;
UPDATE `gameobject_involvedrelation` SET `quest` = '13438' WHERE `id` =194061;
UPDATE `quest_template` SET `RequiredRaces` = '1101' WHERE `entry` =13438;
UPDATE `gameobject_questrelation` SET `quest` = '13439' WHERE `id` =194062;
UPDATE `gameobject_involvedrelation` SET `quest` = '13439' WHERE `id` =194062;
UPDATE `quest_template` SET `RequiredRaces` = '1101' WHERE `entry` =13439;
UPDATE `gameobject_questrelation` SET `quest` = '12944' WHERE `id` =191882;
UPDATE `gameobject_involvedrelation` SET `quest` = '12944' WHERE `id` =191882;
UPDATE `quest_template` SET `RequiredRaces` = '1101' WHERE `entry` =12944;
UPDATE `quest_template` SET `RequiredRaces` = '1101' WHERE `entry` =13434;
UPDATE `quest_template` SET `RequiredRaces` = '1101' WHERE `entry` =13433;
UPDATE `quest_template` SET `RequiredRaces` = '1101' WHERE `entry` =13435;
UPDATE `gameobject_questrelation` SET `quest` = '12945' WHERE `id` =191883;
UPDATE `gameobject_involvedrelation` SET `quest` = '12945' WHERE `id` =191883;
UPDATE `quest_template` SET `RequiredRaces` = '1101' WHERE `entry` =12945;
UPDATE `gameobject_questrelation` SET `quest` = '13437' WHERE `id` =194060;
UPDATE `gameobject_involvedrelation` SET `quest` = '13437' WHERE `id` =194060;
UPDATE `quest_template` SET `RequiredRaces` = '1101' WHERE `entry` =13437;
UPDATE `gameobject_questrelation` SET `quest` = '13448' WHERE `id` =194063;
UPDATE `gameobject_involvedrelation` SET `quest` = '13448' WHERE `id` =194063;
UPDATE `quest_template` SET `RequiredRaces` = '1101' WHERE `entry` =13448;
UPDATE `gameobject_questrelation` SET `quest` = '12946' WHERE `id` =191880;
UPDATE `gameobject_involvedrelation` SET `quest` = '12946' WHERE `id` =191880;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =12946;
UPDATE `gameobject_questrelation` SET `quest` = '12947' WHERE `id` =191881;
UPDATE `gameobject_involvedrelation` SET `quest` = '12947' WHERE `id` =191881;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =12947;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =13464;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =13465;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =13466;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =13467;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =13468;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =13469;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =13470;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =13471;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =13501;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =13548;
UPDATE `gameobject_template` SET `data1` = '180164' WHERE `entry` =180164;
UPDATE `gameobject_template` SET `data1` = '180165' WHERE `entry` =180165;
UPDATE `gameobject_template` SET `data1` = '180166' WHERE `entry` =180166;
UPDATE `gameobject_template` SET `data1` = '180167' WHERE `entry` =180167;
UPDATE `gameobject_template` SET `data1` = '180168' WHERE `entry` =180168;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(180165, 8831, 100, 0, 1, 3, 0, 0, 0),
(180165, 19726, 15, 0, 1, 3, 2, 19727, 1),
(180164, 8838, 100, 0, 1, 3, 0, 0, 0),
(180164, 19726, 15, 0, 1, 3, 2, 19727, 1),
(180167, 13464, 100, 0, 1, 3, 0, 0, 0),
(180167, 19726, 15, 0, 1, 3, 2, 19727, 1),
(180168, 13463, 100, 0, 1, 3, 0, 0, 0),
(180168, 19726, 15, 0, 1, 3, 2, 19727, 1),
(180166, 13465, 100, 0, 1, 3, 0, 0, 0),
(180166, 19726, 15, 0, 1, 3, 2, 19727, 1);
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(7007, 180164, 309, 1, 1, -12347.2, -1845.5, 131.012, -2.93215, 0, 0, -0.994522, 0.10453, 2700, 100, 1),
(7009, 180164, 309, 1, 1, -11597.3, -1752.79, 39.3294, -0.785398, 0, 0, -0.382683, 0.92388, 2700, 100, 1),
(7010, 180165, 309, 1, 1, -11874.8, -1382.4, 68.2662, -1.01229, 0, 0, -0.484809, 0.87462, 2700, 100, 1),
(7016, 180165, 309, 1, 1, -12334.5, -1899.65, 131.243, -3.00197, 0, 0, -0.997564, 0.0697546, 2700, 100, 1),
(7017, 180165, 309, 1, 1, -11969.4, -1825.95, 56.2139, 2.16421, 0, 0, 0.882948, 0.469471, 2700, 100, 1),
(7018, 180166, 309, 1, 1, -11595.3, -1218.19, 81.0125, -0.820305, 0, 0, -0.398749, 0.91706, 2700, 100, 1),
(7019, 180166, 309, 1, 1, -12264.7, -1869.38, 133.452, 1.29154, 0, 0, 0.601814, 0.798637, 2700, 100, 1),
(7021, 180166, 309, 1, 1, -11733.9, -1945.6, 58.6811, -2.82743, 0, 0, -0.987688, 0.156436, 2700, 100, 1),
(7027, 180166, 309, 1, 1, -12225.9, -1419.93, 131.392, -1.25664, 0, 0, -0.587786, 0.809016, 2700, 100, 1),
(7029, 180167, 309, 1, 1, -12223.5, -1416.27, 131.545, 2.93215, 0, 0, 0.994522, 0.10453, 2700, 100, 1),
(7030, 180167, 309, 1, 1, -11834.8, -1326.26, 67.5547, -2.63545, 0, 0, -0.968148, 0.250379, 2700, 100, 1),
(7031, 180167, 309, 1, 1, -12298.4, -1684.08, 132.492, 1.44862, 0, 0, 0.662619, 0.748957, 2700, 100, 1),
(7034, 180167, 309, 1, 1, -11585.2, -1573.6, 50.7598, 1.16937, 0, 0, 0.551937, 0.833886, 2700, 100, 1),
(7038, 180167, 309, 1, 1, -11988.1, -1825.93, 58.5294, -1.81514, 0, 0, -0.78801, 0.615662, 2700, 100, 1),
(7039, 180168, 309, 1, 1, -11821, -1892.17, 49.6586, 0.977384, 0, 0, 0.469471, 0.882948, 2700, 100, 1),
(7040, 180168, 309, 1, 1, -11456.6, -1606.96, 49.1958, 2.02458, 0, 0, 0.848048, 0.52992, 2700, 100, 1),
(7041, 180168, 309, 1, 1, -12185.9, -1901.98, 133.235, 0.820305, 0, 0, 0.398749, 0.91706, 2700, 100, 1),
(7042, 180168, 309, 1, 1, -11608.9, -1274.07, 79.271, 0.017453, 0, 0, 0.00872639, 0.999962, 2700, 100, 1),
(7043, 180168, 309, 1, 1, -11986.2, -1475.36, 79.6971, -3.00197, 0, 0, -0.997564, 0.0697546, 2700, 100, 1);
UPDATE `gameobject_loot_template` SET `maxcount` = '3' WHERE `item` =11514;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '20' WHERE `entry` =180228 AND `item` =14047;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '25' WHERE `entry` =180228 AND `item` =19727;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '20' WHERE `entry` =180229 AND `item` =14047;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '25' WHERE `entry` =180229 AND `item` =19727;
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(65588, 180228, 309, 1, 1, -11556, -1725.95, 39.7283, 0.942478, 0, 0, 0.453991, 0.891006, 7200, 100, 1),
(65591, 180228, 309, 1, 1, -11542.7, -1544.95, 51.7792, -0.785398, 0, 0, -0.382683, 0.92388, 7200, 100, 1),
(65589, 180228, 309, 1, 1, -12358.3, -1939.73, 132.353, 0.10472, 0, 0, 0.0523361, 0.99863, 7200, 100, 1),
(65590, 180228, 309, 1, 1, -12155.9, -1960.37, 133.111, -2.63545, 0, 0, -0.968148, 0.250379, 7200, 100, 1),
(65592, 180228, 309, 1, 1, -12376.2, -1661.07, 132.864, 1.43117, 0, 0, 0.656059, 0.75471, 7200, 100, 1),
(7045, 180228, 309, 1, 1, -12382.4, -1919.37, 131.553, -2.84489, 0, 0, -0.989016, 0.147808, 7200, 100, 1),
(7046, 180228, 309, 1, 1, -11518.2, -1693.06, 52.485, 1.02974, 0, 0, 0.492422, 0.870357, 7200, 100, 1);
REPLACE INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(70941, 180229, 309, 1, 1, -12357.9, -1836.31, 130.865, 0.453786, 0, 0, 0.224951, 0.97437, 3600, 100, 1),
(70938, 180229, 309, 1, 1, -11974.8, -1474.54, 79.9835, 2.93215, 0, 0, 0.994522, 0.10453, 3600, 100, 1),
(70631, 180229, 309, 1, 1, -11810.1, -1882.4, 46.0745, -2.44346, 0, 0, -0.939692, 0.342021, 3600, 100, 1),
(70628, 180229, 309, 1, 1, -11781.9, -1621.91, 21.149, -3.12414, 0, 0, -0.999962, 0.0087262, 3600, 100, 1),
(70510, 180229, 309, 1, 1, -11742.3, -1930.5, 56.9127, 1.62316, 0, 0, 0.725376, 0.688353, 3600, 100, 1),
(70945, 180229, 309, 1, 1, -11638.4, -1882.91, 57.3159, -2.42601, 0, 0, -0.936673, 0.350206, 3600, 100, 1),
(70644, 180229, 309, 1, 1, -11594.7, -1216.66, 81.3685, 0.331613, 0, 0, 0.165048, 0.986286, 3600, 100, 1),
(70955, 180229, 309, 1, 1, -11539.9, -1247.64, 78.5177, 3.00197, 0, 0, 0.997564, 0.0697546, 3600, 100, 1),
(7048, 180229, 309, 1, 1, -11526.3, -1479.74, 78.0266, -1.15192, 0, 0, -0.54464, 0.83867, 3600, 100, 1),
(7049, 180229, 309, 1, 1, -11452.9, -1613.94, 49.0348, 2.53073, 0, 0, 0.953717, 0.300705, 3600, 100, 1);
UPDATE `gossip_menu_option` SET `cond_1` = '9',`cond_1_val_1` = '3441',`cond_1_val_2` = '1' WHERE `menu_id` =1323 AND `id` =0;
UPDATE `gossip_menu_option` SET `action_script_id` = '1321' WHERE `menu_id` =1321 AND `id` =0;
DELETE FROM gossip_scripts WHERE id=1321;
INSERT INTO gossip_scripts (id, delay, command, datalong, comments) VALUES (1321, 0, 7, 3441, 'quest 3441 complete of npc 8479');
UPDATE `quest_template` SET `SpecialFlags` = '2' WHERE `entry` =3441;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =91630;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =91634;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =91636;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =91643;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =91654;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =91675;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =91718;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =91722;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =91727;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =91730;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =4816;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =13224;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =12726;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =6948;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =91752;
UPDATE `gameobject` SET `id` = '176638' WHERE `guid` =91756;
REPLACE INTO `pool_template` (`entry`, `max_limit`, `description`) VALUES ('14147', '1', 'GO 176638');
REPLACE INTO `pool_gameobject` (`guid`, `pool_entry`, `chance`, `description`) VALUES (42989, 14147, 0, ''),(43012, 14147, 0, ''),(43015, 14147, 0, '');
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('176638', '11514', '20', '0', '1', '3', '2', '11511', '1');
#
UPDATE `gameobject_loot_template` SET `entry` = '176640' WHERE `entry` =176586 AND `item` =11514;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91669;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =10504;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91626;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91629;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91638;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =43006;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91641;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =42981;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91652;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91662;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91659;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91657;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91697;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91695;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =42983;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91698;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91685;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91687;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =43009;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91708;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91759;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91676;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =91680;
UPDATE `gameobject` SET `id` = '176640' WHERE `guid` =42993;
#
DELETE FROM `gameobject_loot_template` WHERE `entry` = 142145 AND `item` = 11514;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91716;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91706;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91704;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91696;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91693;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91691;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91690;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91679;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91670;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91728;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91717;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91711;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91699;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91624;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91627;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91637;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91639;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91644;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =43016;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =2144;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =43004;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91655;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91660;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =42995;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91650;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =43007;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =7252;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =7255;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =14431;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =43008;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91760;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =13214;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91757;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =42997;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91751;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91743;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91749;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91721;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91739;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91734;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =91732;
UPDATE `gameobject` SET `id` = '176637' WHERE `guid` =43027;
#
DELETE FROM `gameobject_loot_template` WHERE `entry` = 142141 AND `item` = 11514;
UPDATE `gameobject` SET `id` = '176642' WHERE `id` =142141 AND `map` =1;
#
UPDATE `gameobject_loot_template` SET `entry` = '176639' WHERE `entry` =176584 AND `item` =11514;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =42994;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91705;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =43026;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =809;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91762;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91714;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =43011;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91754;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =42991;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91745;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91741;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91733;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91740;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91731;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91719;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91720;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =13583;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91702;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =42986;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =14144;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91682;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91692;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =43005;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91649;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91653;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =8371;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91678;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91635;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =4145;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91666;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91633;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91628;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =4165;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =43023;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91642;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =91663;
UPDATE `gameobject` SET `id` = '176639' WHERE `guid` =10794;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 142142 AND `item` = 11514;
UPDATE `gameobject` SET `id` = '176636' WHERE `guid` =91684;
UPDATE `gameobject` SET `id` = '176636' WHERE `guid` =91681;
UPDATE `gameobject` SET `id` = '176636' WHERE `guid` =150;
UPDATE `gameobject` SET `id` = '176636' WHERE `guid` =91672;
UPDATE `gameobject` SET `id` = '176636' WHERE `guid` =91658;
UPDATE `gameobject` SET `id` = '176636' WHERE `guid` =91648;
UPDATE `gameobject` SET `id` = '176636' WHERE `guid` =42992;
UPDATE `gameobject` SET `id` = '176636' WHERE `guid` =91631;
UPDATE `gameobject` SET `id` = '176636' WHERE `guid` =43019;
UPDATE `gameobject` SET `id` = '176636' WHERE `guid` =91710;
UPDATE `gameobject` SET `id` = '176636' WHERE `guid` =91744;
UPDATE `gameobject` SET `id` = '176636' WHERE `guid` =91736;
UPDATE `gameobject` SET `id` = '176636' WHERE `guid` =91725;
UPDATE `gameobject` SET `id` = '176636' WHERE `guid` =43017;
#
DELETE FROM `gameobject_loot_template` WHERE `entry` = 176587 AND `item` = 11514;
UPDATE `gameobject` SET `id` = '176641' WHERE `id` =176587 AND `map` =1;
#
DELETE FROM `creature_loot_template` WHERE `item` = 12924;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 2047 AND `item` = 11513;
UPDATE `gameobject_template` SET `data1` = '181108' WHERE `entry` =181108;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(181108, 7909, 1, 0, -7909, 1, 0, 0, 0),
(181108, 11513, 20, 0, 1, 3, 2, 11511, 1),
(181108, 7911, 100, 0, 1, 4, 0, 0, 0);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1734 AND `item` = 1705;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1734 AND `item` = 3864;
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('7909', '1705', '0', '1', '1', '1', '0', '0', '0');
UPDATE `gameobject_loot_template` SET `item` = '7909',`ChanceOrQuestChance` = '1',`mincountOrRef` = '-7909' WHERE `entry` =1734 AND `item` =1529;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1734 AND `item` = 11513;
UPDATE `gameobject_template` SET `data1` = '181109' WHERE `entry` =181109;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(181109, 2776, 100, 0, 1, 4, 0, 0, 0),
(181109, 7909, 1, 0, -7909, 1, 0, 0, 0),
(181109, 11513, 20, 0, 1, 3, 2, 11511, 1);
UPDATE `gameobject_loot_template` SET `entry` = '176643',`maxcount` = '3' WHERE `entry` =324 AND `item` =11513;
UPDATE `gameobject_loot_template` SET `entry` = '176645',`maxcount` = '3' WHERE `entry` =2040 AND `item` =11513;
UPDATE `gameobject_template` SET `data1` = '181249' WHERE `gameobject_template`.`entry` =181249;
UPDATE `gameobject_template` SET `data1` = '2054' WHERE `gameobject_template`.`entry` =2054;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(2054, 774, 1, 0, -774, 1, 0, 0, 0),
(2054, 2771, 100, 0, 1, 4, 0, 0, 0),
(2054, 2836, 25, 0, 1, 4, 0, 0, 0),
(2054, 2798, -50, 0, 1, 4, 0, 0, 0);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1732;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(1732, 774, 1, 0, -774, 1, 0, 0, 0),
(1732, 2771, 100, 0, 1, 4, 0, 0, 0),
(1732, 2836, 25, 0, 1, 4, 0, 0, 0);
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(181249, 774, 1, 0, -774, 1, 0, 0, 0),
(181249, 2771, 100, 0, 1, 4, 0, 0, 0),
(181249, 2836, 25, 0, 1, 4, 0, 0, 0),
(181249, 11513, 20, 0, 1, 3, 2, 11511, 1);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1731 AND `item` = 774;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1731 AND `item` = 1210;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 1731 AND `item` = 5075;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '1',`mincountOrRef` = '-818' WHERE `entry` =1731 AND `item` =818;
DELETE FROM `gameobject_loot_template` WHERE `entry` = 2055;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(2055, 818, 1, 0, -818, 1, 0, 0, 0),
(2055, 2770, 100, 0, 1, 4, 0, 0, 0),
(2055, 2835, 25, 0, 1, 4, 0, 0, 0),
(2055, 2798, -50, 0, 1, 4, 0, 0, 0);
DELETE FROM `gameobject_loot_template` WHERE `entry` = 103711;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(103711, 774, 1, 0, -774, 1, 0, 0, 0),
(103711, 2771, 100, 0, 1, 4, 0, 0, 0),
(103711, 2836, 25, 0, 1, 4, 0, 0, 0);
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(774, 1206, 0, 1, 1, 1, 0, 0, 0),
(774, 1705, 0, 1, 1, 1, 0, 0, 0),
(774, 1210, 0, 1, 1, 1, 0, 0, 0),
(774, 1529, 0, 1, 1, 1, 0, 0, 0),
(774, 774, 0, 1, 1, 1, 0, 0, 0);
REPLACE INTO `reference_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES
(818, 5075, 0, 1, 1, 1, 0, 0, 0),
(818, 1210, 0, 1, 1, 1, 0, 0, 0),
(818, 818, 0, 1, 1, 1, 0, 0, 0),
(818, 774, 0, 1, 1, 1, 0, 0, 0);
DELETE FROM `creature_loot_template` WHERE `entry` = 446 AND `item` = 2798;
DELETE FROM `creature_loot_template` WHERE `entry` = 445 AND `item` = 2798;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '-50' WHERE `entry` =580 AND `item` =2798;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '25' WHERE `entry` =176645 AND `item` =7912;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '25',`maxcount` = '4' WHERE `entry` =2040 AND `item` =7912;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '25',`maxcount` = '4' WHERE `entry` =123310 AND `item` =7912;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '-50' WHERE `item` =22634;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =5377;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =24166;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =1350;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =13203;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =48005;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =11417;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =19017;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =48027;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =6371;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =16325;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =13202;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =14353;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =14383;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =7960;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =9779;
UPDATE `gameobject` SET `id` = '2055' WHERE `guid` =24137;
#
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =19020;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =11418;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =14351;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =11403;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =19016;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =11401;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =6378;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =285;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =6374;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =19019;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =19026;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =14573;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =24138;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =24160;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =19048;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =24154;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =19044;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =10359;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =14923;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =551;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =19049;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =19046;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =22639;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =19030;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =19040;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =10555;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =3715;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =15676;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =2898;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =1946;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =3374;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =5964;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =1504;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =19041;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =9186;
UPDATE `gameobject` SET `id` = '2054' WHERE `guid` =9418;
REPLACE INTO `gameobject_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES ('103711', '22634', '-50', '0', '1', '4', '0', '0', '0'), ('103713', '22634', '-50', '0', '1', '4', '0', '0', '0');
UPDATE `gameobject` SET `id` = '103713' WHERE `guid` =31271;
UPDATE `gameobject` SET `id` = '103713' WHERE `guid` =31278;
UPDATE `gameobject` SET `id` = '103713' WHERE `guid` =31274;
UPDATE `gameobject` SET `id` = '103713' WHERE `guid` =31270;
UPDATE `gameobject` SET `id` = '103713' WHERE `guid` =31273;
UPDATE `gameobject` SET `id` = '103713' WHERE `guid` =31268;
UPDATE `gameobject` SET `id` = '103713' WHERE `guid` =31267;
UPDATE `gameobject` SET `id` = '103713' WHERE `guid` =81070;
UPDATE `gameobject` SET `id` = '103713' WHERE `guid` =81072;
UPDATE `gameobject` SET `id` = '103713' WHERE `guid` =31275;
UPDATE `gameobject` SET `id` = '103713' WHERE `guid` =81073;
#
UPDATE `gameobject` SET `id` = '103711' WHERE `guid` =43943;
UPDATE `gameobject` SET `id` = '103711' WHERE `guid` =81071;
UPDATE `gameobject` SET `id` = '103711' WHERE `guid` =81074;
UPDATE `gameobject` SET `id` = '181249' WHERE `guid` =82731;
UPDATE `gameobject` SET `id` = '181249' WHERE `guid` =82338;
UPDATE `gameobject` SET `id` = '181249' WHERE `guid` =81987;
UPDATE `gameobject` SET `id` = '181249' WHERE `guid` =82710;
#
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =42982;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86212;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =16735;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86246;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =16778;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =15930;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86304;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =16523;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =43031;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =16521;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =16502;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86174;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =16055;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86322;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86452;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86580;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86538;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86442;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86434;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86420;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86300;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =43028;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =14081;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86550;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86456;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86254;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =14120;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =14086;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86482;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86582;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86256;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86248;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86558;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86552;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86454;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86562;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86574;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =11825;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86370;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =42963;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86318;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86584;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86284;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =43001;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =15600;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =14121;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =43018;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86586;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =14070;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =43002;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =13911;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =1407;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =13827;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =13530;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86576;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =13482;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86554;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =13412;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =13072;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =13062;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86184;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =12872;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86428;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86578;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =12674;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86154;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =12670;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =1248;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86572;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86556;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86564;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =86560;
UPDATE `gameobject` SET `id` = '176645' WHERE `guid` =42988;
#
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =6061;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =5720;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =12070;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =12060;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =11841;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =11950;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =42998;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =12142;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =12812;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =1281;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =42974;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =1874;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =12867;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =7779;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =43025;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =13112;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =1334;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =42999;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =43014;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =14691;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =14084;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =14252;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =13833;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =43030;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =14129;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =15928;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =10888;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =15601;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =15602;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =15700;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =43013;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =15910;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =7900;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =16501;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =16776;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =43000;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =11025;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =12955;
UPDATE `gameobject` SET `id` = '176643' WHERE `guid` =16524;
#
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85561;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85483;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85480;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85264;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85486;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85555;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =84862;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85345;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =84559;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85471;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85477;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85564;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =84976;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85489;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =84892;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85570;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =84691;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =84583;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =82730;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =84469;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85573;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85567;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85222;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =82337;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85087;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =84904;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =84868;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85558;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =81986;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =84913;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =84880;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =82709;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85285;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85576;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85249;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =84487;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =84943;
UPDATE `gameobject` SET `id` = '181109' WHERE `guid` =85474;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86283;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85566;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86581;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86481;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =84945;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86549;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86455;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85572;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86253;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =84585;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86585;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =84471;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85575;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86433;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86579;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86441;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86369;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86451;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86321;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =84915;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86173;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =84882;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85287;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85578;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85251;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85560;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86211;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =84870;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86245;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =84906;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85089;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86303;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85491;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86575;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85479;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86553;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =84561;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85347;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85473;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86537;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86419;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86299;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85224;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =84693;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =84894;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85476;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86583;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86317;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =84978;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85569;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =84489;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85557;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86183;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86427;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86577;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =84864;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85266;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86153;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85485;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86571;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85488;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86573;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86561;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86551;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86453;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86557;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86247;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86255;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86559;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86563;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85563;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =86555;
UPDATE `gameobject` SET `id` = '181108' WHERE `guid` =85482;
UPDATE `quest_template` SET `OfferRewardText` = 'Outstanding - your tribute to the Dawn is duly noted, $N. With this accomplished, I am delighted to make our mantles available to you for purchase. So long as you maintain your current status with us, these mantles will be purchasable from any authorized quartermaster of the Argent Dawn.$B$BFor the Dawn, my $gbrother:sister;!' WHERE `entry` IN (5504,5507,5513);
UPDATE `quest_template` SET `OfferRewardText` = 'Congratulations, $N - I am pleased to award you with an Argent Dawn valor token!$B$BTo acquire a valor token in such a manner indicates that you are a true hero in the cause of good. We value all effort brought to bear against the Scourge, but to take down one of their leaders is to truly deliver onto them a crushing defeat!$B$BFor the Dawn, my $gbrother:sister;!' WHERE `entry` IN (5404,5406,5508);

# Fix
INSERT IGNORE INTO spell_script_target VALUES
(49625, 1, 24087),
(49625, 1, 24092),
(49625, 1, 24093),
(49625, 1, 24094);
INSERT IGNORE INTO spell_script_target VALUES
(54258, 1, 29326),
(54264, 1, 29326),
(54265, 1, 29326),
(54266, 1, 29326),
(54267, 1, 29326);
INSERT IGNORE INTO spell_script_target VALUES
(17731, 0, 176513), -- Erruption
(17731, 0, 176514),
(17731, 0, 176515),
(17731, 0, 176809),
(17731, 0, 176810),
(17731, 0, 176811),
(17731, 0, 176812),
(17731, 0, 176813),
(17731, 0, 176814),
(17731, 0, 176815),
(17731, 0, 176816),
(17731, 0, 176817),
(17731, 0, 176818),
(17731, 0, 176819),
(17731, 0, 176820),
(17731, 0, 176821),
(17731, 0, 176822),
(17731, 0, 176823),
(17731, 0, 176824),
(17731, 0, 176825),
(17731, 0, 176826),
(17731, 0, 176827),
(17731, 0, 176828),
(17731, 0, 176829),
(17731, 0, 176830),
(17731, 0, 176831),
(17731, 0, 176832),
(17731, 0, 176833),
(17731, 0, 176834),
(17731, 0, 176835),
(17731, 0, 176836),
(17731, 0, 176837),
(17731, 0, 176838),
(17731, 0, 176839),
(17731, 0, 176840),
(17731, 0, 176841),
(17731, 0, 176842),
(17731, 0, 176908),
(17731, 0, 176909),
(17731, 0, 176910),
(17731, 0, 176911),
(17731, 0, 176912),
(17731, 0, 176913),
(17731, 0, 176914),
(17731, 0, 176915),
(17731, 0, 176916),
(17731, 0, 176917),
(17731, 0, 176918),
(17731, 0, 176919),
(17731, 0, 176920),
(17731, 0, 176921),
(17731, 0, 176922),
(18431, 0, 176513), -- Bellowing Roar
(18431, 0, 176514),
(18431, 0, 176515),
(18431, 0, 176809),
(18431, 0, 176810),
(18431, 0, 176811),
(18431, 0, 176812),
(18431, 0, 176813),
(18431, 0, 176814),
(18431, 0, 176815),
(18431, 0, 176816),
(18431, 0, 176817),
(18431, 0, 176818),
(18431, 0, 176819),
(18431, 0, 176820),
(18431, 0, 176821),
(18431, 0, 176822),
(18431, 0, 176823),
(18431, 0, 176824),
(18431, 0, 176825),
(18431, 0, 176826),
(18431, 0, 176827),
(18431, 0, 176828),
(18431, 0, 176829),
(18431, 0, 176830),
(18431, 0, 176831),
(18431, 0, 176832),
(18431, 0, 176833),
(18431, 0, 176834),
(18431, 0, 176835),
(18431, 0, 176836),
(18431, 0, 176837),
(18431, 0, 176838),
(18431, 0, 176839),
(18431, 0, 176840),
(18431, 0, 176841),
(18431, 0, 176842),
(18431, 0, 176908),
(18431, 0, 176909),
(18431, 0, 176910),
(18431, 0, 176911),
(18431, 0, 176912),
(18431, 0, 176913),
(18431, 0, 176914),
(18431, 0, 176915),
(18431, 0, 176916),
(18431, 0, 176917),
(18431, 0, 176918),
(18431, 0, 176919),
(18431, 0, 176920),
(18431, 0, 176921),
(18431, 0, 176922);
INSERT IGNORE INTO spell_script_target VALUES
(13727,0,162024);
DELETE FROM spell_scripts WHERE id=59910;
INSERT INTO spell_scripts (id, command, datalong, datalong2, comments) VALUES
(59910, 15, 59935, 5, ''),
(59910, 15, 59938, 5, ''),
(59910, 15, 59939, 5, ''),
(59910, 15, 59940, 5, ''),
(59910, 15, 59943, 5, '');

# NeatElves
DELETE FROM creature WHERE id IN (34816, 35766, 35770, 35771) AND map=649; 
DELETE FROM creature WHERE id=35651 AND map=649;
DELETE FROM creature WHERE id=22517 AND map=649;
DELETE FROM creature WHERE id=34862;
UPDATE `gossip_menu_option` SET `option_text` = '<Take this book for the good of Azeroth!>' WHERE `menu_id` =6668 AND `id` =0;
UPDATE `gossip_menu_option` SET `option_text` = '<Take this book for the good of Azeroth!>' WHERE `menu_id` =6669 AND `id` =0;
UPDATE `gossip_menu_option` SET `option_text` = '<Take this book for the good of Azeroth!>' WHERE `menu_id` =6670 AND `id` =0;
DELETE FROM creature_template_addon WHERE entry IN (23877, 23878, 23879, 23880);
INSERT INTO creature_template_addon (entry, b2_0_sheath, auras) VALUES
(23877, 1, '42466'),
(23878, 1, '42466'),
(23879, 1, '42466'),
(23880, 1, '42466');
INSERT IGNORE INTO achievement_criteria_requirement (criteria_id, type, value1) VALUES
(12344, 12, 0),
(12345, 12, 2),
(12338, 12, 1),
(12339, 12, 3);
UPDATE creature_template SET lootid=0 WHERE entry=23954;
DELETE FROM creature_loot_template WHERE entry=23954;
UPDATE item_loot_template SET ChanceOrQuestChance=15 WHERE entry=35348 AND item IN (33816, 33818, 35349, 35350);
UPDATE creature_loot_template SET maxcount=1 WHERE item=29740;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '1' WHERE `entry` =10508 AND `item` =13314;
UPDATE `creature_loot_template` SET `lootcondition` = '19',`condition_value1` = '12491' WHERE `entry` =23872 AND `item` =38280;
UPDATE `creature_loot_template` SET `lootcondition` = '19',`condition_value1` = '12492' WHERE `entry` =23872 AND `item` =38281;
DELETE FROM creature_linking_template WHERE entry =16809;
INSERT INTO creature_linking_template VALUES
(16809, 540, 16808, 1);
DELETE FROM creature_linking_template WHERE entry =14892;
INSERT INTO creature_linking_template VALUES    
(14892,1,14857,512); 
DELETE FROM creature_linking_template WHERE entry =2532;
INSERT INTO creature_linking_template VALUES    
(2532,0,2533,656);
UPDATE creature_template SET npcflag=npcflag|1, gossip_menu_id=3381 WHERE entry=11316;
REPLACE INTO gossip_menu (entry, text_id) VALUES (3381, 4133);
UPDATE `gossip_menu_option` SET `option_text` = 'Calm down, I want to ask you about the Iron Dwarves and Loken.' WHERE `menu_id` =9484 AND `id` =2;
UPDATE `gossip_menu_option` SET `option_text` = 'I would like to browse your goods, Illusia.' WHERE `menu_id` =9498 AND `id` =1;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 9498 AND `id` = 3;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 9498 AND `id` = 3;
UPDATE gossip_menu_option SET cond_1=9, cond_1_val_1=12247 WHERE menu_id=9504 AND id=0;
UPDATE gossip_menu_option SET cond_1=0, cond_1_val_1=0 WHERE menu_id=9505 AND id=0;
UPDATE gossip_menu_option SET cond_1=9, cond_1_val_1=12247 WHERE menu_id=9500 AND id=0;
UPDATE gossip_menu_option SET cond_1=0, cond_1_val_1=0 WHERE menu_id=9503 AND id=0;
DELETE FROM `gossip_menu_option` WHERE `menu_id` = 9763 AND `id` = 0;
DELETE FROM `locales_gossip_menu_option` WHERE `menu_id` = 9763 AND `id` = 0;
UPDATE `locales_gossip_menu_option` SET `id` = '0' WHERE `menu_id` =9763 AND `id` =2;
UPDATE `gossip_menu_option` SET `id` = '0' WHERE `menu_id` =9763 AND `id` =2;
DELETE FROM gossip_scripts WHERE id=9991;
INSERT INTO gossip_scripts (id, delay, command, datalong, datalong2, comments) VALUES
(9991, 0, 15, 57536, 4, 'cast Forcecast Portal: Moonglade');
UPDATE creature_template SET npcflag=npcflag&~1 WHERE entry=32790;
UPDATE `creature_template` SET `lootid` = '0' WHERE `entry` =31673;
UPDATE `creature_template` SET `lootid` = '31674' WHERE `entry` =31674;
UPDATE `creature_loot_template` SET `entry` = '31674' WHERE `entry` =31673;
UPDATE `creature_template` SET `lootid` = '23980' WHERE `entry` =23980;
REPLACE INTO `creature_loot_template` (`entry`, `item`, `ChanceOrQuestChance`, `groupid`, `mincountOrRef`, `maxcount`, `lootcondition`, `condition_value1`, `condition_value2`) VALUES (23980,43228,100,0,1,1,1,57940,0),(23980,33330,-100,0,1,1,0,0,0),(23980,35578,0,1,1,1,0,0,0),(23980,35576,0,1,1,1,0,0,0),(23980,35577,0,1,1,1,0,0,0);
UPDATE `quest_template` SET `SrcSpell` = '0' WHERE `entry` =12757;
UPDATE `creature_template` SET `flags_extra`=`flags_extra` &~ 1 WHERE `entry`=17256;
DELETE FROM `creature_loot_template` WHERE `entry`=11671;
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=11671;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '1' WHERE `entry` =165658 AND `item` =11382;
UPDATE `gameobject_loot_template` SET `ChanceOrQuestChance` = '1' WHERE `entry` =165658 AND `item` =11754;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '15' WHERE `item` =11370;
UPDATE `creature_template` SET `faction_A` = '35',`faction_H` = '35' WHERE `entry` =9502;
UPDATE `creature_template` SET `flags_extra`=`flags_extra` &~ 1 WHERE `entry`=17256;
UPDATE `creature_template` SET `faction_A` = '15',`faction_H` = '15' WHERE `entry` =20777;
DELETE FROM `creature` WHERE `guid` = 123598;

# SATANA
DELETE FROM `creature` WHERE `guid` IN (97343, 111385);

# NeatElves
DELETE FROM `gossip_menu` WHERE `entry` = 50005;
DELETE FROM gossip_menu_option WHERE menu_id=9709;
INSERT gossip_menu_option (menu_id, id, option_icon, option_text, option_id, npc_option_npcflag, action_menu_id, action_poi_id, action_script_id, box_coded, box_money, box_text, cond_1, cond_1_val_1, cond_1_val_2, cond_2, cond_2_val_1, cond_2_val_2, cond_3, cond_3_val_1, cond_3_val_2) VALUES
(9709, 0, 0, 'I''ve lost Nass...', 1, 1, -1, 0, 28518, 0, 0, NULL, 9, 12630, 0, 0, 0, 0, 0, 0, 0),
(9709, 1, 0, 'I\'ve lost my ensorcelled choker!', 1, 1, 9797, 0, 9709, 0, 0, NULL, 9, 12648, 0, 24, 38699, 1, 0, 0, 0),
(9709, 2, 0, 'I\'ve lost my ensorcelled choker!', 1, 1, 9797, 0, 9709, 0, 0, NULL, 9, 12649, 0, 24, 38699, 1, 0, 0, 0),
(9709, 3, 0, 'I\'ve lost my ensorcelled choker!', 1, 1, 9797, 0, 9709, 0, 0, NULL, 9, 12661, 0, 24, 38699, 1, 0, 0, 0),
(9709, 4, 0, 'I\'ve lost my ensorcelled choker!', 1, 1, 9797, 0, 9709, 0, 0, NULL, 9, 12669, 0, 24, 38699, 1, 0, 0, 0),
(9709, 5, 0, 'I\'ve lost my ensorcelled choker!', 1, 1, 9797, 0, 9709, 0, 0, NULL, 9, 12677, 0, 24, 38699, 1, 0, 0, 0),
(9709, 6, 0, 'I\'ve lost my ensorcelled choker!', 1, 1, 9797, 0, 9709, 0, 0, NULL, 9, 12676, 0, 24, 38699, 1, 0, 0, 0),
(9709, 7, 0, 'I\'ve lost my ensorcelled choker!', 1, 1, 9797, 0, 9709, 0, 0, NULL, 9, 12713, 0, 24, 38699, 1, 0, 0, 0);
DELETE FROM `gossip_scripts` WHERE `id` = 50020;
REPLACE INTO `gossip_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(9709, 0, 15, 53810, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Give Ensorceled Choker');
UPDATE quest_end_scripts SET datalong2=1000 WHERE command=3;
UPDATE quest_start_scripts SET datalong2=1000 WHERE command=3;
UPDATE creature_movement_scripts SET datalong2=1000 WHERE command=3;
DELETE FROM quest_end_scripts WHERE id=502;
INSERT INTO quest_end_scripts VALUES 
(502,2,0,2,0,0,0,0,2000000537,0,0,0,0,0,0,0,''),
(502,10,18,0,0,0,0,0,0,0,0,0,0,0,0,0,''),
(502,10,10,2275,300000,0,0,0,0,0,0,0,-353.534,21.4088,54.6594,3.68102,''),
(502,11,22,44,2275,30,0,0x01,0,0,0,0,0,0,0,0,'');
DELETE FROM db_script_string WHERE entry IN (2000000537);
INSERT INTO db_script_string VALUES
(2000000537,'%s sniffs the elixir then eagerly digs in!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
UPDATE quest_template SET CompleteScript =502 WHERE entry =502;
DELETE FROM quest_end_scripts WHERE id =411;
INSERT INTO quest_end_scripts VALUES 
(411,2,15,7673,1,0,0,0,0,0,0,0,0,0,0,0,'Bethor use Nether Gem'),
(411,7,10,5666,23000,0,0,0,0,0,0,0,1768.58,55.4891,-46.3198,2.28248,'Summon Visage'),
(411,23,0,0,5666,10,0,0x01,2000000538,0,0,0,0,0,0,0,'Visage Say 3'),
(411,23,1,2,5666,10,0,0x01,0,0,0,0,0,0,0,0,''),
(411,30,0,0,0,0,0,0,2000000539,0,0,0,0,0,0,0,'Bethor Say');
DELETE FROM creature_movement_template WHERE entry =5666;
INSERT INTO creature_movement_template values
(5666,1,1766.564209,60.441765,-46.321392,0,0,0,0,0,0,0,0,0,0,1.931406,0,0),
(5666,2,1766.394775,65.016624,-46.321392,20000,566601,0,0,0,0,0,0,0,0,1.516716,0,0);
DELETE FROM creature_movement_scripts WHERE id =566601;
INSERT INTO creature_movement_scripts VALUES 
(566601,2,0,0,0,0,0,0,2000000540,0,0,0,0,0,0,0,'Visage Say 1'),
(566601,2,1,2,0,0,0,0,0,0,0,0,0,0,0,0,''),
(566601,7,0,0,0,0,0,0,2000000541,0,0,0,0,0,0,0,'Visage Say 2');
DELETE FROM db_script_string WHERE entry in (2000000538,2000000539,2000000540,2000000541);
INSERT INTO db_script_string (entry,content_default) VALUES
('2000000540','It has been a long time, Bethor, my friend.'),
('2000000541','When time permits, we must speak at length.  For we have much to discuss.'),
('2000000538','And thank you, $N.  Without your aid I may never have found my way to the Forsaken.'),
('2000000539','Farewell, my friend.');
UPDATE quest_template SET CompleteScript =411 WHERE entry =411;
UPDATE creature_template SET MovementType =2 WHERE entry =5666;
DELETE FROM quest_start_scripts WHERE id =1064;
INSERT INTO quest_start_scripts VALUES
(1064,2,0,2,0,0,0,0,2000000542,0,0,0,0,0,0,0,''), 
(1064,4,10,4068,163000,0,0,0,0,0,0,0,-1067.22,-213.737,160.473,5.25037,'Summon Serpent Messenger'),
(1064,8,0,0,0,0,0,0,2000000543,0,0,0,0,0,0,0,''),
(1064,8,1,25,0,0,0,0,0,0,0,0,0,0,0,0,'');
DELETE FROM creature_movement_template WHERE entry =4068;
INSERT INTO creature_movement_template values
(4068,1,-1067.22,-213.737,160.473,5000,0,0,0,0,0,0,0,0,0,5.25037,0,0),(4068,2,-1062.563110,-221.980972,160.293686,0,0,0,0,0,0,0,0,0,0,5.241267,0,0),(4068,3,-1054.613525,-221.248077,161.894302,0,0,0,0,0,0,0,0,0,0,6.141012,0,0),(4068,4,-1054.613525,-221.248077,161.894302,0,0,0,0,0,0,0,0,0,0,1.032316,0,0),(4068,5,-1037.051270,-191.119843,158.948898,0,0,0,0,0,0,0,0,0,0,1.350082,0,0),(4068,6,-1053.116089,-173.969162,163.213501,0,0,0,0,0,0,0,0,0,0,1.499307,0,0),(4068,7,-1064.460815,-140.953430,161.368164,0,0,0,0,0,0,0,0,0,0,1.911642,0,0),(4068,8,-1079.252563,-97.161659,156.371017,0,0,0,0,0,0,0,0,0,0,1.844883,0,0),(4068,9,-1085.388672,-64.697372,164.415894,0,0,0,0,0,0,0,0,0,0,1.554286,0,0),(4068,10,-1083.906494,-26.769547,159.368652,0,0,0,0,0,0,0,0,0,0,1.522870,0,0),(4068,11,-1084.437378,-9.298964,158.033981,0,0,0,0,0,0,0,0,0,0,2.382882,0,0),(4068,12,-1109.662598,7.028631,154.731796,0,0,0,0,0,0,0,0,0,0,2.159043,0,0),(4068,13,-1132.070801,31.571543,158.156860,3000,0,0,0,0,0,0,0,0,0,1.247981,0,0),(4068,14,-1129.020874,47.131615,154.189957,0,0,0,0,0,0,0,0,0,0,0.784595,0,0),(4068,15,-1095.165039,63.546089,150.751999,0,0,0,0,0,0,0,0,0,0,0.812084,0,0),(4068,16,-1086.827881,113.826881,144.556686,0,0,0,0,0,0,0,0,0,0,2.476453,0,0),(4068,17,-1113.197266,129.363617,140.267685,0,0,0,0,0,0,0,0,0,0,2.884861,0,0),(4068,18,-1146.349487,119.028442,141.776108,0,0,0,0,0,0,0,0,0,0,3.501398,0,0),(4068,19,-1169.854614,118.638229,141.100555,0,0,0,0,0,0,0,0,0,0,3.049794,0,0),(4068,20,-1206.748169,117.618309,139.861038,0,0,0,0,0,0,0,0,0,0,2.539285,0,0),(4068,21,-1211.528320,129.623215,135.558578,0,0,0,0,0,0,0,0,0,0,0.585213,0,0),(4068,22,-1192.517822,144.920822,136.995239,0,0,0,0,0,0,0,0,0,0,0.699096,0,0),(4068,23,-1175.371460,157.220032,146.484497,0,0,0,0,0,0,0,0,0,0,0.530235,0,0),(4068,24,-1155.665039,169.874832,146.073914,0,0,0,0,0,0,0,0,0,0,0.553796,0,0),(4068,25,-1127.051392,179.696198,131.789566,0,0,0,0,0,0,0,0,0,0,0.318177,0,0),(4068,26,-1096.039795,189.663116,118.054527,0,0,0,0,0,0,0,0,0,0,0.312577,0,0),(4068,27,-1061.462280,191.501770,109.917091,0,0,0,0,0,0,0,0,0,0,1.349303,0,0),(4068,28,-1056.643433,215.226959,113.473175,0,0,0,0,0,0,0,0,0,0,1.036714,0,0),(4068,29,-1046.912964,223.356094,114.830818,0,0,0,0,0,0,0,0,0,0,0.553694,0,0),(4068,30,-1035.351440,218.460327,112.371468,0,0,0,0,0,0,0,0,0,0,5.643078,0,0),(4068,31,-1027.928833,217.482834,114.235703,0,0,0,0,0,0,0,0,0,0,0.514424,0,0),(4068,32,-1023.408142,229.152222,108.919838,0,0,0,0,0,0,0,0,0,0,1.079911,0,0),(4068,33,-1016.342163,236.135757,109.242874,0,0,0,0,0,0,0,0,0,0,0.962101,0,0),(4068,34,-1013.077881,246.141632,108.770103,0,0,0,0,0,0,0,0,0,0,1.331238,0,0),(4068,35,-1006.870972,255.832901,113.284279,0,0,0,0,0,0,0,0,0,0,0.966027,0,0),(4068,36,-997.047241,275.161041,112.343002,20000,406801,0,0,0,0,0,0,0,0,1.138815,0,0);
DELETE FROM creature_movement_scripts WHERE id =406801;
INSERT INTO creature_movement_scripts VALUES 
(406801,2,0,2,0,0,0,0,2000000544,0,0,0,0,0,0,0,'Serpent Messenger - text emote'),
(406801,8,0,2,0,3419,10,0x02,2000000545,0,0,0,0,0,0,0,'Serpent Messenger: Force NPC to text emote');
DELETE FROM db_script_string WHERE entry in (2000000542,2000000543,2000000544,2000000545);
INSERT INTO db_script_string (entry,content_default) VALUES
('2000000542','%s summons a messenger...'),
('2000000543','Go, my servant. Send word of Stonetalon to Apothecary Zamah.'),
('2000000544','%s gives message to Apothecary Zamah.'),
('2000000545','Apothecary Zamah smiles.');
UPDATE creature_template SET inhabittype =5 WHERE entry =4068;
UPDATE quest_template SET StartScript =1064 WHERE entry =1064;
UPDATE creature_template SET MovementType =2 WHERE entry =4068;
DELETE FROM quest_end_scripts WHERE id=3922 AND delay=6;        
INSERT INTO quest_end_scripts VALUES 
(3922,6,15,13727,1,0,0,0,0,0,0,0,0,0,0,0,''),
(3922,6,1,0,0,0,0,0,0,0,0,0,0,0,0,0,'');
DELETE FROM gossip_scripts WHERE id=5602 AND command=29;
INSERT INTO gossip_scripts (id, delay, command, datalong, data_flags, comments) VALUES
(5602, 1, 29, 1, 0, 'ironbark the redeemed - Drop gossip flag');
UPDATE gossip_menu SET cond_1=16, cond_1_val_1=9279, cond_1_val_2=1 WHERE entry=1045 AND text_id=1643;
UPDATE gossip_menu SET cond_1=16, cond_1_val_1=9280, cond_1_val_2=1 WHERE entry=1047 AND text_id=1647;
UPDATE gossip_menu SET cond_1=16, cond_1_val_1=9282, cond_1_val_2=1 WHERE entry=1049 AND text_id=1649;
UPDATE gossip_menu SET cond_1=16, cond_1_val_1=9281, cond_1_val_2=1 WHERE entry=1050 AND text_id=1651;
UPDATE creature SET MovementType=0 WHERE id=12119;
DELETE FROM creature_movement WHERE id IN (47406, 47405);
UPDATE gossip_menu_option SET action_menu_id=1044 WHERE menu_id=1045 AND id=0;
UPDATE gossip_menu_option SET action_menu_id=1046 WHERE menu_id=1047 AND id=0;
UPDATE gossip_menu_option SET action_menu_id=1048 WHERE menu_id=1049 AND id=0;
UPDATE gossip_menu_option SET action_menu_id=1052 WHERE menu_id=1050 AND id=0;
REPLACE INTO `gossip_menu` (`entry`, `text_id`, `cond_1`, `cond_1_val_1`, `cond_1_val_2`, `cond_2`, `cond_2_val_1`, `cond_2_val_2`) VALUES
(1044, 1644, 0, 0, 0, 0, 0, 0),
(1046, 1648, 0, 0, 0, 0, 0, 0),
(1048, 1650, 0, 0, 0, 0, 0, 0),
(1052, 1652, 0, 0, 0, 0, 0, 0);
UPDATE creature SET position_x =-4629.427734, position_y =-3176.136719, position_z =41.233944, orientation =6.153070,MovementType=2 WHERE guid =125122;
DELETE FROM creature_movement_template WHERE entry =23995;
INSERT INTO creature_movement_template VALUES (23995,1,-4629.427734,-3176.136719,41.233944,12000,0,0,0,0,0,0,0,0,0,6.153070,0,0),(23995,2,-4627.772461,-3176.220215,41.424347,0,0,0,0,0,0,0,0,0,0,0.041173,0,0),(23995,3,-4616.856934,-3178.537598,34.809750,0,0,0,0,0,0,0,0,0,0,0.030177,0,0),(23995,4,-4615.830566,-3177.601563,34.809750,0,0,0,0,0,0,0,0,0,0,0.944382,0,0),(23995,5,-4615.690918,-3176.387695,34.810860,0,0,0,0,0,0,0,0,0,0,2.483763,0,0),(23995,6,-4618.078613,-3175.325195,34.811573,37000,2399501,0,0,0,0,0,0,0,0,2.68404,0,0),(23995,7,-4615.866699,-3176.421143,34.810638,0,0,0,0,0,0,0,0,0,0,5.719601,0,0),(23995,8,-4617.087891,-3178.392334,34.809753,0,0,0,0,0,0,0,0,0,0,3.174918,0,0),(23995,9,-4628.041992,-3176.363770,41.254250,0,0,0,0,0,0,0,0,0,0,3.061038,0,0),(23995,10,-4630.638184,-3176.163574,41.215580,0,0,0,0,0,0,0,0,0,0,3.084600,0,0),(23995,11,-4629.427734,-3176.136719,41.233944,300000,0,0,0,0,0,0,0,0,0,6.153070,0,0);
DELETE FROM creature_movement_scripts WHERE id IN (2399501);
INSERT INTO creature_movement_scripts VALUES 
(2399501,3,0,0,23579,10,0,0x04,2000000547,0,0,0,0,0,0,0,''),
(2399501,3,1,6,0,0,0,0,0,0,0,0,0,0,0,0,''), 
(2399501,10,0,0,23579,10,0,0x02,2000000550,0,0,0,0,0,0,0,''),
(2399501,10,1,1,23579,10,0,0,0,0,0,0,0,0,0,0,''),
(2399501,17,0,0,23579,10,0,0x04,2000000548,0,0,0,0,0,0,0,''),
(2399501,17,1,6,0,0,0,0,0,0,0,0,0,0,0,0,''),
(2399501,24,0,0,23579,10,0,0x02,2000000546,0,0,0,0,0,0,0,''),
(2399501,25,1,1,23579,10,0,0,0,0,0,0,0,0,0,0,''),
(2399501,31,0,0,23579,10,0,0x04,2000000549,0,0,0,0,0,0,0,''),
(2399501,31,1,6,0,0,0,0,0,0,0,0,0,0,0,0,'');
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(2000000546, 'But this the only building that fit Brogg! Goblins make buildings too small!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000547, 'I thought we talked about this, Brogg. You can''t stay in this building. Sure, it can house you, but there''s no room for anyone else!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000548, 'Yes, we said you can stay here, but this building is our headquarters! All of our manuals and blueprints are stored here!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000549, 'I''m inclined to say they made ogres too big! I can see I''m not going to convince you to move now, but don''t think this is permanent!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
DELETE FROM db_script_string WHERE entry =2000000550;
INSERT INTO db_script_string VALUES 
(2000000550,'You said Brogg could stay here! You promised Brogg you\'d help regain Stonemaul clan mound!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
DELETE FROM quest_end_scripts WHERE id=970;
INSERT INTO quest_end_scripts VALUES 
(970, 1, 0, 0, 0, 0, 0, 0, 2000000255, 0, 0, 0, 0, 0, 0, 0, ''),
(970, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3185.46, 189.38, 4.7517, 2.28164, ''),
(970, 3, 1, 36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(970, 4, 6877, 5, 0, 0, 0, 0, 0, 0, 0, 0, 3184.06, 190.81, 4.61263, 5.55407, ''),
(970, 6, 0, 2, 0, 0, 0, 0, 2000000256, 0, 0, 0, 0, 0, 0, 0, ''),
(970, 10, 10, 4509,54000,0,0,0,0,0,0,0,3184.06,190.81,4.61263,5.55407,''),
(970, 11, 0, 0,4509,10,0,0x02,2000000551,0,0,0,0,0,0,0,''),
(970, 11, 1, 1,4509,10,0,0,0,0,0,0,0,0,0,0,''),
(970, 18, 0, 0,4509,10,0,0x02,2000000552,0,0,0,0,0,0,0,''),
(970, 18, 1, 1,4509,10,0,0,0,0,0,0,0,0,0,0,''),
(970, 25, 0, 0,4509,10,0,0x02,2000000553,0,0,0,0,0,0,0,''),
(970, 25, 1, 1,4509,10,0,0,0,0,0,0,0,0,0,0,''),
(970, 32, 0, 0,4509,10,0,0x02,2000000554,0,0,0,0,0,0,0,''),
(970, 32, 1, 1,4509,10,0,0,0,0,0,0,0,0,0,0,''),
(970, 39, 0, 0,4509,10,0,0x02,2000000555,0,0,0,0,0,0,0,''),
(970, 39, 1, 1,4509,10,0,0,0,0,0,0,0,0,0,0,''),
(970, 47, 0, 0,0,0,0,0,2000000257,0,0,0,0,0,0,0,''),
(970, 47, 1, 6,0,0,0,0,0,0,0,0,0,0,0,0,''),
(970, 56, 0, 0,4509,10,0,0x02,2000000556,0,0,0,0,0,0,0,''),
(970, 56, 1, 1,4509,10,0,0,0,0,0,0,0,0,0,0,''),
(970, 64, 0, 2,0,0,0,0,2000000258,0,0,0,0,0,0,0,''),
(970, 65, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3185.46, 189.38, 4.7517, 0.471239, '');
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(2000000551,'In the throes of the Sundering, Ameth\'Aran was at the whim of the terror that gripped the land. There was little hope for survival.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000552,'Athrikus came to us. He told us that he could save us from harm. He cast a spell upon us to protect us from harm.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000553,'When the shaking stopped, his true motives were revealed. We were trapped, and he was slowly draining our powers.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000554,'There were hundreds imprisoned by his spell. Now only a few remain in their prisons. He would speak to us sometimes.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000555,'He worried that his power weakened, that soon even we last of his precious soulgems would fade and die.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000556,'His lieutenant, Ilkurd Magthrull possesses a tome which might indicate the location of the remaining soulgems.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
UPDATE quest_template SET CompleteScript =970 WHERE entry =970;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(37600, 5907, 1, 1, 1, 0, 0, 268.899, -3055.15, 97.1642, 5.48952, 300, 0, 0, 328, 0, 0, 2);
UPDATE creature_template SET MovementType=2 WHERE entry =5907;
DELETE FROM creature_movement_template WHERE entry =5907;
INSERT INTO creature_movement_template VALUES
(5907,1,265.967,-3050.67,96.9215,0,0,0,0,0,0,0,0,0,0,5.20661,0,0),(5907,2,263.671661,-3047.959961,96.665161,0,0,0,0,0,0,0,0,0,0,1.754795,0,0),(5907,3,260.557739,-3038.177002,96.740677,0,0,0,0,0,0,0,0,0,0,1.223866,0,0),(5907,4,262.354950,-3036.125732,96.990982,0,0,0,0,0,0,0,0,0,0,3.608336,0,0),(5907,5,261.470215,-3036.779541,96.961708,60000,0,0,0,0,0,0,0,0,0,4.081931,0,0),(5907,6,259.890106,-3038.696045,96.572845,0,0,0,0,0,0,0,0,0,0,4.454209,0,0),(5907,7,265.967468,-3050.672363,96.921516,0,0,0,0,0,0,0,0,0,0,5.206614,0,0),(5907,8,265.967,-3050.67,96.9215,30000,0,0,0,0,0,0,0,0,0,5.20661,0,0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(3095, 522, 0, 1, 1, 0, 0, -10389, 383.148, 46.9751, 6.15685, 600, 0, 0, 2865, 0, 0, 2);
UPDATE creature_template SET MovementType=2 WHERE entry =522;
DELETE FROM creature_movement_template WHERE entry =522;
INSERT INTO creature_movement_template VALUES
(522,1,-10381.790039,385.818787,47.485832,0,0,0,0,0,0,0,0,0,0,1.188290,0,0),(522,2,-10378.353516,396.697784,48.666176,0,0,0,0,0,0,0,0,0,0,1.767914,0,0),(522,3,-10383.936523,406.429901,48.200802,0,0,0,0,0,0,0,0,0,0,2.212450,0,0),(522,4,-10392.833984,415.511230,48.568111,0,0,0,0,0,0,0,0,0,0,2.698611,0,0),(522,5,-10402.652344,424.936462,48.598141,0,0,0,0,0,0,0,0,0,0,2.594938,0,0),(522,6,-10422.144531,430.722595,47.011917,0,0,0,0,0,0,0,0,0,0,2.958578,0,0),(522,7,-10436.563477,429.382294,45.266228,0,0,0,0,0,0,0,0,0,0,3.123510,0,0),(522,8,-10453.313477,433.283630,40.623096,0,0,0,0,0,0,0,0,0,0,2.793643,0,0),(522,9,-10470.271484,439.703796,37.307541,0,0,0,0,0,0,0,0,0,0,2.974285,0,0),(522,10,-10475.128906,439.483582,36.966358,0,0,0,0,0,0,0,0,0,0,3.582968,0,0),(522,11,-10483.357422,433.096802,37.977291,0,0,0,0,0,0,0,0,0,0,4.109972,0,0),(522,12,-10487.686523,425.657654,37.699154,0,0,0,0,0,0,0,0,0,0,4.262338,0,0),(522,13,-10491.266602,416.079773,35.894611,0,0,0,0,0,0,0,0,0,0,4.431198,0,0),(522,14,-10497.201172,393.398834,36.094414,0,0,0,0,0,0,0,0,0,0,4.556843,0,0),(522,15,-10496.387695,366.334229,34.331688,0,0,0,0,0,0,0,0,0,0,4.823875,0,0),(522,16,-10488.249023,347.824646,34.108547,0,0,0,0,0,0,0,0,0,0,5.189085,0,0),(522,17,-10474.242188,327.589600,35.072189,0,0,0,0,0,0,0,0,0,0,5.318675,0,0),(522,18,-10466.697266,311.630585,36.763939,0,0,0,0,0,0,0,0,0,0,5.463975,0,0),(522,19,-10449.692383,301.975525,37.326721,0,0,0,0,0,0,0,0,0,0,5.833106,0,0),(522,20,-10435.983398,298.190826,37.435139,0,0,0,0,0,0,0,0,0,0,0.158601,0,0),(522,21,-10416.596680,304.413177,38.881512,0,0,0,0,0,0,0,0,0,0,0.563077,0,0),(522,22,-10408.786133,312.268402,39.324524,0,0,0,0,0,0,0,0,0,0,1.166264,0,0),(522,23,-10405.760742,321.294739,40.502213,0,0,0,0,0,0,0,0,0,0,1.469427,0,0),(522,24,-10405.062500,334.649902,42.604614,0,0,0,0,0,0,0,0,0,0,1.544040,0,0),(522,25,-10404.991211,345.921265,43.803085,0,0,0,0,0,0,0,0,0,0,1.351618,0,0),(522,26,-10399.343750,360.187714,45.120865,0,0,0,0,0,0,0,0,0,0,1.371253,0,0),(522,27,-10400.009766,366.514923,45.580963,0,0,0,0,0,0,0,0,0,0,2.182569,0,0),(522,28,-10405.300781,372.353058,45.775314,0,0,0,0,0,0,0,0,0,0,2.430755,0,0),(522,29,-10410.433594,375.665436,45.615314,0,0,0,0,0,0,0,0,0,0,2.356142,0,0),(522,30,-10412.420898,379.826355,45.700714,0,0,0,0,0,0,0,0,0,0,1.238520,0,0),(522,31,-10411.112305,383.231354,46.210793,0,0,0,0,0,0,0,0,0,0,0.666750,0,0),(522,32,-10408.669922,384.591675,46.600658,0,0,0,0,0,0,0,0,0,0,5.972640,0,0),(522,33,-10399.612305,381.669647,46.840744,0,0,0,0,0,0,0,0,0,0,6.217682,0,0),(522,34,-10391.898438,382.664215,46.875294,0,0,0,0,0,0,0,0,0,0,0.623291,0,0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(53125, 3626, 0, 1, 1, 0, 0, -8646.47, 475.49, 102.505, 5.51888, 600, 0, 0, 102, 0, 0, 2);
DELETE FROM creature_movement WHERE id =53125;
UPDATE creature_template SET MovementType=2 WHERE entry =3626;
DELETE FROM creature_movement_template WHERE entry =3626;
INSERT INTO creature_movement_template VALUES
(3626,1,-8633.998047,462.405914,102.186523,0,0,0,0,0,0,0,0,0,0,5.061059,0,0),(3626,2,-8632.026367,457.288361,102.284325,0,0,0,0,0,0,0,0,0,0,4.740618,0,0),(3626,3,-8632.628906,448.614807,102.264229,0,0,0,0,0,0,0,0,0,0,4.561555,0,0),(3626,4,-8633.963867,444.454834,102.205269,0,0,0,0,0,0,0,0,0,0,4.106815,0,0),(3626,5,-8638.489258,437.330383,101.860809,0,0,0,0,0,0,0,0,0,0,3.922250,0,0),(3626,6,-8657.384766,414.684296,102.463829,0,0,0,0,0,0,0,0,0,0,3.918323,0,0),(3626,7,-8675.098633,401.360321,103.175171,0,0,0,0,0,0,0,0,0,0,3.729827,0,0),(3626,8,-8680.104492,398.328949,102.658951,0,0,0,0,0,0,0,0,0,0,3.495779,0,0),(3626,9,-8687.143555,395.804199,101.949257,0,0,0,0,0,0,0,0,0,0,3.063024,0,0),(3626,10,-8693.931641,397.356537,101.418633,0,0,0,0,0,0,0,0,0,0,2.629281,0,0),(3626,11,-8700.502930,401.104736,100.863899,0,0,0,0,0,0,0,0,0,0,2.592367,0,0),(3626,12,-8706.400391,405.225922,99.438339,0,0,0,0,0,0,0,0,0,0,2.776151,0,0),(3626,13,-8711.686523,405.926208,98.314323,0,0,0,0,0,0,0,0,0,0,3.244249,0,0),(3626,14,-8716.862305,405.100708,97.972061,0,0,0,0,0,0,0,0,0,0,3.089525,0,0),(3626,15,-8721.974609,406.161438,97.696129,0,0,0,0,0,0,0,0,0,0,2.491051,0,0),(3626,16,-8724.807617,408.296783,97.663719,0,0,0,0,0,0,0,0,0,0,2.154115,0,0),(3626,17,-8726.636719,412.792236,97.544769,0,0,0,0,0,0,0,0,0,0,1.665598,0,0),(3626,18,-8726.811523,417.801910,97.750420,0,0,0,0,0,0,0,0,0,0,1.357722,0,0),(3626,19,-8724.110352,423.170837,97.872223,0,0,0,0,0,0,0,0,0,0,0.810301,0,0),(3626,20,-8720.747070,426.829773,97.870148,0,0,0,0,0,0,0,0,0,0,1.401706,0,0),(3626,21,-8722.459961,442.402374,97.196663,0,0,0,0,0,0,0,0,0,0,1.240699,0,0),(3626,22,-8719.785156,449.389069,97.343246,0,0,0,0,0,0,0,0,0,0,0.794593,0,0),(3626,23,-8712.386719,457.847626,96.768982,0,0,0,0,0,0,0,0,0,0,0.750610,0,0),(3626,24,-8683.108398,483.743561,96.135551,0,0,0,0,0,0,0,0,0,0,0.885699,0,0),(3626,25,-8681.424805,486.449707,96.836777,0,0,0,0,0,0,0,0,0,0,0.901407,0,0),(3626,26,-8674.729492,492.648193,98.853271,0,0,0,0,0,0,0,0,0,0,0.482789,0,0),(3626,27,-8668.110352,497.000763,100.099174,0,0,0,0,0,0,0,0,0,0,0.141926,0,0),(3626,28,-8661.128906,496.144104,100.684830,0,0,0,0,0,0,0,0,0,0,5.510909,0,0),(3626,29,-8651.457031,484.661285,102.490685,0,0,0,0,0,0,0,0,0,0,5.389964,0,0),(3626,30,-8646.134766,477.842407,102.505829,0,0,0,0,0,0,0,0,0,0,5.366403,0,0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(5950, 14439, 0, 1, 1, 0, 0, -8599.39, 526.047, 106.46, 0.773191, 350, 0, 1, 50400, 0, 0, 2);
DELETE FROM creature_movement WHERE id =5950;
UPDATE creature_template SET MovementType=2 WHERE entry =14439;
DELETE FROM creature_movement_template WHERE entry =14439;
INSERT INTO creature_movement_template VALUES
(14439,1,-8591.88,531.862,105.402,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,2,-8581.69,540.027,102.154,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,3,-8575.94,539.302,101.771,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,4,-8563.61,528.489,100.989,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,5,-8553.29,515.225,99.1261,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,6,-8548.15,508.178,98.3659,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,7,-8545.37,504.932,98.4031,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,8,-8541.27,504.77,98.5065,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,9,-8521.1,520.723,98.3403,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,10,-8513.51,526.357,98.2985,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,11,-8501.38,538.124,97.2653,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,12,-8482.92,555.827,97.8615,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,13,-8464.8,570.135,96.1155,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,14,-8446.12,580.506,94.4755,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,15,-8442.6,580.167,94.363,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,16,-8424.17,569.751,93.3653,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,17,-8413.43,569.134,92.3689,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,18,-8405.41,572.369,91.5272,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,19,-8389.64,582.56,91.3693,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,20,-8386.85,587.318,91.7767,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,21,-8384.56,596.568,93.0718,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,22,-8386.54,617.329,95.4152,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,23,-8382.76,631.485,94.7065,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,24,-8382.85,637.422,94.6553,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,25,-8389.31,655.11,94.812,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,26,-8396.99,666.642,94.8955,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,27,-8403.95,672.493,94.8955,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,28,-8411.89,672.432,94.895,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,29,-8425.21,664.942,94.2234,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,30,-8439.84,656.09,92.9408,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,31,-8443.49,656.637,93.0828,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,32,-8455.11,671.064,96.3664,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,33,-8469.27,688.25,99.493,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,34,-8469.92,688.977,99.7522,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,35,-8473.71,688.882,99.7532,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,36,-8490.73,672.714,100.551,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,37,-8505.41,655.877,100.301,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,38,-8510.7,655.849,100.303,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,39,-8519.24,668.526,102.668,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,40,-8520.12,670.914,102.758,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,41,-8533.37,683.574,97.8457,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,42,-8540.09,686.589,97.6794,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,43,-8548.24,684.127,97.3182,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,44,-8562.96,672.98,97.0148,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,45,-8570.83,666.888,97.0246,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,46,-8596.8,657.889,98.3613,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,47,-8610.83,654.304,98.7552,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,48,-8612.64,654.25,98.7683,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,49,-8633.09,655.307,100.65,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,50,-8649.43,659.151,100.964,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,51,-8657.61,663.367,100.743,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,52,-8660.04,665.378,100.555,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,53,-8664.41,672.453,100.185,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,54,-8670.49,679.71,99.2298,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,55,-8671.59,682.28,98.9746,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,56,-8683.47,696.758,97.7983,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,57,-8691.24,706.08,97.0584,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,58,-8700.31,717.353,97.017,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,59,-8708.06,725.524,97.2862,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,60,-8711.42,728.835,97.7011,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,61,-8712.6,730.848,97.8159,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,62,-8716.95,731.33,98.0058,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,63,-8726.33,723.711,101.167,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,64,-8729.78,720.972,101.691,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,65,-8741.1,711.17,98.5785,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,66,-8741.68,705.937,98.5341,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,67,-8738.52,701.601,98.7081,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,68,-8740.3,697.277,98.8112,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,69,-8756.94,684.21,101.06,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,70,-8770.78,673.253,102.885,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,71,-8776.03,671.902,103.09,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,72,-8786.72,678.527,102.504,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,73,-8792.92,674.634,101.728,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,74,-8796,665.06,99.2621,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,75,-8800.22,651.591,94.5598,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,76,-8812.08,645.599,94.2288,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,77,-8818.9,642.198,94.2288,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,78,-8829.02,636.59,94.2526,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,79,-8835.59,636.444,94.5693,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,80,-8846.43,648.083,96.5927,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,81,-8855.69,654.906,96.4614,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,82,-8861.05,655.353,96.263,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,83,-8864.44,652.566,96.1743,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,84,-8877.29,645.236,96.0464,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,85,-8885.15,640.829,99.5229,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,86,-8906.4,628.947,99.5229,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,87,-8913.54,614.615,99.5229,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,88,-8921.19,609.981,99.5229,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,89,-8923.15,610.629,99.5229,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,90,-8930.54,624.345,99.5229,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,91,-8929.51,625.844,99.5229,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,92,-8922.82,629.489,99.5229,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,93,-8912.27,627.865,99.5229,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,94,-8906,628.653,99.5229,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,95,-8900.05,631.909,99.5229,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,96,-8884.71,640.347,99.5229,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,97,-8880.44,642.595,97.6924,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,98,-8869.1,643.416,95.8094,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,99,-8856.24,642.427,96.4432,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,100,-8851.98,643.673,96.4309,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,101,-8850.43,643.395,96.5,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,102,-8833.83,627.933,93.9755,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,103,-8819.76,615.572,94.9483,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,104,-8809.1,605.227,96.0943,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,105,-8796.91,592.602,97.512,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,106,-8793.62,592.041,97.6126,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,107,-8779.94,601.274,97.3158,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,108,-8771.98,606.687,97.1406,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,109,-8768.7,607.047,97.0085,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,110,-8751.75,589.84,97.3517,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,111,-8740.26,577.266,97.4911,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,112,-8739.63,573.749,97.4225,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,113,-8744.12,564.482,97.401,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,114,-8744.93,561.351,97.4058,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,115,-8743.31,555.288,98.3803,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,116,-8735.51,546.297,100.983,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,117,-8726.71,535.624,100.583,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,118,-8715.77,521.911,97.431,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,119,-8718.99,514.95,96.6943,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,120,-8719.4,510.72,96.5426,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,121,-8707.91,494.121,95.3984,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,122,-8697.39,477.934,95.3223,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,123,-8696.43,476.345,95.3223,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,124,-8696.84,472.437,95.4045,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,125,-8708.53,460.104,96.4403,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,126,-8712.31,456.509,96.8564,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,127,-8721.3,437.764,97.3922,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,128,-8723.95,426.716,98.1477,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,129,-8723.67,425.459,98.0621,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,130,-8725.21,412.604,97.5976,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,131,-8723.51,408.316,97.7259,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,132,-8719,406.144,97.8034,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,133,-8713.88,405.43,98.1904,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,134,-8695.86,400.597,101.223,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,135,-8684.04,399.364,102.125,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,136,-8671.41,407.982,103.471,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,137,-8659.77,416.535,102.714,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,138,-8658.68,417.715,102.606,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,139,-8645.92,432.153,101.258,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,140,-8643.44,434.601,101.31,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,141,-8637.27,444.735,102.27,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,142,-8633.42,455.027,102.198,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,143,-8639.28,469.23,102.402,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,144,-8642.39,475.403,102.514,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,145,-8642.54,477.073,102.505,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,146,-8641.59,480.016,102.507,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,147,-8624.31,493.611,102.701,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,148,-8614.24,501.51,103.172,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,149,-8609.5,514.028,103.627,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,150,-8608,517.308,104.573,0,0,0,0,0,0,0,0,0,0,0,0,0),(14439,151,-8601.28,523.928,106.574,0,0,0,0,0,0,0,0,0,0,0,0,0);
UPDATE creature_template SET MovementType=2, InhabitType=4 WHERE entry IN (34497, 34496);
DELETE FROM creature_movement_template WHERE entry IN (34496, 34497);
INSERT INTO creature_movement_template VALUES
(34497, 1, 572.097, 200.955, 401.193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34497, 2, 571.792, 184.486, 401.215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34497, 3, 583.332, 178.722, 401.208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34497, 4, 584.479, 167.847, 400.696, 6000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.590216, 0, 0),
(34496, 1, 554.634, 202.5, 401.184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34496, 2, 555.075, 179.826, 401.202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34496, 3, 540.257, 175.635, 400.786, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34496, 4, 540.467, 170.601, 400.772, 6000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4.886922, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(36741, 14857, 1, 1, 1, 0, 0, -29.8645, -2615.39, 97.1417, 2.856, 300, 0, 0, 55, 0, 0, 2);
UPDATE creature_template SET MovementType=2 WHERE entry =14857;
INSERT INTO creature_movement_template VALUES
(14857,1,-29.461918,-2615.942383,97.156921,2000,1485701,0,0,0,0,0,0,0,0,2.812061,0,0),(14857,2,-25.871311,-2613.071777,97.237740,10000,1485702,2000000557,0,0,0,0,0,0,0,0.434565,0,0),(14857,3,-19.149178,-2619.644287,97.206207,0,0,0,0,0,0,0,0,0,0,5.940196,0,0),(14857,4,-11.761329,-2621.954346,95.720047,0,0,0,0,0,0,0,0,0,0,0.001017,0,0),(14857,5,-9.085948,-2621.673340,94.958389,0,0,0,0,0,0,0,0,0,0,0.104689,0,0),(14857,6,-3.633063,-2621.637939,92.131180,0,0,0,0,0,0,0,0,0,0,0.006514,0,0),(14857,7,3.790725,-2621.660400,89.812195,35000,1485703,0,0,0,0,0,0,0,0,0.018295,0,0),(14857,8,-0.125211,-2621.110107,91.288040,0,0,0,0,0,0,0,0,0,0,4.495496,0,0),(14857,9,-4.097071,-2636.676514,91.979828,0,0,0,0,0,0,0,0,0,0,3.880531,0,0),(14857,10,-9.720197,-2640.140869,95.660744,0,0,0,0,0,0,0,0,0,0,3.698320,0,0),(14857,11,-21.905458,-2647.225098,95.833397,0,0,0,0,0,0,0,0,0,0,2.728352,0,0),(14857,12,-29.928484,-2641.602295,96.080391,0,0,0,0,0,0,0,0,0,0,2.425974,0,0),(14857,13,-33.601181,-2638.687256,96.445763,0,0,0,0,0,0,0,0,0,0,2.250830,0,0),(14857,14,-33.754395,-2634.782715,96.275017,0,0,0,0,0,0,0,0,0,0,1.440298,0,0),(14857,15,-31.780426,-2631.539307,95.990501,0,0,0,0,0,0,0,0,0,0,0.610917,0,0),(14857,16,-30.316862,-2631.180908,95.940948,0,0,0,0,0,0,0,0,0,0,0.021083,0,0),(14857,17,-29.142475,-2632.012695,95.948257,10000,0,0,0,0,0,0,0,0,0,5.854685,0,0),(14857,18,-29.142475,-2632.012695,95.948257,1000,0,2000000560,0,0,0,0,0,0,0,5.854685,0,0),(14857,19,-32.082474,-2632.893555,96.072723,0,0,0,0,0,0,0,0,0,0,3.654001,0,0),(14857,20,-32.984558,-2638.700439,96.384636,0,0,0,0,0,0,0,0,0,0,4.781043,0,0),(14857,21,-31.521265,-2644.058350,96.142921,0,0,0,0,0,0,0,0,0,0,5.354382,0,0),(14857,22,-24.469679,-2646.372070,95.832581,0,0,0,0,0,0,0,0,0,0,6.028555,0,0),(14857,23,-18.641375,-2646.821289,95.832581,0,0,0,0,0,0,0,0,0,0,0.601453,0,0),(14857,24,-9.770051,-2641.352539,95.589363,0,0,0,0,0,0,0,0,0,0,0.554329,0,0),(14857,25,-8.478262,-2640.574463,95.227699,0,0,0,0,0,0,0,0,0,0,0.522913,0,0),(14857,26,-3.890227,-2637.855713,92.000694,0,0,0,0,0,0,0,0,0,0,0.467935,0,0),(14857,27,4.778752,-2632.607178,89.837997,20000,1485704,0,0,0,0,0,0,0,0,0.487570,0,0),(14857,28,4.568168,-2635.551270,90.447380,0,0,0,0,0,0,0,0,0,0,5.160396,0,0),(14857,29,10.748284,-2640.516846,90.386475,0,0,0,0,0,0,0,0,0,0,5.619854,0,0),(14857,30,34.780556,-2655.085938,91.912651,0,0,0,0,0,0,0,0,0,0,5.741590,0,0),(14857,31,53.316978,-2671.718994,91.666901,0,0,0,0,0,0,0,0,0,0,5.219301,0,0),(14857,32,63.588814,-2689.054932,92.944565,0,0,0,0,0,0,0,0,0,0,4.814825,0,0),(14857,33,60.226498,-2698.291016,92.096138,0,0,0,0,0,0,0,0,0,0,4.021576,0,0),(14857,34,55.970112,-2699.551270,91.900703,0,0,0,0,0,0,0,0,0,0,2.392660,0,0),(14857,35,55.045853,-2698.405762,91.944672,20000,1485705,0,0,0,0,0,0,0,0,2.026665,0,0),(14857,36,45.898525,-2702.470947,91.700233,0,0,0,0,0,0,0,0,0,0,3.101090,0,0),(14857,37,31.040888,-2703.291992,91.667572,0,0,0,0,0,0,0,0,0,0,2.658911,0,0),(14857,38,23.505503,-2699.469482,91.734627,0,0,0,0,0,0,0,0,0,0,2.293700,0,0),(14857,39,10.482596,-2681.701416,91.750694,0,0,0,0,0,0,0,0,0,0,2.187671,0,0),(14857,40,-0.678281,-2668.660645,91.921181,0,0,0,0,0,0,0,0,0,0,2.293700,0,0),(14857,41,-8.814530,-2659.541016,95.559288,0,0,0,0,0,0,0,0,0,0,2.317262,0,0),(14857,42,-14.487419,-2643.521729,95.831528,0,0,0,0,0,0,0,0,0,0,1.861731,0,0),(14857,43,-17.088795,-2620.453125,96.330254,0,0,0,0,0,0,0,0,0,0,2.723312,0,0),(14857,44,-19.107914,-2619.602539,97.197205,0,0,0,0,0,0,0,0,0,0,2.741376,0,0),(14857,45,-29.461918,-2615.942383,97.156921,0,0,0,0,0,0,0,0,0,0,2.812061,0,0),(14857,46,-29.461918,-2615.942383,97.156921,240000,1485706,0,0,0,0,0,0,0,0,2.812061,0,0);
DELETE FROM creature_movement_scripts WHERE id BETWEEN 1485701 AND 1485706;
INSERT INTO creature_movement_scripts VALUES 
(1485701,0,25,1,14857,5,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(1485702,0,25,0,14857,5,0,0,0,0,0,0,0,0,0,0,'RUN OFF'),
(1485703,3,0,0,14857,5,0,0x02,2000000558,0,0,0,0,0,0,0,''),
(1485703,31,0,0,14857,5,0,0x02,2000000559,0,0,0,0,0,0,0,''),
(1485704,15,0,0,14857,5,0,0x02,2000000561,0,0,0,0,0,0,0,''),
(1485704,18,25,1,14857,5,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(1485705,0,25,0,14857,5,0,0,0,0,0,0,0,0,0,0,'RUN OFF'),
(1485705,3,0,0,14857,5,0,0x02,2000000562,0,0,0,0,0,0,0,''),
(1485705,8,0,0,14893,5,0,0x02,2000000563,0,0,0,0,0,0,0,''),
(1485705,9,1,21,14893,5,0,0x01,0,0,0,0,0,0,0,0,''),             
(1485705,14,1,7,14893,5,0,0x01,0,0,0,0,0,0,0,0,''),
(1485705,14,1,7,3501,5,0,0x01,0,0,0,0,0,0,0,0,''),
(1485705,21,0,0,14857,5,0,0x02,2000000564,0,0,0,0,0,0,0,''),
(1485706,0,20,1,14857,5,0,0,0,0,0,0,0,0,0,0,'movement chenged to 1:random'),
(1485706,235,20,2,14857,5,0,0,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoint');
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(2000000564, 'Zug zug! Happy to help!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2000000557,'Hmmm... Where is my fishing hook? Oh, there it is.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000558,'Let\'s see if the fish are biting.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000559,'Hmmm... I think I need better bait. I\'ll check my father\'s wagon.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000560,'Quillboar scraps! These should do the trick. Fish love Quillboar.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000561,'Caught one! I\'ll see if any of the guards are hungry. Come on Fang!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000562,'I caught a fish if you are hungry...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000563,'A nice catch it is at that! You bring honor to the Horde boy, We thank you!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
UPDATE creature_template SET MovementType=1 WHERE entry =14892;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(102094, 14892, 1, 1, 1, 0, 0, -26.3665, -2618.95, 97.31, 5.43324, 300, 5, 0, 42, 0, 0, 1);
UPDATE `creature_template` SET `minhealth` = '42',`maxhealth` = '42' WHERE `entry` =14892;
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(52954, 14850, 1, 1, 1, 0, 0, -537.488, -2986.61, 92.9323, 2.40044, 300, 0, 0, 42, 0, 0, 2);
UPDATE creature_template SET MovementType=2 WHERE entry =14850;
DELETE FROM creature_movement_template WHERE entry =14850;
INSERT INTO creature_movement_template VALUES
(14850,1,-533.573547,-2984.998291,92.891449,0,0,0,0,0,0,0,0,0,0,0.544762,0,0),(14850,2,-532.475403,-2982.788330,92.937279,8000,0,0,0,0,0,0,0,0,0,1.315238,0,0),(14850,3,-535.363220,-2986.683350,92.872704,0,0,0,0,0,0,0,0,0,0,3.697351,0,0),(14850,4,-542.794800,-2987.175781,92.978973,5000,0,0,0,0,0,0,0,0,0,3.528283,0,0),(14850,5,-539.589355,-2979.670410,93.142120,0,0,0,0,0,0,0,0,0,0,1.891512,0,0),(14850,6,-540.856995,-2972.263428,93.218491,0,0,0,0,0,0,0,0,0,0,1.823968,0,0),(14850,7,-542.508789,-2968.742188,91.666573,0,0,0,0,0,0,0,0,0,0,2.028172,0,0),(14850,8,-556.491699,-2958.448730,91.808884,0,0,0,0,0,0,0,0,0,0,3.131655,0,0),(14850,9,-560.313782,-2959.109131,91.671059,0,0,0,0,0,0,0,0,0,0,3.790605,0,0),(14850,10,-563.526733,-2961.728027,91.670532,10000,0,0,0,0,0,0,0,0,0,3.972032,0,0),(14850,11,-554.859009,-2957.945313,91.988205,0,0,0,0,0,0,0,0,0,0,6.109883,0,0),(14850,12,-542.145020,-2969.399414,91.667198,0,0,0,0,0,0,0,0,0,0,5.083374,0,0),(14850,13,-541.034119,-2970.875977,92.783127,0,0,0,0,0,0,0,0,0,0,5.097514,0,0),(14850,14,-540.202698,-2974.504883,93.244942,0,0,0,0,0,0,0,0,0,0,4.887030,0,0),(14850,15,-538.437439,-2986.249268,92.934875,0,0,0,0,0,0,0,0,0,0,5.359837,0,0),(14850,16,-534.473755,-2989.052246,92.933678,11000,1485001,0,0,0,0,0,0,0,0,6.244966,0,0),(14850,17,-537.863098,-2989.072754,92.941650,0,0,0,0,0,0,0,0,0,0,2.621139,0,0),(14850,18,-541.218079,-2972.432129,93.217178,0,0,0,0,0,0,0,0,0,0,2.006171,0,0),(14850,19,-542.573792,-2969.562012,91.666840,0,0,0,0,0,0,0,0,0,0,2.059578,0,0),(14850,20,-555.276855,-2959.603027,91.810295,0,0,0,0,0,0,0,0,0,0,3.326426,0,0),(14850,21,-557.442505,-2961.866943,91.666817,3000,0,0,0,0,0,0,0,0,0,4.019147,0,0),(14850,22,-549.292786,-2960.807861,91.770721,0,0,0,0,0,0,0,0,0,0,5.483130,0,0),(14850,23,-541.476624,-2969.215576,91.667030,0,0,0,0,0,0,0,0,0,0,4.975760,0,0),(14850,24,-540.882019,-2970.607422,92.726028,0,0,0,0,0,0,0,0,0,0,5.106141,0,0),(14850,25,-540.170898,-2974.454590,93.247406,0,0,0,0,0,0,0,0,0,0,4.645115,0,0),(14850,26,-538.799744,-2988.168457,92.916451,0,0,0,0,0,0,0,0,0,0,6.279530,0,0),(14850,27,-534.022583,-2988.809082,92.925842,12000,1485002,0,0,0,0,0,0,0,0,6.224692,0,0),(14850,28,-535.851135,-2988.203857,92.910934,0,0,0,0,0,0,0,0,0,0,2.234083,0,0),(14850,29,-537.077087,-2984.784668,92.954727,240000,1485003,0,0,0,0,0,0,0,0,2.084072,0,0);
DELETE FROM creature_movement_scripts WHERE id BETWEEN 1485001 AND 1485003;
INSERT INTO creature_movement_scripts VALUES 
(1485001,3,0,0,14850,5,0,0x02,2000000564,0,0,0,0,0,0,0,''),
(1485001,8,0,0,14859,5,0,0x02,2000000565,0,0,0,0,0,0,0,''),
(1485001,12,0,0,14850,5,0,0x02,2000000566,0,0,0,0,0,0,0,''),
(1485002,3,0,0,14850,5,0,0x02,2000000567,0,0,0,0,0,0,0,''),
(1485002,7,0,0,14859,5,0,0x02,2000000568,0,0,0,0,0,0,0,''),
(1485002,12,0,0,14850,5,0,0x02,2000000569,0,0,0,0,0,0,0,''),
(1485003,0,20,1,14850,5,0,0,0,0,0,0,0,0,0,0,'movement chenged to 1:random'),
(1485003,235,20,2,14850,5,0,0,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoint');
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(2000000564,'Would you like something more to eat sir?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000565,'More bread boy!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000566,'Right away sir.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000567,'Here is your bread sir.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000568,'Aaahh... Very good. Now scat!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000569,'As you wish sir.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(52958, 14873, 1, 1, 1, 0, 0, 280.125, -3029.01, 97.3502, 3.76837, 300, 0, 0, 42, 0, 0, 2);
UPDATE creature_template SET MovementType=2 WHERE entry =14873;
DELETE FROM creature_movement_template WHERE entry =14873;
INSERT INTO creature_movement_template VALUES
(14873,1,270.075653,-3036.604736,97.619209,0,0,0,0,0,0,0,0,0,0,3.697687,0,0),(14873,2,262.170868,-3043.449951,96.505287,21000,1487301,0,0,0,0,0,0,0,0,4.015771,0,0),(14873,3,251.328308,-3055.552979,96.145393,0,0,0,0,0,0,0,0,0,0,4.326005,0,0),(14873,4,246.887985,-3070.921143,95.279343,0,0,0,0,0,0,0,0,0,0,4.471302,0,0),(14873,5,242.448746,-3081.299316,91.820023,0,0,0,0,0,0,0,0,0,0,4.180708,0,0),(14873,6,232.825867,-3106.666748,93.316483,0,0,0,0,0,0,0,0,0,0,4.377055,0,0),(14873,7,226.409866,-3120.757568,93.347534,0,0,0,0,0,0,0,0,0,0,4.373916,0,0),(14873,8,213.920944,-3151.012207,91.285149,5000,1487302,0,0,0,0,0,0,0,0,1.334481,0,0),(14873,9,221.680664,-3147.896973,91.374046,5000,0,0,0,0,0,0,0,0,0,0.340951,0,0),(14873,10,214.549240,-3134.642822,91.987564,0,0,0,0,0,0,0,0,0,0,2.041338,0,0),(14873,11,210.930756,-3139.949951,91.651382,0,0,0,0,0,0,0,0,0,0,1.954942,0,0),(14873,12,214.058838,-3139.644043,91.699997,0,0,0,0,0,0,0,0,0,0,0.097475,0,0),(14873,13,213.426041,-3131.782227,92.129654,10000,0,2000000573,0,0,0,0,0,0,0,1.664344,0,0),(14873,14,220.194290,-3140.720215,91.751709,0,0,0,0,0,0,0,0,0,0,5.379276,0,0),(14873,15,225.395477,-3139.099854,92.084709,0,0,0,0,0,0,0,0,0,0,0.325237,0,0),(14873,16,220.856659,-3140.831787,91.766197,0,0,0,0,0,0,0,0,0,0,3.506101,0,0),(14873,17,218.769073,-3132.791748,92.498253,5000,0,0,0,0,0,0,0,0,0,1.782151,0,0),(14873,18,226.814056,-3137.556641,92.168961,10000,0,2000000574,0,0,0,0,0,0,0,5.732704,0,0),(14873,19,225.496094,-3132.888184,92.781761,0,0,0,0,0,0,0,0,0,0,1.844982,0,0),(14873,20,213.602890,-3148.386230,91.448860,0,0,0,0,0,0,0,0,0,0,4.028389,0,0),(14873,21,219.054871,-3151.196289,91.213867,5000,0,0,0,0,0,0,0,0,0,5.823023,0,0),(14873,22,220.468552,-3141.933105,91.634354,0,0,0,0,0,0,0,0,0,0,1.409085,0,0),(14873,23,214.852112,-3148.320313,91.455772,0,0,0,0,0,0,0,0,0,0,3.678886,0,0),(14873,24,218.372513,-3144.991943,91.571373,10000,0,2000000575,0,0,0,0,0,0,0,2.131649,0,0),(14873,25,224.090988,-3149.017090,91.230408,0,0,0,0,0,0,0,0,0,0,5.669868,0,0),(14873,26,224.590561,-3145.017090,91.480133,5000,0,0,0,0,0,0,0,0,0,1.330542,0,0),(14873,27,219.022003,-3147.375244,91.473511,0,0,0,0,0,0,0,0,0,0,3.580709,0,0),(14873,28,220.166611,-3139.750000,91.895775,4000,0,0,0,0,0,0,0,0,0,1.405156,0,0),(14873,29,225.032898,-3133.136230,92.802765,10000,0,2000000576,0,0,0,0,0,0,0,0.655100,0,0),(14873,30,222.021027,-3128.316650,93.042191,0,0,0,0,0,0,0,0,0,0,2.135576,0,0),(14873,31,228.338364,-3126.354736,92.959473,2000,0,0,0,0,0,0,0,0,0,0.337014,0,0),(14873,32,229.495255,-3129.216797,92.681824,3000,0,0,0,0,0,0,0,0,0,5.096528,0,0),(14873,33,232.119522,-3128.107666,92.598839,0,0,0,0,0,0,0,0,0,0,0.399846,0,0),(14873,34,227.003204,-3137.582520,92.146149,3000,0,0,0,0,0,0,0,0,0,4.256151,0,0),(14873,35,220.002029,-3132.382813,92.658958,10000,0,2000000577,0,0,0,0,0,0,0,1.852832,0,0),(14873,36,225.873978,-3102.357666,93.696220,0,0,0,0,0,0,0,0,0,0,1.381593,0,0),(14873,37,233.085556,-3085.535889,91.678841,0,0,0,0,0,0,0,0,0,0,1.157754,0,0),(14873,38,235.152176,-3069.806396,91.870636,0,0,0,0,0,0,0,0,0,0,1.334469,0,0),(14873,39,239.821350,-3061.029053,95.402153,0,0,0,0,0,0,0,0,0,0,1.051726,0,0),(14873,40,256.123444,-3047.912598,96.247345,3000,1487303,0,0,0,0,0,0,0,0,0.652743,0,0),(14873,41,267.049561,-3039.039795,96.921196,0,0,0,0,0,0,0,0,0,0,0.647245,0,0),(14873,42,271.092560,-3035.983643,97.650139,0,0,0,0,0,0,0,0,0,0,0.647245,0,0),(14873,43,278.974518,-3029.680420,97.391937,3000,1487302,0,0,0,0,0,0,0,0,0.670807,0,0),(14873,44,280.125458,-3029.009521,97.350197,240000,1487304,0,0,0,0,0,0,0,0,3.768375,0,0);
DELETE FROM creature_movement_scripts WHERE id BETWEEN 1487301 AND 1487304;
INSERT INTO creature_movement_scripts VALUES 
(1487301,0,25,1,14873,5,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(1487301,5,0,0,14873,5,0,0x02,2000000570,0,0,0,0,0,0,0,''),
(1487301,13,0,0,5907,30,0,0x02,2000000571,0,0,0,0,0,0,0,''),
(1487301,20,0,0,14873,5,0,0x02,2000000572,0,0,0,0,0,0,0,''),
(1487302,0,25,0,14873,5,0,0,0,0,0,0,0,0,0,0,'RUN OFF'),
(1487303,0,25,1,14873,5,0,0,0,0,0,0,0,0,0,0,'RUN ON'),
(1487304,0,20,1,14873,5,0,0,0,0,0,0,0,0,0,0,'movement chenged to 1:random'),
(1487304,235,20,2,14873,5,0,0,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoint');
REPLACE INTO `db_script_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(2000000570,'Can I go collect more rocks for my necklace, Papa?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000571,'Yes you may, $N. But do not stray too far from home.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000572,'Dabu! I will be careful Papa!',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000573,'Ooohh... This rock is nice and colorful. Let\'s see if I can find more like it...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000574,'Hmm... That rock is nice, but too small.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000575,'This is a shiney rock. I\'ll put it in my bucket. Ok, I just need a few more...',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000576,'I bet my friend Gruk would like this rock for the spear he is making! It\'s very sharp... I hope he likes it.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(2000000577,'There... That should be enough rocks to make a necklace. I should probably get home now anyway.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(18298, 1533, 0, 1, 1, 0, 0, 2869.45, 1046.28, 114.79, 0.08547, 72000, 0, 0, 190, 0, 0, 2);
DELETE FROM creature_movement WHERE id =18298;
UPDATE creature_template SET MovementType=2 WHERE entry =1533;
DELETE FROM creature_movement_template WHERE entry =1533;
INSERT INTO creature_movement_template VALUES
(1533,1,2882.234863,1037.631470,111.597160,0,0,0,0,0,0,0,0,0,0,5.322506,0,0),(1533,2,2891.749756,1028.414307,107.154053,0,0,0,0,0,0,0,0,0,0,5.503148,0,0),(1533,3,2897.441406,1009.807312,108.329758,0,0,0,0,0,0,0,0,0,0,4.793150,0,0),(1533,4,2898.231689,975.085938,114.218216,0,0,0,0,0,0,0,0,0,0,4.683818,0,0),(1533,5,2898.812500,957.889343,115.079376,0,0,0,0,0,0,0,0,0,0,5.082799,0,0),(1533,6,2900.896973,948.053772,115.271858,0,0,0,0,0,0,0,0,0,0,5.166049,0,0),(1533,7,2908.082520,932.171265,114.899277,0,0,0,0,0,0,0,0,0,0,4.745856,0,0),(1533,8,2908.555908,927.233459,114.845467,0,0,0,0,0,0,0,0,0,0,4.379866,0,0),(1533,9,2904.407227,921.067566,114.925392,0,0,0,0,0,0,0,0,0,0,3.869363,0,0),(1533,10,2897.886719,915.506348,114.759796,0,0,0,0,0,0,0,0,0,0,3.544208,0,0),(1533,11,2891.886230,912.365784,114.578644,0,0,0,0,0,0,0,0,0,0,3.889983,0,0),(1533,12,2864.543457,888.053589,112.785294,0,0,0,0,0,0,0,0,0,0,3.827151,0,0),(1533,13,2846.075684,873.334290,112.198936,0,0,0,0,0,0,0,0,0,0,3.421100,0,0),(1533,14,2822.722656,864.899414,111.841385,0,0,0,0,0,0,0,0,0,0,3.776100,0,0),(1533,15,2805.188721,861.231201,111.841385,0,0,0,0,0,0,0,0,0,0,2.994629,0,0),(1533,16,2792.857422,863.311035,111.756294,0,0,0,0,0,0,0,0,0,0,2.828910,0,0),(1533,17,2785.889160,866.450378,111.557671,0,0,0,0,0,0,0,0,0,0,2.454275,0,0),(1533,18,2763.864258,884.345764,111.467522,0,0,0,0,0,0,0,0,0,0,2.181740,0,0),(1533,19,2752.145996,900.057007,111.774910,0,0,0,0,0,0,0,0,0,0,2.065500,0,0),(1533,20,2745.138184,912.962952,110.819328,0,0,0,0,0,0,0,0,0,0,1.792967,0,0),(1533,21,2735.777588,942.470947,109.497566,0,0,0,0,0,0,0,0,0,0,1.705789,0,0),(1533,22,2733.875000,952.497131,109.278404,0,0,0,0,0,0,0,0,0,0,1.657879,0,0),(1533,23,2733.971680,964.451111,109.261559,0,0,0,0,0,0,0,0,0,0,0.938454,0,0),(1533,24,2735.983154,972.288513,109.316231,0,0,0,0,0,0,0,0,0,0,0.947093,0,0),(1533,25,2748.275879,980.282471,109.315926,0,0,0,0,0,0,0,0,0,0,0.524548,0,0),(1533,26,2759.917725,988.789368,109.336464,0,0,0,0,0,0,0,0,0,0,0.960444,0,0),(1533,27,2767.274170,997.694153,109.877174,0,0,0,0,0,0,0,0,0,0,1.188995,0,0),(1533,28,2770.281494,1005.854919,109.476776,0,0,0,0,0,0,0,0,0,0,1.492944,0,0),(1533,29,2772.895508,1017.252197,108.610191,0,0,0,0,0,0,0,0,0,0,1.444654,0,0),(1533,30,2773.854004,1027.457031,108.478432,0,0,0,0,0,0,0,0,0,0,1.209035,0,0),(1533,31,2790.310059,1042.247437,110.684433,0,0,0,0,0,0,0,0,0,0,0.133824,0,0),(1533,32,2810.028809,1038.343506,111.126541,0,0,0,0,0,0,0,0,0,0,0.012089,0,0),(1533,33,2824.447510,1037.321289,112.118187,0,0,0,0,0,0,0,0,0,0,0.042716,0,0),(1533,34,2839.396240,1037.625488,113.926575,0,0,0,0,0,0,0,0,0,0,0.019154,0,0),(1533,35,2853.289795,1041.898193,115.650299,0,0,0,0,0,0,0,0,0,0,0.321532,0,0),(1533,36,2861.556641,1043.203979,115.985260,0,0,0,0,0,0,0,0,0,0,0.681244,0,0),(1533,37,2882.234863,1037.631470,111.597160,180000,153301,0,0,0,0,0,0,0,0,5.322506,0,0);
DELETE FROM creature_movement_scripts WHERE id =153301;
INSERT INTO creature_movement_scripts VALUES 
(153301,0,20,1,1533,5,0,0,0,0,0,0,0,0,0,0,'movement chenged to 1:random'),
(153301,175,20,2,1533,5,0,0,0,0,0,0,0,0,0,0,'movement chenged to 2:waypoint');
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(16737, 10358, 0, 1, 1, 0, 0, 2013.67, -353.764, 35.5772, 3.17405, 28800, 0, 0, 230, 249, 0, 2);
UPDATE creature_template SET MovementType=2 WHERE entry =10358;
DELETE FROM creature_movement_template WHERE entry =10358;
INSERT INTO creature_movement_template VALUES
(10358,1,2036.659912,-353.642914,35.452232,0,0,0,0,0,0,0,0,0,0,6.254904,0,0),(10358,2,2043.964111,-354.653107,35.452232,0,0,0,0,0,0,0,0,0,0,5.398823,0,0),(10358,3,2046.375000,-360.966034,35.452232,0,0,0,0,0,0,0,0,0,0,4.655053,0,0),(10358,4,2042.156860,-387.225464,35.452232,0,0,0,0,0,0,0,0,0,0,4.568660,0,0),(10358,5,2036.028809,-407.442932,35.452232,0,0,0,0,0,0,0,0,0,0,3.681161,0,0),(10358,6,2020.624512,-414.319489,35.452232,0,0,0,0,0,0,0,0,0,0,3.249977,0,0),(10358,7,1988.397827,-419.329132,35.452232,0,0,0,0,0,0,0,0,0,0,3.102322,0,0),(10358,8,1967.264648,-416.863159,35.452232,0,0,0,0,0,0,0,0,0,0,2.558040,0,0),(10358,9,1962.458252,-408.134827,35.452232,0,0,0,0,0,0,0,0,0,0,1.623416,0,0),(10358,10,1965.091187,-379.316803,35.452232,0,0,0,0,0,0,0,0,0,0,1.442775,0,0),(10358,11,1967.548706,-353.691772,35.452332,0,0,0,0,0,0,0,0,0,0,0.803460,0,0),(10358,12,1974.299316,-347.861053,35.452332,0,0,0,0,0,0,0,0,0,0,0.207343,0,0),(10358,13,2013.399902,-354.364166,35.452332,0,0,0,0,0,0,0,0,0,0,5.991805,0,0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(18612, 1531, 0, 1, 1, 0, 0, 2380.35, 630.252, 30.2444, 1.33931, 300, 20, 0, 120, 0, 0, 1),
(17626, 1531, 0, 1, 1, 0, 0, 2463.78, 623.208, 29.7211, 4.7822, 300, 20, 0, 120, 0, 0, 1);
DELETE FROM creature_movement WHERE id in (18657,18257,18330);
UPDATE creature_template SET MovementType = 2 WHERE entry in (1654, 1655, 1656);
DELETE FROM creature_movement_template WHERE entry in (1654, 1655, 1656);
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z,waittime,orientation) VALUES
(1654,1,2954.670,921.348,114.453,10000,0.278),(1654,2,2960.649,941.661,117.814,0,1.462),(1654,3,2962.630,954.783,118.986,0,1.519),(1654,4,2963.028,961.444,118.213,0,1.350),(1654,5,2964.215,971.858,117.581,0,1.476),(1654,6,2960.427,984.954,115.614,0,2.324),(1654,7,2951.965,993.581,112.339,0,2.391),(1654,8,2940.291,1002.997,107.373,0,2.591),(1654,9,2932.389,1006.996,105.500,0,2.870),(1654,10,2923.450,1009.282,105.386,0,3.011),(1654,11,2915.271,1009.375,106.108,0,3.270),(1654,12,2907.635,1007.441,107.999,0,3.400),(1654,13,2899.513,1005.622,108.803,0,3.494),(1654,14,2890.686,1000.727,110.991,0,3.416),(1654,15,2885.694,999.757,112.736,0,3.023),(1654,16,2878.479,1000.118,114.187,0,2.375),(1654,17,2857.481,1016.484,118.305,10000,2.163),(1654,18,2878.479,1000.118,114.187,0,5.375),(1654,19,2885.694,999.757,112.736,0,0.023),(1654,20,2890.686,1000.727,110.991,0,0.416),(1654,21,2899.513,1005.622,108.803,0,0.494),(1654,22,2907.635,1007.441,107.999,0,0.400),(1654,23,2915.271,1009.375,106.108,0,0.270),(1654,24,2923.450,1009.282,105.386,0,0.011),(1654,25,2932.389,1006.996,105.500,0,5.870),(1654,26,2940.291,1002.997,107.373,0,5.591),(1654,27,2951.965,993.581,112.339,0,5.391),(1654,28,2960.427,984.954,115.614,0,5.324),(1654,29,2964.215,971.858,117.581,0,4.476),(1654,30,2963.028,961.444,118.213,0,4.350),(1654,31,2962.630,954.783,118.986,0,4.519),(1654,32,2960.649,941.661,117.814,0,4.462),(1654,33,2954.670,921.348,114.453,0,3.278);
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z,waittime,orientation) VALUES
(1656,1,2792.546,1081.345,110.791,25000,5.769),(1656,2,2797.603,1079.120,110.721,0,5.431),(1656,3,2800.416,1075.000,110.763,0,5.097),(1656,4,2799.699,1063.836,110.821,0,4.046),(1656,5,2811.65,1053.68,110.787,0,5.94238),(1656,6,2825.079102,1051.587646,110.638588,0,0.032255),(1656,7,2851.862061,1056.032104,112.373383,0,0.079380),(1656,8,2866.013916,1058.795532,112.843643,0,0.587533),(1656,9,2877.079346,1073.879761,109.737068,0,1.175795),(1656,10,2882.517822,1089.793945,109.831650,0,1.387068),(1656,11,2881.411621,1098.866455,111.110802,0,1.928207),(1656,12,2877.029785,1103.755737,113.448441,0,2.699469),(1656,13,2869.690186,1105.059326,115.032806,0,3.126726),(1656,14,2863.504395,1102.663940,116.288620,0,3.688285),(1656,15,2859.782227,1100.346802,116.920830,0,4.051925),(1656,16,2857.014404,1096.493530,117.340324,20000,1.181051),(1656,17,2861.571045,1100.969238,116.707039,0,0.485189),(1656,18,2869.186768,1105.028320,115.132454,0,0.199304),(1656,19,2876.696533,1103.997559,113.536797,0,5.787412),(1656,20,2881.453857,1100.720825,111.755867,0,5.360159),(1656,21,2884.386475,1092.615967,109.653641,0,4.781323),(1656,22,2883.235840,1085.973267,109.252556,0,4.420042),(1656,23,2878.329102,1078.119873,109.706764,0,4.287312),(1656,24,2873.258301,1066.799805,110.887009,0,4.291238),(1656,25,2868.107422,1059.597534,112.478073,0,3.658994),(1656,26,2859.541992,1056.315918,113.188423,0,3.201107),(1656,27,2833.718506,1051.518433,110.929962,0,3.330698),(1656,28,2815.480225,1049.113281,110.820122,0,3.122567),(1656,29,2787.873,1050.872,110.514,0,3.878),(1656,30,2782.972,1046.371,109.678,0,3.748),(1656,31,2779.337,1044.128,108.994,0,3.426),(1656,32,2776.436,1044.545,108.677,0,2.543),(1656,33,2774.447,1046.329,108.758,0,1.977),(1656,34,2769.029,1068.246,110.734,80000,1.820),(1656,35,2774.447,1046.329,108.758,0,4.977),(1656,36,2776.436,1044.545,108.677,0,5.543),(1656,37,2779.337,1044.128,108.994,0,0.426),(1656,38,2782.972,1046.371,109.678,0,0.748),(1656,39,2787.873,1050.872,110.514,0,3.878),(1656,40,2799.699,1063.836,110.821,0,1.046),(1656,41,2800.416,1075.000,110.763,0,2.097),(1656,42,2797.603,1079.120,110.721,0,2.431);
INSERT INTO creature_movement_template (entry, point, position_x, position_y, position_z,waittime,orientation) VALUES
(1655,1,2742.709,785.519,119.133,25000,0.454),(1655,2,2747.480,789.889,119.131,0,0.981),(1655,3,2749.939,797.442,119.108,0,0.871),(1655,4,2753.927,798.877,119.091,0,0.086),(1655,5,2756.686,798.914,119.131,0,5.933),(1655,6,2763.927,796.199,114.367,0,5.395),(1655,7,2764.541,794.093,114.367,0,4.295),(1655,8,2762.543,791.399,114.367,0,3.644),(1655,9,2758.799,790.731,114.367,0,2.941),(1655,10,2752.163,792.589,114.367,0,3.467),(1655,11,2751.12,799.975,114.367,0,1.29676),(1655,12,2752.026611,803.194946,114.245232,15000,1.320318),(1655,13,2748.365,790.155,114.367,0,4.268),(1655,14,2746.259,783.310,114.837,80000,1.247),(1655,15,2748.365,790.155,114.367,0,1.268),(1655,16,2751.12,799.975,114.367,0,1.29676),(1655,17,2752.026611,803.194946,114.245232,15000,1.320318),(1655,18,2752.163,792.589,114.367,0,0.467),(1655,19,2758.799,790.731,114.367,0,5.941),(1655,20,2762.543,791.399,114.367,0,0.644),(1655,21,2764.541,794.093,114.367,0,1.295),(1655,22,2763.927,796.199,114.367,0,2.395),(1655,23,2756.686,798.914,119.131,0,2.933),(1655,24,2753.927,798.877,119.091,0,3.086),(1655,25,2749.939,797.442,119.108,0,3.871),(1655,26,2747.480,789.889,119.131,0,3.981),(1655,27,2742.709,785.519,119.133,0,3.454);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(97343, 25428, 571, 1, 1, 0, 0, 4457.88, 5241.73, 74.4109, 5.03238, 600, 15, 0, 7984, 3080, 1),
(111385, 31718, 571, 1, 1, 0, 0, 7930.02, 1022.7, 462.613, 5.22892, 300, 0, 0, 12600, 3994, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
(98952, 30102, 571, 1, 1, 0, 0, 5823.54, -2910.77, 303.546, 3.70443, 600, 0, 0, 10635, 0, 0),
(111940, 31140, 571, 1, 1, 0, 0, 6582.88, 1116.38, 273.358, 0.355237, 300, 0, 0, 12600, 0, 0);
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '0',`groupid` = '1' WHERE `entry` in (51999,52000,52001,52002,52003,52004,52005);
UPDATE `item_loot_template` SET `ChanceOrQuestChance` = '50' WHERE `item` in (51994,51996,51992,51993,51995,51991);
UPDATE `creature_template` SET `equipment_id` = '1945' WHERE `entry` =35012;
REPLACE INTO `game_event_creature` (`guid`, `event`) VALUES (111351, 2);
DELETE FROM `event_scripts` WHERE `id` = 5991 AND `delay` = 5 AND `command` = 7 AND `datalong` = 6001;
DELETE FROM `event_scripts` WHERE `id` = 6028 AND `delay` = 5 AND `command` = 7 AND `datalong` = 6002;
UPDATE `gossip_menu_option` SET `option_text` = 'You have fought well, spirit.  I ask you to grant me the strength of your body and the strength of your heart.' WHERE `menu_id` =3862 AND `id` =0;
UPDATE `gossip_menu_option` SET `option_text` = 'You have fought well, spirit.  I ask you to grant me the strength of your body and the strength of your heart.' WHERE `menu_id` =3862 AND `id` =1;
UPDATE `quest_template` SET `RequestItemsText` = 'The Stormpike Brigade cannot charge into battle bareback! We require harnesses for our mounts, after all, we are not savages.$B$BWhile we could easily slay the rams that roam near our base for the leather required to fashion a harness, doing so would be idiotic. We need those rams for mounts.$B$BYou must strike at our enemy''s base, slaying the frostwolves they use as mounts and taking their hides. Return their hides to me so that harnesses may be made for the cavalry. Go! ' WHERE `entry` = 7026;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=50 WHERE `item`=38551;
DELETE FROM `creature_loot_template` WHERE `entry` = 16949 AND `item` = 29797;
DELETE FROM `creature_loot_template` WHERE `entry` = 18858 AND `item` = 29797;
DELETE FROM `creature_loot_template` WHERE `entry` = 5981 AND `item` = 15727;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '1' WHERE `entry` =6005 AND `item` =15727;
DELETE FROM `creature_loot_template` WHERE `entry` = 23873 AND `item` = 33085;
UPDATE `quest_template` SET `RequestItemsText` = 'The Stormpike Brigade cannot charge into battle bareback! We require harnesses for our mounts, after all, we are not savages.$B$BWhile we could easily slay the rams that roam near our base for the leather required to fashion a harness, doing so would be idiotic. We need those rams for mounts.$B$BYou must strike at our enemy''s base, slaying the frostwolves they use as mounts and taking their hides. Return their hides to me so that harnesses may be made for the cavalry. Go!' WHERE `entry` = 7026;
UPDATE `quest_template` SET `RequiredRaces` = '1101' WHERE `entry` in (13427,13477,7221);
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =13475;
UPDATE `quest_template` SET `SpecialFlags` = '0' WHERE `entry` in (8369,8375);
UPDATE `quest_template` SET `PrevQuestId` = '8369' WHERE `entry` =8387;
UPDATE `quest_template` SET `NextQuestId` = '0',`NextQuestInChain` = '0' WHERE `entry` =8375;
UPDATE `quest_template` SET `PrevQuestId` = '8375' WHERE `entry` =8383;
DELETE FROM `creature_questrelation` WHERE `quest` = 7222;
REPLACE INTO `creature_involvedrelation` (`id`, `quest`) VALUES ('13816', '7221');
DELETE FROM `creature_questrelation` WHERE `id` = 4949 AND `quest` = 13370;
DELETE FROM `creature_involvedrelation` WHERE `id` = 4949 AND `quest` = 13369;
DELETE FROM `creature_involvedrelation` WHERE `id` = 4949 AND `quest` = 13267;
DELETE FROM `creature_questrelation` WHERE `id` = 4949 AND `quest` = 13266;
DELETE FROM `creature_involvedrelation` WHERE `id` = 4949 AND `quest` = 13257;
UPDATE `quest_template` SET `SpecialFlags` = '0' WHERE `entry` in (7202,7365,7361,7364,7363,7366,7082,7081,7181,7362);
UPDATE `quest_template` SET `PrevQuestId` = '7202' WHERE `entry` =7382;
UPDATE `quest_template` SET `PrevQuestId` = '7181' WHERE `entry` =7381;
UPDATE `quest_template` SET `PrevQuestId` = '7365' WHERE `entry` =7425;
UPDATE `quest_template` SET `PrevQuestId` = '7361' WHERE `entry` =7421;
UPDATE `quest_template` SET `PrevQuestId` = '7364' WHERE `entry` =7424;
UPDATE `quest_template` SET `PrevQuestId` = '7362' WHERE `entry` =7422;
UPDATE `quest_template` SET `PrevQuestId` = '7363' WHERE `entry` =7423;
UPDATE `quest_template` SET `PrevQuestId` = '7366' WHERE `entry` =7426;
REPLACE INTO `creature_questrelation` (`id`, `quest`) VALUES ('13154', '7363');
REPLACE INTO `creature_involvedrelation` (`id`, `quest`) VALUES ('13154', '7363');
UPDATE `creature_template` SET `faction_A` = '1078',`faction_H` = '1078' WHERE `entry` in (13446,22621,37292,31973);
UPDATE `creature_template` SET `npcflag` = '0' WHERE `entry` in (2386,2405);
DELETE FROM `npc_gossip` WHERE `npc_guid` = 12260;
UPDATE `quest_template` SET `NextQuestId` = '0',`NextQuestInChain` = '0' WHERE `entry`in (7221,7222);
UPDATE `quest_template` SET `SpecialFlags` = '0' WHERE `entry` in (654,841,10076,10074);
DELETE FROM `creature_loot_template` WHERE `entry` = 8208 AND `item` = 9439;
UPDATE `skinning_loot_template` SET `ChanceOrQuestChance` = '0' WHERE `entry` =8208 AND `item` =4304;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '-20' WHERE `item` in (9439,9442,9437);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance` = '10' WHERE `item` in (26043,26042);
UPDATE `quest_template` SET `RequiredRaces` = '1101',`PrevQuestId` = '10076' WHERE `entry` =10077;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =10074;
UPDATE `quest_template` SET `RequiredRaces` = '1101' WHERE `entry` =10076;
UPDATE `quest_template` SET `RequiredRaces` = '690',`PrevQuestId` = '10074' WHERE `entry` =10075;
UPDATE `creature_questrelation` SET `quest` = '10075' WHERE `id` =18816 AND `quest` =10077;
UPDATE `creature_questrelation` SET `quest` = '10077' WHERE `id` =18817 AND `quest` =10075;
UPDATE `creature_involvedrelation` SET `quest` = '10077' WHERE `id` =18817 AND `quest` =10075;
UPDATE `creature_involvedrelation` SET `quest` = '10075' WHERE `id` =18816 AND `quest` =10077;
UPDATE `creature_template` SET `faction_A` = '35',`faction_H` = '35' WHERE `entry` =13936;
UPDATE `quest_template` SET `PrevQuestId` = '8304',`NextQuestId` = '8314',`ExclusiveGroup` = '-8309' WHERE `entry` in (8309,8310);
UPDATE `quest_template` SET `SpecialFlags` = '0',`PrevQuestId` = '0' WHERE `entry` =8314;
UPDATE `creature_questrelation` SET `quest` = '8268' WHERE `id` =14781 AND `quest` =8266;
UPDATE `creature_questrelation` SET `quest` = '8269' WHERE `id` =14781 AND `quest` =8267;
UPDATE `creature_questrelation` SET `quest` = '8266' WHERE `id` =14733 AND `quest` =8268;
UPDATE `creature_questrelation` SET `quest` = '8267' WHERE `id` =14733 AND `quest` =8269;
UPDATE `creature_involvedrelation` SET `quest` = '8268' WHERE `id` =14781 AND `quest` =8266;
UPDATE `creature_involvedrelation` SET `quest` = '8269' WHERE `id` =14781 AND `quest` =8267;
UPDATE `creature_involvedrelation` SET `quest` = '8266' WHERE `id` =14733 AND `quest` =8268;
UPDATE `creature_involvedrelation` SET `quest` = '8267' WHERE `id` =14733 AND `quest` =8269;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` in (8268,8269);
UPDATE `quest_template` SET `RequiredRaces` = '1101' WHERE `entry` in (8266,8267);
UPDATE `quest_template` SET `SpecialFlags` = '0' WHERE `entry` in (8105,8166,8167,8168,8171,8170,8169,8120);
UPDATE `gameobject_template` SET `data0` = '259' WHERE `entry` in (174610,174711,174619,174613,174618,174617,174616,164884);
UPDATE `gameobject_template` SET `data2` = '2244' WHERE `entry` =171943;
UPDATE `gameobject_template` SET `data3` = '0' WHERE `name` LIKE '%Cleansed %';

# NeatElves_Mangos
REPLACE INTO `quest_end_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES
(4444, 0, 27, 4, 174605, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4444, 180, 27, 8, 174605, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(996, 0, 27, 4, 164887, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(996, 180, 27, 8, 164887, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(998, 0, 27, 4, 173327, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(998, 180, 27, 8, 173327, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(1514, 0, 27, 4, 174599, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(1514, 180, 27, 8, 174599, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2523, 0, 27, 4, 164886, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2523, 180, 27, 8, 164886, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2878, 0, 27, 4, 171939, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2878, 180, 27, 8, 171939, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(3363, 0, 27, 4, 171942, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(3363, 180, 27, 8, 171942, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4113, 0, 27, 4, 174594, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4113, 180, 27, 8, 174594, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4114, 0, 27, 4, 174595, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4114, 180, 27, 8, 174595, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4115, 0, 27, 4, 174600, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4115, 180, 27, 8, 174600, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4116, 0, 27, 4, 174596, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4116, 180, 27, 8, 174596, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4117, 0, 27, 4, 164888, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4117, 180, 27, 8, 164888, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4118, 0, 27, 4, 174597, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4118, 180, 27, 8, 174597, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4119, 0, 27, 4, 164885, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4119, 180, 27, 8, 164885, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4221, 0, 27, 4, 174601, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4221, 180, 27, 8, 174601, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4222, 0, 27, 4, 174602, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4222, 180, 27, 8, 174602, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4343, 0, 27, 4, 174603, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4343, 180, 27, 8, 174603, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4401, 0, 27, 4, 174598, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4401, 180, 27, 8, 174598, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4403, 0, 27, 4, 174604, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4403, 180, 27, 8, 174604, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4443, 0, 27, 4, 173284, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4443, 180, 27, 8, 173284, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4445, 0, 27, 4, 174606, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4445, 180, 27, 8, 174606, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4446, 0, 27, 4, 174607, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4446, 180, 27, 8, 174607, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4447, 0, 27, 4, 174684, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4447, 180, 27, 8, 174684, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4448, 0, 27, 4, 173324, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4448, 180, 27, 8, 173324, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4461, 0, 27, 4, 174686, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4461, 180, 27, 8, 174686, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4462, 0, 27, 4, 174608, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4462, 180, 27, 8, 174608, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4464, 0, 27, 4, 174712, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4464, 180, 27, 8, 174712, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4465, 0, 27, 4, 174713, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4465, 180, 27, 8, 174713, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4466, 0, 27, 4, 174708, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4466, 180, 27, 8, 174708, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4467, 0, 27, 4, 174709, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4467, 180, 27, 8, 174709, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');
REPLACE INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `datalong3`, `datalong4`, `data_flags`, `dataint`, `dataint2`, `dataint3`, `dataint4`, `x`, `y`, `z`, `o`, `comments`) VALUES 
(4102, 5, 27, 8, 164887, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4235, 5, 27, 8, 174605, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4185, 5, 27, 8, 173327, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4192, 5, 27, 8, 174599, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4059, 5, 27, 8, 164886, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4079, 5, 27, 8, 171939, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4215, 5, 27, 8, 174594, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4216, 5, 27, 8, 174595, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4193, 5, 27, 8, 174600, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4217, 5, 27, 8, 174596, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4118, 5, 27, 8, 164888, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4218, 5, 27, 8, 174597, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(293, 5, 27, 8, 164885, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(2244, 5, 27, 8, 171942, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4194, 5, 27, 8, 174601, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4195, 5, 27, 8, 174602, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4196, 5, 27, 8, 174603, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4219, 5, 27, 8, 174598, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4197, 5, 27, 8, 174604, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4234, 5, 27, 8, 173284, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4236, 5, 27, 8, 174606, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4237, 5, 27, 8, 174607, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4178, 5, 27, 8, 174684, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4247, 5, 27, 8, 173324, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4260, 5, 27, 8, 174686, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4265, 5, 27, 8, 174608, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4276, 5, 27, 8, 174712, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4280, 5, 27, 8, 174713, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4284, 5, 27, 8, 174708, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
(4288, 5, 27, 8, 174709, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

# NeatElves
UPDATE `quest_template` SET `RequiredRaces` = '1101' WHERE `entry` =10558;
UPDATE `quest_template` SET `RequiredRaces` = '690' WHERE `entry` =10559;

# Fix
DELETE FROM `creature_loot_template` WHERE `entry`=11671;
UPDATE `creature_template` SET `lootid`=0 WHERE `entry`=11671;
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=ABS(`ChanceOrQuestChance`) WHERE `item`=38551;

# SD2_2335
UPDATE creature_template SET ScriptName='boss_alar' WHERE entry=19514;
UPDATE creature_template SET ScriptName='' WHERE entry=3216;
UPDATE creature_template SET ScriptName='' WHERE entry=16224;
UPDATE creature_template SET ScriptName='' WHERE entry=28315;
UPDATE creature_template SET ScriptName='' WHERE entry=8479;
UPDATE creature_template SET ScriptName='boss_muru' WHERE entry=25741;
UPDATE creature_template SET ScriptName='boss_entropius' WHERE entry=25840;
UPDATE creature_template SET ScriptName='npc_portal_target' WHERE entry=25770;
UPDATE creature_template SET ScriptName='npc_void_sentinel_summoner' WHERE entry=25782;


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
DELETE FROM `creature_movement` WHERE `id` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `npc_gossip` WHERE `npc_guid` NOT IN (SELECT `guid` FROM `creature`);
DELETE FROM `game_event_gameobject` WHERE `guid` NOT IN (SELECT `guid` FROM `gameobject`);
DELETE FROM `game_event_creature` WHERE `guid` NOT IN (SELECT `guid` FROM `creature`);
UPDATE creature_template SET unit_flags=unit_flags&~2048 WHERE unit_flags&2048=2048;
UPDATE creature_template SET unit_flags=unit_flags&~524288 WHERE unit_flags&524288=524288;
UPDATE creature_template SET unit_flags=unit_flags&~67108864 WHERE unit_flags&67108864=67108864;
UPDATE creature_template SET unit_flags=unit_flags&~8388608 WHERE unit_flags&8388608=8388608;
UPDATE `creature`, `creature_template` SET `creature`.`curhealth`=`creature_template`.`minhealth`,`creature`.`curmana`=`creature_template`.`minmana` WHERE `creature`.`id`=`creature_template`.`entry` and `creature_template`.`RegenHealth` = '1';
UPDATE `creature` SET `MovementType` = 0 WHERE `spawndist` = 0 AND `MovementType`=1;
UPDATE `creature` SET `spawndist`=0 WHERE `MovementType`=0;
UPDATE `creature` SET `spawntimesecs` = 300 WHERE `spawntimesecs` = 25;
UPDATE `gameobject` SET `spawntimesecs` = 300 WHERE `spawntimesecs` = 25;
UPDATE `creature_template` SET `scale` = 1 WHERE `scale` = 0;
UPDATE `creature` SET `spawndist` = 0, `MovementType` = 2 WHERE guid in (select distinct(id) from creature_movement);
UPDATE `creature` SET `spawndist` = 0, `MovementType` = 2 WHERE id in (select distinct(entry) from creature_movement_template);
UPDATE `creature` LEFT JOIN (`creature_movement`) ON (`creature_movement`.`id`=`creature`.`guid`) LEFT JOIN (`creature_movement_template`) ON (`creature_movement_template`.`entry`=`creature`.`id`) SET `creature`.`spawndist`=5, `creature`.`MovementType`=1 WHERE `creature`.`MovementType`=2 AND (`creature_movement`.`id` IS NULL AND `creature_movement_template`.`entry` IS NULL);
# UPDATE `creature` SET `spawndist` = 5, `MovementType` = 1 WHERE MovementType=2 and guid not in (select distinct(id) from creature_movement);
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 0;
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 3;
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 10;
UPDATE gameobject_template, gameobject set gameobject.animprogress = 100 where gameobject_template.entry = gameobject.id and gameobject_template.type = 25;
UPDATE `gameobject` SET `state`=1 WHERE `state`=0 AND `id` IN (SELECT entry FROM `gameobject_template` WHERE `type`=3);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (SELECT `id` FROM `creature_questrelation`);
UPDATE `creature_template` SET `npcflag`=`npcflag`|2 WHERE `entry` IN (SELECT `id` FROM `creature_involvedrelation`);
UPDATE `gameobject` SET `state` = 0 WHERE `id` IN (SELECT `entry` FROM `gameobject_template` WHERE `type` = 0 AND `data0` = 1);
UPDATE `gameobject_template` SET `flags`=`flags`&~4 WHERE `type` IN (2,19,17);
DELETE FROM `gameobject_scripts` WHERE `id` NOT IN (SELECT `guid` FROM `gameobject`);
DELETE FROM `gameobject_scripts` WHERE `command` in (11, 12) and `datalong` NOT IN (SELECT `guid` FROM `gameobject`);
DELETE FROM `creature_onkill_reputation` WHERE `creature_id` NOT IN (SELECT `entry` FROM `creature_template`);
UPDATE creature_addon SET moveflags=moveflags &~ 0x00000100;
# UPDATE creature_addon SET moveflags=moveflags &~ 0x00000800;
UPDATE creature_addon SET moveflags=moveflags &~ 0x00200000;
UPDATE creature_addon SET moveflags=moveflags &~ 0x08000000;
UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00000100;
# UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00000800;
UPDATE creature_template_addon SET moveflags=moveflags &~ 0x00200000;
UPDATE creature_template_addon SET moveflags=moveflags &~ 0x08000000;
UPDATE `item_template` SET `spelltrigger_2` = 0 WHERE `spellid_2` = 0 AND `spelltrigger_2` = 6;
UPDATE `creature_template` SET `ScriptName` = '' WHERE `AIName` = 'EventAI' AND `ScriptName` = 'generic_creature';
UPDATE `creature_template` SET npcflag = npcflag|1 WHERE `gossip_menu_id` > 0;
UPDATE quest_template SET SpecialFlags=SpecialFlags|1 WHERE SpecialFlags=4;

UPDATE db_version SET `cache_id`= '611';
UPDATE db_version SET `version`= 'YTDB_0.14.4_R611_MaNGOS_R11847_SD2_R2335_ACID_R309_RuDB_R44';
