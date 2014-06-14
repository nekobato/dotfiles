
# Zsh enviroment
[[ -f /usr/share/zsh/zshenv ]] && source /usr/share/zsh/zshenv
typeset -U PATH CDPATH FPATH MANPATH

# Editor
EDITOR=/usr/bin/vi
[[ -s /bin/vi ]] && EDITOR=/bin/vi
export EDITOR

export TERM=xterm-256color

# Common bin
PATH=$HOME/bin:/usr/bin/:/usr/local/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$PATH

# Zsh functions
FPATH=$HOME/.zsh/functions/Completion:/usr/local/share/zsh/site-functions:$FPATH
export FPATH PATH

if type brew >/dev/null 2>&1; then
  BREW_PREFIX=$(brew --prefix)
  if [ -e $BREW_PREFIX/Library/Contributions/brew_zsh_completion.sh ]; then
    source $BREW_PREFIX/Library/Contributions/brew_zsh_completion.sh >/dev/null 2>&1
  fi
fi


LISTMAX=0
CLICOLOR=1
LSCOLORS=exfxbxdxcxhegedabagahcdx
LS_COLORS='di=34:ln=35:so=32:pi=33:ex=32:bd=34:cd=34:su=42:sg=46:tw=42:ow=34;42:or=40;31'
export LISTMAX CLICOLOR LSCOLORS LS_COLORS
export ZLS_COLORS=$LS_COLORS


# Npm modules
if [[ -s /usr/local/lib/node_modules ]]; then
  export NODE_PATH=/usr/local/lib/node_modules
  export PATH=$NODE_PATH:$PATH
fi


# Golang
export GOPATH=/Users/nekobato/.gocode:$GOPATH

export LANG=js_JP.UTF-8
export SHELL=/bin/zsh
