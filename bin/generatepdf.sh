cd res
cp -f ../svg/cartes_superposees.svg .
inkscape carte_transparent.svg carte_feuille.svg cartes_superposees.svg --export-area-page --batch-process -d 600 --export-type=pdf
mv cartes_superposees.pdf cartes_superposees_$1.pdf
mv carte_transparent.pdf carte_transparent_$1.pdf
mv carte_feuille.pdf carte_feuille_$1.pdf
pdftk cartes_superposees_$1.pdf carte_transparent_$1.pdf carte_feuille_$1.pdf cat output cartes_$1.pdf
cd ..
