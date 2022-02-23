-- local trouble = require('trouble.provider.telescope')

require('telescope').setup{
  defaults = {
    mappings = {
      -- i = { ["<c-t>"] = trouble.open_with_trouble },
      -- n = { ["<c-t>"] = trouble.open_with_trouble },
    },
    layout_config = {
      vertical = { width = 0.5 }
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown"
    }
  }
}
