vim.opt.termguicolors = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true

vim.o.tabstop = 2
vim.o.shiftwidth = vim.o.tabstop
vim.o.breakindent = true
vim.o.expandtab = true

vim.o.inccommand = "nosplit"

vim.o.wildmenu = true

vim.cmd [[set undofile]]

vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

vim.o.clipboard = "unnamedplus"

vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 999

vim.g.gruvbox_material_better_performance = true
vim.g.gruvbox_material_enable_bold = true
vim.g.gruvbox_material_enable_italic = true

vim.cmd.colorscheme("gruvbox-material")

require'colorizer'.setup()
require('nvim-autopairs').setup()
require('todo-comments').setup{}
require('presence'):setup()

vim.keymap.set({ 'n', 'i', 'o' }, ',d', '<esc>', { silent = true })
vim.keymap.set('t', '<esc>', '<C-\\><C-N>', { silent = true })
