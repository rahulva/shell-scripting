#!/bin/bash

# Create a function to move files with the same type into type-named folders
organize_files_by_type() {
  # Iterate over all files in the current directory
  for file in *; do
    # Skip if it's a directory
    [ -d "$file" ] && continue

    # Get the file's extension
    ext="${file##*.}"

    # Create a folder for the file type if it doesn't exist
    [ ! -d "$ext" ] && mkdir "$ext"

    # Move the file into the type folder
    mv "$file" "$ext/"
  done
}

# Execute the function
organize_files_by_type

echo "Files have been organized by file type into respective folders."

