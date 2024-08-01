fx_version 'cerulean'
game 'gta5'

-- Specify Lua version
lua54 'yes'

-- Resource metadata
name 'Bodycam'
description 'A bodycam UI with persistent settings'
author 'mason modifications'
version '1.0.0'

-- Client-side scripts
client_scripts {
    'client.lua'
}

-- Server-side scripts
server_scripts {
    'server.lua'
}

-- HTML, CSS, and JS for the NUI
ui_page 'html/bodycam.html'

files {
    'html/bodycam.html',
    'html/logo.png',       -- Make sure this path is correct
    'html/bodycam_on.wav'  -- Make sure this path is correct
}