return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
		cmd = "Telescope",
		keys = {
			{
				"<leader>tl",
				function()
					require("telescope.builtin").builtin()
				end,
				silent = true,
				desc = "telescope builtin",
			},
			{
				"<leader>tf",
				function()
					require("telescope.builtin").find_files()
				end,
				silent = true,
				desc = "telescope find file",
			},
			{
				"<leader>tg",
				function()
					require("telescope.builtin").live_grep()
				end,
				silent = true,
				desc = "telescope live grep",
			},
			{
				"<leader>tb",
				function()
					require("telescope.builtin").buffers()
				end,
				silent = true,
				desc = "telescope buffers",
			},
			{
				"<leader>th",
				function()
					require("telescope.builtin").help_tags()
				end,
				silent = true,
				desc = "telescope helps",
			},
			{
				"<leader>tc",
				function()
					require("telescope.builtin").git_branches()
				end,
				silent = true,
				desc = "telescope git branches",
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
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--trim" -- add this value
					}
				},
				pickers = {
					find_files = {
						theme = "dropdown",
						find_command = {
							"fd",
							"--type",
							"f",
							"--no-ignore",
							"--hidden",
							"--strip-cwd-prefix",
							"--exclude",
							"**/.git/*",
						},
					},
					live_grep = {
						glob_pattern = {
							"!.git/*",
						},
						additional_args = {
							"--no-ignore",
							"--hidden",
						},
					},
				},
			})

			vim.g.dashboard_default_executive = "telescope.nvim"
		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build =
		"cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},
}
