vim.keymap.set("n", "<leader>bt", function()
	local terminal = require("toggleterm.terminal")
	local bufferWd = vim.fn.expand("%:p:h")
	local bufferTerminal = terminal.get_or_create_term(1, bufferWd)

	vim.keymap.set(
		"t",
		",c",
		"<c-\\><c-N>:ToggleTerm<cr>",
		{ silent = true, noremap = true, buffer = bufferTerminal.bufnr }
	)
	vim.keymap.set("t", ",d", "<c-\\><c-N>", { silent = true, noremap = true, buffer = bufferTerminal.bufnr })

	local size = vim.api.nvim_win_get_height(0)
	bufferTerminal:toggle(size / 2)
end, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>t", function()
	local terminal = require("toggleterm.terminal")
	local wdTerminal = terminal.get_or_create_term(1)

	vim.keymap.set(
		"t",
		",d",
		"<c-\\><c-N>:ToggleTerm<cr>",
		{ silent = true, noremap = true, buffer = wdTerminal.bufnr }
	)

	local size = vim.api.nvim_win_get_height(0)
	wdTerminal:toggle(size / 2)
end, { noremap = true, silent = true })
