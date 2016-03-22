#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

GREEN="\[$(tput setaf 2)\]"
RESET="\[$(tput sgr0)\]"
PS1="${GREEN}(\u@\h: \w) ${RESET}$ "

# vi mode
set -o vi

# aliases for ssh to caen
alias sshcaen="ssh mortonsc@login-course.engin.umich.edu"
alias mountcaen="sshfs mortonsc@login-course.engin.umich.edu:/home/mortonsc /caen"
alias umountcaen="fusermount -u /caen"

# laziness
alias opn="xdg-open"


# set default editor to vim
export VISUAL=vim

