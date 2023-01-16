cd res
cp -f ../svg/cartes_superposees.svg .
inkscape carte_transparent.svg carte_feuille.svg cartes_superposees.svg --export-area-page --batch-process -d 600 --export-type=pdf
pdftk cartes_superposees.pdf carte_transparent.pdf carte_feuille.pdf cat output cartes.pdf
cd ..
