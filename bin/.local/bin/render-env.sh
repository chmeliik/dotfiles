#!/bin/bash
set -o errexit -o nounset -o pipefail

usage() {
    cat << EOF
usage: $(basename "$0") template_file [output_file]

Substitute environment variables in template_file, write to output_file.
By default, output_file = template_file without the file extension.
EOF
}

template_file=${1:-''}
output_file=${2:-${template_file%.*}}

if [[ -z "$template_file" ]]; then
    usage >&2
    exit 1
fi

echo "$template_file -> $output_file"

if [[ -z "$output_file" ]]; then
    echo "could not determine output filename!" >&2
    exit 1
elif [[ "$template_file" == "$output_file" ]]; then
    echo "refusing to overwrite $output_file!" >&2
    exit 1
fi

content=$(envsubst < "$template_file")
cat > "$output_file" <<< "$content"
