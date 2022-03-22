#!/bin/bash

if ! command -v fish &> /dev/null
then
  echo "Fish is not installed. Please install it first."
  exit 1
fi

deactivate() {
  unset FISH_CONFIG_PATH
}

dotfiles_path = "$(dirname $BASH_SOURCE)"
echo $dotfiles_path
export FISH_CONFIG_PATH="$dotfiles_path"

fish
