distro := $(shell awk -F "=" '/^ID/ {print $$2}' /etc/os-release)

.PHONY: all others fish kubernetes nvim starship sway wezterm zellij private
all: others fish kubernetes nvim starship zellij

tui:
	@stow fish
	@stow kubernetes
	@stow nvim

gui:
	@stow sway
	@stow wezterm
