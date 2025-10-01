#!/bin/bash

# colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# funcs for logging
log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}


# check and install ohmyzsh
check_and_install_ohmyzsh() {
    if [ -d "$HOME/.oh-my-zsh" ] && grep -q 'oh-my-zsh.sh' "$HOME/.zshrc" 2>/dev/null; then
        log_info "Oh My Zsh is already installed"
    else
        log_info "Oh My Zsh not found, installing..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        log_info "Oh My Zsh installed successfully"
    fi
}

# check and install homebrew
check_and_install_homebrew() {
  if command -v brew >/dev/null 2>&1; then
      log_info "Homebrew is already installed"
      # update Homebrew
      log_info "Updating Homebrew..."
      brew update
  else
      log_info "Homebrew not found, installing..."
      
      # install Homebrew
      log_info "Installing Homebrew..."
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      
      if [[ $(uname -m) == "arm64" ]]; then
            # Apple Silicon Mac
            eval "$(/opt/homebrew/bin/brew shellenv)"
        else
            # Intel Mac
            eval "$(/usr/local/bin/brew shellenv)"
        fi

      log_info "Homebrew installed successfully"
  fi
}

copy_oh_my_zsh_config(){
  if [ -d "$HOME/dotfiles" ]; then
    # backup and clean old .zshrc
    [ -e "$HOME/.zshrc" ] && cp "$HOME/.zshrc" "$HOME/.zshrc_backup"  && rm "$HOME/.zshrc"
    log_info ".zshrc was renamed to .zshrc_backup"

    if [ "$1" = "1" ]; then
        ln -sf "$HOME/dotfiles/oh-my-zsh/.zshrc" "$HOME/.zshrc"
        log_info "Make symlink .zshrc"
    else
        cp "$HOME/dotfiles/oh-my-zsh/.zshrc" "$HOME/.zshrc"
        log_info "Copy .zshrc"
    fi
  else
      log_error "Folder dotfiles not found"
      exit 1
  fi
}

restore_homebrew() {
  local brewfile_path="$HOME/dotfiles/homebrew/Brewfile"

  if [ -f "$brewfile_path" ]; then
      log_info "Starting brew bundle --file=$brewfile_path"
      brew bundle --file="$brewfile_path"
  fi
}


copy_vscode_config(){
  DIR="$2"
  
  if [ -d "$HOME/dotfiles" ]; then
    # backup and clean old vscode configs
    [ -e "$DIR/settings.json" ] && cp "$DIR/settings.json" "$DIR/settings_backup.json"  && rm "$DIR/settings.json"
    log_info "settings.json was renamed to settings_backup.json"
    [ -e "$DIR/keybindings.json" ] && cp "$DIR/keybindings.json" "$DIR/keybindings_backup.json"  && rm "$DIR/keybindings.json"
    log_info "keybindings.json was renamed to keybindings_backup.json"

    if [ "$1" = "1" ]; then
        ln -sf "$HOME/dotfiles/vscode/settings.json" "$DIR/settings.json"
        ln -sf "$HOME/dotfiles/vscode/keybindings.json" "$DIR/keybindings.json"
        log_info "Make symlink settings.json and keybindings.json"
    else
        cp "$HOME/dotfiles/vscode/settings.json" "$DIR/settings.json"
        ln "$HOME/dotfiles/vscode/keybindings.json" "$DIR/keybindings.json"
        log_info "Copy settings.json and keybindings.json"
    fi
  else
      log_error "Folder dotfiles not found"
      exit 1
  fi
}

copy_vscode_config(){
    log_info "Don't remember import rectangle settings"
}

macos() {
  
  # check and install homebrew
  check_and_install_homebrew
    
  # check and install ohmyzsh
  check_and_install_ohmyzsh

  # copy ohmyzsh config
  copy_oh_my_zsh_config "$1"

  # restore homebrew
  restore_homebrew

  # copy configs for vscode
  copy_vscode_config "$1" "$HOME/Library/Application Support/Code/User"

  copy_rectangle_config
}


main() {
    log_info "Starting macOS development environment setup..."
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
      macos "$1"
      return 0
    else
        log_error "Unsupported OS: $OSTYPE"
        log_error "This script is designed specifically for macOS"
        exit 1
    fi
    
    log_info "Setup completed successfully!"
    log_info "You may need to restart your terminal to see all changes"
}

main "$@"
