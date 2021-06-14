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
    use 'neovim/nvim-lsp'
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
	use 'nvim-treesitter/nvim-treesitter'
	use 'romgrk/nvim-treesitter-context'
    use 'simrat39/rust-tools.nvim'
	use 'p00f/nvim-ts-rainbow'
	use 'norcalli/nvim-colorizer.lua'
	use 'nvim-lua/completion-nvim'
	use 'hrsh7th/vim-vsnip'

    -- UI
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'
    use 'akinsho/nvim-bufferline.lua'
    use 'shaunsingh/nord.nvim'
    use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

	-- Easier Movement
	use 'easymotion/vim-easymotion'
end)
