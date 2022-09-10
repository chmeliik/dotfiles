SHELL := /bin/bash
CONFIG_DIRS := wezterm zsh starship nvim bat ranger ghc kitty git
DISTRO := fedora

### Main

.PHONY: main
main: configs scripts submodules

.PHONY: all
all: main dotfile-watcher nerdfonts

.PHONY: configs
configs: templates
	stow $(CONFIG_DIRS) --ignore='\.j2'

.PHONY: scripts
scripts:
	stow bin

.PHONY: submodules
submodules:
	git submodule init
	git submodule update

### Situational

.PHONY: package-list
package-list: packages/$(DISTRO).sed
	@cd packages && sed packages.txt -f uncomment.sed -f $(DISTRO).sed

.PHONY: update-submodules
update-submodules:
	git submodule update --remote

.PHONY: dotfile-watcher
dotfile-watcher: scripts templates
	stow dotfile-watcher
	systemctl --user enable dotfile-watcher.path --now

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
templates: .env
	fd --hidden -e j2 -x bash -c 'jinja2 --format=env --strict {} .env -o {.} && echo {.}'

.env:
	@fd . envs -t f \
	| fzf \
		--preview='bat -p --color=always {}' \
		--height=20 \
		--prompt='choose environment> ' \
	| xargs -I{} ln -sf {} .env
