#!/bin/bash
echo "[PROCESS] create fish config directory"
cd ~/
mkdir .config
cd ~/.config
mkdir fish
echo "[LINK] fish config"
ln -s ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
echo "[INSTALL] fish, git, curl, make(apt)"
sudo apt install fish git curl make -y
echo "[CHANGE_DIR] home"
cd ~/
echo "[INSTALL] fzf(apt)"
sudo apt install fzf -y
echo "[CHANGE_DIR] home"
cd ~/
echo "[INSTALL] cargo(apt)"
sudo apt install cargo -y
echo "[INSTALL] exa(cargo)"
cargo install exa
echo "[INSTALL] ripgrep(cargo)"
cargo install ripgrep
echo "[INSTALL] bat(cargo)"
cargo install bat
echo "[INSTALL] hexyl(cargo)"
cargo install hexyl
echo "[CHANGE_DIR] home"
cd ~/
echo "[INSTALL] oh-my-fish(curl)"
curl -L https://get.oh-my.fish | fish
echo "[INSTALL] nvm(curl+omf)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
omf install nvm | fish
echo "[REGISTER] fish shell"
chsh -S /usr/bin/fish
