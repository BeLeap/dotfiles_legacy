distro := $(shell awk -F "=" '/^ID/ {print $$2}' /etc/os-release)

fish_exists := $(shell fish --version 2>/dev/null)
k9s_exists := $(shell k9s version 2>/dev/null)
nvim_exists := $(shell nvim --version 2>/dev/null)
starship_exists := $(shell starship --version 2>/dev/null)
rofi_exists := $(shell rofi -v 2>/dev/null)
waybar_exists := $(shell waybar -v 2>/dev/null)
wezterm_exists := $(shell wezterm -V 2>/dev/null)
zellij_exists := $(shell zellij -V 2>/dev/null)

.PHONY: all fish k9s nvim starship sway wezterm zellij
all: fish k9s nvim starship sway wezterm zellij

fish:
ifdef fish_exists
	@echo fish exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S fish
else
	@echo Install fish manually.
endif

	@stow fish

k9s:
ifdef k9s_exists
	@echo k9s exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S k9s
else
	@echo Install k9s manually.
endif

	@stow k9s

nvim:
ifdef nvim_exists
	@echo neovim exists.
else ifeq ($(distro), arch)
	@yay --needed -S neovim-nightly-bin 
else
	@echo Install neovim manually.
endif

	@stow nvim

starship:
ifdef starship_exists
	@echo starship exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S starship
else
	@curl -sS https://starship.rs/install.sh | sh
endif

	@stow starship

sway:

ifdef rofi_exists
	@echo rofi exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S rofi
else ifeq ($(distro), fedora)
	@sudo dnf install -y rofi
else
	@echo Install rofi manually.
endif

ifdef waybar_exists
	@echo waybar exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S waybar
else ifeq ($(distro), fedora)
	@sudo dnf install -y waybar
else
	@echo Install waybar manually.
endif

	@stow sway

wezterm:
ifdef wezterm_exists
	@echo wezterm exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S wezterm
else
	@echo Install wezterm manually.
endif

	@stow wezterm

zellij:
ifdef zellij_exists
	@echo zellij exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S zellij
else
	@echo Install zellij manually.
endif

	@stow zellij
