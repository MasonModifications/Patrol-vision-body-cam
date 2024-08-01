local userData = {}

-- Load user data from file
AddEventHandler('onServerResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
        local file = io.open("resources/bodycam/user_data.json", "r")
        if file then
            local content = file:read("*a")
            userData = json.decode(content) or {}
            file:close()
        end
    end
end)

-- Save user data to file
function saveUserData()
    local file = io.open("resources/bodycam/user_data.json", "w")
    if file then
        file:write(json.encode(userData))
        file:close()
    end
end

-- Handle setting name
RegisterNetEvent('bodycam:setName')
AddEventHandler('bodycam:setName', function(name)
    local src = source
    userData[src] = userData[src] or {}
    userData[src].name = name
    saveUserData()
    TriggerClientEvent('bodycam:updateInfo', src, userData[src])
end)

-- Handle setting callsign
RegisterNetEvent('bodycam:setCallsign')
AddEventHandler('bodycam:setCallsign', function(callsign)
    local src = source
    userData[src] = userData[src] or {}
    userData[src].callsign = callsign
    saveUserData()
    TriggerClientEvent('bodycam:updateInfo', src, userData[src])
end)

-- Handle setting department
RegisterNetEvent('bodycam:setDepartment')
AddEventHandler('bodycam:setDepartment', function(department)
    local src = source
    userData[src] = userData[src] or {}
    userData[src].department = department
    saveUserData()
    TriggerClientEvent('bodycam:updateInfo', src, userData[src])
end)

-- Handle loading user data
RegisterNetEvent('bodycam:loadUserData')
AddEventHandler('bodycam:loadUserData', function()
    local src = source
    if userData[src] then
        TriggerClientEvent('bodycam:updateInfo', src, userData[src])
    end
end)
