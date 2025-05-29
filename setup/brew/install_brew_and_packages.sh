#!/bin/bash

# Source the logging functions
source ../logging.sh "Homebrew"

# Function to install Homebrew if not installed
install_brew() {
    if ! command -v brew &> /dev/null; then
        log "Homebrew is not installed. Installing now..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" | tee -a "$LOG_FILE" 2>&1
        log "Homebrew installation completed."
    else
        log "Homebrew is already installed. Updating now..."
        brew update >> "$LOG_FILE" 2>&1 | tee -a "$LOG_FILE" 2>&1
        log "Homebrew update completed."
    fi
}

# Install Homebrew
install_brew

# Install packages from Brewfile
log "Installing packages from Brewfile..."
brew bundle --file=Brewfile | tee -a "$LOG_FILE" 2>&1
log "Packages installation completed."

log "All operations completed."
