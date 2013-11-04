-- do not delete tickets, only flag them as "closed"

ALTER TABLE `character_ticket` ADD COLUMN `closed` smallint