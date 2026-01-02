#!/bin/bash
# Quick script to get SHA1 hash and show where to paste it

PACK_FILE="/workspaces/AvatarSMP/volumes/smp/polymer/resource_pack.zip"

if [ -f "$PACK_FILE" ]; then
    echo "✓ Resource pack found!"
    echo ""
    echo "SHA1 Hash:"
    echo "=========="
    sha1sum "$PACK_FILE" | awk '{print $1}'
    echo ""
    echo "Copy the hash above and paste it into server.properties:"
    echo "resource-pack-sha1=<PASTE_HASH_HERE>"
else
    echo "✗ Resource pack not found at:"
    echo "  $PACK_FILE"
    echo ""
    echo "Start your Minecraft server first to generate it!"
fi
