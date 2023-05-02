distro := $(shell awk -F "=" '/^ID/ {print $$2}' /etc/os-release)

.PHONY: all othres fish kubernetes nvim starship sway wezterm zellij
all: others fish kubernetes nvim starship sway wezterm zellij

fish_exists := $(shell fish --version 2>/dev/null)
fish:
	@echo "==== fish ===="

ifdef fish_exists
	@echo fish exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S fish
else
	$(error Install fish manually)
endif

	@stow fish

kubectl_exists := $(shell kubectl version 2>/dev/null)
kubectx_exists := $(shell kubectx -h 2>/dev/null)
k9s_exists := $(shell k9s version 2>/dev/null)
kubernetes:
	@echo "==== kubernetes ===="

ifdef kubectl_exists
	@echo kubectl exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S kubectl
else
	$(error Install kubectl manually)
endif

ifdef kubectx_exists
	@echo kubectx exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S kubectx
else
	$(error Install kubectx manually)
endif

ifdef k9s_exists
	@echo k9s exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S k9s
else
	$(error Install k9s manually)
endif

	@stow kubernetes

nvim_exists := $(shell nvim --version 2>/dev/null)
nvim:
	@echo "==== neovim ===="

ifdef nvim_exists
	@echo neovim exists.
else ifeq ($(distro), arch)
	@yay --needed -S neovim-nightly-bin 
else
	$(error Install neovim manually)
endif

	@stow nvim

starship_exists := $(shell starship --version 2>/dev/null)
starship:
	@echo "==== starship ===="
	
ifdef starship_exists
	@echo starship exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S starship
else
	@curl -sS https://starship.rs/install.sh | sh
endif

	@stow starship

mako_exists := $(shell mako --help 2>/dev/null)
tofi_exists := $(shell tofi --help 2>/dev/null)
waybar_exists := $(shell waybar -v 2>/dev/null)
wl-mirror_exists := $(shell wl-mirror --version 2>/dev/null)
sway:
	@echo "==== sway ===="

ifdef mako_exists
	@echo mako exists.
else ifeq ($(distro), arch)
	@yay -S mako
else
	$(error Install mako manually)
endif

ifdef tofi_exists
	@echo tofi exists.
else ifeq ($(distro), arch)
	@yay -S tofi
else
	$(error Install tofi manually)
endif

ifdef waybar_exists
	@echo waybar exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S waybar
else ifeq ($(distro), fedora)
	@sudo dnf install -y waybar
else
	$(error Install waybar manually)
endif

ifdef wl-mirror_exists
	@echo wl-mirror exists.
else ifeq ($(distro), arch)
	@yay --needed -S wl-mirror
else ifeq ($(distro), fedora)
	@sudo dnf install -y wl-mirror
else
	$(error Install wl-mirror manually)
endif


	@stow sway

wezterm_exists := $(shell wezterm -V 2>/dev/null)
wezterm:
	@echo "==== wezterm ===="

ifdef wezterm_exists
	@echo wezterm exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S wezterm
else
	$(error Install wezterm manually)
endif

	@stow wezterm

zellij_exists := $(shell zellij -V 2>/dev/null)
zellij:
	@echo "==== zellij ===="

ifdef zellij_exists
	@echo zellij exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S zellij
else
	$(error Install zellij manually)
endif

	@stow zellij

yay_exists := $(shell yay -V 2>/dev/null)
fzf_exists := $(shell fzf --version 2>/dev/null)
bat_exists := $(shell bat --version 2>/dev/null)
lsd_exists := $(shell lsd --version 2>/dev/null)
others:
	@echo "==== others ===="

ifdef yay_exists
	@echo yay exists.
else ifeq ($(distro), arch)
	@sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf yay
else
	@echo yay not needed.
endif

ifdef fzf_exists
	@echo fzf exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S fzf
else ifeq ($(distro), fedora)
	@sudo dnf install -y fzf
else
	$(error Install fzf manually)
endif

ifdef bat_exists
	@echo bat exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S bat
else ifeq ($(distro), fedora)
	@sudo dnf install -y bat
else
	$(error Install bat manually)
endif

ifdef lsd_exists
	@echo lsd exists.
else ifeq ($(distro), arch)
	@sudo pacman --needed -S lsd
else ifeq ($(distro), fedora)
	@sudo dnf install -y lsd
else
	$(error Install lsd manually)
endif

private:
	@echo "===== private ===="

	@stow private_dotfiles
