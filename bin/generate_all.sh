#!/bin/bash
# Utilisation : 
#   bash bin/generate_all.sh 'vert' 'rouge'
#   bash bin/generate_all.sh '#01496F' '#AF5F00'

# Opposition des couleurs qui vont bien (éclatent pas les yeux s'impriment bien) :
#   bleu clair / orange : '#03829A' '#FA7A00'
#   vert / violet : '#69A300' '#8F004B'
#   jaune / rose : '#FFDF0F' '#DF0D5B' (à améliorer jaune qui ressort mal à l'impression difficile de caler comme il faut)

couleur_feuille=$1
couleur_transparent=$2

if ! test "$couleur_transparent"; then
    echo $0 COULEUR_RGB_FEUILLE COULEUR_RGB_TRANSPARENT ;
    exit 1;
fi

# Le message sur 4 lignes
# POUR TEST : met les couleurs utilisées dans le texte
msg1=$(printf '%s\n' "Test couleur : $couleur_feuille $couleur_transparent" | sed -e 's/#//g')
msg2="Nous te souhaitons une très belle"
msg3="année pleine 2 joie d'amour et bien"
msg4="sûr de bonheur intense !!"

# Copie le text dans res pour y mettre msg1, msg2, ...
cp -f svg/text.svg res/text.svg
messages=( "$msg1" "$msg2" "$msg3" "$msg4" )
for i in "${!messages[@]}"
do
  sed -E -i "s#(id=\"message${i}\">)[^<]*(</tspan>)#\1${messages[$i]}\2#g" res/text.svg
  echo "$i" "${messages[$i]}"
done

echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?>' > res/carte_feuille.svg
echo '<svg width="210mm" height="148mm" viewBox="0 0 210 148" version="1.1" id="svg5" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">' >> res/carte_feuille.svg
# prend le svg de la team (membres 24eme en n&b) supprime les passages à la ligne | les remets avant < | après > | supprime les indicateurs inkscape | supprime les sodipodi: | Supprime les lignes avec <?xml du svg team | supprime les <!-- | supprime les <svg etc.
# En gros ne garde que <defs <g et <path et leur contenu et le mets dans carte_bleu
tr -d '\n' < svg/team.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>'  | grep -i '[a-z]' >> res/carte_feuille.svg
# idem avec mosaic_feuille (des formes bleues et transparentes) mais supprime defs (pk sinon on en a deux...) et l'ajoute dans carte_bleu
tr -d '\n' < svg/mosaic_feuille.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_feuille.svg
# Idem avec 24eme.svg (svg du logo 24eme)
tr -d '\n' < svg/24eme.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_feuille.svg
# Idem avec le text (message de la carte voeux)
tr -d '\n' < res/text.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_feuille.svg
# Ferme le svg
echo '</svg>' >> res/carte_feuille.svg


echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?>' > res/carte_transparent.svg
echo '<svg width="210mm" height="148mm" viewBox="0 0 210 148" version="1.1" id="svg5" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">' >> res/carte_transparent.svg
tr -d '\n' < svg/team.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>'  | grep -i '[a-z]' >> res/carte_transparent.svg
tr -d '\n' < svg/mosaic_transparent.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_transparent.svg
tr -d '\n' < svg/24eme.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_transparent.svg
tr -d '\n' < res/text.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_transparent.svg
echo '</svg>' >> res/carte_transparent.svg

if test "$couleur_feuille" = "bleu"; then
sed -i 's/#000000/#03829A/g' res/carte_feuille.svg
elif test "$couleur_feuille" = "orange"; then
sed -i 's/#000000/#FA7A00/g' res/carte_feuille.svg
elif test "$couleur_feuille" = "violet"; then
sed -i 's/#000000/#8F004B/g' res/carte_feuille.svg
elif test "$couleur_feuille" = "vert"; then
sed -i 's/#000000/#69A300/g' res/carte_feuille.svg
elif test "$couleur_feuille" = "rose"; then
sed -i 's/#000000/#DF0D5B/g' res/carte_feuille.svg
elif test "$couleur_feuille" = "jaune"; then
sed -i 's/#000000/#FFDF0F/g' res/carte_feuille.svg
else
sed -i 's/#000000/'$couleur_feuille'/g' res/carte_feuille.svg
fi

if test "$couleur_transparent" = "bleu"; then
sed -i 's/#000000/#03829A/g' res/carte_transparent.svg
elif test "$couleur_transparent" = "orange"; then
sed -i 's/#000000/#FA7A00/g' res/carte_transparent.svg
elif test "$couleur_transparent" = "violet"; then
sed -i 's/#000000/#8F004B/g' res/carte_transparent.svg
elif test "$couleur_transparent" = "vert"; then
sed -i 's/#000000/#69A300/g' res/carte_transparent.svg
elif test "$couleur_transparent" = "rose"; then
sed -i 's/#000000/#DF0D5B/g' res/carte_transparent.svg
elif test "$couleur_transparent" = "jaune"; then
sed -i 's/#000000/#FFDF0F/g' res/carte_transparent.svg
else
sed -i 's/#000000/'$couleur_transparent'/g' res/carte_transparent.svg
fi

# Couleur cibles repères
# sed -i 's/#d6c200/'"$couleur_feuille"'/g' res/carte_feuille.svg
# sed -i 's/#d6c200/'"$couleur_feuille"'/g' res/carte_transparent.svg

bash bin/generatepdf.sh
