SHELL := /bin/bash

linux-server:
	cd src/os/linux-server && bash setup.sh && bash install.sh

osx:
	cd src/os/osx && bash setup.sh && bash install.sh

ubuntu:
	cd src/os/ubuntu && bash setup.sh && bash install.sh

wsl: ubuntu