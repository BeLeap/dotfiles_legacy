return {
	{
		"nvim-orgmode/orgmode",
		keys = {
			{ "<leader>oa" },
			{ "<leader>oc" },
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"dhruvasagar/vim-table-mode",
		},
		config = function()
			require("orgmode").setup_ts_grammar()

			local org_default_notes_file = (function()
				if string.match(vim.fn.getcwd(), "riiid") then
					return "~/orgmode/riiid/todo.org"
				else
					return "~/orgmode/personal/todo.org"
				end
			end)()

			require("orgmode").setup({
				org_agenda_files = { "~/orgmode/**/*.org" },
				org_default_notes_file = org_default_notes_file,
				org_todo_keywords = {
					"TODO(t)",
					"BLOCKED(b)",
					"IN-PROGRESS(i)",
					"IN-REVIEW(r)",
					"|",
					"DONE(d)",
					"CLOSED(c)",
				},
				org_agenda_span = "day",
			})
		end,
	},
}
