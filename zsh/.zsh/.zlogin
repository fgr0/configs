# .zlogin: alternative user startup file for zsh(1) login shells
#
# Alternative startup file for login shells. Sourced after .zshrc

if [[ ! ( -t 0 || -t 1 ) ]]; then
  return
fi

# Print a random, hopefully interesting, adage.
if (( $+commands[fortune] )) && [ ! -f ~/.hushlogin ]; then
  if [[ $OSTYPE == freebsd* ]]; then
    fortune freebsd-tips
  else
    fortune -s
  fi

  print
fi
