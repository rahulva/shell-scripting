#!/bin/bash

echo "Starting Mac Power User Setup..."

# Install Xcode Command Line Tools (if not installed)
xcode-select --install 2>/dev/null

# Install Homebrew
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew
brew update

# Essential CLI tools
brew install \
  git \
  zsh \
  zsh-autosuggestions \
  zsh-syntax-highlighting \
  fzf \
  bat \
  exa \
  ripgrep \
  fd \
  tldr \
  htop \
  tree \
  tmux \
  gh \
  wget \
  the_silver_searcher

# Fuzzy Finder setup
"$(brew --prefix)/opt/fzf/install" --key-bindings --completion --no-update-rc

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Set up plugins
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

# Set theme to Powerlevel10k
brew install romkatv/powerlevel10k/powerlevel10k
echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc

# Git config basics
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --global init.defaultBranch main

# Setup TLDR cache
tldr --update

# Custom aliases
cat <<EOL >> ~/.zshrc

# Custom Aliases
alias ll="exa -lah --git"
alias gs="git status"
alias ga="git add"
alias gc="git commit -v"
alias gl="git log --oneline --graph --decorate"
alias update="brew update && brew upgrade && brew cleanup"
EOL

echo "Setup complete! Restart your terminal and run 'p10k configure' to finalize Powerlevel10k."
