#!/bin/bash

couleur_feuille=$1
couleur_transparent=$2

if ! test "$couleur_transparent"; then
    echo $0 COULEUR_RGB_FEUILLE COULEUR_RGB_TRANSPARENT ;
    exit 1;
fi

echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?>' > res/carte_feuille.svg
echo '<svg width="210mm" height="148mm" viewBox="0 0 210 148" version="1.1" id="svg5" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">' >> res/carte_feuille.svg
# prend le svg de la team (membres 24eme en n&b) supprime les passages à la ligne | les remets avant < | après > | supprime les indicateurs inkscape | supprime les sodipodi: | Supprime les lignes avec <?xml du svg team | supprime les <!-- | supprime les <svg etc.
# En gros ne garde que <defs <g et <path et leur contenu et le mets dans carte_bleu
tr -d '\n' < svg/team.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>'  | grep -i '[a-z]' >> res/carte_feuille.svg
# idem avec mosaic_bleu (des formes bleues et transparentes) mais supprime defs (pk sinon on en a deux...) et l'ajoute dans carte_bleu
tr -d '\n' < svg/mosaic_bleu.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_feuille.svg
# Idem avec 24eme.svg (svg du logo 24eme)
tr -d '\n' < svg/24eme.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_feuille.svg
# Idem avec le text (message de la carte voeux)
tr -d '\n' < svg/text.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_feuille.svg
# Ferme le svg
echo '</svg>' >> res/carte_feuille.svg
# Met les svg ajoutés et qui sont noir en bleu
sed -i 's/#000000/#0000ff/g' res/carte_feuille.svg


echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?>' > res/carte_transparent.svg
echo '<svg width="210mm" height="148mm" viewBox="0 0 210 148" version="1.1" id="svg5" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">' >> res/carte_transparent.svg
tr -d '\n' < svg/team.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>'  | grep -i '[a-z]' >> res/carte_transparent.svg
tr -d '\n' < svg/mosaic_rouge.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_transparent.svg
tr -d '\n' < svg/24eme.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_transparent.svg
tr -d '\n' < svg/text.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_transparent.svg
echo '</svg>' >> res/carte_transparent.svg
sed -i 's/#000000/#ff0000/g' res/carte_transparent.svg

if test "$couleur_feuille" = "bleu"; then
sed -i 's/#0000ff/#03829A/g' res/carte_feuille.svg
elif test "$couleur_feuille" = "vert"; then
sed -i 's/#0000ff/#69A300/g' res/carte_feuille.svg
elif test "$couleur_feuille" = "rouge"; then
sed -i 's/#0000ff/#8F004B/g' res/carte_feuille.svg
elif test "$couleur_feuille" = "rose"; then
sed -i 's/#0000ff/#FA7A00/g' res/carte_feuille.svg
else
sed -i 's/#0000ff/'$couleur_feuille'/g' res/carte_feuille.svg
fi

if test "$couleur_transparent" = "bleu"; then
sed -i 's/#ff0000/#03829A/g' res/carte_transparent.svg
elif test "$couleur_transparent" = "vert"; then
sed -i 's/#ff0000/#69A300/g' res/carte_transparent.svg
elif test "$couleur_transparent" = "rouge"; then
sed -i 's/#ff0000/#8F004B/g' res/carte_transparent.svg
elif test "$couleur_transparent" = "rose"; then
sed -i 's/#ff0000/#FA7A00/g' res/carte_transparent.svg
else
sed -i 's/#ff0000/'$couleur_transparent'/g' res/carte_transparent.svg
fi

bash bin/generatepdf.sh
