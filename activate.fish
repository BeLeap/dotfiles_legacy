# Fish shell
set -gx DOTFILES_PATH (realpath (dirname $argv[1]))
echo $DOTFILES_PATH

function deactivate -d "Exit"
  if test -n "$__OLD_XDG_CONFIG_HOME"
    set -gx XDG_CONFIG_HOME $__OLD_XDG_CONFIG_HOME
    set -e __OLD_XDG_CONFIG_HOME
  end
  if test -n "$__OLD_STARSHIP_CONFIG"
    set -gx STARSHIP_CONFIG $__OLD_STARSHIP_CONFIG
    set -e __OLD_STARSHIP_CONFIG
  end
  if test -n "$__OLD_PYENV_ROOT"
    set -gx PYENV_ROOT $__OLD_PYENV_ROOT
    set -e __OLD_PYENV_ROOT
  end
  if test -n "$__OLD_PATH"
    set -gx PATH $__OLD_PATH
    set -e __OLD_PATH
  end

  functions -e deactivate
end

set -gx __OLD_XDG_CONFIG_HOME $XDG_CONFIG_HOME
set -gx XDG_CONFIG_HOME $DOTFILES_PATH

# Starship
set -gx __OLD_STARSHIP_CONFIG $STARSHIP_CONFIG
set -gx STARSHIP_CONFIG $DOTFILES_PATH"/starship/starship.toml"

# Neovim
if test -d $XDG_CONFIG_HOME"/nvim/site/pack/packer"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim $XDG_CONFIG_HOME/nvim/site/pack/packer/start/packer.nvim
end

# pyenv
set -gx __OLD_PYENV_ROOT $PYENV_ROOT
set -gx PYENV_ROOT $DOTFILES_PATH"/pyenv"
set -gx __OLD_PATH $PATH
set -gx PATH $PYENV_ROOT"/bin" $PATH
