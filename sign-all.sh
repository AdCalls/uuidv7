#!/bin/bash
# Script to sign all JAR artifacts with GPG

SCRIPT_DIR="$(dirname "$0")"
BUNDLE_DIR="$SCRIPT_DIR/bundle"

if [ ! -d "$BUNDLE_DIR" ]; then
    echo "Error: bundle/ directory not found"
    exit 1
fi

cd "$BUNDLE_DIR"

# Find all .jar files
jar_files=(*.jar)

if [ ! -e "${jar_files[0]}" ]; then
    echo "Error: No .jar files found in bundle/"
    exit 1
fi

echo "Signing all JAR artifacts with GPG..."
echo "You will be prompted for your GPG passphrase for each file."
echo ""

# Sign each JAR file
for file in "${jar_files[@]}"; do
    echo "Signing $file..."
    gpg --armor --detach-sign "$file"
    if [ $? -eq 0 ]; then
        echo "✓ $file.asc created"
    else
        echo "✗ Failed to sign $file"
        exit 1
    fi
done

echo ""
echo "All JAR files signed successfully!"
echo "Bundle contents:"
ls -lh

echo ""
echo "Ready to create zip archive."
