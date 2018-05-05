#!/bin/bash

file=$(basename "$1")
filename="${file%.*}"

pandoc -s "$filename.md" -o "$filename.tex"
comptex 

rm -f *.tex
rm -f *.out

# Clean up for converting to jekyll md
# sed -i 's/old-word/new-word/g' *.txt
#'<' => '\lt'
#'>' => '\gt'
#'_' => '\_'
