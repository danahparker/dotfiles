#!/bin/bash
session_name="lpt"
qis_lpt_folder="$HOME/workplace/LPT/src/AWSSCMQualifiedItemServiceLPT"

cd $qis_lpt_folder
tmux new-session -d -s $session_name

window=0
tmux rename-window 'qis' 
tmux send-keys 'nvim .' C-m

tmux select-window -t 0
