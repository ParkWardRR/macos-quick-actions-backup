#!/bin/bash

# Quick Actions Backup Script
# This script backs up all macOS Quick Actions from the user's Library to a specified location on the Desktop.
# It checks for necessary tools, logs all operations, and provides import instructions in a README.
# 
# For usage:
# 1. Save this script as a .sh file.
# 2. Run it in the terminal.

# Ensure script is executed with proper permissions
if [ ! -x "$0" ]; then
  chmod +x "$0"
fi

# Check if running on macOS
if [[ "$(uname)" != "Darwin" ]]; then
  echo "This script is intended to run on macOS only."
  exit 1
fi

# Check if 'zip' command is available
if ! command -v zip &> /dev/null; then
  echo "'zip' command not found. Please install it to proceed."
  exit 1
fi

# Get current timestamp
timestamp=$(date '+%Y%m%d_%H%M%S_%3N')

# Define backup and log file names
backup_name="Quick_Actions_Backup_${timestamp}.zip"
log_name="Quick_Actions_Backup_${timestamp}.log"
desktop_path="$HOME/Desktop"

# Define directories
quick_actions_dir="$HOME/Library/Services"
backup_path="$desktop_path/$backup_name"
log_path="$desktop_path/$log_name"

# Create log file
echo "Backup Log - $(date)" > "$log_path"
echo "-----------------------------------" >> "$log_path"

# Check if Quick Actions directory exists
if [ ! -d "$quick_actions_dir" ]; then
  echo "Quick Actions directory not found." | tee -a "$log_path"
  exit 1
fi

# Function to perform backup of all Quick Actions
perform_backup() {
  echo "Backing up all Quick Actions..." | tee -a "$log_path"
  
  # Collect all Quick Actions for backup
  actions_to_backup=("$quick_actions_dir"/*)
  
  # Perform backup and log the outcome
  if zip -r "$backup_path" "${actions_to_backup[@]}" >> "$log_path" 2>&1; then
    echo "Backup successful: $backup_path" | tee -a "$log_path"
  else
    echo "Backup failed." | tee -a "$log_path"
    exit 1
  fi
}

# Function to create README file with import instructions
create_readme() {
  readme_content="# Quick Actions Backup Instructions

This guide will help you import your backed-up Quick Actions to another Mac.

## Importing Quick Actions
1. Open Automator on the destination Mac.
2. Select \`File > Import...\`
3. Navigate to the location of your backed-up Quick Actions zip file.
4. Select the zip file and confirm the import.
5. Your Quick Actions should now be available in the Automator app under Quick Action.

## Important Notes
- Ensure that the Quick Actions are compatible with your current macOS version.
- Check for any required permissions for the Quick Actions to function properly."

  readme_file="$desktop_path/Quick_Actions_Backup_${timestamp}.txt"
  echo "$readme_content" > "$readme_file"
  echo "README created: $readme_file" | tee -a "$log_path"
}

# Main script execution
perform_backup
create_readme

echo "Log file created: $log_path"
