Config = {}

Config.Version = "1.0.0"

Config.Framework = "standalone" -- Options: "qbcore", "esx", "qbox", "standalone"

Config.DoorList = {
    -- Example Bank
    {
        id = "pacific_bank",
        doors = {
            {coords = vector3(252.5, 221.0, 106.3), heading = 250.0}
        },
        locked = true,
        autoLockTime = {lock = 20, unlock = 8},
        breakInRequiredItems = {"thermite", "weapon_crowbar"},
        notifyJobs = {"police", "securoserv"},
        fireAlarm = true
    },
    -- Example Store
    {
        id = "store_247_1",
        doors = {
            {coords = vector3(373.875, 327.882, 103.566), heading = 0.0}
        },
        locked = false,
        autoLockTime = {lock = 0, unlock = 0},
        breakInRequiredItems = {"lockpick", "weapon_crowbar"},
        notifyJobs = {"police"},
        fireAlarm = false
    }
}
