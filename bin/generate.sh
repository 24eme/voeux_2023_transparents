#!/bin/bash
# Utilisation :
#   bash bin/generate.sh 'Nom' 'bleu1' 'orange' 'Ligne1' 'Ligne2' 'Ligne3' 'Ligne4'
#   bash bin/generate.sh 'Nom' 'bleu1' 'orange' 'Ligne1' 'Ligne2' 'Ligne3' 'Ligne4'


# Opposition de couleurs prédéfinies qui vont bien (éclatent pas les yeux s'impriment bien) :
#   bleu1 / orange
#   vert1 / violet
#   vert2 / rose
#   rose2 / vert3

nom=$1
couleur_feuille=$2
couleur_transparent=$3
# Le message sur 4 lignes
# MAXIMUM 32 caractères par lignes
ligne1=$4
ligne2=$5
ligne3=$6
ligne4=$7

if ! test "$nom"; then
    echo $0 COULEUR_RGB_FEUILLE COULEUR_RGB_TRANSPARENT NOM;
    exit 1;
fi

# Couleurs prédéfinies
declare -A colors=( [bleu1]='#03829A' [orange]='#FA7A00' [vert1]='#69A300' [violet]='#8F004B' [vert2]='#00ff80'  [rose]='#ff007f' [rose2]='#ff80D8' [vert3]='#89DB7C' )

if [ ${colors[$couleur_feuille]+_} ]; then couleur_feuille=${colors[$couleur_feuille]}; fi
if [ ${colors[$couleur_transparent]+_} ]; then couleur_transparent=${colors[$couleur_transparent]}; fi

# Copie le text dans res pour y mettre ligne1, ligne2, ...
cp -f svg/text.svg res/text.svg
messages=( "$ligne1" "$ligne2" "$ligne3" "$ligne4" )
for i in "${!messages[@]}"
do
  sed -E -i "s#(id=\"message${i}\">)[^<]*(</tspan>)#\1${messages[$i]}\2#g" res/text.svg
  echo "$i" "${messages[$i]}"
done

# Copie le text cadre dans res pour y mettre nom prénom
cp -f svg/text_cadre.svg res/text_cadre_transparent.svg
sed -i "s/Nom/${nom}/g" res/text_cadre_transparent.svg

# Modifie la couleur du texte cadre en blanc pour la carte_feuille
cp -f res/text_cadre_transparent.svg res/text_cadre_feuille.svg
sed -i "s/#008000/#ffffff/g" res/text_cadre_feuille.svg

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
# Idem avec les reperes
tr -d '\n' < svg/reperes_feuille.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_feuille.svg
#Idem pour le "code"
tr -d '\n' < res/text_cadre_feuille.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_feuille.svg
# Ferme le svg
echo '</svg>' >> res/carte_feuille.svg

sed -i 's/#000000/'$couleur_feuille'/g' res/carte_feuille.svg

echo '<?xml version="1.0" encoding="UTF-8" standalone="no"?>' > res/carte_transparent.svg
echo '<svg width="210mm" height="148mm" viewBox="0 0 210 148" version="1.1" id="svg5" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">' >> res/carte_transparent.svg
tr -d '\n' < svg/team.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>'  | grep -i '[a-z]' >> res/carte_transparent.svg
tr -d '\n' < svg/mosaic_transparent.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_transparent.svg
tr -d '\n' < svg/24eme.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_transparent.svg
tr -d '\n' < res/text.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_transparent.svg
tr -d '\n' < svg/reperes_transparent.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_transparent.svg
tr -d '\n' < res/text_cadre_transparent.svg | sed 's/</\n</g' | sed 's/>/>\n/g' | sed 's/inkscape:[^= ]*="[^"]*" //g' | sed 's/sodipodi:[^= ]*="[^"]*" //g' | grep -v '<?xml' | grep -v '<!--' | grep -v '<svg' | grep -v '<sodipodi:namedview' | grep -v '</svg>' | grep -v '<defs' | grep -i '[a-z]' >> res/carte_transparent.svg
echo '</svg>' >> res/carte_transparent.svg

sed -i 's/#000000/'$couleur_transparent'/g' res/carte_transparent.svg

# Couleur cibles repères & code
sed -i 's/#d6c200/'"$couleur_feuille"'/g' res/carte_feuille.svg
sed -i 's/#d6c200/'"$couleur_feuille"'/g' res/carte_transparent.svg

sed -i 's/#008000/'"$couleur_feuille"'/g' res/carte_feuille.svg
sed -i 's/#008000/'"$couleur_feuille"'/g' res/carte_transparent.svg

bash bin/generatepdf.sh $nom
