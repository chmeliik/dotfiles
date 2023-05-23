export path=("$HOME/.local/bin" $path)

# editor
export EDITOR="nvim"
export VISUAL="$EDITOR"

# run podman-docker as user
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"

# speed up Go module downloads
export GOPROXY="https://proxy.golang.org,direct"
