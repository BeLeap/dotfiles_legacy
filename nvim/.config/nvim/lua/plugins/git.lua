return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufEnter" },
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = true,
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
