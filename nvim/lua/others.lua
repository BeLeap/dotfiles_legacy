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

vim.wo.number = true

-- vim.o.mouse = "a"

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

local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

-- Mappings.
local opts = { noremap=true, silent=true }

require('todo-comments').setup{}
require('octo').setup()
-- require('gitsigns').setup()
-- require('indent_blankline').setup{
--   show_end_of_line = false,
-- }

require('nvim-ts-autotag').setup()
require('nvim-treesitter.configs').setup {
  highlight = { enable = true },
  incremental_selection = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true },
}

require('presence'):setup({
  blacklist = {
    'mindslab',
  }
})
require('git').setup({
  keymaps = {
    -- Open blame window
    blame = "<Leader>gb",
    -- Close blame window
    quit_blame = "q",
    -- Open blame commit
    blame_commit = "<CR>",
    -- Open file/folder in git repository
    browse = "<Leader>go",
    -- Open pull request of the current branch
    open_pull_request = "<Leader>gp",
    -- Create a pull request with the target branch is set in the `target_branch` option
    create_pull_request = "<Leader>gn",
    -- Opens a new diff that compares against the current index
    diff = "<Leader>gd",
    -- Close git diff
    diff_close = "<Leader>gD",
    -- Revert to the specific commit
    revert = "<Leader>gr",
    -- Revert the current file to the specific commit
    revert_file = "<Leader>gR",
  },
  -- Default target branch when create a pull request
  target_branch = "master",
})
