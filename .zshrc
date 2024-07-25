if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

# Load Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search fzf-tab gh)

# Source/load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load Completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# History
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

# Alias
alias lv="/Users/sajan.kumar/.local/bin/lvim"
alias ls="ls --color"
alias c='clear'

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup


# Path
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export SDKROOT=$(xcrun --sdk macosx --show-sdk-path)
export LIBRARY_PATH="$LIBRARY_PATH:$SDKROOT/usr/lib"
export PATH=$PATH:/Users/sajan.kumar/Applications/Docker.app/Contents/Resources/bin

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(fnm env)"
export LANG="en_US@UTF-8"
export LANG=en_US.UTF-8
export PATH=/Users/sajan.kumar/.local/bin:$PATH
