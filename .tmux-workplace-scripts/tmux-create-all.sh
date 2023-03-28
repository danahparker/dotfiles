#!/bin/bash

tmux kill-session -t config
source $HOME/.tmux-workplace-scripts/tmux-config.sh
tmux detach

tmux kill-session -t lpt
source $HOME/.tmux-workplace-scripts/tmux-lpt.sh
tmux detach

tmux kill-session -t obsidian
source $HOME/.tmux-workplace-scripts/tmux-obsidian.sh
tmux detach

tmux kill-session -t mds
source $HOME/.tmux-workplace-scripts/tmux-mds.sh
tmux detach

tmux kill-session -t ts-react
source $HOME/.tmux-workplace-scripts/tmux-react.sh
tmux detach

tmux kill-session -t ts-repo
source $HOME/.tmux-workplace-scripts/tmux-townsend-devices.sh
tmux detach

cd $HOME/.tmux-workplace-scripts

echo "Created tmux sessions. Run tmux ls to see sessions."
