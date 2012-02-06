-- Frostmourne area spells
DELETE FROM spell_target_position WHERE id IN (70860, 72546, 73655);
INSERT INTO spell_target_position VALUES
    (70860, 631, 529.302, -2124.49, 1040.857, 3.1765),
    (72546, 631, 514.000, -2523.00, 1250.990, 3.1765),
    (73655, 631, 495.708, -2523.76, 1250.990, 3.1765);

DELETE FROM spell_area WHERE spell = 74276;
INSERT INTO spell_area (spell, area, autocast) VALUES (74276, 4910, 1);
