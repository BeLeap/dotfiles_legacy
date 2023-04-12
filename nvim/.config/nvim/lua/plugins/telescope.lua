return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		cmd = "Telescope",
		keys = {
			{
				"<leader>tl",
				function()
					require("telescope.builtin").builtin()
				end,
				silent = true,
			},
			{
				"<leader>tf",
				function()
					require("telescope.builtin").find_files()
				end,
				silent = true,
			},
			{
				"<leader>tg",
				function()
					require("telescope.builtin").live_grep()
				end,
				silent = true,
			},
			{
				"<leader>tb",
				function()
					require("telescope.builtin").buffers()
				end,
				silent = true,
			},
			{
				"<leader>th",
				function()
					require("telescope.builtin").help_tags()
				end,
				silent = true,
			},
			{
				"<leader>tb",
				function()
					require("telescope.builtin").git_branches()
				end,
				silent = true,
			},
		},
		config = function()
			require("telescope").setup({
				defaults = {
					dynamic_preview_title = true,
					mappings = {
						-- i = { ["<c-t>"] = trouble.open_with_trouble },
						-- n = { ["<c-t>"] = trouble.open_with_trouble },
					},
					layout_config = {
						vertical = { width = 0.5 },
					},
				},
				pickers = {
					find_files = {
						theme = "dropdown",
					},
				},
			})

			vim.g.dashboard_default_executive = "telescope.nvim"
		end,
	},
}
