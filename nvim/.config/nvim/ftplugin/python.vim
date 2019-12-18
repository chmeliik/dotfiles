" ~/.config/nvim/ftplugin/python.vim

" python-syntax {{{
let g:python_highlight_all = 1
" }}}

" Empty buffer {{{
if !nextnonblank(1)
    let s:shebang = '#!/usr/bin/env python3'
    call append(0, s:shebang)
endif
" }}}
