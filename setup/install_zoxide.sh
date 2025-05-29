#!/bin/bash
# zoxide is a smarter cd command
# https://github.com/ajeetdsouza/zoxide

brew install zoxide

# Add this to the end of your config file (usually ~/.zshrc):
eval "$(zoxide init zsh)"
# For completions to work, the above line must be added after compinit is called. 
# You may have to rebuild your completions cache by running rm ~/.zcompdump*; compinit.

######
#!/bin/bash

# Install zoxide
if command -v zoxide &> /dev/null; then
    echo "zoxide is already installed."
else
    echo "Installing zoxide..."
    # For Debian/Ubuntu-based systems
    # sudo apt install zoxide -y

    # For Arch-based systems
    # sudo pacman -S zoxide

    # For macOS (using Homebrew)
    brew install zoxide
fi

# Create the dotfiles directory if it doesn't exist
mkdir -p ~/dotfiles

# Create the zoxide_setup.sh script
cat << 'EOF' > ~/dotfiles/zoxide_setup.sh
# zoxide setup script
eval "$(zoxide init zsh)"
EOF

# Make the script executable
chmod +x ~/dotfiles/zoxide_setup.sh

# Add sourcing line to .zshrc if not already present
if ! grep -q "source ~/dotfiles/zoxide_setup.sh" ~/.zshrc; then
    echo "source ~/dotfiles/zoxide_setup.sh" >> ~/.zshrc
    echo "Added sourcing line to .zshrc."
else
    echo "Sourcing line already exists in .zshrc."
fi

echo "Installation and setup complete. Please restart your terminal or run 'source ~/.zshrc' to apply changes."
