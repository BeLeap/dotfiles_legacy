require("octo").setup()
require("git").setup({
	keymaps = {
		blame = "<Leader>gb",
		quit_blame = "q",
		blame_commit = "<CR>",
		browse = "<Leader>go",
		open_pull_request = "<Leader>gp",
		create_pull_request = "<Leader>gn",
		diff = "<Leader>gd",
		diff_close = "<Leader>gD",
		revert = "<Leader>gr",
		revert_file = "<Leader>gR",
	},
	target_branch = "main",
})
require("neogit").setup({
	integrations = {
		diffview = true,
	},
})

vim.keymap.set("n", "<leader>gg", ":LazyGit<cr>", { silent = true, noremap = true })
