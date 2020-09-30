#----------------------------------
#
# GIT ALIASES
#
#----------------------------------

alias gi="git init"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git pull"
alias gpom="git push origin master"
alias gpuom="git push -u origin master"
alias gb="git branch"
alias gbc="git branch | cat"
alias gm="git merge"
alias gco="git checkout"

#----------------------------------
#
# OTHER ALIASES
#
#----------------------------------

alias df='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
#alias ctags="`brew --prefix`/bin/ctags"
alias v='nvim'

#---------------------------------
#
# DEFAULT ZSHRC STUFF
#
#---------------------------------

ZSH_THEME=""
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy/mm/dd"
plugins=(
  git
  z
  zsh-autosuggestions
)

export ZSH="/home/danahparker/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

#---------------------------------
#
# OTHER
#
#---------------------------------

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#----------------------------------
#
# PURE PROMPT
#
#----------------------------------

# nodejs, npm, and pure-prompt
# Install by `sudo apt install nodejs` and then `sudo apt install npm`
# Then install `pure-prompt` (https://github.com/sindresorhus/pure)
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
zstyle :prompt:pure:git:stash show yes
zstyle :prompt:pure:prompt:error color red
zstyle :prompt:pure:prompt:success color green
prompt pure

#----------------------------------
#
# LS COLORS
#
#----------------------------------

# Removes the background colors for any ls
eval "$(dircolors -p | \
    sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | \
    dircolors /dev/stdin)"
