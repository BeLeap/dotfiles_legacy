.PHONY: tui gui

all: tui gui

tui:
	@stow kubernetes
	@stow fish
	@stow starship
	@stow xplr
	@stow helix
	@stow tmuxp

gui:
	@stow wezterm

others:
	@stow scripts
