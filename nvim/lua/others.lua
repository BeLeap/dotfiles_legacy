vim.opt.termguicolors = true

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.tabstop = 4
vim.o.shiftwidth = vim.o.tabstop
vim.g.mapleader = ";"
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

require'nvim-autopairs'.setup()
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

-- skip it, if you use another global object
_G.MUtils= {}

vim.g.completion_confirm_key = ""

MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      require'completion'.confirmCompletion()
      return npairs.esc("<c-y>")
    else
      vim.api.nvim_select_popupmenu_item(0 , false , false ,{})
      require'completion'.confirmCompletion()
      return npairs.esc("<c-n><c-y>")
    end
  else
    return npairs.autopairs_cr()
  end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})


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

