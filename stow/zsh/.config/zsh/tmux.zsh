if [ "$TMUX" = "" ]; 
    then tmux new-session -A -s $HOST; 
fi
