all: build

build:
	latexmk -pdf -xelatex

watch:
	latexmk -pdf -pvc -xelatex

clean:
	latexmk -c

cleanall:
	latexmk -C
	rm -f *.snm *.nav *.bbl fake.bib *.log
