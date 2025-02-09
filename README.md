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

## clean

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

## starship
`brew install starship`

## tmux
`git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`

## vim
```bash
git clone https://github.com/christoomey/vim-tmux-navigator.git ~/.vim/pack/plugins/start/vim-tmux-navigator
git clone https://github.com/github/copilot.vim.git ~/.vim/pack/github/start/copilot.vim
```

## zsh
`git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting`
`git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions`
