DELETE FROM creature_template WHERE entry >= 100000 AND entry <= 100169;
DELETE FROM gameobject_template WHERE entry >= 500000 AND entry <= 500169;
DELETE FROM gameobject_template WHERE entry >= 1 AND entry <= 16; -- real game DB starts at id 17
DELETE FROM npc_vendor WHERE entry >= 100000 AND entry <= 100166;
DELETE FROM creature WHERE guid >= 500200 AND guid <= 500400;
DELETE FROM  gameobject WHERE guid >= 500200 AND guid <= 500300;
