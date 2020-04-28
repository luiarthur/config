.PHONY: osx win ubuntu linuxserver

all:
	@echo "Nothing to do. See make options."

linuxserver:
	cd setup/linux_server && ./setup && ./install

ubuntu:
	cd setup/ubuntu && ./setup && ./install

osx:
	cd setup/osx && ./setup && ./install

wsl:
	cd setup/wsl && ./setup.sh && ./install.sh
