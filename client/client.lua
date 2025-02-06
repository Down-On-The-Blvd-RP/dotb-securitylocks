RegisterNetEvent(Config.LockInteraction.lock)
AddEventHandler(Config.LockInteraction.lock, function(door)
    -- Lock door logic
    print(door .. " is locked.")
end)

RegisterNetEvent(Config.LockInteraction.unlock)
AddEventHandler(Config.LockInteraction.unlock, function(door)
    -- Unlock door logic
    print(door .. " is unlocked.")
end)

-- Example of a robbery event (you would trigger this based on the robbery logic in your game)
RegisterNetEvent('dotb-securitylocks:robbery')
AddEventHandler('dotb-securitylocks:robbery', function()
    -- Send robbery notification to specified job
    local playerJob = GetPlayerJob()
    if playerJob.name == Config.RobberyNotification.jobType then
        TriggerClientEvent('dotb-securitylocks:sendRobberyNotification', playerJob.name)
    end
end)
