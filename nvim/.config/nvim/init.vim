" ~/.config/nvim/init.vim

" Lines {{{
set number          " show line numbers
set relativenumber  " line numbers are relative to current line
set cursorline      " highlight line with cursor
" }}}

" Indentation {{{
set shiftwidth=4        " number of spaces used for auto-indent
set softtabstop=-1      " <Tab> inserts $shiftwidth spaces
set expandtab           " convert tabs to spaces

set list                " show characters used for indentation
" }}}

" Theming {{{
set termguicolors   " truecolor support
set noshowmode      " lightline does that for us

source ~/.config/nvim/lightline.vim
source ~/.config/nvim/themes/material.vim
" }}}
