set runtimepath^=~/.config/nvim/lua
let &packpath=&runtimepath

lua require'boot'

source ./vim/coc.vim
