SHELL := /bin/bash
CONFIG_DIRS := wezterm zsh starship nvim bat ranger ghc kitty git ruff mime

### Main

.PHONY: main
main: configs scripts zsh-plugins vim-plugins

.PHONY: all
all: main dotfile-watcher nerdfonts gnome-hacks

.PHONY: configs
configs: templates
	stow $(CONFIG_DIRS) --ignore='\.template'

.PHONY: scripts
scripts:
	mkdir -p ~/.local/bin
	# symlink instead of alias, so that you can do stuff like fd <pattern> -X vim
	ln -sf $(shell command -v nvim) ~/.local/bin/vim
	stow bin

.PHONY: zsh-plugins
zsh-plugins:
	git submodule init -- zsh/
	git submodule update -- zsh/

.PHONY: vim-plugins
vim-plugins:
	git submodule init -- nvim/
	git submodule update -- nvim/
	nvim --headless -c 'PackerInstall' -c 'autocmd User PackerComplete quitall' 

### Updating

.PHONY: update
update: update-zsh-plugins update-vim-plugins

.PHONY: update-zsh-plugins
update-zsh-plugins:
	git submodule update --remote -- zsh/

.PHONY: update-vim-plugins
update-vim-plugins:
	nvim -c 'PackerSync' -c 'autocmd WinClosed * quitall' 

### Situational

.PHONY: package-list
.ONESHELL:
package-list:
	@set -o errexit -o nounset -o pipefail
	@source /etc/os-release || :
	@distro=$${ID:-unknown}
	@echo "Distro detection: $$distro" >&2
	@if [[ ! -e "packages/$$distro.sed" ]]; then \
		echo 'Warning: unknown distro, will try anyway' >&2 && \
		cd packages && sed packages.txt -f uncomment.sed; \
	else \
		cd packages && sed packages.txt -f uncomment.sed -f "$$distro.sed"; \
	fi

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

.PHONY: gnome-hacks
gnome-hacks:
	mkdir -p ~/.local/bin
	# open *.desktop terminal apps in kitty
	ln -sf $(shell command -v kitty) ~/.local/bin/gnome-terminal

### Templating

.PHONY: templates
templates: .env
	source .env && fd --hidden -e template -x bin/.local/bin/render-env.sh {}

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
