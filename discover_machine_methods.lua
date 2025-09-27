-- Discover Machine Methods Script
-- This script helps you explore what data you can get from a specific machine
-- Run this after you've identified your machine peripheral name

print("=== Machine Method Discovery ===")
print("Enter the name of your machine peripheral (e.g., 'lathe_0'):")
print("(Leave empty to list all peripherals first)")
print()

local machineName = read()

if machineName == "" then
    print("Listing all peripherals:")
    local peripherals = peripheral.getNames()
    for i, name in ipairs(peripherals) do
        print("  " .. name .. " (" .. (peripheral.getType(name) or "unknown") .. ")")
    end
    print()
    print("Please run this script again and enter a machine name.")
    return
end

-- Check if peripheral exists
if not peripheral.isPresent(machineName) then
    print("Error: Peripheral '" .. machineName .. "' not found!")
    print("Make sure:")
    print("1. The machine has a wireless modem attached")
    print("2. Your computer has a wireless modem")
    print("3. Both modems are on the same channel (default 0)")
    print("4. Right-clicked on modems to connect them")
    print("5. The peripheral name is correct")
    return
end

print("Analyzing peripheral: " .. machineName)
print("Type: " .. (peripheral.getType(machineName) or "unknown"))
print()

-- Get all available methods
local methods = peripheral.getMethods(machineName)

if not methods or #methods == 0 then
    print("No methods available on this peripheral.")
    return
end

print("Available methods (" .. #methods .. "):")
print()

-- Categorize methods by likely purpose
local energyMethods = {}
local stateMethods = {}
local itemMethods = {}
local progressMethods = {}
local otherMethods = {}

for _, method in ipairs(methods) do
    local lowerMethod = string.lower(method)
    
    if string.find(lowerMethod, "energy") or string.find(lowerMethod, "power") then
        table.insert(energyMethods, method)
    elseif string.find(lowerMethod, "state") or string.find(lowerMethod, "status") or string.find(lowerMethod, "active") then
        table.insert(stateMethods, method)
    elseif string.find(lowerMethod, "item") or string.find(lowerMethod, "slot") or string.find(lowerMethod, "inventory") then
        table.insert(itemMethods, method)
    elseif string.find(lowerMethod, "progress") or string.find(lowerMethod, "recipe") or string.find(lowerMethod, "speed") then
        table.insert(progressMethods, method)
    else
        table.insert(otherMethods, method)
    end
end

-- Display categorized methods
if #energyMethods > 0 then
    print("🔋 Energy/Power Methods:")
    for _, method in ipairs(energyMethods) do
        print("  - " .. method)
    end
    print()
end

if #stateMethods > 0 then
    print("📊 State/Status Methods:")
    for _, method in ipairs(stateMethods) do
        print("  - " .. method)
    end
    print()
end

if #itemMethods > 0 then
    print("📦 Item/Inventory Methods:")
    for _, method in ipairs(itemMethods) do
        print("  - " .. method)
    end
    print()
end

if #progressMethods > 0 then
    print("⚙️ Progress/Recipe Methods:")
    for _, method in ipairs(progressMethods) do
        print("  - " .. method)
    end
    print()
end

if #otherMethods > 0 then
    print("🔧 Other Methods:")
    for _, method in ipairs(otherMethods) do
        print("  - " .. method)
    end
    print()
end

-- Try to call some common methods to see what data they return
print("=== Testing Common Methods ===")
local machine = peripheral.wrap(machineName)

-- Test energy methods
for _, method in ipairs(energyMethods) do
    local success, result = pcall(function() return machine[method]() end)
    if success then
        print("✅ " .. method .. "() = " .. tostring(result))
    else
        print("❌ " .. method .. "() failed: " .. tostring(result))
    end
end

-- Test state methods
for _, method in ipairs(stateMethods) do
    local success, result = pcall(function() return machine[method]() end)
    if success then
        print("✅ " .. method .. "() = " .. tostring(result))
    else
        print("❌ " .. method .. "() failed: " .. tostring(result))
    end
end

-- Test progress methods
for _, method in ipairs(progressMethods) do
    local success, result = pcall(function() return machine[method]() end)
    if success then
        print("✅ " .. method .. "() = " .. tostring(result))
    else
        print("❌ " .. method .. "() failed: " .. tostring(result))
    end
end

print()
print("=== Usage Example ===")
print("Now you can use these methods in your monitoring script:")
print('local machine = peripheral.wrap("' .. machineName .. '")')
print('local energy = machine.getEnergy() -- if available')
print('local state = machine.getState() -- if available')
print('local progress = machine.getProgress() -- if available')
