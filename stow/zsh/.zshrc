setopt autocd
ZSH_DIR="${funcsourcetrace[1]%/*}/.config/zsh"

source $ZSH_DIR/history.zsh
source $ZSH_DIR/comp.zsh
source $ZSH_DIR/prompt.zsh
source $ZSH_DIR/alias.zsh
source $ZSH_DIR/plugin.zsh

