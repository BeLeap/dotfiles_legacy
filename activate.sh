#!/bin/bash

if ! command -v fish &> /dev/null
then
  echo "Fish is not installed. Please install it first."
  exit 1
fi

deactivate() {
  unset FISH_CONFIG_PATH
}

# Fish shell
dotfiles_path="$(cd $(dirname $BASH_SOURCE) &> /dev/null && pwd)"
echo "$dotfiles_path"
export XDG_CONFIG_HOME="$dotfiles_path"

# Starship
export STARSHIP_CONFIG="$dotfiles_path/starship/starship.toml"

# Neovim
if [ ! -d "$XDG_CONFIG_HOME/nvim/site/packer" ]
then
  git clone --depth 1 https://github.com/wbthomason/packer.nvim $XDG_CONFIG_HOME/nvim/site/pack/packer/start/packer.nvim
fi


fish
