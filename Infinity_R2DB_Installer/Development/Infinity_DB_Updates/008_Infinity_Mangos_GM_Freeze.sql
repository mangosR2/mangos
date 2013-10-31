DELETE FROM `command` WHERE `name` = 'freeze' or `name` = 'unfreeze' or name = 'listfreeze';
INSERT INTO `command` (`name`,`security`,`help`) VALUES 
('freeze','3','Syntax: .freeze (#player)\r\n\"Freezes\" #player. When using this without #name it will freeze your target.'),
('unfreeze','3','Syntax: .unfreeze (#player)\r\n\"Unfreezes\" #player. When using this without #name it will unfrezze your target.'),
('listfreeze','3','Syntax: .listfreeze\r\n\r\nSearch and output all frozen players.');

DELETE FROM mangos_string WHERE entry BETWEEN 11008 AND 11002;
INSERT INTO mangos_string VALUES
(11002,'You froze player %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11003,'Can not freeze self',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11004,'Invalid, input #name or target.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11005,'You unfroze the player %s.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11006,'No frozen players found.',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11007,'The following players are still freezing:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(11008,'- %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);


