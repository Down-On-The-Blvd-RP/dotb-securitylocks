local currentVersion = Config.Version

function CheckForUpdates()
    PerformHttpRequest("https://api.github.com/repos/YourRepo/dotb-securitylocks/releases/latest", function(status, response, headers)
        if status == 200 then
            local data = json.decode(response)
            if data and data.tag_name then
                local latestVersion = data.tag_name
                if latestVersion ~= currentVersion then
                    print("^1[DOTB-SECURITYLOCKS] A new version is available: " .. latestVersion .. ". Please update!^0")
                else
                    print("^2[DOTB-SECURITYLOCKS] You are using the latest version.^0")
                end
            end
        else
            print("^3[DOTB-SECURITYLOCKS] Unable to check for updates.^0")
        end
    end, "GET", "", {})
end

CreateThread(function()
    Wait(5000)
    CheckForUpdates()
end)
