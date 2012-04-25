-- set 1 day respawn time to every game object in BGs/arenas
UPDATE gameobject SET spawntimesecs = 86400 WHERE map IN (30, 489, 529, 559, 562, 566, 572, 607, 617, 618, 628);
-- set 10 seconds respawn time to:
UPDATE gameobject SET spawntimesecs = 10 WHERE id IN (
-- SotA Seaforium Charges
190753, 194086);
