set runtimepath^=~/.config/nvim/lua
let &packpath=&runtimepath

source ~/.dotfiles/nvim/vim/plugins.vim

lua require('impatient')

source ~/.dotfiles/nvim/vim/others.vim
source ~/.dotfiles/nvim/vim/saga.vim
source ~/.dotfiles/nvim/vim/trouble.vim
source ~/.dotfiles/nvim/vim/rzip.vim
source ~/.dotfiles/nvim/vim/airline.vim
source ~/.dotfiles/nvim/vim/nvimtree.vim

lua require('boot')
