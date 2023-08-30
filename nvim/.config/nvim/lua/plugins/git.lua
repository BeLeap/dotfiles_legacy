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
		'tanvirtin/vgit.nvim',
		event = "VeryLazy",
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			require('vgit').setup()
		end,
	},
	{
		'pwntester/octo.nvim',
		cmd = "Octo",
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			'nvim-tree/nvim-web-devicons',
		},
		opts = {},
	},
}
