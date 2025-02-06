local doors = Config.DoorList

RegisterNetEvent('dotb-securitylocks:updateDoorState')
AddEventHandler('dotb-securitylocks:updateDoorState', function(doorId, state)
    if doors[doorId] then
        doors[doorId].locked = state
    end
end)

function AttemptBreakIn(doorId)
    local door = doors[doorId]
    if not door then return end

    local hasItem = false
    for _, item in pairs(door.breakInRequiredItems) do
        if HasItem(item) then
            hasItem = true
            break
        end
    end

    if hasItem then
        TriggerServerEvent('dotb-securitylocks:notifyJobs', doorId, "breakin")
        TriggerServerEvent('dotb-securitylocks:toggleDoor', doorId, false)
    else
        print("You don't have the required tools!")
    end
end

function HasItem(item)
    return true -- Placeholder (Update based on framework)
end
