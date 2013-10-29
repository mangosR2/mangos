-- State manager command line info
DELETE FROM `mangos_string` WHERE `entry` IN (526,527,528,529,530,531,532,533,534,535,536,537,538,1132,1133,1134,1192);
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(526,'%s states (movement generators) stack:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(527,' Priority: %i State: %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(532,'        Targeted to %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(535,'        Home movement to (X:%f Y:%f Z:%f)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(536,'        Home movement used for player?!?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(538,'        (non-standart state %s)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1132,'        Follow %s',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/* old (mangos default) values
INSERT INTO `mangos_string` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`) VALUES
(526,'%s (lowguid: %u) movement generators stack:',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(527,'   Idle',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(528,'   Random',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(529,'   Waypoint',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(530,'   Animal random',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(531,'   Confused',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(532,'   Targeted to player %s (lowguid %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(533,'   Targeted to creature %s (lowguid %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(534,'   Targeted to <NULL>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(535,'   Home movement to (X:%f Y:%f Z:%f)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(536,'   Home movement used for player?!?',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(537,'   Taxi flight',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1192,'  Effect movement',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(538,'   Unknown movement generator (%u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1132,'   Follow player %s (lowguid %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1133,'   Follow creature %s (lowguid %u)',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
(1134,'   Follow <NULL>',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
*/
