#!/bin/bash

file='netflix-genre'

rm -rf $file.html $file.md $file.pdf

# Visidata - https://visidata.org
vd $file.csv -b -o $file.html

sed 's/https:\/\/www.netflix.com\/browse\/genre\/.*[0-9]/<a href="&" target="_blank">&<\/a>/g' -i $file.html
sed 's/-genre<\/h2>/-genre (some might not available in your region) - <a href=\"'$file.pdf'\">PDF<\/a><\/h2>/g' -i $file.html

# Prettier - https://prettier.io
prettier -w $file.html

# Pandoc - https://pandoc.org
pandoc -V urlcolor=blue -V geometry:a4paper,landscape,margin=.5cm --pdf-engine=pdflatex $file.html -o $file.pdf

# cp $file.html index.html
