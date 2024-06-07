return {
	{
		"gsuuon/model.nvim",
		cmd = { "M", "Model", "Mchat" },
		init = function()
			vim.filetype.add({
				extension = {
					mchat = "mchat",
				},
			})
		end,
		ft = "mchat",
		keys = {
			{ "<C-m>d", ":Mdelete<cr>", mode = "n" },
			{ "<C-m>s", ":Mselect<cr>", mode = "n" },
			{ "<C-m><space>", ":Mchat<cr>", mode = "n" },
		},
		config = function()
			local ollama = require("model.providers.ollama")
			require("model").setup({
				prompts = {
					commit = {
						provider = ollama,
						params = {
							model = "mistral",
						},
						mode = require("model").mode.INSERT,
						builder = function()
							local git_diff = vim.fn.system({ "git", "diff", "--staged" })

							if not git_diff:match("^diff") then
								error("Git error:\n" .. git_diff)
							end

							return {
								prompt = "Write a terse commit message according to the Conventional Commits specification. Try to stay below 80 characters total. Staged git diff: ```\n"
									.. git_diff
									.. "\n```",
							}
						end,
					},
				},
			})
		end,
	},
}
