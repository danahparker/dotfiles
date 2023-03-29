#!/bin/bash
session_name="config"

config_folder="$HOME/.config"
vim_config_folder="$HOME/.config/nvim"
tmux_config_folder="$HOME/.tmux-workplace-scripts"

cd $config_folder
tmux new-session -d -s $session_name

window=0
tmux rename-window 'config' 
tmux send-keys 'exa --icons --tree nvim' C-m

window=1
tmux new-window -t $session_name:$window -n 'tmux' -c $tmux_config_folder
tmux send-keys 'exa --icons .' C-m

tmux select-window -t 0
