#!/bin/bash

BASEDIR="~/dotfiles"
git submodule update --init --recursive
# vim
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim ~/.vim
ln -s ~/dotfiles/.bashrc ~/.bashrc
ln -s ~/dotfiles/.inputrc ~/.inputrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/.config/lvim/config.lua ~/.config/lvim/config.lua
