#!/bin/bash
session_name="obsidian"
obsidian_folder="/Users/danapar/Documents/obsidian"

cd $obsidian_folder
tmux new-session -d -s $session_name

window=0
tmux rename-window 'obsi' 
tmux send-keys 'nvim .' C-m

tmux select-window -t 0
