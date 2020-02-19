#!/bin/bash
git submodule update --init --recursive

# vim
cp -f ~/dotfiles/.vimrc ~/.vimrc
cp -f ~/dotfiles/.gvimrc ~/.gvimrc
cp -rf ~/dotfiles/.vim/* ~/vimfiles
cp -rf ~/dotfiles/documents ~/
# also copy to .vim folder so that git bash works too
cp -fr ~/dotfiles/.vim/* ~/.vim
cp -f ~/dotfiles/.bashrc.win ~/.bashrc



