# dotb-securitylocks

`dotb-securitylocks` is a FiveM resource designed to automatically lock and unlock doors for 24/7 stores, liquor stores, ammunition stores, and banks based on in-game time. The resource supports automatic door locking during after-hours and unlocking during business hours. It also sends robbery notifications to the police (or any other configured job) and supports multiple frameworks including ESX, QBCore, and QBox.

## Features:
- **Automatic Door Locking**: Automatically locks and unlocks doors based on in-game time (after hours and business hours).
- **Job-Based Notifications**: Sends robbery notifications to jobs like police or other defined roles when a robbery happens.
- **Multi-Framework Support**: Compatible with ESX Legacy, QBCore, and QBox.
- **Configurable Settings**: Modify door locations, lock times, and notification systems in the configuration file.

## Requirements:
- **FiveM Server** with the latest `cerulean` FX version.
- Framework compatibility: ESX, QBCore, or QBox (ensure your server has one of these frameworks installed).
- Optionally, you can use `ox_lib` or `qb_notify` for robbery notifications.

## Installation:
1. **Download the Resource**:
   - Download or clone the `dotb-securitylocks` resource into your `resources` folder in your FiveM server.

2. **Add to server configuration**:
   - In your `server.cfg`, add the following line to ensure the resource starts when your server boots up:
     ```bash
     ensure dotb-securitylocks
     ```

3. **Configure the Resource**:
   - Open the `config.lua` file and modify the settings for the locations of the stores, the lock/unlock hours, and which notification system to use (either `ox_lib` or `qb_notify`).
   - Modify the robbery notification settings and jobs that should receive notifications.

## Configuration:
The configuration file `config.lua` allows you to modify:
- **Store Locations**: Define coordinates and door names for 24/7 stores, liquor stores, ammunition stores, and banks.
- **Lock Times**: Set the start and end hours for when the stores should be locked (after hours).
- **Unlock Anytime**: Set to `true` if doors should be unlockable at any time, or set to `false` to follow the time-based locking.
- **Notification System**: Choose between `ox_lib` or `qb_notify` for sending robbery notifications.
- **Robbery Notifications**: Define which job types (such as police) will receive notifications during a robbery.

### Example Configuration:
```lua
Config.LockTimes = {
    start = 22,  -- 10 PM
    end = 6,     -- 6 AM
}

Config.StoreDoors = {
    { name = "24/7 Store", coords = vector3(25.7, -1346.5, 29.5), door = "store_door" },
    { name = "Rob's Liquor", coords = vector3(1393.1, 3606.9, 34.9), door = "liquor_door" },
    -- Add other locations here...
}

Config.UnlockAnytime = true  -- Set to true if doors can be unlocked at any time
Config.NotificationSystem = "ox_lib"  -- Choose between 'ox_lib' or 'qb_notify'
Config.RobberyNotification = {
    jobType = "police",  -- Job type to notify (e.g., 'police')
    message = "A robbery is in progress at a store!"
}
