# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#export ZSH="/Users/beleap/.oh-my-zsh"
#ZSH_THEME="robbyrussell"
#source $ZSH/oh-my-zsh.sh
export EDITOR='nvim'

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)

### End of Zinit's installer chunk
#
export ZSH_CONF_HOME="$HOME/.dotfiles/zsh"
source $ZSH_CONF_HOME/others.zsh
source $ZSH_CONF_HOME/aliases.zsh
source $ZSH_CONF_HOME/fzf.zsh
source $ZSH_CONF_HOME/tmux.zsh
source $ZSH_CONF_HOME/git.zsh
source $ZSH_CONF_HOME/plugin.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export GOPATH=/Users/beleap/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:/Users/beleap/bin:/usr/local/bin:/Users/beleap/bin:/usr/local/bin:/Users/beleap/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/Library/Apple/usr/bin:/Users/beleap/.zinit/polaris/bin:/Users/beleap/go/bin:/usr/local/opt/go/libexec/bin
