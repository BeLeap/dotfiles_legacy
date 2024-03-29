return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<leader>st", "<Cmd>exe v:count1 . \"ToggleTerm\"<CR>" },
      {
        "<leader>sb",
        function()
          local path     = vim.fn.expand("%:p:h")
          local Terminal = require('toggleterm.terminal').Terminal
          Terminal:new({
            dir = path,
          }):toggle()
        end
      },
      { "<leader>sy", "<cmd>ToggleTermSendVisualSelection<cr>", mode = "v" },
    },
    version = "*",
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
    },
  },
  {
    "willothy/flatten.nvim",
    config = true,
    lazy = false,
    priority = 1001,
  },
}
