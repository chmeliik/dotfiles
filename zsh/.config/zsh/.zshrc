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

# set up fzf bindings for Ctrl-T, Ctrl-R, Alt-C (if available)
# do this after keymap.zsh to override Ctrl-R
source "/usr/share/fzf/shell/key-bindings.zsh"
export FZF_CTRL_T_COMMAND='fd --hidden --no-ignore --exclude=.git'
export FZF_ALT_C_COMMAND='fd -t d --hidden --no-ignore --exclude=.git'

# note: fzf-tab must be sourced first, see https://github.com/Aloxaf/fzf-tab#install
source "$ZDOTDIR/plugins/fzf-tab/fzf-tab.plugin.zsh"
source "$ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"

eval "$(starship init zsh)"
