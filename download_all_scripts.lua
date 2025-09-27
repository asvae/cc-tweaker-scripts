-- Download All Scripts Script
-- This script downloads all the monitoring scripts from GitHub
-- Run this once to get all scripts into your computer

print("=== CC: Tweaked Script Downloader ===")
print("This will download all monitoring scripts from GitHub")
print()

-- Configuration - UPDATE THESE URLs WITH YOUR GITHUB REPOSITORY
local GITHUB_USERNAME = "YOUR_USERNAME"  -- Replace with your GitHub username
local REPO_NAME = "cc-tweaked-scripts"   -- Replace with your repository name
local BRANCH = "main"                    -- Usually "main" or "master"

-- Script files to download
local scripts = {
    "explore_peripherals.lua",
    "discover_machine_methods.lua", 
    "machine_monitor.lua"
}

-- Build base URL
local baseUrl = "https://raw.githubusercontent.com/" .. GITHUB_USERNAME .. "/" .. REPO_NAME .. "/" .. BRANCH .. "/"

print("Repository: " .. GITHUB_USERNAME .. "/" .. REPO_NAME)
print("Branch: " .. BRANCH)
print("Base URL: " .. baseUrl)
print()

-- Check if we need to update configuration
if GITHUB_USERNAME == "YOUR_USERNAME" then
    print("⚠️  CONFIGURATION NEEDED!")
    print("Please edit this script and update:")
    print("1. GITHUB_USERNAME = 'your_actual_username'")
    print("2. REPO_NAME = 'your_repository_name'")
    print("3. BRANCH = 'main' or 'master'")
    print()
    print("Then run this script again.")
    return
end

-- Download each script
print("Downloading scripts...")
print()

local successCount = 0
local totalCount = #scripts

for i, scriptName in ipairs(scripts) do
    local url = baseUrl .. scriptName
    print("[" .. i .. "/" .. totalCount .. "] Downloading " .. scriptName .. "...")
    
    -- Use wget to download the script
    local success = os.execute("wget " .. url .. " " .. scriptName)
    
    if success then
        print("✅ Successfully downloaded " .. scriptName)
        successCount = successCount + 1
    else
        print("❌ Failed to download " .. scriptName)
        print("   URL: " .. url)
    end
    print()
end

-- Summary
print("=== Download Summary ===")
print("Successfully downloaded: " .. successCount .. "/" .. totalCount .. " scripts")

if successCount == totalCount then
    print("🎉 All scripts downloaded successfully!")
    print()
    print("Next steps:")
    print("1. Run: explore_peripherals")
    print("2. Run: discover_machine_methods")
    print("3. Run: machine_monitor")
else
    print("⚠️  Some downloads failed. Check the URLs and try again.")
    print()
    print("Manual download commands:")
    for _, scriptName in ipairs(scripts) do
        print("wget " .. baseUrl .. scriptName .. " " .. scriptName)
    end
end
