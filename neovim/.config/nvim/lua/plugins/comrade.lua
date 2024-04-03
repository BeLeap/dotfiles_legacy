return {
  {
    'Shougo/deoplete.nvim',
    init = function()
      vim.g["deoplete#enable_at_startup"] = 1
    end,
  },
  {
    'johngrib/Comrade',
    branch = 'fix-nvim',
    dependencies = { 'Shougo/deoplete.nvim' },
    ft = { "kotlin", "java" },
    lazy = false,
  },
}
