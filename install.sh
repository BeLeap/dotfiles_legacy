#!/bin/bash

sudo apt install neovim curl build-essential -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
PATH=$HOME/.cargo/bin:$PATH cargo install zoxide zellij lsd bat hexyl starship
