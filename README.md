
# dotb-securitylocks

## Description

**dotb-securitylocks** is a FiveM resource designed to provide a comprehensive door lock system compatible with **QBCore**, **ESX Legacy**, **QBox**, and **Standalone** frameworks. It supports automatic locking/unlocking of doors based on in-game time, provides notifications for break-ins and explosions, and integrates job-specific notifications for law enforcement, security companies, and fire departments. Additionally, it allows players to break into locked doors using specific tools and animations.

---

## Features

- **Automatic Door Locking/Unlocking**: Doors automatically lock and unlock based on in-game time or configurable settings.
- **Multiple Framework Support**: Works with **QBCore**, **ESX Legacy**, **QBox**, and **Standalone** modes.
- **Break-In Detection**: Sends notifications to specific jobs when a break-in is detected.
- **Explosion Detection**: Alerts fire departments when an explosion occurs near a door.
- **Customizable Door List**: Easily add more doors with the option to configure lock/unlock timings.
- **Support for Various Tools**: Players can use lockpicks, thermite, and crowbars to break into doors.
- **Job Notifications**: Notifies relevant jobs for break-ins and explosions (Police, Security Companies, Fire Department).
- **Animations for Tools**: Includes animations for breaking into doors with lockpicks, thermite, or crowbars.
- **Locale Support**: Supports multiple languages including English, Spanish, French, German, Russian, and Portuguese.

---

## Installation

1. Download and extract the **dotb-securitylocks** resource into your **resources** folder.
2. Add the resource to your **server.cfg**:
   ```txt
   ensure dotb-securitylocks
   ```
3. Customize the `config.lua` file to add doors and set auto-lock times, required break-in tools, and job notifications.

---

## Configuration

The configuration file is located in `config.lua`. This file allows you to customize door locations, lock/unlock times, required tools for breaking in, job notifications, and more. Example configuration:

```lua
Config.DoorList = {
    {
        id = "store_247_1",
        doors = {
            {coords = vector3(373.875, 327.882, 103.566), heading = 0.0}  -- Door 1 location
        },
        locked = true,
        autoLockTime = {lock = 20, unlock = 8},  -- Auto-lock after 20 minutes, unlock at 8am
        breakInRequiredItems = {"lockpick", "weapon_crowbar"},
        notifyJobs = {"police", "securoserv"},  -- Notifications for these jobs
        fireAlarm = true  -- Send fire alarm if explosion happens
    }
}
```

---

## Exports

### `dotb-securitylocks:toggleDoor(doorId, state)`
- **Description**: Toggles the state of a door (lock or unlock).
- **Parameters**: 
  - `doorId` (string) - The ID of the door to toggle.
  - `state` (boolean) - `true` to lock, `false` to unlock.
  
### `dotb-securitylocks:notifyJobs(doorId, alertType)`
- **Description**: Notifies jobs of a break-in or explosion at a specific door.
- **Parameters**: 
  - `doorId` (string) - The ID of the door.
  - `alertType` (string) - Either "breakin" or "explosion".

---

## Supported Jobs

The resource sends notifications based on the `notifyJobs` configuration for each door. The supported jobs for notifications are:

- **Police** (`police`)
- **LSSD** (`lssd`)
- **SAHP** (`sahp`)
- **BCSO** (`bcso`)
- **SecuroServ** (`securoserv`)
- **Gruppe6** (`gruppe6`)
- **Fire Department** (`fire`)

---

## Required Tools for Break-ins

Players can break into doors using the following tools. The necessary items are checked and must be available in the player’s inventory for the break-in to be successful:

- **Lockpick**
- **Thermite**
- **Weapon_Crowbar**

---

## Usage

1. **Locking and Unlocking Doors**:  
   Players can interact with doors to lock or unlock them based on their configuration.
   
2. **Breaking into Doors**:  
   Players with the required tools (lockpick, thermite, or crowbar) can break into doors. Once the break-in occurs, the corresponding jobs are notified.

3. **Automatic Locking**:  
   Doors can be configured to automatically lock or unlock based on in-game time (e.g., at 20:00, doors lock; at 08:00, doors unlock).

4. **Job Notifications**:  
   When a break-in or explosion occurs, the configured jobs (police, security, fire) will receive a notification.

---

## Locales

The resource supports multiple languages. You can configure the language by modifying the `lang` variable in the `client.lua` file. Available languages:

- English (`en`)
- Spanish (`es`)
- French (`fr`)
- German (`de`)
- Russian (`ru`)
- Portuguese (`pt`)

---

## Contributing

Contributions are welcome! If you find any issues or want to add new features, feel free to open a pull request or report a bug on the [GitHub Repository](https://github.com/YourRepo/dotb-securitylocks).

---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Contact

For further inquiries or support, feel free to reach out to me via [Email](mailto:your.email@example.com).
