vim.g.mapleader = ";"

require("lazy-conf")
require("keymap")
require("others")
require("custom-filetype")

if vim.g.neovide then
	require("neovide-conf")
end
