cd res
inkscape carte*_*.svg --export-area-page --batch-process -d 600 --export-type=pdf
pdftk carte1_*.pdf cat output cartes1.pdf
pdftk carte2_*.pdf cat output cartes2.pdf
cd ..