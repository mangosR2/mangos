-- missing passive aura for spell 22570
-- Commit 1dd5a80d385e2b35671c

DELETE FROM `playercreateinfo_spell` WHERE `Spell`='44835';
INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
    (4, 11, 44835, 'Maim Interrupt'),
    (6, 11, 44835, 'Maim Interrupt');
