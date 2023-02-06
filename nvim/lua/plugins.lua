local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
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
  use 'mfussenegger/nvim-dap' -- Debugger support
  use 'David-Kunz/jester' -- Run test written with jest
  use 'udalov/kotlin-vim' -- Kotlin support
  use { 'williamboman/mason.nvim' } -- install external components(e.g. lsp)
  use { 'williamboman/mason-lspconfig.nvim' } -- mason lspconfig bridge
  use { 'windwp/nvim-ts-autotag' } -- Autoclose & Autorename html tag
  use { 'andrewstuart/vim-kubernetes' } -- k8s Support
  use { 'ziglang/zig.vim' } -- Zig support
  use {
    'antosha417/nvim-lsp-file-operations',
    requires = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-tree/nvim-tree.lua" },
    }
  } -- File operation support with nvim-tree
  use { 'hrsh7th/nvim-cmp' } -- Autocomplete
  use { 'hrsh7th/cmp-nvim-lsp' } -- LSP source for nvim-cmp
  use { 'saadparwaiz1/cmp_luasnip'} -- Snippets source for nvim-cmp
  use { 'L3MON4D3/LuaSnip' } -- Snippets plugin
  
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
  -- use 'lewis6991/gitsigns.nvim' -- Sign for git status
  use 'airblade/vim-gitgutter' -- Sign for git status
  use 'folke/todo-comments.nvim' -- Highlights TODO-ish comments
  use 'RishabhRD/popfix' -- Nvim lua high-level popup api
  use 'nvim-lua/popup.nvim' -- Nvim lua popup api
  use 'stevearc/dressing.nvim' -- Improve default UI
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
  use { 'sainnhe/gruvbox-material' }
  use { 'luukvbaal/stabilize.nvim', config = function() require('stabilize').setup() end } -- Stablize UI movement
  use { 'theHamsta/nvim-dap-virtual-text', config = function() require('nvim-dap-virtual-text').setup() end } -- Shows debug info using virtual text
  use { 'rcarriga/nvim-dap-ui', config = function() require('dapui').setup() end } -- Debug UI
  use { 'j-hui/fidget.nvim', config = function() require('fidget').setup{} end } -- LSP Progress UI
  use { 'lukas-reineke/indent-blankline.nvim' } -- Show ident line
  use {
    'kdheepak/tabline.nvim',
    requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
  }
  use { 'folke/twilight.nvim', config = function() require('twilight').setup {} end } -- Dim inactive code portion
  use { 'folke/zen-mode.nvim', config = function() require('zen-mode').setup {} end } -- Zen mode
  use { 'liuchengxu/vista.vim' } -- Symbol sidebar
  use {
    'nvim-orgmode/orgmode',
    requires = {
      'nvim-treesitter/nvim-treesitter'
    },
    config = function()
      require('orgmode').setup{}
    end,
  }

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
  use 'dinhhuy258/git.nvim' -- Git support
  use 'rcarriga/nvim-notify'
  use 'kkharji/sqlite.lua'
  use {
    "kode-team/mastodon.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "rcarriga/nvim-notify",
      "kkharji/sqlite.lua",
    },
    config = function()
      require("mastodon").setup()
    end
  }

  if not(string.find(vim.loop.os_uname().sysname, "Windows")) then
    use { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" } -- Shows lsp diagnostics
  end

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
