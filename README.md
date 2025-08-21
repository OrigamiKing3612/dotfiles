# dotfiles

These are my dotfiles. I use `stow` to manage the symlinks.

## Quick Setup

### Linux
Run the automated install script:
```bash
curl -o- https://raw.githubusercontent.com/OrigamiKing3612/dotfiles/master/install-linux.sh | bash
```

Or manually clone and setup:
```bash
git clone https://github.com/OrigamiKing3612/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install-linux.sh
```

### macOS
```bash
brew install git tmux wget stow ripgrep neovim
git clone https://github.com/OrigamiKing3612/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow bash ghostty nvim starship tmux vim yazi silicon
```

# Manual Setup
Run `stow` on the folders if this folder. (ex: `stow bash ghostty`)
## Mac
`brew install git tmux wget stow ripgrep`

## Linux
`sudo apt install curl git tmux wget stow htop ufw ssh ripgrep`

# Setup Commands

## bash

## bat
`bat cache --build`

## clean


## ghostty
### Mac
```bash
brew install --cask ghostty
```

## i3
```bash
sudo pacman -S i3 dmenu i3-gaps polybar rustup rofi xfce4-settings pamixer picom brightnessctl bluez bluez-utils
yay -S i3lock-color
```

## nvim
### Mac
```bash
brew install neovim ripgrep
```

### Linux
```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo apt-get install ripgrep
```

### Install tree-sitter-cli
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
source ~/.bashrc
nvm install --lts
npm install -g tree-sitter-cli
```
## silicon
### Mac
`brew install silicon`

## starship
### Mac
`brew install starship`

### Linux
`curl -sS https://starship.rs/install.sh | sh`

## starship-server
`curl -sS https://starship.rs/install.sh | sh`

## tmux
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

## vim
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
```

## yazi

## zsh
`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting`
`git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions`

# Troubleshooting

## Neovim Issues
- If Neovim isn't found after installation, restart your terminal or run `source ~/.bashrc`
- For LSP issues, run `:checkhealth` in Neovim to diagnose problems
- If plugins fail to load, try `:Lazy sync` to update them

## Install Script Issues
- If you get permission errors, make sure you have sudo access
- The script backs up your existing `.bashrc` before replacing it
- For ARM64 systems, ensure you have the correct architecture detection

## Tmux Plugin Issues
- After first tmux start, press `prefix + I` (Ctrl-s + I) to install plugins
- If tmux doesn't start with the theme, run `tmux source ~/.tmux.conf`

## Stow Conflicts
- If stow reports conflicts, move or remove the conflicting files manually
- Use `stow -D <package>` to unstow a package if needed
