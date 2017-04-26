#!/bin/sh

ln -sf $PWD/.zshrc ~/.zshrc
ln -sf $PWD/.screenrc ~/.screenrc
ln -sf $PWD/.emacs ~/.emacs
ln -sf $PWD/.gitconfig ~/.gitconfig
ln -sf $PWD/.gitignore_global ~/.gitignore_global
rm- rf /usr/bin/emacs
alias emacs='vim'
