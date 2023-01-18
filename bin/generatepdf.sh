cd res
cp -f ../svg/cartes_superposees.svg .
inkscape carte_transparent.svg carte_feuille.svg cartes_superposees.svg --export-area-page --batch-process -d 600 --export-type=pdf
mv cartes_superposees.pdf $1_$2_cartes_superposees.pdf
mv carte_transparent.pdf $1_$2_carte_transparent.pdf
mv carte_feuille.pdf $1_$2_carte_feuille.pdf
pdftk $1_$2_cartes_superposees.pdf $1_$2_carte_transparent.pdf $1_$2_carte_feuille.pdf cat output $1_$2_cartes.pdf
cd ..
