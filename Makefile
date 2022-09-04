STOW_PACKAGES := wezterm zsh starship bin nvim bat ranger ghc kitty git
DISTRO := fedora

.PHONY: all
all: stow submodules nerdfonts

.PHONY: stow
stow:
	stow $(STOW_PACKAGES)

.PHONY: submodules
submodules:
	git submodule init
	git submodule update

.PHONY: update-submodules
update-submodules:
	git submodule update --remote

.PHONY: packages.txt
packages.txt: packages/$(DISTRO).sed
	cd packages && sed packages.conf -f uncomment.sed -f $(DISTRO).sed > ../packages.txt

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
