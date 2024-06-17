# dotfiles

This repository contains my dotfiles. I use [GNU Stow](https://www.gnu.org/software/stow/) to manage them.

## Pre-requisites

- [GNU Stow](https://www.gnu.org/software/stow/)
- [Zsh](https://www.zsh.org/)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [fzf](https://github.com/junegunn/fzf)

### Installation on Arch-based Systems

```bash
sudo yay -S stow zsh zoxide fzf
```

### Installation on Debian-based Systems

```bash
sudo apt install stow zsh zoxide fzf
```

### Installation on Mac-based Systems

```bash
brew install stow zsh zoxide fzf
```

### Change Default Shell to Zsh

```bash
chsh -s $(which zsh)
```

## Installation

```bash
git clone https://github.com/bolleyboll/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow .
```
