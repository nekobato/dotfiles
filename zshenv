
# Zsh enviroment
[[ -f /usr/share/zsh/zshenv ]] && source /usr/share/zsh/zshenv
typeset -U PATH CDPATH FPATH MANPATH

# Editor
EDITOR=/usr/bin/vi
[[ -s /bin/vi ]] && EDITOR=/bin/vi
export EDITOR

export TERM=xterm-256color

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Common bin
export PATH="/bin:$PATH"
export PATH="/sbin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/Cellar:$PATH"
export PATH="$HOME/bin:$PATH"

# My server commands(Nsh)
NSH_PATH=~/nsh
if [ -e $NSH_PATH ];
  then export PATH="$NSH_PATH:$PATH"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Zsh functions
FPATH=$HOME/.zsh/functions/Completion:/usr/local/share/zsh/site-functions:$FPATH
export FPATH PATH

if type brew >/dev/null 2>&1; then
  BREW_PREFIX=$(brew --prefix)
  if [ -e $BREW_PREFIX/Library/Contributions/brew_zsh_completion.sh ]; then
    source $BREW_PREFIX/Library/Contributions/brew_zsh_completion.sh >/dev/null 2>&1
  fi
fi



# Npm modules
if [[ -s /usr/local/lib/node_modules ]]; then
  export NODE_PATH=/usr/local/lib/node_modules
  export PATH=$NODE_PATH:$PATH
fi


# Golang
export GOPATH=/Users/nekobato/.gocode:$GOPATH

export LANG=js_JP.UTF-8
export SHELL=/bin/zsh
PATH=~/.plenv/shims:$PATH

# Android
export ANDROID_HOME=/usr/local/Cellar/android-sdk/24.0.2
