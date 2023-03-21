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

vim.o.undofile = true

vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

vim.o.clipboard = "unnamedplus"

vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 999

vim.cmd.colorscheme("catppuccin")

vim.o.splitbottom = true
vim.o.splitright = true

vim.api.nvim_create_user_command("BufOnly", '%bdelete|edit #|normal `"', {})
