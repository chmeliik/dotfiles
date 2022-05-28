setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus

alias -- '-'='cd -'
alias -- '1'='cd -1'
alias -- '2'='cd -2'
alias -- '3'='cd -3'
alias -- '4'='cd -4'
alias -- '5'='cd -5'
alias -- '6'='cd -6'
alias -- '7'='cd -7'
alias -- '8'='cd -8'
alias -- '9'='cd -9'

function d() {
    if [[ $# -gt 0 ]]; then
        dirs "$@"
    else
        dirs -v | sed 10q
    fi
}
compdef d=dirs

export FZF_CTRL_T_COMMAND='fd --hidden --no-ignore --exclude=.git'      # fuzzy insert
export FZF_ALT_C_COMMAND='fd -t d --hidden --no-ignore --exclude=.git'  # fuzzy cd
