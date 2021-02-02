#!/bin/bash

BASEDIR="~/dotfiles"
git submodule update --init --recursive
# vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.bashrc ~/.bashrc
