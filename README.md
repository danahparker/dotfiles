# dotfiles

All of my dotfile configurations for programming and whatnot

## Dependencies

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae
brew install git neovim stow tmux powerlevel10k zsh-autosuggestions zsh-syntax-highlighting fzf eza zoxide font-meslo-lg-nerd-font sketchybar
brew install --cask wezterm
git clone https://github.com/jimeh/tmuxifier.git $HOME/.tmuxifier
```

## Installation

```sh
cd $HOME
gh repo clone danahparker/dotfiles
stow $HOME/dotfiles
```
