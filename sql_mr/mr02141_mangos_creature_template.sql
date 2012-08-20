-- Revert old DB custom column (not needed). May cause error message on anew created servers.
ALTER TABLE `creature_template`
    DROP COLUMN `spell8`,
    DROP COLUMN `spell7`,
    DROP COLUMN `spell6`,
    DROP COLUMN `spell5`;

