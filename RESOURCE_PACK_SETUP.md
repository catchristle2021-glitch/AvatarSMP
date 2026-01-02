# Resource Pack Setup Guide

## The Problem
Custom items from server-side mods show as missing textures (purple/black checkerboard) for vanilla clients.

## The Solution
Force clients to download a resource pack. No need for a separate Python server!

## Steps to Fix

### 1. Generate the Resource Pack
Start your Minecraft server once. Polymer will automatically generate `polymer/resource_pack.zip` in your server folder.

### 2. Host the Resource Pack (Choose ONE method)

#### Option A: GitHub Releases (Recommended - FREE)
1. Run the server to generate `/workspaces/AvatarSMP/volumes/smp/polymer/resource_pack.zip`
2. Go to your GitHub repository
3. Click "Releases" > "Create a new release"
4. Upload `resource_pack.zip` as a release asset
5. Right-click the uploaded file and copy the download URL
6. The URL will look like: `https://github.com/catchristle2021-glitch/AvatarSMP/releases/download/v1.0/resource_pack.zip`

#### Option B: Dropbox
1. Upload `resource_pack.zip` to Dropbox
2. Get the share link
3. Change `?dl=0` to `?dl=1` at the end of the URL

#### Option C: Google Drive  
1. Upload to Google Drive
2. Right-click > Get link > Make sure "Anyone with the link" can view
3. Use format: `https://drive.google.com/uc?export=download&id=FILE_ID`

### 3. Get SHA1 Hash
Run this command in your server directory:

**Linux/Mac:**
```bash
./get-pack-hash.sh
```

**Windows:**
```batch
get-pack-hash.bat
```

Copy the hash value (40 character string).

### 4. Update server.properties
Replace these lines with your URL and hash:
```properties
require-resource-pack=true
resource-pack=YOUR_URL_HERE
resource-pack-sha1=YOUR_SHA1_HASH_HERE
resource-pack-prompt=Custom items require this resource pack!
```

### 5. Restart the Server
Players will now be forced to download the resource pack when they join!

---

## Automatic Updates

### Manual Method
Whenever you add/remove mods with custom items:
1. Delete `polymer/resource_pack.zip`
2. Restart server (generates new pack)
3. Upload new pack to same location
4. Update SHA1 hash in server.properties
5. Restart server again

### Automated Method (GitHub Actions)
1. Run your server to generate updated `polymer/resource_pack.zip`
2. Commit and push the new pack to your repository
3. Go to GitHub → Actions → "Update Resource Pack"
4. Click "Run workflow"
5. Enter a version tag (e.g., v1.1)
6. The action will:
   - Create a GitHub release
   - Upload the resource pack
   - Calculate SHA1 hash
   - Update server.properties automatically
   - Commit the changes back

Just pull the changes and restart your server!

---

## Current Configuration

✅ Polymer is already configured to generate resource packs
✅ Polymer will mark the pack as required  
✅ Server will reject players who decline the pack

Just host it and update server.properties!
