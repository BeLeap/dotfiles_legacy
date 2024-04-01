return {
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  {
    "stevearc/dressing.nvim",
    event = { "BufEnter" },
    config = true,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      vim.o.termguicolors = true

      local notify = require("notify")
      notify.setup({
        render = "compact",
        top_down = true,
        max_height = 3,
      })

      vim.notify = notify
    end,
  },
  {
    "tpope/vim-sensible",
    event = { "BufEnter" },
  },
  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    opts = {
      blacklist = {
        "/home/beleap/work/.*",
      },
    },
  },
  {
    "max397574/better-escape.nvim",
    event = { "BufEnter" },
    opts = {
      mapping = { ",d" },
    },
  },
  {
    "kylechui/nvim-surround",
    event = { "BufEnter" },
    version = "*",
    config = true,
  },
}
