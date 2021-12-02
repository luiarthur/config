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

install-tmux3.0a-appimage:
	wget https://github.com/tmux/tmux/releases/download/3.0a/tmux-3.0a-x86_64.AppImage
	mkdir -p ~/bin
	mv tmux-3.0a-x86_64.AppImage ~/bin
	chmod +x ~/bin/tmux-3.0a-x86_64.AppImage
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
