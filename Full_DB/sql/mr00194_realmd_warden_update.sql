-- realmd table update for warden
ALTER TABLE `account`
    ADD COLUMN `os` VARCHAR(4) DEFAULT '' NOT NULL AFTER `locale`;
