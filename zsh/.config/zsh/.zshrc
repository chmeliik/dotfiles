# --- miscellaneous ------------------------------------------------------------
autoload -U compinit; compinit  # completion system, needs to be called early
autoload -U colors; colors      # convenient color variables

setopt no_beep

export path=("$HOME/.local/bin" $path)

# run podman-docker as user
export DOCKER_HOST="unix:///$XDG_RUNTIME_DIR/podman/podman.sock"

export WORDCHARS='-_'  # treat only alnum and '-_' as word chars
# ------------------------------------------------------------------------------

# --- modular config -----------------------------------------------------------
source "$ZDOTDIR/history.zsh"
source "$ZDOTDIR/keymap.zsh"
source "$ZDOTDIR/git.zsh"
source "$ZDOTDIR/bat.zsh"
source "$ZDOTDIR/navigation.zsh"
source "$ZDOTDIR/completion.zsh"
source "$ZDOTDIR/p10k.zsh"
# ------------------------------------------------------------------------------

# --- fzf integration ----------------------------------------------------------
function maybe_source() { [[ -e "$1" ]] && source "$1" }

# set up fzf completion (triggered by **)
maybe_source "/usr/share/fzf/completion.zsh"
maybe_source "/usr/share/zsh/site-functions/fzf"

# set up fzf bindings for Ctrl-T, Ctrl-R, Alt-C
# do this after keymap.zsh to override Ctrl-R
maybe_source "/usr/share/fzf/key-bindings.zsh"
maybe_source "/usr/share/fzf/shell/key-bindings.zsh"
export FZF_CTRL_T_COMMAND='fd --hidden'
export FZF_ALT_C_COMMAND='fd -t d --hidden'
# ------------------------------------------------------------------------------

# --- plugins ------------------------------------------------------------------
PLUGINS="$ZDOTDIR/plugins"
source "$PLUGINS/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$PLUGINS/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "$PLUGINS/powerlevel10k/powerlevel10k.zsh-theme"
# ------------------------------------------------------------------------------
