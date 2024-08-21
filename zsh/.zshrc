# ==Paths==
export PATH="$PATH:/home/nikhilhenry/.local/bin"
export PATH="$PATH:/home/nikhilhenry/.local/scripts"
export PATH="$PATH:/usr/local/go/bin"
export SSH_AUTH_SOCK="/run/user/1000/keyring/ssh"

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
bindkey -s '^t' 'tmux-sessionizer'

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
alias mm="micromamba"
alias dstart="systemctl --user start docker"
alias dstop="systemctl --user stop docker"

# ==Crab stuf==
. "$HOME/.cargo/env"

# ==Integrations==
## Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/home/nikhilhenry/.local/bin/micromamba';
export MAMBA_ROOT_PREFIX='/home/nikhilhenry/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
