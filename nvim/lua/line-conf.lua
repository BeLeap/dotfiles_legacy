require("lualine").setup({
	options = {
		theme = "gruvbox-material",
	},
	sections = {
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
	},
})
