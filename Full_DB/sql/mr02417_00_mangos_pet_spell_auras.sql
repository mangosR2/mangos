-- Pet spell auras

DELETE FROM `spell_pet_auras` WHERE `aura`='54566'; -- Deathknight Pet Scaling
DELETE FROM `spell_pet_auras` WHERE `spell` IN (34455,34459,34460); -- Ferocious Inspiration
DELETE FROM `spell_pet_auras` WHERE `spell` IN (54037,54038); -- Improved Felhunter
DELETE FROM `spell_pet_auras` WHERE `spell`='0' AND `pet` IN (1,89,416,417,510,1860,1863,15352,15438,17252,19668,24207,26125,27829,28017,29264,31216,37994);
INSERT INTO `spell_pet_auras`
    (`spell`, `effectId`, `pet`, `aura`)
VALUES
    -- Hunter Pets
    (0,0,1,34902),
    (0,0,1,34903),
    (0,0,1,34904),
    (0,0,1,61017),
    -- Warlock Infernal
    (0,0,89,34947),
    (0,0,89,34956),
    (0,0,89,34957),
    (0,0,89,34958),
    (0,0,89,61013),
    -- Warkock Imp
    (0,0,416,34947),
    (0,0,416,34956),
    (0,0,416,34957),
    (0,0,416,34958),
    (0,0,416,61013),
    -- Warlock Felhunter
    (0,0,417,34947),
    (0,0,417,34956),
    (0,0,417,34957),
    (0,0,417,34958),
    (0,0,417,61013),
    (54037,0,417,56249),
    (54038,0,417,56249),
    -- Mage Water Elemental (old guardian)
    (0,0,510,34947),
    (0,0,510,34956),
    -- Warlock Voidwalker
    (0,0,1860,34947),
    (0,0,1860,34956),
    (0,0,1860,34957),
    (0,0,1860,34958),
    (0,0,1860,61013),
    -- Warlock Succubus
    (0,0,1863,34947),
    (0,0,1863,34956),
    (0,0,1863,34957),
    (0,0,1863,34958),
    (0,0,1863,61013),
    -- Greater Earth Elemetal
    (0,0,15352,34947),
    -- Shaman Greater Fire Elemetal
    (0,0,15438,34956),
    (0,0,15438,34947),
    -- Warlock Felguard
    (0,0,17252,34947),
    (0,0,17252,34956),
    (0,0,17252,34957),
    (0,0,17252,34958),
    (0,0,17252,61013),
    -- Shadowfiend
    (0,0,19668,34947),
    -- Deathknight Army of the Dead Ghoul
    (0,0,24207,51996),
    (0,0,24207,54566),
    (0,0,24207,61697),
    (0,0,24207,50142),
    -- Deathknight Ghoul
    (0,0,26125,51996),
    (0,0,26125,54566),
    (0,0,26125,61697),
    (0,0,26125,50142),
    -- DK Gargoyle
    (0,0,27829,54566),
    -- Deathknight Bloodworms
    (0,0,28017,50453),
    -- Shaman Wolf
    (0,0,29264,58877),
    (0,0,29264,34902),
    (0,0,29264,34903),
    (0,0,29264,34904),
    (0,0,29264,61783),
    -- Mage Mirror Image
    (0,0,31216,49866),
    (0,0,31216,34947),
    -- Mage Water Elemental
    (0,0,37994,34947),
    (0,0,37994,34956),
    -- Ferocious Inspiration
    (34455,0,0,75593),
    (34459,0,0,75446),
    (34460,0,0,75447);

