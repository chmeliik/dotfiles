SHELL := /bin/bash
DISTRO := fedora
CONFIG_DIRS := wezterm zsh starship nvim bat ranger ghc kitty git

### Main

.PHONY: main
main: configs scripts submodules

.PHONY: all
all: main dotfile-watcher nerdfonts

.PHONY: configs
configs: templates
	stow $(CONFIG_DIRS) --ignore='\.template'

.PHONY: scripts
scripts:
	stow bin

.PHONY: submodules
submodules:
	git submodule init
	git submodule update

### Situational

.PHONY: package-list
package-list:
	@if [[ ! -e packages/$(DISTRO).sed ]]; then \
		echo 'Warning: unknown distro, will try anyway' >&2 && \
		cd packages && sed packages.txt -f uncomment.sed; \
	else \
		cd packages && sed packages.txt -f uncomment.sed -f $(DISTRO).sed; \
	fi

.PHONY: update-submodules
update-submodules:
	git submodule update --remote

.PHONY: nerdfonts
.ONESHELL:
nerdfonts:
	set -o errexit -o nounset -o pipefail
	git clone https://github.com/ryanoasis/nerd-fonts.git /tmp/nerd-fonts \
		--no-checkout --single-branch --depth 1 --filter blob:none
	trap 'rm -rf /tmp/nerd-fonts' EXIT
	cd /tmp/nerd-fonts
	git sparse-checkout init --cone
	git sparse-checkout set patched-fonts/JetBrainsMono
	git checkout
	./install.sh JetBrainsMono

### Templating

.PHONY: templates
templates: .env scripts
	source .env && fd --hidden -e template -x ~/.local/bin/render-env.sh {}

.PHONY: choose-env
choose-env:
	@fd . envs -t f \
	| fzf \
		--preview='bat -p --color always {} --line-range :50' \
		--height=20 \
		--prompt='choose environment> ' \
	| xargs -I{} ln -sf {} .env

.PHONY: dotfile-watcher
dotfile-watcher:
	stow dotfile-watcher
	systemctl --user enable dotfile-watcher.path --now
