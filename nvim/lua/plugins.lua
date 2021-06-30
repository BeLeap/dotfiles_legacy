vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer manage itself
    use 'wbthomason/packer.nvim'

    -- Make easier configure vim with lua
    use 'svermeulen/vimpeccable'
    use 'morhetz/gruvbox'
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- Code
	use 'nvim-treesitter/nvim-treesitter'
	use 'romgrk/nvim-treesitter-context'
    use 'simrat39/rust-tools.nvim'
	use 'p00f/nvim-ts-rainbow'
	use 'norcalli/nvim-colorizer.lua'
	use 'norcalli/snippets.nvim'
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
    use {
      'lewis6991/spellsitter.nvim',
      config = function()
        require('spellsitter').setup()
      end
    }
	use 'RishabhRD/popfix'
	use 'neoclide/coc.nvim'

    -- UI
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'
    use 'akinsho/nvim-bufferline.lua'
    use 'shaunsingh/nord.nvim'
    use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
	use 'mhinz/vim-startify'

	-- Easier Movement
	use 'easymotion/vim-easymotion'
end)
