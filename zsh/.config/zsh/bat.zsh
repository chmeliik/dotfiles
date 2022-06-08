alias bat='bat -p'  # plain by default

# use bat for colored manpages, see https://github.com/sharkdp/bat#man
export MANPAGER="sh -c 'col -bx | bat -l man -p --theme default'"
export MANROFFOPT="-c"
