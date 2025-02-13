# History section
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.

autoload -Uz compinit vcs_info
precmd() { vcs_info }
setopt autocd

# Complete section
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
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

# Aliases
alias ls='ls --color=auto --almost-all'
alias grep='grep --color=auto'
alias vi="nvim"
alias cat="bat"

PROMPT='%B%F{green}%n@%m%f:%F{blue}%~%f ${vcs_info_msg_0_}>%b '

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
