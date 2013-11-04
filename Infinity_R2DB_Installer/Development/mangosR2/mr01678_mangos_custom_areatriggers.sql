-- Template for creating custom rules for transfer to absent in AreaTrigger.dbc maps.
DELETE FROM `areatrigger_teleport` WHERE `id` BETWEEN 100000 AND 101000;
INSERT INTO `areatrigger_teleport` (`id`, `name`, `required_level`, `required_item`, `required_item2`, `heroic_key`, `heroic_key2`, `required_quest_done_A`, `required_quest_done_H`, `required_quest_done_heroic_A`, `required_quest_done_heroic_H`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `minGS`, `maxGS`, `achiev_id_0`, `achiev_id_1`, `combat_mode`) VALUES
(100013, 'Map 13', 1, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100025, 'Map 25', 1, 0, 0, 0, 0, 0, 0, 0, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100037, 'Map 37', 1, 0, 0, 0, 0, 0, 0, 0, 0, 37, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100042, 'Map 42', 1, 0, 0, 0, 0, 0, 0, 0, 0, 42, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100169, 'Map 169', 1, 0, 0, 0, 0, 0, 0, 0, 0, 169, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100451, 'Map 451', 1, 0, 0, 0, 0, 0, 0, 0, 0, 451, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100573, 'Map 573', 1, 0, 0, 0, 0, 0, 0, 0, 0, 573, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100597, 'Map 597', 1, 0, 0, 0, 0, 0, 0, 0, 0, 597, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100605, 'Map 605', 1, 0, 0, 0, 0, 0, 0, 0, 0, 605, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100606, 'Map 606', 1, 0, 0, 0, 0, 0, 0, 0, 0, 606, 0, 0, 0, 0, 0, 0, 0, 0, 0);
