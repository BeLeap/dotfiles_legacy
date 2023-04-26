return {
	{
		"BeLeap/k8s-lua.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-telescope/telescope.nvim",
		},
		cmd = { "Kube" },
		config = true,
		dev = true,
	},
	{
		"andrewstuart/vim-kubernetes",
		cmd = {
			"KubeApply",
			"KubeDelete",
			"KubeCreate",
			"KubeApplyDir",
			"KubeDeleteDir",
		},
	},
}
