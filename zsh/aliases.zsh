# Neovim
alias vim="nvim"

# Short-handed commands
alias v="vim"
alias p="python3"
alias j="z"

# Configuration Files
alias vimrc="pushd ~/.dotfiles/nvim && vim ./init.vim && popd"
alias zshrc="pushd ~/.dotfiles/zsh && vim ~/.zshrc && popd"
alias sozsh="source ~/.zshrc"
alias tmuxconf="pushd ~/.dotfiles/tmux && vim ./.tmux.conf && popd"

# Typo
alias clera="clear"
alias eixt="exit"

# Rust Commands
alias ls="exa"
alias ll="exa -l"
alias lt="exa -l -T -L2"
alias la="exa -la"

alias cat="bat"
alias od="hexyl"
alias grep="rg"

alias vaultlogin="vault login -method=oidc -path=keycloak"
alias awslogin="saml2aws login -p default --skip-prompt"
