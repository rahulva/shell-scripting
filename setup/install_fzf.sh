#!/bin/bash

# Install fzf
if command -v fzf &> /dev/null; then
    echo "fzf is already installed."
else
    echo "Installing fzf..."
    # For Debian/Ubuntu-based systems
    # sudo apt install fzf -y

    # For Arch-based systems
    # sudo pacman -S fzf

    # For macOS (using Homebrew)
    brew install fzf

    # If you want to install from the GitHub repository
    # git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    # ~/.fzf/install
fi

# Create the dotfiles directory if it doesn't exist
mkdir -p ~/dotfiles

# Create the fzf_setup.sh script
cat << 'EOF' > ~/dotfiles/fzf_setup.sh
# fzf setup script
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
EOF

# Add sourcing line to .zshrc if not already present
if ! grep -q "source ~/dotfiles/fzf_setup.sh" ~/.zshrc; then
    echo "source ~/dotfiles/fzf_setup.sh" >> ~/.zshrc
    echo "Added sourcing line to .zshrc."
else
    echo "Sourcing line already exists in .zshrc."
fi

echo "Installation and setup complete. Please restart your terminal or run 'source ~/.zshrc' to apply changes."