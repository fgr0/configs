#
# Completion
#

setopt complete_in_word     # Complete from both ends of a word
setopt always_to_end        # Move cursor to the end of the word
setopt auto_list            # List choices
setopt auto_menu            # Show completion menu on a successive tab press
unsetopt list_beep          # No BOOP for autocompletion list
unsetopt menu_complete      # Dont autoselect the first completion entry

# Add zsh-completion to $fpath
fpath=($ZDOTDIR/ext/zsh-completions/src $fpath)

autoload -Uz compinit && compinit -i

WORDCHARS=''

# Menu Select
zmodload -i zsh/complist

# General completion behavior
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' ignore-parents parent pwd .. directory
# Case insensitive, partial-word, and then substring completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion::complete:*' use-cache 1

# Completion layout and format
zstyle ':completion:*' group-name ''
zstyle ':completion:*' auto-description '# specify: %d'
zstyle ':completion:*' format '%F{white}# %d%f'
zstyle ':completion:*:messages' format '%F{white}# %d%f'
zstyle ':completion:*:warnings' format '%F{white}# no matches%f'
zstyle ':completion:*:corrections' format '%F{white}# %d (errors: %e)%f'
zstyle ':completion:*:descriptions' format '%F{white} %d%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' verbose true

# Styles for _approximate
zstyle ':completion:*:approximate:*' insert-unambiguous true
zstyle ':completion:*:approximate:*' max-errors 2 numeric
# Increase number of errors based on length
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3>7?7:($#PREFIX+$#SUFFIX)/3))numeric)'

# Styles for _match
zstyle ':completion:*:match:*' original true
zstyle ':completion:*:match:*' insert-unambiguous true

# Styles for cd
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*' squeeze-slashes true

# Styles for kill
zstyle ':completion:*:*:*:*:processes' command "ps -o pid,user,command -w"

# Styles for man
zstyle ':completion:*:manuals' separate-sections true

# Populate hostname completion.
# TODO: Look for alternative methods?
zstyle -e ':completion:*:hosts' hosts 'reply=(
  ${=${=${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
  ${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
  ${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'

# Don't complete uninteresting users...
zstyle ':completion:*:*:*:users' ignored-patterns \
  adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
  dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
  hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
  mailman mailnull mldonkey mysql nagios \
  named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
  operator pcap postfix postgres privoxy pulse pvm quagga radvd \
  rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
