distro := $(shell awk -F "=" '/^ID/ {print $$2}' /etc/os-release)

.PHONY: all fish k8s nvim starship sway wezterm zellij
all: fish k9s nvim starship sway wezterm zellij

fish:
	stow fish

k9s:
	stow k9s

nvim:
	stow nvim

starship:
	stow starship

sway:
ifeq ($(distro), arch)
	sudo pacman --needed -S rofi waybar
else ifeq ($(distro), fedora)
	sudo dnf install -y rofi waybar
else
	@echo Install rofi manually.
endif

	stow sway

wezterm:
	stow wezterm

zellij:
	stow zellij
