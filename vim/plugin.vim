call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'jnurmine/Zenburn'
Plug 'makerj/vim-pdf'
Plug 'Quramy/tsuquyomi'
Plug 'neovimhaskell/haskell-vim'
Plug 'djoshea/vim-autoread'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'rhysd/vim-clang-format'
Plug 'kana/vim-operator-user'
Plug 'beautify-web/js-beautify'
Plug 'rust-lang/rust.vim'
Plug 'pboettch/vim-cmake-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'lervag/vimtex'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
