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
	org_todo_keywords = { "TODO(t)", "IN-PROGRESS(p)", "|", "DONE(d)", "CLOSED(c)" },
	org_todo_keyword_faces = {
		["IN-PROGRESS"] = ":foreground red :weight bold",
	},
})
