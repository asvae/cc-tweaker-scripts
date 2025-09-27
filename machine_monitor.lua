-- Machine Monitor Script
-- This script monitors a machine's state and displays it on a monitor every second
-- Configure the machine and monitor names at the top of the script

-- ===== CONFIGURATION =====
local MACHINE_NAME = "lathe_0"  -- Change this to your machine's peripheral name
local MONITOR_NAME = "monitor_0"  -- Change this to your monitor's peripheral name
local UPDATE_INTERVAL = 1  -- Update every N seconds

-- ===== SCRIPT START =====
print("=== Machine Monitor Starting ===")

-- Check if peripherals exist
if not peripheral.isPresent(MACHINE_NAME) then
    print("Error: Machine '" .. MACHINE_NAME .. "' not found!")
    print("Make sure:")
    print("1. The machine has a wireless modem attached")
    print("2. Your computer has a wireless modem")
    print("3. Both modems are on the same channel (default 0)")
    print("4. Right-clicked on modems to connect them")
    print("Run 'explore_peripherals.lua' to see available peripherals.")
    return
end

if not peripheral.isPresent(MONITOR_NAME) then
    print("Error: Monitor '" .. MONITOR_NAME .. "' not found!")
    print("Make sure you have a monitor with wireless modem connected.")
    return
end

-- Wrap peripherals
local machine = peripheral.wrap(MACHINE_NAME)
local monitor = peripheral.wrap(MONITOR_NAME)

-- Get monitor dimensions
local width, height = monitor.getSize()
monitor.setTextScale(0.5)  -- Adjust text scale if needed

print("Machine: " .. MACHINE_NAME)
print("Monitor: " .. MONITOR_NAME .. " (" .. width .. "x" .. height .. ")")
print("Update interval: " .. UPDATE_INTERVAL .. " second(s)")
print()
print("Starting monitoring... (Press Ctrl+T to stop)")
print()

-- Function to safely call a method and return result or error message
local function safeCall(methodName, ...)
    local success, result = pcall(function() return machine[methodName](...) end)
    if success then
        return result
    else
        return "Error: " .. tostring(result)
    end
end

-- Function to format energy values
local function formatEnergy(current, max)
    if type(current) == "number" and type(max) == "number" and max > 0 then
        local percentage = math.floor((current / max) * 100)
        return string.format("%d / %d RF (%d%%)", current, max, percentage)
    else
        return tostring(current) .. " / " .. tostring(max)
    end
end

-- Function to format progress values
local function formatProgress(progress)
    if type(progress) == "number" then
        local percentage = math.floor(progress * 100)
        return string.format("%.1f%%", progress * 100)
    else
        return tostring(progress)
    end
end

-- Main monitoring loop
while true do
    -- Clear monitor
    monitor.clear()
    monitor.setCursorPos(1, 1)
    
    -- Get current time
    local time = os.time()
    local timeStr = textutils.formatTime(time, false)
    
    -- Display header
    monitor.setTextColor(colors.white)
    monitor.write("=== " .. MACHINE_NAME .. " Monitor ===")
    monitor.setCursorPos(1, 2)
    monitor.write("Time: " .. timeStr)
    monitor.setCursorPos(1, 3)
    monitor.write(string.rep("=", width))
    
    local line = 4
    
    -- Try to get common machine data
    local data = {}
    
    -- Energy data
    local energy = safeCall("getEnergy")
    local maxEnergy = safeCall("getMaxEnergy")
    if energy ~= "Error: attempt to call a nil value" then
        data.energy = formatEnergy(energy, maxEnergy)
    end
    
    -- State data
    local state = safeCall("getState")
    if state ~= "Error: attempt to call a nil value" then
        data.state = tostring(state)
    end
    
    -- Progress data
    local progress = safeCall("getProgress")
    if progress ~= "Error: attempt to call a nil value" then
        data.progress = formatProgress(progress)
    end
    
    -- Active status
    local isActive = safeCall("isActive")
    if isActive ~= "Error: attempt to call a nil value" then
        data.active = tostring(isActive)
    end
    
    -- Recipe data
    local recipe = safeCall("getRecipe")
    if recipe ~= "Error: attempt to call a nil value" then
        data.recipe = tostring(recipe)
    end
    
    -- Speed data
    local speed = safeCall("getSpeed")
    if speed ~= "Error: attempt to call a nil value" then
        data.speed = tostring(speed)
    end
    
    -- Efficiency data
    local efficiency = safeCall("getEfficiency")
    if efficiency ~= "Error: attempt to call a nil value" then
        data.efficiency = tostring(efficiency)
    end
    
    -- Display the data
    monitor.setCursorPos(1, line)
    monitor.setTextColor(colors.yellow)
    monitor.write("Machine Data:")
    line = line + 1
    
    if data.energy then
        monitor.setCursorPos(1, line)
        monitor.setTextColor(colors.lightBlue)
        monitor.write("Energy: " .. data.energy)
        line = line + 1
    end
    
    if data.state then
        monitor.setCursorPos(1, line)
        monitor.setTextColor(colors.green)
        monitor.write("State: " .. data.state)
        line = line + 1
    end
    
    if data.progress then
        monitor.setCursorPos(1, line)
        monitor.setTextColor(colors.orange)
        monitor.write("Progress: " .. data.progress)
        line = line + 1
    end
    
    if data.active then
        monitor.setCursorPos(1, line)
        monitor.setTextColor(colors.purple)
        monitor.write("Active: " .. data.active)
        line = line + 1
    end
    
    if data.recipe then
        monitor.setCursorPos(1, line)
        monitor.setTextColor(colors.cyan)
        monitor.write("Recipe: " .. data.recipe)
        line = line + 1
    end
    
    if data.speed then
        monitor.setCursorPos(1, line)
        monitor.setTextColor(colors.magenta)
        monitor.write("Speed: " .. data.speed)
        line = line + 1
    end
    
    if data.efficiency then
        monitor.setCursorPos(1, line)
        monitor.setTextColor(colors.lime)
        monitor.write("Efficiency: " .. data.efficiency)
        line = line + 1
    end
    
    -- If no data was found, show available methods
    if not next(data) then
        monitor.setCursorPos(1, line)
        monitor.setTextColor(colors.red)
        monitor.write("No standard methods found!")
        line = line + 1
        monitor.setCursorPos(1, line)
        monitor.write("Run 'discover_machine_methods.lua' to see available methods.")
        line = line + 1
    end
    
    -- Display footer
    line = height - 1
    monitor.setCursorPos(1, line)
    monitor.setTextColor(colors.gray)
    monitor.write(string.rep("=", width))
    line = line + 1
    monitor.setCursorPos(1, line)
    monitor.setTextColor(colors.gray)
    monitor.write("Press Ctrl+T to stop monitoring")
    
    -- Wait before next update
    sleep(UPDATE_INTERVAL)
end
