# CarMenu - Professional Vehicle Spawning System

vehicle spawning system for FiveM with comprehensive vehicle categories, anti-spam protection, and sleek UI integration.

## 🚗 Features

- **Comprehensive Vehicle Categories**: Organized vehicle packs including Supercars, Luxury Cars, JDM, Drag Racing, Drift, Trucks, and Motorcycles
- **Emergency Services**: Complete law enforcement and emergency vehicle collections
- **Key Vehicles**: Exclusive vehicle access for specific users
- **Free Vehicles**: Member-accessible vehicle collection
- **Anti-Spam Protection**: Prevents rapid vehicle spawning with configurable cooldowns
- **Professional UI**: Clean, organized menu system using MenuV framework
- **Error Handling**: Robust error handling and user feedback
- **Configurable**: Easy-to-modify configuration system
- **Export Functions**: Available for integration with other resources

## 📋 Requirements

- FiveM Server
- MenuV Framework
- Lua 5.4 support

## 🛠️ Installation

1. **Download the resource** to your server's resources folder
2. **Ensure MenuV is installed** and running on your server
3. **Add to server.cfg**:
   ```
   ensure menuv
   ensure CarMenu
   ```
4. **Restart your server**

## ⚙️ Configuration

All settings are located in `config.lua`. Key configuration options:

### Menu Settings
```lua
Config.MenuSettings = {
    Title',
    Subtitle = 'Vehicle Spawner',
    Position = 'topright',
    Color = {255, 0, 0}, -- Might Not work
    Size = 'size-125',
    Style = 'RSC',
    Framework = 'menuv',
    Namespace = 'bcrp_car_menu'
}
```

### Key Bindings
```lua
Config.Keys = {
    OpenMenu = 'F9',
    CloseMenu = 'ESC'
}
```

### Spawn Settings
```lua
Config.SpawnSettings = {
    Offset = {x = 2, y = 2, z = 1},
    SetIntoVehicle = true,
    DeleteOnSpawn = true,
    Health = 1000,
    EngineHealth = 1000,
    FuelLevel = 100.0
}
```

### Anti-Spam Protection
```lua
Config.AntiSpam = {
    Enabled = true,
    Cooldown = 2000, -- 2 seconds
    MaxVehicles = 1
}
```

## 🎮 Usage

### In-Game Commands
- `/carmenu` - Opens the vehicle menu
- `F9` - Default key binding to open menu

### Adding New Vehicles

To add new vehicles, edit the appropriate section in `config.lua`:

```lua
-- Example: Adding to Supercar Pack
{
    name = 'Supercar Pack',
    icon = '🏎️',
    description = 'High-performance supercars',
    menuId = 8,
    vehicles = {
        {name = 'New Supercar', spawnName = 'newsupercar', description = 'Description here'},
        -- Add more vehicles...
    }
}
```

### Vehicle Categories

1. **Free Vehicles** - Member-accessible vehicles
2. **Paid Packs** - Premium vehicle collections
3. **Keys** - Exclusive vehicle access
4. **Emergency Services** - Law enforcement and emergency vehicles

## 🔧 Export Functions

The resource provides several export functions for integration:

```lua
-- Open the car menu
exports['CarMenu']:OpenCarMenu()

-- Spawn a specific vehicle
exports['CarMenu']:SpawnVehicle('vehicleName')

-- Delete current vehicle
exports['CarMenu']:DeleteCurrentVehicle()
```

## 📁 File Structure

```
CarMenu/
├── fxmanifest.lua          # Resource manifest
├── config.lua              # Configuration file
├── client/
│   └── main.lua           # Main client script
├── README.md              # This file
└── menu.lua               # Legacy file (deprecated)
```

## 🚨 Emergency Services

The script includes comprehensive emergency service vehicles:

- **Blaine County Sheriff's Office (BCSO)**
- **Los Santos Police Department (LSPD)**
- **San Andreas State Trooper (SAST)**
- **SWAT Units**
- **Emergency Services Management**
- **Los Santos Military**
- **SAFR & Rescue**

## 🏎️ Vehicle Packs

### Supercar Pack
High-performance supercars including McLaren, Ferrari, Lamborghini, and more.

### Luxury Car Pack
Premium luxury vehicles (currently under development).

### JDM Pack
Japanese Domestic Market vehicles (currently under development).

### Drag Pack
Specialized drag racing vehicles with 20+ options.

### Drift Pack
Drift and time attack vehicles including Toyota Supra, Lexus SC300, and more.

### Truck Pack
Trucks and utility vehicles including Ram, Ford, and Nissan models.

### Motorcycle Pack
Comprehensive motorcycle collection with Harley Davidson, Indian, and custom bikes.

## 🔑 Key Vehicles

### Kia's Keys
Exclusive vehicles including:
- Dodge Hellcat
- Camaro Z28 LS7 V8
- Ferrari 488 Spider
- Brabus Rocket GT900
- And more...

### Hose's Keys
Special access vehicles including:
- Tesla Cyber Truck
- VigeroZX WideBody
- Dodge Ram 5th Gen
- And more...

### Dev Keys
Developer-exclusive vehicles including:
- 2024 Buza
- Dark Horse Wide Body
- Lockheed SR-71 Blackbird
- And more...

## 🐛 Troubleshooting

### Common Issues

1. **Menu not opening**: Ensure MenuV is properly installed and started
2. **Vehicles not spawning**: Check vehicle model names in config
3. **Permission errors**: Verify file permissions and resource dependencies

### Debug Mode

Enable debug mode in `config.lua`:
```lua
Config.Debug = true
```

This will provide detailed console output for troubleshooting.

## 📝 Changelog

### Version 2.0.0
- Complete code restructuring and professionalization
- Added comprehensive configuration system
- Improved error handling and user feedback
- Enhanced anti-spam protection
- Added export functions for integration
- Organized vehicle data into structured configuration
- Added debug mode for troubleshooting
- Improved code documentation and comments

### Version 1.0.0
- Initial release with basic vehicle spawning functionality

## 👨‍💻 Author

**Yxukia** - Original developer and maintainer

## 📄 License

This resource is proprietary to Yxukia. All rights reserved.

## 🤝 Support

For support, please contact the development team or create an issue in the repository.

---

**Note**: This resource is specifically designed by Yxukia. Please ensure you have proper permissions before using or modifying this resource.
