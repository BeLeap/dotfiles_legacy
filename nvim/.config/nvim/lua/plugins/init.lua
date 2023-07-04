return {
	-- UI
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",
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
		},
		config = function()
			require("project_nvim").setup({
				detection_methods = { "pattern", "lsp" },
				pattern = { "root.md" },
				silent_chdir = true,
				show_hidden = true,
				excluder_dirs = {
					"*/node_modules/*",
				},
			})
			require("telescope").load_extension("projects")
		end,
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
		event = "VeryLazy",
		config = function()
			vim.o.termguicolors = true

			local notify = require("notify")
			notify.setup({
				render = "compact",
				top_down = false,
			})

			vim.notify = notify
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		event = "VeryLazy",
		dependencies = {
			"kevinhwang91/promise-async",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			vim.o.foldcolumn = "1" -- "0" is not bad
			vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
			vim.o.foldlevelstart = 99

			vim.keymap.set("n", "zR", require("ufo").openAllFolds)
			vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

			require("ufo").setup({
				provider_selector = function(_, _, _)
					return { "treesitter", "indent" }
				end,
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
		"samjwill/nvim-unception",
		lazy = false,
		init = function()
			-- Optional settings go here!
			-- e.g.) vim.g.unception_open_buffer_in_new_tab = true
			vim.g.unception_block_while_host_edits = true
			vim.g.unception_open_buffer_in_new_tab = true

			vim.api.nvim_create_autocmd("User", {
				pattern = "UnceptionEditRequestReceived",
				callback = function()
					require("toggleterm").toggle()
				end,
			})
		end,
	},
	{
		"axkirillov/hbac.nvim",
		event = "VeryLazy",
		config = function()
			require("hbac").setup()
		end,
	},
	{
		"https://git.sr.ht/~soywod/himalaya-vim",
		cmd = { "Himalaya" },
		init = function()
			vim.g.himalaya_folder_picker = "telescope"
			vim.g.himalaya_folder_picker_telescope_preview = 1
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 1000
			local wk = require("which-key")
			wk.setup({})
		end,
	},
  {
    "m4xshen/hardtime.nvim",
    event = "VeryLazy",
    opts = {
			disabled_filetypes = { "neo-tree", "mason", "toggleterm", "NeogitStatus" },
		},
  },
}
