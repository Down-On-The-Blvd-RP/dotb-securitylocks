Config = {}

-- Door props configuration for known stores
Config.DoorList = {
    -- 24/7 Stores
    {
        id = "store_247_1",
        doors = {
            {coords = vector3(373.875, 327.882, 103.566), heading = 0.0, prop = "v_24_7_door1"},
            {coords = vector3(373.875, 327.882, 103.566), heading = 180.0, prop = "v_24_7_door2"}
        },
        locked = true,
        autoLockTime = {lock = 20, unlock = 8},  -- Auto-lock at 20:00, unlock at 08:00
        breakInRequiredItems = {"lockpick", "weapon_crowbar"},
        notifyJobs = {"police", "securoserv"},
        fireAlarm = true
    },

    -- LTD Gas Stations
    {
        id = "ltd_1",
        doors = {
            {coords = vector3(1729.06, 6416.27, 35.03), heading = 0.0, prop = "v_ltd_door1"},
            {coords = vector3(1729.06, 6416.27, 35.03), heading = 180.0, prop = "v_ltd_door2"}
        },
        locked = true,
        autoLockTime = {lock = 22, unlock = 6},
        breakInRequiredItems = {"thermite", "weapon_crowbar"},
        notifyJobs = {"police", "securoserv"},
        fireAlarm = true
    },

    -- Rob's Liquor Stores
    {
        id = "robs_liquor_1",
        doors = {
            {coords = vector3(1135.92, -982.21, 46.42), heading = 0.0, prop = "v_robs_door1"},
            {coords = vector3(1135.92, -982.21, 46.42), heading = 180.0, prop = "v_robs_door2"}
        },
        locked = true,
        autoLockTime = {lock = 23, unlock = 7},
        breakInRequiredItems = {"lockpick", "weapon_crowbar"},
        notifyJobs = {"police", "securoserv"},
        fireAlarm = true
    },

    -- Banks
    {
        id = "pacific_bank_1",
        doors = {
            {coords = vector3(253.51, -40.51, 69.94), heading = 90.0, prop = "v_bank_pac_door1"},
            {coords = vector3(253.51, -40.51, 69.94), heading = 270.0, prop = "v_bank_pac_door2"}
        },
        locked = true,
        autoLockTime = {lock = 22, unlock = 6},
        breakInRequiredItems = {"thermite", "weapon_crowbar"},
        notifyJobs = {"police", "bcso", "lssd", "sahp"},
        fireAlarm = true
    },

    {
        id = "federal_bank_1",
        doors = {
            {coords = vector3(149.39, -1040.93, 29.37), heading = 90.0, prop = "v_bank_fed_door1"},
            {coords = vector3(149.39, -1040.93, 29.37), heading = 270.0, prop = "v_bank_fed_door2"}
        },
        locked = true,
        autoLockTime = {lock = 22, unlock = 6},
        breakInRequiredItems = {"thermite", "weapon_crowbar"},
        notifyJobs = {"police", "bcso", "lssd", "sahp"},
        fireAlarm = true
    },

    -- Additional stores and locations can be added here
    -- Example: 
    -- {
    --     id = "store_name",
    --     doors = {
    --         {coords = vector3(x, y, z), heading = direction, prop = "door_prop_name"}
    --     },
    --     locked = true,
    --     autoLockTime = {lock = xx, unlock = xx},
    --     breakInRequiredItems = {"lockpick", "weapon_crowbar"},
    --     notifyJobs = {"police", "securoserv"},
    --     fireAlarm = true
    -- }
}

-- Specify notification system (ox_lib or qbcore)
Config.NotificationSystem = "ox_lib"  -- Can be set to "qbcore" if using that framework

return Config
