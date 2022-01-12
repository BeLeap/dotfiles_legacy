source ~/.dotfiles/fish/alias.fish
source ~/.dotfiles/fish/fzf.fish
source ~/.dotfiles/fish/bash.fish
source ~/.dotfiles/fish/tmux.fish
source ~/.dotfiles/fish/others.fish
source ~/.dotfiles/fish/git.fish
source ~/.dotfiles/fish/docker.fish

starship init fish | source

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

