local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Language Support
	use("mfussenegger/nvim-dap") -- Debugger support
	use("David-Kunz/jester") -- Run test written with jest
	use("ziontee113/syntax-tree-surfer")

	-- UI
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	}) -- Show markdown preview
	use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }) -- Shows files, buffers, live greps
	use("norcalli/nvim-colorizer.lua") -- Color color names
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })
	use("ryanoasis/vim-devicons") -- Better icons
	use("kyazdani42/nvim-web-devicons") -- Better icons
	use({
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup({})
		end,
	}) -- Shows debug info using virtual text
	use({
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup()
		end,
	}) -- Debug UI
	use({ "lukas-reineke/indent-blankline.nvim" }) -- Show ident line
	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({})
		end,
	}) -- Dim inactive code portion
	use({
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({})
		end,
	}) -- Zen mode
	use({
		"nvim-orgmode/orgmode",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"dhruvasagar/vim-table-mode",
		},
		config = function()
			require("orgmode").setup({})
		end,
	})

	-- Others
	use("tpope/vim-sensible") -- Default config that Sensible
	use("svermeulen/vimpeccable") -- Help writing vimrc in lua
	use("nvim-lua/plenary.nvim") -- Nvim lua helper function
	use("easymotion/vim-easymotion") -- Easymotion
	use("mg979/vim-visual-multi") -- Easy select multi-line (sublime-like)
	use("wakatime/vim-wakatime") -- Track work time
	use({
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	}) -- Go to line with :number
	use("andweeb/presence.nvim") -- Discord Rich Presence
	use("rcarriga/nvim-notify")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
