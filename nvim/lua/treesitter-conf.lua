require('nvim-ts-autotag').setup()
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'},
  },
  incremental_selection = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true },
}

