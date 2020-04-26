#!/bin/bash
echo "[LINK] vim config"
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
echo "[CHANGE_DIR] home"
cd ~/
echo "[INSTALL] vim-plug(git)"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "[INSTALL] vim plugins(vim-plug)"
vim +PlugInstall +qall
