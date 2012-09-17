ALTER TABLE `worldstate_template` DROP PRIMARY KEY , ADD PRIMARY KEY ( `state_id` , `type` , `condition` , `linked_id` );
