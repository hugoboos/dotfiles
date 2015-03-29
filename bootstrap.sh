#!/bin/sh

cd "$(dirname "${0}")";

create_link() {
  local src=${1} dst=${2}
  local currentSrc="$(readlink ${dst})"

  if [ "$currentSrc" == "$src" ]; then
    return
  fi

  ln -sf "${src}" "${dst}"
}

echo "Updating..."
git pull origin master

echo "Creating symlinks..."
for src in $(find * -depth 1 -name "*" -not -path "sublime/*"); do
  create_link ".dotfiles/${src}" "${HOME}/.$(basename ${src})"
done

echo "Done"