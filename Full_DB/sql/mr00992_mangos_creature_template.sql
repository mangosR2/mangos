-- SET Diminishing Returns for taunt
UPDATE creature_template SET flags_extra = flags_extra|8192 WHERE rank = 3;

-- Not Diminishing Returns for taunt
UPDATE creature_template SET flags_extra = flags_extra&~8192 WHERE entry IN (
-- Instructor Razuvious
16061, 29940,
-- Toravon the Ice Watcher
38433, 38462,
-- Gormok the Impaler
34796, 35438, 35439, 35440,
-- Lady Deathwhisper
36855, 38106, 38296, 38297
);