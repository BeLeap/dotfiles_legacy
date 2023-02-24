if vim.loop.os_uname().sysname == "Windows_NT" then
	local powershell_options = {
		shell = vim.fn.executable("pwsh") and "pwsh" or "powershell",
		shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
		shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
		shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
		shellquote = "",
		shellxquote = "",
	}

	for option, value in pairs(powershell_options) do
		vim.opt[option] = value
	end
end

vim.keymap.set("n", "<leader>t", ":ToggleTerm<cr>", { noremap = true, silent = true })
vim.keymap.set("n", [[<c-\>]], ":ToggleTerm<cr>", { noremap = true, silent = true })

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", ",d", [[<c-\><c-n>]], opts)
	vim.keymap.set("t", ",c", [[<c-\><c-n>:ToggleTerm<cr>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
