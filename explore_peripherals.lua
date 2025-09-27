-- Explore Peripherals Script
-- This script helps you discover what peripherals are connected to your computer

print("=== Peripheral Explorer ===")
print("Discovering peripherals...")
sleep(1)

-- Get all connected peripherals
local peripherals = peripheral.getNames()

if #peripherals == 0 then
    print("No peripherals found!")
    print("Check:")
    print("1. Wireless modems connected")
    print("2. Right-click modems to connect")
    print("3. Same channel (default 0)")
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

print("Press any key to exit...")
read()
