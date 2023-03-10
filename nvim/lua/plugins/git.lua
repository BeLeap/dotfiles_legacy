return {
	{
		"pwntester/octo.nvim",
		event = { "BufEnter" },
		config = true,
	},
	{
		"dinhhuy258/git.nvim",
		cmd = "Git",
		opts = {
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
		},
	},
	{
		"TimUntersberger/neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", silent = true },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		opts = {
			integrations = {
				diffview = true,
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufEnter" },
		config = function()
			require("gitsigns").setup()
		end,
	},
}
