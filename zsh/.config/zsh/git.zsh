function g() {
    if [[ "$#" -eq 0 ]]; then
        git status
    else
        git "$@"
    fi
}
compdef g=git

function git-main() {
    local name
    if name=$(git rev-parse --abbrev-ref origin/HEAD 2>/dev/null); then
        cut -c 8- <<< "$name"
    else
        git config --get init.defaultBranch || echo master
    fi
}

alias gsh='git show'
alias glg='git log'
alias glgp='git log --patch'

alias gst='git status'
alias gd='git diff'
alias gds='git diff --staged'

alias ga='git add'
alias gau='git add --update'
alias gc='git commit'
alias grb='git rebase'

alias gr='git remote'
alias gp='git push'
alias gl='git pull'
alias glum='git pull upstream $(git-main)'

alias gb='git branch'
alias gco='git checkout'
alias grh='git reset'

alias gsts='git stash show --text'
alias gstp='git stash pop'
alias gstl='git stash list'
alias gstd='git stash drop'
