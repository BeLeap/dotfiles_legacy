return {
	-- UI
	{
		"ahmedkhalf/project.nvim",
		lazy = false,
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		keys = {
			{
				"<leader>p",
				function()
					require("telescope").extensions.projects.projects()
				end,
				silent = true,
			},
			{ "<leader>gg", "<cmd>Neotree git_status<cr>", silent = true },
		},
		config = function()
			require("project_nvim").setup({
				detection_methods = { "pattern" },
				silent_chdir = false,
				exclude_dirs = { "~/.config/*" },
			})
			require("telescope").load_extension("projects")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		keys = {
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
				end,
				desc = "Explorer NeoTree (cwd)",
			},
		},
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		init = function()
			vim.g.neo_tree_remove_legacy_commands = 1
			if vim.fn.argc() == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		opts = {
			source_selector = {
				winbar = false,
				statusline = false,
			},
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = true,
				filtered_items = {
					visible = true,
					never_show_by_pattern = { -- uses glob style patterns
						".null-ls_*",
					},
				},
			},
			window = {
				mappings = {
					["<space>"] = "none",
				},
			},
			git_status = {
				window = {
					position = "float",
					mappings = {
						["A"] = "git_add_all",
						["gu"] = "git_unstage_file",
						["ga"] = "git_add_file",
						["gr"] = "git_revert_file",
						["gc"] = "git_commit",
						["gp"] = "git_push",
						["gg"] = "git_commit_and_push",
					},
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
				git_status = {
					symbols = {
						-- Change type
						added = "✚",
						modified = "",
						deleted = "✖",
						renamed = "",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
			},
		},
	},
	{
		"kristijanhusak/vim-dadbod-ui",
		keys = {
			{ "<leader>d", ":DBUIToggle<cr>", silent = true },
		},
		dependencies = {
			"tpope/vim-dadbod",
		},
		config = function()
			vim.g.db_ui_auto_execute_table_helpers = true
		end,
	},
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
	},
	{
		"folke/todo-comments.nvim",
		event = { "BufEnter" },
		config = true,
	},
	{
		"stevearc/dressing.nvim",
		event = { "BufEnter" },
		config = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufEnter" },
	},
	{
		"rcarriga/nvim-notify",
		lazy = false,
		config = function()
			vim.o.termguicolors = true

			require("notify").setup({
				render = "compact",
				top_down = false,
			})
		end,
	},

	-- Language
	{ "lbrayner/vim-rzip" },
	{ "dmix/elvish.vim" },
	{ "towolf/vim-helm" },
	{
		"hashivim/vim-terraform",
		event = { "BufEnter *.tf" },
	},
	{
		"simrat39/rust-tools.nvim",
		event = { "BufEnter *.rs", "BufEnter *.toml" },
	},
	{
		"mhinz/vim-crates",
		event = { "BufEnter Cargo.toml" },
	},
	{
		"mfussenegger/nvim-jdtls",
		event = { "BufEnter *.java", "BufEnter *.kt" },
	},
	{
		"fatih/vim-go",
		event = {
			"BufEnter *.go",
			"BufEnter go.mod",
			"BufEnter go.sum",
		},
	},
	{
		"udalov/kotlin-vim",
		event = { "BufEnter *.kt" },
	},
	{
		"andrewstuart/vim-kubernetes",
		cmd = {
			"KubeApply",
			"KubeDelete",
			"KubeCreate",
			"KubeApplyDir",
			"KubeDeleteDir",
		},
	},
	{
		"ziglang/zig.vim",
		event = { "BufEnter *.zig" },
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufEnter" },
		config = true,
	},
	{
		"iamcco/markdown-preview.nvim",
		event = { "BufEnter *.md" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- Others
	{
		"tpope/vim-sensible",
		event = { "BufEnter" },
	},
	{
		"mg979/vim-visual-multi",
		event = { "BufEnter" },
	},
	{
		"wakatime/vim-wakatime",
		event = { "BufEnter" },
	},
	{
		"nacro90/numb.nvim",
		event = { "BufEnter" },
		config = true,
	},
	{
		"andweeb/presence.nvim",
		event = { "BufEnter" },
	},
	{
		"max397574/better-escape.nvim",
		event = { "BufEnter" },
		opts = {
			mapping = { ",d" },
		},
	},
	{
		"kylechui/nvim-surround",
		event = { "BufEnter" },
		version = "*",
		config = true,
	},
	{
		"willothy/flatten.nvim",
		config = true,
		lazy = false,
		priority = 1001,
		opts = {
			callbacks = {
				pre_open = function()
					require("toggleterm").toggle(0)
				end,
				post_open = function(bufnr, winnr, ft, is_blocking)
					if not is_blocking then
						require("toggleterm").toggle(0)
						vim.api.nvim_set_current_win(winnr)
					end
				end,
				block_end = function()
					require("toggleterm").toggle(0)
				end,
			},
			window = {
				open = "split",
			},
		},
	},

	{
		"BeLeap/k8s-lua.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		cmd = { "K8sContextSelect" },
		dev = true,
		lazy = false,
		opts = {},
	},
}
