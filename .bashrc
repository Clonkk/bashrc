# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
#export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true

# set a fancy prompt (non-color, unless we know we "want" color)
color_prompt=yes

PS1='${debian_chroot:+($debian_chroot)}\[\033[1;32m\]\u\[\033[00m\]\[\033[00;33m\] \w \[\e[00m\]$ '

if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=0
    GIT_PROMPT_THEME="Evermeet_Ubuntu"
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

alias vim='nvim'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ws='cd ~/Workspace'
alias deploy='cd ~/Workspace/DeepColor/Deploy'
export LIBRARY_PATH=/usr/lib:/usr/lib64
export PATH=$PATH:/home/bin
export PATH=$PATH:$HOME/.nimble/bin
export JULIA_PATH=~/Workspace/julia-1.5.3
export PATH=$PATH:$JULIA_PATH/bin
source "$HOME/.cargo/env"
