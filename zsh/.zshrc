export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
alias nvim=$HOME/.local/bin/nvim
alias vim=$HOME/.local/bin/lvim
vimalias="$HOME/.local/bin/lvim"
alias vim=$vimalias
export FZF_DEFAULT_OPTS="--ansi --color --bind 'ctrl-o:execute($vimalias \"+normal \$(echo {} | cut -d: -f2)G\$(echo {} | cut -d: -f3)|\" \$(echo {} | cut -d: -f1) < /dev/tty)'"
if [ -f /opt/homebrew/share/liquidprompt ]; then
. /opt/homebrew/share/liquidprompt
fi
function f {
   ag --color --column --nogroup -i "$1" | fzf
   #rg --line-number --color always -i --vimgrep --no-heading $1 | fzf
}
# Only load Liquidprompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source $HOME/liquidprompt/liquidprompt
plugins=(git)
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source $HOME/.fzf.zsh

# Only load liquidprompt in interactive shells, not from a script or from scp
echo $- | grep -q i 2>/dev/null && . /usr/share/liquidprompt/liquidprompt

