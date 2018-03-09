#
# Color Settings
# 

autoload colors && colors

export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'
export LSCOLORS='gxfxcxdxbxegedabagacad'

# FIXME: Do this the platform independent way
alias ls='ls -G'

export GREP_COLOR='37;45'           # BSD.
export GREP_COLORS="mt=$GREP_COLOR" # GNU.

alias grep='grep --color=auto'
