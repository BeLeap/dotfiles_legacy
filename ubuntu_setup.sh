#!/bin/sh

git clone https://github.com/BeLeap/dotfiles ~/dotfiles
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir ~/.config
mkdir ~/.config/fish

ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

sudo apt update
sudo apt upgrade -y
sudo apt install -y fish tmux vim fd-find #will be work over ubuntu 19.04

chsh -s /usr/bin/fish $USER

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

vim +PlugInstall +qall
~/.tmux/plugins/tpm/bin/install_plugins
