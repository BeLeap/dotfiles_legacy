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
	@stow neovim

gui:
	@stow wezterm
	@stow hammerspoon
	@stow alacritty

others:
	@stow scripts
