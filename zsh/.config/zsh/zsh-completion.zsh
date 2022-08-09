#!/usr/bin/env zsh

# Options
setopt extendedglob nomatch menucomplete

autoload -Uz compinit && compinit
# Add hidden files to completion
_comp_options+=(globdots)
