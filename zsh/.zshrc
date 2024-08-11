# ==Paths==
export PATH="$PATH:/home/nikhilhenry/.local/bin"
export PATH="$PATH:/home/nikhilhenry/.local/scripts"
export PATH="$PATH:/usr/local/go/bin"

# ==zinit setup==
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -g "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# == oh my posh setup ==
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# == zsh plugins ==

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# ==completions==
fpath+=~/.zfunc
autoload -U compinit && compinit

# ==keybindings==
bindkey -e
bindkey '^ ' autosuggest-accept
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey -s '^f' 'tmux-sessionizer'

# ==History==
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ==Completion styling==
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ==Aliases==
alias vim="nvim"
alias ls="ls --color"

# ==Crab stuf==
. "$HOME/.cargo/env"

# ==Integrations==
## Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
