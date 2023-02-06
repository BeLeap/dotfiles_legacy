-- local trouble = require('trouble.provider.telescope')

require('telescope').setup{
  defaults = {
    mappings = {
      -- i = { ["<c-t>"] = trouble.open_with_trouble },
      -- n = { ["<c-t>"] = trouble.open_with_trouble },
    },
    layout_config = {
      vertical = { width = 0.5 }
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown"
    }
  }
}

vim.g.dashboard_default_executive = 'telescope.nvim'
vim.keymap.set(
  'n', '<leader>f',
  function()
    require('telescope.builtin').find_files()
  end,
  { silent = true }
)
vim.keymap.set(
  'n', '<leader>l',
  function()
    require('telescope.builtin').live_grep()
  end,
  { silent = true }
)
vim.keymap.set(
  'n', '<leader>b',
  function()
    require('telescope.builtin').buffers()
  end,
  { silent = true }
)
vim.keymap.set(
  'n', '<leader>h',
  function()
    require('telescope.builtin').help_tags()
  end,
  { silent = true }
)

