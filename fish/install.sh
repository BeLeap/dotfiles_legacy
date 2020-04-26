#!/bin/bash
echo "[PROCESS] create fish config directory"
cd ~/
mkdir .config
cd ~/.config
mkdir fish
echo "[LINK] fish config"
ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
echo "[INSTALL] exa, ripgrep,(cargo)"
cargo install exa ripgrep hexyl bat fd-find
echo "[CHANGE_DIR] home"
cd ~/
echo "[INSTALL] oh-my-fish(curl)"
curl -L https://get.oh-my.fish | fish
echo "[INSTALL] nvm(curl+omf)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
fish -c "omf install nvm"
echo "[REGISTER] fish shell"
chsh -S /usr/bin/fish
