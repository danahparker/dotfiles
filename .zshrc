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

#----------------------------------
#
# SOURCES
#
#----------------------------------

# Auto suggestions
#source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Z
#. `brew --prefix`/etc/profile.d/z.sh

#---------------------------------
#
# DEFAULT ZSHRC STUFF
#
#---------------------------------

ZSH_THEME=robbyrussell
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

echo "~/.zshrc was sourced."
