local framework = nil

-- Check which framework is being used
if IsDuplicityVersion() then
    -- Server-side check for ESX, QBCore, or QBox
    Citizen.CreateThread(function()
        if GetResourceState('es_extended') == 'started' then
            framework = 'esx'
        elseif GetResourceState('qb-core') == 'started' then
            framework = 'qbcore'
        elseif GetResourceState('qbox-core') == 'started' then
            framework = 'qbox'
        else
            print("Framework not found! This resource is compatible with ESX, QBCore, and QBox.")
        end
    end)
end

-- Server-side: Handling robbery notifications based on the framework
RegisterNetEvent('dotb-securitylocks:sendRobberyNotification')
AddEventHandler('dotb-securitylocks:sendRobberyNotification', function(job)
    if framework == 'esx' then
        TriggerEvent('esx:showNotification', "A robbery is in progress at a store!")
    elseif framework == 'qbcore' then
        TriggerEvent('qb-core:client:notify', {type = 'error', text = "A robbery is in progress at a store!"})
    elseif framework == 'qbox' then
        TriggerEvent('qbox-core:notify', "A robbery is in progress at a store!")
    else
        print("Framework not detected. Unable to send notification.")
    end
end)

-- Client-side: Checking for the framework and implementing the corresponding logic
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if framework == 'esx' then
            -- ESX specific client-side logic, if necessary
        elseif framework == 'qbcore' then
            -- QBCore specific client-side logic, if necessary
        elseif framework == 'qbox' then
            -- QBox specific client-side logic, if necessary
        end
    end
end)
