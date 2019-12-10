#!/bin/sh

git clone https://github.com/BeLeap/dotfiles ~/dotfiles

ln -s ./vim/.vimrc ~/.vimrc
ln -s ./fish/config.fish ~/.config/fish/config.fish
ln -s ./tmux/.tmux.conf ~/.tmux.conf
