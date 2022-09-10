#!/bin/bash
set -o errexit -o nounset -o pipefail

usage() {
cat << EOF
usage: $0 [dotfiles_dir]

Watch .j2 files and localenv.yaml for changes, regenerate output files automatically

dotfiles_dir: path to dotfiles repo, default \$HOME/dotfiles
EOF
}

if [[ ${1+is_set} != is_set ]]; then
    dotfiles_dir=$HOME/dotfiles
elif [[ "$1" =~ ^-h|--help$ ]]; then
    usage
    exit 0
else
    dotfiles_dir=$1
fi

echo "Running in $dotfiles_dir"

cd "$dotfiles_dir"

mapfile -t paths_to_watch < <(
    fd '.*' -e j2 --hidden
    fd 'localenv.yaml' --no-ignore
)

echo "Watching files:"
printf "  %s\n" "${paths_to_watch[@]}"
printf "%s\n" "${paths_to_watch[@]}" | entr -np make templates
