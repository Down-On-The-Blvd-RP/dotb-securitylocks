fx_version 'cerulean'
game 'gta5'

author 'DownOnTheBlvd_RP'
description 'DOTB Security Locks - Door Lock System for QBCore, ESX Legacy, QBox, and Standalone'
version '1.0.0'

shared_scripts {
    'config.lua',
    'locales/en.lua'
}

server_scripts {
    'server/server.lua'
}

client_scripts {
    'client/client.lua',
    'utils/utils.lua'
}

dependencies {
    'ox_lib'
}
