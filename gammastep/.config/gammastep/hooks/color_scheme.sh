#!/bin/sh
# if [ "$1" = period-changed ]; then
case $3 in
  night)
    ~/.local/bin/dark-mode.sh dark;;
  # transition)
  daytime)
    ~/.local/bin/dark-mode.sh bright;;
esac
# fi
