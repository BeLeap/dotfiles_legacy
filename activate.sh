#!/bin/bash

if ! command -v fish &> /dev/null
then
  echo "Fish is not installed. Please install it first."
  exit 1
fi

deactivate() {
  unset FISH_CONFIG_PATH
}

dotfiles_path="$(cd $(dirname $BASH_SOURCE) &> /dev/null && pwd)"
echo "$dotfiles_path"
export XDG_CONFIG_HOME="$dotfiles_path"

fish
