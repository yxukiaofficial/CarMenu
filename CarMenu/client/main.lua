--[[
    BCRPCarMenu - Main Client Script
    Professional vehicle spawning system for Black Canyon RP
    
    Author: Yxukia
    Version: 2.0.0
]]

-- Local Variables
local PlayerData = {}
local LastSpawnTime = 0
local CurrentVehicle = nil
local Menus = {}
local IsMenuOpen = false

-- Utility Functions
local function PrintDebug(message)
    if Config.Debug then
        print('[BCRPCarMenu] ' .. message)
    end
end

local function IsPlayerInVehicle()
    local ped = PlayerPedId()
    return IsPedSittingInAnyVehicle(ped, false)
end

local function GetCurrentVehicle()
    local ped = PlayerPedId()
    if IsPlayerInVehicle() then
        return GetVehiclePedIsIn(ped, false)
    end
    return nil
end

local function IsSpamProtectionActive()
    if not Config.AntiSpam.Enabled then
        return false
    end
    
    local currentTime = GetGameTimer()
    return (currentTime - LastSpawnTime) < Config.AntiSpam.Cooldown
end

-- Vehicle Management Functions
function DeleteCurrentVehicle()
    local vehicle = GetCurrentVehicle()
    if vehicle and DoesEntityExist(vehicle) then
        NetworkRequestControlOfEntity(vehicle)
        local timeout = 0
        while not NetworkHasControlOfEntity(vehicle) and timeout < 50 do
            timeout = timeout + 1
            Wait(10)
        end
        
        if NetworkHasControlOfEntity(vehicle) then
            SetEntityAsMissionEntity(vehicle, true, true)
            DeleteEntity(vehicle)
            CurrentVehicle = nil
            PrintDebug('Vehicle deleted successfully')
        else
            PrintDebug('Failed to gain control of vehicle for deletion')
        end
    end
end

function SpawnVehicle(vehicleName)
    if IsSpamProtectionActive() then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"BCRPCarMenu", "Please wait before spawning another vehicle."}
        })
        return false
    end
    
    local vehicleHash = GetHashKey(vehicleName)
    
    -- Request and load model
    RequestModel(vehicleHash)
    local timeout = 0
    while not HasModelLoaded(vehicleHash) and timeout < 100 do
        timeout = timeout + 1
        Wait(10)
    end
    
    if not HasModelLoaded(vehicleHash) then
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"BCRPCarMenu", "Failed to load vehicle model: " .. vehicleName}
        })
        return false
    end
    
    -- Delete current vehicle if enabled
    if Config.SpawnSettings.DeleteOnSpawn then
        DeleteCurrentVehicle()
    end
    
    -- Get spawn position
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    local offset = Config.SpawnSettings.Offset
    
    local spawnX = coords.x + offset.x
    local spawnY = coords.y + offset.y
    local spawnZ = coords.z + offset.z
    
    -- Create vehicle
    local vehicle = CreateVehicle(vehicleHash, spawnX, spawnY, spawnZ, heading, true, false)
    
    if DoesEntityExist(vehicle) then
        -- Set vehicle properties
        SetVehicleEngineHealth(vehicle, Config.SpawnSettings.EngineHealth)
        SetVehicleHealth(vehicle, Config.SpawnSettings.Health)
        SetVehicleFuelLevel(vehicle, Config.SpawnSettings.FuelLevel)
        
        -- Put player in vehicle if enabled
        if Config.SpawnSettings.SetIntoVehicle then
            SetPedIntoVehicle(ped, vehicle, -1)
        end
        
        -- Set as current vehicle
        CurrentVehicle = vehicle
        
        -- Cleanup
        SetEntityAsNoLongerNeeded(vehicle)
        SetModelAsNoLongerNeeded(vehicleHash)
        
        -- Update spawn time
        LastSpawnTime = GetGameTimer()
        
        PrintDebug('Vehicle spawned successfully: ' .. vehicleName)
        return true
    else
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"BCRPCarMenu", "Failed to spawn vehicle: " .. vehicleName}
        })
        return false
    end
end

-- Menu Creation Functions
local function CreateMainMenu()
    local menu = MenuV:CreateMenu(
        Config.MenuSettings.Title,
        Config.MenuSettings.Subtitle,
        Config.MenuSettings.Position,
        table.unpack(Config.MenuSettings.Color),
        Config.MenuSettings.Size,
        Config.MenuSettings.Style,
        Config.MenuSettings.Framework,
        Config.MenuSettings.Namespace
    )
    
    menu:On('open', function()
        menu:ClearItems()
        
        -- Add category buttons
        for _, category in pairs(Config.Categories) do
            local subMenu = Menus[category.menuId]
            if subMenu then
                menu:AddButton({
                    icon = category.icon,
                    label = category.name,
                    value = subMenu,
                    description = category.description
                })
            end
        end
    end)
    
    menu:On('close', function()
        IsMenuOpen = false
        PrintDebug('Menu closed')
    end)
    
    return menu
end

local function CreateVehiclePackMenu(pack)
    local menu = MenuV:CreateMenu(
        pack.name,
        Config.MenuSettings.Title,
        Config.MenuSettings.Position,
        table.unpack(Config.MenuSettings.Color)
    )
    
    menu:On('open', function()
        menu:ClearItems()
        
        for _, vehicle in pairs(pack.vehicles) do
            local button = menu:AddButton({
                label = vehicle.name,
                description = vehicle.description
            })
            
            button:On('select', function()
                SpawnVehicle(vehicle.spawnName)
            end)
        end
    end)
    
    return menu
end

local function CreateEmergencyServicesMenu()
    local menu = MenuV:CreateMenu(
        'Emergency Services',
        Config.MenuSettings.Title,
        Config.MenuSettings.Position,
        table.unpack(Config.MenuSettings.Color)
    )
    
    menu:On('open', function()
        menu:ClearItems()
        
        for _, service in pairs(Config.EmergencyServices) do
            local subMenu = Menus[service.menuId]
            if subMenu then
                menu:AddButton({
                    icon = service.icon,
                    label = service.name,
                    value = subMenu,
                    description = service.description
                })
            end
        end
    end)
    
    return menu
end

local function CreateEmergencyServiceVehiclesMenu(service)
    local menu = MenuV:CreateMenu(
        service.name,
        Config.MenuSettings.Title,
        Config.MenuSettings.Position,
        table.unpack(Config.MenuSettings.Color)
    )
    
    menu:On('open', function()
        menu:ClearItems()
        
        for _, vehicle in pairs(service.vehicles) do
            local button = menu:AddButton({
                label = vehicle.name,
                description = vehicle.description
            })
            
            button:On('select', function()
                SpawnVehicle(vehicle.spawnName)
            end)
        end
    end)
    
    return menu
end

local function CreateKeyVehiclesMenu()
    local menu = MenuV:CreateMenu(
        'Key Vehicles',
        Config.MenuSettings.Title,
        Config.MenuSettings.Position,
        table.unpack(Config.MenuSettings.Color)
    )
    
    menu:On('open', function()
        menu:ClearItems()
        
        for _, keyPack in pairs(Config.KeyVehicles) do
            local subMenu = Menus[keyPack.menuId]
            if subMenu then
                menu:AddButton({
                    icon = keyPack.icon,
                    label = keyPack.name,
                    value = subMenu,
                    description = keyPack.description
                })
            end
        end
    end)
    
    return menu
end

local function CreateKeyVehiclesSubMenu(keyPack)
    local menu = MenuV:CreateMenu(
        keyPack.name,
        Config.MenuSettings.Title,
        Config.MenuSettings.Position,
        table.unpack(Config.MenuSettings.Color)
    )
    
    menu:On('open', function()
        menu:ClearItems()
        
        for _, vehicle in pairs(keyPack.vehicles) do
            local button = menu:AddButton({
                label = vehicle.name,
                description = vehicle.description
            })
            
            button:On('select', function()
                SpawnVehicle(vehicle.spawnName)
            end)
        end
    end)
    
    return menu
end

local function CreateFreeVehiclesMenu()
    local menu = MenuV:CreateMenu(
        'Free Vehicles',
        Config.MenuSettings.Title,
        Config.MenuSettings.Position,
        table.unpack(Config.MenuSettings.Color)
    )
    
    menu:On('open', function()
        menu:ClearItems()
        
        for _, vehicle in pairs(Config.FreeVehicles) do
            local button = menu:AddButton({
                label = vehicle.name,
                description = vehicle.description
            })
            
            button:On('select', function()
                SpawnVehicle(vehicle.spawnName)
            end)
        end
    end)
    
    return menu
end

-- Initialize Menus
local function InitializeMenus()
    PrintDebug('Initializing menus...')
    
    -- Create main menu
    Menus[1] = CreateMainMenu()
    
    -- Create vehicle pack menus
    for _, pack in pairs(Config.VehiclePacks) do
        Menus[pack.menuId] = CreateVehiclePackMenu(pack)
    end
    
    -- Create emergency services menu
    Menus[18] = CreateEmergencyServicesMenu()
    
    -- Create emergency service vehicle menus
    for _, service in pairs(Config.EmergencyServices) do
        Menus[service.menuId] = CreateEmergencyServiceVehiclesMenu(service)
    end
    
    -- Create key vehicles menu
    Menus[3] = CreateKeyVehiclesMenu()
    
    -- Create key vehicle sub-menus
    for _, keyPack in pairs(Config.KeyVehicles) do
        Menus[keyPack.menuId] = CreateKeyVehiclesSubMenu(keyPack)
    end
    
    -- Create free vehicles menu
    Menus[23] = CreateFreeVehiclesMenu()
    
    PrintDebug('All menus initialized successfully')
end

-- Export Functions
function OpenCarMenu()
    if IsMenuOpen then
        PrintDebug('Menu is already open, ignoring request')
        return
    end
    
    if Menus[1] then
        IsMenuOpen = true
        Menus[1]:Open()
        PrintDebug('Menu opened successfully')
    end
end

-- Event Handlers
RegisterNetEvent('BCRPCarMenu:OpenMenu')
AddEventHandler('BCRPCarMenu:OpenMenu', function()
    OpenCarMenu()
end)

-- Key Bindings
RegisterCommand('carmenu', function()
    OpenCarMenu()
end, false)

RegisterKeyMapping('carmenu', 'Open Car Menu', 'keyboard', Config.Keys.OpenMenu)

-- Resource Start
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PrintDebug('BCRPCarMenu started successfully')
        InitializeMenus()
    end
end)

-- Resource Stop
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        PrintDebug('BCRPCarMenu stopped')
        -- Cleanup any spawned vehicles if needed
        if CurrentVehicle and DoesEntityExist(CurrentVehicle) then
            DeleteCurrentVehicle()
        end
    end
end)

-- Initialize when resource loads
CreateThread(function()
    Wait(1000) -- Wait for everything to load
    InitializeMenus()
    PrintDebug('BCRPCarMenu loaded and ready')
end)
