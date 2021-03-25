let mapleader = ","

so ~/.dotfiles/vim/plugin.vim
so ~/.dotfiles/vim/color.vim
so ~/.dotfiles/vim/airline.vim
so ~/.dotfiles/vim/markdown.vim
so ~/.dotfiles/vim/asynctask.vim
so ~/.dotfiles/vim/coc.vim
so ~/.dotfiles/vim/keymap.vim
so ~/.dotfiles/vim/others.vim
so ~/.dotfiles/vim/snippets.vim
so ~/.dotfiles/vim/clang-format.vim
so ~/.dotfiles/vim/fzf.vim
so ~/.dotfiles/vim/tabs.vim
so ~/.dotfiles/vim/dap.vim

set encoding=UTF-8

if has('nvim')
    so ~/.dotfiles/vim/nvim.vim
endif

if has('win32')
    let g:python3_host_prog="C:\\Users\\ckdtj\\AppData\\Local\\Programs\\Python\\Python39\\python.exe"
    set shell=pwsh shellquote=( shellpipe=\| shellredir=> shellxquote=
    set shellcmdflag=-NoLogo\ -NoProfile\ -ExecutionPolicy\ RemoteSigned\ -Command
endif

if has("gui_running")
    set guioptions-="go-e"
endif

hi CocErrorHighlight ctermfg=White
