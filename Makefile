.PHONY: tui gui

all: tui gui

tui:
	@stow kubernetes
	@stow fish
	@stow starship
	@stow xplr
	@stow helix
	@stow tmux
	@stow tmuxp
	@stow git

gui:
	@stow wezterm
	@stow yabai

others:
	@stow scripts
