#
# Terminal Title
#


#: helper functions

# Sets title before prompt is displayed
function set-title-precmd() {
  local -A title
  title=(
    window  '\e]2;%s\a'
    tab     '\e]1;%s\a'
  )

  local prefix suffix

  if [[ -z $TMUX ]]; then
    prefix=${(%):-"%(!.%n@%m.${SSH_TTY:+%n@%m})"}
  else
    prefix=${(%):-"%(!.%n@%m.)"}
  fi

  prefix=${prefix:+"$prefix "}
  suffix=${argv[1]:+" (${(V)argv[1]})"}

  printf $title[tab]    "${prefix}$(spwd)${suffix}"
  printf $title[window] "${prefix}$(spwd)${suffix}"
}

# Set title before command execution
function set-title-with-command() {
  emulate -L zsh
  setopt EXTENDED_GLOB

  # Get the command name that is under job control.
  if [[ "${2[(w)1]}" == (fg|%*)(\;|) ]]; then
    # Get the job name, and, if missing, set it to the default %+.
    local job_name="${${2[(wr)%*(\;|)]}:-%+}"

    # Make a local copy for use in the subshell.
    local -A jobtexts_from_parent_shell
    jobtexts_from_parent_shell=(${(kv)jobtexts})

    jobs "$job_name" 2>/dev/null > >(
      read index discarded
      # The index is already surrounded by brackets: [1].
      set-title-with-command "${(e):-\$jobtexts_from_parent_shell$index}"
    )
  else
    # Set the command name, or in the case of sudo or ssh, the next command.
    local cmd="${2[(wr)^(*=*|sudo|ssh|-*)]}"
    unset MATCH

    set-title-precmd "$cmd"
  fi
}


#: Command Hooks
autoload -Uz add-zsh-hook

add-zsh-hook precmd set-title-precmd
add-zsh-hook preexec set-title-with-command
