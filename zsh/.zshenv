# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# editor
export EDITOR="nvim"
export VISUAL="$EDITOR"

# run podman-docker as user
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"

# speed up Go module downloads
export GOPROXY="https://proxy.golang.org,direct"

typeset -U path
export path=("$HOME/.local/bin" $path)
