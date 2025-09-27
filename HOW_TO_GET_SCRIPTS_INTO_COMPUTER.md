# How to Get Scripts Into Your CC: Tweaked Computer

The issue you're experiencing (only first line pasting) is common with CC: Tweaked. Here are several methods to get your scripts into the computer:

## Method 1: Using the Edit Program (Recommended)

### Step 1: Create the file
1. Open your computer
2. Type: `edit explore_peripherals`
3. This opens the built-in text editor

### Step 2: Paste the content
1. **Copy the entire script** from your file (Ctrl+A, then Ctrl+C)
2. In the computer's edit program, **right-click and select "Paste"**
3. The entire script should paste at once
4. Press **Ctrl+S** to save
5. Press **Ctrl+W** to close the editor

### Step 3: Run the script
1. Type: `explore_peripherals`
2. Press Enter

## Method 2: Using the Pastebin Program

### Step 1: Upload to Pastebin
1. Go to https://pastebin.com
2. Paste your script content
3. Click "Create New Paste"
4. Copy the paste ID (the part after pastebin.com/)

### Step 2: Download in Computer
1. In your computer, type: `pastebin get [PASTE_ID] explore_peripherals`
2. Replace `[PASTE_ID]` with the actual ID from pastebin
3. Press Enter to download

### Step 3: Run the script
1. Type: `explore_peripherals`
2. Press Enter

## Method 3: Using Floppy Disks

### Step 1: Create Floppy Disk
1. Craft a floppy disk in Minecraft
2. Put it in a disk drive connected to your computer

### Step 2: Copy files to disk
1. In your computer, type: `copy explore_peripherals disk/`
2. Repeat for each script file

### Step 3: Use on another computer
1. Put the floppy disk in the target computer's disk drive
2. Type: `copy disk/explore_peripherals .`
3. Run the script

## Method 4: Manual Line-by-Line Entry

If pasting still doesn't work:

### Step 1: Use edit program
1. Type: `edit explore_peripherals`
2. This opens the text editor

### Step 2: Enter line by line
1. Manually type or paste each line one at a time
2. Press Enter after each line
3. Use Ctrl+S to save frequently

## Method 5: Using HTTP (Advanced)

If you have a web server:

### Step 1: Host the files
1. Put your .lua files on a web server
2. Make sure they're accessible via HTTP

### Step 2: Download in computer
1. Type: `wget [URL] explore_peripherals`
2. Replace `[URL]` with the full URL to your script

## Troubleshooting Pasting Issues

### If only first line pastes:
1. **Try the edit program method** (Method 1) - this usually works best
2. **Check your clipboard** - make sure you copied the entire file
3. **Try different paste methods**:
   - Right-click → Paste
   - Ctrl+V
   - Middle mouse button (if available)

### If edit program doesn't work:
1. **Check computer has enough memory** - some computers have limited RAM
2. **Try a different computer** - some CC: Tweaked versions have different behaviors
3. **Use pastebin method** - this is very reliable

### If scripts don't run:
1. **Check file extension** - make sure it's `.lua` or no extension
2. **Check syntax** - use `lua explore_peripherals` to run with error checking
3. **Check permissions** - make sure the file is executable

## Quick Setup Commands

Once you have the scripts in your computer, here's the order to run them:

```bash
# 1. First, discover what's connected
explore_peripherals

# 2. Then analyze a specific machine
discover_machine_methods

# 3. Finally, start monitoring
machine_monitor
```

## Pro Tips

1. **Always use the edit program** for multi-line scripts - it's the most reliable
2. **Save frequently** while editing (Ctrl+S)
3. **Test scripts in small pieces** if they're complex
4. **Use pastebin for sharing** scripts between computers
5. **Keep backups** of your working scripts on floppy disks

## File Management Commands

```bash
# List files
ls

# View file contents
cat filename

# Edit file
edit filename

# Delete file
rm filename

# Copy file
copy source destination

# Move file
mv source destination
```
