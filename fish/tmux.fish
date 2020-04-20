if status is-interactive
and not set -q TMUX
    exec tmux
end

alias sotmux "tmux source ~/.tmux.conf"
alias tinstall "~/.tmux/plugins/tpm/bin/install_plugins"
alias tupdate "~/.tmux/plugins/tpm/bin/update_plugins"
alias tclean "~/.tmux/plugins/tpm/bin/clean_plugins"
