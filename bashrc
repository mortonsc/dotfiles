#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"
PS1="${GREEN}(\u@\h: \w) ${RESET}\$ "

# set default editor to vim
export VISUAL=vim

# vi mode
set -o vi

alias ls='ls --color=auto'
alias ll="ls -al --group-directories-first"

# prompt when deleting recursively or deleting more than 3 files
alias rm='rm -I'

# resume incomplete downloads
alias wget='wget -c'

# only ping 5 times
alias ping='ping -c 5'

alias ysi='yaourt -S'

# shortcut to move one directory up
alias ..='cd ..'

alias resudo='sudo $(history -p \!\!)'

# aliases mounting caen filesystem
alias mountcaen="sshfs caen:/home/mortonsc /caen"
alias umountcaen="fusermount -u /caen"

function cdl { cd $1; ls; }

# view file in new process
function opn() { command xdg-open "$@" & }

