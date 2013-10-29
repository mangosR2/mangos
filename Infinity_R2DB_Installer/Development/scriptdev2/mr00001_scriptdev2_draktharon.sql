DELETE FROM script_texts WHERE entry in (-1600020, -1600021);
INSERT INTO script_texts (`entry`,`content_default`,`sound`,`type`,`language`,`comment`) values
(-1600020,'King Dred raises his talon menacingly!',0,5,0,'King Dred Talon'),
(-1600021,'King Dred calls for a raptor!',0,5,0,'King Dred Call for Raptor');
