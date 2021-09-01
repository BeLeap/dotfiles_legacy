vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer manage itself
	use 'wbthomason/packer.nvim'

	-- Make easier configure vim with lua
	use 'svermeulen/vimpeccable'
	use 'morhetz/gruvbox'
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim' use 'nvim-telescope/telescope.nvim'
	use {
		   "folke/which-key.nvim",
			config = function() require("which-key").setup {} end
	}

	-- Code
	use 'nvim-treesitter/nvim-treesitter'
	use 'romgrk/nvim-treesitter-context'
	use 'simrat39/rust-tools.nvim'
	use 'p00f/nvim-ts-rainbow'
	use 'norcalli/nvim-colorizer.lua'
	use { 'michaelb/sniprun', run = 'bash ./install.sh'}
	use 'windwp/nvim-autopairs'
	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {
			}
		end
	}
	use 'RishabhRD/popfix'
	use 'peterhurford/send.vim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-compe'
	use 'nvim-lua/lsp-status.nvim'
	use 'hrsh7th/vim-vsnip'
    use 'lbrayner/vim-rzip'
    use 'editorconfig/editorconfig-vim'

	-- UI
	use 'kyazdani42/nvim-tree.lua'
	use 'kyazdani42/nvim-web-devicons'
	use 'akinsho/nvim-bufferline.lua'
	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	use 'mhinz/vim-startify'
	use 'tveskag/nvim-blame-line'
	use 'tjdevries/colorbuddy.vim'
	use 'Th3Whit3Wolf/onebuddy'
	use 'kosayoda/nvim-lightbulb'
	use 'sbdchd/neoformat'
	use 'glepnir/lspsaga.nvim'
	use { 
		'onsails/lspkind-nvim', 
		config = function()
			require('lspkind').init()
		end
	}
	use {
		   "folke/trouble.nvim",
		   requires = "kyazdani42/nvim-web-devicons",
		   config = function() require("trouble").setup {} end
	}

	-- Easier Movement
	use 'easymotion/vim-easymotion'

    -- Others
    use 'lewis6991/impatient.nvim'
end)
