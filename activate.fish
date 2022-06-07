# Fish shell
set -gx DOTFILES_PATH (realpath (dirname $argv[1]))

# Starship
set -gx STARSHIP_CONFIG "$DOTFILES_PATH/starship/starship.toml"

# Neovim
if ! test -d "$XDG_CONFIG_HOME/nvim/site/pack/packer"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim $XDG_CONFIG_HOME/nvim/site/pack/packer/start/packer.nvim
end

# pyenv
set -gx PYENV_ROOT "$DOTFILES_PATH/pyenv"
set -gx PATH "$PYENV_ROOT/bin" "$DOTFILES_PATH/.pyenv/bin" $PATH
