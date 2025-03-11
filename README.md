# dotfiles

These are my dotfiles. I use `stow` to manage the symlinks.

# Setup
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
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.bashrc
nvm install 22
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
