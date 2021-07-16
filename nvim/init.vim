set runtimepath^=~/.config/nvim/lua
let &packpath=&runtimepath

lua require'boot'

source ~/.dotfiles/nvim/vim/coc.vim
