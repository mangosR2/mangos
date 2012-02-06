-- Culling the Herd
DELETE FROM spell_chain WHERE spell_id IN (61680, 61681, 52858);
INSERT INTO spell_chain VALUES
(61680, 0, 61680, 1, 0),
(61681, 61680, 61680, 2, 0),
(52858, 61681, 61680, 3, 0);

-- Improved Spirit Tap
DELETE FROM spell_chain WHERE spell_id IN (15337, 15338);
INSERT INTO spell_chain VALUES
(15337, 0, 15337, 1, 0),
(15338, 15337, 15337, 2, 0);
