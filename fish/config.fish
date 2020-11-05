source ~/.dotfiles/fish/alias.fish
source ~/.dotfiles/fish/fzf.fish
source ~/.dotfiles/fish/bash.fish
source ~/.dotfiles/fish/tmux.fish
source ~/.dotfiles/fish/others.fish
source ~/.dotfiles/fish/git.fish
source ~/.dotfiles/fish/docker.fish

# opam configuration
source /home/beleap/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
# ghcup-env
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
test -f /home/beleap/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /home/beleap/.ghcup/bin $PATH
