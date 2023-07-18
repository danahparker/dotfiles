#=========================================================
#
# LEAVE THESE AT TOP OF ZSHRC
#
#=========================================================

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable zoxide
eval "$(zoxide init zsh)"

# Enable t-smart-tmux-session-manager
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

#=========================================================
#
# GIT ALIASES
#
#=========================================================

export MAIN_BRANCH_NAME='mainline'

alias g='git'
alias ga="git add"
alias gap="git add -p"
alias gau="git add -u"
alias gaup="git add -u -p"
alias gb="git branch"
alias gbc="git branch | cat"
alias gc="git commit"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcom="git checkout $MAIN_BRANCH_NAME --"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdom="git diff origin/$MAIN_BRANCH_NAME"
#alias gpuom="git push -u origin main"
alias gs="git status"
alias gsh="git stash"
alias gsha="git stash apply"
alias gshs="git stash save"
alias gshl="git stash list | cat"
alias gsw="git switch"
alias gui="gitui"
# Dotfiles git alias. Use df like you would git e.g. df add, df commit, etc.
alias df='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

#=========================================================
#
# BRAZIL ALIASES
#
#=========================================================

# brazil build alises
alias b='brazil-build'
alias bb='brazil-build'
alias bbap='brazil-build apollo-pkg'
alias bbi='brazil-build install'
alias bbr='brazil-build release'
alias bbs='brazil-build start'
# brazil clean alises
alias bbc='brazil-build clean'
alias bbcr='brazil-build cleaner'
# brazil cypress aliases
alias bbco='brazil-build cypress:open'
# brazil build alises
# brazil integration test aliases
alias bbsa='brazil-build start:alpha'
alias bbw='brazil-build watch'
alias bbat='brazil-build alpha-test'
alias bbaw='brazil-build alpha-watch'
alias bbbt='brazil-build beta-test'
alias bbbw='brazil-build beta-watch'
alias bblt='brazil-build local-test'
alias bblw='brazil-build local-watch'
alias bbpw='brazil-build prod-watch'
# brazil test aliases
alias bbt='brazil-build test'
alias bbto='brazil-build test:once'
alias bbtou='brazil-build test:once -- -u'
alias bbdebug='brazil-build single-unit-test -Dtests.additional.jvmargs=“-Xrunjdwp:transport=dt_socket,server=y,address=localhost:58104”'
# brazil package cache alises
alias bpcc='brazil-package-cache clean'
alias bpcs='brazil-package-cache stop; brazil-package-cache start'
# brazil recursive aliases
alias brc='brazil-recursive-cmd'
alias brcbb='brazil-recursive-cmd brazil-build'
# brazil ws aliases
alias bw='brazil ws'
alias bwc='brazil ws create --root'
alias bwr='brazil ws remove'
alias bws='brazil ws show'
alias bwsc='brazil ws clean'
alias bwsmd='brazil ws --sync --md'
alias bwu='brazil ws use'
alias bwup='brazil ws use -p'
alias bwuv='brazil ws use -vs'
alias bwuvs='brazil ws use -vs'
alias bbv='brazil-build visualize'
# Steps to do a full sync/clean/install
brazil-full-sync() {
    brazil ws sync --md
    brazil-build cleaner
    brazil-build install
}
# Sometimes xcode messes up.
# These are the commands that helped fix my xcode related issues.
brazil-fix-xcode() {
    sudo rm -rf /Library/Developer/CommandLineTools
    xcode-select --install
}

#=========================================================
#
# AMAZON WORKSPACE PATH ALIASES
#
#=========================================================

export WORKPLACE="$HOME/workplace"
alias wp="cd $WORKPLACE"
alias graph="cd $WORKPLACE/scm-graphql-lambda/src/AWSSCMUIPortalGraphQLLambda/src"
alias react="cd $WORKPLACE/scm-react-app/src/AWSSCMUIArgoTownsendApp/src"
alias integ="cd $WORKPLACE/scm-react-app/src/AWSSCMUIArgoTownsendIntegrationTests"
alias ginteg="cd $WORKPLACE/scm-graphql-lambda/src/AWSSCMUIPortalGraphQLIntegrationTest/cypress/integration"
alias mds="cd $WORKPLACE/scm-mds/src/AWSSCMMaterialDefinitionService"
alias mdcs="cd $WORKPLACE/scm-mds/src/AWSSCMMaterialDefinitionChangeService"
alias ams="cd $WORKPLACE/AWSSCMApprovalMatrixService/src/AWSSCMApprovalMatrixService"
alias amsd="cd $WORKPLACE/AWSSCMApprovalMatrixService/src/AWSSCMApprovalMatrixServiceDeploy"
alias cds="cd $WORKPLACE/AWSSCMChangeDefinitionService/src/AWSSCMChangeDefinitionService"
alias cdsm="cd $WORKPLACE/AWSSCMChangeDefinitionService/src/AWSSCMChangeDefinitionServiceModel"

#=========================================================
#
# OTHER AMAZON PATHES/ALIASES
#
#=========================================================

# Add toolbox to path
export PATH=$HOME/.toolbox/bin:$PATH
# Create env variable for cloud desktop
export HOSTNAME='dev-dsk-danapar-2b-8f7cb5e5.us-west-2.amazon.com'
export CLOUD_DESK='dev-dsk-danapar-2b-8f7cb5e5.us-west-2.amazon.com'
# Create env variable for aliased cloud desktop
export EZ_HOSTNAME='danapar-clouddesk.aka.corp.amazon.com'
# Cognito env variables
export COGNITO_POOL_ID='us-west-2_cggGZ35hh'
export COGNITO_POOL_ARN='arn:aws:cognito-idp:us-west-2:509020482313:userpool/us-west-2_cggGZ35hh'
export COGNITO_POOL_APP_CLIENT_ID='5ji9tlm7if1n05uu7okqavb4gd'
export COGNITO_DOMAIN_NAME='scm-ui-danapar-beta.auth.us-west-2.amazoncognito.com'
# Portal env variables
export PORTAL_DOMAIN_NAME='scm-portal-danapar-beta-pdx.aka.amazon.com'
export PORTAL_API_GATEWAY_DOMAIN_NAME='d-bxiff7y6j2.execute-api.us-west-2.amazonaws.com'
# Odin material set env variable
export ODIN_MATERIAL_SET_NAME='com.amazon.certificates.scm-portal-danapar-beta-pdx.aka.amazon.com-STANDARD_SSL_SERVER_INTERNAL_ENDPOINT-RSA-Chain'
# Get odin material set for integration tests
alias odin="ssh -fNL 2009:localhost:2009 $CLOUD_DESK"
# Rio documentation: https://code.amazon.com/packages/AWSSCMPLMDevTools/blobs/mainline/--/Readme.md
source $HOME/workplace/DevTools/src/AWSSCMPLMDevTools/rio/rio.sh
# https://code.amazon.com/packages/AWSSCMUIArgoTownsendAppDeploy/blobs/mainline/--/README.md
export DEV_ARGO_STATIC_ASSETS_S3_BUCKET='scm-ui-danapar-static-assets-beta-us-west-2-0'
export DEV_ARGO_DYN_RES_TAG_EXP_S3_BUCKET='scm-ui-danapar-dyn-res-tag-exprt-beta-us-west-2-0'
# Open code.amazon.com page for current package
open-repo() {
    local repo=$(echo `pwd`| awk -F'/' '{print $7}')
    local branch=$(git rev-parse --abbrev-ref HEAD)
    open https://code.amazon.com/packages/$repo/trees/$(git rev-parse --abbrev-ref HEAD)
}
# Search code.amazon.com page for a package with input string
search-repo() {
    open "https://code.amazon.com/search?utf8=✓&term=&exact=&filepath=&repository=*$1*&group=&source_component_type=&graph_type=&ext=&commit=Search"
}
open-td-sim() {
open "https://sim.amazon.com/issues/TOWNSENDDEVICES-$1"
}
# Open code.amazon.com page for a given file
# open-amazon-file() {
#   if [[ -n "$(alias find 2>/dev/null)" ]]; then
#       unalias find
#   fi
#   if [[ -n "$(alias sed 2>/dev/null)" ]]; then
#       unalias sed
#   fi
#   local filename=$1
#   local repo_name=$(echo `pwd`| awk -F'/' '{print $5}')
#   local base_path=$(pwd | awk -F '/AWSSCMChangeDefinitionService/' '{print $1"/AWSSCMChangeDefinitionService/"$2}')
#   local url="https://code.amazon.com/packages/$repo_name/blobs/mainline/--/$(realpath --relative-to="$base_path" "$filename" | sed 's/\.java//g')"
#   open "$url"
# }
# Add directory to ninja dev sync
# You will have to run `kinit -f && mwinit -o -s` in cloud desktop
# (and probably local machine) for this to work.
ninja-add-ws() {
    ninja-dev-sync -add $WORKPLACE/$1 --add-host $EZ_HOSTNAME -add-remote /home/danapar/workplace/$1 -setup
}
# Midway authentication
alias init='kinit -f && mwinit -o -s'
# samdev alias
alias sam="source ~/samdev.env; brazil-build-tool-exec sam"

#=========================================================
#
# DEFAULT ZSHRC STUFF
#
#=========================================================

#ZSH_THEME="powerline10k/powerline10k"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy/mm/dd"
ZSH_DISABLE_COMPFIX="true"
plugins=(
  zsh-autosuggestions
)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

#=========================================================
#
# OTHER
#
#=========================================================

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/Cellar/ruby@2.7/2.7.7/bin:$PATH"
export PATH="/Users/danapar/.local/share/nvim/mason/packages/jdtls/lombok.jar:$PATH"

#=========================================================
#
# POSTMAN SCRIPTS
#
#=========================================================

export POSTMAN_ROOT=$WORKPLACE/TownsendDevices/src/TownsendDevices/postman

function recreate_approval_matrices_helper_function {
    `isengardcli creds --role Admin $1`

    newman run -e $2 --env-var aws_access_key_id=$AWS_ACCESS_KEY_ID --env-var aws_secret_access_key=$AWS_SECRET_ACCESS_KEY --env-var sessionToken=$AWS_SESSION_TOKEN $POSTMAN_ROOT/collections/LabApprovalMatrix.postman_collection.json
    newman run -e $2 --env-var aws_access_key_id=$AWS_ACCESS_KEY_ID --env-var aws_secret_access_key=$AWS_SECRET_ACCESS_KEY --env-var sessionToken=$AWS_SESSION_TOKEN --folder CreateApprovalMatrices --folder AddEntries $POSTMAN_ROOT/collections/LabApprovalMatrix.postman_collection.json
}

function recreate_approval_matrices_alpha {
    recreate_approval_matrices_helper_function scm-accts+alpha-us-west-2-scm-appmat-cell-0000@amazon.com $POSTMAN_ROOT/environments/Alpha.postman_environment.json
}

function recreate_approval_matrices_beta {
    recreate_approval_matrices_helper_function scm-accts+beta-us-west-2-scm-appmat-cell-0000@amazon.com $POSTMAN_ROOT/environments/Beta.postman_environment.json
}

function recreate_approval_matrices_lab_alpha {
    recreate_approval_matrices_helper_function scm-accts+prod-us-west-2-scm-appmat-cell-0011@amazon.com $POSTMAN_ROOT/environments/"Lab126 Alpha (Cell 11).postman_environment.json"
}

function recreate_approval_matrices_lab_beta {
    recreate_approval_matrices_helper_function scm-accts+prod-us-west-2-scm-appmat-cell-0008@amazon.com $POSTMAN_ROOT/environments/"Lab126 Beta (Cell 8).postman_environment.json"
}

function recreate_approval_matrices_lab_gamma {
    recreate_approval_matrices_helper_function scm-accts+prod-us-west-2-scm-appmat-cell-0009@amazon.com $POSTMAN_ROOT/environments/"Lab126 Gamma (Cell 9).postman_environment.json"
}

function recreate_approval_matrices_lab_prod {
    recreate_approval_matrices_helper_function scm-accts+prod-us-west-2-scm-appmat-cell-0010@amazon.com $POSTMAN_ROOT/environments/"Lab126 Prod (Cell 10).postman_environment.json"
}
source ~/powerlevel10k/powerlevel10k.zsh-theme

#=========================================================
#
# PERSONAL ALIASES
#
#=========================================================

# Open alacritty configuration
alias arc="nvim $HOME/.alacritty.yml"
# Ctrl + l doesn't work when using vim-tmux-navigator
alias c='clear'
# Default exa command. Mimics ld
alias e='exa -a --icons'
# Mimics ls -l
alias el='exa -ahl --icons'
# View file structure in a tree view
alias et='exa -ahl --icons --tree'
# inlyne command alias to always use dark theme
in() {
    inlyne "$1" --theme dark
}
# Replace ls with exa.
alias ls='exa -a --icons'
# Attach to tmux session with ta <session-name>
alias ta='tmux attach-session -t'
# Open preset tmux sessions
alias tca="source $HOME/.tmux-workplace-scripts/tmux-create-all.sh"
# Kill a specific tmux session with tk <session-name>
alias tk="tmux kill-session -t"
# Kill all tmux sessions
alias tka="pkill -f tmux"
# List all tmux sessions
alias tl='tmux ls'
# Create new tmux session with session name being the current directory
alias tn='tmux new -s $(basename "`pwd`")'
# Open NeoVim with v
alias v='nvim'
# Open this file
alias zrc="nvim $HOME/.zshrc"
 

#=========================================================
#
# LEAVE THESE AT THE BOTTOM OF ZSHRC
#
#=========================================================

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# Source zsh syntax highlighting for when typing commands
source /Users/danapar/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Source fzf and provide alias for ez upgrade
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias fzf-upgrade="cd $HOME/.fzf && git pull && ./install"
