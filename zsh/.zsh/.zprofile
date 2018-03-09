# .zprofile: user startup file for zsh(1) login shells
#
# On some systems /etc/zprofile is used to set system specific paths,
# therefore we need to define paths here instead of .zshenv so we can 
# define the order.

#
# Paths
#

prefix='/usr/local'

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path
typeset -gUT INFOPATH infopath

# Set search paths
cdpath=(
  $cdpath
)

fpath=(
  $ZDOTDIR/func
  $fpath
)

infopath=(
  $prefix/share/info
  $infopath
)

manpath=(
  $prefix/share/man
  $manpath
)

path=(
  $HOME/.local/{bin,sbin}
  $prefix/{bin,sbin}
  $path
)

# clean up
unset prefix
