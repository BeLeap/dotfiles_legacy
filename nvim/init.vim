set runtimepath^=~/.config/nvim/lua
let &packpath=&runtimepath

lua require'boot'

source ~/.config/nvim/vim/coc.vim
