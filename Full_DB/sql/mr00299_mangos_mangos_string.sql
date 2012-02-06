DELETE FROM mangos_string WHERE entry BETWEEN 17890 AND 17896;

INSERT INTO mangos_string (entry, content_default, content_loc8) VALUES
(17890, 'Gamemaster %s banned account %s for %s. Reason: %s', 'Гейммастер %s забанил аккаунт %s на %s. Причина: %s'),
(17891, 'Gamemaster %s banned account %s permanently. Reason: %s', 'Гейммастер %s забанил аккаунт %s перманентно. Причина: %s'),
(17892, 'Gamemaster %s banned character %s for %s. Reason: %s', 'Гейммастер %s забанил персонажа %s на %s. Причина: %s'),
(17893, 'Gamemaster %s banned character %s permanently. Reason: %s', 'Гейммастер %s забанил персонажа %s перманентно. Причина: %s'),
(17894, 'Gamemaster %s banned IP address %s for %s. Reason: %s', 'Гейммастер %s забанил IP адрес %s на %s. Причина: %s'),
(17895, 'Gamemaster %s banned IP address %s permanently. Reason: %s', 'Гейммастер %s забанил IP адрес %s перманентно. Причина: %s'),
(17896, 'Gamemaster %s disabled %s\'s chat for %u minutes.', 'Гейммастер %s заблокировал чат %s на %u минут.');

DELETE FROM mangos_string WHERE entry IN (548, 549);

INSERT INTO mangos_string (entry, content_default, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES
(548, 'Player%s %s (guid: %u) Account: %s (id: %u) E-mail: %s GMLevel: %u Last IP: %s Last login: %s Latency: %ums', NULL, NULL, NULL, NULL, NULL, NULL, NULL,'Игрок%s %s (GUID: %u) Аккаунт: %s (id: %u) Е-мейл: %s Уровень доступа: %u Последний IP: %s Последний вход: %s Задержка: %ums'),
(549, 'Race: %s Class: %s Played time: %s Level: %u Money: %ug%us%uc', NULL, NULL, NULL, NULL, NULL, NULL, NULL,'Раса: %s Класс: %s Сыгранное время: %s Уровень: %u Количество денег: %ug%us');
