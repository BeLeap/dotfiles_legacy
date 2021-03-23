source ~/.dotfiles/fish/alias.fish
source ~/.dotfiles/fish/fzf.fish
source ~/.dotfiles/fish/bash.fish
source ~/.dotfiles/fish/tmux.fish
source ~/.dotfiles/fish/others.fish
source ~/.dotfiles/fish/git.fish
source ~/.dotfiles/fish/docker.fish

set -gx DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0
set -gx GDK_SCALE 2
# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /home/beleap/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /home/beleap/.ghcup/bin $PATH
