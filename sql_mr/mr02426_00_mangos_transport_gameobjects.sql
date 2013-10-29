-- Transport rewrite
-- ICC normal ships
UPDATE `gameobject_template` SET `data9` = 3 WHERE `entry` IN (201580,201581);
-- ICC heroic ships
UPDATE `gameobject_template` SET `data9` = 12 WHERE `entry` IN (201811,201812);

