#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

BOLD_BLUE="\[$(tput bold)$(tput setaf 5)\]"
BLUE="\[$(tput setaf 4)\]"
GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"

# default prompt
PS1='[\u@\h \W]\$ '

PS1="${GREEN}(\u: \w) ${RESET}$ "

# aliases for ssh to caen
alias sshcaen="ssh mortonsc@login-course.engin.umich.edu"
alias mountcaen="sshfs mortonsc@login-course.engin.umich.edu:/home/mortonsc ~/caen"
alias umountcaen="fusermount -u ~/caen"


# set default editor to vim
export VISUAL=vim

