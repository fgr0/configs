#
# History
#

mkdir -p -m 750 "${XDG_DATA_HOME}/zsh"
HISTFILE="${XDG_DATA_HOME}/zsh/history"
HISTSIZE=10000
SAVEHIST=10000

setopt extended_history         # Write timestamps
setopt inc_append_history       # Write to the history file immediately
setopt share_history            # Share history between all sessions

setopt hist_ignore_dups         # Ignore duplicates of the previous event
setopt hist_verify              # Verify history expansions before executing
setopt hist_beep                # BOOP

alias history-stat="history 0 | awk '{print \$2}' | sort | uniq -c | sort -n -r | head"


#
# Setup history-based autosuggestions
#

source $ZDOTDIR/ext/zsh-autosuggestions/zsh-autosuggestions.zsh
