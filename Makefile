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

.PHONY: packages.txt
packages.txt: packages/$(DISTRO).sed
	cd packages && sed packages.conf -f uncomment.sed -f $(DISTRO).sed > ../packages.txt

.PHONY: update-submodules
update-submodules:
	git submodule update --remote

.PHONY: dotfile-watcher
dotfile-watcher: scripts templates
	stow dotfile-watcher
	systemctl --user enable dotfile-watcher.service
	systemctl --user restart dotfile-watcher.service

.PHONY: nerdfonts
.ONESHELL:
nerdfonts:
	set -o errexit
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
templates: localenv.yaml
	fd --hidden -e j2 -x bash -c 'jinja2 --strict {} localenv.yaml -o {.} && echo {.}'

localenv.yaml:
	@fd . envs -t f \
	| fzf \
		--preview='bat -p --color=always {}' \
		--height=20 \
		--prompt='choose environment> ' \
	| xargs -I{} ln -sf {} localenv.yaml
