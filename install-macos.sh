#!/bin/bash

# Homebrew
if type brew &>/dev/null; then
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install dotfiles
cd ~/dotfiles
stow zsh bat clean lazygit nvim starship tmux vim
source ~/.zshrc

# Install packages
brew install git tmux wget stow ripgrep bat fzf zsh nvm starship neovim lazygit

# nvim
nvm install 22
npm install -g tree-sitter-cli

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vi +PlugInstall +qall

# zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
