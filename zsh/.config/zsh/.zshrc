autoload -U compinit; compinit  # completion system
autoload -U colors; colors      # convenient color variables

setopt complete_in_word  # allow tab completion in the middle of a word
setopt no_beep

path=("$HOME/.local/bin" $path)

source "$ZDOTDIR/history.zsh"
source "$ZDOTDIR/keymap.zsh"
source "$ZDOTDIR/git.zsh"

source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

eval "$(starship init zsh)"
