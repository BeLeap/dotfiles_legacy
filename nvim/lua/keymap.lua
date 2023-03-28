vim.keymap.set("i", "<leader>q", "<esc>:q<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":q<cr>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-q>", "<esc>:bd<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-q>", ":bd<cr>", { noremap = true, silent = true })

vim.keymap.set("i", "<C-s>", "<esc>:update<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", ":update<cr>", { noremap = true, silent = true })

vim.keymap.set("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true, noremap = true, silent = true })
vim.keymap.set("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true, noremap = true, silent = true })

vim.keymap.set("t", "jj", "<C-\\><C-N>", { silent = true })
vim.keymap.set("t", "jk", "<C-\\><C-N>", { silent = true })
