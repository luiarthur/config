all: build

build:
	latexmk -pdf

watch:
	latexmk -pdf -pvc

clean:
	latexmk -c

cleanall:
	latexmk -C
	rm -f *.snm *.nav *.bbl *.bib
