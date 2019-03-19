# .zshenv: user startup file for zsh(1)
#
# This file is read for every invocation of zsh.

# 
# Hostname
#

export HOST=`hostname`

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

export LESS='-MRSi -x4 -z-4'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Locations
#

# Temporary Files
if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

# Location of zsh startup files
export ZDOTDIR=${ZDOTDIR:-"$HOME/.zsh"}

# Setup paths in .zprofile to ensure priority over paths set by the system
# Ensure that a non-login, non-interactive shell has a defined environment
if [[ ! -o LOGIN && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
