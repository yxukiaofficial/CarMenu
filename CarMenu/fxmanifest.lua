fx_version 'cerulean'
game 'gta5'

-- Resource Information
name 'Car Menu'
version '2.0.0'
description 'Professional vehicle spawning system with comprehensive vehicle categories, mass spawn prevention, and sleek UI integration.'
author 'Yxukia'
url 'https://github.com/yxukiaofficial/CarMenu'
repository 'https://github.com/yxukiaofficial/CarMenu'

-- Script Configuration
lua54 'yes'

-- Client Scripts
client_scripts {
    '@menuv/menuv.lua',
    'config.lua',
    'client/main.lua'
}

-- Dependencies
dependencies {
    'menuv'
}

-- Export Functions (if needed for other resources)
exports {
    'OpenCarMenu',
    'SpawnVehicle',
    'DeleteCurrentVehicle'
}