export OPENSSL_INCLUDE_DIR=/usr/local/opt/openssl/include
export OPENSSL_LIB_DIR=/usr/local/opt/openssl/lib
export EDITOR="nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/.state"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export COREPACK_HOME="$XDG_DATA_HOME/node/corepack"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"
export _ZO_DATA_DIR="$XDG_DATA_HOME/zoxide"
export GPG_TTY=$(tty)

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#89B4FA \
--color=fg:#CDD6F4,header:#89B4FA,info:#89B4FA,pointer:#89B4FA \
--color=marker:#89B4FA,fg+:#CDD6F4,prompt:#89B4FA,hl+:#89B4FA \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

if type bat &>/dev/null; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
    alias cat="bat"
fi
if type nvim &>/dev/null; then
    export MANPAGER="nvim +Man!"
fi

# Silicon doesn't seem to support ~ or $HOME
if type silicon &>/dev/null; then
    alias silicon="silicon --theme=\"~/dotfiles/bat/.config/bat/themes/Catppuccin Mocha.tmTheme\""
fi

source ~/dotfiles/.extra_files/zsh_syntax_highlighting.zsh

# Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

bindkey -e

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

autoload -U compinit
fpath=(${fpath[@]:#"/opt/homebrew/share/zsh/site-functions"})
compinit
zinit cdreplay -q

if type brew &>/dev/null; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
    autoload -Uz compinit
    compinit
fi

alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"

alias ls='ls --color=always'
alias clean='~/clean.sh'
alias vim='nvim'
alias :q='exit'
alias cdtmp='cd $(mktemp -d)'

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

export PATH="$PATH:$CARGO_HOME/bin:$HOME/go/bin:$PNPM_HOME"

if type fzf &>/dev/null; then
    eval "$(fzf --zsh)"
fi

if type starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

if type zoxide &>/dev/null; then
    eval "$(zoxide init --cmd cd zsh)"
fi

if type say &>/dev/null; then
    alias say="say -r 140 -v \"Evan (Enhanced)\""
fi

if type eza &>/dev/null; then
    alias ls='eza --color=always --group-directories-first'
fi

if type sesh &>/dev/null; then
    source ~/dotfiles/.extra_files/sesh.zsh
fi
