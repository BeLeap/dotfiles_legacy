return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true,
    lazy = false,
    init = function()
      vim.o.background = "dark"
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
}
