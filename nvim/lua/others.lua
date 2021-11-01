vim.opt.termguicolors = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.tabstop = 2
vim.o.shiftwidth = vim.o.tabstop
vim.o.breakindent = true
vim.o.expandtab = true

vim.o.inccommand = "nosplit"

vim.wo.number = true

vim.o.mouse = "a"

vim.o.wildmenu = true

vim.cmd [[set undofile]]

vim.o.updatetime = 250
vim.wo.signcolumn = "yes"

-- vim.o.clipboard = vim.o.clipboard .. "unnamedplus"
vim.o.relativenumber = true
vim.o.number = true
vim.o.scrolloff = 999

require'colorizer'.setup()

require('nvim-autopairs').setup()

local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
      return npairs.esc("<cr>")
  else
    return npairs.autopairs_cr()
  end
end


remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

require('telescope').setup{}
require'nvim-treesitter.configs'.setup {
	-- Modules and its options go here
	highlight = { enable = true },
	incremental_selection = { enable = true },
	textobjects = { enable = true },
}


local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

-- Mappings.
local opts = { noremap=true, silent=true }

-- See `:help vim.lsp.*` for documentation on any of the below functions
buf_set_keymap('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', opts)
buf_set_keymap('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', opts)
buf_set_keymap('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', opts)
buf_set_keymap('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', opts)

