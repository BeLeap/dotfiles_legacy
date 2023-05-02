set -g PYENV_ROOT $DOTFILES_PATH/.pyenv
set -gx EDITOR "nvim --cmd 'let g:flatten_wait=1'"
set -gx VISUAL $EDITOR

source $XDG_CONFIG_HOME/fish/alias.fish
source $XDG_CONFIG_HOME/fish/fzf.fish
source $XDG_CONFIG_HOME/fish/zellij.fish
source $XDG_CONFIG_HOME/fish/others.fish
source $XDG_CONFIG_HOME/fish/git.fish
source $XDG_CONFIG_HOME/fish/docker.fish
source $XDG_CONFIG_HOME/fish/alacritty.fish
source $XDG_CONFIG_HOME/fish/gradle.fish

source $XDG_CONFIG_HOME/fish/riiid.fish

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

if type -q kubectl
  kubectl completion fish | source
end

if type -q helm
  helm completion fish | source
end

if type -q direnv
  direnv hook fish | source
end
