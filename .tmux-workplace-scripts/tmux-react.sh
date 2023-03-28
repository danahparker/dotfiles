#!/bin/bash
react_session_name="ts-react"

react_folder="$HOME/workplace/scm-react-app/src/AWSSCMUIArgoTownsendApp"
react_src_folder="$HOME/workplace/scm-react-app/src/AWSSCMUIArgoTownsendApp/src"
react_integ_folder="$HOME/workplace/scm-react-app/src/AWSSCMUIArgoTownsendIntegrationTests"

gql_folder="$HOME/workplace/scm-graphql-lambda/src/AWSSCMUIPortalGraphQLLambda"
gql_src_folder="$HOME/workplace/scm-graphql-lambda/src/AWSSCMUIPortalGraphQLLambda/src"
gql_integ_folder="$HOME/workplace/scm-graphql-lambda/src/AWSSCMUIPortalGraphQLIntegrationTest"

cd $react_src_folder
tmux new-session -d -s $react_session_name

window=0
tmux rename-window 'react' 
tmux send-keys -t $react_session_name:$window 'nvim .' C-m

window=1
tmux new-window -t $react_session_name:$window -n 'gql' -c $gql_src_folder
tmux send-keys -t $react_session_name:$window "nvim ." C-m

window=2
tmux new-window -t $react_session_name:$window -n 'integ' -c $react_integ_folder
tmux send-keys -t $react_session_name:$window "nvim ." C-m

window=3
tmux new-window -t $react_session_name:$window -n 'ginteg' -c $gql_integ_folder
tmux send-keys -t $react_session_name:$window "nvim ." C-m

window=4
cd $react_folder
tmux new-window -t $react_session_name:$window -n 'bbs' -c $react_src_folder
tmux send-keys -t $react_session_name:$window "cd $react_folder" C-m
tmux send-keys -t $react_session_name:$window "nvim .env.development.local" C-m
tmux split-window -hf
tmux send-keys -t $react_session_name:$window "cd $gql_folder" C-m
tmux send-keys -t $react_session_name:$window "bbsa"
tmux split-window
tmux send-keys -t $react_session_name:$window "cd $gql_folder" C-m
tmux send-keys -t $react_session_name:$window "nvim dev/start.alpha.js" C-m
tmux select-pane -t 0
tmux split-window
tmux send-keys -t $react_session_name:$window "cd $gql_folder" C-m
tmux send-keys -t $react_session_name:$window "nvim src/auth/scos_credentials.js" C-m

window=5
tmux new-window -t $react_session_name:$window -n 'integ bbw' -c $react_integ_folder
tmux send-keys -t $react_session_name:$window "odin && bbaw"

window=6
tmux new-window -t $react_session_name:$window -n 'ginteg bbs' -c $gql_integ_folder
tmux send-keys -t $react_session_name:$window "bbs"

tmux select-window -t 0
