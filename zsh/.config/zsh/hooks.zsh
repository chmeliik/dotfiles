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

_dotenv () {
    if [[ ! -f .env ]]; then
        return
    fi

    while true; do
        # print same-line prompt and output newline character if necessary
        echo -n "dotenv: found '.env' file. Source it? ([N]o/[y]es/[v]iew) "
        read -k 1 confirmation
        [[ "$confirmation" = $'\n' ]] || echo

        case "${confirmation:-N}" in
            [vV])   bat --paging=always .env ;;
            [yY])   break ;;  # end the loop and source the file
            *)      return ;;  # exit without sourcing the file
        esac
    done

    # test .env syntax
    zsh -fn .env || {
        echo "dotenv: error when sourcing '.env' file" >&2
        return 1
    }

    setopt localoptions allexport
    source .env
}

add-zsh-hook chpwd _activate_venv
add-zsh-hook chpwd _dotenv
