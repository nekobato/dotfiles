
# antigen
source ~/.antigen/antigen.zsh

antigen-use oh-my-zsh

antigen-bundles <<EOBUNDLES
  git
  autojump
  zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen-theme fino

antigen apply


### history file ###
#
HISTFILE=~/.zsh_history
setopt extended_history # times
setopt share_history # share other shell commands
setopt hist_reduce_blanks # formatted history

#
# Language support
#
setopt print_eight_bit # display JP lang
setopt no_flow_control # unenable flow control

setopt no_beep # unenable beep
setopt long_list_jobs # jobs -> jobs -l
setopt auto_resume
