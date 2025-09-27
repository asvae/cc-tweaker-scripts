-- Explore Peripherals Script
-- This script helps you discover devices connected via wireless modems

print("=== Wireless Device Explorer ===")
print("Scanning for devices on network...")
sleep(1)

-- Check if we have a wireless modem
local modem = peripheral.find("modem")
if not modem then
    print("No wireless modem found!")
    print("Make sure you have a wireless modem attached to this computer.")
    print()
    print("Press any key to exit...")
    read()
    return
end

-- Open rednet on the modem
rednet.open("top")  -- or "bottom", "left", "right" depending on modem position

print("Wireless modem found!")
print("Scanning for devices...")
print("(This may take a few seconds)")
print()

-- Scan for devices by sending ping messages
local devices = {}
local channel = 0  -- Default channel

-- Send ping to common channels
for testChannel = 0, 10 do
    rednet.broadcast("ping", testChannel)
    sleep(0.1)
end

-- Listen for responses
local timeout = 3  -- seconds
local startTime = os.clock()

while os.clock() - startTime < timeout do
    local id, message, protocol = rednet.receive(0.1)
    if id and message == "pong" then
        -- Found a device
        local deviceInfo = {
            id = id,
            protocol = protocol or "unknown"
        }
        table.insert(devices, deviceInfo)
    end
end

-- Close rednet
rednet.close()

if #devices == 0 then
    print("No devices found on network!")
    print("Check:")
    print("1. Other devices have wireless modems")
    print("2. Right-click modems to connect")
    print("3. Same channel (default 0)")
    print("4. Devices are powered and working")
    print()
    print("Press any key to exit...")
    read()
    return
end

print("Found " .. #devices .. " device(s) on network")
print("Press any key to continue...")
read()

-- Show each device with pause
for i, device in ipairs(devices) do
    term.clear()
    print("=== Device " .. i .. "/" .. #devices .. " ===")
    print("ID: " .. device.id)
    print("Protocol: " .. device.protocol)
    
    -- Try to get more info about this device
    print("Attempting to connect...")
    
    -- Try to wrap as peripheral (this might work for some devices)
    local success, peripheral = pcall(function()
        return peripheral.wrap("modem")
    end)
    
    if success then
        print("Modem connection: OK")
    else
        print("Modem connection: Failed")
    end
    
    print()
    if i < #devices then
        print("Press any key for next device...")
        read()
    end
end

print("=== Network Info ===")
print("To connect to a device:")
print("1. Use rednet.send(device_id, message)")
print("2. Use rednet.receive() to get responses")
print("3. Check device documentation for commands")
print()
print("Press any key to exit...")
read()
