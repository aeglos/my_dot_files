# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+:}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;33m\]\$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -lh'
#alias la='ls -A'
#alias l='ls -CF'
alias vi='vim'
alias minicom='minicom --color=on'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

#gcc
#alias gcc='gcc -Wall -Werror'
alias gcc='gcc -Wall'
#alias objdump='objdump -d -S'

export EDITOR=vim
# colorful man page
export PAGER="`which less` -s"
export BROWSER="$PAGER"
export LESS_TERMCAP_mb=$'\E[0;1;36m' # begin blinking
export LESS_TERMCAP_md=$'\E[0;1;32m' # begin bold
export LESS_TERMCAP_me=$'\E[0m'		 # end mode
export LESS_TERMCAP_se=$'\E[0m'		 # end standout-mode
export LESS_TERMCAP_so=$'\E[0;44;33m' # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'		 # end underline
export LESS_TERMCAP_us=$'\E[0;33m'   # begin underline

export GOPATH="$HOME/go"
export PATH="$PATH:$HOME/bin/:$GOPATH/bin/"

# make tty1 Eng UI
if [ "$(tty)" = "/dev/tty1" ]; then
    LANG="en_US.UTF-8"
fi

#. /usr/share/autojump/autojump.sh
eval "$(fasd --init auto)"
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias j='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
alias v='f -t -e vim -b viminfo'

# ls when cd, it's useful
function cd () {
    if [ -n "$1" ]; then
        builtin cd "$@"&& ls
    else
        builtin cd ~&& ls
    fi
}

# swap() -- switch 2 filenames around
#function swap()
#{
#    local TMPFILE=tmp.$$
#    mv "$1" $TMPFILE
#    mv "$2" "$1"
#    mv $TMPFILE "$2"
#}

# repeat() -- repeat a given command N times
#function repeat() # repeat n times command
#{
#    local i max
#    max=$1; shift;
#    for ((i=1; i <= max ; i++)); do
#        eval "$@";
#    done
#}

#Multi-thread get by lftp
#function pget()
#{
#    echo $1
#    cmd="pget -n 5 $1; exit"
#    lftp -e "$cmd"
#}
function .. () {
    num=$1
    test $1 || num=1
    seq=`seq $num`
    next=`printf "../%.0s" {$seq}`
    cd $next
}

function ex () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjvf $1     ;;
      *.tar.gz)    tar xzvf $1     ;;
      *.tar.xz)    tar Jxvf $1     ;;
      *.bz2)       bunzip2 $1      ;;
      *.rar)       rar x $1     ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xvf $1      ;;
      *.tbz2)      tar xjvf $1     ;;
      *.tgz)       tar xzvf $1     ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1    ;;
      *.xz)        unxz $1    ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
#function git_diff() {
#    git diff --no-ext-diff -w "$@" | vim -R -
#}
# START tmux completion
# This file is in the public domain
# See: http://www.debian-administration.org/articles/317 for how to write more.
# Usage: Put "source bash_completion_tmux.sh" into your .bashrc
_tmux()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    opts=" \
    attach-session \
    bind-key \
    break-pane \
    capture-pane \
    choose-client \
    choose-session \
    choose-window \
    clear-history \
    clock-mode \
    command-prompt \
    confirm-before \
    copy-buffer \
    copy-mode \
    delete-buffer \
    detach-client \
    display-message \
    display-panes \
    down-pane \
    find-window \
    has-session \
    if-shell \
    join-pane \
    kill-pane \
    kill-server \
    kill-session \
    kill-window \
    last-window \
    link-window \
    list-buffers \
    list-clients \
    list-commands \
    list-keys \
    list-panes \
    list-sessions \
    list-windows \
    load-buffer \
    lock-client \
    lock-server \
    lock-session \
    move-window \
    new-session \
    new-window \
    next-layout \
    next-window \
    paste-buffer \
    pipe-pane \
    previous-layout \
    previous-window \
    refresh-client \
    rename-session \
    rename-window \
    resize-pane \
    respawn-window \
    rotate-window \
    run-shell \
    save-buffer \
    select-layout \
    select-pane \
    select-prompt \
    select-window \
    send-keys \
    send-prefix \
    server-info \
    set-buffer \
    set-environment \
    set-option \
    set-window-option \
    show-buffer \
    show-environment \
    show-messages \
    show-options \
    show-window-options \
    source-file \
    split-window \
    start-server \
    suspend-client \
    swap-pane \
    swap-window \
    switch-client \
    unbind-key \
    unlink-window \
    up-pane"

    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    return 0

}
complete -F _tmux tmux

# END tmux completion
