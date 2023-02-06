-- local dap = require('dap')
-- dap.adapters.node2 = {
--   type = 'executable',
--   command = 'node',
--   args = {os.getenv('HOME') .. '/.dap/vscode-node-debug2/out/src/nodeDebug.js'}
-- }

vim.keymap.set(
  'n', '<f9>',
  function()
    require('dap').toggle_breakpoint()
  end,
  { silent = true }
)
vim.keymap.set(
  'n', '<f5>',
  function()
    require('dap').continue()
  end,
  { silent = true }
)
vim.keymap.set(
  'n', '<f10>',
  function()
    require('dap').step_over()
  end,
  { silent = true }
)
vim.keymap.set(
  'n', '<f11>',
  function()
    require('dap').step_into()
  end,
  { silent = true }
)
vim.keymap.set(
  'n', '<leader>db',
  function()
    require('dapui').toggle()
  end,
  { silent = true }
)
