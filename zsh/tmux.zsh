if [[ -z "$TMUX" && -z "$INTEGRATED" ]]
then
    tmux new-session -s beleap -d
	tmux set-environment VIRTUAL_ENV $VIRTUAL_ENV
	tmux attach-session
fi

if [[ -n "$VIRTUAL_ENV" ]]
then
	source $VIRTUAL_ENV/bin/activate
fi
