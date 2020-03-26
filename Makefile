# Target directory to install all the configuration to.
TARGET ?= ${HOME}

.DEFAULT: help

.PHONY: help
## Show help
help:
	@grep -B1 -E "^[a-zA-Z0-9_-]+\:" Makefile \
     | grep -v -- -- \
     | sed 'N;s/\n/###/' \
     | sed -n 's/^#: \(.*\)###\(.*\):.*/\2###\1/p' \
     | column -t  -s '###'

.PHONY: init-vundle
#: Init Vundle bundle
init-vundle:
	git submodule init
	git submodule update

.PHONY: dependencies
#: Install base dependencies
dependencies:
	sudo apt update
	sudo apt install \
		# Build utilities for third-party dependencies
	  build-essential cmake python-dev python3-dev \
		# Ack is used by vim-ack
		ack

.PHONY: add-vimrc
#: Symlink this repo .vimrc
add-vimrc:
	@echo Making $@…
	ln -s $$(pwd)/.vimrc $(TARGET)

.PHONY: add-vim-folder
#: Symlink this repo vim directory
add-vim-folder:
	@echo Making $@…
	ln -s $$(pwd)/.vim $(TARGET)

.PHONY: add-plugins
#: Add Vundle and initalize plugins
add-plugins: init-vundle add-vimrc add-vim-folder
	@echo Making $@…
	# Launch vim with the plugin install command and quit immediately
	vim -c "PluginInstall | q"

.PHONY: compile-youcompleteme-binaries
#: Compile YCM binaries for autocompletion
compile-youcompleteme-binaries: add-plugins
	@echo Making $@…
	cd .vim/bundle/YouCompleteMe && python3 ./install.py

.PHONY: compile-third-party-dependencies
#: Compile all third party dependencies used by Vim plugins
compile-third-party-dependencies: compile-youcompleteme-binaries
	@echo Making $@…

.PHONY: install
#: Install everything
install: \
	dependencies \
	add-vimrc \
	add-vim-folder \
	add-plugins \
	compile-third-party-dependencies
	@echo Making $@…
