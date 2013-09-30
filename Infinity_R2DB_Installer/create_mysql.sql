CREATE DATABASE IF NOT EXISTS `characters` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS `realmd` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS `scriptdev2` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE DATABASE IF NOT EXISTS `mangos` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- CREATE USER 'mangos'@'localhost' IDENTIFIED BY 'mangos';

-- GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, LOCK TABLES ON `mangos`.* TO 'mangos'@'localhost';

-- GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, LOCK TABLES ON `characters`.* TO 'mangos'@'localhost';

-- GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, ALTER, LOCK TABLES ON `realmd`.* TO 'mangos'@'localhost';

-- -------------------------------------------------------------------------------------------------------------------------------- --
-- use to drop DBs

-- DROP DATABASE IF EXISTS `mangos` ;

-- DROP DATABASE IF EXISTS `characters` ;

-- DROP DATABASE IF EXISTS `realmd` ;

-- DROP DATABASE IF EXISTS `scriptdev2` ;