-- Explore Peripherals Script
-- This script helps you discover what peripherals are connected to your computer
-- and what methods are available on each peripheral

print("=== CC: Tweaked Peripheral Explorer ===")
print("Discovering connected peripherals...")
print()

-- Get all connected peripherals
local peripherals = peripheral.getNames()

if #peripherals == 0 then
print("No peripherals found!")
print("Make sure you have:")
print("1. Wireless modems connected to your computer")
print("2. Other peripherals (machines, monitors) with wireless modems")
print("3. Right-clicked on modems to connect them")
print("4. All modems are on the same channel (default channel 0)")
    return
end

print("Found " .. #peripherals .. " peripheral(s):")
print()

for i, name in ipairs(peripherals) do
    print("[" .. i .. "] " .. name)
    
    -- Get peripheral type
    local peripheralType = peripheral.getType(name)
    print("    Type: " .. (peripheralType or "unknown"))
    
    -- Get available methods
    local methods = peripheral.getMethods(name)
    if methods and #methods > 0 then
        print("    Available methods (" .. #methods .. "):")
        for j, method in ipairs(methods) do
            print("      - " .. method)
        end
    else
        print("    No methods available")
    end
    
    print()
end

print("=== Common Machine Data Types ===")
print("Typical methods you might find on machines:")
print("- getEnergy() - Current energy level")
print("- getMaxEnergy() - Maximum energy capacity")
print("- getProgress() - Current progress (0-1)")
print("- getState() - Machine state (idle, working, error)")
print("- getRecipe() - Current recipe being processed")
print("- getInputItems() - Items in input slots")
print("- getOutputItems() - Items in output slots")
print("- isActive() - Whether machine is currently working")
print("- getSpeed() - Processing speed")
print("- getEfficiency() - Energy efficiency")
print()

print("To use a peripheral, wrap it like this:")
print('local machine = peripheral.wrap("peripheral_name")')
print('local data = machine.getMethodName()')
