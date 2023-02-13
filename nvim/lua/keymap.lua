vim.keymap.set("i", "<C-q>", "<esc>:q<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-q>", ":q<cr>", { noremap = true, silent = true })
vim.keymap.set("i", "<leader>q", "<esc>:bd<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":bd<cr>", { noremap = true, silent = true })

vim.keymap.set("i", "<C-s>", "<esc>:update<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", ":update<cr>", { noremap = true, silent = true })

vim.keymap.set("i", "<Tab>", 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true, noremap = true, silent = true })
vim.keymap.set("i", "<S-Tab>", 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', { expr = true, noremap = true, silent = true })

vim.keymap.set({ "n", "i", "o" }, ",d", "<esc>", { silent = true, remap = true })
vim.keymap.set("t", ",d", "<C-\\><C-N>", { silent = true })

vim.keymap.set("n", "<leader>t", function()
	local terminal = require("toggleterm.terminal")
	local bufferWd = vim.fn.expand("%:p:h")
	local bufferTerminal = terminal.get_or_create_term(1, bufferWd)

	vim.keymap.set(
		"t",
		",d",
		"<c-\\><c-N>:ToggleTerm<cr>",
		{ silent = true, noremap = true, buffer = bufferTerminal.bufnr }
	)

	bufferTerminal:toggle()
end, { noremap = true, silent = true })
