#!/bin/sh

git clone https://github.com/BeLeap/dotfiles ~/dotfiles
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

mkdir ~/.config
mkdir ~/.config/fish

ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -s ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

sudo pacman -Syu
sudo pacman -S fish tmux fd-find fzf

chsh -s /usr/bin/fish $USER

vim +PlugInstall +qall
~/.tmux/plugins/tpm/bin/install_plugins
