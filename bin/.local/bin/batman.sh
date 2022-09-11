#!/bin/sh
# use bat for colored manpages, see https://github.com/sharkdp/bat#man
# and https://github.com/sharkdp/bat/issues/1145
col -bx < "${1:-/dev/stdin}" | bat -l man -p
