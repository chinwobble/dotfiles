#!/bin/bash
git submodule update --init --recursive

# vim
cp -f ~/dotfiles/.vimrc ~/.vimrc
cp -f ~/dotfiles/.gvimrc ~/.gvimrc
cp -fr ~/dotfiles/.vim/* ~/vimfiles
# also copy to .vim folder so that git bash works too
cp -fr ~/dotfiles/.vim/* ~/.vim
cp -f ~/dotfiles/.bashrc.win ~/.bashrc



