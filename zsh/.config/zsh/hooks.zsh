autoload -U add-zsh-hook

_activate_venv () {
    local dir=$PWD
    # look for ./venv/bin/activate in current and parent directories, until
    # we reach a directory not owned by the current user (or the root directory)
    while [[ -O "$dir" && "$dir" != '/' ]]; do
        if [[ -f "$dir/venv/bin/activate" ]]; then
            source "$dir/venv/bin/activate"
            break
        fi
        dir=$(realpath "$dir/..")
    done
}

add-zsh-hook chpwd _activate_venv
