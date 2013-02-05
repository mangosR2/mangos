--
-- Lunar Festival
--

-- Check your DB. Game objects (Id: 300058) should be placed on center of creatures (Id:15897)!

DELETE FROM spell_script_target WHERE entry = 26373;
INSERT INTO spell_script_target (entry, type, targetEntry) VALUES (26373, 0, 300058);

DELETE FROM dbscripts_on_go_template_use WHERE `id` = 300058;
INSERT INTO dbscripts_on_go_template_use
  (id, delay, command, datalong, datalong2, buddy_entry, search_radius, data_flags, dataint, dataint2, dataint3, dataint4, x, y, z, o, comments)
VALUES
  (300058, 0, 15, 26448, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 'Holiday - Teleport: Moonglade');
