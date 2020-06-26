# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/scripts:$HOME/bin:$PATH
if [ "$TERM" != "xterm-256color" ]; then
  export TERM=xterm-256color
fi
alias lp="ls -ld $PWD/*"
alias sudo='sudo '
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='emacs'
ZSH_THEME="avit"
plugins=(git z)

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$PATH:$HOME/.rvm/bin"
