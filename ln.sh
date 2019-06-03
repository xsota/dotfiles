#!/bin/sh

for file in `find $PWD -name '.*' -not -name '.*~' -and -not -name '.gitignore' -type f -print0 |xargs -0 -n1 basename`; do
    ln -sf $PWD/$file $HOME/$file
done
