set runtimepath^=~/.dotfiles/nvim/lua
let &packpath=&runtimepath

lua require('impatient')
lua require('boot')

source ~/.dotfiles/nvim/vim/others.vim
source ~/.dotfiles/nvim/vim/rzip.vim
source ~/.dotfiles/nvim/vim/airline.vim
source ~/.dotfiles/nvim/vim/dbui.vim

