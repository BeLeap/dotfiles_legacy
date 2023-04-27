return {
  {
    "BeLeap/k8s-lua.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "Kube", "KubeApply" },
    config = true,
    dev = true,
  },
}
