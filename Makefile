STOW_PACKAGES := wezterm zsh starship bin nvim bat ranger ghc kitty
DISTRO := fedora

.PHONY: all
all: stow submodules

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
