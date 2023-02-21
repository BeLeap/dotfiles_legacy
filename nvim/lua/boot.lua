vim.g.mapleader = ";"

require("plugins")

require("orgmode-conf")
require("keymap")
require("others")
require("dap-conf")
require("lsp")
require("telescope-conf")
require("line-conf")
require("treesitter-conf")
require("dbui-conf")
require("git-conf")
require("toggleterm-conf")
require("syntax-tree-surfer-conf")
require("sidebar-conf")

if vim.g.neovide then
	require("neovide-conf")
end

-- Unused Configurations
-- require("nvimtree-conf")
