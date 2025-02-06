local doors = Config.DoorList

RegisterNetEvent('dotb-securitylocks:toggleDoor')
AddEventHandler('dotb-securitylocks:toggleDoor', function(doorId, state)
    if doors[doorId] then
        doors[doorId].locked = state
        TriggerClientEvent('dotb-securitylocks:updateDoorState', -1, doorId, state)
    end
end)

RegisterNetEvent('dotb-securitylocks:notifyJobs')
AddEventHandler('dotb-securitylocks:notifyJobs', function(doorId, alertType)
    local door = doors[doorId]
    if not door then return end

    local message = alertType == "breakin" and "Break-in attempt detected!" or "Explosion detected!"
    
    for _, job in pairs(door.notifyJobs) do
        TriggerClientEvent('dotb-securitylocks:sendNotification', -1, job, message)
    end
end)
