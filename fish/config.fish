set -g PATH ~/go/bin /usr/local/go/bin ~/.cargo/bin ~/.local/bin ~/.nodenv/bin ~/.local/npm/bin $PATH

if not set -q DOTFILES_PATH
 set -g DOTFILES_PATH ~/.dotfiles
end

if not set -q XDG_CONFIG_HOME
  set -g XDG_CONFIG_HOME ~/.config
end

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

if type -q nodenv
  status --is-interactive; and source (nodenv init -|psub)
end

if type -q pyenv
  status is-login; and pyenv init --path | source
  status is-interactive; and pyenv init - | source
end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/beleap/.ghcup/bin # ghcup-env
