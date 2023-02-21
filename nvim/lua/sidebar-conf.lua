vim.keymap.set("n", "<leader>i", function()
	require("sidebar-nvim").toggle()
end, { noremap = true, silent = true })

require("sidebar-nvim").setup({
	open = true,
	sections = {
		"buffers",
		"git",
		"files",
		"symbols",
		"diagnostics",
		"todos",
	},
})
