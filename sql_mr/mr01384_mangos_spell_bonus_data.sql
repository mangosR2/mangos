-- Spell bonus data
-- Lifebloom
UPDATE `spell_bonus_data` SET `direct_bonus`= 0.8 WHERE `entry`= 33763;

DELETE FROM `spell_bonus_data` WHERE entry IN (30451, 51963, 52042, 52752, 54158, 56161, 58621, 64844, 64085);
INSERT INTO `spell_bonus_data`
    (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`)
VALUES
    -- Gargoyle Strike
    (51963, 0, 0, 0.33, 0,'Gargoyle Strike'),
    -- Healing Stream Totem
    (52042, 0, 0, 0, 0,'Healing Stream Totem'),
    -- Ancestral Awakening
    (52752, 0, 0, 0, 0,'Ancestral Awakening'),
    -- Judgement
    (54158, 0, 0, 0, 0,'Judgement'),
    -- Glyph of  Prayer of Healing
    (56161, 0, 0, 0, 0,'Glyph of Prayer of Healing'),
    -- Glyph of Chains of Ice (it's correct, but bonus value is simple)
    (58621, 0, 0, 0.08, 0, 'Glyph of Chains of Ice'),
    -- Priest - Divine Hymn
    (64844, 0.564, 0, 0, 0, 'Priest - Divine Hymn'),
    -- Priest - Vampiric Touch Dispel
    (64085, 2.4, 0, 0, 0, 'Priest - Vampiric Touch Dispel');

-- SPELL_AURA_DAMAGE_SHIELD by Warlord
DELETE FROM `spell_bonus_data` WHERE `entry` IN (7294, 467, 2947);
INSERT INTO `spell_bonus_data`(`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`) VALUES
    ( 467, 0.033, 0, 0, 0,'Druid - Thorns'),
    (7294, 0.033, 0, 0, 0,'Paladin - Retribution Aura'),
    (2947, 0.033, 0, 0, 0,'Warlock - Fire Shield (Imp)');

-- Item's
DELETE FROM `spell_bonus_data` WHERE `entry` IN (16614, 45055, 60488);
INSERT INTO `spell_bonus_data`(`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`) VALUES
(16614, 0, 0, 0, 0, 'Item - Storm Gauntlets - Lightning Strike'),
(45055, 0, 0, 0, 0, 'Item - Timbal''s Focusing Crystal'),
(60488, 0, 0, 0, 0, 'Item - Extract of Necromatic Power');

-- pet attack's by say1981
DELETE FROM `spell_bonus_data` WHERE `entry` IN (17253,16827,49966);
INSERT INTO `spell_bonus_data` (`entry`, `direct_bonus`, `dot_bonus`, `ap_bonus`, `ap_dot_bonus`, `comments`) VALUES
    (17253, 0, 0, 0.08, 0, 'Bite (Rank 1) - Hunter pet'),
    (16827, 0, 0, 0.08, 0, 'Claw (Rank 1) - Hunter pet'),
    (49966, 0, 0, 0.08, 0, 'Smack (Rank 1) - Hunter pet');
