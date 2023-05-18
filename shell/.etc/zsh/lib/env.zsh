#
# Development Environments
#

# Golang
if (( $+commands[go] )); then
  typeset -gxUT GOPATH gopath

  gopath=(
    $XDG_DATA_HOME/go
  )

  path=(
    ${^gopath}/bin
    $path
  )
fi


# Rust
if [[ -x "$HOME/.cargo/bin/cargo" ]]; then
  path=(
    $HOME/.cargo/bin
    $path
  )
fi


#
# Directory
#

setopt auto_cd          # `cd' into directory if command can't be executed
setopt auto_pushd       # Make `cd' push the old directory onto the dir stack
setopt pushd_silent     # Do not print the dir stack after `pushd` or `popd`
setopt pushd_to_home    # Have pushd with no arguments act like `pushd $HOME'
setopt cdable_vars      # Change directory to a path stored in a variable

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index


# Bookmarks
if [[ -d "$HOME/Documents/" ]] { hash -d -- {doc,docs}=$HOME/Documents }
if [[ -d "$HOME/Documents/dev" ]] { hash -d -- dev=$HOME/Documents/dev }
