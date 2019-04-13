#
# ZLE Settings
#

# VI all the way

setopt correct              # correct commands
# setopt correct_all
setopt beep                 # BOOP

setopt combining_chars      # Combine zero-length characters
setopt interactive_comments # Allow comments in interactive shells

setopt brace_ccl            # Allow brace character class list expansion
setopt extended_glob        # Treat the '#', '~' and '^' characters as part of patterns for filename generation
setopt rc_quotes            # Allow '''' to signify a single quote within singly quoted strings

setopt multios              # Write to multiple descriptors
unsetopt clobber            # Dont overwrite existing files with '>' or '>>'

#
# Load Widgets
#

autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-search up-line-or-beginning-search
zle -N down-line-or-search down-line-or-beginning-search

autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu-space-end history-beginning-search-menu

autoload -Uz incarg
zle -N incarg

# Expands .... to ../..
function expand-dot-to-parent-directory-path() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+='/..'
  else
    LBUFFER+='.'
  fi
}
zle -N expand-dot-to-parent-directory-path

# Edit command in external editor
autoload -Uz edit-command-line
zle -N edit-command-line

# Updates editor information when the keymap changes
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}
zle -N zle-keymap-select

# Show and indicator that completion is ongoing
function expand-or-complete-prefix-indicator() {
  zle -R "${COMPLETION_INDICATOR-"..."}"
  zle expand-or-complete-prefix
}
zle -N expand-or-complete-prefix-indicator

# Reset KEYMAP indicator before executing line
function reset-keymap-and-accept-line() {
  zle -K main
  zle accept-line
}
zle -N reset-keymap-and-accept-line

# Inserts 'sudo ' at the beginning of the line.
function prepend-sudo {
  if [[ "$BUFFER" != su(do|)\ * ]]; then
    BUFFER="sudo $BUFFER"
    (( CURSOR += 5 ))
  fi
}
zle -N prepend-sudo

#
# Keybindings
#

bindkey -v

# Completion
bindkey -M main "." expand-dot-to-parent-directory-path
bindkey -M main "\t" expand-or-complete-prefix-indicator
bindkey -M main "^[[Z" reverse-menu-complete

bindkey -M viins ' ' magic-space

# Editing
bindkey -M viins "^Xe" expand-cmd-path
bindkey -M vicmd "^Xe" expand-cmd-path

bindkey -M viins "^Xs" prepend-sudo
bindkey -M vicmd "^Xs" prepend-sudo

bindkey -M viins "^K" kill-buffer
bindkey -M vicmd "^K" kill-buffer

bindkey -M viins "^[q" push-input
bindkey -M vicmd "^[q" push-input

bindkey -M viins "^[e" edit-command-line
bindkey -M vicmd "^[e" edit-command-line


bindkey -M viins "^[[3~" vi-delete-char
bindkey -M vicmd "^[[3~" vi-delete-char

bindkey -M viins "^?" backward-delete-char
bindkey -M viins "^W" backward-kill-word
bindkey -M viins "^[[1;9D" vi-backward-word
bindkey -M viins "^[[1;9C" vi-forward-word

bindkey -M vicmd "#" vi-pound-insert
bindkey -M vicmd "^M" reset-keymap-and-accept-line
bindkey -M vicmd "^X" incarg
bindkey -M vicmd "\-" neg-argument

# Search
bindkey -M viins "[A" up-line-or-search
bindkey -M viins "[B" down-line-or-search

bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward

bindkey -M isearch "^M" accept-search
bindkey -M isearch "" vi-cmd-mode
bindkey -M isearch "[A" history-incremental-pattern-search-backward
bindkey -M isearch "[B" history-incremental-pattern-search-forward
bindkey -M isearch "^?" vi-backward-kill-word
