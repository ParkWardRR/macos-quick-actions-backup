# macOS Quick Actions Backup Script

A script for macOS that automates the backup of all Quick Actions to a zip file on the Desktop. It logs the process and generates a README with import instructions for another Mac. Designed for ease of use, it requires no user input to select actions, ensuring comprehensive backup and transferability of Quick Actions. Ideal for users looking to preserve their custom workflows effortlessly.

## Features

- **Automatic Backup**: Backs up all Quick Actions without user prompts.
- **Logging**: Creates a detailed log of the backup process.
- **Import Instructions**: Generates a README file with steps to import Quick Actions on another Mac.

## Requirements

- macOS operating system.
- `zip` command-line tool installed.

## Usage

1. **Download the Script**: Save the script as `macos-quick-actions-backup.sh`.
2. **Make it Executable**: Run `chmod +x macos-quick-actions-backup.sh` in the terminal.
3. **Execute the Script**: Run `./macos-quick-actions-backup.sh` in the terminal.
4. **Backup Location**: The backup zip file and log will be created on your Desktop.

## Importing Quick Actions

To import your backed-up Quick Actions to another Mac:

1. Open Automator on the destination Mac.
2. Select `File > Import...`.
3. Navigate to your backed-up Quick Actions zip file.
4. Select the zip file and confirm the import.
5. Your Quick Actions should now be available in Automator under Quick Action.

## License

This project is licensed under the BSD 2-Clause License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request or open an Issue for any features or bug fixes.
