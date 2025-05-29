#!/bin/bash

source logging.sh "OhMyZsh"

# Function to install Zsh if not installed
install_zsh() {
    if ! command -v zsh &> /dev/null; then
        echo "Zsh is not installed. Installing now..."
        brew install zsh
        echo "Zsh installation completed."
    else
        echo "Zsh is already installed."
    fi
}

# Function to set Zsh as the default shell
set_default_shell() {
    if [ "$SHELL" != "$(which zsh)" ]; then
        echo "Setting Zsh as the default shell..."
        chsh -s "$(which zsh)"
        echo "Zsh has been set as the default shell. Please log out and log back in for the change to take effect."
    else
        echo "Zsh is already the default shell."
    fi
}

# Function to install Oh My Zsh
install_oh_my_zsh() {
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Oh My Zsh is not installed. Installing now..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        echo "Oh My Zsh installation completed."
    else
        echo "Oh My Zsh is already installed. Updating now..."
        cd "$HOME/.oh-my-zsh" && git pull
        echo "Oh My Zsh update completed."
    fi
}

# Function to create a custom Oh My Zsh configuration script
create_oh_my_zsh_config() {
    echo "Creating custom Oh My Zsh configuration script..."
    cat << 'EOF' > "$HOME/ohmyzsh.sh"
# Custom Oh My Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"  # Change to your preferred theme
plugins=(git)             # Add your preferred plugins here
EOF
    echo "Custom Oh My Zsh configuration script created."
}

# Function to source the custom configuration in .zshrc
update_zshrc() {
    if ! grep -q "source $HOME/ohmyzsh.sh" "$HOME/.zshrc"; then
        echo "Sourcing custom Oh My Zsh configuration in .zshrc..."
        echo "source $HOME/ohmyzsh.sh" >> "$HOME/.zshrc"
        echo "Custom configuration sourced in .zshrc."
    else
        echo "Custom configuration is already sourced in .zshrc."
    fi
}

# Main script execution
install_zsh
set_default_shell
install_oh_my_zsh
create_oh_my_zsh_config
update_zshrc

echo "Installation and setup completed. Please log out and log back in to start using Zsh and Oh My Zsh."
