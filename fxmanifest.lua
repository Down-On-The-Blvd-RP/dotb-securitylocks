fx_version 'cerulean'
game 'gta5'

author 'DownOnTheBlvd_RP'
description 'dotb-securitylocks - Automatic door locking for stores, liquor stores, ammunition stores, and banks'
version '1.0'

-- Define client-side scripts
client_scripts {
    'client/client.lua'   -- Client-side script for door locking and robbery detection
}

-- Define server-side scripts
server_scripts {
    'server/server.lua',  -- Server-side script for door locking logic
    'bridge/bridge.lua'   -- Bridge script for handling framework compatibility
}

-- Configuration file
shared_script 'config.lua'  -- Shared config file for all settings

-- Add necessary dependencies if any
dependency 'ox_lib'  -- Optional if you're using ox_lib for notifications
dependency 'qb-core'  -- Optional if you're using qb-core
dependency 'es_extended' -- Optional if you're using ESX
dependency 'qbox-core' -- Optional if you're using QBox
