source ./amazon.sh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/bin:$PATH"

export EDITOR='/usr/local/bin/nvim'
export GOPATH="$HOME/go"
export NVIM="$HOME/.config/nvim"
export OBSIDIAN="$HOME/Documents/obsidian/"
export REPOS="$HOME/repos"
export VIMRC="$NVIM/init.lua"
export ZSHRC="$HOME/.zshrc"

# git aliases
export MAIN_BRANCH_NAME='mainline'
alias g='git'
alias ga="git add"
alias gap="git add -p"
alias gau="git add -u"
alias gaup="git add -u -p"
alias gb="git branch"
alias gc="git commit"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcom="git checkout $MAIN_BRANCH_NAME --"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdom="git diff origin/$MAIN_BRANCH_NAME"
#alias gpuom="git push -u origin main"
alias gl="git log"
alias gp="git pull"
alias grbm="git rebase $MAIN_BRANCH_NAME"
alias gs="git status"
alias gsh="git stash"
alias gsha="git stash apply"
alias gshs="git stash save"
alias gshl="git stash list | cat"
alias gsw="git switch"
alias gui="gitui"

# exa aliases
alias e='exa -a --icons'
alias el='exa -ahl --icons'
alias et='exa -h --icons --tree'
alias l='exa -ahl --icons'
alias ls='exa -a --icons'

# random aliases
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias c='clear'
alias cors='open -n -a "Google Chrome" --args --user-data-dir=/tmp/temp_chrome_user_data_dir http://localhost:3000/ --disable-web-security'
alias init='kinit && mwinit -s -o'
alias nds='ninja-dev-sync'
alias pomo='porsmo'
alias sz='source ~/.zshrc'
alias v='nvim'

# bun completions
[ -s "/Users/danapar/.bun/_bun" ] && source "/Users/danapar/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# zoxide
eval "$(zoxide init zsh)"

# https://github.com/jimeh/tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
eval "$(tmuxifier init -)"
alias tes="tmuxifier edit-session"
alias tks="tmux kill-session -t"
alias tls="tmuxifier load-session"

# https://github.com/romkatv/powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # load nvm bash_completion
