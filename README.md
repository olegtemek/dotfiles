# Development Environment Setup Script

**Currently supports macOS only**

This script automates the setup of a development environment on macOS, including installation and configuration of:
- Homebrew
- Zsh shell
- Oh My Zsh
- Development tools from Brewfile

## Prerequisites

- macOS operating system
- Git (usually pre-installed on macOS)

## Installation

1. Clone the dotfiles repository to your home directory:
```
git clone https://github.com/olegtemek/dotfiles.git "$HOME/dotfiles"
```
2. Run the setup script:
```
"$HOME/dotfiles/startup_script.sh"
```

## Usage Options

### Basic Installation (Copy Configuration)
```
"$HOME/dotfiles/startup_script.sh"
```
This will copy configuration files.

### Symlink Installation
```
"$HOME/dotfiles/startup_script.sh" 1
```
This will create symbolic links to configuration files instead of copying them. Useful for keeping configurations in sync with the repository.

## What This Script Does

- Verifies macOS compatibility
- Installs Homebrew (if not present)
- Installs and configures Zsh shell
- Installs Oh My Zsh framework
- Restores applications and tools from `homebrew/Brewfile`
- Configures shell environment (copy or symlink based on argument)


## Notes

- The script will prompt for administrator password when installing system components
- Restart your terminal after installation to see all changes
- If using symlink option (argument `1`), changes to dotfiles repository will immediately affect your environment
