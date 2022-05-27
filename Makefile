DISTRO := fedora

.PHONY: all
all: nvim ranger ghc kitty submodules

.PHONY: nvim
nvim:
	stow nvim

.PHONY: ranger
ranger:
	stow ranger

.PHONY: ghc
ghc:
	stow ghc

.PHONY: kitty
kitty:
	stow kitty

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
