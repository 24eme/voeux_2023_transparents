#!/bin/bash
sed 1d $1 | while IFS=';' read -r nom couleur_feuille couleur_transparent ligne1 ligne2 ligne3 ligne4
do
   bash bin/generate.sh "$nom" "$couleur_feuille" "$couleur_transparent" "$ligne1" "$ligne2" "$ligne3" "$ligne4"
done

