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
