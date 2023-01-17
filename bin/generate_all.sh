#!/bin/bash
i=0
sed 1d $1 | while IFS=';' read -r nom couleur_feuille couleur_transparent ligne1 ligne2 ligne3 ligne4
do
   bash bin/generate.sh "$i" "$nom" "$couleur_feuille" "$couleur_transparent" "$ligne1" "$ligne2" "$ligne3" "$ligne4"
   ((i++))
done

