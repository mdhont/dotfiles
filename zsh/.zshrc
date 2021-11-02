export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="avit"
export PATH="$HOME/arcanist/arcanist/bin:$PATH"
alias kubectl="minikube kubectl --"
alias vim=$HOME/.local/bin/lvim
alias szsh="source ~/.zshrc"

function e {
  if [[ $# -eq 0 ]]; then
    FILE=""
  else
    if [[ "$1" != /* ]]; then
      FILE="$(pwd)/$1"
    else
      FILE="$1"
    fi
  fi
  if [ -z "$2" ]; then
    local lineInsert=""
  else
    local lineInsert="+$2"
  fi
  if [ -e "$HOME/.cache/nvim/server.pipe" ]; then
    vim $lineInsert --server ~/.cache/nvim/server.pipe --remote $FILE
  else
    vim $lineInsert --listen ~/.cache/nvim/server.pipe $FILE
  fi
}

export FZF_DEFAULT_OPTS="--ansi --color --bind 'ctrl-o:execute($vim \"+normal \$(echo {} | cut -d: -f2)G\$(echo {} | cut -d: -f3)|\" \$(echo {} | cut -d: -f1) < /dev/tty),ctrl-i:execute($vim \$(echo {} | cut -d: -f1) < /dev/tty)'"
function fst {
  local position="$(ag --color --column --nogroup -i "$1" | fzf)"
  if [ -f "$(echo "$position" | cut -d: -f1)" ]; then
    vim "+normal "$(echo "$position" | cut -d: -f2)G$(echo "$position" | cut -d: -f3)\|"" $(echo "$position" | cut -d: -f1)
  fi
}

function ffi {
  local file="$(fzf)"
  e $file
}

function gco {
  git checkout $(git branch --sort=-committerdate | head -10 | fzf)
}
function gdm {
  file=$(git diff --name-only master | fzf);
  e $(git rev-parse --show-toplevel)/$file
}

function gdf {
  file=$(git diff --name-only | fzf);
  e $(git rev-parse --show-toplevel)/$file
}

function grf {
  local file=$(git diff --check | fzf);
  local filePath=$(echo $file | cut -d: -f1)
  local lineNum=$(echo $file | cut -d: -f2)
  e "$(git rev-parse --show-toplevel)/$filePath" "$lineNum"
}
plugins=(git z)
source $ZSH/oh-my-zsh.sh
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
export PATH="$HOME/scripts/:$HOME/bin:$PATH"

