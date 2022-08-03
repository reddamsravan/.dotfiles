# load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# format vcs_info variable
zstyle ':vcs_info:git:*' formats ':%F{green}%b%f'

# set up the prompt
setopt PROMPT_SUBST
PROMPT='%F{blue}%1~%f${vcs_info_msg_0_} $ '
