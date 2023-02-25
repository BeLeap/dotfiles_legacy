return {
	"morhetz/gruvbox",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		vim.g.gruvbox_contrast_dark = "soft"
		vim.g.gruvbox_invert_selection = false
		vim.cmd.colorscheme("gruvbox")
	end,
}
