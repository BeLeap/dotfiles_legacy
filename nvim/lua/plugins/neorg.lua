return {
	{
		"nvim-neorg/neorg",
		ft = "norg",
		build = ":Neorg sync-parsers",
		opts = {
			load = {
				["core.defaults"] = {},
				["core.norg.concealer"] = {},
				["core.norg.dirman"] = {
					config = {
						workspaces = {
							riiid = "~/notes/riiid",
							personal = "~/notes/personal",
						},
					},
				},
				["core.norg.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
			},
		},
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "hrsh7th/nvim-cmp" },
		},
	},
}
