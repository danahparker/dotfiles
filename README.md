# dotfiles

All of my dotfile configurations for programming and whatnot

## Dependencies

### Homebrew

I am on MacOS as of now, so I use homebrew as my package manager.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/cask-fonts
brew install git neovim stow tmux powerlevel10k zsh-autosuggestions zsh-syntax-highlighting fzf eza zoxide font-meslo-lg-nerd-font
brew install --cask wezterm
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
```

## Installation

Clone the repo

```sh
cd $HOME
gh repo clone danahparker/dotfiles
cd dotfiles
```

Then use GNU stow to create the symlinks

```sh
stow .
```
