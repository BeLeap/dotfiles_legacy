return {
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			kind = "auto",
		},
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
	{
		'tanvirtin/vgit.nvim',
		event = "VeryLazy",
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			require('vgit').setup()
		end,
	}
}
