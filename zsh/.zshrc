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

function er {
  if [ -e "$HOME/.cache/nvim/server.pipe" ]; then
    vim --server ~/.cache/nvim/server.pipe --remote-send '<cmd>Alpha<CR>'
  fi
}

function eq {
  if [ -e "$HOME/.cache/nvim/server.pipe" ]; then
    vim --server ~/.cache/nvim/server.pipe --remote-send ':qa<CR>'
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
  if [ -n "$file" ]; then
    e $file
  fi
}

function gco {
  git checkout $(git branch --sort=-committerdate | head -10 | fzf)
}
function gdm {
  file=$(git diff --name-only master | fzf);
  if [ -n "$file" ]; then
    e $(git rev-parse --show-toplevel)/$file
  fi
}

function gdf {
  file=$(git diff --name-only | fzf);
  if [ -n "$file" ]; then
    e $(git rev-parse --show-toplevel)/$file
  fi
}

function grf {
  local file=$(git diff --check | fzf);
  local filePath=$(echo $file | cut -d: -f1)
  local lineNum=$(echo $file | cut -d: -f2)
  if [ -n "$file" ]; then
    e "$(git rev-parse --show-toplevel)/$filePath" "$lineNum"
  fi
}
plugins=(git z)
source $ZSH/oh-my-zsh.sh
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
export PATH="$HOME/scripts/:$HOME/bin:$PATH"

