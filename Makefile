.PHONY: tui gui

tui:
	@stow fish
	@stow kubernetes
	@stow nvim

gui:
	@stow sway
	@stow wezterm
