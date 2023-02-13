vim.keymap.set("n", "<leader>bt", function()
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
vim.keymap.set("n", "<leader>t", function()
	local terminal = require("toggleterm.terminal")
	local wdTerminal = terminal.get_or_create_term(1)

	vim.keymap.set(
		"t",
		",d",
		"<c-\\><c-N>:ToggleTerm<cr>",
		{ silent = true, noremap = true, buffer = wdTerminal.bufnr }
	)

	wdTerminal:toggle()
end, { noremap = true, silent = true })
