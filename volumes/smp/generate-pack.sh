#!/bin/bash
# Generate Polymer Resource Pack

echo "════════════════════════════════════════════════════════"
echo "Polymer Resource Pack Generator"
echo "════════════════════════════════════════════════════════"
echo ""

PACK_DIR="polymer"
PACK_FILE="$PACK_DIR/resource_pack.zip"

# Create polymer directory if it doesn't exist
mkdir -p "$PACK_DIR"

echo "Creating minimal resource pack to trigger Polymer generation..."
echo ""

# Create a temporary directory for pack contents
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Create pack.mcmeta
cat > pack.mcmeta << 'EOF'
{
  "pack": {
    "pack_format": 48,
    "description": "Polymer Auto-Generated Resource Pack"
  }
}
EOF

# Create the zip
zip -q resource_pack.zip pack.mcmeta

# Move to destination
mv resource_pack.zip "/workspaces/AvatarSMP/volumes/smp/$PACK_FILE"
cd - > /dev/null
rm -rf "$TEMP_DIR"

echo "✓ Created starter pack at $PACK_FILE"
echo ""
echo "Next steps:"
echo "1. Start your Minecraft server"
echo "2. Join with a player (vanilla client)"
echo "3. Polymer will regenerate the pack with custom items"
echo "4. Run ./get-pack-hash.sh to get the SHA1"
echo ""
echo "════════════════════════════════════════════════════════"
