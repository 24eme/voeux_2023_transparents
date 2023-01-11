#!/bin/bash
echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?>' > res/carte1.svg
echo '<svg width="210mm" height="148mm" viewBox="0 0 210 148" version="1.1" id="svg5" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">' >> res/carte1.svg
# prend le svg de la team (membres 24eme en n&b) supprime les passages à la ligne | les remets avant < | après > | supprime les indicateurs inkscape | supprime les sodipodi: | Supprime les lignes avec <?xml du svg team | supprime les <!-- | supprime les <svg etc.
# En gros ne garde que <defs <g et <path et leur contenu et le mets dans carte_bleu
tr -d '\n' < svg/team.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>'  | grep -i '[a-z]' >> res/carte1.svg
# idem avec mosaic_bleu (des formes bleues et transparentes) mais supprime defs (pk sinon on en a deux...) et l'ajoute dans carte_bleu
tr -d '\n' < svg/mosaic_bleu.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte1.svg
# Idem avec 24eme.svg (svg du logo 24eme)
tr -d '\n' < svg/24eme.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte1.svg
# Idem avec le text (message de la carte voeux)
tr -d '\n' < svg/text.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte1.svg

# Ferme le svg
echo '</svg>' >> res/carte1.svg
# Met les svg ajoutés et qui sont noir en bleu
sed -i 's/#000000/#0000ff/g' res/carte1.svg

# Change le bleu vers d'autres couleurs
sed 's/#0000ff/#03829A/g' res/carte1.svg > res/carte1_bleu.svg
sed 's/#0000ff/#69A300/g' res/carte1.svg > res/carte1_vert.svg
sed 's/#0000ff/#8F004B/g' res/carte1.svg > res/carte1_rouge.svg
sed 's/#0000ff/#FA7A00/g' res/carte1.svg > res/carte1_rose.svg

echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?>' > res/carte2.svg
echo '<svg width="210mm" height="148mm" viewBox="0 0 210 148" version="1.1" id="svg5" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">' >> res/carte2.svg
tr -d '\n' < svg/team.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>'  | grep -i '[a-z]' >> res/carte2.svg
tr -d '\n' < svg/mosaic_rouge.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte2.svg
tr -d '\n' < svg/24eme.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte2.svg
tr -d '\n' < svg/text.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte2.svg
echo '</svg>' >> res/carte2.svg
sed -i 's/#000000/#ff0000/g' res/carte2.svg

sed 's/#ff0000/#03829A/g' res/carte2.svg > res/carte2_bleu.svg
sed 's/#ff0000/#69A300/g' res/carte2.svg > res/carte2_vert.svg
sed 's/#ff0000/#8F004B/g' res/carte2.svg > res/carte2_rouge.svg
sed 's/#ff0000/#FA7A00/g' res/carte2.svg > res/carte2_rose.svg

rm res/carte1.svg res/carte2.svg

bash bin/generatepdf.sh
