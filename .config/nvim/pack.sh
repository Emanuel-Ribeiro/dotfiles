#!/bin/bash

# Primeagen-inspired Ubuntu Development Setup Script

# Exit on any error
set -e

# Update package lists
sudo apt update && sudo apt upgrade -y

# Install required dependencies for adding repositories
sudo apt install -y \
    apt-transport-https \
    curl \
    git \
    zsh \
    software-properties-common \
    ca-certificates

# Add Brave Browser repository
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# Add Postman repository
wget -O- https://dl.postman.com/dl/linux/rpm-gpg-key | sudo gpg --dearmor -o /usr/share/keyrings/postman-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/postman-archive-keyring.gpg] https://dl.postman.com/dl/linux/deb stable main" | sudo tee /etc/apt/sources.list.d/postman.list

# Install core development tools and window manager
sudo apt update
sudo apt install -y \
    build-essential \
    wget \
    ripgrep \
    fd-find \
    fzf \
    python3 \
    python3-pip \
    tmux \
    stow \
    brave-browser \
    maim \
    xclip \
    i3 \
    i3status \
    i3lock \
    rofi \
    picom \
    feh \
    nitrogen \
    postman

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Clone Zsh plugins with full repository
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
mkdir -p $ZSH_CUSTOM/plugins

# Clone Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/agkozak/zsh-z.git $ZSH_CUSTOM/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-completions.git $ZSH_CUSTOM/plugins/zsh-completions

# Create .zshrc configuration
cat > ~/.zshrc << EOL
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-z
    zsh-completions
    docker
    docker-compose
    npm
    node
    rust
)

source $ZSH/oh-my-zsh.sh

source ~/.zsh_profile

alias luamake=/home/mpaulson/personal/lua-language-server/3rd/luamake/luamake

# bun completions
[ -s "/home/mpaulson/.bun/_bun" ] && source "/home/mpaulson/.bun/_bun"

# Bun
export BUN_INSTALL="/home/mpaulson/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/mpaulson/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"

# Turso
export PATH="/home/mpaulson/.turso:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Additional custom aliases and configurations
alias vim='nvim'
alias cat='bat'
alias ls='eza'

EOL

# Install Volta for Node.js management
curl https://get.volta.sh | bash
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Install latest LTS Node.js using Volta
volta install node@lts

# Install Rust (Primeagen often uses Rust-based tools)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# Install Rust-based tools
cargo install \
    bat \
    eza \
    zoxide \
    du-dust \
    ripgrep

# Install Neovim using curl (latest stable version)
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

# Create personal folder and clone Harpoon
mkdir -p ~/personal
cd ~/personal
git clone https://github.com/ThePrimeagen/harpoon.git
cd harpoon
git checkout harpoon2

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Remove Packer, install lazy.nvim
rm -rf ~/.local/share/nvim/site/pack/packer/start/packer.nvim
git clone https://github.com/folke/lazy.nvim.git \
    ~/.local/share/nvim/site/pack/lazy/start/lazy.nvim

# Set up Neovim configurations
mkdir -p ~/.config/nvim
curl -o ~/.config/nvim/init.lua https://raw.githubusercontent.com/ThePrimeagen/.dotfiles/master/nvim/.config/nvim/init.lua

# Install Docker and Docker Compose
sudo apt install -y docker.io docker-compose

# Set up Docker permissions
sudo usermod -aG docker $USER

# Cleanup
sudo apt autoremove -y

# Change default shell to zsh
chsh -s $(which zsh)

echo "Setup complete! You may need to log out and log back in for some changes to take effect."
echo "Don't forget to:"
echo "1. Tmux plugins: press prefix + I in tmux to install"
echo "2. Run :Lazy install in Neovim to install plugins"

