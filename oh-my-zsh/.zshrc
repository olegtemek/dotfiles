
#oh-my-zsh folder
export ZSH="$HOME/.oh-my-zsh"

export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"

ZSH_THEME="robbyrussell"
ZSH_DISABLE_COMPFIX="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

fpath=(~/.docker/completions $fpath)
autoload -Uz compinit
compinit
