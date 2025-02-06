local isLocked = false
local currentVersion = "1.0"
local latestVersion = "1.0" -- This will be updated based on a real check later (for now, assume it's the same version)
local versionCheckUrl = "https://raw.githubusercontent.com/YourGitHubRepo/dotb-securitylocks/main/version.txt" -- Replace with the URL where the version is hosted

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

-- Function to display the current version in the TXAdmin console
Citizen.CreateThread(function()
    print("==============================================")
    print("dotb-securitylocks - Current Version: " .. currentVersion)
    print("==============================================")

    -- Check if a newer version is available
    PerformVersionCheck()
end)

-- Function to check for a newer version of dotb-securitylocks
function PerformVersionCheck()
    PerformHttpRequest(versionCheckUrl, function (statusCode, responseText, headers)
        if statusCode == 200 then
            local latestVersionFromRepo = responseText:match("(%d+%.%d+)") -- Assuming the version format is "X.X"

            if latestVersionFromRepo and latestVersionFromRepo ~= currentVersion then
                print("WARNING: You are using an outdated version of dotb-securitylocks!")
                print("Current Version: " .. currentVersion)
                print("Latest Version: " .. latestVersionFromRepo)
                print("Please update to the latest version for bug fixes and new features.")
            else
                print("dotb-securitylocks is up to date (Version " .. currentVersion .. ").")
            end
        else
            print("Error checking for updates. Status Code: " .. statusCode)
        end
    end, "GET")
end

-- Function to notify admin when version is outdated
AddEventHandler('dotb-securitylocks:notifyOutdatedVersion', function()
    print("==============================================")
    print("WARNING: Your version of dotb-securitylocks is outdated!")
    print("Please update to the latest version to avoid any issues.")
    print("==============================================")
end)

-- Add event handler for potential version check or other logic
AddEventHandler('dotb-securitylocks:checkVersion', function()
    PerformVersionCheck()
end)