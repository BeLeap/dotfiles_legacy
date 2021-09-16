local keymap = vim.api.nvim_set_keymap
local delkeymap = vim.api.nvim_del_keymap

keymap('i', '<C-q>', '<esc>:q<cr>', { noremap = true, silent = true })
keymap('n', '<C-q>', ':q<cr>', { noremap = true, silent = true })
keymap('i', '<leader>q', '<esc>:bd<cr>', { noremap = true, silent = true })
keymap('n', '<leader>q', ':bd<cr>', { noremap = true, silent = true })
keymap('i', '<leader>d', '<esc>', { noremap = true, silent = true })

keymap('i', '<C-s>', '<esc>:update<cr>', { noremap = true, silent = true })
keymap('n', '<C-s>', ':update<cr>', { noremap = true, silent = true })

keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true, noremap = true, silent = true })
keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true, noremap = true, silent = true })
