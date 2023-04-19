return {
  -- UI
  {
    "ahmedkhalf/project.nvim",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      {
        "<leader>p",
        function()
          require("telescope").extensions.projects.projects()
        end,
        silent = true,
      },
    },
    config = function()
      require("project_nvim").setup({
        detection_methods = { "pattern", "lsp" },
        silent_chdir = true,
        show_hidden = true,
        excluder_dirs = {
          "*/node_modules/*",
        },
      })
      require("telescope").load_extension("projects")
    end,
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    keys = {
      { "<leader>d", ":DBUIToggle<cr>", silent = true },
    },
    dependencies = {
      "tpope/vim-dadbod",
    },
    config = function()
      vim.g.db_ui_auto_execute_table_helpers = true
    end,
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufEnter" },
    config = true,
  },
  {
    "stevearc/dressing.nvim",
    event = { "BufEnter" },
    config = true,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufEnter" },
  },
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      vim.o.termguicolors = true

      require("notify").setup({
        render = "compact",
        top_down = false,
      })
    end,
  },

  -- Language
  { "lbrayner/vim-rzip" },
  { "dmix/elvish.vim" },
  { "towolf/vim-helm" },
  {
    "hashivim/vim-terraform",
    event = { "BufEnter *.tf" },
  },
  {
    "simrat39/rust-tools.nvim",
    event = { "BufEnter *.rs", "BufEnter *.toml" },
  },
  {
    "mhinz/vim-crates",
    event = { "BufEnter Cargo.toml" },
  },
  {
    "mfussenegger/nvim-jdtls",
    event = { "BufEnter *.java", "BufEnter *.kt" },
  },
  {
    "fatih/vim-go",
    event = {
      "BufEnter *.go",
      "BufEnter go.mod",
      "BufEnter go.sum",
    },
  },
  {
    "udalov/kotlin-vim",
    event = { "BufEnter *.kt" },
  },
  {
    "ziglang/zig.vim",
    event = { "BufEnter *.zig" },
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufEnter" },
    config = true,
  },
  {
    "iamcco/markdown-preview.nvim",
    event = { "BufEnter *.md" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- Others
  {
    "tpope/vim-sensible",
    event = { "BufEnter" },
  },
  {
    "mg979/vim-visual-multi",
    event = { "BufEnter" },
  },
  {
    "wakatime/vim-wakatime",
    event = { "BufEnter" },
  },
  {
    "nacro90/numb.nvim",
    event = { "BufEnter" },
    config = true,
  },
  {
    "andweeb/presence.nvim",
    event = { "BufEnter" },
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
  {
    "samjwill/nvim-unception",
    lazy = false,
    init = function()
      -- Optional settings go here!
      -- e.g.) vim.g.unception_open_buffer_in_new_tab = true
      vim.g.unception_block_while_host_edits = true
      vim.g.unception_open_buffer_in_new_tab = true

      vim.api.nvim_create_autocmd("User", {
        pattern = "UnceptionEditRequestReceived",
        callback = function()
          require("toggleterm").toggle()
        end,
      })
    end,
  },
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
}
