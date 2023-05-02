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
		"lewis6991/gitsigns.nvim",
		event = { "BufEnter" },
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"TimUntersberger/neogit",
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = true,
	},
	{
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		dependencies = "nvim-lua/plenary.nvim",
	},
	{
		"ldelossa/gh.nvim",
		event = "VeryLazy",
		dependencies = { "ldelossa/litee.nvim" },
		config = function()
			require("litee.lib").setup()
			require("litee.gh").setup()
		end,
	},
}
