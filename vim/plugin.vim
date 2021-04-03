if has('win32')
    call plug#begin('~/AppData/Local/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'makerj/vim-pdf'
Plug 'djoshea/vim-autoread'
Plug 'honza/vim-snippets'
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'
Plug 'pboettch/vim-cmake-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'gko/vim-coloresque'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'segeljakt/vim-silicon'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'luochen1990/rainbow'
Plug 'easymotion/vim-easymotion'
Plug 'ryanoasis/vim-devicons'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'mfussenegger/nvim-dap-python'
Plug 'lervag/vimtex'
call plug#end()
