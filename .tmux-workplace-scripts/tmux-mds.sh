#!/bin/bash
session_name="mds"
workspace_name="scm-mds"
infra_workspace_name="scm-mds"

mds_folder="$HOME/workplace/$workspace_name/src/AWSSCMMaterialDefinitionService"
mds_model_folder="$HOME/workplace/$workspace_name/src/AWSSCMMaterialDefinitionServiceModel"
mds_c2j_folder="$HOME/workplace/$workspace_name/src/AWSSCMMaterialDefinitionServiceC2J"
mds_integ_folder="$HOME/workplace/$workspace_name/src/AWSSCMMaterialDefinitionServiceIntegrationTests"

mdcs_folder="$HOME/workplace/$workspace_name/src/AWSSCMMaterialDefinitionChangeService"
mdcs_model_folder="$HOME/workplace/$workspace_name/src/AWSSCMMaterialDefinitionChangeServiceModel"
mdcs_c2j_folder="$HOME/workplace/$workspace_name/src/AWSSCMMaterialDefinitionChangeServiceC2J"

mds_infra_package="$HOME/workplace/$infra_workspace_name/src/AWSSCMMaterialDefinitionServiceInfrastructure"

chng_folder="$HOME/workplace/$workspace_name/src/AWSSCMChangeManagementLibrary"
product_space_folder="$HOME/workplace/$workspace_name/src/AWSSCMProductSpaceConfig"

cd $mds_folder
tmux new-session -d -s $session_name

window=0
cd $mds_model_folder
tmux rename-window 'mds_model' 

window=1
tmux new-window -t $session_name:$window -n 'mds_c2j' -c $mds_c2j_folder

window=2
tmux new-window -t $session_name:$window -n 'mds' -c $mds_folder

window=3
tmux new-window -t $session_name:$window -n 'mdcs_model' -c $mdcs_model_folder

window=4
tmux new-window -t $session_name:$window -n 'mdcs_c2j' -c $mdcs_c2j_folder

window=5
tmux new-window -t $session_name:$window -n 'mdcs' -c $mdcs_folder

window=6
tmux new-window -t $session_name:$window -n 'chng_mgmt' -c $chng_folder

window=7
tmux new-window -t $session_name:$window -n 'psc' -c $product_space_folder

window=8
tmux new-window -t $session_name:$window -n 'integ' -c $mds_integ_folder

window=9
tmux new-window -t $session_name:$window -n 'mds_infra' -c $mds_infra_package

tmux select-window -t 0
