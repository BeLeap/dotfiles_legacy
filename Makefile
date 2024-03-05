.PHONY: tui gui

all: tui gui

tui:
	@stow kubernetes
	@stow fish
	@stow starship
	@stow xplr

gui:
	@stow wezterm
