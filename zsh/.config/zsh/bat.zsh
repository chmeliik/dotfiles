alias cat='bat -p'  # plain, auto pager

function _batpreview() {
    local what=$1
    local file=$2

    if [[ "$what" == languages ]]; then
        local opt=--language
        local list_opt=--list-languages
    else
        local opt=--theme
        local list_opt=--list-themes
    fi

    file=$(printf "%q" "$file")
    preview="bat $opt {} -p --color=always --line-range :100 $file"
    bat "$list_opt" | cut -d : -f 1 | fzf --preview "$preview"
}

function batsyntax() {
    _batpreview "languages" "$1"
}

function battheme() {
    _batpreview "themes" "$1"
}

function bathelp() {
    if [[ "$1" == "--" ]]; then
        exec "$@" 2>&1 | bat -p -l help
    else
        exec "$@" --help 2>&1 | bat -p -l help
    fi
}
compdef bathelp=exec

export MANPAGER="batman.sh"
export MANROFFOPT="-c"
