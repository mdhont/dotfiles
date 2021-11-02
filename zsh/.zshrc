export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
alias vim=$HOME/.local/bin/lvim
vimalias="$HOME/.local/bin/lvim"
export EDITOR=$vimalias
alias vim=$vimalias
export FZF_DEFAULT_OPTS="--ansi --color --bind 'ctrl-o:execute($vimalias \"+normal \$(echo {} | cut -d: -f2)G\$(echo {} | cut -d: -f3)|\" \$(echo {} | cut -d: -f1) < /dev/tty)'"
if [ -f /opt/homebrew/share/liquidprompt ]; then
. /opt/homebrew/share/liquidprompt
fi
function f {
   ag --color --column --nogroup -i "$1" | fzf
   #rg --line-number --color always -i --vimgrep --no-heading $1 | fzf
}
[[ $- = *i* ]] && source $HOME/liquidprompt/liquidprompt
plugins=(git z)
source $ZSH/oh-my-zsh.sh
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
echo $- | grep -q i 2>/dev/null && . /usr/share/liquidprompt/liquidprompt
export PATH="$HOME/bin:$PATH"

