# dotfiles

All of my dotfile configurations for programming and whatnot

## Dependencies

### Homebrew

I am on MacOS as of now, so I use homebrew as my package manager.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### git

```sh
brew install git
```

### NeoVim

My text editor of choice.

```sh
brew install neovim
```

### stow

What I use to manage these dotfiles.

```sh
brew install stow
```

### tmux

My terminal multiplexor of choice.

```sh
brew install tmux
```

### tmuxifier

Helps manage tmux sessions.

```sh
git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
```

### WezTerm

My terminal of choice as of now.

```sh
brew install --cask wezterm
```

### Nerd Font

Allows for nice fonts in the terminal.

```sh
brew tap homebrew/cask-fonts
brew install font-meslo-lg-nerd-font
```

### powerlevel10k

Helps make the terminal look nice.

```sh
brew install powerlevel10k
```

### zsh autosuggestions

Auto-suggestions in the terminal.

```sh
brew install zsh-autosuggestions
```

### zsh syntax highlighting

Syntax highlights terminal commands.

```sh
brew install zsh-syntax-highlighting
```

### fzf

Makes ctrl + r better, among other things.

```sh
brew install fzf
```

### eza

Better `ls`.

```sh
brew install eza
```

### zoxide

Better `cd`.

```sh
brew install zoxide
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
