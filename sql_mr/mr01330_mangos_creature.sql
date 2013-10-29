-- set 1 day respawn time to every creature in BGs/arenas
UPDATE creature SET spawntimesecs = 86400 WHERE map IN (30, 489, 529, 559, 562, 566, 572, 607, 617, 618, 628);
-- set 10 seconds respawn time to:
UPDATE creature SET spawntimesecs = 10 WHERE id IN (
-- Spirit Guides
13116, 13117,
-- SotA demolishers
28781);
