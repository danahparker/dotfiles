#!/bin/bash
session_name="ts-repo"
townsend_devices_folder="$HOME/workplace/TownsendDevices/src/TownsendDevices"
approval_matrix_folder="$HOME/workplace/TownsendDevices/src/TownsendDevices/csvToMatrixEntries/createApprovalMatricesScript"

cd $townsend_devices_folder
tmux new-session -d -s $session_name

window=1
tmux new-window -t $session_name:$window -n 'appmat'
tmux send-keys -t $session_name:$window "cd $approval_matrix_folder" C-m
tmux send-keys -t $session_name:$window "nvim ." C-m

tmux select-window -t 0
