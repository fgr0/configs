# .zlogin: alternative user startup file for zsh(1) login shells
#
# Alternative startup file for login shells. Sourced after .zshrc

#
# Print a random, hopefully interesting, adage.
#

if (( $+commands[fortune] )) && [ ! -f ~/.hushlogin ]; then
  if [[ -t 0 || -t 1 ]]; then
    fortune -s
    print
  fi
fi
