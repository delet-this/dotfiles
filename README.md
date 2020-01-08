# dotfiles

![alt text](.dotfiles/screenshot.png)

## Installation

Get the whole thing:

```
wget -O - https://raw.githubusercontent.com/delet-this/dotfiles/master/.local/bin/installdots.sh | /bin/sh
```
Get specific files:

```
git clone --bare --depth 1 --recursive https://github.com/delet-this/dotfiles.
git $HOME/.dotfiles
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout HEAD .zshrc
dotfiles checkout HEAD .zprofile
```
