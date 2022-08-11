#!/usr/bin/env zsh

# General
export EDITOR="nvim"
export TERMINAL="alacritty"
setopt autocd

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=SAVEHIST=10000
setopt APPEND_HISTORY
setopt HIST_SAVE_NO_DUPS

# Man pages
export MANPAGER='nvim +Man!'
export MANWIDTH=80

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
