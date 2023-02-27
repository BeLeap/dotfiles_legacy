return {
	-- UI
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
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"stevearc/dressing.nvim",
		event = { "BufEnter" },
		config = function()
			require("dressing").setup()
		end,
	},
}
