export PATH=$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH
export ZSH="/Users/beleap/.oh-my-zsh"
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh
export EDITOR='nvim'

export ZSH_CONF_HOME="$HOME/.dotfiles/zsh"
source $ZSH_CONF_HOME/others.zsh
source $ZSH_CONF_HOME/aliases.zsh
source $ZSH_CONF_HOME/fzf.zsh
source $ZSH_CONF_HOME/tmux.zsh
source $ZSH_CONF_HOME/git.zsh
