export HISTFILE="$ZDOTDIR/.zsh_history"
export HISTSIZE=1000000  # 1 million
export SAVEHIST=$HISTSIZE

setopt extended_history         # record timestamps and execution time
setopt inc_append_history_time  # incrementally append with correct execution time
setopt hist_ignore_all_dups     # ignore all duplicates
setopt hist_ignore_space        # don't save commands prefixed with whitespace
setopt hist_verify              # show command before executing it
