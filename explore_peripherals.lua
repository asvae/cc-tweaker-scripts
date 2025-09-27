-- Explore Peripherals Script
-- This script helps you discover peripherals connected via wired modems

print("=== Wired Peripheral Explorer ===")
print("Scanning for connected peripherals...")
sleep(1)

-- Get all connected peripherals (this includes wired modem connections)
local peripherals = peripheral.getNames()

if #peripherals == 0 then
    print("No peripherals found!")
    print("Check:")
    print("1. Wired modems connected to computer")
    print("2. Networking cables connecting modems")
    print("3. Right-click modems to connect")
    print("4. Other devices have wired modems")
    print()
    print("Press any key to exit...")
    read()
    return
end

print("Found " .. #peripherals .. " peripheral(s)")
print("Press any key to continue...")
read()

-- Show each peripheral with pause
for i, name in ipairs(peripherals) do
    term.clear()
    print("=== Peripheral " .. i .. "/" .. #peripherals .. " ===")
    print("Name: " .. name)
    
    -- Get peripheral type
    local peripheralType = peripheral.getType(name)
    print("Type: " .. (peripheralType or "unknown"))
    
    -- Get available methods
    local methods = peripheral.getMethods(name)
    if methods and #methods > 0 then
        print("Methods: " .. #methods)
        print("First few methods:")
        for j = 1, math.min(5, #methods) do
            print("  - " .. methods[j])
        end
        if #methods > 5 then
            print("  ... and " .. (#methods - 5) .. " more")
        end
    else
        print("No methods available")
    end
    
    print()
    if i < #peripherals then
        print("Press any key for next peripheral...")
        read()
    end
end

print("=== Usage Info ===")
print("To use a peripheral:")
print('local device = peripheral.wrap("peripheral_name")')
print('local data = device.getMethodName()')
print()
print("Common machine methods:")
print("- getEnergy() - Energy level")
print("- getState() - Machine state")
print("- getProgress() - Progress (0-1)")
print("- isActive() - Is working?")
print()
print("Press any key to exit...")
read()
