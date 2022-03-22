#!/bin/bash

if ! command -v fish &> /dev/null
then
  echo "Fish is not installed. Please install it first."
  exit 1
fi

deactivate() {
  unset FISH_CONFIG_PATH
}

export FISH_CONFIG_PATH="${BASH_SOURCE}/fish"

fish
