--
-- Lunar Festival
--

-- Check your DB. Game objects (Id: 300058) should be placed on center of creatures (Id:15897)!

DELETE FROM spell_script_target WHERE entry = 26373;
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (26373, 0, 300058);
