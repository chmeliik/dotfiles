setopt complete_in_word

# match files with leading dots
_comp_options+=(glob_dots)

# matching: first try basic matching, then bi-directional "smart-case"
#   (lowercase matches uppercase but not vice-versa)
zstyle ':completion:*' matcher-list \
    '' \
    'm:{[:lower:]}={[:upper:]}' '+l:|=* r:|=*'

zstyle ':completion:*:*:*:*:*' menu select
