-- Discover Machine Methods Script
-- This script helps you explore what data you can get from a specific machine

print("=== Machine Method Discovery ===")
print("Enter machine name (e.g., 'lathe_0'):")
print("(Leave empty to list all peripherals)")
print()

local machineName = read()

if machineName == "" then
    print("Available peripherals:")
    -- Use the correct API - peripherals is the global
    for name, info in pairs(peripherals) do
        print("  " .. name .. " (" .. (info.type or "unknown") .. ")")
    end
    print()
    print("Using default: gtceu:ev_wiremill_0")
    machineName = "gtceu:ev_wiremill_0"
    sleep(1)
end

-- Check if peripheral exists
if not peripherals[machineName] then
    print("Error: '" .. machineName .. "' not found!")
    print("Check:")
    print("1. Wired modems connected")
    print("2. Right-click modems to connect")
    print("3. Correct peripheral name")
    print()
    print("Press any key to exit...")
    read()
    return
end

print("Analyzing: " .. machineName)
print("Type: " .. (peripherals[machineName].type or "unknown"))
print("Press any key to continue...")
read()

-- Get all available methods
local methods = peripherals[machineName].methods or {}

if not methods or #methods == 0 then
    print("No methods available.")
    print("Press any key to exit...")
    read()
    return
end

print("Found " .. #methods .. " methods")
print("Press any key to see methods...")
read()

-- Show all methods first
term.clear()
print("=== All Methods ===")
for i, method in ipairs(methods) do
    print("  - " .. method)
    sleep(0.1)  -- Small delay to see each method appear
end
print()
print("Press any key to see categorized methods...")
read()

-- Categorize methods
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

-- Show category counts
term.clear()
print("=== Method Categories ===")
print("Categorizing methods...")
sleep(0.5)
print("Energy methods: " .. #energyMethods)
sleep(0.2)
print("State methods: " .. #stateMethods)
sleep(0.2)
print("Item methods: " .. #itemMethods)
sleep(0.2)
print("Progress methods: " .. #progressMethods)
sleep(0.2)
print("Other methods: " .. #otherMethods)
print()
print("Press any key to see categories...")
read()

-- Show each category with pause
if #energyMethods > 0 then
    term.clear()
    print("=== Energy Methods ===")
    print("Showing energy methods...")
    sleep(0.3)
    for i, method in ipairs(energyMethods) do
        print("  - " .. method)
        sleep(0.1)
    end
    print()
    print("Press any key for next category...")
    read()
end

if #stateMethods > 0 then
    term.clear()
    print("=== State Methods ===")
    print("Showing state methods...")
    sleep(0.3)
    for i, method in ipairs(stateMethods) do
        print("  - " .. method)
        sleep(0.1)
    end
    print()
    print("Press any key for next category...")
    read()
end

if #itemMethods > 0 then
    term.clear()
    print("=== Item Methods ===")
    print("Showing item methods...")
    sleep(0.3)
    for i, method in ipairs(itemMethods) do
        print("  - " .. method)
        sleep(0.1)
    end
    print()
    print("Press any key for next category...")
    read()
end

if #progressMethods > 0 then
    term.clear()
    print("=== Progress Methods ===")
    print("Showing progress methods...")
    sleep(0.3)
    for i, method in ipairs(progressMethods) do
        print("  - " .. method)
        sleep(0.1)
    end
    print()
    print("Press any key for next category...")
    read()
end

if #otherMethods > 0 then
    term.clear()
    print("=== Other Methods ===")
    print("Showing other methods...")
    sleep(0.3)
    for i, method in ipairs(otherMethods) do
        print("  - " .. method)
        sleep(0.1)
    end
    print()
    print("Press any key to test methods...")
    read()
end

-- Test methods
term.clear()
print("=== Testing Methods ===")
print("Connecting to machine...")
sleep(0.5)
print("Testing common methods...")
sleep(0.3)
print()

local machine = peripherals[machineName]
local tested = 0

-- Test energy methods
if #energyMethods > 0 then
    print("Testing energy methods...")
    sleep(0.3)
end
for _, method in ipairs(energyMethods) do
    print("Testing " .. method .. "...")
    sleep(0.2)
    local success, result = pcall(function() return machine[method]() end)
    if success then
        print("✅ " .. method .. " = " .. tostring(result))
    else
        print("❌ " .. method .. " failed")
    end
    sleep(0.3)
    tested = tested + 1
    if tested % 3 == 0 then
        print("Press any key to continue...")
        read()
        term.clear()
        print("=== Testing Methods ===")
    end
end

-- Test state methods
if #stateMethods > 0 then
    print("Testing state methods...")
    sleep(0.3)
end
for _, method in ipairs(stateMethods) do
    print("Testing " .. method .. "...")
    sleep(0.2)
    local success, result = pcall(function() return machine[method]() end)
    if success then
        print("✅ " .. method .. " = " .. tostring(result))
    else
        print("❌ " .. method .. " failed")
    end
    sleep(0.3)
    tested = tested + 1
    if tested % 3 == 0 then
        print("Press any key to continue...")
        read()
        term.clear()
        print("=== Testing Methods ===")
    end
end

-- Test progress methods
if #progressMethods > 0 then
    print("Testing progress methods...")
    sleep(0.3)
end
for _, method in ipairs(progressMethods) do
    print("Testing " .. method .. "...")
    sleep(0.2)
    local success, result = pcall(function() return machine[method]() end)
    if success then
        print("✅ " .. method .. " = " .. tostring(result))
    else
        print("❌ " .. method .. " failed")
    end
    sleep(0.3)
    tested = tested + 1
    if tested % 3 == 0 then
        print("Press any key to continue...")
        read()
        term.clear()
        print("=== Testing Methods ===")
    end
end

print()
print("=== Usage Example ===")
print('local machine = peripherals["' .. machineName .. '"]')
print('local energy = machine.getEnergy()')
print('local state = machine.getState()')
print()
print("Press any key to exit...")
read()
