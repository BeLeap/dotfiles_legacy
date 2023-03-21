if not set -q DOTFILES_PATH
 set -g DOTFILES_PATH ~/.config
end

if not set -q XDG_CONFIG_HOME
  set -g XDG_CONFIG_HOME ~/.config
end

set -g PYENV_ROOT $DOTFILES_PATH/.pyenv
set -gx EDITOR "nvim --cmd 'let g:flatten_wait=1'"
set -gx VISUAL $EDITOR

source ~/.config/fish/alias.fish
source ~/.config/fish/fzf.fish
source ~/.config/fish/zellij.fish
source ~/.config/fish/others.fish
source ~/.config/fish/git.fish
source ~/.config/fish/docker.fish
source ~/.config/fish/alacritty.fish
source ~/.config/fish/gradle.fish

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
