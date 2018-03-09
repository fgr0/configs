#
# Go
#

if (( ! $+commands[go] )); then
  return
fi

typeset -gxUT GOPATH gopath

gopath=(
  $HOME/.local/go
  $HOME/Documents/Development/go\ workspace
)

path+=(
  ${^gopath}/bin
)
