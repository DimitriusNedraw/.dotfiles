# History section
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000



autoload -Uz compinit vcs_info
precmd() { vcs_info }
compinit

# GIT section
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr 'U'
zstyle ':vcs_info:*' stagedstr 'S'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:git:*' formats '%F{cyan}(%b)%m%u%c%f'
setopt PROMPT_SUBST

+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='A'
  fi
}


alias ls='ls --color=auto'
alias grep='grep --color=auto'

PROMPT='%B%F{green}%n@%m%f:%F{blue}%~%f ${vcs_info_msg_0_}>%b '

