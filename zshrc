### auto command completion ###
autoload -U compinit
compinit -u
autoload -Uz colors ; colors
autoload -Uz history-search-end

setopt correct # correct command spelling
setopt magic_equal_subst # after equal completion
setopt auto_list # display command list
setopt list_types # display file types
setopt auto_menu # can be selecting displayed command
setopt list_packed # smart command list view
setopt auto_param_slash # auto plus /
bindkey "^[[Z" reverse-menu-complete # reverse command selecting
zstyle ':completion:*' use-cache true
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %P Lines: %m
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:approximate:*' max-errors 1
zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%}'
zstyle ':completion:*:default' menu select auto
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}
zstyle ':completion:::::' completer _complete _approximate

### glob option ###
unsetopt caseglob # case insensitive

#
### history file ###
#
HISTFILE=~/.zsh_history
HISTFILE=10000
SAVESHIT=10000
setopt extended_history # times
setopt share_history # share other shell commands
setopt hist_reduce_blanks # formatted history

#
### Colors ###
#
autoload -U colors; colors

# default editor
export EDITOR=vim # default editor

#
# Language support
#
export LANG=ja_JP.UTF-8 # language setting
export KCODE=u
setopt print_eight_bit # display JP lang
setopt no_flow_control # unenable flow control

setopt no_beep # unenable beep
setopt long_list_jobs # jobs -> jobs -l
setopt auto_resume


#
# Command aliase
#
alias ls="ls -v"
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
# Git aliase
alias gitsl="bash ~/dotfiles/commands/gitstatus-list.sh"


#
# Git Prompt
#
__git_files() { _files }
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true
autoload -Uz is-at-least
if is-at-least 4.3.10; then
  zstyle ':vcs_info:git:*' check-for-changes true
  zstyle ':vcs_info:git:*' stagedstr "^"
  zstyle ':vcs_info:git:*' unstagedstr "*"
  zstyle ':vcs_info:git:*' formats '[%s](%b) %c%u'
  zstyle ':vcs_info:git:*' actionformats '[%s](%b|%a) %c%u'
fi

function _update_vcs_info_msg() {
  psvar=()
  LANG=C vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT="%1(v|%F{green}%1v%f|)"
RPROMPT="$RPROMPT %{${fg[blue]}%}[%/]%{${reset_color}%}"

#
### tmux
#
if [ ! -z "`which tmux`" ]; then
  if [ $SHLVL = 1 ]; then
    if [ $(( `ps aux | grep tmux | grep $USER | grep -v grep | wc -l` )) != 0 ]; then
      echo -n 'Attach tmux session? [Y/n]'
      read YN
      [[ $YN = '' ]] && YN=y
      [[ $YN = y ]] && tmux attach
    fi
  fi
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### docker
export DOCKER_HOST=tcp://$(boot2docker ip 2>/dev/null):2375
