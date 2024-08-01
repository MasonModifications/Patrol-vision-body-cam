local bodycamActive = false

-- Command to toggle body cam on and off
RegisterCommand('togglebodycam', function()
    bodycamActive = not bodycamActive
    SendNUIMessage({
        type = 'toggleBodycam',
        active = bodycamActive
    })
end, false)

-- Command to change name
RegisterCommand('changename', function(source, args)
    local name = table.concat(args, " ") -- Concatenate all arguments to handle names with spaces
    TriggerServerEvent('bodycam:setName', name)
end, false)

-- Command to change call sign
RegisterCommand('changecallsign', function(source, args)
    local callsign = table.concat(args, " ") -- Concatenate all arguments
    TriggerServerEvent('bodycam:setCallsign', callsign)
end, false)

-- Command to change department
RegisterCommand('changedepartment', function(source, args)
    local department = table.concat(args, " ") -- Concatenate all arguments
    TriggerServerEvent('bodycam:setDepartment', department)
end, false)

-- Command to show usage instructions
RegisterCommand('helpbodycam', function()
    TriggerEvent('chat:addMessage', {
        args = {
            "Usage of bodycam commands:",
            "/togglebodycam - Toggle bodycam UI on or off",
            "/changename [name] - Change the name displayed on the bodycam",
            "/changecallsign [callsign] - Change the call sign displayed on the bodycam",
            "/changedepartment [department] - Change the department displayed on the bodycam",
            "Examples:",
            "/changename John Doe - Sets the name to 'John Doe'",
            "/changecallsign 1234 - Sets the call sign to '1234'",
            "/changedepartment Police Department - Sets the department to 'Police Department'"
        }
    })
end, false)

-- Load user data on player join
AddEventHandler('onClientMapStart', function()
    TriggerServerEvent('bodycam:loadUserData')
end)

RegisterNetEvent('bodycam:updateInfo')
AddEventHandler('bodycam:updateInfo', function(data)
    SendNUIMessage({
        type = 'updateInfo',
        name = data.name,
        callsign = data.callsign,
        department = data.department
    })
end)
