#!/bin/bash

# https://bash-prompt-generator.org
NEW_PS1='\[\e[38;5;105m\]\u\[\e[0m\]@\[\e[38;5;193m\]\h\[\e[0m\] \[\e[38;5;214m\]\\$\[\e[0m\] '

# If PS1 already exists in ~/.bashrc, replace it. Otherwise, append.
if grep -q "^PS1=" ~/.bashrc; then
  ESCAPED_NEW_PS1=$(printf '%s\n' "$NEW_PS1" | sed -e 's/\\/\\\\/g' -e 's/[&|]/\\&/g')
  sed -i "s|^PS1=.*|PS1='${ESCAPED_NEW_PS1}'|" ~/.bashrc
else
  echo "PS1='$NEW_PS1'" >> ~/.bashrc
fi

# If EDITOR already exists in ~/.bashrc, replace it. Otherwise, append.
if grep -q "^export EDITOR=" ~/.bashrc; then
  sed -i "s|^export EDITOR=.*|export EDITOR=vim|" ~/.bashrc
else
  echo "export EDITOR=vim" >> ~/.bashrc
fi

echo "fixed bash"
