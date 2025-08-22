--[[
    Car Menu Configuration
    
    Author: Yxukia
    Version: 2.0.0
]]

Config = {}

-- Menu Configuration
Config.MenuSettings = {
    Title = 'Server Name',
    Subtitle = 'Vehicle Spawner',
    Position = 'topright',
    Color = {255, 127, 0}, -- Might Not work
    Size = 'size-125',
    Style = 'RSC',
    Framework = 'menuv',
    Namespace = 'Car Menu'
}

-- Key Bindings
Config.Keys = {
    OpenMenu = 'F9',
    CloseMenu = 'ESC'
}

-- Vehicle Categories
Config.Categories = {
    {
        name = 'Free Vehicles',
        icon = '👑',
        description = 'Member Cars',
        menuId = 23
    },
    {
        name = 'Paid Packs',
        icon = '💰',
        description = 'Premium Vehicle Packs',
        menuId = 2
    },
    {
        name = 'Keys',
        icon = '🔑',
        description = 'Exclusive Key Vehicles',
        menuId = 3
    },
    {
        name = 'Emergency Services',
        icon = '🚓',
        description = 'Law Enforcement & Emergency Vehicles',
        menuId = 18
    }
}

-- Vehicle Packs
Config.VehiclePacks = {
    {
        name = 'Supercar Pack',
        icon = '🏎️',
        description = 'High-performance supercars',
        menuId = 8,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    },
    {
        name = 'Luxury Car Pack',
        icon = '🚗',
        description = 'Premium luxury vehicles',
        menuId = 9,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    },
    {
        name = 'JDM Pack',
        icon = '🚗',
        description = 'Japanese Domestic Market vehicles',
        menuId = 10,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    },
    {
        name = 'Go-Kart Pack',
        icon = '🛵',
        description = 'Go-kart vehicles',
        menuId = 11,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    },
    {
        name = 'Drag Pack',
        icon = '🏎️',
        description = 'Drag racing vehicles',
        menuId = 12,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    },
    {
        name = 'Drift Pack',
        icon = '🚘',
        description = 'Drift and time attack vehicles',
        menuId = 13,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    },
    {
        name = 'Truck Pack',
        icon = '🛻',
        description = 'Truck and utility vehicles',
        menuId = 14,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    },
    {
        name = 'Motorcycle Pack',
        icon = '🛵',
        description = 'Motorcycle collection',
        menuId = 15,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    }
}

-- Emergency Services Categories
Config.EmergencyServices = {
    {
        name = 'Blaine County Sheriff\'s Office',
        icon = '👮🏻',
        description = 'BCSO Patrol Vehicles',
        menuId = 16,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    },
    {
        name = 'Los Santos Police Department',
        icon = '👮🏻',
        description = 'LSPD Patrol Vehicles',
        menuId = 17,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    },
    {
        name = 'San Andreas State Trooper',
        icon = '👮🏻',
        description = 'SAHP Patrol Vehicles',
        menuId = 28,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    },
    {
        name = 'SWAT Only',
        icon = '👮🏻',
        description = 'SWAT Patrol Vehicles',
        menuId = 19,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    },
    {
        name = 'ES Management Only',
        icon = '🚨',
        description = 'Directors + Vehicles',
        menuId = 20,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    },
    {
        name = 'Los Santos Military',
        icon = '🪖',
        description = 'LSM Vehicles',
        menuId = 21,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    },
    {
        name = 'SAFR & Rescue',
        icon = '🚨',
        description = 'SAFR and EMS Vehicles',
        menuId = 22,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    }
}

-- Key Vehicles
Config.KeyVehicles = {
    {
        name = ' Keys',
        icon = '🚀',
        description = ' Keys',
        menuId = 24,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    },
    {
        name = ' Keys',
        icon = '🦇',
        description = 'Hose\'s Keys',
        menuId = 27,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    },
    {
        name = 'Dev Keys',
        icon = '🚛',
        description = 'Dev Keys',
        menuId = 26,
        vehicles = {
            {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
        }
    }
}

-- Free Vehicles
Config.FreeVehicles = {
    {name = 'Vehicle name', spawnName = 'Vehiclespawncode', description = 'Vehicle Description'}
}

-- Spawn Settings
Config.SpawnSettings = {
    Offset = {x = 2, y = 2, z = 1},
    SetIntoVehicle = true,
    DeleteOnSpawn = true,
    Health = 1000,
    EngineHealth = 1000,
    FuelLevel = 100.0
}

-- Anti-Spam Settings
Config.AntiSpam = {
    Enabled = true,
    Cooldown = 2000, -- 2 seconds
    MaxVehicles = 1
}

-- Debug Settings
Config.Debug = false -- Set to true to enable debug messages
