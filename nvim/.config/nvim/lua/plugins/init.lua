return {
  -- UI
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
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
        pattern = { "root.md", ">projects" },
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
    "stevearc/overseer.nvim",
    event = "VeryLazy",
    config = function()
      local overseer = require("overseer")
      overseer.setup({
        templates = { "builtin", },
        strategy = "toggleterm",
      })

      overseer.register_template({
        name = "terraform apply",
        builder = function(_params)
          local file_dir = vim.fs.dirname(vim.fn.expand("%:p"))

          return {
            cmd = { "terraform" },
            args = { "apply" },
            cwd = file_dir,
            components = { "default", "on_output_quickfix" }
          }
        end,
        desc = "Apply terraform",
        tags = { overseer.TAG.BUILD },
        condition = {
          filetype = { "terraform", "tf" },
          dir = vim.fn.getcwd(),
        },
      })
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
    config = function()
      vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

      vim.opt.list = true
      vim.opt.listchars:append "space:⋅"
      require("indent_blankline").setup({
        space_char_blankline = " ",
        char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
          "IndentBlanklineIndent5",
          "IndentBlanklineIndent6",
        },
      })
    end,
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
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.keymap.set("n", "<leader>f", "<cmd>NvimTreeToggle<cr>")

      require("nvim-tree").setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true
        },
        filters = {
          git_ignored = false,
        },
      })
    end,
  },
  {
    'stevearc/stickybuf.nvim',
    event = "VeryLazy",
    opts = {},
  },

  -- Language
  { "lbrayner/vim-rzip" },
  { "dmix/elvish.vim" },
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
    event = "VeryLazy",
    opts = {
      blacklist = {
        "~/work/*",
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
  {
    "axkirillov/hbac.nvim",
    event = "VeryLazy",
    config = function()
      require("hbac").setup()
    end,
  },
  {
    "https://git.sr.ht/~soywod/himalaya-vim",
    cmd = { "Himalaya" },
    init = function()
      vim.g.himalaya_folder_picker = "telescope"
      vim.g.himalaya_folder_picker_telescope_preview = 1
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
      local wk = require("which-key")
      wk.setup({})

      wk.register({
        g = {
          name = "+Git",
          h = {
            name = "+Github",
            p = {
              name = "+Pull Request",
              l = { "<cmd>Octo pr list<cr>", "List" },
              m = { "<cmd>Octo pr merge<cr>", "Merge" },
              sd = { "<cmd>Octo pr merge squash delete<cr>", "Squash and Delete" },
              c = { "<cmd>Octo pr create<cr>", "Create" },
              d = { "<cmd>Octo pr close<cr>", "Close" },
            },
            c = {
              name = "+Comment",
              a = { "<cmd>Octo comment add<cr>", "Add" },
              d = { "<cmd>Octo comment delete<cr>", "Delete" },
            },
          },
          n = { "<cmd>Neogit<cr>", "Neogit" },
        },
      }, { prefix = "<leader>" })
    end,
  },
}
