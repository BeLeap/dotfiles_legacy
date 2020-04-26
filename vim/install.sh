#!/bin/bash
echo "[LINK] vim config"
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
echo "[PROCESS] create vim config directory"
cd ~/
mkdir .vim
echo "[LINK] coc.nvim config"
ln -s ~/dotfiles/vim/coc-settings.json ~/.vim/coc-settings.json
echo "[INSTALL] vim, ccls requirements(apt)"
sudo apt install vim-gtk cmake zlib1g-dev libncurses-dev rapidjson-dev clang libclang-dev libncurses5 -y
echo "[CHANGE_DIR] home"
cd ~/
echo "[INSTALL] vim-plug(git)"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "[INSTALL] vim plugins(vim-plug)"
vim +PlugInstall +qall
echo "[CHANGE_DIR] home"
cd ~/
echo "[INSTALL] ccls(apt)"
sudo apt install ccls
