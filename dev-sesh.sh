#!/bin/sh

current_session=$(tmux display-message -p '#S')
current_conda=$CONDA_DEFAULT_ENV

tmux split-window -v -p 75 -b 
tmux split-window -h -p 50 
tmux send-keys  -t "$current_session.{left}" "conda activate $current_conda" 'Enter'
tmux send-keys  -t "$current_session.{right}" "conda activate $current_conda" 'Enter'
tmux send-keys  -t "$current_session.{left}" "clear && figlet Welcome" 'Enter'
tmux send-keys  -t "$current_session.{right}" "clear" 'Enter'
tmux send-keys  -t "$current_session.{bottom}" "clear" 'Enter'
tmux rename-window "dev"
