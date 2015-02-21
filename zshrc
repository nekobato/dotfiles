

### 自動補完
autoload -U compinit
compinit -u

setopt correct # spell missのsuggestion
setopt auto_list # 補完の一覧
setopt list_packed # 補完表示を詰める
setopt list_types # ファイル種別の判別
setopt auto_menu # Tab key による補完候補
setopt magic_equal_subst # 引数の補完

setopt noautoremoveslash # 最後の/を自動で消す

### colors
autoload -Uz colors
colors

local DEFAULT=$'%{e[m%}'$
local RED=$'%{e[1;31m%}'$
local GREEN=$'%{e[1;32m%}'$
local YELLOW=$'%{e[1;33m%}'$
local BLUE=$'%{e[1;34m%}'$
local PURPLE=$'%{e[1;35m%}'$
local LIGHT_BLUE=$'%{e[1;36m%}'$
local WHITE=$'%{e[1;37m%}'$

LISTMAX=0
CLICOLOR=1
LSCOLORS=exfxbxdxcxhegedabagahcdx
LS_COLORS='di=34:ln=35:so=32:pi=33:ex=32:bd=34:cd=34:su=42:sg=46:tw=42:ow=34;42:or=40;31'
export LISTMAX CLICOLOR LSCOLORS LS_COLORS
export ZLS_COLORS=$LS_COLORS





limit coredumpsize 102400

### prompt

setopt prompt_subst # promptの動的変数展開
setopt transient_rprompt # hide RPrompt when exec commands
setopt always_last_prompt # promptの位置を変えない

setopt nobeep
setopt long_list_jobs # jobs -> jobs -l
setopt auto_resume # サスペンド中のコマンドと同一だった場合はresume
setopt hist_ignore_dups
setopt auto_pushd
setopt pushd_to_home
setopt pushd_ignore_dups
setopt extended_glob # , ~ ^ を正規表現として扱う

setopt extended_history
setopt equals

setopt hist_verify
setopt numeric_glob_sort

# language
setopt print_eight_bit # JP langを表示


setopt auto_cd # path nameのみで移動
setopt auto_param_keys
setopt auto_param_slash


setopt complete_aliases
setopt glob_complete

# sudoでも補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
# 大文字・小文字を区別しないで補完出来るようにする 大文字を入力した場合は区別する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補を矢印キーなどで選択出来るようにする
zstyle ':completion:*:default' menu select
# zstyleによる補完設定
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format $YELLOW'%d'$DEFAULT
zstyle ':completion:*:warnings' format $RED'No matches for:'$YELLOW' %d'$DEFAULT
zstyle ':completion:*:descriptions' format $YELLOW'completing %B%d%b'$DEFAULT
zstyle ':completion:*:corrections' format $YELLOW'%B%d '$RED'(errors: %e)%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'


PROMPT="
%{%F{green}%}[%*]%{$reset_color%} ➤ "

autoload -Uz vcs_info

# $vcs_info_msg_0_ : normal
# $vcs_info_msg_1_ : warning
# $vcs_info_msg_2_ : error
zstyle ':vcs_info:*' max-exports 3
zstyle ':vcs_info:*' enable git

# autoload -Uz is-at-least # version check


zstyle ':vcs_info:git:*' formats '%r/%b' '%c%u %m'
zstyle ':vcs_info:git:*' actionformats '%r/%b' '%c%u %m' '<!%a>'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"    # %c
zstyle ':vcs_info:git:*' unstagedstr "-"  # %u

# git のときはフック関数を設定する

# formats '(%s)-[%b]' '%c%u %m' , actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
# のメッセージを設定する直前のフック関数
# 今回の設定の場合はformat の時は2つ, actionformats の時は3つメッセージがあるので
# 各関数が最大3回呼び出される。
zstyle ':vcs_info:git+set-message:*' \
  hooks \
  git-hook-begin \
  git-untracked \
  git-push-status \
  git-nomerge-branch \
  git-stash-count

function +vi-git-hook-begin() {
  if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
    return 1
  fi
    return 0
}

# unstaged (%u) ?
function +vi-git-untracked() {
  # zstyle formats, actionformats の2番目のメッセージのみ対象にする
  if [[ "$1" != "1" ]]; then
      return 0
  fi

  if command git status --porcelain 2> /dev/null \
    | awk '{print $1}' \
    | command grep -F '??' > /dev/null 2>&1 ; then

    # unstaged (%u) に追加
    hook_com[unstaged]+='%F{red}✘'
  fi
}

# unpushed pN (%m)
function +vi-git-push-status() {
  # zstyle formats, actionformats の2番目のメッセージのみ対象にする
  if [[ "$1" != "1" ]]; then
    return 0
  fi

  if [[ "${hook_com[branch]}" != "master" ]]; then
    # master ブランチでない場合は何もしない
    return 0
  fi

  # push していないコミット数を取得する
  local ahead
  ahead=$(command git rev-list origin/master..master 2>/dev/null \
    | wc -l \
    | tr -d ' ')

  if [[ "$ahead" -gt 0 ]]; then
    # misc (%m) に追加
    hook_com[misc]+="(p${ahead})"
  fi
}

# unmerged (mN) (%m)
function +vi-git-nomerge-branch() {
    # zstyle formats, actionformats の2番目のメッセージのみ対象にする
    if [[ "$1" != "1" ]]; then
        return 0
    fi

    if [[ "${hook_com[branch]}" == "master" ]]; then
        # master ブランチの場合は何もしない
        return 0
    fi

    local nomerged
    nomerged=$(command git rev-list master..${hook_com[branch]} 2>/dev/null | wc -l | tr -d ' ')

    if [[ "$nomerged" -gt 0 ]] ; then
        # misc (%m) に追加
        hook_com[misc]+="(m${nomerged})"
    fi
}

# stash :SN (%m)
function +vi-git-stash-count() {
    # zstyle formats, actionformats の2番目のメッセージのみ対象にする
    if [[ "$1" != "1" ]]; then
        return 0
    fi

    local stash
    stash=$(command git stash list 2>/dev/null | wc -l | tr -d ' ')
    if [[ "${stash}" -gt 0 ]]; then
        # misc (%m) に追加
        hook_com[misc]+=":S${stash}"
    fi
}


function _update_vcs_info_msg() {
    local -a messages
    local prompt

    LANG=en_US.UTF-8 vcs_info

    if [[ -z ${vcs_info_msg_0_} ]]; then
        # vcs_info で何も取得していない場合はプロンプトを表示しない
        prompt=""
    else
        # vcs_info で情報を取得した場合
        # $vcs_info_msg_0_ , $vcs_info_msg_1_ , $vcs_info_msg_2_ を
        # それぞれ緑、黄色、赤で表示する
        [[ -n "$vcs_info_msg_0_" ]] && messages+=( "%F{green}${vcs_info_msg_0_}%f" )
        [[ -n "$vcs_info_msg_1_" ]] && messages+=( "%F{yellow}${vcs_info_msg_1_}%f" )
        [[ -n "$vcs_info_msg_2_" ]] && messages+=( "%F{red}${vcs_info_msg_2_}%f" )

        # 間にスペースを入れて連結する
        prompt="[${(j: :)messages}]"
    fi

    RPROMPT="%~ $prompt"
}
autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_vcs_info_msg



### history file ###
#
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
setopt extended_history # times
setopt share_history # share other shell commands
setopt hist_reduce_blanks # formatted history
setopt append_history # zsh復数同時使用の場合、上書きせずに追加
setopt inc_append_history # すぐにヒストリファイルに追記する。

if [ $UID = 0 ]; then
  unset HISTFILE
  SAVEHIST=0
fi
