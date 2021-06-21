#!/bin/bash

file='netflix-genre'

rm -rf $file.html $file.md $file.pdf

# Visidata - https://visidata.org
vd $file.csv -b -o $file.html

sed 's/https:\/\/netflix.com\/browse\/genre\/.*[0-9]/<a href="&" target="_blank">&<\/a>/g' -i $file.html

# Prettier - https://prettier.io
prettier -w $file.html

# Pandoc - https://pandoc.org
pandoc -V urlcolor=blue -V geometry:a4paper,margin=1cm --pdf-engine=pdflatex $file.html -o $file.pdf

cp $file.html index.html
