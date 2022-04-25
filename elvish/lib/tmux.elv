if (and (eq $E:TMUX '') (eq $E:INTEGRATED '')) {
	exec tmux -f $E:DOTFILES_PATH/tmux/.tmux.conf
}
