#!/bin/sh

current_session=$(tmux display-message -p '#S')
current_conda=$CONDA_DEFAULT_ENV

tmux split-window -v
tmux send-keys "conda activate $current_conda" 'Enter' 'clear' 'Enter'
