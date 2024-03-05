.PHONY: tui gui

all: tui gui

tui:
	@stow kubernetes
	@stow fish
	@stow starship
	@stow xplr
	@stow helix

gui:
	@stow wezterm
