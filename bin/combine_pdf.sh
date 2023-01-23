#!bin/sh
# installer psutils psnup permet de combiner plusieurs pages sur une page
pdftk A=$1 B=$2 cat A1west B1east output - | pdf2ps -dLanguageLevel=3 - - | psnup -2 -Pa5 -pa4 | ps2pdf -dCompatibility=1.4 - $3
