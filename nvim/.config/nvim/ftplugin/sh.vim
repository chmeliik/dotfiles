" ~/.config/nvim/ftplugin/sh.vim

" Empty buffer {{{
if !nextnonblank(1)
    let s:lines = ["#!/bin/bash", "set -o errexit -o nounset -o pipefail"]
    call append(0, s:lines)
endif
" }}}
