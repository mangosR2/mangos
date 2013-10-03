
DELETE FROM `spell_linked` WHERE `entry` IN (7744, 42292);
INSERT INTO `spell_linked` (`entry`, `linked_entry`, `type`, `effect_mask`, `comment`) VALUES
( 7744, 72757, 11, 0, 'Will of the Forsaken -> CD for PvP Trinket'),
(42292, 72752, 11, 0, 'PvP Trinket -> CD for Will of the Forsaken');
