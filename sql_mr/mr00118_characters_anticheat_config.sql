-- Anticheat
-- Config

-- Main checks
REPLACE INTO `anticheat_config`
    (`checktype`, `description`, `check_period`, `alarmscount`, `disableoperation`, `messagenum`, `intparam1`, `intparam2`, `floatparam1`, `floatparam2`, `action1`, `actionparam1`, `action2`, `actionparam2`)
VALUES
    -- Main checks
    (0, "Null check",         0, 1, 0, 11000, 0, 0,    0, 0, 1, 0, 0, 0),
    (1, "Movement cheat",     0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0),
    (2, "Spell cheat",        0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0),
    (3, "Quest cheat",        0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0),
    (4, "Transport cheat",    0, 3, 0, 11000, 0, 0,  300,50, 2, 1, 0, 0),
    (5, "Damage cheat",       0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0),
    (6, "Item cheat",         0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0),
    (7, "Warden check",       0, 1, 0, 11000, 0, 0,    0, 0, 2, 1, 0, 0);

-- Subchecks
REPLACE INTO `anticheat_config`
    (`checktype`, `description`, `check_period`, `alarmscount`, `disableoperation`, `messagenum`, `intparam1`, `intparam2`, `floatparam1`, `floatparam2`, `action1`, `actionparam1`, `action2`, `actionparam2`)
VALUES
    (101, "Speed hack",              500, 5, 0, 11000,    10000, 0, 0.0012,    0, 2, 1, 6, 20000),
    (102, "Fly hack",                500, 5, 0, 11000,    20000, 0,   10.0,    0, 2, 1, 0, 0),
    (103, "Wall climb hack",         500, 2, 0, 11000,    10000, 0, 0.0015, 2.37, 2, 1, 0, 0),
    (104, "Waterwalking hack",      1000, 3, 0, 11000,    20000, 0,      0,    0, 2, 1, 0, 0),
    (105, "Teleport to plane hack",  500, 1, 0, 11000,        0, 0, 0.0001,  0.1, 2, 1, 0, 0),
    (106, "AirJump hack" ,           500, 3, 0, 11000,    30000, 0,   10.0, 25.0, 2, 1, 0, 0),
    (107, "Teleport hack" ,            0, 1, 0, 11000,        0, 0,   50.0,    0, 2, 1, 0, 0),
    (108, "Fall hack" ,                0, 3, 0, 11000,    10000, 0,      0,    0, 2, 1, 0, 0),
    (109, "Z Axis hack" ,              0, 1, 0, 11000,        0, 0,0.00001, 10.0, 2, 1, 0, 0),
    (201, "Spell invalid",             0, 1, 0, 11000,        0, 0,      0,    0, 2, 1, 0, 0),
    (202, "Spellcast in dead state",   0, 1, 0, 11000,        0, 0,      0,    0, 2, 1, 0, 0),
    (203, "Spell not valid for player",0, 1, 0, 11000,        0, 0,      0,    0, 2, 1, 0, 0),
    (204, "Spell not in player book",  0, 1, 0, 11000,        0, 0,      0,    0, 2, 1, 0, 0),
    (501, "Spell damage hack",         0, 1, 0, 11000,        0, 50000,  0,    0, 2, 1, 0, 0),
    (502, "Melee damage hack",         0, 1, 0, 11000,        0, 50000,  0,    0, 2, 1, 0, 0),
    (601, "Item dupe hack",            0, 1, 0, 11000,        0,     0,  0,    0, 2, 1, 0, 0),
    (701, "Warden memory check",       0, 1, 0, 11000,        0,     0,  0,    0, 2, 1, 0, 0),
    (702, "Warden key check",          0, 1, 0, 11000,        0,     0,  0,    0, 2, 1, 0, 0),
    (703, "Warden checksum check",     0, 1, 0, 11000,        0,     0,  0,    0, 2, 1, 0, 0),
    (704, "Warden timeout check",      0, 1, 0, 11000,        0,     0,  0,    0, 2, 1, 0, 0);
