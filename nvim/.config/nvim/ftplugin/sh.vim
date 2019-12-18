" ~/.config/nvim/ftplugin/sh.vim

" Empty buffer {{{
if !nextnonblank(1)
    let s:lines = ["#!/bin/sh", "set -euo pipefail"]
    call append(0, s:lines)
endif
" }}}
