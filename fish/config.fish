set -g PATH ~/go/bin /usr/local/go/bin ~/.cargo/bin ~/.local/bin ~/.nodenv/bin ~/.pyenv/bin ~/.local/npm/bin $PATH

source "$XDG_CONFIG_HOME/fish/alias.fish"
source "$XDG_CONFIG_HOME/fish/fzf.fish"
source "$XDG_CONFIG_HOME/fish/bash.fish"
source "$XDG_CONFIG_HOME/fish/tmux.fish"
source "$XDG_CONFIG_HOME/fish/others.fish"
source "$XDG_CONFIG_HOME/fish/git.fish"
source "$XDG_CONFIG_HOME/fish/docker.fish"
source "$XDG_CONFIG_HOME/fish/alacritty.fish"

if not set -q STARSHIP
  starship init fish | source
end

# Load nodenv automatically by appending
# the following to ~/.config/fish/config.fish:

if type -q nodenv
  status --is-interactive; and source (nodenv init -|psub)
end

if type -q pyenv
  status is-login; and pyenv init --path | source
  status is-interactive; and pyenv init - | source
end

# Generated for envman. Do not edit.
# test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/beleap/.ghcup/bin # ghcup-env
