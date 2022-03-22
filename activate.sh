#!/bin/bash

if ! command -v fish &> /dev/null
then
  echo "Fish is not installed. Please install it first."
  exit 1
fi

# Fish shell
export DOTFILES_PATH="$(cd $(dirname $BASH_SOURCE) &> /dev/null && pwd)"
export XDG_CONFIG_HOME="$DOTFILES_PATH"

# Starship
export STARSHIP_CONFIG="$DOTFILES_PATH/starship/starship.toml"

# Neovim
if [[ ! -d "$XDG_CONFIG_HOME/nvim/site/pack/packer" ]]
then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim $XDG_CONFIG_HOME/nvim/site/pack/packer/start/packer.nvim
fi

# pyenv
export PYENV_ROOT="$DOTFILES_PATH/pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

fish
