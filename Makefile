DISTRO := fedora

.PHONY: all
all: bin zsh starship nvim ranger ghc kitty wezterm submodules

.PHONY: bin
bin:
	stow bin

.PHONY: zsh
zsh:
	stow zsh

.PHONY: starship
starship:
	stow starship

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

.PHONY: wezterm
wezterm:
	stow wezterm

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
