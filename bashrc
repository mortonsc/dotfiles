#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# aliases for ssh to caen
alias sshcaen="ssh mortonsc@login-course.engin.umich.edu"
alias mountcaen="sshfs mortonsc@login-course.engin.umich.edu:/home/mortonsc ~/caen"
alias umountcaen="fusermount -u ~/caen"

# set default editor to vim
export VISUAL=vim

