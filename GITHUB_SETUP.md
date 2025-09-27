# GitHub Setup for CC: Tweaked Scripts

## Quick Setup Instructions

### 1. Create GitHub Repository
1. Go to [GitHub.com](https://github.com) and sign in
2. Click the "+" button → "New repository"
3. Name it something like `cc-tweaked-scripts` or `minecraft-monitor-scripts`
4. Make it **Public** (so wget can access it)
5. Don't initialize with README (we already have files)
6. Click "Create repository"

### 2. Upload Your Scripts
1. **Drag and drop** all the `.lua` files into the GitHub web interface:
   - `explore_peripherals.lua`
   - `discover_machine_methods.lua`
   - `machine_monitor.lua`
2. **Commit** the files with a message like "Initial script upload"
3. **Copy the repository URL** (e.g., `https://github.com/yourusername/cc-tweaked-scripts`)

### 3. Download Scripts in Computer
Once uploaded, you can download each script directly in your CC: Tweaked computer:

```bash
# Download each script (replace YOUR_USERNAME and REPO_NAME)
wget https://raw.githubusercontent.com/YOUR_USERNAME/REPO_NAME/main/explore_peripherals.lua
wget https://raw.githubusercontent.com/YOUR_USERNAME/REPO_NAME/main/discover_machine_methods.lua
wget https://raw.githubusercontent.com/YOUR_USERNAME/REPO_NAME/main/machine_monitor.lua
```

## Example Commands

If your repository is at `https://github.com/yourusername/cc-tweaked-scripts`, use:

```bash
wget https://raw.githubusercontent.com/yourusername/cc-tweaked-scripts/main/explore_peripherals.lua
wget https://raw.githubusercontent.com/yourusername/cc-tweaked-scripts/main/discover_machine_methods.lua
wget https://raw.githubusercontent.com/yourusername/cc-tweaked-scripts/main/machine_monitor.lua
```

## Quick Test

After downloading, test that it works:

```bash
# List files to verify they downloaded
ls

# Run the first script
explore_peripherals
```

## Benefits of GitHub Method

✅ **No pasting issues** - wget downloads complete files
✅ **Version control** - you can update scripts and re-download
✅ **Sharing** - easy to share with others
✅ **Backup** - scripts are safely stored online
✅ **Multiple computers** - download to any computer easily

## Alternative: Use My Repository

If you want to use my repository (I can create one), you can download directly:

```bash
# These URLs will work once I create the repository
wget https://raw.githubusercontent.com/[MY_USERNAME]/cc-tweaked-scripts/main/explore_peripherals.lua
wget https://raw.githubusercontent.com/[MY_USERNAME]/cc-tweaked-scripts/main/discover_machine_methods.lua
wget https://raw.githubusercontent.com/[MY_USERNAME]/cc-tweaked-scripts/main/machine_monitor.lua
```

## Troubleshooting

### If wget fails:
1. **Check internet connection** - CC: Tweaked needs internet access
2. **Verify URL** - make sure the raw URL is correct
3. **Check repository is public** - private repos won't work with wget
4. **Try different branch** - some repos use `master` instead of `main`

### If scripts don't run:
1. **Check file permissions** - files should be executable
2. **Verify file extension** - should be `.lua` or no extension
3. **Test with lua command** - `lua explore_peripherals` for error checking

## Pro Tips

1. **Create a startup script** to download all scripts automatically
2. **Use version tags** for stable releases
3. **Keep documentation** in the repository README
4. **Test on multiple computers** to ensure compatibility
