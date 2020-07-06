"Others
set encoding=utf-8
set hlsearch
set cindent		
set autoindent
set smartindent
set tabstop=4
set expandtab
set smarttab
set shiftwidth=4
set laststatus=2
set scrolloff=100
set wildmenu
set ignorecase
set smartcase
syntax on
hi Visual term=reverse cterm=reverse guibg=Grey
set autoread
set confirm
nnoremap q: <nop>
nnoremap Q <nop>
set mouse=a
autocmd BufEnter *.v :setlocal filetype=systemverilog

set number relativenumber

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BUfLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

set clipboard=unnamedplus
