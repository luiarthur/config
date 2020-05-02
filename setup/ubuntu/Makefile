.PHONY: all install-fira-fonts

all:
	@echo "Type make <tab> to see options ..."

install-fira-fonts:
	mkdir -p tmp
	mkdir -p ./fonts/opentype/fira
	mkdir -p ./fonts/truetype/fira
	wget -O tmp/fira.tar.gz https://github.com/mozilla/Fira/archive/4.202.tar.gz
	cd tmp && tar -zxf fira.tar.gz
	cp tmp/fira/Fira-4.202/otf/* ~/.fonts/opentype/fira
	cp tmp/fira/Fira-4.202/ttf/* ~/.fonts/truetype/fira
	rm -rf tmp
