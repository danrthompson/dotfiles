#!/bin/zsh

# Setup script for Hammerspoon

# Function to install Hammerspoon using Homebrew
install_hammerspoon() {
    if ! brew list --cask hammerspoon &>/dev/null; then
        echo "Installing Hammerspoon..."
        brew install --cask hammerspoon
    else
        echo "Hammerspoon is already installed."
    fi
}

# Function to backup init.lua if needed
backup_init() {
    local current_file="$1"
    local backup_dir="$2"
    local backup_file="${backup_dir}/old_init_$(date +%Y%m%d_%H%M%S).lua"

    if [ -f "$current_file" ] && [ ! -L "$current_file" ]; then
        if [ ! -d "$backup_dir" ]; then
            echo "Creating backup directory $backup_dir..."
            mkdir -p "$backup_dir"
        fi

        echo "Backing up existing init.lua to $(basename "$backup_file")..."
        cp "$current_file" "$backup_file"
    fi
}

# Function to symlink init.lua
symlink_init() {
    CONFIG_DIR="$HOME/.hammerspoon"
    INIT_FILE="$CONFIG_DIR/init.lua"
    DOTFILES_DIR="/Users/danthompson/Code/dotfiles"
    DOTFILES_INIT_FILE="$DOTFILES_DIR/hammerspoon/init.lua"
    BACKUP_DIR="$DOTFILES_DIR/hammerspoon/old_inits"

    # Create the .hammerspoon directory if it doesn't exist
    if [ ! -d "$CONFIG_DIR" ]; then
        echo "Creating directory $CONFIG_DIR..."
        mkdir -p "$CONFIG_DIR"
    fi

    # Check if the symlink already exists and points to the correct file
    if [ -L "$INIT_FILE" ] && [ "$(readlink "$INIT_FILE")" = "$DOTFILES_INIT_FILE" ]; then
        echo "Symlink for init.lua already exists and is correct. Skipping setup."
        return
    fi

    # Backup existing init.lua if needed
    backup_init "$INIT_FILE" "$BACKUP_DIR"

    # Create the symlink
    echo "Creating symlink for init.lua..."
    ln -sf "$DOTFILES_INIT_FILE" "$INIT_FILE"
}

# Main execution
install_hammerspoon
symlink_init

echo "Hammerspoon setup completed."
