#!/bin/bash

# Directory to scan
TARGET_DIR="/etc"

# Check if directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: $TARGET_DIR does not exist."
    exit 1
fi

# Count files (excluding directories and symbolic links)
# -type f matches regular files
# -maxdepth 1 if we only want files directly in /etc, but usually "in /etc" implies recursion or at least the contents. 
# The prompt says "in /etc directory", which usually means the directory itself. I'll stick to -maxdepth 1 unless specified.
# However, "amount of files" often implies recursive. Let's assume non-recursive for simplicity unless it's a standard "count files in dir" task. 
# Wait, let's make it slightly more robust.

echo "Counting files in $TARGET_DIR (excluding directories and links)..."

FILE_COUNT=$(find "$TARGET_DIR" -maxdepth 1 -type f | wc -l)

echo "Total number of regular files in $TARGET_DIR: $FILE_COUNT"
