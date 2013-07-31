
-- EventAI for NPC 33687. Quest 13812

UPDATE creature_template SET speed_walk = 1.5, speed_run = 1.5, AIName = 'EventAI' WHERE entry = 33687;

DELETE FROM creature_ai_scripts WHERE creature_id = 33687;
INSERT INTO creature_ai_scripts
  (id, creature_id, event_type, event_inverse_phase_mask, event_chance, event_flags, event_param1, event_param2, event_param3, event_param4, action1_type, action1_param1, action1_param2, action1_param3, action2_type, action2_param1, action2_param2, action2_param3, action3_type, action3_param1, action3_param2, action3_param3, comment)
VALUES
  (3368701, 33687, 0, 0, 100, 1, 10000, 12000, 20000, 22000, 11, 65248, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Chillmaw - Cast Frost Breath'),
  (3368702, 33687, 2, 0, 100, 0, 35, 0, 0, 0, 11, 65260, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Chillmaw - Cast Wing Buffet at 35% HP'),
  (3368703, 33687, 2, 0, 100, 0, 75, 0, 0, 0, 11, 52205, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Chillmaw - Cast Eject Passenger 3 at 75% HP'),
  (3368704, 33687, 2, 0, 100, 0, 50, 0, 0, 0, 11, 62539, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Chillmaw - Cast Eject Passenger 2 at 50% HP'),
  (3368705, 33687, 2, 0, 100, 0, 25, 0, 0, 0, 11, 60603, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 'Chillmaw - Cast Eject Passenger 1 at 25% HP');
