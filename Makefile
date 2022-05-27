.PHONY: all
all: nvim ranger ghc submodules

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
