.PHONY: tui gui

tui:
	@stow kubernetes
	@stow nvim
	@stow ctags

gui:
	@stow hyprland
	@stow wezterm
