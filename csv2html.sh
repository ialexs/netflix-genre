#!/bin/bash

file='netflix-genre'

rm -rf $file.html

# vd https://visidata.org
vd $file.csv -b -o $file.html
sed 's/https:\/\/netflix.com\/browse\/genre\/.*[0-9]/<a href="&" target="_blank">&<\/a>/g' -i $file.html

cp $file.html index.html
