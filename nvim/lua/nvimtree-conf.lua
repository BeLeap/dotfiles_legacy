vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sync_root_with_cwd = true,
  reload_on_bufenter = true,
  git = {
    ignore = false,
  },
})

vim.keymap.set(
  'n',
  '<leader>e',
  function()
    local nvimtree_api = require("nvim-tree.api")
    nvimtree_api.tree.toggle()
    print('hi')
  end
)
