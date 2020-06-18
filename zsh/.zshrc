# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/scripts:$HOME/bin:$HOME
alias lp="ls -ld $PWD/*"
alias sudo='sudo '
alias e="emacs"
alias open="rmate"
# Path to your oh-my-zsh installation.
export ZSH="/home/bitnami/.oh-my-zsh"
export EDITOR='emacs'
ZSH_THEME="avit"
plugins=(git z)

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$PATH:$HOME/.rvm/bin"
