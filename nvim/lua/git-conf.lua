return {
	["pwntester/octo.nvim"] = {
		"pwntester/octo.nvim",
		config = function()
			require("octo").setup()
		end,
	},
	["airblade/vim-gitgutter"] = {
		"airblade/vim-gitgutter",
	},
	["dinhhuy258/git.nvim"] = {
		"dinhhuy258/git.nvim",
		config = function()
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
		end,
	},
	["TimUntersberger/neogit"] = {
		"TimUntersberger/neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", silent = true },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
		},
		config = function()
			require("neogit").setup({
				integrations = {
					diffview = true,
				},
			})
		end,
	},
}
