bindkey -v  # vim mode
export KEYTIMEOUT=1  # switch modes without delay

# --- change cursor based on mode ----------------------------------------------
function _set_block_cursor() { printf '\e[2 q' }
function _set_beam_cursor() { printf '\e[6 q' }

function zle-keymap-select() {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
        _set_block_cursor
    else
        _set_beam_cursor
    fi
}

zle -N zle-keymap-select

precmd_functions+=(_set_beam_cursor)
# ------------------------------------------------------------------------------

# --- setup terminfo key map ---------------------------------------------------
typeset -A key
key=(
    [Home]=${terminfo[khome]}
    [End]=${terminfo[kend]}
    [Insert]=${terminfo[kich1]}
    [Delete]=${terminfo[kdch1]}
    [Backspace]=${terminfo[kbs]}
    [Up]=${terminfo[kcuu1]}
    [Down]=${terminfo[kcud1]}
    [Left]=${terminfo[kcub1]}
    [Right]=${terminfo[kcuf1]}
    [PageUp]=${terminfo[kpp]}
    [PageDown]=${terminfo[knp]}
    [Shift-Tab]=${terminfo[kcbt]}
    [Ctrl-Delete]=${terminfo[kDC5]}
    [Ctrl-Left]=${terminfo[kLFT5]}
    [Ctrl-Right]=${terminfo[kRIT5]}
)

# make sure the terminal is in application mode when zle is
# active, only then are the values from $terminfo valid
function zle-line-init () { echoti smkx }
function zle-line-finish () { echoti rmkx }
zle -N zle-line-init
zle -N zle-line-finish
# ------------------------------------------------------------------------------

# --- load modules -------------------------------------------------------------
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
# ------------------------------------------------------------------------------

bindkey "${key[Up]}"   up-line-or-beginning-search
bindkey "${key[Down]}" down-line-or-beginning-search
bindkey -M vicmd k     up-line-or-beginning-search
bindkey -M vicmd j     down-line-or-beginning-search

bindkey '^R' history-incremental-pattern-search-backward

bindkey "${key[Home]}" beginning-of-line
bindkey "${key[End]}"  end-of-line

bindkey "${key[Shift-Tab]}" reverse-menu-complete

bindkey "${key[Backspace]}"   backward-delete-char
bindkey "${key[Delete]}"      delete-char

bindkey "^W"                  backward-kill-word
bindkey "${key[Ctrl-Delete]}" kill-word

bindkey "${key[Ctrl-Left]}"  backward-word
bindkey "${key[Ctrl-Right]}" forward-word

bindkey ' ' magic-space
