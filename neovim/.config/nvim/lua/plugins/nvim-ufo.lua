return {
  {
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    dependencies = {
      "kevinhwang91/promise-async",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      vim.o.foldcolumn = "1" -- "0" is not bad
      vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99

      vim.keymap.set("n", "zR", require("ufo").openAllFolds)
      vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

      require("ufo").setup({
        provider_selector = function(_, _, _)
          return { "treesitter", "indent" }
        end,
      })
    end,
  },
}
