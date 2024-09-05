#!/bin/bash

# Set the source and destination directories
SOURCE_DIR="/Users/cde_linux_git_assignment-"  
DEST_DIR="json_and_CSV"

# Create the destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Move all CSV and JSON files from the source directory to the destination directory
mv "$SOURCE_DIR"/*.csv "$SOURCE_DIR"/*.json "$DEST_DIR/"

# Check if the move was successful
if [[ $? -eq 0 ]]; then
  echo "CSV and JSON files moved successfully to '$DEST_DIR'."
else
  echo "Error moving files."
fi 