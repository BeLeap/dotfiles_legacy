if [[ -z "$TMUX" && -z "$INTEGRATED" ]]
then
    exec tmux
fi
