set runtimepath^=~/.config/nvim/lua
let &packpath=&runtimepath

lua require('boot')

source ~/.dotfiles/nvim/vim/others.vim
source ~/.dotfiles/nvim/vim/saga.vim
source ~/.dotfiles/nvim/vim/trouble.vim

