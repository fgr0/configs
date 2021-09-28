#
# Aliases
#

alias ccd='clear && cd'
alias rm='rm -i'

alias plz='eval sudo $(fc -nl -1)'

alias ls='ls -G'
alias ll='ls -lh'
alias la='ll -A'

alias df='df -hk'

autoload -Uz zmv
alias zcp='zmv -C'
alias zln='zmv -L'
alias zmw='zmv -W'
alias zmv='noglob zmv'

(( $+commands[pwsh] )) && alias pwsh='pwsh -NoLogo'
(( $+commands[youtube-dl] )) && alias yt='youtube-dl'
