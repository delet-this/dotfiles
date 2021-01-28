#!/bin/sh
git clone --bare --depth 1 --recursive https://github.com/delet-this/dotfiles.git $HOME/.dotfiles
dotfiles () {
   git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles."
else
  echo "Backing up pre-existing dotfiles."
  dotfiles checkout 2>&1 | awk '/\t/' | awk {'print $1'} | xargs -I{} sh -c 'mkdir -p .dotfiles-backup/$(dirname {}); mv {} .dotfiles-backup/{}'
  dotfiles checkout
  echo "Checked out dotfiles."
fi
dotfiles config --local core.sparseCheckout true
printf '/*\n!README.*\n' > $HOME/.dotfiles/info/sparse-checkout
dotfiles sparse-checkout reapply
echo "Enabled sparsity and applied patterns."
