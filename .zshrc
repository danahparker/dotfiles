# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# https://github.com/romkatv/powerlevel10k
source ~/powerlevel10k/powerlevel10k.zsh-theme
export ZSH_THEME="powerlevel10k/powerlevel10k"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source "$HOME/clouddesk.sh"
source "$HOME/odin.sh"

export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export EDITOR="/opt/homebrew/bin/nvim"
export GOPATH="$HOME/go"
export ORG="$HOME/orgfiles/"
export REPOS="$HOME/repos"
export VIMRC="$NVIM/init.lua"
export ZSHRC="$HOME/.zshrc"

export DOTFILES="$HOME/dotfiles"
export NVIM="$DOTFILES/.config/nvim"

export OBSIDIAN="$HOME/Documents/obsidian/"
export AMAZON="$OBSIDIAN/Amazon"
export PERSONAL="$OBSIDIAN/Personal"

# brazil aliases
alias b="brazil-build"
alias bb="brazil-build"
alias bbaw="brazil-build alpha-watch"
alias bbbw="brazil-build beta-watch"
alias bbpw="brazil-build prod-watch"
alias bbco="brazil-build cypress:open"
alias bbi="brazil-build install"
alias bblt="brazil-build local-test"
alias bbs="brazil-build start"
alias bbsa="brazil-build start:alpha"
alias bwc="brazil ws create --name"
alias bwu="brazil ws use --package"

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

# eza aliases
alias l='eza --long --all --icons=always'
alias ls='eza --all --icons=always'

# chrome alias for cors
# use "chrome-dws"
alias chrome='open -n -a /Applications/Google Chrome.app/Contents/MacOS/Google Chrome'
alias chrome-tmp='chrome --args --user-data-dir="/tmp/chrome_dev_test"'
alias chrome-dws='chrome-tmp --disable-web-security'

# random aliases
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias cors='open -n -a "Google Chrome" --args --user-data-dir=/tmp/temp_chrome_user_data_dir http://localhost:3000/ --disable-web-security'
alias init='kinit && mwinit -f -s -o'
alias nds='ninja-dev-sync'
alias pomo='porsmo'
alias sz='source ~/.zshrc'
alias tas='tmux attach-session -t'
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

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # load nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # load nvm bash_completion

# history setup for autocomplete
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# auto suggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Amazon Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

export PATH=$PATH:$HOME/.toolbox/bin
eval "$(/opt/homebrew/bin/brew shellenv)"
# Set up mise for runtime management
eval "$(mise activate zsh)"
source /Users/danapar/.brazil_completion/zsh_completion
export JAVA_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-23.jdk/Contents/Home"

bindkey '\e[3;5~' backward-kill-word

source $HOME/.amazon_env_vars.sh
