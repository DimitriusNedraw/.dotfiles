# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000



autoload -Uz compinit vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git:*' formats '%F{cyan}(%b)%u%c%f'
setopt PROMPT_SUBST
compinit

alias ls='ls --color=auto'
alias grep='grep --color=auto'

# PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
PROMPT='%B%F{green}%n@%m%f:%F{blue}%~%f ${vcs_info_msg_0_}$%b '

