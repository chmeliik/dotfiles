setopt complete_in_word

# match files with leading dots
_comp_options+=(glob_dots)

# basic -> smart-case -> fuzzy smart-case
zstyle ':completion:*' matcher-list \
    '' \
    'm:{[:lower:]}={[:upper:]}' \
    'r:|?=** m:{[:lower:]}={[:upper:]}'

zstyle ':completion:*:*:*:*:*' menu select

zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh"

zstyle ':completion:*' rehash true  # automatically update PATH entries
