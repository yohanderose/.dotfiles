#!/bin/sh

current_session=$(tmux display-message -p '#S')

tmux split-window -v -p 30
tmux send-keys  -t "$current_session.{bottom}" "live-server" 'Enter';
tmux split-window -h -p 75 -b 
tmux rename-window "web"
