-- Sql to create buff object pool for some BG

-- Arathi bassin
-- -------------

-- Stable
REPLACE INTO `gameobject` VALUES (150500, 179871, 529, 1, 1, 1185.71, 1185.24, -56.36, 2.56, 0, 0, 0.022338351, 0.999750467, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150501, 179904, 529, 1, 1, 1185.71, 1185.24, -56.36, 2.56, 0, 0, 0.022338351, 0.999750467, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150502, 179905, 529, 1, 1, 1185.71, 1185.24, -56.36, 2.56, 0, 0, 0.022338351, 0.999750467, 180, 100, 1);

-- Blacksmith
REPLACE INTO `gameobject` VALUES (150503, 179871, 529, 1, 1, 990.75, 1008.18, -42.60, 2.43, 0, 0, 0.021204161, 0.999775166, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150504, 179904, 529, 1, 1, 990.75, 1008.18, -42.60, 2.43, 0, 0, 0.021204161, 0.999775166, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150505, 179905, 529, 1, 1, 990.75, 1008.18, -42.60, 2.43, 0, 0, 0.021204161, 0.999775166, 180, 100, 1);

-- Farm
REPLACE INTO `gameobject` VALUES (150506, 179871, 529, 1, 1, 817.66, 843.34, -56.54, 3.01, 0, 0, 0.026264184, 0.999655036, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150507, 179904, 529, 1, 1, 817.66, 843.34, -56.54, 3.01, 0, 0, 0.026264184, 0.999655036, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150508, 179905, 529, 1, 1, 817.66, 843.34, -56.54, 3.01, 0, 0, 0.026264184, 0.999655036, 180, 100, 1);

-- Lumber Mill
REPLACE INTO `gameobject` VALUES (150509, 179871, 529, 1, 1, 807.46, 1189.16, 11.92, 5.44, 0, 0, 0.047455126, 0.998873370, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150510, 179904, 529, 1, 1, 807.46, 1189.16, 11.92, 5.44, 0, 0, 0.047455126, 0.998873370, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150511, 179905, 529, 1, 1, 807.46, 1189.16, 11.92, 5.44, 0, 0, 0.047455126, 0.998873370, 180, 100, 1);

-- Gold Mine
REPLACE INTO `gameobject` VALUES (150512, 179871, 529, 1, 1, 1146.62, 816.94, -98.49, 6.0, 0, 0, 0.053555973, 0.998564849, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150513, 179904, 529, 1, 1, 1146.62, 816.94, -98.49, 6.0, 0, 0, 0.053555973, 0.998564849, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150514, 179905, 529, 1, 1, 1146.62, 816.94, -98.49, 6.0, 0, 0, 0.053555973, 0.998564849, 180, 100, 1);

-- Add pool id
REPLACE INTO `pool_template` VALUES (15000, 1, "Stable power up buff");
REPLACE INTO `pool_template` VALUES (15001, 1, "Blacksmith power up buff");
REPLACE INTO `pool_template` VALUES (15002, 1, "Farm power up buff");
REPLACE INTO `pool_template` VALUES (15003, 1, "Lumber Mill power up buff");
REPLACE INTO `pool_template` VALUES (15004, 1, "Gold Mine power up buff");

-- Add Stable pool
REPLACE INTO `pool_gameobject` VALUES (150500, 15000, 0, "Stable : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150501, 15000, 0, "Stable : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150502, 15000, 0, "Stable : Berserker buff");

-- Add Blacksmith pool
REPLACE INTO `pool_gameobject` VALUES (150503, 15001, 0, "Blacksmith : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150504, 15001, 0, "Blacksmith : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150505, 15001, 0, "Blacksmith : Berserker buff");

-- Add Farm pool
REPLACE INTO `pool_gameobject` VALUES (150506, 15002, 0, "Farm : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150507, 15002, 0, "Farm : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150508, 15002, 0, "Farm : Berserker buff");

-- Add Lumber Mill pool
REPLACE INTO `pool_gameobject` VALUES (150509, 15003, 0, "Lumber Mill : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150510, 15003, 0, "Lumber Mill : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150511, 15003, 0, "Lumber Mill : Berserker buff");

-- Add Gold Mine pool
REPLACE INTO `pool_gameobject` VALUES (150512, 15004, 0, "Gold Mine : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150513, 15004, 0, "Gold Mine : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150514, 15004, 0, "Gold Mine : Berserker buff");

-- Eye of Storm
-- ------------

-- Blood Elf Tower
REPLACE INTO `gameobject` VALUES (150550, 179871, 566, 1, 1, 2050.4599609375, 1372.26000976563, 1194.56005859375, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150551, 179904, 566, 1, 1, 2050.4599609375, 1372.26000976563, 1194.56005859375, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150552, 179905, 566, 1, 1, 2050.4599609375, 1372.26000976563, 1194.56005859375, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);

-- Fel REaver Ruins Tower
REPLACE INTO `gameobject` VALUES (150553, 179871, 566, 1, 1, 2046.32995605469, 1748.81005859375, 1190.03002929688, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150554, 179904, 566, 1, 1, 2046.32995605469, 1748.81005859375, 1190.03002929688, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150555, 179905, 566, 1, 1, 2046.32995605469, 1748.81005859375, 1190.03002929688, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);

-- Mage Tower
REPLACE INTO `gameobject` VALUES (150556, 179871, 566, 1, 1, 2283.3798828125, 1748.81005859375, 1189.7099609375, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150557, 179904, 566, 1, 1, 2283.3798828125, 1748.81005859375, 1189.7099609375, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150558, 179905, 566, 1, 1, 2283.3798828125, 1748.81005859375, 1189.7099609375, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);

-- Draenei Ruins Tower
REPLACE INTO `gameobject` VALUES (150559, 179871, 566, 1, 1, 2302.68994140625, 1391.27001953125, 1197.77001953125, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150560, 179904, 566, 1, 1, 2302.68994140625, 1391.27001953125, 1197.77001953125, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);
REPLACE INTO `gameobject` VALUES (150561, 179905, 566, 1, 1, 2302.68994140625, 1391.27001953125, 1197.77001953125, 0.907571, 0, 0, 0.438371, 0.898794, 180, 100, 1);

-- Add pool id
REPLACE INTO `pool_template` VALUES (15010, 1, "Blood Elf Tower power up buff");
REPLACE INTO `pool_template` VALUES (15011, 1, "Fel Reaver Ruins Tower power up buff");
REPLACE INTO `pool_template` VALUES (15012, 1, "Mage Tower power up buff");
REPLACE INTO `pool_template` VALUES (15013, 1, "Dreanei Ruins Tower power up buff");

-- Add Blood Elf Tower pool
REPLACE INTO `pool_gameobject` VALUES (150550, 15010, 0, "Blood Elf Tower : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150551, 15010, 0, "Blood Elf Tower : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150552, 15010, 0, "Blood Elf Tower : Berserker buff");

-- Add Fel Reaver Ruins Tower pool
REPLACE INTO `pool_gameobject` VALUES (150553, 15011, 0, "Fel Reaver Ruins Tower : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150554, 15011, 0, "Fel Reaver Ruins Tower : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150555, 15011, 0, "Fel Reaver Ruins Tower : Berserker buff");

-- Add Mage Tower pool
REPLACE INTO `pool_gameobject` VALUES (150556, 15012, 0, "Mage Tower : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150557, 15012, 0, "Mage Tower : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150558, 15012, 0, "Mage Tower : Berserker buff");

-- Add Dreanei Ruins Tower pool
REPLACE INTO `pool_gameobject` VALUES (150559, 15013, 0, "Dreanei Ruins Tower : Speed buff");
REPLACE INTO `pool_gameobject` VALUES (150560, 15013, 0, "Dreanei Ruins Tower : Regen buff");
REPLACE INTO `pool_gameobject` VALUES (150561, 15013, 0, "Dreanei Ruins Tower : Berserker buff");
