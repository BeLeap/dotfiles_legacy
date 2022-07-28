local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Language Support
  use 'neovim/nvim-lspconfig' -- LSP Support
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Language parser for Highlighting, etc...
  use 'romgrk/nvim-treesitter-context' -- Shows current context using TreeSitter
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
  use 'tpope/vim-dadbod' -- DB support
  use 'fatih/vim-go' -- Go support
  use { 'numToStr/Comment.nvim', config = function() require('Comment').setup() end } -- Comment out
  use { 'lewis6991/spellsitter.nvim', config = function() require('spellsitter').setup() end } -- Spell checker
  use({ "https://git.sr.ht/~whynothugo/lsp_lines.nvim", }) -- Shows lsp diagnostics
  use 'mfussenegger/nvim-dap' -- Debugger support
  use 'David-Kunz/jester' -- Run test written with jest
  use 'udalov/kotlin-vim' -- Kotlin support
  use { 'ms-jpq/coq_nvim', branch = 'coq' } -- Compeletion
  use { 'ms-jpq/coq.artifacts', branch = 'artifacts' }
  use { 'ms-jpq/coq.thirdparty', branch = '3p' }
  use { 'williamboman/mason.nvim' } -- install external components(e.g. lsp)
  
  -- UI
  use { 'iamcco/markdown-preview.nvim', run = function() vim.fn["mkdp#util#install"]() end } -- Show markdown preview
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} }} -- Shows files, buffers, live greps
  use 'p00f/nvim-ts-rainbow' -- Rainbow parentheses using Treesitter
  use 'norcalli/nvim-colorizer.lua' -- Color color names
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'ryanoasis/vim-devicons' -- Better icons
  use 'kyazdani42/nvim-web-devicons' -- Better icons
  use 'pwntester/octo.nvim' -- Github support
  use 'kristijanhusak/vim-dadbod-ui' -- UI for 'tpope/vim-dadbod'
  use 'lewis6991/gitsigns.nvim' -- Sign for git status
  use 'TimUntersberger/neogit' -- Git UI
  use 'folke/todo-comments.nvim' -- Highlights TODO-ish comments
  use 'RishabhRD/popfix' -- Nvim lua high-level popup api
  use 'nvim-lua/popup.nvim' -- Nvim lua popup api
  use 'stevearc/dressing.nvim' -- Improve default UI
  use { 'ms-jpq/chadtree', branch = 'chad', run = 'python3 -m chadtree deps' }
  use { 'sainnhe/gruvbox-material' }
  use { 'luukvbaal/stabilize.nvim', config = function() require('stabilize').setup() end } -- Stablize UI movement
  use { 'theHamsta/nvim-dap-virtual-text', config = function() require('nvim-dap-virtual-text').setup() end } -- Shows debug info using virtual text
  use { 'rcarriga/nvim-dap-ui', config = function() require('dapui').setup() end } -- Debug UI
  use { 'j-hui/fidget.nvim', config = function() require('fidget').setup{} end } -- LSP Progress UI
  use { 'lukas-reineke/indent-blankline.nvim', tag = 'v2.18.4' } -- Show ident line
  use {
    'kdheepak/tabline.nvim',
    requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
  }
  use { 'folke/twilight.nvim', config = function() require('twilight').setup {} end } -- Dim inactive code portion
  use { 'folke/zen-mode.nvim', config = function() require('zen-mode').setup {} end } -- Zen mode

  -- Others
  use 'tpope/vim-sensible' -- Default config that Sensible
  use 'svermeulen/vimpeccable' -- Help writing vimrc in lua
  use 'nvim-lua/plenary.nvim' -- Nvim lua helper function
  use 'easymotion/vim-easymotion' -- Easymotion
  use 'lewis6991/impatient.nvim' -- Improves startup time
  use 'mg979/vim-visual-multi' -- Easy select multi-line (sublime-like)
  use 'wakatime/vim-wakatime' -- Track work time
  use { 'nacro90/numb.nvim', config = function() require('numb').setup() end } -- Go to line with :number
  use 'andweeb/presence.nvim' -- Discord Rich Presence
  use 'tpope/vim-fugitive' -- Git support

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
