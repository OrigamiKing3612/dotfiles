#/bin/bash

sudo apt install curl git tmux wget stow ssh ripgrep -y

stow bash bat clean lazygit nvim starship tmux vim

# Install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.bashrc
nvm install 22
npm install -g tree-sitter-cli

# Install starship
curl -sS https://starship.rs/install.sh | sh -y

# Install Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vi +PlugInstall +qall
