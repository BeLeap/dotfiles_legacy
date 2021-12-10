call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'svermeulen/vimpeccable'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'romgrk/nvim-treesitter-context'
Plug 'simrat39/rust-tools.nvim'
Plug 'p00f/nvim-ts-rainbow'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'michaelb/sniprun'
Plug 'windwp/nvim-autopairs'
Plug 'folke/todo-comments.nvim',
Plug 'RishabhRD/popfix'
Plug 'lbrayner/vim-rzip'
Plug 'editorconfig/editorconfig-vim'
Plug 'sbdchd/neoformat'
Plug 'easymotion/vim-easymotion'
Plug 'lewis6991/impatient.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dmix/elvish.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'towolf/vim-helm'
Plug 'hashivim/vim-terraform'
Plug 'mhinz/vim-crates'
Plug 'mfussenegger/nvim-jdtls'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'github/copilot.vim'
Plug 'folke/todo-comments.nvim'
Plug 'pwntester/octo.nvim'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'mg979/vim-visual-multi'
Plug 'lewis6991/gitsigns.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'TimUntersberger/neogit'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'wakatime/vim-wakatime'
Plug 'numToStr/Comment.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'andersevenrud/nordic.nvim'
Plug 'lewis6991/spellsitter.nvim'
Plug 'tveskag/nvim-blame-line'
Plug 'nacro90/numb.nvim'
Plug 'rmagatti/auto-session'
Plug 'luukvbaal/stabilize.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'
Plug 'David-Kunz/jester'
call plug#end()

lua << LUA
require('Comment').setup()
require('nvim-tree').setup()
require('spellsitter').setup()
require('numb').setup()
require('stabilize').setup()
require('nvim-dap-virtual-text').setup()
require('dapui').setup()
LUA
