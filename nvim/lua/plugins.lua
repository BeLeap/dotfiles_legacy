-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Language Support
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function() require'nvim-treesitter.configs'.setup {
    highlight = {
      enabled = true,
    },
    incremental_selection = {
      enabled = true,
    },
    indent = {
      enabled = true,
    },
    rainbow = {
      enabled = true, -- 'p00f/nvim-ts-rainbow'
    },
  } end } -- Language parser for Highlighting, etc...
  use 'romgrk/nvim-treesitter-context' -- Shows current context using TreeSitter
  use { 'michaelb/sniprun', run = 'bash ./install.sh'} -- Select & Run (like REPL)
  use 'windwp/nvim-autopairs' -- Auto-close parentheses
  use 'lbrayner/vim-rzip' -- Zip file format support (for yarn berry)
  use 'editorconfig/editorconfig-vim' -- Use editorconfig
  use 'sbdchd/neoformat' -- Format codes
  use 'dmix/elvish.vim' -- Elvish language support
  use 'towolf/vim-helm' -- Helm chart support
  use 'hashivim/vim-terraform' -- Terraform support
  use 'simrat39/rust-tools.nvim' -- Rust support
  use 'mhinz/vim-crates' -- Check rust crates
  use 'mfussenegger/nvim-jdtls' -- JVM language supports
  use 'github/copilot.vim' -- Autocomplete with AI
  use 'tpope/vim-dadbod' -- DB support
  use 'fatih/vim-go' -- Go support
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end } -- Comment out
  use { 'lewis6991/spellsitter.nvim', config = function() require('spellsitter').setup() end } -- Spell checker
  use 'mfussenegger/nvim-dap' -- Debugger support
  use 'David-Kunz/jester' -- Run test written with jest
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  
  -- UI
  use { 'nvim-telescope/telescope.nvim', config = function() require('telescope').setup{} end } -- Shows files, buffers, live greps
  use 'p00f/nvim-ts-rainbow' -- Rainbow parentheses using Treesitter
  use 'norcalli/nvim-colorizer.lua' -- Color color names
  use 'vim-airline/vim-airline' -- Use airline
  use 'vim-airline/vim-airline-themes' -- Airline themes
  use 'ryanoasis/vim-devicons' -- Better icons
  use 'kyazdani42/nvim-web-devicons' -- Better icons
  use 'pwntester/octo.nvim' -- Github support
  use 'kristijanhusak/vim-dadbod-ui' -- UI for 'tpope/vim-dadbod'
  use 'lewis6991/gitsigns.nvim' -- Sign for git status
  use 'lukas-reineke/indent-blankline.nvim' -- Shows blankline
  use 'TimUntersberger/neogit' -- Git UI
  use 'folke/todo-comments.nvim' -- Highlights TODO-ish comments
  use 'RishabhRD/popfix' -- Nvim lua high-level popup api
  use 'nvim-lua/popup.nvim' -- Nvim lua popup api
  use 'stevearc/dressing.nvim' -- Improve default UI
  use { 'kyazdani42/nvim-tree.lua', config = function() require'nvim-tree'.setup {} end } -- Shows file tree
  use 'andersevenrud/nordic.nvim' -- Nord theme
  use 'tveskag/nvim-blame-line' -- Git blame line
  use { 'luukvbaal/stabilize.nvim', config = function() require('stabilize').setup() end } -- Stablize UI movement
  use { 'theHamsta/nvim-dap-virtual-text', config = function() require('nvim-dap-virtual-text').setup() end } -- Shows debug info using virtual text
  use { 'rcarriga/nvim-dap-ui', config = function() require('dapui').setup() end } -- Debug UI
  use { 'j-hui/fidget.nvim', config = function() require('fidget').setup{} end } -- LSP Progress UI

  -- Others
  use 'tpope/vim-sensible' -- Default config that Sensible
  use 'svermeulen/vimpeccable' -- Help writing vimrc in lua
  use 'nvim-lua/plenary.nvim' -- Nvim lua helper function
  use 'easymotion/vim-easymotion' -- Easymotion
  use 'lewis6991/impatient.nvim' -- Improves startup time
  use { 'junegunn/fzf', run = 'fzf#install()' } -- Fzf
  use 'junegunn/fzf.vim' -- Fzf for vim
  use 'mg979/vim-visual-multi' -- Easy select multi-line (sublime-like)
  use 'wakatime/vim-wakatime' -- Track work time
  use { 'nacro90/numb.nvim', config = function() require('numb').setup() end } -- Go to line with :number
  use 'rmagatti/auto-session' -- Auto session manager
end)
