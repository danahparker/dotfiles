# -------------------- amazon q pre-block  --------------------

[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# -------------------- powerlevel10k  --------------------

# https://github.com/romkatv/powerlevel10k
[ -s "$HOME/powerlevel10k/powerlevel10k.zsh-theme" ] && source ~/powerlevel10k/powerlevel10k.zsh-theme
export ZSH_THEME="powerlevel10k/powerlevel10k"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -------------------- PATH exports --------------------

export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/scripts"
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:$HOME/.emacs.d/bin"
export PATH="$PATH:$HOME/.toolbox/bin"
export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$PATH:$HOME/.local/bin"

# -------------------- env vars --------------------

export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export EDITOR="/opt/homebrew/bin/nvim"
export GOPATH="$HOME/go"
export MANPAGER='nvim +Man!' # read man pages via vim
export ORG="$HOME/orgfiles/"
export REPOS="$HOME/repos"
export VIMRC="$NVIM/init.lua"
export ZSHRC="$HOME/.zshrc"

export DOTFILES="$HOME/dotfiles"
export NVIM="$DOTFILES/.config/nvim"

export OBSIDIAN="$HOME/obsidian"
export AMAZON="$OBSIDIAN/Amazon"
export PERSONAL="$OBSIDIAN/Personal"

# ---------------- brazil aliases --------------------

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
alias bbsaff="brazil-build start:alpha-feature-flags"
alias bwc="brazil ws create --name"
alias bwu="brazil ws use --package"

# -------------------- eza aliases --------------------

alias l='eza --long --all --icons=always'
alias ls='eza --all --icons=always'

#  -------------------- chrome alias for cors --------------------
# use "chrome-dws"
alias chrome='open -n -a /Applications/Google Chrome.app/Contents/MacOS/Google Chrome'
alias chrome-tmp='chrome --args --user-data-dir="/tmp/chrome_dev_test"'
alias chrome-dws='chrome-tmp --disable-web-security'

#  -------------------- other aliases --------------------
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias cors='open -n -a "Google Chrome" --args --user-data-dir=/tmp/temp_chrome_user_data_dir http://localhost:3000/ --disable-web-security'
alias init='kinit && mwinit -f -s -o'
alias nds='ninja-dev-sync'
alias pomo='porsmo'
alias tas='tmux attach-session -t'
alias v='nvim'

# -------------------- bun --------------------

[ -s "/Users/danapar/.bun/_bun" ] && source "/Users/danapar/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# -------------------- zoxide --------------------

eval "$(zoxide init zsh)"

# -------------------- tmuxifier --------------------

# https://github.com/jimeh/tmuxifier
#export PATH="$HOME/.tmuxifier/bin:$PATH"
#eval "$(tmuxifier init -)"
#alias tes="tmuxifier edit-session"
#alias tks="tmux kill-session -t"
#alias tls="tmuxifier load-session"

# -------------------- fzf --------------------

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# -------------------- nvm --------------------

[ -s "$HOME/.nvm/nvm.sh" ] && \. "$HOME/.nvm/nvm.sh"
[ -s "$HOME/.nvm/bash_completion" ] && \. "$HOME/.nvm/bash_completion" 

# -------------------- history --------------------

# setup for autocompletion
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=5000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify
# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# -------------------- zsh auto suggestions --------------------

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# -------------------- zsh syntax highlighting --------------------

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# -------------------- amazon q post-block  --------------------

[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

eval "$(/opt/homebrew/bin/brew shellenv)"
# Set up mise for runtime management
eval "$(mise activate zsh)"
source /Users/danapar/.brazil_completion/zsh_completion
export JAVA_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-23.jdk/Contents/Home"

bindkey '\e[3;5~' backward-kill-word

# -------------------- misc amazon setup --------------------

[ -s "$HOME/clouddesk.sh" ] && source "$HOME/clouddesk.sh"
[ -s "$HOME/odin.sh" ] && source "$HOME/odin.sh"
[ -s "$HOME/.amazon_env_vars.sh" ] && source "$HOME/.amazon_env_vars.sh"

# -------------------- pnpm --------------------

export PNPM_HOME="/home/doonsh/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
