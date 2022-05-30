autoload -U compinit; compinit  # completion system
autoload -U colors; colors      # convenient color variables

setopt no_beep

path=("$HOME/.local/bin" $path)

export WORDCHARS='-_'  # treat only alnum and '-_' as word chars

source "$ZDOTDIR/history.zsh"
source "$ZDOTDIR/keymap.zsh"
source "$ZDOTDIR/git.zsh"
source "$ZDOTDIR/navigation.zsh"
source "$ZDOTDIR/completion.zsh"

# use bat for colored manpages, see https://github.com/sharkdp/bat#man
export MANPAGER="sh -c 'col -bx | bat -l man -p --theme default'"
export MANROFFOPT="-c"

function maybe_source() { [[ -e "$1" ]] && source "$1" }

# set up fzf bindings for Ctrl-T, Ctrl-R, Alt-C (if available)
# do this after keymap.zsh to override Ctrl-R
maybe_source "/usr/share/fzf/shell/key-bindings.zsh"
maybe_source "/usr/share/fzf/key-bindings.zsh"
export FZF_CTRL_T_COMMAND='fd --hidden --no-ignore --exclude=.git'
export FZF_ALT_C_COMMAND='fd -t d --hidden --no-ignore --exclude=.git'

source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

eval "$(starship init zsh)"
