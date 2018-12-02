# .zshrc: user startup file for interactive zsh(1) shells
#
# Use for personal configuration of zsh.

#
# Source libs
#

for zconfig (${ZDOTDIR}/lib/*.zsh) source $zconfig
unset zconfig

for zfunc (${ZDOTDIR}/func/[^_]*(:t)) autoload -Uz $zfunc
unset zfunc

#
# Prompt
#

autoload -Uz promptinit && promptinit
prompt laerador
