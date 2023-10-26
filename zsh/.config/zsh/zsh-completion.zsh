#!/usr/bin/env zsh

# Options
setopt extendedglob nomatch menucomplete

autoload -Uz compinit && compinit
# Add hidden files to completion
_comp_options+=(globdots)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi
