vim.g.mapleader = ";"

require("lazy-conf")
require("keymap")
require("others")

if vim.g.neovide then
	require("neovide-conf")
end
