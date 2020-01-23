#!/bin/bash
git submodule update --init --recursive
BASEDIR="~/dotfiles"

# vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.bashrc.win ~/.bashrc


