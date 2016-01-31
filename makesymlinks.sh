#!/bin/bash

# This script creates symlinks from the home directory to dotfiles in ~/dotfiles
# all of this was copied verbatim from a script in github user michaeljsmalley's
# dotfiles repository.

dir=~/dotfiles
olddir=~/dotfiles_old   # old dotfiles backup directory
files="vimrc"

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
