#!/bin/bash

tmux kill-session -t mds
tmux kill-session -t ts-react
tmux kill-session -t ts-repo
tmux kill-session -t config
tmux kill-session -t lpt
tmux kill-session -t obsidian

echo "Killed all tmux sessions. Run ./tmux-create-all.sh to re-create sessions."
