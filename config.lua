Config = {}

-- Store locations with their respective door names
Config.StoreDoors = {
    -- 24/7 Stores
    { name = "24/7 Store", coords = vector3(25.7, -1346.5, 29.5), door = "store_door" },
    { name = "24/7 Store", coords = vector3(2557.3, 382.3, 108.6), door = "store_door" },
    { name = "24/7 Store", coords = vector3(-3040.2, 585.2, 7.9), door = "store_door" },
    { name = "24/7 Store", coords = vector3(1135.4, -982.4, 46.4), door = "store_door" },
    { name = "24/7 Store", coords = vector3(1163.6, -323.7, 69.2), door = "store_door" },
    { name = "24/7 Store", coords = vector3(-1487.7, -379.2, 39.1), door = "store_door" },

    -- Rob's Liquor Stores
    { name = "Rob's Liquor", coords = vector3(1393.1, 3606.9, 34.9), door = "liquor_door" },
    { name = "Rob's Liquor", coords = vector3(1135.4, -982.4, 46.4), door = "liquor_door" },
    { name = "Rob's Liquor", coords = vector3(341.2, 2606.9, 44.1), door = "liquor_door" },
    
    -- LTD Gas Stations
    { name = "LTD Gas Station", coords = vector3(200.1, -1642.2, 29.8), door = "ltd_door" },
    { name = "LTD Gas Station", coords = vector3(818.9, -1028.8, 28.3), door = "ltd_door" },
    { name = "LTD Gas Station", coords = vector3(1735.8, 6415.5, 35.0), door = "ltd_door" },
    { name = "LTD Gas Station", coords = vector3(1196.8, 2640.0, 37.9), door = "ltd_door" },
    
    -- Ammu-Nation Stores
    { name = "Ammu-Nation", coords = vector3(1692.2, 3758.2, 34.7), door = "ammunation_door" },
    { name = "Ammu-Nation", coords = vector3(811.5, -2157.8, 28.6), door = "ammunation_door" },
    { name = "Ammu-Nation", coords = vector3(247.7, -49.0, 69.1), door = "ammunation_door" },
    { name = "Ammu-Nation", coords = vector3(-661.7, -933.0, 21.9), door = "ammunation_door" },
    { name = "Ammu-Nation", coords = vector3(1342.5, 4337.2, 43.6), door = "ammunation_door" },
    
    -- Banks
    { name = "Bank", coords = vector3(150.3, -1040.1, 29.3), door = "bank_door" },
    { name = "Bank", coords = vector3(-1212.6, -330.7, 37.8), door = "bank_door" },
    { name = "Bank", coords = vector3(314.6, -278.0, 54.2), door = "bank_door" },
    { name = "Bank", coords = vector3(241.1, 217.2, 106.3), door = "bank_door" }
}

-- Define the hours for the stores to be open/closed
Config.LockTimes = {
    start = 22,  -- 10 PM
    end = 6,     -- 6 AM
}

-- Option to unlock doors at any time
Config.UnlockAnytime = true  -- Set to true if doors can be unlocked at any time

-- Notification system to use (either 'ox_lib' or 'qb_notify')
Config.NotificationSystem = "ox_lib"  -- Choose 'ox_lib' or 'qb_notify'

-- Door lock/unlock interaction settings
Config.LockInteraction = {
    lock = "lock",   -- Use this event to lock the door
    unlock = "unlock" -- Use this event to unlock the door
}

-- Robbery notification settings (job-based)
Config.RobberyNotification = {
    jobType = "police",  -- Default job type to notify for robberies
    message = "A robbery is in progress at a store!"
}
