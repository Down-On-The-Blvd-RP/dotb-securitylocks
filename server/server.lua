local isLocked = false

-- Function to check if the time is within locked hours
local function IsStoreClosed()
    local hour = GetClockHours()
    return hour >= Config.LockTimes.start or hour < Config.LockTimes.end
end

-- Function to toggle the store's lock status
local function ToggleLock(door, lockStatus)
    if lockStatus then
        TriggerEvent(Config.LockInteraction.lock, door)
    else
        TriggerEvent(Config.LockInteraction.unlock, door)
    end
end

-- Function to send robbery notifications
local function SendRobberyNotification(job)
    if Config.NotificationSystem == "ox_lib" then
        exports['ox_lib']:Notify({
            title = "Robbery Alert",
            description = Config.RobberyNotification.message,
            type = "error"
        })
    elseif Config.NotificationSystem == "qb_notify" then
        TriggerEvent('qb-core:client:notify', {type = "error", text = Config.RobberyNotification.message})
    end
end

-- Main loop to check store timings
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        -- Check if the store should be locked
        for _, store in ipairs(Config.StoreDoors) do
            if IsStoreClosed() then
                if not isLocked then
                    ToggleLock(store.door, true) -- Lock door
                    isLocked = true
                end
            else
                if isLocked then
                    ToggleLock(store.door, false) -- Unlock door
                    isLocked = false
                end
            end
        end

        -- If a robbery occurs, send notification (Example: job check, can be triggered by an event or other means)
        if isRobberyInProgress then
            SendRobberyNotification(Config.RobberyNotification.jobType)
        end
    end
end)
