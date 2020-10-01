.PHONY: all
all: nvim ranger submodules

.PHONY: nvim
nvim:
	stow nvim

.PHONY: ranger
ranger:
	stow ranger

.PHONY: submodules
submodules:
	git submodule init
	git submodule update

.PHONY: update-submodules
update-submodules:
	git submodule update --remote
