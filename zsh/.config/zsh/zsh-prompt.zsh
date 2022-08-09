#!/usr/bin/env zsh

autoload -Uz vcs_info

# Enable VCs
# example `zstyle ':vcs_info:*' enable git svn ...`
zstyle ':vcs_info:*' enable git

# Check for changes
# from: https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples#L72
zstyle -e ':vcs_info:git:*' \
  check-for-changes 'estyle-cfc && reply=( true ) || reply=( false )'

function estyle-cfc() {
  local d
  local -a cfc_dirs
    
  cfc_dirs=(
    ${HOME}/Workspace/projects/*(/)
  )

  for d in ${cfc_dirs}; do
    d=${d%/##}
    [[ $PWD == $d(|/*) ]] && return 0
  done

  if [[ $PWD == ${HOME}/.dotfiles ]] then
    return 0
  fi

  return 1
}

### Display the existence of files not yet known to VCS

### git: Show marker (T) if there are untracked files in repository
# Make sure you have added staged to your 'formats':  %c
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep -q '^?? ' 2> /dev/null ; then
        # This will show the marker if there are any untracked files in repo.
        # If instead you want to show the marker only if there are untracked
        # files in $PWD, use:
        #[[ -n $(git ls-files --others --exclude-standard) ]] ; then
        hook_com[staged]+='T'
    fi
}

# %s - The current version control system, like git or svn.
# %r - The name of the root directory of the repository
# %S - The current path relative to the repository root directory
# %b - Branch information, like master
# %m - In case of Git, show information about stashes
# %u - Show unstaged changes in the repository
# %c - Show staged changes in the repository
zstyle ':vcs_info:git*' formats "${bg_directory}${fg_directory} %r/%S ${bg_git_status}${fg_git_status} %m%u%c ${bg_git_branch}${fg_git_branch}  %b ${bg_git_status}${fg_git_status}%a"

# Prompt
precmd() {
    vcs_info

    local space=" "
    local current_directory="%c"
    local arrow="%{$reset_color%}${space}→${space}"

    if [[ -z ${vcs_info_msg_0_} ]]; then
      PROMPT="${bg_directory}${fg_directory}${space}${current_directory}${space}${arrow}"
    else
      PROMPT="${vcs_info_msg_0_}${arrow}"
    fi
}

