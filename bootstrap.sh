#!/bin/sh

cd "$(dirname "${0}")";

echo "Updating..."
git pull origin master

echo "Creating symlinks..."
for src in $(find * -depth 1 -name '*'); do
  ln -sf ".dotfiles/${src}" "${HOME}/.$(basename ${src})"
done

echo "Done"