
#oh-my-zsh folder
export ZSH="$HOME/.oh-my-zsh"

export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$PATH:$HOME/go/bin"

ZSH_THEME="robbyrussell"
ZSH_DISABLE_COMPFIX="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

deepseek-rate() {
  local dow=$(date -u +%u) h=$((10#$(date -u +%H)))
  if (( dow <= 5 && ((h >= 1 && h < 4) || (h >= 6 && h < 10)) )); then
    echo "PEAK — полная цена"
  else
    echo "off-peak — скидка 50%"
  fi
}

fpath=(~/.docker/completions $fpath)
autoload -Uz compinit
compinit


deepseek-rate