export ZDOTDIR=$HOME/.config/zsh
# Histroy
HISTFILE=$HOME/.zsh_history
setopt APPEND_HISTORY
setopt HIST_SAVE_NO_DUPS

# Useful options
setopt AUTO_CD EXTENDED_GLOB NO_MATCH MENU_COMPLETE 
zle_highlight=('paste:none')

# Don't beep
setopt NO_BEEP

# Completion
autoload -Uz compinit
# Do menu-driven completion.
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots) # include hidden files

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Colors
autoload -Uz colors && colors

# Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

compinit

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

# Environment variables set everywhere
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
