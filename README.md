# CC: Tweaked Machine Monitor Scripts

This collection of scripts helps you monitor machine states in Minecraft using CC: Tweaked with Monifactory mods.

## Setup Instructions

### 1. Hardware Setup
1. **Place your machine** (e.g., lathe) in the world
2. **Attach a wireless modem** to the machine
3. **Right-click the modem** to connect it to the machine
4. **Place a computer** with a wireless modem attached
5. **Ensure both modems are on the same channel** (default channel 0)
6. **Attach a monitor** to the computer (optional, for display)

### 2. Software Setup
1. **Get scripts into your computer** - See `HOW_TO_GET_SCRIPTS_INTO_COMPUTER.md` for detailed instructions
2. **Recommended method**: Use the `edit` program to paste scripts
3. Run the scripts in order to discover and monitor your machines

## Scripts Overview

### 1. `explore_peripherals.lua`
**Purpose**: Discover all connected peripherals and their basic information.

**Usage**: Run this first to see what peripherals are available.

**What it shows**:
- List of all connected peripherals
- Peripheral types
- Available methods for each peripheral
- Common machine data types you might find

### 2. `discover_machine_methods.lua`
**Purpose**: Deep dive into a specific machine to see what data you can access.

**Usage**: Run this after identifying your machine's peripheral name.

**What it shows**:
- Categorized methods (Energy, State, Items, Progress, etc.)
- Test results from calling common methods
- Usage examples for your specific machine

### 3. `machine_monitor.lua`
**Purpose**: Continuously monitor a machine and display its state on a monitor.

**Usage**: Configure the machine and monitor names, then run.

**Features**:
- Real-time monitoring every second
- Color-coded display
- Safe error handling
- Formatted energy and progress values
- Automatic fallback if methods aren't available

## Configuration

### Machine Monitor Configuration
Edit the top of `machine_monitor.lua`:

```lua
local MACHINE_NAME = "lathe_0"  -- Your machine's peripheral name
local MONITOR_NAME = "monitor_0"  -- Your monitor's peripheral name
local UPDATE_INTERVAL = 1  -- Update every N seconds
```

## Common Machine Data Types

Based on typical Monifactory and other mod machines, you can usually access:

### Energy Data
- `getEnergy()` - Current energy level
- `getMaxEnergy()` - Maximum energy capacity
- `getEnergyUsage()` - Energy consumption rate

### State Data
- `getState()` - Machine state (idle, working, error, etc.)
- `isActive()` - Whether machine is currently working
- `getStatus()` - Detailed status information

### Progress Data
- `getProgress()` - Current progress (0.0 to 1.0)
- `getRecipe()` - Current recipe being processed
- `getSpeed()` - Processing speed multiplier
- `getEfficiency()` - Energy efficiency

### Item Data
- `getInputItems()` - Items in input slots
- `getOutputItems()` - Items in output slots
- `getItemInSlot(slot)` - Specific item in a slot

### Other Data
- `getTemperature()` - Machine temperature (if applicable)
- `getRedstoneMode()` - Redstone control mode
- `getFacing()` - Machine orientation

## Usage Examples

### Basic Machine Access
```lua
local machine = peripheral.wrap("lathe_0")
local energy = machine.getEnergy()
local state = machine.getState()
print("Energy: " .. energy .. ", State: " .. state)
```

### Safe Method Calling
```lua
local function safeCall(methodName)
    local success, result = pcall(function() return machine[methodName]() end)
    if success then
        return result
    else
        return "Method not available"
    end
end

local energy = safeCall("getEnergy")
```

### Multiple Machine Monitoring
```lua
local machines = {"lathe_0", "furnace_0", "crusher_0"}

for _, machineName in ipairs(machines) do
    local machine = peripheral.wrap(machineName)
    local state = machine.getState()
    print(machineName .. ": " .. state)
end
```

## Troubleshooting

### "Peripheral not found" Error
- Make sure the machine has a wireless modem attached
- Right-click the modem to connect it
- Ensure both modems are on the same channel (default 0)
- Verify the peripheral name is correct
- Check that both modems are powered and functional

### "No methods available" Error
- Some machines might not expose peripheral methods
- Try different machines or check mod documentation
- Ensure the machine is properly powered and functional

### Monitor Display Issues
- Check monitor is properly attached to computer
- Adjust text scale in the script if needed
- Verify monitor dimensions are correct

## Advanced Features

### Custom Data Display
You can modify `machine_monitor.lua` to:
- Add custom data formatting
- Include more machine types
- Create alerts for specific conditions
- Log data to files

### Network Monitoring
For multiple machines:
- Use peripheral.find() to discover machines by type
- Create a central monitoring station
- Implement data logging and analysis

## Tips

1. **Start Simple**: Use `explore_peripherals.lua` first to see what's available
2. **Test Methods**: Use `discover_machine_methods.lua` to understand your specific machine
3. **Customize Display**: Modify the monitor script to show the data you care about
4. **Error Handling**: Always use safe method calling for production scripts
5. **Performance**: Don't update too frequently - 1 second is usually sufficient

## Contributing

Feel free to modify these scripts for your specific needs. Common modifications:
- Add support for new machine types
- Improve data formatting
- Add alert systems
- Create web interfaces
- Implement data logging
