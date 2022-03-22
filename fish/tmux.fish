if status is-interactive
and not set -q TMUX
and not set -q INTEGRATED_TERMINAL
and test $SHLVL -lt 4
    exec tmux -f $DOTFILES_PATH/tmux/.tmux.conf
end

alias sotmux "tmux source $DOTFILES_PATH/tmux/.tmux.conf"
alias tinstall "$DOTFILES_PATH/tmux/plugins/tpm/bin/install_plugins"
alias tupdate "$DOTFILES_PATH/tmux/plugins/tpm/bin/update_plugins"
alias tclean "$DOTFILES_PATH/tmux/plugins/tpm/bin/clean_plugins"
