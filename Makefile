.PHONY: tui gui

all: tui gui

tui:
	@stow kubernetes
	@stow nvim
	@stow fish
	@stow starship

gui:
	@stow wezterm
