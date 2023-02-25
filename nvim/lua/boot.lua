vim.g.mapleader = ";"

require("lazy-conf")

if vim.g.neovide then
	require("neovide-conf")
end
