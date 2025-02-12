export OPENSSL_INCLUDE_DIR=/usr/local/opt/openssl/include
export OPENSSL_LIB_DIR=/usr/local/opt/openssl/lib
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="$HOME/CEdev/bin:$PATH"
export EDITOR="nvim"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/.state"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export COREPACK_HOME="$XDG_DATA_HOME/node/corepack"
export PNPM_HOME="$XDG_DATA_HOME/pnpm"

export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"
export GRADLE_USER_HOME="$XDG_DATA_HOME/gradle"

# Homebrew
HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"

if [ -f "$HB_CNF_HANDLER" ]; then
    source "$HB_CNF_HANDLER";
fi

if type bat &>/dev/null; then
    export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

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

autoload -U compinit && compinit
zinit cdreplay -q

alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"
alias ls='ls --color=always'
alias clean='~/clean.sh'
alias vim='nvim'
alias :q='exit'

eval "$(tmuxifier init -)"
eval "$(fzf --zsh)"
eval "$(starship init zsh)"
