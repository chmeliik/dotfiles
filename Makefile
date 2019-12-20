.PHONY: all
all: nvim submodules

.PHONY: nvim
nvim:
	stow nvim

.PHONY: submodules
submodules:
	git submodule init
	git submodule update

.PHONY: update-submodules
update-submodules:
	git submodule foreach git pull
