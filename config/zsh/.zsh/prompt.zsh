autoload -Uz vcs_info
precmd() { vcs_info }

setopt PROMPT_SUBST

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr 'U'
zstyle ':vcs_info:*' stagedstr 'S'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:git:*' formats '%F{cyan}(%b)%m%u%c%f'

+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='A'
  fi
}

PROMPT='%B%F{green}%n@%m%f:%F{blue}%~%f ${vcs_info_msg_0_}>%b '
