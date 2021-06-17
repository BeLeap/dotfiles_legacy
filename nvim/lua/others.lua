vim.opt.termguicolors = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.tabstop = 4
vim.o.shiftwidth = vim.o.tabstop
vim.o.breakindent = true

vim.o.inccommand = "nosplit"

vim.wo.number = true

vim.o.mouse = "a"

vim.o.wildmenu = true

vim.cmd [[set undofile]]

vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

vim.o.clipboard = vim.o.clipboard .. "unnamedplus"
vim.o.relativenumber = true

require'nord'.set()
require'colorizer'.setup()

require'bufferline'.setup{
	diagnostics = "nvim_lsp",
	sections = {
		lualine_c = { "nvim_treesitter#statusline(90)" }
	}
}

require'lualine'.setup {
	options = {
		theme = 'nord'
	},
	extensions = { 'quickfix', 'nvim-tree' }
}

