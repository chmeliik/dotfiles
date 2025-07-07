autoload -U add-zsh-hook

_get_confirmation () {
    local file=$1
    local prefix=$2

    while true; do
        # print same-line prompt and output newline character if necessary
        echo -n "$prefix: found '$file' file. Source it? ([N]o/[y]es/[v]iew) "
        read -k 1 confirmation
        [[ "$confirmation" = $'\n' ]] || echo

        case "${confirmation:-N}" in
            [vV])   bat --paging=always "$file" ;;
            [yY])   return 0 ;;
            *)      return 1 ;;
        esac
    done
}

_activate_venv() {
    if [[ $(dirname "${VIRTUAL_ENV:-}") == "$PWD" ]]; then
         # already active
         return
    fi

    _activate_venv_at_path "venv"
    _activate_venv_at_path ".venv"
}

_activate_venv_at_path () {
    local venv=$1
    if [[ -f "$venv/bin/activate" ]] && _get_confirmation "$venv/bin/activate" "venv"; then
        source "$venv/bin/activate"
    fi
}

_dotenv () {
    if [[ -f .env ]] && _get_confirmation .env "dotenv"; then
        # test .env syntax
        zsh -fn .env || {
            echo "dotenv: error when sourcing '.env' file" >&2
            return 1
        }

        setopt localoptions allexport
        source .env
    fi
}

add-zsh-hook chpwd _activate_venv
