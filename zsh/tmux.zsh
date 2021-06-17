if [[ -z "$TMUX" && -z "$INTEGRATED" ]]
then
    tmux new-session -s beleap -d
	tmux attach-session
fi
