local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- UI
	require("sidebar-conf"),
	require("colorscheme-conf"),
	require("treesitter-conf")["nvim-treesitter"],

	-- Language
	require("language-support")["neovim/nvim-lspconfig"],
	require("language-support")["j-hui/fidget.nvim"],
	require("language-support")["hrsh7th/nvim-cmp"],
	require("language-support")["someone-stole-my-name/yaml-companion.nvim"],
	require("language-support")["williamboman/mason.nvim"],
	require("language-support")["williamboman/mason-lspconfig.nvim"],
	require("language-support")["windwp/nvim-autopairs"],
}, {
	install = {
		colorscheme = { "gruvbox" },
	},
})
