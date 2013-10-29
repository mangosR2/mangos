-- Despawn at evade and death. Servant Muu'ru (by Ulduar)
-- Creature id: 25772
UPDATE creature_template SET AIName='EventAI' WHERE entry=25772;
INSERT INTO creature_ai_scripts VALUES 
('2577207','25772','7','0','100','31','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Despawn'),
('2577208','25772','6','0','100','31','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Despawn');

-- Creature id: 25798
UPDATE creature_template SET AIName='EventAI' WHERE entry=25798;
INSERT INTO creature_ai_scripts VALUES 
('2579803','25798','6','0','100','31','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Despawn'),
('2579804','25798','7','0','100','31','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Despawn');

-- Creature id: 25799
UPDATE creature_template SET AIName='EventAI' WHERE entry=25799;
INSERT INTO creature_ai_scripts VALUES 
('2579904','25799','6','0','100','31','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Despawn'),
('2579905','25799','7','0','100','31','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Despawn');

-- Creature id: 25824
UPDATE creature_template SET AIName='EventAI' WHERE entry=25824;
INSERT INTO creature_ai_scripts VALUES 
('2582403','25824','6','0','100','31','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Despawn'),
('2582404','25824','7','0','100','31','0','0','0','0','41','0','0','0','0','0','0','0','0','0','0','0','Despawn');
