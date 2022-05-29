autoload -U compinit; compinit  # completion system
autoload -U colors; colors      # convenient color variables

setopt complete_in_word  # allow tab completion in the middle of a word
setopt no_beep

path=("$HOME/.local/bin" $path)

export WORDCHARS='-_'  # treat only alnum and '-_' as word chars

source "$ZDOTDIR/history.zsh"
source "$ZDOTDIR/keymap.zsh"
source "$ZDOTDIR/git.zsh"
source "$ZDOTDIR/navigation.zsh"

source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

eval "$(starship init zsh)"

[[ -f "/usr/share/fzf/shell/key-bindings.zsh" ]] && \
    # set up fzf bindings for Ctrl-T, Ctrl-R, Alt-C (if found)
    # do this after keymap.zsh to override Ctrl-R (the fzf version is superior)
    source "/usr/share/fzf/shell/key-bindings.zsh"
